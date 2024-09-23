@implementation MCSDelete

- (MCSDelete)init
{
  -[MCSDelete doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSDelete init]", "MCSDelete.m", 23, "0");
}

- (MCSDelete)initWithStore:(id)a3
{
  id v4;
  MCSDelete *v5;

  v4 = a3;
  v5 = -[MCSDelete initWithDeleteInPlace:](self, "initWithDeleteInPlace:", objc_msgSend(v4, "shouldDeleteInPlace"));

  return v5;
}

- (MCSDelete)initWithDeleteInPlace:(BOOL)a3
{
  MCSDelete *v4;
  MCSFlagChange *v5;
  void *v6;
  MCSFlagChange *v7;
  MCSMessageOperation *operation;
  MCSTransfer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MCSDelete;
  v4 = -[MCSDelete init](&v11, "init");
  if (v4)
  {
    if (a3)
    {
      v5 = [MCSFlagChange alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", MessageIsDeleted, MessageIsRead, 0));
      v7 = -[MCSFlagChange initWithFlagsToSet:flagsToClear:reason:](v5, "initWithFlagsToSet:flagsToClear:reason:", v6, 0, 4);

      -[MCSFlagChange setIsDeletion:](v7, "setIsDeletion:", 1);
      operation = v4->_operation;
      v4->_operation = &v7->super;
    }
    else
    {
      v9 = -[MCSTransfer initWithSpecialDestination:markAsRead:deleteIfSame:]([MCSTransfer alloc], "initWithSpecialDestination:markAsRead:deleteIfSame:", 3, 1, 1);
      -[MCSTransfer setIsDeletion:](v9, "setIsDeletion:", 1);
      operation = v4->_operation;
      v4->_operation = &v9->super;
    }

  }
  return v4;
}

- (id)applyPendingChangeToObjects:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MCSOperation applyPendingChangeToObjects:](self->_operation, "applyPendingChangeToObjects:", a3));
}

- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"));
  objc_msgSend(v11, "addReason:", MonitoredActivityReasonDeleting);

  LOBYTE(self) = -[MCSMessageOperation commitToMessages:failures:newMessages:](self->_operation, "commitToMessages:failures:newMessages:", v8, v9, v10);
  return (char)self;
}

- (BOOL)willMarkRead
{
  return -[MCSMessageOperation willMarkRead](self->_operation, "willMarkRead");
}

- (BOOL)willMarkUnread
{
  return -[MCSMessageOperation willMarkUnread](self->_operation, "willMarkUnread");
}

- (BOOL)willUnflag
{
  return -[MCSMessageOperation willUnflag](self->_operation, "willUnflag");
}

- (BOOL)willFlag
{
  return -[MCSMessageOperation willFlag](self->_operation, "willFlag");
}

- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3
{
  return -[MCSMessageOperation localizedErrorDescriptionForMessageCount:](self->_operation, "localizedErrorDescriptionForMessageCount:", a3);
}

- (id)localizedErrorTitleForMessageCount:(unint64_t)a3
{
  return -[MCSMessageOperation localizedErrorTitleForMessageCount:](self->_operation, "localizedErrorTitleForMessageCount:", a3);
}

- (id)localizedShortOperationDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OPERATION_DELETE_DESC"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

- (BOOL)isFinalized
{
  return *((_BYTE *)&self->super.super + 8) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
}

@end
