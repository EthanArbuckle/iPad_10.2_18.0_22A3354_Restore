@implementation SXRepeatableImageFill

- (unint64_t)repeatWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {
      v7 = 0;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("x")) & 1) != 0)
    {
      v7 = 1;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("y")))
    {
      v7 = 2;
    }
    else
    {
      v7 = 3;
    }
  }
  else
  {
    v7 = 3;
  }

  return v7;
}

@end
