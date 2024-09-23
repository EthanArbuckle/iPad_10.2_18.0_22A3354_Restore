@implementation PBUIWallpaperEffectImageRequestAction

- (PBUIWallpaperEffectImageRequestAction)initWithSlotIdentifier:(id)a3 forResponseOnQueue:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  PBUIWallpaperEffectImageRequestAction *v15;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0D017D0];
  v11 = a3;
  v12 = objc_alloc_init(v10);
  objc_msgSend(v12, "setObject:forSetting:", v11, 1);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D016A0], "responderWithHandler:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v8)
      objc_msgSend(v13, "setQueue:", v8);
  }
  else
  {
    v14 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)PBUIWallpaperEffectImageRequestAction;
  v15 = -[PBUIWallpaperEffectImageRequestAction initWithInfo:responder:](&v17, sel_initWithInfo_responder_, v12, v14);

  return v15;
}

- (NSString)slotIdentifier
{
  void *v2;
  void *v3;

  -[PBUIWallpaperEffectImageRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("slotIdentifier");
  else
    return 0;
}

@end
