@implementation ADNewCapService

- (id)impressionCountByLine
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  int v29;
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_capData(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_maxFrequencyCapElements(self, v7, v8, v9, v10);
  objc_msgSend_frequencyCapExpirationInSeconds(self, v12, v13, v14, v15);
  objc_msgSend_impressionCountByLineWithMaxFrequencyElements_expirationFrequencyThreshold_(v6, v16, v11, v17, v18);
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  APLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend__storageTypeString(self, v21, v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v27 = CFSTR("{}");
    if (v19)
      v27 = v19;
    v29 = 138543619;
    v30 = v25;
    v31 = 2113;
    v32 = v27;
    _os_log_impl(&dword_228279000, v20, OS_LOG_TYPE_DEBUG, "[CappingService] Preparing impression cap data for %{public}@. Loaded data: %{private}@.", (uint8_t *)&v29, 0x16u);

  }
  return v19;
}

- (unint64_t)maxFrequencyCapElements
{
  return self->_maxFrequencyCapElements;
}

- (double)frequencyCapExpirationInSeconds
{
  return self->_frequencyCapExpirationInSeconds;
}

- (ADNewCapService)initWithStorageType:(int64_t)a3
{
  ADNewCapService *v3;
  ADNewCapService *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  ADNewCapService *v22;
  void *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  ADCapData *capData;
  objc_super v45;
  uint8_t buf[4];
  int64_t v47;
  uint64_t v48;

  v3 = self;
  v48 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v45.receiver = self;
    v45.super_class = (Class)ADNewCapService;
    v5 = -[ADNewCapService init](&v45, sel_init);
    v3 = v5;
    if (v5)
    {
      v5->_storageType = a3;
      objc_msgSend_sharedInstance(ADSearchAdsSettings, v6, v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v15 = v10;
      switch(v3->_storageType)
      {
        case 1:
          objc_msgSend_landingPageSettings(v10, v11, v12, v13, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 2:
        case 3:
          objc_msgSend_iris1Settings(v10, v11, v12, v13, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 4:
        case 5:
          objc_msgSend_iris2Settings(v10, v11, v12, v13, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 6:
          objc_msgSend_metisSettings(v10, v11, v12, v13, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 7:
          objc_msgSend_floraSettings(v10, v11, v12, v13, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
          APLogForCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v47 = a3;
            _os_log_impl(&dword_228279000, v21, OS_LOG_TYPE_ERROR, "Unknown Cap storage type: %ld", buf, 0xCu);
          }

          goto LABEL_11;
      }
      v23 = v16;
      objc_msgSend_clickExpirationThresholdInSeconds(v16, v17, v18, v19, v20);
      v3->_clickExpirationThresholdInSeconds = v24;
      objc_msgSend_frequencyCapExpirationInSeconds(v23, v25, v26, v27, v28);
      v3->_frequencyCapExpirationInSeconds = v29;
      v3->_maxFrequencyCapElements = objc_msgSend_maxFrequencyCapElements(v23, v30, v31, v32, v33);
      v3->_maxClickCapElements = objc_msgSend_maxClickCapElements(v23, v34, v35, v36, v37);
      v38 = objc_alloc(MEMORY[0x24BE02188]);
      v42 = objc_msgSend_initWithStorageType_(v38, v39, v3->_storageType, v40, v41);
      capData = v3->_capData;
      v3->_capData = (ADCapData *)v42;

    }
    v3 = v3;
    v22 = v3;
  }
  else
  {
    APLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228279000, v15, OS_LOG_TYPE_ERROR, "Cap Data: Results type is not supported.", buf, 2u);
    }
LABEL_11:

    v22 = 0;
  }

  return v22;
}

- (id)clickCountByLine
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  int v29;
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_capData(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_maxClickCapElements(self, v7, v8, v9, v10);
  objc_msgSend_clickExpirationThresholdInSeconds(self, v12, v13, v14, v15);
  objc_msgSend_clickCountByLineMaxClickElements_expirationClickThreshold_(v6, v16, v11, v17, v18);
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  APLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend__storageTypeString(self, v21, v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v27 = CFSTR("{}");
    if (v19)
      v27 = v19;
    v29 = 138543619;
    v30 = v25;
    v31 = 2113;
    v32 = v27;
    _os_log_impl(&dword_228279000, v20, OS_LOG_TYPE_DEBUG, "[CappingService] Preparing click cap data for %{public}@. Loaded data: %{private}@.", (uint8_t *)&v29, 0x16u);

  }
  return v19;
}

- (ADCapData)capData
{
  return self->_capData;
}

- (unint64_t)maxClickCapElements
{
  return self->_maxClickCapElements;
}

- (double)clickExpirationThresholdInSeconds
{
  return self->_clickExpirationThresholdInSeconds;
}

- (ADNewCapService)init
{
  uint64_t v2;
  uint64_t v3;

  return (ADNewCapService *)objc_msgSend_initWithStorageType_(self, a2, 1, v2, v3);
}

- (void)updateFrequencyCapData:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_updateCapData_forType_completionHandler_, a3, 0, a4);
}

