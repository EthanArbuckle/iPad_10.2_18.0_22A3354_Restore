@implementation CRRegisterLeast

- (int64_t)compare:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int64_t v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 0;
  }
  else if (v5)
  {
    if (v6)
      v8 = objc_msgSend(v6, "compare:", v5);
    else
      v8 = -1;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
