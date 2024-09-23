@implementation PXPeopleDataSource

- (PXPeopleDataSource)initWithName:(id)a3 objectsReloadBlock:(id)a4
{
  return -[PXPeopleDataSource initWithName:objectsReloadBlock:asynchronousLoad:callbackDelegate:](self, "initWithName:objectsReloadBlock:asynchronousLoad:callbackDelegate:", a3, a4, 0, 0);
}

- (PXPeopleDataSource)initWithName:(id)a3 objectsReloadBlock:(id)a4 asynchronousLoad:(BOOL)a5 callbackDelegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  PXPeopleDataSource *v14;
  PXPeopleDataSource *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *reloadQueue;
  void *v19;
  id reloadBlock;
  uint64_t v21;
  id sortComparator;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PXPeopleDataSource;
  v14 = -[PXPeopleDataSource init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeWeak((id *)&v15->_delegate, v13);
    v15->_useAsynchronousLoad = a5;
    if (v12)
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = dispatch_queue_create("com.apple.Photos.PeopleDataSourceReloadQueue", v16);
      reloadQueue = v15->_reloadQueue;
      v15->_reloadQueue = (OS_dispatch_queue *)v17;

      v19 = _Block_copy(v12);
      reloadBlock = v15->_reloadBlock;
      v15->_reloadBlock = v19;

    }
    -[PXPeopleDataSource defaultComparator](v15, "defaultComparator");
    v21 = objc_claimAutoreleasedReturnValue();
    sortComparator = v15->_sortComparator;
    v15->_sortComparator = (id)v21;

  }
  return v15;
}

- (PXPeopleDataSource)initWithName:(id)a3 objects:(id)a4
{
  id v7;
  id v8;
  PXPeopleDataSource *v9;
  PXPeopleDataSource *v10;
  uint64_t v11;
  id sortComparator;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXPeopleDataSource;
  v9 = -[PXPeopleDataSource init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_objects, a4);
    -[PXPeopleDataSource defaultComparator](v10, "defaultComparator");
    v11 = objc_claimAutoreleasedReturnValue();
    sortComparator = v10->_sortComparator;
    v10->_sortComparator = (id)v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PXPeopleDataSource stopListeningForChanges](self, "stopListeningForChanges");
  -[PXPeopleDataSource setReloadQueue:](self, "setReloadQueue:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleDataSource;
  -[PXPeopleDataSource dealloc](&v3, sel_dealloc);
}

- (NSArray)persons
{
  void *v2;
  void *v3;

  -[PXPeopleDataSource members](self, "members");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PFMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (unint64_t)numberOfMembers
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  -[PXPeopleDataSource members](self, "members");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = -[PXPeopleDataSource maximumNumberOfMembers](self, "maximumNumberOfMembers");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  if (v5)
    return v6;
  else
    return v4;
}

- (id)memberAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[PXPeopleDataSource members](self, "members");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)personAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[PXPeopleDataSource memberAtIndex:](self, "memberAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)titleAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[PXPeopleDataSource personAtIndex:](self, "personAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)imageAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  -[PXPeopleDataSource memberAtIndex:](self, "memberAtIndex:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDataSource _asyncLoadImageForItem:targetSize:displayScale:resultHandler:](self, "_asyncLoadImageForItem:targetSize:displayScale:resultHandler:", v12, v11, width, height, a5);

}

- (unint64_t)photoQuantityAtIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[PXPeopleDataSource personAtIndex:](self, "personAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "faceCount");

  return v4;
}

- (id)localizedTitle
{
  if (-[PXPeopleDataSource isDisclosed](self, "isDisclosed"))
    -[PXPeopleDataSource localizedDisclosedTitle](self, "localizedDisclosedTitle");
  else
    -[PXPeopleDataSource localizedUndisclosedTitle](self, "localizedUndisclosedTitle");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultComparator
{
  return 0;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
  -[PXPeopleDataSource _updateMembers](self, "_updateMembers");
}

- (void)setReloadBlock:(id)a3
{
  void *v4;
  id reloadBlock;

  v4 = _Block_copy(a3);
  reloadBlock = self->_reloadBlock;
  self->_reloadBlock = v4;

}

- (void)setSortComparator:(id)a3
{
  void *v4;
  id sortComparator;

  v4 = _Block_copy(a3);
  sortComparator = self->_sortComparator;
  self->_sortComparator = v4;

  -[PXPeopleDataSource _updateMembers](self, "_updateMembers");
}

- (void)setFilterPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_filterPredicate, a3);
  -[PXPeopleDataSource _updateMembers](self, "_updateMembers");
}

