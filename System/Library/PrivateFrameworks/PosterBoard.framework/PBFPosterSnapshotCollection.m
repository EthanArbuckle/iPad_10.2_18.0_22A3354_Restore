@implementation PBFPosterSnapshotCollection

- (PBFPosterSnapshotCollection)initWithUniqueIdentifier:(id)a3
{
  id v6;
  PBFPosterSnapshotCollection *v7;
  PBFPosterSnapshotCollection *v8;
  uint64_t v9;
  NSMapTable *lock_definitionToCollection;
  void *v12;
  objc_super v13;

  v6 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCollection initWithUniqueIdentifier:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA56388);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCollection initWithUniqueIdentifier:].cold.1(a2);
    goto LABEL_11;
  }

  v13.receiver = self;
  v13.super_class = (Class)PBFPosterSnapshotCollection;
  v7 = -[PBFPosterSnapshotCollection init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_uniqueIdentifier, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    lock_definitionToCollection = v8->_lock_definitionToCollection;
    v8->_lock_definitionToCollection = (NSMapTable *)v9;

  }
  return v8;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_uniqueIdentifier, "hash");
}

- (int64_t)snapshotRequestStatusForDefinition:(id)a3 displayContext:(id)a4 outInvalidationContext:(id *)a5
{
  id v8;
  os_unfair_lock_s *p_lock;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;

  v8 = a4;
  p_lock = &self->_lock;
  v10 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_definitionToCollection, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "previewImageRequestForDisplayContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5 && v13)
      *a5 = objc_retainAutorelease(v13);
    v14 = objc_msgSend(v11, "requestStatusForDisplayContext:", v8);

  }
  else
  {
    v14 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (unint64_t)numberOfTimesSnapshotHasFailedToHydrateForDefinition:(id)a3 displayContext:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v6 = a4;
  p_lock = &self->_lock;
  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_definitionToCollection, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "displayContextRequestFailures");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countForObject:", v6);

  }
  else
  {
    v11 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)receivedImageForDefinition:(id)a3 displayContext:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMapTable objectForKey:](self->_lock_definitionToCollection, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "receivedPreviewImageForDisplayContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (BOOL)shouldProceedFetchingSnapshotForDefinition:(id)a3 displayContext:(id)a4 maxNumberOfRetryAfterErrors:(unint64_t)a5
{
  id v8;
  os_unfair_lock_s *p_lock;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;

  v8 = a4;
  p_lock = &self->_lock;
  v10 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_definitionToCollection, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "failedPreviewImageForDisplayContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v11, "displayContextRequestFailures");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "countForObject:", v8) < a5;

  }
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (void)enumerateInProgressRequests:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  os_unfair_lock_t lock;
  id obj;
  uint64_t v22;
  PBFPosterSnapshotCollection *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD aBlock[6];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  if (v26)
  {
    v4 = (void *)objc_opt_new();
    lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[NSMapTable keyEnumerator](self->_lock_definitionToCollection, "keyEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v24)
    {
      v22 = *(_QWORD *)v35;
      v23 = self;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v35 != v22)
            objc_enumerationMutation(obj);
          v25 = v5;
          v6 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v5);
          -[NSMapTable objectForKey:](self->_lock_definitionToCollection, "objectForKey:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          objc_msgSend(v7, "previewImageRequestForDisplayContext");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "keyEnumerator");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v31;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v31 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
                objc_msgSend(v7, "previewImageRequestForDisplayContext");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKey:", v14);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                aBlock[0] = MEMORY[0x1E0C809B0];
                aBlock[1] = 3221225472;
                aBlock[2] = __59__PBFPosterSnapshotCollection_enumerateInProgressRequests___block_invoke;
                aBlock[3] = &unk_1E86F4998;
                v17 = v26;
                aBlock[4] = v6;
                aBlock[5] = v14;
                v28 = v16;
                v29 = v17;
                v18 = v16;
                v19 = _Block_copy(aBlock);
                objc_msgSend(v4, "addObject:", v19);

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            }
            while (v11);
          }

          v5 = v25 + 1;
          self = v23;
        }
        while (v25 + 1 != v24);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v24);
    }

    os_unfair_lock_unlock(lock);
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_7);

  }
}

