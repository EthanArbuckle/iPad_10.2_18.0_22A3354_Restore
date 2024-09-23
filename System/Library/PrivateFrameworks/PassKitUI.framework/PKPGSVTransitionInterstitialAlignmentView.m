@implementation PKPGSVTransitionInterstitialAlignmentView

- (PKPGSVTransitionInterstitialAlignmentView)init
{

  return 0;
}

- (PKPGSVTransitionInterstitialAlignmentView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKPGSVTransitionInterstitialAlignmentView)initWithView:(id)a3 alignmentRectInsetsAdjustmentProvider:(id)a4
{
  id v7;
  PKPGSVTransitionInterstitialAlignmentView *result;
  PKPGSVTransitionInterstitialAlignmentView *v9;
  PKPGSVTransitionInterstitialAlignmentView *v10;
  PKPGSVTransitionInterstitialAlignmentView *v11;
  void *v12;
  id provider;
  objc_super v19;

  v7 = a3;
  result = (PKPGSVTransitionInterstitialAlignmentView *)a4;
  if (v7 && (v9 = result) != 0)
  {
    v19.receiver = self;
    v19.super_class = (Class)PKPGSVTransitionInterstitialAlignmentView;
    v10 = -[PKPGSVTransitionInterstitialAlignmentView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_view, a3);
      v12 = _Block_copy(v9);
      provider = v11->_provider;
      v11->_provider = v12;

      __asm { FMOV            V0.2D, #0.5 }
      v11->_alignmentRectAnchorPoint = _Q0;
      -[PKPGSVTransitionInterstitialAlignmentView addSubview:](v11, "addSubview:", v11->_view);
      -[PKPGSVTransitionInterstitialAlignmentView sizeToFit](v11, "sizeToFit");
    }

    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_effectiveAlignmentInsets.top;
  left = self->_effectiveAlignmentInsets.left;
  bottom = self->_effectiveAlignmentInsets.bottom;
  right = self->_effectiveAlignmentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)sizeToFit
{
  UIEdgeInsets *p_alignmentInsets;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double right;
  CGFloat v15;
  UIEdgeInsets *p_effectiveAlignmentInsets;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  p_alignmentInsets = &self->_alignmentInsets;
  -[UIView alignmentRectInsets](self->_view, "alignmentRectInsets");
  p_alignmentInsets->top = v4;
  p_alignmentInsets->left = v5;
  p_alignmentInsets->bottom = v6;
  p_alignmentInsets->right = v7;
  v8 = (*((double (**)(void))self->_provider + 2))();
  self->_alignmentInsetAdjustments.top = v8;
  self->_alignmentInsetAdjustments.left = v9;
  self->_alignmentInsetAdjustments.bottom = v10;
  self->_alignmentInsetAdjustments.right = v11;
  v12 = p_alignmentInsets->top - v8;
  v13 = p_alignmentInsets->left - v9;
  right = p_alignmentInsets->right;
  v15 = p_alignmentInsets->bottom - v10;
  p_effectiveAlignmentInsets = &self->_effectiveAlignmentInsets;
  self->_effectiveAlignmentInsets.top = v12;
  self->_effectiveAlignmentInsets.left = v13;
  self->_effectiveAlignmentInsets.bottom = v15;
  self->_effectiveAlignmentInsets.right = right - v11;
  v21.receiver = self;
  v21.super_class = (Class)PKPGSVTransitionInterstitialAlignmentView;
  -[PKPGSVTransitionInterstitialAlignmentView sizeToFit](&v21, sel_sizeToFit);
  -[PKPGSVTransitionInterstitialAlignmentView bounds](self, "bounds");
  -[PKPGSVTransitionInterstitialAlignmentView setAnchorPoint:](self, "setAnchorPoint:", (v17+ p_effectiveAlignmentInsets->left+ self->_alignmentRectAnchorPoint.x * (v19 - (p_effectiveAlignmentInsets->left + p_effectiveAlignmentInsets->right))- v17)/ v19, (p_effectiveAlignmentInsets->top+ v18+ self->_alignmentRectAnchorPoint.y * (v20 - (p_effectiveAlignmentInsets->top + p_effectiveAlignmentInsets->bottom))- v18)/ v20);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[UIView bounds](self->_view, "bounds", a3.width, a3.height);
  v5 = fmax(v4 - (self->_alignmentInsetAdjustments.left + self->_alignmentInsetAdjustments.right), 0.0);
  v7 = fmax(v6 - (self->_alignmentInsetAdjustments.top + self->_alignmentInsetAdjustments.bottom), 0.0);
  result.height = v7;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPGSVTransitionInterstitialAlignmentView;
  -[PKPGSVTransitionInterstitialAlignmentView layoutSubviews](&v9, sel_layoutSubviews);
  -[PKPGSVTransitionInterstitialAlignmentView bounds](self, "bounds");
  -[UIView bounds](self->_view, "bounds");
  v4 = v3;
  v6 = v5;
  PKSizeAlignedInRect();
  -[UIView setFrame:](self->_view, "setFrame:", v7 - self->_effectiveAlignmentInsets.left - self->_alignmentInsets.left, v8 - self->_effectiveAlignmentInsets.top - self->_alignmentInsets.top, v4, v6);
}

- (UIView)view
{
  return self->_view;
}

- (CGPoint)alignmentRectAnchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_alignmentRectAnchorPoint.x;
  y = self->_alignmentRectAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAlignmentRectAnchorPoint:(CGPoint)a3
{
  self->_alignmentRectAnchorPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong(&self->_provider, 0);
}

@end
