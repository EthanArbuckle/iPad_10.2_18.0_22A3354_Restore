@implementation PBItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_itemQueue_metadata, 0);
  objc_storeStrong((id *)&self->_itemQueue_localObject, 0);
  objc_storeStrong(&self->_itemQueue_localUserInfo, 0);
  objc_storeStrong((id *)&self->_itemQueue_patternDetections, 0);
  objc_storeStrong((id *)&self->_itemQueue_dataAvailabilityByType, 0);
  objc_storeStrong((id *)&self->_itemQueue_visibilityByType, 0);
  objc_storeStrong((id *)&self->_itemQueue_preferredRepresentationByType, 0);
  objc_storeStrong((id *)&self->_itemQueue_typeOrder, 0);
  objc_storeStrong((id *)&self->_itemQueue_representationByType, 0);
  objc_storeStrong((id *)&self->_itemQueue_privateMetadata, 0);
  objc_destroyWeak((id *)&self->_itemQueue_dataTransferDelegate);
  objc_storeStrong((id *)&self->_itemQueue_primaryFileURL, 0);
  objc_storeStrong((id *)&self->_itemQueue_primaryData, 0);
}

void __41__PBItem_preferredRepresentationForType___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "unsignedIntegerValue");

}

void __24__PBItem_availableTypes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_availableTypes");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __44__PBItem_isDataAvailableImmediatelyForType___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "BOOLValue");

}

+ (id)allowedClassesForSecureCoding
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

- (NSDictionary)metadata
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __18__PBItem_metadata__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSArray)availableTypes
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__PBItem_availableTypes__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (BOOL)isDataAvailableImmediatelyForType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PBItem_isDataAvailableImmediatelyForType___block_invoke;
  block[3] = &unk_1E2431810;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)itemQueue_setItemRepresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "typeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet addObject:](self->_itemQueue_typeOrder, "addObject:", v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemQueue_representationByType, "setObject:forKeyedSubscript:", v14, v4);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_itemQueue_preferredRepresentationByType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v14, "setPreferredRepresentation:", objc_msgSend(v5, "unsignedIntegerValue"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "preferredRepresentation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemQueue_preferredRepresentationByType, "setObject:forKeyedSubscript:", v7, v4);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_itemQueue_visibilityByType, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v14, "setVisibility:", objc_msgSend(v8, "unsignedIntegerValue"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "visibility"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemQueue_visibilityByType, "setObject:forKeyedSubscript:", v10, v4);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_itemQueue_dataAvailabilityByType, "objectForKeyedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v14, "setIsDataAvailableImmediately:", objc_msgSend(v11, "BOOLValue"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v14, "isDataAvailableImmediately"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemQueue_dataAvailabilityByType, "setObject:forKeyedSubscript:", v13, v4);

  }
}

void __18__PBItem_metadata__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_metadata");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDictionary)itemQueue_metadata
{
  return self->_itemQueue_metadata;
}

- (PBItem)initWithNSItemProvider:(id)a3
{
  id v4;
  PBItem *v5;
  PBItem *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  PBItemRepresentation *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PBItem *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  PBItem *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[PBItem init](self, "init");
    v30 = v5;
    if (v5)
    {
      v6 = v5;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v4, "registeredTypeIdentifiers");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v38 != v9)
              objc_enumerationMutation(obj);
            objc_msgSend(v4, "_representationConformingToType:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i), v30);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              v12 = -[PBItemRepresentation initWithNSItemRepresentation:]([PBItemRepresentation alloc], "initWithNSItemRepresentation:", v11);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                -[PBItemRepresentation typeIdentifier](v12, "typeIdentifier");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = objc_msgSend(v4, "isDataAvailableImmediatelyForTypeIdentifier:", v13);

                v6 = v30;
                -[PBItemRepresentation setIsDataAvailableImmediately:](v12, "setIsDataAvailableImmediately:", v14);
              }
              -[PBItem addRepresentation:](v6, "addRepresentation:", v12);

            }
          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v8);
      }

    }
    objc_msgSend(v4, "_metadataValueForKey:", CFSTR("com.apple.Pasteboard.PBItemMetadata"), v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = objc_msgSend(v15, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v17;
    objc_msgSend(v4, "suggestedName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");

    if (v21)
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("com.apple.Pasteboard.suggestedName"));
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    PBNSIPTopLevelMetadataKeys();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(v4, "_metadataValueForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v28, v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v24);
    }

    objc_msgSend(v31, "setMetadata:", v19);
    self = v31;

    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)setMetadata:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__PBItem_setMetadata___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (PBItem)init
{
  PBItem *v2;
  PBItem *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBItem;
  v2 = -[PBItem init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PBItem _commonInitGenerateUUID:](v2, "_commonInitGenerateUUID:", 1);
  return v3;
}

- (void)addRepresentation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__PBItem_addRepresentation___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_commonInitGenerateUUID:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *itemQueue_typeOrder;
  NSMutableDictionary *v7;
  NSMutableDictionary *itemQueue_representationByType;
  NSMutableDictionary *v9;
  NSMutableDictionary *itemQueue_preferredRepresentationByType;
  NSMutableDictionary *v11;
  NSMutableDictionary *itemQueue_visibilityByType;
  NSMutableDictionary *v13;
  NSMutableDictionary *itemQueue_dataAvailabilityByType;
  NSMutableDictionary *v15;
  NSMutableDictionary *itemQueue_patternDetections;
  NSUUID *v17;
  NSUUID *UUID;

  v3 = a3;
  v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  itemQueue_typeOrder = self->_itemQueue_typeOrder;
  self->_itemQueue_typeOrder = v5;

  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  itemQueue_representationByType = self->_itemQueue_representationByType;
  self->_itemQueue_representationByType = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  itemQueue_preferredRepresentationByType = self->_itemQueue_preferredRepresentationByType;
  self->_itemQueue_preferredRepresentationByType = v9;

  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  itemQueue_visibilityByType = self->_itemQueue_visibilityByType;
  self->_itemQueue_visibilityByType = v11;

  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  itemQueue_dataAvailabilityByType = self->_itemQueue_dataAvailabilityByType;
  self->_itemQueue_dataAvailabilityByType = v13;

  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  itemQueue_patternDetections = self->_itemQueue_patternDetections;
  self->_itemQueue_patternDetections = v15;

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    UUID = self->_UUID;
    self->_UUID = v17;

  }
}

