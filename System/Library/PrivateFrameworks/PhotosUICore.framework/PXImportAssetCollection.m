@implementation PXImportAssetCollection

- (PXImportAssetCollection)init
{
  PXImportAssetCollection *v2;
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  id v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *assetQueue;
  uint64_t v10;
  NSMutableArray *assetList;
  uint64_t v12;
  NSMutableSet *assetUUIDs;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXImportAssetCollection;
  v2 = -[PXImportAssetCollection init](&v15, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-assetQueue"), v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), v3);
    assetQueue = v2->_assetQueue;
    v2->_assetQueue = (OS_dispatch_queue *)v8;

    v10 = objc_opt_new();
    assetList = v2->_assetList;
    v2->_assetList = (NSMutableArray *)v10;

    v12 = objc_opt_new();
    assetUUIDs = v2->_assetUUIDs;
    v2->_assetUUIDs = (NSMutableSet *)v12;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSMutableArray mutableCopy](self->_assetList, "mutableCopy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[NSArray mutableCopy](self->_arrangedAssetList, "mutableCopy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = -[NSMutableSet mutableCopy](self->_assetUUIDs, "mutableCopy");
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  v11 = -[NSString copy](self->_identifier, "copy");
  v12 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v11;

  *(_BYTE *)(v4 + 41) = self->_alreadyImportedGroup;
  *(_BYTE *)(v4 + 40) = 1;
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXImportAssetCollection identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PXImportAssetCollection;
    v8 = -[PXImportAssetCollection isEqual:](&v10, sel_isEqual_, v4);
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXImportAssetCollection identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> \"%@\" (%ld items)"), v4, self, v5, -[PXImportAssetCollection numberOfItems](self, "numberOfItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addObject:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *assetQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _importDataLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[PXImportAssetCollection addObject:]";
    v12 = 2112;
    v13 = v4;
    _os_log_debug_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
  }

  assetQueue = self->_assetQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__PXImportAssetCollection_addObject___block_invoke;
  v8[3] = &unk_1E5148D08;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(assetQueue, v8);

}

- (void)addObjectsFromArray:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *assetQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  PXImportAssetCollection *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _importDataLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[PXImportAssetCollection addObjectsFromArray:]";
    v13 = 2112;
    v14 = v4;
    _os_log_debug_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
  }

  assetQueue = self->_assetQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PXImportAssetCollection_addObjectsFromArray___block_invoke;
  v8[3] = &unk_1E5148D08;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(assetQueue, v8);

}

- (void)removeObject:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *assetQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _importDataLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[PXImportAssetCollection removeObject:]";
    v12 = 2112;
    v13 = v4;
    _os_log_debug_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
  }

  assetQueue = self->_assetQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PXImportAssetCollection_removeObject___block_invoke;
  v8[3] = &unk_1E5148D08;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(assetQueue, v8);

}

- (void)removeAllObjects
{
  NSObject *v3;
  NSObject *assetQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _importDataLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[PXImportAssetCollection removeAllObjects]";
    _os_log_debug_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PXImportAssetCollection_removeAllObjects__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_sync(assetQueue, block);
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSObject *v6;
  NSObject *assetQueue;
  void *v8;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;
  NSRange v15;

  length = a3.length;
  location = a3.location;
  v14 = *MEMORY[0x1E0C80C00];
  _importDataLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v15.location = location;
    v15.length = length;
    NSStringFromRange(v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v11 = "-[PXImportAssetCollection removeObjectsInRange:]";
    v12 = 2112;
    v13 = v8;
    _os_log_debug_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);

  }
  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PXImportAssetCollection_removeObjectsInRange___block_invoke;
  block[3] = &unk_1E5149060;
  block[5] = location;
  block[6] = length;
  block[4] = self;
  dispatch_sync(assetQueue, block);
}

- (int64_t)numberOfItems
{
  NSObject *assetQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  assetQueue = self->_assetQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PXImportAssetCollection_numberOfItems__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(assetQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)arrangedObjects
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_assetQueue);
  if (self->_needsSorting)
  {
    self->_needsSorting = 0;
    v3 = (void *)-[NSMutableArray mutableCopy](self->_assetList, "mutableCopy");
    objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_12_171560);
    +[PXImportExpansionPlaceholderViewModel sharedInstance](PXImportExpansionPlaceholderViewModel, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      objc_msgSend(v3, "removeObject:", v4);
      v6 = objc_msgSend(v3, "count");
      if (v6 >= 0)
        v7 = v6;
      else
        v7 = v6 + 1;
      objc_msgSend(v3, "insertObject:atIndex:", v4, v7 >> 1);
    }
    objc_storeStrong((id *)&self->_arrangedAssetList, v3);

  }
  else
  {
    v3 = (void *)-[NSArray copy](self->_arrangedAssetList, "copy");
  }
  return v3;
}

- (void)arrangedObjects:(id)a3
{
  id v4;
  NSObject *assetQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    assetQueue = self->_assetQueue;
    block[1] = 3221225472;
    block[2] = __43__PXImportAssetCollection_arrangedObjects___block_invoke;
    block[3] = &unk_1E5148CE0;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(assetQueue, block);

    v4 = v6;
  }

}

