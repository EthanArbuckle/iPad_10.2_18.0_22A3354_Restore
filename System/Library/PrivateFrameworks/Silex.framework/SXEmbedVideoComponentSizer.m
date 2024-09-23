@implementation SXEmbedVideoComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  void *v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;

  -[SXComponentSizer component](self, "component", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aspectRatio");
  v7 = v6;

  v8 = v7 == 0.0 || v7 == 1.79769313e308;
  v9 = 1.77777779;
  if (!v8)
    v9 = v7;
  return a3 / v9;
}

@end
