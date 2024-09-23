@implementation MTPlaylist

- (void)setEpisodes:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist episodes](self, "episodes"));
  v5 = objc_msgSend(v7, "isEqualToOrderedSet:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = kPlaylistEpisodes;
    -[MTPlaylist willChangeValueForKey:](self, "willChangeValueForKey:", kPlaylistEpisodes);
    -[MTPlaylist setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, v6);
    -[MTPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", v6);
  }

}

- (BOOL)updateUnplayedCount
{
  void *v3;
  id v4;
  id v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void *i;
  void *v10;
  char *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist episodes](self, "episodes", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v6 += objc_msgSend(v10, "isPlayed") ^ 1;
        if (objc_msgSend(v10, "persistentID"))
          ++v7;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  v11 = (char *)-[MTPlaylist unplayedCount](self, "unplayedCount");
  v12 = v11 != v6;
  if (v11 != v6)
    -[MTPlaylist setUnplayedCount:](self, "setUnplayedCount:", v6);
  if (-[MTPlaylist downloadedCount](self, "downloadedCount") != v7)
  {
    -[MTPlaylist setDownloadedCount:](self, "setDownloadedCount:", v7);
    return 1;
  }
  return v12;
}

- (BOOL)isUngroupedList
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 8) & 1;
}

- (BOOL)isItunesPlaylist
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 1) & 1;
}

- (BOOL)includesAllPodcasts
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 4) & 1;
}

+ (id)predicateForFlag:(int)a3 isTrue:(BOOL)a4
{
  uint64_t v4;
  const __CFString *v5;

  v4 = (1 << a3);
  if (a4)
    v5 = CFSTR("%K != NULL && (%K & %d) != 0");
  else
    v5 = CFSTR("%K == NULL || (%K & %d) == 0");
  return (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v5, kPlaylistFlags, kPlaylistFlags, v4));
}

- (id)imageWithSize:(CGSize)a3 forEpisode:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](MTImageStore, "defaultStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "podcast"));

  if (!v8
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageForKey:size:", v9, width, height)),
        v9,
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scaleToSize:addBorder:", 1, width, height)),
        v10,
        !v11))
  {
    v12 = kMTLibraryDefaultPlaylistImage;
    if (objc_msgSend(v7, "hasItemForKey:", kMTLibraryDefaultPlaylistImage))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageForKey:", v12));
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Stations-Placeholder")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scaleToSize:addBorder:", 1, width, height));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](MTImageStore, "defaultStore"));
      objc_msgSend(v14, "addImage:forKey:", v11, v12);

    }
  }
  v15 = v11;

  return v15;
}

- (id)artworkWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  height = a3.height;
  width = a3.width;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10004670C;
  v21 = sub_1000469FC;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10004670C;
  v15 = sub_1000469FC;
  v16 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist managedObjectContext](self, "managedObjectContext"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000AD484;
  v10[3] = &unk_1004A70C8;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  v7 = (void *)objc_opt_class(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "artworkForStationUUID:podcastsUUIDs:size:", v18[5], v12[5], width, height));
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

+ (id)artworkForStationUUID:(id)a3 podcastsUUIDs:(id)a4 size:(CGSize)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](MTImageStore, "defaultStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageForKey:", v8));
  if (v11)
  {
    v12 = v11;
LABEL_29:
    v16 = v12;
    goto LABEL_30;
  }
  if (objc_msgSend(v9, "count") != (id)1)
  {
    if ((unint64_t)objc_msgSend(v9, "count") < 2)
      goto LABEL_27;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 4));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v18 = v9;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v36;
