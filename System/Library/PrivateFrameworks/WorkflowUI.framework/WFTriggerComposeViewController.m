@implementation WFTriggerComposeViewController

- (WFTriggerComposeViewController)initWithWorkflow:(id)a3 mode:(unint64_t)a4 database:(id)a5
{
  WFTriggerComposeViewController *v6;
  WFTriggerComposeViewController *v7;
  WFTriggerComposeViewController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFTriggerComposeViewController;
  v6 = -[WFComposeViewController initWithWorkflow:database:home:shouldShowShareButton:](&v10, sel_initWithWorkflow_database_home_shouldShowShareButton_, a3, a5, 0, 0);
  v7 = v6;
  if (v6)
  {
    v6->_mode = a4;
    v8 = v6;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  -[WFTriggerComposeViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFTriggerComposeViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "triggerComposeViewControllerDidCancel:", self);

  }
  v6.receiver = self;
  v6.super_class = (Class)WFTriggerComposeViewController;
  -[WFComposeViewController dealloc](&v6, sel_dealloc);
}

- (Class)triggerInputType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[WFComposeViewController database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workflowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuredTriggersForWorkflowID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "trigger");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "shortcutInputContentItemClass");

        if (v13)
        {
          v9 = v13;
          goto LABEL_11;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return (Class)v9;
}

- (BOOL)showsDetailsButton
{
  return 0;
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFTriggerComposeViewController;
  -[WFTriggerComposeViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (unint64_t)navigationUpdateBehavior
{
  return 4;
}

- (void)dismissForTutorial:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a4;
  getWFTriggersLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = _Block_copy(v6);
    *(_DWORD *)buf = 136315650;
    v14 = "-[WFTriggerComposeViewController dismissForTutorial:completionHandler:]";
    v15 = 1024;
    v16 = v4;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_22007E000, v7, OS_LOG_TYPE_DEBUG, "%s WFTriggerComposeViewController dismissForTutorial:%d completionHandler:%{public}@", buf, 0x1Cu);

  }
  if ((-[WFTriggerComposeViewController isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
  {
    if (v4)
    {
      getWFTriggersLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[WFTriggerComposeViewController dismissForTutorial:completionHandler:]";
        _os_log_impl(&dword_22007E000, v9, OS_LOG_TYPE_FAULT, "%s WARNING This VC shouldn't be used for tutorials", buf, 0xCu);
      }

      v12.receiver = self;
      v12.super_class = (Class)WFTriggerComposeViewController;
      -[WFComposeViewController dismissForTutorial:completionHandler:](&v12, sel_dismissForTutorial_completionHandler_, 1, v6);
    }
    else
    {
      -[WFTriggerComposeViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFComposeViewController workflow](self, "workflow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "triggerComposeViewController:didFinishWithWorkflow:", self, v11);

      if (v6)
        v6[2](v6);
    }
  }

}

- (id)doneBarButtonItem
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BEBD410]);
  WFLocalizedString(CFSTR("Done"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 2, self, sel_didTapNext_);

  return v5;
}

- (void)didTapNext:(id)a3
{
  void *v4;

  -[WFComposeViewController editorViewController](self, "editorViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[WFComposeViewController finishEditing](self, "finishEditing");
}

- (WFTriggerComposeViewControllerDelegate)delegate
{
  return (WFTriggerComposeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
}

+ (BOOL)canShowInputAction
{
  return 0;
}

@end
