@implementation PLDuplicateGroup

- (PLDuplicateGroup)init
{
  return -[PLDuplicateGroup initWithGroupResults:](self, "initWithGroupResults:", 0);
}

- (PLDuplicateGroup)initWithGroupResults:(id)a3
{
  id v4;
  PLDuplicateGroup *v5;
  NSMutableSet *v6;
  NSMutableSet *mutableGroup;
  NSMutableSet *v8;
  NSMutableSet *mutableExcludedGroup;
  NSMutableSet *v10;
  NSMutableSet *mutableSubGroups;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLDuplicateGroup;
  v5 = -[PLDuplicateGroup init](&v13, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (NSMutableSet *)objc_msgSend(v4, "mutableCopy");
    else
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    mutableGroup = v5->_mutableGroup;
    v5->_mutableGroup = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    mutableExcludedGroup = v5->_mutableExcludedGroup;
    v5->_mutableExcludedGroup = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    mutableSubGroups = v5->_mutableSubGroups;
    v5->_mutableSubGroups = v10;

  }
  return v5;
}

- (id)printStringListFromOIDs:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = 1;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if ((v9 & 1) == 0)
          objc_msgSend(v4, "appendString:", CFSTR(", "));
        objc_msgSend(v11, "URIRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "relativePath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("%@"), v13);

        v9 = 0;
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v9 = 0;
    }
    while (v7);
  }

  return v4;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  PLDuplicateGroup *v19;
  objc_super v20;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v20.receiver = self;
  v20.super_class = (Class)PLDuplicateGroup;
  -[PLDuplicateGroup description](&v20, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendString:", CFSTR(" Group:{ "));
  -[PLDuplicateGroup group](self, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateGroup printStringListFromOIDs:](self, "printStringListFromOIDs:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v7);

  objc_msgSend(v5, "appendString:", CFSTR(" }, SubGroup:{ "));
  -[PLDuplicateGroup subGroups](self, "subGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __36__PLDuplicateGroup_debugDescription__block_invoke;
  v17 = &unk_1E366C128;
  v9 = v5;
  v18 = v9;
  v19 = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v14);

  objc_msgSend(v9, "appendString:", CFSTR(" }, Excluded Group:{ "), v14, v15, v16, v17);
  -[PLDuplicateGroup excludedGroup](self, "excludedGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateGroup printStringListFromOIDs:](self, "printStringListFromOIDs:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v11);

  objc_msgSend(v9, "appendString:", CFSTR(" }"));
  v12 = v9;

  return v12;
}

- (NSSet)group
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_mutableGroup, "copy");
}

- (NSSet)excludedGroup
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_mutableExcludedGroup, "copy");
}

- (NSSet)subGroups
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_mutableSubGroups, "copy");
}

- (BOOL)hasExcludedItems
{
  return -[NSMutableSet count](self->_mutableExcludedGroup, "count") != 0;
}

- (BOOL)hasSubGroups
{
  return -[NSMutableSet count](self->_mutableSubGroups, "count") != 0;
}

- (void)addManagedObjectID:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateGroup.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectID"));

    v5 = 0;
  }
  -[NSMutableSet addObject:](self->_mutableGroup, "addObject:", v5);

}

- (void)addSubGroup:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateGroup.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subGroup"));

    v5 = 0;
  }
  -[NSMutableSet addObject:](self->_mutableSubGroups, "addObject:", v5);

}

- (void)replaceSubGroups:(id)a3
{
  id v5;
  NSMutableSet *v6;
  NSMutableSet *mutableSubGroups;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateGroup.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subGroups"));

    v5 = 0;
  }
  v6 = (NSMutableSet *)objc_msgSend(v5, "mutableCopy");
  mutableSubGroups = self->_mutableSubGroups;
  self->_mutableSubGroups = v6;

}

- (void)excludeManagedObjectID:(id)a3
{
  id v4;

  v4 = a3;
  -[PLDuplicateGroup addManagedObjectID:](self, "addManagedObjectID:", v4);
  -[NSMutableSet addObject:](self->_mutableExcludedGroup, "addObject:", v4);

}

- (void)compactSubGroups
{
  NSMutableSet **p_mutableSubGroups;
  NSMutableSet *v4;
  id v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableSet *mutableExcludedGroup;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_mutableSubGroups = &self->_mutableSubGroups;
  v4 = self->_mutableSubGroups;
  if (-[NSMutableSet count](v4, "count") == 1)
  {
    -[NSMutableSet removeAllObjects](*p_mutableSubGroups, "removeAllObjects");
  }
  else if ((unint64_t)-[NSMutableSet count](v4, "count") >= 2)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v11, "count", (_QWORD)v16) == 1)
          {
            mutableExcludedGroup = self->_mutableExcludedGroup;
            objc_msgSend(v11, "anyObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](mutableExcludedGroup, "addObject:", v13);

          }
          else
          {
            objc_msgSend(v5, "addObject:", v11);
          }
        }
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v8);
    }

    objc_storeStrong((id *)p_mutableSubGroups, v5);
    if (!-[NSMutableSet count](*p_mutableSubGroups, "count"))
      -[NSMutableSet minusSet:](self->_mutableGroup, "minusSet:", self->_mutableExcludedGroup);

  }
  PLDuplicateDetectionGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    -[PLDuplicateGroup debugDescription](self, "debugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v15;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Duplicate Grouping: Compact results: %{public}@", buf, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSubGroups, 0);
  objc_storeStrong((id *)&self->_mutableExcludedGroup, 0);
  objc_storeStrong((id *)&self->_mutableGroup, 0);
}

uint64_t __36__PLDuplicateGroup_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "appendString:", CFSTR("{ "));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "printStringListFromOIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", v6);
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" }"));
}

@end
