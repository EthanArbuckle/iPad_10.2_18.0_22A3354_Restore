@implementation MTImageActivityItemProvider

- (MTImageActivityItemProvider)initWithDataSource:(id)a3
{
  id v5;
  MTImageActivityItemProvider *v6;
  MTImageActivityItemProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTImageActivityItemProvider;
  v6 = -[MTImageActivityItemProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTImageActivityItemProvider dataSource](self, "dataSource", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shareImage"));

  if (!v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage defaultPodcastArtwork](UIImage, "defaultPodcastArtwork"));
  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  MTInstagramShareModel *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MTInstagramShareModel *v18;
  void *v19;
  void *v20;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", UIActivityTypeSaveToNotes))
  {
    v6 = (MTInstagramShareModel *)objc_claimAutoreleasedReturnValue(-[MTImageActivityItemProvider dataSource](self, "dataSource"));
    v7 = objc_claimAutoreleasedReturnValue(-[MTInstagramShareModel shareImage](v6, "shareImage"));
  }
  else
  {
    if (!os_feature_enabled_story_sharing()
      || !objc_msgSend(v5, "isEqualToString:", CFSTR("com.burbn.instagram.shareextension")))
    {
      v16 = 0;
      goto LABEL_8;
    }
    v18 = [MTInstagramShareModel alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTImageActivityItemProvider dataSource](self, "dataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sharePodcastTitle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTImageActivityItemProvider dataSource](self, "dataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "shareEpisodeTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTImageActivityItemProvider dataSource](self, "dataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shareProvider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTImageActivityItemProvider dataSource](self, "dataSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pubDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTImageActivityItemProvider dataSource](self, "dataSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "shareImage"));
    v6 = -[MTInstagramShareModel initWithShowName:episodeName:creatorName:publishDate:artwork:](v18, "initWithShowName:episodeName:creatorName:publishDate:artwork:", v8, v9, v11, v13, v15);

    v7 = objc_claimAutoreleasedReturnValue(+[MTInstagramShareUtil createSocialPostUIImageWithShareModel:](MTInstagramShareUtil, "createSocialPostUIImageWithShareModel:", v6));
  }
  v16 = (void *)v7;

LABEL_8:
  return v16;
}

- (MTShareUtilDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
