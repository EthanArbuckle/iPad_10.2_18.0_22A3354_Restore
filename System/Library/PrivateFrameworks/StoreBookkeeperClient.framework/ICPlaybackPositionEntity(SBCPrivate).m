@implementation ICPlaybackPositionEntity(SBCPrivate)

- (SBCPlaybackPositionEntity)sbcEntity
{
  void *v2;
  void *v3;
  SBCPlaybackPositionDomain *v4;
  void *v5;
  SBCPlaybackPositionDomain *v6;
  SBCPlaybackPositionEntity *v7;
  void *v8;
  void *v9;
  SBCPlaybackPositionEntity *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  objc_msgSend(a1, "playbackPositionKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    v26 = 0;
    objc_msgSend(MEMORY[0x24BE6B1D0], "allLibraries");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __49__ICPlaybackPositionEntity_SBCPrivate__sbcEntity__block_invoke;
    v20[3] = &unk_24F0D6EA8;
    v20[4] = a1;
    v20[5] = &v21;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v20);

    v4 = [SBCPlaybackPositionDomain alloc];
    objc_msgSend(a1, "playbackPositionDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBCPlaybackPositionDomain initWithDomainIdentifier:foreignDatabasePath:](v4, "initWithDomainIdentifier:foreignDatabasePath:", v5, v22[5]);

    v7 = [SBCPlaybackPositionEntity alloc];
    objc_msgSend(a1, "playbackPositionKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "itemPersistentIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBCPlaybackPositionEntity initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:](v7, "initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:", v6, v8, objc_msgSend(v9, "longLongValue"));

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v10 = objc_alloc_init(SBCPlaybackPositionEntity);
  }
  objc_msgSend(a1, "bookmarkTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "bookmarkTimestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    -[SBCPlaybackPositionEntity setBookmarkTimestamp:](v10, "setBookmarkTimestamp:");

  }
  objc_msgSend(a1, "bookmarkTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(a1, "bookmarkTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    -[SBCPlaybackPositionEntity setBookmarkTime:](v10, "setBookmarkTime:");

  }
  objc_msgSend(a1, "userPlayCount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(a1, "userPlayCount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCPlaybackPositionEntity setUserPlayCount:](v10, "setUserPlayCount:", objc_msgSend(v16, "unsignedIntValue"));

  }
  objc_msgSend(a1, "hasBeenPlayed");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(a1, "hasBeenPlayed");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCPlaybackPositionEntity setHasBeenPlayed:](v10, "setHasBeenPlayed:", objc_msgSend(v18, "BOOLValue"));

  }
  return v10;
}

@end
