@implementation PUEditPlugin

- (PUEditPlugin)initWithExtension:(id)a3 pluginCategoryType:(unint64_t)a4
{
  id v7;
  PUEditPlugin *v8;
  PUEditPlugin *v9;
  __objc2_class *v10;
  uint64_t v11;
  UIApplicationExtensionActivity *applicationExtensionActivity;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUEditPlugin;
  v8 = -[PUEditPlugin init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_extension, a3);
    v9->_category = a4;
    if (!a4)
    {
      v10 = _PUEditActionPluginApplicationExtensionActivity;
      goto LABEL_6;
    }
    if (a4 == 1)
    {
      v10 = _PUEditSharePluginApplicationExtensionActivity;
LABEL_6:
      v11 = objc_msgSend([v10 alloc], "initWithApplicationExtension:", v7);
      applicationExtensionActivity = v9->_applicationExtensionActivity;
      v9->_applicationExtensionActivity = (UIApplicationExtensionActivity *)v11;

    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PUEditPlugin extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUEditPlugin extension](self, "extension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)title
{
  void *v2;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  NSString *v8;

  -[PUEditPlugin extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedContainingName");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v4, "length"))
  {
    objc_msgSend(v3, "localizedName");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  if (!-[__CFString length](v4, "length"))
  {
    objc_msgSend(v3, "localizedShortName");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v6;
  }
  if (-[__CFString length](v4, "length"))
    v7 = v4;
  else
    v7 = &stru_1E58AD278;
  v8 = v7;

  return v8;
}

- (UIImage)icon
{
  void *v2;
  void *v3;

  -[PUEditPlugin applicationExtensionActivity](self, "applicationExtensionActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_activityImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIImage)smallIcon
{
  void *v2;
  void *v3;

  -[PUEditPlugin applicationExtensionActivity](self, "applicationExtensionActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_activitySettingsImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (unint64_t)category
{
  return self->_category;
}

- (BOOL)pu_isMarkupExtension
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PUEditPlugin extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PUEditPlugin pu_isMarkupExtensionIdentifier:](PUEditPlugin, "pu_isMarkupExtensionIdentifier:", v3);

  return v4;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (UIApplicationExtensionActivity)applicationExtensionActivity
{
  return self->_applicationExtensionActivity;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_applicationExtensionActivity, 0);
}

+ (id)pu_defaultMarkupExtensionIdentifier
{
  return CFSTR("com.apple.PaperKit.MarkupPhotoEditingExtension");
}

+ (BOOL)pu_isMarkupExtensionIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.PaperKit.MarkupPhotoEditingExtension")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MarkupUI.MarkupPhotoExtension"));

  return v4;
}

@end
