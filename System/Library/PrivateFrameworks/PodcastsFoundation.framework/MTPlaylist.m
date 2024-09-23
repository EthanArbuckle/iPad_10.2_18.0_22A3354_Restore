@implementation MTPlaylist

- (BOOL)needsUpdate
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 5) & 1;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[MTPlaylist flags](self, "flags");
  if (((((v5 & 0x20) == 0) ^ v3) & 1) == 0)
  {
    v6 = 32;
    if (!v3)
      v6 = 0;
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFDFLL | v6);
  }
}

+ (id)topLevelPlaylistsPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 0 AND %K = 0"), CFSTR("mediaLibraryId"), CFSTR("hidden"));
}

+ (id)predicateForIsHidden:(BOOL)a3
{
  void *v3;

  v3 = &unk_1E5539350;
  if (a3)
    v3 = &unk_1E5539338;
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("hidden"), v3);
}

+ (id)predicateForStationUUID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uuid"), a3);
}

+ (id)predicateForStationsWithUUIDs:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), a3);
}

+ (id)sortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortOrder"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isFolder
{
  return -[MTPlaylist flags](self, "flags") & 1;
}

- (BOOL)isITunesPlaylist
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 1) & 1;
}

- (void)setMediaLibraryId:(int64_t)a3
{
  void *v5;

  if (-[MTPlaylist mediaLibraryId](self, "mediaLibraryId") != a3)
  {
    -[MTPlaylist willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mediaLibraryId"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPlaylist setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("mediaLibraryId"));

    -[MTPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mediaLibraryId"));
  }
}

+ (id)propertiesToObserveForDownloadableEpisodes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[10];

  v6[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("uuid");
  v6[1] = CFSTR("unplayedCount");
  v6[2] = CFSTR("episodes");
  v6[3] = CFSTR("deletedEpisodes");
  v6[4] = CFSTR("settings");
  v6[5] = CFSTR("sortOrder");
  v6[6] = CFSTR("defaultSettings");
  v6[7] = CFSTR("containerOrder");
  v6[8] = CFSTR("hidden");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
