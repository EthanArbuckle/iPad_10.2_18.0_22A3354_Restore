@implementation PXSectionedDataSource

- (id)objectReferenceAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  int64_t item;
  int64_t subitem;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  int64_t v16;
  id v17;
  __int128 v18;
  void *v19;
  void *v21;
  _OWORD v22[2];
  __int128 v23;
  int64_t v24;
  uint64_t v25;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXSectionedDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 133, CFSTR("%@: indexPath data source identifier:%lu, does not match:%lu and is not valid for use with this data source. Convert it to ensure safe use."), self, a3->dataSourceIdentifier, -[PXSectionedDataSource identifier](self, "identifier"));

  }
  if (!a3->dataSourceIdentifier)
    goto LABEL_7;
  item = a3->item;
  if (a3->section != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = *(_OWORD *)&a3->item;
      v27 = *(_OWORD *)&a3->dataSourceIdentifier;
      v28 = v13;
      -[PXSectionedDataSource objectAtIndexPath:](self, "objectAtIndexPath:", &v27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PXSectionedDataSource objectReferenceClassForSection](self, "objectReferenceClassForSection");
      v9 = 0;
      goto LABEL_13;
    }
    subitem = a3->subitem;
LABEL_11:
    if (subitem != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_14;
    v14 = *(_OWORD *)&a3->item;
    v27 = *(_OWORD *)&a3->dataSourceIdentifier;
    v28 = v14;
    -[PXSectionedDataSource objectAtIndexPath:](self, "objectAtIndexPath:", &v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v26[1] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    -[PXSectionedDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXSectionedDataSource objectReferenceClassForItem](self, "objectReferenceClassForItem");
LABEL_13:
    v10 = 0;
    goto LABEL_15;
  }
  subitem = a3->subitem;
  if (item != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_11;
  if (subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_14:
    v15 = *(_OWORD *)&a3->item;
    v27 = *(_OWORD *)&a3->dataSourceIdentifier;
    v28 = v15;
    -[PXSectionedDataSource objectAtIndexPath:](self, "objectAtIndexPath:", &v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a3->item;
    v23 = *(_OWORD *)&a3->dataSourceIdentifier;
    v24 = v16;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
    -[PXSectionedDataSource objectAtIndexPath:](self, "objectAtIndexPath:", &v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v22[1] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    -[PXSectionedDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXSectionedDataSource objectReferenceClassForSubItem](self, "objectReferenceClassForSubItem");
    goto LABEL_15;
  }
LABEL_7:
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
LABEL_15:
  v17 = [v11 alloc];
  v18 = *(_OWORD *)&a3->item;
  v27 = *(_OWORD *)&a3->dataSourceIdentifier;
  v28 = v18;
  v19 = (void *)objc_msgSend(v17, "initWithSectionObject:itemObject:subitemObject:indexPath:", v12, v9, v10, &v27);

  return v19;
}

- (int64_t)identifier
{
  return self->_identifier;
}

+ (id)emptyDataSource
{
  return objc_alloc_init((Class)a1);
}

- (PXSectionedDataSource)init
{
  PXSectionedDataSource *result;
  signed int v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSectionedDataSource;
  result = -[PXSectionedDataSource init](&v4, sel_init);
  if (result)
  {
    do
      v3 = __ldaxr((unsigned int *)&uniqueDataSourceIdentifier);
    while (__stlxr(v3 + 1, (unsigned int *)&uniqueDataSourceIdentifier));
    result->_identifier = v3;
    result->_lastItemIndexPathCache.dataSourceIdentifier = 1;
    *(_OWORD *)&result->_totalNumberOfItemsCache = xmmword_24438BC00;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containsMultipleItemsCache, 0);
  objc_storeStrong((id *)&self->_containsAnyItemsCache, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[PXSectionedDataSource identifier](self, "identifier");
    v7 = objc_msgSend(v5, "identifier");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSectionedDataSource;
  -[PXSectionedDataSource description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" identifier:%ld numberOfSections:%ld"), -[PXSectionedDataSource identifier](self, "identifier"), -[PXSectionedDataSource numberOfSections](self, "numberOfSections"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)numberOfSections
{
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 80, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXSectionedDataSource objectAtIndexPath:]", v7);

  abort();
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 84, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXSectionedDataSource objectsInIndexPath:]", v7);

  abort();
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  PXSimpleIndexPath *result;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v6 = a4;
  v7 = v6;
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  if (v6)
  {
    objc_msgSend(v6, "indexPath");
    if (v13 == -[PXSectionedDataSource identifier](self, "identifier"))
    {
      objc_msgSend(v7, "indexPath");
LABEL_7:
      v8 = v11;
      v9 = v12;
      goto LABEL_8;
    }
  }
  else if (!-[PXSectionedDataSource identifier](self, "identifier"))
  {
    v11 = 0u;
    v12 = 0u;
    goto LABEL_7;
  }
  v8 = *(_OWORD *)PXSimpleIndexPathNull;
  v9 = *(_OWORD *)&PXSimpleIndexPathNull[16];
LABEL_8:
  *(_OWORD *)&retstr->dataSourceIdentifier = v8;
  *(_OWORD *)&retstr->item = v9;

  return result;
}

- (id)objectIDAtIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->item;
  v5[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v5[1] = v3;
  -[PXSectionedDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PXSimpleIndexPath)indexPathForObjectID:(SEL)a3
{
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  return self;
}

- (Class)objectReferenceClassForSection
{
  return (Class)objc_opt_class();
}

- (Class)objectReferenceClassForItem
{
  return (Class)objc_opt_class();
}

- (Class)objectReferenceClassForSubItem
{
  return (Class)objc_opt_class();
}

- (OS_os_log)sectionedDataSourceLog
{
  if (sectionedDataSourceLog_onceToken != -1)
    dispatch_once(&sectionedDataSourceLog_onceToken, &__block_literal_global_4588);
  return (OS_os_log *)(id)sectionedDataSourceLog_sectionedDataSourceLog;
}

- (id)objectReferenceForObjectReference:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "indexPath");
    v6 = v9;
  }
  else
  {
    v6 = 0;
  }
  if (v6 == -[PXSectionedDataSource identifier](self, "identifier"))
  {
    v7 = v5;
  }
  else
  {
    -[PXSectionedDataSource indexPathForObjectReference:](self, "indexPathForObjectReference:", v5);
    v7 = 0;
  }

  return v7;
}

- (PXSimpleIndexPath)convertIndexPath:(SEL)a3 fromSectionedDataSource:(PXSimpleIndexPath *)a4
{
  id v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  __int128 v13;
  PXSimpleIndexPath *result;
  __int128 v15;
  __int128 v16;

  v8 = a5;
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  v9 = objc_msgSend(v8, "identifier");
  if (v9 == -[PXSectionedDataSource identifier](self, "identifier"))
  {
    v10 = *(_OWORD *)&a4->item;
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&a4->dataSourceIdentifier;
    *(_OWORD *)&retstr->item = v10;
  }
  else
  {
    v11 = *(_OWORD *)&a4->item;
    v15 = *(_OWORD *)&a4->dataSourceIdentifier;
    v16 = v11;
    objc_msgSend(v8, "objectReferenceAtIndexPath:", &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSectionedDataSource indexPathForObjectReference:](self, "indexPathForObjectReference:", v12);
    v13 = v16;
    *(_OWORD *)&retstr->dataSourceIdentifier = v15;
    *(_OWORD *)&retstr->item = v13;

  }
  return result;
}

- (id)convertIndexPathSet:(id)a3 fromSectionedDataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  PXMutableIndexPathSet *v9;
  PXMutableIndexPathSet *v10;
  _QWORD v12[5];
  id v13;
  PXMutableIndexPathSet *v14;

  v6 = a3;
  v7 = a4;
  if (-[PXSectionedDataSource isEqual:](self, "isEqual:", v7))
  {
    v8 = v6;
  }
  else
  {
    v9 = objc_alloc_init(PXMutableIndexPathSet);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__PXSectionedDataSource_convertIndexPathSet_fromSectionedDataSource___block_invoke;
    v12[3] = &unk_2514D00A0;
    v12[4] = self;
    v13 = v7;
    v14 = v9;
    v10 = v9;
    objc_msgSend(v6, "enumerateItemIndexPathsUsingBlock:", v12);
    v8 = (id)-[PXMutableIndexPathSet copy](v10, "copy");

  }
  return v8;
}

