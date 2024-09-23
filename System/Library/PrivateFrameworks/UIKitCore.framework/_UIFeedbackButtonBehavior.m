@implementation _UIFeedbackButtonBehavior

+ (id)buttonBehaviorWithStyle:(int64_t)a3 coordinateSpace:(id)a4
{
  id v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v7 = a4;
  _UIIsPrivateMainBundle();
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIButtonFeedbackGenerator.m"), 177, CFSTR("Use of _UIFeedbackButtonBehavior methods have been deprecated since iOS 10 and will be removed in a future version. Update to view-based _UIFeedbackButtonGenerator methods."));

  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "Use of _UIFeedbackButtonBehavior methods have been deprecated since iOS 10 and will be removed in a future version. Update to view-based _UIFeedbackButtonGenerator methods.  This will become an assert in a future version.", buf, 2u);
    }

  }
  else
  {
    v9 = buttonBehaviorWithStyle_coordinateSpace____s_category;
    if (!buttonBehaviorWithStyle_coordinateSpace____s_category)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&buttonBehaviorWithStyle_coordinateSpace____s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Use of _UIFeedbackButtonBehavior methods have been deprecated since iOS 10 and will be removed in a future version. Update to view-based _UIFeedbackButtonGenerator methods.  This will become an assert in a future version.", v14, 2u);
    }
  }
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:coordinateSpace:", a3, v7);

  return v11;
}

@end
