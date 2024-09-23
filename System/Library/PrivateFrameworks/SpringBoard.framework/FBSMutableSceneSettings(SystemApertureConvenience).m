@implementation FBSMutableSceneSettings(SystemApertureConvenience)

- (void)SBUI_applySystemApertureTransitionParameters:()SystemApertureConvenience
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "otherSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "otherSystemApertureSceneSettingsToApply");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "applySettings:", v5);
}

@end
