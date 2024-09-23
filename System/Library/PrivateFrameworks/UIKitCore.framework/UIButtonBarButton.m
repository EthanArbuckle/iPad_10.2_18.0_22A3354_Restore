@implementation UIButtonBarButton

id __36___UIButtonBarButton_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_UIButtonBarButton;
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

UISpringLoadedInteraction *__38___UIButtonBarButton_setSpringLoaded___block_invoke(uint64_t a1)
{
  UISpringLoadedInteraction *v2;
  void *v3;
  void *v4;
  UISpringLoadedInteraction *v5;

  v2 = [UISpringLoadedInteraction alloc];
  objc_msgSend(*(id *)(a1 + 32), "buttonSpringLoadedInteractionBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "buttonSpringLoadedInteractionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UISpringLoadedInteraction initWithInteractionBehavior:interactionEffect:activationHandler:](v2, "initWithInteractionBehavior:interactionEffect:activationHandler:", v3, v4, &__block_literal_global_147);

  return v5;
}

void __38___UIButtonBarButton_setSpringLoaded___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendActionsForControlEvents:", 64);

}

uint64_t __76___UIButtonBarButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __49___UIButtonBarButton__applyDeferredSymbolEffects__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  const char *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (a2 == (void *)2)
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (v9)
      {
        __UIFaultDebugAssertLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          v19 = 138412290;
          v20 = v9;
          _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Deferred RemoveAll operation found non-nil effect %@", (uint8_t *)&v19, 0xCu);
        }

      }
    }
    else if (v9)
    {
      v16 = qword_1ECD7B700;
      if (!qword_1ECD7B700)
      {
        v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD7B700);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = 138412290;
        v20 = v9;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Deferred RemoveAll operation found non-nil effect %@", (uint8_t *)&v19, 0xCu);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "removeAllSymbolEffectsWithOptions:animated:", v10, a5);
  }
  else if (a2 == (void *)1)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeSymbolEffectOfType:options:animated:", v9, v10, a5);
  }
  else if (a2)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v18 = "no";
        v19 = 134218754;
        v20 = a2;
        v21 = 2112;
        if ((_DWORD)a5)
          v18 = "yes";
        v22 = v9;
        v23 = 2112;
        v24 = v10;
        v25 = 2080;
        v26 = v18;
        _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Operation %li encountered while trying to apply deferred symbol effects (effect=%@, options=%@, animated=%s)", (uint8_t *)&v19, 0x2Au);
      }

    }
    else
    {
      v11 = qword_1ECD7B708;
      if (!qword_1ECD7B708)
      {
        v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&qword_1ECD7B708);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = "no";
        v19 = 134218754;
        v20 = a2;
        v21 = 2112;
        if ((_DWORD)a5)
          v13 = "yes";
        v22 = v9;
        v23 = 2112;
        v24 = v10;
        v25 = 2080;
        v26 = v13;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Operation %li encountered while trying to apply deferred symbol effects (effect=%@, options=%@, animated=%s)", (uint8_t *)&v19, 0x2Au);
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addSymbolEffect:options:animated:", v9, v10, a5);
  }

}

@end