- (BOOL)containsAnyItems
{
  NSNumber *containsAnyItemsCache;
  _BOOL8 v5;
  NSNumber *v6;
  NSNumber *v7;

  containsAnyItemsCache = self->_containsAnyItemsCache;
  if (containsAnyItemsCache)
    return -[NSNumber BOOLValue](containsAnyItemsCache, "BOOLValue");
  v5 = -[PXSectionedDataSource _numberOfAssetsWithMaximum:](self, "_numberOfAssetsWithMaximum:", 1) > 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v7 = self->_containsAnyItemsCache;
  self->_containsAnyItemsCache = v6;

  return v5;
}

- (BOOL)containsMultipleItems
{
  NSNumber *containsMultipleItemsCache;
  _BOOL8 v5;
  NSNumber *v6;
  NSNumber *v7;

  containsMultipleItemsCache = self->_containsMultipleItemsCache;
  if (containsMultipleItemsCache)
    return -[NSNumber BOOLValue](containsMultipleItemsCache, "BOOLValue");
  v5 = -[PXSectionedDataSource _numberOfAssetsWithMaximum:](self, "_numberOfAssetsWithMaximum:", 2) > 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v7 = self->_containsMultipleItemsCache;
  self->_containsMultipleItemsCache = v6;

  return v5;
}

