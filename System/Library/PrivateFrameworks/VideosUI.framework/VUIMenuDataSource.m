@implementation VUIMenuDataSource

- (void)setGenreTypes:(id)a3
{
  objc_storeStrong((id *)&self->_genreTypes, a3);
}

- (NSArray)mainMenuItems
{
  return self->_mainMenuItems;
}

- (id)mainMenuItemsWithDefaultItemsForIphone
{
  return -[VUIMenuDataSource _mainMenuItemsWithDefaultItemsBehavingAsiPhone:](self, "_mainMenuItemsWithDefaultItemsBehavingAsiPhone:", 1);
}

- (VUIMenuDataSource)initWithMainMenuItems:(id)a3 genreMenuItems:(id)a4
{
  id v7;
  id v8;
  VUIMenuDataSource *v9;
  VUIMenuDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIMenuDataSource;
  v9 = -[VUIMenuDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mainMenuItems, a3);
    objc_storeStrong((id *)&v10->_genreMenuItems, a4);
  }

  return v10;
}

- (NSArray)genreMenuItems
{
  return self->_genreMenuItems;
}

- (id)_mainMenuItemsWithDefaultItemsBehavingAsiPhone:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (!+[VUIAuthenticationManager isLibraryOnlyCountry](VUIAuthenticationManager, "isLibraryOnlyCountry"))
  {
    -[VUIMenuDataSource genreMenuItems](self, "genreMenuItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      -[VUIMenuDataSource mainMenuItems](self, "mainMenuItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_121);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "count");
      v13 = objc_msgSend(v11, "count");
      if ((objc_msgSend(MEMORY[0x1E0DC69D0], "isTV") & 1) != 0
        || (objc_msgSend(MEMORY[0x1E0DC69D0], "isVision") & 1) != 0
        || (objc_msgSend(MEMORY[0x1E0DC69D0], "isPhone") & 1) != 0
        || v3)
      {
        if (!objc_msgSend(v11, "count") && v12 > v13)
          goto LABEL_15;
      }
      else if (((objc_msgSend(MEMORY[0x1E0DC69D0], "isPad") & 1) != 0
              || objc_msgSend(MEMORY[0x1E0DC69D0], "isMac"))
             && !objc_msgSend(v11, "count"))
      {
LABEL_15:
        if (objc_msgSend(v7, "count"))
        {
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          objc_msgSend(&unk_1EA0BBAC0, "reverseObjectEnumerator", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "allObjects");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v21;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v21 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(v7, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), 0);
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            }
            while (v17);
          }

        }
        else
        {
          objc_msgSend(v7, "addObjectsFromArray:", &unk_1EA0BBAC0);
        }
      }

      return v7;
    }
  }
  -[VUIMenuDataSource mainMenuItems](self, "mainMenuItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VUIMenuDataSource *v4;
  uint64_t v5;
  NSArray *mainMenuItems;
  uint64_t v7;
  NSArray *genreMenuItems;
  uint64_t v9;
  NSArray *genreTypes;

  v4 = objc_alloc_init(VUIMenuDataSource);
  v5 = -[NSArray copy](self->_mainMenuItems, "copy");
  mainMenuItems = v4->_mainMenuItems;
  v4->_mainMenuItems = (NSArray *)v5;

  v7 = -[NSArray copy](self->_genreMenuItems, "copy");
  genreMenuItems = v4->_genreMenuItems;
  v4->_genreMenuItems = (NSArray *)v7;

  v9 = -[NSArray copy](self->_genreTypes, "copy");
  genreTypes = v4->_genreTypes;
  v4->_genreTypes = (NSArray *)v9;

  return v4;
}

- (id)mainMenuItemsWithDefaultItems
{
  return -[VUIMenuDataSource _mainMenuItemsWithDefaultItemsBehavingAsiPhone:](self, "_mainMenuItemsWithDefaultItemsBehavingAsiPhone:", 0);
}

BOOL __68__VUIMenuDataSource__mainMenuItemsWithDefaultItemsBehavingAsiPhone___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _BOOL8 v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    v4 = objc_msgSend(v3, "intValue") != 5
      && objc_msgSend(v3, "intValue") != 7
      && objc_msgSend(v3, "intValue") != 6
      && objc_msgSend(v3, "intValue") != 8
      && objc_msgSend(v3, "intValue") != 9;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMainMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_mainMenuItems, a3);
}

- (void)setGenreMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_genreMenuItems, a3);
}

- (NSArray)genreTypes
{
  return self->_genreTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genreTypes, 0);
  objc_storeStrong((id *)&self->_genreMenuItems, 0);
  objc_storeStrong((id *)&self->_mainMenuItems, 0);
}

@end
