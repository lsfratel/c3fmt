fn void test_literals()
{
	foreach (node : s.nodes)
	{
		if (var_name == "a")
		{
			test::eq(lit.kind, LiteralKind.NULL_LITERAL);
		}
		else if (var_name == "b")
		{
			test::eq(lit.kind, LiteralKind.BOOL_LITERAL);
			test::eq(lit.boolean, true);
		}
		else if (var_name == "c")
		{
			test::eq(lit.kind, LiteralKind.BOOL_LITERAL);
			test::eq(lit.boolean, false);
		} // Integers (Decimal, Hex, Binary, Octal)
		else if (var_name == "d")
		{
			test::eq(lit.kind, LiteralKind.INT_LITERAL);
			test::eq(lit.integer, 1000000);
		}
		else if (var_name == "e")
		{
			test::eq(lit.kind, LiteralKind.INT_LITERAL);
			test::eq(lit.integer, 0xFFAA); // 65450
		}
		else if (var_name == "f")
		{
			test::eq(lit.kind, LiteralKind.INT_LITERAL);
			test::eq(lit.integer, 0b10110101); // 181
		}
		else if (var_name == "g")
		{
			test::eq(lit.kind, LiteralKind.INT_LITERAL);
			test::eq(lit.integer, 0o755); // 493
		}
		else if (var_name == "h")
		{
			test::eq(lit.kind, LiteralKind.REAL_LITERAL);
			test::eq_approx(lit.real, 3.14159);
		}
		else if (var_name == "i")
		{
			test::eq(lit.kind, LiteralKind.REAL_LITERAL);
			test::eq_approx(lit.real, 2e+10);
		}
		else if (var_name == "j")
		{
			test::eq(lit.kind, LiteralKind.REAL_LITERAL);
			test::eq_approx(lit.real, 0.40625); // 0x1.Ap-2 is 1.625 * 0.25 = 0.40625
		}
		else if (var_name == "k")
		{
			test::eq(lit.kind, LiteralKind.STRING_LITERAL);
			test::eq(pool.get(lit.string)!!, "Hello");
		}
		else if (var_name == "l" || var_name == "lx")
		{
			test::eq(lit.kind, LiteralKind.STRING_LITERAL);
			test::eq(pool.get(lit.string)!!, "Raw string with structural text");
		}
		else if (var_name == "m")
		{
			test::eq(lit.kind, LiteralKind.BYTES_LITERAL);
			test::eq(lit.bytes.len, 12);
			// "Hello world!" in bytes
			test::eq((char)lit.bytes[0], 'H');
			test::eq((char)lit.bytes[11], '!');
		}
		else if (var_name == "n")
		{
			test::eq(lit.kind, LiteralKind.BYTES_LITERAL);
			test::eq(lit.bytes.len, 3);
			// "ABC"
			test::eq((char)lit.bytes[0], 'A');
			test::eq((char)lit.bytes[1], 'B');
			test::eq((char)lit.bytes[2], 'C');
		}
		else if (var_name == "o")
		{
			test::eq(lit.kind, LiteralKind.BYTES_LITERAL);
			test::eq(lit.bytes.len, 11);
			// "Hello World" decoded from Base64
			test::eq((char)lit.bytes[0], 'H');
			test::eq((char)lit.bytes[6], 'W');
		}
		else
		{
			unreachable("missing assertions for variable %s", var_name);
		}
	}
}