module test_directives;

import std::io;

struct BadlyFormattedStruct
{
	int a;

	/* c3fmt off */
    int       b;
        int c;
	/* c3fmt on */

	int d;
}

fn void test_line_comments()
{
	int x = 1;

	// c3fmt off
    int    y   =     2;
    int z=3;
	if(another_scope) {
		int a= 1;
		// c3fmt on
		int w = 4;
	}


	int w = 4;
}

fn void test_eof_disable()
{
	int a = 1;

	// c3fmt off
    // The file ends without 'c3fmt on'
    int    b   =     2;
        int c =3;
}