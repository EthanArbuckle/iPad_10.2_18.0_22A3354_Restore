@implementation SXScalableImageComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageResourceForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "heightForImageWidth:", a3);
  v11 = v10;

  return v11;
}

@end
