@implementation MTPlaylistManifest

+ (id)activityTypeSuffix
{
  return CFSTR("playlist");
}

- (MTPlaylistManifest)initWithPlaylistUuid:(id)a3 initialEpisodeUuid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MTPlaylistManifest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  MTPlaylistManifest *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate falsePredicate](NSPredicate, "falsePredicate"));
  v20.receiver = self;
  v20.super_class = (Class)MTPlaylistManifest;
  v9 = -[MTPredicateManifest initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:](&v20, "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:", v7, v8, 0);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), kPlaylistUuid, v6));
    -[MTPredicateManifest _observeAllPropertyChangesForEntityName:predicate:](v9, "_observeAllPropertyChangesForEntityName:predicate:", kMTPlaylistEntityName, v10);
    -[MTPlaylistManifest setPlaylistUuid:](v9, "setPlaylistUuid:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest activity](v9, "activity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistManifest playlistUuid](v9, "playlistUuid"));
    objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("MTPlaylistManifestPlaylistUuid"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mainOrPrivateContext"));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100087154;
    v17[3] = &unk_1004A6640;
    v18 = v14;
    v19 = v9;
    v15 = v14;
    objc_msgSend(v15, "performBlockAndWait:", v17);

  }
  return v9;
}

- (id)activitySpotlightIdentifier
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  MTPlaylistManifest *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10004668C;
  v16 = sub_1000469BC;
  v17 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainOrPrivateContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000872DC;
  v8[3] = &unk_1004A6690;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("MTPlaylistManifestPlaylistUuid")));

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008744C;
    v10[3] = &unk_1004A82C0;
    v12 = v7;
    v11 = v9;
    objc_msgSend(a1, "episodeUuidForActivity:completion:", v6, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)_load:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[MTPlaylistManifest _updatePlaylistEpisodes](self, "_updatePlaylistEpisodes");
  v5.receiver = self;
  v5.super_class = (Class)MTPlaylistManifest;
  -[MTPredicateManifest _load:](&v5, "_load:", v4);

}

- (BOOL)_updatePlaylistEpisodes
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  MTPlaylistManifest *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10004668C;
  v20 = sub_1000469BC;
  v21 = &__NSArray0__struct;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainOrPrivateContext"));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000876E4;
  v12[3] = &unk_1004A6690;
  v5 = v4;
  v13 = v5;
  v14 = self;
  v15 = &v16;
  objc_msgSend(v5, "performBlockAndWait:", v12);
  if (!v17[5])
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest explicitSortOrder](self, "explicitSortOrder"));
  v7 = objc_msgSend(v6, "isEqualToArray:", v17[5]);

  v8 = v17[5];
  if ((v7 & 1) == 0)
  {
    -[MTPredicateManifest setExplicitSortOrder:](self, "setExplicitSortOrder:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), kEpisodeUuid, v17[5]));
    -[MTPredicateManifest setPredicate:](self, "setPredicate:", v10);
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate falsePredicate](NSPredicate, "falsePredicate"));
    -[MTPredicateManifest setPredicate:](self, "setPredicate:", v10);
LABEL_7:

    v9 = 1;
    goto LABEL_8;
  }
  v9 = 0;
LABEL_8:

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (void)_propertyDidChange
{
  if (-[MTPlaylistManifest _updatePlaylistEpisodes](self, "_updatePlaylistEpisodes"))
    -[MTPredicateManifest _refetch:](self, "_refetch:", 0);
}

- (NSString)playlistUuid
{
  return self->_playlistUuid;
}

- (void)setPlaylistUuid:(id)a3
{
  objc_storeStrong((id *)&self->_playlistUuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistUuid, 0);
}

@end
