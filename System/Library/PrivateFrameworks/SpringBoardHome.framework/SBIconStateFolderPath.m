@implementation SBIconStateFolderPath

- (SBIconStateFolderPath)init
{
  SBIconStateFolderPath *v2;
  NSMutableArray *v3;
  NSMutableArray *folderNames;
  NSMutableArray *v5;
  NSMutableArray *folderDefaultNames;
  NSMutableArray *v7;
  NSMutableArray *folderUniqueIdentifiers;
  NSMutableArray *v9;
  NSMutableArray *folderPaths;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBIconStateFolderPath;
  v2 = -[SBIconStateFolderPath init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    folderNames = v2->_folderNames;
    v2->_folderNames = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    folderDefaultNames = v2->_folderDefaultNames;
    v2->_folderDefaultNames = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    folderUniqueIdentifiers = v2->_folderUniqueIdentifiers;
    v2->_folderUniqueIdentifiers = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    folderPaths = v2->_folderPaths;
    v2->_folderPaths = v9;

  }
  return v2;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_folderNames, "count");
}

- (id)folderNameAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_folderNames, "objectAtIndex:", a3);
}

- (id)folderDefaultNameAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NSMutableArray objectAtIndex:](self->_folderDefaultNames, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = 0;
  else
    v5 = v3;
  v6 = v5;

  return v6;
}

- (id)folderUniqueIdentifierAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NSMutableArray objectAtIndex:](self->_folderUniqueIdentifiers, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = 0;
  else
    v5 = v3;
  v6 = v5;

  return v6;
}

- (id)folderIndexPathAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_folderPaths, "objectAtIndex:", a3);
}

- (void)addFolderWithName:(id)a3 defaultName:(id)a4 uniqueIdentifier:(id)a5 indexPath:(id)a6
{
  id v10;
  NSMutableArray *folderNames;
  id v12;
  NSMutableArray *folderDefaultNames;
  void *v14;
  NSMutableArray *folderUniqueIdentifiers;
  void *v16;
  id v17;

  v17 = a4;
  v10 = a5;
  folderNames = self->_folderNames;
  v12 = a6;
  -[NSMutableArray addObject:](folderNames, "addObject:", a3);
  folderDefaultNames = self->_folderDefaultNames;
  if (v17)
  {
    -[NSMutableArray addObject:](self->_folderDefaultNames, "addObject:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](folderDefaultNames, "addObject:", v14);

  }
  folderUniqueIdentifiers = self->_folderUniqueIdentifiers;
  if (v10)
  {
    -[NSMutableArray addObject:](self->_folderUniqueIdentifiers, "addObject:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](folderUniqueIdentifiers, "addObject:", v16);

  }
  -[NSMutableArray addObject:](self->_folderPaths, "addObject:", v12);

}

- (void)enumerateFoldersUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *folderNames;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  folderNames = self->_folderNames;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SBIconStateFolderPath_enumerateFoldersUsingBlock___block_invoke;
  v7[3] = &unk_1E8D86C28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](folderNames, "enumerateObjectsUsingBlock:", v7);

}

void __52__SBIconStateFolderPath_enumerateFoldersUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "folderDefaultNameAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "folderUniqueIdentifierAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "folderIndexPathAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderPaths, 0);
  objc_storeStrong((id *)&self->_folderUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_folderDefaultNames, 0);
  objc_storeStrong((id *)&self->_folderNames, 0);
}

@end
