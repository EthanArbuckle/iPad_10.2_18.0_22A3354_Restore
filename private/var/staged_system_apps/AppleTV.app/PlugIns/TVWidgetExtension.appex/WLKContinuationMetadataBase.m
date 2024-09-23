@implementation WLKContinuationMetadataBase

- (id)tvun_contextString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (qword_10010C1E0 != -1)
    dispatch_once(&qword_10010C1E0, &stru_1000F69B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WLKContinuationMetadataBase localizedContext](self, "localizedContext"));
  v4 = (void *)qword_10010C1D8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLKContinuationMetadataBase context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v5));

  if (v6)
    v7 = v6;
  else
    v7 = v3;
  v8 = v7;

  return v8;
}

- (id)tvun_identifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WLKContinuationMetadataBase movieOrShowContent](self, "movieOrShowContent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canonicalID"));

  return v3;
}

@end
