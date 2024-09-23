@implementation UIInputViewSetPlacementInvisibleForFloatingTransition

+ (id)placementWithPlacement:(id)a3
{
  return (id)objc_msgSend(a1, "placementWithPlacement:forFloatingAssistantViewTransition:", a3, 0);
}

+ (id)placementWithPlacement:(id)a3 forFloatingAssistantViewTransition:(BOOL)a4
{
  id v7;
  id v8;
  _BYTE *v9;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((objc_msgSend(v7, "isVisible") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = 136315138;
        v15 = "+[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:forFloatingAssistantViewTransition:]";
        _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "%s: Should not be called with an invisible placement", (uint8_t *)&v14, 0xCu);
      }

    }
    else
    {
      v11 = placementWithPlacement_forFloatingAssistantViewTransition____s_category;
      if (!placementWithPlacement_forFloatingAssistantViewTransition____s_category)
      {
        v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&placementWithPlacement_forFloatingAssistantViewTransition____s_category);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = 136315138;
        v15 = "+[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:forFloatingAssistantViewTransition:]";
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "%s: Should not be called with an invisible placement", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)v8 + 5, a3);
    v9[48] = a4;
  }

  return v9;
}

- (BOOL)isHiddenForFloatingTransition
{
  return 1;
}

- (BOOL)showsEditItems
{
  objc_super v3;

  if (self->_isFloatingAssistantView)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)UIInputViewSetPlacementInvisibleForFloatingTransition;
  return -[UIInputViewSetPlacementWrapper showsEditItems](&v3, sel_showsEditItems);
}

- (id)assistantView
{
  return -[UIInputViewSetPlacement assistantView](self->super.super._actualPlacement, "assistantView");
}

- (BOOL)isFloatingAssistantView
{
  return self->_isFloatingAssistantView;
}

@end