- (unint64_t)preferredRepresentationForType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PBItem_preferredRepresentationForType___block_invoke;
  block[3] = &unk_1E2431810;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)itemQueue_availableTypes
{
  void *v2;
  void *v3;

  v2 = (void *)-[NSMutableOrderedSet copy](self->_itemQueue_typeOrder, "copy");
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __41__PBItem_representationConformingToType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemQueue_typeOrder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _bestMatchType(v2, v4, &__block_literal_global_6);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "itemQueue_representationForType:");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (id)representationConformingToType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  PBItem *v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__PBItem_representationConformingToType___block_invoke;
  v9[3] = &unk_1E2430E18;
  v10 = v4;
  v11 = self;
  v12 = v20;
  v13 = &v14;
  v6 = v4;
  dispatch_sync(v5, v9);

  v7 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(v20, 8);
  return v7;
}

- (NSMutableOrderedSet)itemQueue_typeOrder
{
  return self->_itemQueue_typeOrder;
}

- (id)itemQueue_representationForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PBItem itemQueue_representationByType](self, "itemQueue_representationByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)itemQueue_representationByType
{
  return self->_itemQueue_representationByType;
}

uint64_t __22__PBItem_setMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_metadata:", *(_QWORD *)(a1 + 40));
}

- (void)setItemQueue_metadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

uint64_t __28__PBItem_addRepresentation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemQueue_setItemRepresentation:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_itemQueue_primaryFileURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtURL:error:", self->_itemQueue_primaryFileURL, 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)PBItem;
  -[PBItem dealloc](&v4, sel_dealloc);
}

- (id)localUserInfo
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __23__PBItem_localUserInfo__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __23__PBItem_localUserInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_localUserInfo");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setLocalUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__PBItem_setLocalUserInfo___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __27__PBItem_setLocalUserInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_localUserInfo:", *(_QWORD *)(a1 + 40));
}

- (id)localObject
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __21__PBItem_localObject__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __21__PBItem_localObject__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_localObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setLocalObject:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__PBItem_setLocalObject___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __25__PBItem_setLocalObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_localObject:", *(_QWORD *)(a1 + 40));
}

- (id)availableTypesWithPreferredRepresentation:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PBItem_availableTypesWithPreferredRepresentation___block_invoke;
  block[3] = &unk_1E2431518;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __52__PBItem_availableTypesWithPreferredRepresentation___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1[4] + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", v7, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8 && objc_msgSend(v8, "preferredRepresentation") == a1[6])
          objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (NSDictionary)privateMetadata
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__PBItem_privateMetadata__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __25__PBItem_privateMetadata__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_privateMetadata");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPrivateMetadata:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PBItem_setPrivateMetadata___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __29__PBItem_setPrivateMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_privateMetadata:", *(_QWORD *)(a1 + 40));
}

- (NSString)suggestedName
{
  void *v2;
  void *v3;
  void *v4;

  -[PBItem metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.Pasteboard.suggestedName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

+ (id)item
{
  return objc_alloc_init(PBItem);
}

+ (id)itemWithObject:(id)a3
{
  id v3;
  PBItem *v4;

  v3 = a3;
  v4 = -[PBItem initWithObject:]([PBItem alloc], "initWithObject:", v3);

  return v4;
}

+ (id)itemWithData:(id)a3 type:(id)a4
{
  id v5;
  id v6;
  PBItem *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PBItem initWithData:type:]([PBItem alloc], "initWithData:type:", v6, v5);

  return v7;
}

+ (id)itemWithContentsOfFileURL:(id)a3 type:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  PBItem *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[PBItem initWithContentsOfFileURL:type:outError:]([PBItem alloc], "initWithContentsOfFileURL:type:outError:", v8, v7, a5);

  return v9;
}

- (id)initDoNothing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBItem;
  return -[PBItem init](&v3, sel_init);
}

- (id)_itemQueue_copyWithDoNothingRepresentations
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initDoNothing");
  v4 = -[NSMutableOrderedSet mutableCopy](self->_itemQueue_typeOrder, "mutableCopy");
  v5 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v4;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_itemQueue_representationByType, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = self->_itemQueue_representationByType;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_itemQueue_representationByType, "objectForKeyedSubscript:", v12, (_QWORD)v30);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "copyWithDoNothingLoaderBlock");
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);

      }
      v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);
  }

  v15 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v6;
  v16 = v6;

  v17 = -[NSMutableDictionary mutableCopy](self->_itemQueue_visibilityByType, "mutableCopy");
  v18 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v17;

  v19 = -[NSMutableDictionary mutableCopy](self->_itemQueue_preferredRepresentationByType, "mutableCopy");
  v20 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v19;

  v21 = -[NSMutableDictionary mutableCopy](self->_itemQueue_dataAvailabilityByType, "mutableCopy");
  v22 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v21;

  v23 = -[NSUUID copy](self->_UUID, "copy");
  v24 = *(void **)(v3 + 120);
  *(_QWORD *)(v3 + 120) = v23;

  v25 = -[NSDictionary copy](self->_itemQueue_metadata, "copy");
  v26 = *(void **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = v25;

  v27 = -[NSDictionary copy](self->_itemQueue_privateMetadata, "copy");
  v28 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v27;

  *(_BYTE *)(v3 + 8) = self->_itemQueue_isStoredOnServer;
  return (id)v3;
}

