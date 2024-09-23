@implementation _UIOClientAction

- (void)handleClientActionToOverlayService:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  int v10;
  void *v11;
  __int16 v12;
  _UIOClientAction *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      goto LABEL_7;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2048;
    v13 = self;
    _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "_UIOClientAction subclass <%@: %p> did not override -handleClientActionToOverlayService:", (uint8_t *)&v10, 0x16u);
LABEL_6:

LABEL_7:
    return;
  }
  v4 = handleClientActionToOverlayService____s_category;
  if (!handleClientActionToOverlayService____s_category)
  {
    v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&handleClientActionToOverlayService____s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "_UIOClientAction subclass <%@: %p> did not override -handleClientActionToOverlayService:", (uint8_t *)&v10, 0x16u);
    goto LABEL_6;
  }
}

@end
