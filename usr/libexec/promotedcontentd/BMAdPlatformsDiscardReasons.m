@implementation BMAdPlatformsDiscardReasons

- (id)description
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v3 = BMAdPlatformsDiscardReasonsDiscardReasonAsString(-[BMAdPlatformsDiscardReasons discardReason](self, "discardReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = BMAdPlatformsDiscardReasonsPlacementAsString(-[BMAdPlatformsDiscardReasons placement](self, "placement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMAdPlatformsDiscardReasons bundleID](self, "bundleID"));
  v8 = -[BMAdPlatformsDiscardReasons brandIdentifier](self, "brandIdentifier");
  v9 = -[BMAdPlatformsDiscardReasons displayOrder](self, "displayOrder");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BMAdPlatformsDiscardReasons searchTerms](self, "searchTerms"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("reason: %@\nplacement: %@\nbundleID: %@\nbrandIdentifier: %llu\ndisplayOrder: %d\nsearchTerms: %@\n"), v4, v6, v7, v8, v9, v10));

  return v11;
}

@end
