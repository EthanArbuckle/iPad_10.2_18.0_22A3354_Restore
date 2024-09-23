@implementation SBSSystemServiceClient

- (void)setEventMask:(unint64_t)a3 forButtonKind:(int64_t)a4 priority:(int64_t)a5
{
  id v9;
  _QWORD v10[7];

  -[SBSSystemServiceClient setButtonEventServiceIsWaitingForServerMessages:](self, "setButtonEventServiceIsWaitingForServerMessages:", a3 != 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__SBSSystemServiceClient_setEventMask_forButtonKind_priority___block_invoke;
  v10[3] = &__block_descriptor_56_e33_v16__0__NSObject_OS_xpc_object__8l;
  v10[4] = a3;
  v10[5] = a5;
  v10[6] = a4;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v10);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v9, 3);

}

- (void)setButtonEventServiceIsWaitingForServerMessages:(BOOL)a3
{
  void *v5;
  id v6;

  if (self->_buttonEventServiceIsWaitingForServerMessages != a3)
  {
    v5 = (void *)objc_opt_class();
    if (a3)
      v6 = (id)objc_msgSend(v5, "checkOutClientWithClass:", v5);
    else
      objc_msgSend(v5, "checkInClient:", self);
    self->_buttonEventServiceIsWaitingForServerMessages = a3;
  }
}

+ (id)serviceFacilityIdentifier
{
  return CFSTR("com.apple.springboardservices.system");
}

void __62__SBSSystemServiceClient_setEventMask_forButtonKind_priority___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  xpc_object_t xdict;

  v3 = a1[4];
  xdict = a2;
  xpc_dictionary_set_uint64(xdict, "eventMask", v3);
  xpc_dictionary_set_int64(xdict, "priority", a1[5]);
  xpc_dictionary_set_int64(xdict, "buttonKind", a1[6]);

}

- (void)requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:(id)a3 reacquiringExistingAssertion:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemServiceClient.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  objc_msgSend(v10, "receiveRight");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 || (v12 = objc_alloc_init(MEMORY[0x1E0D01798]), (objc_msgSend(v12, "isUsable") & 1) != 0))
  {
    objc_initWeak(location, v10);
    v13 = (void *)MEMORY[0x1E0D232D0];
    v14 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __135__SBSSystemServiceClient_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_reacquiringExistingAssertion_completion___block_invoke;
    v23[3] = &unk_1E288EA50;
    v15 = v12;
    v24 = v15;
    v25 = v9;
    objc_msgSend(v13, "messageWithPacker:", v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __135__SBSSystemServiceClient_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_reacquiringExistingAssertion_completion___block_invoke_2;
    v18[3] = &unk_1E288EAA0;
    v18[4] = self;
    objc_copyWeak(&v21, location);
    v22 = v10 != 0;
    v12 = v15;
    v19 = v12;
    v20 = v11;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v16, 0, v18, v10 != 0, 0.0);

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
  }

}

void __135__SBSSystemServiceClient_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_reacquiringExistingAssertion_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D017A0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initFromReceiveRight:", *(_QWORD *)(a1 + 32));
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();

}

void __135__SBSSystemServiceClient_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_reacquiringExistingAssertion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  char v14;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = xpc_dictionary_get_BOOL(v3, SBSAppSwitcherServiceMessageKeySuccessResult);
  else
    v5 = 0;
  objc_msgSend(*(id *)(a1 + 32), "calloutQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __135__SBSSystemServiceClient_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_reacquiringExistingAssertion_completion___block_invoke_3;
  block[3] = &unk_1E288EA78;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v13 = v5;
  v14 = *(_BYTE *)(a1 + 64);
  v9 = *(id *)(a1 + 40);
  v10 = v4;
  v11 = *(id *)(a1 + 48);
  v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v12);
}

void __135__SBSSystemServiceClient_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_reacquiringExistingAssertion_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  SBSAssertion *v3;
  SBSAssertion *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (*(_BYTE *)(a1 + 64))
  {
    if (*(_BYTE *)(a1 + 65))
    {
      if (!objc_msgSend(WeakRetained, "isValid"))
      {
        v4 = 0;
        goto LABEL_11;
      }
      v3 = (SBSAssertion *)v6;
    }
    else
    {
      v3 = -[SBSAssertion initWithAssertionName:reason:receiveRight:]([SBSAssertion alloc], "initWithAssertionName:reason:receiveRight:", CFSTR("com.apple.springboard.requestAppSwitcherAppearance"), CFSTR("requestAppSwitcherAppearanceForHiddenApp"), *(_QWORD *)(a1 + 32));
    }
    v4 = v3;
LABEL_11:
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!*(_BYTE *)(a1 + 65))
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v4 = 0;
  v5 = 0;
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)fetchUnlockCredentialSetWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D232D0], "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__SBSSystemServiceClient_fetchUnlockCredentialSetWithCompletion___block_invoke;
    v6[3] = &unk_1E288E380;
    v7 = v4;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v5, 1, v6, 0, 0.0);

  }
}

