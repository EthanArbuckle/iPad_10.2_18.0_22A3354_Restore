@implementation MTBaseEpisodeListManifest

- (MTBaseEpisodeListManifest)initWithInitialEpisodeUuid:(id)a3
{
  id v4;
  MTBaseEpisodeListManifest *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTBaseEpisodeListManifest;
  v5 = -[MTPlayerManifest init](&v8, "init");
  if (v5)
  {
    v6 = objc_alloc_init((Class)NSMutableDictionary);
    -[MTBaseEpisodeListManifest setUuidToPlayerItemMap:](v5, "setUuidToPlayerItemMap:", v6);

    -[MTBaseEpisodeListManifest setInitialEpisodeUuid:](v5, "setInitialEpisodeUuid:", v4);
    -[MTBaseEpisodeListManifest setIsInitialPrepare:](v5, "setIsInitialPrepare:", 1);
  }

  return v5;
}

- (void)postManifestDidChangeNotification
{
  uint64_t v3;
  void *v4;
  NSArray *episodeUuids;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  void *v11;
  objc_super v12;

  v3 = objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest currentItem](self, "currentItem"));
  if (v3)
  {
    v4 = (void *)v3;
    episodeUuids = self->_episodeUuids;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest currentItem](self, "currentItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "episodeUuid"));
    LOBYTE(episodeUuids) = -[NSArray containsObject:](episodeUuids, "containsObject:", v7);

    if ((episodeUuids & 1) == 0)
      -[MTBaseEpisodeListManifest setCurrentIndex:](self, "setCurrentIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  if (-[MTBaseEpisodeListManifest count](self, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest currentItem](self, "currentItem"));
    if (v8)
    {

    }
    else if (-[MTBaseEpisodeListManifest isInitialPrepare](self, "isInitialPrepare"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest initialEpisodeUuid](self, "initialEpisodeUuid"));

      if (v9)
      {
        v10 = self->_episodeUuids;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest initialEpisodeUuid](self, "initialEpisodeUuid"));
        -[MTBaseEpisodeListManifest setCurrentIndex:](self, "setCurrentIndex:", -[NSArray indexOfObject:](v10, "indexOfObject:", v11));

      }
      else if (-[MTBaseEpisodeListManifest defaultToInitialIndexZero](self, "defaultToInitialIndexZero"))
      {
        -[MTBaseEpisodeListManifest setCurrentIndex:](self, "setCurrentIndex:", 0);
      }
      -[MTBaseEpisodeListManifest setIsInitialPrepare:](self, "setIsInitialPrepare:", 0);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)MTBaseEpisodeListManifest;
  -[MTBaseEpisodeListManifest postManifestDidChangeNotification](&v12, "postManifestDidChangeNotification");
}

- (NSString)initialEpisodeUuid
{
  return self->_initialEpisodeUuid;
}