- (id)copyWithDoNothingRepresentations
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__PBItem_copyWithDoNothingRepresentations__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__PBItem_copyWithDoNothingRepresentations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_itemQueue_copyWithDoNothingRepresentations");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (PBItem)initWithObject:(id)a3
{
  NSObject *v4;
  NSObject *itemQueue_localObject;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  PBItemRepresentation *v14;
  PBItemRepresentation *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  PBItemRepresentation *v28;
  PBItemRepresentation *v29;
  id v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  void *context;
  uint64_t v36;
  PBItem *val;
  _QWORD v38[5];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id location;
  objc_super v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v55.receiver = self;
  v55.super_class = (Class)PBItem;
  val = -[PBItem init](&v55, sel_init);
  if (val)
  {
    if (objc_msgSend(v31, "conformsToProtocol:", &unk_1EE03C700))
      v4 = objc_msgSend(v31, "copyWithZone:", 0);
    else
      v4 = v31;
    itemQueue_localObject = val->_itemQueue_localObject;
    val->_itemQueue_localObject = v4;

    -[PBItem _commonInitGenerateUUID:](val, "_commonInitGenerateUUID:", 1);
    +[PBCoercionRegistry defaultRegistry](PBCoercionRegistry, "defaultRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "availableRepresentationTypesForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, val);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v51 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x18D782D00]();
          v14 = [PBItemRepresentation alloc];
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __25__PBItem_initWithObject___block_invoke;
          v48[3] = &unk_1E2431590;
          objc_copyWeak(&v49, &location);
          v48[4] = v12;
          v15 = -[PBItemRepresentation initWithType:preferredRepresentation:v3_loader:](v14, "initWithType:preferredRepresentation:v3_loader:", v12, 0, v48);
          -[PBItemRepresentation setIsDataAvailableImmediately:](v15, "setIsDataAvailableImmediately:", 1);
          -[PBItem itemQueue_setItemRepresentation:](val, "itemQueue_setItemRepresentation:", v15);

          objc_destroyWeak(&v49);
          objc_autoreleasePoolPop(v13);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v9);
    }

    +[PBCoercionRegistry defaultRegistry](PBCoercionRegistry, "defaultRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_availableClassesToCoerceFromClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v17;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    if (v18)
    {
      v33 = *(_QWORD *)v45;
      do
      {
        v19 = 0;
        v34 = v18;
        do
        {
          if (*(_QWORD *)v45 != v33)
            objc_enumerationMutation(obj);
          v36 = v19;
          v20 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v19);
          context = (void *)MEMORY[0x18D782D00]();
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          +[PBCoercionRegistry defaultRegistry](PBCoercionRegistry, "defaultRegistry");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "availableRepresentationTypesForClass:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v41 != v24)
                  objc_enumerationMutation(v22);
                v26 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
                v27 = (void *)MEMORY[0x18D782D00]();
                if ((objc_msgSend(v8, "containsObject:", v26) & 1) == 0)
                {
                  v28 = [PBItemRepresentation alloc];
                  v38[0] = MEMORY[0x1E0C809B0];
                  v38[1] = 3221225472;
                  v38[2] = __25__PBItem_initWithObject___block_invoke_4;
                  v38[3] = &unk_1E2431590;
                  objc_copyWeak(&v39, &location);
                  v38[4] = v26;
                  v29 = -[PBItemRepresentation initWithType:preferredRepresentation:v3_loader:](v28, "initWithType:preferredRepresentation:v3_loader:", v26, 0, v38);
                  -[PBItem itemQueue_setItemRepresentation:](val, "itemQueue_setItemRepresentation:", v29);

                  objc_destroyWeak(&v39);
                }
                objc_autoreleasePoolPop(v27);
              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
            }
            while (v23);
          }

          objc_autoreleasePoolPop(context);
          v19 = v36 + 1;
        }
        while (v36 + 1 != v34);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      }
      while (v18);
    }

    objc_destroyWeak(&location);
  }

  return val;
}

uint64_t __25__PBItem_initWithObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[PBCoercionRegistry defaultRegistry](PBCoercionRegistry, "defaultRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "localObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __25__PBItem_initWithObject___block_invoke_2;
    v10[3] = &unk_1E2431568;
    v11 = v4;
    objc_msgSend(v6, "loadRepresentationOfObject:asType:completionBlock:", v7, v8, v10);

  }
  return 0;
}

void __25__PBItem_initWithObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v6 = a2;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __25__PBItem_initWithObject___block_invoke_3;
    v9[3] = &unk_1E2431540;
    v12 = v8;
    v10 = v6;
    v11 = v7;
    PBDispatchAsyncCallback(v9);

  }
}

uint64_t __25__PBItem_initWithObject___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5], 0);
}

uint64_t __25__PBItem_initWithObject___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[PBCoercionRegistry defaultRegistry](PBCoercionRegistry, "defaultRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "localObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __25__PBItem_initWithObject___block_invoke_5;
    v10[3] = &unk_1E2431568;
    v11 = v4;
    objc_msgSend(v6, "loadRepresentationOfObject:asType:completionBlock:", v7, v8, v10);

  }
  return 0;
}

void __25__PBItem_initWithObject___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v6 = a2;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __25__PBItem_initWithObject___block_invoke_6;
    v9[3] = &unk_1E2431540;
    v12 = v8;
    v10 = v6;
    v11 = v7;
    PBDispatchAsyncCallback(v9);

  }
}

uint64_t __25__PBItem_initWithObject___block_invoke_6(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5], 0);
}

- (PBItem)initWithData:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  PBItem *v8;
  uint64_t v9;
  NSData *itemQueue_primaryData;
  PBItemRepresentation *v11;
  PBItemRepresentation *v12;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PBItem;
  v8 = -[PBItem init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    itemQueue_primaryData = v8->_itemQueue_primaryData;
    v8->_itemQueue_primaryData = (NSData *)v9;

    -[PBItem _commonInitGenerateUUID:](v8, "_commonInitGenerateUUID:", 1);
    v11 = [PBItemRepresentation alloc];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __28__PBItem_initWithData_type___block_invoke;
    v14[3] = &unk_1E24315E0;
    v15 = v6;
    v12 = -[PBItemRepresentation initWithType:preferredRepresentation:v3_loader:](v11, "initWithType:preferredRepresentation:v3_loader:", v7, 0, v14);
    -[PBItemRepresentation setIsDataAvailableImmediately:](v12, "setIsDataAvailableImmediately:", 1);
    -[PBItem itemQueue_setItemRepresentation:](v8, "itemQueue_setItemRepresentation:", v12);

  }
  return v8;
}

uint64_t __28__PBItem_initWithData_type___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __28__PBItem_initWithData_type___block_invoke_2;
    v7[3] = &unk_1E24315B8;
    v9 = v4;
    v8 = *(id *)(a1 + 32);
    PBDispatchAsyncCallback(v7);

  }
  return 0;
}

uint64_t __28__PBItem_initWithData_type___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0, 0, 0);
}

- (PBItem)initWithContentsOfFileURL:(id)a3 type:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  PBItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  id v19;
  void *v20;
  int *v21;
  void *v22;
  void *v23;
  void *v24;
  int *v25;
  void *v26;
  PBItemRepresentation *v27;
  PBItemRepresentation *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, void *);
  void *v33;
  id v34;
  id v35;
  objc_super v36;

  v8 = a3;
  v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PBItem;
  v10 = -[PBItem init](&v36, sel_init);
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_retainAutorelease(v8);
    v18 = (const char *)objc_msgSend(v17, "fileSystemRepresentation");
    v19 = objc_retainAutorelease(v16);
    if (copyfile(v18, (const char *)objc_msgSend(v19, "fileSystemRepresentation"), 0, 0x100000Fu))
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = __error();
      objc_msgSend(v20, "stringWithUTF8String:", strerror(*v21));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PBCannotCopyFileError(v17, v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
LABEL_9:

        goto LABEL_10;
      }
      if (a5)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = __error();
        objc_msgSend(v24, "stringWithUTF8String:", strerror(*v25));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        PBCannotCopyFileError(v17, v26, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v10 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v10->_itemQueue_primaryFileURL, v19);
      -[PBItem _commonInitGenerateUUID:](v10, "_commonInitGenerateUUID:", 1);
      v27 = [PBItemRepresentation alloc];
      v30 = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = __50__PBItem_initWithContentsOfFileURL_type_outError___block_invoke;
      v33 = &unk_1E2431630;
      v34 = v19;
      v35 = v9;
      v28 = -[PBItemRepresentation initWithType:preferredRepresentation:v3_loader:](v27, "initWithType:preferredRepresentation:v3_loader:", v35, 1, &v30);
      -[PBItemRepresentation setIsDataAvailableImmediately:](v28, "setIsDataAvailableImmediately:", 1, v30, v31, v32, v33);
      -[PBItem itemQueue_setItemRepresentation:](v10, "itemQueue_setItemRepresentation:", v28);

      v23 = v34;
    }

    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

