@implementation SBUIBannerSourceApplicationSceneSpecification

+ (id)specificationAffectingAppLifecycleIfInternal:(BOOL)a3
{
  if (!a3)
    a1 = SBUIBannerSourceApplicationNonAffectingAppLifecycleSceneSpecification;
  objc_msgSend(a1, "specification");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultExtensions
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getAMUIAmbientPresentationSceneExtensionClass_softClass;
  v9 = getAMUIAmbientPresentationSceneExtensionClass_softClass;
  if (!getAMUIAmbientPresentationSceneExtensionClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getAMUIAmbientPresentationSceneExtensionClass_block_invoke;
    v5[3] = &unk_1E4C3E458;
    v5[4] = &v6;
    __getAMUIAmbientPresentationSceneExtensionClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  v10[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

@end
