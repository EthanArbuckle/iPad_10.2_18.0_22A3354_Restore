@implementation ADSearchObject

- (ADSearchObject)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  ADSearchObject *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char isRunningTests;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t isPersonalizedAdsEnabled;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  APOdmlReranker *reranker;
  NSObject *v28;
  ADDESRecordsManager *v29;
  ADDESRecordsManager *desRecordManager;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)ADSearchObject;
  v6 = -[ADSearchObject init](&v32, sel_init);
  if (v6)
  {
    objc_msgSend_processInfo(MEMORY[0x24BDD1760], v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isRunningTests = objc_msgSend_isRunningTests(v7, v8, v9, v10, v11);

    if ((isRunningTests & 1) == 0)
    {
      v13 = objc_alloc(MEMORY[0x24BE7A758]);
      objc_msgSend_sharedInstance(MEMORY[0x24BE021B8], v14, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      isPersonalizedAdsEnabled = objc_msgSend_isPersonalizedAdsEnabled(v18, v19, v20, v21, v22);
      v26 = objc_msgSend_initWithPersonalizedAdsEnabled_placementType_(v13, v24, isPersonalizedAdsEnabled, 0, v25);
      reranker = v6->_reranker;
      v6->_reranker = (APOdmlReranker *)v26;

    }
    v6->_SLA = 0.1;
    OdmlLogForCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    v6->_ident = os_signpost_id_generate(v28);

    v29 = objc_alloc_init(ADDESRecordsManager);
    desRecordManager = v6->_desRecordManager;
    v6->_desRecordManager = v29;

  }
  return v6;
}

- (ADSearchObject)initWithSponsoredSearchRequestData:(id)a3 routingInfoData:(id)a4 deviceRequestID:(id)a5 userTargetingID:(id)a6 error:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  ADSearchObject *v22;
  id v24;

  v24 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21 = objc_msgSend_init(self, v17, v18, v19, v20);
  v22 = (ADSearchObject *)v21;
  if (v21)
  {
    objc_storeStrong((id *)(v21 + 8), a3);
    objc_storeStrong((id *)&v22->_routingInfoData, a4);
    objc_storeStrong((id *)&v22->_deviceRequestID, a5);
    objc_storeStrong((id *)&v22->_userTargetingID, a6);
    objc_storeStrong((id *)&v22->_error, a7);
  }

  return v22;
}

- (void)setAdvertisements:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *v31;
  NSArray *advertisements;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  os_signpost_id_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  uint8_t buf[4];
  const char *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v71 = "-[ADSearchObject setAdvertisements:]";
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  v6 = MGGetBoolAnswer();
  v11 = MEMORY[0x24BDAC760];
  if (v6)
  {
    v12 = (void *)MEMORY[0x24BDBCEB8];
    v13 = objc_msgSend_count(v4, v7, v8, v9, v10);
    objc_msgSend_arrayWithCapacity_(v12, v14, v13, v15, v16);
    v68[0] = v11;
    v68[1] = 3221225472;
    v68[2] = sub_228283F94;
    v68[3] = &unk_24F0D8F38;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v69 = v17;
    objc_msgSend_enumerateObjectsUsingBlock_(v4, v18, (uint64_t)v68, v19, v20);
    APLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_AD_jsonString(v17, v22, v23, v24, v25);
      v26 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v71 = v26;
      _os_log_impl(&dword_228279000, v21, OS_LOG_TYPE_DEFAULT, "Received ADAppAdvertisement response: %@", buf, 0xCu);

    }
  }
  objc_msgSend_filterAdsForNonWK_(self, v7, (uint64_t)v4, v9, v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updatedWithTransparencyRenderingData_(self, v28, (uint64_t)v27, v29, v30);
  v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
  advertisements = self->_advertisements;
  self->_advertisements = v31;

  objc_msgSend_addFeaturesToAdvertisements(self, v33, v34, v35, v36);
  OdmlLogForCategory();
  v37 = objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_ident(self, v38, v39, v40, v41);
  if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v43 = v42;
    if (os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_228279000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v43, "App Store Total Reranking", (const char *)&unk_22828C47F, buf, 2u);
    }
  }

  objc_msgSend_reranker(self, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend_copy(v27, v49, v50, v51, v52);
  objc_msgSend_setAndRerankAds_(v48, v54, (uint64_t)v53, v55, v56);

  objc_msgSend_workQueue(MEMORY[0x24BE02228], v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v11;
  v66[1] = 3221225472;
  v66[2] = sub_228283FD8;
  v66[3] = &unk_24F0D8F60;
  v67 = v27;
  v62 = v27;
  objc_msgSend_addOperationWithBlock_(v61, v63, (uint64_t)v66, v64, v65);

}

- (void)setOrganics:(id)a3
{
  NSArray *v4;
  NSObject *v5;
  NSArray *organics;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)a3;
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ADSearchObject setOrganics:]";
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", (uint8_t *)&v7, 0xCu);
  }

  organics = self->_organics;
  self->_organics = v4;

}

