@implementation APThirdPartySegmentUpdateRequester

- (APThirdPartySegmentUpdateRequester)initWithBundleID:(id)a3 identifier:(id)a4 segmentIdentifiers:(id)a5 replaceExisting:(BOOL)a6 privateSegment:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  APThirdPartySegmentUpdateRequester *v17;
  objc_super v19;

  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v19.receiver = self;
  v19.super_class = (Class)APThirdPartySegmentUpdateRequester;
  v17 = -[APServerRequester initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:](&v19, "initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:", v15, v14, 0, 0, v16);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_segmentIdentifiers, a5);
    v17->_replaceExisting = a6;
    v17->_privateSegment = a7;
  }

  return v17;
}

- (Class)responseClass
{
  return (Class)objc_opt_class(APPBThirdPartySegmentUpdateResponse, a2);
}

- (id)protoBuffer
{
  APPBThirdPartySegmentUpdateRequest *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;

  v3 = objc_alloc_init(APPBThirdPartySegmentUpdateRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APEncryptedIDProvider provider](APEncryptedIDProvider, "provider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester idAccount](self, "idAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encryptedIDsForIDAccountPrivate:", v5));

  if (-[APThirdPartySegmentUpdateRequester privateSegment](self, "privateSegment"))
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentID"));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iAdID"));
  v8 = (void *)v7;
  -[APPBThirdPartySegmentUpdateRequest setIAdID:](v3, "setIAdID:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toroID"));
  -[APPBThirdPartySegmentUpdateRequest setToroID:](v3, "setToroID:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "DPID"));
  -[APPBThirdPartySegmentUpdateRequest setDPID:](v3, "setDPID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APThirdPartySegmentUpdateRequester segmentIdentifiers](self, "segmentIdentifiers"));
  v12 = objc_msgSend(v11, "mutableCopy");
  -[APPBThirdPartySegmentUpdateRequest setSegmentIdentifiers:](v3, "setSegmentIdentifiers:", v12);

  -[APPBThirdPartySegmentUpdateRequest setResetSegmentMembership:](v3, "setResetSegmentMembership:", -[APThirdPartySegmentUpdateRequester replaceExisting](self, "replaceExisting"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester bundleID](self, "bundleID"));
  -[APPBThirdPartySegmentUpdateRequest setAppID:](v3, "setAppID:", v13);

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))v14 = 1;
  else
    v14 = 2;
  -[APPBThirdPartySegmentUpdateRequest setRunState:](v3, "setRunState:", v14);
  -[APPBThirdPartySegmentUpdateRequest setPrivateSegment:](v3, "setPrivateSegment:", -[APThirdPartySegmentUpdateRequester privateSegment](self, "privateSegment"));

  return v3;
}

- (NSArray)segmentIdentifiers
{
  return self->_segmentIdentifiers;
}

- (void)setSegmentIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_segmentIdentifiers, a3);
}

- (BOOL)replaceExisting
{
  return self->_replaceExisting;
}

- (void)setReplaceExisting:(BOOL)a3
{
  self->_replaceExisting = a3;
}

- (BOOL)privateSegment
{
  return self->_privateSegment;
}

- (void)setPrivateSegment:(BOOL)a3
{
  self->_privateSegment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentIdentifiers, 0);
}

@end
