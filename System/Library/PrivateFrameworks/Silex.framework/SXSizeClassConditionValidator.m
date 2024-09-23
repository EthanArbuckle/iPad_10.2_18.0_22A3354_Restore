@implementation SXSizeClassConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  v9 = 0;
  if (!objc_msgSend(v5, "horizontalSizeClass")
    || (v7 = objc_msgSend(v5, "horizontalSizeClass"), v7 == objc_msgSend(v6, "horizontalSizeClass")))
  {
    if (!objc_msgSend(v5, "verticalSizeClass")
      || (v8 = objc_msgSend(v5, "verticalSizeClass"), v8 == objc_msgSend(v6, "verticalSizeClass")))
    {
      v9 = 1;
    }
  }

  return v9;
}

@end
