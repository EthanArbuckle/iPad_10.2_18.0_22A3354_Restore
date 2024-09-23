@implementation _UISlidingPopoverLayoutInfo

- (_UISlidingPopoverLayoutInfo)init
{
  _UISlidingPopoverLayoutInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISlidingPopoverLayoutInfo;
  result = -[_UIPopoverLayoutInfo init](&v3, sel_init);
  if (result)
  {
    result->super._arrowHeight = 0.0;
    *(_OWORD *)&result->super._contentInset.bottom = 0u;
    *(_OWORD *)&result->super._contentInset.top = 0u;
  }
  return result;
}

- (CGSize)_popoverViewSizeForContentSize:(CGSize)a3 arrowDirection:(unint64_t)a4
{
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)_UISlidingPopoverLayoutInfo;
  -[_UIPopoverLayoutInfo _popoverViewSizeForContentSize:arrowDirection:](&v6, sel__popoverViewSizeForContentSize_arrowDirection_, 0, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_updateOutputs
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MidX;
  CGFloat MidY;
  double top;
  double left;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[_UIPopoverLayoutInfo _effectiveViewSourceRect](self, "_effectiveViewSourceRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UISlidingPopoverLayoutInfo _popoverViewSizeForContentSize:arrowDirection:](self, "_popoverViewSizeForContentSize:arrowDirection:", 0, self->super._preferredContentSize.width, self->super._preferredContentSize.height);
  v12 = v11;
  v14 = v13;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  MidX = CGRectGetMidX(v19);
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  MidY = CGRectGetMidY(v20);
  v22.origin.x = floor(MidX - (v12 - self->super._contentInset.left - self->super._contentInset.right) * 0.5);
  v22.origin.y = floor(MidY - (v14 - self->super._contentInset.top - self->super._contentInset.bottom) * 0.5);
  top = self->super._containingFrameInsets.top;
  left = self->super._containingFrameInsets.left;
  v21.origin.x = self->super._containingFrame.origin.x + left;
  v21.origin.y = self->super._containingFrame.origin.y + top;
  v21.size.width = self->super._containingFrame.size.width - (left + self->super._containingFrameInsets.right);
  v21.size.height = self->super._containingFrame.size.height - (top + self->super._containingFrameInsets.bottom);
  v22.size.width = v12;
  v22.size.height = v14;
  self->super._frame = CGRectIntersection(v21, v22);
}

@end
