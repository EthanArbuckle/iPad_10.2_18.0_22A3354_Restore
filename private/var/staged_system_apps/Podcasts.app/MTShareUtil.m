@implementation MTShareUtil

+ (id)shareViewControllerWithDataSource:(id)a3 applicationActivities:(id)a4
{
  id v5;
  id v6;
  MTShareUtilActivityViewController *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  _QWORD v12[7];

  v5 = a4;
  v6 = a3;
  v7 = -[MTShareUtilActivityViewController initWithDataSource:applicationActivities:]([MTShareUtilActivityViewController alloc], "initWithDataSource:applicationActivities:", v6, v5);
  if (objc_msgSend(v6, "shareSupported"))
    v8 = 1;
  else
    v8 = 2;
  -[MTShareUtilActivityViewController setSharingStyle:](v7, "setSharingStyle:", v8);
  -[MTShareUtilActivityViewController setObjectManipulationDelegate:](v7, "setObjectManipulationDelegate:", v7);
  v9 = objc_msgSend(v6, "shareSupported");

  if (v9 && !objc_msgSend(v5, "count"))
    -[MTShareUtilActivityViewController setSharingStyle:](v7, "setSharingStyle:", 0);
  v12[0] = UIActivityTypePrint;
  v12[1] = UIActivityTypeAssignToContact;
  v12[2] = UIActivityTypeAddToReadingList;
  v12[3] = UIActivityTypePostToFlickr;
  v12[4] = UIActivityTypePostToVimeo;
  v12[5] = UIActivityTypeSaveToCameraRoll;
  v12[6] = UIActivityTypeCreateReminder;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 7));
  -[MTShareUtilActivityViewController setExcludedActivityTypes:](v7, "setExcludedActivityTypes:", v10);

  return v7;
}

+ (id)shareActivityItems:(id)a3
{
  id v3;
  MTTextActivityItemProvider *v4;
  MTEmailActivityItemProvider *v5;
  MTImageActivityItemProvider *v6;
  MTURLActivityItemProvider *v7;
  MTLinkPresentationActivityItemProvider *v8;
  id v9;

  v3 = a3;
  v4 = -[MTTextActivityItemProvider initWithDataSource:]([MTTextActivityItemProvider alloc], "initWithDataSource:", v3);
  v5 = -[MTEmailActivityItemProvider initWithDataSource:]([MTEmailActivityItemProvider alloc], "initWithDataSource:", v3);
  v6 = -[MTImageActivityItemProvider initWithDataSource:]([MTImageActivityItemProvider alloc], "initWithDataSource:", v3);
  v7 = -[MTURLActivityItemProvider initWithDataSource:]([MTURLActivityItemProvider alloc], "initWithDataSource:", v3);
  v8 = -[MTLinkPresentationActivityItemProvider initWithDataSource:]([MTLinkPresentationActivityItemProvider alloc], "initWithDataSource:", v3);

  v9 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v4, v5, v6, v7, v8, 0);
  return v9;
}

+ (id)shareViewControllerWithPlayerItem:(id)a3 applicationActivities:(id)a4 selectedReferenceTime:(double)a5 selectedPlayerTime:(double)a6 currentPlayerTime:(double)a7
{
  id v11;
  id v12;
  MTShareUtilDataSource *v13;
  void *v14;

  v11 = a4;
  v12 = a3;
  v13 = -[MTShareUtilDataSource initWithPlayerItem:selectedReferenceTime:selectedPlayerTime:currentPlayerTime:]([MTShareUtilDataSource alloc], "initWithPlayerItem:selectedReferenceTime:selectedPlayerTime:currentPlayerTime:", v12, a5, a6, a7);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTShareUtil shareViewControllerWithDataSource:applicationActivities:](MTShareUtil, "shareViewControllerWithDataSource:applicationActivities:", v13, v11));
  return v14;
}