- (int64_t)totalNumberOfItems
{
  int64_t totalNumberOfItemsCache;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  totalNumberOfItemsCache = self->_totalNumberOfItemsCache;
  if (totalNumberOfItemsCache == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = -[PXSectionedDataSource numberOfSections](self, "numberOfSections");
    if (v4 < 1)
    {
      totalNumberOfItemsCache = 0;
    }
    else
    {
      v5 = v4;
      v6 = 0;
      totalNumberOfItemsCache = 0;
      do
        totalNumberOfItemsCache += -[PXSectionedDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v6++);
      while (v5 != v6);
    }
    self->_totalNumberOfItemsCache = totalNumberOfItemsCache;
  }
  return totalNumberOfItemsCache;
}

- (void)enumerateItemIndexPathsStartingAtIndexPath:(PXSimpleIndexPath *)a3 reverseDirection:(BOOL)a4 usingBlock:(id)a5
{
  _QWORD *v8;
  _QWORD *v9;
  int64_t dataSourceIdentifier;
  uint64_t v11;
  int64_t section;
  int64_t v13;
  int64_t item;
  int64_t v15;
  int64_t v16;
  int64_t subitem;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  int64_t v21;
  void (*v22)(_QWORD *, _QWORD *, char *);
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  _QWORD v27[4];
  char v28;

  v26 = a4;
  v8 = a5;
  v9 = v8;
  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (!a3->dataSourceIdentifier)
    goto LABEL_25;
  if (v8)
  {
    if (dataSourceIdentifier)
    {
LABEL_4:
      if (a3->item != 0x7FFFFFFFFFFFFFFFLL && a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 240, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

    dataSourceIdentifier = a3->dataSourceIdentifier;
    if (a3->dataSourceIdentifier)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(startIndexPath)"));

  dataSourceIdentifier = a3->dataSourceIdentifier;
LABEL_6:
  if (dataSourceIdentifier != -[PXSectionedDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 242, CFSTR("%@: indexPath data source identifier:%lu, does not match:%lu and is not valid for use with this data source. Convert it to ensure safe use."), self, a3->dataSourceIdentifier, -[PXSectionedDataSource identifier](self, "identifier"));

  }
  if (v26)
    v11 = -1;
  else
    v11 = 1;
  section = a3->section;
  v13 = -[PXSectionedDataSource numberOfSections](self, "numberOfSections");
  item = a3->item;
  v28 = 0;
  if ((section & 0x8000000000000000) == 0)
  {
    v15 = v13;
    v16 = a3->dataSourceIdentifier;
    subitem = a3->subitem;
    v18 = section;
    do
    {
      if (v18 >= v15 || v28)
        break;
      v19 = -[PXSectionedDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v18);
      v20 = v19 - 1;
      if (!v26)
        v20 = 0;
      if (v18 != section)
        item = v20;
      if ((item & 0x8000000000000000) == 0)
      {
        v21 = v19;
        do
        {
          if (item >= v21)
            break;
          if (v28)
            break;
          v22 = (void (*)(_QWORD *, _QWORD *, char *))v9[2];
          v27[0] = v16;
          v27[1] = v18;
          v27[2] = item;
          v27[3] = subitem;
          v22(v9, v27, &v28);
          item += v11;
        }
        while (item >= 0);
      }
      v18 += v11;
    }
    while (v18 >= 0);
  }
LABEL_25:

}

- (void)enumerateItemIndexPathsStartingAtIndexPath:(PXSimpleIndexPath *)a3 untilEndIndexPath:(PXSimpleIndexPath *)a4 usingBlock:(id)a5
{
  id v8;
  __int128 v9;
  __int128 v10;
  id v11;
  _OWORD v12[2];
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;

  v8 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __97__PXSectionedDataSource_enumerateItemIndexPathsStartingAtIndexPath_untilEndIndexPath_usingBlock___block_invoke;
  v13[3] = &unk_2514D00C8;
  v14 = v8;
  v9 = *(_OWORD *)&a4->item;
  v15 = *(_OWORD *)&a4->dataSourceIdentifier;
  v16 = v9;
  v10 = *(_OWORD *)&a3->item;
  v12[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v12[1] = v10;
  v11 = v8;
  -[PXSectionedDataSource enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](self, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v12, 0, v13);

}

- (PXSimpleIndexPath)indexPathForIndexPath:(SEL)a3 offset:(PXSimpleIndexPath *)a4
{
  PXSimpleIndexPath *dataSourceIdentifier;
  PXSimpleIndexPath *result;
  uint64_t section;
  int64_t v13;
  uint64_t item;
  uint64_t subitem;
  void *v16;

  dataSourceIdentifier = (PXSimpleIndexPath *)a4->dataSourceIdentifier;
  result = -[PXSectionedDataSource identifier](self, "identifier");
  if (dataSourceIdentifier != result)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXSectionedDataSource.m"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  v13 = a4->dataSourceIdentifier;
  section = a4->section;
  item = a4->item;
  subitem = a4->subitem;
  if (!v13)
  {
LABEL_9:
    if (section < 0)
      goto LABEL_23;
    goto LABEL_15;
  }
  if (section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      result = -[PXSectionedDataSource numberOfSections](self, "numberOfSections");
      goto LABEL_23;
    }
    goto LABEL_11;
  }
  if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    section += a5;
    item = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_9;
  }
LABEL_11:
  if (subitem == 0x7FFFFFFFFFFFFFFFLL)
  {
    item += a5;
    subitem = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    subitem += a5;
  }
  if (section < 0)
    goto LABEL_23;
LABEL_15:
  result = -[PXSectionedDataSource numberOfSections](self, "numberOfSections");
  if (section < (uint64_t)result)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL
      || (item & 0x8000000000000000) == 0
      && (result = -[PXSectionedDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", section),
          item < (uint64_t)result))
    {
      if (subitem == 0x7FFFFFFFFFFFFFFFLL
        || (subitem & 0x8000000000000000) == 0
        && (result = -[PXSectionedDataSource numberOfSubitemsInItem:section:](self, "numberOfSubitemsInItem:section:", item, section), subitem < (uint64_t)result))
      {
        retstr->dataSourceIdentifier = v13;
        retstr->section = section;
        retstr->item = item;
        retstr->subitem = subitem;
        return result;
      }
    }
  }
LABEL_23:
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)PXSimpleIndexPathNull;
  *(_OWORD *)&retstr->item = *(_OWORD *)&PXSimpleIndexPathNull[16];
  return result;
}

