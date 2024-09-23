@implementation UIWTInputViewSetPlacementController

- (void)animateTrackingElementsFromStart:(CGRect)a3 toEnd:(CGRect)a4 forShow:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  -[UIWTInputViewSetPlacementController _keyboardTrackingCoordinator](self, "_keyboardTrackingCoordinator");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "animateTrackingElementsFromStart:toEnd:duration:forShow:", v5, v13, v12, v11, v10, x, y, width, height, _UISheetTransitionDuration());

}

- (id)_keyboardTrackingCoordinator
{
  void *v2;
  void *v3;
  void *v4;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardTrackingCoordinator trackingCoordinatorForScene:](UIKeyboardTrackingCoordinator, "trackingCoordinatorForScene:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)startShowForOnScreenFrame:(CGRect)a3
{
  -[UIWTInputViewSetPlacementController _postNotificationsForType:onScreenFrame:forStart:](self, "_postNotificationsForType:onScreenFrame:forStart:", 2, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)endShowOnScreenFrame:(CGRect)a3
{
  -[UIWTInputViewSetPlacementController _postNotificationsForType:onScreenFrame:forStart:](self, "_postNotificationsForType:onScreenFrame:forStart:", 2, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)startHideOnScreenFrame:(CGRect)a3
{
  -[UIWTInputViewSetPlacementController _postNotificationsForType:onScreenFrame:forStart:](self, "_postNotificationsForType:onScreenFrame:forStart:", 3, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)endHideOnScreenFrame:(CGRect)a3
{
  -[UIWTInputViewSetPlacementController _postNotificationsForType:onScreenFrame:forStart:](self, "_postNotificationsForType:onScreenFrame:forStart:", 3, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)startFrameChange:(CGRect)a3 to:(CGRect)a4
{
  -[UIWTInputViewSetPlacementController _postNotificationsForType:from:to:forStart:](self, "_postNotificationsForType:from:to:forStart:", 1, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)endFrameChange:(CGRect)a3 to:(CGRect)a4
{
  -[UIWTInputViewSetPlacementController _postNotificationsForType:from:to:forStart:](self, "_postNotificationsForType:from:to:forStart:", 1, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)_postNotificationsForType:(unint64_t)a3 from:(CGRect)a4 to:(CGRect)a5 forStart:(BOOL)a6
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
  UIInputViewSetNotificationInfo *v16;
  id v17;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.size.height;
  v12 = a4.size.width;
  v13 = a4.origin.y;
  v14 = a4.origin.x;
  -[UIWTInputViewSetPlacementController _inputWindowController](self, "_inputWindowController");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(UIInputViewSetNotificationInfo);
  -[UIInputViewSetNotificationInfo populateStartInfoWithFrame:](v16, "populateStartInfoWithFrame:", v14, v13, v12, v11);
  -[UIInputViewSetNotificationInfo populateEndInfoWithFrame:](v16, "populateEndInfoWithFrame:", x, y, width, height);
  -[UIInputViewSetNotificationInfo addKeyboardNotificationDebuggingInfo:](v16, "addKeyboardNotificationDebuggingInfo:", CFSTR("WTWritingToolsViewController"));
  -[UIInputViewSetNotificationInfo setForWritingToolsSheet:](v16, "setForWritingToolsSheet:", 1);
  if (v6)
  {
    objc_msgSend(v17, "postStartNotifications:withInfo:", a3, v16);
    objc_msgSend(v17, "keyboardMoveOfType:info:", a3, v16);
  }
  else
  {
    objc_msgSend(v17, "postEndNotifications:withInfo:", a3, v16);
  }

}

- (void)_postNotificationsForType:(unint64_t)a3 onScreenFrame:(CGRect)a4 forStart:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v17;
  id v18;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWTInputViewSetPlacementController.m"), 77, CFSTR("Invalid arguments."));

  }
  -[UIWTInputViewSetPlacementController _inputWindowController](self, "_inputWindowController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
    v12 = 0.0;
  else
    v12 = height;
  if (a3 == 2)
    v13 = y + height;
  else
    v13 = y;
  if (a3 == 2)
    v14 = y;
  else
    v14 = y + height;
  if (a3 == 2)
    v15 = height;
  else
    v15 = 0.0;
  -[UIWTInputViewSetPlacementController _postNotificationsForType:from:to:forStart:](self, "_postNotificationsForType:from:to:forStart:", a3, v5, x, v13, width, v12, x, v14, width, v15);

}

- (id)_inputWindowController
{
  void *v4;
  void *v5;
  void *v7;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "existingContainerRootController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWTInputViewSetPlacementController.m"), 90, CFSTR("Missing input window."));

  }
  return v5;
}

@end
