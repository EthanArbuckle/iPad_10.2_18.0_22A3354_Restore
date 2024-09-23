@implementation MCSCreateMailboxOperation

- (MCSCreateMailboxOperation)initWithName:(id)a3 parentMailbox:(id)a4
{
  id v6;
  id v7;
  MCSCreateMailboxOperation *v8;
  NSString *v9;
  NSString *pendingName;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCSCreateMailboxOperation;
  v8 = -[MCSCreateMailboxOperation init](&v12, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    pendingName = v8->_pendingName;
    v8->_pendingName = v9;

    objc_storeStrong((id *)&v8->_parentMailbox, a4);
    *((_BYTE *)&v8->super.super + 8) |= 1u;
  }

  return v8;
}

- (BOOL)commit
{
  void *v3;
  NSString *pendingName;
  unsigned int v5;
  id v6;
  id v7;
  NSString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid account](self->_parentMailbox, "account"));
  if (!objc_msgSend(v3, "canCreateNewMailboxes"))
  {
    v6 = 0;
    goto LABEL_5;
  }
  pendingName = self->_pendingName;
  v18 = 0;
  v5 = objc_msgSend(v3, "newMailboxNameIsAcceptable:reasonForFailure:", pendingName, &v18);
  v6 = v18;
  if (!v5)
  {
LABEL_5:
    -[MCSCreateMailboxOperation setReasonForFailure:](self, "setReasonForFailure:", v6);
    v16 = 0;
    goto LABEL_6;
  }
  v7 = objc_alloc((Class)EMCreateMailboxChangeAction);
  v8 = self->_pendingName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid objectID](self->_parentMailbox, "objectID"));
  v10 = objc_msgSend(v7, "initWithMailboxName:parentMailboxID:", v8, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "daemonInterface"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mailboxRepository"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "performMailboxChangeAction:", v10));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "result:", 0));
  v16 = objc_msgSend(v15, "BOOLValue");

LABEL_6:
  return v16;
}

- (BOOL)revert
{
  return 1;
}

- (id)accountForErrorHandling
{
  return -[MFMailboxUid account](self->_parentMailbox, "account");
}

- (id)localizedErrorDescription
{
  NSString *reasonForFailure;
  NSString *v3;
  NSBundle *v4;
  void *v5;

  reasonForFailure = self->_reasonForFailure;
  if (reasonForFailure)
  {
    v3 = reasonForFailure;
  }
  else
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ERROR_CREATING_MAILBOX_DESCRIPTION"), &stru_100531B00, CFSTR("Main")));

  }
  return v3;
}

- (id)localizedErrorTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ERROR_CREATING_MAILBOX_TITLE"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (NSString)reasonForFailure
{
  return self->_reasonForFailure;
}

- (void)setReasonForFailure:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonForFailure, 0);
  objc_storeStrong((id *)&self->_parentMailbox, 0);
  objc_storeStrong((id *)&self->_pendingName, 0);
}

@end