- (void)updateClickData:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_updateCapData_forType_completionHandler_, a3, 1, a4);
}

- (void)updateCapData:(id)a3 forType:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24[2];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  APLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[ADNewCapService updateCapData:forType:completionHandler:]";
    _os_log_impl(&dword_228279000, v10, OS_LOG_TYPE_DEFAULT, "API call to %s received.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend_workQueue(MEMORY[0x24BE02228], v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_22827EEFC;
  v21[3] = &unk_24F0D8C78;
  objc_copyWeak(v24, (id *)buf);
  v16 = v9;
  v23 = v16;
  v17 = v8;
  v22 = v17;
  v24[1] = (id)a4;
  objc_msgSend_addOperationWithBlock_(v15, v18, (uint64_t)v21, v19, v20);

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);

}

- (void)updateDownloadData:(id)a3 forType:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24[2];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  APLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[ADNewCapService updateDownloadData:forType:completionHandler:]";
    _os_log_impl(&dword_228279000, v10, OS_LOG_TYPE_DEFAULT, "API call to %s received.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend_workQueue(MEMORY[0x24BE02228], v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_22827F294;
  v21[3] = &unk_24F0D8C78;
  objc_copyWeak(v24, (id *)buf);
  v24[1] = (id)a4;
  v16 = v9;
  v23 = v16;
  v17 = v8;
  v22 = v17;
  objc_msgSend_addOperationWithBlock_(v15, v18, (uint64_t)v21, v19, v20);

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);

}

- (void)cleanDownloadData
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  objc_msgSend_capData(self, a2, v2, v3, v4);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_maxClickCapElements(self, v6, v7, v8, v9);
  objc_msgSend_clickExpirationThresholdInSeconds(self, v11, v12, v13, v14);
  objc_msgSend_cleanDownloadArrayWithMaxClickElements_expirationClickThreshold_(v18, v15, v10, v16, v17);

}

- (id)_storageTypeString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = objc_msgSend_storageType(self, a2, v2, v3, v4);
  if ((unint64_t)(v5 - 1) > 6)
    return CFSTR("Results");
  else
    return off_24F0D8C98[v5 - 1];
}

- (void)setCapData:(id)a3
{
  objc_storeStrong((id *)&self->_capData, a3);
}

- (int64_t)storageType
{
  return self->_storageType;
}

- (void)setStorageType:(int64_t)a3
{
  self->_storageType = a3;
}

- (void)setClickExpirationThresholdInSeconds:(double)a3
{
  self->_clickExpirationThresholdInSeconds = a3;
}

- (void)setFrequencyCapExpirationInSeconds:(double)a3
{
  self->_frequencyCapExpirationInSeconds = a3;
}

- (void)setMaxFrequencyCapElements:(unint64_t)a3
{
  self->_maxFrequencyCapElements = a3;
}

- (void)setMaxClickCapElements:(unint64_t)a3
{
  self->_maxClickCapElements = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capData, 0);
}

@end
