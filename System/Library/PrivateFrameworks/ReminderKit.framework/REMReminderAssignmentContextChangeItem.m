@implementation REMReminderAssignmentContextChangeItem

- (REMReminderAssignmentContextChangeItem)initWithReminderChangeItem:(id)a3
{
  id v5;
  REMReminderAssignmentContextChangeItem *v6;
  REMReminderAssignmentContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderAssignmentContextChangeItem;
  v6 = -[REMReminderAssignmentContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reminderChangeItem, a3);

  return v7;
}

- (REMAssignment)currentAssignment
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assignments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__REMReminderAssignmentContextChangeItem_currentAssignment__block_invoke;
  v6[3] = &unk_1E67F8408;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (REMAssignment *)v4;
}

void __59__REMReminderAssignmentContextChangeItem_currentAssignment__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v12 = v4;
  if (!v8)
    goto LABEL_4;
  objc_msgSend(v7, "orderValue");
  v10 = v9;
  objc_msgSend(v12, "orderValue");
  if (v10 <= v11)
  {
    v6 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
LABEL_4:
    objc_storeStrong(v6, a2);
  }

}

- (NSSet)assignments
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assignments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSSet *)v6;
}

- (void)addAssignment:(id)a3
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
    -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "Adding assignment {reminderChangeItem: %@, assignment: %@}", (uint8_t *)&v11, 0x16u);

  }
  -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assignments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v9, "addObject:", v4);
  -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAssignments:", v9);

}

- (id)addAssignmentWithAssignee:(id)a3 originator:(id)a4 status:(int64_t)a5
{
  id v7;
  id v8;
  id v9;
  REMAssignment *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  REMAssignment *v17;

  v7 = a4;
  v8 = a3;
  v9 = +[REMAssignment newObjectID](REMAssignment, "newObjectID");
  v10 = [REMAssignment alloc];
  -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[REMAssignment initWithObjectID:accountID:reminderID:assigneeID:originatorID:status:](v10, "initWithObjectID:accountID:reminderID:assigneeID:originatorID:status:", v9, v12, v14, v15, v16, a5);
  -[REMReminderAssignmentContextChangeItem addAssignment:](self, "addAssignment:", v17);

  return v17;
}

- (id)addAssignmentWithAssigneeID:(id)a3 originatorID:(id)a4 status:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  REMAssignment *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  REMAssignment *v16;

  v8 = a4;
  v9 = a3;
  v10 = +[REMAssignment newObjectID](REMAssignment, "newObjectID");
  v11 = [REMAssignment alloc];
  -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[REMAssignment initWithObjectID:accountID:reminderID:assigneeID:originatorID:status:](v11, "initWithObjectID:accountID:reminderID:assigneeID:originatorID:status:", v10, v13, v15, v9, v8, a5);

  -[REMReminderAssignmentContextChangeItem addAssignment:](self, "addAssignment:", v16);
  return v16;
}

- (void)removeAssignment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
    -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "Removing assignment {reminderChangeItem: %@, assignment: %@}", (uint8_t *)&v11, 0x16u);

  }
  -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assignments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeObject:", v4);
  -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAssignments:", v9);

}

- (void)removeAllAssignments
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assignments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    +[REMLogStore write](REMLogStore, "write");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1B4A39000, v6, OS_LOG_TYPE_INFO, "Removing all assignment {reminderChangeItem: %@}", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderAssignmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAssignments:", v8);

  }
}

- (REMReminderChangeItem)reminderChangeItem
{
  return self->_reminderChangeItem;
}

- (void)setReminderChangeItem:(id)a3
{
  objc_storeStrong((id *)&self->_reminderChangeItem, a3);
}

- (NSMutableSet)mutableAssignments
{
  return self->_mutableAssignments;
}

- (void)setMutableAssignments:(id)a3
{
  objc_storeStrong((id *)&self->_mutableAssignments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAssignments, 0);
  objc_storeStrong((id *)&self->_reminderChangeItem, 0);
}

@end
