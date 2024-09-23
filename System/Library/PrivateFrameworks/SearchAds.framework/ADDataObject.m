@implementation ADDataObject

- (id)AD_jsonDictionary
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;

  objc_msgSend_dictionaryWithCapacity_(MEMORY[0x24BDBCED8], a2, 1, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_adData(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v5, v11, (uint64_t)v10, (uint64_t)CFSTR("adData"), v12);

  objc_msgSend_error(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_dictionaryWithCapacity_(MEMORY[0x24BDBCED8], v18, 3, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(self, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_domain(v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v22, v33, (uint64_t)v32, (uint64_t)CFSTR("domain"), v34);

    v35 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_error(self, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend_code(v40, v41, v42, v43, v44);
    objc_msgSend_numberWithInteger_(v35, v46, v45, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v22, v50, (uint64_t)v49, (uint64_t)CFSTR("code"), v51);

    objc_msgSend_error(self, v52, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedDescription(v56, v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v22, v62, (uint64_t)v61, (uint64_t)CFSTR("localizedDescription"), v63);

    objc_msgSend_setObject_forKeyedSubscript_(v5, v64, (uint64_t)v22, (uint64_t)CFSTR("error"), v65);
  }
  v66 = (void *)objc_msgSend_copy(v5, v18, v19, v20, v21);

  return v66;
}

- (ADDataObject)initWith:(id)a3 andError:(id)a4
{
  id v7;
  id v8;
  ADDataObject *v9;
  ADDataObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ADDataObject;
  v9 = -[ADDataObject init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_adData, a3);
    objc_storeStrong((id *)&v10->_error, a4);
    v10->_adResponseInUseType_Int = 2;
    objc_msgSend_parseResponseData(v10, v11, v12, v13, v14);
  }

  return v10;
}

- (void)setAdResponseInUseType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  APOdmlServerResponse *v13;
  APOdmlServerResponse *odmlResponse;
  id v15;

  objc_msgSend_setAdResponseInUseType_Int_(self, a2, a3, v3, v4);
  objc_msgSend_adResponseInUse(self, v6, v7, v8, v9);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parseDataForODMLResponse_(self, v10, (uint64_t)v15, v11, v12);
  v13 = (APOdmlServerResponse *)objc_claimAutoreleasedReturnValue();
  odmlResponse = self->_odmlResponse;
  self->_odmlResponse = v13;

}

- (NSDictionary)adResponseInUse
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = objc_msgSend_adResponseInUseType_Int(self, a2, v2, v3, v4);
  if (v6 == 1)
  {
    objc_msgSend_noOrganicAdResponse(self, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      objc_msgSend_normalAdResponse(self, v7, v8, v9, v10);
    else
      objc_msgSend_dupAdResponse(self, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDictionary *)v11;
}

+ (id)adResponseTypeToString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("NORMAL");
  if (a3 == 1)
    v3 = CFSTR("NOORGANIC");
  if (a3)
    return (id)v3;
  else
    return CFSTR("DUP");
}

- (void)parseResponseData
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary *v9;
  NSDictionary *dupAdResponse;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *v18;
  NSDictionary *noOrganicAdResponse;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSDictionary *adData;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSDictionary *v32;
  NSDictionary *normalAdResponse;
  NSDictionary *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  APOdmlServerResponse *v42;
  APOdmlServerResponse *odmlResponse;
  id v44;

  objc_msgSend_objectForKeyedSubscript_(self->_adData, a2, (uint64_t)CFSTR("DUP"), v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parseDataForAdResponse_(self, v6, (uint64_t)v5, v7, v8);
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  dupAdResponse = self->_dupAdResponse;
  self->_dupAdResponse = v9;

  objc_msgSend_objectForKeyedSubscript_(self->_adData, v11, (uint64_t)CFSTR("NOORGANIC"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parseDataForAdResponse_(self, v15, (uint64_t)v14, v16, v17);
  v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  noOrganicAdResponse = self->_noOrganicAdResponse;
  self->_noOrganicAdResponse = v18;

  objc_msgSend_objectForKeyedSubscript_(self->_adData, v20, (uint64_t)CFSTR("NORMAL"), v21, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  adData = self->_adData;
  if (v26)
  {
    objc_msgSend_objectForKeyedSubscript_(adData, v23, (uint64_t)CFSTR("NORMAL"), v24, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parseDataForAdResponse_(self, v29, (uint64_t)v28, v30, v31);
    v32 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    normalAdResponse = self->_normalAdResponse;
    self->_normalAdResponse = v32;

  }
  else
  {
    v34 = adData;
    v28 = self->_normalAdResponse;
    self->_normalAdResponse = v34;
  }

  objc_msgSend_adResponseInUse(self, v35, v36, v37, v38);
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parseDataForODMLResponse_(self, v39, (uint64_t)v44, v40, v41);
  v42 = (APOdmlServerResponse *)objc_claimAutoreleasedReturnValue();
  odmlResponse = self->_odmlResponse;
  self->_odmlResponse = v42;

}

- (id)parseDataForAdResponse:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    APLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = objc_opt_class();
      v11 = "[%@] Cannot find data in the ad response.";
LABEL_11:
      _os_log_impl(&dword_228279000, v8, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
    }
LABEL_12:
    v7 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    APLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = objc_opt_class();
      v11 = "[%@] Data is not a string";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v13 = 0;
  objc_msgSend__jsonToDict_error_(self, v5, (uint64_t)v4, (uint64_t)&v13, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v8)
  {
    APLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v15 = v10;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_228279000, v9, OS_LOG_TYPE_ERROR, "[%@] Error deserializing ad data response %@: %@", buf, 0x20u);
    }

  }
LABEL_13:

  return v7;
}

- (id)_jsonToDict:(id)a3 error:(id *)a4
{
  uint64_t v4;
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend_dataUsingEncoding_(a3, a2, 4, (uint64_t)a4, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v7, (uint64_t)v6, 0, (uint64_t)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)parseDataForODMLResponse:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_parseOdmlStringFromResponseData_(self, v5, (uint64_t)v4, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    APLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      v15 = 0;
      goto LABEL_11;
    }
    v16 = objc_opt_class();
    objc_msgSend_AD_jsonString(v4, v17, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v26 = 138412546;
    v27 = v16;
    v28 = 2112;
    v29 = v21;
    v22 = "[%@] ERROR: No ODML data was returned with the Ad Response: %@";
    v23 = v14;
    v24 = 22;
    goto LABEL_8;
  }
  objc_msgSend_parseOdmlResponseFromString_(self, v8, (uint64_t)v11, v9, v10);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    APLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    v26 = 138412290;
    v27 = objc_opt_class();
    v22 = "[%@] ERROR: Failed to parse ODML response from string.";
    v23 = v21;
    v24 = 12;
LABEL_8:
    _os_log_impl(&dword_228279000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v26, v24);
    goto LABEL_9;
  }
  objc_msgSend_parseResponseForAdditionalFeatures_odmlResponse_(self, v12, (uint64_t)v4, (uint64_t)v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v15;
}

- (id)parseOdmlStringFromResponseData:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_opt_class();
    objc_msgSend_objectForKey_ofKindOfClass_(v3, v5, (uint64_t)CFSTR("ODMLDataV2"), v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    APLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = objc_opt_class();
      _os_log_impl(&dword_228279000, v8, OS_LOG_TYPE_ERROR, "[%@] Cannot find response dictionary in the ad response.", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)parseOdmlResponseFromString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDBCE50];
  v4 = a3;
  v5 = [v3 alloc];
  v8 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v5, v6, (uint64_t)v4, 0, v7);

  objc_msgSend_sharedInstance(MEMORY[0x24BE02228], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend_deserializeMessage_error_(v13, v14, (uint64_t)v8, (uint64_t)&v30, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v30;

  if (v17)
  {
    APLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v32 = v19;
      v33 = 2112;
      v34 = v8;
      v35 = 2112;
      v36 = v17;
      _os_log_impl(&dword_228279000, v18, OS_LOG_TYPE_ERROR, "[%@] Error deserializing protobuf %@: %@", buf, 0x20u);
    }
    v20 = 0;
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x24BE7A740]);
    v18 = objc_msgSend_initWithData_(v21, v22, (uint64_t)v16, v23, v24);
    v25 = objc_alloc(MEMORY[0x24BE7A760]);
    v20 = (void *)objc_msgSend_initWithSRPResponse_(v25, v26, (uint64_t)v18, v27, v28);
  }

  return v20;
}

