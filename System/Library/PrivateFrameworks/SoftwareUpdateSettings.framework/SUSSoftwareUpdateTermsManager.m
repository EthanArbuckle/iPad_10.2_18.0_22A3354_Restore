@implementation SUSSoftwareUpdateTermsManager

- (SUSSoftwareUpdateTermsManager)init
{
  SUManagerClient *v2;
  SUManagerClient *termsAndConditionsClient;
  SUSSoftwareUpdateTermsManager *v5;
  objc_super v6;
  SEL v7;
  SUSSoftwareUpdateTermsManager *v8;

  v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSSoftwareUpdateTermsManager;
  v8 = -[SUSSoftwareUpdateTermsManager init](&v6, sel_init);
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    v2 = (SUManagerClient *)objc_alloc_init(MEMORY[0x24BEAEC38]);
    termsAndConditionsClient = v8->termsAndConditionsClient;
    v8->termsAndConditionsClient = v2;

  }
  v5 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (void)_finishTermsWithAcceptance:(BOOL)a3 error:(id)a4
{
  const __CFString *v4;
  id v5;
  id v6;
  uint64_t v7;
  UIViewController *hostController;
  UIViewController *v9;
  BOOL v10;
  RemoteUIController *termsRemoteUI;
  UINavigationController *showProgressViewController;
  os_log_t oslog;
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  BOOL v22;
  char v23;
  id WeakRetained;
  char v25;
  id v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  BOOL v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  id v40;
  id v41;
  BOOL v42;
  uint64_t v43;
  int v44;
  int v45;
  void (*v46)(uint64_t, char, id);
  void *v47;
  SUSSoftwareUpdateTermsManager *v48;
  id v49;
  os_log_type_t v50;
  id v51;
  id location;
  BOOL v53;
  SEL v54;
  SUSSoftwareUpdateTermsManager *v55;
  uint8_t v56[16];
  uint8_t v57[24];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v55 = self;
  v54 = a2;
  v53 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v51 = _SUSLoggingFacility();
  v50 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEFAULT))
  {
    if (v53)
      v4 = CFSTR("YASE");
    else
      v4 = CFSTR("NERP");
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v57, (uint64_t)v4, (uint64_t)location);
    _os_log_impl(&dword_22CBAC000, (os_log_t)v51, v50, "Terms accepted: %@, error: %@", v57, 0x16u);
  }
  objc_storeStrong(&v51, 0);
  v43 = MEMORY[0x24BDAC760];
  v44 = -1073741824;
  v45 = 0;
  v46 = __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke;
  v47 = &unk_24F762D10;
  v48 = v55;
  v49 = (id)MEMORY[0x22E303A08](&v43);
  if (v55->_showProgressViewController)
  {
    showProgressViewController = v55->_showProgressViewController;
    v35 = MEMORY[0x24BDAC760];
    v36 = -1073741824;
    v37 = 0;
    v38 = __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke_2;
    v39 = &unk_24F762D38;
    v41 = v49;
    v42 = v53;
    v40 = location;
    -[UINavigationController dismissViewControllerAnimated:completion:](showProgressViewController, "dismissViewControllerAnimated:completion:", 1, &v35);
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v41, 0);
  }
  else if (v55->_termsRemoteUI)
  {
    termsRemoteUI = v55->_termsRemoteUI;
    v27 = MEMORY[0x24BDAC760];
    v28 = -1073741824;
    v29 = 0;
    v30 = __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke_3;
    v31 = &unk_24F762D38;
    v33 = v49;
    v34 = v53;
    v32 = location;
    v5 = (id)-[RemoteUIController dismissObjectModelsAnimated:completion:](termsRemoteUI, "dismissObjectModelsAnimated:completion:", 1, &v27);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
  }
  else
  {
    v9 = -[UIViewController presentedViewController](v55->_hostController, "presentedViewController");
    v25 = 0;
    v23 = 0;
    v10 = 0;
    if (v9)
    {
      v26 = -[UIViewController presentedViewController](v55->_hostController, "presentedViewController");
      v25 = 1;
      WeakRetained = objc_loadWeakRetained((id *)&v55->_presentedViewController);
      v23 = 1;
      v10 = v26 == WeakRetained;
    }
    if ((v23 & 1) != 0)

    if ((v25 & 1) != 0)
    if (v10)
    {
      hostController = v55->_hostController;
      v15 = MEMORY[0x24BDAC760];
      v16 = -1073741824;
      v17 = 0;
      v18 = __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke_4;
      v19 = &unk_24F762D38;
      v21 = v49;
      v22 = v53;
      v20 = location;
      -[UIViewController dismissViewControllerAnimated:completion:](hostController, "dismissViewControllerAnimated:completion:", 1, &v15);
      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v21, 0);
    }
    else
    {
      (*((void (**)(void))v49 + 2))();
    }
  }
  v6 = objc_alloc(MEMORY[0x24BEAEC00]);
  v14 = (id)objc_msgSend(v6, "initWithEventName:", *MEMORY[0x24BEAEE08]);
  if (v53)
    v7 = *MEMORY[0x24BEAEEE0];
  else
    v7 = *MEMORY[0x24BEAEEE8];
  objc_msgSend(v14, "setEventPayloadEntry:stringValue:", *MEMORY[0x24BEAEE10], v7);
  oslog = (os_log_t)_SUSLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v56, (uint64_t)v14);
    _os_log_impl(&dword_22CBAC000, oslog, OS_LOG_TYPE_DEFAULT, "Submitting event for T&C interaction: %@", v56, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[SUManagerClient submitSUAnalyticsEvent:](v55->termsAndConditionsClient, "submitSUAnalyticsEvent:", v14);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong((id *)&v48, 0);
  objc_storeStrong(&location, 0);
}

