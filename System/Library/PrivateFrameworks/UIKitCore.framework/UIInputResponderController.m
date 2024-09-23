@implementation UIInputResponderController

- (void)assertNo
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v4, OS_LOG_TYPE_FAULT, "A UIInputResponderController instance will never be created.", buf, 2u);
    }

  }
  else
  {
    v2 = assertNo___s_category;
    if (!assertNo___s_category)
    {
      v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&assertNo___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "A UIInputResponderController instance will never be created.", v5, 2u);
    }
  }
}

- (CGRect)visibleFrameInView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIInputResponderController assertNo](self, "assertNo", a3);
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)visibleInputViewFrameInView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIInputResponderController assertNo](self, "assertNo", a3);
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)verticalOverlapForView:(id)a3 usingKeyboardInfo:(id)a4
{
  -[UIInputResponderController assertNo](self, "assertNo", a3, a4);
  return 0.0;
}

- (id)_textInputSessionAnalytics
{
  -[UIInputResponderController assertNo](self, "assertNo");
  return 0;
}

+ (id)activeInputResponderController
{
  return +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
}

+ (int64_t)interfaceOrientation
{
  return +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation");
}

+ (void)setInterfaceOrientation:(int64_t)a3
{
  +[UIKeyboardSceneDelegate setInterfaceOrientation:](UIKeyboardSceneDelegate, "setInterfaceOrientation:", a3);
}

+ (void)performOnControllers:(id)a3
{
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", a3);
}

- (UIWindowScene)scene
{
  return self->_scene;
}

- (UIResponder)responder
{
  return self->_responder;
}

- (BOOL)isOnScreen
{
  return self->_isOnScreen;
}

- (BOOL)automaticAppearanceEnabled
{
  return self->_automaticAppearanceEnabled;
}

- (void)setAutomaticAppearanceEnabled:(BOOL)a3
{
  self->_automaticAppearanceEnabled = a3;
}

- (BOOL)shouldSuppressInputAssistantUpdates
{
  return self->_shouldSuppressInputAssistantUpdates;
}

- (void)setShouldSuppressInputAssistantUpdates:(BOOL)a3
{
  self->_shouldSuppressInputAssistantUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
