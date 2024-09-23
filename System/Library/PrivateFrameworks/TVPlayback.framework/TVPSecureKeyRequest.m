@implementation TVPSecureKeyRequest

- (TVPSecureKeyRequest)initWithAssetResourceLoadingRequest:(id)a3
{
  TVPSecureKeyRequest *v3;
  TVPSecureKeyRequest *v4;
  unsigned int v5;
  signed int v6;
  void *v7;
  uint64_t v8;
  NSString *reportingID;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TVPSecureKeyRequest;
  v3 = -[TVPResourceLoadingRequest initWithAssetResourceLoadingRequest:](&v11, sel_initWithAssetResourceLoadingRequest_, a3);
  v4 = v3;
  if (v3)
  {
    do
    {
      v5 = __ldxr((unsigned int *)&sSecureRequestID);
      v6 = v5 + 1;
    }
    while (__stxr(v6, (unsigned int *)&sSecureRequestID));
    v3->_requestID = v6;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    reportingID = v4->_reportingID;
    v4->_reportingID = (NSString *)v8;

  }
  return v4;
}

- (BOOL)loadKeyRequestDataWithError:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPSecureKeyRequest setStartDate:](self, "setStartDate:", v5);

  -[TVPSecureKeyRequest keyRequestData](self, "keyRequestData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 1;
  -[TVPSecureKeyRequest requestOptions](self, "requestOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (-[TVPSecureKeyRequest retrievesOfflineKeys](self, "retrievesOfflineKeys"))
    objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDB19F0]);
  -[TVPResourceLoadingRequest loadingRequest](self, "loadingRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPSecureKeyRequest certificateData](self, "certificateData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPSecureKeyRequest contentIdentifierData](self, "contentIdentifierData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "streamingContentKeyRequestDataForApp:contentIdentifier:options:error:", v11, v12, v9, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v13 != 0;
  if (v13)
    -[TVPSecureKeyRequest setKeyRequestData:](self, "setKeyRequestData:", v13);

  return v7;
}

- (void)loadKeyRequestDataAsynchronouslyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPSecureKeyRequest setStartDate:](self, "setStartDate:", v5);

  -[TVPSecureKeyRequest keyRequestData](self, "keyRequestData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = sTVPPlaybackPerfToken_0++;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__TVPSecureKeyRequest_loadKeyRequestDataAsynchronouslyWithCompletion___block_invoke_3;
    block[3] = &unk_24F15C010;
    v15 = v7;
    v14 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_initWeak(&location, self);
    -[TVPSecureKeyRequest requestOptions](self, "requestOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "mutableCopy");

    if (!v9)
      v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (-[TVPSecureKeyRequest retrievesOfflineKeys](self, "retrievesOfflineKeys"))
      objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDB19F0]);
    -[TVPResourceLoadingRequest loadingRequest](self, "loadingRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPSecureKeyRequest certificateData](self, "certificateData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPSecureKeyRequest contentIdentifierData](self, "contentIdentifierData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __70__TVPSecureKeyRequest_loadKeyRequestDataAsynchronouslyWithCompletion___block_invoke;
    v16[3] = &unk_24F15D710;
    objc_copyWeak(&v18, &location);
    v17 = v4;
    objc_msgSend(v10, "generateStreamingContentKeyRequestDataAsynchronouslyForApp:contentIdentifier:options:completionHandler:", v11, v12, v9, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

void __70__TVPSecureKeyRequest_loadKeyRequestDataAsynchronouslyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15[2];

  v5 = a2;
  v6 = a3;
  v7 = (void *)sTVPPlaybackPerfToken_0++;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__TVPSecureKeyRequest_loadKeyRequestDataAsynchronouslyWithCompletion___block_invoke_2;
  block[3] = &unk_24F15D6E8;
  v15[1] = v7;
  v12 = v5;
  v8 = v5;
  objc_copyWeak(v15, (id *)(a1 + 40));
  v9 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v9;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v15);
}

uint64_t __70__TVPSecureKeyRequest_loadKeyRequestDataAsynchronouslyWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "setKeyRequestData:", *(_QWORD *)(a1 + 32));

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __70__TVPSecureKeyRequest_loadKeyRequestDataAsynchronouslyWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (id)offlineKeyDataForResponseData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v6 = a3;
    -[TVPResourceLoadingRequest loadingRequest](self, "loadingRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "persistentContentKeyFromKeyVendorResponse:options:error:", v6, 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)finishLoadingWithResponseData:(id)a3 renewalDate:(id)a4 keyType:(int64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVPSecureKeyRequest;
  -[TVPResourceLoadingRequest finishLoadingWithResponseData:renewalDate:keyType:](&v5, sel_finishLoadingWithResponseData_renewalDate_keyType_, a3, a4, a5);
}

- (BOOL)isRenewal
{
  void *v2;
  char isKindOfClass;

  -[TVPResourceLoadingRequest loadingRequest](self, "loadingRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)offlineKeyUsageAllowed
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[TVPResourceLoadingRequest loadingRequest](self, "loadingRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentInformationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allowedContentTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x24BDB20E0]);

  return v5;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)contentIdentifierData
{
  return self->_contentIdentifierData;
}

- (void)setContentIdentifierData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)keyRequestData
{
  return self->_keyRequestData;
}

- (void)setKeyRequestData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)rentalID
{
  return self->_rentalID;
}

- (void)setRentalID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)retrievesOfflineKeys
{
  return self->_retrievesOfflineKeys;
}

- (void)setRetrievesOfflineKeys:(BOOL)a3
{
  self->_retrievesOfflineKeys = a3;
}

- (NSDictionary)requestOptions
{
  return self->_requestOptions;
}

- (void)setRequestOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (NSString)reportingID
{
  return self->_reportingID;
}

- (TVPPlaybackReportingEventCollection)eventCollection
{
  return self->_eventCollection;
}

- (void)setEventCollection:(id)a3
{
  objc_storeStrong((id *)&self->_eventCollection, a3);
}

- (NSNumber)requestCompletionTime
{
  return self->_requestCompletionTime;
}

- (void)setRequestCompletionTime:(id)a3
{
  objc_storeStrong((id *)&self->_requestCompletionTime, a3);
}

- (NSDate)requestEndDate
{
  return self->_requestEndDate;
}

- (void)setRequestEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDate)requestStartDate
{
  return self->_requestStartDate;
}

- (void)setRequestStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestStartDate, 0);
  objc_storeStrong((id *)&self->_requestEndDate, 0);
  objc_storeStrong((id *)&self->_requestCompletionTime, 0);
  objc_storeStrong((id *)&self->_eventCollection, 0);
  objc_storeStrong((id *)&self->_reportingID, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_rentalID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_keyRequestData, 0);
  objc_storeStrong((id *)&self->_contentIdentifierData, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
}

@end
