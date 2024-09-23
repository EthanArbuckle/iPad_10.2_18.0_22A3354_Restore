@implementation ADMetricManager

+ (id)sharedInstance
{
  if (qword_253E8E8F0 != -1)
    dispatch_once(&qword_253E8E8F0, &unk_24F0D8D70);
  return (id)qword_253E8E8F8;
}

- (ADMetricManager)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  ADMetricManager *v6;
  uint64_t v7;
  NSMutableDictionary *activeAdvertisementsByInstanceID;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableSet *clickCapUpdated;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableSet *downloadCapUpdated;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableSet *frequencyCapUpdated;
  ADCapService *v27;
  ADCapService *capService;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)ADMetricManager;
  v6 = -[ADMetricManager init](&v30, sel_init);
  if (v6)
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    activeAdvertisementsByInstanceID = v6->_activeAdvertisementsByInstanceID;
    v6->_activeAdvertisementsByInstanceID = (NSMutableDictionary *)v7;

    objc_msgSend_set(MEMORY[0x24BDBCEF0], v9, v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    clickCapUpdated = v6->_clickCapUpdated;
    v6->_clickCapUpdated = (NSMutableSet *)v13;

    objc_msgSend_set(MEMORY[0x24BDBCEF0], v15, v16, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    downloadCapUpdated = v6->_downloadCapUpdated;
    v6->_downloadCapUpdated = (NSMutableSet *)v19;

    objc_msgSend_set(MEMORY[0x24BDBCEF0], v21, v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    frequencyCapUpdated = v6->_frequencyCapUpdated;
    v6->_frequencyCapUpdated = (NSMutableSet *)v25;

    v27 = objc_alloc_init(ADCapService);
    capService = v6->_capService;
    v6->_capService = v27;

  }
  return v6;
}

+ (id)testInstance
{
  return objc_alloc_init(ADMetricManager);
}

- (void)placed:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  APLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_228279000, v4, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad is placed.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)onScreen:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  APLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_228279000, v4, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad is on screen.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)offScreen:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  APLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_228279000, v4, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad is completely off screen.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)visible:(id)a3 start:(id)a4 duration:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  double v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  APLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_AD_universalDateTimeAsString(v9, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = v8;
    v29 = 2112;
    v30 = v15;
    v31 = 2048;
    v32 = a5;
    _os_log_impl(&dword_228279000, v10, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad was visible since %@ for %f seconds.", buf, 0x20u);

  }
  if (a5 >= 1.0)
  {
    objc_msgSend_workQueue(MEMORY[0x24BE02228], v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_228281730;
    v24[3] = &unk_24F0D8D98;
    v24[4] = self;
    v25 = v8;
    v26 = a5;
    objc_msgSend_addOperationWithBlock_(v20, v21, (uint64_t)v24, v22, v23);

  }
}

- (void)adMarkerInteracted:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad Marker is tapped.", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend_interacted_(self, v6, (uint64_t)v4, v7, v8);
}

- (void)getApp:(id)a3 buttonState:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_228281A20;
  v11[3] = &unk_24F0D8DC0;
  v12 = v8;
  v9 = v8;
  objc_msgSend_getApp_buttonState_withCompletion_(self, v10, (uint64_t)a3, a4, (uint64_t)v11);

}

