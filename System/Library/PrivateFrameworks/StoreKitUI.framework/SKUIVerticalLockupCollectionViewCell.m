@implementation SKUIVerticalLockupCollectionViewCell

- (SKUIVerticalLockupCollectionViewCell)initWithFrame:(CGRect)a3
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
  SKUIVerticalLockupCollectionViewCell *v16;
  SKUIVerticalLockupCollectionViewCell *v17;
  void *v18;
  SKUIVerticalLockupView *v19;
  uint64_t v20;
  SKUIVerticalLockupView *lockupView;
  objc_super v23;

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
        -[SKUIVerticalLockupCollectionViewCell initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIVerticalLockupCollectionViewCell;
  v16 = -[SKUICollectionViewCell initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    -[SKUIVerticalLockupCollectionViewCell contentView](v16, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = [SKUIVerticalLockupView alloc];
    objc_msgSend(v18, "bounds");
    v20 = -[SKUIVerticalLockupView initWithFrame:](v19, "initWithFrame:");
    lockupView = v17->_lockupView;
    v17->_lockupView = (SKUIVerticalLockupView *)v20;

    objc_msgSend(v18, "addSubview:", v17->_lockupView);
  }
  return v17;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  SKUIVerticalLockupView *lockupView;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v4 = a3;
  lockupView = self->_lockupView;
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewReuseView setBackgroundColor:](lockupView, "setBackgroundColor:", v6);

  v13.receiver = self;
  v13.super_class = (Class)SKUIVerticalLockupCollectionViewCell;
  -[SKUICollectionViewCell applyLayoutAttributes:](&v13, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "zoomingImageWidth");
  v8 = v7;
  v9 = 1.0;
  v10 = 1.0;
  if (v7 > 0.00000011920929)
  {
    objc_msgSend(v4, "zoomingImageImposedAlphaOfOtherViews");
    v9 = v11;
    objc_msgSend(v4, "zoomingImageAlpha");
    v10 = v12;
  }
  -[SKUIVerticalLockupView setOpacityOfViewsOtherThanProductImageView:](self->_lockupView, "setOpacityOfViewsOtherThanProductImageView:", v9);
  -[SKUIVerticalLockupView setZoomingImageAlpha:](self->_lockupView, "setZoomingImageAlpha:", v10);
  -[SKUIVerticalLockupView setZoomingImageWidth:](self->_lockupView, "setZoomingImageWidth:", v8);

}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double result;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIVerticalLockupCollectionViewCell maximumPerspectiveHeightForSize:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  +[SKUIVerticalLockupView maximumPerspectiveHeightForSize:](SKUIVerticalLockupView, "maximumPerspectiveHeightForSize:", width, height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  SKUIVerticalLockupView *lockupView;
  id v4;

  lockupView = self->_lockupView;
  v4 = a3;
  -[SKUIVerticalLockupView setPerspectiveTargetView:](lockupView, "setPerspectiveTargetView:", v4);

}

