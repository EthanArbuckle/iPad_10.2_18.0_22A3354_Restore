@implementation ADResponseData

- (ADResponseData)initWithDict:(id)a3
{
  id v4;
  ADResponseData *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *impressionID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *metadata;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *lineItem;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *algoID;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSString *privacy;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSString *templateType;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSString *clientRequestID;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSDictionary *format;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  ADInstallAttributionData *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *p_super;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  objc_super v63;
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)ADResponseData;
  v5 = -[ADResponseData init](&v63, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v7, (uint64_t)CFSTR("impressionId"), v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    impressionID = v5->_impressionID;
    v5->_impressionID = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v12, (uint64_t)CFSTR("metadata"), v11, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSString *)v14;

    v16 = objc_opt_class();
    objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v17, (uint64_t)CFSTR("lineItem"), v16, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    lineItem = v5->_lineItem;
    v5->_lineItem = (NSString *)v19;

    v21 = objc_opt_class();
    objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v22, (uint64_t)CFSTR("algoId"), v21, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    algoID = v5->_algoID;
    v5->_algoID = (NSString *)v24;

    v26 = objc_opt_class();
    objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v27, (uint64_t)CFSTR("privacy"), v26, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    privacy = v5->_privacy;
    v5->_privacy = (NSString *)v29;

    v31 = objc_opt_class();
    objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v32, (uint64_t)CFSTR("templateType"), v31, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    templateType = v5->_templateType;
    v5->_templateType = (NSString *)v34;

    v36 = objc_opt_class();
    objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v37, (uint64_t)CFSTR("clientRequestId"), v36, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    clientRequestID = v5->_clientRequestID;
    v5->_clientRequestID = (NSString *)v39;

    v41 = objc_opt_class();
    objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v42, (uint64_t)CFSTR("format"), v41, v43);
    v44 = objc_claimAutoreleasedReturnValue();
    format = v5->_format;
    v5->_format = (NSDictionary *)v44;

    v46 = objc_opt_class();
    objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v47, (uint64_t)CFSTR("installAttribution"), v46, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v50 = [ADInstallAttributionData alloc];
      v54 = objc_msgSend_initWithDict_(v50, v51, (uint64_t)v49, v52, v53);
      p_super = &v5->_installAttribution->super;
      v5->_installAttribution = (ADInstallAttributionData *)v54;
    }
    else
    {
      APLogForCategory();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v56 = objc_opt_class();
        objc_msgSend_AD_jsonString(v4, v57, v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v65 = v56;
        v66 = 2112;
        v67 = v61;
        _os_log_impl(&dword_228279000, p_super, OS_LOG_TYPE_ERROR, "[%@] ERROR: No Install Attribution dictionary was provided: %@", buf, 0x16u);

      }
    }

  }
  return v5;
}

- (NSString)impressionID
{
  return self->_impressionID;
}

- (NSString)metadata
{
  return self->_metadata;
}

- (NSString)lineItem
{
  return self->_lineItem;
}

- (NSString)algoID
{
  return self->_algoID;
}

- (NSString)privacy
{
  return self->_privacy;
}

- (NSString)templateType
{
  return self->_templateType;
}

- (NSString)clientRequestID
{
  return self->_clientRequestID;
}

- (NSDictionary)format
{
  return self->_format;
}

- (ADInstallAttributionData)installAttribution
{
  return self->_installAttribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installAttribution, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_clientRequestID, 0);
  objc_storeStrong((id *)&self->_templateType, 0);
  objc_storeStrong((id *)&self->_privacy, 0);
  objc_storeStrong((id *)&self->_algoID, 0);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_impressionID, 0);
}

@end
