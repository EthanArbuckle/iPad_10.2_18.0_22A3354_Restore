@implementation SBDiagnosticRequestAlertItem

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDiagnosticRequestAlertItem title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDiagnosticRequestAlertItem message](self, "message");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDiagnosticRequestAlertItem.m"), 25, CFSTR("The title for an SBDiagnosticRequestAlertItem cannot be nil."));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDiagnosticRequestAlertItem.m"), 26, CFSTR("The message for an SBDiagnosticRequestAlertItem cannot be nil."));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v6, "setTitle:", v7);
  objc_msgSend(v6, "setMessage:", v9);
  v10 = (void *)MEMORY[0x1E0CEA2E0];
  -[SBDiagnosticRequestAlertItem _yesButtonTitle](self, "_yesButtonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __68__SBDiagnosticRequestAlertItem_configure_requirePasscodeForActions___block_invoke;
  v20[3] = &unk_1E8E9DCB0;
  v20[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v13);
  v14 = (void *)MEMORY[0x1E0CEA2E0];
  -[SBDiagnosticRequestAlertItem _noButtonTitle](self, "_noButtonTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __68__SBDiagnosticRequestAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v19[3] = &unk_1E8E9DCB0;
  v19[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v16);
}

uint64_t __68__SBDiagnosticRequestAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fileRadar");
}

void __68__SBDiagnosticRequestAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)reappearsAfterUnlock
{
  return 1;
}

- (BOOL)reappearsAfterLock
{
  return 1;
}

- (id)_yesButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RADAR_REQUEST_BUTTON"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_noButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RADAR_REQUEST_CANCEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_fileRadar
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  SBLockScreenUnlockRequest *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  SBDiagnosticRequestAlertItem *v48;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternalInstall");

  if (v6)
  {
    v43 = v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tap-to-radar://new"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[SBDiagnosticRequestAlertItem radarTitle](self, "radarTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDiagnosticRequestAlertItem radarDescription](self, "radarDescription");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDiagnosticRequestAlertItem radarAttachments](self, "radarAttachments");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDiagnosticRequestAlertItem radarKeywordIDs](self, "radarKeywordIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBDiagnosticRequestAlertItem radarClassification](self, "radarClassification");
    v11 = -[SBDiagnosticRequestAlertItem radarReproducibility](self, "radarReproducibility");
    -[SBDiagnosticRequestAlertItem radarComponentName](self, "radarComponentName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDiagnosticRequestAlertItem radarComponentVersion](self, "radarComponentVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDiagnosticRequestAlertItem radarComponentID](self, "radarComponentID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      v14 = &unk_1E91D1C58;
    v15 = (void *)MEMORY[0x1E0CB39D8];
    v40 = v14;
    objc_msgSend(v14, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queryItemWithName:value:", CFSTR("ComponentID"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v17);

    if (v12 && v13)
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentName"), v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v18);

      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentVersion"), v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v19);

    }
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Title"), v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v20);

    }
    if (objc_msgSend(v45, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Description"), v45);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v21);

    }
    if (v10)
    {
      v22 = (void *)MEMORY[0x1E0CB39D8];
      -[SBDiagnosticRequestAlertItem _stringFromClassification:](self, "_stringFromClassification:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "queryItemWithName:value:", CFSTR("Classification"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v24);

    }
    if (v11)
    {
      v25 = (void *)MEMORY[0x1E0CB39D8];
      -[SBDiagnosticRequestAlertItem _stringFromReproducibility:](self, "_stringFromReproducibility:", v11);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "queryItemWithName:value:", CFSTR("Reproducibility"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v27);

    }
    if (objc_msgSend(v44, "count"))
    {
      objc_msgSend(v44, "bs_map:", &__block_literal_global_321);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR(","));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Attachments"), v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v30);

    }
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "bs_map:", &__block_literal_global_44_2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR(","));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Keywords"), v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v33);

    }
    objc_msgSend(v42, "setQueryItems:", v7);
    objc_msgSend(v42, "URL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "absoluteString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v43;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("applefeedback://new?bundleID=%@"), v4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItem deactivateForButton](self, "deactivateForButton");
  v37 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setSource:](v37, "setSource:", 24);
  -[SBLockScreenUnlockRequest setIntent:](v37, "setIntent:", 2);
  -[SBLockScreenUnlockRequest setName:](v37, "setName:", CFSTR("Diagnostic Request Unlock"));
  -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v37, "setWantsBiometricPresentation:", 0);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __42__SBDiagnosticRequestAlertItem__fileRadar__block_invoke_3;
  v46[3] = &unk_1E8E9DEB0;
  v47 = v36;
  v48 = self;
  v39 = v36;
  objc_msgSend(v38, "unlockWithRequest:completion:", v37, v46);

}

uint64_t __42__SBDiagnosticRequestAlertItem__fileRadar__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "path");
}

uint64_t __42__SBDiagnosticRequestAlertItem__fileRadar__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

void __42__SBDiagnosticRequestAlertItem__fileRadar__block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  void (**v4)(void);

  if (a2)
  {
    SBWorkspaceActivateApplicationFromURL(*(void **)(a1 + 32), 0, &__block_literal_global_55_2);
    objc_msgSend(*(id *)(a1 + 40), "completionBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "completionBlock");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();

    }
  }
}

uint64_t __42__SBDiagnosticRequestAlertItem__fileRadar__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSource:", 13);
}

- (id)_stringFromClassification:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9)
    return 0;
  else
    return off_1E8EBB620[a3 - 1];
}

- (id)_stringFromReproducibility:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return off_1E8EBB670[a3 - 1];
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (void)setRadarTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)radarComponentID
{
  return self->_radarComponentID;
}

- (void)setRadarComponentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)radarComponentName
{
  return self->_radarComponentName;
}

- (void)setRadarComponentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)radarComponentVersion
{
  return self->_radarComponentVersion;
}

- (void)setRadarComponentVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)radarKeywordIDs
{
  return self->_radarKeywordIDs;
}

- (void)setRadarKeywordIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)radarAttachments
{
  return self->_radarAttachments;
}

- (void)setRadarAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (int64_t)radarClassification
{
  return self->_radarClassification;
}

- (void)setRadarClassification:(int64_t)a3
{
  self->_radarClassification = a3;
}

- (int64_t)radarReproducibility
{
  return self->_radarReproducibility;
}

- (void)setRadarReproducibility:(int64_t)a3
{
  self->_radarReproducibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarAttachments, 0);
  objc_storeStrong((id *)&self->_radarKeywordIDs, 0);
  objc_storeStrong((id *)&self->_radarComponentVersion, 0);
  objc_storeStrong((id *)&self->_radarComponentName, 0);
  objc_storeStrong((id *)&self->_radarComponentID, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
