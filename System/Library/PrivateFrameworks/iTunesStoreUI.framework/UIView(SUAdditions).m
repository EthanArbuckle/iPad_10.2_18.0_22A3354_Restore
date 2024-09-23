@implementation UIView(SUAdditions)

- (uint64_t)centerSubviewInBounds:()SUAdditions
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  float v11;

  objc_msgSend(a1, "bounds");
  v5 = v4;
  v7 = v6;
  objc_msgSend(a3, "frame");
  v9 = (v5 - v8) * 0.5;
  v11 = (v7 - v10) * 0.5;
  objc_msgSend(a3, "setFrame:", floorf(v9), floorf(v11));
  return objc_msgSend(a3, "setAutoresizingMask:", 45);
}

- (uint64_t)superviewOfClass:()SUAdditions
{
  uint64_t v1;

  while (1)
  {
    v1 = objc_msgSend(a1, "superview");
    if (!v1 || (objc_opt_isKindOfClass() & 1) != 0)
      break;
    a1 = (void *)v1;
  }
  return v1;
}

@end
