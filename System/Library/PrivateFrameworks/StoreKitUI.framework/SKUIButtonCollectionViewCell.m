@implementation SKUIButtonCollectionViewCell

- (void)dealloc
{
  objc_super v3;

  -[UIControl removeTarget:action:forControlEvents:](self->_button, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SKUIButtonCollectionViewCell;
  -[SKUIViewReuseCollectionViewCell dealloc](&v3, sel_dealloc);
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
  char v17;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIButtonCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v17 = objc_msgSend(v8, "prefetchResourcesForViewElement:reason:", v7, a4);

  return v17;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v6 = a4;
  v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        +[SKUIButtonCollectionViewCell preferredSizeForViewElement:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        +[SKUIButtonCollectionViewCell requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v18 = objc_msgSend(v8, "elementType");
  if (v18 == 141 || v18 == 12)
  {
    objc_msgSend(a1, "_attributedStringWithButton:context:", v8, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "labelLayoutCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "requestLayoutForButton:attributedString:width:", v8, v19, (uint64_t)a4);

  }
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
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIButtonCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v8, "sizeForViewElement:width:", v7, a3);
  v18 = v17;

  v19 = a3;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id buttonImageResourceCacheKey;
  IKViewElementStyle *v23;
  IKViewElementStyle *viewElementStyle;
  SKUIBuyButtonDescriptor *v25;
  SKUIBuyButtonDescriptor *buyButtonDescriptor;
  UIControl *button;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  SKUIButtonCollectionViewCell *v34;
  id v35;
  double v36;

  v9 = a3;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v11)
        -[SKUIButtonCollectionViewCell reloadWithViewElement:width:context:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __68__SKUIButtonCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v32 = &unk_1E73A1230;
  v19 = v9;
  v33 = v19;
  v34 = self;
  v36 = a4;
  v20 = v10;
  v35 = v20;
  -[SKUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", &v29);
  objc_msgSend(v20, "imageResourceCacheKeyForViewElement:", v19, v29, v30, v31, v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  buttonImageResourceCacheKey = self->_buttonImageResourceCacheKey;
  self->_buttonImageResourceCacheKey = v21;

  objc_msgSend(v19, "style");
  v23 = (IKViewElementStyle *)objc_claimAutoreleasedReturnValue();
  viewElementStyle = self->_viewElementStyle;
  self->_viewElementStyle = v23;

  objc_msgSend(v19, "buyButtonDescriptor");
  v25 = (SKUIBuyButtonDescriptor *)objc_claimAutoreleasedReturnValue();
  buyButtonDescriptor = self->_buyButtonDescriptor;
  self->_buyButtonDescriptor = v25;

  objc_storeStrong((id *)&self->_viewElement, a3);
  if (-[SKUIButtonCollectionViewCell _usesBackgroundWithAlpha](self, "_usesBackgroundWithAlpha"))
  {
    button = self->_button;
    if (button)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIControl setBackgroundColor:](button, "setBackgroundColor:", v28);

    }
  }

}

void __68__SKUIButtonCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "elementType");
  if (v3 == 12 || v3 == 141 || v3 == 50)
  {
    objc_msgSend(v7, "addButtonWithElement:width:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 824);
    *(_QWORD *)(v5 + 824) = v4;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 824), "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel__buttonAction_, 64);
  }

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIControl *button;
  void *v14;
  objc_super v15;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIButtonCollectionViewCell setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIButtonCollectionViewCell;
  -[SKUIViewReuseCollectionViewCell setBackgroundColor:](&v15, sel_setBackgroundColor_, v4);
  if (-[SKUIButtonCollectionViewCell _usesBackgroundWithAlpha](self, "_usesBackgroundWithAlpha"))
  {
    button = self->_button;
    if (button)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIControl setBackgroundColor:](button, "setBackgroundColor:", v14);

    }
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v11)
        -[SKUIButtonCollectionViewCell setImage:forArtworkRequest:context:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  objc_msgSend(v10, "requestIdentifierForResourceCacheKey:", self->_buttonImageResourceCacheKey);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 && (v20 = objc_msgSend(v9, "requestIdentifier"), v20 == objc_msgSend(v19, "unsignedIntegerValue")))
  {
    -[UIControl imageView](self->_button, "imageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImage:", v8);

    v22 = 1;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  UIControl *button;
  SKUIBuyButtonDescriptor *buyButtonDescriptor;
  void *v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIButtonCollectionViewCell updateWithItemState:context:animated:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v18 = -[SKUIBuyButtonDescriptor canPersonalizeUsingItemState:](self->_buyButtonDescriptor, "canPersonalizeUsingItemState:", v8);
  if (v18)
  {
    button = self->_button;
    buyButtonDescriptor = self->_buyButtonDescriptor;
    objc_msgSend(v9, "clientContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIControl setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:](button, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", buyButtonDescriptor, v8, v21, v5);

  }
  return v18;
}

- (id)viewForElementIdentifier:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIButtonCollectionViewCell viewForElementIdentifier:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 0;
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)_buttonAction:(id)a3
{
  void *v4;
  char v5;
  SKUIButtonViewElement *viewElement;
  void *v7;
  id v8;

  SKUICollectionViewForView(self);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  viewElement = self->_viewElement;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v8, "indexPathForCell:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v8, viewElement, 0, v7);

  }
  else
  {
    -[SKUIButtonViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_viewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
  }

}

+ (id)_attributedStringWithButton:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "buttonTitleStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "style");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  SKUIViewElementFontWithStyle(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = SKUIViewElementAlignmentForStyle(v10);
  if (v14)
    v15 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v14);
  else
    v15 = 0;
  objc_msgSend(v5, "buttonText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v11, v13, v15, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)_usesBackgroundWithAlpha
{
  void *v2;
  int v3;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  v5 = 0.0;
  v6 = 0;
  -[SKUIButtonCollectionViewCell backgroundColor](self, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getHue:saturation:brightness:alpha:", &v8, &v7, &v6, &v5);

  return v3 && v5 < 1.0 && v5 != 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElementStyle, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptor, 0);
  objc_storeStrong(&self->_buttonImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_button, 0);
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

- (void)reloadWithViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)updateWithItemState:(uint64_t)a3 context:(uint64_t)a4 animated:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)viewForElementIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
