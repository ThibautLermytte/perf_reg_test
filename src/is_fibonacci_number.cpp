bool is_fibonacci_number_slow(int n) {
	for (int i = 0; i <= n; i++) {
		int previous{0}, current{1};

		while (current < n) {
			int next{previous + current};

			previous = current;
			current = next;
		}
		if (current == n)
			return true;
	}
	return false;
}

bool is_fibonacci_number_fast(int n)
{
    int previous = 0, current = 1;
    while (current < n)
    {
        int next = previous + current;
        previous = current;
        current = next;
    }
    return current == n;
}

