@implementation _UISceneInterfaceProtectionHostComponent

- (void)setUnderAppProtection:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66___UISceneInterfaceProtectionHostComponent_setUnderAppProtection___block_invoke;
  v5[3] = &__block_descriptor_33_e75_v16__0__FBSMutableSceneSettings__UISceneInterfaceProtectionSceneSettings__8l;
  v6 = a3;
  objc_msgSend(v4, "updateSettingsWithBlock:", v5);

}

- (void)configureInitialSettings:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "transientLocalSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "flagForSetting:", 20230216);

  if (v4 == 1)
    objc_msgSend(v5, "setUnderAppProtection:", 1);

}

@end
