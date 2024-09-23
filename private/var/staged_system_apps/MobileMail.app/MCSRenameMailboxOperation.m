@implementation MCSRenameMailboxOperation

- (MCSRenameMailboxOperation)initWithMailboxToRename:(id)a3 toName:(id)a4
{
  id v7;
  id v8;
  MCSRenameMailboxOperation *v9;
  MCSRenameMailboxOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCSRenameMailboxOperation;
  v9 = -[MCSRenameMailboxOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mailboxToRename, a3);
    objc_storeStrong((id *)&v10->_pendingName, a4);
    *((_BYTE *)&v10->super.super + 8) |= 1u;
  }

  return v10;
}

- (BOOL)commit
{
  void *v3;
  NSString *pendingName;
  unsigned int v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid account](self->_mailboxToRename, "account"));
  if (!objc_msgSend(v3, "canMailboxBeRenamed:", self->_mailboxToRename))
  {
    v6 = 0;
    goto LABEL_5;
  }
  pendingName = self->_pendingName;
  v17 = 0;
  v5 = objc_msgSend(v3, "newMailboxNameIsAcceptable:reasonForFailure:", pendingName, &v17);
  v6 = v17;
  if (!v5)
  {
LABEL_5:
    -[MCSRenameMailboxOperation setReasonForFailure:](self, "setReasonForFailure:", v6);
    v15 = 0;
    goto LABEL_6;
  }
  v7 = objc_alloc((Class)EMRenameMailboxChangeAction);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid objectID](self->_mailboxToRename, "objectID"));
  v9 = objc_msgSend(v7, "initWithMailboxObjectID:newName:", v8, self->_pendingName);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "daemonInterface"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mailboxRepository"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "performMailboxChangeAction:", v9));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "result:", 0));
  v15 = objc_msgSend(v14, "BOOLValue");

LABEL_6:
  return v15;
}

- (BOOL)revert
{
  return 1;
}

- (id)modifiedMailboxName
{
  return self->_pendingName;
}

- (id)mailboxToMoveOrRename
{
  return self->_mailboxToRename;
}

- (id)mailboxParentForMove
{
  return 0;
}

- (id)accountForErrorHandling
{
  return -[MFMailboxUid account](self->_mailboxToRename, "account");
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
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ERROR_RENAMING_MAILBOX_DESCRIPTION"), &stru_100531B00, CFSTR("Main")));

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
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ERROR_RENAMING_MAILBOX_TITLE"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (BOOL)allowOtherMailboxOperation:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(MCSRenameMailboxOperation);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return (isKindOfClass & 1) == 0;
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
  objc_storeStrong((id *)&self->_pendingName, 0);
  objc_storeStrong((id *)&self->_mailboxToRename, 0);
}

@end
