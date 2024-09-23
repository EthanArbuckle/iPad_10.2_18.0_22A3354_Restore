@implementation TSWButton

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  TSWButton *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v24;
  CGRect v25;

  v5 = self;
  -[TSWButton bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[TSWButton hitRegionEdgeInsets](v5, "hitRegionEdgeInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  if ((-[TSWButton isHidden](v5, "isHidden") & 1) != 0
    || (v25.origin.x = v7 + v17,
        v25.origin.y = v9 + v15,
        v25.size.width = v11 - (v17 + v21),
        v25.size.height = v13 - (v15 + v19),
        !CGRectContainsPoint(v25, a3)))
  {
    v24.receiver = v5;
    v24.super_class = (Class)TSWButton;
    return -[TSWButton hitTest:withEvent:](&v24, "hitTest:withEvent:", a4, a3.x, a3.y);
  }
  return v5;
}

- (double)hitRegionInset
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWButton hitRegionInset]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/TSWButton.m"), 26, CFSTR("Use hitRegionEdgeInsets to retrieve this information"));
  return 0.0;
}

- (void)setHitRegionInset:(double)a3
{
  -[TSWButton setHitRegionEdgeInsets:](self, "setHitRegionEdgeInsets:", a3, a3, a3, a3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  +[CATransaction begin](CATransaction, "begin");
  v5.receiver = self;
  v5.super_class = (Class)TSWButton;
  -[TSWButton setHighlighted:](&v5, "setHighlighted:", v3);
  +[CATransaction commit](CATransaction, "commit");
}

- (UIEdgeInsets)hitRegionEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->mHitRegionEdgeInsets.top;
  left = self->mHitRegionEdgeInsets.left;
  bottom = self->mHitRegionEdgeInsets.bottom;
  right = self->mHitRegionEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitRegionEdgeInsets:(UIEdgeInsets)a3
{
  self->mHitRegionEdgeInsets = a3;
}

@end