- (void)orderedAds:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[ADSearchObject orderedAds:]";
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  objc_msgSend_advertisements(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_count(v10, v11, v12, v13, v14);

  if (v15)
  {
    objc_msgSend_reranker(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SLA(self, v21, v22, v23, v24);
    v26 = v25;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = sub_22828426C;
    v31[3] = &unk_24F0D8F88;
    v31[4] = self;
    v32 = v4;
    objc_msgSend_getRerankedAdsWithTimeLimit_completion_(v20, v27, (uint64_t)v31, v28, v29, v26);

  }
  else
  {
    v30 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    if (v4)
      (*((void (**)(id, id, _QWORD))v4 + 2))(v4, v30, 0);

  }
}

- (void)orderedAdsWithODMLSuccess:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[ADSearchObject orderedAdsWithODMLSuccess:]";
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  objc_msgSend_advertisements(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_count(v10, v11, v12, v13, v14);

  if (v15)
  {
    objc_msgSend_reranker(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SLA(self, v21, v22, v23, v24);
    v26 = v25;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = sub_2282845F0;
    v31[3] = &unk_24F0D8F88;
    v31[4] = self;
    v32 = v4;
    objc_msgSend_getRerankedAdsWithTimeLimit_completion_(v20, v27, (uint64_t)v31, v28, v29, v26);

  }
  else
  {
    v30 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    if (v4)
      (*((void (**)(id, id, uint64_t))v4 + 2))(v4, v30, 1);

  }
}

- (void)addFeaturesToAdvertisements
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t i;
  void *v31;
  const void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t isEqualToString;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t isAppInstalled;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id obj;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_organics(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_adamID(v11, v12, v13, v14, v15);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  objc_msgSend_advertisements(self, v16, v17, v18, v19);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v73, (uint64_t)v77, 16);
  if (v21)
  {
    v26 = v21;
    v27 = *(_QWORD *)v74;
    v28 = (void *)*MEMORY[0x24BE7A790];
    v29 = (void *)*MEMORY[0x24BE7A798];
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v74 != v27)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        v32 = (const void *)objc_msgSend_UTF8String(v28, v22, v23, v24, v25);
        v33 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_adamID(v31, v34, v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v38, v39, (uint64_t)v72, v40, v41);
        objc_msgSend_numberWithBool_(v33, v43, isEqualToString, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setAssociatedObject(v31, v32, v46, (void *)0x301);

        v51 = (const void *)objc_msgSend_UTF8String(v29, v47, v48, v49, v50);
        v52 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_adamID(v31, v53, v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend_longLongValue(v57, v58, v59, v60, v61);
        isAppInstalled = objc_msgSend_isAppInstalled_(self, v63, v62, v64, v65);
        objc_msgSend_numberWithBool_(v52, v67, isAppInstalled, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setAssociatedObject(v31, v51, v70, (void *)0x301);

      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v73, (uint64_t)v77, 16);
    }
    while (v26);
  }

}

- (BOOL)isAppInstalled:(unint64_t)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  v4 = objc_alloc(MEMORY[0x24BDC1540]);
  v7 = (void *)objc_msgSend_initWithStoreItemIdentifier_error_(v4, v5, a3, 0, v6);
  LOBYTE(a3) = v7 != 0;

  return a3;
}