LABEL_9:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageForKey:size:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v22), width, height));
        if (v23)
          objc_msgSend(v17, "addObject:", v23);
        v24 = objc_msgSend(v17, "count");

        if (v24 == (id)4)
          break;
        if (v20 == (id)++v22)
        {
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v20)
            goto LABEL_9;
          break;
        }
      }
    }

    if (objc_msgSend(v17, "count") == (id)2)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 1));
      objc_msgSend(v17, "addObject:", v25);

    }
    else if (objc_msgSend(v17, "count") != (id)3)
    {
LABEL_22:
      if (objc_msgSend(v17, "count") == (id)4)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 2));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 3));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 1));
        v31 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v27, v28, v29, v30, 0, (_QWORD)v35));

        v17 = (void *)v31;
      }
      v32 = objc_claimAutoreleasedReturnValue(+[UIImage combineImages:rowCount:size:border:](UIImage, "combineImages:rowCount:size:border:", v17, 2, 1, width, height));
      if (v32)
      {
        v33 = (void *)v32;
        objc_msgSend(v10, "removeItemsWithPrefx:", v8);
        objc_msgSend(v10, "addImage:forKey:persist:", v33, v8, 0);
LABEL_28:

        v12 = v33;
        goto LABEL_29;
      }

LABEL_27:
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageForKey:size:", kMTLibraryDefaultImageKey, width, height));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "scaleToSize:addBorder:", 1, width, height));
      goto LABEL_28;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v17, "addObject:", v26);

    goto LABEL_22;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageForKey:size:", v13, width, height));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scaleToSize:addBorder:", 1, width, height));

  if (!v15)
  {

    goto LABEL_27;
  }
  v16 = v15;

LABEL_30:
  return v16;
}

+ (id)insertNewPlaylistInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcastPlaylistSettings insertNewSettingsInManagedObjectContext:](MTPodcastPlaylistSettings, "insertNewSettingsInManagedObjectContext:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString UUID](NSString, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "insertNewPlaylistInManagedObjectContext:uuid:defaultSettings:", v4, v6, v5));

  return v7;
}

+ (id)insertNewPlaylistInManagedObjectContext:(id)a3 uuid:(id)a4 defaultSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", kMTPlaylistEntityName, v8));
  if (!v10)
    v10 = (id)objc_claimAutoreleasedReturnValue(+[MTPodcastPlaylistSettings insertNewSettingsInManagedObjectContext:](MTPodcastPlaylistSettings, "insertNewSettingsInManagedObjectContext:", v8));
  objc_msgSend(v11, "setUuid:", v9);
  objc_msgSend(v11, "setDefaultSettings:", v10);
  objc_msgSend(v11, "setNeedsUpdate:", 1);
  objc_msgSend(v11, "setIsUngroupedList:", 1);
  v12 = kPlaylistSortOrder;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate truePredicate](NSPredicate, "truePredicate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "aggregateOperation:attribute:predicate:managedObjectContext:", CFSTR("max:"), v12, v13, v8));

  objc_msgSend(v11, "setSortOrder:", (char *)objc_msgSend(v14, "integerValue") + 1);
  objc_msgSend(a1, "prepareForPlatform:", v11);

  return v11;
}

- (void)setPodcasts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableSet *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist settings](self, "settings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", kPlaylistSettingPodcast));

  if ((objc_msgSend(v6, "isEqualToOrderedSet:", v4) & 1) == 0)
  {
    v18 = objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v18, "minusOrderedSet:", v6);
    v19 = v6;
    v7 = objc_msgSend(v6, "mutableCopy");
    v20 = v4;
    objc_msgSend(v7, "minusOrderedSet:", v4);
    v8 = objc_opt_new(NSMutableSet);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist settings](self, "settings"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "podcast"));
          v16 = objc_msgSend(v7, "containsObject:", v15);

          if (v16)
            -[NSMutableSet addObject:](v8, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000DAF70;
    v23[3] = &unk_1004AA3F0;
    v23[4] = self;
    -[NSMutableSet enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v23);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000DAFBC;
    v21[3] = &unk_1004AA418;
    v21[4] = self;
    v22 = (id)objc_claimAutoreleasedReturnValue(-[MTPlaylist defaultSettings](self, "defaultSettings"));
    v17 = v22;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v21);

    v6 = v19;
    v4 = v20;
  }

}

- (id)podcasts
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist settings](self, "settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", kPlaylistSettingPodcast));

  return v3;
}

- (void)setIsFolder:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;

  v3 = a3;
  v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 1) == 0) ^ v3) & 1) == 0)
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFFELL | v3);
}

