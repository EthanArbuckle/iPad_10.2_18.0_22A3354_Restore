@implementation SBSUserNotificationSystemImageDefinition(SBUserNotificationImageResolving)

- (id)sb_resolvedImage
{
  void *v1;
  void *v2;
  NSObject *v3;

  objc_msgSend(a1, "systemImageName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    SBLogAlertItems();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SBSUserNotificationSystemImageDefinition(SBUserNotificationImageResolving) sb_resolvedImage].cold.1((uint64_t)v1, v3);

  }
  return v2;
}

- (id)sb_resolvedTintColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "tintColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_resolvedColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)sb_resolvedImage
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Unable to find system image with name: %{public}@.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

@end
