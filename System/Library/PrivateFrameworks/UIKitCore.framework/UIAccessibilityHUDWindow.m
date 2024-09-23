@implementation UIAccessibilityHUDWindow

+ (UIAccessibilityHUDWindow)sharedWindow
{
  return (UIAccessibilityHUDWindow *)(id)_SharedWindow;
}

+ (void)createSharedWindowWithScene:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = (void *)_SharedWindow;
  if (_SharedWindow)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Attempted to create shared Accessibility HUD window when one was already present", v10, 2u);
      v5 = (void *)_SharedWindow;
    }
    objc_msgSend(v5, "setHidden:", 1);
  }
  v6 = objc_msgSend(objc_alloc((Class)a1), "initWithWindowScene:", v4);
  v7 = (void *)_SharedWindow;
  _SharedWindow = v6;

  objc_msgSend((id)_SharedWindow, "setWindowLevel:", 10000002.0);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setSizesWindowToScene:", 1);
  +[UIColor clearColor](UIColor, "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_SharedWindow, "setBackgroundColor:", v9);

  objc_msgSend((id)_SharedWindow, "setRootViewController:", v8);
}

+ (void)removeSharedWindow
{
  void *v2;

  v2 = (void *)_SharedWindow;
  _SharedWindow = 0;

}

@end
