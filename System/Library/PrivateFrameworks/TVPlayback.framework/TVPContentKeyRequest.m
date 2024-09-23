@implementation TVPContentKeyRequest

+ (void)initialize
{
  if (initialize_onceToken_8 != -1)
    dispatch_once(&initialize_onceToken_8, &__block_literal_global_17);
}

void __34__TVPContentKeyRequest_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  v1 = (void *)sLogObject_5;
  sLogObject_5 = (uint64_t)v0;

  v2 = dispatch_queue_create("TVPContentKeyRequest offline key data queue", 0);
  v3 = (void *)sOfflineKeyDataSerialQueue;
  sOfflineKeyDataSerialQueue = (uint64_t)v2;

}

+ (id)secureInvalidationRequestForIdentifier:(id)a3 offlineKeyData:(id)a4 additionalRequestParams:(id)a5 contentID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAVContentKeyRequest:", 0);
  objc_msgSend(v14, "setKeyIdentifier:", v13);

  objc_msgSend(v14, "setOfflineKeyData:", v12);
  objc_msgSend(v14, "setAdditionalRequestParams:", v11);

  objc_msgSend(v14, "setType:", 3);
  objc_msgSend(v14, "setContentID:", v10);

  return v14;
}

- (TVPContentKeyRequest)initWithAVContentKeyRequest:(id)a3
{
  id v5;
  TVPContentKeyRequest *v6;
  void *v7;
  NSURL *v8;
  id v9;
  NSURL *keyIdentifier;
  NSURL *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *eventReportingID;
  NSMutableDictionary *v16;
  NSMutableDictionary *userInfo;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TVPContentKeyRequest;
  v6 = -[TVPContentKeyRequest init](&v19, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
LABEL_11:
        keyIdentifier = v6->_keyIdentifier;
        v6->_keyIdentifier = v8;
        v11 = v8;

        objc_storeStrong((id *)&v6->_avContentKeyRequest, a3);
        v12 = initWithAVContentKeyRequest__sRequestID++;
        v6->_requestID = v12;
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = objc_claimAutoreleasedReturnValue();
        eventReportingID = v6->_eventReportingID;
        v6->_eventReportingID = (NSString *)v14;

        v6->_type = 0;
        v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        userInfo = v6->_userInfo;
        v6->_userInfo = v16;

        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v7;
        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
          v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = 0;
        }

        goto LABEL_11;
      }
    }
    v8 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

