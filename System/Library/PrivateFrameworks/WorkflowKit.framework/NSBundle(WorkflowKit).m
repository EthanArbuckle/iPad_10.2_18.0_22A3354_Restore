@implementation NSBundle(WorkflowKit)

- (uint64_t)wf_isWidgetConfigurationExtensionBundle
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DC7F90]);

  return v2;
}

- (uint64_t)wf_isFocusConfigurationExtensionBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0DC7F50]) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC7F58]);

  }
  return v3;
}

@end
