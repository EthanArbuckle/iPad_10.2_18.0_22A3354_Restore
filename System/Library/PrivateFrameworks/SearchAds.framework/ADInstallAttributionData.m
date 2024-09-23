@implementation ADInstallAttributionData

- (ADInstallAttributionData)initWithDict:(id)a3
{
  id v4;
  ADInstallAttributionData *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *version;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSNumber *sourceAppAdamID;
  NSObject *v18;
  uint64_t v19;
  NSNumber *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *adNetworkID;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSNumber *campaignID;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSString *uuid;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSNumber *adamID;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSNumber *timestamp;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  NSString *signature;
  ADInstallAttributionData *v51;
  NSObject *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  objc_super v86;
  uint8_t buf[4];
  uint64_t v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)ADInstallAttributionData;
  v5 = -[ADInstallAttributionData init](&v86, sel_init);
  if (!v5)
    goto LABEL_16;
  v6 = objc_opt_class();
  objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v7, (uint64_t)CFSTR("version"), v6, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  version = v5->_version;
  v5->_version = (NSString *)v9;

  if (!v5->_version)
  {
    APLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v88 = v12;
      _os_log_impl(&dword_228279000, v11, OS_LOG_TYPE_INFO, "[%@] No version information, assuming SKIV V1", buf, 0xCu);
    }

  }
  v13 = objc_opt_class();
  objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v14, (uint64_t)CFSTR("sourceAppAdamID"), v13, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  sourceAppAdamID = v5->_sourceAppAdamID;
  v5->_sourceAppAdamID = (NSNumber *)v16;

  if (!v5->_sourceAppAdamID)
  {
    APLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v88 = v19;
      _os_log_impl(&dword_228279000, v18, OS_LOG_TYPE_INFO, "[%@] No Source App AdamID, assuming SKIV V1, or default is acceptable", buf, 0xCu);
    }

    v20 = v5->_sourceAppAdamID;
    v5->_sourceAppAdamID = (NSNumber *)&unk_24F0DD510;

  }
  v21 = objc_opt_class();
  objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v22, (uint64_t)CFSTR("adNetworkId"), v21, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  adNetworkID = v5->_adNetworkID;
  v5->_adNetworkID = (NSString *)v24;

  if (!v5->_adNetworkID)
  {
    APLogForCategory();
    v52 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v53 = objc_opt_class();
    objc_msgSend_AD_jsonString(v4, v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v88 = v53;
    v89 = 2112;
    v90 = v58;
    v59 = "[%@] ERROR: No Ad Network ID was provided: %@";
LABEL_29:
    _os_log_impl(&dword_228279000, v52, OS_LOG_TYPE_ERROR, v59, buf, 0x16u);

    goto LABEL_30;
  }
  v26 = objc_opt_class();
  objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v27, (uint64_t)CFSTR("campaignId"), v26, v28);
  v29 = objc_claimAutoreleasedReturnValue();
  campaignID = v5->_campaignID;
  v5->_campaignID = (NSNumber *)v29;

  if (!v5->_campaignID)
  {
    APLogForCategory();
    v52 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v60 = objc_opt_class();
    objc_msgSend_AD_jsonString(v4, v61, v62, v63, v64);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v88 = v60;
    v89 = 2112;
    v90 = v58;
    v59 = "[%@] ERROR: No Campaign ID was provided: %@";
    goto LABEL_29;
  }
  v31 = objc_opt_class();
  objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v32, (uint64_t)CFSTR("uuid"), v31, v33);
  v34 = objc_claimAutoreleasedReturnValue();
  uuid = v5->_uuid;
  v5->_uuid = (NSString *)v34;

  if (!v5->_uuid)
  {
    APLogForCategory();
    v52 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v65 = objc_opt_class();
    objc_msgSend_AD_jsonString(v4, v66, v67, v68, v69);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v88 = v65;
    v89 = 2112;
    v90 = v58;
    v59 = "[%@] ERROR: No UUID was provided: %@";
    goto LABEL_29;
  }
  v36 = objc_opt_class();
  objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v37, (uint64_t)CFSTR("adamId"), v36, v38);
  v39 = objc_claimAutoreleasedReturnValue();
  adamID = v5->_adamID;
  v5->_adamID = (NSNumber *)v39;

  if (!v5->_adamID)
  {
    APLogForCategory();
    v52 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v70 = objc_opt_class();
    objc_msgSend_AD_jsonString(v4, v71, v72, v73, v74);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v88 = v70;
    v89 = 2112;
    v90 = v58;
    v59 = "[%@] ERROR: No Adam ID was provided: %@";
    goto LABEL_29;
  }
  v41 = objc_opt_class();
  objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v42, (uint64_t)CFSTR("timestamp"), v41, v43);
  v44 = objc_claimAutoreleasedReturnValue();
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSNumber *)v44;

  if (!v5->_timestamp)
  {
    APLogForCategory();
    v52 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v75 = objc_opt_class();
    objc_msgSend_AD_jsonString(v4, v76, v77, v78, v79);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v88 = v75;
    v89 = 2112;
    v90 = v58;
    v59 = "[%@] ERROR: No Timestamp was provided: %@";
    goto LABEL_29;
  }
  v46 = objc_opt_class();
  objc_msgSend_AD_objectForKey_ofKindOfClass_(v4, v47, (uint64_t)CFSTR("signature"), v46, v48);
  v49 = objc_claimAutoreleasedReturnValue();
  signature = v5->_signature;
  v5->_signature = (NSString *)v49;

  if (!v5->_signature)
  {
    APLogForCategory();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v80 = objc_opt_class();
      objc_msgSend_AD_jsonString(v4, v81, v82, v83, v84);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v88 = v80;
      v89 = 2112;
      v90 = v58;
      v59 = "[%@] ERROR: No Signature was provided: %@";
      goto LABEL_29;
    }
