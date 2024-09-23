@implementation SetLastSeenUnreadToBeforeMostRecentActivities

uint64_t ___SetLastSeenUnreadToBeforeMostRecentActivities_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "px_standardLibrarySpecificFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFetchLimit:", 20);
  +[PXSharedAlbumsActivityEntry fetchRecentActivitiesWithOptions:olderThanDate:filter:](PXSharedAlbumsActivityEntry, "fetchRecentActivitiesWithOptions:olderThanDate:filter:", v1, 0, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PXSetSharedAlbumsActivityLastSeenDateToDate(v4);

  return 1;
}

@end
