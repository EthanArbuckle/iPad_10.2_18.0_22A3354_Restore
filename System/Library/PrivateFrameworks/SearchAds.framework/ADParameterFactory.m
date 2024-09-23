@implementation ADParameterFactory

- (ADParameterFactory)init
{
  ADParameterFactory *v2;
  ADCapService *v3;
  ADCapService *capService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ADParameterFactory;
  v2 = -[ADParameterFactory init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ADCapService);
    capService = v2->_capService;
    v2->_capService = v3;

  }
  return v2;
}

- (id)campaignNamespaceParameterWithCampaignNamespace:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v7 = v3;
  if (v3 && (objc_msgSend_isEqualToString_(v3, v4, (uint64_t)&stru_24F0D9888, v5, v6) & 1) == 0)
  {
    v8 = objc_alloc_init(MEMORY[0x24BE02208]);
    objc_msgSend_setKey_(v8, v9, (uint64_t)CFSTR("campaignNamespace"), v10, v11);
    objc_msgSend_setValue_(v8, v12, (uint64_t)v7, v13, v14);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)privacyDataKeyParameter
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForKey_(v5, v6, (uint64_t)CFSTR("PrivacyDataKey"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend_isEqualToString_(v9, v10, (uint64_t)&stru_24F0D9888, v11, v12) & 1) == 0)
  {
    v13 = objc_alloc_init(MEMORY[0x24BE02208]);
    objc_msgSend_setKey_(v13, v14, (uint64_t)CFSTR("privacyData"), v15, v16);
    objc_msgSend_setValue_(v13, v17, (uint64_t)v9, v18, v19);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)requestedAdDataParameter
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t isRequestedImage;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
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
  uint64_t isRequestedRating;
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
  void *v65;
  id v66;
  id v67;
  id v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  id v80;
  uint8_t buf[4];
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_sharedInstance(ADSearchAdsSettings, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isRequestedImage = objc_msgSend_isRequestedImage(v11, v12, v13, v14, v15);
  objc_msgSend_numberWithBool_(v6, v17, isRequestedImage, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v21, (uint64_t)v20, (uint64_t)CFSTR("images"), v22);

  objc_msgSend_sharedInstance(ADSearchAdsSettings, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestedText(v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v33, (uint64_t)v32, (uint64_t)CFSTR("text"), v34);

  v35 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_sharedInstance(ADSearchAdsSettings, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  isRequestedRating = objc_msgSend_isRequestedRating(v40, v41, v42, v43, v44);
  objc_msgSend_numberWithBool_(v35, v46, isRequestedRating, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v50, (uint64_t)v49, (uint64_t)CFSTR("userRating"), v51);

  objc_msgSend_sharedInstance(ADSearchAdsSettings, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestedIcon(v56, v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v62, (uint64_t)v61, (uint64_t)CFSTR("icon"), v63);

  v80 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x24BDD1608], v64, (uint64_t)v5, 0, (uint64_t)&v80);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v80;
  v67 = 0;
  if (!v66)
  {
    v68 = objc_alloc(MEMORY[0x24BDD17C8]);
    v71 = (void *)objc_msgSend_initWithData_encoding_(v68, v69, (uint64_t)v65, 4, v70);
    APLogForCategory();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v82 = v71;
      _os_log_impl(&dword_228279000, v72, OS_LOG_TYPE_DEFAULT, "JSON String for requested Ad Data: %@", buf, 0xCu);
    }

    v67 = objc_alloc_init(MEMORY[0x24BE02208]);
    objc_msgSend_setKey_(v67, v73, (uint64_t)CFSTR("requestedTemplate"), v74, v75);
    objc_msgSend_setValue_(v67, v76, (uint64_t)v71, v77, v78);

  }
  return v67;
}

- (id)requestedTemplateTypeParameter
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForKey_(v5, v6, (uint64_t)CFSTR("ToroTemplateType"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BE02208]);
    objc_msgSend_setKey_(v10, v11, (uint64_t)CFSTR("templateType"), v12, v13);
    objc_msgSend_setValue_(v10, v14, (uint64_t)v9, v15, v16);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)frequencyCapDataParameter
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
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend_capService(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_impressionCountByLine(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BE02208]);
    objc_msgSend_setKey_(v11, v12, (uint64_t)CFSTR("impressionCountByLine"), v13, v14);
    objc_msgSend_setValue_(v11, v15, (uint64_t)v10, v16, v17);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)toroClickCountDataParameter
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
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend_capService(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clickCountByLine(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BE02208]);
    objc_msgSend_setKey_(v11, v12, (uint64_t)CFSTR("clickCountByLine"), v13, v14);
    objc_msgSend_setValue_(v11, v15, (uint64_t)v10, v16, v17);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (ADCapService)capService
{
  return self->_capService;
}

- (void)setCapService:(id)a3
{
  objc_storeStrong((id *)&self->_capService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capService, 0);
}

@end