void __65__SBSSystemServiceClient_fetchUnlockCredentialSetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "payload");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3 && MEMORY[0x193FF8A34](v3) == MEMORY[0x1E0C812F8])
  {
    BSDeserializeDataFromXPCDictionaryWithKey();
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)acquireAssertionOfType:(int64_t)a3 forReason:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  int64_t v17;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = (void *)MEMORY[0x1E0D232D0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__SBSSystemServiceClient_acquireAssertionOfType_forReason_withCompletion___block_invoke;
    v15[3] = &unk_1E288E438;
    v17 = a3;
    v16 = v8;
    objc_msgSend(v11, "messageWithPacker:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __74__SBSSystemServiceClient_acquireAssertionOfType_forReason_withCompletion___block_invoke_2;
    v13[3] = &unk_1E288E380;
    v14 = v9;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v12, 2, v13, 0, 0.0);

  }
}

void __74__SBSSystemServiceClient_acquireAssertionOfType_forReason_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = a2;
  xpc_dictionary_set_uint64(v3, "assertionType", v2);
  BSSerializeStringToXPCDictionaryWithKey();

}

void __74__SBSSystemServiceClient_acquireAssertionOfType_forReason_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "payload");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3 && MEMORY[0x193FF8A34](v3) == MEMORY[0x1E0C812F8])
  {
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)toggleStateForButtonKind:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  int64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__SBSSystemServiceClient_toggleStateForButtonKind___block_invoke;
  v9[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v9[4] = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __51__SBSSystemServiceClient_toggleStateForButtonKind___block_invoke_2;
  v8[3] = &unk_1E288E410;
  v8[4] = &v10;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v5, 5, v8, 1, 0.0);

  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __51__SBSSystemServiceClient_toggleStateForButtonKind___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, "buttonKind", *(_QWORD *)(a1 + 32));
}

void __51__SBSSystemServiceClient_toggleStateForButtonKind___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    xdict = v3;
    v4 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
    v3 = xdict;
    if (v4)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_int64(xdict, "toggleButtonState");
      v3 = xdict;
    }
  }

}

- (void)setRequestsHIDEvents:(BOOL)a3 token:(id)a4 forButtonKind:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;
  BOOL v15;

  v8 = a4;
  v9 = (void *)MEMORY[0x1E0D232D0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__SBSSystemServiceClient_setRequestsHIDEvents_token_forButtonKind___block_invoke;
  v12[3] = &unk_1E288EAE8;
  v15 = a3;
  v13 = v8;
  v14 = a5;
  v11 = v8;
  objc_msgSend(v9, "messageWithPacker:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v10, 4);

}

void __67__SBSSystemServiceClient_setRequestsHIDEvents_token_forButtonKind___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_int64(xdict, "buttonKind", *(_QWORD *)(a1 + 40));
  xpc_dictionary_set_BOOL(xdict, "HIDEventsEnabled", *(_BYTE *)(a1 + 48));
  if (*(_QWORD *)(a1 + 32))
    BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

}

- (void)_handleButtonEventConsumePressMessage:(id)a3
{
  int64_t int64;
  int64_t v4;
  int64_t v5;
  void *v6;
  xpc_object_t xdict;

  objc_msgSend(a3, "payload");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  int64 = xpc_dictionary_get_int64(xdict, "eventType");
  v4 = xpc_dictionary_get_int64(xdict, "priority");
  v5 = xpc_dictionary_get_int64(xdict, "buttonKind");
  +[SBSHardwareButtonService sharedInstance](SBSHardwareButtonService, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleButtonPressMessage:forButtonKind:priority:", int64, v5, v4);

}

- (void)setHapticType:(int64_t)a3 forButtonKind:(int64_t)a4
{
  id v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SBSSystemServiceClient_setHapticType_forButtonKind___block_invoke;
  v6[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6[4] = a4;
  v6[5] = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v6);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v5, 6);

}

void __54__SBSSystemServiceClient_setHapticType_forButtonKind___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3;
  xpc_object_t xdict;

  v3 = *(_QWORD *)(a1 + 32);
  xdict = a2;
  xpc_dictionary_set_int64(xdict, "buttonKind", v3);
  xpc_dictionary_set_int64(xdict, "hapticType", *(_QWORD *)(a1 + 40));

}

- (void)fetchHapticTypeForButtonKind:(int64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__SBSSystemServiceClient_fetchHapticTypeForButtonKind_completion___block_invoke;
  v12[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v12[4] = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __66__SBSSystemServiceClient_fetchHapticTypeForButtonKind_completion___block_invoke_2;
  v10[3] = &unk_1E288E380;
  v11 = v6;
  v9 = v6;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v8, 7, v10, 0, 0.0);

}

void __66__SBSSystemServiceClient_fetchHapticTypeForButtonKind_completion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, "buttonKind", *(_QWORD *)(a1 + 32));
}