+ (id)shareViewControllerWithEpisode:(id)a3 applicationActivities:(id)a4 selectedReferenceTime:(double)a5 selectedPlayerTime:(double)a6 currentPlayerTime:(double)a7
{
  id v11;
  void *v12;
  void *v13;
  MTShareUtilDataSource *v14;
  void *v15;

  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:](MTBaseEpisodeListManifest, "mediaItemForEpisodeWithUUID:", v12));

  v14 = -[MTShareUtilDataSource initWithPlayerItem:selectedReferenceTime:selectedPlayerTime:currentPlayerTime:]([MTShareUtilDataSource alloc], "initWithPlayerItem:selectedReferenceTime:selectedPlayerTime:currentPlayerTime:", v13, a5, a6, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTShareUtil shareViewControllerWithDataSource:applicationActivities:](MTShareUtil, "shareViewControllerWithDataSource:applicationActivities:", v14, v11));

  return v15;
}

+ (id)shareViewControllerWithPodcast:(id)a3 applicationActivities:(id)a4
{
  id v5;
  id v6;
  MTShareUtilDataSource *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[MTShareUtilDataSource initWithPodcast:]([MTShareUtilDataSource alloc], "initWithPodcast:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTShareUtil shareViewControllerWithDataSource:applicationActivities:](MTShareUtil, "shareViewControllerWithDataSource:applicationActivities:", v7, v5));
  return v8;
}

+ (id)shareViewControllerWithPodcastDetails:(id)a3 applicationActivities:(id)a4
{
  id v5;
  id v6;
  MTShareUtilDataSource *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[MTShareUtilDataSource initWithPodcastDetails:]([MTShareUtilDataSource alloc], "initWithPodcastDetails:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTShareUtil shareViewControllerWithDataSource:applicationActivities:](MTShareUtil, "shareViewControllerWithDataSource:applicationActivities:", v7, v5));
  return v8;
}

+ (id)shareActivityItemsWithPlayerItem:(id)a3
{
  id v3;
  MTShareUtilDataSource *v4;
  double v5;
  MTShareUtilDataSource *v6;
  void *v7;

  v3 = a3;
  v4 = [MTShareUtilDataSource alloc];
  objc_msgSend(v3, "playhead");
  v6 = -[MTShareUtilDataSource initWithPlayerItem:selectedReferenceTime:selectedPlayerTime:currentPlayerTime:](v4, "initWithPlayerItem:selectedReferenceTime:selectedPlayerTime:currentPlayerTime:", v3, 0.0, 0.0, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTShareUtil shareActivityItems:](MTShareUtil, "shareActivityItems:", v6));
  return v7;
}

+ (id)shareActivityItemsWithPodcast:(id)a3
{
  id v3;
  MTShareUtilDataSource *v4;
  void *v5;

  v3 = a3;
  v4 = -[MTShareUtilDataSource initWithPodcast:]([MTShareUtilDataSource alloc], "initWithPodcast:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTShareUtil shareActivityItems:](MTShareUtil, "shareActivityItems:", v4));
  return v5;
}

+ (id)shareActivityItemsWithEpisode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  MTShareUtilDataSource *v6;
  float v7;
  float v8;
  MTShareUtilDataSource *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:](MTBaseEpisodeListManifest, "mediaItemForEpisodeWithUUID:", v4));

  v6 = [MTShareUtilDataSource alloc];
  objc_msgSend(v3, "playhead");
  v8 = v7;

  v9 = -[MTShareUtilDataSource initWithPlayerItem:selectedReferenceTime:selectedPlayerTime:currentPlayerTime:](v6, "initWithPlayerItem:selectedReferenceTime:selectedPlayerTime:currentPlayerTime:", v5, 0.0, 0.0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTShareUtil shareActivityItems:](MTShareUtil, "shareActivityItems:", v9));

  return v10;
}

+ (id)shareActivityItemsWithPodcastDetails:(id)a3
{
  id v3;
  MTShareUtilDataSource *v4;
  void *v5;

  v3 = a3;
  v4 = -[MTShareUtilDataSource initWithPodcastDetails:]([MTShareUtilDataSource alloc], "initWithPodcastDetails:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTShareUtil shareActivityItems:](MTShareUtil, "shareActivityItems:", v4));
  return v5;
}

@end
