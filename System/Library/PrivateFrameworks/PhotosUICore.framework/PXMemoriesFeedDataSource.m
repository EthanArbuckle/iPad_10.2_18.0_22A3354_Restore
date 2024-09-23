@implementation PXMemoriesFeedDataSource

- (PXMemoriesFeedDataSource)initWithEntries:(id)a3
{
  id v4;
  PXMemoriesFeedDataSource *v5;
  uint64_t v6;
  NSArray *entries;
  __int128 v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXMemoriesFeedDataSource;
  v5 = -[PXMemoriesFeedDataSource init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    entries = v5->_entries;
    v5->_entries = (NSArray *)v6;

    v8 = *((_OWORD *)off_1E50B8778 + 1);
    *(_OWORD *)&v5->_indexPathForFirstPastMemorySection.dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
    *(_OWORD *)&v5->_indexPathForFirstPastMemorySection.item = v8;
  }

  return v5;
}

- (PXMemoriesFeedDataSource)init
{
  return -[PXMemoriesFeedDataSource initWithEntries:](self, "initWithEntries:", MEMORY[0x1E0C9AA60]);
}

- (int64_t)numberOfSections
{
  return -[NSArray count](self->_entries, "count");
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "memories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t item;
  void *v6;
  void *v7;
  void *v8;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;

  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_OWORD *)&a3->dataSourceIdentifier;
    v14 = *(_OWORD *)&a3->item;
    PXSimpleIndexPathDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedDataSource.m"), 66, CFSTR("%@ unsupported indexPath:%@"), self, v12, v13, v14);

    abort();
  }
  item = a3->item;
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_9;
  }
  else if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_9;
  -[NSArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "memories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3->item);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PXSimpleIndexPath)_firstSectionIndexPath
{
  PXSimpleIndexPath *result;
  __int128 v6;

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  result = -[PXMemoriesFeedDataSource numberOfSections](self, "numberOfSections");
  if ((uint64_t)result < 1)
  {
    v6 = *((_OWORD *)off_1E50B8778 + 1);
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
    *(_OWORD *)&retstr->item = v6;
  }
  else
  {
    result = (PXSimpleIndexPath *)-[PXMemoriesFeedDataSource identifier](self, "identifier");
    retstr->dataSourceIdentifier = (int64_t)result;
    *(_OWORD *)&retstr->section = xmmword_1A7C0C1F0;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)_enumerateSectionIndexPathsStartingAtIndexPath:(PXSimpleIndexPath *)a3 reverseDirection:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL4 v5;
  _QWORD *v9;
  int64_t dataSourceIdentifier;
  uint64_t v13;
  int64_t v14;
  int64_t section;
  int64_t v16;
  int64_t v17;
  void (*v18)(_QWORD *, _QWORD *, char *);
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  __int128 v23;
  __int128 v24;
  char v25;

  v5 = a4;
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedDataSource.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedDataSource.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsSection(startIndexPath)"));

    dataSourceIdentifier = a3->dataSourceIdentifier;
  }
  if (dataSourceIdentifier != -[PXMemoriesFeedDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedDataSource.m"), 87, CFSTR("%@: indexPath data source identifier:%lu, does not match:%lu and is not valid for use with this data source. Convert it to ensure safe use."), self, a3->dataSourceIdentifier, -[PXMemoriesFeedDataSource identifier](self, "identifier"));

  }
  if (v5)
    v13 = -1;
  else
    v13 = 1;
  v14 = -[PXMemoriesFeedDataSource numberOfSections](self, "numberOfSections");
  v25 = 0;
  v24 = *(_OWORD *)&a3->item;
  v16 = a3->dataSourceIdentifier;
  section = a3->section;
  if ((section & 0x8000000000000000) == 0)
  {
    v17 = v14;
    do
    {
      if (section >= v17)
        break;
      if (v25)
        break;
      v18 = (void (*)(_QWORD *, _QWORD *, char *))v9[2];
      v22[0] = v16;
      v22[1] = section;
      v23 = v24;
      v18(v9, v22, &v25);
      section += v13;
    }
    while (section >= 0);
  }

}

- (void)_enumerateSectionIndexPathsWithHintIndexPath:(PXSimpleIndexPath *)a3 usingBlock:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__PXMemoriesFeedDataSource__enumerateSectionIndexPathsWithHintIndexPath_usingBlock___block_invoke;
  v16[3] = &unk_1E5115988;
  v8 = v6;
  v17 = v8;
  v18 = &v19;
  v9 = *(_OWORD *)&a3->item;
  v14 = *(_OWORD *)&a3->dataSourceIdentifier;
  v15 = v9;
  -[PXMemoriesFeedDataSource _enumerateSectionIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](self, "_enumerateSectionIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", &v14, 0, v16);
  if (!*((_BYTE *)v20 + 24))
  {
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __84__PXMemoriesFeedDataSource__enumerateSectionIndexPathsWithHintIndexPath_usingBlock___block_invoke_2;
    v11[3] = &unk_1E5115988;
    v12 = v8;
    v13 = &v19;
    v10 = *(_OWORD *)&a3->item;
    v14 = *(_OWORD *)&a3->dataSourceIdentifier;
    v15 = v10;
    -[PXMemoriesFeedDataSource _enumerateSectionIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](self, "_enumerateSectionIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", &v14, 1, v11);

  }
  _Block_object_dispose(&v19, 8);

}

