@implementation SKUIHorizontalListCollectionViewCell

- (SKUIHorizontalListCollectionViewCell)initWithFrame:(CGRect)a3
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
  SKUIHorizontalListCollectionViewCell *v16;
  SKUIHorizontalListView *v17;
  uint64_t v18;
  SKUIHorizontalListView *horizontalList;
  void *v20;
  objc_super v22;

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
        -[SKUIHorizontalListCollectionViewCell initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIHorizontalListCollectionViewCell;
  v16 = -[SKUICollectionViewCell initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = [SKUIHorizontalListView alloc];
    -[SKUIHorizontalListCollectionViewCell bounds](v16, "bounds");
    v18 = -[SKUIHorizontalListView initWithFrame:](v17, "initWithFrame:");
    horizontalList = v16->_horizontalList;
    v16->_horizontalList = (SKUIHorizontalListView *)v18;

    -[SKUIHorizontalListCollectionViewCell contentView](v16, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v16->_horizontalList);

  }
  return v16;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
  -[SKUIHorizontalListView setContentInset:](self->_horizontalList, "setContentInset:");
}

- (void)applyLayoutAttributes:(id)a3
{
  SKUIHorizontalListView *horizontalList;
  id v5;
  void *v6;
  objc_super v7;

  horizontalList = self->_horizontalList;
  v5 = a3;
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewReuseView setBackgroundColor:](horizontalList, "setBackgroundColor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SKUIHorizontalListCollectionViewCell;
  -[SKUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v5);

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
        +[SKUIHorizontalListCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v17 = +[SKUIHorizontalListView prefetchResourcesForViewElement:reason:context:](SKUIHorizontalListView, "prefetchResourcesForViewElement:reason:context:", v7, a4, v8);

  return v17;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SKUIHorizontalListView requestLayoutForViewElement:width:context:](SKUIHorizontalListView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  -[SKUIHorizontalListView reloadWithViewElement:width:context:](self->_horizontalList, "reloadWithViewElement:width:context:", a3, a5, a4);
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
        +[SKUIHorizontalListCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  +[SKUIHorizontalListView sizeThatFitsWidth:viewElement:context:](SKUIHorizontalListView, "sizeThatFitsWidth:viewElement:context:", v7, v8, a3);
  v18 = v17;
  v20 = v19;

  v21 = v18;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SKUIHorizontalListView setImage:forArtworkRequest:context:](self->_horizontalList, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SKUIHorizontalListView updateWithItemState:context:animated:](self->_horizontalList, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SKUIHorizontalListView viewForElementIdentifier:](self->_horizontalList, "viewForElementIdentifier:", a3);
}

- (void)layoutSubviews
{
  SKUIHorizontalListView *horizontalList;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIHorizontalListCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v5, sel_layoutSubviews);
  horizontalList = self->_horizontalList;
  -[SKUIHorizontalListCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SKUIHorizontalListView setFrame:](horizontalList, "setFrame:");

}

- (void)setBackgroundColor:(id)a3
{
  SKUIHorizontalListView *horizontalList;
  id v5;
  objc_super v6;

  horizontalList = self->_horizontalList;
  v5 = a3;
  -[SKUIViewReuseView setBackgroundColor:](horizontalList, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIHorizontalListCollectionViewCell;
  -[SKUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalList, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