void __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v3;
  void *v4;
  id location;
  char v7;
  uint64_t v8;

  v8 = a1;
  v7 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), 0);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), 0);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), 0);
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 64), 0);
  objc_storeStrong(&location, 0);
}

uint64_t __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) & 1);
}

uint64_t __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) & 1);
}

uint64_t __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) & 1);
}

- (void)_presentModalController:(id)a3
{
  id location[2];
  SUSSoftwareUpdateTermsManager *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_presentedViewController, location[0]);
  -[UIViewController presentViewController:animated:completion:](v4->_hostController, "presentViewController:animated:completion:", location[0], 1, 0);
  objc_storeStrong(location, 0);
}

- (void)showLoadingSpinnerViewController
{
  _PSSpinnerHandlingNavigationController *v2;
  uint64_t v3;
  UINavigationController *showProgressViewController;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11[2];
  SUSSoftwareUpdateTermsManager *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = self;
  v11[1] = (id)a2;
  v11[0] = (id)objc_opt_new();
  v10 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:");
  v5 = v11[0];
  v13[0] = v10;
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  objc_msgSend(v5, "setToolbarItems:");

  v7 = v11[0];
  v9 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TERMS_AND_CONDITIONS"), &stru_24F764478, CFSTR("Software Update"));
  objc_msgSend(v7, "setTitle:");

  v2 = [_PSSpinnerHandlingNavigationController alloc];
  v3 = -[_PSSpinnerHandlingNavigationController initWithRootViewController:](v2, "initWithRootViewController:", v11[0]);
  showProgressViewController = v12->_showProgressViewController;
  v12->_showProgressViewController = (UINavigationController *)v3;

  -[UINavigationController setModalPresentationStyle:](v12->_showProgressViewController, "setModalPresentationStyle:", 2);
  -[UINavigationController setToolbarHidden:](v12->_showProgressViewController, "setToolbarHidden:", 0);
  -[SUSSoftwareUpdateTermsManager _presentModalController:](v12, "_presentModalController:", v12->_showProgressViewController);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(v11, 0);
}

- (void)presentTermsIfNecessaryForUpdate:(id)a3 overController:(id)a4 showLoadSpinner:(BOOL)a5 completion:(id)a6
{
  uint64_t v6;
  id termsCompletion;
  id v8;
  void (**v9)(id, uint64_t);
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  NSObject *log;
  os_log_type_t type;
  uint8_t v22[7];
  os_log_type_t v23;
  id v24;
  uint64_t v25;
  int v26;
  int v27;
  void (*v28)(id *, void *);
  void *v29;
  SUSSoftwareUpdateTermsManager *v30;
  uint64_t v31;
  uint8_t v32[15];
  os_log_type_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  BOOL v39;
  id v40;
  id location[2];
  SUSSoftwareUpdateTermsManager *v42;

  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v40 = 0;
  objc_storeStrong(&v40, a4);
  v39 = a5;
  v38 = 0;
  objc_storeStrong(&v38, a6);
  objc_storeStrong((id *)&v42->_hostController, v40);
  objc_storeStrong((id *)&v42->_update, location[0]);
  v37 = (id)objc_opt_new();
  v36 = (id)objc_msgSend(v37, "aa_primaryAppleAccount");
  v35 = (id)objc_msgSend(v36, "aa_personID");
  v6 = objc_msgSend(v38, "copy");
  termsCompletion = v42->_termsCompletion;
  v42->_termsCompletion = (id)v6;

  if (objc_msgSend(v35, "length"))
  {
    v34 = _SUSLoggingFacility();
    v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
    {
      log = v34;
      type = v33;
      __os_log_helper_16_0_0(v32);
      _os_log_impl(&dword_22CBAC000, log, type, "SU Terms: Downloading URL configuration for combined terms", v32, 2u);
    }
    objc_storeStrong(&v34, 0);
    if (v39)
      -[SUSSoftwareUpdateTermsManager showLoadingSpinnerViewController](v42, "showLoadingSpinnerViewController");
    v8 = objc_alloc((Class)getAASetupAssistantServiceClass());
    v31 = objc_msgSend(v8, "initWithAccount:", v36);
    v16 = (id)v31;
    v25 = MEMORY[0x24BDAC760];
    v26 = -1073741824;
    v27 = 0;
    v28 = __108__SUSSoftwareUpdateTermsManager_presentTermsIfNecessaryForUpdate_overController_showLoadSpinner_completion___block_invoke;
    v29 = &unk_24F762D88;
    v30 = v42;
    objc_msgSend(v16, "downloadURLConfiguration:", &v25);
    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong((id *)&v31, 0);
  }
  else
  {
    v14 = (id)-[SUDescriptor documentation](v42->_update, "documentation");
    v13 = (id)objc_msgSend(v14, "licenseAgreement");
    v15 = objc_msgSend(v13, "length") == 0;

    if (v15)
    {
      if (v38)
      {
        v24 = _SUSLoggingFacility();
        v23 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v24;
          v12 = v23;
          __os_log_helper_16_0_0(v22);
          _os_log_impl(&dword_22CBAC000, v11, v12, "SU Terms: No terms on update asset", v22, 2u);
        }
        objc_storeStrong(&v24, 0);
        v9 = (void (**)(id, uint64_t))v38;
        v10 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdatesettings.errors"), 1, 0);
        v9[2](v9, 1);

      }
    }
    else
    {
      -[SUSSoftwareUpdateTermsManager _loadTermsFromUpdateAsset](v42, "_loadTermsFromUpdateAsset");
    }
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
}