uint64_t __59__PBFPosterSnapshotCollection_enumerateInProgressRequests___block_invoke(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a2);
}

uint64_t __59__PBFPosterSnapshotCollection_enumerateInProgressRequests___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a4);
}

- (id)invalidateAndRemoveInProgressRequestsNotMatchingContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  os_unfair_lock_t lock;
  id obj;
  uint64_t v28;
  PBFPosterSnapshotCollection *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30 = (void *)objc_opt_new();
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v29 = self;
  -[NSMapTable keyEnumerator](self->_lock_definitionToCollection, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v31)
  {
    v28 = *(_QWORD *)v42;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(obj);
        v32 = v6;
        -[NSMapTable objectForKey:](v29->_lock_definitionToCollection, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v7, "previewImageRequestForDisplayContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "keyEnumerator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v38;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v38 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v13);
              objc_msgSend(v7, "previewImageRequestForDisplayContext");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKey:", v4);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if ((BSEqualObjects() & 1) == 0)
              {
                objc_msgSend(v5, "addObject:", v14);
                objc_msgSend(v16, "invalidate");
              }

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          }
          while (v11);
        }

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v17 = v5;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v34;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v34 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v21);
              objc_msgSend(v7, "previewImageRequestForDisplayContext");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "removeObjectForKey:", v22);

              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
          }
          while (v19);
        }

        objc_msgSend(v30, "addObjectsFromArray:", v17);
        objc_msgSend(v17, "removeAllObjects");

        v6 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v31);
  }

  os_unfair_lock_unlock(lock);
  objc_msgSend(v30, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)beginRequestForDefinition:(id)a3 displayContext:(id)a4 invalidationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_unfair_lock_s *p_lock;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_definitionToCollection, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = (void *)objc_opt_new();
    -[NSMapTable setObject:forKey:](self->_lock_definitionToCollection, "setObject:forKey:", v12, v8);
  }
  objc_msgSend(v12, "previewImageRequestForDisplayContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v12, "previewImageRequestForDisplayContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v10, v9);

  }
  os_unfair_lock_unlock(p_lock);

  return 0;
}

- (BOOL)completeRequestForDefinition:(id)a3 displayContext:(id)a4 receivedSnapshot:(id)a5 receivedError:(id)a6
{
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  os_unfair_lock_s *p_lock;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;

  v10 = a3;
  v11 = a4;
  v12 = (unint64_t)a5;
  v13 = (unint64_t)a6;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_definitionToCollection, "objectForKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    if (v12 | v13)
    {
      v15 = (void *)objc_opt_new();
      -[NSMapTable setObject:forKey:](self->_lock_definitionToCollection, "setObject:forKey:", v15, v10);
    }
    else
    {
      v15 = 0;
    }
  }
  objc_msgSend(v15, "previewImageRequestForDisplayContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v15, "previewImageRequestForDisplayContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectForKey:", v11);

  }
  if (v13)
  {
    objc_msgSend(v15, "failedPreviewImageForDisplayContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v13, v11);

    objc_msgSend(v15, "displayContextRequestFailures");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v11);
  }
  else
  {
    if (!v12)
    {
      v23 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v15, "receivedPreviewImageForDisplayContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v12, v11);

    objc_msgSend(v15, "failedPreviewImageForDisplayContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeObjectForKey:", v11);

    objc_msgSend(v15, "displayContextRequestFailures");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObject:", v11);
  }

  v23 = 1;
LABEL_12:
  os_unfair_lock_unlock(p_lock);

  return v23;
}

- (void)failPreviewImageForDefinition:(id)a3 displayContext:(id)a4 error:(id)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  p_lock = &self->_lock;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMapTable objectForKey:](self->_lock_definitionToCollection, "objectForKey:", v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "failedPreviewImageForDisplayContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v9, v10);

  os_unfair_lock_unlock(p_lock);
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_lock_definitionToCollection, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "cancel");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMapTable removeAllObjects](self->_lock_definitionToCollection, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_definitionToCollection, 0);
}

- (void)initWithUniqueIdentifier:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
