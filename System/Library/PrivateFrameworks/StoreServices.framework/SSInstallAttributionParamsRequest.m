@implementation SSInstallAttributionParamsRequest

- (SSInstallAttributionParamsRequest)initWithAppAdamId:(id)a3 adNetworkId:(id)a4 campaignId:(id)a5 impressionId:(id)a6 timestamp:(id)a7 attributionSignature:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[SSInstallAttributionParamsRequest initWithAppAdamId:adNetworkId:campaignId:impressionId:timestamp:attributionSignature:originatingBundleId:overrideCampaignLimit:](self, "initWithAppAdamId:adNetworkId:campaignId:impressionId:timestamp:attributionSignature:originatingBundleId:overrideCampaignLimit:", a3, a4, a5, a6, a7, a8, 0, v9);
}

- (SSInstallAttributionParamsRequest)initWithAppAdamId:(id)a3 adNetworkId:(id)a4 campaignId:(id)a5 impressionId:(id)a6 timestamp:(id)a7 attributionSignature:(id)a8 originatingBundleId:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[SSInstallAttributionParamsRequest initWithAppAdamId:adNetworkId:campaignId:impressionId:timestamp:attributionSignature:originatingBundleId:overrideCampaignLimit:](self, "initWithAppAdamId:adNetworkId:campaignId:impressionId:timestamp:attributionSignature:originatingBundleId:overrideCampaignLimit:", a3, a4, a5, a6, a7, a8, a9, v10);
}

- (SSInstallAttributionParamsRequest)initWithAppAdamId:(id)a3 adNetworkId:(id)a4 campaignId:(id)a5 impressionId:(id)a6 timestamp:(id)a7 attributionSignature:(id)a8 originatingBundleId:(id)a9 overrideCampaignLimit:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SSInstallAttributionParamsRequest *v23;
  uint64_t v24;
  NSNumber *appAdamId;
  uint64_t v26;
  NSString *adNetworkId;
  uint64_t v28;
  NSNumber *campaignId;
  uint64_t v30;
  NSString *impressionId;
  uint64_t v32;
  NSNumber *timestamp;
  uint64_t v34;
  NSString *attributionSignature;
  uint64_t v36;
  NSString *originatingBundleId;
  objc_super v39;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v39.receiver = self;
  v39.super_class = (Class)SSInstallAttributionParamsRequest;
  v23 = -[SSRequest init](&v39, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    appAdamId = v23->_appAdamId;
    v23->_appAdamId = (NSNumber *)v24;

    v26 = objc_msgSend(v17, "copy");
    adNetworkId = v23->_adNetworkId;
    v23->_adNetworkId = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    campaignId = v23->_campaignId;
    v23->_campaignId = (NSNumber *)v28;

    v30 = objc_msgSend(v19, "copy");
    impressionId = v23->_impressionId;
    v23->_impressionId = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    timestamp = v23->_timestamp;
    v23->_timestamp = (NSNumber *)v32;

    v34 = objc_msgSend(v21, "copy");
    attributionSignature = v23->_attributionSignature;
    v23->_attributionSignature = (NSString *)v34;

    v36 = objc_msgSend(v22, "copy");
    originatingBundleId = v23->_originatingBundleId;
    v23->_originatingBundleId = (NSString *)v36;

    v23->_overrideCampaignLimit = a10;
  }

  return v23;
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v21 = 136446210;
      v22 = "-[SSInstallAttributionParamsRequest startWithCompletionBlock:]";
      LODWORD(v18) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v21, v18);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__SSInstallAttributionParamsRequest_startWithCompletionBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 200, v19);

}

void __62__SSInstallAttributionParamsRequest_startWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(v4, "1");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithXPCEncoding:", v6);

    }
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __62__SSInstallAttributionParamsRequest_startWithCompletionBlock___block_invoke_2;
    v14 = &unk_1E47B8A98;
    v9 = *(id *)(a1 + 40);
    v15 = v7;
    v16 = v9;
    v10 = v7;
    dispatch_async(v8, &v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v11, v12, v13, v14);

}

uint64_t __62__SSInstallAttributionParamsRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SSInstallAttributionParamsRequest *v10;

  v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__SSInstallAttributionParamsRequest_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E47B8768;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(dispatchQueue, v8);
  v6 = v5;

  return v6;
}

void __52__SSInstallAttributionParamsRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "appAdamId", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "adNetworkId", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "campaignId", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "impressionId", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "timestamp", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "attributionSignature", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "originatingBundleId", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "overrideCampaignLimit", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 96));
}

- (SSInstallAttributionParamsRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSNumber *v7;
  NSNumber *appAdamId;
  uint64_t v9;
  NSString *v10;
  NSString *adNetworkId;
  uint64_t v12;
  NSNumber *v13;
  NSNumber *campaignId;
  uint64_t v15;
  NSString *v16;
  NSString *impressionId;
  uint64_t v18;
  NSNumber *v19;
  NSNumber *timestamp;
  uint64_t v21;
  NSString *v22;
  NSString *attributionSignature;
  uint64_t v24;
  NSString *v25;
  NSString *originatingBundleId;
  void *v27;
  int v28;
  int v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  objc_super v42;
  int v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4 || MEMORY[0x1A85863E4](v4) != MEMORY[0x1E0C812F8])
    goto LABEL_22;
  v42.receiver = self;
  v42.super_class = (Class)SSInstallAttributionParamsRequest;
  self = -[SSRequest init](&v42, sel_init);
  if (self)
  {
    v6 = objc_opt_class();
    v7 = (NSNumber *)SSXPCDictionaryCopyObjectWithClass(v5, "appAdamId", v6);
    appAdamId = self->_appAdamId;
    self->_appAdamId = v7;

    v9 = objc_opt_class();
    v10 = (NSString *)SSXPCDictionaryCopyObjectWithClass(v5, "adNetworkId", v9);
    adNetworkId = self->_adNetworkId;
    self->_adNetworkId = v10;

    v12 = objc_opt_class();
    v13 = (NSNumber *)SSXPCDictionaryCopyObjectWithClass(v5, "campaignId", v12);
    campaignId = self->_campaignId;
    self->_campaignId = v13;

    v15 = objc_opt_class();
    v16 = (NSString *)SSXPCDictionaryCopyObjectWithClass(v5, "impressionId", v15);
    impressionId = self->_impressionId;
    self->_impressionId = v16;

    v18 = objc_opt_class();
    v19 = (NSNumber *)SSXPCDictionaryCopyObjectWithClass(v5, "timestamp", v18);
    timestamp = self->_timestamp;
    self->_timestamp = v19;

    v21 = objc_opt_class();
    v22 = (NSString *)SSXPCDictionaryCopyObjectWithClass(v5, "attributionSignature", v21);
    attributionSignature = self->_attributionSignature;
    self->_attributionSignature = v22;

    v24 = objc_opt_class();
    v25 = (NSString *)SSXPCDictionaryCopyObjectWithClass(v5, "originatingBundleId", v24);
    originatingBundleId = self->_originatingBundleId;
    self->_originatingBundleId = v25;

    self->_overrideCampaignLimit = xpc_dictionary_get_BOOL(v5, "overrideCampaignLimit");
    if (!self->_appAdamId
      || !self->_adNetworkId
      || !self->_campaignId
      || !self->_impressionId
      || !self->_timestamp
      || !self->_attributionSignature)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v28 = objc_msgSend(v27, "shouldLog");
      if (objc_msgSend(v27, "shouldLogToDisk"))
        v29 = v28 | 2;
      else
        v29 = v28;
      objc_msgSend(v27, "OSLogObject");
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        v29 &= 2u;
      if (v29)
      {
        v31 = (void *)objc_opt_class();
        v43 = 138543362;
        v44 = v31;
        v32 = v31;
        LODWORD(v41) = 12;
        v33 = (void *)_os_log_send_and_compose_impl();

        if (!v33)
        {
LABEL_21:

LABEL_22:
          self = 0;
          goto LABEL_23;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v33, 4, &v43, v41);
        v30 = objc_claimAutoreleasedReturnValue();
        free(v33);
        SSFileLog(v27, CFSTR("%@"), v34, v35, v36, v37, v38, v39, (uint64_t)v30);
      }

      goto LABEL_21;
    }
  }
LABEL_23:

  return self;
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (NSString)adNetworkId
{
  return self->_adNetworkId;
}

- (NSNumber)campaignId
{
  return self->_campaignId;
}

- (NSString)impressionId
{
  return self->_impressionId;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (NSString)attributionSignature
{
  return self->_attributionSignature;
}

- (NSString)originatingBundleId
{
  return self->_originatingBundleId;
}

- (BOOL)overrideCampaignLimit
{
  return self->_overrideCampaignLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingBundleId, 0);
  objc_storeStrong((id *)&self->_attributionSignature, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_impressionId, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_adNetworkId, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end
