@implementation REMReminderSubtaskContextChangeItem

- (REMReminderSubtaskContextChangeItem)initWithReminderChangeItem:(id)a3
{
  id v5;
  REMReminderSubtaskContextChangeItem *v6;
  REMReminderSubtaskContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderSubtaskContextChangeItem;
  v6 = -[REMReminderSubtaskContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reminderChangeItem, a3);

  return v7;
}

- (void)addReminderChangeItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMReminderSubtaskContextChangeItem _listChangeItem](self, "_listChangeItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[REMReminderSubtaskContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:", v4, 0, 0, v5);

}

- (void)insertReminderChangeItem:(id)a3 beforeReminderChangeItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[REMReminderSubtaskContextChangeItem _listChangeItem](self, "_listChangeItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[REMReminderSubtaskContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:", v7, v6, 0, v8);

}

- (void)insertReminderChangeItem:(id)a3 afterReminderChangeItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[REMReminderSubtaskContextChangeItem _listChangeItem](self, "_listChangeItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[REMReminderSubtaskContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:", v7, v6, 1, v8);

}

- (void)undeleteSubtaskWithID:(id)a3 usingUndo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[REMReminderSubtaskContextChangeItem _listChangeItem](self, "_listChangeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "undeleteReminderWithID:usingUndo:", v7, v6);

  -[REMReminderSubtaskContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subtaskIDsToUndelete");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setByAddingObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMReminderSubtaskContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSubtaskIDsToUndelete:", v10);

}

- (id)_listChangeItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[REMReminderSubtaskContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderSubtaskContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateListWithReminderChangeItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

@end
