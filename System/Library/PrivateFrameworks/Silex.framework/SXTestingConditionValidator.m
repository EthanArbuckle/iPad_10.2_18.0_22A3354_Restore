@implementation SXTestingConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5;
  uint64_t v6;
  int v7;

  v5 = a4;
  v6 = objc_msgSend(a3, "testing");
  if (v6 == 2)
  {
    v7 = objc_msgSend(v5, "testing") ^ 1;
  }
  else if (v6 == 1)
  {
    LOBYTE(v7) = objc_msgSend(v5, "testing");
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

@end
