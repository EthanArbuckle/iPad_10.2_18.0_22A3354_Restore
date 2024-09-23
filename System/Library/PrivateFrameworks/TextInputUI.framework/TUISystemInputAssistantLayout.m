@implementation TUISystemInputAssistantLayout

- (id)_buttonBarGroupSetForApplicationAssistantItem:(id)a3 withSystemInputAssistantItem:(id)a4 forAssistantView:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  TUIButtonBarGroupSet *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "leadingBarButtonGroups");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v11 = (void *)v8;
  else
    v11 = (void *)MEMORY[0x1E0C9AA60];
  v12 = v11;

  objc_msgSend(v7, "trailingBarButtonGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = v13;
  else
    v14 = v10;
  v15 = v14;

  objc_msgSend(v6, "leadingBarButtonGroups");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v10;
  v19 = v18;

  objc_msgSend(v6, "trailingBarButtonGroups");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v21 = v20;
  else
    v21 = v10;
  v22 = v21;

  v23 = objc_alloc_init(TUIButtonBarGroupSet);
  objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIButtonBarGroupSet setLeadingButtonGroups:](v23, "setLeadingButtonGroups:", v24);

  objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIButtonBarGroupSet setTrailingButtonGroups:](v23, "setTrailingButtonGroups:", v25);
  -[TUIButtonBarGroupSet leadingButtonGroups](v23, "leadingButtonGroups");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIButtonBarGroupSet trailingButtonGroups](v23, "trailingButtonGroups");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "arrayByAddingObjectsFromArray:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIButtonBarGroupSet setUnifiedButtonGroups:](v23, "setUnifiedButtonGroups:", v28);

  return v23;
}

- (BOOL)usesUnifiedButtonBar
{
  return self->_usesUnifiedButtonBar;
}

- (void)setUsesUnifiedButtonBar:(BOOL)a3
{
  self->_usesUnifiedButtonBar = a3;
}

@end
