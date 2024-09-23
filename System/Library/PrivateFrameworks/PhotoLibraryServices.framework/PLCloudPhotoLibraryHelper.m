@implementation PLCloudPhotoLibraryHelper

+ (void)enableCPL:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedPrimaryAppleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:forDataclass:", 1, *MEMORY[0x1E0C8F380]);
  objc_msgSend(v5, "setEnabled:forDataclass:", 0, *MEMORY[0x1E0C8F3D8]);
  objc_msgSend(v6, "saveAccount:withDataclassActions:doVerify:completion:", v5, 0, 0, v4);

  objc_msgSend(a1, "_donateTipsAppEnablementSignal");
}

+ (void)disableCPL:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedPrimaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:forDataclass:", 0, *MEMORY[0x1E0C8F380]);
  objc_msgSend(v5, "saveAccount:withDataclassActions:doVerify:completion:", v4, 0, 0, v3);

}

+ (void)_donateTipsAppEnablementSignal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D01FF0]), "initWithContentIdentifier:context:osBuild:userInfo:", CFSTR("com.apple.mobileslideshow.icpl-enabled"), CFSTR("com.apple.mobileslideshow"), 0, 0);
  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "Discoverability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Signals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sendEvent:", v6);
}

@end
