@implementation PLFileSystemVolume

- (id)payloadID
{
  void *v2;
  void *v3;

  -[PLFileSystemVolume uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)payloadIDForTombstone:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  PLFileSystemVolumeJournalEntryPayload *v5;

  v4 = a3;
  v5 = -[PLManagedObjectJournalEntryPayload initWithManagedObject:changedKeys:]([PLFileSystemVolumeJournalEntryPayload alloc], "initWithManagedObject:changedKeys:", self, v4);

  return v5;
}

+ (id)entityName
{
  return CFSTR("FileSystemVolume");
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PLFileSystemVolume;
  v3 = a3;
  objc_msgSendSuper2(&v9, sel_keyPathsForValuesAffectingValueForKey_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("isOffline"), v9.receiver, v9.super_class);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setByAddingObjectsFromSet:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

+ (id)volumeForURL:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[PLFileSystemVolumeManager sharedFileSystemVolumeManager](PLFileSystemVolumeManager, "sharedFileSystemVolumeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "volumeForURL:context:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)volumeForVolumeUUID:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  +[PLFileSystemVolume fetchRequest](PLFileSystemVolume, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("volumeUuidString"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  objc_msgSend(v5, "executeFetchRequest:error:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)volumeForObjectUUID:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  +[PLFileSystemVolume fetchRequest](PLFileSystemVolume, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uuid"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  objc_msgSend(v5, "executeFetchRequest:error:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predictedURLForVolumeName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/Volumes"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v3, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)supportsCloudUpload
{
  return 0;
}

- (void)setUrl:(id)a3
{
  NSURL *v4;
  NSURL *url;

  if (self->_url != a3)
  {
    v4 = (NSURL *)objc_msgSend(a3, "copy");
    url = self->_url;
    self->_url = v4;

  }
}

- (NSURL)url
{
  return (NSURL *)(id)-[NSURL copy](self->_url, "copy");
}

- (BOOL)isOffline
{
  void *v5;
  void *v6;

  if (self->_url)
    return 0;
  if (!-[PLFileSystemVolume faultingState](self, "faultingState"))
    return 1;
  -[PLFileSystemVolume uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  if (-[PLFileSystemVolume faultingState](self, "faultingState"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFileSystemVolume.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.faultingState == 0"));

  }
  return self->_url == 0;
}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLFileSystemVolume;
  -[PLFileSystemVolume awakeFromInsert](&v4, sel_awakeFromInsert);
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFileSystemVolume setUuid:](self, "setUuid:", v3);

}

- (void)awakeFromFetch
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLFileSystemVolume;
  -[PLFileSystemVolume awakeFromFetch](&v3, sel_awakeFromFetch);
  -[PLFileSystemVolume _registerWithVolumeManager](self, "_registerWithVolumeManager");
}

- (void)willTurnIntoFault
{
  objc_super v3;

  -[PLFileSystemVolume _unregisterWithVolumeManager](self, "_unregisterWithVolumeManager");
  v3.receiver = self;
  v3.super_class = (Class)PLFileSystemVolume;
  -[PLFileSystemVolume willTurnIntoFault](&v3, sel_willTurnIntoFault);
}

- (void)didTurnIntoFault
{
  NSURL *url;
  objc_super v4;

  url = self->_url;
  self->_url = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLFileSystemVolume;
  -[PLFileSystemVolume didTurnIntoFault](&v4, sel_didTurnIntoFault);
}

- (void)_registerWithVolumeManager
{
  id v3;

  +[PLFileSystemVolumeManager sharedFileSystemVolumeManager](PLFileSystemVolumeManager, "sharedFileSystemVolumeManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerPLFileSystemVolume:", self);

}

- (void)_unregisterWithVolumeManager
{
  id v3;

  +[PLFileSystemVolumeManager sharedFileSystemVolumeManager](PLFileSystemVolumeManager, "sharedFileSystemVolumeManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterPLFileSystemVolume:", self);

}

- (id)predictedURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLFileSystemVolume url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PLFileSystemVolume name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v5 = (void *)objc_opt_class();
      -[PLFileSystemVolume name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predictedURLForVolumeName:", v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
