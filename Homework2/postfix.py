def eval_expr(s):
    stack = []
    tokens = s.split()

    for token in tokens:
        if token.isdigit() or (token[0] == '-' and token[1:].isdigit()):
            stack.append(int(token))
        
        elif token in {'+', '-', '*', '/'}:
            if len(stack) < 2:
                raise ValueError("Nespravny format vyrazu")
            b = stack.pop()
            a = stack.pop()
            if token == '+':
                stack.append(a + b)
            elif token == '-':
                stack.append(a - b)
            elif token == '*':
                stack.append(a * b)
            elif token == '/':
                if b == 0:
                    raise ZeroDivisionError("Delenie nulou")
                stack.append(a // b)
        else:
            raise ValueError(f"Neplatny token: {token}")

    if len(stack) != 1:
        raise ValueError("Nespravny format vyrazu")
    return stack[0]

