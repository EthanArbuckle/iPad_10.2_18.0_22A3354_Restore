@implementation UIApplicationPackedMinimumDeploymentVersion

void ___UIApplicationPackedMinimumDeploymentVersion_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("MinimumOSVersion"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  _MergedGlobals_1325 = _UIApplicationPackedDeploymentVersionFromString(v2);
}

@end
