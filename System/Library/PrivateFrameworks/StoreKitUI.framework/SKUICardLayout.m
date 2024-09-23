@implementation SKUICardLayout

+ (BOOL)allowsViewElement:(id)a3
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
        +[SKUICardLayout allowsViewElement:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 1;
}

+ (SKUICardLayout)layoutWithCardViewElement:(id)a3 context:(id)a4
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
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUICardLayout layoutWithCardViewElement:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v29 = 0;
  objc_msgSend(v5, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cardType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("programmed"));

  if ((v17 & 1) != 0)
  {
    v18 = objc_opt_class();
    v27[3] = v18;
    if (!v18)
      goto LABEL_10;
  }
  else if (!v27[3])
  {
LABEL_10:
    v27[3] = objc_opt_class();
    goto LABEL_11;
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __52__SKUICardLayout_layoutWithCardViewElement_context___block_invoke;
  v25[3] = &unk_1E73A01D0;
  v25[4] = &v26;
  objc_msgSend(v5, "enumerateChildrenUsingBlock:", v25);
  if (!v27[3])
    goto LABEL_10;
LABEL_11:
  objc_msgSend(v5, "firstChildForElementType:", 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc_init((Class)v27[3]);
  v21 = (void *)v20[1];
  v20[1] = v5;
  v22 = v5;

  v23 = (void *)v20[2];
  v20[2] = v6;

  *((_BYTE *)v20 + 24) = v19 != 0;
  _Block_object_dispose(&v26, 8);
  return (SKUICardLayout *)v20;
}

uint64_t __52__SKUICardLayout_layoutWithCardViewElement_context___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "allowsViewElement:", a2);
  if ((result & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (id)attributedStringForButton:(id)a3
{
  return 0;
}

- (id)attributedStringForLabel:(id)a3
{
  return 0;
}

- (double)bottomInsetForLastViewElement:(id)a3 width:(double)a4
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICardLayout bottomInsetForLastViewElement:width:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  result = 15.0;
  if (!self->_hasBackground)
    return 0.0;
  return result;
}

- (double)horizontalContentInset
{
  return 0.0;
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
        -[SKUICardLayout layoutStyle].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0;
}

- (CGSize)sizeForViewElement:(id)a3 width:(double)a4
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
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUICardLayout sizeForViewElement:width:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v15 = objc_msgSend(v6, "elementType");
  if (v15 <= 65)
  {
    if (v15 == 7)
    {
      objc_msgSend(v6, "firstChildForElementType:", 49);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIViewElementLayoutContext sizeForViewElement:width:](self->_layoutContext, "sizeForViewElement:width:", v23, a4);
      v21 = v24;
      v22 = v25;

      goto LABEL_21;
    }
    if (v15 == 50 && -[SKUICardViewElement isAdCard](self->_cardViewElement, "isAdCard"))
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

LABEL_20:
        v21 = 0.0;
        v22 = 5.0;
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "userInterfaceIdiom");

      if (!v18)
        goto LABEL_20;
    }
    goto LABEL_15;
  }
  if (v15 == 108)
  {
    v21 = *MEMORY[0x1E0C9D820];
    v22 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_21;
  }
  if (v15 != 66)
  {
LABEL_15:
    -[SKUIViewElementLayoutContext sizeForViewElement:width:](self->_layoutContext, "sizeForViewElement:width:", v6, a4);
    goto LABEL_16;
  }
  +[SKUIHorizontalLockupView sizeThatFitsWidth:viewElement:context:](SKUIHorizontalLockupView, "sizeThatFitsWidth:viewElement:context:", v6, self->_layoutContext, a4);
LABEL_16:
  v21 = v19;
  v22 = v20;
LABEL_21:

  v26 = v21;
  v27 = v22;
  result.height = v27;
  result.width = v26;
  return result;
}

- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5
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
  BOOL v18;
  double v19;
  double v20;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
      {
        -[SKUICardLayout topInsetForViewElement:previousViewElement:width:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
        if (v8)
          goto LABEL_5;
LABEL_8:
        v18 = !self->_hasBackground;
        v19 = 15.0;
        v20 = 0.0;
        goto LABEL_9;
      }
    }
  }
  if (!v8)
    goto LABEL_8;
LABEL_5:
  v17 = 12.0;
  if (objc_msgSend(v7, "elementType") == 131)
    goto LABEL_12;
  v18 = objc_msgSend(v8, "elementType") == 131;
  v19 = 10.0;
  v20 = 12.0;
LABEL_9:
  if (v18)
    v17 = v20;
  else
    v17 = v19;
LABEL_12:

  return v17;
}

- (SKUIViewElementLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (SKUICardViewElement)cardViewElement
{
  return self->_cardViewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_cardViewElement, 0);
}

+ (void)allowsViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)layoutWithCardViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)bottomInsetForLastViewElement:(uint64_t)a3 width:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)layoutStyle
{
  OUTLINED_FUNCTION_1();
}

- (void)sizeForViewElement:(uint64_t)a3 width:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)topInsetForViewElement:(uint64_t)a3 previousViewElement:(uint64_t)a4 width:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