- (PXSimpleIndexPath)firstSectionIndexPath
{
  PXSimpleIndexPath *result;

  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  result = -[PXSectionedDataSource numberOfSections](self, "numberOfSections");
  if ((uint64_t)result >= 1)
  {
    result = -[PXSectionedDataSource identifier](self, "identifier");
    retstr->dataSourceIdentifier = (int64_t)result;
    *(_OWORD *)&retstr->section = xmmword_24438BBE0;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (PXSimpleIndexPath)lastSectionIndexPath
{
  PXSimpleIndexPath *result;
  char *v6;

  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  result = -[PXSectionedDataSource numberOfSections](self, "numberOfSections");
  v6 = (char *)&result[-1].subitem + 7;
  if ((uint64_t)result >= 1)
  {
    result = -[PXSectionedDataSource identifier](self, "identifier");
    retstr->dataSourceIdentifier = (int64_t)result;
    retstr->section = (int64_t)v6;
    *(int64x2_t *)&retstr->item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
  return result;
}

- (PXIndexPathSet)allSectionIndexPaths
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  -[PXSectionedDataSource firstSectionIndexPath](self, "firstSectionIndexPath");
  v4 = 0u;
  v5 = 0u;
  -[PXSectionedDataSource lastSectionIndexPath](self, "lastSectionIndexPath");
  +[PXIndexPathSet indexPathSet](PXIndexPathSet, "indexPathSet");
  return (PXIndexPathSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (PXSimpleIndexPath)firstNonEmptySectionAtOrBeforeSection:(SEL)a3
{
  PXSimpleIndexPath *result;
  PXSimpleIndexPath *v9;
  PXSimpleIndexPath *dataSourceIdentifier;
  int64_t section;
  __int128 v12;
  void *v13;

  result = (PXSimpleIndexPath *)-[PXSectionedDataSource containsAnyItems](self, "containsAnyItems");
  v9 = (PXSimpleIndexPath *)PXSimpleIndexPathNull;
  if (!(_DWORD)result)
  {
LABEL_9:
    v12 = *(_OWORD *)&v9->item;
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&v9->dataSourceIdentifier;
    *(_OWORD *)&retstr->item = v12;
    return result;
  }
  dataSourceIdentifier = (PXSimpleIndexPath *)a4->dataSourceIdentifier;
  result = -[PXSectionedDataSource identifier](self, "identifier");
  if (dataSourceIdentifier != result)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXSectionedDataSource.m"), 334, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndexPath.dataSourceIdentifier == self.identifier"));

  }
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)PXSimpleIndexPathNull;
  *(_OWORD *)&retstr->item = *(_OWORD *)&PXSimpleIndexPathNull[16];
  if ((a4->section & 0x8000000000000000) == 0)
  {
    while (1)
    {
      result = -[PXSectionedDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:");
      if ((uint64_t)result > 0)
        break;
      section = a4->section;
      a4->section = section - 1;
      if (section <= 0)
        return result;
    }
    v9 = a4;
    goto LABEL_9;
  }
  return result;
}

- (PXSimpleIndexPath)firstItemIndexPath
{
  PXSimpleIndexPath *v4;
  PXSimpleIndexPath *v5;
  int64_t v6;
  __int128 v7;
  __int128 v8;

  v4 = self + 1;
  if (self[1].dataSourceIdentifier == 1)
  {
    v5 = self;
    *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
    self = (PXSimpleIndexPath *)-[PXSimpleIndexPath containsAnyItems](self, "containsAnyItems");
    if ((_DWORD)self)
    {
      self = (PXSimpleIndexPath *)-[PXSimpleIndexPath numberOfSections](v5, "numberOfSections");
      if ((uint64_t)self >= 1)
      {
        v6 = 0;
        while (-[PXSimpleIndexPath numberOfItemsInSection:](v5, "numberOfItemsInSection:", v6) < 1)
        {
          ++v6;
          self = (PXSimpleIndexPath *)-[PXSimpleIndexPath numberOfSections](v5, "numberOfSections");
          if (v6 >= (uint64_t)self)
            goto LABEL_10;
        }
        self = (PXSimpleIndexPath *)-[PXSimpleIndexPath identifier](v5, "identifier");
        retstr->dataSourceIdentifier = (int64_t)self;
        retstr->section = v6;
        *(_OWORD *)&retstr->item = xmmword_24438BBE0;
      }
    }
LABEL_10:
    v8 = *(_OWORD *)&retstr->item;
    *(_OWORD *)&v4->dataSourceIdentifier = *(_OWORD *)&retstr->dataSourceIdentifier;
    *(_OWORD *)&v4->item = v8;
  }
  else
  {
    v7 = *(_OWORD *)&self[1].item;
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&v4->dataSourceIdentifier;
    *(_OWORD *)&retstr->item = v7;
  }
  return self;
}

- (PXSimpleIndexPath)lastItemIndexPath
{
  PXSimpleIndexPath *v4;
  PXSimpleIndexPath *v5;
  int64_t v6;
  char *v8;
  __int128 v9;
  __int128 v10;

  v4 = self + 2;
  if (self[2].dataSourceIdentifier == 1)
  {
    v5 = self;
    *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
    self = (PXSimpleIndexPath *)-[PXSimpleIndexPath containsAnyItems](self, "containsAnyItems");
    if ((_DWORD)self)
    {
      self = (PXSimpleIndexPath *)-[PXSimpleIndexPath numberOfSections](v5, "numberOfSections");
      v6 = (int64_t)self;
      while (v6-- >= 1)
      {
        self = (PXSimpleIndexPath *)-[PXSimpleIndexPath numberOfItemsInSection:](v5, "numberOfItemsInSection:", v6);
        v8 = (char *)&self[-1].subitem + 7;
        if ((uint64_t)self >= 1)
        {
          self = (PXSimpleIndexPath *)-[PXSimpleIndexPath identifier](v5, "identifier");
          retstr->dataSourceIdentifier = (int64_t)self;
          retstr->section = v6;
          retstr->item = (int64_t)v8;
          retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
          break;
        }
      }
    }
    v9 = *(_OWORD *)&retstr->item;
    *(_OWORD *)&v4->dataSourceIdentifier = *(_OWORD *)&retstr->dataSourceIdentifier;
    *(_OWORD *)&v4->item = v9;
  }
  else
  {
    v10 = *(_OWORD *)&self[2].item;
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&v4->dataSourceIdentifier;
    *(_OWORD *)&retstr->item = v10;
  }
  return self;
}

- (PXIndexPathSet)allItemIndexPaths
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  -[PXSectionedDataSource firstItemIndexPath](self, "firstItemIndexPath");
  v4 = 0u;
  v5 = 0u;
  -[PXSectionedDataSource lastItemIndexPath](self, "lastItemIndexPath");
  +[PXIndexPathSet indexPathSet](PXIndexPathSet, "indexPathSet");
  return (PXIndexPathSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (PXIndexPathSet)allIndexPaths
{
  void *v3;
  void *v4;
  void *v5;

  +[PXIndexPathSet indexPathSet](PXMutableIndexPathSet, "indexPathSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSource allSectionIndexPaths](self, "allSectionIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionIndexPathSet:", v4);

  -[PXSectionedDataSource allItemIndexPaths](self, "allItemIndexPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionIndexPathSet:", v5);

  return (PXIndexPathSet *)v3;
}

- (id)itemsEnumeratorForIndexPaths:(id)a3
{
  id v4;
  PXSectionedDataSourceEnumerator *v5;

  v4 = a3;
  v5 = -[PXSectionedDataSourceEnumerator initWithDataSource:indexPathSet:enumeratedTypes:]([PXSectionedDataSourceEnumerator alloc], "initWithDataSource:indexPathSet:enumeratedTypes:", self, v4, 2);

  return v5;
}

- (PXFastEnumeration)allItemsEnumerator
{
  void *v3;
  void *v4;

  -[PXSectionedDataSource allItemIndexPaths](self, "allItemIndexPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSource itemsEnumeratorForIndexPaths:](self, "itemsEnumeratorForIndexPaths:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXFastEnumeration *)v4;
}

- (id)sectionsEnumeratorForIndexPaths:(id)a3
{
  id v4;
  PXSectionedDataSourceEnumerator *v5;

  v4 = a3;
  v5 = -[PXSectionedDataSourceEnumerator initWithDataSource:indexPathSet:enumeratedTypes:]([PXSectionedDataSourceEnumerator alloc], "initWithDataSource:indexPathSet:enumeratedTypes:", self, v4, 1);

  return v5;
}

- (PXFastEnumeration)allSectionsEnumerator
{
  void *v3;
  void *v4;

  -[PXSectionedDataSource allSectionIndexPaths](self, "allSectionIndexPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSource sectionsEnumeratorForIndexPaths:](self, "sectionsEnumeratorForIndexPaths:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXFastEnumeration *)v4;
}

- (id)objectsEnumeratorForIndexPaths:(id)a3
{
  id v4;
  PXSectionedDataSourceEnumerator *v5;

  v4 = a3;
  v5 = -[PXSectionedDataSourceEnumerator initWithDataSource:indexPathSet:enumeratedTypes:]([PXSectionedDataSourceEnumerator alloc], "initWithDataSource:indexPathSet:enumeratedTypes:", self, v4, 7);

  return v5;
}

- (PXFastEnumeration)allObjectsEnumerator
{
  void *v3;
  void *v4;

  -[PXSectionedDataSource allIndexPaths](self, "allIndexPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSource objectsEnumeratorForIndexPaths:](self, "objectsEnumeratorForIndexPaths:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXFastEnumeration *)v4;
}

- (id)indexPathSetForItemsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  int64_t section;
  int64_t item;
  void *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  void *v16;
  void *v17;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXSectionedDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (!a3->dataSourceIdentifier)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsSection(indexPath) || PXSimpleIndexPathIsItem(indexPath)"));

    section = a3->section;
    item = a3->item;
    if (!a3->dataSourceIdentifier)
      goto LABEL_14;
    goto LABEL_10;
  }
  section = a3->section;
  item = a3->item;
  if (section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
LABEL_13:
    if (a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_14;
    goto LABEL_6;
  }
  if (item != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_13;
  item = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:
  if (section != 0x7FFFFFFFFFFFFFFFLL && item == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = -[PXSectionedDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", section);
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXIndexPathSet indexPathSetWithItemIndexes:dataSourceIdentifier:section:](PXIndexPathSet, "indexPathSetWithItemIndexes:dataSourceIdentifier:section:", v11, -[PXSectionedDataSource identifier](self, "identifier"), section);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_14:
  if (section == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 437, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.section != NSNotFound"));

    section = a3->section;
    item = a3->item;
  }
  v13 = -[PXSectionedDataSource numberOfSubitemsInItem:section:](self, "numberOfSubitemsInItem:section:", item, section);
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXIndexPathSet indexPathSetWithSubitemIndexes:dataSourceIdentifier:section:item:](PXIndexPathSet, "indexPathSetWithSubitemIndexes:dataSourceIdentifier:section:item:", v11, -[PXSectionedDataSource identifier](self, "identifier"), section, item);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v14 = (void *)v12;

  return v14;
}

- (id)itemIndexPathsForSections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  +[PXIndexPathSet indexPathSet](PXMutableIndexPathSet, "indexPathSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__PXSectionedDataSource_itemIndexPathsForSections___block_invoke;
  v10[3] = &unk_2514D00F0;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "enumerateSectionIndexPathsUsingBlock:", v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

- (id)indexPathSetFromIndexPath:(PXSimpleIndexPath *)a3 toIndexPath:(PXSimpleIndexPath *)a4
{
  int64_t v8;
  int64_t dataSourceIdentifier;
  int64_t v10;
  int64_t item;
  BOOL v12;
  int64_t section;
  int64_t v14;
  int64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int64_t v19;
  int64_t subitem;
  int64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;
  int64_t v32;
  uint64_t v33;
  int64_t v34;
  int64_t v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  PXMutableIndexPathSet *v44;
  _QWORD v45[6];
  _QWORD v46[6];
  _QWORD v47[4];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  v44 = objc_alloc_init(PXMutableIndexPathSet);
  v8 = -[PXSectionedDataSource identifier](self, "identifier");
  if (!a3->dataSourceIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 463, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!PXSimpleIndexPathIsNull(fromIndexPath)"));

  }
  if (!a4->dataSourceIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 464, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!PXSimpleIndexPathIsNull(toIndexPath)"));

  }
  if (a3->dataSourceIdentifier != v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 465, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromIndexPath.dataSourceIdentifier == dataSourceIdentifier"));

  }
  dataSourceIdentifier = v8;
  if (a4->dataSourceIdentifier != v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 466, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toIndexPath.dataSourceIdentifier == dataSourceIdentifier"));

    dataSourceIdentifier = a4->dataSourceIdentifier;
  }
  v10 = a3->dataSourceIdentifier;
  item = a3->item;
  v12 = a3->dataSourceIdentifier < dataSourceIdentifier;
  if (a3->dataSourceIdentifier != dataSourceIdentifier
    || (section = a3->section, v14 = a4->section, v12 = section < v14, section != v14)
    || (v15 = a4->item, v12 = item < v15, item != v15))
  {
    if (v12)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (a3->subitem > a4->subitem)
  {
LABEL_15:
    v17 = *(_OWORD *)&a4->dataSourceIdentifier;
    v16 = *(_OWORD *)&a4->item;
    v18 = *(_OWORD *)&a3->item;
    *(_OWORD *)&a4->dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&a4->item = v18;
    *(_OWORD *)&a3->dataSourceIdentifier = v17;
    *(_OWORD *)&a3->item = v16;
    v10 = a3->dataSourceIdentifier;
    item = a3->item;
  }
LABEL_16:
  if (!v10)
    return v44;
  v19 = a3->section;
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    subitem = a3->subitem;
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (subitem == 0x7FFFFFFFFFFFFFFFLL)
        return v44;
      v21 = a4->dataSourceIdentifier;
      goto LABEL_42;
    }
  }
  else
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!a4->dataSourceIdentifier || a4->section == 0x7FFFFFFFFFFFFFFFLL || a4->item != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 476, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsSection(toIndexPath)"));

      }
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __63__PXSectionedDataSource_indexPathSetFromIndexPath_toIndexPath___block_invoke;
      v47[3] = &__block_descriptor_96_e27_v16__0__NSMutableIndexSet_8l;
      v22 = *(_OWORD *)&a3->item;
      v48 = *(_OWORD *)&a3->dataSourceIdentifier;
      v49 = v22;
      v23 = *(_OWORD *)&a4->item;
      v50 = *(_OWORD *)&a4->dataSourceIdentifier;
      v51 = v23;
      -[PXMutableIndexPathSet modifySectionIndexSetForDataSourceIdentifier:usingBlock:](v44, "modifySectionIndexSetForDataSourceIdentifier:usingBlock:", v8, v47);
      return v44;
    }
    subitem = a3->subitem;
  }
  v21 = a4->dataSourceIdentifier;
  if (subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_42:
    if (!v21 || a4->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 498, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsSubitem(toIndexPath)"));

      v19 = a3->section;
    }
    if (v19 <= a4->section)
    {
      v28 = MEMORY[0x24BDAC760];
      do
      {
        v29 = -[PXSectionedDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v19);
        v30 = v29 - 1;
        if (v29 >= 1)
        {
          if (a3->section == v19)
            v31 = a3->item;
          else
            v31 = 0;
          if (a4->section == v19)
            v30 = a4->item;
          if (v31 <= v30)
          {
            v32 = v30 + 1;
            do
            {
              v33 = -[PXSectionedDataSource numberOfSubitemsInItem:section:](self, "numberOfSubitemsInItem:section:", v31, v19);
              v34 = v33 - 1;
              if (v33 >= 1)
              {
                if (a3->section == v19 && v31 == a3->item)
                  v35 = a3->subitem;
                else
                  v35 = 0;
                if (a4->section == v19 && v31 == a4->item)
                  v34 = a4->subitem;
                v45[0] = v28;
                v45[1] = 3221225472;
                v45[2] = __63__PXSectionedDataSource_indexPathSetFromIndexPath_toIndexPath___block_invoke_3;
                v45[3] = &__block_descriptor_48_e27_v16__0__NSMutableIndexSet_8l;
                v45[4] = v35;
                v45[5] = v34 - v35 + 1;
                -[PXMutableIndexPathSet modifySubitemIndexSetForDataSourceIdentifier:section:item:usingBlock:](v44, "modifySubitemIndexSetForDataSourceIdentifier:section:item:usingBlock:", v8, v19, v31, v45);
              }
              ++v31;
            }
            while (v32 != v31);
          }
        }
        v12 = v19++ < a4->section;
      }
      while (v12);
    }
    return v44;
  }
  if (!v21 || a4->item == 0x7FFFFFFFFFFFFFFFLL || a4->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSource.m"), 483, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(toIndexPath)"));

    v19 = a3->section;
  }
  if (v19 <= a4->section)
  {
    v24 = MEMORY[0x24BDAC760];
    do
    {
      v25 = -[PXSectionedDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v19);
      v26 = v25 - 1;
      if (v25 >= 1)
      {
        if (v19 == a3->section)
          v27 = a3->item;
        else
          v27 = 0;
        if (v19 == a4->section)
          v26 = a4->item;
        v46[0] = v24;
        v46[1] = 3221225472;
        v46[2] = __63__PXSectionedDataSource_indexPathSetFromIndexPath_toIndexPath___block_invoke_2;
        v46[3] = &__block_descriptor_48_e27_v16__0__NSMutableIndexSet_8l;
        v46[4] = v27;
        v46[5] = v26 - v27 + 1;
        -[PXMutableIndexPathSet modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:](v44, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", v8, v19, v46);
      }
      v12 = v19++ < a4->section;
    }
    while (v12);
  }
  return v44;
}

