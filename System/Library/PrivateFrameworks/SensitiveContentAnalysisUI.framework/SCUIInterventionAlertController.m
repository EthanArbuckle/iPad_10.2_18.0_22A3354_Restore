@implementation SCUIInterventionAlertController

- (SCUIInterventionAlertController)initWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5
{
  id v8;
  SCUIInterventionAlertController *v9;

  v8 = a4;
  v9 = -[SCUIInterventionAlertController initWithWorkflow:contextDictionary:options:type:](self, "initWithWorkflow:contextDictionary:options:type:", a3, v8, a5, SCUICurrentInterventionType());

  return v9;
}

- (SCUIInterventionAlertController)initWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5 type:(int64_t)a6
{
  id v10;
  void *v11;
  SCUIInterventionAlertController *v12;
  uint64_t v13;
  NSDictionary *contextDictionary;
  uint64_t v15;
  SCUIInterventionScreenModel *screenModel;
  objc_super v18;

  v10 = a4;
  v11 = (void *)objc_opt_new();
  v18.receiver = self;
  v18.super_class = (Class)SCUIInterventionAlertController;
  v12 = -[SCUIInterventionAlertController initWithRootViewController:](&v18, sel_initWithRootViewController_, v11);

  if (v12)
  {
    v12->_workflow = a3;
    v13 = objc_msgSend(v10, "copy");
    contextDictionary = v12->_contextDictionary;
    v12->_contextDictionary = (NSDictionary *)v13;

    v12->_options = a5 | 1;
    v12->_type = a6;
    v12->_contentScreen = 0;
    +[SCUIInterventionScreenModel modelForScreen:workflow:type:options:](SCUIInterventionScreenModel, "modelForScreen:workflow:type:options:", 0, v12->_workflow, v12->_type, v12->_options);
    v15 = objc_claimAutoreleasedReturnValue();
    screenModel = v12->_screenModel;
    v12->_screenModel = (SCUIInterventionScreenModel *)v15;

  }
  return v12;
}

+ (id)viewControllerWithWorkflow:(int64_t)a3 contextDictionary:(id)a4
{
  return (id)objc_msgSend(a1, "viewControllerWithWorkflow:contextDictionary:options:", a3, a4, 0);
}

+ (id)viewControllerWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5
{
  id v7;
  void *v8;

  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWorkflow:contextDictionary:options:", a3, v7, a5);

  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCUIInterventionAlertController;
  -[SCUIInterventionAlertController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SCUIInterventionAlertController presentAlertScreen](self, "presentAlertScreen");
}

- (void)presentAlertScreen
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SCUIInterventionAlertController *val;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  val = self;
  -[SCUIInterventionScreenModel bullets](self->_screenModel, "bullets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v3, "length"))
          objc_msgSend(v3, "appendString:", CFSTR("\n\n"));
        objc_msgSend(v8, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v5);
  }

  v10 = (void *)MEMORY[0x24BEBD3B0];
  -[SCUIInterventionScreenModel title](val->_screenModel, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, v3, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, val);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[SCUIInterventionScreenModel actions](val->_screenModel, "actions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        v18 = (void *)MEMORY[0x24BEBD3A8];
        objc_msgSend(v17, "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __53__SCUIInterventionAlertController_presentAlertScreen__block_invoke;
        v22[3] = &unk_2516EC8E8;
        v22[4] = v17;
        objc_copyWeak(&v23, &location);
        objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "addAction:", v20);
        objc_destroyWeak(&v23);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v14);
  }

  -[SCUIInterventionAlertController presentViewController:animated:completion:](val, "presentViewController:animated:completion:", v12, 1, 0);
  objc_destroyWeak(&location);

}

void __53__SCUIInterventionAlertController_presentAlertScreen__block_invoke(uint64_t a1)
{
  id WeakRetained;

  switch(objc_msgSend(*(id *)(a1 + 32), "actionID"))
  {
    case 1:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "screenOne_notNowButtonPressed");
      goto LABEL_8;
    case 2:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "screenOne_moreHelpButtonPressed");
      goto LABEL_8;
    case 3:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "screenOne_acceptButtonPressed");
      goto LABEL_8;
    case 4:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "screenTwo_notNowButtonPressed");
      goto LABEL_8;
    case 5:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "screenTwo_messageButtonPressed");
      goto LABEL_8;
    case 6:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "screenTwo_acceptButtonPressed");
LABEL_8:

      break;
    default:
      return;
  }
}

