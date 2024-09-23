@implementation REMReminderFlaggedContextChangeItem

- (REMReminderFlaggedContextChangeItem)initWithReminderChangeItem:(id)a3
{
  id v5;
  REMReminderFlaggedContextChangeItem *v6;
  REMReminderFlaggedContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderFlaggedContextChangeItem;
  v6 = -[REMReminderFlaggedContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reminderChangeItem, a3);

  return v7;
}

- (int64_t)flagged
{
  void *v2;
  int64_t v3;

  -[REMReminderFlaggedContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "flagged");

  return v3;
}

- (void)setFlagged:(int64_t)a3
{
  id v4;

  -[REMReminderFlaggedContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlagged:", a3);

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