- (id)indexPathSetForObjectIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[PXIndexPathSet indexPathSet](PXMutableIndexPathSet, "indexPathSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v14 = 0u;
        v15 = 0u;
        -[PXSectionedDataSource indexPathForObjectID:](self, "indexPathForObjectID:", v11);
        v13[0] = v14;
        v13[1] = v15;
        objc_msgSend(v5, "addIndexPath:", v13);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)objectIDsForIndexPathSet:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  SEL v13;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __50__PXSectionedDataSource_objectIDsForIndexPathSet___block_invoke;
    v11[3] = &unk_2514D0158;
    v11[4] = self;
    v13 = a2;
    v7 = v6;
    v12 = v7;
    objc_msgSend(v5, "enumerateAllIndexPathsUsingBlock:", v11);
    v8 = v12;
    v9 = v7;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSet");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)couldObjectReferenceAppear:(id)a3
{
  return 1;
}

- (id)fetchAllItemObjects
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  PXSectionedDataSource *v10;
  _BYTE v11[32];

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSource allSectionIndexPaths](self, "allSectionIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSource prefetchSections:](self, "prefetchSections:", v4);

  -[PXSectionedDataSource firstItemIndexPath](self, "firstItemIndexPath");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__PXSectionedDataSource_fetchAllItemObjects__block_invoke;
  v8[3] = &unk_2514D00F0;
  v5 = v3;
  v9 = v5;
  v10 = self;
  -[PXSectionedDataSource enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](self, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v11, 0, v8);
  v6 = v5;

  return v6;
}

