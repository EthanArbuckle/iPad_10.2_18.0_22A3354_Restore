@implementation WLKAppSettingsFacade

- (WLKAppSettingsFacade)initWithSettings:(id)a3
{
  id v5;
  WLKAppSettingsFacade *v6;
  WLKAppSettingsFacade *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WLKAppSettingsFacade;
  v6 = -[WLKAppSettingsFacade init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_settings, a3);

  return v7;
}

- (void)setAccessStatus:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_msgSend(a3, "unsignedIntegerValue");
  -[WLKAppSettings setAccessStatus:](self->_settings, "setAccessStatus:", v4);
  +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKAppSettings channelID](self->_settings, "channelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKAppSettings externalID](self->_settings, "externalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStatus:forChannelID:externalID:", v4, v6, v7);

  if (v4)
    +[WLKSettingsCloudUtilities updateCloudStoreAppSettings:deleteHistory:completion:](WLKSettingsCloudUtilities, "updateCloudStoreAppSettings:deleteHistory:completion:", self->_settings, 0, 0);
}

- (id)accessStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKAppSettings channelID](self->_settings, "channelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKAppSettings externalID](self->_settings, "externalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingsForChannelID:externalID:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "accessStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
