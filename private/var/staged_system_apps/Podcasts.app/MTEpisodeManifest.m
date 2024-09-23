@implementation MTEpisodeManifest

+ (id)activityTypeSuffix
{
  return CFSTR("episode");
}

- (MTEpisodeManifest)initWithEpisodeUuid:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  MTEpisodeManifest *v8;
  MTEpisodeManifest *v9;
  void *v10;
  MTEpisodeManifest *v11;
  objc_super v13;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc((Class)NSFetchRequest);
    v6 = objc_msgSend(v5, "initWithEntityName:", kMTEpisodeEntityName);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuid:](MTEpisode, "predicateForEpisodeUuid:", v4));
    objc_msgSend(v6, "setPredicate:", v7);

    objc_msgSend(v6, "setSortDescriptors:", &__NSArray0__struct);
    v13.receiver = self;
    v13.super_class = (Class)MTEpisodeManifest;
    v8 = -[MTPredicateManifest initWithInitialEpisodeUuid:fetchRequest:](&v13, "initWithInitialEpisodeUuid:fetchRequest:", v4, v6);
    v9 = v8;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeManifest activity](v8, "activity"));
      objc_msgSend(v10, "setValue:forKey:", v4, CFSTR("MTEpisodeManifestEpisodeUuid"));

    }
    self = v9;

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)episodeUuidForActivity:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MTEpisodeManifestEpisodeUuid")));

  if (objc_msgSend(v9, "length")
    && (+[MTEpisode exists:](MTEpisode, "exists:", v9) & 1) != 0)
  {
    v7[2](v7, v9);
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___MTEpisodeManifest;
    objc_msgSendSuper2(&v10, "episodeUuidForActivity:completion:", v6, v7);
  }

}

- (id)activity
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTEpisodeManifest;
  v2 = -[MTPlayerManifest activity](&v4, "activity");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005CD7C;
  v7[3] = &unk_1004A70F0;
  v8 = a4;
  v6 = v8;
  objc_msgSend(a1, "episodeUuidForActivity:completion:", a3, v7);

}

@end
