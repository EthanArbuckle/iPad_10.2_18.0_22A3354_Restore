@implementation SBStartupTransitionContext

- (id)_initWithRepresentation:(id)a3 loginSession:(BOOL)a4
{
  id v6;
  SBStartupTransitionContext *v7;
  SBStartupTransitionContext *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBStartupTransitionContext;
  v7 = -[SBStartupTransitionContext init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_isLoginSession = a4;
    -[SBStartupTransitionContext _reallyInitFromRepresentation:](v7, "_reallyInitFromRepresentation:", v6);
  }

  return v8;
}

- (id)_initWithRestartRequest:(id)a3 fromLocked:(BOOL)a4 fromApplication:(id)a5
{
  id v8;
  id v9;
  SBStartupTransitionContext *v10;
  uint64_t v11;
  NSString *reason;
  uint64_t v13;
  NSURL *applicationLaunchURL;
  void *v15;
  void *v16;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBStartupTransitionContext;
  v10 = -[SBStartupTransitionContext init](&v18, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "reason");
    v11 = objc_claimAutoreleasedReturnValue();
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;

    objc_msgSend(v8, "applicationLaunchURL");
    v13 = objc_claimAutoreleasedReturnValue();
    applicationLaunchURL = v10->_applicationLaunchURL;
    v10->_applicationLaunchURL = (NSURL *)v13;

    v10->_fromLocked = a4;
    objc_storeStrong((id *)&v10->_fromApplicationBundleID, a5);
    objc_msgSend(MEMORY[0x1E0D229A8], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "initializationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_isDark = objc_msgSend(v16, "wasBootedDark");

  }
  return v10;
}

- (id)_initWithRebootContext:(id)a3
{
  id v4;
  SBStartupTransitionContext *v5;
  uint64_t v6;
  NSString *reason;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBStartupTransitionContext;
  v5 = -[SBStartupTransitionContext init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "reason");
    v6 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    v5->_isDark = objc_msgSend(v4, "isDark");
  }

  return v5;
}

- (id)_initWithShutdownContext:(id)a3
{
  id v4;
  SBStartupTransitionContext *v5;
  uint64_t v6;
  NSString *reason;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBStartupTransitionContext;
  v5 = -[SBStartupTransitionContext init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "reason");
    v6 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    v5->_fromUserPowerDown = objc_msgSend(v4, "fromUserPowerDown");
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 isLogin;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 isLogout;
  id v11;
  id v12;
  _BOOL8 isDark;
  id v14;
  id v15;
  _BOOL8 fromLocked;
  id v17;
  id v18;
  BKSDisplayRenderOverlay *overlay;
  id v20;
  id v21;
  NSURL *applicationLaunchURL;
  id v23;
  id v24;
  NSString *fromApplicationBundleID;
  id v26;
  id v27;
  NSString *reason;
  id v29;
  id v30;
  _BOOL8 fromUserPowerDown;
  id v32;
  id v33;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isLogin = self->_isLogin;
  v7 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __38__SBStartupTransitionContext_isEqual___block_invoke;
  v51[3] = &unk_1E8EA3E78;
  v8 = v4;
  v52 = v8;
  v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", isLogin, v51);
  isLogout = self->_isLogout;
  v49[0] = v7;
  v49[1] = 3221225472;
  v49[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_2;
  v49[3] = &unk_1E8EA3E78;
  v11 = v8;
  v50 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", isLogout, v49);
  isDark = self->_isDark;
  v47[0] = v7;
  v47[1] = 3221225472;
  v47[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_3;
  v47[3] = &unk_1E8EA3E78;
  v14 = v11;
  v48 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", isDark, v47);
  fromLocked = self->_fromLocked;
  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_4;
  v45[3] = &unk_1E8EA3E78;
  v17 = v14;
  v46 = v17;
  v18 = (id)objc_msgSend(v5, "appendBool:counterpart:", fromLocked, v45);
  overlay = self->_overlay;
  v43[0] = v7;
  v43[1] = 3221225472;
  v43[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_5;
  v43[3] = &unk_1E8E9E6B0;
  v20 = v17;
  v44 = v20;
  v21 = (id)objc_msgSend(v5, "appendObject:counterpart:", overlay, v43);
  applicationLaunchURL = self->_applicationLaunchURL;
  v41[0] = v7;
  v41[1] = 3221225472;
  v41[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_6;
  v41[3] = &unk_1E8E9E6B0;
  v23 = v20;
  v42 = v23;
  v24 = (id)objc_msgSend(v5, "appendObject:counterpart:", applicationLaunchURL, v41);
  fromApplicationBundleID = self->_fromApplicationBundleID;
  v39[0] = v7;
  v39[1] = 3221225472;
  v39[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_7;
  v39[3] = &unk_1E8E9E6B0;
  v26 = v23;
  v40 = v26;
  v27 = (id)objc_msgSend(v5, "appendObject:counterpart:", fromApplicationBundleID, v39);
  reason = self->_reason;
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_8;
  v37[3] = &unk_1E8E9E6B0;
  v29 = v26;
  v38 = v29;
  v30 = (id)objc_msgSend(v5, "appendObject:counterpart:", reason, v37);
  fromUserPowerDown = self->_fromUserPowerDown;
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_9;
  v35[3] = &unk_1E8EA3E78;
  v36 = v29;
  v32 = v29;
  v33 = (id)objc_msgSend(v5, "appendBool:counterpart:", fromUserPowerDown, v35);
  LOBYTE(v29) = objc_msgSend(v5, "isEqual");

  return (char)v29;
}

uint64_t __38__SBStartupTransitionContext_isEqual___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 34);
}

uint64_t __38__SBStartupTransitionContext_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 35);
}

uint64_t __38__SBStartupTransitionContext_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 33);
}