- (void)screenOne_notNowButtonPressed
{
  void *v3;
  void *v4;

  +[SCUIAnalytics sharedInstance](SCUIAnalytics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectUIInteractionEvent:::::", 3, 3, 1, 1, 0);

  -[SCUIInterventionAlertController interventionDelegate](self, "interventionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didRejectForInterventionViewController:", self);

  -[SCUIInterventionAlertController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)screenOne_moreHelpButtonPressed
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  +[SCUIAnalytics sharedInstance](SCUIAnalytics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectUIInteractionEvent:::::", 3, 3, 1, 7, 0);

  -[SCUIInterventionAlertController interventionDelegate](self, "interventionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SCUIInterventionAlertController interventionDelegate](self, "interventionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didRequestMoreHelpForInterventionViewController:", self);

  }
  else
  {
    -[SCUIInterventionAlertController screenOne_moreHelpButtonDefaultImplementation](self, "screenOne_moreHelpButtonDefaultImplementation");
  }
  -[SCUIInterventionAlertController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)screenOne_acceptButtonPressed
{
  void *v3;
  SCUIInterventionScreenModel *v4;
  SCUIInterventionScreenModel *screenModel;

  +[SCUIAnalytics sharedInstance](SCUIAnalytics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectUIInteractionEvent:::::", 3, 3, 1, 2, 0);

  self->_contentScreen = 1;
  +[SCUIInterventionScreenModel modelForScreen:workflow:type:options:](SCUIInterventionScreenModel, "modelForScreen:workflow:type:options:", 1, self->_workflow, self->_type, self->_options);
  v4 = (SCUIInterventionScreenModel *)objc_claimAutoreleasedReturnValue();
  screenModel = self->_screenModel;
  self->_screenModel = v4;

  -[SCUIInterventionAlertController presentAlertScreen](self, "presentAlertScreen");
}

- (void)screenOne_moreHelpButtonDefaultImplementation
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[SCUIMoreHelpWebResources waysToGetHelpURLForInterventionType:](SCUIMoreHelpWebResources, "waysToGetHelpURLForInterventionType:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:options:completionHandler:", v3, MEMORY[0x24BDBD1B8], 0);

}

- (void)screenTwo_messageButtonPressed
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  +[SCUIAnalytics sharedInstance](SCUIAnalytics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectUIInteractionEvent:::::", 3, 3, 2, 5, 0);

  -[SCUIInterventionAlertController interventionDelegate](self, "interventionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SCUIInterventionAlertController interventionDelegate](self, "interventionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didContactSomeoneForInterventionViewController:", self);

  }
  else
  {
    -[SCUIInterventionAlertController screenTwo_messageButtonDefaultImplementation](self, "screenTwo_messageButtonDefaultImplementation");
  }
  -[SCUIInterventionAlertController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)screenTwo_acceptButtonPressed
{
  void *v3;
  void *v4;

  +[SCUIAnalytics sharedInstance](SCUIAnalytics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectUIInteractionEvent:::::", 3, 3, 2, 3, 0);

  -[SCUIInterventionAlertController interventionDelegate](self, "interventionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didConfirmForInterventionViewController:", self);

  -[SCUIInterventionAlertController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)screenTwo_notNowButtonPressed
{
  void *v3;
  void *v4;

  +[SCUIAnalytics sharedInstance](SCUIAnalytics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectUIInteractionEvent:::::", 3, 3, 2, 4, 0);

  -[SCUIInterventionAlertController interventionDelegate](self, "interventionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didRejectForInterventionViewController:", self);

  -[SCUIInterventionAlertController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)screenTwo_messageButtonDefaultImplementation
{
  +[SCUIContactParentsHelper openChatWithParentsForInterventionType:](SCUIContactParentsHelper, "openChatWithParentsForInterventionType:", -[SCUIInterventionAlertController type](self, "type"));
}

- (int64_t)workflow
{
  return self->_workflow;
}

- (SCUIInterventionViewControllerDelegate)interventionDelegate
{
  return (SCUIInterventionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_interventionDelegate);
}

- (void)setInterventionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interventionDelegate, a3);
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (int64_t)options
{
  return self->_options;
}

- (int64_t)contentScreen
{
  return self->_contentScreen;
}

- (SCUIInterventionScreenModel)screenModel
{
  return self->_screenModel;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenModel, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
  objc_destroyWeak((id *)&self->_interventionDelegate);
}

@end