- (id)unsortedObjects
{
  NSObject *assetQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__171555;
  v10 = __Block_byref_object_dispose__171556;
  v11 = 0;
  assetQueue = self->_assetQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PXImportAssetCollection_unsortedObjects__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(assetQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)itemAtIndex:(unint64_t)a3
{
  NSObject *assetQueue;
  NSObject *v4;
  id v5;
  uint64_t v7;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__171555;
  v13 = __Block_byref_object_dispose__171556;
  v14 = 0;
  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PXImportAssetCollection_itemAtIndex___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(assetQueue, block);
  _importDataLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = v10[5];
    *(_DWORD *)buf = 136315394;
    v16 = "-[PXImportAssetCollection itemAtIndex:]";
    v17 = 2112;
    v18 = v7;
    _os_log_debug_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
  }

  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (int64_t)indexOfItem:(id)a3
{
  id v4;
  NSObject *assetQueue;
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
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PXImportAssetCollection_indexOfItem___block_invoke;
  block[3] = &unk_1E513FD98;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(assetQueue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)localizedTitle
{
  NSObject *assetQueue;
  void *v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (-[PXImportAssetCollection alreadyImportedGroup](self, "alreadyImportedGroup"))
  {
    PLLocalizedFrameworkString();
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__171555;
    v12 = __Block_byref_object_dispose__171556;
    v13 = 0;
    assetQueue = self->_assetQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__PXImportAssetCollection_localizedTitle__block_invoke;
    v7[3] = &unk_1E5148AA8;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(assetQueue, v7);
    if (v9[5])
    {
      objc_msgSend((id)objc_opt_class(), "dayFormatter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringFromDate:", v9[5]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    _Block_object_dispose(&v8, 8);

    return v6;
  }
}

- (BOOL)px_isImportAssetCollection
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)alreadyImportedGroup
{
  return self->_alreadyImportedGroup;
}

- (void)setAlreadyImportedGroup:(BOOL)a3
{
  self->_alreadyImportedGroup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_arrangedAssetList, 0);
  objc_storeStrong((id *)&self->_assetList, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);
}

void __41__PXImportAssetCollection_localizedTitle__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "arrangedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v7;
  if (v7)
  {
    objc_msgSend(v7, "fileCreationDate");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = v7;
  }

}

void __39__PXImportAssetCollection_indexOfItem___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "arrangedObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "indexOfObject:", *(_QWORD *)(a1 + 40));

}

void __39__PXImportAssetCollection_itemAtIndex___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "arrangedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v2 < v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "arrangedObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", *(_QWORD *)(a1 + 48));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "arrangedObjects");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

void __42__PXImportAssetCollection_unsortedObjects__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __43__PXImportAssetCollection_arrangedObjects___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "arrangedObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __42__PXImportAssetCollection_arrangedObjects__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "fileCreationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileCreationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    objc_msgSend(v4, "fileName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

  }
  else
  {
    v10 = objc_msgSend(v6, "compare:", v7);
  }

  return v10;
}

uint64_t __40__PXImportAssetCollection_numberOfItems__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __48__PXImportAssetCollection_removeObjectsInRange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "arrangedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "uuid", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectsInArray:", v5);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;

}

uint64_t __43__PXImportAssetCollection_removeAllObjects__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  }
  return result;
}

void __40__PXImportAssetCollection_removeObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "containsObject:", v3);

  if ((_DWORD)v2)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  }
  else
  {
    _importDataLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 136315394;
      v9 = "-[PXImportAssetCollection removeObject:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "%s: Attempted to remove %@ from PXImportAssetCollection but it doesn't contain it.", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __47__PXImportAssetCollection_addObjectsFromArray___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    *(_QWORD *)&v5 = 136315394;
    v13 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
        objc_msgSend(v9, "uuid", v13, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v10, "containsObject:", v11);

        if ((v10 & 1) != 0)
        {
          _importDataLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            v19 = "-[PXImportAssetCollection addObjectsFromArray:]_block_invoke";
            v20 = 2112;
            v21 = v9;
            _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "%s: Attempted to add %@ to PXImportAssetCollection but it already contains it.", buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend(v9, "uuid");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v12);
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObjectsFromArray:", v2);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 40) = 1;

}

void __37__PXImportAssetCollection_addObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "containsObject:", v3);

  if ((v2 & 1) != 0)
  {
    _importDataLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 136315394;
      v9 = "-[PXImportAssetCollection addObject:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "%s: Attempted to add %@ to PXImportAssetCollection but it already contains it.", (uint8_t *)&v8, 0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  }
}

+ (id)dayFormatter
{
  if (dayFormatter_onceToken != -1)
    dispatch_once(&dayFormatter_onceToken, &__block_literal_global_171584);
  return (id)dayFormatter__dayFormatter;
}

void __39__PXImportAssetCollection_dayFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D716B0], "autoupdatingFormatterWithPreset:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dayFormatter__dayFormatter;
  dayFormatter__dayFormatter = v0;

}

@end