void __66__SBSSystemServiceClient_fetchHapticTypeForButtonKind_completion___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (xdict && MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8])
    xpc_dictionary_get_int64(xdict, "hapticType");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)getAssociatedHintViewsSupported
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SBSSystemServiceClient_getAssociatedHintViewsSupported__block_invoke;
  block[3] = &unk_1E288DFC0;
  block[4] = self;
  if (getAssociatedHintViewsSupported_onceToken != -1)
    dispatch_once(&getAssociatedHintViewsSupported_onceToken, block);
  return getAssociatedHintViewsSupported_hintViewsSupported;
}

void __57__SBSSystemServiceClient_getAssociatedHintViewsSupported__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendMessage:withType:replyHandler:waitForReply:timeout:", v2, 8, &__block_literal_global_30, 1, 0.0);

}

void __57__SBSSystemServiceClient_getAssociatedHintViewsSupported__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  BOOL v3;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    xdict = v2;
    v3 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
    v2 = xdict;
    if (v3)
    {
      getAssociatedHintViewsSupported_hintViewsSupported = xpc_dictionary_get_BOOL(xdict, "buttonHintViewsSupported");
      v2 = xdict;
    }
  }

}

- (id)registerAssociatedHintViewContextId:(unsigned int)a3 layerRenderId:(unint64_t)a4 layerSize:(CGSize)a5 forButtonKind:(int64_t)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  SBSHardwareButtonHintViewAssertion *v21;
  void *v22;
  void *v23;
  SBSHardwareButtonHintViewAssertion *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  unint64_t v31;
  CGFloat v32;
  CGFloat v33;
  int64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  height = a5.height;
  width = a5.width;
  v12 = objc_alloc_init(MEMORY[0x1E0D01798]);
  if (objc_msgSend(v12, "isUsable"))
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v13 = (void *)MEMORY[0x1E0D232D0];
    v14 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __100__SBSSystemServiceClient_registerAssociatedHintViewContextId_layerRenderId_layerSize_forButtonKind___block_invoke;
    v29[3] = &unk_1E288EB50;
    v15 = v12;
    v35 = a3;
    v30 = v15;
    v31 = a4;
    v32 = width;
    v33 = height;
    v34 = a6;
    objc_msgSend(v13, "messageWithPacker:", v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v14;
    v28[1] = 3221225472;
    v28[2] = __100__SBSSystemServiceClient_registerAssociatedHintViewContextId_layerRenderId_layerSize_forButtonKind___block_invoke_2;
    v28[3] = &unk_1E288E410;
    v28[4] = &v36;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v16, 9, v28, 1, 0.0);

    if (*((_BYTE *)v37 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bundlePath");
        v20 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBSHardwareButtonService request from %@"), v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = [SBSHardwareButtonHintViewAssertion alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SBSHardwareButtonHintViewAssertion initWithButtonKind:assertionName:reason:receiveRight:](v24, "initWithButtonKind:assertionName:reason:receiveRight:", a6, v26, v23, v15);

    }
    else
    {
      v21 = 0;
    }

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void __100__SBSSystemServiceClient_registerAssociatedHintViewContextId_layerRenderId_layerSize_forButtonKind___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D017A0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initFromReceiveRight:", *(_QWORD *)(a1 + 32));
  xpc_dictionary_set_uint64(v4, "sourceContextId", *(unsigned int *)(a1 + 72));
  xpc_dictionary_set_uint64(v4, "sourceLayerRenderId", *(_QWORD *)(a1 + 40));
  BSSerializeCGSizeToXPCDictionaryWithKey();
  xpc_dictionary_set_int64(v4, "buttonKind", *(_QWORD *)(a1 + 64));
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

void __100__SBSSystemServiceClient_registerAssociatedHintViewContextId_layerRenderId_layerSize_forButtonKind___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    xdict = v3;
    v4 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
    v3 = xdict;
    if (v4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "success");
      v3 = xdict;
    }
  }

}

- (void)updateHintViewContentVisibility:(int64_t)a3 forButton:(int64_t)a4 animationSettings:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;
  int64_t v15;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0D232D0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__SBSSystemServiceClient_updateHintViewContentVisibility_forButton_animationSettings___block_invoke;
  v12[3] = &unk_1E288EB78;
  v14 = a3;
  v15 = a4;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "messageWithPacker:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v10, 10);

}

void __86__SBSSystemServiceClient_updateHintViewContentVisibility_forButton_animationSettings___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3;
  xpc_object_t xdict;

  v3 = *(_QWORD *)(a1 + 40);
  xdict = a2;
  xpc_dictionary_set_int64(xdict, "hintContentVisibility", v3);
  xpc_dictionary_set_int64(xdict, "buttonKind", *(_QWORD *)(a1 + 48));
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

