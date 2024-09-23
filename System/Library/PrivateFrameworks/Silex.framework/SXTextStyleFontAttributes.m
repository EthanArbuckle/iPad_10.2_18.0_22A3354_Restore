@implementation SXTextStyleFontAttributes

- (unint64_t)weightLabelWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  if (v5 && a4 == 3)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("bolder")) & 1) != 0)
    {
      v7 = 1;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("lighter")))
    {
      v7 = 2;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

@end
