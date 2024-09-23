@implementation WFSystemActionConfigurationViewController

- (WFSystemActionConfigurationViewController)initWithConfigurationContext:(id)a3
{
  id v4;
  WFSystemActionConfigurationViewController *v5;
  uint64_t v6;
  NSString *configurationContext;
  WFSystemActionConfigurationViewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSystemActionConfigurationViewController;
  v5 = -[WFSystemActionConfigurationViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configurationContext = v5->_configurationContext;
    v5->_configurationContext = (NSString *)v6;

    -[WFSystemActionConfigurationViewController loadRemoteViewController](v5, "loadRemoteViewController");
    v8 = v5;
  }

  return v5;
}

- (WFSystemActionConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[WFSystemActionConfigurationViewController initWithConfigurationContext:](self, "initWithConfigurationContext:", CFSTR("WFSystemActionConfigurationContextUnknown"), a4);
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  getWFSystemActionConfigurationLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[WFSystemActionConfigurationViewController dealloc]";
    _os_log_impl(&dword_20CE0F000, v3, OS_LOG_TYPE_DEFAULT, "%s Destroying WFSystemActionConfigurationViewController", buf, 0xCu);
  }

  -[WFSystemActionConfigurationViewController extension](self, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSystemActionConfigurationViewController extensionRequest](self, "extensionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelExtensionRequestWithIdentifier:", v5);

  v6.receiver = self;
  v6.super_class = (Class)WFSystemActionConfigurationViewController;
  -[WFSystemActionConfigurationViewController dealloc](&v6, sel_dealloc);
}

- (void)loadRemoteViewController
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  getWFSystemActionConfigurationLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[WFSystemActionConfigurationViewController loadRemoteViewController]";
    _os_log_impl(&dword_20CE0F000, v3, OS_LOG_TYPE_DEFAULT, "%s Loading remote extension", buf, 0xCu);
  }

  v4 = *MEMORY[0x24BEC1758];
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", v4, &v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;
  if (v5)
  {
    objc_initWeak((id *)buf, self);
    v7 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke;
    v19[3] = &unk_24C5AB888;
    objc_copyWeak(&v20, (id *)buf);
    objc_msgSend(v5, "setRequestCancellationBlock:", v19);
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_3;
    v17[3] = &unk_24C5AB8B0;
    objc_copyWeak(&v18, (id *)buf);
    objc_msgSend(v5, "setRequestInterruptionBlock:", v17);
    v8 = objc_alloc_init(MEMORY[0x24BDD1560]);
    v23 = CFSTR("WFSystemActionConfigurationContextUserInfoKey");
    -[WFSystemActionConfigurationViewController configurationContext](self, "configurationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInfo:", v10);

    v22 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_10;
    v14[3] = &unk_24C5AB900;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v5;
    objc_msgSend(v15, "instantiateViewControllerWithInputItems:connectionHandler:", v11, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    getWFSystemActionConfigurationLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[WFSystemActionConfigurationViewController loadRemoteViewController]";
      v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_20CE0F000, v12, OS_LOG_TYPE_ERROR, "%s Failed to load a System Action Configuration Extension: %{public}@", buf, 0x16u);
    }

    -[WFSystemActionConfigurationViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configurationController:didFinishWithAction:error:", self, 0, v6);

  }
}