- (void)requestSystemGlowEffectWithInitialStyle:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  int64_t v17;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D01798]);
  if ((objc_msgSend(v7, "isUsable") & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0D232D0];
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__SBSSystemServiceClient_requestSystemGlowEffectWithInitialStyle_completion___block_invoke;
    v15[3] = &unk_1E288E438;
    v10 = v7;
    v16 = v10;
    v17 = a3;
    objc_msgSend(v8, "messageWithPacker:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __77__SBSSystemServiceClient_requestSystemGlowEffectWithInitialStyle_completion___block_invoke_2;
    v12[3] = &unk_1E288EBA0;
    v13 = v10;
    v14 = v6;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v11, 11, v12, 0, 0.0);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __77__SBSSystemServiceClient_requestSystemGlowEffectWithInitialStyle_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D017A0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initFromReceiveRight:", *(_QWORD *)(a1 + 32));
  xpc_dictionary_set_int64(v4, "systemGlowStyle", *(_QWORD *)(a1 + 40));
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

void __77__SBSSystemServiceClient_requestSystemGlowEffectWithInitialStyle_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  SBSHardwareButtonSystemGlowAssertion *v9;
  void *v10;
  void *v11;
  SBSHardwareButtonSystemGlowAssertion *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    xdict = v3;
    v4 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
    v3 = xdict;
    if (v4)
    {
      if (xpc_dictionary_get_BOOL(xdict, "success"))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          v8 = v6;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "bundlePath");
          v8 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBSHardwareButtonService system glow request from %@"), v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = [SBSHardwareButtonSystemGlowAssertion alloc];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[SBSAssertion initWithAssertionName:reason:receiveRight:](v12, "initWithAssertionName:reason:receiveRight:", v14, v11, *(_QWORD *)(a1 + 32));

      }
      else
      {
        v9 = 0;
      }
      v15 = *(_QWORD *)(a1 + 40);
      if (v15)
        (*(void (**)(uint64_t, SBSHardwareButtonSystemGlowAssertion *))(v15 + 16))(v15, v9);

      v3 = xdict;
    }
  }

}

- (void)updateSystemGlowStyle:(int64_t)a3
{
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SBSSystemServiceClient_updateSystemGlowStyle___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v4, 12);

}

void __48__SBSSystemServiceClient_updateSystemGlowStyle___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, "systemGlowStyle", *(_QWORD *)(a1 + 32));
}

- (void)setPasscodePolicy:(int64_t)a3
{
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SBSSystemServiceClient_setPasscodePolicy___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v4, 13);

}

void __44__SBSSystemServiceClient_setPasscodePolicy___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, "passcodePolicy", *(_QWORD *)(a1 + 32));
}

- (int64_t)passcodePolicy
{
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__SBSSystemServiceClient_passcodePolicy__block_invoke;
  v6[3] = &unk_1E288E410;
  v6[4] = &v7;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v3, 14, v6, 1, 0.0);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __40__SBSSystemServiceClient_passcodePolicy__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    xdict = v3;
    v4 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
    v3 = xdict;
    if (v4)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_int64(xdict, "passcodePolicy");
      v3 = xdict;
    }
  }

}

- (void)suspendAllDisplays
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v3, 15);

}

- (void)clearAllUserNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v3, 16);

}

- (void)setUserPresenceDetectedSinceWake
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v3, 44);

}

- (void)setAlertsEnabled:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SBSSystemServiceClient_setAlertsEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v4, 17);

}

void __43__SBSSystemServiceClient_setAlertsEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "enabledState", *(_BYTE *)(a1 + 32));
}

- (void)setHiddenFeaturesEnabled:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SBSSystemServiceClient_setHiddenFeaturesEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v4, 18);

}

void __51__SBSSystemServiceClient_setHiddenFeaturesEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "enabledState", *(_BYTE *)(a1 + 32));
}

- (void)setIdleTimerEnabled:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SBSSystemServiceClient_setIdleTimerEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v4, 19);

}

void __46__SBSSystemServiceClient_setIdleTimerEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "enabledState", *(_BYTE *)(a1 + 32));
}

- (void)setOrientationLockEnabled:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SBSSystemServiceClient_setOrientationLockEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v4, 20);

}

void __52__SBSSystemServiceClient_setOrientationLockEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "enabledState", *(_BYTE *)(a1 + 32));
}

- (void)setMallocStackLoggingEnabled:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__SBSSystemServiceClient_setMallocStackLoggingEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v4, 21);

}

void __55__SBSSystemServiceClient_setMallocStackLoggingEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "enabledState", *(_BYTE *)(a1 + 32));
}

- (void)setReachabilityActive:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SBSSystemServiceClient_setReachabilityActive___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v4, 22);

}

void __48__SBSSystemServiceClient_setReachabilityActive___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "enabledState", *(_BYTE *)(a1 + 32));
}

- (void)setAmbientPresentationState:(int64_t)a3
{
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SBSSystemServiceClient_setAmbientPresentationState___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v4, 24);

}

void __54__SBSSystemServiceClient_setAmbientPresentationState___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, "ambientPresentationState", *(_QWORD *)(a1 + 32));
}

- (id)acquireAssertionForReachabilityEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  SBSAssertion *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  BOOL v21;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D01798]);
  if (objc_msgSend(v5, "isUsable"))
  {
    v6 = (void *)MEMORY[0x1E0D232D0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__SBSSystemServiceClient_acquireAssertionForReachabilityEnabled___block_invoke;
    v19[3] = &unk_1E288EBE8;
    v7 = v5;
    v20 = v7;
    v21 = v3;
    objc_msgSend(v6, "messageWithPacker:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v8, 23, &__block_literal_global_29_0, 1, 0.0);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundlePath");
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBSTestAutomationService request from %@"), v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("disabled");
    if (v3)
      v16 = CFSTR("enabled");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reachability %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBSAssertion initWithAssertionName:reason:receiveRight:]([SBSAssertion alloc], "initWithAssertionName:reason:receiveRight:", v17, v15, v7);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __65__SBSSystemServiceClient_acquireAssertionForReachabilityEnabled___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D017A0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initFromReceiveRight:", *(_QWORD *)(a1 + 32));
  xpc_dictionary_set_BOOL(v4, "enabledState", *(_BYTE *)(a1 + 40));
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

- (void)resetToHomeScreenAnimated:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SBSSystemServiceClient_resetToHomeScreenAnimated___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v4, 25);

}

void __52__SBSSystemServiceClient_resetToHomeScreenAnimated___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "animate", *(_BYTE *)(a1 + 32));
}

- (void)setAccessoryType:(int64_t)a3 attached:(BOOL)a4
{
  id v5;
  _QWORD v6[5];
  BOOL v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SBSSystemServiceClient_setAccessoryType_attached___block_invoke;
  v6[3] = &__block_descriptor_41_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6[4] = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v6);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v5, 26);

}

void __52__SBSSystemServiceClient_setAccessoryType_attached___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3;
  xpc_object_t xdict;

  v3 = *(_QWORD *)(a1 + 32);
  xdict = a2;
  xpc_dictionary_set_int64(xdict, "accessoryType", v3);
  xpc_dictionary_set_BOOL(xdict, "enabledState", *(_BYTE *)(a1 + 40));

}

- (void)setApplicationBundleIdentifier:(id)a3 blockedForScreenTime:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0D232D0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__SBSSystemServiceClient_setApplicationBundleIdentifier_blockedForScreenTime___block_invoke;
  v10[3] = &unk_1E288EBE8;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  objc_msgSend(v7, "messageWithPacker:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v8, 28);

}

void __78__SBSSystemServiceClient_setApplicationBundleIdentifier_blockedForScreenTime___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "screenTimeBlocked", *(_BYTE *)(a1 + 40));

}

- (void)setTestRunnerRecoveryApplicationBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D232D0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__SBSSystemServiceClient_setTestRunnerRecoveryApplicationBundleIdentifier___block_invoke;
  v8[3] = &unk_1E288E488;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "messageWithPacker:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v6, 29);

}

uint64_t __75__SBSSystemServiceClient_setTestRunnerRecoveryApplicationBundleIdentifier___block_invoke()
{
  return BSSerializeStringToXPCDictionaryWithKey();
}

- (id)acquireHUDHiddenAssertionForIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  SBSAssertion *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D01798]);
  if (objc_msgSend(v5, "isUsable"))
  {
    v6 = (void *)MEMORY[0x1E0D232D0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__SBSSystemServiceClient_acquireHUDHiddenAssertionForIdentifier___block_invoke;
    v18[3] = &unk_1E288EA50;
    v7 = v5;
    v19 = v7;
    v8 = v4;
    v20 = v8;
    objc_msgSend(v6, "messageWithPacker:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v9, 27, &__block_literal_global_39_0, 1, 0.0);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundlePath");
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBSTestAutomationService request from %@"), v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBSAssertion initWithAssertionName:reason:receiveRight:]([SBSAssertion alloc], "initWithAssertionName:reason:receiveRight:", v8, v16, v7);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __65__SBSSystemServiceClient_acquireHUDHiddenAssertionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D017A0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initFromReceiveRight:", *(_QWORD *)(a1 + 32));
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

- (void)countScenesForBundleIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v9 = (void *)MEMORY[0x1E0D232D0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__SBSSystemServiceClient_countScenesForBundleIdentifier_withCompletion___block_invoke;
  v15[3] = &unk_1E288E488;
  v16 = v6;
  v10 = v6;
  objc_msgSend(v9, "messageWithPacker:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __72__SBSSystemServiceClient_countScenesForBundleIdentifier_withCompletion___block_invoke_2;
  v13[3] = &unk_1E288E380;
  v14 = v7;
  v12 = v7;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v11, 30, v13, 0, 0.0);

}

uint64_t __72__SBSSystemServiceClient_countScenesForBundleIdentifier_withCompletion___block_invoke()
{
  return BSSerializeStringToXPCDictionaryWithKey();
}

void __72__SBSSystemServiceClient_countScenesForBundleIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (xdict && MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8])
    xpc_dictionary_get_int64(xdict, "sceneCount");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)stashSwitcherModelToPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D232D0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SBSSystemServiceClient_stashSwitcherModelToPath___block_invoke;
  v8[3] = &unk_1E288E488;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "messageWithPacker:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v6, 31);

}

