@implementation PUImportOneUpCellBadgeView

- (PUImportOneUpCellBadgeView)initWithFrame:(CGRect)a3
{
  PUImportOneUpCellBadgeView *v3;
  UIView *v4;
  UIView *badgeContainerView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUImportOneUpCellBadgeView;
  v3 = -[PUImportOneUpCellBadgeView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (initWithFrame__onceToken_36508 != -1)
      dispatch_once(&initWithFrame__onceToken_36508, &__block_literal_global_36509);
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    badgeContainerView = v3->_badgeContainerView;
    v3->_badgeContainerView = v4;

    -[PUImportOneUpCellBadgeView addSubview:](v3, "addSubview:", v3->_badgeContainerView);
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)&PUImportOneUpCellBadgeSize_0;
  v3 = *(double *)&PUImportOneUpCellBadgeSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.receiver = self;
  v23.super_class = (Class)PUImportOneUpCellBadgeView;
  -[PUImportOneUpCellBadgeView layoutSubviews](&v23, sel_layoutSubviews);
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[PUImportOneUpCellBadgeView bounds](self, "bounds");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  MidX = CGRectGetMidX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MidY = CGRectGetMidY(v25);
  -[PUImportOneUpCellBadgeView badgeView](self, "badgeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PUImportOneUpCellBadgeView badgeContainerView](self, "badgeContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    -[PUImportOneUpCellBadgeView badgeView](self, "badgeView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;

    -[PUImportOneUpCellBadgeView badgeContainerView](self, "badgeContainerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v12, v14, v17, v19);

  }
  -[PUImportOneUpCellBadgeView badgeContainerView](self, "badgeContainerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCenter:", MidX, MidY);

  -[PUImportOneUpCellBadgeView spinner](self, "spinner");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCenter:", MidX, MidY);

}

- (void)prepareForReuse
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpCellBadgeView;
  -[PUImportOneUpCellBadgeView prepareForReuse](&v4, sel_prepareForReuse);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PUImportOneUpCellBadgeView_prepareForReuse__block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  -[PUImportOneUpCellBadgeView performBadgeUpdates:](self, "performBadgeUpdates:", v3);
}

- (void)setBadgeType:(int64_t)a3
{
  if (!self->_inUpdateBlock)
    _PFAssertContinueHandler();
  self->_badgeType = a3;
  -[PUImportOneUpCellBadgeView setNeedsBadgeUpdate](self, "setNeedsBadgeUpdate");
}

- (void)setSelectable:(BOOL)a3
{
  if (!self->_inUpdateBlock)
    _PFAssertContinueHandler();
  self->_selectable = a3;
  -[PUImportOneUpCellBadgeView setNeedsBadgeUpdate](self, "setNeedsBadgeUpdate");
}

- (void)setNeedsBadgeUpdate
{
  -[PUImportOneUpCellBadgeView setNeedsBadgeUpdate:](self, "setNeedsBadgeUpdate:", 1);
}

- (void)updateBadgeUIIfNeeded
{
  int64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (-[PUImportOneUpCellBadgeView needsBadgeUpdate](self, "needsBadgeUpdate"))
  {
    -[PUImportOneUpCellBadgeView setNeedsBadgeUpdate:](self, "setNeedsBadgeUpdate:", 0);
    v3 = -[PUImportOneUpCellBadgeView badgeType](self, "badgeType");
    -[PUImportOneUpCellBadgeView badgeView](self, "badgeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[PUImportOneUpCellBadgeView setBadgeView:](self, "setBadgeView:", 0);
    -[PUImportOneUpCellBadgeView badgeType](self, "badgeType");
    -[PUImportOneUpCellBadgeView selectable](self, "selectable");
    PXImportBadgeViewForTypeAndSelectable();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PUImportOneUpCellBadgeView badgeContainerView](self, "badgeContainerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSubview:", v6);

      -[PUImportOneUpCellBadgeView setBadgeView:](self, "setBadgeView:", v6);
    }
    if (v3 == 2)
    {
      -[PUImportOneUpCellBadgeView _createSpinnerIfNecessary](self, "_createSpinnerIfNecessary");
      -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    }
    else
    {
      -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
    }
    -[PUImportOneUpCellBadgeView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)performBadgeUpdates:(id)a3
{
  if (a3)
  {
    self->_inUpdateBlock = 1;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_inUpdateBlock = 0;
    -[PUImportOneUpCellBadgeView updateBadgeUIIfNeeded](self, "updateBadgeUIIfNeeded");
  }
}

- (void)_createSpinnerIfNecessary
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *spinner;
  void *v5;

  if (!self->_spinner)
  {
    v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = self->_spinner;
    self->_spinner = v3;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", v5);

    -[PUImportOneUpCellBadgeView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_spinner, self->_badgeContainerView);
  }
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (BOOL)selectable
{
  return self->_selectable;
}

- (UIView)badgeContainerView
{
  return self->_badgeContainerView;
}

- (void)setBadgeContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeContainerView, a3);
}

- (UIView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (BOOL)inUpdateBlock
{
  return self->_inUpdateBlock;
}

- (void)setInUpdateBlock:(BOOL)a3
{
  self->_inUpdateBlock = a3;
}

- (BOOL)needsBadgeUpdate
{
  return self->_needsBadgeUpdate;
}

- (void)setNeedsBadgeUpdate:(BOOL)a3
{
  self->_needsBadgeUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_badgeContainerView, 0);
}

uint64_t __45__PUImportOneUpCellBadgeView_prepareForReuse__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBadgeType:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setSelectable:", 1);
}

void __44__PUImportOneUpCellBadgeView_initWithFrame___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  PXImportBadgeViewForTypeAndSelectable();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  PUImportOneUpCellBadgeSize_0 = v0;
  PUImportOneUpCellBadgeSize_1 = v1;

}

@end