- (void)_enumerateItemIndexPathsWithHintIndexPath:(PXSimpleIndexPath *)a3 usingBlock:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__PXMemoriesFeedDataSource__enumerateItemIndexPathsWithHintIndexPath_usingBlock___block_invoke;
  v16[3] = &unk_1E5115988;
  v8 = v6;
  v17 = v8;
  v18 = &v19;
  v9 = *(_OWORD *)&a3->item;
  v14 = *(_OWORD *)&a3->dataSourceIdentifier;
  v15 = v9;
  -[PXMemoriesFeedDataSource enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](self, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", &v14, 0, v16);
  if (!*((_BYTE *)v20 + 24))
  {
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __81__PXMemoriesFeedDataSource__enumerateItemIndexPathsWithHintIndexPath_usingBlock___block_invoke_2;
    v11[3] = &unk_1E5115988;
    v12 = v8;
    v13 = &v19;
    v10 = *(_OWORD *)&a3->item;
    v14 = *(_OWORD *)&a3->dataSourceIdentifier;
    v15 = v10;
    -[PXMemoriesFeedDataSource enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](self, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", &v14, 1, v11);

  }
  _Block_object_dispose(&v19, 8);

}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3 withHintIndexPath:(id)a4
{
  id v9;
  int64_t dataSourceIdentifier;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  __int128 v18;
  int64_t v19;
  void *v20;
  __int128 v21;
  void *v22;
  _QWORD *v23;
  id v24;
  __int128 v25;
  int64_t v26;
  void *v27;
  __int128 v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  PXSimpleIndexPath *result;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[8];
  _QWORD v39[8];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;

  v9 = a4;
  v11 = *(_QWORD *)off_1E50B7E98;
  if (a5->dataSourceIdentifier != *(_QWORD *)off_1E50B7E98)
  {
    dataSourceIdentifier = a5->dataSourceIdentifier;
    if (dataSourceIdentifier != -[PXMemoriesFeedDataSource identifier](self, "identifier"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXMemoriesFeedDataSource.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsNull(hintIndexPath) || (hintIndexPath.dataSourceIdentifier == [self identifier])"));

    }
  }
  v48 = 0;
  v49 = &v48;
  v50 = 0x4010000000;
  v51 = &unk_1A7E74EE7;
  v52 = 0u;
  v53 = 0u;
  if (v9)
  {
    objc_msgSend(v9, "indexPath");
    v12 = v46;
  }
  else
  {
    v12 = 0;
    v46 = 0uLL;
    v47 = 0uLL;
  }
  if (v12 != -[PXMemoriesFeedDataSource identifier](self, "identifier"))
  {
    v13 = v49;
    v14 = *((_OWORD *)off_1E50B8778 + 1);
    *((_OWORD *)v49 + 2) = *(_OWORD *)off_1E50B8778;
    *((_OWORD *)v13 + 3) = v14;
    v42 = 0u;
    v43 = 0u;
    if (v9)
    {
      objc_msgSend(v9, "indexPath");
      v15 = v42;
      v16 = v43;
    }
    else
    {
      v16 = 0;
      v15 = 0;
    }
    if (v15 == v11)
    {
LABEL_44:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v42;
      v41 = v43;
      PXSimpleIndexPathDescription();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXMemoriesFeedDataSource.m"), 206, CFSTR("%@ unsupported indexPath:%@"), self, v37);

      abort();
    }
    if (*((_QWORD *)&v42 + 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_44;
    }
    else if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = a5->dataSourceIdentifier;
      if (a5->dataSourceIdentifier == v11)
        goto LABEL_25;
      if (a5->section == 0x7FFFFFFFFFFFFFFFLL || a5->item != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXMemoriesFeedDataSource.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsNull(hintIndexPath) || PXSimpleIndexPathIsSection(hintIndexPath)"));

        v19 = a5->dataSourceIdentifier;
      }
      if (v19 == v11)
      {
LABEL_25:
        -[PXMemoriesFeedDataSource _firstSectionIndexPath](self, "_firstSectionIndexPath");
        v21 = v41;
        *(_OWORD *)&a5->dataSourceIdentifier = v40;
        *(_OWORD *)&a5->item = v21;
        v19 = a5->dataSourceIdentifier;
      }
      if (v19 == v11)
        goto LABEL_42;
      objc_msgSend(v9, "sectionObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXMemoriesFeedDataSource.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[e1 isKindOfClass:[PXMemoryEntryInfo class]]"));

      }
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __74__PXMemoriesFeedDataSource_indexPathForObjectReference_withHintIndexPath___block_invoke;
      v39[3] = &unk_1E51437D0;
      v23 = v39;
      v39[4] = self;
      v39[7] = a3;
      v24 = v22;
      v39[5] = v24;
      v39[6] = &v48;
      v25 = *(_OWORD *)&a5->item;
      v40 = *(_OWORD *)&a5->dataSourceIdentifier;
      v41 = v25;
      -[PXMemoriesFeedDataSource _enumerateSectionIndexPathsWithHintIndexPath:usingBlock:](self, "_enumerateSectionIndexPathsWithHintIndexPath:usingBlock:", &v40, v39);
      goto LABEL_41;
    }
    if (*((_QWORD *)&v43 + 1) != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_44;
    v26 = a5->dataSourceIdentifier;
    if (a5->dataSourceIdentifier == v11)
      goto LABEL_36;
    if (a5->item == 0x7FFFFFFFFFFFFFFFLL || a5->subitem != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXMemoriesFeedDataSource.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsNull(hintIndexPath) || PXSimpleIndexPathIsItem(hintIndexPath)"));

      v26 = a5->dataSourceIdentifier;
    }
    if (v26 == v11)
    {
LABEL_36:
      -[PXMemoriesFeedDataSource firstItemIndexPath](self, "firstItemIndexPath");
      v28 = v41;
      *(_OWORD *)&a5->dataSourceIdentifier = v40;
      *(_OWORD *)&a5->item = v28;
      v26 = a5->dataSourceIdentifier;
    }
    if (v26 == v11)
    {
LABEL_42:
      v17 = v49;
      goto LABEL_43;
    }
    objc_msgSend(v9, "itemObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXMemoriesFeedDataSource.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[m1 isKindOfClass:[PXMemoryInfo class]]"));

    }
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __74__PXMemoriesFeedDataSource_indexPathForObjectReference_withHintIndexPath___block_invoke_2;
    v38[3] = &unk_1E51437D0;
    v23 = v38;
    v38[4] = self;
    v38[7] = a3;
    v24 = v29;
    v38[5] = v24;
    v38[6] = &v48;
    v30 = *(_OWORD *)&a5->item;
    v40 = *(_OWORD *)&a5->dataSourceIdentifier;
    v41 = v30;
    -[PXMemoriesFeedDataSource _enumerateItemIndexPathsWithHintIndexPath:usingBlock:](self, "_enumerateItemIndexPathsWithHintIndexPath:usingBlock:", &v40, v38);
LABEL_41:

    goto LABEL_42;
  }
  if (v9)
  {
    objc_msgSend(v9, "indexPath");
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
  }
  v17 = v49;
  v18 = v45;
  *((_OWORD *)v49 + 2) = v44;
  *((_OWORD *)v17 + 3) = v18;
