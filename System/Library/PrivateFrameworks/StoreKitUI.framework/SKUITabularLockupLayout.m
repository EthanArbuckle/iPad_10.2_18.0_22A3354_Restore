@implementation SKUITabularLockupLayout

- (SKUITabularLockupLayout)initWithLockup:(id)a3 context:(id)a4
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUITabularLockupLayout *v14;
  SKUITabularLockupColumn *v15;
  SKUITabularLockupColumn *v16;
  SKUITabularLockupColumn *v17;
  uint64_t v18;
  NSArray *columns;
  _QWORD v21[4];
  SKUITabularLockupLayout *v22;
  objc_super v23;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUITabularLockupLayout initWithLockup:context:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUITabularLockupLayout;
  v14 = -[SKUITabularLockupLayout init](&v23, sel_init);
  if (v14)
  {
    v15 = -[SKUITabularLockupColumn initWithColumnIdentifier:]([SKUITabularLockupColumn alloc], "initWithColumnIdentifier:", 0);
    v16 = -[SKUITabularLockupColumn initWithColumnIdentifier:]([SKUITabularLockupColumn alloc], "initWithColumnIdentifier:", 1);
    v17 = -[SKUITabularLockupColumn initWithColumnIdentifier:]([SKUITabularLockupColumn alloc], "initWithColumnIdentifier:", 2);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v15, v16, v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    columns = v14->_columns;
    v14->_columns = (NSArray *)v18;

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __50__SKUITabularLockupLayout_initWithLockup_context___block_invoke;
    v21[3] = &unk_1E73A12A8;
    v22 = v14;
    objc_msgSend(v5, "enumerateChildrenUsingBlock:", v21);

  }
  return v14;
}

void __50__SKUITabularLockupLayout_initWithLockup_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SKUIViewElementAlignmentForStyle(v3);
  if (objc_msgSend(v7, "elementType") == 138)
  {
    if (v4 == 3)
      v5 = 2;
    else
      v5 = v4 == 2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_addChildViewElement:", v7);

  }
}

+ (id)fontForLabelViewElement:(id)a3 context:(id)a4
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
  unint64_t v17;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUITabularLockupLayout fontForLabelViewElement:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_msgSend(v5, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = objc_msgSend(v5, "labelViewStyle");
    if (v17 > 5)
    {
      v16 = 0;
    }
    else
    {
      if (((1 << v17) & 0x1B) != 0)
      {
        if (objc_msgSend(v6, "containerViewElementType") == 118)
          v18 = 8;
        else
          v18 = 7;
      }
      else if (objc_msgSend(v6, "containerViewElementType") == 118)
      {
        v18 = 6;
      }
      else
      {
        v18 = 19;
      }
      SKUIFontLimitedPreferredFontForTextStyle(v18, 5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v16;
}

- (void)sizeColumnsToFitWidth:(double)a3 context:(id)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_columns;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "childViewElements", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "sizeForViewElement:width:", v14, a3);
        objc_msgSend(v12, "setSize:");

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (NSArray)columns
{
  return self->_columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

- (void)initWithLockup:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)fontForLabelViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
