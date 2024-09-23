@implementation FBSDisplayConfiguration(PRUISAdditions)

+ (id)pruis_hardwareIdentifierForRequest:()PRUISAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BE38090];
  v4 = a3;
  objc_msgSend(v3, "pui_sharedDisplayMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "displayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationForIdentity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pui_displayConfigurationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
