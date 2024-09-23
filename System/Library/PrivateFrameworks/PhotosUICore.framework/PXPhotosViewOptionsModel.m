@implementation PXPhotosViewOptionsModel

- (PXPhotosViewOptionsModel)initWithPhotoLibrary:(id)a3
{
  id v4;
  PXPhotosViewOptionsModel *v5;
  uint64_t v6;
  PXPhotoLibraryLocalDefaults *localDefaults;
  PXSortOrderState *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PXSortOrderState *sortOrderState;
  _QWORD v15[4];
  PXPhotosViewOptionsModel *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosViewOptionsModel;
  v5 = -[PXPhotosViewOptionsModel init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "px_localDefaults");
    v6 = objc_claimAutoreleasedReturnValue();
    localDefaults = v5->_localDefaults;
    v5->_localDefaults = (PXPhotoLibraryLocalDefaults *)v6;

    v8 = [PXSortOrderState alloc];
    -[PXPhotoLibraryLocalDefaults numberForKey:](v5->_localDefaults, "numberForKey:", CFSTR("PXPhotosViewOptionsSortOrder-v2"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    if ((unint64_t)(v10 - 1) >= 2)
      v11 = 1;
    else
      v11 = v10;

    v12 = -[PXSortOrderState initWithSortOrder:](v8, "initWithSortOrder:", v11);
    sortOrderState = v5->_sortOrderState;
    v5->_sortOrderState = (PXSortOrderState *)v12;

    -[PXSortOrderState registerChangeObserver:context:](v5->_sortOrderState, "registerChangeObserver:context:", v5, PXSortOrderStateObserverContext);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__PXPhotosViewOptionsModel_initWithPhotoLibrary___block_invoke;
    v15[3] = &unk_1E5144498;
    v16 = v5;
    -[PXPhotosViewOptionsModel performChanges:](v16, "performChanges:", v15);

  }
  return v5;
}

- (void)setSortOrderTitle:(id)a3
{
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;

  v8 = (NSString *)a3;
  v5 = self->_sortOrderTitle;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_sortOrderTitle, a3);
      -[PXPhotosViewOptionsModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (NSString)sortOrderTitle
{
  NSString *sortOrderTitle;
  NSString *v4;
  NSString *v5;

  sortOrderTitle = self->_sortOrderTitle;
  if (!sortOrderTitle)
  {
    -[PXPhotosViewOptionsModel _makeSortOrderTitle](self, "_makeSortOrderTitle");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sortOrderTitle;
    self->_sortOrderTitle = v4;

    sortOrderTitle = self->_sortOrderTitle;
  }
  return sortOrderTitle;
}

- (void)setSortOrderMenu:(id)a3
{
  UIMenu *v5;
  UIMenu *v6;

  v5 = (UIMenu *)a3;
  if (self->_sortOrderMenu != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sortOrderMenu, a3);
    -[PXPhotosViewOptionsModel signalChange:](self, "signalChange:", 2);
    v5 = v6;
  }

}

- (void)setHidesSortOrderMenu:(BOOL)a3
{
  if (self->_hidesSortOrderMenu != a3)
  {
    self->_hidesSortOrderMenu = a3;
    -[PXPhotosViewOptionsModel signalChange:](self, "signalChange:", 16);
  }
}

- (UIMenu)sortOrderMenu
{
  UIMenu *v3;
  UIMenu *sortOrderMenu;
  UIMenu *v5;
  UIMenu *v6;

  if (-[PXPhotosViewOptionsModel hidesSortOrderMenu](self, "hidesSortOrderMenu"))
  {
    v3 = 0;
  }
  else
  {
    sortOrderMenu = self->_sortOrderMenu;
    if (!sortOrderMenu)
    {
      -[PXPhotosViewOptionsModel _makeSortOrderMenu](self, "_makeSortOrderMenu");
      v5 = (UIMenu *)objc_claimAutoreleasedReturnValue();
      v6 = self->_sortOrderMenu;
      self->_sortOrderMenu = v5;

      sortOrderMenu = self->_sortOrderMenu;
    }
    v3 = sortOrderMenu;
  }
  return v3;
}

- (id)browserTitleForProposedTitle:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  unint64_t v7;
  id v8;

  v5 = a3;
  -[PXPhotosViewOptionsModel sortOrderState](self, "sortOrderState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sortOrder");
  if (v7 < 2)
  {
    v8 = v5;
LABEL_5:
    v3 = v8;
    goto LABEL_6;
  }
  if (v7 == 2)
  {
    PXLocalizedStringFromTable(CFSTR("PXPhotosGridSortedByDateAddedTitle"), CFSTR("PhotosUICore"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v3;
}

- (id)browserDateIntervalStringForDateIntervalString:(id)a3
{
  id v3;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v5 = a3;
  -[PXPhotosViewOptionsModel sortOrderState](self, "sortOrderState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sortOrder");
  if (v7 >= 2)
  {
    if (v7 == 2)
    {
      if (v5)
      {
        PXLocalizedStringFromTable(CFSTR("PXLibraryAllPhotosAddedRange"), CFSTR("PhotosUICore"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        PXStringWithValidatedFormat();
        v3 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v3 = 0;
      }
    }
  }
  else
  {
    v3 = v5;
  }

  return v3;
}

- (unint64_t)browserDateType
{
  void *v2;
  unint64_t v3;

  -[PXPhotosViewOptionsModel sortOrderState](self, "sortOrderState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sortOrder") == 2;

  return v3;
}

- (void)setAdditionalLensControlItems:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *additionalLensControlItems;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_additionalLensControlItems;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      additionalLensControlItems = self->_additionalLensControlItems;
      self->_additionalLensControlItems = v6;

      -[PXPhotosViewOptionsModel _invalidateLensControlItems](self, "_invalidateLensControlItems");
    }
  }

}

- (void)setSelectedLensControlItem:(id)a3
{
  PXPhotosLensControlItem *v5;
  PXPhotosLensControlItem *v6;
  char v7;
  PXPhotosLensControlItem *v8;

  v8 = (PXPhotosLensControlItem *)a3;
  v5 = self->_selectedLensControlItem;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXPhotosLensControlItem isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectedLensControlItem, a3);
      -[PXPhotosViewOptionsModel signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setLensControlItems:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *lensControlItems;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_lensControlItems;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      lensControlItems = self->_lensControlItems;
      self->_lensControlItems = v6;

      -[PXPhotosViewOptionsModel signalChange:](self, "signalChange:", 8);
    }
  }

}

