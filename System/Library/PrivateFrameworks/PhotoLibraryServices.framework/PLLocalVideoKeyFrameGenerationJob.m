@implementation PLLocalVideoKeyFrameGenerationJob

- (PLLocalVideoKeyFrameGenerationJob)init
{
  PLLocalVideoKeyFrameGenerationJob *v2;
  PLLocalVideoKeyFrameGenerationJob *v3;
  NSMutableArray *v4;
  NSMutableArray *completionHandlers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLLocalVideoKeyFrameGenerationJob;
  v2 = -[PLLocalVideoKeyFrameGenerationJob init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_handlerLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionHandlers = v3->_completionHandlers;
    v3->_completionHandlers = v4;

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PLLocalVideoKeyFrameGenerationJob *v4;
  BOOL v5;

  v4 = (PLLocalVideoKeyFrameGenerationJob *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PLLocalVideoKeyFrameGenerationJob isEqualToJob:](self, "isEqualToJob:", v4);
  }

  return v5;
}

- (BOOL)isEqualToJob:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLLocalVideoKeyFrameGenerationJob assetObjectID](self, "assetObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PLLocalVideoKeyFrameGenerationJob assetObjectID](self, "assetObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)addCompletionHandler:(id)a3
{
  os_unfair_lock_s *p_handlerLock;
  id v5;
  NSMutableArray *completionHandlers;
  void *v7;

  p_handlerLock = &self->_handlerLock;
  v5 = a3;
  os_unfair_lock_lock(p_handlerLock);
  completionHandlers = self->_completionHandlers;
  v7 = (void *)MEMORY[0x19AEC174C](v5);

  -[NSMutableArray addObject:](completionHandlers, "addObject:", v7);
  os_unfair_lock_unlock(p_handlerLock);
}

- (void)callCompletionHandlersWithMutatedMoc:(id)a3 error:(id)a4 storedRecipes:(id)a5 affectedRecipes:(id)a6 sourceMetadata:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  os_unfair_lock_s *p_handlerLock;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  p_handlerLock = &self->_handlerLock;
  os_unfair_lock_lock(&self->_handlerLock);
  v18 = (void *)-[NSMutableArray copy](self->_completionHandlers, "copy");
  os_unfair_lock_unlock(p_handlerLock);
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v23) + 16))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v23));
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v21);
  }

}

- (NSManagedObjectID)assetObjectID
{
  return self->_assetObjectID;
}

- (void)setAssetObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_assetObjectID, a3);
}

- (BOOL)networkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PLPhotoLibraryPathManagerIdentifier)libraryID
{
  return self->_libraryID;
}

- (void)setLibraryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_assetObjectID, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end
