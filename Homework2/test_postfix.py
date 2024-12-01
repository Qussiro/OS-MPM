from postfix import eval_expr

tests = [
    ("3 4 +", 7),             # 3 + 4 = 7
    ("10 5 /", 2),            # 10 / 5 = 2
    ("2 3 + 4 *", 20),        # (2 + 3) * 4 = 20
    ("5 1 2 + 4 * + 3 -", 14) # 5 + (1 + 2) * 4 - 3 = 14
]

all_tests_passed = True

for expr, expected in tests:
    result = eval_expr(expr)
    print(f"Vyraz: {expr}, Ocakavaný vysledok: {expected}, Vas vysledok: {result}")
    if result != expected:
        print(f"Test zlyhal pre '{expr}'")
        all_tests_passed = False

# Výpis len ak všetky testy prešli
if all_tests_passed:
    print("Vsetky testy presli!")
