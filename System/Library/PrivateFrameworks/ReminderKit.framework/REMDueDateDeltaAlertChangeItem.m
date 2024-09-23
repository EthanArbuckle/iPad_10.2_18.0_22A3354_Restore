@implementation REMDueDateDeltaAlertChangeItem

- (REMDueDateDeltaAlertChangeItem)initWithReminderDueDateDeltaAlertContextChangeItem:(id)a3 dueDateDeltaAlert:(id)a4
{
  id v7;
  id v8;
  void *v9;
  REMDueDateDeltaAlertChangeItem *v10;
  REMDueDateDeltaAlertChangeItem *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "reminderDueDateDeltaAlertContextChangeItem");
    if (v9)
      goto LABEL_3;
  }
  NSLog(CFSTR("'%s' is unexpectedly nil"), "dueDateDeltaAlert");
LABEL_3:
  v13.receiver = self;
  v13.super_class = (Class)REMDueDateDeltaAlertChangeItem;
  v10 = -[REMDueDateDeltaAlertChangeItem init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_reminderDueDateDeltaAlertContextChangeItem, a3);
    objc_storeStrong((id *)&v11->_dueDateDeltaAlert, a4);
  }

  return v11;
}

- (id)setDueDateDelta:(id)a3
{
  id v4;
  void *v5;
  REMDueDateDeltaAlert *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  REMDueDateDeltaAlert *v12;
  void *v13;

  v4 = a3;
  -[REMDueDateDeltaAlertChangeItem dueDateDeltaAlert](self, "dueDateDeltaAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [REMDueDateDeltaAlert alloc];
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reminderID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acknowledgedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[REMDueDateDeltaAlert initWithIdentifier:reminderID:accountID:dueDateDelta:creationDate:acknowledgedDate:minimumSupportedAppVersion:](v6, "initWithIdentifier:reminderID:accountID:dueDateDelta:creationDate:acknowledgedDate:minimumSupportedAppVersion:", v7, v8, v9, v4, v10, v11, objc_msgSend(v5, "minimumSupportedAppVersion"));

  -[REMDueDateDeltaAlertChangeItem setDueDateDeltaAlert:](self, "setDueDateDeltaAlert:", v12);
  -[REMDueDateDeltaAlertChangeItem reminderDueDateDeltaAlertContextChangeItem](self, "reminderDueDateDeltaAlertContextChangeItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_addOrUpdateDueDateDeltaAlert:", v12);

  return v12;
}

- (id)setAcknowledgedDate:(id)a3
{
  id v4;
  void *v5;
  REMDueDateDeltaAlert *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  REMDueDateDeltaAlert *v12;
  void *v13;

  v4 = a3;
  -[REMDueDateDeltaAlertChangeItem dueDateDeltaAlert](self, "dueDateDeltaAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [REMDueDateDeltaAlert alloc];
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reminderID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dueDateDelta");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[REMDueDateDeltaAlert initWithIdentifier:reminderID:accountID:dueDateDelta:creationDate:acknowledgedDate:minimumSupportedAppVersion:](v6, "initWithIdentifier:reminderID:accountID:dueDateDelta:creationDate:acknowledgedDate:minimumSupportedAppVersion:", v7, v8, v9, v10, v11, v4, objc_msgSend(v5, "minimumSupportedAppVersion"));

  -[REMDueDateDeltaAlertChangeItem setDueDateDeltaAlert:](self, "setDueDateDeltaAlert:", v12);
  -[REMDueDateDeltaAlertChangeItem reminderDueDateDeltaAlertContextChangeItem](self, "reminderDueDateDeltaAlertContextChangeItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_addOrUpdateDueDateDeltaAlert:", v12);

  return v12;
}

- (id)_setMinimumSupportedAppVersion:(int64_t)a3
{
  void *v5;
  REMDueDateDeltaAlert *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  REMDueDateDeltaAlert *v13;
  void *v14;

  -[REMDueDateDeltaAlertChangeItem dueDateDeltaAlert](self, "dueDateDeltaAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [REMDueDateDeltaAlert alloc];
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reminderID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dueDateDelta");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acknowledgedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[REMDueDateDeltaAlert initWithIdentifier:reminderID:accountID:dueDateDelta:creationDate:acknowledgedDate:minimumSupportedAppVersion:](v6, "initWithIdentifier:reminderID:accountID:dueDateDelta:creationDate:acknowledgedDate:minimumSupportedAppVersion:", v7, v8, v9, v10, v11, v12, a3);

  -[REMDueDateDeltaAlertChangeItem setDueDateDeltaAlert:](self, "setDueDateDeltaAlert:", v13);
  -[REMDueDateDeltaAlertChangeItem reminderDueDateDeltaAlertContextChangeItem](self, "reminderDueDateDeltaAlertContextChangeItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_addOrUpdateDueDateDeltaAlert:", v13);

  return v13;
}

- (REMReminderDueDateDeltaAlertContextChangeItem)reminderDueDateDeltaAlertContextChangeItem
{
  return self->_reminderDueDateDeltaAlertContextChangeItem;
}

- (void)setReminderDueDateDeltaAlertContextChangeItem:(id)a3
{
  objc_storeStrong((id *)&self->_reminderDueDateDeltaAlertContextChangeItem, a3);
}

- (REMDueDateDeltaAlert)dueDateDeltaAlert
{
  return self->_dueDateDeltaAlert;
}

- (void)setDueDateDeltaAlert:(id)a3
{
  objc_storeStrong((id *)&self->_dueDateDeltaAlert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dueDateDeltaAlert, 0);
  objc_storeStrong((id *)&self->_reminderDueDateDeltaAlertContextChangeItem, 0);
}

@end
