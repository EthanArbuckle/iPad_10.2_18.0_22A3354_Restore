@implementation REMListAppearanceContextChangeItem

- (REMListAppearanceContextChangeItem)initWithListChangeItem:(id)a3
{
  id v5;
  REMListAppearanceContextChangeItem *v6;
  REMListAppearanceContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListAppearanceContextChangeItem;
  v6 = -[REMListAppearanceContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_listChangeItem, a3);

  return v7;
}

- (void)setBadge:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "rawValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[REMListAppearanceContextChangeItem listChangeItem](self, "listChangeItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBadgeEmblem:", v5);

}

- (REMListBadge)badge
{
  void *v2;
  void *v3;
  REMListBadge *v4;

  -[REMListAppearanceContextChangeItem listChangeItem](self, "listChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "badgeEmblem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[REMListBadge initWithRawValue:]([REMListBadge alloc], "initWithRawValue:", v3);
  else
    v4 = 0;

  return v4;
}

- (void)setBadgeEmblem:(id)a3
{
  id v4;
  REMListBadge *v5;

  v4 = a3;
  v5 = -[REMListBadge initWithEmblem:]([REMListBadge alloc], "initWithEmblem:", v4);

  -[REMListAppearanceContextChangeItem setBadge:](self, "setBadge:", v5);
}

- (NSString)badgeEmblem
{
  void *v2;
  void *v3;

  -[REMListAppearanceContextChangeItem badge](self, "badge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emblem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setShowingLargeAttachments:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMListAppearanceContextChangeItem listChangeItem](self, "listChangeItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowingLargeAttachments:", v3);

}

- (BOOL)showingLargeAttachments
{
  void *v2;
  char v3;

  -[REMListAppearanceContextChangeItem listChangeItem](self, "listChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showingLargeAttachments");

  return v3;
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

@end
