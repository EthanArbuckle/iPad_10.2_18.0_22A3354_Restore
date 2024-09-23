@implementation UIBannerAction

- (int64_t)UIActionType
{
  return 33;
}

- (UIBannerAction)initWithBannerContent:(id)a3
{
  return (UIBannerAction *)-[UIBannerAction _initWithBannerContent:responseHandler:](self, "_initWithBannerContent:responseHandler:", a3, 0);
}

- (id)_initWithBannerContent:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  UIBannerAction *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("UIBannerContentKey"));
  objc_msgSend(v9, "encodedData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v10, 1);

  v11 = v7 != 0;
  if (!v7)
    v7 = &__block_literal_global_220;
  objc_msgSend(v8, "setFlag:forSetting:", v11, 2);
  v14.receiver = self;
  v14.super_class = (Class)UIBannerAction;
  v12 = -[UIBannerAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v14, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v8, MEMORY[0x1E0C80D38], v7, 0.0);

  return v12;
}

- (_UIBannerContent)bannerContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIBannerAction info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, 0);
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIBannerContentKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishDecoding");
    v7 = v6;

  }
  else
  {
    NSLog(CFSTR("%s: Invalid UIBannerAction object does not have data: %@"), "-[UIBannerAction bannerContent]", self);
    v7 = 0;
  }

  return (_UIBannerContent *)v7;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("tappable");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("contentData");
  else
    return (id)v3;
}

- (BOOL)tappable
{
  void *v2;
  BOOL v3;

  -[UIBannerAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "flagForSetting:", 2) == 1;

  return v3;
}

- (BOOL)bannerTapped
{
  int v3;
  void *v4;

  v3 = -[UIBannerAction tappable](self, "tappable");
  if (v3)
  {
    v3 = -[UIBannerAction canSendResponse](self, "canSendResponse");
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0D016A8], "response");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBannerAction sendResponse:](self, "sendResponse:", v4);

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

@end
