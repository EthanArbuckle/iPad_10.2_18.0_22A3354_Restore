@implementation SXVideoComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double result;

  -[SXComponentSizer component](self, "component", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aspectRatio");
  v7 = v6;

  result = a3 / v7;
  if (v7 == 1.79769313e308)
    return 0.0;
  return result;
}

@end
