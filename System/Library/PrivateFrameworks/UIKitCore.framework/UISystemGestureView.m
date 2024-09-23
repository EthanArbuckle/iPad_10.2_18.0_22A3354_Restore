@implementation UISystemGestureView

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y;
  double x;
  id v10;
  void *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  -[UIView window](self, "window");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == a5)
  {
    v13.receiver = self;
    v13.super_class = (Class)UISystemGestureView;
    -[UIView _hitTest:withEvent:windowServerHitTestWindow:](&v13, sel__hitTest_withEvent_windowServerHitTestWindow_, a4, a5, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  UISystemGestureView *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      goto LABEL_7;
    v10 = -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled");
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v13 = "-[UISystemGestureView setUserInteractionEnabled:]";
    v14 = 1024;
    v15 = v10;
    v16 = 1024;
    v17 = v3;
    v18 = 2112;
    v19 = self;
    v20 = 2112;
    v21 = v9;
    _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "%s: Modifying userInteractionEnabled is not supported: old: %d; new: %d; self: %@; \n%@",
      buf,
      0x2Cu);
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  v5 = setUserInteractionEnabled____s_category;
  if (!setUserInteractionEnabled____s_category)
  {
    v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&setUserInteractionEnabled____s_category);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    v8 = -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled");
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v13 = "-[UISystemGestureView setUserInteractionEnabled:]";
    v14 = 1024;
    v15 = v8;
    v16 = 1024;
    v17 = v3;
    v18 = 2112;
    v19 = self;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "%s: Modifying userInteractionEnabled is not supported: old: %d; new: %d; self: %@; \n%@",
      buf,
      0x2Cu);
    goto LABEL_6;
  }
LABEL_8:
  v11.receiver = self;
  v11.super_class = (Class)UISystemGestureView;
  -[UIView setUserInteractionEnabled:](&v11, sel_setUserInteractionEnabled_, v3);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canResignFirstResponder
{
  return 0;
}

- (BOOL)_canChangeFirstResponder:(id)a3 toResponder:(id)a4
{
  return 0;
}

- (CGRect)_responderSelectionRectForWindow:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end
