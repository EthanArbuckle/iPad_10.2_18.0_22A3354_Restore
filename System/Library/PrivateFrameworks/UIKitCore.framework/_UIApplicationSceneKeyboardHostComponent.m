@implementation _UIApplicationSceneKeyboardHostComponent

- (void)setScene:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIApplicationSceneKeyboardHostComponent;
  -[FBSSceneComponent setScene:](&v4, sel_setScene_, a3);
  -[_UIApplicationSceneKeyboardHostComponent setHardwareKeyboardExclusivityIdentifier:](self, "setHardwareKeyboardExclusivityIdentifier:", 0);
}

- (void)setMinimumKeyboardPadding:(UIEdgeInsets)a3 forSettings:(id)a4
{
  objc_msgSend(a4, "setMinimumKeyboardPadding:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setKeyboardDockDisabled:(BOOL)a3 forSettings:(id)a4
{
  objc_msgSend(a4, "setKeyboardDockDisabled:", a3);
}

- (void)setHardwareKeyboardExclusivityIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85___UIApplicationSceneKeyboardHostComponent_setHardwareKeyboardExclusivityIdentifier___block_invoke;
  v7[3] = &unk_1E16E05B8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateSettings:", v7);

}

- (BOOL)suppressKeyboardFocusRequests
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "suppressKeyboardFocusRequests");

  return v4;
}

- (id)suppressKeyboardFocusRequestsForReason:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __83___UIApplicationSceneKeyboardHostComponent_suppressKeyboardFocusRequestsForReason___block_invoke;
  v13 = &unk_1E16B7FF8;
  objc_copyWeak(&v14, &location);
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:invalidationBlock:", v7, v4, &v10);

  ++*((_DWORD *)&self->super._invalid + 1);
  -[_UIApplicationSceneKeyboardHostComponent evaluateKeyboardSuppressionSettingForActiveAssertions](self, "evaluateKeyboardSuppressionSettingForActiveAssertions", v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

- (void)evaluateKeyboardSuppressionSettingForActiveAssertions
{
  int v3;
  id v4;
  _QWORD v5[4];
  BOOL v6;

  v3 = *((_DWORD *)&self->super._invalid + 1);
  if ((v3 != 0) != -[_UIApplicationSceneKeyboardHostComponent suppressKeyboardFocusRequests](self, "suppressKeyboardFocusRequests"))
  {
    -[FBSSceneComponent hostScene](self, "hostScene");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __97___UIApplicationSceneKeyboardHostComponent_evaluateKeyboardSuppressionSettingForActiveAssertions__block_invoke;
    v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
    v6 = v3 != 0;
    objc_msgSend(v4, "updateSettings:", v5);

  }
}

@end