- (void)getApp:(id)a3 buttonState:(int64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  ADMetricManager *v25;
  id v26;
  int64_t v27;

  v8 = a3;
  v9 = a5;
  objc_msgSend_interacted_(self, v10, (uint64_t)v8, v11, v12);
  objc_msgSend_workQueue(MEMORY[0x24BE02228], v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_228281B0C;
  v23[3] = &unk_24F0D8DE8;
  v24 = v8;
  v25 = self;
  v26 = v9;
  v27 = a4;
  v18 = v9;
  v19 = v8;
  objc_msgSend_addOperationWithBlock_(v17, v20, (uint64_t)v23, v21, v22);

}

- (void)interacted:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  ADMetricManager *v16;

  v4 = a3;
  objc_msgSend_workQueue(MEMORY[0x24BE02228], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_228281EE4;
  v14[3] = &unk_24F0D8E10;
  v15 = v4;
  v16 = self;
  v10 = v4;
  objc_msgSend_addOperationWithBlock_(v9, v11, (uint64_t)v14, v12, v13);

}

- (void)updateStoreKitAttribution:(id)a3 targetAdvertisement:(id)a4
{
  id v5;
  id v6;
  ADResponseData *v7;
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;

  v5 = a3;
  v6 = a4;
  v7 = [ADResponseData alloc];
  objc_msgSend_adData(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_adResponseInUse(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend_initWithDict_(v7, v18, (uint64_t)v17, v19, v20);

  objc_msgSend_installAttribution(v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = sub_228282130;
    v30[3] = &unk_24F0D8E38;
    v31 = v5;
    objc_msgSend_recordStoreKitAdTap_(v26, v27, (uint64_t)v30, v28, v29);

  }
}

- (void)updateClickCap:(id)a3 targetAdvertisement:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;

  v6 = a3;
  v7 = a4;
  objc_msgSend_clickCapUpdated(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_containsObject_(v12, v13, (uint64_t)v6, v14, v15);

  if ((v16 & 1) == 0)
  {
    objc_msgSend_desRecordManager(self, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_adamID(v7, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateDESRecord_forEvent_(v21, v27, (uint64_t)v26, 2, v28);

    objc_msgSend_capService(self, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_adData(v7, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = sub_22828233C;
    v50[3] = &unk_24F0D8E38;
    v39 = v6;
    v51 = v39;
    objc_msgSend_updateClickData_completionHandler_(v33, v40, (uint64_t)v38, (uint64_t)v50, v41);

    objc_msgSend_clickCapUpdated(self, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v46, v47, (uint64_t)v39, v48, v49);

  }
}

- (void)completed:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad lifecycle has completed.", buf, 0xCu);
  }

  objc_msgSend_workQueue(MEMORY[0x24BE02228], v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_228282524;
  v15[3] = &unk_24F0D8E10;
  v15[4] = self;
  v16 = v4;
  v11 = v4;
  objc_msgSend_addOperationWithBlock_(v10, v12, (uint64_t)v15, v13, v14);

}

- (void)received:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  APLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_228279000, v4, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad is received from the server.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)discarded:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  APLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_228279000, v4, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad has been discarded. [Discarded event is deprecated, this call is ignored.]", (uint8_t *)&v5, 0xCu);
  }

}

- (void)activateAdvertisements:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v6)
  {
    v11 = v6;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v4);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
        objc_msgSend_activeAdvertisementsByInstanceID(self, v7, v8, v9, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_instanceID(v14, v16, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v15, v21, (uint64_t)v14, (uint64_t)v20, v22);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v11);
  }

}

- (void)deactivateAdvertisements:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[5];

  objc_msgSend_valueForKeyPath_(a3, a2, (uint64_t)CFSTR("@unionOfObjects.instanceID"), v3, v4);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activeAdvertisementsByInstanceID(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectsForKeys_(v10, v11, (uint64_t)v17, v12, v13);

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_2282828C4;
  v18[3] = &unk_24F0D8E60;
  v18[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v17, v14, (uint64_t)v18, v15, v16);

}

- (void)deactivateAdvertisementsByInstanceIDs:(id)a3
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
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  v4 = a3;
  objc_msgSend_activeAdvertisementsByInstanceID(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectsForKeys_(v9, v10, (uint64_t)v4, v11, v12);

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_2282829E4;
  v16[3] = &unk_24F0D8E60;
  v16[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v13, (uint64_t)v16, v14, v15);

}