- (id)updatedWithTransparencyRenderingData:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_sharedInstance(MEMORY[0x24BDFD490], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_locationEnabled(v8, v9, v10, v11, v12);

  v14 = objc_alloc_init(MEMORY[0x24BE5F7B8]);
  v19 = objc_msgSend_personalizedAds(v14, v15, v16, v17, v18);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v20 = v3;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v22)
  {
    v27 = v22;
    v28 = *(_QWORD *)v35;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v20);
        objc_msgSend_adData(*(void **)(*((_QWORD *)&v34 + 1) + 8 * v29), v23, v24, v25, v26, (_QWORD)v34);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_updateAdDataWithLocationState_personalizedAdsState_(v30, v31, v13, v19, v32);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v34, (uint64_t)v38, 16);
    }
    while (v27);
  }

  return v20;
}

- (id)filterAdsForNonWK:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  int isCapableOfAction_capabilities;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  NSObject *v54;
  __int128 v56;
  id v58;
  id obj;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  int v69;
  _QWORD v70[2];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5, v6, v7);
  v58 = (id)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v3;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v60, (uint64_t)v71, 16);
  if (v9)
  {
    v15 = v9;
    isCapableOfAction_capabilities = 0;
    v17 = *(_QWORD *)v61;
    *(_QWORD *)&v14 = 138412802;
    v56 = v14;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v61 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend_appBinaryTraits(v19, v10, v11, v12, v13, v56);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        APLogForCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v20;
          _os_log_impl(&dword_228279000, v21, OS_LOG_TYPE_DEFAULT, "App Binary Traits: %@", buf, 0xCu);
        }

        if (!v20)
        {
          v34 = 0;
          goto LABEL_14;
        }
        objc_msgSend_appBinaryTraits(v19, v22, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_containsObject_(v26, v27, (uint64_t)CFSTR("uses-non-webkit-browser-engine"), v28, v29))
        {

        }
        else
        {
          objc_msgSend_appBinaryTraits(v19, v30, v31, v32, v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend_containsObject_(v35, v36, (uint64_t)CFSTR("is-custom-browser-engine-app"), v37, v38);

          if (!v34)
            goto LABEL_14;
        }
        v70[0] = CFSTR("uses-non-webkit-browser-engine");
        v70[1] = CFSTR("is-custom-browser-engine-app");
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v22, (uint64_t)v70, 2, v25);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        isCapableOfAction_capabilities = objc_msgSend_isCapableOfAction_capabilities_(MEMORY[0x24BE044E8], v40, 4, (uint64_t)v39, v41);

        v34 = 1;
LABEL_14:
        objc_msgSend_adamID(v19, v22, v23, v24, v25);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        APLogForCategory();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v56;
          v65 = v42;
          v66 = 1024;
          v67 = v34;
          v68 = 1024;
          v69 = isCapableOfAction_capabilities & 1;
          _os_log_impl(&dword_228279000, v43, OS_LOG_TYPE_DEFAULT, "App discard state for %@: isEntitledApp: %d isDMAEligible: %d", buf, 0x18u);
        }

        v44 = v34 & (isCapableOfAction_capabilities ^ 1u);
        if (MGGetBoolAnswer())
        {
          if ((objc_msgSend_checkForNonWKDiscardOverrides_forAdamID_(self, v45, v44, (uint64_t)v42, v48) & 1) == 0)
            goto LABEL_18;
        }
        else if (!(_DWORD)v44)
        {
LABEL_18:
          objc_msgSend_addObject_(v58, v45, (uint64_t)v19, v47, v48);
          goto LABEL_23;
        }
        objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v45, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(v49, v50, MEMORY[0x24BDBD1C0], (uint64_t)CFSTR("wasServed"), v51);
        objc_msgSend_setValue_forKey_(v49, v52, (uint64_t)&unk_24F0DD4F8, (uint64_t)CFSTR("placement"), v53);
        AnalyticsSendEvent();
        APLogForCategory();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v42;
          _os_log_impl(&dword_228279000, v54, OS_LOG_TYPE_DEFAULT, "Discarding ad with adamID: %@ ", buf, 0xCu);
        }

