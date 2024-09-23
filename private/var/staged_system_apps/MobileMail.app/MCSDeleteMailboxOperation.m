@implementation MCSDeleteMailboxOperation

- (MCSDeleteMailboxOperation)initWithMailboxToDelete:(id)a3
{
  id v5;
  MCSDeleteMailboxOperation *v6;
  MCSDeleteMailboxOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCSDeleteMailboxOperation;
  v6 = -[MCSDeleteMailboxOperation init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mailboxToDelete, a3);
    *((_BYTE *)&v7->super.super + 8) |= 1u;
  }

  return v7;
}

- (BOOL)commit
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid account](self->_mailboxToDelete, "account"));
  if (objc_msgSend(v3, "canMailboxBeDeleted:", self->_mailboxToDelete))
  {
    v4 = objc_alloc((Class)EMDeleteMailboxChangeAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid objectID](self->_mailboxToDelete, "objectID"));
    v6 = objc_msgSend(v4, "initWithMailboxObjectID:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "daemonInterface"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailboxRepository"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performMailboxChangeAction:", v6));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "result:", 0));
    v12 = objc_msgSend(v11, "BOOLValue");

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)revert
{
  return 1;
}

- (id)mailboxToRemove
{
  return self->_mailboxToDelete;
}

- (id)accountForErrorHandling
{
  return -[MFMailboxUid account](self->_mailboxToDelete, "account");
}

- (id)localizedErrorDescription
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ERROR_DELETING_MAILBOX_DESCRIPTION"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (id)localizedErrorTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ERROR_DELETING_MAILBOX_TITLE"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxToDelete, 0);
}

@end
