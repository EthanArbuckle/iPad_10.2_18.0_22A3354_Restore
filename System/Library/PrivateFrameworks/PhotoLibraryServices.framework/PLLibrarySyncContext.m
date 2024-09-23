@implementation PLLibrarySyncContext

- (PLLibrarySyncContext)initWithPhotoLibrary:(id)a3
{
  id v5;
  PLLibrarySyncContext *v6;
  PLLibrarySyncContext *v7;
  PLCloudRecordOrganizer *v8;
  PLCloudRecordOrganizer *recordOrganizer;
  NSMutableDictionary *v10;
  NSMutableDictionary *assetAdjustmentStatesByCloudIdentifier;
  PLLibrarySyncContext *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLLibrarySyncContext;
  v6 = -[PLLibrarySyncContext init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v8 = -[PLCloudRecordOrganizer initWithPhotoLibrary:]([PLCloudRecordOrganizer alloc], "initWithPhotoLibrary:", v5);
    recordOrganizer = v7->_recordOrganizer;
    v7->_recordOrganizer = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assetAdjustmentStatesByCloudIdentifier = v7->_assetAdjustmentStatesByCloudIdentifier;
    v7->_assetAdjustmentStatesByCloudIdentifier = v10;

    v12 = v7;
  }

  return v7;
}

- (BOOL)serverSupportsVision
{
  return objc_msgSend(MEMORY[0x1E0D11348], "serverSupportsVision");
}

- (BOOL)serverSupportsGraphHome
{
  return objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsGraphPeopleHome");
}

- (id)makeFace
{
  void *v2;
  void *v3;

  -[PLPhotoLibrary managedObjectContext](self->_photoLibrary, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObject insertInManagedObjectContext:](PLDetectedFace, "insertInManagedObjectContext:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)deleteFaces:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLPhotoLibrary managedObjectContext](self->_photoLibrary, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v5, "deleteObject:", v11, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (id)personForUUID:(id)a3
{
  PLPhotoLibrary *photoLibrary;
  id v4;
  void *v5;
  void *v6;

  photoLibrary = self->_photoLibrary;
  v4 = a3;
  -[PLPhotoLibrary managedObjectContext](photoLibrary, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)personUUIDIsDeleted:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!a3)
    return 0;
  v4 = (objc_class *)MEMORY[0x1E0D11468];
  v5 = a3;
  v6 = [v4 alloc];
  -[PLLibrarySyncContext photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mainScopeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithScopeIdentifier:identifier:", v8, v5);

  -[PLCloudRecordOrganizer deletePersonRecords](self->_recordOrganizer, "deletePersonRecords");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = +[PLCloudRecordOrganizer records:containsScopedIdentifier:](PLCloudRecordOrganizer, "records:containsScopedIdentifier:", v10, v9);

  return (char)v5;
}

- (id)assetAdjustmentStateForCloudIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_assetAdjustmentStatesByCloudIdentifier, "objectForKey:", a3);
}

- (void)setAssetAdjustmentState:(id)a3 forCloudIdentifier:(id)a4
{
  NSMutableDictionary *assetAdjustmentStatesByCloudIdentifier;

  assetAdjustmentStatesByCloudIdentifier = self->_assetAdjustmentStatesByCloudIdentifier;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](assetAdjustmentStatesByCloudIdentifier, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](assetAdjustmentStatesByCloudIdentifier, "removeObjectForKey:", a4);
}

- (PLPhotoLibrary)photoLibrary
{
  return (PLPhotoLibrary *)objc_getProperty(self, a2, 16, 1);
}

- (PLCloudRecordOrganizer)recordOrganizer
{
  return (PLCloudRecordOrganizer *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordOrganizer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetAdjustmentStatesByCloudIdentifier, 0);
}

@end