LABEL_23:
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v60, (uint64_t)v71, 16);
    }
    while (v15);
  }

  return v58;
}

- (BOOL)checkForNonWKDiscardOverrides:(BOOL)a3 forAdamID:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  int v30;
  NSObject *v31;
  char v32;
  NSObject *v33;
  int v35;
  _DWORD v36[7];

  *(_QWORD *)&v36[5] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_alloc(MEMORY[0x24BDBCF50]);
  v10 = (void *)objc_msgSend_initWithSuiteName_(v6, v7, *MEMORY[0x24BE02138], v8, v9);
  if (objc_msgSend_BOOLForKey_(v10, v11, (uint64_t)CFSTR("enableNonWKOverrides"), v12, v13))
  {
    objc_msgSend_stringForKey_(v10, v14, (uint64_t)CFSTR("nonWKAppsSearchAds"), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsSeparatedByString_(v17, v18, (uint64_t)CFSTR(","), v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (objc_msgSend_containsObject_(v21, v22, (uint64_t)v5, v23, v24) & 1) != 0
       || objc_msgSend_count(v21, v25, v26, v27, v28) == 0;
    v30 = objc_msgSend_BOOLForKey_(v10, v25, (uint64_t)CFSTR("enableDMAEligible"), v27, v28);
    APLogForCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 67109376;
      v36[0] = v29;
      LOWORD(v36[1]) = 1024;
      *(_DWORD *)((char *)&v36[1] + 2) = v30;
      _os_log_impl(&dword_228279000, v31, OS_LOG_TYPE_DEFAULT, "App discard state after overrides check: isEntitledApp: %d isDMAEligible: %d", (uint8_t *)&v35, 0xEu);
    }

    v32 = !v29 | v30;
    if ((v32 & 1) == 0)
    {
      APLogForCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v35 = 138412290;
        *(_QWORD *)v36 = v5;
        _os_log_impl(&dword_228279000, v33, OS_LOG_TYPE_DEFAULT, "Discarding ad with adamid: %@ based off overrides.", (uint8_t *)&v35, 0xCu);
      }

    }
    a3 = v32 ^ 1;

  }
  return a3;
}

- (NSString)sponsoredSearchRequestData
{
  return self->_sponsoredSearchRequestData;
}

- (void)setSponsoredSearchRequestData:(id)a3
{
  objc_storeStrong((id *)&self->_sponsoredSearchRequestData, a3);
}

- (NSString)routingInfoData
{
  return self->_routingInfoData;
}

- (void)setRoutingInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_routingInfoData, a3);
}

- (NSString)deviceRequestID
{
  return self->_deviceRequestID;
}

- (void)setDeviceRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRequestID, a3);
}

- (NSString)userTargetingID
{
  return self->_userTargetingID;
}

- (void)setUserTargetingID:(id)a3
{
  objc_storeStrong((id *)&self->_userTargetingID, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (APOdmlReranker)reranker
{
  return self->_reranker;
}

- (void)setReranker:(id)a3
{
  objc_storeStrong((id *)&self->_reranker, a3);
}

- (double)SLA
{
  return self->_SLA;
}

- (void)setSLA:(double)a3
{
  self->_SLA = a3;
}

- (unint64_t)ident
{
  return self->_ident;
}

- (ADDESRecordsManager)desRecordManager
{
  return self->_desRecordManager;
}

- (void)setDesRecordManager:(id)a3
{
  objc_storeStrong((id *)&self->_desRecordManager, a3);
}

- (NSArray)advertisements
{
  return self->_advertisements;
}

- (NSArray)organics
{
  return self->_organics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organics, 0);
  objc_storeStrong((id *)&self->_advertisements, 0);
  objc_storeStrong((id *)&self->_desRecordManager, 0);
  objc_storeStrong((id *)&self->_reranker, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_userTargetingID, 0);
  objc_storeStrong((id *)&self->_deviceRequestID, 0);
  objc_storeStrong((id *)&self->_routingInfoData, 0);
  objc_storeStrong((id *)&self->_sponsoredSearchRequestData, 0);
}

@end
