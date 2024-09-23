@implementation PSTrackingWelcomeController

- (PSTrackingWelcomeController)init
{
  PSTrackingWelcomeController *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PSTrackingWelcomeController;
  v2 = -[PSTrackingWelcomeController init](&v17, sel_init);
  if (v2)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v3 = (void *)getOBTextWelcomeControllerClass_softClass;
    v22 = getOBTextWelcomeControllerClass_softClass;
    if (!getOBTextWelcomeControllerClass_softClass)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __getOBTextWelcomeControllerClass_block_invoke;
      v18[3] = &unk_1E4A65650;
      v18[4] = &v19;
      __getOBTextWelcomeControllerClass_block_invoke((uint64_t)v18);
      v3 = (void *)v20[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v19, 8);
    v5 = [v4 alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TRACKING_ABOUT_TITLE"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithTitle:detailText:symbolName:", v7, 0, 0);
    -[PSTrackingWelcomeController setController:](v2, "setController:", v8);

    -[PSTrackingWelcomeController controller](v2, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTrackingWelcomeController aboutText](v2, "aboutText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSectionWithHeader:content:", 0, v10);

    -[PSTrackingWelcomeController controller](v2, "controller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTrackingWelcomeController setViewControllers:](v2, "setViewControllers:", v12);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, v2, sel_donePressed);
    -[PSTrackingWelcomeController controller](v2, "controller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightBarButtonItem:", v13);

  }
  return v2;
}

- (id)aboutText
{
  int v2;
  NSObject *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v2 = objc_msgSend(MEMORY[0x1E0C91D98], "shouldEnforceTrackingWithReasonCode:", &v10);
  _PSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[PSTrackingWelcomeController aboutText]";
    v13 = 1024;
    v14 = v2;
    v15 = 2048;
    v16 = v10;
    _os_log_impl(&dword_1A3819000, v3, OS_LOG_TYPE_DEFAULT, "%s: Showing tracking about text. shouldEnforce: %d, reason: %ld", buf, 0x1Cu);
  }

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("TRACKING_ABOUT_TEXT_NO_ENFORCEMENT");
  }
  else
  {
    v7 = v10;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v7)
      v6 = CFSTR("TRACKING_ABOUT_TEXT_REASON_UNENFORCED");
    else
      v6 = CFSTR("TRACKING_ABOUT_TEXT_REASON_NONE");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)donePressed
{
  void *v2;
  id v3;

  -[PSTrackingWelcomeController controller](self, "controller");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (OBTextWelcomeController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
