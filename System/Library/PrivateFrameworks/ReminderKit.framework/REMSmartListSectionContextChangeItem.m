@implementation REMSmartListSectionContextChangeItem

- (REMSmartListSectionContextChangeItem)initWithSmartListChangeItem:(id)a3
{
  id v5;
  REMSmartListSectionContextChangeItem *v6;
  REMSmartListSectionContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "smartListChangeItem");
  v9.receiver = self;
  v9.super_class = (Class)REMSmartListSectionContextChangeItem;
  v6 = -[REMSmartListSectionContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_smartListChangeItem, a3);

  return v7;
}

- (BOOL)shouldUpdateSectionsOrdering
{
  void *v2;
  char v3;

  -[REMSmartListSectionContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUpdateSectionsOrdering");

  return v3;
}

- (void)setShouldUpdateSectionsOrdering:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMSmartListSectionContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldUpdateSectionsOrdering:", v3);

}

- (NSArray)unsavedSectionIDsOrdering
{
  void *v2;
  void *v3;

  -[REMSmartListSectionContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsavedSectionIDsOrdering");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setUnsavedSectionIDsOrdering:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMSmartListSectionContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUnsavedSectionIDsOrdering:", v4);

}

- (REMMemberships)unsavedMembershipsOfRemindersInSections
{
  void *v2;
  void *v3;

  -[REMSmartListSectionContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsavedMembershipsOfRemindersInSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMMemberships *)v3;
}

- (void)setUnsavedMembershipsOfRemindersInSections:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMSmartListSectionContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUnsavedMembershipsOfRemindersInSections:", v4);

}

- (void)undeleteSectionWithID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "sectionID");
  -[REMSmartListSectionContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIDsToUndelete");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObject:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListSectionContextChangeItem smartListChangeItem](self, "smartListChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSectionIDsToUndelete:", v6);

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
