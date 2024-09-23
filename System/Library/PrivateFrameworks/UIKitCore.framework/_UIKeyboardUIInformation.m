@implementation _UIKeyboardUIInformation

- (BOOL)keyboardOnScreen
{
  return self->_keyboardOnScreen;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGRect)keyboardPosition
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_keyboardPosition, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *applicationIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  applicationIdentifier = self->_applicationIdentifier;
  v15 = a3;
  objc_msgSend(v15, "encodeObject:forKey:", applicationIdentifier, CFSTR("ApplicationIdentifier"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("BundleIdentifier"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_animationFence, CFSTR("AnimationFence"));
  v5 = (void *)MEMORY[0x1E0CB3B18];
  -[_UIKeyboardUIInformation keyboardPosition](self, "keyboardPosition");
  objc_msgSend(v5, "valueWithCGRect:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("Position"));

  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation keyboardOnScreen](self, "keyboardOnScreen"), CFSTR("OnScreen"));
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation assistantBarVisible](self, "assistantBarVisible"), CFSTR("AssistantVisible"));
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation requiresHeightForIntegratedAssistantBar](self, "requiresHeightForIntegratedAssistantBar"), CFSTR("IntegratedAssistant"));
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation animated](self, "animated"), CFSTR("Animated"));
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation tracking](self, "tracking"), CFSTR("Tracking"));
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation resizing](self, "resizing"), CFSTR("Resizing"));
  objc_msgSend(v15, "encodeInt32:forKey:", -[_UIKeyboardUIInformation orientation](self, "orientation"), CFSTR("Orientation"));
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation isLocal](self, "isLocal"), CFSTR("IsLocal"));
  -[_UIKeyboardUIInformation currentInputMode](self, "currentInputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("CurrentInputMode"));

  objc_msgSend(v15, "encodeInt32:forKey:", -[_UIKeyboardUIInformation uiPosition](self, "uiPosition"), CFSTR("UIPosition"));
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation keyboardScenePresentationMode](self, "keyboardScenePresentationMode") != 0, CFSTR("KeyboardScenePresentationMode"));
  objc_msgSend(v15, "encodeInteger:forKey:", -[_UIKeyboardUIInformation notification](self, "notification"), CFSTR("UIIVSNotificationType"));
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation isStartNotification](self, "isStartNotification"), CFSTR("NotificationIsStartNotification"));
  v8 = (void *)MEMORY[0x1E0CB3B18];
  -[_UIKeyboardUIInformation beginFrame](self, "beginFrame");
  objc_msgSend(v8, "valueWithCGRect:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("NotificationsBeginFrame"));

  v10 = (void *)MEMORY[0x1E0CB3B18];
  -[_UIKeyboardUIInformation endFrame](self, "endFrame");
  objc_msgSend(v10, "valueWithCGRect:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v11, CFSTR("NotificationsEndFrame"));

  -[_UIKeyboardUIInformation duration](self, "duration");
  *(float *)&v12 = v12;
  objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("NotificationsDuration"), v12);
  objc_msgSend(v15, "encodeInteger:forKey:", -[_UIKeyboardUIInformation options](self, "options"), CFSTR("NotificationsAnimationOptions"));
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation changedAccessoryOnly](self, "changedAccessoryOnly"), CFSTR("NotificationsAccessoryChanged"));
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation assistantOnScreenOnly](self, "assistantOnScreenOnly"), CFSTR("NotificationsAssistantPosition"));
  v13 = (void *)MEMORY[0x1E0CB3B18];
  -[_UIKeyboardUIInformation assistantFrame](self, "assistantFrame");
  objc_msgSend(v13, "valueWithCGRect:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("NotificationsAssistantFrame"));

  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation forceNotification](self, "forceNotification"), CFSTR("NotificationsForceNotification"));
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation wasCausedRemotely](self, "wasCausedRemotely"), CFSTR("NotificationsCausedRemotely"));
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation dueToRotation](self, "dueToRotation"), CFSTR("NotificationsDueToRotation"));

}

