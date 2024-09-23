@implementation SBSUIScreenSharingOverlaySceneClientSettingsExtension

+ (id)protocol
{
  return &unk_1EE7D2768;
}

+ (id)valueForUndefinedSetting:(id)a3
{
  id v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  _OWORD v10[3];

  v4 = a3;
  if (objc_msgSend(v4, "matchesProperty:", sel_preferredSystemRootTransform))
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v10[0] = *MEMORY[0x1E0C9BAA8];
    v10[1] = v5;
    v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGAffineTransform:", v10);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___SBSUIScreenSharingOverlaySceneClientSettingsExtension;
    objc_msgSendSuper2(&v9, sel_valueForUndefinedSetting_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

@end