LABEL_43:
  v31 = *((_OWORD *)v17 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v17 + 2);
  *(_OWORD *)&retstr->item = v31;
  _Block_object_dispose(&v48, 8);

  return result;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  __int128 v4;
  _OWORD v6[2];

  v4 = *((_OWORD *)off_1E50B8778 + 1);
  v6[0] = *(_OWORD *)off_1E50B8778;
  v6[1] = v4;
  return -[PXMemoriesFeedDataSource indexPathForObjectReference:withHintIndexPath:](self, "indexPathForObjectReference:withHintIndexPath:", a4, v6);
}

- (id)sectionedObjectReferenceForMemoryUUID:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__539;
  v19 = __Block_byref_object_dispose__540;
  v20 = 0;
  v5 = -[PXMemoriesFeedDataSource identifier](self, "identifier");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PXMemoriesFeedDataSource_sectionedObjectReferenceForMemoryUUID___block_invoke;
  v12[3] = &unk_1E51159D8;
  v12[4] = self;
  v6 = v4;
  v13 = v6;
  v14 = &v15;
  v9 = v5;
  v10 = xmmword_1A7C0C1F0;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  -[PXMemoriesFeedDataSource _enumerateSectionIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](self, "_enumerateSectionIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", &v9, 0, v12);
  v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (id)inputForItem:(id)a3
{
  return 0;
}

