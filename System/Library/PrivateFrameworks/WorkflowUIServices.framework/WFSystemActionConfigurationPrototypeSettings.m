@implementation WFSystemActionConfigurationPrototypeSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFSystemActionConfigurationPrototypeSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[WFSystemActionConfigurationPrototypeSettings setSidebarSpringDamping:](self, "setSidebarSpringDamping:", 0.9);
  -[WFSystemActionConfigurationPrototypeSettings setSidebarSpringRepsonse:](self, "setSidebarSpringRepsonse:", 0.15);
}

- (double)sidebarSpringDamping
{
  return self->_sidebarSpringDamping;
}

- (void)setSidebarSpringDamping:(double)a3
{
  self->_sidebarSpringDamping = a3;
}

- (double)sidebarSpringRepsonse
{
  return self->_sidebarSpringRepsonse;
}

- (void)setSidebarSpringRepsonse:(double)a3
{
  self->_sidebarSpringRepsonse = a3;
}

+ (id)sharedSettings
{
  if (sharedSettings_onceToken != -1)
    dispatch_once(&sharedSettings_onceToken, &__block_literal_global_1618);
  return (id)sharedSettings_sharedInstance;
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE7B338];
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Damping"), CFSTR("sidebarSpringDamping"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Response"), CFSTR("sidebarSpringRepsonse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precision:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v9, CFSTR("Sidebar Settings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BE7B338];
  v15 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "moduleWithTitle:contents:", CFSTR("Pencil Settings"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __62__WFSystemActionConfigurationPrototypeSettings_sharedSettings__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[WFSystemActionConfigurationPrototypeSettingsDomain rootSettings](WFSystemActionConfigurationPrototypeSettingsDomain, "rootSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedSettings_sharedInstance;
  sharedSettings_sharedInstance = v0;

}

@end