- (BOOL)assistantBarVisible
{
  return self->_assistantBarVisible;
}

- (unint64_t)uiPosition
{
  return self->_uiPosition;
}

- (unint64_t)notification
{
  return self->_notification;
}

- (BOOL)resizing
{
  return self->_resizing;
}

- (BOOL)wasCausedRemotely
{
  return self->_wasCausedRemotely;
}

- (BOOL)tracking
{
  return self->_tracking;
}

- (BOOL)requiresHeightForIntegratedAssistantBar
{
  return self->_requiresHeightForIntegratedAssistantBar;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)keyboardScenePresentationMode
{
  return self->_keyboardScenePresentationMode;
}

- (BOOL)isStartNotification
{
  return self->_startNotification;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (BOOL)forceNotification
{
  return self->_forceNotification;
}

- (CGRect)endFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_endFrame.origin.x;
  y = self->_endFrame.origin.y;
  width = self->_endFrame.size.width;
  height = self->_endFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)dueToRotation
{
  return self->_dueToRotation;
}

- (NSString)currentInputMode
{
  return self->_currentInputMode;
}

- (BOOL)changedAccessoryOnly
{
  return self->_changedAccessoryOnly;
}

- (CGRect)beginFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_beginFrame.origin.x;
  y = self->_beginFrame.origin.y;
  width = self->_beginFrame.size.width;
  height = self->_beginFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)assistantOnScreenOnly
{
  return self->_assistantOnScreenOnly;
}

- (CGRect)assistantFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_assistantFrame.origin.x;
  y = self->_assistantFrame.origin.y;
  width = self->_assistantFrame.size.width;
  height = self->_assistantFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_currentInputMode, 0);
  objc_storeStrong((id *)&self->_animationFence, 0);
}

- (BKSAnimationFenceHandle)animationFence
{
  return (BKSAnimationFenceHandle *)objc_getProperty(self, a2, 24, 1);
}

- (void)resetAnimationFencing
{
  BKSAnimationFenceHandle *animationFence;

  -[BKSAnimationFenceHandle invalidate](self->_animationFence, "invalidate");
  animationFence = self->_animationFence;
  self->_animationFence = 0;

}

- (_UIKeyboardUIInformation)initWithCoder:(id)a3
{
  id v4;
  _UIKeyboardUIInformation *v5;
  void *v6;
  uint64_t v7;
  NSString *applicationIdentifier;
  uint64_t v9;
  NSString *bundleIdentifier;
  uint64_t v11;
  BKSAnimationFenceHandle *animationFence;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  NSString *currentInputMode;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  float v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  _UIKeyboardUIInformation *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)_UIKeyboardUIInformation;
  v5 = -[_UIKeyboardUIInformation init](&v38, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x186DC9484]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ApplicationIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BundleIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnimationFence"));
    v11 = objc_claimAutoreleasedReturnValue();
    animationFence = v5->_animationFence;
    v5->_animationFence = (BKSAnimationFenceHandle *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Position"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CGRectValue");
    v5->_keyboardPosition.origin.x = v14;
    v5->_keyboardPosition.origin.y = v15;
    v5->_keyboardPosition.size.width = v16;
    v5->_keyboardPosition.size.height = v17;

    v5->_keyboardOnScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OnScreen"));
    v5->_assistantBarVisible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AssistantVisible"));
    v5->_requiresHeightForIntegratedAssistantBar = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IntegratedAssistant"));
    v5->_animated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Animated"));
    v5->_tracking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Tracking"));
    v5->_resizing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Resizing"));
    v5->_orientation = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Orientation"));
    v5->_isLocal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsLocal"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CurrentInputMode"));
    v18 = objc_claimAutoreleasedReturnValue();
    currentInputMode = v5->_currentInputMode;
    v5->_currentInputMode = (NSString *)v18;

    v5->_uiPosition = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("UIPosition"));
    v5->_keyboardScenePresentationMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("KeyboardScenePresentationMode"));
    v5->_notification = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIIVSNotificationType"));
    v5->_startNotification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NotificationIsStartNotification"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NotificationsBeginFrame"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "CGRectValue");
    v5->_beginFrame.origin.x = v21;
    v5->_beginFrame.origin.y = v22;
    v5->_beginFrame.size.width = v23;
    v5->_beginFrame.size.height = v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NotificationsEndFrame"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "CGRectValue");
    v5->_endFrame.origin.x = v26;
    v5->_endFrame.origin.y = v27;
    v5->_endFrame.size.width = v28;
    v5->_endFrame.size.height = v29;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("NotificationsDuration"));
    v5->_duration = v30;
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NotificationsAnimationOptions"));
    v5->_changedAccessoryOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NotificationsAccessoryChanged"));
    v5->_assistantOnScreenOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NotificationsAssistantPosition"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NotificationsAssistantFrame"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "CGRectValue");
    v5->_assistantFrame.origin.x = v32;
    v5->_assistantFrame.origin.y = v33;
    v5->_assistantFrame.size.width = v34;
    v5->_assistantFrame.size.height = v35;

    v5->_forceNotification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NotificationsForceNotification"));
    v5->_wasCausedRemotely = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NotificationsCausedRemotely"));
    v5->_dueToRotation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NotificationsDueToRotation"));
    objc_autoreleasePoolPop(v6);
    v36 = v5;
  }

  return v5;
}

