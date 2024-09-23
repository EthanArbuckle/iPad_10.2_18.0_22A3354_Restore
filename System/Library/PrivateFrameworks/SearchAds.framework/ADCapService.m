@implementation ADCapService

- (ADCapService)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  ADCapService *v6;
  uint64_t v7;
  ADCapData *capData;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ADCapService;
  v6 = -[ADCapService init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE02188], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    capData = v6->_capData;
    v6->_capData = (ADCapData *)v7;

  }
  return v6;
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
  _QWORD v21[5];
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
    v26 = "-[ADCapService updateCapData:forType:completionHandler:]";
    _os_log_impl(&dword_228279000, v10, OS_LOG_TYPE_DEFAULT, "API call to %s received.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend_workQueue(MEMORY[0x24BE02228], v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_2282808AC;
  v21[3] = &unk_24F0D8D08;
  objc_copyWeak(v24, (id *)buf);
  v21[4] = self;
  v16 = v9;
  v23 = v16;
  v17 = v8;
  v22 = v17;
  v24[1] = (id)a4;
  objc_msgSend_addOperationWithBlock_(v15, v18, (uint64_t)v21, v19, v20);

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);

}

- (void)updateDownloadData:(id)a3 identifier:(id)a4 forType:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29[2];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  APLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v31 = "-[ADCapService updateDownloadData:identifier:forType:completionHandler:]";
    v32 = 2112;
    v33 = v11;
    v34 = 2048;
    v35 = a5;
    _os_log_impl(&dword_228279000, v13, OS_LOG_TYPE_DEFAULT, "%s (identifier: %@ type:%ld)", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend_workQueue(MEMORY[0x24BE02228], v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_228280D5C;
  v25[3] = &unk_24F0D8D30;
  objc_copyWeak(v29, (id *)buf);
  v29[1] = (id)a5;
  v19 = v12;
  v28 = v19;
  v25[4] = self;
  v20 = v10;
  v26 = v20;
  v21 = v11;
  v27 = v21;
  objc_msgSend_addOperationWithBlock_(v18, v22, (uint64_t)v25, v23, v24);

  objc_destroyWeak(v29);
  objc_destroyWeak((id *)buf);

}

- (id)clickCountByLine
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  NSObject *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_capData(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clickCountByLine(v5, v6, v7, v8, v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  APLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = CFSTR("{}");
    if (v10)
      v12 = v10;
    v14 = 138477827;
    v15 = v12;
    _os_log_impl(&dword_228279000, v11, OS_LOG_TYPE_DEBUG, "[CappingService] Preparing click cap data for Search Results Page (SRP). Loaded data: %{private}@.", (uint8_t *)&v14, 0xCu);
  }

  return v10;
}

- (id)impressionCountByLine
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  NSObject *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_capData(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_impressionCountByLine(v5, v6, v7, v8, v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  APLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = CFSTR("{}");
    if (v10)
      v12 = v10;
    v14 = 138477827;
    v15 = v12;
    _os_log_impl(&dword_228279000, v11, OS_LOG_TYPE_DEBUG, "[CappingService] Preparing impression cap data for Search Results Page (SRP). Loaded data: %{private}@.", (uint8_t *)&v14, 0xCu);
  }

  return v10;
}

- (void)cleanDownloadData
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_capData(self, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cleanDownloadArray(v9, v5, v6, v7, v8);

}

- (ADCapData)capData
{
  return self->_capData;
}

- (void)setCapData:(id)a3
{
  objc_storeStrong((id *)&self->_capData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capData, 0);
}

@end
