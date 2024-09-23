@implementation UIKeyboardTrackingCoordinator

- (UIKeyboardTrackingCoordinator)initWithWindowScene:(id)a3
{
  id v4;
  UIKeyboardTrackingCoordinator *v5;
  void *v6;
  uint64_t v7;
  UIInputWindowController *controllerForTrackingElements;
  CGSize v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardTrackingCoordinator;
  v5 = -[UIKeyboardTrackingCoordinator init](&v11, sel_init);
  if (v5)
  {
    +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:](UITextEffectsWindow, "activeTextEffectsWindowForWindowScene:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v7 = objc_claimAutoreleasedReturnValue();
    controllerForTrackingElements = v5->_controllerForTrackingElements;
    v5->_controllerForTrackingElements = (UIInputWindowController *)v7;

    v9 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v5->_lastSentEndFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v5->_lastSentEndFrame.size = v9;

  }
  return v5;
}

+ (id)trackingCoordinatorForScene:(id)a3
{
  id v3;
  UIKeyboardTrackingCoordinator *v4;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v3)
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "UIKeyboardTrackingCoordinator requires a valid windowScene", buf, 2u);
      }

    }
  }
  else if (!v3)
  {
    v7 = trackingCoordinatorForScene____s_category;
    if (!trackingCoordinatorForScene____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&trackingCoordinatorForScene____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "UIKeyboardTrackingCoordinator requires a valid windowScene", v9, 2u);
    }
  }
  v4 = -[UIKeyboardTrackingCoordinator initWithWindowScene:]([UIKeyboardTrackingCoordinator alloc], "initWithWindowScene:", v3);

  return v4;
}

- (CGRect)previousEndFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastSentEndFrame.origin.x;
  y = self->_lastSentEndFrame.origin.y;
  width = self->_lastSentEndFrame.size.width;
  height = self->_lastSentEndFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)notificationInfoForStartFrame:(CGRect)a3 endFrame:(CGRect)a4 animationDuration:(double)a5
{
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double height;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  +[UIInputViewSetNotificationInfo info](UIInputViewSetNotificationInfo, "info");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "populateStartInfoWithFrame:", v11, v10, v9, v8);
  objc_msgSend(v12, "populateEndInfoWithFrame:", x, y, width, height);
  +[UIInputViewAnimationStyle animationStyleAnimated:duration:](UIInputViewAnimationStyle, "animationStyleAnimated:duration:", a5 > 0.0, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "populateWithAnimationStyle:", v13);

  objc_msgSend(v12, "addKeyboardNotificationDebuggingInfo:", CFSTR("UIKeyboardTrackingCoordinator"));
  return v12;
}

- (void)animateTrackingElementsFromStart:(CGRect)a3 toEnd:(CGRect)a4 duration:(double)a5 forShow:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  int has_internal_diagnostics;
  _BOOL4 IsDiscrete;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v6 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.size.height;
  v12 = a3.size.width;
  v13 = a3.origin.y;
  v14 = a3.origin.x;
  v30 = *MEMORY[0x1E0C80C00];
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  IsDiscrete = UIRectIsDiscrete(v14, v13, v12, v11);
  if (has_internal_diagnostics)
  {
    if (IsDiscrete && UIRectIsDiscrete(x, y, width, height))
      goto LABEL_4;
    __UIFaultDebugAssertLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_13;
    v33.origin.x = v14;
    v33.origin.y = v13;
    v33.size.width = v12;
    v33.size.height = v11;
    NSStringFromCGRect(v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    NSStringFromCGRect(v34);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v24;
    v28 = 2112;
    v29 = v25;
    _os_log_fault_impl(&dword_185066000, v23, OS_LOG_TYPE_FAULT, "Both startFrame and endFrame must be valid rects to animate keyboard tracking elements. Start %@ End %@", buf, 0x16u);
LABEL_12:

LABEL_13:
    goto LABEL_4;
  }
  if (!IsDiscrete || !UIRectIsDiscrete(x, y, width, height))
  {
    v21 = animateTrackingElementsFromStart_toEnd_duration_forShow____s_category;
    if (!animateTrackingElementsFromStart_toEnd_duration_forShow____s_category)
    {
      v21 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v21, (unint64_t *)&animateTrackingElementsFromStart_toEnd_duration_forShow____s_category);
    }
    v22 = *(NSObject **)(v21 + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = v22;
      v31.origin.x = v14;
      v31.origin.y = v13;
      v31.size.width = v12;
      v31.size.height = v11;
      NSStringFromCGRect(v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      NSStringFromCGRect(v32);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v24;
      v28 = 2112;
      v29 = v25;
      _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Both startFrame and endFrame must be valid rects to animate keyboard tracking elements. Start %@ End %@", buf, 0x16u);
      goto LABEL_12;
    }
  }
LABEL_4:
  -[UIKeyboardTrackingCoordinator notificationInfoForStartFrame:endFrame:animationDuration:](self, "notificationInfoForStartFrame:endFrame:animationDuration:", v14, v13, v12, v11, x, y, width, height, *(_QWORD *)&a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lastSentEndFrame.origin.x = x;
  self->_lastSentEndFrame.origin.y = y;
  if (v6)
    v19 = 2;
  else
    v19 = 3;
  self->_lastSentEndFrame.size.width = width;
  self->_lastSentEndFrame.size.height = height;
  -[UIKeyboardTrackingCoordinator controllerForTrackingElements](self, "controllerForTrackingElements");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "animateKeyboardTrackingElementsWithNotificationInfo:notificationType:updateForStart:updateForEnd:", v18, v19, 1, 1);

}