- (id)parseResponseForAdditionalFeatures:(id)a3 odmlResponse:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  objc_msgSend_objectForKey_ofKindOfClass_(v7, v9, (uint64_t)CFSTR("format"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v11, v12, (uint64_t)CFSTR("userRating"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addUserRating_(v6, v16, (uint64_t)v15, v17, v18);
  objc_msgSend_addCachedFeaturesToOdmlResponse_(self, v19, (uint64_t)v6, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)addCachedFeaturesToOdmlResponse:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  uint64_t v37;

  v4 = a3;
  objc_msgSend_sharedInstance(MEMORY[0x24BE021B8], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortModelType(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedInstance(MEMORY[0x24BE021D0], v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activeDSIDRecord(v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_segmentData(v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v37 = 0;
    objc_msgSend__jsonToDict_error_(self, v30, (uint64_t)v29, (uint64_t)&v37, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
      v35 = v37 == 0;
    else
      v35 = 0;
    if (v35)
      objc_msgSend_addCachedFeatures_deviceModel_(v4, v32, (uint64_t)v34, (uint64_t)v14, v33);
    else
      objc_msgSend_addCachedFeatures_deviceModel_(v4, v32, 0, (uint64_t)v14, v33);

  }
  else
  {
    objc_msgSend_addCachedFeatures_deviceModel_(v4, v30, 0, (uint64_t)v14, v31);
  }

  return v4;
}

- (void)updateAdDataWithLocationState:(BOOL)a3 personalizedAdsState:(BOOL)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t i;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  void *v73;
  id v74;
  const char *v75;
  uint64_t v76;
  _BOOL8 v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  ADDataObject *v89;
  void *v90;
  void *v91;
  _BOOL4 v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  uint64_t v107;

  v5 = a4;
  v92 = a3;
  v107 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_adData(self, a2, a3, a4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v7)
  {
    v90 = v7;
    v91 = (void *)v12;
    v89 = self;
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v14 = v7;
    v16 = v92;
    v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v102, (uint64_t)v106, 16);
    if (v96)
    {
      v20 = 0x24BDD1000uLL;
      v94 = v14;
      v95 = *(_QWORD *)v103;
      do
      {
        for (i = 0; i != v96; ++i)
        {
          if (*(_QWORD *)v103 != v95)
            objc_enumerationMutation(v14);
          v97 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i);
          objc_msgSend_objectForKey_(v14, v17, v97, v18, v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dataUsingEncoding_(v22, v23, 4, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_JSONObjectWithData_options_error_(*(void **)(v20 + 1544), v27, (uint64_t)v26, 0, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend_mutableCopy(v28, v29, v30, v31, v32);

          objc_msgSend_objectForKeyedSubscript_(v33, v34, (uint64_t)CFSTR("privacy"), v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            v100 = v22;
            v38 = objc_alloc(MEMORY[0x24BDBCE50]);
            v41 = objc_msgSend_initWithBase64EncodedString_options_(v38, v39, (uint64_t)v37, 0, v40);
            v42 = objc_alloc(MEMORY[0x24BE02238]);
            v99 = (void *)v41;
            v98 = (void *)objc_msgSend_initWithData_(v42, v43, v41, v44, v45);
            objc_msgSend_dictionaryRepresentation(v98, v46, v47, v48, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v51, v16, v52, v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setValue_forKey_(v50, v55, (uint64_t)v54, (uint64_t)CFSTR("renderingStateForLocation"), v56);

            objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v57, v5, v58, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setValue_forKey_(v50, v61, (uint64_t)v60, (uint64_t)CFSTR("renderingStateForPA"), v62);

            v63 = *(void **)(v20 + 1544);
            v101 = 0;
            objc_msgSend_dataWithJSONObject_options_error_(v63, v64, (uint64_t)v50, 0, (uint64_t)&v101);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v101;
            if (!v69)
            {
              objc_msgSend_base64EncodedStringWithOptions_(v65, v66, 0, v67, v68);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setValue_forKey_(v33, v70, (uint64_t)v93, (uint64_t)CFSTR("privacy"), v71);
              objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x24BDD1608], v72, (uint64_t)v33, 0, 0);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = objc_alloc(MEMORY[0x24BDD17C8]);
              v77 = v5;
              v78 = (void *)objc_msgSend_initWithData_encoding_(v74, v75, (uint64_t)v73, 4, v76);
              objc_msgSend_setValue_forKey_(v91, v79, (uint64_t)v78, v97, v80);

              v5 = v77;
              v16 = v92;

            }
            v14 = v94;
            v20 = 0x24BDD1000;
            v22 = v100;
          }

        }
        v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v102, (uint64_t)v106, 16);
      }
      while (v96);
    }

    v13 = v91;
    v85 = (void *)objc_msgSend_copy(v91, v81, v82, v83, v84);
    objc_msgSend_setAdData_(v89, v86, (uint64_t)v85, v87, v88);

    v7 = v90;
  }

}

- (NSDictionary)adData
{
  return self->_adData;
}

- (void)setAdData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)dupAdResponse
{
  return self->_dupAdResponse;
}

- (void)setDupAdResponse:(id)a3
{
  objc_storeStrong((id *)&self->_dupAdResponse, a3);
}

- (NSDictionary)noOrganicAdResponse
{
  return self->_noOrganicAdResponse;
}

- (void)setNoOrganicAdResponse:(id)a3
{
  objc_storeStrong((id *)&self->_noOrganicAdResponse, a3);
}

- (NSDictionary)normalAdResponse
{
  return self->_normalAdResponse;
}

- (void)setNormalAdResponse:(id)a3
{
  objc_storeStrong((id *)&self->_normalAdResponse, a3);
}

- (int64_t)adResponseInUseType_Int
{
  return self->_adResponseInUseType_Int;
}

- (void)setAdResponseInUseType_Int:(int64_t)a3
{
  self->_adResponseInUseType_Int = a3;
}

- (APOdmlServerResponse)odmlResponse
{
  return (APOdmlServerResponse *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)allOdmlResponses
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allOdmlResponses, 0);
  objc_storeStrong((id *)&self->_odmlResponse, 0);
  objc_storeStrong((id *)&self->_normalAdResponse, 0);
  objc_storeStrong((id *)&self->_noOrganicAdResponse, 0);
  objc_storeStrong((id *)&self->_dupAdResponse, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_adData, 0);
}

@end
