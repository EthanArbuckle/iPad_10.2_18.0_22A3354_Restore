@implementation REMReminderDueDateDeltaAlertContextChangeItem

- (REMReminderDueDateDeltaAlertContextChangeItem)initWithReminderChangeItem:(id)a3
{
  id v5;
  REMReminderDueDateDeltaAlertContextChangeItem *v6;
  REMReminderDueDateDeltaAlertContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "reminderChangeItem");
  v9.receiver = self;
  v9.super_class = (Class)REMReminderDueDateDeltaAlertContextChangeItem;
  v6 = -[REMReminderDueDateDeltaAlertContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reminderChangeItem, a3);

  return v7;
}

- (id)addDueDateDeltaAlertWithDueDateDelta:(id)a3 identifier:(id)a4 creationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  REMDueDateDeltaAlert *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  REMDueDateDeltaAlert *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99D68], "rem_now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = [REMDueDateDeltaAlert alloc];
  -[REMReminderDueDateDeltaAlertContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderDueDateDeltaAlertContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accountID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[REMDueDateDeltaAlert initWithIdentifier:reminderID:accountID:dueDateDelta:creationDate:acknowledgedDate:minimumSupportedAppVersion:](v12, "initWithIdentifier:reminderID:accountID:dueDateDelta:creationDate:acknowledgedDate:minimumSupportedAppVersion:", v9, v14, v16, v8, v11, 0, 0);

  -[REMReminderDueDateDeltaAlertContextChangeItem _addOrUpdateDueDateDeltaAlert:](self, "_addOrUpdateDueDateDeltaAlert:", v17);
  return v17;
}

- (id)addDueDateDeltaAlertWithDueDateDelta:(id)a3
{
  return -[REMReminderDueDateDeltaAlertContextChangeItem addDueDateDeltaAlertWithDueDateDelta:identifier:creationDate:](self, "addDueDateDeltaAlertWithDueDateDelta:identifier:creationDate:", a3, 0, 0);
}

- (id)updateDueDateDeltaAlert:(id)a3
{
  id v4;
  REMDueDateDeltaAlertChangeItem *v5;

  v4 = a3;
  v5 = -[REMDueDateDeltaAlertChangeItem initWithReminderDueDateDeltaAlertContextChangeItem:dueDateDeltaAlert:]([REMDueDateDeltaAlertChangeItem alloc], "initWithReminderDueDateDeltaAlertContextChangeItem:dueDateDeltaAlert:", self, v4);

  return v5;
}

- (void)removeDueDateDeltaAlertsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    +[REMLogStore write](REMLogStore, "write");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[REMReminderDueDateDeltaAlertContextChangeItem reminderChangeItem](self, "reminderChangeItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "Removing dueDateDeltaAlerts {reminderChangeItem: %@, identifiers: %@}", (uint8_t *)&v16, 0x16u);

    }
    -[REMReminderDueDateDeltaAlertContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dueDateDeltaAlertIdentifiersToDelete");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "mutableCopy");

    if (!v10)
      v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v4, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v11);

    -[REMReminderDueDateDeltaAlertContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDueDateDeltaAlertIdentifiersToDelete:", v10);

    -[REMReminderDueDateDeltaAlertContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "changedKeysObserver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "keyDidChange:", CFSTR("dueDateDeltaAlertsData"));

  }
}

- (void)_addOrUpdateDueDateDeltaAlert:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[REMReminderDueDateDeltaAlertContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "Adding dueDateDeltaAlert {reminderChangeItem: %@, dueDateDeltaAlert: %@}", (uint8_t *)&v15, 0x16u);

  }
  -[REMReminderDueDateDeltaAlertContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dueDateDeltaAlertsToUpsert");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  if (!v10)
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v10, "addObject:", v4);
  -[REMReminderDueDateDeltaAlertContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDueDateDeltaAlertsToUpsert:", v10);

  -[REMReminderDueDateDeltaAlertContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "changedKeysObserver");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keyDidChange:", CFSTR("dueDateDeltaAlertsData"));

}

- (REMReminderChangeItem)reminderChangeItem
{
  return self->_reminderChangeItem;
}

- (void)setReminderChangeItem:(id)a3
{
  objc_storeStrong((id *)&self->_reminderChangeItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderChangeItem, 0);
}

- (id)addDueDateDeltaAlertWithDueDateDeltaAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  REMDueDateDeltaAlert *v13;
  void *v15;
  REMDueDateDeltaAlert *v16;

  v4 = a3;
  v16 = [REMDueDateDeltaAlert alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderDueDateDeltaAlertContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderDueDateDeltaAlertContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dueDateDelta");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acknowledgedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "minimumSupportedAppVersion");

  v13 = -[REMDueDateDeltaAlert initWithIdentifier:reminderID:accountID:dueDateDelta:creationDate:acknowledgedDate:minimumSupportedAppVersion:](v16, "initWithIdentifier:reminderID:accountID:dueDateDelta:creationDate:acknowledgedDate:minimumSupportedAppVersion:", v15, v6, v8, v9, v10, v11, v12);
  -[REMReminderDueDateDeltaAlertContextChangeItem _addOrUpdateDueDateDeltaAlert:](self, "_addOrUpdateDueDateDeltaAlert:", v13);
  return v13;
}

- (void)removeAllFetchedDueDateDeltaAlerts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[REMReminderDueDateDeltaAlertContextChangeItem reminderChangeItem](self, "reminderChangeItem", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchedDueDateDeltaAlerts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[REMReminderDueDateDeltaAlertContextChangeItem removeDueDateDeltaAlertsWithIdentifiers:](self, "removeDueDateDeltaAlertsWithIdentifiers:", v3);
}

@end
