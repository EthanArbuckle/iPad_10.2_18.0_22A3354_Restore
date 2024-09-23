@implementation UIColor(ProductTemplateAdditions)

- (id)blendWithColor:()ProductTemplateAdditions percentage:
{
  double v5;
  double v6;
  id v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v5 = fmax(a2, 0.0);
  if (v5 <= 1.0)
    v6 = v5;
  else
    v6 = 1.0;
  v16 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  v9 = 0.0;
  v7 = a4;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13);
  objc_msgSend(v7, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v6 * v12 + v16 * (1.0 - v6), v6 * v11 + v15 * (1.0 - v6), v6 * v10 + v14 * (1.0 - v6), v6 * v9 + v13 * (1.0 - v6));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
