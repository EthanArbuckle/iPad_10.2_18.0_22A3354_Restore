@implementation SCUIInterventionScreenViewController

- (SCUIInterventionScreenViewController)initWithContainer:(id)a3 contentScreen:(int64_t)a4 options:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SCUIInterventionScreenViewController *v14;
  void *v15;
  void *v16;

  v8 = a3;
  +[SCUIInterventionScreenModel modelForScreen:workflow:type:options:](SCUIInterventionScreenModel, "modelForScreen:workflow:type:options:", a4, objc_msgSend(v8, "workflow"), objc_msgSend(v8, "type"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v9, "imageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scImageNamed:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SCUIInterventionScreenViewController initWithTitle:detailText:icon:](self, "initWithTitle:detailText:icon:", v10, 0, v13);

  if (v14)
  {
    objc_storeWeak((id *)&v14->_container, v8);
    v14->_contentScreen = a4;
    v14->_options = objc_msgSend(v9, "options");
    -[SCUIInterventionScreenViewController addBulletsFromModel:](v14, "addBulletsFromModel:", v9);
    -[SCUIInterventionScreenViewController addButtonsFromModel:](v14, "addButtonsFromModel:", v9);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCUIInterventionScreenViewController view](v14, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTintColor:", v15);

  }
  return v14;
}

- (void)addBulletsFromModel:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "bullets", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x24BEBD640];
        objc_msgSend(v9, "imageName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scImageNamed:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCUIInterventionScreenViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", &stru_2516ED0A8, v10, v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)addButtonsFromModel:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "primary"))
          objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
        else
          objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTitle:forState:", v11, 0);

        v12 = objc_msgSend(v9, "actionID");
        v13 = sel_screenOne_notNowButtonPressed;
        switch(v12)
        {
          case 1:
            goto LABEL_15;
          case 2:
            v13 = sel_screenOne_moreHelpButtonPressed;
            goto LABEL_15;
          case 3:
            v13 = sel_screenOne_acceptButtonPressed;
            goto LABEL_15;
          case 4:
            v13 = sel_screenTwo_notNowButtonPressed;
            goto LABEL_15;
          case 5:
            v13 = sel_screenTwo_messageButtonPressed;
            goto LABEL_15;
          case 6:
            v13 = sel_screenTwo_acceptButtonPressed;
LABEL_15:
            objc_msgSend(v10, "addTarget:action:forControlEvents:", self, v13, 64);
            -[SCUIInterventionScreenViewController buttonTray](self, "buttonTray");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addButton:", v10);

            break;
          default:
            break;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)screenOne_notNowButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[SCUIAnalytics sharedInstance](SCUIAnalytics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectUIInteractionEvent:::::", 3, 3, 1, 1, 0);

  -[SCUIInterventionScreenViewController container](self, "container");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interventionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCUIInterventionScreenViewController container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didRejectForInterventionViewController:", v5);

}

- (void)screenOne_moreHelpButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  +[SCUIAnalytics sharedInstance](SCUIAnalytics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectUIInteractionEvent:::::", 3, 3, 1, 7, 0);

  -[SCUIInterventionScreenViewController container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interventionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SCUIInterventionScreenViewController container](self, "container");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "interventionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCUIInterventionScreenViewController container](self, "container");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didRequestMoreHelpForInterventionViewController:", v8);

  }
  else
  {
    -[SCUIInterventionScreenViewController screenOne_moreHelpButtonDefaultImplementation](self, "screenOne_moreHelpButtonDefaultImplementation");
  }
}

- (void)screenOne_acceptButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[SCUIAnalytics sharedInstance](SCUIAnalytics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectUIInteractionEvent:::::", 3, 3, 1, 2, 0);

  -[SCUIInterventionScreenViewController container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCUIInterventionScreenViewController nextScreenWithContainer:](self, "nextScreenWithContainer:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[SCUIInterventionScreenViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)screenOne_moreHelpButtonDefaultImplementation
{
  SCUIMoreHelpWebViewController *v3;

  v3 = objc_alloc_init(SCUIMoreHelpWebViewController);
  -[SCUIInterventionScreenViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)screenTwo_messageButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  +[SCUIAnalytics sharedInstance](SCUIAnalytics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectUIInteractionEvent:::::", 3, 3, 2, 5, 0);

  -[SCUIInterventionScreenViewController container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interventionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SCUIInterventionScreenViewController container](self, "container");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "interventionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCUIInterventionScreenViewController container](self, "container");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didContactSomeoneForInterventionViewController:", v8);

  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70__SCUIInterventionScreenViewController_screenTwo_messageButtonPressed__block_invoke;
    v10[3] = &unk_2516EC7D0;
    v10[4] = self;
    -[SCUIInterventionScreenViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v10);
  }
}

uint64_t __70__SCUIInterventionScreenViewController_screenTwo_messageButtonPressed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "screenTwo_messageButtonDefaultImplementation");
}

- (void)screenTwo_acceptButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  +[SCUIAnalytics sharedInstance](SCUIAnalytics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectUIInteractionEvent:::::", 3, 3, 2, 3, 0);

  -[SCUIInterventionScreenViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidesBackButton:", 1);

  -[SCUIInterventionScreenViewController container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__SCUIInterventionScreenViewController_screenTwo_acceptButtonPressed__block_invoke;
  v8[3] = &unk_2516EC938;
  v8[4] = self;
  +[SCUIScreenTimePasscodeController askUserForScreenTimePasscodeFrom:interventionType:completionHandler:](SCUIScreenTimePasscodeController, "askUserForScreenTimePasscodeFrom:interventionType:completionHandler:", self, v7, v8);

}

void __69__SCUIInterventionScreenViewController_screenTwo_acceptButtonPressed__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__SCUIInterventionScreenViewController_screenTwo_acceptButtonPressed__block_invoke_2;
  v6[3] = &unk_2516EC910;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __69__SCUIInterventionScreenViewController_screenTwo_acceptButtonPressed__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDE96D0], "clientUI");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_245CB6000, v2, OS_LOG_TYPE_DEFAULT, "Failed to check ScreenTime passcode error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "container");
    v2 = objc_claimAutoreleasedReturnValue();
    -[NSObject interventionDelegate](v2, "interventionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "container");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didConfirmForInterventionViewController:", v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 40), "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidesBackButton:", 0);

}

- (void)screenTwo_notNowButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[SCUIAnalytics sharedInstance](SCUIAnalytics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectUIInteractionEvent:::::", 3, 3, 2, 4, 0);

  -[SCUIInterventionScreenViewController container](self, "container");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interventionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCUIInterventionScreenViewController container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didRejectForInterventionViewController:", v5);

}

- (void)screenTwo_messageButtonDefaultImplementation
{
  id v2;

  -[SCUIInterventionScreenViewController container](self, "container");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SCUIContactParentsHelper openChatWithParentsForInterventionType:](SCUIContactParentsHelper, "openChatWithParentsForInterventionType:", objc_msgSend(v2, "type"));

}

- (id)nextScreenWithContainer:(id)a3
{
  id v4;
  SCUIInterventionScreenViewController *v5;

  v4 = a3;
  v5 = -[SCUIInterventionScreenViewController initWithContainer:contentScreen:options:]([SCUIInterventionScreenViewController alloc], "initWithContainer:contentScreen:options:", v4, 1, -[SCUIInterventionScreenViewController options](self, "options"));

  return v5;
}

- (SCUIInterventionViewController)container
{
  return (SCUIInterventionViewController *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (int64_t)contentScreen
{
  return self->_contentScreen;
}

- (int64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_container);
}

@end
