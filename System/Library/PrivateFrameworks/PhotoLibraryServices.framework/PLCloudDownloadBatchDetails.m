@implementation PLCloudDownloadBatchDetails

- (void)unionBatchDetails:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (-[PLCloudDownloadBatchDetails hasResourceChanges](self, "hasResourceChanges"))
    v4 = 1;
  else
    v4 = objc_msgSend(v15, "hasResourceChanges");
  -[PLCloudDownloadBatchDetails setHasResourceChanges:](self, "setHasResourceChanges:", v4);
  if (-[PLCloudDownloadBatchDetails needsWidgetTimelineReload](self, "needsWidgetTimelineReload"))
    v5 = 1;
  else
    v5 = objc_msgSend(v15, "needsWidgetTimelineReload");
  -[PLCloudDownloadBatchDetails setNeedsWidgetTimelineReload:](self, "setNeedsWidgetTimelineReload:", v5);
  -[PLCloudDownloadBatchDetails setNumberOfPhotos:](self, "setNumberOfPhotos:", objc_msgSend(v15, "numberOfPhotos") + -[PLCloudDownloadBatchDetails numberOfPhotos](self, "numberOfPhotos"));
  -[PLCloudDownloadBatchDetails setNumberOfVideos:](self, "setNumberOfVideos:", objc_msgSend(v15, "numberOfVideos") + -[PLCloudDownloadBatchDetails numberOfVideos](self, "numberOfVideos"));
  -[PLCloudDownloadBatchDetails cmmUUIDsToNotify](self, "cmmUUIDsToNotify");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v15, "cmmUUIDsToNotify");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudDownloadBatchDetails setCmmUUIDsToNotify:](self, "setCmmUUIDsToNotify:", v10);

  -[PLCloudDownloadBatchDetails confirmedResourceIDs](self, "confirmedResourceIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "confirmedResourceIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setByAddingObjectsFromSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  -[PLCloudDownloadBatchDetails setConfirmedResourceIDs:](self, "setConfirmedResourceIDs:", v14);

}

- (BOOL)hasResourceChanges
{
  return self->_hasResourceChanges;
}

- (void)setHasResourceChanges:(BOOL)a3
{
  self->_hasResourceChanges = a3;
}

- (BOOL)needsWidgetTimelineReload
{
  return self->_needsWidgetTimelineReload;
}

- (void)setNeedsWidgetTimelineReload:(BOOL)a3
{
  self->_needsWidgetTimelineReload = a3;
}

- (int64_t)numberOfPhotos
{
  return self->_numberOfPhotos;
}

- (void)setNumberOfPhotos:(int64_t)a3
{
  self->_numberOfPhotos = a3;
}

- (int64_t)numberOfVideos
{
  return self->_numberOfVideos;
}

- (void)setNumberOfVideos:(int64_t)a3
{
  self->_numberOfVideos = a3;
}

- (NSArray)cmmUUIDsToNotify
{
  return self->_cmmUUIDsToNotify;
}

- (void)setCmmUUIDsToNotify:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)confirmedResourceIDs
{
  return self->_confirmedResourceIDs;
}

- (void)setConfirmedResourceIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmedResourceIDs, 0);
  objc_storeStrong((id *)&self->_cmmUUIDsToNotify, 0);
}

@end