void __108__SUSSoftwareUpdateTermsManager_presentTermsIfNecessaryForUpdate_overController_showLoadSpinner_completion___block_invoke(id *a1, void *a2)
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  id v10[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __108__SUSSoftwareUpdateTermsManager_presentTermsIfNecessaryForUpdate_overController_showLoadSpinner_completion___block_invoke_2;
  v8 = &unk_24F762D60;
  v9 = location[0];
  v10[0] = a1[4];
  dispatch_async(queue, &v4);

  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __108__SUSSoftwareUpdateTermsManager_presentTermsIfNecessaryForUpdate_overController_showLoadSpinner_completion___block_invoke_2(id *a1)
{
  id v1;
  id v2;
  id location;
  id v5[3];
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5[2] = a1;
  v5[1] = a1;
  v5[0] = (id)objc_msgSend(a1[4], "genericTermsURL");
  if (v5[0])
  {
    v1 = a1[5];
    v2 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5[0]);
    objc_msgSend(v1, "_loadRemoteUITermsWithCloudAtURL:");

  }
  else
  {
    location = _SUSLoggingFacility();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v6, (uint64_t)a1[4]);
      _os_log_impl(&dword_22CBAC000, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "Terms config response did not contain a terms URL: %@", v6, 0xCu);
    }
    objc_storeStrong(&location, 0);
    objc_msgSend(a1[5], "_loadTermsRemoteUIFailureWithError:", 0);
  }
  objc_storeStrong(v5, 0);
}

- (void)cancelLoadingTerms:(id)a3
{
  id v3;
  SUSSoftwareUpdateTermsManager *v4;
  id v5;
  id location[2];
  SUSSoftwareUpdateTermsManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSSoftwareUpdateTermsManager _reportTermsUserAction:](v7, "_reportTermsUserAction:", CFSTR("Dismiss"));
  v3 = (id)-[RemoteUIController loader](v7->_termsRemoteUI, "loader");
  objc_msgSend(v3, "cancel");

  v4 = v7;
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdatesettings.errors"), 7, 0);
  -[SUSSoftwareUpdateTermsManager _finishTermsWithAcceptance:error:](v4, "_finishTermsWithAcceptance:error:", 0);

  objc_storeStrong(location, 0);
}

- (void)_loadTermsFromUpdateAsset
{
  SUSSoftwareUpdateLicenseViewController *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  os_log_type_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  os_log_type_t v38;
  id location;
  id v40;
  id v41[2];
  SUSSoftwareUpdateTermsManager *v42;
  uint8_t v43[32];
  uint8_t v44[24];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v42 = self;
  v41[1] = (id)a2;
  v25 = (id)-[RemoteUIController loader](self->_termsRemoteUI, "loader");
  objc_msgSend(v25, "cancel");

  -[RemoteUIController setNavigationController:](v42->_termsRemoteUI, "setNavigationController:");
  objc_storeStrong((id *)&v42->_termsRemoteUI, 0);
  v41[0] = (id)-[SUDescriptor documentation](v42->_update, "documentation");
  v26 = objc_alloc(MEMORY[0x24BDD17C8]);
  v27 = (id)objc_msgSend(v41[0], "licenseAgreement");
  v40 = (id)objc_msgSend(v26, "initWithData:encoding:");

  location = _SUSLoggingFacility();
  v38 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (id)-[SUDescriptor documentation](v42->_update, "documentation");
    v23 = (id)objc_msgSend(v24, "slaVersion");
    __os_log_helper_16_2_2_8_64_8_0((uint64_t)v44, (uint64_t)v23, objc_msgSend(v40, "length"));
    _os_log_impl(&dword_22CBAC000, (os_log_t)location, v38, "SU Terms: Update asset license agreement has version: %@, length %llu", v44, 0x16u);

  }
  objc_storeStrong(&location, 0);
  v36 = objc_msgSend(getBYLicenseAgreementClass(), "versionOfAcceptedAgreement");
  v21 = (id)objc_msgSend(v41[0], "slaVersion");
  v22 = objc_msgSend(v21, "unsignedIntegerValue");

  v35 = v22;
  v37 = v36 != v22;
  if (v36 == v22)
  {
    objc_msgSend(getBYLicenseAgreementClass(), "recordUserAcceptedAgreementVersion:", v35);
    v34 = _SUSLoggingFacility();
    v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(getBYLicenseAgreementClass(), "versionOfAcceptedAgreement"));
      v19 = (id)objc_msgSend(v41[0], "slaVersion");
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v43, (uint64_t)v20, (uint64_t)v19);
      _os_log_impl(&dword_22CBAC000, (os_log_t)v34, v33, "Not showing terms because accepted version %@ >= asset version: %@", v43, 0x16u);

    }
    objc_storeStrong(&v34, 0);
  }
  if (objc_msgSend(v40, "length") && v37)
  {
    v2 = [SUSSoftwareUpdateLicenseViewController alloc];
    v32 = -[SUSSoftwareUpdateLicenseViewController initWithLicense:](v2, "initWithLicense:", v40);
    v18 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("TERMS_AND_CONDITIONS"), &stru_24F764478, CFSTR("Software Update"));
    objc_msgSend(v32, "setTitle:");

    objc_msgSend(v32, "setModalInPresentation:", 1);
    v31 = 0;
    if (!v42->_showProgressViewController)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v32);
      v4 = v31;
      v31 = v3;

    }
    v9 = objc_alloc(MEMORY[0x24BEBD410]);
    v11 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DISAGREE"));
    v30 = (id)objc_msgSend(v9, "initWithTitle:style:target:action:");

    v12 = objc_alloc(MEMORY[0x24BEBD410]);
    v14 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (id)objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AGREE"), &stru_24F764478, CFSTR("Software Update"));
    v29 = (id)objc_msgSend(v12, "initWithTitle:style:target:action:");

    objc_msgSend(v29, "setAccessibilityIdentifier:", CFSTR("SUSSoftwareUpdateTermsManagerAgreeButton"));
    objc_msgSend(v30, "setAccessibilityIdentifier:", CFSTR("SUSSoftwareUpdateTermsManagerDisagreeButton"));
    v15 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v16 = objc_msgSend(v15, "sf_isiPad");

    if ((v16 & 1) != 0)
    {
      objc_msgSend(v31, "setModalPresentationStyle:", 2);
      v7 = (id)objc_msgSend(v32, "navigationItem");
      objc_msgSend(v7, "setRightBarButtonItem:", v29);

      v8 = (id)objc_msgSend(v32, "navigationItem");
      objc_msgSend(v8, "setLeftBarButtonItem:", v30);

    }
    else
    {
      objc_msgSend(v31, "setModalPresentationStyle:", 0);
      v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0);
      v5 = v32;
      v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v30, v28, v29, 0);
      objc_msgSend(v5, "setToolbarItems:animated:");

      objc_msgSend(v31, "setToolbarHidden:", 0);
      objc_storeStrong(&v28, 0);
    }
    if (v42->_showProgressViewController)
      -[UINavigationController pushViewController:animated:](v42->_showProgressViewController, "pushViewController:animated:", v32, 0);
    else
      -[SUSSoftwareUpdateTermsManager _presentModalController:](v42, "_presentModalController:", v31);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  else
  {
    -[SUSSoftwareUpdateTermsManager _finishTermsWithAcceptance:error:](v42, "_finishTermsWithAcceptance:error:", 1, 0);
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(v41, 0);
}

