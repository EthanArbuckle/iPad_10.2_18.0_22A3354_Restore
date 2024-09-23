@implementation SCUIMoreHelpMenu

+ (id)menu
{
  return +[SCUIMoreHelpMenu menuWithOptions:](SCUIMoreHelpMenu, "menuWithOptions:", 0);
}

+ (id)menuWithOptions:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = SCUICurrentInterventionType();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIMoreHelpMenu menuWithOptions:interventionType:locale:](SCUIMoreHelpMenu, "menuWithOptions:interventionType:locale:", a3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)menuWithOptions:(int64_t)a3 interventionType:(int64_t)a4 locale:(id)a5
{
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  objc_super v12;

  +[SCUIMoreHelpMenuModel modelWithOptions:interventionType:locale:](SCUIMoreHelpMenuModel, "modelWithOptions:interventionType:locale:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = SCUIIsRunningInMacCatalyst();
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___SCUIMoreHelpMenu;
  objc_msgSendSuper2(&v12, sel_alertControllerWithTitle_message_preferredStyle_, v8, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addActionsFromModel:", v7);
  objc_msgSend(v10, "setInterventionType:", a4);
  objc_msgSend(v10, "setOptions:", objc_msgSend(v7, "options"));

  return v10;
}

- (void)addActionsFromModel:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[3];
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id location;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  objc_initWeak(&location, self);
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  v24 = 0u;
  objc_msgSend(v17, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        v22[0] = 0;
        v22[1] = v22;
        v22[2] = 0x2020000000;
        v23 = 0;
        v23 = objc_msgSend(v8, "actionID", v17);
        v9 = (void *)MEMORY[0x24BEBD3A8];
        objc_msgSend(v8, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v8, "destructive");
        v20[0] = MEMORY[0x24BDAC760];
        if (v11)
          v12 = 2;
        else
          v12 = 0;
        v20[1] = 3221225472;
        v20[2] = __40__SCUIMoreHelpMenu_addActionsFromModel___block_invoke;
        v20[3] = &unk_2516EC870;
        v20[4] = v22;
        objc_copyWeak(&v21, &location);
        objc_msgSend(v9, "actionWithTitle:style:handler:", v10, v12, v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCUIMoreHelpMenu addAction:](self, "addAction:", v13);

        objc_destroyWeak(&v21);
        _Block_object_dispose(v22, 8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }

  v14 = (void *)MEMORY[0x24BEBD3A8];
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", CFSTR("CANCEL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __40__SCUIMoreHelpMenu_addActionsFromModel___block_invoke_2;
  v18[3] = &unk_2516EC898;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCUIMoreHelpMenu addAction:](self, "addAction:", v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __40__SCUIMoreHelpMenu_addActionsFromModel___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  char v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id *v11;
  id v12;
  void *v13;
  char v14;
  id *v15;
  id v16;
  void *v17;
  char v18;
  id *v19;
  id v20;
  void *v21;
  char v22;
  id *v23;
  id v24;
  void *v25;
  char v26;
  id *v27;
  id v28;
  void *v29;
  char v30;
  id *v31;
  id v32;
  void *v33;
  char v34;
  id v35;

  v35 = a2;
  switch(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    case 1:
      v3 = (id *)(a1 + 40);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "menuDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      v7 = objc_loadWeakRetained(v3);
      v8 = v7;
      if ((v6 & 1) != 0)
      {
        objc_msgSend(v7, "menuDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_loadWeakRetained(v3);
        objc_msgSend(v9, "didMessageSomeone:", v10);
        break;
      }
      objc_msgSend(v7, "didMessageSomeoneDefaultImplementation");
      goto LABEL_17;
    case 2:
      v11 = (id *)(a1 + 40);
      v12 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v12, "menuDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0)
        goto LABEL_18;
      v8 = objc_loadWeakRetained(v11);
      objc_msgSend(v8, "menuDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained(v11);
      objc_msgSend(v9, "didAskForMoreHelp:", v10);
      break;
    case 3:
      v15 = (id *)(a1 + 40);
      v16 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v16, "menuDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0)
        goto LABEL_18;
      v8 = objc_loadWeakRetained(v15);
      objc_msgSend(v8, "menuDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained(v15);
      objc_msgSend(v9, "didLeaveConversation:", v10);
      break;
    case 4:
      v19 = (id *)(a1 + 40);
      v20 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v20, "menuDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) == 0)
        goto LABEL_18;
      v8 = objc_loadWeakRetained(v19);
      objc_msgSend(v8, "menuDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained(v19);
      objc_msgSend(v9, "didBlockContact:", v10);
      break;
    case 5:
      v23 = (id *)(a1 + 40);
      v24 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v24, "menuDelegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) == 0)
        goto LABEL_18;
      v8 = objc_loadWeakRetained(v23);
      objc_msgSend(v8, "menuDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained(v23);
      objc_msgSend(v9, "didBlockContacts:", v10);
      break;
    case 6:
      v27 = (id *)(a1 + 40);
      v28 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v28, "menuDelegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_opt_respondsToSelector();

      if ((v30 & 1) == 0)
        goto LABEL_18;
      v8 = objc_loadWeakRetained(v27);
      objc_msgSend(v8, "menuDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained(v27);
      objc_msgSend(v9, "didDeleteItem:", v10);
      break;
    case 7:
      v31 = (id *)(a1 + 40);
      v32 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v32, "menuDelegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) == 0)
        goto LABEL_18;
      v8 = objc_loadWeakRetained(v31);
      objc_msgSend(v8, "menuDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained(v31);
      objc_msgSend(v9, "didHidePhoto:", v10);
      break;
    default:
      goto LABEL_18;
  }

LABEL_17:
LABEL_18:

}

void __40__SCUIMoreHelpMenu_addActionsFromModel___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;
  id v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "menuDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "menuDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "didCancel:", v6);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCUIMoreHelpMenu;
  -[SCUIMoreHelpMenu viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[SCUIMoreHelpMenu presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCUIMoreHelpMenu setViewControllerThatPresented:](self, "setViewControllerThatPresented:", v4);

}

- (void)didMessageSomeoneDefaultImplementation
{
  +[SCUIContactParentsHelper openChatWithParentsForInterventionType:](SCUIContactParentsHelper, "openChatWithParentsForInterventionType:", -[SCUIMoreHelpMenu interventionType](self, "interventionType"));
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (SCUIMoreHelpMenuDelegate)menuDelegate
{
  return (SCUIMoreHelpMenuDelegate *)objc_loadWeakRetained((id *)&self->_menuDelegate);
}

- (void)setMenuDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_menuDelegate, a3);
}

- (int64_t)interventionType
{
  return self->_interventionType;
}

- (void)setInterventionType:(int64_t)a3
{
  self->_interventionType = a3;
}

- (UIViewController)viewControllerThatPresented
{
  return self->_viewControllerThatPresented;
}

- (void)setViewControllerThatPresented:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerThatPresented, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerThatPresented, 0);
  objc_destroyWeak((id *)&self->_menuDelegate);
}

@end
