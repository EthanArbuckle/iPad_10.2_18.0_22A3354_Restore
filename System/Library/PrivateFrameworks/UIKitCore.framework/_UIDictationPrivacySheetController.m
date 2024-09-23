@implementation _UIDictationPrivacySheetController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIDictationPrivacySheetController)initWithType:(int64_t)a3
{
  UIViewController *v6;
  _UIDictationPrivacySheetController *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  OBPrivacyPresenter *privacyPresenter;
  void *v13;
  objc_class *v14;
  VTUIDictationDataSharingOptInPresenter *v15;
  VTUIDictationDataSharingOptInPresenter *dataSharingOptInPresenter;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  objc_super v23;
  id location;
  uint64_t v25;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = objc_alloc_init(UIViewController);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDictationController.m"), 1328, CFSTR("Failed to create UIViewController"));

  }
  v23.receiver = self;
  v23.super_class = (Class)_UIDictationPrivacySheetController;
  v7 = -[UINavigationController initWithRootViewController:](&v23, sel_initWithRootViewController_, v6);
  if (v7)
  {
    if (+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI"))
    {
      v8 = 0;
    }
    else
    {
      v8 = 2;
    }
    +[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI");
    -[UIViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", v8);
    v7->_sheetType = a3;
    if (a3 == 1)
    {
      v29 = 0;
      v30 = &v29;
      v31 = 0x2050000000;
      v9 = (void *)qword_1ECD79758;
      v32 = qword_1ECD79758;
      if (!qword_1ECD79758)
      {
        location = (id)MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __getOBPrivacyPresenterClass_block_invoke;
        v27 = &unk_1E16B14C0;
        v28 = &v29;
        __getOBPrivacyPresenterClass_block_invoke((uint64_t)&location);
        v9 = (void *)v30[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v29, 8);
      objc_msgSend(v10, "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.siri"));
      v11 = objc_claimAutoreleasedReturnValue();
      privacyPresenter = v7->_privacyPresenter;
      v7->_privacyPresenter = (OBPrivacyPresenter *)v11;

      objc_initWeak(&location, v7);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __51___UIDictationPrivacySheetController_initWithType___block_invoke;
      v21[3] = &unk_1E16B3F40;
      objc_copyWeak(&v22, &location);
      -[OBPrivacyPresenter setDismissHandler:](v7->_privacyPresenter, "setDismissHandler:", v21);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {
      v29 = 0;
      v30 = &v29;
      v31 = 0x2050000000;
      v13 = (void *)qword_1ECD79768;
      v32 = qword_1ECD79768;
      if (!qword_1ECD79768)
      {
        location = (id)MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __getVTUIDictationDataSharingOptInPresenterClass_block_invoke;
        v27 = &unk_1E16B14C0;
        v28 = &v29;
        __getVTUIDictationDataSharingOptInPresenterClass_block_invoke((uint64_t)&location);
        v13 = (void *)v30[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v29, 8);
      v15 = (VTUIDictationDataSharingOptInPresenter *)objc_alloc_init(v14);
      dataSharingOptInPresenter = v7->_dataSharingOptInPresenter;
      v7->_dataSharingOptInPresenter = v15;

      -[VTUIDictationDataSharingOptInPresenter dataSharingOptInView](v7->_dataSharingOptInPresenter, "dataSharingOptInView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](v6, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSubview:", v17);

    }
  }

  return v7;
}

- (void)dismiss
{
  void *v3;
  char v4;
  id v5;

  -[_UIDictationPrivacySheetController privacyDelegate](self, "privacyDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_UIDictationPrivacySheetController privacyDelegate](self, "privacyDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictationPrivacySheetControllerDidFinish:", self);

  }
}

- (void)setPresentationDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIDictationPrivacySheetController dataSharingOptInPresenter](self, "dataSharingOptInPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentationDelegate:", v4);

}

- (_UIDictationPrivacySheetControllerDelegate)privacyDelegate
{
  return self->_privacyDelegate;
}

- (void)setPrivacyDelegate:(id)a3
{
  self->_privacyDelegate = (_UIDictationPrivacySheetControllerDelegate *)a3;
}

- (OBPrivacyPresenter)privacyPresenter
{
  return self->_privacyPresenter;
}

- (void)setPrivacyPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_privacyPresenter, a3);
}

- (int64_t)sheetType
{
  return self->_sheetType;
}

- (void)setSheetType:(int64_t)a3
{
  self->_sheetType = a3;
}

- (VTUIDictationDataSharingOptInPresenter)dataSharingOptInPresenter
{
  return self->_dataSharingOptInPresenter;
}

- (void)setDataSharingOptInPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_dataSharingOptInPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSharingOptInPresenter, 0);
  objc_storeStrong((id *)&self->_privacyPresenter, 0);
}

@end