- (void)_loadRemoteUITermsWithCloudAtURL:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, void *, void *, void *);
  void *v16;
  SUSSoftwareUpdateTermsManager *v17;
  id v18[2];
  os_log_type_t v19;
  os_log_t oslog;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  int v25;
  int v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  os_log_type_t v37;
  id v38;
  id location[2];
  SUSSoftwareUpdateTermsManager *v40;
  uint8_t v41[16];
  const __CFString *v42;
  id v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[4];
  _QWORD v47[2];
  _QWORD v48[2];
  uint8_t v49[24];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = _SUSLoggingFacility();
  v37 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v49, (uint64_t)location[0]);
    _os_log_impl(&dword_22CBAC000, (os_log_t)v38, v37, "SU Terms: Loading combined terms from %@", v49, 0xCu);
  }
  objc_storeStrong(&v38, 0);
  v11 = (void *)MEMORY[0x24BDD17C8];
  v10 = (id)-[SUDescriptor productVersion](v40->_update, "productVersion");
  v9 = (id)-[SUDescriptor productBuildVersion](v40->_update, "productBuildVersion");
  v36 = (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%@"), v10, v9);

  v47[0] = CFSTR("name");
  v48[0] = *MEMORY[0x24BE048C0];
  v47[1] = CFSTR("version");
  v48[1] = v36;
  v35 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v34 = &unk_24F7695A8;
  v33 = &unk_24F7695D0;
  v32 = &unk_24F7695F8;
  v46[0] = v35;
  v46[1] = v34;
  v46[2] = v33;
  v46[3] = v32;
  v31 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 4);
  v44[0] = CFSTR("terms");
  v45[0] = v31;
  v44[1] = CFSTR("format");
  v8 = getkAAProtocolGenericTermsUIBuddyMLKey();
  v45[1] = v8;
  v30 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);

  v23 = 0;
  v24 = &v23;
  v25 = 838860800;
  v26 = 48;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = objc_opt_new();
  v22 = (id)objc_msgSend((id)v24[5], "aa_primaryAppleAccount");
  v7 = objc_alloc((Class)getAAGenericTermsUIRequestClass());
  v21 = (id)objc_msgSend(v7, "initWithAccount:parameters:", v22, v30);
  v42 = CFSTR("X-Apple-iOS-SLA-Version");
  v6 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(getBYLicenseAgreementClass(), "versionOfAcceptedAgreement"));
  v43 = v6;
  v5 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
  objc_msgSend(v21, "setCustomHeaders:");

  oslog = (os_log_t)_SUSLoggingFacility();
  v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (id)objc_msgSend(v21, "customHeaders");
    __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v4);
    _os_log_impl(&dword_22CBAC000, oslog, v19, "SU Terms: Adding headers: %@", v41, 0xCu);

  }
  objc_storeStrong((id *)&oslog, 0);
  v3 = v21;
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke;
  v16 = &unk_24F762E00;
  v17 = v40;
  v18[0] = location[0];
  v18[1] = &v23;
  objc_msgSend(v3, "performRequestWithHandler:", &v12);
  objc_storeStrong(v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  objc_storeStrong((id *)&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
}

void __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  NSObject *v4;
  NSObject *queue;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25[2];
  id v26;
  id v27;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v27 = 0;
  objc_storeStrong(&v27, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25[1] = (id)a1;
  v25[0] = v27;
  v24 = (id)objc_msgSend(v25[0], "responseData");
  if (!v26 && objc_msgSend(v24, "length"))
  {
    v4 = MEMORY[0x24BDAC9B8];
    v9 = MEMORY[0x24BDAC760];
    v10 = -1073741824;
    v11 = 0;
    v12 = __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_3;
    v13 = &unk_24F762DD8;
    v14 = *(id *)(a1 + 32);
    v15 = v24;
    v16 = *(id *)(a1 + 40);
    dispatch_async(v4, &v9);

    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
  }
  else
  {
    queue = MEMORY[0x24BDAC9B8];
    v17 = MEMORY[0x24BDAC760];
    v18 = -1073741824;
    v19 = 0;
    v20 = __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_2;
    v21 = &unk_24F762D60;
    v22 = *(id *)(a1 + 32);
    v23 = v26;
    dispatch_async(queue, &v17);

    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

uint64_t __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadTermsRemoteUIFailureWithError:", *(_QWORD *)(a1 + 40), a1, a1);
}

void __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(id *, void *, void *, void *);
  void *v13;
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(id *, void *, void *, void *);
  void *v19;
  id v20[3];
  id from;
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    objc_storeStrong(location, *(id *)(*(_QWORD *)(a1 + 32) + 48));
  }
  else
  {
    v7 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "navigationController");
    if (v7)
      objc_storeStrong(location, v7);
    else
      objc_storeStrong(location, *(id *)(*(_QWORD *)(a1 + 32) + 56));

  }
  objc_initWeak(&from, *(id *)(a1 + 32));
  getRemoteUIControllerClass();
  v6 = objc_opt_new();
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setHostViewController:", location[0]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDelegate:", *(_QWORD *)(a1 + 32));
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v15 = MEMORY[0x24BDAC760];
  v16 = -1073741824;
  v17 = 0;
  v18 = __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_4;
  v19 = &unk_24F762DB0;
  objc_copyWeak(v20, &from);
  objc_msgSend(v5, "setHandlerForElementName:handler:", CFSTR("agree"), &v15);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = MEMORY[0x24BDAC760];
  v10 = -1073741824;
  v11 = 0;
  v12 = __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_5;
  v13 = &unk_24F762DB0;
  objc_copyWeak(&v14, &from);
  objc_msgSend(v4, "setHandlerForElementName:handler:", CFSTR("disagree"), &v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "loadData:baseURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  objc_msgSend(v3, "setStatusBarShowsProgress:", 1);

  objc_destroyWeak(&v14);
  objc_destroyWeak(v20);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_4(id *a1, void *a2, void *a3, void *a4)
{
  id WeakRetained;
  id v8;
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "_handleAgreeFromObjectModel:", location[0]);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_5(id *a1, void *a2, void *a3, void *a4)
{
  id WeakRetained;
  id v8;
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "_handleDisagreeFromObjectModel:", location[0]);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_loadTermsRemoteUIFailureWithError:(id)a3
{
  id v3;
  id location[2];
  SUSSoftwareUpdateTermsManager *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  objc_msgSend(v3, "setStatusBarShowsProgress:", 0);

  NSLog(CFSTR("Error loading RemoteUI terms: %@"), location[0]);
  -[SUSSoftwareUpdateTermsManager _loadTermsFromUpdateAsset](v5, "_loadTermsFromUpdateAsset");
  objc_storeStrong(location, 0);
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  NSObject *log;
  os_log_type_t type;
  id v5;
  uint8_t v6[15];
  os_log_type_t v7;
  id v8;
  id location[2];
  SUSSoftwareUpdateTermsManager *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  objc_msgSend(v5, "setStatusBarShowsProgress:", 0);

  v8 = _SUSLoggingFacility();
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_22CBAC000, log, type, "iCloud Terms Dismissed via server", v6, 2u);
  }
  objc_storeStrong(&v8, 0);
  -[SUSSoftwareUpdateTermsManager _reportTermsUserAction:](v10, "_reportTermsUserAction:", CFSTR("Dismiss"));
  -[SUSSoftwareUpdateTermsManager _finishTermsWithAcceptance:error:](v10, "_finishTermsWithAcceptance:error:", 1, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v7;
  id v8;
  id v9;
  id location[2];
  SUSSoftwareUpdateTermsManager *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = 0;
  objc_storeStrong(&v8, a5);
  v7 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  objc_msgSend(v7, "setStatusBarShowsProgress:", 0);

  if (v9)
    -[SUSSoftwareUpdateTermsManager _loadTermsRemoteUIFailureWithError:](v11, "_loadTermsRemoteUIFailureWithError:", v9);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id v6;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  objc_msgSend(v6, "setStatusBarShowsProgress:", 0);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  UIViewController *v5;
  char isKindOfClass;
  BOOL overrideNextRUIAction;
  char v10;
  id v11;
  id v12;
  id location[2];
  SUSSoftwareUpdateTermsManager *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v10 = 0;
  overrideNextRUIAction = 0;
  if (location[0] == v14->_termsRemoteUI)
  {
    overrideNextRUIAction = 0;
    if (a5)
    {
      v11 = (id)objc_msgSend(v12, "defaultPages");
      v10 = 1;
      overrideNextRUIAction = 0;
      if (objc_msgSend(v11, "count"))
        overrideNextRUIAction = v14->_overrideNextRUIAction;
    }
  }
  if ((v10 & 1) != 0)

  if (overrideNextRUIAction)
  {
    if (v14->_showProgressViewController)
    {
      v5 = -[UINavigationController topViewController](v14->_showProgressViewController, "topViewController");
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        *a5 = 3;
    }
    else
    {
      *a5 = 5;
    }
  }
  v14->_overrideNextRUIAction = 0;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleAgreeFromObjectModel:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  UIViewController *v24;
  id v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  void (*v41)(id *, void *);
  void *v42;
  SUSSoftwareUpdateTermsManager *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48[2];
  unint64_t v49;
  int v50;
  unint64_t v51;
  id v52;
  _QWORD __b[8];
  id v54;
  char v55;
  id v56;
  id v57;
  id v58;
  int v59;
  id location[2];
  SUSSoftwareUpdateTermsManager *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v61 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v61->_agreeToCombinedTOSInProgress)
  {
    v59 = 1;
  }
  else
  {
    v58 = (id)objc_msgSend(location[0], "clientInfo");
    v57 = (id)objc_msgSend(v58, "objectForKey:", CFSTR("agreeUrl"));
    v32 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v35 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v34 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("OS_PLATFORM"));
    v33 = (id)objc_msgSend(v35, "localizedStringForKey:value:table:");
    v56 = (id)objc_msgSend(v32, "initWithObjects:", 0);

    v55 = 0;
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(location[0], "namedPages");
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v62, 16);
    if (v37)
    {
      v29 = *(_QWORD *)__b[2];
      v30 = 0;
      v31 = v37;
      while (1)
      {
        v28 = v30;
        if (*(_QWORD *)__b[2] != v29)
          objc_enumerationMutation(obj);
        v54 = *(id *)(__b[1] + 8 * v30);
        if ((objc_msgSend(v54, "isEqualToString:", CFSTR("iCloud")) & 1) != 0)
          objc_msgSend(v56, "addObject:", CFSTR("iCloud"));
        if ((objc_msgSend(v54, "isEqualToString:", CFSTR("GameCenter")) & 1) != 0)
          objc_msgSend(v56, "addObject:", CFSTR("Game Center"));
        if ((objc_msgSend(v54, "isEqualToString:", CFSTR("AMS")) & 1) != 0)
          objc_msgSend(v56, "addObject:", CFSTR("Apple Media Services"));
        if ((objc_msgSend(v54, "isEqualToString:", CFSTR("Privacy")) & 1) != 0)
          v55 = 1;
        ++v30;
        if (v28 + 1 >= v31)
        {
          v30 = 0;
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v62, 16);
          if (!v31)
            break;
        }
      }
    }

    v52 = &unk_24F7696C0;
    v51 = 0;
    v50 = 3;
    v49 = objc_msgSend(v56, "count") - 1;
    if (v49 <= 3)
      v27 = v49;
    else
      v27 = v50;
    v48[1] = (id)v27;
    v51 = v27;
    if ((v55 & 1) != 0)
      v51 += 4;
    while ((unint64_t)objc_msgSend(v56, "count") < 4)
    {
      v25 = v56;
      v26 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      objc_msgSend(v25, "addObject:");

    }
    v3 = (void *)MEMORY[0x24BDD17C8];
    v10 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (id)objc_msgSend(v52, "objectAtIndexedSubscript:", v51);
    v8 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:");
    v7 = (id)objc_msgSend(v56, "objectAtIndexedSubscript:");
    v6 = (id)objc_msgSend(v56, "objectAtIndexedSubscript:");
    v5 = (id)objc_msgSend(v56, "objectAtIndexedSubscript:", 2);
    v4 = (id)objc_msgSend(v56, "objectAtIndexedSubscript:", 3);
    v48[0] = (id)objc_msgSend(v3, "stringWithFormat:", v8, v7, v6, v5, v4);

    v11 = (void *)MEMORY[0x24BEBD3B0];
    v13 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TERMS_AND_CONDITIONS"), &stru_24F764478, CFSTR("Software Update"));
    v47 = (id)objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:");

    v15 = v47;
    v14 = (void *)MEMORY[0x24BEBD3A8];
    v18 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F764478, CFSTR("Software Update"));
    v16 = (id)objc_msgSend(v14, "actionWithTitle:style:handler:");
    objc_msgSend(v15, "addAction:");

    v20 = v47;
    v19 = (void *)MEMORY[0x24BEBD3A8];
    v23 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (id)objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("AGREE"), &stru_24F764478, CFSTR("Software Update"));
    v38 = MEMORY[0x24BDAC760];
    v39 = -1073741824;
    v40 = 0;
    v41 = __61__SUSSoftwareUpdateTermsManager__handleAgreeFromObjectModel___block_invoke;
    v42 = &unk_24F762E50;
    v43 = v61;
    v44 = v57;
    v45 = location[0];
    v46 = v58;
    v21 = (id)objc_msgSend(v19, "actionWithTitle:style:handler:", v22, 0, &v38);
    objc_msgSend(v20, "addAction:");

    v24 = -[UIViewController presentedViewController](v61->_hostController, "presentedViewController");
    -[UIViewController presentViewController:animated:completion:](v24, "presentViewController:animated:completion:", v47, 1, 0);

    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v44, 0);
    objc_storeStrong((id *)&v43, 0);
    objc_storeStrong(&v47, 0);
    objc_storeStrong(v48, 0);
    objc_storeStrong(&v52, 0);
    objc_storeStrong(&v56, 0);
    objc_storeStrong(&v57, 0);
    objc_storeStrong(&v58, 0);
    v59 = 0;
  }
  objc_storeStrong(location, 0);
}