- (int64_t)_numberOfAssetsWithMaximum:(int64_t)a3
{
  int64_t v5;
  _QWORD v7[6];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = -[PXSectionedDataSource identifier](self, "identifier");
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__PXSectionedDataSource__numberOfAssetsWithMaximum___block_invoke;
  v7[3] = &unk_2514D0180;
  v7[4] = &v9;
  v7[5] = a3;
  -[PXSectionedDataSource enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](self, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v8, 0, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __52__PXSectionedDataSource__numberOfAssetsWithMaximum___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) >= *(_QWORD *)(result + 40))
    *a3 = 1;
  return result;
}

void __44__PXSectionedDataSource_fetchAllItemObjects__block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v2;
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[2];

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  objc_msgSend(v2, "objectAtIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

}

void __50__PXSectionedDataSource_objectIDsForIndexPathSet___block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  objc_msgSend(v3, "objectIDAtIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

uint64_t __63__PXSectionedDataSource_indexPathSetFromIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexesInRange:");
}

uint64_t __63__PXSectionedDataSource_indexPathSetFromIndexPath_toIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexesInRange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __63__PXSectionedDataSource_indexPathSetFromIndexPath_toIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexesInRange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __51__PXSectionedDataSource_itemIndexPathsForSections___block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  objc_msgSend(v3, "indexPathSetForItemsInIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "unionIndexPathSet:", v5);

}

