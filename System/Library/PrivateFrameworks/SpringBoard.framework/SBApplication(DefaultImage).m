@implementation SBApplication(DefaultImage)

- (void)_snapshotsWithImageName:()DefaultImage sceneHandle:referenceSize:requireExactSize:launchingScale:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "A snapshot was requested for bundleID: <%{public}@> when the manifest for the app is nil.", v4, 0xCu);

  OUTLINED_FUNCTION_2_2();
}

@end
