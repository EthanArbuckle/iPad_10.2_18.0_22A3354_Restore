@implementation SKUIFilterBarCollectionViewCell

- (SKUIFilterBarCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIFilterBarCollectionViewCell *v8;
  SKUIFilterBarCollectionViewCell *v9;
  void *v10;
  SKUIFilterBarView *v11;
  uint64_t v12;
  SKUIFilterBarView *filterBarView;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIFilterBarCollectionViewCell initWithFrame:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIFilterBarCollectionViewCell;
  v8 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[SKUIFilterBarCollectionViewCell contentView](v8, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [SKUIFilterBarView alloc];
    objc_msgSend(v10, "bounds");
    v12 = -[SKUIFilterBarView initWithFrame:](v11, "initWithFrame:");
    filterBarView = v9->_filterBarView;
    v9->_filterBarView = (SKUIFilterBarView *)v12;

    objc_msgSend(v10, "addSubview:", v9->_filterBarView);
  }
  return v9;
}

- (void)applyLayoutAttributes:(id)a3
{
  SKUIFilterBarView *filterBarView;
  id v5;
  void *v6;
  objc_super v7;

  filterBarView = self->_filterBarView;
  v5 = a3;
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewReuseView setBackgroundColor:](filterBarView, "setBackgroundColor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SKUIFilterBarCollectionViewCell;
  -[SKUIViewReuseCollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v5);

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SKUIFilterBarView prefetchResourcesForViewElement:reason:context:](SKUIFilterBarView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  +[SKUIFilterBarView preferredSizeForViewElement:context:](SKUIFilterBarView, "preferredSizeForViewElement:context:", a3, a4);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SKUIFilterBarView requestLayoutForViewElement:width:context:](SKUIFilterBarView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SKUIFilterBarView sizeThatFitsWidth:viewElement:context:](SKUIFilterBarView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  -[SKUIFilterBarView reloadWithViewElement:width:context:](self->_filterBarView, "reloadWithViewElement:width:context:", a3, a5, a4);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  -[SKUIFilterBarView setContentInset:](self->_filterBarView, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SKUIFilterBarView setImage:forArtworkRequest:context:](self->_filterBarView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SKUIFilterBarView updateWithItemState:context:animated:](self->_filterBarView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SKUIFilterBarView viewForElementIdentifier:](self->_filterBarView, "viewForElementIdentifier:", a3);
}

- (void)layoutSubviews
{
  SKUIFilterBarView *filterBarView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIFilterBarCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v5, sel_layoutSubviews);
  filterBarView = self->_filterBarView;
  -[SKUIFilterBarCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SKUIFilterBarView setFrame:](filterBarView, "setFrame:");

}

- (void)setBackgroundColor:(id)a3
{
  SKUIFilterBarView *filterBarView;
  id v5;
  objc_super v6;

  filterBarView = self->_filterBarView;
  v5 = a3;
  -[SKUIViewReuseView setBackgroundColor:](filterBarView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIFilterBarCollectionViewCell;
  -[SKUIViewReuseCollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterBarView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIFilterBarCollectionViewCell initWithFrame:]";
}

@end
