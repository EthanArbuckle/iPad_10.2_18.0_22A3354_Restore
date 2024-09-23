@implementation MCDBrowserIdentifiers

+ (id)sharedInstance
{
  if (sharedInstance_isDispatched != -1)
    dispatch_once(&sharedInstance_isDispatched, &__block_literal_global_9);
  return (id)sharedInstance_sharedInstance;
}

void __39__MCDBrowserIdentifiers_sharedInstance__block_invoke(id a1)
{
  MCDBrowserIdentifiers *v1;
  void *v2;

  v1 = objc_alloc_init(MCDBrowserIdentifiers);
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (BOOL)_identifiersDidChange
{
  void *v3;
  NSArray *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSSet *v8;
  id v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  NSArray *orderedIdentifiers;
  NSArray *v14;
  NSSet *activeIdentifiers;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "libraryMenuOrderedIdentifiers"));

  if (!-[NSArray count](v4, "count"))
  {
    v5 = MCDLibraryDefaultFuseIdentifiers();
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v4 = (NSArray *)v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "libraryMenuSelectedIdentifiers"));

  if (!-[NSSet count](v8, "count"))
  {
    v9 = MCDLibraryDefaultFuseIdentifiers();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));

    v8 = (NSSet *)v11;
  }
  if (-[NSArray isEqualToArray:](v4, "isEqualToArray:", self->_orderedIdentifiers))
    v12 = !-[NSSet isEqualToSet:](v8, "isEqualToSet:", self->_activeIdentifiers);
  else
    LOBYTE(v12) = 1;
  orderedIdentifiers = self->_orderedIdentifiers;
  self->_orderedIdentifiers = v4;
  v14 = v4;

  activeIdentifiers = self->_activeIdentifiers;
  self->_activeIdentifiers = v8;

  return v12;
}

- (BOOL)shouldShowCellForIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = MCDLibraryLocalizedStrings();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v7 = objc_msgSend(v6, "containsObject:", v3);

  return v7;
}

+ (id)symbolImageForIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = symbolImageForIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&symbolImageForIdentifier__onceToken, &__block_literal_global_18);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)symbolImageForIdentifier__symbolImages, "objectForKeyedSubscript:", v4));

  return v5;
}

void __50__MCDBrowserIdentifiers_symbolImageForIdentifier___block_invoke(id a1)
{
  id MCDRecentlyAddedControllerIdentifier;
  id MCDPlaylistsViewControllerIdentifier_0;
  id MCDArtistsViewControllerIdentifier_0;
  id MCDAlbumsViewControllerIdentifier_1;
  id MCDSongsViewControllerIdentifier_0;
  id MCDMadeForYouViewControllerIdentifier_0;
  void *v7;
  void *v8;
  id MCDGenresViewControllerIdentifier;
  void *v10;
  void *v11;
  id MCDComposersViewControllerIdentifier;
  void *v13;
  void *v14;
  id MCDCompilationsViewControllerIdentifier_0;
  void *v16;
  void *v17;
  id MCDDownloadedMusicViewControllerIdentifier;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[10];
  _QWORD v34[10];

  MCDRecentlyAddedControllerIdentifier = getMCDRecentlyAddedControllerIdentifier();
  v32 = (void *)objc_claimAutoreleasedReturnValue(MCDRecentlyAddedControllerIdentifier);
  v33[0] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("clock")));
  v34[0] = v31;
  MCDPlaylistsViewControllerIdentifier_0 = getMCDPlaylistsViewControllerIdentifier_0();
  v30 = (void *)objc_claimAutoreleasedReturnValue(MCDPlaylistsViewControllerIdentifier_0);
  v33[1] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("music.note.list")));
  v34[1] = v29;
  MCDArtistsViewControllerIdentifier_0 = getMCDArtistsViewControllerIdentifier_0();
  v28 = (void *)objc_claimAutoreleasedReturnValue(MCDArtistsViewControllerIdentifier_0);
  v33[2] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("music.mic")));
  v34[2] = v27;
  MCDAlbumsViewControllerIdentifier_1 = getMCDAlbumsViewControllerIdentifier_1();
  v26 = (void *)objc_claimAutoreleasedReturnValue(MCDAlbumsViewControllerIdentifier_1);
  v33[3] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("square.stack")));
  v34[3] = v25;
  MCDSongsViewControllerIdentifier_0 = getMCDSongsViewControllerIdentifier_0();
  v24 = (void *)objc_claimAutoreleasedReturnValue(MCDSongsViewControllerIdentifier_0);
  v33[4] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("music.note")));
  v34[4] = v23;
  MCDMadeForYouViewControllerIdentifier_0 = getMCDMadeForYouViewControllerIdentifier_0();
  v7 = (void *)objc_claimAutoreleasedReturnValue(MCDMadeForYouViewControllerIdentifier_0);
  v33[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("person.crop.square")));
  v34[5] = v8;
  MCDGenresViewControllerIdentifier = getMCDGenresViewControllerIdentifier();
  v10 = (void *)objc_claimAutoreleasedReturnValue(MCDGenresViewControllerIdentifier);
  v33[6] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("guitars")));
  v34[6] = v11;
  MCDComposersViewControllerIdentifier = getMCDComposersViewControllerIdentifier();
  v13 = (void *)objc_claimAutoreleasedReturnValue(MCDComposersViewControllerIdentifier);
  v33[7] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("music.quarternote.3")));
  v34[7] = v14;
  MCDCompilationsViewControllerIdentifier_0 = getMCDCompilationsViewControllerIdentifier_0();
  v16 = (void *)objc_claimAutoreleasedReturnValue(MCDCompilationsViewControllerIdentifier_0);
  v33[8] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("person.2.crop.square.stack")));
  v34[8] = v17;
  MCDDownloadedMusicViewControllerIdentifier = getMCDDownloadedMusicViewControllerIdentifier();
  v19 = (void *)objc_claimAutoreleasedReturnValue(MCDDownloadedMusicViewControllerIdentifier);
  v33[9] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("arrow.down.circle")));
  v34[9] = v20;
  v21 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 10));
  v22 = (void *)symbolImageForIdentifier__symbolImages;
  symbolImageForIdentifier__symbolImages = v21;

}

- (void)_updateCellIdentifiersOrdering
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = self->_orderedIdentifiers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (-[NSSet containsObject:](self->_activeIdentifiers, "containsObject:", v9))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  v10 = objc_opt_new(NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j);
        if (-[MCDBrowserIdentifiers shouldShowCellForIdentifier:](self, "shouldShowCellForIdentifier:", v16, (_QWORD)v17))
        {
          -[NSMutableArray addObject:](v10, "addObject:", v16);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  -[MCDBrowserIdentifiers setCellIdentifiers:](self, "setCellIdentifiers:", v10);
}

- (NSArray)cellIdentifiers
{
  return self->_cellIdentifiers;
}

- (void)setCellIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_cellIdentifiers, a3);
}

- (NSArray)orderedIdentifiers
{
  return self->_orderedIdentifiers;
}

- (void)setOrderedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_orderedIdentifiers, a3);
}

- (NSSet)activeIdentifiers
{
  return self->_activeIdentifiers;
}

- (void)setActiveIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_activeIdentifiers, a3);
}

- (double)maxImageWidth
{
  return self->_maxImageWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedIdentifiers, 0);
  objc_storeStrong((id *)&self->_cellIdentifiers, 0);
}

@end
