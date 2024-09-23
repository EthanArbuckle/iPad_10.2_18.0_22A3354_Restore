@implementation MTListenNowManifest

+ (id)activityTypeSuffix
{
  return CFSTR("listenNow");
}

- (void)nextManifest:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTListenNowManager sharedInstance](MTListenNowManager, "sharedInstance"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001047B8;
    v6[3] = &unk_1004AA9E8;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "results:", v6);

  }
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("MTPodcastManifestActivitySectionType")));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100104E70;
  v12[3] = &unk_1004A82C0;
  v13 = v9;
  v14 = v6;
  v10 = v9;
  v11 = v6;
  objc_msgSend(a1, "episodeUuidForActivity:completion:", v7, v12);

}

@end
