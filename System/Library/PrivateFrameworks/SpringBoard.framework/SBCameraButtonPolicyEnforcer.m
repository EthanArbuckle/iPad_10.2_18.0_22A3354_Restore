@implementation SBCameraButtonPolicyEnforcer

- (void)enforce:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(v6, "advicePolicy");
  objc_msgSend((id)SBApp, "cameraHardwareButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = 0;
  else
    v5 = objc_msgSend(v6, "cameraIsHosted") ^ 1;
  objc_msgSend(v4, "setDisableDeferringToApplications:", v5);

}

@end
