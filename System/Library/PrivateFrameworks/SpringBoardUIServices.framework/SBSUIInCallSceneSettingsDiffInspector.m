@implementation SBSUIInCallSceneSettingsDiffInspector

- (void)observeInCallPresentationModeWithBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__SBSUIInCallSceneSettingsDiffInspector_observeInCallPresentationModeWithBlock___block_invoke;
    v6[3] = &unk_1E4C3F140;
    v7 = v4;
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", 3001, v6);

  }
}

uint64_t __80__SBSUIInCallSceneSettingsDiffInspector_observeInCallPresentationModeWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)observeAttachedToWindowedAccessoryWithBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __85__SBSUIInCallSceneSettingsDiffInspector_observeAttachedToWindowedAccessoryWithBlock___block_invoke;
    v10[3] = &unk_1E4C3F140;
    v7 = v4;
    v11 = v7;
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", 3002, v10);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __85__SBSUIInCallSceneSettingsDiffInspector_observeAttachedToWindowedAccessoryWithBlock___block_invoke_2;
    v8[3] = &unk_1E4C3F140;
    v9 = v7;
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", 3003, v8);

  }
}

uint64_t __85__SBSUIInCallSceneSettingsDiffInspector_observeAttachedToWindowedAccessoryWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__SBSUIInCallSceneSettingsDiffInspector_observeAttachedToWindowedAccessoryWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
