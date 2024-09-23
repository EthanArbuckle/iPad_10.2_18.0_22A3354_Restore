@implementation _PBFPosterSnapshotDefinitionCollection

- (_PBFPosterSnapshotDefinitionCollection)init
{
  _PBFPosterSnapshotDefinitionCollection *v2;
  uint64_t v3;
  NSMapTable *previewImageRequestForDisplayContext;
  uint64_t v5;
  NSMapTable *receivedPreviewImageForDisplayContext;
  uint64_t v7;
  NSMapTable *failedPreviewImageForDisplayContext;
  uint64_t v9;
  NSCountedSet *displayContextRequestFailures;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_PBFPosterSnapshotDefinitionCollection;
  v2 = -[_PBFPosterSnapshotDefinitionCollection init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    previewImageRequestForDisplayContext = v2->_previewImageRequestForDisplayContext;
    v2->_previewImageRequestForDisplayContext = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    receivedPreviewImageForDisplayContext = v2->_receivedPreviewImageForDisplayContext;
    v2->_receivedPreviewImageForDisplayContext = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    failedPreviewImageForDisplayContext = v2->_failedPreviewImageForDisplayContext;
    v2->_failedPreviewImageForDisplayContext = (NSMapTable *)v7;

    v9 = objc_opt_new();
    displayContextRequestFailures = v2->_displayContextRequestFailures;
    v2->_displayContextRequestFailures = (NSCountedSet *)v9;

  }
  return v2;
}

- (int64_t)requestStatusForDisplayContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;

  v4 = a3;
  if (v4)
  {
    -[_PBFPosterSnapshotDefinitionCollection previewImageRequestForDisplayContext](self, "previewImageRequestForDisplayContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = 1;
    }
    else
    {
      -[_PBFPosterSnapshotDefinitionCollection receivedPreviewImageForDisplayContext](self, "receivedPreviewImageForDisplayContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v7 = 3;
      }
      else
      {
        -[_PBFPosterSnapshotDefinitionCollection displayContextRequestFailures](self, "displayContextRequestFailures");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countForObject:", v4);

        if (v11 <= 2)
        {
          -[_PBFPosterSnapshotDefinitionCollection failedPreviewImageForDisplayContext](self, "failedPreviewImageForDisplayContext");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13 != 0;

          v7 = 2 * v14;
        }
        else
        {
          v7 = 2;
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)cancel
{
  void *v3;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_PBFPosterSnapshotDefinitionCollection previewImageRequestForDisplayContext](self, "previewImageRequestForDisplayContext", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectEnumerator");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "invalidate");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMapTable removeAllObjects](self->_previewImageRequestForDisplayContext, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_receivedPreviewImageForDisplayContext, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_failedPreviewImageForDisplayContext, "removeAllObjects");
  -[NSCountedSet removeAllObjects](self->_displayContextRequestFailures, "removeAllObjects");
}

- (NSMapTable)previewImageRequestForDisplayContext
{
  return self->_previewImageRequestForDisplayContext;
}

- (NSMapTable)receivedPreviewImageForDisplayContext
{
  return self->_receivedPreviewImageForDisplayContext;
}

- (NSMapTable)failedPreviewImageForDisplayContext
{
  return self->_failedPreviewImageForDisplayContext;
}

- (NSCountedSet)displayContextRequestFailures
{
  return self->_displayContextRequestFailures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayContextRequestFailures, 0);
  objc_storeStrong((id *)&self->_failedPreviewImageForDisplayContext, 0);
  objc_storeStrong((id *)&self->_receivedPreviewImageForDisplayContext, 0);
  objc_storeStrong((id *)&self->_previewImageRequestForDisplayContext, 0);
}

@end