- (BOOL)isFolder
{
  return -[MTPlaylist flags](self, "flags") & 1;
}

- (void)setIsItunesPlaylist:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 2) == 0) ^ v3) & 1) == 0)
  {
    v6 = 2;
    if (!v3)
      v6 = 0;
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFFDLL | v6);
  }
}

- (void)setIsBuiltIn:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 8) == 0) ^ v3) & 1) == 0)
  {
    v6 = 8;
    if (!v3)
      v6 = 0;
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFF7 | v6);
  }
}

- (BOOL)isBuiltIn
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 3) & 1;
}

- (void)setIncludesAllPodcasts:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 0x10) == 0) ^ v3) & 1) == 0)
  {
    v6 = 16;
    if (!v3)
      v6 = 0;
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFEFLL | v6);
  }
}

- (BOOL)isItunesSmartPlaylist
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 7) & 1;
}

- (void)setIsItunesSmartPlaylist:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 0x80) == 0) ^ v3) & 1) == 0)
  {
    v6 = 128;
    if (!v3)
      v6 = 0;
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFF7FLL | v6);
  }
}

- (void)setIsUngroupedList:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 0x100) == 0) ^ v3) & 1) == 0)
  {
    v6 = 256;
    if (!v3)
      v6 = 0;
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFEFFLL | v6);
  }
}

- (void)forceUpdate
{
  -[MTPlaylist setGeneratedDate:](self, "setGeneratedDate:", 0.0);
}

- (BOOL)isEditable
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist uuid](self, "uuid"));
  v3 = objc_msgSend(v2, "isEqualToString:", kPlaylistITunesPlaylistUuid) ^ 1;

  return v3;
}

- (void)setHasBeenSynced:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 0x40) == 0) ^ v3) & 1) == 0)
  {
    v6 = 64;
    if (!v3)
      v6 = 0;
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFBFLL | v6);
  }
}

- (BOOL)hasBeenSynced
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 6) & 1;
}

- (void)recalculateEpisodeCounts
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist episodes](self, "episodes", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "isPlayed") ^ 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  -[MTPlaylist setUnplayedCount:](self, "setUnplayedCount:", v6);
}

- (void)removePodcast:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist managedObjectContext](self, "managedObjectContext"));
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000467BC;
  v21 = sub_100046A54;
  v22 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist settings](self, "settings"));
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1000DB690;
  v14 = &unk_1004A60E0;
  v7 = v4;
  v15 = v7;
  v16 = &v17;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v11);

  if (v18[5])
    objc_msgSend(v5, "deleteObject:", v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist mutableSetValueForKey:](self, "mutableSetValueForKey:", kPlaylistDeletedEpisodes, v11, v12, v13, v14));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "episodes"));
  objc_msgSend(v8, "minusSet:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", kPlaylistPodcasts));
  objc_msgSend(v10, "removeObject:", v7);

  -[MTPlaylist setNeedsUpdate:](self, "setNeedsUpdate:", 1);
  _Block_object_dispose(&v17, 8);

}

- (void)removePodcastEpisodes:(id)a3 shouldSave:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  MTPlaylist *v9;
  id v10;
  id v11;
  BOOL v12;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DB7E4;
  v8[3] = &unk_1004A7740;
  v9 = self;
  v10 = a3;
  v12 = a4;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[MTPlaylist managedObjectContext](v9, "managedObjectContext"));
  v5 = v11;
  v7 = v10;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v6, "setIsPlaylistSyncDirty:", 1);

}

- (void)removeEpisodes:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[MTPlaylist removeEpisode:inBulkTransaction:](self, "removeEpisode:inBulkTransaction:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8), 1);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000DBB78;
  v11[3] = &unk_1004A6200;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[MTPlaylist managedObjectContext](self, "managedObjectContext"));
  v9 = v12;
  objc_msgSend(v9, "performBlockAndWait:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v10, "setIsPlaylistSyncDirty:", 1);

}

- (void)removeEpisode:(id)a3
{
  -[MTPlaylist removeEpisode:inBulkTransaction:](self, "removeEpisode:inBulkTransaction:", a3, 0);
}

