@implementation UIColor(SUAdditions)

+ (id)colorWithStyleString:()SUAdditions
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStyleString:", a3);
}

- (uint64_t)initWithStyleString:()SUAdditions
{
  CGColorRef v4;
  CGColor *v5;
  uint64_t v6;

  v4 = SUCreateColorFromStyleString(a3);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(a1, "initWithCGColor:", v4);
    CGColorRelease(v5);
    return v6;
  }
  else
  {

    return 0;
  }
}

@end
