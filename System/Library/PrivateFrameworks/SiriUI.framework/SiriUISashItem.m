@implementation SiriUISashItem

+ (id)defaultSashItem
{
  SiriUISashItem *v2;
  void *v3;
  SiriUISashItem *v4;

  v2 = [SiriUISashItem alloc];
  +[SiriUIUtilities defaultBrowserBundleIdentifier](SiriUIUtilities, "defaultBrowserBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SiriSharedUISashItem initWithApplicationBundleIdentifier:](v2, "initWithApplicationBundleIdentifier:", v3);

  -[SiriUISashItem _setDefault:](v4, "_setDefault:", 1);
  return v4;
}

- (SiriUISashItem)initWithExtension:(id)a3
{
  id v4;
  SiriUISashItem *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[SiriSharedUISashItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "siriui_displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    -[SiriUISashItem setTitle:](v5, "setTitle:", v7);

    objc_msgSend(v4, "siriui_iconImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUISashItem setImage:](v5, "setImage:", v8);

  }
  return v5;
}

- (void)setImage:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUISashItem;
  -[SiriSharedUISashItem setImage:](&v4, sel_setImage_, a3);
  -[SiriUISashItem _setDefault:](self, "_setDefault:", 0);
}

- (void)setTitle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUISashItem;
  -[SiriSharedUISashItem setTitle:](&v4, sel_setTitle_, a3);
  -[SiriUISashItem _setDefault:](self, "_setDefault:", 0);
}

- (BOOL)canPunchout
{
  objc_super v4;

  if (-[SiriUISashItem isDefault](self, "isDefault"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SiriUISashItem;
  return -[SiriSharedUISashItem canPunchout](&v4, sel_canPunchout);
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)_setDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

@end
