@implementation UAPasteboardGeneration

- (UAPasteboardGeneration)initWithGeneration:(unint64_t)a3
{
  UAPasteboardGeneration *v4;
  UAPasteboardGeneration *v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UAPasteboardGeneration;
  v4 = -[UAPasteboardGeneration init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_generation = a3;
    v6 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    -[UAPasteboardGeneration setItems:](v5, "setItems:", v6);

    v7 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    -[UAPasteboardGeneration setAllTypes:](v5, "setAllTypes:", v7);

    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[UAPasteboardGeneration setTypePaths:](v5, "setTypePaths:", v8);

  }
  return v5;
}

- (id)getTypePaths
{
  void *v2;
  void *v3;

  -[UAPasteboardGeneration typePaths](self, "typePaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (BOOL)addItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UAPasteboardGeneration items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAPasteboardGeneration setItems:](self, "setItems:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "types", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "type");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  -[UAPasteboardGeneration allTypes](self, "allTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setByAddingObjectsFromSet:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAPasteboardGeneration setAllTypes:](self, "setAllTypes:", v15);

  return 1;
}

- (BOOL)addType:(id)a3 toItemAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  UAPasteboardItem *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[UAPasteboardGeneration items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a4)
  {
    -[UAPasteboardGeneration items](self, "items");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v20 = objc_claimAutoreleasedReturnValue();
    v13 = (UAPasteboardItem *)v20;
    if (v19 == a4)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v21 = -[UAPasteboardGeneration generation](self, "generation");
        objc_msgSend(v6, "type");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 134218498;
        v38 = a4;
        v39 = 2048;
        v40 = v21;
        v41 = 2112;
        v42 = v22;
        _os_log_impl(&dword_1AF7EB000, &v13->super, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Adding type to index %lu for generation %lu: %@", (uint8_t *)&v37, 0x20u);

      }
      v13 = objc_alloc_init(UAPasteboardItem);
      -[UAPasteboardItem addType:](v13, "addType:", v6);
      -[UAPasteboardGeneration allTypes](self, "allTypes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "type");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setByAddingObject:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAPasteboardGeneration setAllTypes:](self, "setAllTypes:", v25);

      v17 = -[UAPasteboardGeneration addItem:](self, "addItem:", v13);
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x1E0CB37E8];
        -[UAPasteboardGeneration items](self, "items");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138412546;
        v38 = (unint64_t)v26;
        v39 = 2112;
        v40 = (unint64_t)v29;
        _os_log_impl(&dword_1AF7EB000, &v13->super, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Error adding type to item %@, cur count: %@", (uint8_t *)&v37, 0x16u);

      }
      v17 = 0;
    }
  }
  else
  {
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = -[UAPasteboardGeneration generation](self, "generation");
      objc_msgSend(v6, "type");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 134218498;
      v38 = a4;
      v39 = 2048;
      v40 = v10;
      v41 = 2112;
      v42 = v11;
      _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Adding type to index %lu for generation %lu: %@", (uint8_t *)&v37, 0x20u);

    }
    -[UAPasteboardGeneration items](self, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", a4);
    v13 = (UAPasteboardItem *)objc_claimAutoreleasedReturnValue();

    -[UAPasteboardItem addType:](v13, "addType:", v6);
    -[UAPasteboardGeneration allTypes](self, "allTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setByAddingObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAPasteboardGeneration setAllTypes:](self, "setAllTypes:", v16);

    v17 = 1;
  }

  v30 = v6;
  if (objc_msgSend(v30, "conformsToProtocol:", &unk_1EEE63170)
    && objc_msgSend(v30, "preferFileRep"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v30, "getFileName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        -[UAPasteboardGeneration typePaths](self, "typePaths");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "uuid");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKey:", v31, v33);

      }
    }
  }
  else
  {
    objc_msgSend(v30, "type");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("public.file-url"));

    if (v35)
      -[UAPasteboardGeneration fetchTypeURL:](self, "fetchTypeURL:", v30);
  }

  return v17;
}

- (void)fetchTypeURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "getFileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[UAPasteboardGeneration typePaths](self, "typePaths");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v5, v7);

    }
  }
  else
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__UAPasteboardGeneration_fetchTypeURL___block_invoke;
    v8[3] = &unk_1E6007F78;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    objc_msgSend(v9, "getDataWithCompletionBlock:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __39__UAPasteboardGeneration_fetchTypeURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  NSObject *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  _BYTE v13[1024];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "open");
  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v5 = objc_msgSend(v3, "read:maxLength:", v13, 1024);
  if (v5 >= 1)
  {
    for (i = v5; i > 0; i = objc_msgSend(v3, "read:maxLength:", v13, 1024))
      objc_msgSend(v4, "appendBytes:length:", v13, i);
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithDataRepresentation:relativeToURL:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Saving file name: %@", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "typePaths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v8, v12);

  }
}

- (unint64_t)generation
{
  return self->_generation;
}

- (NSSet)allTypes
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAllTypes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSMutableDictionary)typePaths
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTypePaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typePaths, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_allTypes, 0);
}

@end
