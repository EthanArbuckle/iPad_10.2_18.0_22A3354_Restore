@implementation SKUIProgrammedCardLayout

+ (BOOL)allowsViewElement:(id)a3
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
  unint64_t v12;
  BOOL v13;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIProgrammedCardLayout allowsViewElement:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = objc_msgSend(v3, "elementType");
  v13 = 1;
  if (v12 > 0x32 || ((1 << v12) & 0x6000000001000) == 0)
    v13 = v12 == 138;

  return v13;
}

- (id)attributedStringForButton:(id)a3
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
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProgrammedCardLayout attributedStringForButton:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = SKUIViewElementAlignmentForStyle(v13);

  if (v14)
    v15 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v14);
  else
    v15 = 1;
  objc_msgSend(v4, "buttonText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProgrammedCardLayout _fontForButton:](self, "_fontForButton:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v17, 0, v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)attributedStringForLabel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "textAlignment");
  if (v6)
    v7 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v6);
  else
    v7 = 1;
  -[SKUICardLayout layoutContext](self, "layoutContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (objc_msgSend(v4, "labelViewStyle") == 5)
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProgrammedCardLayout _fontForLabel:](self, "_fontForLabel:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v12, v10, v7, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)bottomInsetForLastViewElement:(id)a3 width:(double)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIProgrammedCardLayout bottomInsetForLastViewElement:width:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  -[SKUIProgrammedCardLayout _stringLayoutForViewElement:width:](self, "_stringLayoutForViewElement:width:", v6, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "boundingSize");
    v18 = v17;
    objc_msgSend(v16, "baselineOffset");
    *(float *)&v19 = v18 - v19;
    v20 = 30.0 - roundf(*(float *)&v19);
  }
  else
  {
    v20 = 30.0;
  }

  return v20;
}

- (double)horizontalContentInset
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIProgrammedCardLayout horizontalContentInset].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 20.0;
}

- (int64_t)layoutStyle
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIProgrammedCardLayout layoutStyle].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 1;
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
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;

  v8 = a3;
  v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIProgrammedCardLayout topInsetForViewElement:previousViewElement:width:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v18 = objc_msgSend(v8, "elementType");
  if ((unint64_t)(v18 - 49) < 2)
  {
    v19 = 20.0;
  }
  else
  {
    if (v18 == 138)
    {
      -[SKUIProgrammedCardLayout _fontForLabel:](self, "_fontForLabel:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0.0;
      if (v18 != 12)
        goto LABEL_12;
      -[SKUIProgrammedCardLayout _fontForButton:](self, "_fontForButton:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;
    objc_msgSend(v20, "lineHeight");
    *(float *)&v22 = v22 + v22;
    v19 = roundf(*(float *)&v22);

  }
LABEL_12:
  -[SKUIProgrammedCardLayout _stringLayoutForViewElement:width:](self, "_stringLayoutForViewElement:width:", v8, a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "firstBaselineOffset");
    *(float *)&v25 = v25;
    v19 = v19 - roundf(*(float *)&v25);
  }
  -[SKUIProgrammedCardLayout _stringLayoutForViewElement:width:](self, "_stringLayoutForViewElement:width:", v9, a5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v26, "boundingSize");
    v28 = v27;
    objc_msgSend(v26, "baselineOffset");
    *(float *)&v29 = v28 - v29;
    v19 = v19 - roundf(*(float *)&v29);
  }

  return v19;
}

- (id)_fontForButton:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "buttonTitleStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    SKUIViewElementFontWithStyle(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIViewElementFontWithStyle(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)_fontForLabel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_msgSend(v3, "labelViewStyle");
    v7 = 14.0;
    if (v6 == 5)
      v7 = 20.0;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_stringLayoutForViewElement:(id)a3 width:(double)a4
{
  id v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = objc_msgSend(v6, "elementType");
  if (v7 == 138 || v7 == 12)
  {
    -[SKUICardLayout layoutContext](self, "layoutContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "labelLayoutCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutForWidth:viewElement:", (uint64_t)a4, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)allowsViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)attributedStringForButton:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)bottomInsetForLastViewElement:(uint64_t)a3 width:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)horizontalContentInset
{
  OUTLINED_FUNCTION_1();
}

- (void)layoutStyle
{
  OUTLINED_FUNCTION_1();
}

- (void)topInsetForViewElement:(uint64_t)a3 previousViewElement:(uint64_t)a4 width:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
