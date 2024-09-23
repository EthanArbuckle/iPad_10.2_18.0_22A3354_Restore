@implementation PUHideActivity

- (void)setItemSourceController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUHideActivity;
  -[PXActivity setItemSourceController:](&v7, sel_setItemSourceController_, a3);
  -[PXActivity itemSourceController](self, "itemSourceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D7B4E8];
  objc_msgSend(v4, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hiding = objc_msgSend(v5, "toggledValueForAssets:", v6);

}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BD48];
}

- (id)activityTitle
{
  if (self->_hiding)
    return PULocalizedString(CFSTR("HIDE_MENU_ITEM_ITEM"));
  else
    return PULocalizedString(CFSTR("UNHIDE_MENU_ITEM_ITEM"));
}

- (id)_systemImageName
{
  if (self->_hiding)
    return CFSTR("eye.slash");
  else
    return CFSTR("eye");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isPreparingIndividualItems"))
  {
    v5 = (void *)MEMORY[0x1E0D7B4E8];
    objc_msgSend(v4, "assets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "canPerformOnAllAssets:", v6);

    if ((v5 & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1E0D7B4E8];
      objc_msgSend(v4, "assets");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self->_hiding = objc_msgSend(v7, "toggledValueForAssets:", v8);

      v9 = 1;
    }
    else
    {
      v9 = 0;
      self->_hiding = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

+ (int64_t)activityCategory
{
  return 0;
}

@end
