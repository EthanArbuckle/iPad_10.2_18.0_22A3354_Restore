@implementation UIScrollView(SUPPT)

- (uint64_t)_testingScrollStep
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a1, "contentOffset");
  v5 = v4;
  LODWORD(v6) = __TestingScrollYDelta;
  if (*(float *)&__TestingScrollYDelta > 0.0
    && (objc_msgSend(a1, "bounds", v6),
        v8 = v5 + v7 + *(float *)&__TestingScrollYDelta,
        objc_msgSend(a1, "contentSize"),
        LODWORD(v6) = __TestingScrollYDelta,
        v8 > v9)
    || *(float *)&v6 < 0.0 && v5 + *(float *)&v6 < 0.0)
  {
    *(float *)&v6 = -*(float *)&v6;
    __TestingScrollYDelta = LODWORD(v6);
    --__TestingScrollIterationsLeft;
  }
  objc_msgSend(a1, "setContentOffset:animated:", 0, 0.0, v5 + *(float *)&v6);
  if (__TestingScrollIterationsLeft)
    return objc_msgSend(a1, "performSelector:withObject:afterDelay:", a2, 0, 0.0);
  else
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endCurrentPPT");
}

- (uint64_t)scrollBy:()SUPPT forIterations:
{
  __TestingScrollYDelta = LODWORD(a4);
  __TestingScrollIterationsLeft = a3;
  return objc_msgSend(a1, "_testingScrollStep");
}

- (uint64_t)runScrollTest:()SUPPT withDelta:forIterations:
{
  void *v9;
  double v10;

  v9 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  objc_msgSend(v9, "beginPPTWithName:", a4);
  objc_msgSend(v9, "startedTest:", __CurrentTestName);
  *(float *)&v10 = a2;
  return objc_msgSend(a1, "scrollBy:forIterations:", a5, v10);
}

@end
