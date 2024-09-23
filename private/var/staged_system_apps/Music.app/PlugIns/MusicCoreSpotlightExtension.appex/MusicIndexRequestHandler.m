@implementation MusicIndexRequestHandler

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003C38;
  v7[3] = &unk_100004070;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateSpotlightIndexForBundleID:withCompletion:", CFSTR("com.apple.Music"), v7);

}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003CFC;
  v10[3] = &unk_100004070;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "updateSpotlightIndexMetadataForItemsWithIdentifiers:bundleID:withCompletion:", v7, CFSTR("com.apple.Music"), v10);

}

@end