uint64_t __50__PBItem_initWithContentsOfFileURL_type_outError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  PBSecurityScopedURLWrapper *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  PBSecurityScopedURLWrapper *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v21 = 0;
  v22 = 0;
  PBCloneURLToTemporaryFolder(v5, (uint64_t)CFSTR("com.apple.pasteboard"), v6, 0, &v22, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;
  v9 = v21;
  v10 = 0;
  v11 = 0;
  v12 = MEMORY[0x1E0C809B0];
  if (!v9)
  {
    v10 = -[PBSecurityScopedURLWrapper initWithURL:readonly:]([PBSecurityScopedURLWrapper alloc], "initWithURL:readonly:", v7, 1);
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __50__PBItem_initWithContentsOfFileURL_type_outError___block_invoke_2;
    v19[3] = &unk_1E2430DF0;
    v20 = v8;
    v11 = (void *)MEMORY[0x18D782EA4](v19);

    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __50__PBItem_initWithContentsOfFileURL_type_outError___block_invoke_3;
    v14[3] = &unk_1E2431608;
    v17 = v4;
    v15 = v10;
    v16 = v9;
    v18 = v11;
    PBDispatchAsyncCallback(v14);

  }
LABEL_4:

  return 0;
}

void __50__PBItem_initWithContentsOfFileURL_type_outError___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

}

uint64_t __50__PBItem_initWithContentsOfFileURL_type_outError___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 0, a1[4], 0, a1[5], a1[7]);
}

- (NSArray)representations
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__PBItem_representations__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __25__PBItem_representations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addDataRepresentationType:(id)a3 loader:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PBItem *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  PBItemQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PBItem_addDataRepresentationType_loader___block_invoke;
  block[3] = &unk_1E2431680;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __43__PBItem_addDataRepresentationType_loader___block_invoke(uint64_t a1)
{
  PBItemRepresentation *v2;
  uint64_t v3;
  PBItemRepresentation *v4;
  _QWORD v5[4];
  id v6;

  v2 = [PBItemRepresentation alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PBItem_addDataRepresentationType_loader___block_invoke_2;
  v5[3] = &unk_1E2430CD8;
  v6 = *(id *)(a1 + 48);
  v4 = -[PBItemRepresentation initWithType:preferredRepresentation:v3_loader:](v2, "initWithType:preferredRepresentation:v3_loader:", v3, 0, v5);
  objc_msgSend(*(id *)(a1 + 40), "itemQueue_setItemRepresentation:", v4);

}

id __43__PBItem_addDataRepresentationType_loader___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__PBItem_addDataRepresentationType_loader___block_invoke_3;
  v10[3] = &unk_1E2431658;
  v11 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v4;
  v6(v5, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __43__PBItem_addDataRepresentationType_loader___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addFileCopyRepresentationType:(id)a3 loader:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__PBItem_addFileCopyRepresentationType_loader___block_invoke;
  v10[3] = &unk_1E24316D0;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[PBItem v2_addFileCopyRepresentationType:loader:](self, "v2_addFileCopyRepresentationType:loader:", v8, v10);

}

id __47__PBItem_addFileCopyRepresentationType_loader___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *);
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__PBItem_addFileCopyRepresentationType_loader___block_invoke_2;
  v9[3] = &unk_1E24316A8;
  v4 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = v3;
  v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
  v6 = v3;
  v5(v4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __47__PBItem_addFileCopyRepresentationType_loader___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  v7 = (void *)v6;
  if (!v5 || v6)
  {
    if (v5 | v6)
    {
      v8 = 0;
      v12 = (void *)v6;
    }
    else
    {
      PBCannotLoadRepresentationError(*(_QWORD *)(a1 + 32), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
    }
  }
  else
  {
    CPTemporaryFileWithUniqueName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = __error();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%s"), strerror(*v10));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBCannotCreateTemporaryFile((uint64_t)v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeItemAtURL:error:", v8, 0);

  }
}

- (void)v2_addFileCopyRepresentationType:(id)a3 loader:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PBItem *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  PBItemQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke;
  block[3] = &unk_1E2431680;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke(id *a1)
{
  PBItemRepresentation *v2;
  id v3;
  PBItemRepresentation *v4;
  uint64_t v5;
  uint64_t v6;
  id (*v7)(uint64_t, uint64_t, void *);
  void *v8;
  id v9;
  id v10;

  v2 = [PBItemRepresentation alloc];
  v3 = a1[4];
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke_2;
  v8 = &unk_1E2431720;
  v10 = a1[6];
  v9 = a1[4];
  v4 = -[PBItemRepresentation initWithType:preferredRepresentation:v3_loader:](v2, "initWithType:preferredRepresentation:v3_loader:", v3, 1, &v5);
  objc_msgSend(a1[5], "itemQueue_setItemRepresentation:", v4, v5, v6, v7, v8);

}

