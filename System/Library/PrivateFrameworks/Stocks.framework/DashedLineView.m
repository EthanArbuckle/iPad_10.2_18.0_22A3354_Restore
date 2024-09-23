@implementation DashedLineView

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  double v6;
  __int128 v7;
  uint64_t v8;
  CGRect v9;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.819607843, 1.0, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setLineWidth:", RoundToPixel(0.5));
  v7 = xmmword_2173B6ED0;
  objc_msgSend(v5, "setLineDash:count:phase:", &v7, 2, 1.0);
  v6 = RoundToPixel(0.5) * 0.5;
  objc_msgSend(v5, "moveToPoint:", 0.0, v6);
  -[DashedLineView bounds](self, "bounds");
  objc_msgSend(v5, "addLineToPoint:", CGRectGetMaxX(v9), v6);
  objc_msgSend(v5, "stroke");

}

@end
