@implementation PXDataSectionManager

- (PXDataSectionManager)initWithChildDataSectionManagers:(id)a3
{
  id v4;
  PXDataSectionManager *v5;
  uint64_t v6;
  NSArray *childDataSectionManagers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDataSectionManager;
  v5 = -[PXDataSectionManager init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    childDataSectionManagers = v5->_childDataSectionManagers;
    v5->_childDataSectionManagers = (NSArray *)v6;

    -[PXDataSectionManager _registerAsChangeObserverForDataSectionManagers:](v5, "_registerAsChangeObserverForDataSectionManagers:", v5->_childDataSectionManagers);
  }

  return v5;
}

- (PXDataSectionManager)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithChildDataSectionManagers_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDataSectionManager.m"), 36, CFSTR("Use the designated initializer %@"), v5);

  abort();
}

- (BOOL)allowsEmptyDataSection
{
  return 0;
}

- (void)_registerAsChangeObserverForDataSectionManagers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "registerChangeObserver:context:", self, PXChildDataSourceManagerObserverContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_unregisterAsChangeObserverForDataSectionManagers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "registerChangeObserver:context:", self, PXChildDataSourceManagerObserverContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_setDataSection:(id)a3 changeDetails:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  PXDataSection *previousDataSection;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__PXDataSectionManager__setDataSection_changeDetails___block_invoke;
  v11[3] = &unk_1E5145A98;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[PXDataSectionManager performChanges:](self, "performChanges:", v11);
  previousDataSection = self->_previousDataSection;
  self->_previousDataSection = 0;

}

- (void)updateDataSectionWithChangeDetails:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[PXDataSectionManager createDataSection](self, "createDataSection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PXDataSectionManager _setDataSection:changeDetails:](self, "_setDataSection:changeDetails:", v5, v4);

  }
}

- (id)createDataSection
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDataSectionManager.m"), 85, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDataSectionManager createDataSection]", v6);

  abort();
}

- (PXDataSection)dataSectionIfCreated
{
  return self->_dataSection;
}

- (PXDataSection)dataSection
{
  PXDataSection *dataSection;
  PXDataSection *v4;
  PXDataSection *v5;

  dataSection = self->_dataSection;
  if (!dataSection)
  {
    -[PXDataSectionManager createDataSection](self, "createDataSection");
    v4 = (PXDataSection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dataSection;
    self->_dataSection = v4;

    dataSection = self->_dataSection;
  }
  return dataSection;
}

- (BOOL)isDataSectionEmpty
{
  void *v2;
  char v3;

  -[PXDataSectionManager dataSection](self, "dataSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsAnyObjects") ^ 1;

  return v3;
}

- (void)setChildDataSectionManagers:(id)a3
{
  NSArray *v4;
  void *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  int v9;
  NSArray *childDataSectionManagers;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *v16;
  void *v17;
  void *v18;
  NSArray *v19;

  v19 = (NSArray *)a3;
  v4 = self->_childDataSectionManagers;
  v5 = v19;
  if (v4 == v19)
  {
LABEL_8:

    v8 = v19;
    goto LABEL_9;
  }
  v6 = v4;
  v7 = -[NSArray isEqual:](v4, "isEqual:");

  v8 = v19;
  if ((v7 & 1) == 0)
  {
    objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", self->_childDataSectionManagers, v19, MEMORY[0x1E0C9AA60]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "hasIncrementalChanges");
    childDataSectionManagers = self->_childDataSectionManagers;
    if (v9)
    {
      objc_msgSend(v5, "removedIndexes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectsAtIndexes:](childDataSectionManagers, "objectsAtIndexes:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXDataSectionManager _unregisterAsChangeObserverForDataSectionManagers:](self, "_unregisterAsChangeObserverForDataSectionManagers:", v12);

      objc_msgSend(v5, "insertedIndexes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectsAtIndexes:](v19, "objectsAtIndexes:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXDataSectionManager _registerAsChangeObserverForDataSectionManagers:](self, "_registerAsChangeObserverForDataSectionManagers:", v14);

    }
    else
    {
      -[PXDataSectionManager _unregisterAsChangeObserverForDataSectionManagers:](self, "_unregisterAsChangeObserverForDataSectionManagers:", self->_childDataSectionManagers);
      -[PXDataSectionManager _registerAsChangeObserverForDataSectionManagers:](self, "_registerAsChangeObserverForDataSectionManagers:", v19);
    }
    v15 = (NSArray *)-[NSArray copy](v19, "copy");
    v16 = self->_childDataSectionManagers;
    self->_childDataSectionManagers = v15;

    -[PXDataSectionManager dataSectionIfCreated](self, "dataSectionIfCreated");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[PXDataSectionManager changeDetailsForChildDataSectionManagersChangeDetails:](self, "changeDetailsForChildDataSectionManagersChangeDetails:", v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXDataSectionManager updateDataSectionWithChangeDetails:](self, "updateDataSectionWithChangeDetails:", v18);

    }
    goto LABEL_8;
  }
LABEL_9:

}