id __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke_3;
  v10[3] = &unk_1E24316F8;
  v5 = *(_QWORD *)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v4;
  v6(v5, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PBSecurityScopedURLWrapper *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  v9 = v6;
  v10 = 0;
  if (v5 && !v6)
  {
    v11 = *(void **)(a1 + 32);
    v17 = 0;
    v18 = 0;
    PBCloneURLToTemporaryFolder(v5, (uint64_t)CFSTR("com.apple.pasteboard"), v11, 0, &v18, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    v14 = v17;
    if (v14)
    {
      PBCannotCopyFileError(v5, 0, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v8 = 0;
    }
    else
    {
      v10 = -[PBSecurityScopedURLWrapper initWithURL:readonly:]([PBSecurityScopedURLWrapper alloc], "initWithURL:readonly:", v12, 1);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke_4;
      v15[3] = &unk_1E2430DF0;
      v16 = v13;
      v8 = (void *)MEMORY[0x18D782EA4](v15);

      v9 = 0;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __50__PBItem_v2_addFileCopyRepresentationType_loader___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

}

- (void)addOpenInPlaceRepresentationType:(id)a3 loader:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PBItem *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  PBItemQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PBItem_addOpenInPlaceRepresentationType_loader___block_invoke;
  block[3] = &unk_1E2431680;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __50__PBItem_addOpenInPlaceRepresentationType_loader___block_invoke(uint64_t a1)
{
  PBItemRepresentation *v2;
  uint64_t v3;
  PBItemRepresentation *v4;
  _QWORD v5[4];
  id v6;

  v2 = [PBItemRepresentation alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PBItem_addOpenInPlaceRepresentationType_loader___block_invoke_2;
  v5[3] = &unk_1E2430CD8;
  v6 = *(id *)(a1 + 48);
  v4 = -[PBItemRepresentation initWithType:preferredRepresentation:v3_loader:](v2, "initWithType:preferredRepresentation:v3_loader:", v3, 2, v5);
  objc_msgSend(*(id *)(a1 + 40), "itemQueue_setItemRepresentation:", v4);

}

id __50__PBItem_addOpenInPlaceRepresentationType_loader___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__PBItem_addOpenInPlaceRepresentationType_loader___block_invoke_3;
  v10[3] = &unk_1E2431748;
  v11 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v4;
  v6(v5, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __50__PBItem_addOpenInPlaceRepresentationType_loader___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  PBSecurityScopedURLWrapper *v5;
  id v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v5 = 0;
  }
  else
  {
    v6 = a2;
    v5 = -[PBSecurityScopedURLWrapper initWithURL:readonly:]([PBSecurityScopedURLWrapper alloc], "initWithURL:readonly:", v6, 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)v2_addRepresentationType:(id)a3 preferredRepresentation:(unint64_t)a4 loader:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  PBItem *v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  PBItemQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PBItem_v2_addRepresentationType_preferredRepresentation_loader___block_invoke;
  block[3] = &unk_1E2431770;
  v16 = v9;
  v17 = a4;
  v14 = v8;
  v15 = self;
  v11 = v9;
  v12 = v8;
  dispatch_sync(v10, block);

}

void __66__PBItem_v2_addRepresentationType_preferredRepresentation_loader___block_invoke(uint64_t a1)
{
  PBItemRepresentation *v2;
  uint64_t v3;
  uint64_t v4;
  PBItemRepresentation *v5;
  _QWORD v6[4];
  id v7;

  v2 = [PBItemRepresentation alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PBItem_v2_addRepresentationType_preferredRepresentation_loader___block_invoke_2;
  v6[3] = &unk_1E2430CD8;
  v4 = *(_QWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  v5 = -[PBItemRepresentation initWithType:preferredRepresentation:v3_loader:](v2, "initWithType:preferredRepresentation:v3_loader:", v3, v4, v6);
  objc_msgSend(*(id *)(a1 + 40), "itemQueue_setItemRepresentation:", v5);

}

id __66__PBItem_v2_addRepresentationType_preferredRepresentation_loader___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__PBItem_v2_addRepresentationType_preferredRepresentation_loader___block_invoke_3;
  v10[3] = &unk_1E2430C88;
  v11 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v4;
  v6(v5, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __66__PBItem_v2_addRepresentationType_preferredRepresentation_loader___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addRepresentationType:(id)a3 loader:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__PBItem_addRepresentationType_loader___block_invoke;
  v8[3] = &unk_1E24317C0;
  v9 = v6;
  v7 = v6;
  -[PBItem v2_addRepresentationType:preferredRepresentation:loader:](self, "v2_addRepresentationType:preferredRepresentation:loader:", a3, 0, v8);

}

id __39__PBItem_addRepresentationType_loader___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *);
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__PBItem_addRepresentationType_loader___block_invoke_2;
  v9[3] = &unk_1E2431798;
  v10 = v3;
  v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
  v6 = v3;
  v5(v4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __39__PBItem_addRepresentationType_loader___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addRepresentationType:(id)a3 preferredRepresentation:(unint64_t)a4 loader:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PBItem_addRepresentationType_preferredRepresentation_loader___block_invoke;
  v10[3] = &unk_1E24317C0;
  v11 = v8;
  v9 = v8;
  -[PBItem v2_addRepresentationType:preferredRepresentation:loader:](self, "v2_addRepresentationType:preferredRepresentation:loader:", a3, a4, v10);

}

id __63__PBItem_addRepresentationType_preferredRepresentation_loader___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *);
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__PBItem_addRepresentationType_preferredRepresentation_loader___block_invoke_2;
  v9[3] = &unk_1E2431798;
  v10 = v3;
  v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
  v6 = v3;
  v5(v4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __63__PBItem_addRepresentationType_preferredRepresentation_loader___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)itemQueue_registerLocalAvailableDerivedRepresentations
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD v13[4];
  id v14;
  PBItem *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[PBCoercionRegistry defaultRegistry](PBCoercionRegistry, "defaultRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](self->_itemQueue_typeOrder, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_itemQueue_representationByType, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v9;
        v13[1] = 3221225472;
        v13[2] = __64__PBItem_itemQueue_registerLocalAvailableDerivedRepresentations__block_invoke;
        v13[3] = &unk_1E24317E8;
        v14 = v5;
        v15 = self;
        objc_msgSend(v3, "enumerateAvailableCoercionLoaderBlocksForRepresentation:usingBlock:", v11, v13);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

void __64__PBItem_itemQueue_registerLocalAvailableDerivedRepresentations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PBItemRepresentation *v7;
  PBItemRepresentation *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
  {
    v7 = [PBItemRepresentation alloc];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__PBItem_itemQueue_registerLocalAvailableDerivedRepresentations__block_invoke_2;
    v9[3] = &unk_1E2430CD8;
    v10 = v6;
    v8 = -[PBItemRepresentation initWithType:preferredRepresentation:v3_loader:](v7, "initWithType:preferredRepresentation:v3_loader:", v5, 0, v9);
    -[PBItemRepresentation setDerivedRepresentation:](v8, "setDerivedRepresentation:", 1);
    objc_msgSend(*(id *)(a1 + 40), "itemQueue_setItemRepresentation:", v8);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
}

id __64__PBItem_itemQueue_registerLocalAvailableDerivedRepresentations__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__PBItem_itemQueue_registerLocalAvailableDerivedRepresentations__block_invoke_3;
  v10[3] = &unk_1E2431658;
  v11 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v4;
  v6(v5, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __64__PBItem_itemQueue_registerLocalAvailableDerivedRepresentations__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)itemQueue_removeRepresentationOfType:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->_itemQueue_typeOrder, "containsObject:"))
  {
    -[NSMutableOrderedSet removeObject:](self->_itemQueue_typeOrder, "removeObject:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_itemQueue_representationByType, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_itemQueue_preferredRepresentationByType, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_itemQueue_visibilityByType, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_itemQueue_dataAvailabilityByType, "removeObjectForKey:", v4);
  }

}

- (void)_addRepresentationType:(id)a3 loaderBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PBItem *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  PBItemQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PBItem__addRepresentationType_loaderBlock___block_invoke;
  block[3] = &unk_1E2431680;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __45__PBItem__addRepresentationType_loaderBlock___block_invoke(uint64_t a1)
{
  PBItemRepresentation *v2;
  uint64_t v3;
  PBItemRepresentation *v4;
  _QWORD v5[4];
  id v6;

  v2 = [PBItemRepresentation alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PBItem__addRepresentationType_loaderBlock___block_invoke_2;
  v5[3] = &unk_1E2430CD8;
  v6 = *(id *)(a1 + 48);
  v4 = -[PBItemRepresentation initWithType:preferredRepresentation:v3_loader:](v2, "initWithType:preferredRepresentation:v3_loader:", v3, 0, v5);
  objc_msgSend(*(id *)(a1 + 40), "itemQueue_setItemRepresentation:", v4);

}

uint64_t __45__PBItem__addRepresentationType_loaderBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PBItem__addRepresentationType_loaderBlock___block_invoke_3;
  v9[3] = &unk_1E2431568;
  v10 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v4;
  v6(v5, v9);

  return 0;
}

uint64_t __45__PBItem__addRepresentationType_loaderBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeRepresentationOfType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PBItem_removeRepresentationOfType___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __37__PBItem_removeRepresentationOfType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemQueue_removeRepresentationOfType:", *(_QWORD *)(a1 + 40));
}

- (BOOL)itemQueue_hasRepresentationOfType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PBItem itemQueue_typeOrder](self, "itemQueue_typeOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (int64_t)visibilityForType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__PBItem_visibilityForType___block_invoke;
  block[3] = &unk_1E2431810;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __28__PBItem_visibilityForType___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "unsignedIntegerValue");

}

- (BOOL)hasRepresentationOfType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PBItem_hasRepresentationOfType___block_invoke;
  block[3] = &unk_1E2431810;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __34__PBItem_hasRepresentationOfType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_hasRepresentationOfType:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)itemQueue_hasRepresentationConformingToType:(id)a3
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PBItem itemQueue_typeOrder](self, "itemQueue_typeOrder", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (UTTypeConformsTo(*(CFStringRef *)(*((_QWORD *)&v10 + 1) + 8 * i), v4))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasRepresentationConformingToType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PBItem_hasRepresentationConformingToType___block_invoke;
  block[3] = &unk_1E2431810;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __44__PBItem_hasRepresentationConformingToType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_hasRepresentationConformingToType:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)itemQueue_canInstantiateObjectOfClass:(Class)a3 excludingCoercionsFromTypes:(id)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PBItem itemQueue_localObject](self, "itemQueue_localObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    +[PBCoercionRegistry defaultRegistry](PBCoercionRegistry, "defaultRegistry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[PBItem itemQueue_typeOrder](self, "itemQueue_typeOrder", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v6, "containsObject:", v16) & 1) == 0
            && (objc_msgSend(v10, "canCoerceFromRepresentationConformingToType:toObjectOfClass:", v16, a3) & 1) != 0)
          {
            v9 = 1;
            goto LABEL_14;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v13)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_14:

  }
  return v9;
}