- (void)installRemoteViewController:(id)a3 extension:(id)a4 extensionRequest:(id)a5
{
  id v8;
  NSExtension *v9;
  NSCopying *v10;
  NSExtension *extension;
  BOOL v12;
  NSExtension *v13;
  NSCopying *extensionRequest;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSCopying *v50;
  NSExtension *v51;
  _QWORD v52[6];

  v52[4] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (NSExtension *)a4;
  v10 = (NSCopying *)a5;
  extension = self->_extension;
  v12 = extension == v9 && self->_extensionRequest == v10;
  v13 = v9;
  if (!v12)
  {
    -[NSExtension cancelExtensionRequestWithIdentifier:](extension, "cancelExtensionRequestWithIdentifier:");
    v13 = self->_extension;
  }
  self->_extension = v9;
  v51 = v9;

  extensionRequest = self->_extensionRequest;
  self->_extensionRequest = v10;
  v50 = v10;

  -[WFSystemActionConfigurationViewController setRemoteViewController:](self, "setRemoteViewController:", v8);
  -[WFSystemActionConfigurationViewController addChildViewController:](self, "addChildViewController:", v8);
  -[WFSystemActionConfigurationViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v8, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  objc_msgSend(v8, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WFSystemActionConfigurationViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v27);

  v39 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v8, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSystemActionConfigurationViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v45;
  objc_msgSend(v8, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSystemActionConfigurationViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v40;
  objc_msgSend(v8, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSystemActionConfigurationViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v29;
  objc_msgSend(v8, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSystemActionConfigurationViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "activateConstraints:", v35);

  objc_msgSend(v8, "didMoveToParentViewController:", self);
}

- (void)setSelectedAction:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  getWFSystemActionConfigurationLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[WFSystemActionConfigurationViewController setSelectedAction:]";
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_20CE0F000, v6, OS_LOG_TYPE_DEFAULT, "%s Client provided selected action: %@", (uint8_t *)&v10, 0x16u);
  }

  objc_storeStrong((id *)&self->_selectedAction, a3);
  -[WFSystemActionConfigurationViewController remoteViewController](self, "remoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v9, "setSelectedAction:", v5);
}

- (void)configurationController:(id)a3 didFinishWithAction:(id)a4 error:(id)a5
{
  WFConfiguredSystemAction *v7;
  id v8;
  NSObject *v9;
  WFConfiguredSystemAction *selectedAction;
  WFConfiguredSystemAction *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  WFConfiguredSystemAction *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = (WFConfiguredSystemAction *)a4;
  v8 = a5;
  getWFSystemActionConfigurationLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[WFSystemActionConfigurationViewController configurationController:didFinishWithAction:error:]";
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_20CE0F000, v9, OS_LOG_TYPE_DEFAULT, "%s Providing selected action to the client: %@", (uint8_t *)&v13, 0x16u);
  }

  selectedAction = self->_selectedAction;
  self->_selectedAction = v7;
  v11 = v7;

  -[WFSystemActionConfigurationViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configurationController:didFinishWithAction:error:", self, v11, v8);

}

- (WFSystemActionConfigurationViewController)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFSystemActionConfigurationViewController *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configurationContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[WFSystemActionConfigurationViewController initWithConfigurationContext:](self, "initWithConfigurationContext:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFSystemActionConfigurationViewController configurationContext](self, "configurationContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("configurationContext"));

}

- (WFSystemActionConfigurationViewControllerDelegate)delegate
{
  return (WFSystemActionConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFConfiguredSystemAction)selectedAction
{
  return self->_selectedAction;
}

- (NSString)configurationContext
{
  return self->_configurationContext;
}

- (void)setConfigurationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (_UIRemoteViewController)remoteViewController
{
  return (_UIRemoteViewController *)objc_loadWeakRetained((id *)&self->_remoteViewController);
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeWeak((id *)&self->_remoteViewController, a3);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (NSCopying)extensionRequest
{
  return self->_extensionRequest;
}

- (void)setExtensionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_extensionRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_remoteViewController);
  objc_storeStrong((id *)&self->_configurationContext, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_2;
  block[3] = &unk_24C5AB860;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_4;
  block[3] = &unk_24C5AB860;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = v8;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    getWFSystemActionConfigurationLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "-[WFSystemActionConfigurationViewController loadRemoteViewController]_block_invoke";
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_20CE0F000, v12, OS_LOG_TYPE_DEFAULT, "%s System Action Configuration Extension provided view controller: %@", (uint8_t *)&v15, 0x16u);
    }

    -[NSObject setDelegate:](v11, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "selectedAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setSelectedAction:](v11, "setSelectedAction:", v13);

    objc_msgSend(WeakRetained, "installRemoteViewController:extension:extensionRequest:", v11, *(_QWORD *)(a1 + 32), v7);
    v14 = v11;
  }
  else
  {

    getWFSystemActionConfigurationLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[WFSystemActionConfigurationViewController loadRemoteViewController]_block_invoke";
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_20CE0F000, v14, OS_LOG_TYPE_ERROR, "%s System Action Configuration Extension failed to  provide view controller due to: %@", (uint8_t *)&v15, 0x16u);
    }
  }

}

void __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFSystemActionConfigurationLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[WFSystemActionConfigurationViewController loadRemoteViewController]_block_invoke_4";
    _os_log_impl(&dword_20CE0F000, v2, OS_LOG_TYPE_DEFAULT, "%s Extension connection was interrupted", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFSystemActionConfigurationErrorDomain"), 1000, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationController:didFinishWithAction:error:", WeakRetained, 0, v3);

}

void __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
