@implementation SBTraitsArbiterOrientationActuationEnabledForRole

void __SBTraitsArbiterOrientationActuationEnabledForRole_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[10];

  v7[9] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("SBTraitsParticipantRoleInteractiveScreenshotGesture");
  v7[1] = CFSTR("SBTraitsParticipantRoleModifierTimeline");
  v0 = *MEMORY[0x1E0CEC360];
  v7[2] = *MEMORY[0x1E0CEC358];
  v7[3] = v0;
  v1 = *MEMORY[0x1E0CEC378];
  v7[4] = *MEMORY[0x1E0CEC368];
  v7[5] = v1;
  v2 = *MEMORY[0x1E0CEC380];
  v7[6] = *MEMORY[0x1E0CEC370];
  v7[7] = v2;
  v7[8] = *MEMORY[0x1E0CEC388];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!_os_feature_enabled_impl() || _os_feature_enabled_impl())
    objc_msgSend(v4, "addObject:", CFSTR("SBTraitsParticipantRoleWallpaper"));
  if ((_os_feature_enabled_impl() & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
    objc_msgSend(v4, "addObject:", CFSTR("SBTraitsParticipantRoleStatusBar"));
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)SBTraitsArbiterOrientationActuationEnabledForRole__yetToBeManagedTraitsRoles;
  SBTraitsArbiterOrientationActuationEnabledForRole__yetToBeManagedTraitsRoles = v5;

}

@end