- (BOOL)_canInstantiateObjectOfClass:(Class)a3
{
  return -[PBItem _canInstantiateObjectOfClass:excludingCoercionsFromTypes:](self, "_canInstantiateObjectOfClass:excludingCoercionsFromTypes:", a3, 0);
}

- (BOOL)_canInstantiateObjectOfClass:(Class)a3 excludingCoercionsFromTypes:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  Class v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  PBItemQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PBItem__canInstantiateObjectOfClass_excludingCoercionsFromTypes___block_invoke;
  v10[3] = &unk_1E2431838;
  v12 = &v14;
  v13 = a3;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(self) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __67__PBItem__canInstantiateObjectOfClass_excludingCoercionsFromTypes___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_canInstantiateObjectOfClass:excludingCoercionsFromTypes:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_representationForType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PBItem__representationForType___block_invoke;
  block[3] = &unk_1E2431810;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __33__PBItem__representationForType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_representationForType:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_loadObjectOfClass:(Class)a3 context:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD *v31;
  Class v32;
  _QWORD block[4];
  id v34;
  PBItem *v35;
  _QWORD *v36;
  __int128 *p_buf;
  Class v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t v44[4];
  void *v45;
  __int16 v46;
  id v47;
  __int128 buf;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[PBItem localObject](self, "localObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[PBCoercionRegistry defaultRegistry](PBCoercionRegistry, "defaultRegistry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__1;
    v51 = __Block_byref_object_dispose__1;
    v52 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__1;
    v39[4] = __Block_byref_object_dispose__1;
    v40 = 0;
    PBItemQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_2;
    block[3] = &unk_1E2431860;
    v18 = v15;
    p_buf = &buf;
    v38 = a3;
    v34 = v18;
    v35 = self;
    v36 = v39;
    dispatch_sync(v16, block);

    v19 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v19)
    {
      v28[0] = v17;
      v28[1] = 3221225472;
      v28[2] = __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_3;
      v28[3] = &unk_1E24318B0;
      v29 = v18;
      v31 = v39;
      v32 = a3;
      v30 = v9;
      objc_msgSend(v19, "loadDataWithContext:completion:", v8, v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v29;
    }
    else
    {
      PBCannotInstantiateObjectOfClassError(a3, 0, 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      _PBLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(a3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v44 = 138412546;
        v45 = v24;
        v46 = 2112;
        v47 = v21;
        _os_log_error_impl(&dword_18C53A000, v22, OS_LOG_TYPE_ERROR, "There are no representations available to instantiate a class of type %@: %@", v44, 0x16u);

      }
      if (v9)
      {
        v25[0] = v17;
        v25[1] = 3221225472;
        v25[2] = __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_46;
        v25[3] = &unk_1E24315B8;
        v27 = v9;
        v21 = v21;
        v26 = v21;
        PBDispatchAsyncCallback(v25);

      }
      v20 = 0;
    }

    v14 = v20;
    _Block_object_dispose(v39, 8);

    _Block_object_dispose(&buf, 8);
    v13 = v14;
    goto LABEL_15;
  }
  _PBLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    NSStringFromClass(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_18C53A000, v11, OS_LOG_TYPE_INFO, "Returning local object of class %@", (uint8_t *)&buf, 0xCu);

  }
  if (v9)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke;
    v41[3] = &unk_1E24315B8;
    v43 = v9;
    v42 = v10;
    PBDispatchAsyncCallback(v41);

    v13 = 0;
    v14 = v43;
LABEL_15:

    goto LABEL_16;
  }
  v13 = 0;
LABEL_16:

  return v13;
}

uint64_t __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0);
}

