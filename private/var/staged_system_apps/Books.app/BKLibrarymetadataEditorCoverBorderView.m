@implementation BKLibrarymetadataEditorCoverBorderView

- (void)drawRect:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  objc_msgSend(v4, "setStroke");

  -[BKLibrarymetadataEditorCoverBorderView bounds](self, "bounds");
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:"));
  v5 = mainScreenScaleFactor(v7);
  v6 = 1.0;
  if (v5 != 0.0)
    v6 = 1.0 / v5 + 1.0 / v5;
  objc_msgSend(v7, "setLineWidth:", v6);
  objc_msgSend(v7, "stroke");

}

@end