uint64_t __51__SBSSystemServiceClient_stashSwitcherModelToPath___block_invoke()
{
  return BSSerializeStringToXPCDictionaryWithKey();
}

- (void)loadStashedSwitcherModelFromPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D232D0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__SBSSystemServiceClient_loadStashedSwitcherModelFromPath___block_invoke;
  v8[3] = &unk_1E288E488;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "messageWithPacker:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v6, 32);

}

uint64_t __59__SBSSystemServiceClient_loadStashedSwitcherModelFromPath___block_invoke()
{
  return BSSerializeStringToXPCDictionaryWithKey();
}

- (void)addWidgetsToEachPage
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v3, 33, &__block_literal_global_40, 1, 0.0);

}

- (void)addWidgetWithIdentifier:(id)a3 toPage:(int)a4 withSizing:(int)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  int v14;
  int v15;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0D232D0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__SBSSystemServiceClient_addWidgetWithIdentifier_toPage_withSizing___block_invoke;
  v12[3] = &unk_1E288E438;
  v13 = v8;
  v14 = a4;
  v15 = a5;
  v11 = v8;
  objc_msgSend(v9, "messageWithPacker:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v10, 34, &__block_literal_global_41_0, 1, 0.0);

}

void __68__SBSSystemServiceClient_addWidgetWithIdentifier_toPage_withSizing___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_int64(xdict, "pageInteger", *(int *)(a1 + 40));
  xpc_dictionary_set_int64(xdict, "sizeInteger", *(int *)(a1 + 44));

}

- (void)addWidgetStackWithIdentifiers:(id)a3 toPage:(int)a4 withSizing:(int)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  int v14;
  int v15;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0D232D0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__SBSSystemServiceClient_addWidgetStackWithIdentifiers_toPage_withSizing___block_invoke;
  v12[3] = &unk_1E288E438;
  v13 = v8;
  v14 = a4;
  v15 = a5;
  v11 = v8;
  objc_msgSend(v9, "messageWithPacker:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v10, 35, &__block_literal_global_44, 1, 0.0);

}

void __74__SBSSystemServiceClient_addWidgetStackWithIdentifiers_toPage_withSizing___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  BSSerializeArrayToXPCDictionaryWithKey();
  xpc_dictionary_set_int64(xdict, "pageInteger", *(int *)(a1 + 40));
  xpc_dictionary_set_int64(xdict, "sizeInteger", *(int *)(a1 + 44));

}

xpc_object_t __74__SBSSystemServiceClient_addWidgetStackWithIdentifiers_toPage_withSizing___block_invoke_2(int a1, id a2)
{
  return xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String"));
}

- (void)enterLostMode
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v3, 36);

}

- (void)exitLostMode
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v3, 37);

}

- (BOOL)isChamoisWindowingUIEnabled
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SBSSystemServiceClient_isChamoisWindowingUIEnabled__block_invoke;
  v5[3] = &unk_1E288E410;
  v5[4] = &v6;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v3, 38, v5, 1, 10.0);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __53__SBSSystemServiceClient_isChamoisWindowingUIEnabled__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    xdict = v3;
    v4 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
    v3 = xdict;
    if (v4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "enabledState");
      v3 = xdict;
    }
  }

}

- (void)setChamoisWindowingUIEnabled:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__SBSSystemServiceClient_setChamoisWindowingUIEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v4, 39, &__block_literal_global_45_0, 1, 10.0);

}

void __55__SBSSystemServiceClient_setChamoisWindowingUIEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "enabledState", *(_BYTE *)(a1 + 32));
}

- (BOOL)chamoisPrefersDockHidden
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SBSSystemServiceClient_chamoisPrefersDockHidden__block_invoke;
  v5[3] = &unk_1E288E410;
  v5[4] = &v6;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v3, 40, v5, 1, 10.0);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __50__SBSSystemServiceClient_chamoisPrefersDockHidden__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    xdict = v3;
    v4 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
    v3 = xdict;
    if (v4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "enabledState");
      v3 = xdict;
    }
  }

}

- (void)setChamoisPrefersDockHidden:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SBSSystemServiceClient_setChamoisPrefersDockHidden___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v4, 41, &__block_literal_global_46, 1, 10.0);

}

void __54__SBSSystemServiceClient_setChamoisPrefersDockHidden___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "enabledState", *(_BYTE *)(a1 + 32));
}

- (BOOL)chamoisPrefersStripHidden
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SBSSystemServiceClient_chamoisPrefersStripHidden__block_invoke;
  v5[3] = &unk_1E288E410;
  v5[4] = &v6;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v3, 42, v5, 1, 10.0);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __51__SBSSystemServiceClient_chamoisPrefersStripHidden__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    xdict = v3;
    v4 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
    v3 = xdict;
    if (v4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "enabledState");
      v3 = xdict;
    }
  }

}

- (void)setChamoisHideStripsEnabled:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SBSSystemServiceClient_setChamoisHideStripsEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v4, 43, &__block_literal_global_47_0, 1, 10.0);

}

