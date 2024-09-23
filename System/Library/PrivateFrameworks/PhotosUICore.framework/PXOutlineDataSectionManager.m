@implementation PXOutlineDataSectionManager

- (id)_changeDetailsForNewDataSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  -[PXOutlineDataSectionManager createDataSection](self, "createDataSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDataSectionManager dataSection](self, "dataSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v9 = v4;
  else
    v9 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)childDataSectionManagerForOutlineObject:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_dataSectionManagersByDataSectionObjects, "objectForKeyedSubscript:", a3);
}

- (void)rearrangeSectionContent
{
  id v3;

  -[PXOutlineDataSectionManager _changeDetailsForNewDataSection:](self, "_changeDetailsForNewDataSection:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXDataSectionManager updateDataSectionWithChangeDetails:](self, "updateDataSectionWithChangeDetails:", v3);

}

- (id)createDataSection
{
  void *v3;
  void *v4;
  NSDictionary *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSDictionary *dataSectionManagersByDataSectionObjects;
  NSDictionary *v22;
  PXArrayDataSection *v23;
  PXArrayDataSection *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (NSDictionary *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PXDataSectionManager childDataSectionManagers](self, "childDataSectionManagers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "outlineObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v3, "addObject:", v12);
          if ((objc_msgSend(v11, "allowsEmptyDataSection") & 1) != 0
            || (objc_msgSend(v11, "isDataSectionEmpty") & 1) == 0)
          {
            -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, v12);
          }
          else
          {
            objc_msgSend(v4, "addObject:", v12);
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v8);
  }

  -[PXOutlineDataSectionManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "outlineDataSectionManager:arrangedSectionContent:", self, v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 != v3)
    {
      v16 = objc_msgSend(v3, "count");
      if (v16 == objc_msgSend(v15, "count")
        && (objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v17, "isEqualToSet:", v18),
            v18,
            v17,
            v19))
      {
        objc_msgSend(v3, "setArray:", v15);
      }
      else
      {
        PLUIGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v14;
          _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "%@ did not return a valid arranged section content (different count or content)", buf, 0xCu);
        }

      }
    }

  }
  objc_msgSend(v3, "removeObjectsInArray:", v4);
  dataSectionManagersByDataSectionObjects = self->_dataSectionManagersByDataSectionObjects;
  self->_dataSectionManagersByDataSectionObjects = v5;
  v22 = v5;

  v23 = [PXArrayDataSection alloc];
  v24 = -[PXArrayDataSection initWithOutlineObject:sectionContent:](v23, "initWithOutlineObject:sectionContent:", 0, v3);

  return v24;
}

- (BOOL)shouldInvalidateDataSectionForChildDataSectionManager:(id)a3 changeDescriptor:(unint64_t)a4
{
  char v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if ((v4 & 6) != 0)
  {
    v7 = 1;
  }
  else if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "previousDataSection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "containsAnyObjects") ^ 1;
    else
      v10 = 1;
    v7 = v10 != objc_msgSend(v6, "isDataSectionEmpty");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)changeDetailsForChildDataSectionManagersChangeDetails:(id)a3
{
  return -[PXOutlineDataSectionManager _changeDetailsForNewDataSection:](self, "_changeDetailsForNewDataSection:", 0);
}

- (id)changeDetailsForChangedChildDataSectionManager:(id)a3 childChangeDetails:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(a4, "hasIncrementalChanges") & 1) != 0)
  {
    objc_msgSend(v6, "outlineObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    -[PXOutlineDataSectionManager _changeDetailsForNewDataSection:](self, "_changeDetailsForNewDataSection:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (PXOutlineDataSectionManagerDelegate)delegate
{
  return (PXOutlineDataSectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSectionManagersByDataSectionObjects, 0);
}

@end
