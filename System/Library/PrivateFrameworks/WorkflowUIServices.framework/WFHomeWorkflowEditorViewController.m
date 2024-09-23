@implementation WFHomeWorkflowEditorViewController

- (WFHomeWorkflowEditorViewController)initWithHomeWorkflow:(id)a3 actionSetBuilder:(id)a4 home:(id)a5
{
  id v8;
  WFHomeWorkflowEditorViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  WFHomeWorkflowEditorViewController *v22;
  id v23;
  void *v24;
  objc_class *v25;
  id v26;
  void *v27;
  objc_class *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_class *v39;
  uint64_t v40;
  WFComposeViewController *composeViewController;
  NSObject *v42;
  uint64_t v43;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  objc_super v53;
  void *v54;
  void **v55;
  uint64_t v56;
  uint64_t v57;
  const __CFString *v58;
  void *v59;
  _BYTE buf[24];
  void *v61;
  void **v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v47 = a4;
  v48 = a5;
  v53.receiver = self;
  v53.super_class = (Class)WFHomeWorkflowEditorViewController;
  v9 = -[WFHomeWorkflowEditorViewController initWithNibName:bundle:](&v53, sel_initWithNibName_bundle_, 0, 0);
  if (!v9)
  {
    v22 = 0;
    goto LABEL_33;
  }
  v54 = 0;
  if (!ActionKitLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_24C5AB168;
    *(_QWORD *)&buf[16] = 0;
    ActionKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ActionKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ActionKitLibrary(void)");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("WFHomeWorkflowEditorViewController.m"), 20, CFSTR("%s"), v54);

    goto LABEL_35;
  }
  v10 = v54;
  if (v54)
    goto LABEL_36;
  while (1)
  {
    objc_msgSend(v8, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v54 = 0;
      v55 = &v54;
      v56 = 0x2050000000;
      v12 = (void *)getWFWorkflowFileClass_softClass;
      v57 = getWFWorkflowFileClass_softClass;
      if (!getWFWorkflowFileClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getWFWorkflowFileClass_block_invoke;
        v61 = &unk_24C5AB7C0;
        v62 = &v54;
        __getWFWorkflowFileClass_block_invoke((uint64_t)buf);
        v12 = v55[3];
      }
      v13 = objc_retainAutorelease(v12);
      _Block_object_dispose(&v54, 8);
      v14 = [v13 alloc];
      v52 = 0;
      v15 = objc_msgSend(v14, "initWithFileData:name:error:", v11, 0, &v52);
      v16 = v52;
      v51 = v16;
      -[NSObject recordRepresentationWithError:](v15, "recordRepresentationWithError:", &v51);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v51;

      if (v17)
      {
        v19 = objc_alloc((Class)getWFWorkflowClass());
        v50 = v18;
        v20 = objc_msgSend(v19, "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v17, 0, 0, 1, 2, &v50);
        v21 = v50;

        v18 = v21;
        goto LABEL_21;
      }
      getWFGeneralLogObject();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFHomeWorkflowEditorViewController initWithHomeWorkflow:actionSetBuilder:home:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v18;
        _os_log_impl(&dword_20CE0F000, v42, OS_LOG_TYPE_ERROR, "%s Could not load shortcut record from file data. error: %{public}@", buf, 0x16u);
      }

LABEL_31:
      v22 = 0;
      goto LABEL_32;
    }
    if (!v47)
    {
      v18 = 0;
LABEL_29:
      getWFHomeLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v43 = objc_msgSend(v11, "length");
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[WFHomeWorkflowEditorViewController initWithHomeWorkflow:actionSetBuilder:home:]";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v43;
        *(_WORD *)&buf[22] = 2112;
        v61 = v18;
        _os_log_impl(&dword_20CE0F000, v15, OS_LOG_TYPE_ERROR, "%s Could not create workflow from data: %lu with error: %@", buf, 0x20u);
      }
      goto LABEL_31;
    }
    v23 = objc_alloc((Class)getWFWorkflowClass());
    v54 = 0;
    v55 = &v54;
    v56 = 0x2050000000;
    v24 = (void *)getWFWorkflowRecordClass_softClass;
    v57 = getWFWorkflowRecordClass_softClass;
    if (!getWFWorkflowRecordClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getWFWorkflowRecordClass_block_invoke;
      v61 = &unk_24C5AB7C0;
      v62 = &v54;
      __getWFWorkflowRecordClass_block_invoke((uint64_t)buf);
      v24 = v55[3];
    }
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v54, 8);
    v26 = objc_alloc_init(v25);
    v49 = 0;
    v20 = objc_msgSend(v23, "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v26, 0, 0, 1, 2, &v49);
    v18 = v49;

    v54 = 0;
    v55 = &v54;
    v56 = 0x2050000000;
    v27 = (void *)getWFHFTriggerActionSetsBuilderParameterStateClass_softClass;
    v57 = getWFHFTriggerActionSetsBuilderParameterStateClass_softClass;
    if (!getWFHFTriggerActionSetsBuilderParameterStateClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getWFHFTriggerActionSetsBuilderParameterStateClass_block_invoke;
      v61 = &unk_24C5AB7C0;
      v62 = &v54;
      __getWFHFTriggerActionSetsBuilderParameterStateClass_block_invoke((uint64_t)buf);
      v27 = v55[3];
    }
    v28 = objc_retainAutorelease(v27);
    _Block_object_dispose(&v54, 8);
    v29 = [v28 alloc];
    objc_msgSend(v47, "allActionSets");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v48;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v32 = getWFSerializableHomeIdentifierSymbolLoc_ptr;
    v61 = getWFSerializableHomeIdentifierSymbolLoc_ptr;
    if (!getWFSerializableHomeIdentifierSymbolLoc_ptr)
    {
      v33 = WorkflowKitLibrary();
      v32 = dlsym(v33, "WFSerializableHomeIdentifier");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v32;
      getWFSerializableHomeIdentifierSymbolLoc_ptr = v32;
    }
    _Block_object_dispose(buf, 8);
    if (v32)
      break;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull soft_WFSerializableHomeIdentifier(HMHome * _Nonnull __strong)");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("WFHomeWorkflowEditorViewController.m"), 133, CFSTR("%s"), dlerror());

LABEL_35:
    __break(1u);
LABEL_36:
    free(v10);
  }
  ((void (*)(id))v32)(v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v29, "initWithActionSets:homeIdentifier:", v30, v34);
  objc_msgSend(getWFActionRegistryClass(), "sharedRegistry");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = CFSTR("WFHomeTriggerActionSets");
  -[NSObject serializedRepresentation](v15, "serializedRepresentation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v36;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.homeaccessory"), v37);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSObject addAction:](v20, "addAction:", v17);