uint64_t __97__PXSectionedDataSource_enumerateItemIndexPathsStartingAtIndexPath_untilEndIndexPath_usingBlock___block_invoke(uint64_t a1, int64x2_t *a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _OWORD *, _BYTE *, uint64_t);
  int64x2_t v9;
  uint64_t result;
  _OWORD v11[2];

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(uint64_t (**)(uint64_t, _OWORD *, _BYTE *, uint64_t))(v7 + 16);
  v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  result = v8(v7, v11, a3, a4);
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 40), *a2), (int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 56), a2[1]))), 0xFuLL))) & 1) != 0)*a3 = 1;
  return result;
}

void *__69__PXSectionedDataSource_convertIndexPathSet_fromSectionedDataSource___block_invoke(_QWORD *a1, __int128 *a2)
{
  void *result;
  uint64_t v4;
  __int128 v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  result = (void *)a1[4];
  if (result)
  {
    v9 = 0u;
    v10 = 0u;
    v4 = a1[5];
    v5 = a2[1];
    v7 = *a2;
    v8 = v5;
    result = (void *)objc_msgSend(result, "convertIndexPath:fromSectionedDataSource:", &v7, v4);
    if ((_QWORD)v9)
    {
      v6 = (void *)a1[6];
      v7 = v9;
      v8 = v10;
      return (void *)objc_msgSend(v6, "addIndexPath:", &v7);
    }
  }
  return result;
}

void __47__PXSectionedDataSource_sectionedDataSourceLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "PXSectionedDataSource");
  v1 = (void *)sectionedDataSourceLog_sectionedDataSourceLog;
  sectionedDataSourceLog_sectionedDataSourceLog = (uint64_t)v0;

}

@end
