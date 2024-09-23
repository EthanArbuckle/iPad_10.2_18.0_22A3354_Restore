@implementation MailMailboxChangeSet

- (MailMailboxChangeSet)initWithOperation:(id)a3
{
  id v5;
  MailMailboxChangeSet *v6;
  MailMailboxChangeSet *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MailMailboxChangeSet;
  v6 = -[MailMailboxChangeSet init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mailboxOperation, a3);
    *((_BYTE *)&v7->super + 16) |= 1u;
  }

  return v7;
}

- (id)applyPendingChangeToObjects:(id)a3
{
  return 0;
}

- (BOOL)commit
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  MailMailboxChangeSet *v8;
  __int16 v9;
  _BOOL4 v10;

  if (!-[MCSChange isFinalized](self, "isFinalized"))
    sub_1003923CC();
  v3 = -[MCSMailboxOperation commit](self->_mailboxOperation, "commit");
  v4 = MFLogGeneral(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 1024;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ChangeSetActions Committed %@ with result %d", (uint8_t *)&v7, 0x12u);
  }

  if (!v3)
    -[MailMailboxChangeSet revert](self, "revert");
  return v3;
}

- (BOOL)revert
{
  if (!-[MCSChange isFinalized](self, "isFinalized"))
    sub_1003923F4();
  return -[MCSMailboxOperation revert](self->_mailboxOperation, "revert");
}

- (id)localizedErrorDescription
{
  return -[MCSMailboxOperation localizedErrorDescription](self->_mailboxOperation, "localizedErrorDescription");
}

- (id)localizedErrorTitle
{
  return -[MCSMailboxOperation localizedErrorTitle](self->_mailboxOperation, "localizedErrorTitle");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MailMailboxChangeSet;
  v3 = -[MailMailboxChangeSet description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, self->_mailboxOperation));

  return v5;
}

- (id)modifiedMailboxName
{
  return -[MCSMailboxOperation modifiedMailboxName](self->_mailboxOperation, "modifiedMailboxName");
}

- (id)mailboxToRemove
{
  return -[MCSMailboxOperation mailboxToRemove](self->_mailboxOperation, "mailboxToRemove");
}

- (id)mailboxToMoveOrRename
{
  return -[MCSMailboxOperation mailboxToMoveOrRename](self->_mailboxOperation, "mailboxToMoveOrRename");
}

- (id)mailboxParentForMove
{
  return -[MCSMailboxOperation mailboxParentForMove](self->_mailboxOperation, "mailboxParentForMove");
}

- (id)accounts
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCSMailboxOperation accountForErrorHandling](self->_mailboxOperation, "accountForErrorHandling"));
  if (v4)
    objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (id)stores
{
  return 0;
}

- (BOOL)allowOtherChange:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class(MailMailboxChangeSet);
  if ((v4 == 0) | ((objc_opt_isKindOfClass(v4, v5) & 1) == 0))
    v6 = 1;
  else
    v6 = -[MCSMailboxOperation allowOtherMailboxOperation:](self->_mailboxOperation, "allowOtherMailboxOperation:", v4[3]);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxOperation, 0);
}

@end