LABEL_21:

  if (!v20)
    goto LABEL_29;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2050000000;
  v38 = (void *)getWFComposeViewControllerClass_softClass;
  v57 = getWFComposeViewControllerClass_softClass;
  if (!getWFComposeViewControllerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getWFComposeViewControllerClass_block_invoke;
    v61 = &unk_24C5AB7C0;
    v62 = &v54;
    __getWFComposeViewControllerClass_block_invoke((uint64_t)buf);
    v38 = v55[3];
  }
  v39 = objc_retainAutorelease(v38);
  _Block_object_dispose(&v54, 8);
  v40 = objc_msgSend([v39 alloc], "initWithWorkflow:database:home:shouldShowShareButton:", v20, 0, v48, 0);
  composeViewController = v9->_composeViewController;
  v9->_composeViewController = (WFComposeViewController *)v40;

  -[WFComposeViewController setDelegate:](v9->_composeViewController, "setDelegate:", v9);
  v22 = v9;
  v15 = v20;
LABEL_32:

LABEL_33:
  return v22;
}

- (void)viewDidLoad
{
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WFHomeWorkflowEditorViewController;
  -[WFHomeWorkflowEditorViewController viewDidLoad](&v14, sel_viewDidLoad);
  WFLocalizedString(CFSTR("Shortcut"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHomeWorkflowEditorViewController setTitle:](self, "setTitle:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_homeTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHomeWorkflowEditorViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

  -[WFHomeWorkflowEditorViewController composeViewController](self, "composeViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFHomeWorkflowEditorViewController composeViewController](self, "composeViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHomeWorkflowEditorViewController addChildViewController:](self, "addChildViewController:", v7);

    -[WFHomeWorkflowEditorViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHomeWorkflowEditorViewController composeViewController](self, "composeViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v10);

    -[WFHomeWorkflowEditorViewController composeViewController](self, "composeViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didMoveToParentViewController:", self);

    -[WFHomeWorkflowEditorViewController doneBarButtonItem](self, "doneBarButtonItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHomeWorkflowEditorViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFHomeWorkflowEditorViewController;
  -[WFHomeWorkflowEditorViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  objc_msgSend((id)objc_opt_class(), "preloadActionRegistryIfNeeded");
  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_homeTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHomeWorkflowEditorViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v4);

}

- (id)doneBarButtonItem
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BEBD410]);
  WFLocalizedString(CFSTR("Next"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 2, self, sel_didTapDone);

  return v5;
}

- (void)didTapDone
{
  void *v3;
  void *v4;
  id v5;

  -[WFHomeWorkflowEditorViewController composeViewController](self, "composeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[WFHomeWorkflowEditorViewController composeViewController](self, "composeViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishEditing");

}

- (void)composeViewControllerRequestsDismissal:(id)a3 forTutorial:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  objc_class *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD aBlock[4];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE buf[24];
  void *v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__WFHomeWorkflowEditorViewController_composeViewControllerRequestsDismissal_forTutorial_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_24C5AB400;
  v11 = v9;
  v25 = v11;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!a4)
  {
    objc_msgSend(v8, "workflow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "record");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fileRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v15, "fileDataWithError:", &v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v23;

    if (v16)
    {
      v26 = 0;
      v27 = &v26;
      v28 = 0x2050000000;
      v18 = (void *)getWFHomeWorkflowClass_softClass;
      v29 = getWFHomeWorkflowClass_softClass;
      if (!getWFHomeWorkflowClass_softClass)
      {
        *(_QWORD *)buf = v10;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getWFHomeWorkflowClass_block_invoke;
        v31 = &unk_24C5AB7C0;
        v32 = &v26;
        __getWFHomeWorkflowClass_block_invoke((uint64_t)buf);
        v18 = (void *)v27[3];
      }
      v19 = objc_retainAutorelease(v18);
      _Block_object_dispose(&v26, 8);
      v20 = objc_msgSend([v19 alloc], "initWithData:", v16);
      -[WFHomeWorkflowEditorViewController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v21, "homeWorkflowEditorViewController:didFinishWithHomeWorkflow:includesSecureAccessory:", self, v20, -[NSObject requiresDeviceUnlock](v20, "requiresDeviceUnlock"));
      else
        -[WFHomeWorkflowEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v11);

    }
    else
    {
      getWFGeneralLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "workflow");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[WFHomeWorkflowEditorViewController composeViewControllerRequestsDismissal:forTutorial:wit"
                             "hCompletionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v22;
        *(_WORD *)&buf[22] = 2114;
        v31 = v17;
        _os_log_impl(&dword_20CE0F000, v20, OS_LOG_TYPE_ERROR, "%s Failed to get file data from Workflow: %@. Error: %{public}@", buf, 0x20u);

      }
    }

  }
  v12[2](v12);

}

- (WFHomeWorkflowEditorViewControllerDelegate)delegate
{
  return (WFHomeWorkflowEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFComposeViewController)composeViewController
{
  return self->_composeViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __111__WFHomeWorkflowEditorViewController_composeViewControllerRequestsDismissal_forTutorial_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)preloadHomeManager
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(getWFHomeManagerClass(), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasLoadedHomes");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(getWFHomeManagerClass(), "sharedManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
}

+ (void)preloadActionRegistryIfNeeded
{
  id v2;

  objc_msgSend(getWFActionRegistryClass(), "sharedRegistry");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fill");

}

@end
