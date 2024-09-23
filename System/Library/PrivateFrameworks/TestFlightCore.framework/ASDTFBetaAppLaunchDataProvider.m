@implementation ASDTFBetaAppLaunchDataProvider

- (void)loadLaunchScreenForBundleWithURL:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BDC1540];
  v7 = a3;
  v15 = 0;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithURL:allowPlaceholder:error:", v7, 0, &v15);

  v9 = v15;
  objc_msgSend(v8, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __89__ASDTFBetaAppLaunchDataProvider_loadLaunchScreenForBundleWithURL_withCompletionHandler___block_invoke;
    v13[3] = &unk_24D794BE0;
    v14 = v5;
    objc_msgSend(v12, "getLaunchInfoForBundleID:withCompletionHandler:", v10, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v5 + 2))(v5, 0, v9);
  }

}

void __89__ASDTFBetaAppLaunchDataProvider_loadLaunchScreenForBundleWithURL_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__ASDTFBetaAppLaunchDataProvider_loadLaunchScreenForBundleWithURL_withCompletionHandler___block_invoke_2;
  block[3] = &unk_24D794BB8;
  v11 = v6;
  v7 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __89__ASDTFBetaAppLaunchDataProvider_loadLaunchScreenForBundleWithURL_withCompletionHandler___block_invoke_2(_QWORD *a1)
{
  id v2;

  if (a1[4])
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    +[TFLaunchScreenBuilder buildLaunchScreenFromBetaAppLaunchInfo:](TFLaunchScreenBuilder, "buildLaunchScreenFromBetaAppLaunchInfo:", a1[5]);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[6] + 16))();

  }
}

@end
