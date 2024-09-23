@implementation _UILabelLightInertLayer

- (void)drawInContext:(CGContext *)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  -[_UILabelLightInertLayer superlayer](self, "superlayer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILabelLightInertLayer frame](self, "frame");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "_setDrawingLightInertLayer:", 1);
  CGContextSaveGState(a3);
  CGContextTranslateCTM(a3, -v7, -v9);
  objc_msgSend(v5, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "drawInContext:", a3);

  CGContextRestoreGState(a3);
  objc_msgSend(v5, "_setDrawingLightInertLayer:", 0);

}

@end
