@implementation SearchUIMultiResultAppCollectionCell

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SearchUIMultiResultAppCollectionCell;
  -[SearchUIMultiResultAppCollectionCell layoutSubviews](&v12, sel_layoutSubviews);
  -[SearchUIMultiResultAppCollectionCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SearchUIMultiResultAppCollectionCell appIconView](self, "appIconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)updateWithResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SearchUIRowModel *v9;
  id v10;

  v4 = a3;
  -[SearchUIMultiResultAppCollectionCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", 0);
  -[SearchUIMultiResultAppCollectionCell appIconView](self, "appIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[SearchUIMultiResultAppCollectionCell setAppIconView:](self, "setAppIconView:", v6);

    -[SearchUIMultiResultAppCollectionCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIMultiResultAppCollectionCell appIconView](self, "appIconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

  }
  -[SearchUIMultiResultAppCollectionCell appIconView](self, "appIconView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = -[SearchUIRowModel initWithResult:itemIdentifier:]([SearchUIRowModel alloc], "initWithResult:itemIdentifier:", v4, 0);

  objc_msgSend(v10, "updateWithRowModel:", v9);
}

- (SearchUIHomeScreenAppIconView)appIconView
{
  return (SearchUIHomeScreenAppIconView *)objc_getProperty(self, a2, 648, 1);
}

- (void)setHoverHighlightMargins:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_hoverHighlightMargins, &v3, 16, 1, 0);
}

- (void)setAppIconView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 648);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[SearchUIMultiResultAppCollectionCell appIconView](self, "appIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAddRoundedKeyboardHighlight:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SearchUIMultiResultAppCollectionCell;
  -[SearchUIMultiResultAppCollectionCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (int64_t)_focusItemDeferralMode
{
  return 2;
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (CGSize)hoverHighlightMargins
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_hoverHighlightMargins, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconView, 0);
}

@end
