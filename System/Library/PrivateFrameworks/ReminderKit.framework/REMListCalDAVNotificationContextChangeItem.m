@implementation REMListCalDAVNotificationContextChangeItem

- (REMListCalDAVNotificationContextChangeItem)initWithListChangeItem:(id)a3
{
  id v5;
  REMListCalDAVNotificationContextChangeItem *v6;
  REMListCalDAVNotificationContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListCalDAVNotificationContextChangeItem;
  v6 = -[REMListCalDAVNotificationContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_listChangeItem, a3);

  return v7;
}

- (NSArray)calDAVNotifications
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[REMListCalDAVNotificationContextChangeItem listChangeItem](self, "listChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calDAVNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (id)addCalDAVNotificationWithUUIDString:(id)a3 hostURL:(id)a4 externalIdentifier:(id)a5 externalModificationTag:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  REMCalDAVNotification *v15;
  REMListCalDAVNotificationContextChangeItem *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  REMListCalDAVNotificationContextChangeItem *v23;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = +[REMCalDAVNotification newObjectID](REMCalDAVNotification, "newObjectID");
  v15 = [REMCalDAVNotification alloc];
  v16 = self;
  v23 = self;
  -[REMListCalDAVNotificationContextChangeItem listChangeItem](self, "listChangeItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accountID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListCalDAVNotificationContextChangeItem listChangeItem](v16, "listChangeItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[REMCalDAVNotification initCalDAVNotificationWithObjectID:accountID:listID:uuidString:hostURL:externalIdentifier:externalModificationTag:](v15, "initCalDAVNotificationWithObjectID:accountID:listID:uuidString:hostURL:externalIdentifier:externalModificationTag:", v14, v18, v20, v13, v12, v11, v10);

  -[REMListCalDAVNotificationContextChangeItem _addCalDAVNotification:](v23, "_addCalDAVNotification:", v21);
  return v21;
}

- (void)_addCalDAVNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[REMListCalDAVNotificationContextChangeItem listChangeItem](self, "listChangeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "Adding calDAVNotification {listChangeItem: %@, calDAVNotification: %@}", (uint8_t *)&v11, 0x16u);

  }
  -[REMListCalDAVNotificationContextChangeItem listChangeItem](self, "listChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calDAVNotifications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v9, "addObject:", v4);
  -[REMListCalDAVNotificationContextChangeItem listChangeItem](self, "listChangeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCalDAVNotifications:", v9);

}

- (void)removeCalDAVNotication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[REMListCalDAVNotificationContextChangeItem listChangeItem](self, "listChangeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calDAVNotifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  LODWORD(v6) = objc_msgSend(v7, "containsObject:", v4);
  +[REMLogStore write](REMLogStore, "write");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((_DWORD)v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[REMListCalDAVNotificationContextChangeItem listChangeItem](self, "listChangeItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1B4A39000, v9, OS_LOG_TYPE_INFO, "Removing calDAVNotification {listChangeItem: %@, calDAVNotification: %@}", (uint8_t *)&v11, 0x16u);

    }
    objc_msgSend(v7, "removeObject:", v4);
    -[REMListCalDAVNotificationContextChangeItem listChangeItem](self, "listChangeItem");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject setCalDAVNotifications:](v9, "setCalDAVNotifications:", v7);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[REMListCalDAVNotificationContextChangeItem removeCalDAVNotication:].cold.1();
  }

}

- (void)clearCalDAVNotifications
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[REMLogStore write](REMLogStore, "write");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[REMListCalDAVNotificationContextChangeItem listChangeItem](self, "listChangeItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B4A39000, v3, OS_LOG_TYPE_INFO, "Removing all calDAVNotifications {listChangeItem: %@}", (uint8_t *)&v6, 0xCu);

  }
  -[REMListCalDAVNotificationContextChangeItem listChangeItem](self, "listChangeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCalDAVNotifications:", MEMORY[0x1E0C9AA60]);

}

- (void)updateCalDAVNotification:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(id, NSObject *);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, NSObject *))a4;
  -[REMListCalDAVNotificationContextChangeItem listChangeItem](self, "listChangeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calDAVNotifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "indexOfObject:", v6);
  if (!v9 || (v11 = v10, v10 == 0x7FFFFFFFFFFFFFFFLL))
  {
    +[REMLogStore write](REMLogStore, "write", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[REMListCalDAVNotificationContextChangeItem updateCalDAVNotification:withBlock:].cold.1();
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    +[REMLogStore write](REMLogStore, "write");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[REMListCalDAVNotificationContextChangeItem listChangeItem](self, "listChangeItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1B4A39000, v13, OS_LOG_TYPE_INFO, "Updating calDAVNotification {listChangeItem: %@, calDAVNotification: %@}", (uint8_t *)&v17, 0x16u);

    }
    v7[2](v7, v12);
    -[REMListCalDAVNotificationContextChangeItem listChangeItem](self, "listChangeItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "changedKeysObserver");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "keyDidChange:", CFSTR("calDAVNotifications"));

  }
}

- (REMListChangeItem)listChangeItem
{
  return self->_listChangeItem;
}

- (void)setListChangeItem:(id)a3
{
  objc_storeStrong((id *)&self->_listChangeItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listChangeItem, 0);
}

- (void)removeCalDAVNotication:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12();
  objc_msgSend(v0, "listChangeItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v2, v3, "Attempted to remove a calDAVNotification object that does not belong to this list {listChangeItem: %@, calDAVNotification: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)updateCalDAVNotification:withBlock:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12();
  objc_msgSend(v0, "listChangeItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v2, v3, "Attempted to update a calDAVNotification object that does not belong to this list {listChangeItem: %@, calDAVNotification: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
