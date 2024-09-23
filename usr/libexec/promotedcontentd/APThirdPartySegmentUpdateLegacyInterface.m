@implementation APThirdPartySegmentUpdateLegacyInterface

- (void)addClientToSegments:(id)a3 token:(id)a4 bundleID:(id)a5 replaceExisting:(BOOL)a6 privateSegment:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  APThirdPartySegmentUpdateRequester *v14;

  v7 = a7;
  v8 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[APThirdPartySegmentUpdateRequester initWithBundleID:identifier:segmentIdentifiers:replaceExisting:privateSegment:]([APThirdPartySegmentUpdateRequester alloc], "initWithBundleID:identifier:segmentIdentifiers:replaceExisting:privateSegment:", v11, v12, v13, v8, v7);

  -[APServerRequester makeRequest:](v14, "makeRequest:", &stru_100215488);
}

@end
