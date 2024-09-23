@implementation MCSMoveMailboxOperation

- (MCSMoveMailboxOperation)initWithMailboxToMove:(id)a3 toParent:(id)a4
{
  id v7;
  id v8;
  MCSMoveMailboxOperation *v9;
  MCSMoveMailboxOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCSMoveMailboxOperation;
  v9 = -[MCSMoveMailboxOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mailboxToMove, a3);
    objc_storeStrong((id *)&v10->_parentMailbox, a4);
    *((_BYTE *)&v10->super.super + 8) |= 1u;
  }

  return v10;
}

- (BOOL)commit
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid account](self->_mailboxToMove, "account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid account](self->_parentMailbox, "account"));
  if (v3 == v4)
  {
    v6 = objc_alloc((Class)EMMoveMailboxChangeAction);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid objectID](self->_mailboxToMove, "objectID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid objectID](self->_parentMailbox, "objectID"));
    v9 = objc_msgSend(v6, "initWithMailboxObjectID:newParentMailboxID:", v7, v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "daemonInterface"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mailboxRepository"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "performMailboxChangeAction:", v9));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "result:", 0));
    v5 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)revert
{
  return 1;
}

- (id)mailboxToMoveOrRename
{
  return self->_mailboxToMove;
}

- (id)mailboxParentForMove
{
  return self->_parentMailbox;
}

- (id)accountForErrorHandling
{
  return -[MFMailboxUid account](self->_mailboxToMove, "account");
}

- (id)localizedErrorDescription
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ERROR_MOVING_MAILBOX_DESCRIPTION"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (id)localizedErrorTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ERROR_MOVING_MAILBOX_TITLE"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentMailbox, 0);
  objc_storeStrong((id *)&self->_mailboxToMove, 0);
}

@end
