@implementation SBCPlaybackPositionEntity

- (SBCPlaybackPositionEntity)initWithPlaybackPositionDomain:(id)a3 ubiquitousIdentifier:(id)a4 foreignDatabaseEntityID:(int64_t)a5
{
  id v8;
  SBCPlaybackPositionEntity *v9;
  SBCPlaybackPositionEntity *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBCPlaybackPositionEntity;
  v9 = -[SBCPlaybackPositionEntity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ubiquitousIdentifier, a4);
    v10->_foreignDatabaseEntityID = a5;
    propertyMonitor_0 = 0;
  }

  return v10;
}

- (id)iTunesCloudEntity
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t, _BYTE *);
  void *v24;
  id v25;
  id v26;

  -[SBCPlaybackPositionDomain domainIdentifier](self->_playbackPositionDomain, "domainIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)*MEMORY[0x24BEC85F0];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8918]), "initWithDomain:", v6);
  objc_msgSend(v7, "setPlaybackPositionKey:", self->_ubiquitousIdentifier);
  -[SBCPlaybackPositionDomain foreignDatabasePath](self->_playbackPositionDomain, "foreignDatabasePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBCPathWithScrubbedMount(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6B1D0], "allLibraries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __46__SBCPlaybackPositionEntity_iTunesCloudEntity__block_invoke;
  v24 = &unk_24F0D6E80;
  v11 = v9;
  v25 = v11;
  v12 = v7;
  v26 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v21);

  if (self->_foreignDatabaseEntityID)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v21, v22, v23, v24, v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setItemPersistentIdentifier:", v13);

  }
  if (-[SBCPlaybackPositionEntity bookmarkTimestampModified](self, "bookmarkTimestampModified", v21, v22, v23, v24))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bookmarkTimestamp);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBookmarkTimestamp:", v14);

  }
  if (-[SBCPlaybackPositionEntity bookmarkTimeModified](self, "bookmarkTimeModified"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bookmarkTime);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBookmarkTime:", v15);

  }
  if (-[SBCPlaybackPositionEntity userPlayCountModified](self, "userPlayCountModified"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_userPlayCount);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUserPlayCount:", v16);

  }
  if (-[SBCPlaybackPositionEntity hasBeenPlayedModified](self, "hasBeenPlayedModified"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasBeenPlayed);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHasBeenPlayed:", v17);

  }
  v18 = v26;
  v19 = v12;

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  SBCPlaybackPositionDomain *playbackPositionDomain;
  id v5;

  playbackPositionDomain = self->_playbackPositionDomain;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", playbackPositionDomain, CFSTR("SBCPlaybackPositionDomain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ubiquitousIdentifier, CFSTR("SBCUbiquitousIdentifier"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_foreignDatabaseEntityID, CFSTR("SBCForeignDatabaseEntityID"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("SBCBookmarkTimestamp"), self->_bookmarkTimestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("SBCBookmarkTime"), self->_bookmarkTime);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_userPlayCount, CFSTR("SBCUserPlayCount"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasBeenPlayed, CFSTR("SBCHasBeenPlayed"));
  objc_msgSend(v5, "encodeBool:forKey:", propertyMonitor_0 & 1, CFSTR("SBCBookmarkTimeModified"));
  objc_msgSend(v5, "encodeBool:forKey:", (propertyMonitor_0 >> 3) & 1, CFSTR("SBCHasBeenPlayedModified"));
  objc_msgSend(v5, "encodeBool:forKey:", (propertyMonitor_0 >> 2) & 1, CFSTR("SBCUserPlayCountModified"));
  objc_msgSend(v5, "encodeBool:forKey:", (propertyMonitor_0 >> 1) & 1, CFSTR("SBCBookmarkTimestampModified"));

}

