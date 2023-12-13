import os
import requests
import secrets


def gey_rate(base_currency, target_currency):
    # токен в секретиках лежит, не гляди сюда
    api_key = os.getenv(secrets.api_key)
    url = f"https://api.exchangerate-api.com/v4/latest/{base_currency}"

    params = {"api_key": api_key}

    response = requests.get(url, params=params)

    if response.status_code == 200:
        data = response.json()
        rate = data["rates"].get(target_currency)

        if rate is not None:
            return rate
        else:
            print(f"Курс для {target_currency} не найден.")
            return None
    else:
        print(f"Ошибочка: {response.status_code}")
        return None


def convert_currency(amount, rate):
    return amount * rate


if __name__ == "__main__":
    base_currency = os.getenv("BASE_CURRENCY")
    target_currency = os.getenv("TARGET_CURRENCY")
    amount = float(os.getenv("AMOUNT"))

    exchange_rate = gey_rate(base_currency, target_currency)

    if exchange_rate is not None:
        converted_amount = convert_currency(amount, exchange_rate)
        print(f"{amount} {base_currency} равно {converted_amount:.2f} {target_currency}")