LABEL_30:

    v51 = 0;
    goto LABEL_31;
  }
LABEL_16:
  v51 = v5;
LABEL_31:

  return v51;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *version;
  NSString *adNetworkID;
  NSNumber *campaignID;
  NSString *uuid;
  NSNumber *adamID;
  NSNumber *timestamp;
  NSString *signature;
  void *v18;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  version = self->_version;
  if (version)
    objc_msgSend_setObject_forKey_(v6, v7, (uint64_t)version, (uint64_t)CFSTR("version"), v9);
  adNetworkID = self->_adNetworkID;
  if (adNetworkID)
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)adNetworkID, (uint64_t)CFSTR("adNetworkId"), v9);
  campaignID = self->_campaignID;
  if (campaignID)
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)campaignID, (uint64_t)CFSTR("campaignId"), v9);
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)uuid, (uint64_t)CFSTR("uuid"), v9);
  adamID = self->_adamID;
  if (adamID)
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)adamID, (uint64_t)CFSTR("adamId"), v9);
  timestamp = self->_timestamp;
  if (timestamp)
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)timestamp, (uint64_t)CFSTR("timestamp"), v9);
  signature = self->_signature;
  if (signature)
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)signature, (uint64_t)CFSTR("signature"), v9);
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v7, (uint64_t)v10, v8, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)recordStoreKitAdTap:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  void *v106;
  id v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  id v113;
  const char *v114;
  uint64_t v115;
  _QWORD v116[5];
  id v117;
  uint8_t buf[4];
  void *v119;
  __int16 v120;
  id v121;
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    objc_msgSend_dictionaryRepresentation(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_AD_jsonString(v12, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v119 = v6;
    v120 = 2112;
    v121 = v17;
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Attempting to update StoreKit Install Attribution with data: %@", buf, 0x16u);

  }
  v18 = objc_alloc_init(MEMORY[0x24BE04550]);
  objc_msgSend_adamID(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAppAdamId_(v18, v24, (uint64_t)v23, v25, v26);

  objc_msgSend_adNetworkID(self, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdNetworkId_(v18, v32, (uint64_t)v31, v33, v34);

  objc_msgSend_campaignID(self, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCampaignId_(v18, v40, (uint64_t)v39, v41, v42);

  objc_msgSend_uuid(self, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setImpressionId_(v18, v48, (uint64_t)v47, v49, v50);

  objc_msgSend_timestamp(self, v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimestamp_(v18, v56, (uint64_t)v55, v57, v58);

  objc_msgSend_signature(self, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttributionSignature_(v18, v64, (uint64_t)v63, v65, v66);

  objc_msgSend_setSourceAppBundleId_(v18, v67, 0, v68, v69);
  objc_msgSend_setOverrideCampaignLimit_(v18, v70, 1, v71, v72);
  objc_msgSend_version(self, v73, v74, v75, v76);
  v77 = objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    v82 = (void *)v77;
    objc_msgSend_version(self, v78, v79, v80, v81);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend_length(v83, v84, v85, v86, v87);

    if (v88)
    {
      objc_msgSend_version(self, v89, v90, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setVersion_(v18, v94, (uint64_t)v93, v95, v96);

      objc_msgSend_sourceAppAdamID(self, v97, v98, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSourceAppAdamId_(v18, v102, (uint64_t)v101, v103, v104);

    }
  }
  APLogForCategory();
  v105 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
  {
    v106 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v119 = v106;
    v120 = 2112;
    v121 = v18;
    v107 = v106;
    _os_log_impl(&dword_228279000, v105, OS_LOG_TYPE_DEFAULT, "[%@] Making call to StoreKit Install Attribution with ASDInstallAttributionParamsConfig: %@", buf, 0x16u);

  }
  objc_msgSend_sharedInstance(MEMORY[0x24BE04548], v108, v109, v110, v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = MEMORY[0x24BDAC760];
  v116[1] = 3221225472;
  v116[2] = sub_228288E54;
  v116[3] = &unk_24F0D9048;
  v116[4] = self;
  v117 = v4;
  v113 = v4;
  objc_msgSend_addInstallAttributionParamsWithConfig_completionHandler_(v112, v114, (uint64_t)v18, (uint64_t)v116, v115);

}

- (NSString)version
{
  return self->_version;
}

- (NSNumber)sourceAppAdamID
{
  return self->_sourceAppAdamID;
}

- (NSString)adNetworkID
{
  return self->_adNetworkID;
}

- (NSNumber)campaignID
{
  return self->_campaignID;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (NSString)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_campaignID, 0);
  objc_storeStrong((id *)&self->_adNetworkID, 0);
  objc_storeStrong((id *)&self->_sourceAppAdamID, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