- (void)setVanishingPoint:(CGPoint)a3
{
  -[SKUIVerticalLockupView setVanishingPoint:](self->_lockupView, "setVanishingPoint:", a3.x, a3.y);
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  -[SKUIVerticalLockupView updateForChangedDistanceFromVanishingPoint](self->_lockupView, "updateForChangedDistanceFromVanishingPoint");
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
        +[SKUIVerticalLockupCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v17 = +[SKUIVerticalLockupView prefetchResourcesForViewElement:reason:context:](SKUIVerticalLockupView, "prefetchResourcesForViewElement:reason:context:", v7, a4, v8);

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
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v7)
        +[SKUIVerticalLockupCollectionViewCell preferredSizeForViewElement:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  +[SKUIVerticalLockupView preferredSizeForViewElement:context:](SKUIVerticalLockupView, "preferredSizeForViewElement:context:", v5, v6);
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
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIVerticalLockupCollectionViewCell requestLayoutForViewElement:width:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  +[SKUIVerticalLockupView requestLayoutForViewElement:width:context:](SKUIVerticalLockupView, "requestLayoutForViewElement:width:context:", v7, v8, a4);

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
        +[SKUIVerticalLockupCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  +[SKUIVerticalLockupView sizeThatFitsWidth:viewElement:context:](SKUIVerticalLockupView, "sizeThatFitsWidth:viewElement:context:", v7, v8, a3);
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
  -[SKUIVerticalLockupView reloadWithViewElement:width:context:](self->_lockupView, "reloadWithViewElement:width:context:", a3, a5, a4);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  -[SKUIVerticalLockupView setContentInset:](self->_lockupView, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SKUIVerticalLockupView setImage:forArtworkRequest:context:](self->_lockupView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SKUIVerticalLockupView updateWithItemState:context:animated:](self->_lockupView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SKUIVerticalLockupView viewForElementIdentifier:](self->_lockupView, "viewForElementIdentifier:", a3);
}

- (void)layoutSubviews
{
  SKUIVerticalLockupView *lockupView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIVerticalLockupCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v5, sel_layoutSubviews);
  lockupView = self->_lockupView;
  -[SKUIVerticalLockupCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SKUIVerticalLockupView setFrame:](lockupView, "setFrame:");

}

- (void)setBackgroundColor:(id)a3
{
  SKUIVerticalLockupView *lockupView;
  id v5;
  objc_super v6;

  lockupView = self->_lockupView;
  v5 = a3;
  -[SKUIViewReuseView setBackgroundColor:](lockupView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIVerticalLockupCollectionViewCell;
  -[SKUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIVerticalLockupCollectionViewCell;
  -[SKUICollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SKUIVerticalLockupCollectionViewCell _reloadHighlightImageView](self, "_reloadHighlightImageView");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIVerticalLockupCollectionViewCell;
  -[SKUICollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[SKUIVerticalLockupCollectionViewCell _reloadHighlightImageView](self, "_reloadHighlightImageView");
}

- (void)_reloadHighlightImageView
{
  SKUIVerticalLockupView *lockupView;
  uint64_t v4;
  void *v5;
  SKUIVerticalLockupView *v6;
  SKUIImageView *highlightImageView;
  SKUIImageView *v8;
  SKUIImageView *v9;
  SKUIImageView *v10;
  void *v11;
  SKUIImageView *v12;
  SKUIImageView *v13;
  void *v14;
  void *v15;
  void *v16;
  SKUIImageView *v17;
  void *v18;
  SKUIImageView *v19;
  SKUIImageView *v20;
  SKUIImageView *v21;
  void *v22;
  SKUIImageView *v23;
  _QWORD v24[4];
  SKUIImageView *v25;
  _OWORD v26[3];
  _QWORD v27[5];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  if ((-[SKUIVerticalLockupCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[SKUIVerticalLockupCollectionViewCell isSelected](self, "isSelected"))
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__7;
    v33 = __Block_byref_object_dispose__7;
    v34 = 0;
    lockupView = self->_lockupView;
    v4 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __65__SKUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke;
    v28[3] = &unk_1E73A1FB0;
    v28[4] = &v29;
    -[SKUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](lockupView, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x1E73B6CF0, v28);
    v5 = (void *)v30[5];
    if (v5)
      goto LABEL_5;
    v6 = self->_lockupView;
    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = __65__SKUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_2;
    v27[3] = &unk_1E73A1FB0;
    v27[4] = &v29;
    -[SKUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](v6, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x1E73B6F10, v27);
    v5 = (void *)v30[5];
    if (v5)
    {
LABEL_5:
      highlightImageView = self->_highlightImageView;
      if (!highlightImageView)
      {
        v8 = objc_alloc_init(SKUIImageView);
        v9 = self->_highlightImageView;
        self->_highlightImageView = v8;

        -[SKUIImageView setAlpha:](self->_highlightImageView, "setAlpha:", 0.300000012);
        v10 = self->_highlightImageView;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIImageView setBackgroundColor:](v10, "setBackgroundColor:", v11);

        highlightImageView = self->_highlightImageView;
        v5 = (void *)v30[5];
      }
      objc_msgSend(v5, "bounds");
      -[SKUIImageView setBounds:](highlightImageView, "setBounds:");
      v12 = self->_highlightImageView;
      objc_msgSend((id)v30[5], "center");
      -[SKUIImageView setCenter:](v12, "setCenter:");
      v13 = self->_highlightImageView;
      objc_msgSend((id)v30[5], "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_flatImageWithColor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIImageView setImage:](v13, "setImage:", v16);

      v17 = self->_highlightImageView;
      v18 = (void *)v30[5];
      if (v18)
        objc_msgSend(v18, "transform");
      else
        memset(v26, 0, sizeof(v26));
      -[SKUIImageView setTransform:](v17, "setTransform:", v26);
      -[SKUIVerticalLockupView insertSubview:aboveSubview:](self->_lockupView, "insertSubview:aboveSubview:", self->_highlightImageView, v30[5]);
    }
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    v19 = self->_highlightImageView;
    if (v19)
    {
      v20 = v19;
      v21 = self->_highlightImageView;
      self->_highlightImageView = 0;

      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v22 = (void *)MEMORY[0x1E0CD28B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __65__SKUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_3;
      v24[3] = &unk_1E739FD38;
      v25 = v20;
      v23 = v20;
      objc_msgSend(v22, "setCompletionBlock:", v24);
      -[SKUIImageView setAlpha:](v23, "setAlpha:", 0.0);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

    }
  }
}

void __65__SKUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

void __65__SKUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

uint64_t __65__SKUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_highlightImageView, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)maximumPerspectiveHeightForSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