- (SBCPlaybackPositionEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBCPlaybackPositionEntity *v7;
  double v8;
  double v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("SBCPlaybackPositionDomain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("SBCUbiquitousIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBCPlaybackPositionEntity initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:](self, "initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:", v5, v6, objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SBCForeignDatabaseEntityID")));
  if (v7)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SBCBookmarkTimestamp"));
    v7->_bookmarkTimestamp = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SBCBookmarkTime"));
    v7->_bookmarkTime = v9;
    v7->_userPlayCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SBCUserPlayCount"));
    v7->_hasBeenPlayed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SBCHasBeenPlayed"));
    v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SBCBookmarkTimeModified"));
    propertyMonitor_0 = propertyMonitor_0 & 0xFE | v10;
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SBCHasBeenPlayedModified")))
      v11 = 8;
    else
      v11 = 0;
    propertyMonitor_0 = propertyMonitor_0 & 0xF7 | v11;
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SBCUserPlayCountModified")))
      v12 = 4;
    else
      v12 = 0;
    propertyMonitor_0 = propertyMonitor_0 & 0xFB | v12;
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SBCBookmarkTimestampModified")))
      v13 = 2;
    else
      v13 = 0;
    propertyMonitor_0 = propertyMonitor_0 & 0xFD | v13;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  SBCPlaybackPositionEntity *v6;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:", self->_playbackPositionDomain, self->_ubiquitousIdentifier, self->_foreignDatabaseEntityID);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setBookmarkTimestamp:", self->_bookmarkTimestamp);
    objc_msgSend(v5, "setBookmarkTime:", self->_bookmarkTime);
    objc_msgSend(v5, "setUserPlayCount:", self->_userPlayCount);
    objc_msgSend(v5, "setHasBeenPlayed:", self->_hasBeenPlayed);
  }
  v6 = self;

  return v6;
}

- (void)setBookmarkTimestamp:(double)a3
{
  self->_bookmarkTimestamp = a3;
  propertyMonitor_0 |= 2u;
}

- (void)setBookmarkTime:(double)a3
{
  self->_bookmarkTime = a3;
  propertyMonitor_0 |= 1u;
}

- (void)setUserPlayCount:(unint64_t)a3
{
  self->_userPlayCount = a3;
  propertyMonitor_0 |= 4u;
}

- (void)setHasBeenPlayed:(BOOL)a3
{
  self->_hasBeenPlayed = a3;
  propertyMonitor_0 |= 8u;
}

- (BOOL)hasBeenPlayedModified
{
  return (propertyMonitor_0 >> 3) & 1;
}

- (BOOL)userPlayCountModified
{
  return (propertyMonitor_0 >> 2) & 1;
}

- (BOOL)bookmarkTimeModified
{
  return propertyMonitor_0 & 1;
}

- (BOOL)bookmarkTimestampModified
{
  return (propertyMonitor_0 >> 1) & 1;
}

- (SBCPlaybackPositionDomain)playbackPositionDomain
{
  return self->_playbackPositionDomain;
}

- (NSString)ubiquitousIdentifier
{
  return self->_ubiquitousIdentifier;
}

- (int64_t)foreignDatabaseEntityID
{
  return self->_foreignDatabaseEntityID;
}

- (double)bookmarkTimestamp
{
  return self->_bookmarkTimestamp;
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (unint64_t)userPlayCount
{
  return self->_userPlayCount;
}

- (BOOL)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquitousIdentifier, 0);
  objc_storeStrong((id *)&self->_playbackPositionDomain, 0);
}

void __46__SBCPlaybackPositionEntity_iTunesCloudEntity__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "databasePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBCPathWithScrubbedMount(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_msgSend(v10, "libraryUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setLibraryIdentifier:", v9);

    *a4 = 1;
  }

}

+ (id)ubiquitousIdentifierWithUniqueStoreID:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEC8918], "keyValueStoreItemIdentifierForUniqueStoreID:itemTitle:albumName:itemArtistName:feedURL:feedGUID:", a3, 0, 0, 0, 0, 0);
}

+ (id)ubiquitousIdentifierWithItemTitle:(id)a3 albumName:(id)a4 itemArtistName:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x24BEC8918], "keyValueStoreItemIdentifierForUniqueStoreID:itemTitle:albumName:itemArtistName:feedURL:feedGUID:", 0, a3, a4, a5, 0, 0);
}

+ (id)ubiquitousIdentifierWithPodcastFeedURL:(id)a3 feedGUID:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BEC8918], "keyValueStoreItemIdentifierForUniqueStoreID:itemTitle:albumName:itemArtistName:feedURL:feedGUID:", 0, 0, 0, 0, a3, a4);
}

+ (id)ubiquitousIdentifierWithiTunesUFeedURL:(id)a3 feedGUID:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BEC8918], "keyValueStoreItemIdentifierForUniqueStoreID:itemTitle:albumName:itemArtistName:feedURL:feedGUID:", 0, 0, 0, 0, a3, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
