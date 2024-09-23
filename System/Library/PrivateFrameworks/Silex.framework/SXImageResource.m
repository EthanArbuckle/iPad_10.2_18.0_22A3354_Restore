@implementation SXImageResource

- (BOOL)wideColorSpace
{
  return 0;
}

- (double)heightForImageWidth:(double)a3
{
  double v4;
  double v5;
  double v6;

  -[SXImageResource dimensions](self, "dimensions");
  v6 = 0.0;
  if (v4 != *MEMORY[0x24BDBF148] || v5 != *(double *)(MEMORY[0x24BDBF148] + 8))
    return v5 * (a3 / v4);
  return v6;
}

- (double)widthForImageHeight:(double)a3
{
  double v4;
  double v5;
  double v6;

  -[SXImageResource dimensions](self, "dimensions");
  v6 = 0.0;
  if (v4 != *MEMORY[0x24BDBF148] || v5 != *(double *)(MEMORY[0x24BDBF148] + 8))
    return v4 * (a3 / v5);
  return v6;
}

- (CGSize)sizeThatFills:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = *MEMORY[0x24BDBF148];
  v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[SXImageResource dimensions](self, "dimensions");
  if (v9 != v6 || v8 != v7)
  {
    -[SXImageResource dimensions](self, "dimensions");
    v6 = v11 * (height / v12);
    if (v6 >= width)
    {
      v7 = height;
    }
    else
    {
      v7 = v12 * (width / v11);
      v6 = width;
    }
  }
  v13 = v6;
  v14 = v7;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = *MEMORY[0x24BDBF148];
  v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[SXImageResource dimensions](self, "dimensions");
  if (v9 != v6 || v8 != v7)
  {
    -[SXImageResource dimensions](self, "dimensions");
    v12 = width / v11;
    -[SXImageResource dimensions](self, "dimensions");
    if (v12 >= height / v13)
      v14 = height / v13;
    else
      v14 = v12;
    -[SXImageResource dimensions](self, "dimensions");
    *(float *)&v15 = v15 * v14;
    v6 = roundf(*(float *)&v15);
    -[SXImageResource dimensions](self, "dimensions");
    v17 = v16 * v14;
    v7 = roundf(v17);
  }
  v18 = v6;
  v19 = v7;
  result.height = v19;
  result.width = v18;
  return result;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  CGSize v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SXImageResource URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageResource dimensions](self, "dimensions");
  NSStringFromCGSize(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; URL: '%@' SIZE: '%@'>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

@end
