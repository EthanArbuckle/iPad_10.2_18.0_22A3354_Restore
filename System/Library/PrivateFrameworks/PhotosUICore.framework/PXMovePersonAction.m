@implementation PXMovePersonAction

- (PXMovePersonAction)initWithSourcePeople:(id)a3 destinationPeople:(id)a4 destinationManualOrder:(int64_t)a5 destinationType:(int64_t)a6 otherPeople:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  PXMovePersonAction *v18;
  uint64_t v19;
  PXFastEnumeration *destinationPeople;
  uint64_t v21;
  PXFastEnumeration *otherPeople;
  void *v23;
  uint64_t v24;
  PXPhotoLibraryLocalDefaults *localDefaults;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  objc_msgSend(v13, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)PXMovePersonAction;
  v18 = -[PXPhotosAction initWithPhotoLibrary:](&v27, sel_initWithPhotoLibrary_, v17);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_sourcePeople, a3);
    v19 = objc_msgSend(v14, "copy");
    destinationPeople = v18->_destinationPeople;
    v18->_destinationPeople = (PXFastEnumeration *)v19;

    v18->_destinationManualOrder = a5;
    v18->_destinationType = a6;
    v21 = objc_msgSend(v15, "copy");
    otherPeople = v18->_otherPeople;
    v18->_otherPeople = (PXFastEnumeration *)v21;

    -[PXPhotosAction photoLibrary](v18, "photoLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "px_localDefaults");
    v24 = objc_claimAutoreleasedReturnValue();
    localDefaults = v18->_localDefaults;
    v18->_localDefaults = (PXPhotoLibraryLocalDefaults *)v24;

  }
  return v18;
}

- (id)actionIdentifier
{
  return CFSTR("ChangePeopleType");
}

- (id)localizedActionName
{
  void *v2;
  int64_t v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v2 = self;
  v3 = -[PXMovePersonAction destinationType](self, "destinationType");
  switch(v3)
  {
    case -1:
      objc_msgSend(v2, "photoLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "px_peoplePetsHomeVisibility");

      objc_msgSend(v2, "sourcePeople");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, CFSTR("PXPeopleHomeRemovePersonButton"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringForPeoplePetsHomeTitle(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PXStringWithValidatedFormat();
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 0:
      v4 = CFSTR("PXRemoveFromFavoritesActionName");
      goto LABEL_7;
    case 1:
      v4 = CFSTR("PXAddToFavoritesActionName");
LABEL_7:
      PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v2;
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  int64_t v13;

  v4 = a3;
  -[PXMovePersonAction sourcePeople](self, "sourcePeople");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXMovePersonAction destinationType](self, "destinationType");
  v7 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__PXMovePersonAction_performAction___block_invoke;
  v10[3] = &unk_1E5146098;
  v10[4] = self;
  v11 = v5;
  v12 = v7;
  v13 = v6;
  v8 = v7;
  v9 = v5;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v10, v4);

}

- (void)performUndo:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__PXMovePersonAction_performUndo___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (void)changeRequestForUndo:(id)a3 updateType:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setManualOrder:", objc_msgSend(v10, "manualOrder"));
        if (v4)
          objc_msgSend(v11, "setType:", objc_msgSend(v10, "type"));

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (NSArray)sourcePeople
{
  return self->_sourcePeople;
}

- (PXFastEnumeration)destinationPeople
{
  return self->_destinationPeople;
}

- (int64_t)destinationManualOrder
{
  return self->_destinationManualOrder;
}

- (int64_t)destinationType
{
  return self->_destinationType;
}

- (NSArray)modifiedDestinationPeople
{
  return self->_modifiedDestinationPeople;
}

- (void)setModifiedDestinationPeople:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (PXFastEnumeration)otherPeople
{
  return self->_otherPeople;
}

- (NSArray)modifiedOtherPeople
{
  return self->_modifiedOtherPeople;
}

- (void)setModifiedOtherPeople:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (PXPhotoLibraryLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (NSNumber)sourceSortingType
{
  return self->_sourceSortingType;
}

- (void)setSourceSortingType:(id)a3
{
  objc_storeStrong((id *)&self->_sourceSortingType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceSortingType, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_modifiedOtherPeople, 0);
  objc_storeStrong((id *)&self->_otherPeople, 0);
  objc_storeStrong((id *)&self->_modifiedDestinationPeople, 0);
  objc_storeStrong((id *)&self->_destinationPeople, 0);
  objc_storeStrong((id *)&self->_sourcePeople, 0);
}

void __34__PXMovePersonAction_performUndo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "modifiedDestinationPeople");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeRequestForUndo:updateType:", v3, 0);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "modifiedOtherPeople");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeRequestForUndo:updateType:", v5, 0);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "sourcePeople");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeRequestForUndo:updateType:", v7, 1);

  v8 = *(_QWORD **)(a1 + 32);
  v9 = (void *)v8[17];
  objc_msgSend(v8, "sourceSortingType");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumber:forKey:", v10, CFSTR("PXPeopleHomeSortingType"));

}

void __36__PXMovePersonAction_performAction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "destinationManualOrder");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "destinationPeople");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v37;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v9) & 1) == 0)
        {
          if (v7 == v2)
            v7 = objc_msgSend(*(id *)(a1 + 40), "count") + v2;
          if (objc_msgSend(v9, "manualOrder") != v7)
          {
            objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setManualOrder:verified:", v7, 0);
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);

          }
          ++v7;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "setModifiedDestinationPeople:", *(_QWORD *)(a1 + 48));
  v27 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "otherPeople");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    v15 = 1;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v17) & 1) == 0)
        {
          if (objc_msgSend(v17, "manualOrder") != v15)
          {
            objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setManualOrder:verified:", v15, 0);
            objc_msgSend(v27, "addObject:", v17);

          }
          ++v15;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v13);
  }

  objc_msgSend(*(id *)(a1 + 32), "setModifiedOtherPeople:", v27);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "numberForKey:", CFSTR("PXPeopleHomeSortingType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSourceSortingType:", v19);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setNumber:forKey:", &unk_1E53EF180, CFSTR("PXPeopleHomeSortingType"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sourcePeople");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setManualOrder:verified:", v2 + k, 1);
        if (objc_msgSend(v25, "type") != *(_QWORD *)(a1 + 56))
          objc_msgSend(v26, "setType:");

      }
      v2 += k;
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v22);
  }

}

@end
