@implementation UIFocusMovementAction

- (UIFocusMovementAction)initWithFocusMovementInfo:(id)a3
{
  id v4;
  void *v5;
  UIFocusMovementAction *v6;

  v4 = a3;
  +[_UIFocusInputDeviceInfo infoWithSenderID:](_UIFocusInputDeviceInfo, "infoWithSenderID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIFocusMovementAction initWithFocusMovementInfo:inputDeviceInfo:shouldPerformHapticFeedback:](self, "initWithFocusMovementInfo:inputDeviceInfo:shouldPerformHapticFeedback:", v4, v5, 0);

  return v6;
}

- (UIFocusMovementAction)initWithFocusMovementInfo:(id)a3 inputDeviceInfo:(id)a4 shouldPerformHapticFeedback:(BOOL)a5
{
  return -[UIFocusMovementAction initWithFocusMovementInfo:inputDeviceInfo:shouldPerformHapticFeedback:focusedFrameInSceneCoordinateSpace:](self, "initWithFocusMovementInfo:inputDeviceInfo:shouldPerformHapticFeedback:focusedFrameInSceneCoordinateSpace:", a3, a4, a5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (UIFocusMovementAction)initWithFocusMovementInfo:(id)a3 inputDeviceInfo:(id)a4 shouldPerformHapticFeedback:(BOOL)a5 focusedFrameInSceneCoordinateSpace:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  UIFocusMovementAction *v19;
  objc_super v21;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5;
  v13 = (objc_class *)MEMORY[0x1E0D017D0];
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(v13);
  objc_msgSend(v16, "setObject:forSetting:", v15, 1);

  objc_msgSend(v16, "setObject:forSetting:", v14, 2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forSetting:", v17, 3);

  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", x, y, width, height);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forSetting:", v18, 4);

  v21.receiver = self;
  v21.super_class = (Class)UIFocusMovementAction;
  v19 = -[UIFocusMovementAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v21, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v16, 0, 0, 0.0);

  return v19;
}

- (_UIFocusMovementInfo)focusMovementInfo
{
  void *v2;
  void *v3;

  -[UIFocusMovementAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIFocusMovementInfo *)v3;
}

- (_UIFocusInputDeviceInfo)inputDeviceInfo
{
  void *v2;
  void *v3;

  -[UIFocusMovementAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIFocusInputDeviceInfo *)v3;
}

- (BOOL)shouldPerformHapticFeedback
{
  void *v2;
  void *v3;
  char v4;

  -[UIFocusMovementAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (CGRect)focusedFrame
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UIFocusMovementAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (int64_t)UIActionType
{
  return 24;
}

@end