- (id)_makeSortOrderTitle
{
  void *v2;
  void *v3;

  -[PXPhotosViewOptionsModel sortOrderState](self, "sortOrderState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedTitleForSortOrder(objc_msgSend(v2, "sortOrder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_makeSortOrderMenu
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[PXPhotosViewOptionsModel sortOrderState](self, "sortOrderState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke;
  v6[3] = &unk_1E5144508;
  v7 = v2;
  v3 = v2;
  +[PXMenuBuilder menuWithDeferredConfiguration:](PXMenuBuilder, "menuWithDeferredConfiguration:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateLensControlItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXPhotosViewOptionsModel additionalLensControlItems](self, "additionalLensControlItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v5);

  -[PXPhotosViewOptionsModel _makeStandardLensControlItems](self, "_makeStandardLensControlItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v6);

  -[PXPhotosViewOptionsModel lensControlItems](self, "lensControlItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v9, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosViewOptionsModel setSelectedLensControlItem:](self, "setSelectedLensControlItem:", v8);

  }
  -[PXPhotosViewOptionsModel setLensControlItems:](self, "setLensControlItems:", v9);

}

- (id)_makeStandardLensControlItems
{
  id v2;
  void *v3;
  uint64_t v4;
  PXConcretePhotosLensControlItem *v5;
  void *v6;
  PXConcretePhotosLensControlItem *v7;
  PXConcretePhotosLensControlItem *v8;
  void *v9;
  PXConcretePhotosLensControlItem *v10;
  void *v11;
  PXConcretePhotosLensControlItem *v12;
  void *v13;
  PXConcretePhotosLensControlItem *v14;
  void *v15;
  PXConcretePhotosLensControlItem *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "yearsAndMonthsMode");

  if (!v4)
  {
    v5 = [PXConcretePhotosLensControlItem alloc];
    PXLocalizedStringFromTable(CFSTR("PXPhotosGridLensYears"), CFSTR("LemonadeLocalizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXConcretePhotosLensControlItem initWithIdentifier:title:symbolName:](v5, "initWithIdentifier:title:symbolName:", CFSTR("years"), v6, 0);
    v18[0] = v7;
    v8 = [PXConcretePhotosLensControlItem alloc];
    PXLocalizedStringFromTable(CFSTR("PXPhotosGridLensMonths"), CFSTR("LemonadeLocalizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXConcretePhotosLensControlItem initWithIdentifier:title:symbolName:](v8, "initWithIdentifier:title:symbolName:", CFSTR("months"), v9, 0);
    v18[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v11);

  }
  v12 = [PXConcretePhotosLensControlItem alloc];
  PXLocalizedStringFromTable(CFSTR("PXPhotosGridLensAll"), CFSTR("LemonadeLocalizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXConcretePhotosLensControlItem initWithIdentifier:title:symbolName:](v12, "initWithIdentifier:title:symbolName:", CFSTR("all"), v13, 0);
  v17 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v15);

  return v2;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  PXPhotoLibraryLocalDefaults *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v6 = a4;
  v9 = a3;
  if ((void *)PXSortOrderStateObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewOptionsModel.m"), 266, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    v11 = -[PXSortOrderState sortOrder](self->_sortOrderState, "sortOrder");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = self->_localDefaults;
    objc_msgSend(v12, "numberWithUnsignedInteger:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoLibraryLocalDefaults setNumber:forKey:](v13, "setNumber:forKey:", v14, CFSTR("PXPhotosViewOptionsSortOrder-v2"));

    -[PXPhotosViewOptionsModel _invalidateLensControlItems](self, "_invalidateLensControlItems");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__PXPhotosViewOptionsModel_observable_didChange_context___block_invoke;
    v16[3] = &unk_1E51479C8;
    v16[4] = self;
    -[PXPhotosViewOptionsModel performChanges:](self, "performChanges:", v16);
  }

}

- (NSArray)additionalLensControlItems
{
  return self->_additionalLensControlItems;
}

- (PXSortOrderState)sortOrderState
{
  return self->_sortOrderState;
}

- (BOOL)hidesSortOrderMenu
{
  return self->_hidesSortOrderMenu;
}

- (PXPhotosLensControlItem)selectedLensControlItem
{
  return self->_selectedLensControlItem;
}

- (NSArray)lensControlItems
{
  return self->_lensControlItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortOrderState, 0);
  objc_storeStrong((id *)&self->_additionalLensControlItems, 0);
  objc_storeStrong((id *)&self->_sortOrderMenu, 0);
  objc_storeStrong((id *)&self->_sortOrderTitle, 0);
  objc_storeStrong((id *)&self->_selectedLensControlItem, 0);
  objc_storeStrong((id *)&self->_lensControlItems, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
}

void __57__PXPhotosViewOptionsModel_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 4);
  objc_msgSend(*(id *)(a1 + 32), "_makeSortOrderTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSortOrderTitle:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_makeSortOrderMenu");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSortOrderMenu:", v3);

}

void __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke_2;
  v6[3] = &unk_1E51444E0;
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_msgSend(v8, "enumeratePossibleSortOrdersUsingBlock:", v6);

}

void __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  PXLocalizedTitleForSortOrder(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke_3;
  v8[3] = &unk_1E5144FE8;
  v9 = *(id *)(a1 + 40);
  v10 = a2;
  objc_msgSend(v6, "addItemWithTitle:systemImageName:state:options:handler:", v7, 0, v5, 0, v8);

}

uint64_t __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke_4;
  v3[3] = &__block_descriptor_40_e35_v16__0___PXMutableSortOrderState__8l;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSortOrder:", *(_QWORD *)(a1 + 32));
}

uint64_t __49__PXPhotosViewOptionsModel_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLensControlItems");
}

@end
