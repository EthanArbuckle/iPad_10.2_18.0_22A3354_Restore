@implementation PGDiscoveryFeedGenerationSession

- (PGDiscoveryFeedGenerationSession)initWithOptions:(id)a3 workingContext:(id)a4
{
  id v6;
  id v7;
  PGDiscoveryFeedGenerationSession *v8;
  uint64_t v9;
  PGDiscoveryFeedGenerationOptions *options;
  NSMutableSet *v11;
  NSMutableSet *usedLocalIdentifiers;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGDiscoveryFeedGenerationSession;
  v8 = -[PGDiscoveryFeedGenerationSession init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    options = v8->_options;
    v8->_options = (PGDiscoveryFeedGenerationOptions *)v9;

    objc_storeStrong((id *)&v8->_workingContext, a4);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    usedLocalIdentifiers = v8->_usedLocalIdentifiers;
    v8->_usedLocalIdentifiers = v11;

  }
  return v8;
}

- (PGDiscoveryFeedGenerationSession)initWithOptions:(id)a3 workingContext:(id)a4 state:(id)a5
{
  id v8;
  PGDiscoveryFeedGenerationSession *v9;
  PGDiscoveryFeedGenerationSession *v10;

  v8 = a5;
  v9 = -[PGDiscoveryFeedGenerationSession initWithOptions:workingContext:](self, "initWithOptions:workingContext:", a3, a4);
  v10 = v9;
  if (v9)
    -[PGDiscoveryFeedGenerationSession _restoreState:](v9, "_restoreState:", v8);

  return v10;
}

- (void)_restoreState:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("usedLocalIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[NSMutableSet addObjectsFromArray:](self->_usedLocalIdentifiers, "addObjectsFromArray:", v4);
    v4 = v5;
  }

}

- (id)currentState
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("usedLocalIdentifiers");
  -[NSMutableSet allObjects](self->_usedLocalIdentifiers, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)additionalItemsWithTargetCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  PGDiscoveryFeedItem *v19;
  NSMutableSet *usedLocalIdentifiers;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFetchLimit:", a3);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v9);

  if (-[NSMutableSet count](self->_usedLocalIdentifiers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT localIdentifier IN %@"), self->_usedLocalIdentifiers);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v10);

  }
  v23 = v6;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
        v19 = -[PGDiscoveryFeedItem initWithObject:]([PGDiscoveryFeedItem alloc], "initWithObject:", v18);
        objc_msgSend(v12, "addObject:", v19);
        usedLocalIdentifiers = self->_usedLocalIdentifiers;
        objc_msgSend(v18, "localIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](usedLocalIdentifiers, "addObject:", v21);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
