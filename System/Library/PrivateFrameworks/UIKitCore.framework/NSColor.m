@implementation NSColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (NSColor)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  int v5;
  NSCoder *v6;
  NSCoder *v7;
  char *v8;
  char *v9;
  char *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char *v15;
  char *v16;
  char *v17;
  UIColor *v18;
  UIColor *v19;
  NSColor *v20;
  size_t __n;
  uint64_t v23;
  double v24;
  double v25;
  size_t v26;
  float v27[100];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = coder;
  v5 = -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("NSColorSpace"));
  if ((v5 - 1) > 1)
  {
    if ((v5 - 3) > 1)
    {
      +[UIColor blackColor](UIColor, "blackColor");
      v19 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      *(double *)&v26 = 0.0;
      v24 = 0.0;
      v15 = -[NSCoder decodeBytesForKey:returnedLength:](objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("NSWhite"), &v26);
      v16 = copyBytesWithNullAtEnd((char *)v27, v15, v26);
      v17 = v16;
      v25 = 0.0;
      if (!v16 || *(double *)&v26 == 0.0 || sscanf_l(v16, 0, "%lf %lf", &v25, &v24) == 1)
        v24 = 1.0;
      if (v17 != (char *)v27 && v17)
        free(v17);
      v18 = [UIColor alloc];
      v19 = -[UIColor initWithWhite:alpha:](v18, "initWithWhite:alpha:", v25, v24);
    }
  }
  else
  {
    *(double *)&v23 = 0.0;
    v6 = v4;
    if (-[NSCoder allowsKeyedCoding](v6, "allowsKeyedCoding"))
    {
      __n = 0;
      v7 = objc_retainAutorelease(v6);
      v8 = -[NSCoder decodeBytesForKey:returnedLength:](v7, "decodeBytesForKey:returnedLength:", CFSTR("NSRGB"), &__n);

      v9 = copyBytesWithNullAtEnd((char *)v27, v8, __n);
      v10 = v9;
      v24 = 0.0;
      v25 = 0.0;
      *(double *)&v26 = 0.0;
      if (!v9 || !__n || sscanf_l(v9, 0, "%lf %lf %lf %lf", &v26, &v25, &v24, &v23) == 3)
        *(double *)&v23 = 1.0;
      if (v10 != (char *)v27 && v10)
        free(v10);
      v12 = v25;
      v11 = *(double *)&v26;
      v14 = *(double *)&v23;
      v13 = v24;
    }
    else
    {
      v27[0] = 0.0;
      LODWORD(v26) = 0;
      LODWORD(v25) = 0;
      LODWORD(v24) = 0;
      -[NSCoder decodeValuesOfObjCTypes:](v6, "decodeValuesOfObjCTypes:", "ffff", v27, &v26, &v25, &v24);

      v11 = v27[0];
      v12 = *(float *)&v26;
      v13 = *(float *)&v25;
      v14 = *(float *)&v24;
    }
    v19 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", v11, v12, v13, v14);
  }
  v20 = (NSColor *)v19;

  return v20;
}

+ (NSColor)colorWithCalibratedRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
  return (NSColor *)+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", red, green, blue, alpha);
}

+ (NSColor)colorWithCalibratedWhite:(CGFloat)white alpha:(CGFloat)alpha
{
  return (NSColor *)+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", white, alpha);
}

@end
