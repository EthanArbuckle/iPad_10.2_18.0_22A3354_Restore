@implementation SBLockScreenUnlockRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_unlockDestination, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_destinationApplication, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (int)source
{
  return self->_source;
}

- (int)intent
{
  return self->_intent;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setIntent:(int)a3
{
  self->_intent = a3;
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

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SBLockScreenUnlockRequest name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  objc_msgSend(v4, "setSource:", -[SBLockScreenUnlockRequest source](self, "source"));
  objc_msgSend(v4, "setIntent:", -[SBLockScreenUnlockRequest intent](self, "intent"));
  -[SBLockScreenUnlockRequest process](self, "process");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProcess:", v6);

  -[SBLockScreenUnlockRequest destinationApplication](self, "destinationApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDestinationApplication:", v7);

  objc_msgSend(v4, "setWantsBiometricPresentation:", -[SBLockScreenUnlockRequest wantsBiometricPresentation](self, "wantsBiometricPresentation"));
  objc_msgSend(v4, "setForceAlertAuthenticationUI:", -[SBLockScreenUnlockRequest forceAlertAuthenticationUI](self, "forceAlertAuthenticationUI"));
  -[SBLockScreenUnlockRequest title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v8);

  -[SBLockScreenUnlockRequest subtitle](self, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v9);

  -[SBLockScreenUnlockRequest unlockDestination](self, "unlockDestination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnlockDestination:", v10);

  return v4;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_name, CFSTR("name"), 1);
  NSStringFromUnlockSource();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("source"));

  NSStringFromUnlockIntent();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("intent"));

  objc_msgSend(MEMORY[0x1E0D01748], "succinctDescriptionForObject:", self->_process);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v7, CFSTR("process"), 1);

  objc_msgSend(MEMORY[0x1E0D01748], "succinctDescriptionForObject:", self->_destinationApplication);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v9, CFSTR("destinationApplication"), 1);

  v11 = (id)objc_msgSend(v3, "appendBool:withName:", self->_wantsBiometricPresentation, CFSTR("wantsBiometricPresentation"));
  v12 = (id)objc_msgSend(v3, "appendBool:withName:", self->_forceAlertAuthenticationUI, CFSTR("forcesAlertAuthenticationUI"));
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_title, CFSTR("title"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_subtitle, CFSTR("subtitle"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_unlockDestination, CFSTR("unlockDestination"), 1);
  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *name;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t source;
  id v11;
  id v12;
  uint64_t intent;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  SBApplication *destinationApplication;
  id v20;
  id v21;
  _BOOL8 wantsBiometricPresentation;
  id v23;
  id v24;
  _BOOL8 forceAlertAuthenticationUI;
  id v26;
  id v27;
  NSString *title;
  id v29;
  id v30;
  NSString *subtitle;
  id v32;
  id v33;
  NSString *unlockDestination;
  id v35;
  id v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t);
  void *v41;
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
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v7 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke;
  v59[3] = &unk_1E8EA89D0;
  v8 = v4;
  v60 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", name, v59);
  source = self->_source;
  v57[0] = v7;
  v57[1] = 3221225472;
  v57[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_2;
  v57[3] = &unk_1E8EA3AB0;
  v11 = v8;
  v58 = v11;
  v12 = (id)objc_msgSend(v5, "appendInteger:counterpart:", source, v57);
  intent = self->_intent;
  v55[0] = v7;
  v55[1] = 3221225472;
  v55[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_3;
  v55[3] = &unk_1E8EA3AB0;
  v14 = v11;
  v56 = v14;
  v15 = (id)objc_msgSend(v5, "appendInteger:counterpart:", intent, v55);
  v16 = (int)-[BSProcessHandle pid](self->_process, "pid");
  v53[0] = v7;
  v53[1] = 3221225472;
  v53[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_4;
  v53[3] = &unk_1E8EA3AB0;
  v17 = v14;
  v54 = v17;
  v18 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v16, v53);
  destinationApplication = self->_destinationApplication;
  v51[0] = v7;
  v51[1] = 3221225472;
  v51[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_5;
  v51[3] = &unk_1E8EA4320;
  v20 = v17;
  v52 = v20;
  v21 = (id)objc_msgSend(v5, "appendObject:counterpart:", destinationApplication, v51);
  wantsBiometricPresentation = self->_wantsBiometricPresentation;
  v49[0] = v7;
  v49[1] = 3221225472;
  v49[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_6;
  v49[3] = &unk_1E8EA3E78;
  v23 = v20;
  v50 = v23;
  v24 = (id)objc_msgSend(v5, "appendBool:counterpart:", wantsBiometricPresentation, v49);
  forceAlertAuthenticationUI = self->_forceAlertAuthenticationUI;
  v47[0] = v7;
  v47[1] = 3221225472;
  v47[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_7;
  v47[3] = &unk_1E8EA3E78;
  v26 = v23;
  v48 = v26;
  v27 = (id)objc_msgSend(v5, "appendBool:counterpart:", forceAlertAuthenticationUI, v47);
  title = self->_title;
  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_8;
  v45[3] = &unk_1E8EA89D0;
  v29 = v26;
  v46 = v29;
  v30 = (id)objc_msgSend(v5, "appendString:counterpart:", title, v45);
  subtitle = self->_subtitle;
  v43[0] = v7;
  v43[1] = 3221225472;
  v43[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_9;
  v43[3] = &unk_1E8EA89D0;
  v32 = v29;
  v44 = v32;
  v33 = (id)objc_msgSend(v5, "appendString:counterpart:", subtitle, v43);
  unlockDestination = self->_unlockDestination;
  v38 = v7;
  v39 = 3221225472;
  v40 = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_10;
  v41 = &unk_1E8EA89D0;
  v42 = v32;
  v35 = v32;
  v36 = (id)objc_msgSend(v5, "appendString:counterpart:", unlockDestination, &v38);
  LOBYTE(v32) = objc_msgSend(v5, "isEqual", v38, v39, v40, v41);

  return (char)v32;
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "name");
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "source");
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "intent");
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "process");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (int)objc_msgSend(v1, "pid");

  return v2;
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "destinationApplication");
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "wantsBiometricPresentation");
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceAlertAuthenticationUI");
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "title");
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subtitle");
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unlockDestination");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_name);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_source);
  v6 = (id)objc_msgSend(v3, "appendInteger:", self->_intent);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_process);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_destinationApplication);
  v9 = (id)objc_msgSend(v3, "appendBool:", self->_wantsBiometricPresentation);
  v10 = (id)objc_msgSend(v3, "appendBool:", self->_forceAlertAuthenticationUI);
  v11 = (id)objc_msgSend(v3, "appendString:", self->_title);
  v12 = (id)objc_msgSend(v3, "appendString:", self->_subtitle);
  v13 = (id)objc_msgSend(v3, "appendString:", self->_unlockDestination);
  v14 = objc_msgSend(v3, "hash");

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (BSProcessHandle)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
  objc_storeStrong((id *)&self->_process, a3);
}

- (SBApplication)destinationApplication
{
  return self->_destinationApplication;
}

- (void)setDestinationApplication:(id)a3
{
  objc_storeStrong((id *)&self->_destinationApplication, a3);
}

- (BOOL)wantsBiometricPresentation
{
  return self->_wantsBiometricPresentation;
}

- (void)setWantsBiometricPresentation:(BOOL)a3
{
  self->_wantsBiometricPresentation = a3;
}

- (BOOL)forceAlertAuthenticationUI
{
  return self->_forceAlertAuthenticationUI;
}

- (void)setForceAlertAuthenticationUI:(BOOL)a3
{
  self->_forceAlertAuthenticationUI = a3;
}

- (BOOL)confirmedNotInPocket
{
  return self->_confirmedNotInPocket;
}

- (void)setConfirmedNotInPocket:(BOOL)a3
{
  self->_confirmedNotInPocket = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)unlockDestination
{
  return self->_unlockDestination;
}

- (void)setUnlockDestination:(id)a3
{
  objc_storeStrong((id *)&self->_unlockDestination, a3);
}

- (SBWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setWindowScene:(id)a3
{
  objc_storeStrong((id *)&self->_windowScene, a3);
}

@end
