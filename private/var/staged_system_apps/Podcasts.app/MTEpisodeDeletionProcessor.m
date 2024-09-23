@implementation MTEpisodeDeletionProcessor

- (id)predicate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForFeedDeleted:](MTEpisode, "predicateForFeedDeleted:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForDownloaded:excludeHidden:](MTEpisode, "predicateForDownloaded:excludeHidden:", 0, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "AND:", v3));

  return v4;
}

- (id)entityName
{
  return kMTEpisodeEntityName;
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTMediaLibraryRestorePostflightUtil uuidsByRemovingDownloadCandidatesFromEpisodeUuids:](MTMediaLibraryRestorePostflightUtil, "uuidsByRemovingDownloadCandidatesFromEpisodeUuids:", a4));
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = _MTLogCategoryDatabase(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleting episodes matching deletion processor query: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
    objc_msgSend(v9, "deleteEpisodeUuids:", v5);

  }
}

@end
