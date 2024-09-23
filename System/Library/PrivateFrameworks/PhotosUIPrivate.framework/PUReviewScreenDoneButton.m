@implementation PUReviewScreenDoneButton

+ (id)doneButton
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___PUReviewScreenDoneButton;
  objc_msgSendSuper2(&v5, sel_buttonWithType_, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

  objc_msgSend(v2, "set_needsUpdate:", 1);
  return v2;
}

- (void)layoutSubviews
{
  objc_super v3;

  -[PUReviewScreenDoneButton _updateIfNeeded](self, "_updateIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)PUReviewScreenDoneButton;
  -[PUReviewScreenDoneButton layoutSubviews](&v3, sel_layoutSubviews);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  -[PUReviewScreenDoneButton _updateIfNeeded](self, "_updateIfNeeded");
  v5.receiver = self;
  v5.super_class = (Class)PUReviewScreenDoneButton;
  -[PUReviewScreenDoneButton intrinsicContentSize](&v5, sel_intrinsicContentSize);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[PUReviewScreenDoneButton setContentEdgeInsets:](self, "setContentEdgeInsets:");
    -[PUReviewScreenDoneButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPreferredStyle:(unint64_t)a3
{
  if (self->_preferredStyle != a3)
  {
    self->_preferredStyle = a3;
    -[PUReviewScreenDoneButton set_needsUpdate:](self, "set_needsUpdate:", 1);
  }
}

- (void)_updateIfNeeded
{
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  PUReviewScreenDoneButton *v8;
  const __CFString *v9;
  void *v10;
  __CFString *v11;

  if (!-[PUReviewScreenDoneButton _needsUpdate](self, "_needsUpdate"))
    return;
  v3 = -[PUReviewScreenDoneButton preferredStyle](self, "preferredStyle");
  if (v3)
  {
    if (v3 != 1)
    {
      v5 = &stru_1E58AD278;
      goto LABEL_9;
    }
    v4 = CFSTR("PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_DONE_OR_ICON");
  }
  else
  {
    v4 = CFSTR("PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_DONE_OR_ICON_iPad");
  }
  PULocalizedString(v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v11 = v5;
  if (-[__CFString length](v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUReviewScreenDoneButton titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    -[PUReviewScreenDoneButton setImage:forState:](self, "setImage:forState:", 0, 0);
    v8 = self;
    v9 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUReviewScreenDoneButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUReviewScreenDoneButton setImage:forState:](self, "setImage:forState:", v10, 0);

    v9 = &stru_1E58AD278;
    v8 = self;
  }
  -[PUReviewScreenDoneButton setTitle:forState:](v8, "setTitle:forState:", v9, 0);
  -[PUReviewScreenDoneButton set_needsUpdate:](self, "set_needsUpdate:", 0);

}

- (unint64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_tappableEdgeInsets.top;
  left = self->_tappableEdgeInsets.left;
  bottom = self->_tappableEdgeInsets.bottom;
  right = self->_tappableEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)_needsUpdate
{
  return self->__needsUpdate;
}

- (void)set_needsUpdate:(BOOL)a3
{
  self->__needsUpdate = a3;
}

@end
