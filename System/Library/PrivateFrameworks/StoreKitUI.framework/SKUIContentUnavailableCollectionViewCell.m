@implementation SKUIContentUnavailableCollectionViewCell

- (SKUIContentUnavailableCollectionViewCell)initWithFrame:(CGRect)a3
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
  SKUIContentUnavailableCollectionViewCell *v16;
  SKUIContentUnavailableView *v17;
  SKUIContentUnavailableView *contentUnavailableView;
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
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIContentUnavailableCollectionViewCell initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIContentUnavailableCollectionViewCell;
  v16 = -[SKUICollectionViewCell initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_alloc_init(SKUIContentUnavailableView);
    contentUnavailableView = v16->_contentUnavailableView;
    v16->_contentUnavailableView = v17;

    -[SKUIContentUnavailableCollectionViewCell contentView](v16, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v16->_contentUnavailableView);

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
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUIContentUnavailableCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v17 = +[SKUIContentUnavailableView prefetchResourcesForViewElement:reason:context:](SKUIContentUnavailableView, "prefetchResourcesForViewElement:reason:context:", v7, a4, v8);

  return v17;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUIContentUnavailableCollectionViewCell preferredSizeForViewElement:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  +[SKUIContentUnavailableView preferredSizeForViewElement:context:](SKUIContentUnavailableView, "preferredSizeForViewElement:context:", v5, v6);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
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
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUIContentUnavailableCollectionViewCell requestLayoutForViewElement:width:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  +[SKUIContentUnavailableView requestLayoutForViewElement:width:context:](SKUIContentUnavailableView, "requestLayoutForViewElement:width:context:", v7, v8, a4);

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
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUIContentUnavailableCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  +[SKUIContentUnavailableView sizeThatFitsWidth:viewElement:context:](SKUIContentUnavailableView, "sizeThatFitsWidth:viewElement:context:", v7, v8, a3);
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
  -[SKUIContentUnavailableView reloadWithViewElement:width:context:](self->_contentUnavailableView, "reloadWithViewElement:width:context:", a3, a5, a4);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SKUIContentUnavailableCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SKUIContentUnavailableView setImage:forArtworkRequest:context:](self->_contentUnavailableView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SKUIContentUnavailableView updateWithItemState:context:animated:](self->_contentUnavailableView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SKUIContentUnavailableView viewForElementIdentifier:](self->_contentUnavailableView, "viewForElementIdentifier:", a3);
}

- (void)applyLayoutAttributes:(id)a3
{
  SKUIContentUnavailableView *contentUnavailableView;
  id v5;
  void *v6;
  objc_super v7;

  contentUnavailableView = self->_contentUnavailableView;
  v5 = a3;
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewReuseView setBackgroundColor:](contentUnavailableView, "setBackgroundColor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SKUIContentUnavailableCollectionViewCell;
  -[SKUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v5);

}

- (void)layoutSubviews
{
  SKUIContentUnavailableView *contentUnavailableView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKUIContentUnavailableCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v9, sel_layoutSubviews);
  contentUnavailableView = self->_contentUnavailableView;
  -[SKUIContentUnavailableCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SKUIContentUnavailableView setFrame:](contentUnavailableView, "setFrame:", v5 + self->_contentInset.left, v6 + self->_contentInset.top, v7 - (self->_contentInset.left + self->_contentInset.right), v8 - (self->_contentInset.top + self->_contentInset.bottom));

}

- (void)setBackgroundColor:(id)a3
{
  SKUIContentUnavailableView *contentUnavailableView;
  id v5;
  objc_super v6;

  contentUnavailableView = self->_contentUnavailableView;
  v5 = a3;
  -[SKUIViewReuseView setBackgroundColor:](contentUnavailableView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIContentUnavailableCollectionViewCell;
  -[SKUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
