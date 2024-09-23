@implementation SXListStyle

- (SXListStyle)styleWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a3;
  v6 = v5;
  if (a4 != 3)
    goto LABEL_5;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("none")) & 1) != 0)
  {
    v7 = 1;
    goto LABEL_6;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("bullet")) & 1) != 0)
  {
LABEL_5:
    v7 = 2;
    goto LABEL_6;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("decimal")) & 1) != 0)
  {
    v7 = 3;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("lower_roman")) & 1) != 0)
  {
    v7 = 4;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("upper_roman")) & 1) != 0)
  {
    v7 = 5;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("lower_alphabetical")) & 1) != 0)
  {
    v7 = 6;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("upper_alphabetical")) & 1) != 0)
  {
    v7 = 7;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("character")))
  {
    v7 = 8;
  }
  else
  {
    v7 = 2;
  }
LABEL_6:

  return (SXListStyle *)v7;
}

@end