- (void)moveKeyboardTrackingElementsFromStartFrame:(CGRect)a3 endFrame:(CGRect)a4 duration:(double)a5 isStart:(BOOL)a6 forShow:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  double v15;
  double v16;
  int has_internal_diagnostics;
  _BOOL4 IsDiscrete;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v7 = a7;
  v8 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3.size.height;
  v14 = a3.size.width;
  v15 = a3.origin.y;
  v16 = a3.origin.x;
  v32 = *MEMORY[0x1E0C80C00];
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  IsDiscrete = UIRectIsDiscrete(v16, v15, v14, v13);
  if (has_internal_diagnostics)
  {
    if (IsDiscrete && UIRectIsDiscrete(x, y, width, height))
      goto LABEL_4;
    __UIFaultDebugAssertLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_13;
    v35.origin.x = v16;
    v35.origin.y = v15;
    v35.size.width = v14;
    v35.size.height = v13;
    NSStringFromCGRect(v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    NSStringFromCGRect(v36);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = v26;
    v30 = 2112;
    v31 = v27;
    _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "Both startFrame and endFrame must be valid rects to move keyboard tracking elements. Start %@ End %@", buf, 0x16u);
LABEL_12:

LABEL_13:
    goto LABEL_4;
  }
  if (!IsDiscrete || !UIRectIsDiscrete(x, y, width, height))
  {
    v23 = moveKeyboardTrackingElementsFromStartFrame_endFrame_duration_isStart_forShow____s_category;
    if (!moveKeyboardTrackingElementsFromStartFrame_endFrame_duration_isStart_forShow____s_category)
    {
      v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v23, (unint64_t *)&moveKeyboardTrackingElementsFromStartFrame_endFrame_duration_isStart_forShow____s_category);
    }
    v24 = *(NSObject **)(v23 + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = v24;
      v33.origin.x = v16;
      v33.origin.y = v15;
      v33.size.width = v14;
      v33.size.height = v13;
      NSStringFromCGRect(v33);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      NSStringFromCGRect(v34);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v26;
      v30 = 2112;
      v31 = v27;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Both startFrame and endFrame must be valid rects to move keyboard tracking elements. Start %@ End %@", buf, 0x16u);
      goto LABEL_12;
    }
  }
LABEL_4:
  -[UIKeyboardTrackingCoordinator notificationInfoForStartFrame:endFrame:animationDuration:](self, "notificationInfoForStartFrame:endFrame:animationDuration:", v16, v15, v14, v13, x, y, width, height, *(_QWORD *)&a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lastSentEndFrame.origin.x = x;
  self->_lastSentEndFrame.origin.y = y;
  if (v7)
    v21 = 2;
  else
    v21 = 3;
  self->_lastSentEndFrame.size.width = width;
  self->_lastSentEndFrame.size.height = height;
  -[UIKeyboardTrackingCoordinator controllerForTrackingElements](self, "controllerForTrackingElements");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "animateKeyboardTrackingElementsWithNotificationInfo:notificationType:updateForStart:updateForEnd:", v20, v21, v8, v8 ^ 1);

}

- (UIInputWindowController)controllerForTrackingElements
{
  return self->_controllerForTrackingElements;
}

- (void)setControllerForTrackingElements:(id)a3
{
  objc_storeStrong((id *)&self->_controllerForTrackingElements, a3);
}

- (CGRect)lastSentEndFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastSentEndFrame.origin.x;
  y = self->_lastSentEndFrame.origin.y;
  width = self->_lastSentEndFrame.size.width;
  height = self->_lastSentEndFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastSentEndFrame:(CGRect)a3
{
  self->_lastSentEndFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerForTrackingElements, 0);
}

@end