void __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "acceptableRepresentationTypesForCreatingObjectOfClass:", *(_QWORD *)(a1 + 64));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "itemQueue_availableTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _bestMatchTypes(v9, v2, &__block_literal_global_11);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "itemQueue_representationForType:");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_3(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11 = 0;
    v12 = v9;
    goto LABEL_9;
  }
  if (!v7)
  {
    v16 = 0;
    goto LABEL_7;
  }
  v13 = (void *)a1[4];
  v14 = a1[7];
  v15 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v23 = 0;
  v11 = (void *)objc_msgSend(v13, "newObjectOfClass:fromData:ofType:outError:", v14, v7, v15, &v23);
  v16 = v23;
  if (!v11)
  {
LABEL_7:
    PBCannotInstantiateObjectOfClassError((objc_class *)a1[7], *(void **)(*(_QWORD *)(a1[6] + 8) + 40), v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    goto LABEL_8;
  }
  v12 = 0;
LABEL_8:

LABEL_9:
  v17 = (void *)a1[5];
  if (v17)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_4;
    v18[3] = &unk_1E2431888;
    v22 = v17;
    v19 = v11;
    v20 = v8;
    v21 = v12;
    PBDispatchAsyncCallback(v18);

  }
}

uint64_t __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __53__PBItem__loadObjectOfClass_context_completionBlock___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (id)loadObjectOfClass:(Class)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__PBItem_loadObjectOfClass_completionBlock___block_invoke;
  v10[3] = &unk_1E24318D8;
  v11 = v6;
  v7 = v6;
  -[PBItem _loadObjectOfClass:context:completionBlock:](self, "_loadObjectOfClass:context:completionBlock:", a3, 0, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __44__PBItem_loadObjectOfClass_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)uikit_loadObjectOfClass:(Class)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__PBItem_uikit_loadObjectOfClass_completionBlock___block_invoke;
  v10[3] = &unk_1E24318D8;
  v11 = v6;
  v7 = v6;
  -[PBItem _loadObjectOfClass:context:completionBlock:](self, "_loadObjectOfClass:context:completionBlock:", a3, 0, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __50__PBItem_uikit_loadObjectOfClass_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)uikit_v2_loadObjectOfClass:(Class)a3 completionBlock:(id)a4
{
  return -[PBItem _loadObjectOfClass:context:completionBlock:](self, "_loadObjectOfClass:context:completionBlock:", a3, 0, a4);
}

- (void)_loadRepresentationAsType:(id)a3 context:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PBItem representationConformingToType:](self, "representationConformingToType:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__PBItem__loadRepresentationAsType_context_completionBlock___block_invoke;
    v17[3] = &unk_1E2430F58;
    v12 = &v18;
    v18 = v10;
    v13 = (id)objc_msgSend(v11, "loadDataWithContext:completion:", v9, v17);
LABEL_5:

    goto LABEL_6;
  }
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__PBItem__loadRepresentationAsType_context_completionBlock___block_invoke_3;
    v14[3] = &unk_1E24315B8;
    v12 = &v16;
    v16 = v10;
    v15 = v8;
    PBDispatchAsyncCallback(v14);

    goto LABEL_5;
  }
LABEL_6:

}

void __60__PBItem__loadRepresentationAsType_context_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PBItem__loadRepresentationAsType_context_completionBlock___block_invoke_2;
    v11[3] = &unk_1E2431888;
    v15 = v10;
    v12 = v7;
    v13 = v8;
    v14 = v9;
    PBDispatchAsyncCallback(v11);

  }
}

uint64_t __60__PBItem__loadRepresentationAsType_context_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], 0, a1[5], a1[6]);
}

void __60__PBItem__loadRepresentationAsType_context_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  PBTypeNotFoundError(*(_QWORD *)(a1 + 32), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, 0, v2);

}

- (void)loadRepresentationAsType:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PBItem_loadRepresentationAsType_completionBlock___block_invoke;
  v8[3] = &unk_1E2431900;
  v9 = v6;
  v7 = v6;
  -[PBItem _loadRepresentationAsType:context:completionBlock:](self, "_loadRepresentationAsType:context:completionBlock:", a3, 0, v8);

}

uint64_t __51__PBItem_loadRepresentationAsType_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)uikit_loadRepresentationAsType:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PBItem_uikit_loadRepresentationAsType_completionBlock___block_invoke;
  v8[3] = &unk_1E2431900;
  v9 = v6;
  v7 = v6;
  -[PBItem uikit_loadRepresentationAsType:context:completionBlock:](self, "uikit_loadRepresentationAsType:context:completionBlock:", a3, 0, v8);

}

uint64_t __57__PBItem_uikit_loadRepresentationAsType_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)uikit_v2_loadRepresentationAsType:(id)a3 completionBlock:(id)a4
{
  -[PBItem _loadRepresentationAsType:context:completionBlock:](self, "_loadRepresentationAsType:context:completionBlock:", a3, 0, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBItem)initWithCoder:(id)a3
{
  id v4;
  PBItem *v5;
  PBItem *v6;
  uint64_t v7;
  NSUUID *UUID;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableOrderedSet *itemQueue_typeOrder;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *itemQueue_preferredRepresentationByType;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSMutableDictionary *itemQueue_visibilityByType;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSMutableDictionary *itemQueue_dataAvailabilityByType;
  void *v36;
  uint64_t v37;
  NSDictionary *itemQueue_metadata;
  void *v39;
  uint64_t v40;
  NSDictionary *itemQueue_privateMetadata;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PBItem;
  v5 = -[PBItem init](&v43, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PBItem _commonInitGenerateUUID:](v5, "_commonInitGenerateUUID:", 0);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("typeOrder"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      itemQueue_typeOrder = v6->_itemQueue_typeOrder;
      v6->_itemQueue_typeOrder = (NSMutableOrderedSet *)v13;

    }
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("preferredRepresentation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "mutableCopy");
    itemQueue_preferredRepresentationByType = v6->_itemQueue_preferredRepresentationByType;
    v6->_itemQueue_preferredRepresentationByType = (NSMutableDictionary *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("visibility"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "mutableCopy");
    itemQueue_visibilityByType = v6->_itemQueue_visibilityByType;
    v6->_itemQueue_visibilityByType = (NSMutableDictionary *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("dataAvailability"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "mutableCopy");
    itemQueue_dataAvailabilityByType = v6->_itemQueue_dataAvailabilityByType;
    v6->_itemQueue_dataAvailabilityByType = (NSMutableDictionary *)v34;

    PBAllowedMetadataClasses();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("metadata"));
    v37 = objc_claimAutoreleasedReturnValue();
    itemQueue_metadata = v6->_itemQueue_metadata;
    v6->_itemQueue_metadata = (NSDictionary *)v37;

    PBAllowedMetadataClasses();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("privateMetadata"));
    v40 = objc_claimAutoreleasedReturnValue();
    itemQueue_privateMetadata = v6->_itemQueue_privateMetadata;
    v6->_itemQueue_privateMetadata = (NSDictionary *)v40;

    v6->_itemQueue_isStoredOnServer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isStoredOnServer"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *UUID;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[12];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v4 = a3;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__1;
  v52 = __Block_byref_object_dispose__1;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__1;
  v46 = __Block_byref_object_dispose__1;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__PBItem_encodeWithCoder___block_invoke;
  block[3] = &unk_1E2431928;
  block[4] = self;
  block[5] = &v48;
  block[6] = &v42;
  block[7] = &v36;
  block[8] = &v30;
  block[9] = &v24;
  block[10] = &v18;
  block[11] = &v14;
  dispatch_sync(v5, block);

  UUID = self->_UUID;
  if (UUID)
    objc_msgSend(v4, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  v7 = v49[5];
  if (v7)
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("typeOrder"));
  v8 = v43[5];
  if (v8)
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("preferredRepresentation"));
  v9 = v37[5];
  if (v9)
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("visibility"));
  v10 = v31[5];
  if (v10)
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("dataAvailability"));
  v11 = v25[5];
  if (v11)
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("metadata"));
  v12 = v19[5];
  if (v12)
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("privateMetadata"));
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)v15 + 24), CFSTR("isStoredOnServer"));
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
}

