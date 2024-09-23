@implementation _UILabelLightReactiveLayer

- (void)drawInContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[_UILabelLightReactiveLayer superlayer](self, "superlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superlayer");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILabelLightReactiveLayer frame](self, "frame");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "_setDrawingLightReactiveLayer:", 1);
  CGContextSaveGState(a3);
  CGContextTranslateCTM(a3, -v8, -v10);
  objc_msgSend(v6, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "drawInContext:", a3);

  CGContextRestoreGState(a3);
  objc_msgSend(v6, "_setDrawingLightReactiveLayer:", 0);

}

@end
