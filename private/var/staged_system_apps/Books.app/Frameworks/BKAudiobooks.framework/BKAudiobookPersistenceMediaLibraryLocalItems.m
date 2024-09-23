@implementation BKAudiobookPersistenceMediaLibraryLocalItems

- (NSString)shortName
{
  return (NSString *)CFSTR("Media Library (local items)");
}

- (BOOL)isLocal
{
  return 1;
}

- (id)_mediaQueryFromAudiobook:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKAudiobookPersistenceMediaLibraryLocalItems;
  v4 = a3;
  v5 = -[BKAudiobookPersistenceMediaLibrary _mediaQueryFromAudiobook:](&v11, "_mediaQueryFromAudiobook:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceMediaLibrary _storeIDFromAudiobook:](self, "_storeIDFromAudiobook:", v4, v11.receiver, v11.super_class));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &__kCFBooleanFalse, MPMediaItemPropertyIsCloudItem));
  objc_msgSend(v6, "addFilterPredicate:", v8);

  if (objc_msgSend(v7, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v7, MPMediaItemPropertyStorePlaylistID));
    objc_msgSend(v6, "addFilterPredicate:", v9);

  }
  return v6;
}

@end
