@implementation PXStackedDataSectionManager

- (PXStackedDataSectionManager)initWithChildDataSectionManagers:(id)a3
{
  PXStackedDataSectionManager *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStackedDataSectionManager;
  result = -[PXDataSectionManager initWithChildDataSectionManagers:](&v4, sel_initWithChildDataSectionManagers_, a3);
  if (result)
    result->_enabled = 1;
  return result;
}

- (id)childDataSectionManagerForObjectAtIndex:(int64_t)a3 localIndex:(int64_t *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[PXDataSectionManager dataSection](self, "dataSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfChildDataSourceForObjectAtIndex:localIndex:", a3, a4);

  -[PXDataSectionManager childDataSectionManagers](self, "childDataSectionManagers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_enabled != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __42__PXStackedDataSectionManager_setEnabled___block_invoke;
    v3[3] = &unk_1E5142B28;
    v3[4] = self;
    v4 = a3;
    -[PXStackedDataSectionManager performChanges:](self, "performChanges:", v3);
  }
}

- (BOOL)_updateDataSectionIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PXDataSectionManager dataSectionIfCreated](self, "dataSectionIfCreated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_10;
  if (objc_msgSend(v3, "count") || !-[PXStackedDataSectionManager isEnabled](self, "isEnabled"))
  {
    if (objc_msgSend(v4, "count") < 1)
      goto LABEL_10;
    if (-[PXStackedDataSectionManager isEnabled](self, "isEnabled"))
      goto LABEL_10;
    objc_msgSend(off_1E50B1608, "changeDetailsWithRemovedIndexRange:", 0, objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    -[PXStackedDataSectionManager createDataSection](self, "createDataSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsWithInsertedIndexRange:", 0, objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
LABEL_10:
      v7 = 0;
      goto LABEL_11;
    }
  }
  -[PXDataSectionManager updateDataSectionWithChangeDetails:](self, "updateDataSectionWithChangeDetails:", v6);

  v7 = 1;
LABEL_11:

  return v7;
}

- (id)createDataSection
{
  void *v3;
  void *v4;
  PXStackedDataSection *v5;
  void *v6;
  PXStackedDataSection *v7;

  if (-[PXStackedDataSectionManager isEnabled](self, "isEnabled"))
  {
    -[PXDataSectionManager childDataSectionManagers](self, "childDataSectionManagers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PXMap();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  v5 = [PXStackedDataSection alloc];
  -[PXDataSectionManager outlineObject](self, "outlineObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXStackedDataSection initWithChildDataSections:outlineObject:](v5, "initWithChildDataSections:outlineObject:", v4, v6);

  return v7;
}

- (BOOL)isDataSectionEmpty
{
  objc_super v4;

  if (!-[PXStackedDataSectionManager isEnabled](self, "isEnabled"))
    return 1;
  if (-[PXStackedDataSectionManager alwaysContainsObjects](self, "alwaysContainsObjects"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)PXStackedDataSectionManager;
  return -[PXDataSectionManager isDataSectionEmpty](&v4, sel_isDataSectionEmpty);
}

- (id)changeDetailsForChildDataSectionManagersChangeDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v4 = a3;
  -[PXDataSectionManager dataSectionIfCreated](self, "dataSectionIfCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v4, "hasIncrementalChanges") && (objc_msgSend(v4, "hasMoves") & 1) == 0)
  {
    -[PXStackedDataSectionManager createDataSection](self, "createDataSection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    objc_msgSend(v4, "removedIndexes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __85__PXStackedDataSectionManager_changeDetailsForChildDataSectionManagersChangeDetails___block_invoke;
    v27[3] = &unk_1E51460E8;
    v28 = v5;
    v29 = v9;
    v12 = v9;
    objc_msgSend(v10, "enumerateIndexesUsingBlock:", v27);

    v13 = (void *)objc_opt_new();
    objc_msgSend(v4, "insertedIndexes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __85__PXStackedDataSectionManager_changeDetailsForChildDataSectionManagersChangeDetails___block_invoke_2;
    v24[3] = &unk_1E51460E8;
    v15 = v8;
    v25 = v15;
    v26 = v13;
    v16 = v13;
    objc_msgSend(v14, "enumerateIndexesUsingBlock:", v24);

    v17 = (void *)objc_opt_new();
    objc_msgSend(v4, "changedIndexes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __85__PXStackedDataSectionManager_changeDetailsForChildDataSectionManagersChangeDetails___block_invoke_3;
    v21[3] = &unk_1E51460E8;
    v22 = v15;
    v23 = v17;
    v19 = v17;
    v20 = v15;
    objc_msgSend(v18, "enumerateIndexesUsingBlock:", v21);

    v6 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v12, v16, 0, 0, v19);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)changeDetailsForChangedChildDataSectionManager:(id)a3 childChangeDetails:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[PXDataSectionManager childDataSectionManagers](self, "childDataSectionManagers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v7);

  -[PXDataSectionManager dataSectionIfCreated](self, "dataSectionIfCreated");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = 0;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL && v10)
  {
    if (-[PXStackedDataSectionManager isEnabled](self, "isEnabled"))
    {
      objc_msgSend(v6, "changeDetailsShiftedBy:", objc_msgSend(v11, "itemStartIndexForChildDataSourceAtIndex:", v9));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)auxiliaryObjectForKey:(id)a3 dataSectionObject:(id)a4 hintIndex:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__81113;
  v24 = __Block_byref_object_dispose__81114;
  v25 = 0;
  -[PXDataSectionManager childDataSectionManagers](self, "childDataSectionManagers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__PXStackedDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke;
  v15[3] = &unk_1E5123010;
  v18 = &v20;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v19 = a5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (PXDataSectionEnablementForwarder)enablementForwarder
{
  return self->_enablementForwarder;
}

- (void)setEnablementForwarder:(id)a3
{
  objc_storeStrong((id *)&self->_enablementForwarder, a3);
}

- (BOOL)alwaysContainsObjects
{
  return self->_alwaysContainsObjects;
}

- (void)setAlwaysContainsObjects:(BOOL)a3
{
  self->_alwaysContainsObjects = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enablementForwarder, 0);
}

void __81__PXStackedDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "auxiliaryObjectForKey:dataSectionObject:hintIndex:", a1[4], a1[5], a1[7]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    *a4 = 1;
}

void __85__PXStackedDataSectionManager_changeDetailsForChildDataSectionManagersChangeDetails___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "childDataSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", objc_msgSend(*(id *)(a1 + 32), "itemStartIndexForChildDataSourceAtIndex:", a2), objc_msgSend(v5, "count"));
}

void __85__PXStackedDataSectionManager_changeDetailsForChildDataSectionManagersChangeDetails___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "childDataSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", objc_msgSend(*(id *)(a1 + 32), "itemStartIndexForChildDataSourceAtIndex:", a2), objc_msgSend(v5, "count"));
}

void __85__PXStackedDataSectionManager_changeDetailsForChildDataSectionManagersChangeDetails___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "childDataSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", objc_msgSend(*(id *)(a1 + 32), "itemStartIndexForChildDataSourceAtIndex:", a2), objc_msgSend(v5, "count"));
}

uint64_t __48__PXStackedDataSectionManager_createDataSection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dataSection");
}

uint64_t __42__PXStackedDataSectionManager_setEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = *(_BYTE *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "_updateDataSectionIfNecessary");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 4);
  return result;
}

@end
