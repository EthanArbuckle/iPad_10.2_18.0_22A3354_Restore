@implementation CRLWPRepCaretAnimationConfigurator

+ (void)initialize
{
  id v3;
  void *v4;
  id v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  id v11;
  double v12;

  objc_opt_class(CRLWPRepCaretAnimationConfigurator, a2);
  if (v3 == a1)
  {
    if (*(double *)&qword_1013DC6D0 < -99999.0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", *(double *)&qword_1013DC6D0));
      v5 = objc_msgSend(v4, "integerForKey:", CFSTR("NSTextInsertionPointBlinkPeriod"));

      if (v5)
        v6 = (double)(uint64_t)v5 / 1000.0;
      else
        v6 = 0.56;
      qword_1013DC6D0 = *(_QWORD *)&v6;
    }
    if (*(double *)&qword_1013DC6D8 < -99999.0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", *(double *)&qword_1013DC6D8));
      v8 = objc_msgSend(v7, "integerForKey:", CFSTR("NSTextInsertionPointBlinkPeriodOn"));

      if (v8)
        v9 = (double)(uint64_t)v8 / 1000.0;
      else
        v9 = 0.5;
      qword_1013DC6D8 = *(_QWORD *)&v9;
    }
    if (*(double *)&qword_1013DC6E0 < -99999.0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", *(double *)&qword_1013DC6E0));
      v11 = objc_msgSend(v10, "integerForKey:", CFSTR("NSTextInsertionPointBlinkPeriodOff"));

      if (v11)
        v12 = (double)(uint64_t)v11 / 1000.0;
      else
        v12 = 0.5;
      qword_1013DC6E0 = *(_QWORD *)&v12;
    }
  }
}

+ (BOOL)caretShouldFade
{
  return 1;
}

+ (double)animationDurationForHide:(BOOL)a3
{
  double result;

  result = 0.15;
  if (a3)
    return 0.25;
  return result;
}

+ (double)animationCycleForHide:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v4;
  uint64_t *v5;

  v3 = a3;
  v4 = objc_msgSend(a1, "caretShouldFade");
  v5 = &qword_1013DC6E0;
  if (!v3)
    v5 = &qword_1013DC6D8;
  if (!v4)
    v5 = &qword_1013DC6D0;
  return *(double *)v5;
}

@end
