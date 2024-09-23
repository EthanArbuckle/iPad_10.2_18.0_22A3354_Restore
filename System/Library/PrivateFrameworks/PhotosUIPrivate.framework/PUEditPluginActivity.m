@implementation PUEditPluginActivity

- (PUEditPluginActivity)initWithPlugin:(id)a3
{
  id v5;
  PUEditPluginActivity *v6;
  PUEditPluginActivity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUEditPluginActivity;
  v6 = -[UIActivity init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_plugin, a3);

  return v7;
}

- (id)activityType
{
  void *v2;
  void *v3;
  void *v4;

  -[PUEditPluginActivity plugin](self, "plugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  -[PUEditPluginActivity plugin](self, "plugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_activityImage
{
  void *v2;
  void *v3;

  -[PUEditPluginActivity plugin](self, "plugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_activitySettingsImage
{
  void *v2;
  void *v3;

  -[PUEditPluginActivity plugin](self, "plugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "smallIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (BOOL)_isHiddenByDefault
{
  return 1;
}

- (PUEditPlugin)plugin
{
  return self->_plugin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugin, 0);
}

+ (int64_t)activityCategory
{
  return 1;
}

@end