uint64_t __26__PBItem_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "array");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_privateMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copy");
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_isStoredOnServer");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = result;
  return result;
}

- (void)itemQueue_setDataTransferDelegate:(id)a3
{
  id v4;
  PBItem *v5;
  PBItem *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
    v5 = self;
  else
    v5 = 0;
  v6 = v5;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allValues](self->_itemQueue_representationByType, "allValues", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setDataTransferDelegate:", v6);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  objc_storeWeak((id *)&self->_itemQueue_dataTransferDelegate, v4);
}

- (void)setDataTransferDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PBItem_setDataTransferDelegate___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __34__PBItem_setDataTransferDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemQueue_setDataTransferDelegate:", *(_QWORD *)(a1 + 40));
}

- (PBItemDataTransferDelegate)dataTransferDelegate
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__PBItem_dataTransferDelegate__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PBItemDataTransferDelegate *)v4;
}

void __30__PBItem_dataTransferDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)itemRepresentation:(id)a3 beganDataTransferWithProgress:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PBItem dataTransferDelegate](self, "dataTransferDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "item:representation:beganDataTransferWithProgress:", self, v7, v6);

}

- (void)itemRepresentationFinishedDataTransfer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PBItem dataTransferDelegate](self, "dataTransferDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item:representationFinishedDataTransfer:", self, v4);

}

- (id)enumeratePatternDetectionsForPatterns:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSMutableDictionary *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  NSMutableDictionary *v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = self->_itemQueue_patternDetections;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  PBItemQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__PBItem_enumeratePatternDetectionsForPatterns_usingBlock___block_invoke;
  v18[3] = &unk_1E2431950;
  v19 = v6;
  v20 = v8;
  v22 = v7;
  v11 = v9;
  v21 = v11;
  v12 = v7;
  v13 = v8;
  v14 = v6;
  dispatch_sync(v10, v18);

  v15 = v21;
  v16 = v11;

  return v16;
}

void __59__PBItem_enumeratePatternDetectionsForPatterns_usingBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7, (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        else
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)addPatternDetections:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSObject *v6;
  id v7;
  NSMutableDictionary *v8;
  _QWORD block[4];
  NSMutableDictionary *v10;
  id v11;
  PBItem *v12;

  v4 = a3;
  v5 = self->_itemQueue_patternDetections;
  PBItemQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PBItem_addPatternDetections___block_invoke;
  block[3] = &unk_1E2431978;
  v10 = v5;
  v11 = v4;
  v12 = self;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __31__PBItem_addPatternDetections___block_invoke(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "addEntriesFromDictionary:", a1[5]);
  _PBLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = objc_msgSend(a1[5], "count");
    objc_msgSend(a1[6], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 134218242;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_debug_impl(&dword_18C53A000, v2, OS_LOG_TYPE_DEBUG, "Cached %lu detected patterns on item with UUID %@", (uint8_t *)&v5, 0x16u);

  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PBItem;
  -[PBItem description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PBItem UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\nUUID    : %@\n"), v5);

  -[PBItem metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Metadata: %@\n"), v6);

  -[PBItem availableTypes](self, "availableTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Types:\n%@\n"), v7);

  return (NSString *)v4;
}

- (NSData)itemQueue_primaryData
{
  return self->_itemQueue_primaryData;
}

- (void)setItemQueue_primaryData:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_primaryData, a3);
}

- (NSURL)itemQueue_primaryFileURL
{
  return self->_itemQueue_primaryFileURL;
}

- (void)setItemQueue_primaryFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_primaryFileURL, a3);
}

- (PBItemDataTransferDelegate)itemQueue_dataTransferDelegate
{
  return (PBItemDataTransferDelegate *)objc_loadWeakRetained((id *)&self->_itemQueue_dataTransferDelegate);
}

- (void)setItemQueue_dataTransferDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_itemQueue_dataTransferDelegate, a3);
}

- (NSDictionary)itemQueue_privateMetadata
{
  return self->_itemQueue_privateMetadata;
}

- (void)setItemQueue_privateMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_privateMetadata, a3);
}

- (void)setItemQueue_representationByType:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_representationByType, a3);
}

- (void)setItemQueue_typeOrder:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_typeOrder, a3);
}

- (NSMutableDictionary)itemQueue_preferredRepresentationByType
{
  return self->_itemQueue_preferredRepresentationByType;
}

- (void)setItemQueue_preferredRepresentationByType:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_preferredRepresentationByType, a3);
}

- (NSMutableDictionary)itemQueue_visibilityByType
{
  return self->_itemQueue_visibilityByType;
}

- (void)setItemQueue_visibilityByType:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_visibilityByType, a3);
}

- (NSMutableDictionary)itemQueue_dataAvailabilityByType
{
  return self->_itemQueue_dataAvailabilityByType;
}

- (void)setItemQueue_dataAvailabilityByType:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_dataAvailabilityByType, a3);
}

- (NSMutableDictionary)itemQueue_patternDetections
{
  return self->_itemQueue_patternDetections;
}

- (void)setItemQueue_patternDetections:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_patternDetections, a3);
}

- (id)itemQueue_localUserInfo
{
  return self->_itemQueue_localUserInfo;
}

- (void)setItemQueue_localUserInfo:(id)a3
{
  objc_storeStrong(&self->_itemQueue_localUserInfo, a3);
}

- (NSObject)itemQueue_localObject
{
  return self->_itemQueue_localObject;
}

- (void)setItemQueue_localObject:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_localObject, a3);
}

- (BOOL)itemQueue_isStoredOnServer
{
  return self->_itemQueue_isStoredOnServer;
}

- (void)setItemQueue_isStoredOnServer:(BOOL)a3
{
  self->_itemQueue_isStoredOnServer = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

@end
