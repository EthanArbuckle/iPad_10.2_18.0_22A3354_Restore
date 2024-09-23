@implementation WLKDeltaContinuationMetadata

- (id)tvun_defaultActionURL
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WLKDeltaContinuationMetadata contentTVAppDeeplinkURL](self, "contentTVAppDeeplinkURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WLKDeltaContinuationMetadata playbackURL](self, "playbackURL"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;

    v3 = v6;
  }

  return v3;
}

@end
