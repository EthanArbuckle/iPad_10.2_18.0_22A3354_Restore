@implementation UIInputViewSetNotificationInfo

+ (id)info
{
  return objc_alloc_init(UIInputViewSetNotificationInfo);
}

- (BOOL)waitingForInputUI
{
  return self->_waitingForInputUI;
}

- (BOOL)containsChange
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v16;
  CGRect v17;

  if (self->_forceNotification)
    return 1;
  -[UIInputViewSetNotificationInfo beginFrame](self, "beginFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIInputViewSetNotificationInfo endFrame](self, "endFrame");
  v17.origin.x = v12;
  v17.origin.y = v13;
  v17.size.width = v14;
  v17.size.height = v15;
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  return !CGRectEqualToRect(v16, v17);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
}

- (UIInputViewSetNotificationInfo)init
{
  UIInputViewSetNotificationInfo *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInputViewSetNotificationInfo;
  v2 = -[UIInputViewSetNotificationInfo init](&v6, sel_init);
  if (v2)
  {
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentUIState");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSetNotificationInfo setWasCausedRemotely:](v2, "setWasCausedRemotely:", objc_msgSend(v4, "isLocal") ^ 1);

    }
    else
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSetNotificationInfo setWasCausedRemotely:](v2, "setWasCausedRemotely:", objc_msgSend(v3, "handlingRemoteEvent"));
    }

  }
  return v2;
}

