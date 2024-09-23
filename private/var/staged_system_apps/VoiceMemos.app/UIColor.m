@implementation UIColor

- (id)semiTransparentRepresentation
{
  unsigned int v2;
  void *v3;
  double v5;
  double v6;
  double v7;
  double v8;

  v8 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v5 = 0.0;
  v2 = -[UIColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v8, &v7, &v6, &v5);
  v3 = 0;
  if (v2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v8, v7, v6, v5 * 0.5));
  return v3;
}

+ (id)color:(id)a3 byAddingColor:(id)a4
{
  id v5;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;

  v13 = 0.0;
  v14 = 0.0;
  v11 = 0;
  v12 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  v5 = a4;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v14, &v13, &v12, &v11);
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v10, &v9, &v8, &v7);

  return (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", (1.0 - v7) * v14 + v7 * v10, (1.0 - v7) * v13 + v7 * v9, (1.0 - v7) * v12 + v7 * v8, 1.0));
}

@end
