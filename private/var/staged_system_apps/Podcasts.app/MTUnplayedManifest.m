@implementation MTUnplayedManifest

+ (id)activityTypeSuffix
{
  return CFSTR("unplayed");
}

- (MTUnplayedManifest)initWithInitialEpisodeUuid:(id)a3
{
  return -[MTUnplayedManifest initWithInitialEpisodeUuid:newestToOldest:](self, "initWithInitialEpisodeUuid:newestToOldest:", a3, 1);
}

- (MTUnplayedManifest)initWithInitialEpisodeUuid:(id)a3 newestToOldest:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  MTUnplayedManifest *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[4];
  _QWORD v20[4];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodesOnUnplayedTab](MTEpisode, "predicateForEpisodesOnUnplayedTab"));
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodePubDate, 0));
    v20[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeEpisodeNumber, 0));
    v20[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeLevel, 1));
    v20[2] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", kEpisodeTitle, 1, "localizedStandardCompare:"));
    v20[3] = v11;
    v12 = v20;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodePubDate, 1));
    v19[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeEpisodeNumber, 1));
    v19[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeLevel, 0));
    v19[2] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", kEpisodeTitle, 1, "localizedStandardCompare:"));
    v19[3] = v11;
    v12 = v19;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 4));
  v18.receiver = self;
  v18.super_class = (Class)MTUnplayedManifest;
  v14 = -[MTPredicateManifest initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:](&v18, "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:", v6, v7, v13);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("EPISODE_UNPLAYED_TITLE"), &stru_1004C6D40, 0));
    -[MTUnplayedManifest setTitle:](v14, "setTitle:", v16);

  }
  return v14;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100126D7C;
  v7[3] = &unk_1004A70F0;
  v8 = a4;
  v6 = v8;
  objc_msgSend(a1, "episodeUuidForActivity:completion:", a3, v7);

}

@end
