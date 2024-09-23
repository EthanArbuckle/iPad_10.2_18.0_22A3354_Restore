@implementation SXStrokeStyle

- (SXStrokeStyle)styleWithValue:(id)a3 withType:(int)a4
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("solid")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("dashed")) & 1) != 0)
  {
    v5 = 2;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("dotted")))
  {
    v5 = 3;
  }
  else
  {
    v5 = 1;
  }

  return (SXStrokeStyle *)v5;
}

@end
