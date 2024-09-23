@implementation PBUIWallpaperImageSlotRequestAction

- (PBUIWallpaperImageSlotRequestAction)initWithVariant:(int64_t)a3 desiredStyle:(int64_t)a4 traitCollection:(id)a5 slotIdentifier:(id)a6 forResponseOnQueue:(id)a7 withHandler:(id)a8
{
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PBUIWallpaperImageSlotRequestAction *v25;
  PBUIWallpaperImageSlotRequestAction *v26;
  objc_super v28;

  v14 = a7;
  v15 = a8;
  v16 = (objc_class *)MEMORY[0x1E0D017D0];
  v17 = a6;
  v18 = a5;
  v19 = objc_alloc_init(v16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forSetting:", v20, 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forSetting:", v21, 2);

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setObject:forSetting:", v22, 3);
  objc_msgSend(v19, "setObject:forSetting:", v17, 4);

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D016A0], "responderWithHandler:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v14)
      objc_msgSend(v23, "setQueue:", v14);
  }
  else
  {
    v24 = 0;
  }
  v28.receiver = self;
  v28.super_class = (Class)PBUIWallpaperImageSlotRequestAction;
  v25 = -[PBUIWallpaperImageSlotRequestAction initWithInfo:responder:](&v28, sel_initWithInfo_responder_, v19, v24);
  v26 = v25;
  if (v25)
    objc_storeStrong((id *)&v25->_responder, v24);

  return v26;
}

- (int64_t)variant
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PBUIWallpaperImageSlotRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)desiredStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PBUIWallpaperImageSlotRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (UITraitCollection)traitCollection
{
  void *v2;
  void *v3;
  void *v4;

  -[PBUIWallpaperImageSlotRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v4;
}

- (NSString)slotIdentifier
{
  void *v2;
  void *v3;

  -[PBUIWallpaperImageSlotRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)invalidate
{
  BSActionResponder *responder;
  BSActionResponder *v4;
  objc_super v5;

  responder = self->_responder;
  if (responder)
  {
    -[BSActionResponder annul](responder, "annul");
    v4 = self->_responder;
    self->_responder = 0;

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PBUIWallpaperImageSlotRequestAction;
    -[PBUIWallpaperImageSlotRequestAction invalidate](&v5, sel_invalidate);
  }
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  else
    return off_1E6B94878[a3 - 1];
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = v6;
  if (a5 == 2)
  {
    PBUIWallpaperStyleDescription(objc_msgSend(v6, "integerValue"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a5 != 1)
    {
      v9 = 0;
      goto LABEL_7;
    }
    PBUIStringForWallpaperVariant(objc_msgSend(v6, "integerValue"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_7:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responder, 0);
}

@end