- (void)setWasCausedRemotely:(BOOL)a3
{
  self->_wasCausedRemotely = a3;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)populateWithAnimationStyle:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  objc_msgSend(v4, "duration");
  -[UIInputViewSetNotificationInfo setDuration:](self, "setDuration:");
  v5 = objc_msgSend(v4, "extraOptions");

  -[UIInputViewSetNotificationInfo setOptions:](self, "setOptions:", v5 | 0x70000);
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)rotationUserInfo
{
  void *v2;

  -[UIInputViewSetNotificationInfo userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("UIKeyboardAnimationCurveUserInfoKey"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("UIKeyboardBoundsUserInfoKey"));
  return v2;
}

- (NSDictionary)userInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3B18];
  -[UIInputViewSetNotificationInfo beginFrame](self, "beginFrame");
  objc_msgSend(v4, "valueWithCGRect:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("UIKeyboardFrameBeginUserInfoKey"));

  v6 = (void *)MEMORY[0x1E0CB3B18];
  -[UIInputViewSetNotificationInfo endFrame](self, "endFrame");
  objc_msgSend(v6, "valueWithCGRect:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("UIKeyboardFrameEndUserInfoKey"));

  v8 = (void *)MEMORY[0x1E0CB3B18];
  -[UIInputViewSetNotificationInfo beginCenter](self, "beginCenter");
  objc_msgSend(v8, "valueWithCGPoint:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("UIKeyboardCenterBeginUserInfoKey"));

  v10 = (void *)MEMORY[0x1E0CB3B18];
  -[UIInputViewSetNotificationInfo endCenter](self, "endCenter");
  objc_msgSend(v10, "valueWithCGPoint:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("UIKeyboardCenterEndUserInfoKey"));

  v12 = (void *)MEMORY[0x1E0CB3B18];
  -[UIInputViewSetNotificationInfo bounds](self, "bounds");
  objc_msgSend(v12, "valueWithCGRect:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("UIKeyboardBoundsUserInfoKey"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[UIInputViewSetNotificationInfo duration](self, "duration");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("UIKeyboardAnimationDurationUserInfoKey"));

  v16 = -[UIInputViewSetNotificationInfo options](self, "options");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (v16 >> 16) & 0xF);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("UIKeyboardAnimationCurveUserInfoKey"));

  if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[UIInputViewSetNotificationInfo wasCausedRemotely](self, "wasCausedRemotely") ^ 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("UIKeyboardIsLocalUserInfoKey"));

  }
  return (NSDictionary *)v3;
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

- (BOOL)wasCausedRemotely
{
  return self->_wasCausedRemotely;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)options
{
  return self->_options;
}

- (CGPoint)endCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_endCenter.x;
  y = self->_endCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
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

- (CGPoint)beginCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_beginCenter.x;
  y = self->_beginCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)addKeyboardNotificationDebuggingInfo:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    -[UIInputViewSetNotificationInfo debugInfo](self, "debugInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[UIInputViewSetNotificationInfo debugInfo](self, "debugInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ > %@"), v7, v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSetNotificationInfo setDebugInfo:](self, "setDebugInfo:", v8);

    }
    else
    {
      -[UIInputViewSetNotificationInfo setDebugInfo:](self, "setDebugInfo:", v9);
    }
  }

}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (void)populateEndInfoWithFrame:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double MidX;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIInputViewSetNotificationInfo setEndFrame:](self, "setEndFrame:");
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  MidX = CGRectGetMidX(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  -[UIInputViewSetNotificationInfo setEndCenter:](self, "setEndCenter:", MidX, CGRectGetMidY(v10));
  -[UIInputViewSetNotificationInfo setBounds:](self, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
}

- (void)setEndFrame:(CGRect)a3
{
  self->_endFrame = a3;
}

- (void)setEndCenter:(CGPoint)a3
{
  self->_endCenter = a3;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  -[UIInputViewSetNotificationInfo userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  -[UIInputViewSetNotificationInfo debugInfo](self, "debugInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[UIInputViewSetNotificationInfo debugInfo](self, "debugInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Notifications debug: %@"), v9);

  }
  return v6;
}

- (NSString)debugInfo
{
  return self->_debugInfo;
}

- (void)setDueToRotation:(BOOL)a3
{
  self->_dueToRotation = a3;
}

- (void)setShouldSendInClient:(BOOL)a3
{
  self->_shouldSendInClient = a3;
}

- (BOOL)forceNotification
{
  return self->_forceNotification;
}

- (void)setForceNotification:(BOOL)a3
{
  self->_forceNotification = a3;
}

- (void)setBeginCenter:(CGPoint)a3
{
  self->_beginCenter = a3;
}

- (void)populateStartInfoWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidX;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIInputViewSetNotificationInfo setBeginFrame:](self, "setBeginFrame:");
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  MidX = CGRectGetMidX(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  -[UIInputViewSetNotificationInfo setBeginCenter:](self, "setBeginCenter:", MidX, CGRectGetMidY(v10));
}

- (void)setBeginFrame:(CGRect)a3
{
  self->_beginFrame = a3;
}

- (void)setAssistantOnScreenOnly:(BOOL)a3
{
  self->_assistantOnScreenOnly = a3;
}

- (NSDictionary)privateUserInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  _QWORD v29[4];
  CGRect v30;
  CGRect v31;

  -[UIInputViewSetNotificationInfo userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UIInputViewSetNotificationInfo changedAccessoryOnly](self, "changedAccessoryOnly"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("UIKeyboardChangedAccessoryOnly"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UIInputViewSetNotificationInfo assistantOnScreenOnly](self, "assistantOnScreenOnly"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("UIKeyboardAssistantOnScreenOnlyUserInfoKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[UIInputViewSetNotificationInfo assistantPosition](self, "assistantPosition"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("UIKeyboardAssistantPositionUserInfoKey"));

  v7 = (void *)MEMORY[0x1E0CB3B18];
  -[UIInputViewSetNotificationInfo assistantFrame](self, "assistantFrame");
  v29[0] = v8;
  v29[1] = v9;
  v29[2] = v10;
  v29[3] = v11;
  objc_msgSend(v7, "valueWithBytes:objCType:", v29, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("UIKeyboardFloatingRectUserInfoKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UIInputViewSetNotificationInfo dueToRotation](self, "dueToRotation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("UIKeyboardOriginatedFromRotationUserInfoKey"));

  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keyboardFrameIncludingRemoteIAV");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v30.origin.x = v16;
  v30.origin.y = v18;
  v30.size.width = v20;
  v30.size.height = v22;
  if (CGRectIsEmpty(v30))
  {
    -[UIInputViewSetNotificationInfo endFrame](self, "endFrame");
    v16 = v23;
    v18 = v24;
    v20 = v25;
    v22 = v26;
  }
  v31.origin.x = v16;
  v31.origin.y = v18;
  v31.size.width = v20;
  v31.size.height = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetHeight(v31));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("UIKeyboardEndIntersectionHeightIncludingAccessory"));

  return (NSDictionary *)v3;
}

- (BOOL)dueToRotation
{
  return self->_dueToRotation;
}

- (BOOL)changedAccessoryOnly
{
  return self->_changedAccessoryOnly;
}

- (unint64_t)assistantPosition
{
  return self->_assistantPosition;
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

- (void)setChangedAccessoryOnly:(BOOL)a3
{
  self->_changedAccessoryOnly = a3;
}

- (void)setWaitingForInputUI:(BOOL)a3
{
  self->_waitingForInputUI = a3;
}

- (id)inverseInfo
{
  uint64_t v3;

  objc_msgSend((id)objc_opt_class(), "info");
  v3 = objc_claimAutoreleasedReturnValue();
  *(double *)(v3 + 24) = self->_duration;
  *(_QWORD *)(v3 + 32) = self->_options;
  -[UIInputViewSetNotificationInfo endFrame](self, "endFrame");
  objc_msgSend((id)v3, "populateStartInfoWithFrame:");
  -[UIInputViewSetNotificationInfo beginFrame](self, "beginFrame");
  objc_msgSend((id)v3, "populateEndInfoWithFrame:");
  return (id)v3;
}

- (void)setAssistantPosition:(unint64_t)a3
{
  self->_assistantPosition = a3;
}

- (void)setAssistantFrame:(CGRect)a3
{
  self->_assistantFrame = a3;
}

- (BOOL)forWritingToolsSheet
{
  return self->_forWritingToolsSheet;
}

- (void)setForWritingToolsSheet:(BOOL)a3
{
  self->_forWritingToolsSheet = a3;
}

- (BOOL)shouldSendInClient
{
  return self->_shouldSendInClient;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setDebugInfo:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfo, a3);
}

- (BOOL)nonKeyboardOverride
{
  return self->_nonKeyboardOverride;
}

- (void)setNonKeyboardOverride:(BOOL)a3
{
  self->_nonKeyboardOverride = a3;
}

@end
