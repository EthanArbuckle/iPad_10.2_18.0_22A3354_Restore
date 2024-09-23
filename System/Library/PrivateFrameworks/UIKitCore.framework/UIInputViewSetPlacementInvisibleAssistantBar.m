@implementation UIInputViewSetPlacementInvisibleAssistantBar

+ (id)placementWithPlacement:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isVisible") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v12 = 136315138;
        v13 = "+[UIInputViewSetPlacementInvisibleAssistantBar placementWithPlacement:]";
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "%s: Should not be called with an invisible placement", (uint8_t *)&v12, 0xCu);
      }

    }
    else
    {
      v9 = placementWithPlacement____s_category_327;
      if (!placementWithPlacement____s_category_327)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&placementWithPlacement____s_category_327);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315138;
        v13 = "+[UIInputViewSetPlacementInvisibleAssistantBar placementWithPlacement:]";
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "%s: Should not be called with an invisible placement", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  v6 = (id *)objc_alloc_init((Class)a1);
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 5, a3);

  return v7;
}

- (id)applicatorInfoForOwner:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BYTE v13[48];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E08];
  -[UIInputViewSetPlacement applicatorInfoForOwner:](self->super.super._actualPlacement, "applicatorInfoForOwner:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectsForKeys:", &unk_1E1A94130);
  v14[0] = CFSTR("AlphaForAssistantBar");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[UIInputViewSetPlacementInvisible alpha](self, "alpha");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v14[1] = CFSTR("TransformForAssistantBar");
  v9 = (void *)MEMORY[0x1E0CB3B18];
  -[UIInputViewSetPlacementInvisible transform](self, "transform");
  objc_msgSend(v9, "valueWithCGAffineTransform:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v11);

  return v6;
}

- (BOOL)isFloatingAssistantView
{
  return -[UIInputViewSetPlacement isFloatingAssistantView](self->super.super._actualPlacement, "isFloatingAssistantView");
}

- (BOOL)isCompactAssistantView
{
  return -[UIInputViewSetPlacement isCompactAssistantView](self->super.super._actualPlacement, "isCompactAssistantView");
}

@end
