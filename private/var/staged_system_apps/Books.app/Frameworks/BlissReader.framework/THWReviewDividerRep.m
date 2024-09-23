@implementation THWReviewDividerRep

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)THWReviewDividerRep;
  -[THWReviewDividerRep dealloc](&v2, "dealloc");
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)didUpdateLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWReviewDividerRep;
  -[THWReviewDividerRep didUpdateLayer:](&v4, "didUpdateLayer:");
  objc_msgSend(a3, "setBackgroundColor:", objc_msgSend(objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "colorWithAlphaComponent:", 0.150000006), "CGColor"));
}

- (CGRect)layerFrameInScaledCanvas
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)THWReviewDividerRep;
  -[THWReviewDividerRep layerFrameInScaledCanvas](&v6, "layerFrameInScaledCanvas");
  if (v5 < 1.0)
    v5 = 1.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end
