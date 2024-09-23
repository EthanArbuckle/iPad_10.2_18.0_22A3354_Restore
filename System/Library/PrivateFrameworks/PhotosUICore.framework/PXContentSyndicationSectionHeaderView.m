@implementation PXContentSyndicationSectionHeaderView

- (PXContentSyndicationSectionHeaderView)initWithFrame:(CGRect)a3
{
  PXContentSyndicationSectionHeaderView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXContentSyndicationSectionHeaderView;
  v3 = -[PXContentSyndicationSectionHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentSyndicationSectionHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)setSocialLayerHighlight:(id)a3
{
  SLHighlight *v5;
  SLHighlight *v6;
  char v7;
  SLAttributionView *socialLayerAttributionView;
  SLAttributionView *v9;
  SLAttributionView *v10;
  void *v11;
  SLHighlight *v12;

  v12 = (SLHighlight *)a3;
  v5 = self->_socialLayerHighlight;
  if (v5 == v12)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[SLHighlight isEqual:](v5, "isEqual:", v12);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_socialLayerHighlight, a3);
      -[SLAttributionView removeFromSuperview](self->_socialLayerAttributionView, "removeFromSuperview");
      socialLayerAttributionView = self->_socialLayerAttributionView;
      self->_socialLayerAttributionView = 0;

      PXContentSyndicationAttributionViewForSocialLayerHighlight(self->_socialLayerHighlight, 1);
      v9 = (SLAttributionView *)objc_claimAutoreleasedReturnValue();
      v10 = self->_socialLayerAttributionView;
      self->_socialLayerAttributionView = v9;

      -[SLAttributionView setDelegate:](self->_socialLayerAttributionView, "setDelegate:", self);
      -[PXContentSyndicationSectionHeaderView traitCollection](self, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXContentSyndicationSectionHeaderView _updatePillAlignmentWithTraitCollection:](self, "_updatePillAlignmentWithTraitCollection:", v11);

      -[PXContentSyndicationSectionHeaderView addSubview:](self, "addSubview:", self->_socialLayerAttributionView);
      -[PXContentSyndicationSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setSpec:(id)a3
{
  PXPhotosSectionHeaderLayoutSpec *v5;
  PXPhotosSectionHeaderLayoutSpec *v6;
  char v7;
  PXPhotosSectionHeaderLayoutSpec *v8;

  v8 = (PXPhotosSectionHeaderLayoutSpec *)a3;
  v5 = self->_spec;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXPhotosSectionHeaderLayoutSpec isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      -[PXContentSyndicationSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXContentSyndicationSectionHeaderView;
  -[PXContentSyndicationSectionHeaderView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[PXContentSyndicationSectionHeaderView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContentSyndicationSectionHeaderView _updatePillAlignmentWithTraitCollection:](self, "_updatePillAlignmentWithTraitCollection:", v4);

}

- (void)_updatePillAlignmentWithTraitCollection:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v13;

  v4 = a3;
  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldHorizontallyCenterAttributionViewInGrid");

  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "alwaysLeadingAlignAttributionViewOnRegularWidthPads");

  v9 = objc_msgSend(v4, "userInterfaceIdiom");
  v10 = objc_msgSend(v4, "horizontalSizeClass");

  if (v6)
    v11 = v8 == 0;
  else
    v11 = 1;
  if (!v11 && v9 == 1)
  {
    if (v10 == 2)
      goto LABEL_9;
LABEL_11:
    v13 = 1;
    goto LABEL_12;
  }
  if ((v6 & 1) != 0)
    goto LABEL_11;
LABEL_9:
  v13 = 0;
LABEL_12:
  -[SLAttributionView updateAlignment:](self->_socialLayerAttributionView, "updateAlignment:", v13);
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXContentSyndicationSectionHeaderView;
  -[PXContentSyndicationSectionHeaderView layoutSubviews](&v4, sel_layoutSubviews);
  -[PXContentSyndicationSectionHeaderView bounds](self, "bounds");
  -[PXContentSyndicationSectionHeaderView _performLayoutInWidth:applyLayoutToSubviews:](self, "_performLayoutInWidth:applyLayoutToSubviews:", 1, v3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXContentSyndicationSectionHeaderView _performLayoutInWidth:applyLayoutToSubviews:](self, "_performLayoutInWidth:applyLayoutToSubviews:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_performLayoutInWidth:(double)a3 applyLayoutToSubviews:(BOOL)a4
{
  SLAttributionView *socialLayerAttributionView;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  socialLayerAttributionView = self->_socialLayerAttributionView;
  if (a4)
  {
    -[SLAttributionView prepareLayoutWithMaxWidth:](socialLayerAttributionView, "prepareLayoutWithMaxWidth:", a3 + -32.0);
    -[SLAttributionView sizeThatFits:](self->_socialLayerAttributionView, "sizeThatFits:", a3 + -32.0, 1.79769313e308);
    v8 = v7 + 16.0;
    -[SLAttributionView setFrame:](self->_socialLayerAttributionView, "setFrame:");
  }
  else if (socialLayerAttributionView)
  {
    -[SLAttributionView sizeThatFits:](socialLayerAttributionView, "sizeThatFits:", a3 + -32.0, 1.79769313e308);
    if (v9 <= 29.5)
      v8 = 45.5;
    else
      v8 = v9 + 16.0;
  }
  else
  {
    v8 = 45.5;
  }
  v10 = a3;
  v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)contextMenuItemsForAttributionView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PXContentSyndicationSectionHeaderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if ((v5 & 1) != 0)
  {
    -[PXContentSyndicationSectionHeaderView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "additionalContextMenuActionsForAttributionViewInContentSyndicationHeaderView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v7)
    v9 = v7;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

- (SLHighlight)socialLayerHighlight
{
  return self->_socialLayerHighlight;
}

- (PXPhotosSectionHeaderLayoutSpec)spec
{
  return self->_spec;
}

- (PXContentSyndicationSectionHeaderViewDelegate)delegate
{
  return (PXContentSyndicationSectionHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_socialLayerHighlight, 0);
  objc_storeStrong((id *)&self->_socialLayerAttributionView, 0);
}

@end
