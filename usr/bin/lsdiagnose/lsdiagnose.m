uint64_t start(int a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;

  v4 = objc_autoreleasePoolPush();
  if (a1 < 2)
    v5 = 0;
  else
    v5 = *(_QWORD *)(a2 + 8);
  v6 = isatty(2) != 0;
  v7 = isatty(1) == 0;
  _LSDisplayData(__stdoutp, v5, 0, 0, 0, 0, v7 | (4 * v6), 0);
  objc_autoreleasePoolPop(v4);
  return 0;
}