- (id)changeDetailsForChildDataSectionManagersChangeDetails:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDataSectionManager.m"), 125, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDataSectionManager changeDetailsForChildDataSectionManagersChangeDetails:]", v8);

  abort();
}

- (id)changeDetailsForChangedChildDataSectionManager:(id)a3 childChangeDetails:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDataSectionManager.m"), 129, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDataSectionManager changeDetailsForChangedChildDataSectionManager:childChangeDetails:]", v11);

  abort();
}

- (id)auxiliaryObjectForKey:(id)a3 dataSectionObject:(id)a4 hintIndex:(int64_t)a5
{
  return 0;
}

- (BOOL)shouldInvalidateDataSectionForChildDataSectionManager:(id)a3 changeDescriptor:(unint64_t)a4
{
  return a4 & 1;
}

- (void)setChangeProcessingPaused:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXDataSectionManager childDataSectionManagers](self, "childDataSectionManagers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setChangeProcessingPaused:forReason:", v4, v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a3;
  if ((void *)PXChildDataSourceManagerObserverContext == a5)
  {
    v15 = v8;
    v9 = v8;
    -[PXDataSectionManager dataSectionIfCreated](self, "dataSectionIfCreated");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = -[PXDataSectionManager shouldInvalidateDataSectionForChildDataSectionManager:changeDescriptor:](self, "shouldInvalidateDataSectionForChildDataSectionManager:changeDescriptor:", v9, a4);

      if (v12)
      {
        objc_msgSend(v9, "changeDetailsFromPreviousDataSection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXDataSectionManager childDataSectionManager:didChangeDataSectionWithChangeDetails:](self, "childDataSectionManager:didChangeDataSectionWithChangeDetails:", v9, v13);
        -[PXDataSectionManager changeDetailsForChangedChildDataSectionManager:childChangeDetails:](self, "changeDetailsForChangedChildDataSectionManager:childChangeDetails:", v9, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXDataSectionManager updateDataSectionWithChangeDetails:](self, "updateDataSectionWithChangeDetails:", v14);

      }
    }

    v8 = v15;
  }

}

- (NSArray)childDataSectionManagers
{
  return self->_childDataSectionManagers;
}

- (NSObject)outlineObject
{
  return self->_outlineObject;
}

- (void)setOutlineObject:(id)a3
{
  objc_storeStrong((id *)&self->_outlineObject, a3);
}

- (PXArrayChangeDetails)changeDetailsFromPreviousDataSection
{
  return self->_changeDetailsFromPreviousDataSection;
}

- (PXDataSection)previousDataSection
{
  return self->_previousDataSection;
}

- (int64_t)previousDataSectionIdentifier
{
  return self->_previousDataSectionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousDataSection, 0);
  objc_storeStrong((id *)&self->_changeDetailsFromPreviousDataSection, 0);
  objc_storeStrong((id *)&self->_outlineObject, 0);
  objc_storeStrong((id *)&self->_childDataSectionManagers, 0);
  objc_storeStrong((id *)&self->_dataSection, 0);
}

uint64_t __54__PXDataSectionManager__setDataSection_changeDetails___block_invoke(id *a1)
{
  uint64_t v2;
  uint64_t result;
  _QWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v2 = objc_msgSend(*((id *)a1[4] + 12), "identifier");
  result = objc_msgSend(a1[5], "identifier");
  if (v2 != result)
  {
    objc_storeStrong((id *)a1[4] + 16, *((id *)a1[4] + 12));
    *((_QWORD *)a1[4] + 17) = objc_msgSend(a1[5], "identifier");
    if ((objc_msgSend(a1[6], "hasIncrementalChanges") & 1) != 0
      || objc_msgSend(*((id *)a1[4] + 12), "count")
      || objc_msgSend(a1[5], "count"))
    {
      v4 = a1[4];
      v5 = a1[6];
      v6 = (void *)v4[15];
      v4[15] = v5;
    }
    else
    {
      objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = a1[4];
      v6 = (void *)v8[15];
      v8[15] = v7;
    }

    objc_storeStrong((id *)a1[4] + 12, a1[5]);
    return objc_msgSend(a1[4], "signalChange:", 1);
  }
  return result;
}

@end
