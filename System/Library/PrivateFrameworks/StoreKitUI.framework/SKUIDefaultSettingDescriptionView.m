@implementation SKUIDefaultSettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
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
  void *v17;
  uint64_t v18;
  __objc2_class **v19;
  char v20;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUIDefaultSettingDescriptionView prefetchResourcesForSettingDescription:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v7, "viewElement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "lockupViewType");
  v19 = off_1E739E660;
  if (v18 != 8)
    v19 = off_1E739E1F8;
  v20 = -[__objc2_class prefetchResourcesForViewElement:reason:context:](*v19, "prefetchResourcesForViewElement:reason:context:", v17, a4, v8);

  return v20;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIDefaultSettingDescriptionView preferredSizeForSettingDescription:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5
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
  void *v17;
  uint64_t v18;
  __objc2_class **v19;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUIDefaultSettingDescriptionView requestLayoutForSettingDescription:width:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v7, "viewElement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "lockupViewType");
  v19 = off_1E739E660;
  if (v18 != 8)
    v19 = off_1E739E1F8;
  -[__objc2_class requestLayoutForViewElement:width:context:](*v19, "requestLayoutForViewElement:width:context:", v17, v8, a4);

}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
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
  void *v18;
  uint64_t v19;
  __objc2_class **v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGSize result;

  v8 = a4;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        +[SKUIDefaultSettingDescriptionView sizeThatFitsWidth:settingDescription:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v8, "viewElement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "lockupViewType");
  v20 = off_1E739E660;
  if (v19 != 8)
    v20 = off_1E739E1F8;
  -[__objc2_class sizeThatFitsWidth:viewElement:context:](*v20, "sizeThatFitsWidth:viewElement:context:", v18, v9, a3);
  v22 = v21;
  v24 = v23;
  objc_msgSend(v18, "style");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_paddingForStyle:", v25);
  v28 = v24 + v26 + v27;

  v29 = v22;
  v30 = v28;
  result.height = v30;
  result.width = v29;
  return result;
}

- (BOOL)hasDisclosureChevron
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
        -[SKUIDefaultSettingDescriptionView hasDisclosureChevron].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return self->_hasDisclosureChevron;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
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
  void *v18;
  SKUIViewReuseView *viewReuseView;
  SKUIViewReuseView *v20;
  SKUIViewReuseView *v21;
  id v22;
  id v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(double *, void *);
  void *v34;
  id v35;
  SKUIDefaultSettingDescriptionView *v36;
  id v37;
  double v38;

  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIDefaultSettingDescriptionView reloadWithSettingDescription:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v8, "viewElement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  viewReuseView = self->_viewReuseView;
  if (!viewReuseView)
  {
    v20 = objc_alloc_init(SKUIViewReuseView);
    v21 = self->_viewReuseView;
    self->_viewReuseView = v20;

    -[SKUIDefaultSettingDescriptionView addSubview:](self, "addSubview:", self->_viewReuseView);
    viewReuseView = self->_viewReuseView;
  }
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __80__SKUIDefaultSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v34 = &unk_1E73A1230;
  v35 = v18;
  v36 = self;
  v38 = a4;
  v37 = v9;
  v22 = v9;
  v23 = v18;
  -[SKUIViewReuseView modifyUsingBlock:](viewReuseView, "modifyUsingBlock:", &v31);
  objc_msgSend(v23, "style", v31, v32, v33, v34);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_paddingForStyle:", v24);
  self->_padding.top = v25;
  self->_padding.left = v26;
  self->_padding.bottom = v27;
  self->_padding.right = v28;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIDefaultSettingDescriptionView setBackgroundColor:](self, "setBackgroundColor:", v29);

  objc_msgSend(v23, "firstChildForElementType:", 29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasDisclosureChevron = v30 != 0;

}

void __80__SKUIDefaultSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(double *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)*((_QWORD *)a1 + 4);
  v4 = a2;
  v5 = objc_msgSend(v3, "lockupViewType");
  v6 = *((_QWORD *)a1 + 4);
  v7 = a1[7];
  v8 = *((_QWORD *)a1 + 6);
  if (v5 == 8)
    objc_msgSend(v4, "addTabularLockupWithElement:width:context:", v6, v8, v7);
  else
    objc_msgSend(v4, "addHorizontalLockupWithElement:width:context:", v6, v8, v7);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *((_QWORD *)a1 + 5);
  v11 = *(void **)(v10 + 488);
  *(_QWORD *)(v10 + 488) = v9;

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
  char v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v11)
        -[SKUIDefaultSettingDescriptionView setImage:forArtworkRequest:context:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  if (-[UIView conformsToProtocol:](self->_viewElementView, "conformsToProtocol:", &unk_1EF4000F8))
    v19 = -[UIView setImage:forArtworkRequest:context:](self->_viewElementView, "setImage:forArtworkRequest:context:", v8, v9, v10);
  else
    v19 = 0;

  return v19;
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIDefaultSettingDescriptionView;
  v4 = a3;
  -[SKUIDefaultSettingDescriptionView setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[UIView setBackgroundColor:](self->_viewElementView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);

}

+ (UIEdgeInsets)_paddingForStyle:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  char v7;
  UIEdgeInsets result;

  v7 = 0;
  v3 = SKUIViewElementPaddingForStyle(a3, &v7);
  if (!v7)
  {
    v3 = *MEMORY[0x1E0DC49E8];
    v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewReuseView, 0);
  objc_storeStrong((id *)&self->_viewElementView, 0);
}

+ (void)prefetchResourcesForSettingDescription:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForSettingDescription:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)requestLayoutForSettingDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 settingDescription:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)hasDisclosureChevron
{
  OUTLINED_FUNCTION_1();
}

- (void)reloadWithSettingDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
