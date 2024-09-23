@implementation SXPreferredColorSchemeConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "preferredColorScheme") && objc_msgSend(v5, "preferredColorScheme") != 4)
  {
    v8 = objc_msgSend(v6, "userInterfaceStyle");
    if (v8)
    {
      v9 = 1;
      if (v8 == 2)
        v9 = 3;
      if (v8 == 1)
        v10 = 2;
      else
        v10 = v9;
      v7 = objc_msgSend(v5, "preferredColorScheme") == v10;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

@end
