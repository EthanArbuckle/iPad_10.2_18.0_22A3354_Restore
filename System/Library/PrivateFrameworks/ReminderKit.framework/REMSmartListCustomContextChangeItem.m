@implementation REMSmartListCustomContextChangeItem

- (REMSmartListCustomContextChangeItem)initWithSmartListChangeItem:(id)a3
{
  id v5;
  REMSmartListCustomContextChangeItem *v6;
  REMSmartListCustomContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "smartListChangeItem");
  v9.receiver = self;
  v9.super_class = (Class)REMSmartListCustomContextChangeItem;
  v6 = -[REMSmartListCustomContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_smartListChangeItem, a3);

  return v7;
}

- (void)setName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMSmartListCustomContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v4);

}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[REMSmartListCustomContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[REMSmartListCustomContextChangeItem smartListChangeItem](self, "smartListChangeItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E67FB1F0;
  }

  return (NSString *)v6;
}

- (void)setColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMSmartListCustomContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v4);

}

- (REMColor)color
{
  void *v2;
  void *v3;

  -[REMSmartListCustomContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMColor *)v3;
}

- (void)setBadge:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "rawValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[REMSmartListCustomContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBadgeEmblem:", v5);

}

- (REMListBadge)badge
{
  void *v2;
  void *v3;
  REMListBadge *v4;

  -[REMSmartListCustomContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "badgeEmblem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[REMListBadge initWithRawValue:]([REMListBadge alloc], "initWithRawValue:", v3);
  else
    v4 = 0;

  return v4;
}

- (REMSmartListChangeItem)smartListChangeItem
{
  return self->_smartListChangeItem;
}

- (void)setSmartListChangeItem:(id)a3
{
  objc_storeStrong((id *)&self->_smartListChangeItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartListChangeItem, 0);
}

@end
