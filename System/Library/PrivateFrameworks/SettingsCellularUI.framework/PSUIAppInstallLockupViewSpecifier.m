@implementation PSUIAppInstallLockupViewSpecifier

- (PSUIAppInstallLockupViewSpecifier)initWithFailureHandler:(id)a3 diagCode:(id)a4 OpenAppURL:(id)a5 appId:(id)a6 AnalyticsEventForApp:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PSUIAppInstallLockupViewSpecifier *v17;
  PSUIAppInstallLockupViewSpecifier *v18;
  void *v19;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PSUIAppInstallLockupViewSpecifier;
  v17 = -[PSUIAppInstallLockupViewSpecifier initWithName:target:set:get:detail:cell:edit:](&v21, sel_initWithName_target_set_get_detail_cell_edit_, &stru_24D5028C8, self, 0, 0, 0, 4, 0);
  v18 = v17;
  if (v17)
  {
    -[PSUIAppInstallLockupViewSpecifier setLoadingFailureHandler:](v17, "setLoadingFailureHandler:", v12);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppInstallLockupViewSpecifier setProperty:forKey:](v18, "setProperty:forKey:", v19, *MEMORY[0x24BE75D10]);

    -[PSUIAppInstallLockupViewSpecifier setProperty:forKey:](v18, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    -[PSUIAppInstallLockupViewSpecifier setProperty:forKey:](v18, "setProperty:forKey:", CFSTR("AppInstallLockupView"), *MEMORY[0x24BE75AC0]);
    -[PSUIAppInstallLockupViewSpecifier setProperty:forKey:](v18, "setProperty:forKey:", v14, 0x24D506B68);
    -[PSUIAppInstallLockupViewSpecifier setProperty:forKey:](v18, "setProperty:forKey:", v15, 0x24D506B88);
    -[PSUIAppInstallLockupViewSpecifier setProperty:forKey:](v18, "setProperty:forKey:", v16, 0x24D506BA8);
    -[PSUIAppInstallLockupViewSpecifier setProperty:forKey:](v18, "setProperty:forKey:", v13, 0x24D506BC8);
  }

  return v18;
}

- (void)handleLockupViewFailure:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[PSUIAppInstallLockupViewSpecifier loadingFailureHandler](self, "loadingFailureHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PSUIAppInstallLockupViewSpecifier loadingFailureHandler](self, "loadingFailureHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)loadingFailureHandler
{
  return self->_loadingFailureHandler;
}

- (void)setLoadingFailureHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadingFailureHandler, 0);
}

@end