- (void)_setObjectsWithoutUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (void)loadObjectsAndUpdateMembersWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void (*v6)(void *, _QWORD *);
  void *v7;
  void *v8;
  id *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);
  _QWORD v12[5];
  id v13;
  void (**v14)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[PXPeopleDataSource reloadQueue](self, "reloadQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[PXPeopleDataSource useAsynchronousLoad](self, "useAsynchronousLoad"))
      v6 = (void (*)(void *, _QWORD *))MEMORY[0x1E0C82C00];
    else
      v6 = (void (*)(void *, _QWORD *))MEMORY[0x1E0C82F90];
    -[PXPeopleDataSource reloadBlock](self, "reloadBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __64__PXPeopleDataSource_loadObjectsAndUpdateMembersWithCompletion___block_invoke;
      v12[3] = &unk_1E513DE18;
      v12[4] = self;
      v9 = &v13;
      v13 = v7;
      v14 = v4;
      v6(v5, v12);

    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __64__PXPeopleDataSource_loadObjectsAndUpdateMembersWithCompletion___block_invoke_2;
      v10[3] = &unk_1E5148CE0;
      v10[4] = self;
      v9 = (id *)&v11;
      v11 = v4;
      v6(v5, v10);
    }

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

- (void)_updateMembers
{
  void (**v3)(_QWORD);
  NSObject *v4;
  const char *label;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__PXPeopleDataSource__updateMembers__block_invoke;
  aBlock[3] = &unk_1E5149198;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PXPeopleDataSource reloadQueue](self, "reloadQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (label = dispatch_queue_get_label(0)) != 0 && !strcmp(label, "com.apple.Photos.PeopleDataSourceReloadQueue"))
  {
    v3[2](v3);
  }
  else
  {
    dispatch_sync(v4, v3);
  }

}

- (id)_itemsArrayFromObjects:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PXPersonItem *v11;
  PXPersonItem *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [PXPersonItem alloc];
        v12 = -[PXPersonItem initWithPerson:](v11, "initWithPerson:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_asyncLoadImageForItem:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6
{
  void *v7;
  void (**v8)(id, _QWORD, id, double, double, double, double);
  id v9;

  if (a6)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = (void (**)(id, _QWORD, id, double, double, double, double))a6;
    objc_msgSend(v7, "px_genericErrorWithDebugDescription:", CFSTR("Self isn't subclassed, returning a nil image: %@"), self);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v9, *(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));

  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)maximumNumberOfMembers
{
  return self->_maximumNumberOfMembers;
}

- (void)setMaximumNumberOfMembers:(unint64_t)a3
{
  self->_maximumNumberOfMembers = a3;
}

- (PXPeopleDataSourceDelegate)delegate
{
  return (PXPeopleDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)localizedDisclosedTitle
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalizedDisclosedTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)localizedUndisclosedTitle
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalizedUndisclosedTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (BOOL)isDisclosed
{
  return self->_disclosed;
}

- (void)setDisclosed:(BOOL)a3
{
  self->_disclosed = a3;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (id)sortComparator
{
  return self->_sortComparator;
}

- (NSArray)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (OS_dispatch_queue)reloadQueue
{
  return self->_reloadQueue;
}

- (void)setReloadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_reloadQueue, a3);
}

- (BOOL)useAsynchronousLoad
{
  return self->_useAsynchronousLoad;
}

- (PHFetchResult)objects
{
  return self->_objects;
}

- (id)reloadBlock
{
  return self->_reloadBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reloadBlock, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong(&self->_sortComparator, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_localizedUndisclosedTitle, 0);
  objc_storeStrong((id *)&self->_localizedDisclosedTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
}

void __36__PXPeopleDataSource__updateMembers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "objects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "filterPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v2, "filterUsingPredicate:", v8);
  objc_msgSend(*(id *)(a1 + 32), "_itemsArrayFromObjects:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sortComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  objc_msgSend(*(id *)(a1 + 32), "setMembers:", v9);

}

uint64_t __64__PXPeopleDataSource_loadObjectsAndUpdateMembersWithCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = (void *)a1[4];
  (*(void (**)(void))(a1[5] + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObjects:", v3);

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __64__PXPeopleDataSource_loadObjectsAndUpdateMembersWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateMembers");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __29__PXPeopleDataSource_persons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modelObject");
}

@end