- (void)deactivateAllAdvertisements
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  objc_msgSend_activeAdvertisementsByInstanceID(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v6, v7, v8, v9, v10);

  objc_msgSend_clickCapUpdated(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v15, v16, v17, v18, v19);

  objc_msgSend_downloadCapUpdated(self, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v24, v25, v26, v27, v28);

  objc_msgSend_frequencyCapUpdated(self, v29, v30, v31, v32);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v37, v33, v34, v35, v36);

}

- (void)replaceCapService:(id)a3
{
  ((void (*)(ADMetricManager *, char *, id))MEMORY[0x24BEDD108])(self, sel_setCapService_, a3);
}

- (int64_t)buttonStateToDownloadType:(int64_t)a3
{
  int64_t v3;

  v3 = 2;
  if (a3 != 30)
    v3 = 0;
  if ((unint64_t)(a3 - 10) >= 5)
    return v3;
  else
    return 1;
}

- (id)buttonStateToString:(int64_t)a3
{
  id result;
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a3 > 29)
  {
    if (a3 == 30)
    {
      return CFSTR("Download");
    }
    else if (a3 == 40)
    {
      return CFSTR("Open");
    }
    else
    {
LABEL_8:
      APLogForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 134217984;
        v7 = a3;
        _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_ERROR, "Error: Unidentifiable button state: %ld.", (uint8_t *)&v6, 0xCu);
      }

      return CFSTR("Unknown");
    }
  }
  else
  {
    switch(a3)
    {
      case 5:
        result = CFSTR("Cancel");
        break;
      case 6:
      case 7:
      case 8:
      case 9:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
        goto LABEL_8;
      case 10:
        result = CFSTR("Get");
        break;
      case 11:
        result = CFSTR("Purchase");
        break;
      case 12:
        result = CFSTR("Get Arcade");
        break;
      case 13:
        result = CFSTR("Get Preorder");
        break;
      case 14:
        result = CFSTR("Purchase Preorder");
        break;
      case 20:
        result = CFSTR("Update");
        break;
      default:
        if (a3)
          goto LABEL_8;
        return CFSTR("Unknown");
    }
  }
  return result;
}

- (id)frequencyCapTypeToString:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)a3 < 3)
    return off_24F0D8E80[a3];
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_ERROR, "Error: Unidentifiable frequency cap type: %ld.", (uint8_t *)&v6, 0xCu);
  }

  return CFSTR("Unknown");
}

- (ADCapService)capService
{
  return self->_capService;
}

- (void)setCapService:(id)a3
{
  objc_storeStrong((id *)&self->_capService, a3);
}

- (NSMutableDictionary)activeAdvertisementsByInstanceID
{
  return self->_activeAdvertisementsByInstanceID;
}

- (void)setActiveAdvertisementsByInstanceID:(id)a3
{
  objc_storeStrong((id *)&self->_activeAdvertisementsByInstanceID, a3);
}

- (NSMutableSet)clickCapUpdated
{
  return self->_clickCapUpdated;
}

- (void)setClickCapUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_clickCapUpdated, a3);
}

- (NSMutableSet)downloadCapUpdated
{
  return self->_downloadCapUpdated;
}

- (void)setDownloadCapUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_downloadCapUpdated, a3);
}

- (NSMutableSet)frequencyCapUpdated
{
  return self->_frequencyCapUpdated;
}

- (void)setFrequencyCapUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_frequencyCapUpdated, a3);
}

- (ADDESRecordsManager)desRecordManager
{
  return self->_desRecordManager;
}

- (void)setDesRecordManager:(id)a3
{
  objc_storeStrong((id *)&self->_desRecordManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desRecordManager, 0);
  objc_storeStrong((id *)&self->_frequencyCapUpdated, 0);
  objc_storeStrong((id *)&self->_downloadCapUpdated, 0);
  objc_storeStrong((id *)&self->_clickCapUpdated, 0);
  objc_storeStrong((id *)&self->_activeAdvertisementsByInstanceID, 0);
  objc_storeStrong((id *)&self->_capService, 0);
}

@end