void __61__SUSSoftwareUpdateTermsManager__handleAgreeFromObjectModel___block_invoke(id *a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(id *, void *, void *, void *);
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v16[1] = a1;
  *((_BYTE *)a1[4] + 41) = 1;
  v16[0] = (id)objc_opt_new();
  v15 = (id)objc_msgSend(v16[0], "aa_primaryAppleAccount");
  v14 = (id)objc_msgSend(objc_alloc((Class)getAAiCloudTermsAgreeRequestClass()), "initWithURLString:account:", a1[5], v15);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (id)objc_msgSend(a1[6], "serverInfo");
    v13 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("serverInfoKey"));

    objc_msgSend(v14, "setServerInfo:", v13);
    objc_storeStrong(&v13, 0);
  }
  v2 = v14;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __61__SUSSoftwareUpdateTermsManager__handleAgreeFromObjectModel___block_invoke_2;
  v9 = &unk_24F762E28;
  v10 = a1[4];
  v11 = a1[5];
  v12 = a1[7];
  objc_msgSend(v2, "performRequestWithHandler:", &v5);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(location, 0);
}

void __61__SUSSoftwareUpdateTermsManager__handleAgreeFromObjectModel___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  NSObject *queue;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id v15;
  os_log_type_t v16;
  id v17[2];
  id v18;
  id v19;
  id location[2];
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v19 = 0;
  objc_storeStrong(&v19, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17[1] = a1;
  if (v18)
  {
    v17[0] = _SUSLoggingFacility();
    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v17[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v21, (uint64_t)v18);
      _os_log_impl(&dword_22CBAC000, (os_log_t)v17[0], v16, "Failed to mark terms as agreed in iCloud: %@", v21, 0xCu);
    }
    objc_storeStrong(v17, 0);
  }
  queue = MEMORY[0x24BDAC9B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __61__SUSSoftwareUpdateTermsManager__handleAgreeFromObjectModel___block_invoke_396;
  v12 = &unk_24F762DD8;
  v13 = a1[4];
  v14 = a1[5];
  v15 = a1[6];
  dispatch_async(queue, &v8);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

void __61__SUSSoftwareUpdateTermsManager__handleAgreeFromObjectModel___block_invoke_396(uint64_t a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  id location;
  id v7[3];
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7[2] = (id)a1;
  v7[1] = (id)a1;
  objc_msgSend(*(id *)(a1 + 32), "_reportTermsUserAction:agreeUrl:", CFSTR("Accept"), *(_QWORD *)(a1 + 40));
  v7[0] = (id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("SLAVersion"));
  location = _SUSLoggingFacility();
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)v7[0]);
    _os_log_impl(&dword_22CBAC000, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "SLA version in combined terms: %@", v8, 0xCu);
  }
  objc_storeStrong(&location, 0);
  if ((objc_msgSend(v7[0], "hasPrefix:", CFSTR("EA")) & 1) != 0)
  {
    v1 = (id)objc_msgSend(v7[0], "substringFromIndex:", 2);
    v2 = v7[0];
    v7[0] = v1;

  }
  if (v7[0] && objc_msgSend(v7[0], "integerValue") > 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7[0], "integerValue"));
    objc_msgSend(v3, "_acceptedTermsVersion:");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_acceptedTermsVersion:", 0);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 0;
  objc_storeStrong(v7, 0);
}