+ (void)episodeUuidForActivity:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifier"));
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containerIdentifier"));
    if (objc_msgSend(v8, "length"))
      v9 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeGuid:onFeedURL:](MTEpisode, "predicateForEpisodeGuid:onFeedURL:", v7, v8));
    else
      v9 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeGuid:](MTEpisode, "predicateForEpisodeGuid:", v7));
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playbackContext"));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000E928;
    v15[3] = &unk_1004A8C40;
    v16 = v12;
    v17 = v10;
    v18 = v6;
    v13 = v10;
    v14 = v12;
    objc_msgSend(v14, "performBlock:", v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

+ (id)_mediaItemForEpisode:(id)a3
{
  id v3;
  MTPlayerItem *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[MTPlayerItem initWithEpisode:]([MTPlayerItem alloc], "initWithEpisode:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)mediaItemForEpisodeWithManagedObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10004688C;
  v20 = sub_100046ABC;
  v21 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002B890;
  v11[3] = &unk_1004AA838;
  v7 = v6;
  v12 = v7;
  v8 = v4;
  v13 = v8;
  v14 = &v16;
  v15 = a1;
  objc_msgSend(v7, "performBlockAndWait:", v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v6 = a3;
  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100027874;
    v7[3] = &unk_1004A7028;
    v7[4] = self;
    v8 = v6;
    objc_msgSend(v5, "performBlockAndWait:", v7);

  }
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (-[MTBaseEpisodeListManifest count](self, "count") <= a3)
  {
    v10 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", a3));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest uuidToPlayerItemMap](self, "uuidToPlayerItemMap"));
    objc_sync_enter(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest uuidToPlayerItemMap](self, "uuidToPlayerItemMap"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

    objc_sync_exit(v7);
    if (v9)
    {
      objc_msgSend(v9, "setManifestIndex:", a3);
      v10 = v9;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest uuidToManagedObjectIDMap](self, "uuidToManagedObjectIDMap"));
      objc_sync_enter(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest uuidToManagedObjectIDMap](self, "uuidToManagedObjectIDMap"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v6));

      objc_sync_exit(v11);
      v14 = (void *)objc_opt_class(self);
      if (v13)
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mediaItemForEpisodeWithManagedObjectID:", v13));
      else
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mediaItemForEpisodeWithUUID:", v6));
      v10 = v15;
      objc_msgSend(v15, "setManifestIndex:", a3);
      objc_msgSend(v10, "setManifest:", self);
      if (v10)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest uuidToPlayerItemMap](self, "uuidToPlayerItemMap"));
        objc_sync_enter(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest uuidToPlayerItemMap](self, "uuidToPlayerItemMap"));
        objc_msgSend(v17, "setObject:forKey:", v10, v6);

        objc_sync_exit(v16);
      }

    }
  }
  return v10;
}

- (NSMutableDictionary)uuidToPlayerItemMap
{
  return self->_uuidToPlayerItemMap;
}

- (unint64_t)count
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (NSArray)episodeUuids
{
  return self->_episodeUuids;
}

- (NSDictionary)uuidToManagedObjectIDMap
{
  return self->_uuidToManagedObjectIDMap;
}

- (void)setUuidToPlayerItemMap:(id)a3
{
  objc_storeStrong((id *)&self->_uuidToPlayerItemMap, a3);
}

- (void)setUuidToManagedObjectIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_uuidToManagedObjectIDMap, a3);
}

- (void)setIsInitialPrepare:(BOOL)a3
{
  self->_isInitialPrepare = a3;
}

- (void)setInitialEpisodeUuid:(id)a3
{
  objc_storeStrong((id *)&self->_initialEpisodeUuid, a3);
}

- (void)setEpisodeUuids:(id)a3
{
  objc_storeStrong((id *)&self->_episodeUuids, a3);
}

- (BOOL)isInitialPrepare
{
  return self->_isInitialPrepare;
}

- (id)_predicateForFilteringExplicitEpisodes
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate truePredicate](NSPredicate, "truePredicate"));
  if ((+[PFRestrictionsUtil isExplicitContentAllowed](PFRestrictionsUtil, "isExplicitContentAllowed") & 1) == 0)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForExplicit:](MTEpisode, "predicateForExplicit:", 0));

    v2 = (void *)v3;
  }
  return v2;
}

- (MTBaseEpisodeListManifest)init
{
  objc_exception_throw(0);
}

+ (id)mediaItemForEpisodeWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10004688C;
  v20 = sub_100046ABC;
  v21 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10010CA58;
  v11[3] = &unk_1004AA838;
  v7 = v6;
  v12 = v7;
  v8 = v4;
  v13 = v8;
  v14 = &v16;
  v15 = a1;
  objc_msgSend(v7, "performBlockAndWait:", v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (BOOL)defaultToInitialIndexZero
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidToManagedObjectIDMap, 0);
  objc_storeStrong((id *)&self->_episodeUuids, 0);
  objc_storeStrong((id *)&self->_uuidToPlayerItemMap, 0);
  objc_storeStrong((id *)&self->_initialEpisodeUuid, 0);
}

@end
