@implementation CKContainer(ScreenTimeCore)

+ (const)remotemanagement_mirroringContainerIdentifier
{
  void *v0;
  int v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("UseValidationContainer"));

  if (v1)
    return CFSTR("com.apple.remotemanagement.encrypted.qa");
  else
    return CFSTR("com.apple.remotemanagement.encrypted");
}

+ (id)remotemanagement_mirroringContainer
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C94C28];
  objc_msgSend(a1, "remotemanagement_mirroringContainerIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "containerWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
