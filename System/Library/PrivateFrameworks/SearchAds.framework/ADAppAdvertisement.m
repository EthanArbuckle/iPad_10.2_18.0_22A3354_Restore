@implementation ADAppAdvertisement

- (ADAppAdvertisement)initWithAdamID:(id)a3 assetInfo:(id)a4 adData:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  ADAppAdvertisement *v23;

  v8 = (void *)MEMORY[0x24BDD1880];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend_UUID(v8, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (ADAppAdvertisement *)objc_msgSend_initWithAdamID_assetInfo_adData_instanceID_(self, v22, (uint64_t)v11, (uint64_t)v10, (uint64_t)v9, v21);

  return v23;
}

- (ADAppAdvertisement)initWithAdamID:(id)a3 assetInfo:(id)a4 adData:(id)a5 instanceID:(id)a6
{
  id v11;
  id v12;
  ADAppAdvertisement *v13;
  ADAppAdvertisement *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ADAppAdvertisement;
  v13 = -[ADAppRepresentation initWithAdamID:assetInformation:](&v16, sel_initWithAdamID_assetInformation_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_adData, a5);
    objc_storeStrong((id *)&v14->_instanceID, a6);
  }

  return v14;
}

- (ADAppAdvertisement)initWithAdamID:(id)a3 cppIDs:(id)a4 serverCppID:(id)a5 adData:(id)a6 instanceID:(id)a7
{
  NSObject *v12;
  id v13;
  __CFString *v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  const __CFString *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  ADAppAdvertisement *v33;
  ADAppAdvertisement *v34;
  NSObject *v36;
  objc_super v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  NSObject *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = (__CFString *)a5;
  v15 = a6;
  v16 = a7;
  APLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = objc_opt_class();
    v19 = CFSTR("nil");
    *(_DWORD *)buf = 138412802;
    v39 = v18;
    if (v14)
      v19 = v14;
    v40 = 2112;
    v41 = v12;
    v42 = 2112;
    v43 = v19;
    _os_log_impl(&dword_228279000, v17, OS_LOG_TYPE_INFO, "[%@] For adamID: %@ this is the serverCppID: %@.", buf, 0x20u);
  }

  if (v13)
  {
    v36 = v12;
    v23 = v14;
    v24 = a6;
    v25 = a7;
    v26 = a5;
    v27 = v16;
    v28 = v15;
    objc_msgSend_componentsJoinedByString_(v13, v20, (uint64_t)CFSTR(" , "), v21, v22);
    v29 = objc_claimAutoreleasedReturnValue();
    APLogForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v39 = v31;
      v40 = 2112;
      v41 = v29;
      _os_log_impl(&dword_228279000, v30, OS_LOG_TYPE_INFO, "[%@] cppIDs provided from the server are: %@", buf, 0x16u);
    }

    v15 = v28;
    v16 = v27;
    a5 = v26;
    a7 = v25;
    a6 = v24;
    v14 = v23;
    v12 = v36;
  }
  else
  {
    APLogForCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v32 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v39 = v32;
      _os_log_impl(&dword_228279000, v29, OS_LOG_TYPE_INFO, "[%@] cppIDs are not provided from server", buf, 0xCu);
    }
  }

  v37.receiver = self;
  v37.super_class = (Class)ADAppAdvertisement;
  v33 = -[ADAppRepresentation initWithAdamID:](&v37, sel_initWithAdamID_, v12);
  v34 = v33;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_adData, a6);
    objc_storeStrong((id *)&v34->_instanceID, a7);
    objc_storeStrong((id *)&v34->_selectedCppID, a5);
  }

  return v34;
}

- (APOdmlServerResponse)odmlResponse
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_adData(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_odmlResponse(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (APOdmlServerResponse *)v10;
}

- (NSArray)appBinaryTraits
{
  return self->_appBinaryTraits;
}

- (void)setAppBinaryTraits:(id)a3
{
  objc_storeStrong((id *)&self->_appBinaryTraits, a3);
}

- (ADDataObject)adData
{
  return self->_adData;
}

- (void)setAdData:(id)a3
{
  objc_storeStrong((id *)&self->_adData, a3);
}

- (NSString)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(id)a3
{
  objc_storeStrong((id *)&self->_instanceID, a3);
}

- (NSString)selectedCppID
{
  return self->_selectedCppID;
}

- (void)setSelectedCppID:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCppID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedCppID, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_adData, 0);
  objc_storeStrong((id *)&self->_appBinaryTraits, 0);
  objc_storeStrong((id *)&self->_odmlResponse, 0);
}

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
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;

  objc_msgSend_dictionaryWithCapacity_(MEMORY[0x24BDBCED8], a2, 5, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_instanceID(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v5, v11, (uint64_t)v10, (uint64_t)CFSTR("instanceID"), v12);

  objc_msgSend_selectedCppID(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v5, v18, (uint64_t)v17, (uint64_t)CFSTR("selectedCppID"), v19);

  objc_msgSend_adamID(self, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v5, v25, (uint64_t)v24, (uint64_t)CFSTR("adamID"), v26);

  objc_msgSend_assetInformation(self, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v5, v32, (uint64_t)v31, (uint64_t)CFSTR("assetInformation"), v33);

  objc_msgSend_adData(self, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_AD_jsonDictionary(v38, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v5, v44, (uint64_t)v43, (uint64_t)CFSTR("adData"), v45);

  v50 = (void *)objc_msgSend_copy(v5, v46, v47, v48, v49);
  return v50;
}

@end