void __54__SBSSystemServiceClient_setChamoisHideStripsEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "enabledState", *(_BYTE *)(a1 + 32));
}

- (BOOL)deviceSupportsSystemAperture
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SBSSystemServiceClient_deviceSupportsSystemAperture__block_invoke;
  v5[3] = &unk_1E288E410;
  v5[4] = &v6;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v3, 45, v5, 1, 0.0);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __54__SBSSystemServiceClient_deviceSupportsSystemAperture__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v5, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(v4, "deviceSupportsSystemAperture");

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

- (void)setSpringBoardAnimationFrameRecordingEnabledForUpdateTypes:(unint64_t)a3
{
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__SBSSystemServiceClient_setSpringBoardAnimationFrameRecordingEnabledForUpdateTypes___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v4, 48, &__block_literal_global_48, 1, 10.0);

}

void __85__SBSSystemServiceClient_setSpringBoardAnimationFrameRecordingEnabledForUpdateTypes___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_uint64(xdict, "frameUpdateTypes", *(_QWORD *)(a1 + 32));
}

- (void)setSystemApertureUnderAutomationTesting:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__SBSSystemServiceClient_setSystemApertureUnderAutomationTesting___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v4, 50, &__block_literal_global_49_0, 1, 0.0);

}

void __66__SBSSystemServiceClient_setSystemApertureUnderAutomationTesting___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "enabledState", *(_BYTE *)(a1 + 32));
}

- (NSMutableDictionary)animationFrameRecordings
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SBSSystemServiceClient_animationFrameRecordings__block_invoke;
  v6[3] = &unk_1E288E410;
  v6[4] = &v7;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v3, 49, v6, 1, 0.0);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableDictionary *)v4;
}

void __50__SBSSystemServiceClient_animationFrameRecordings__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "payload");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3 && MEMORY[0x193FF8A34](v3) == MEMORY[0x1E0C812F8])
  {
    BSDeserializeDataFromXPCDictionaryWithKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3710];
    v7 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v9, v5, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (NSArray)systemApertureStateDump
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__SBSSystemServiceClient_systemApertureStateDump__block_invoke;
  v6[3] = &unk_1E288E410;
  v6[4] = &v7;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v3, 46, v6, 1, 0.0);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __49__SBSSystemServiceClient_systemApertureStateDump__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a2, "payload");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3 && MEMORY[0x193FF8A34](v3) == MEMORY[0x1E0C812F8])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "systemApertureElementClientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "systemApertureElementIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "systemApertureElementViewLayoutMode");
    v13 = v5;
    v14 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    v8 = v6;
    v9 = v5;
    v10 = BSCreateDeserializedArrayFromXPCDictionaryWithKey();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

id __49__SBSSystemServiceClient_systemApertureStateDump__block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v3 && MEMORY[0x193FF8A34](v3) == MEMORY[0x1E0C812F8])
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v5, a1[4]);

    BSDeserializeStringFromXPCDictionaryWithKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v6, a1[5]);

    BSDeserializeStringFromXPCDictionaryWithKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v7, a1[6]);

  }
  return v4;
}

- (NSMutableArray)systemApertureModelStateDump
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SBSSystemServiceClient_systemApertureModelStateDump__block_invoke;
  v6[3] = &unk_1E288E410;
  v6[4] = &v7;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v3, 51, v6, 1, 0.0);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableArray *)v4;
}

void __54__SBSSystemServiceClient_systemApertureModelStateDump__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    v4 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
    v3 = v9;
    if (v4)
    {
      BSDeserializeDataFromXPCDictionaryWithKey();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 4, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v3 = v9;
    }
  }

}

- (NSDictionary)widgetControllerStateDump
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SBSSystemServiceClient_widgetControllerStateDump__block_invoke;
  v6[3] = &unk_1E288E410;
  v6[4] = &v7;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v3, 47, v6, 1, 0.0);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __51__SBSSystemServiceClient_widgetControllerStateDump__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    v4 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
    v3 = v9;
    if (v4)
    {
      BSDeserializeDataFromXPCDictionaryWithKey();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 4, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v3 = v9;
    }
  }

}

- (id)deserializedStringArrayForKey:(const char *)a3 fromPayload:(id)a4
{
  return (id)BSCreateDeserializedArrayFromXPCDictionaryWithKey();
}

__CFString *__68__SBSSystemServiceClient_deserializedStringArrayForKey_fromPayload___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  __CFString *v4;

  v2 = a2;
  v3 = v2;
  if (v2 && MEMORY[0x193FF8A34](v2) == MEMORY[0x1E0C81390])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_string_get_string_ptr(v3));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E2893CD0;
  }

  return v4;
}

- (void)requestSystemApertureStateDumpWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SBSSystemServiceClient_requestSystemApertureStateDumpWithCompletion___block_invoke;
  v7[3] = &unk_1E288E380;
  v8 = v4;
  v6 = v4;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v5, 53, v7, 0, 0.0);

}

