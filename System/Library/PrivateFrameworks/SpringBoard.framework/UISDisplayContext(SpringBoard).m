@implementation UISDisplayContext(SpringBoard)

+ (id)sb_embeddedDisplayDefaultContext
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "mainConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC5BD8], "defaultContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisplayConfiguration:", v1);
  objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisplayEdgeInfo:", v3);

  objc_msgSend(MEMORY[0x1E0DC5BB8], "sb_thisDeviceDisplayShape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExclusionArea:", v4);

  objc_msgSend(v2, "setArtworkSubtype:", SBFEffectiveArtworkSubtype());
  v5 = (void *)SBApp;
  objc_msgSend(v1, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInterfaceStyleProviderForDisplay:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setUserInterfaceStyle:", objc_msgSend(v7, "currentStyle"));
  return v2;
}

+ (id)sb_defaultContextForDisplayConfiguration:()SpringBoard
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isMainRootDisplay"))
  {
    objc_msgSend((id)objc_opt_class(), "sb_embeddedDisplayDefaultContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC5BD8]), "initWithDisplayConfiguration:", v3);
    objc_msgSend(v4, "setDisplayEdgeInfo:", 0);
    objc_msgSend(v4, "setExclusionArea:", 0);
    objc_msgSend(v4, "setArtworkSubtype:", SBFEffectiveArtworkSubtype());
    v5 = (void *)SBApp;
    objc_msgSend(v3, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInterfaceStyleProviderForDisplay:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v7, "currentStyle"));
  }

  return v4;
}

+ (id)sb_mainThreadFree_embeddedDisplayDefaultContext
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC5BD8], "defaultContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mainConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDisplayConfiguration:", v2);

  objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDisplayEdgeInfo:", v3);

  objc_msgSend(MEMORY[0x1E0DC5BB8], "sb_thisDeviceDisplayShape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setExclusionArea:", v4);

  objc_msgSend(v0, "setArtworkSubtype:", SBFEffectiveArtworkSubtype());
  return v0;
}

@end
