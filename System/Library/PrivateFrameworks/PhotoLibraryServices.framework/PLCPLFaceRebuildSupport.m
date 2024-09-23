@implementation PLCPLFaceRebuildSupport

- (PLCPLFaceRebuildSupport)initWithAsset:(id)a3 managedObjectContext:(id)a4
{
  id v7;
  id v8;
  PLCPLFaceRebuildSupport *v9;
  PLCPLFaceRebuildSupport *v10;
  PLFaceRebuildHelper *v11;
  PLFaceRebuildHelper *rebuildHelper;
  PLCPLFaceRebuildSupport *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PLCPLFaceRebuildSupport;
  v9 = -[PLCPLFaceRebuildSupport init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    v11 = -[PLFaceRebuildHelper initWithContext:]([PLFaceRebuildHelper alloc], "initWithContext:", v10->_context);
    rebuildHelper = v10->_rebuildHelper;
    v10->_rebuildHelper = v11;

    v13 = v10;
  }

  return v10;
}

- (void)rebuildAllFaces
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int detectedFaceCount;
  int rejectedFaceCount;
  int hiddenFaceCount;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[PLCPLFaceRebuildSupport fetchDeferredFacesToRebuild](self, "fetchDeferredFacesToRebuild");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
          v10 = (void *)MEMORY[0x19AEC1554](v5);
          -[PLCPLFaceRebuildSupport rebuildFace:](self, "rebuildFace:", v9, (_QWORD)v16);
          -[NSManagedObjectContext deleteObject:](self->_context, "deleteObject:", v9);
          objc_autoreleasePoolPop(v10);
          ++v8;
        }
        while (v6 != v8);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
        v6 = v5;
      }
      while (v5);
    }

    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        detectedFaceCount = self->_detectedFaceCount;
        rejectedFaceCount = self->_rejectedFaceCount;
        hiddenFaceCount = self->_hiddenFaceCount;
        -[PLManagedAsset cloudAssetGUID](self->_asset, "cloudAssetGUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        v21 = detectedFaceCount;
        v22 = 1024;
        v23 = rejectedFaceCount;
        v24 = 1024;
        v25 = hiddenFaceCount;
        v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Rebuilt %d detected, %d rejected, %d hidden for asset: %@", buf, 0x1Eu);

      }
    }
  }

}

- (void)rebuildFace:(id)a3
{
  id v4;
  _BYTE *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Rebuilding deferred face: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  if ((objc_msgSend(v4, "rejected") & 1) != 0
    || (objc_msgSend(v4, "personUUID"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    if (objc_msgSend(v4, "rejected")
      && (objc_msgSend(v4, "personUUID"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      -[PLCPLFaceRebuildSupport rebuildRejectedFace:](self, "rebuildRejectedFace:", v4);
    }
    else if (objc_msgSend(v4, "isHidden")
           && (objc_msgSend(v4, "personUUID"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
    {
      -[PLCPLFaceRebuildSupport rebuildHiddenFace:](self, "rebuildHiddenFace:", v4);
    }
    else if (!*v5)
    {
      __CPLAssetsdOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Unexpected deferred face state: %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  else
  {
    -[PLCPLFaceRebuildSupport rebuildDetectedFace:](self, "rebuildDetectedFace:", v4);
  }

}

- (void)rebuildDetectedFace:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  -[PLCPLFaceRebuildSupport fetchPersonForDeferredFace:](self, "fetchPersonForDeferredFace:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFaceRebuildHelper rebuildDetectedFace:onAsset:person:](self->_rebuildHelper, "rebuildDetectedFace:onAsset:person:", v4, self->_asset, v5);

  ++self->_detectedFaceCount;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Rebuilt detected face", v7, 2u);
    }

  }
}

- (void)rebuildRejectedFace:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  -[PLCPLFaceRebuildSupport fetchPersonForDeferredFace:](self, "fetchPersonForDeferredFace:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFaceRebuildHelper rebuildRejectedFace:onAsset:person:](self->_rebuildHelper, "rebuildRejectedFace:onAsset:person:", v4, self->_asset, v5);

  ++self->_rejectedFaceCount;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Rebuilt rejected face", v7, 2u);
    }

  }
}

- (void)rebuildHiddenFace:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  -[PLFaceRebuildHelper rebuildHiddenFace:onAsset:](self->_rebuildHelper, "rebuildHiddenFace:onAsset:", a3, self->_asset);
  ++self->_hiddenFaceCount;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Rebuilt hidden face", v5, 2u);
    }

  }
}

- (id)fetchDeferredFacesToRebuild
{
  void *v3;
  void *v4;

  -[PLManagedAsset cloudAssetGUID](self->_asset, "cloudAssetGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDeferredRebuildFace deferredFacesWithAssetCloudGUID:inManagedObjectContext:](PLDeferredRebuildFace, "deferredFacesWithAssetCloudGUID:inManagedObjectContext:", v3, self->_context);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fetchPersonForDeferredFace:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "personUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v4, self->_context);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rebuildHelper, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

+ (void)rebuildDeferredFacesForAsset:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  void *v6;
  PLCPLFaceRebuildSupport *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x19AEC1554]();
  v7 = -[PLCPLFaceRebuildSupport initWithAsset:managedObjectContext:]([PLCPLFaceRebuildSupport alloc], "initWithAsset:managedObjectContext:", v8, v5);
  -[PLCPLFaceRebuildSupport rebuildAllFaces](v7, "rebuildAllFaces");

  objc_autoreleasePoolPop(v6);
}

@end
