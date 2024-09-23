@implementation RCPlatterViewControllerCoordinator

- (void)activeLayoutModeDidChangeForPlatterViewController:previousActiveLayoutMode:
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  double v31;
  double v32;
  double v33;
  id v34;

  v0 = objc_msgSend((id)objc_opt_self(RecorderAppDelegate), "sharedAppDelegate");
  if (v0)
  {
    v1 = v0;
    v2 = objc_msgSend(v0, "defaultSceneDelegate");
    if (v2)
    {
      v3 = v2;
      v4 = objc_msgSend(v1, "connectedLockScreenSceneDelegate");
      if (v4)
      {
        v5 = v4;
        v6 = objc_msgSend(v1, "dynamicIslandSceneDelegate");
        if (v6)
        {
          v7 = v6;
          v8 = objc_msgSend(v3, "isInForeground");
          v9 = objc_msgSend(v5, "isInForeground");
          v10 = objc_msgSend(v7, "platterViewController");
          v11 = objc_msgSend(v10, "activeLayoutMode");

          v12 = objc_msgSend((id)objc_opt_self(RCRecorderStyleProvider), "sharedStyleProvider");
          if (v12)
          {
            v13 = v12;
            objc_msgSend(v12, "displayRefreshRate:", (v11 != (id)4) & ~(v8 | v9));
            v15 = v14;
            v17 = v16;
            v19 = v18;

            v34 = objc_msgSend((id)objc_opt_self(RCDisplayLinkManager), "sharedManager");
            LODWORD(v20) = v15;
            LODWORD(v21) = v17;
            LODWORD(v22) = v19;
            objc_msgSend(v34, "setPreferredFrameRateRange:", v20, v21, v22);

LABEL_13:
            return;
          }
          goto LABEL_15;
        }

        v1 = v3;
      }
      else
      {
        v5 = v3;
      }

      v1 = v5;
    }

  }
  v23 = objc_msgSend((id)objc_opt_self(RCRecorderStyleProvider), "sharedStyleProvider");
  if (v23)
  {
    v24 = v23;
    objc_msgSend(v23, "displayRefreshRate:", 0);
    v26 = v25;
    v28 = v27;
    v30 = v29;

    v34 = objc_msgSend((id)objc_opt_self(RCDisplayLinkManager), "sharedManager");
    LODWORD(v31) = v26;
    LODWORD(v32) = v28;
    LODWORD(v33) = v30;
    objc_msgSend(v34, "setPreferredFrameRateRange:", v31, v32, v33);
    goto LABEL_13;
  }
  __break(1u);
LABEL_15:
  __break(1u);
}

- (void)stopCapturingForPlatterViewController:(id)a3
{
  void *v5;
  RCPlatterViewControllerCoordinator *v6;
  id v7;
  void *v8;
  id v9;
  RCPlatterViewControllerCoordinator *v10;
  RCPlatterViewControllerCoordinator *v11;

  v5 = (void *)objc_opt_self(RecorderAppDelegate);
  v6 = (RCPlatterViewControllerCoordinator *)a3;
  v11 = self;
  v7 = objc_msgSend(v5, "sharedAppDelegate");
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "defaultSceneDelegate");

    if (v9)
    {
      v10 = (RCPlatterViewControllerCoordinator *)objc_msgSend(v9, "mainViewController");

      -[RCPlatterViewControllerCoordinator endRecording](v10, "endRecording");
      v6 = v11;
      v11 = v10;
    }
  }

}

- (void)backlightLuminanceDidChangeForPlatterViewController:(id)a3
{
  id v4;
  RCPlatterViewControllerCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100103D4C((uint64_t)v4);

}

- (RCPlatterViewControllerCoordinator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlatterViewControllerCoordinator();
  return -[RCPlatterViewControllerCoordinator init](&v3, "init");
}

@end
