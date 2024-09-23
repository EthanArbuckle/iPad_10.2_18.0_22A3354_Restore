@implementation STUIStatusBarCellularExpandedItem

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[8];

  v20[7] = *MEMORY[0x1E0C80C00];
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS___STUIStatusBarCellularExpandedItem;
  objc_msgSendSuper2(&v19, sel_groupWithHighPriority_lowPriority_typeClass_allowDualNetwork_, a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "badgeDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v9, a3 + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBadgePlacement:", v10);
  objc_msgSend(v8, "signalStrengthPlacement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  objc_msgSend(v8, "warningPlacement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  objc_msgSend(v8, "rawPlacement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v13;
  v20[3] = v10;
  objc_msgSend(v8, "namePlacement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v14;
  objc_msgSend(v8, "typePlacement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v15;
  objc_msgSend(v8, "callForwardingPlacement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlacements:", v17);

  return v8;
}

+ (STUIStatusBarIdentifier)badgeDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("badgeDisplayIdentifier"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)STUIStatusBarCellularExpandedItem;
  -[STUIStatusBarCellularItem applyUpdate:toDisplayItem:](&v16, sel_applyUpdate_toDisplayItem_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarCellularItem entryForDisplayItemWithIdentifier:](self, "entryForDisplayItemWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "badgeDisplayIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v11)
  {
    objc_msgSend(v9, "badgeString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEnabled"))
      v13 = objc_msgSend(v12, "length") != 0;
    else
      v13 = 0;
    objc_msgSend(v6, "setEnabled:", v13);
    if (objc_msgSend(v6, "isEnabled"))
    {
      -[STUIStatusBarCellularExpandedItem badgeView](self, "badgeView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v12);

    }
  }

  return v7;
}

- (STUIStatusBarBadgeView)badgeView
{
  STUIStatusBarBadgeView *badgeView;

  badgeView = self->_badgeView;
  if (!badgeView)
  {
    -[STUIStatusBarCellularExpandedItem _create_badgeView](self, "_create_badgeView");
    badgeView = self->_badgeView;
  }
  return badgeView;
}

- (void)_create_badgeView
{
  STUIStatusBarBadgeView *v3;
  STUIStatusBarBadgeView *v4;
  STUIStatusBarBadgeView *badgeView;

  v3 = [STUIStatusBarBadgeView alloc];
  v4 = -[STUIStatusBarBadgeView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  badgeView = self->_badgeView;
  self->_badgeView = v4;

}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "badgeDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[STUIStatusBarCellularExpandedItem badgeView](self, "badgeView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarCellularExpandedItem;
    -[STUIStatusBarCellularItem viewForIdentifier:](&v9, sel_viewForIdentifier_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

@end