- (PXSimpleIndexPath)indexPathForFirstPastMemorySection
{
  int64_t *p_item;
  PXSimpleIndexPath *v6;
  __int128 v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  SEL v18;
  _BYTE v19[32];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;

  p_item = &self[3].item;
  if (self[3].item == *(_QWORD *)off_1E50B7E98)
  {
    v6 = self;
    v20 = 0;
    v21 = &v20;
    v22 = 0x4010000000;
    v23 = &unk_1A7E74EE7;
    v7 = *((_OWORD *)off_1E50B8778 + 1);
    v24 = *(_OWORD *)off_1E50B8778;
    v25 = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSimpleIndexPath _firstSectionIndexPath](v6, "_firstSectionIndexPath");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__PXMemoriesFeedDataSource_indexPathForFirstPastMemorySection__block_invoke;
    v14[3] = &unk_1E51183E0;
    v14[4] = v6;
    v18 = a3;
    v10 = v9;
    v15 = v10;
    v11 = v8;
    v16 = v11;
    v17 = &v20;
    -[PXSimpleIndexPath _enumerateSectionIndexPathsWithHintIndexPath:usingBlock:](v6, "_enumerateSectionIndexPathsWithHintIndexPath:usingBlock:", v19, v14);
    v12 = *((_OWORD *)v21 + 3);
    *(_OWORD *)p_item = *((_OWORD *)v21 + 2);
    *((_OWORD *)p_item + 1) = v12;

    _Block_object_dispose(&v20, 8);
  }
  v13 = *((_OWORD *)p_item + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)p_item;
  *(_OWORD *)&retstr->item = v13;
  return self;
}

- (NSString)diagnosticDescription
{
  id v3;
  void *v4;
  NSArray *entries;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PXMemoriesFeedDataSource description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@\n"), v4);

  entries = self->_entries;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__PXMemoriesFeedDataSource_diagnosticDescription__block_invoke_2;
  v9[3] = &unk_1E5115A48;
  v10 = v3;
  v11 = &__block_literal_global_530;
  v6 = v3;
  -[NSArray enumerateObjectsUsingBlock:](entries, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v6, "copy");

  return (NSString *)v7;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setIndexPathForFirstPastMemorySection:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_indexPathForFirstPastMemorySection.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_indexPathForFirstPastMemorySection.item = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

void __49__PXMemoriesFeedDataSource_diagnosticDescription__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "appendFormat:", CFSTR("\tSection %lu:\n"), a3);
  objc_msgSend(v6, "memories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PXMemoriesFeedDataSource_diagnosticDescription__block_invoke_3;
  v8[3] = &unk_1E5115A20;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __49__PXMemoriesFeedDataSource_diagnosticDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
}

void __49__PXMemoriesFeedDataSource_diagnosticDescription__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v7, "localizedTitle");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "localizedDateText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\t\t%lu: %@ %@\n"), a3, v8, v11);

}

void __62__PXMemoriesFeedDataSource_indexPathForFirstPastMemorySection__block_invoke(_QWORD *a1, _OWORD *a2, _BYTE *a3)
{
  void *v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  _OWORD v15[2];

  v6 = (void *)a1[4];
  v7 = a2[1];
  v15[0] = *a2;
  v15[1] = v7;
  objc_msgSend(v6, "objectAtIndexPath:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("PXMemoriesFeedDataSource.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[entry isKindOfClass:[PXMemoryEntryInfo class]]"));

  }
  v9 = (void *)a1[5];
  objc_msgSend(v8, "representativeDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compareDate:toDate:toUnitGranularity:", v10, a1[6], 16);

  if (v11 == -1)
  {
    v12 = *(_QWORD *)(a1[7] + 8);
    v13 = a2[1];
    *(_OWORD *)(v12 + 32) = *a2;
    *(_OWORD *)(v12 + 48) = v13;
    *a3 = 1;
  }

}

