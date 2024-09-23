@implementation SKUIDefaultCardLayout

- (id)attributedStringForButton:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIDefaultCardLayout attributedStringForButton:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "buttonTitleStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v3, "style");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  SKUIViewElementFontWithStyle(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = SKUIViewElementAlignmentForStyle(v15);
  if (v17)
    v18 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v17);
  else
    v18 = 1;
  objc_msgSend(v3, "buttonText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v16, 0, v18, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)attributedStringForLabel:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDefaultCardLayout attributedStringForLabel:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUICardLayout layoutContext](self, "layoutContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = SKUIViewElementAlignmentForStyle(v13);
  if (v18)
    v19 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v18);
  else
    v19 = 1;
  v20 = objc_msgSend(v4, "labelViewStyle");
  if (v20 <= 5)
  {
    if (((1 << v20) & 0x1B) == 0)
    {
      if (v14)
      {
        if (v17)
          goto LABEL_21;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (v14)
    {
      if (!v17)
        goto LABEL_17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
LABEL_17:
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v17 = (void *)v21;
      }
    }
  }
LABEL_21:
  objc_msgSend(v4, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "attributedStringWithDefaultFont:foregroundColor:textAlignment:", v14, v17, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIDefaultCardLayout topInsetForViewElement:previousViewElement:width:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  if (objc_msgSend(v9, "elementType") == 66)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19;
    v22 = v21;

    if (v22 < v20)
      v22 = v20;
    v23 = 12.0;
    if (objc_msgSend(v8, "elementType") != 131 && objc_msgSend(v9, "elementType") != 131)
    {
      v23 = 20.0;
      if (v22 <= 736.0)
      {
        objc_msgSend(v8, "parent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || (v23 = 12.0, (objc_msgSend(v24, "isAdCard") & 1) == 0))
        {
          if (v22 <= 568.0)
            v23 = 10.0;
          else
            v23 = 15.0;
        }

      }
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SKUIDefaultCardLayout;
    -[SKUICardLayout topInsetForViewElement:previousViewElement:width:](&v27, sel_topInsetForViewElement_previousViewElement_width_, v8, v9, a5);
    v23 = v25;
  }

  return v23;
}

- (void)attributedStringForButton:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)attributedStringForLabel:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)topInsetForViewElement:(uint64_t)a3 previousViewElement:(uint64_t)a4 width:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