- (void)_acceptedTermsFromAsset
{
  id v3;
  id v4;

  v4 = (id)-[SUDescriptor documentation](self->_update, "documentation");
  v3 = (id)objc_msgSend(v4, "slaVersion");
  -[SUSSoftwareUpdateTermsManager _acceptedTermsVersion:](self, "_acceptedTermsVersion:");

}

- (void)_acceptedTermsVersion:(id)a3
{
  id obj;
  id location[2];
  SUSSoftwareUpdateTermsManager *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
    objc_msgSend(getBYLicenseAgreementClass(), "recordUserAcceptedAgreementVersion:", objc_msgSend(location[0], "unsignedIntegerValue"));
  -[SUSSoftwareUpdateTermsManager _finishTermsWithAcceptance:error:](v5, "_finishTermsWithAcceptance:error:", 1, 0);
  objc_storeStrong(location, obj);
}

- (void)_handleDisagreeFromObjectModel:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location[2];
  SUSSoftwareUpdateTermsManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = (id)objc_msgSend(location[0], "clientInfo");
  v9 = (id)objc_msgSend(v10, "objectForKey:", CFSTR("disagreeUrl"));
  v8 = (id)objc_opt_new();
  v7 = (id)objc_msgSend(v8, "aa_primaryAppleAccount");
  v3 = objc_alloc((Class)getAAiCloudTermsDisagreeRequestClass());
  v6 = (id)objc_msgSend(v3, "initWithURLString:account:", v9, v7);
  v4 = (id)objc_msgSend(location[0], "serverInfo");
  v5 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverInfoKey"));

  objc_msgSend(v6, "setServerInfo:", v5);
  objc_msgSend(v6, "performRequestWithHandler:", &__block_literal_global_0);
  -[SUSSoftwareUpdateTermsManager _termsDisagree](v12, "_termsDisagree");
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

