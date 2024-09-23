@implementation SBSRemoteAlertDefinition(SBAdditions)

+ (id)definitionWithServiceName:()SBAdditions legacyAlertOptions:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "bs_safeStringForKey:", *MEMORY[0x1E0DABA48]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend([a1 alloc], "initWithServiceName:viewControllerClassName:", v6, v8);
    if (objc_msgSend(v7, "bs_BOOLForKey:", *MEMORY[0x1E0DAB9E8]))
      objc_msgSend(v9, "setForCarPlay:", 1);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
