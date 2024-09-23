@implementation PXSelectionBadgeUIViewTile

- (PXSelectionBadgeUIViewTile)initWithFrame:(CGRect)a3
{
  PXSelectionBadgeUIViewTile *v3;
  PXSelectionBadgeUIViewTile *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSelectionBadgeUIViewTile;
  v3 = -[PXSelectionBadgeUIViewTile initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXSelectionBadgeUIViewTile setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[PXSelectionBadgeUIViewTile _invalidate](v4, "_invalidate");
  }
  return v4;
}

- (void)becomeReusable
{
  id v2;

  -[PXSelectionBadgeUIViewTile view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

}

- (void)prepareForReuse
{
  void *v3;

  -[PXSelectionBadgeUIViewTile view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[PXSelectionBadgeUIViewTile _invalidate](self, "_invalidate");
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  -[PXSelectionBadgeUIViewTile _setSelected:](self, "_setSelected:", objc_msgSend(a4, "isSelected", a3));
  -[PXSelectionBadgeUIViewTile _updateBadgeViewIfNeeded](self, "_updateBadgeViewIfNeeded");
}

- (void)_setSelected:(BOOL)a3
{
  if (self->__selected != a3)
  {
    self->__selected = a3;
    -[PXSelectionBadgeUIViewTile _invalidate](self, "_invalidate");
  }
}

- (void)_invalidate
{
  self->_needsUpdate = 1;
}

- (void)_updateBadgeViewIfNeeded
{
  if (self->_needsUpdate)
  {
    self->_needsUpdate = 0;
    if (-[PXSelectionBadgeUIViewTile _selected](self, "_selected"))
      -[PXSelectionBadgeUIViewTile _showSelectedView](self, "_showSelectedView");
    else
      -[PXSelectionBadgeUIViewTile _showUnselectedView](self, "_showUnselectedView");
  }
}

- (void)_showSelectedView
{
  UIView *unselectedView;
  UIView *selectedView;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *v8;
  void *v9;

  unselectedView = self->_unselectedView;
  if (unselectedView)
    -[UIView setHidden:](unselectedView, "setHidden:", 1);
  selectedView = self->_selectedView;
  if (!selectedView)
  {
    v5 = (void *)MEMORY[0x1E0DC3F10];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_circularGlyphViewWithName:prefersMulticolor:backgroundColor:", CFSTR("checkmark.circle"), 0, v6);
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();
    v8 = self->_selectedView;
    self->_selectedView = v7;

    -[PXSelectionBadgeUIViewTile view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_selectedView);

    selectedView = self->_selectedView;
  }
  -[UIView setHidden:](selectedView, "setHidden:", 0);
}

- (void)_showUnselectedView
{
  UIView *selectedView;
  UIView *unselectedView;
  UIView *v5;
  UIView *v6;
  void *v7;

  selectedView = self->_selectedView;
  if (selectedView)
    -[UIView setHidden:](selectedView, "setHidden:", 1);
  unselectedView = self->_unselectedView;
  if (!unselectedView)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "px_circularGlyphViewWithName:backgroundColor:", CFSTR("circle"), 0);
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_unselectedView;
    self->_unselectedView = v5;

    -[PXSelectionBadgeUIViewTile view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_unselectedView);

    unselectedView = self->_unselectedView;
  }
  -[UIView setHidden:](unselectedView, "setHidden:", 0);
}

- (BOOL)_selected
{
  return self->__selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unselectedView, 0);
  objc_storeStrong((id *)&self->_selectedView, 0);
}

+ (CGSize)preferredSize
{
  double v2;
  double v3;
  CGSize result;

  if (preferredSize_onceToken_181975 != -1)
    dispatch_once(&preferredSize_onceToken_181975, &__block_literal_global_181976);
  v2 = *(double *)&preferredSize_contentSize_0;
  v3 = *(double *)&preferredSize_contentSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __43__PXSelectionBadgeUIViewTile_preferredSize__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3F10], "px_circularGlyphViewWithName:backgroundColor:", CFSTR("circle"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  preferredSize_contentSize_0 = v0;
  preferredSize_contentSize_1 = v1;

}

@end
