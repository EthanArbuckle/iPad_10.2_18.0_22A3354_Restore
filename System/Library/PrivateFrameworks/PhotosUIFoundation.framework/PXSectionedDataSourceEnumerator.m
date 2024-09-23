@implementation PXSectionedDataSourceEnumerator

- (PXSectionedDataSourceEnumerator)initWithDataSource:(id)a3 indexPathSet:(id)a4 enumeratedTypes:(unint64_t)a5
{
  id v9;
  id v10;
  PXSectionedDataSourceEnumerator *v11;
  PXSectionedDataSourceEnumerator *v12;
  uint64_t v13;
  PXIndexPathSet *indexPathSet;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXSectionedDataSourceEnumerator;
  v11 = -[PXSectionedDataSourceEnumerator init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSource, a3);
    v13 = objc_msgSend(v10, "copy");
    indexPathSet = v12->_indexPathSet;
    v12->_indexPathSet = (PXIndexPathSet *)v13;

    v12->_enumeratedTypes = a5;
    -[PXSectionedDataSourceEnumerator _setToInitialState](v12, "_setToInitialState");
  }

  return v12;
}

- (PXSectionedDataSourceEnumerator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSourceEnumerator.m"), 41, CFSTR("%s is not available as initializer"), "-[PXSectionedDataSourceEnumerator init]");

  abort();
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXSectionedDataSourceEnumerator *v4;
  void *v5;
  void *v6;
  PXSectionedDataSourceEnumerator *v7;

  v4 = [PXSectionedDataSourceEnumerator alloc];
  -[PXSectionedDataSourceEnumerator dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSourceEnumerator indexPathSet](self, "indexPathSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXSectionedDataSourceEnumerator initWithDataSource:indexPathSet:enumeratedTypes:](v4, "initWithDataSource:indexPathSet:enumeratedTypes:", v5, v6, -[PXSectionedDataSourceEnumerator enumeratedTypes](self, "enumeratedTypes"));

  return v7;
}

- (void)_setToInitialState
{
  int64_t v3;

  if ((-[PXSectionedDataSourceEnumerator enumeratedTypes](self, "enumeratedTypes") & 1) != 0)
  {
    self->_currentPhase = 0;
  }
  else
  {
    if ((-[PXSectionedDataSourceEnumerator enumeratedTypes](self, "enumeratedTypes") & 2) != 0)
    {
      v3 = 1;
    }
    else if ((-[PXSectionedDataSourceEnumerator enumeratedTypes](self, "enumeratedTypes") & 4) != 0)
    {
      v3 = 2;
    }
    else
    {
      v3 = 3;
    }
    self->_currentPhase = v3;
  }
  *(_OWORD *)&self->_lastIndexPath.dataSourceIdentifier = *(_OWORD *)PXSimpleIndexPathNull;
  *(_OWORD *)&self->_lastIndexPath.item = *(_OWORD *)&PXSimpleIndexPathNull[16];
}

- (unint64_t)count
{
  NSNumber *cachedCount;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSNumber *v8;
  NSNumber *v9;

  cachedCount = self->_cachedCount;
  if (!cachedCount)
  {
    if ((-[PXSectionedDataSourceEnumerator enumeratedTypes](self, "enumeratedTypes") & 1) != 0)
    {
      -[PXSectionedDataSourceEnumerator indexPathSet](self, "indexPathSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "sectionCount");

    }
    else
    {
      v4 = 0;
    }
    if ((-[PXSectionedDataSourceEnumerator enumeratedTypes](self, "enumeratedTypes") & 2) != 0)
    {
      -[PXSectionedDataSourceEnumerator indexPathSet](self, "indexPathSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 += objc_msgSend(v6, "itemCount");

    }
    if ((-[PXSectionedDataSourceEnumerator enumeratedTypes](self, "enumeratedTypes") & 4) != 0)
    {
      -[PXSectionedDataSourceEnumerator indexPathSet](self, "indexPathSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 += objc_msgSend(v7, "subitemCount");

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_cachedCount;
    self->_cachedCount = v8;

    cachedCount = self->_cachedCount;
  }
  return -[NSNumber unsignedIntegerValue](cachedCount, "unsignedIntegerValue");
}

- (PXSimpleIndexPath)_nextSectionIndexPathFromIndexPath:(SEL)a3
{
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  int64_t v11;
  PXSimpleIndexPath *result;
  void *v13;

  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  -[PXSectionedDataSourceEnumerator dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "identifier");

  -[PXSectionedDataSourceEnumerator indexPathSet](self, "indexPathSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionIndexSetForDataSourceIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4->dataSourceIdentifier)
  {
    v10 = v13;
    if (!v13)
      goto LABEL_8;
    v11 = objc_msgSend(v13, "indexGreaterThanIndex:", a4->section);
  }
  else
  {
    v10 = v13;
    if (!v13)
      goto LABEL_8;
    v11 = objc_msgSend(v13, "firstIndex");
  }
  v10 = v13;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    retstr->dataSourceIdentifier = v8;
    retstr->section = v11;
    *(int64x2_t *)&retstr->item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
LABEL_8:

  return result;
}

- (PXSimpleIndexPath)_nextItemIndexPathFromIndexPath:(SEL)a3
{
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t section;
  int64_t item;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  PXSimpleIndexPath *result;
  id v22;

  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  -[PXSectionedDataSourceEnumerator dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "identifier");

  -[PXSectionedDataSourceEnumerator indexPathSet](self, "indexPathSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionsWithItemsForDataSourceIdentifier:", v8);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (a4->dataSourceIdentifier)
  {
    section = a4->section;
    item = a4->item;
    -[PXSectionedDataSourceEnumerator indexPathSet](self, "indexPathSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemIndexSetForDataSourceIdentifier:section:", v8, section);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "indexGreaterThanIndex:", item);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = objc_msgSend(v22, "indexGreaterThanIndex:", section);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL
        || (section = v15,
            -[PXSectionedDataSourceEnumerator indexPathSet](self, "indexPathSet"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v16, "itemIndexSetForDataSourceIdentifier:section:", v8, section),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v16,
            !v17))
      {

        v19 = v22;
        goto LABEL_14;
      }
      v18 = objc_msgSend(v17, "firstIndex");

      goto LABEL_10;
    }
  }
  else
  {
    v19 = v22;
    if (!v22)
      goto LABEL_14;
    section = objc_msgSend(v22, "firstIndex");
    v19 = v22;
    if (section == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_14;
    -[PXSectionedDataSourceEnumerator indexPathSet](self, "indexPathSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "itemIndexSetForDataSourceIdentifier:section:", v8, section);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "firstIndex");
  }
  v18 = v14;
LABEL_10:

  v19 = v22;
  if (section != 0x7FFFFFFFFFFFFFFFLL && v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    retstr->dataSourceIdentifier = v8;
    retstr->section = section;
    retstr->item = v18;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_14:

  return result;
}

- (PXSimpleIndexPath)_nextSubitemIndexPathFromIndexPath:(SEL)a3
{
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  return self;
}

- (void)_transitionToNextPhase
{
  int64_t currentPhase;
  char v4;
  int64_t v5;

  currentPhase = self->_currentPhase;
  switch(currentPhase)
  {
    case 2:
      v5 = 3;
      goto LABEL_10;
    case 1:
      goto LABEL_5;
    case 0:
      if ((-[PXSectionedDataSourceEnumerator enumeratedTypes](self, "enumeratedTypes") & 2) == 0)
      {
LABEL_5:
        v4 = -[PXSectionedDataSourceEnumerator enumeratedTypes](self, "enumeratedTypes");
        v5 = 2;
        if ((v4 & 4) == 0)
          v5 = 3;
        goto LABEL_10;
      }
      v5 = 1;
LABEL_10:
      self->_currentPhase = v5;
      break;
  }
  *(_OWORD *)&self->_lastIndexPath.dataSourceIdentifier = *(_OWORD *)PXSimpleIndexPathNull;
  *(_OWORD *)&self->_lastIndexPath.item = *(_OWORD *)&PXSimpleIndexPathNull[16];
}

- (id)nextObject
{
  __int128 v3;
  int64_t v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  int64_t v12;
  __int128 v13;
  int64_t v14;
  __int128 v15;
  int64_t v16;

  v16 = 0x7FFFFFFFFFFFFFFFLL;
  v15 = *(_OWORD *)&PXSimpleIndexPathNull[8];
  while (1)
  {
    switch(self->_currentPhase)
    {
      case 0:
        v3 = *(_OWORD *)&self->_lastIndexPath.item;
        v10 = *(_OWORD *)&self->_lastIndexPath.dataSourceIdentifier;
        v11 = v3;
        -[PXSectionedDataSourceEnumerator _nextSectionIndexPathFromIndexPath:](self, "_nextSectionIndexPathFromIndexPath:", &v10);
        v4 = v12;
        v15 = v13;
        v16 = v14;
        if (!v12)
          goto LABEL_8;
        goto LABEL_9;
      case 1:
        v5 = *(_OWORD *)&self->_lastIndexPath.item;
        v10 = *(_OWORD *)&self->_lastIndexPath.dataSourceIdentifier;
        v11 = v5;
        -[PXSectionedDataSourceEnumerator _nextItemIndexPathFromIndexPath:](self, "_nextItemIndexPathFromIndexPath:", &v10);
        goto LABEL_7;
      case 2:
        v6 = *(_OWORD *)&self->_lastIndexPath.item;
        v10 = *(_OWORD *)&self->_lastIndexPath.dataSourceIdentifier;
        v11 = v6;
        -[PXSectionedDataSourceEnumerator _nextSubitemIndexPathFromIndexPath:](self, "_nextSubitemIndexPathFromIndexPath:", &v10);
LABEL_7:
        v4 = v12;
        v15 = v13;
        v16 = v14;
        if (!v12)
          goto LABEL_8;
LABEL_9:
        -[PXSectionedDataSourceEnumerator dataSource](self, "dataSource");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v4;
        v13 = v15;
        v14 = v16;
        objc_msgSend(v7, "objectAtIndexPath:", &v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        self->_lastIndexPath.dataSourceIdentifier = v4;
        *(_OWORD *)&self->_lastIndexPath.section = v15;
        self->_lastIndexPath.subitem = v16;
        return v8;
      case 3:
        v4 = 0;
        v8 = 0;
        goto LABEL_11;
      default:
LABEL_8:
        -[PXSectionedDataSourceEnumerator _transitionToNextPhase](self, "_transitionToNextPhase");
        break;
    }
  }
}

- (id)firstObject
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  -[PXSectionedDataSourceEnumerator indexPathSet](self, "indexPathSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSourceEnumerator dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "identifier");
  if (v3)
  {
    objc_msgSend(v3, "firstItemIndexPathForDataSourceIdentifier:", v5);
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
  }

  if (!(_QWORD)v10)
    return 0;
  -[PXSectionedDataSourceEnumerator dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v10;
  v9[1] = v11;
  objc_msgSend(v6, "objectAtIndexPath:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (PXIndexPathSet)indexPathSet
{
  return self->_indexPathSet;
}

- (unint64_t)enumeratedTypes
{
  return self->_enumeratedTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathSet, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_cachedCount, 0);
}

@end
