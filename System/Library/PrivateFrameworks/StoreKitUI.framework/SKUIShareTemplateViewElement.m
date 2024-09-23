@implementation SKUIShareTemplateViewElement

- (NSArray)activities
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIShareTemplateViewElement activities].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__SKUIShareTemplateViewElement_activities__block_invoke;
  v14[3] = &unk_1E73A12A8;
  v12 = v11;
  v15 = v12;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v14);

  return (NSArray *)v12;
}

void __42__SKUIShareTemplateViewElement_activities__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 116)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)activityForShareSheetActivityType:(id)a3
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
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIShareTemplateViewElement activityForShareSheetActivityType:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIShareTemplateViewElement activities](self, "activities");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v17, "activityType", (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "isEqualToString:", v4))
        {
          v14 = v17;

          goto LABEL_15;
        }

      }
      v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_15:

  return v14;
}

- (id)activityForUIActivityType:(id)a3
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
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIShareTemplateViewElement activityForUIActivityType:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  SKUIShareSheetActivityTypeForUIActivityType(v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIShareTemplateViewElement activities](self, "activities");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v20, "activityType", (_QWORD)v27);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "isEqualToString:", CFSTR("*")))
        {
          v22 = v20;

          v17 = v22;
        }
        if (objc_msgSend(v21, "isEqualToString:", v13))
        {
          v23 = v20;

          goto LABEL_19;
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v16)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
  v23 = 0;
LABEL_19:

  if (v23)
    v24 = v23;
  else
    v24 = v17;
  v25 = v24;

  return v25;
}

- (void)activities
{
  OUTLINED_FUNCTION_1();
}

- (void)activityForShareSheetActivityType:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)activityForUIActivityType:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
