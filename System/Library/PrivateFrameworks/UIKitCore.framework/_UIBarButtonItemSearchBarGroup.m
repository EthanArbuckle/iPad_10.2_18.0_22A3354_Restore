@implementation _UIBarButtonItemSearchBarGroup

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIBarButtonItemSearchBarGroup;
  -[UIBarButtonItemGroup setHidden:](&v5, sel_setHidden_);
  if (v3)
    self->_disabledExpansion = 0;
}

- (_UIBarButtonItemSearchBarGroup)initWithBarButtonItems:(id)a3 representativeItem:(id)a4
{
  _UIBarButtonItemSearchBarGroup *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBarButtonItemSearchBarGroup;
  v4 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](&v6, sel_initWithBarButtonItems_representativeItem_, a3, a4);
  -[_UIBarButtonItemSearchBarGroup _checkInstanceVariables]((uint64_t)v4);
  return v4;
}

- (void)_checkInstanceVariables
{
  id WeakRetained;
  void *v3;
  id v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;

  if (a1)
  {
    v8 = *(id *)(a1 + 8);
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__checkInstanceVariables, a1, CFSTR("_UIBarButtonItemSearchBarGroup.m"), 29, CFSTR("Too many items assigned to a _UIBarButtonItemSearchBarGroup. Fix this. self = %@"), a1);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    if (WeakRetained)
    {
      v3 = WeakRetained;
      v4 = objc_loadWeakRetained((id *)(a1 + 120));
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__checkInstanceVariables, a1, CFSTR("_UIBarButtonItemSearchBarGroup.m"), 30, CFSTR("_UIBarButtonItemSearchBarGroup's item's view must be a UISearchBar. Fix this. self = %@"), a1);

      }
    }

  }
}

- (BOOL)_isCritical
{
  return 1;
}

- (id)searchBar
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 15);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchIconItem);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_destroyWeak((id *)&self->_searchItem);
}

- (void)setBarButtonItems:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIBarButtonItemSearchBarGroup;
  v4 = a3;
  -[UIBarButtonItemGroup setBarButtonItems:](&v8, sel_setBarButtonItems_, v4);
  objc_msgSend(v4, "firstObject", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeWeak((id *)&self->_searchItem, v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchItem);
  objc_msgSend(WeakRetained, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_searchBar, v7);

  -[_UIBarButtonItemSearchBarGroup _checkInstanceVariables]((uint64_t)self);
}

- (void)setRepresentativeItem:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIBarButtonItemSearchBarGroup;
    -[UIBarButtonItemGroup setRepresentativeItem:](&v5, sel_setRepresentativeItem_, v4);
    objc_storeWeak((id *)&self->_searchIconItem, v4);
  }
  else if (self->_providesRestingMeasurementValues)
  {
    self->_hadRepresentativeItemBeforeMovingToProvisionalState = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIBarButtonItemSearchBarGroup;
    -[UIBarButtonItemGroup setRepresentativeItem:](&v5, sel_setRepresentativeItem_, 0);
  }

}

- (void)setProvidesRestingMeasurementValues:(uint64_t)a1
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  id v11;
  id v12;
  double v13;
  double v14;
  id v15;
  objc_super v16;
  objc_super v17;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    objc_msgSend(WeakRetained, "_setProvidesRestingMeasurementValues:", a2);

    if ((_DWORD)a2)
    {
      objc_msgSend((id)a1, "representativeItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(a1 + 88) = v5 != 0;

      if (!*(_BYTE *)(a1 + 88))
      {
        v6 = objc_loadWeakRetained((id *)(a1 + 128));
        v7 = v6;
        if (v6)
        {
          v8 = v6;
        }
        else
        {
          v12 = objc_loadWeakRetained((id *)(a1 + 120));
          objc_msgSend(v12, "_searchIconBarButtonItem");
          v8 = (id)objc_claimAutoreleasedReturnValue();

        }
        v17.receiver = (id)a1;
        v17.super_class = (Class)_UIBarButtonItemSearchBarGroup;
        objc_msgSendSuper2(&v17, sel_setRepresentativeItem_, v8);
        v11 = objc_loadWeakRetained((id *)(a1 + 120));
        objc_msgSend(v11, "_idealInlineWidthForLayoutState:", 2);
        v14 = v13;
        v15 = objc_loadWeakRetained((id *)(a1 + 112));
        objc_msgSend(v15, "_setWidth:", v14);

        goto LABEL_10;
      }
    }
    else if (!*(_BYTE *)(a1 + 88))
    {
      v16.receiver = (id)a1;
      v16.super_class = (Class)_UIBarButtonItemSearchBarGroup;
      objc_msgSendSuper2(&v16, sel_setRepresentativeItem_, 0);
      v8 = objc_loadWeakRetained((id *)(a1 + 120));
      objc_msgSend(v8, "_idealInlineWidthForLayoutState:", 3);
      v10 = v9;
      v11 = objc_loadWeakRetained((id *)(a1 + 112));
      objc_msgSend(v11, "_setWidth:", v10);
LABEL_10:

    }
    *(_BYTE *)(a1 + 104) = a2;
  }
}

- (BOOL)_disabledExpansion
{
  return self->_disabledExpansion;
}

- (double)_contextualExpandedPadding
{
  return self->_contextualExpandedPadding;
}

- (id)searchItem
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 14);
  return WeakRetained;
}

@end