- (BOOL)isCancelled
{
  void *v2;
  uint64_t v3;

  -[TVPContentKeyRequest avContentKeyRequest](self, "avContentKeyRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (id)description
{
  int64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v3 = -[TVPContentKeyRequest type](self, "type");
  v4 = &stru_24F15E1B8;
  if (v3 == 3)
    v4 = CFSTR(" [secure invalidation request]");
  if (v3 == 2)
    v5 = CFSTR(" [offline request]");
  else
    v5 = v4;
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  v7 = -[TVPContentKeyRequest requestID](self, "requestID");
  -[TVPContentKeyRequest keyIdentifier](self, "keyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("[%lu: %@%@]"), v7, v8, v5);

  return v9;
}

- (void)makeKeyRequestDataForCertificateData:(id)a3 assetIDData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id *v25;
  id v26;
  void *v27;
  _QWORD block[4];
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  void *v34;
  _BYTE buf[12];
  __int16 v36;
  TVPContentKeyRequest *v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TVPContentKeyRequest offlineKeyData](self, "offlineKeyData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (!v12)
  {
    -[TVPContentKeyRequest keyFormatVersions](self, "keyFormatVersions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      v20 = (void *)sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        -[TVPContentKeyRequest keyFormatVersions](self, "keyFormatVersions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v22;
        v36 = 2112;
        v37 = self;
        _os_log_impl(&dword_228A4E000, v21, OS_LOG_TYPE_DEFAULT, "Using key format versions %@ for key request: %@", buf, 0x16u);

      }
      v33 = *MEMORY[0x24BDB1BA0];
      -[TVPContentKeyRequest keyFormatVersions](self, "keyFormatVersions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_15:
    v17 = 0;
    goto LABEL_16;
  }
  v13 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_228A4E000, v13, OS_LOG_TYPE_DEFAULT, "Creating sync SPC for offline key rewewal: %@", buf, 0xCu);
  }
  *(_QWORD *)buf = 3737844653;
  v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", buf, 8);
  if (v14)
  {
    v15 = (void *)v14;
    v38[0] = *MEMORY[0x24BDB1BA8];
    -[TVPContentKeyRequest offlineKeyData](self, "offlineKeyData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = *MEMORY[0x24BDB1BB0];
    v39[0] = v16;
    v39[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_16:
    -[TVPContentKeyRequest avContentKeyRequest](self, "avContentKeyRequest");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __84__TVPContentKeyRequest_makeKeyRequestDataForCertificateData_assetIDData_completion___block_invoke;
    v31[3] = &unk_24F15D780;
    v25 = &v32;
    v32 = v10;
    v26 = v10;
    objc_msgSend(v27, "makeStreamingContentKeyRequestDataForApp:contentIdentifier:options:completionHandler:", v8, v9, v17, v31);
    goto LABEL_17;
  }
  v23 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
    -[TVPContentKeyRequest makeKeyRequestDataForCertificateData:assetIDData:completion:].cold.1(v23);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.ATV.secureKeyDelivery"), -345012, 0);
  if (!v24)
    goto LABEL_15;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__TVPContentKeyRequest_makeKeyRequestDataForCertificateData_assetIDData_completion___block_invoke_3;
  block[3] = &unk_24F15D7A8;
  v25 = &v30;
  v29 = v24;
  v30 = v10;
  v26 = v24;
  v17 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v27 = v29;
LABEL_17:

}

void __84__TVPContentKeyRequest_makeKeyRequestDataForCertificateData_assetIDData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__TVPContentKeyRequest_makeKeyRequestDataForCertificateData_assetIDData_completion___block_invoke_2;
  block[3] = &unk_24F15D758;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __84__TVPContentKeyRequest_makeKeyRequestDataForCertificateData_assetIDData_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

uint64_t __84__TVPContentKeyRequest_makeKeyRequestDataForCertificateData_assetIDData_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

- (id)offlineKeyDataFromServerKeyData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;

  v6 = a3;
  if (-[TVPContentKeyRequest type](self, "type") == 2
    && (-[TVPContentKeyRequest avContentKeyRequest](self, "avContentKeyRequest"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) != 0))
  {
    -[TVPContentKeyRequest avContentKeyRequest](self, "avContentKeyRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistableContentKeyFromKeyVendorResponse:options:error:", v6, 0, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)offlineKeyDataFromServerKeyData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[TVPContentKeyRequest type](self, "type") == 2)
  {
    -[TVPContentKeyRequest avContentKeyRequest](self, "avContentKeyRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = sOfflineKeyDataSerialQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __67__TVPContentKeyRequest_offlineKeyDataFromServerKeyData_completion___block_invoke;
      block[3] = &unk_24F15D7D0;
      v11 = v8;
      v12 = v6;
      v13 = v7;
      dispatch_async(v9, block);

    }
    else if (v7)
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __67__TVPContentKeyRequest_offlineKeyDataFromServerKeyData_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  objc_msgSend(v2, "persistableContentKeyFromKeyVendorResponse:options:error:", v3, 0, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__TVPContentKeyRequest_offlineKeyDataFromServerKeyData_completion___block_invoke_2;
  v9[3] = &unk_24F15D758;
  v6 = *(id *)(a1 + 48);
  v11 = v5;
  v12 = v6;
  v10 = v4;
  v7 = v5;
  v8 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __67__TVPContentKeyRequest_offlineKeyDataFromServerKeyData_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)finish
{
  id v3;

  -[TVPContentKeyRequest contentKeySession](self, "contentKeySession");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishKeyRequest:", self);

}

- (void)finishByRequestingOfflineKeysIfPossible
{
  -[TVPContentKeyRequest setWantsOfflineKeysIfPossible:](self, "setWantsOfflineKeysIfPossible:", 1);
  -[TVPContentKeyRequest finish](self, "finish");
}

- (NSURL)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyIdentifier, a3);
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (NSString)eventReportingID
{
  return self->_eventReportingID;
}

- (BOOL)isRenewal
{
  return self->_isRenewal;
}

- (void)setIsRenewal:(BOOL)a3
{
  self->_isRenewal = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)requestStartDate
{
  return self->_requestStartDate;
}

- (void)setRequestStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_requestStartDate, a3);
}

- (NSDate)requestEndDate
{
  return self->_requestEndDate;
}

- (void)setRequestEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_requestEndDate, a3);
}

- (NSData)keyRequestData
{
  return self->_keyRequestData;
}

- (void)setKeyRequestData:(id)a3
{
  objc_storeStrong((id *)&self->_keyRequestData, a3);
}

