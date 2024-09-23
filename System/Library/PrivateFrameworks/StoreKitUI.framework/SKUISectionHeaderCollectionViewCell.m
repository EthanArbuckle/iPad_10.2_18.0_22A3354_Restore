@implementation SKUISectionHeaderCollectionViewCell

- (SKUISectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUISectionHeaderCollectionViewCell *v8;
  SKUISectionHeaderCollectionViewCell *v9;
  void *v10;
  SKUISectionHeaderView *v11;
  uint64_t v12;
  SKUISectionHeaderView *headerView;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUISectionHeaderCollectionViewCell initWithFrame:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUISectionHeaderCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[SKUISectionHeaderCollectionViewCell contentView](v8, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [SKUISectionHeaderView alloc];
    objc_msgSend(v10, "bounds");
    v12 = -[SKUISectionHeaderView initWithFrame:](v11, "initWithFrame:");
    headerView = v9->_headerView;
    v9->_headerView = (SKUISectionHeaderView *)v12;

    objc_msgSend(v10, "addSubview:", v9->_headerView);
  }
  return v9;
}

- (void)applyLayoutAttributes:(id)a3
{
  SKUISectionHeaderView *headerView;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  headerView = self->_headerView;
  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a3;
  objc_msgSend(v5, "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewReuseView setBackgroundColor:](headerView, "setBackgroundColor:", v7);

  v8.receiver = self;
  v8.super_class = (Class)SKUISectionHeaderCollectionViewCell;
  -[SKUICollectionViewCell applyLayoutAttributes:](&v8, sel_applyLayoutAttributes_, v6);

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SKUISectionHeaderView prefetchResourcesForViewElement:reason:context:](SKUISectionHeaderView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  +[SKUISectionHeaderView preferredSizeForViewElement:context:](SKUISectionHeaderView, "preferredSizeForViewElement:context:", a3, a4);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SKUISectionHeaderView requestLayoutForViewElement:width:context:](SKUISectionHeaderView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SKUISectionHeaderView sizeThatFitsWidth:viewElement:context:](SKUISectionHeaderView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  -[SKUISectionHeaderView reloadWithViewElement:width:context:](self->_headerView, "reloadWithViewElement:width:context:", a3, a5, a4);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  -[SKUISectionHeaderView setContentInset:](self->_headerView, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SKUISectionHeaderView setImage:forArtworkRequest:context:](self->_headerView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SKUISectionHeaderView updateWithItemState:context:animated:](self->_headerView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  SKUISectionHeaderView *headerView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUISectionHeaderCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v5, sel_layoutSubviews);
  headerView = self->_headerView;
  -[SKUISectionHeaderCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SKUISectionHeaderView setFrame:](headerView, "setFrame:");

}

- (void)setBackgroundColor:(id)a3
{
  SKUISectionHeaderView *headerView;
  id v5;
  objc_super v6;

  headerView = self->_headerView;
  v5 = a3;
  -[SKUIViewReuseView setBackgroundColor:](headerView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUISectionHeaderCollectionViewCell;
  -[SKUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISectionHeaderCollectionViewCell initWithFrame:]";
}

@end