uint64_t __38__SBStartupTransitionContext_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32);
}

id __38__SBStartupTransitionContext_isEqual___block_invoke_5(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 40);
}

id __38__SBStartupTransitionContext_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __38__SBStartupTransitionContext_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __38__SBStartupTransitionContext_isEqual___block_invoke_8(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __38__SBStartupTransitionContext_isEqual___block_invoke_9(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48);
}

- (void)_reallyInitFromRepresentation:(id)a3
{
  NSString *v4;
  NSString *reason;
  void *v6;
  void *v7;
  NSURL *applicationLaunchURL;
  void *v9;
  NSURL *v10;
  NSURL *v11;
  NSString *v12;
  NSString *fromApplicationBundleID;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "bs_safeObjectForKey:ofType:", CFSTR("__reason"), objc_opt_class());
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  reason = self->_reason;
  self->_reason = v4;

  self->_fromLocked = 0;
  objc_msgSend(v18, "bs_safeObjectForKey:ofType:", CFSTR("__fromLocked"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    self->_fromLocked = objc_msgSend(v6, "BOOLValue");
  applicationLaunchURL = self->_applicationLaunchURL;
  self->_applicationLaunchURL = 0;

  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("__appLaunchURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v11 = self->_applicationLaunchURL;
    self->_applicationLaunchURL = v10;

  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("__fromAppBundleID"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  fromApplicationBundleID = self->_fromApplicationBundleID;
  self->_fromApplicationBundleID = v12;

  objc_msgSend(MEMORY[0x1E0D229A8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "initializationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isDark = objc_msgSend(v15, "wasBootedDark");

  self->_fromUserPowerDown = 0;
  objc_msgSend(v18, "bs_safeObjectForKey:ofType:", CFSTR("__fromUserPowerDown"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
    self->_fromUserPowerDown = objc_msgSend(v16, "BOOLValue");
  -[SBStartupTransitionContext _parseOverlayInfo](self, "_parseOverlayInfo");

}

- (id)_representation
{
  id v3;
  void *v4;
  NSString *reason;
  NSURL *applicationLaunchURL;
  void *v7;
  NSString *fromApplicationBundleID;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  reason = self->_reason;
  if (reason)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", reason, CFSTR("__reason"));
  applicationLaunchURL = self->_applicationLaunchURL;
  if (applicationLaunchURL)
  {
    -[NSURL absoluteString](applicationLaunchURL, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("__appLaunchURL"));

  }
  fromApplicationBundleID = self->_fromApplicationBundleID;
  if (fromApplicationBundleID)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", fromApplicationBundleID, CFSTR("__fromAppBundleID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fromLocked);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("__fromLocked"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fromUserPowerDown);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("__fromUserPowerDown"));

  return v4;
}

- (NSString)description
{
  return (NSString *)-[SBStartupTransitionContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBStartupTransitionContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBStartupTransitionContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  SBStartupTransitionContext *v17;

  -[SBStartupTransitionContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", self->_reason, CFSTR("restartReason"));
  v5 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_applicationLaunchURL, CFSTR("applicationLaunchURL"), 1);
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_fromApplicationBundleID, CFSTR("fromApplication"), 1);
  v7 = (id)objc_msgSend(v4, "appendBool:withName:", self->_fromLocked, CFSTR("fromLocked"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", self->_fromUserPowerDown, CFSTR("fromUserPowerDown"));
  v9 = (id)objc_msgSend(v4, "appendBool:withName:", self->_isDark, CFSTR("fromDarkBoot"));
  v10 = (id)objc_msgSend(v4, "appendBool:withName:", self->_isLogin, CFSTR("isLogin"));
  v11 = (id)objc_msgSend(v4, "appendBool:withName:", self->_isLogout, CFSTR("isLogout"));
  v12 = (id)objc_msgSend(v4, "appendBool:withName:", self->_isLoginSession, CFSTR("isLoginSession"));
  if (self->_overlay)
  {
    objc_msgSend(v4, "activeMultilinePrefix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__SBStartupTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
    v15[3] = &unk_1E8E9E820;
    v16 = v4;
    v17 = self;
    objc_msgSend(v16, "appendBodySectionWithName:multilinePrefix:block:", 0, v13, v15);

  }
  return v4;
}

id __68__SBStartupTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("overlay"), 1);
}

- (void)_parseOverlayInfo
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Overlay user switch mismatch due to being inside a login session and booting with the login overlay.", a5, a6, a7, a8, 0);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)applicationLaunchURL
{
  return self->_applicationLaunchURL;
}

- (void)setApplicationLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)fromApplicationBundleID
{
  return self->_fromApplicationBundleID;
}

- (void)setFromApplicationBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)fromLocked
{
  return self->_fromLocked;
}

- (void)setFromLocked:(BOOL)a3
{
  self->_fromLocked = a3;
}

- (BOOL)fromUserPowerDown
{
  return self->_fromUserPowerDown;
}

- (void)setFromUserPowerDown:(BOOL)a3
{
  self->_fromUserPowerDown = a3;
}

- (BOOL)isLogin
{
  return self->_isLogin;
}

- (void)setLogin:(BOOL)a3
{
  self->_isLogin = a3;
}

- (BOOL)isLogout
{
  return self->_isLogout;
}

- (void)setLogout:(BOOL)a3
{
  self->_isLogout = a3;
}

- (BKSDisplayRenderOverlay)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_overlay, a3);
}

- (BOOL)isDark
{
  return self->_isDark;
}

- (void)setDark:(BOOL)a3
{
  self->_isDark = a3;
}

- (BOOL)hasUserSwitchOverlayMismatch
{
  return self->_hasUserSwitchOverlayMismatch;
}

- (void)setHasUserSwitchOverlayMismatch:(BOOL)a3
{
  self->_hasUserSwitchOverlayMismatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_applicationLaunchURL, 0);
  objc_storeStrong((id *)&self->_fromApplicationBundleID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
