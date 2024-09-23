@implementation _UIColorSampler

- (_UIColorSampler)init
{
  _UIColorSampler *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIColorSampler;
  result = -[_UIColorSampler init](&v3, sel_init);
  if (result)
    result->_floatEyedropperOnStart = 1;
  return result;
}

- (void)showSamplerWithSelectionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id eyeDropperSelectionBlock;
  _QWORD aBlock[4];
  id v9;

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51___UIColorSampler_showSamplerWithSelectionHandler___block_invoke;
  aBlock[3] = &unk_1E16E37C0;
  v5 = v4;
  v9 = v5;
  v6 = _Block_copy(aBlock);
  eyeDropperSelectionBlock = self->_eyeDropperSelectionBlock;
  self->_eyeDropperSelectionBlock = v6;

  -[_UIColorSampler invokeEyedropper](self, "invokeEyedropper");
  if (-[_UIColorSampler floatEyedropperOnStart](self, "floatEyedropperOnStart"))
    -[_UIColorSampler floatEyedropper](self, "floatEyedropper");

}

- (void)setFloatEyedropperOnStart:(BOOL)a3
{
  self->_floatEyedropperOnStart = a3;
}

- (BOOL)floatEyedropperOnStart
{
  return self->_floatEyedropperOnStart;
}

- (void)_createServerProxyIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  EDServiceServer *v8;
  EDServiceServer *eyeDropperServerProxy;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[4];
  id v14;

  if (!self->_eyeDropperServerProxy)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.uikit.eyedropperd.service"), 0);
    objc_storeStrong((id *)&self->_eyeDropperConnection, v3);
    v4 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45___UIColorSampler__createServerProxyIfNeeded__block_invoke;
    v13[3] = &unk_1E16B1B28;
    v5 = v3;
    v14 = v5;
    -[NSXPCConnection setInterruptionHandler:](self->_eyeDropperConnection, "setInterruptionHandler:", v13);
    objc_initWeak(&location, self);
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __45___UIColorSampler__createServerProxyIfNeeded__block_invoke_2;
    v10[3] = &unk_1E16B3F40;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_eyeDropperConnection, "setInvalidationHandler:", v10);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0CEF48);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_eyeDropperConnection, "setRemoteObjectInterface:", v6);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0CEFA8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_eyeDropperConnection, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_eyeDropperConnection, "setExportedObject:", self);
    -[NSXPCConnection resume](self->_eyeDropperConnection, "resume");
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_eyeDropperConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_59_2);
    v8 = (EDServiceServer *)objc_claimAutoreleasedReturnValue();
    eyeDropperServerProxy = self->_eyeDropperServerProxy;
    self->_eyeDropperServerProxy = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

- (void)invokeEyedropper
{
  EDServiceServer *eyeDropperServerProxy;
  void *v4;
  void *v5;
  id v6;

  -[_UIColorSampler _createServerProxyIfNeeded](self, "_createServerProxyIfNeeded");
  eyeDropperServerProxy = self->_eyeDropperServerProxy;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hardwareIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDServiceServer beginShowingEyeDropper:](eyeDropperServerProxy, "beginShowingEyeDropper:", v5);

}

- (void)floatEyedropper
{
  -[_UIColorSampler _createServerProxyIfNeeded](self, "_createServerProxyIfNeeded");
  -[EDServiceServer floatEyeDropper](self->_eyeDropperServerProxy, "floatEyeDropper");
}

- (void)dismissEyedropper
{
  -[_UIColorSampler _createServerProxyIfNeeded](self, "_createServerProxyIfNeeded");
  -[EDServiceServer cancelShowingEyeDropper](self->_eyeDropperServerProxy, "cancelShowingEyeDropper");
}

- (void)eyedropperDidSelectColor:(id)a3
{
  void (**eyeDropperSelectionBlock)(id, id);

  eyeDropperSelectionBlock = (void (**)(id, id))self->_eyeDropperSelectionBlock;
  if (eyeDropperSelectionBlock)
    eyeDropperSelectionBlock[2](eyeDropperSelectionBlock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eyeDropperSelectionBlock, 0);
  objc_storeStrong((id *)&self->_eyeDropperConnection, 0);
  objc_storeStrong((id *)&self->_eyeDropperServerProxy, 0);
}

@end