- (void)setAssistantBarVisible:(BOOL)a3
{
  self->_assistantBarVisible = a3;
}

- (_UIKeyboardUIInformation)initWithKeyboardFrame:(CGRect)a3 onScreen:(BOOL)a4 animated:(BOOL)a5 tracking:(BOOL)a6 fence:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  _UIKeyboardUIInformation *v17;
  _UIKeyboardUIInformation *v18;
  void *v19;
  CGPoint v20;
  CGSize v21;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)_UIKeyboardUIInformation;
  v17 = -[_UIKeyboardUIInformation init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_animationFence, a7);
    v18->_keyboardPosition.origin.x = x;
    v18->_keyboardPosition.origin.y = y;
    v18->_keyboardPosition.size.width = width;
    v18->_keyboardPosition.size.height = height;
    v18->_keyboardOnScreen = a4;
    v18->_animated = a5;
    v18->_tracking = a6;
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_orientation = objc_msgSend(v19, "_keyboardOrientation");

    v18->_notification = 0;
    v20 = (CGPoint)*MEMORY[0x1E0C9D648];
    v21 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v18->_beginFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v18->_beginFrame.size = v21;
    v18->_endFrame.origin = v20;
    v18->_endFrame.size = v21;
    v18->_duration = 0.0;
  }

  return v18;
}

- (void)setUiPosition:(unint64_t)a3
{
  self->_uiPosition = a3;
}

- (void)setResizing:(BOOL)a3
{
  self->_resizing = a3;
}

- (_UIKeyboardUIInformation)initWithKeyboardFrame:(CGRect)a3 onScreen:(BOOL)a4 animated:(BOOL)a5 tracking:(BOOL)a6 wantsFence:(BOOL)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  double height;
  double width;
  double y;
  double x;
  void *v16;
  uint64_t v17;
  void *v18;
  _UIKeyboardUIInformation *v19;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_keyboardOrientation");
  if (a7)
  {
    objc_msgSend((id)objc_opt_class(), "animationFence");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:](self, "initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:", v10, v9, v8, v17, v18, x, y, width, height);

  }
  else
  {
    v19 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:](self, "initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:", v10, v9, v8, v17, 0, x, y, width, height);
  }

  return v19;
}