- (NSDictionary)additionalRequestParams
{
  return self->_additionalRequestParams;
}

- (void)setAdditionalRequestParams:(id)a3
{
  objc_storeStrong((id *)&self->_additionalRequestParams, a3);
}

- (NSDate)serverRequestStartDate
{
  return self->_serverRequestStartDate;
}

- (void)setServerRequestStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_serverRequestStartDate, a3);
}

- (NSArray)keyFormatVersions
{
  return self->_keyFormatVersions;
}

- (void)setKeyFormatVersions:(id)a3
{
  objc_storeStrong((id *)&self->_keyFormatVersions, a3);
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_adamID, a3);
}

- (NSData)offlineKeyData
{
  return self->_offlineKeyData;
}

- (void)setOfflineKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_offlineKeyData, a3);
}

- (NSData)secureInvalidationNonceData
{
  return self->_secureInvalidationNonceData;
}

- (void)setSecureInvalidationNonceData:(id)a3
{
  objc_storeStrong((id *)&self->_secureInvalidationNonceData, a3);
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (NSData)keyResponseData
{
  return self->_keyResponseData;
}

- (void)setKeyResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_keyResponseData, a3);
}

- (NSDate)renewalDate
{
  return self->_renewalDate;
}

- (void)setRenewalDate:(id)a3
{
  objc_storeStrong((id *)&self->_renewalDate, a3);
}

- (NSNumber)renewalInterval
{
  return self->_renewalInterval;
}

- (void)setRenewalInterval:(id)a3
{
  objc_storeStrong((id *)&self->_renewalInterval, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (NSDate)availabilityEndDate
{
  return self->_availabilityEndDate;
}

- (void)setAvailabilityEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityEndDate, a3);
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
  objc_storeStrong((id *)&self->_contentID, a3);
}

- (BOOL)isLowValueKey
{
  return self->_isLowValueKey;
}

- (void)setIsLowValueKey:(BOOL)a3
{
  self->_isLowValueKey = a3;
}

- (NSNumber)playbackDuration
{
  return self->_playbackDuration;
}

- (void)setPlaybackDuration:(id)a3
{
  objc_storeStrong((id *)&self->_playbackDuration, a3);
}

- (BOOL)allowManualRenewal
{
  return self->_allowManualRenewal;
}

- (void)setAllowManualRenewal:(BOOL)a3
{
  self->_allowManualRenewal = a3;
}

- (NSDictionary)additionalRequestParamsFromResponse
{
  return self->_additionalRequestParamsFromResponse;
}

- (void)setAdditionalRequestParamsFromResponse:(id)a3
{
  objc_storeStrong((id *)&self->_additionalRequestParamsFromResponse, a3);
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (AVContentKeyRequest)avContentKeyRequest
{
  return self->_avContentKeyRequest;
}

- (TVPContentKeySession)contentKeySession
{
  return (TVPContentKeySession *)objc_loadWeakRetained((id *)&self->_contentKeySession);
}

- (void)setContentKeySession:(id)a3
{
  objc_storeWeak((id *)&self->_contentKeySession, a3);
}

- (BOOL)wantsOfflineKeysIfPossible
{
  return self->_wantsOfflineKeysIfPossible;
}

- (void)setWantsOfflineKeysIfPossible:(BOOL)a3
{
  self->_wantsOfflineKeysIfPossible = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentKeySession);
  objc_storeStrong((id *)&self->_avContentKeyRequest, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_additionalRequestParamsFromResponse, 0);
  objc_storeStrong((id *)&self->_playbackDuration, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_availabilityEndDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_renewalInterval, 0);
  objc_storeStrong((id *)&self->_renewalDate, 0);
  objc_storeStrong((id *)&self->_keyResponseData, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_secureInvalidationNonceData, 0);
  objc_storeStrong((id *)&self->_offlineKeyData, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_keyFormatVersions, 0);
  objc_storeStrong((id *)&self->_serverRequestStartDate, 0);
  objc_storeStrong((id *)&self->_additionalRequestParams, 0);
  objc_storeStrong((id *)&self->_keyRequestData, 0);
  objc_storeStrong((id *)&self->_requestEndDate, 0);
  objc_storeStrong((id *)&self->_requestStartDate, 0);
  objc_storeStrong((id *)&self->_eventReportingID, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

- (void)makeKeyRequestDataForCertificateData:(os_log_t)log assetIDData:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_228A4E000, log, OS_LOG_TYPE_ERROR, "Required nonce data is nil.  Failing SPC generation", v1, 2u);
}

@end