void __64__SUSSoftwareUpdateTermsManager__handleDisagreeFromObjectModel___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  os_log_t v7;
  os_log_type_t v8;
  os_log_t oslog;
  os_log_type_t v10;
  id v11[2];
  id v12;
  id v13;
  id location[2];
  uint8_t v15[16];
  uint8_t v16[32];
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13 = 0;
  objc_storeStrong(&v13, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11[1] = a1;
  if (v12)
  {
    v11[0] = _SUSLoggingFacility();
    v10 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v11[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v17, (uint64_t)"-[SUSSoftwareUpdateTermsManager _handleDisagreeFromObjectModel:]_block_invoke", (uint64_t)v12);
      _os_log_error_impl(&dword_22CBAC000, (os_log_t)v11[0], v10, "%s: Failed to mark terms as disagreed in iCloud with error %@", v17, 0x16u);
    }
    objc_storeStrong(v11, 0);
  }
  else if (objc_msgSend(v13, "statusCode") == 200)
  {
    v7 = (os_log_t)_SUSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v15, (uint64_t)"-[SUSSoftwareUpdateTermsManager _handleDisagreeFromObjectModel:]_block_invoke");
      _os_log_impl(&dword_22CBAC000, v7, OS_LOG_TYPE_DEFAULT, "%s: Marked terms as disagreed in iCloud", v15, 0xCu);
    }
    objc_storeStrong((id *)&v7, 0);
  }
  else
  {
    oslog = (os_log_t)_SUSLoggingFacility();
    v8 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_0((uint64_t)v16, (uint64_t)"-[SUSSoftwareUpdateTermsManager _handleDisagreeFromObjectModel:]_block_invoke", objc_msgSend(v13, "statusCode"));
      _os_log_error_impl(&dword_22CBAC000, oslog, v8, "%s: Failed to mark terms as disagreed in iCloud with HTTP status %ld", v16, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_termsDisagree
{
  -[SUSSoftwareUpdateTermsManager _reportTermsUserAction:](self, "_reportTermsUserAction:", CFSTR("Decline"));
  -[SUSSoftwareUpdateTermsManager _finishTermsWithAcceptance:error:](self, "_finishTermsWithAcceptance:error:", 0, 0);
}

- (void)_reportTermsUserAction:(id)a3
{
  id location[2];
  SUSSoftwareUpdateTermsManager *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSSoftwareUpdateTermsManager _reportTermsUserAction:agreeUrl:](v4, "_reportTermsUserAction:agreeUrl:", location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)_reportTermsUserAction:(id)a3 agreeUrl:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  os_log_t v10;
  id v11;
  os_log_type_t v12;
  id v13;
  id v14;
  char v15;
  char v16;
  id v17;
  id location[3];
  uint8_t v19[32];
  uint8_t v20[24];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 1;
  v15 = _os_feature_enabled_impl() & 1;
  if ((v15 & 1) != 0)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCED8]);
    v21 = *MEMORY[0x24BE04AF0];
    v22[0] = location[0];
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (id)objc_msgSend(v7, "initWithDictionary:");

    if (v17)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("agreeUrl"));
    v13 = _SUSLoggingFacility();
    v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v20, (uint64_t)"-[SUSSoftwareUpdateTermsManager _reportTermsUserAction:agreeUrl:]", (uint64_t)location[0]);
      _os_log_impl(&dword_22CBAC000, (os_log_t)v13, v12, "%s: Reporting TOS action: %@", v20, 0x16u);
    }
    objc_storeStrong(&v13, 0);
    v4 = objc_alloc(MEMORY[0x24BE04A68]);
    v6 = (id)objc_opt_new();
    v5 = (id)objc_msgSend(v6, "aa_primaryAppleAccount");
    v11 = (id)objc_msgSend(v4, "initWithAccount:parameters:");

    objc_msgSend(v11, "reportEvent");
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v10 = (os_log_t)_SUSLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v19, (uint64_t)"-[SUSSoftwareUpdateTermsManager _reportTermsUserAction:agreeUrl:]", (uint64_t)location[0]);
      _os_log_impl(&dword_22CBAC000, v10, OS_LOG_TYPE_DEFAULT, "%s: Terms QFA feature flag disabled. Not reporting terms '%@' action.", v19, 0x16u);
    }
    objc_storeStrong((id *)&v10, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (RUIStyle)serverFlowStyle
{
  return self->_serverFlowStyle;
}

- (void)setServerFlowStyle:(id)a3
{
  objc_storeStrong((id *)&self->_serverFlowStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverFlowStyle, 0);
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_storeStrong((id *)&self->_hostController, 0);
  objc_storeStrong((id *)&self->_showProgressViewController, 0);
  objc_storeStrong((id *)&self->_update, 0);
  objc_storeStrong(&self->_termsCompletion, 0);
  objc_storeStrong((id *)&self->_termsRemoteUI, 0);
  objc_storeStrong((id *)&self->termsAndConditionsClient, 0);
}

@end