- (_UIKeyboardUIInformation)initWithKeyboardFrame:(CGRect)a3 onScreen:(BOOL)a4 animated:(BOOL)a5 tracking:(BOOL)a6 orientation:(int64_t)a7 fence:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  _UIKeyboardUIInformation *v19;
  _UIKeyboardUIInformation *v20;
  CGPoint v21;
  CGSize v22;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)_UIKeyboardUIInformation;
  v19 = -[_UIKeyboardUIInformation init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_animationFence, a8);
    v20->_keyboardPosition.origin.x = x;
    v20->_keyboardPosition.origin.y = y;
    v20->_keyboardPosition.size.width = width;
    v20->_keyboardPosition.size.height = height;
    v20->_keyboardOnScreen = a4;
    v20->_animated = a5;
    v20->_tracking = a6;
    v20->_orientation = a7;
    v20->_notification = 0;
    v21 = (CGPoint)*MEMORY[0x1E0C9D648];
    v22 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v20->_beginFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v20->_beginFrame.size = v22;
    v20->_endFrame.origin = v21;
    v20->_endFrame.size = v22;
    v20->_duration = 0.0;
  }

  return v20;
}

- (id)description
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  unint64_t uiPosition;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  BKSAnimationFenceHandle *animationFence;
  NSString *bundleIdentifier;
  NSString *applicationIdentifier;
  void *v22;
  void *v23;
  objc_super v24;

  v22 = (void *)MEMORY[0x1E0CB3940];
  v24.receiver = self;
  v24.super_class = (Class)_UIKeyboardUIInformation;
  -[_UIKeyboardUIInformation description](&v24, sel_description);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  applicationIdentifier = self->_applicationIdentifier;
  animationFence = self->_animationFence;
  StringFromCGRect(self->_keyboardPosition.origin.x, self->_keyboardPosition.origin.y, self->_keyboardPosition.size.width, self->_keyboardPosition.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_animated)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (self->_keyboardOnScreen)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (self->_tracking)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (self->_resizing)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (self->_isLocal)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  uiPosition = self->_uiPosition;
  if (uiPosition > 3)
    v10 = 0;
  else
    v10 = off_1E16EDA60[uiPosition];
  v11 = v8;
  v12 = v7;
  v13 = v6;
  v14 = v5;
  v15 = v4;
  if (-[_UIKeyboardUIInformation hasValidNotification](self, "hasValidNotification"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@; appId %@ bundleId %@ animation fence %@; position %@; animated %@; on screen %@; tracking %@; resizing %@; local %@, dock state: %@, hasValidNotif: %@>"),
    v23,
    applicationIdentifier,
    bundleIdentifier,
    animationFence,
    v3,
    v15,
    v14,
    v13,
    v12,
    v11,
    v10,
    v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)hasValidNotification
{
  return -[_UIKeyboardUIInformation notification](self, "notification") != 0;
}

- (_UIKeyboardUIInformation)initWithKeyboardFrame:(CGRect)a3 onScreen:(BOOL)a4 animated:(BOOL)a5 tracking:(BOOL)a6 orientation:(int64_t)a7 wantsFence:(BOOL)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  double height;
  double width;
  double y;
  double x;
  void *v17;
  _UIKeyboardUIInformation *v18;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a8)
  {
    objc_msgSend((id)objc_opt_class(), "animationFence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:](self, "initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:", v11, v10, v9, a7, v17, x, y, width, height);

  }
  else
  {
    v18 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:](self, "initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:", a4, a5, a6, a7, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc((Class)objc_opt_class());
  -[_UIKeyboardUIInformation keyboardPosition](self, "keyboardPosition");
  v5 = (void *)objc_msgSend(v4, "initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:", self->_keyboardOnScreen, self->_animated, self->_tracking, self->_orientation, self->_animationFence);
  objc_msgSend(v5, "setIsLocal:", -[_UIKeyboardUIInformation isLocal](self, "isLocal"));
  -[_UIKeyboardUIInformation currentInputMode](self, "currentInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "setCurrentInputMode:", v7);

  objc_msgSend(v5, "setUiPosition:", -[_UIKeyboardUIInformation uiPosition](self, "uiPosition"));
  objc_msgSend(v5, "setKeyboardScenePresentationMode:", -[_UIKeyboardUIInformation keyboardScenePresentationMode](self, "keyboardScenePresentationMode"));
  objc_msgSend(v5, "setAssistantBarVisible:", -[_UIKeyboardUIInformation assistantBarVisible](self, "assistantBarVisible"));
  objc_msgSend(v5, "setRequiresHeightForIntegratedAssistantBar:", -[_UIKeyboardUIInformation requiresHeightForIntegratedAssistantBar](self, "requiresHeightForIntegratedAssistantBar"));
  -[_UIKeyboardUIInformation applicationIdentifier](self, "applicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v5, "setApplicationIdentifier:", v9);

  -[_UIKeyboardUIInformation bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v5, "setBundleIdentifier:", v11);

  objc_msgSend(v5, "setNotification:", -[_UIKeyboardUIInformation notification](self, "notification"));
  objc_msgSend(v5, "setStartNotification:", -[_UIKeyboardUIInformation isStartNotification](self, "isStartNotification"));
  -[_UIKeyboardUIInformation beginFrame](self, "beginFrame");
  objc_msgSend(v5, "setBeginFrame:");
  -[_UIKeyboardUIInformation endFrame](self, "endFrame");
  objc_msgSend(v5, "setEndFrame:");
  -[_UIKeyboardUIInformation duration](self, "duration");
  objc_msgSend(v5, "setDuration:");
  objc_msgSend(v5, "setOptions:", -[_UIKeyboardUIInformation options](self, "options"));
  objc_msgSend(v5, "setResizing:", -[_UIKeyboardUIInformation resizing](self, "resizing"));
  objc_msgSend(v5, "setChangedAccessoryOnly:", -[_UIKeyboardUIInformation changedAccessoryOnly](self, "changedAccessoryOnly"));
  objc_msgSend(v5, "setAssistantOnScreenOnly:", -[_UIKeyboardUIInformation assistantOnScreenOnly](self, "assistantOnScreenOnly"));
  -[_UIKeyboardUIInformation assistantFrame](self, "assistantFrame");
  objc_msgSend(v5, "setAssistantFrame:");
  objc_msgSend(v5, "setForceNotification:", -[_UIKeyboardUIInformation forceNotification](self, "forceNotification"));
  objc_msgSend(v5, "setWasCausedRemotely:", -[_UIKeyboardUIInformation wasCausedRemotely](self, "wasCausedRemotely"));
  objc_msgSend(v5, "setDueToRotation:", -[_UIKeyboardUIInformation dueToRotation](self, "dueToRotation"));
  return v5;
}

- (id)copyWithoutFence
{
  _UIKeyboardUIInformation *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _UIKeyboardUIInformation *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = [_UIKeyboardUIInformation alloc];
  -[_UIKeyboardUIInformation keyboardPosition](self, "keyboardPosition");
  v8 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:](v3, "initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:", -[_UIKeyboardUIInformation keyboardOnScreen](self, "keyboardOnScreen"), self->_animated, self->_tracking, self->_orientation, 0, v4, v5, v6, v7);
  -[_UIKeyboardUIInformation setIsLocal:](v8, "setIsLocal:", -[_UIKeyboardUIInformation isLocal](self, "isLocal"));
  -[_UIKeyboardUIInformation currentInputMode](self, "currentInputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[_UIKeyboardUIInformation setCurrentInputMode:](v8, "setCurrentInputMode:", v10);

  -[_UIKeyboardUIInformation setUiPosition:](v8, "setUiPosition:", -[_UIKeyboardUIInformation uiPosition](self, "uiPosition"));
  -[_UIKeyboardUIInformation applicationIdentifier](self, "applicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[_UIKeyboardUIInformation setApplicationIdentifier:](v8, "setApplicationIdentifier:", v12);

  -[_UIKeyboardUIInformation bundleIdentifier](self, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[_UIKeyboardUIInformation setBundleIdentifier:](v8, "setBundleIdentifier:", v14);

  -[_UIKeyboardUIInformation setKeyboardScenePresentationMode:](v8, "setKeyboardScenePresentationMode:", -[_UIKeyboardUIInformation keyboardScenePresentationMode](self, "keyboardScenePresentationMode"));
  -[_UIKeyboardUIInformation setAssistantBarVisible:](v8, "setAssistantBarVisible:", -[_UIKeyboardUIInformation assistantBarVisible](self, "assistantBarVisible"));
  -[_UIKeyboardUIInformation setRequiresHeightForIntegratedAssistantBar:](v8, "setRequiresHeightForIntegratedAssistantBar:", -[_UIKeyboardUIInformation requiresHeightForIntegratedAssistantBar](self, "requiresHeightForIntegratedAssistantBar"));
  -[_UIKeyboardUIInformation setResizing:](v8, "setResizing:", -[_UIKeyboardUIInformation resizing](self, "resizing"));
  -[_UIKeyboardUIInformation setNotification:](v8, "setNotification:", -[_UIKeyboardUIInformation notification](self, "notification"));
  -[_UIKeyboardUIInformation setStartNotification:](v8, "setStartNotification:", -[_UIKeyboardUIInformation isStartNotification](self, "isStartNotification"));
  -[_UIKeyboardUIInformation beginFrame](self, "beginFrame");
  -[_UIKeyboardUIInformation setBeginFrame:](v8, "setBeginFrame:");
  -[_UIKeyboardUIInformation endFrame](self, "endFrame");
  -[_UIKeyboardUIInformation setEndFrame:](v8, "setEndFrame:");
  -[_UIKeyboardUIInformation duration](self, "duration");
  -[_UIKeyboardUIInformation setDuration:](v8, "setDuration:");
  -[_UIKeyboardUIInformation setOptions:](v8, "setOptions:", -[_UIKeyboardUIInformation options](self, "options"));
  -[_UIKeyboardUIInformation setChangedAccessoryOnly:](v8, "setChangedAccessoryOnly:", -[_UIKeyboardUIInformation changedAccessoryOnly](self, "changedAccessoryOnly"));
  -[_UIKeyboardUIInformation setAssistantOnScreenOnly:](v8, "setAssistantOnScreenOnly:", -[_UIKeyboardUIInformation assistantOnScreenOnly](self, "assistantOnScreenOnly"));
  -[_UIKeyboardUIInformation assistantFrame](self, "assistantFrame");
  -[_UIKeyboardUIInformation setAssistantFrame:](v8, "setAssistantFrame:");
  -[_UIKeyboardUIInformation setForceNotification:](v8, "setForceNotification:", -[_UIKeyboardUIInformation forceNotification](self, "forceNotification"));
  -[_UIKeyboardUIInformation setWasCausedRemotely:](v8, "setWasCausedRemotely:", -[_UIKeyboardUIInformation wasCausedRemotely](self, "wasCausedRemotely"));
  -[_UIKeyboardUIInformation setDueToRotation:](v8, "setDueToRotation:", -[_UIKeyboardUIInformation dueToRotation](self, "dueToRotation"));
  return v8;
}

+ (id)animationFence
{
  return +[UIScene _synchronizedDrawingFence](UIScene, "_synchronizedDrawingFence");
}

- (id)notificationInfo
{
  void *v3;

  +[UIInputViewSetNotificationInfo info](UIInputViewSetNotificationInfo, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardUIInformation beginFrame](self, "beginFrame");
  objc_msgSend(v3, "populateStartInfoWithFrame:");
  -[_UIKeyboardUIInformation endFrame](self, "endFrame");
  objc_msgSend(v3, "populateEndInfoWithFrame:");
  -[_UIKeyboardUIInformation duration](self, "duration");
  objc_msgSend(v3, "setDuration:");
  objc_msgSend(v3, "setOptions:", -[_UIKeyboardUIInformation options](self, "options"));
  objc_msgSend(v3, "setChangedAccessoryOnly:", -[_UIKeyboardUIInformation changedAccessoryOnly](self, "changedAccessoryOnly"));
  objc_msgSend(v3, "setAssistantOnScreenOnly:", -[_UIKeyboardUIInformation assistantOnScreenOnly](self, "assistantOnScreenOnly"));
  -[_UIKeyboardUIInformation assistantFrame](self, "assistantFrame");
  objc_msgSend(v3, "setAssistantFrame:");
  objc_msgSend(v3, "setForceNotification:", -[_UIKeyboardUIInformation forceNotification](self, "forceNotification"));
  objc_msgSend(v3, "setWasCausedRemotely:", -[_UIKeyboardUIInformation wasCausedRemotely](self, "wasCausedRemotely"));
  objc_msgSend(v3, "setDueToRotation:", -[_UIKeyboardUIInformation dueToRotation](self, "dueToRotation"));
  objc_msgSend(v3, "setType:", -[_UIKeyboardUIInformation notification](self, "notification"));
  return v3;
}

- (void)addNotificationInfo:(id)a3 isStart:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "beginFrame");
  -[_UIKeyboardUIInformation setBeginFrame:](self, "setBeginFrame:");
  objc_msgSend(v6, "endFrame");
  -[_UIKeyboardUIInformation setEndFrame:](self, "setEndFrame:");
  objc_msgSend(v6, "duration");
  -[_UIKeyboardUIInformation setDuration:](self, "setDuration:");
  -[_UIKeyboardUIInformation setOptions:](self, "setOptions:", objc_msgSend(v6, "options"));
  -[_UIKeyboardUIInformation setChangedAccessoryOnly:](self, "setChangedAccessoryOnly:", objc_msgSend(v6, "changedAccessoryOnly"));
  -[_UIKeyboardUIInformation setAssistantOnScreenOnly:](self, "setAssistantOnScreenOnly:", objc_msgSend(v6, "assistantOnScreenOnly"));
  objc_msgSend(v6, "assistantFrame");
  -[_UIKeyboardUIInformation setAssistantFrame:](self, "setAssistantFrame:");
  -[_UIKeyboardUIInformation setForceNotification:](self, "setForceNotification:", objc_msgSend(v6, "forceNotification"));
  -[_UIKeyboardUIInformation setWasCausedRemotely:](self, "setWasCausedRemotely:", objc_msgSend(v6, "wasCausedRemotely"));
  -[_UIKeyboardUIInformation setDueToRotation:](self, "setDueToRotation:", objc_msgSend(v6, "dueToRotation"));
  v7 = objc_msgSend(v6, "type");

  -[_UIKeyboardUIInformation setNotification:](self, "setNotification:", v7);
  -[_UIKeyboardUIInformation setStartNotification:](self, "setStartNotification:", v4);
}

- (void)setRequiresHeightForIntegratedAssistantBar:(BOOL)a3
{
  self->_requiresHeightForIntegratedAssistantBar = a3;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (void)setCurrentInputMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setKeyboardScenePresentationMode:(unint64_t)a3
{
  self->_keyboardScenePresentationMode = a3;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setBeginFrame:(CGRect)a3
{
  self->_beginFrame = a3;
}

- (void)setEndFrame:(CGRect)a3
{
  self->_endFrame = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setChangedAccessoryOnly:(BOOL)a3
{
  self->_changedAccessoryOnly = a3;
}

- (void)setAssistantOnScreenOnly:(BOOL)a3
{
  self->_assistantOnScreenOnly = a3;
}

- (unint64_t)assistantPosition
{
  return self->_assistantPosition;
}

- (void)setAssistantPosition:(unint64_t)a3
{
  self->_assistantPosition = a3;
}

- (void)setAssistantFrame:(CGRect)a3
{
  self->_assistantFrame = a3;
}

- (void)setForceNotification:(BOOL)a3
{
  self->_forceNotification = a3;
}

- (void)setWasCausedRemotely:(BOOL)a3
{
  self->_wasCausedRemotely = a3;
}

- (void)setDueToRotation:(BOOL)a3
{
  self->_dueToRotation = a3;
}

- (void)setStartNotification:(BOOL)a3
{
  self->_startNotification = a3;
}

- (void)setNotification:(unint64_t)a3
{
  self->_notification = a3;
}

@end
