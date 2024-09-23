@implementation PXPhotoKitImportStatusManager

- (id)initAllowingSimulation:(BOOL)a3
{
  _BOOL4 v3;
  PXPhotoKitImportStatusManager *v4;
  uint64_t v5;
  NSHashTable *statusObservers;
  uint64_t v7;
  NSMutableDictionary *simulatedStateByAssetID;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXPhotoKitImportStatusManager;
  v4 = -[PXPhotoKitImportStatusManager init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    statusObservers = v4->_statusObservers;
    v4->_statusObservers = (NSHashTable *)v5;

    v4->_supportsStateSimulation = v3;
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = objc_claimAutoreleasedReturnValue();
      simulatedStateByAssetID = v4->_simulatedStateByAssetID;
      v4->_simulatedStateByAssetID = (NSMutableDictionary *)v7;

    }
  }
  return v4;
}

- (PXPhotoKitImportStatusManager)init
{
  return (PXPhotoKitImportStatusManager *)-[PXPhotoKitImportStatusManager initAllowingSimulation:](self, "initAllowingSimulation:", 0);
}

- (int64_t)importStateForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if (!-[PXPhotoKitImportStatusManager supportsStateSimulation](self, "supportsStateSimulation"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "destinationAssetCopyProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6;
      if (!v6)
        goto LABEL_8;
      v7 = objc_msgSend(v6, "destinationAssetCopyState");

      if ((unint64_t)(v7 + 1) <= 3)
      {
        v5 = (void *)qword_1A7C09458[v7 + 1];
        goto LABEL_8;
      }
    }
    v5 = 0;
    goto LABEL_8;
  }
  v5 = -[PXPhotoKitImportStatusManager _simulatedStateForAsset:](self, "_simulatedStateForAsset:", v4);
LABEL_8:

  return (int64_t)v5;
}

- (void)_notifySimulationObserversForAssetReference:(id)a3
{
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitImportStatusManager.m"), 75, CFSTR("%s must be called on the main thread"), "-[PXPhotoKitImportStatusManager _notifySimulationObserversForAssetReference:]");

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_statusObservers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1A85CE17C]();
        objc_msgSend(v11, "assetImportStatusManager:didChangeStatusForAssetReference:", self, v5);
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)beginSimulatedImportForAssetReference:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;

  v5 = a3;
  v14 = v5;
  if (!self->_supportsStateSimulation)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitImportStatusManager.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_supportsStateSimulation"));

    v5 = v14;
  }
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitImportStatusManager.m"), 86, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetReference.asset"), v11);
LABEL_8:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitImportStatusManager.m"), 86, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetReference.asset"), v11, v13);

    goto LABEL_8;
  }
LABEL_5:
  objc_msgSend(v6, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_simulatedStateByAssetID, "setObject:forKeyedSubscript:", &unk_1E53EB730, v7);
  -[PXPhotoKitImportStatusManager _notifySimulationObserversForAssetReference:](self, "_notifySimulationObserversForAssetReference:", v14);

}

- (void)completeSimulatedImportForAssetReference:(id)a3 withSuccess:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;

  v4 = a4;
  v7 = a3;
  v17 = v7;
  if (!self->_supportsStateSimulation)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitImportStatusManager.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_supportsStateSimulation"));

    v7 = v17;
  }
  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitImportStatusManager.m"), 97, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetReference.asset"), v14, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitImportStatusManager.m"), 97, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetReference.asset"), v14);
  }

LABEL_5:
  objc_msgSend(v8, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v10 = &unk_1E53EB748;
  else
    v10 = &unk_1E53EB760;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_simulatedStateByAssetID, "setObject:forKeyedSubscript:", v10, v9);
  -[PXPhotoKitImportStatusManager _notifySimulationObserversForAssetReference:](self, "_notifySimulationObserversForAssetReference:", v17);

}

- (int64_t)_simulatedStateForAsset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitImportStatusManager.m"), 106, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v12);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitImportStatusManager.m"), 106, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v12, v14);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v5, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_simulatedStateByAssetID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

- (void)addAssetImportStatusObserver:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitImportStatusManager.m"), 114, CFSTR("%s must be called on the main thread"), "-[PXPhotoKitImportStatusManager addAssetImportStatusObserver:]");

  }
  -[NSHashTable addObject:](self->_statusObservers, "addObject:", v6);

}

- (void)removeAssetImportStatusObserver:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitImportStatusManager.m"), 119, CFSTR("%s must be called on the main thread"), "-[PXPhotoKitImportStatusManager removeAssetImportStatusObserver:]");

  }
  -[NSHashTable removeObject:](self->_statusObservers, "removeObject:", v6);

}

- (BOOL)supportsStateSimulation
{
  return self->_supportsStateSimulation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedStateByAssetID, 0);
  objc_storeStrong((id *)&self->_statusObservers, 0);
}

@end
