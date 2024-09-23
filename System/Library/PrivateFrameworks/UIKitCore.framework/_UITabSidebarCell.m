@implementation _UITabSidebarCell

- (void)pushCurrentStateIntoSidebarItem
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    v2 = (void *)a1[110];
    if (v2)
    {
      v3 = v2;
      objc_msgSend(a1, "configurationState");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setConfigurationState:", v4);

      objc_msgSend(a1, "contentConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setContentConfiguration:", v5);

      objc_msgSend(a1, "backgroundConfiguration");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setBackgroundConfiguration:", v6);

    }
  }
}

- (void)setSidebarItem:(uint64_t)a1
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 876) & 1) != 0)
    {
      v3 = *(void **)(a1 + 880);
      v4 = v13;
      v5 = v3;
      if (v5 == v4)
      {

        goto LABEL_13;
      }
      v6 = v5;
      if (v4 && v5)
      {
        v7 = objc_msgSend(v4, "isEqual:", v5);

        if ((v7 & 1) != 0)
          goto LABEL_13;
      }
      else
      {

      }
    }
    v8 = objc_msgSend(v13, "copy");
    v9 = *(void **)(a1 + 880);
    *(_QWORD *)(a1 + 880) = v8;

    if (v13)
      *(_BYTE *)(a1 + 876) |= 1u;
    objc_msgSend(v13, "contentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "setContentConfiguration:", v10);

    objc_msgSend(v13, "backgroundConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "setBackgroundConfiguration:", v11);

    objc_msgSend(v13, "_resolvedAccessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "setAccessories:", v12);

    -[_UITabSidebarCell _updateDisabledStateIfNeeded](a1);
  }
LABEL_13:

}

- (void)_updateDisabledStateIfNeeded
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  if (a1)
  {
    v5 = *(id *)(a1 + 880);
    if (v5 && (*(_BYTE *)(a1 + 876) & 1) != 0 && objc_msgSend((id)a1, "isEditing"))
    {
      objc_msgSend(v5, "action");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        v3 = 1;
      }
      else
      {
        objc_msgSend(v5, "tab");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v4, "_isAction");

      }
    }
    else
    {
      v3 = 0;
    }
    objc_msgSend((id)a1, "setUserInteractionEnabled:", v3 ^ 1u);

  }
}

- (void)setEditing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITabSidebarCell;
  -[UICollectionViewListCell setEditing:](&v4, sel_setEditing_, a3);
  -[_UITabSidebarCell _updateDisabledStateIfNeeded]((uint64_t)self);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITabSidebarCell;
  -[UICollectionViewListCell prepareForReuse](&v3, sel_prepareForReuse);
  if (self)
    *((_BYTE *)&self->_sidebarCellFlags + 4) &= ~1u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarItem, 0);
}

@end