void __66__PXMemoriesFeedDataSource_sectionedObjectReferenceForMemoryUUID___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];

  v5 = objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", *(_QWORD *)(a2 + 8));
  if (v5 >= 1)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "identifier");
      v9 = *(_QWORD *)(a2 + 8);
      v10 = *(void **)(a1 + 32);
      v18[0] = v8;
      v18[1] = v9;
      v18[2] = i;
      v18[3] = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v10, "objectReferenceAtIndexPath:", v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "itemObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "assetCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CD1698];
      objc_msgSend(v13, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "uuidFromLocalIdentifier:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "isEqualToString:", *(_QWORD *)(a1 + 40)))
      {
        *a3 = 1;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v11);
      }

    }
  }
}

void __74__PXMemoriesFeedDataSource_indexPathForObjectReference_withHintIndexPath___block_invoke(uint64_t a1, _OWORD *a2, _BYTE *a3)
{
  void *v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  _OWORD v12[2];

  v6 = *(void **)(a1 + 32);
  v7 = a2[1];
  v12[0] = *a2;
  v12[1] = v7;
  objc_msgSend(v6, "objectAtIndexPath:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXMemoriesFeedDataSource.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[e2 isKindOfClass:[PXMemoryEntryInfo class]]"));

  }
  if (_isEqualEntries(*(void **)(a1 + 40), v8))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = a2[1];
    *(_OWORD *)(v9 + 32) = *a2;
    *(_OWORD *)(v9 + 48) = v10;
    *a3 = 1;
  }

}

void __74__PXMemoriesFeedDataSource_indexPathForObjectReference_withHintIndexPath___block_invoke_2(uint64_t a1, _OWORD *a2, _BYTE *a3)
{
  void *v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  _OWORD v12[2];

  v6 = *(void **)(a1 + 32);
  v7 = a2[1];
  v12[0] = *a2;
  v12[1] = v7;
  objc_msgSend(v6, "objectAtIndexPath:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXMemoriesFeedDataSource.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[m2 isKindOfClass:[PXMemoryInfo class]]"));

  }
  if (_isEqualMemories(*(void **)(a1 + 40), v8))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = a2[1];
    *(_OWORD *)(v9 + 32) = *a2;
    *(_OWORD *)(v9 + 48) = v10;
    *a3 = 1;
  }

}

uint64_t __81__PXMemoriesFeedDataSource__enumerateItemIndexPathsWithHintIndexPath_usingBlock___block_invoke(uint64_t a1, _OWORD *a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _OWORD *, uint64_t, uint64_t);
  __int128 v9;
  uint64_t result;
  _OWORD v11[2];

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24;
  v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  result = v8(v6, v11, v7, a4);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return result;
}

uint64_t __81__PXMemoriesFeedDataSource__enumerateItemIndexPathsWithHintIndexPath_usingBlock___block_invoke_2(uint64_t a1, _OWORD *a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _OWORD *, uint64_t, uint64_t);
  __int128 v9;
  uint64_t result;
  _OWORD v11[2];

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24;
  v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  result = v8(v6, v11, v7, a4);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return result;
}

uint64_t __84__PXMemoriesFeedDataSource__enumerateSectionIndexPathsWithHintIndexPath_usingBlock___block_invoke(uint64_t a1, _OWORD *a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _OWORD *, uint64_t, uint64_t);
  __int128 v9;
  uint64_t result;
  _OWORD v11[2];

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24;
  v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  result = v8(v6, v11, v7, a4);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return result;
}

uint64_t __84__PXMemoriesFeedDataSource__enumerateSectionIndexPathsWithHintIndexPath_usingBlock___block_invoke_2(uint64_t a1, _OWORD *a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _OWORD *, uint64_t, uint64_t);
  __int128 v9;
  uint64_t result;
  _OWORD v11[2];

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24;
  v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  result = v8(v6, v11, v7, a4);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return result;
}

@end
