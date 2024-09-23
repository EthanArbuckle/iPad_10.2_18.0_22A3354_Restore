@implementation _PXPeopleCandidateWidgetContainerView

- (void)setContainedView:(id)a3
{
  UIView *v5;
  UIView *containedView;
  _PXPeopleCandidateWidgetContainerView *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  containedView = self->_containedView;
  if (containedView != v5)
  {
    v8 = v5;
    -[UIView superview](containedView, "superview");
    v7 = (_PXPeopleCandidateWidgetContainerView *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
      -[UIView removeFromSuperview](self->_containedView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_containedView, a3);
    -[_PXPeopleCandidateWidgetContainerView addSubview:](self, "addSubview:", v8);
    v5 = v8;
  }

}

- (void)layoutSubviews
{
  objc_super v3;
  _QWORD v4[5];

  if (!-[_PXPeopleCandidateWidgetContainerView isDisappearing](self, "isDisappearing"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55___PXPeopleCandidateWidgetContainerView_layoutSubviews__block_invoke;
    v4[3] = &unk_1E5149198;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
  }
  v3.receiver = self;
  v3.super_class = (Class)_PXPeopleCandidateWidgetContainerView;
  -[_PXPeopleCandidateWidgetContainerView layoutSubviews](&v3, sel_layoutSubviews);
}

- (UIView)containedView
{
  return self->_containedView;
}

- (BOOL)isDisappearing
{
  return self->_isDisappearing;
}

- (void)setIsDisappearing:(BOOL)a3
{
  self->_isDisappearing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containedView, 0);
}

@end
