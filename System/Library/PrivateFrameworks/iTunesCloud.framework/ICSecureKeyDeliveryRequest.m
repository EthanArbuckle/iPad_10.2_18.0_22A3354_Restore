@implementation ICSecureKeyDeliveryRequest

- (ICSecureKeyDeliveryRequest)init
{
  ICStoreRequestContext *v3;
  void *v4;
  ICStoreRequestContext *v5;
  ICSecureKeyDeliveryRequest *v6;

  v3 = [ICStoreRequestContext alloc];
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICStoreRequestContext initWithIdentity:](v3, "initWithIdentity:", v4);
  v6 = -[ICSecureKeyDeliveryRequest initWithRequestContext:](self, "initWithRequestContext:", v5);

  return v6;
}

- (ICSecureKeyDeliveryRequest)initWithRequestContext:(id)a3
{
  id v5;
  ICSecureKeyDeliveryRequest *v6;
  ICSecureKeyDeliveryRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSecureKeyDeliveryRequest;
  v6 = -[ICSecureKeyDeliveryRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_qualityOfService = 25;
    objc_storeStrong((id *)&v6->_requestContext, a3);
  }

  return v7;
}

- (ICSecureKeyDeliveryRequest)initWithRequestContext:(id)a3 resourceLoadingRequest:(id)a4
{
  id v7;
  ICSecureKeyDeliveryRequest *v8;
  ICSecureKeyDeliveryRequest *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *contentURI;

  v7 = a4;
  v8 = -[ICSecureKeyDeliveryRequest initWithRequestContext:](self, "initWithRequestContext:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_resourceLoadingRequest, a4);
    objc_msgSend(v7, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = objc_claimAutoreleasedReturnValue();
    contentURI = v9->_contentURI;
    v9->_contentURI = (NSString *)v12;

  }
  return v9;
}

- (ICSecureKeyDeliveryRequest)initWithRequestContext:(id)a3 contentKeyRequest:(id)a4
{
  id v7;
  ICSecureKeyDeliveryRequest *v8;
  ICSecureKeyDeliveryRequest *v9;
  uint64_t v10;
  NSString *contentURI;

  v7 = a4;
  v8 = -[ICSecureKeyDeliveryRequest initWithRequestContext:](self, "initWithRequestContext:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contentKeyRequest, a4);
    objc_msgSend(v7, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    contentURI = v9->_contentURI;
    v9->_contentURI = (NSString *)v10;

  }
  return v9;
}

- (ICSecureKeyDeliveryRequest)initWithRequestContext:(id)a3 serverPlaybackContextData:(id)a4
{
  id v7;
  ICSecureKeyDeliveryRequest *v8;
  ICSecureKeyDeliveryRequest *v9;

  v7 = a4;
  v8 = -[ICSecureKeyDeliveryRequest initWithRequestContext:](self, "initWithRequestContext:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_serverPlaybackContextData, a4);

  return v9;
}

- (id)description
{
  objc_class *v3;
  uint64_t v4;
  NSString *contentURI;
  uint64_t v6;
  NSNumber *adamID;
  void *v8;
  NSURL *certificateURL;
  void *v10;
  NSURL *keyServerURL;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[7];
  _QWORD v22[9];

  v22[7] = *MEMORY[0x1E0C80C00];
  v18 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isOfflineDownload)
    v4 = MEMORY[0x1E0C9AAB0];
  else
    v4 = MEMORY[0x1E0C9AAA0];
  v22[0] = v4;
  v21[0] = CFSTR("isOfflineDownload");
  v21[1] = CFSTR("requestProtocolType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_requestProtocolType);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  v21[2] = CFSTR("contentURI");
  contentURI = self->_contentURI;
  v6 = (uint64_t)contentURI;
  if (!contentURI)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v6;
  v22[2] = v6;
  v21[3] = CFSTR("adamID");
  adamID = self->_adamID;
  v8 = adamID;
  if (!adamID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v8;
  v21[4] = CFSTR("certificateURL");
  certificateURL = self->_certificateURL;
  v10 = certificateURL;
  if (!certificateURL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v10;
  v21[5] = CFSTR("keyServerURL");
  keyServerURL = self->_keyServerURL;
  v12 = keyServerURL;
  if (!keyServerURL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[5] = v12;
  v21[6] = CFSTR("leaseActionType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_leaseActionType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("<%@: %p; params = %@>"), v20, self, v14);

  if (keyServerURL)
  {
    if (certificateURL)
      goto LABEL_14;
  }
  else
  {

    if (certificateURL)
    {
LABEL_14:
      if (adamID)
        goto LABEL_15;
LABEL_19:

      if (contentURI)
        goto LABEL_16;
LABEL_20:

      goto LABEL_16;
    }
  }

  if (!adamID)
    goto LABEL_19;
LABEL_15:
  if (!contentURI)
    goto LABEL_20;
LABEL_16:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 2, self->_certificateURL);
    objc_storeStrong(v5 + 3, self->_contentURI);
    v5[5] = (id)self->_leaseActionType;
    objc_storeStrong(v5 + 4, self->_keyServerURL);
    v5[8] = (id)self->_qualityOfService;
    objc_storeStrong(v5 + 6, self->_requestContext);
    v5[7] = (id)self->_rentalID;
    *((_BYTE *)v5 + 8) = self->_skippedRentalCheckout;
    *((_BYTE *)v5 + 9) = self->_ITunesStoreRequest;
    v6 = MEMORY[0x1A1AFA8D0](self->_serverPlaybackContextDataCreationHandler);
    v7 = v5[9];
    v5[9] = (id)v6;

    v8 = MEMORY[0x1A1AFA8D0](self->_asyncServerPlaybackContextDataCreationHandler);
    v9 = v5[10];
    v5[10] = (id)v8;

    *((_BYTE *)v5 + 10) = self->_shouldIncludeDeviceGUID;
    v5[11] = (id)self->_requestProtocolType;
    *((_BYTE *)v5 + 11) = self->_isOfflineDownload;
    objc_storeStrong(v5 + 12, self->_adamID);
    objc_storeStrong(v5 + 15, self->_resourceLoadingRequest);
    objc_storeStrong(v5 + 16, self->_contentKeyRequest);
    objc_storeStrong(v5 + 14, self->_serverPlaybackContextData);
    objc_storeStrong(v5 + 13, self->_accountDSID);
  }
  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  ICSecureKeyDeliveryRequestOperation *v6;

  v4 = a3;
  v6 = objc_alloc_init(ICSecureKeyDeliveryRequestOperation);
  -[ICSecureKeyDeliveryRequestOperation setRequest:](v6, "setRequest:", self);
  -[ICSecureKeyDeliveryRequestOperation setResponseHandler:](v6, "setResponseHandler:", v4);

  objc_msgSend(MEMORY[0x1E0CB3828], "ic_sharedRequestOperationQueueWithQualityOfService:", self->_qualityOfService);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v6);

}

- (NSURL)certificateURL
{
  return self->_certificateURL;
}

- (void)setCertificateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)contentURI
{
  return self->_contentURI;
}

- (void)setContentURI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (void)setKeyServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)leaseActionType
{
  return self->_leaseActionType;
}

- (void)setLeaseActionType:(int64_t)a3
{
  self->_leaseActionType = a3;
}

- (ICRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)rentalID
{
  return self->_rentalID;
}

- (void)setRentalID:(int64_t)a3
{
  self->_rentalID = a3;
}

- (BOOL)skippedRentalCheckout
{
  return self->_skippedRentalCheckout;
}

- (void)setSkippedRentalCheckout:(BOOL)a3
{
  self->_skippedRentalCheckout = a3;
}

- (BOOL)isITunesStoreRequest
{
  return self->_ITunesStoreRequest;
}

- (void)setITunesStoreRequest:(BOOL)a3
{
  self->_ITunesStoreRequest = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (id)serverPlaybackContextDataCreationHandler
{
  return self->_serverPlaybackContextDataCreationHandler;
}

- (void)setServerPlaybackContextDataCreationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)asyncServerPlaybackContextDataCreationHandler
{
  return self->_asyncServerPlaybackContextDataCreationHandler;
}

- (void)setAsyncServerPlaybackContextDataCreationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)shouldIncludeDeviceGUID
{
  return self->_shouldIncludeDeviceGUID;
}

- (void)setShouldIncludeDeviceGUID:(BOOL)a3
{
  self->_shouldIncludeDeviceGUID = a3;
}

- (int64_t)requestProtocolType
{
  return self->_requestProtocolType;
}

- (void)setRequestProtocolType:(int64_t)a3
{
  self->_requestProtocolType = a3;
}

- (BOOL)isOfflineDownload
{
  return self->_isOfflineDownload;
}

- (void)setIsOfflineDownload:(BOOL)a3
{
  self->_isOfflineDownload = a3;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (void)setAccountDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)serverPlaybackContextData
{
  return self->_serverPlaybackContextData;
}

- (AVAssetResourceLoadingRequest)resourceLoadingRequest
{
  return self->_resourceLoadingRequest;
}

- (AVContentKeyRequest)contentKeyRequest
{
  return self->_contentKeyRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentKeyRequest, 0);
  objc_storeStrong((id *)&self->_resourceLoadingRequest, 0);
  objc_storeStrong((id *)&self->_serverPlaybackContextData, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong(&self->_asyncServerPlaybackContextDataCreationHandler, 0);
  objc_storeStrong(&self->_serverPlaybackContextDataCreationHandler, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_contentURI, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
}

@end
