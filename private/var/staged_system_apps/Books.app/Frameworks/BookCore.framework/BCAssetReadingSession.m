@implementation BCAssetReadingSession

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCAssetReadingSession assetID](self, "assetID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCAssetReadingSession sessionID](self, "sessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCAssetReadingSession timeOpened](self, "timeOpened"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCAssetReadingSession timeClosed](self, "timeClosed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCAssetReadingSession timeUpdated](self, "timeUpdated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<BCAssetReadingSession:  %p> assetID: %@, sessionID: %@, timeOpened: %@, timeClosed: %@, timeUpdated: %@"), self, v3, v4, v5, v6, v7));

  return v8;
}

@end
