@implementation XBApplicationSnapshotManifest(Capture)

- (id)createSnapshotForSceneSnapshot:()Capture withName:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sceneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "createSnapshotWithGroupID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8F18], "normalizeSnapshotName:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setName:", v11);

    if (objc_msgSend(v8, "orientation") == 1)
    {
      objc_msgSend(v10, "setInterfaceOrientation:", 1);
    }
    else
    {
      objc_msgSend(v8, "settings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setInterfaceOrientation:", objc_msgSend(v12, "interfaceOrientation"));

    }
    objc_msgSend(v8, "frame");
    objc_msgSend(v10, "setReferenceSize:", v13, v14);
    objc_msgSend(v8, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v8, "settings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v24 = v19 == v23 && v17 == v22;
    objc_msgSend(v10, "setFullScreen:", v24);

    objc_msgSend(v10, "setContentType:", 0);
    objc_msgSend(v8, "expirationDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExpirationDate:", v25);

    objc_msgSend(v10, "setUserInterfaceStyle:", XBGetUIUserInterfaceStyleForSceneSnapshot(v6));
    XBGetCustomSafeAreaInsetsForSceneSnapshot(v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCustomSafeAreaInsets:", v26);
    objc_msgSend(v8, "clientSettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isUISubclass"))
    {
      v28 = objc_alloc_init(MEMORY[0x1E0DA8F60]);
      objc_msgSend(v28, "setHidden:", objc_msgSend(v27, "statusBarHidden"));
      objc_msgSend(v28, "setStyle:", objc_msgSend(v27, "statusBarStyle"));
      objc_msgSend(v10, "setStatusBarSettings:", v28);
      objc_msgSend(v10, "setBackgroundStyle:", objc_msgSend(v27, "backgroundStyle"));

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
