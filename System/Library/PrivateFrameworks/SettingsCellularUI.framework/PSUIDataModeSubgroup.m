@implementation PSUIDataModeSubgroup

- (PSUIDataModeSubgroup)initWithHostController:(id)a3 parentSpecifier:(id)a4 dataCache:(id)a5 context:(id)a6 ctClient:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PSUIDataModeSubgroup *v17;
  PSUIDataModeSubgroup *v18;
  PSUIDataModeSpecifier *v19;
  id WeakRetained;
  id v21;
  uint64_t v22;
  PSUIDataModeSpecifier *dataModeSpecifier;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PSUIDataModeSubgroup;
  v17 = -[PSUIDataModeSubgroup init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_hostController, v12);
    objc_storeWeak((id *)&v18->_parentSpecifier, v13);
    objc_storeWeak((id *)&v18->_dataCache, v14);
    objc_storeWeak((id *)&v18->_context, v15);
    v19 = [PSUIDataModeSpecifier alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v18->_hostController);
    v21 = objc_loadWeakRetained((id *)&v18->_parentSpecifier);
    v22 = -[PSUIDataModeSpecifier initWithCTClient:hostController:parentSpecifier:](v19, "initWithCTClient:hostController:parentSpecifier:", v16, WeakRetained, v21);
    dataModeSpecifier = v18->_dataModeSpecifier;
    v18->_dataModeSpecifier = (PSUIDataModeSpecifier *)v22;

  }
  return v18;
}

- (id)specifiers
{
  PSUIPrivacyProxySpecifier *v3;
  id WeakRetained;
  id v5;
  PSUIPrivacyProxySpecifier *v6;
  void *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  PSUIDataModeSpecifier *dataModeSpecifier;
  void *v12;
  void *v13;
  void *v15;
  PSUIPrivacyProxySpecifier *v16;
  _QWORD v17[4];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v3 = [PSUIPrivacyProxySpecifier alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataCache);
  v5 = objc_loadWeakRetained((id *)&self->_context);
  v6 = -[PSUIPrivacyProxySpecifier initWithDataCache:context:](v3, "initWithDataCache:context:", WeakRetained, v5);

  if (-[PSUIDataModeSpecifier showDataMode](self->_dataModeSpecifier, "showDataMode") == 2)
  {
    v18[0] = self->_dataModeSpecifier;
    -[PSUIPrivacyProxySpecifier groupSpecifier](v6, "groupSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v7;
    v18[2] = v6;
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = (void **)v18;
    v10 = 3;
LABEL_6:
    objc_msgSend(v8, "arrayWithObjects:count:", v9, v10, v15, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (-[PSUIDataModeSpecifier showDataMode](self->_dataModeSpecifier, "showDataMode") != 1)
  {
    -[PSUIPrivacyProxySpecifier groupSpecifier](v6, "groupSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    v16 = v6;
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = &v15;
    v10 = 2;
    goto LABEL_6;
  }
  -[PSUIDataModeSpecifier lowDataModeGroupSpecifier](self->_dataModeSpecifier, "lowDataModeGroupSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dataModeSpecifier = self->_dataModeSpecifier;
  v17[0] = v7;
  v17[1] = dataModeSpecifier;
  -[PSUIPrivacyProxySpecifier groupSpecifier](v6, "groupSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  v17[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v13;
}

- (BOOL)shouldShowLinkCell
{
  return -[PSUIDataModeSpecifier showDataMode](self->_dataModeSpecifier, "showDataMode") == 2;
}

- (PSUIDataModeSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer called"), CFSTR("Unsupported initializer called"), 0));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataModeSpecifier, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_dataCache);
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_hostController);
}

@end
