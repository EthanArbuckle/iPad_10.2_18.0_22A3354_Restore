@implementation SCUIMoreHelpContextMenu

+ (id)menuWithDelegate:(id)a3
{
  return +[SCUIMoreHelpContextMenu menuWithDelegate:additionalOptions:](SCUIMoreHelpContextMenu, "menuWithDelegate:additionalOptions:", a3, 0);
}

+ (id)menuWithDelegate:(id)a3 additionalOptions:(int64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  +[SCUIMoreHelpContextMenu menuWithDelegate:additionalOptions:interventionType:](SCUIMoreHelpContextMenu, "menuWithDelegate:additionalOptions:interventionType:", v5, a4, SCUICurrentInterventionType());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)menuWithDelegate:(id)a3 additionalOptions:(int64_t)a4 interventionType:(int64_t)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  SCUIMoreHelpContextMenuContainer *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (void *)MEMORY[0x24BDBCEA0];
  v8 = a3;
  objc_msgSend(v7, "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIMoreHelpMenuModel modelWithOptions:interventionType:locale:](SCUIMoreHelpMenuModel, "modelWithOptions:interventionType:locale:", a4, a5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SCUIMoreHelpContextMenuContainer initWithOptions:interventionType:]([SCUIMoreHelpContextMenuContainer alloc], "initWithOptions:interventionType:", a4, a5);
  +[SCUIMoreHelpContextMenu menuActionsFromMode:menuInfo:menuDelegate:](SCUIMoreHelpContextMenu, "menuActionsFromMode:menuInfo:menuDelegate:", v10, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 == 2)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v10, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BEBD748], "menuWithTitle:children:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)menuActionsFromMode:(id)a3 menuInfo:(id)a4 menuDelegate:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id v20;
  id v21;
  _QWORD v22[6];
  id v23;
  _QWORD v24[3];
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  id location;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v7 = a4;
  v20 = a5;
  objc_initWeak(&location, v20);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy_;
  v30[4] = __Block_byref_object_dispose_;
  v19 = v7;
  v31 = v19;
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v21, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
        v24[0] = 0;
        v24[1] = v24;
        v24[2] = 0x2020000000;
        v25 = 0;
        v25 = objc_msgSend(v13, "actionID");
        v14 = (void *)MEMORY[0x24BEBD388];
        objc_msgSend(v13, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __69__SCUIMoreHelpContextMenu_menuActionsFromMode_menuInfo_menuDelegate___block_invoke;
        v22[3] = &unk_2516EC8C0;
        v22[4] = v24;
        objc_copyWeak(&v23, &location);
        v22[5] = v30;
        objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v15, 0, 0, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "destructive"))
          objc_msgSend(v16, "setAttributes:", 2);
        objc_msgSend(v8, "addObject:", v16);

        objc_destroyWeak(&v23);
        _Block_object_dispose(v24, 8);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v10);
  }

  v17 = (void *)objc_msgSend(v8, "copy");
  _Block_object_dispose(v30, 8);

  objc_destroyWeak(&location);
  return v17;
}

void __69__SCUIMoreHelpContextMenu_menuActionsFromMode_menuInfo_menuDelegate___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  char v4;
  id v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;

  v18 = a2;
  switch(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    case 1:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      v4 = objc_opt_respondsToSelector();

      if ((v4 & 1) != 0)
      {
        v5 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v5, "didMessageSomeone:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        goto LABEL_16;
      }
      +[SCUIMoreHelpContextMenu didMessageSomeoneDefaultImplementationWith:](SCUIMoreHelpContextMenu, "didMessageSomeoneDefaultImplementationWith:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "interventionType"));
      break;
    case 2:
      v6 = objc_loadWeakRetained((id *)(a1 + 48));
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v5 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v5, "didAskForMoreHelp:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        goto LABEL_16;
      }
      break;
    case 3:
      v8 = objc_loadWeakRetained((id *)(a1 + 48));
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v5 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v5, "didLeaveConversation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        goto LABEL_16;
      }
      break;
    case 4:
      v10 = objc_loadWeakRetained((id *)(a1 + 48));
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        v5 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v5, "didBlockContact:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        goto LABEL_16;
      }
      break;
    case 5:
      v12 = objc_loadWeakRetained((id *)(a1 + 48));
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        v5 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v5, "didBlockContacts:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        goto LABEL_16;
      }
      break;
    case 6:
      v14 = objc_loadWeakRetained((id *)(a1 + 48));
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        v5 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v5, "didDeleteItem:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        goto LABEL_16;
      }
      break;
    case 7:
      v16 = objc_loadWeakRetained((id *)(a1 + 48));
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        v5 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v5, "didHidePhoto:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
LABEL_16:

      }
      break;
    default:
      break;
  }

}

+ (void)didMessageSomeoneDefaultImplementationWith:(int64_t)a3
{
  +[SCUIContactParentsHelper openChatWithParentsForInterventionType:](SCUIContactParentsHelper, "openChatWithParentsForInterventionType:", a3);
}

@end
