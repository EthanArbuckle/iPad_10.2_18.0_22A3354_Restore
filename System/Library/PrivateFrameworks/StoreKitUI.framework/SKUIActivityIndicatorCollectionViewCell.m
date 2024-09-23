@implementation SKUIActivityIndicatorCollectionViewCell

- (SKUIActivityIndicatorCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIActivityIndicatorCollectionViewCell *v16;
  SKUIActivityIndicatorView *v17;
  SKUIActivityIndicatorView *indicatorView;
  void *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[SKUIActivityIndicatorCollectionViewCell initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIActivityIndicatorCollectionViewCell;
  v16 = -[SKUICollectionViewCell initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_alloc_init(SKUIActivityIndicatorView);
    indicatorView = v16->_indicatorView;
    v16->_indicatorView = v17;

    -[SKUIActivityIndicatorCollectionViewCell contentView](v16, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v16->_indicatorView);

  }
  return v16;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIActivityIndicatorCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v17 = +[SKUIActivityIndicatorView prefetchResourcesForViewElement:reason:context:](SKUIActivityIndicatorView, "prefetchResourcesForViewElement:reason:context:", v7, a4, v8);

  return v17;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    +[SKUIActivityIndicatorCollectionViewCell preferredSizeForViewElement:context:].cold.1();
  }
  +[SKUIActivityIndicatorView preferredSizeForViewElement:context:](SKUIActivityIndicatorView, "preferredSizeForViewElement:context:", v5, v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIActivityIndicatorCollectionViewCell requestLayoutForViewElement:width:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  +[SKUIActivityIndicatorView requestLayoutForViewElement:width:context:](SKUIActivityIndicatorView, "requestLayoutForViewElement:width:context:", v7, v8, a4);

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIActivityIndicatorCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  +[SKUIActivityIndicatorView sizeThatFitsWidth:viewElement:context:](SKUIActivityIndicatorView, "sizeThatFitsWidth:viewElement:context:", v7, v8, a3);
  v18 = v17;
  v20 = v19;

  v21 = v18;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  -[SKUIActivityIndicatorView reloadWithViewElement:width:context:](self->_indicatorView, "reloadWithViewElement:width:context:", a3, a5, a4);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SKUIActivityIndicatorCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SKUIActivityIndicatorView setImage:forArtworkRequest:context:](self->_indicatorView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SKUIActivityIndicatorView updateWithItemState:context:animated:](self->_indicatorView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SKUIActivityIndicatorView viewForElementIdentifier:](self->_indicatorView, "viewForElementIdentifier:", a3);
}

- (void)applyLayoutAttributes:(id)a3
{
  SKUIActivityIndicatorView *indicatorView;
  id v5;
  void *v6;
  objc_super v7;

  indicatorView = self->_indicatorView;
  v5 = a3;
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewReuseView setBackgroundColor:](indicatorView, "setBackgroundColor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SKUIActivityIndicatorCollectionViewCell;
  -[SKUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v5);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SKUIActivityIndicatorCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v11, sel_layoutSubviews);
  -[SKUIActivityIndicatorCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[SKUIActivityIndicatorView sizeThatFits:](self->_indicatorView, "sizeThatFits:", v5, v7);
  v9 = v8;
  *(float *)&v8 = (v5 - v8) * 0.5;
  *(float *)&v10 = v7 * 0.5 - v10;
  -[SKUIActivityIndicatorView setFrame:](self->_indicatorView, "setFrame:", floorf(*(float *)&v8), floorf(*(float *)&v10), v9);
}

- (void)setBackgroundColor:(id)a3
{
  SKUIActivityIndicatorView *indicatorView;
  id v5;
  objc_super v6;

  indicatorView = self->_indicatorView;
  v5 = a3;
  -[SKUIViewReuseView setBackgroundColor:](indicatorView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIActivityIndicatorCollectionViewCell;
  -[SKUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorView, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForViewElement:context:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUIActivityIndicatorCollectionViewCell preferredSizeForViewElement:context:]";
  OUTLINED_FUNCTION_1();
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