- (void)removeEpisode:(id)a3 inBulkTransaction:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist managedObjectContext](self, "managedObjectContext"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000DBC60;
  v11[3] = &unk_1004A7740;
  v11[4] = self;
  v10 = v6;
  v12 = v10;
  v14 = a4;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v8, "performBlockAndWait:", v11);
  if (!a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    objc_msgSend(v9, "setIsPlaylistSyncDirty:", 1);

  }
}

- (double)totalDuration
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  double v6;
  void *i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist episodes](self, "episodes", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "duration");
        v6 = v6 + v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (MTEpisode)nextEpisode
{
  void *v3;
  void *v4;

  if (-[MTPlaylist isFolder](self, "isFolder"))
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist episodes](self, "episodes"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  }
  return (MTEpisode *)v3;
}

- (int64_t)getFolderSubPlaylistsCount
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainOrPrivateContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DBF20;
  v8[3] = &unk_1004A6690;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (int64_t)getITunesPlaylistsCount
{
  void *v2;
  void *v3;
  id v4;
  int64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOrPrivateContext"));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DC0D8;
  v7[3] = &unk_1004A6B98;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

+ (id)stringForContainerOrder:(int)a3 short:(BOOL)a4
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  switch(a3)
  {
    case 0:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      if (a4)
        v6 = CFSTR("MY_PODCASTS_ORDER_SHORT");
      else
        v6 = CFSTR("My Podcasts Order");
      goto LABEL_9;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Newest To Oldest");
      goto LABEL_9;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Manual");
      goto LABEL_9;
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Oldest To Newest");
      goto LABEL_9;
    case 4:
    case 5:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("STATION_SORT_BY_SHOW_TITLE");
LABEL_9:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1004C6D40, 0));

      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

+ (id)containerOrderOptionArray:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForContainerOrder:short:", 0, a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForContainerOrder:short:", 1, v3, v5));
  v12[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForContainerOrder:short:", 3, v3));
  v12[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForContainerOrder:short:", 2, v3));
  v12[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForContainerOrder:short:", 4, v3));
  v12[4] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 5));

  return v10;
}

+ (id)containerOrderOptionValues
{
  return +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", &off_1004D7518);
}

+ (id)topLevelPlaylistsExcludingFoldersPredicate
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "topLevelPlaylistsPredicate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForFlag:isTrue:", 0, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "AND:", v4));

  return v5;
}

+ (id)predicateForVisiblePlaylistWithUUID:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@ && %K == 0"), kPlaylistUuid, a3, kPlaylistHidden);
}

+ (id)predicateForMediaLibraryId:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = kPlaylistMediaLibraryId;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), v3, v4));

  return v5;
}

- (id)metricsContentIdentifier
{
  void *v3;

  if (-[MTPlaylist isBuiltIn](self, "isBuiltIn"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist uuid](self, "uuid"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist title](self, "title"));
  return v3;
}

- (id)metricsAdditionalData
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[5];

  v22[0] = kPlaylistMediaLibraryId;
  v22[1] = kPlaylistIsFolder;
  v22[2] = kPlaylistUngroupedList;
  v22[3] = kPlaylistIncludesAllPodcasts;
  v22[4] = kPlaylistContainerOrder;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 5));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist dictionaryWithValuesForKeys:](self, "dictionaryWithValuesForKeys:", v17));
  v4 = objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist defaultSettings](self, "defaultSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metricsKeys"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryWithValuesForKeys:", v6));

  objc_msgSend(v4, "addEntriesFromDictionary:", v16);
  v20[0] = CFSTR("settings");
  v20[1] = CFSTR("counts");
  v21[0] = v4;
  v18[0] = CFSTR("episodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist episodes](self, "episodes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "count")));
  v19[0] = v8;
  v18[1] = CFSTR("podcasts");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist podcasts](self, "podcasts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v9, "count")));
  v19[1] = v10;
  v18[2] = CFSTR("deletedEpisodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist deletedEpisodes](self, "deletedEpisodes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v11, "count")));
  v19[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
  v21[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));

  return v14;
}

@end
