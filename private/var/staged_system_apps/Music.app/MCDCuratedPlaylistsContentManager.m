@implementation MCDCuratedPlaylistsContentManager

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  return 0;
}

- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  int64_t result;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
  v8 = objc_msgSend(v7, "numberOfItemsInSection:", a4);

  result = -[MCDBrowseContentManager maximumNumberOfItemsForDisplay](self, "maximumNumberOfItemsForDisplay");
  if ((uint64_t)v8 < result)
    return (int64_t)v8;
  return result;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemsInSectionAtIndex:", 0));
  v8 = objc_msgSend(v4, "row");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
  return v9;
}

- (void)_initiatePlaybackForItem:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = objc_opt_class(MPModelStoreBrowseContentItem);
  if ((objc_opt_isKindOfClass(v10, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager playbackManager](self, "playbackManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playlist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "combinedPlayActivityFeatureName"));
    objc_msgSend(v5, "initiatePlaybackForPlaylist:lastResponse:shuffled:playActivityFeatureName:", v6, 0, 0, v8);

LABEL_5:
    goto LABEL_6;
  }
  v9 = objc_opt_class(MPModelPlaylist);
  if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager playbackManager](self, "playbackManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "combinedPlayActivityFeatureName"));
    objc_msgSend(v5, "initiatePlaybackForPlaylist:lastResponse:shuffled:playActivityFeatureName:", v10, 0, 0, v7);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_modelRequest
{
  MusicStoreCuratorPlaylistsRequest *v3;
  void *v4;
  char v5;
  void *v6;

  v3 = objc_alloc_init(MusicStoreCuratorPlaylistsRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v5 = objc_opt_respondsToSelector(v4, "curatorID");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    -[MusicStoreCuratorPlaylistsRequest setCuratorStoreAdamID:](v3, "setCuratorStoreAdamID:", objc_msgSend(v6, "curatorID"));

  }
  return v3;
}

@end