void __71__SBSSystemServiceClient_requestSystemApertureStateDumpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  char *string;
  char *v4;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (xdict && MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8])
  {
    string = (char *)xpc_dictionary_get_string(xdict, "requestSystemApertureStateDump");
    v4 = (char *)xpc_dictionary_get_string(xdict, "systemApertureErrorDescription");
    if (string)
      string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
    if (v4)
      v4 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v4);
  }
  else
  {
    string = 0;
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)writeSystemApertureStateDumpToTextFileAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D232D0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__SBSSystemServiceClient_writeSystemApertureStateDumpToTextFileAtPath___block_invoke;
  v8[3] = &unk_1E288E488;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "messageWithPacker:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v6, 52, &__block_literal_global_64, 1, 0.0);

}

void __71__SBSSystemServiceClient_writeSystemApertureStateDumpToTextFileAtPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  xpc_object_t xdict;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = objc_retainAutorelease(v2);
    xdict = a2;
    xpc_dictionary_set_string(xdict, "stateDumpTextFilePath", (const char *)objc_msgSend(v4, "UTF8String"));

  }
}

- (void)requestStateDump:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__SBSSystemServiceClient_requestStateDump_withCompletion___block_invoke;
  v12[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v12[4] = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __58__SBSSystemServiceClient_requestStateDump_withCompletion___block_invoke_2;
  v10[3] = &unk_1E288E380;
  v11 = v6;
  v9 = v6;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v8, 54, v10, 0, 0.0);

}

void __58__SBSSystemServiceClient_requestStateDump_withCompletion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_uint64(xdict, "stateDumpType", *(_QWORD *)(a1 + 32));
}

void __58__SBSSystemServiceClient_requestStateDump_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  __CFString *v4;
  const char *string;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (xdict && MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_BOOL(xdict, "stateDumpSuccess");
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", xpc_dictionary_get_string(xdict, "stateData"));
    string = xpc_dictionary_get_string(xdict, "stateDumpSuccessDescription");
    if (string)
    {
      v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
      goto LABEL_5;
    }
  }
  else
  {
    v3 = 0;
  }
  v4 = CFSTR("Error, corrupted XPC payload.");
LABEL_5:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)writeStateDump:(unint64_t)a3 toTextFileAtPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D232D0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__SBSSystemServiceClient_writeStateDump_toTextFileAtPath___block_invoke;
  v10[3] = &unk_1E288E438;
  v11 = v6;
  v12 = a3;
  v9 = v6;
  objc_msgSend(v7, "messageWithPacker:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v8, 55, &__block_literal_global_67_0, 1, 0.0);

}

void __58__SBSSystemServiceClient_writeStateDump_toTextFileAtPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_uint64(xdict, "stateDumpType", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  if (v3)
    xpc_dictionary_set_string(xdict, "stateDumpTextFilePath", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));

}

- (void)enableRemoteStateDumpWithTimeout:(int64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__SBSSystemServiceClient_enableRemoteStateDumpWithTimeout_completion___block_invoke;
  v12[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v12[4] = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __70__SBSSystemServiceClient_enableRemoteStateDumpWithTimeout_completion___block_invoke_2;
  v10[3] = &unk_1E288E380;
  v11 = v6;
  v9 = v6;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v8, 56, v10, 0, 0.0);

}

void __70__SBSSystemServiceClient_enableRemoteStateDumpWithTimeout_completion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, "remoteStateDumpTimeout", *(_QWORD *)(a1 + 32));
}

void __70__SBSSystemServiceClient_enableRemoteStateDumpWithTimeout_completion___block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v3;
  const char *string;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (xdict
    && MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8]
    && (xpc_dictionary_get_BOOL(xdict, "stateDumpSuccess"),
        (string = xpc_dictionary_get_string(xdict, "stateDumpSuccessDescription")) != 0))
  {
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  }
  else
  {
    v3 = CFSTR("Error, corrupted XPC payload.");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)disableRemoteStateDumpWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D232D0], "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__SBSSystemServiceClient_disableRemoteStateDumpWithCompletion___block_invoke;
  v7[3] = &unk_1E288E380;
  v8 = v4;
  v6 = v4;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v5, 57, v7, 0, 0.0);

}

void __63__SBSSystemServiceClient_disableRemoteStateDumpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  const char *string;
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (xdict
    && MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8]
    && (xpc_dictionary_get_BOOL(xdict, "stateDumpSuccess"),
        (string = xpc_dictionary_get_string(xdict, "stateDumpSuccessDescription")) != 0))
  {
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  }
  else
  {
    v3 = CFSTR("Error, corrupted XPC payload.");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)handleMessage:(id)a3 withType:(int64_t)a4
{
  if (!a4)
    -[SBSSystemServiceClient _handleButtonEventConsumePressMessage:](self, "_handleButtonEventConsumePressMessage:", a3);
}

- (void)setChamoisPrefersStripHidden:(BOOL)a3
{
  self->_chamoisPrefersStripHidden = a3;
}

- (BOOL)systemApertureUnderAutomationTesting
{
  return self->_systemApertureUnderAutomationTesting;
}

@end
