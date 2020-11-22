
int tribonacci (int i)
{
    if (i == 0 || i == 1)
        return 0;
    if (i == 2)
        return 1;
    return tribonacci (i-3) + tribonacci (i-2) + tribonacci (i-1);
}

int main (void)
{
    return tribonacci (10);
}