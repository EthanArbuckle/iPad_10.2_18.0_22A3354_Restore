@implementation MCSArchive

- (MCSArchive)initWithStore:(id)a3
{
  id v4;
  MCSArchive *v5;
  id v6;
  MCSFlagChange *v7;
  void *v8;
  MCSFlagChange *v9;
  MCSFlagChange *v10;
  void *v11;
  MCSFlagChange *v12;
  MCSMessageOperation *deleteOperation;
  MCSTransfer *v14;
  MCSMessageOperation *seenOrTransferOperation;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCSArchive;
  v5 = -[MCSArchive init](&v17, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "archiveDestination");
    if (v6 == (id)-500)
    {
      v7 = [MCSFlagChange alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", MessageIsRead, 0));
      v9 = -[MCSFlagChange initWithFlagsToSet:flagsToClear:reason:](v7, "initWithFlagsToSet:flagsToClear:reason:", v8, 0, 4);

      objc_storeStrong((id *)&v5->_seenOrTransferOperation, v9);
      v10 = [MCSFlagChange alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", MessageIsDeleted, 0));
      v12 = -[MCSFlagChange initWithFlagsToSet:flagsToClear:reason:](v10, "initWithFlagsToSet:flagsToClear:reason:", v11, 0, 4);

      -[MCSFlagChange setIsDeletion:](v12, "setIsDeletion:", 1);
      deleteOperation = v5->_deleteOperation;
      v5->_deleteOperation = &v12->super;

      v5->_isDeleteInPlace = 1;
    }
    else
    {
      v14 = -[MCSTransfer initWithSpecialDestination:markAsRead:deleteIfSame:]([MCSTransfer alloc], "initWithSpecialDestination:markAsRead:deleteIfSame:", v6, 1, 1);
      -[MCSTransfer setIsDeletion:](v14, "setIsDeletion:", 0);
      seenOrTransferOperation = v5->_seenOrTransferOperation;
      v5->_seenOrTransferOperation = &v14->super;

      v5->_isDeleteInPlace = 0;
    }
  }

  return v5;
}

- (id)applyPendingChangeToObjects:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCSOperation applyPendingChangeToObjects:](self->_seenOrTransferOperation, "applyPendingChangeToObjects:", v4));
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCSOperation applyPendingChangeToObjects:](self->_deleteOperation, "applyPendingChangeToObjects:", v4));
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  return v5;
}

- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"));
  objc_msgSend((id)v11, "addReason:", MonitoredActivityReasonArchiving);

  LOBYTE(v11) = -[MCSMessageOperation commitToMessages:failures:newMessages:](self->_seenOrTransferOperation, "commitToMessages:failures:newMessages:", v8, v9, v10);
  LOBYTE(self) = v11 | -[MCSMessageOperation commitToMessages:failures:newMessages:](self->_deleteOperation, "commitToMessages:failures:newMessages:", v8, v9, v10);

  return (char)self;
}

- (BOOL)willMarkRead
{
  unsigned int v3;

  v3 = -[MCSMessageOperation willMarkRead](self->_seenOrTransferOperation, "willMarkRead");
  if (self->_isDeleteInPlace)
    v3 |= -[MCSMessageOperation willMarkRead](self->_deleteOperation, "willMarkRead");
  return v3;
}

- (BOOL)willMarkUnread
{
  unsigned int v3;

  v3 = -[MCSMessageOperation willMarkUnread](self->_seenOrTransferOperation, "willMarkUnread");
  if (self->_isDeleteInPlace)
    v3 |= -[MCSMessageOperation willMarkUnread](self->_deleteOperation, "willMarkUnread");
  return v3;
}

- (BOOL)willUnflag
{
  unsigned int v3;

  v3 = -[MCSMessageOperation willUnflag](self->_seenOrTransferOperation, "willUnflag");
  if (self->_isDeleteInPlace)
    v3 |= -[MCSMessageOperation willUnflag](self->_deleteOperation, "willUnflag");
  return v3;
}

- (BOOL)willFlag
{
  unsigned int v3;

  v3 = -[MCSMessageOperation willFlag](self->_seenOrTransferOperation, "willFlag");
  if (self->_isDeleteInPlace)
    v3 |= -[MCSMessageOperation willFlag](self->_deleteOperation, "willFlag");
  return v3;
}

- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3
{
  return -[MCSMessageOperation localizedErrorDescriptionForMessageCount:](self->_seenOrTransferOperation, "localizedErrorDescriptionForMessageCount:", a3);
}

- (id)localizedErrorTitleForMessageCount:(unint64_t)a3
{
  return -[MCSMessageOperation localizedErrorTitleForMessageCount:](self->_seenOrTransferOperation, "localizedErrorTitleForMessageCount:", a3);
}

- (id)localizedShortOperationDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OPERATION_ARCHIVE_DESC"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteOperation, 0);
  objc_storeStrong((id *)&self->_seenOrTransferOperation, 0);
}

@end
