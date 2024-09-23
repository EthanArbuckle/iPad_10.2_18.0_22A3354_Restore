@implementation PUStorageTipCollectionViewDataSection

- (PUStorageTipCollectionViewDataSection)initWithSizesDictionary:(id)a3 countsDictionary:(id)a4
{
  id v7;
  id v8;
  PUStorageTipCollectionViewDataSection *v9;
  void *v10;
  uint64_t v11;
  NSArray *v12;
  unint64_t v13;
  PUStorageTipListItem *v14;
  void *v15;
  PUStorageTipCollectionViewDataSection *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  PUStorageTipListItem *v21;
  void *v22;
  void *v23;
  NSArray *allItems;
  void *v26;
  id v27;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PUStorageTipCollectionViewDataSection;
  v9 = -[PXDataSection initWithOutlineObject:](&v28, sel_initWithOutlineObject_, 0);
  if (v9)
  {
    if (objc_msgSend(v7, "count"))
    {
      v10 = v7;
      v11 = objc_msgSend(v7, "count");
      if (v11 != objc_msgSend(v8, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PUStorageTipCollectionViewDataSection.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sizes.count == counts.count"));

      }
      v12 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(v10, "count"))
      {
        v13 = 0;
        v27 = v8;
        do
        {
          v14 = [PUStorageTipListItem alloc];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v15);
          v16 = v9;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "longValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[PUStorageTipListItem initWithStorageTipType:count:totalSizeInBytes:](v14, "initWithStorageTipType:count:totalSizeInBytes:", v13, v18, objc_msgSend(v20, "longValue"));

          v9 = v16;
          -[NSArray addObject:](v12, "addObject:", v21);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v16->_totalStorageSize += objc_msgSend(v23, "longValue");

          v8 = v27;
          ++v13;
        }
        while (v13 < objc_msgSend(v10, "count"));
      }
      allItems = v9->_allItems;
      v9->_allItems = v12;
      v7 = v10;
    }
    else
    {
      v9->_totalStorageSize = 0;
      allItems = v9->_allItems;
      v9->_allItems = (NSArray *)MEMORY[0x1E0C9AA60];
    }

  }
  return v9;
}

- (PUStorageTipCollectionViewDataSection)initWithZerosWithStorageTipCount:(int64_t)a3
{
  PUStorageTipCollectionViewDataSection *v4;
  NSArray *v5;
  uint64_t v6;
  PUStorageTipListItem *v7;
  NSArray *allItems;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUStorageTipCollectionViewDataSection;
  v4 = -[PXDataSection initWithOutlineObject:](&v10, sel_initWithOutlineObject_, 0);
  if (v4)
  {
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a3 >= 1)
    {
      v6 = 0;
      do
      {
        v7 = -[PUStorageTipListItem initWithStorageTipType:count:totalSizeInBytes:]([PUStorageTipListItem alloc], "initWithStorageTipType:count:totalSizeInBytes:", v6, 0, 0);
        -[NSArray addObject:](v5, "addObject:", v7);

        ++v6;
      }
      while (a3 != v6);
    }
    allItems = v4->_allItems;
    v4->_allItems = v5;

    v4->_totalStorageSize = 0;
  }
  return v4;
}

- (PUStorageTipCollectionViewDataSection)initWithOutlineObject:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUStorageTipCollectionViewDataSection.m"), 64, CFSTR("%s is not available as initializer"), "-[PUStorageTipCollectionViewDataSection initWithOutlineObject:]");

  abort();
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[PUStorageTipCollectionViewDataSection allItems](self, "allItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)objectAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PUStorageTipCollectionViewDataSection allItems](self, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)totalStorageSize
{
  return self->_totalStorageSize;
}

- (NSArray)allItems
{
  return self->_allItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allItems, 0);
}

@end
