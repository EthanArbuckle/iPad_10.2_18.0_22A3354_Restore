@implementation TransferNavigationController

- (TransferNavigationController)initWithMessages:(id)a3 scene:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  TransferMailboxPickerController *v9;
  TransferNavigationController *v10;
  TransferNavigationController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v9 = -[TransferMailboxPickerController initWithItems:scene:]([TransferMailboxPickerController alloc], "initWithItems:scene:", v7, v8);
  v13.receiver = self;
  v13.super_class = (Class)TransferNavigationController;
  v10 = -[TransferNavigationController initWithRootViewController:](&v13, "initWithRootViewController:", v9);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_scene, v8);
    objc_storeStrong((id *)&v11->_mailboxPickerController, v9);
    v11->_multipleMessages = (unint64_t)objc_msgSend(v7, "count") > 1;
    -[TransferNavigationController updatePrompt](v11, "updatePrompt");
  }

  return v11;
}

- (TransferNavigationController)initWithMessages:(id)a3 scene:(id)a4
{
  return -[TransferNavigationController initWithMessages:scene:options:](self, "initWithMessages:scene:options:", a3, a4, 0);
}

- (void)setWillTransferMessagesToMailbox:(id)a3
{
  -[TransferMailboxPickerController setWillTransferMessages:](self->_mailboxPickerController, "setWillTransferMessages:", a3);
}

- (void)setDidFinish:(id)a3
{
  -[TransferMailboxPickerController setDidFinish:](self->_mailboxPickerController, "setDidFinish:", a3);
}

- (void)setMailboxPrediction:(id)a3
{
  -[TransferMailboxPickerController setMailboxPrediction:](self->_mailboxPickerController, "setMailboxPrediction:", a3);
}

- (void)updatePrompt
{
  void *v3;
  char *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransferNavigationController scene](self, "scene"));
  v4 = (char *)objc_msgSend(v3, "interfaceOrientation");

  v5 = 0;
  if ((+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) == 0
    && (unint64_t)(v4 - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    v6 = !self->_multipleMessages;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    if (v6)
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MOVE_MESSAGE_PROMPT"), &stru_100531B00, CFSTR("Main")));
    else
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MOVE_MESSAGES_PROMPT"), &stru_100531B00, CFSTR("Main")));
    v5 = (void *)v9;

  }
  v10 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransferNavigationController navigationBar](self, "navigationBar", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), "setPrompt:", v5);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v10);
}

- (BOOL)canDismiss
{
  return 0;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)purgeMemoryForReason:(int)a3
{
  uint64_t v3;
  unsigned __int8 v5;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  v5 = +[UIDevice mf_isPad](UIDevice, "mf_isPad");
  if ((_DWORD)v3 == 1 || (v5 & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)TransferNavigationController;
    -[TransferNavigationController purgeMemoryForReason:](&v6, "purgeMemoryForReason:", v3);
  }
}

- (TransferMailboxPickerController)mailboxPickerController
{
  return self->_mailboxPickerController;
}

- (MailScene)scene
{
  return (MailScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_mailboxPickerController, 0);
}

@end
