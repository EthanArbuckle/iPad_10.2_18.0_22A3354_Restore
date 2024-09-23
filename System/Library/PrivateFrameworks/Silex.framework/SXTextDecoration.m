@implementation SXTextDecoration

- (int)styleWithValue:(id)a3 withType:(int)a4
{
  id v4;
  int v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("solid")) & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("dashed")) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("dotted")))
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
