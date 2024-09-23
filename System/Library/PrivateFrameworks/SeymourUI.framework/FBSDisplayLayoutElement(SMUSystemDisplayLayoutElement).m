@implementation FBSDisplayLayoutElement(SMUSystemDisplayLayoutElement)

- (id)extendedDescription
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CGRect v12;

  v2 = (void *)MEMORY[0x24BDD16A8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "level");
  objc_msgSend(a1, "frame");
  NSStringFromCGRect(v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p> identifier=%@, bundle=%@, level=%lu, frame=%@"), v4, a1, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "layoutRole");
  SBSDisplayLayoutRoleDescription();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(", role=%@"), v10);

  if (objc_msgSend(a1, "smu_isPictureInPicture"))
    objc_msgSend(v9, "appendFormat:", CFSTR(", %s"), "isPictureInPicture");
  if (objc_msgSend(a1, "smu_isPictureInPictureStashed"))
    objc_msgSend(v9, "appendFormat:", CFSTR(", %s"), "isPictureInPictureStashed");
  if (objc_msgSend(a1, "smu_isSystemOverlay"))
    objc_msgSend(v9, "appendFormat:", CFSTR(", %s"), "isSystemOverlay");
  if (objc_msgSend(a1, "smu_isSystemIndicator"))
    objc_msgSend(v9, "appendFormat:", CFSTR(", %s"), "isSystemIndicator");
  if (objc_msgSend(a1, "smu_isControlCenter"))
    objc_msgSend(v9, "appendFormat:", CFSTR(", %s"), "isControlCenter");
  if (objc_msgSend(a1, "smu_isVolumeHUD"))
    objc_msgSend(v9, "appendFormat:", CFSTR(", %s"), "isVolumeHUD");
  if (objc_msgSend(a1, "smu_isSystemNotification"))
    objc_msgSend(v9, "appendFormat:", CFSTR(", %s"), "isSystemNotification");
  if (objc_msgSend(a1, "smu_isBrightnessControlHUD"))
    objc_msgSend(v9, "appendFormat:", CFSTR(", %s"), "isBrightnessControlHUD");
  return v9;
}

- (BOOL)smu_isSystemOverlay
{
  return objc_msgSend(a1, "layoutRole") == 4;
}

- (BOOL)smu_isPictureInPicture
{
  return objc_msgSend(a1, "layoutRole") == 5;
}

- (uint64_t)smu_isSystemNotification
{
  return 0;
}

- (uint64_t)smu_isSystemIndicator
{
  return 0;
}

- (uint64_t)smu_isControlCenter
{
  return 0;
}

- (BOOL)smu_isBrightnessControlHUD
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 == (void *)*MEMORY[0x24BEB0CC0];

  return v2;
}

- (BOOL)smu_isVolumeHUD
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 == (void *)*MEMORY[0x24BEB0CC8];

  return v2;
}

@end
