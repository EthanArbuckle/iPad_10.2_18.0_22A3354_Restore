@implementation AXPhoenixDataCollectionManager

- (AXPhoenixDataCollectionManager)init
{
  AXPhoenixDataCollectionManager *v3;
  dispatch_queue_t v4;
  NSObject *v5;
  NSObject *object;
  objc_super v7;
  SEL v8;
  AXPhoenixDataCollectionManager *v9;

  v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)AXPhoenixDataCollectionManager;
  v9 = -[AXPhoenixDataCollectionManager init](&v7, sel_init);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    v4 = dispatch_queue_create("com.apple.accessibility.phoenix.dataCollectionManager", 0);
    -[AXPhoenixDataCollectionManager setQueue:](v9, "setQueue:");

    object = -[AXPhoenixDataCollectionManager queue](v9, "queue");
    v5 = dispatch_get_global_queue(17, 0);
    dispatch_set_target_queue(object, v5);

  }
  v3 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v3;
}

+ (id)sharedInstance
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedInstance_onceToken_1;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_4);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedInstance_instance;
}

void __48__AXPhoenixDataCollectionManager_sharedInstance__block_invoke()
{
  AXPhoenixDataCollectionManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXPhoenixDataCollectionManager);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (void)start
{
  -[AXPhoenixDataCollectionManager setIsRunning:](self, "setIsRunning:", 1);
  -[AXPhoenixDataCollectionManager setPackagesRemaining:](self, "setPackagesRemaining:", -1);
  -[AXPhoenixDataCollectionManager timerTick](self, "timerTick");
}

- (void)stop
{
  id v2;

  -[AXPhoenixDataCollectionManager setIsRunning:](self, "setIsRunning:", 0);
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:", self);

}

- (void)timerTick
{
  dispatch_time_t when;
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9[2];
  AXPhoenixDataCollectionManager *v10;

  v10 = self;
  v9[1] = (id)a2;
  -[AXPhoenixDataCollectionManager uploadPackages](self, "uploadPackages");
  when = dispatch_time(0, 600000000000);
  queue = -[AXPhoenixDataCollectionManager queue](v10, "queue");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __43__AXPhoenixDataCollectionManager_timerTick__block_invoke;
  v8 = &unk_24F18F808;
  v9[0] = v10;
  dispatch_after(when, queue, &v4);

  objc_storeStrong(v9, 0);
}

uint64_t __43__AXPhoenixDataCollectionManager_timerTick__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isRunning");
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "timerTick");
  return result;
}

- (void)removeOldData
{
  double v2;
  id v3;
  BOOL v4;
  NSObject *log;
  os_log_type_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id obj;
  uint64_t v19;
  char v20;
  id v21;
  id v22;
  id v23;
  id v24;
  int v25;
  os_log_type_t type;
  os_log_t oslog;
  id v28;
  id v29;
  _QWORD __b[8];
  id v31;
  id v32;
  id v33[2];
  id v34;
  id v35[3];
  uint8_t v36[24];
  _QWORD v37[2];
  _BYTE v38[128];
  _QWORD v39[5];

  v39[4] = *MEMORY[0x24BDAC8D0];
  v35[2] = self;
  v35[1] = (id)a2;
  v35[0] = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v34 = 0;
  v33[1] = (id)5;
  v14 = v35[0];
  v17 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/DTX"));
  v39[0] = *MEMORY[0x24BDBCCD0];
  v39[1] = *MEMORY[0x24BDBCBF0];
  v39[2] = *MEMORY[0x24BDBCC60];
  v39[3] = *MEMORY[0x24BDBCC48];
  v16 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 4);
  v32 = v34;
  v15 = (id)objc_msgSend(v14, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v17);
  objc_storeStrong(&v34, v32);
  v33[0] = v15;

  memset(__b, 0, sizeof(__b));
  obj = v33[0];
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
  if (v19)
  {
    v11 = *(_QWORD *)__b[2];
    v12 = 0;
    v13 = v19;
    while (1)
    {
      v10 = v12;
      if (*(_QWORD *)__b[2] != v11)
        objc_enumerationMutation(obj);
      v31 = *(id *)(__b[1] + 8 * v12);
      v7 = v31;
      v37[0] = *MEMORY[0x24BDBCCD0];
      v37[1] = *MEMORY[0x24BDBCBF0];
      v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
      v28 = v34;
      v8 = (id)objc_msgSend(v7, "resourceValuesForKeys:error:");
      objc_storeStrong(&v34, v28);
      v29 = v8;

      if (v29 && !v34)
      {
        v24 = (id)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x24BDBCCD0]);
        v23 = (id)objc_msgSend(v24, "pathExtension");
        v22 = (id)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x24BDBCBF0]);
        v20 = 0;
        v4 = 0;
        if ((objc_msgSend(v23, "isEqualToString:", CFSTR("json")) & 1) != 0)
        {
          v21 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v20 = 1;
          objc_msgSend(v21, "timeIntervalSinceDate:", v22);
          v4 = v2 > 172800.0;
        }
        if ((v20 & 1) != 0)

        if (v4)
        {
          v3 = (id)objc_msgSend(v31, "path");
          +[AXPhoenixDataCollectionUtils deleteItem:](AXPhoenixDataCollectionUtils, "deleteItem:");

        }
        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v23, 0);
        objc_storeStrong(&v24, 0);
        v25 = 0;
      }
      else
      {
        oslog = (os_log_t)(id)AXLogBackTap();
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          v6 = type;
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v36, (uint64_t)"-[AXPhoenixDataCollectionManager removeOldData]", (uint64_t)v31);
          _os_log_error_impl(&dword_228CDB000, log, v6, "[PHOENIX] %s Error getting metadata properties for %@", v36, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
        v25 = 3;
      }
      objc_storeStrong(&v29, 0);
      ++v12;
      if (v10 + 1 >= v13)
      {
        v12 = 0;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
        if (!v13)
          break;
      }
    }
  }

  objc_storeStrong(v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(v35, 0);
}

- (void)uploadPackages
{
  int v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  char v18;
  NSObject *log;
  os_log_type_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  __CFString *v34;
  os_log_type_t v35;
  os_log_t v36;
  os_log_type_t v37;
  os_log_t v38;
  _QWORD v39[8];
  uint64_t v40;
  id v41;
  char v42;
  uint64_t v43;
  id v44;
  id v45;
  int v46;
  os_log_type_t type;
  os_log_t oslog;
  id v49;
  id v50;
  _QWORD __b[8];
  id v52;
  unint64_t v53;
  id v54;
  id v55;
  id v56;
  id obj;
  id v58[2];
  id v59;
  id v60[2];
  AXPhoenixDataCollectionManager *v61;
  uint8_t v62[32];
  uint8_t v63[32];
  _BYTE v64[128];
  _QWORD v65[2];
  uint8_t v66[24];
  _QWORD v67[4];
  _BYTE v68[128];
  _QWORD v69[5];

  v69[4] = *MEMORY[0x24BDAC8D0];
  v61 = self;
  v60[1] = (id)a2;
  -[AXPhoenixDataCollectionManager removeOldData](self, "removeOldData");
  v60[0] = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v59 = 0;
  v58[1] = (id)5;
  v28 = v60[0];
  v31 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:");
  v69[0] = *MEMORY[0x24BDBCCD0];
  v69[1] = *MEMORY[0x24BDBCBF0];
  v69[2] = *MEMORY[0x24BDBCC60];
  v69[3] = *MEMORY[0x24BDBCC48];
  v30 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 4);
  obj = v59;
  v29 = (id)objc_msgSend(v28, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v31);
  objc_storeStrong(&v59, obj);
  v58[0] = v29;

  v56 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v55 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v54 = -[AXPhoenixDataPackager initWithFileSuffixes:fromDataDirectory:]([AXPhoenixDataPackager alloc], "initWithFileSuffixes:fromDataDirectory:", &unk_24F196858, CFSTR("/var/mobile/DTX/FalsePositives"));
  v53 = 0;
  memset(__b, 0, sizeof(__b));
  v32 = v58[0];
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", __b, v68, 16);
  if (v33)
  {
    v25 = *(_QWORD *)__b[2];
    v26 = 0;
    v27 = v33;
    while (1)
    {
      v24 = v26;
      if (*(_QWORD *)__b[2] != v25)
        objc_enumerationMutation(v32);
      v52 = *(id *)(__b[1] + 8 * v26);
      v21 = v52;
      v67[0] = *MEMORY[0x24BDBCCD0];
      v67[1] = *MEMORY[0x24BDBCBF0];
      v67[2] = *MEMORY[0x24BDBCC60];
      v67[3] = *MEMORY[0x24BDBCC48];
      v23 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 4);
      v49 = v59;
      v22 = (id)objc_msgSend(v21, "resourceValuesForKeys:error:");
      objc_storeStrong(&v59, v49);
      v50 = v22;

      if (v50 && !v59)
      {
        v45 = (id)objc_msgSend(v50, "objectForKeyedSubscript:", *MEMORY[0x24BDBCCD0]);
        v44 = (id)objc_msgSend(v45, "pathExtension");
        v43 = 0;
        v15 = (id)objc_msgSend(v50, "objectForKeyedSubscript:", *MEMORY[0x24BDBCC48]);
        v16 = objc_msgSend(v15, "unsignedLongLongValue");

        v43 = v16;
        v42 = 0;
        v17 = (id)objc_msgSend(v50, "objectForKeyedSubscript:", *MEMORY[0x24BDBCC60]);
        v18 = objc_msgSend(v17, "BOOLValue");

        v42 = v18 & 1;
        if ((v18 & 1) != 0)
        {
          v10 = (id)objc_msgSend(v52, "path");
          +[AXPhoenixDataCollectionUtils deleteItem:](AXPhoenixDataCollectionUtils, "deleteItem:");

        }
        else if ((objc_msgSend(v44, "isEqualToString:", CFSTR("tgz")) & 1) != 0)
        {
          v12 = v56;
          v11 = (void *)MEMORY[0x24BDD17C8];
          v65[0] = CFSTR("/var/mobile/DTX/FalsePositives");
          v65[1] = v45;
          v14 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 2);
          v13 = (id)objc_msgSend(v11, "pathWithComponents:");
          objc_msgSend(v12, "addObject:");

        }
        else if ((objc_msgSend(v54, "isValidFile:", v45) & 1) != 0)
        {
          objc_msgSend(v55, "addObject:", v45);
          v53 += v43;
        }
        objc_storeStrong(&v44, 0);
        objc_storeStrong(&v45, 0);
        v46 = 0;
      }
      else
      {
        oslog = (os_log_t)(id)AXLogBackTap();
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          v20 = type;
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v66, (uint64_t)"-[AXPhoenixDataCollectionManager uploadPackages]", (uint64_t)v52);
          _os_log_error_impl(&dword_228CDB000, log, v20, "[PHOENIX] %s Error getting metadata properties for %@", v66, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
        v46 = 3;
      }
      objc_storeStrong(&v50, 0);
      ++v26;
      if (v24 + 1 >= v27)
      {
        v26 = 0;
        v27 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", __b, v68, 16);
        if (!v27)
          break;
      }
    }
  }

  v2 = objc_msgSend(v56, "count");
  -[AXPhoenixDataCollectionManager setPackagesRemaining:](v61, "setPackagesRemaining:", v2);
  if ((unint64_t)objc_msgSend(v55, "count") < 2 && v53 <= 0x19000)
  {
    if (objc_msgSend(v55, "count"))
      -[AXPhoenixDataCollectionManager setPackagesRemaining:](v61, "setPackagesRemaining:", -[AXPhoenixDataCollectionManager packagesRemaining](v61, "packagesRemaining") + 1);
  }
  else
  {
    v41 = (id)objc_msgSend(v54, "packageDataUsingFiles:", v55);
    memset(v39, 0, sizeof(v39));
    v8 = v41;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v39, v64, 16);
    if (v9)
    {
      v5 = *(_QWORD *)v39[2];
      v6 = 0;
      v7 = v9;
      while (1)
      {
        v4 = v6;
        if (*(_QWORD *)v39[2] != v5)
          objc_enumerationMutation(v8);
        v40 = *(_QWORD *)(v39[1] + 8 * v6);
        objc_msgSend(v56, "addObject:", v40);
        -[AXPhoenixDataCollectionManager setPackagesRemaining:](v61, "setPackagesRemaining:", -[AXPhoenixDataCollectionManager packagesRemaining](v61, "packagesRemaining") + 1);
        ++v6;
        if (v4 + 1 >= v7)
        {
          v6 = 0;
          v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v39, v64, 16);
          if (!v7)
            break;
        }
      }
    }

    v38 = (os_log_t)(id)AXLogBackTap();
    v37 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_0((uint64_t)v63, (uint64_t)"-[AXPhoenixDataCollectionManager uploadPackages]", v53);
      _os_log_impl(&dword_228CDB000, v38, v37, "[PHOENIX] %s Total size of files being packaged %lu", v63, 0x16u);
    }
    objc_storeStrong((id *)&v38, 0);
    objc_storeStrong(&v41, 0);
  }
  if (objc_msgSend(v56, "count"))
  {
    v36 = (os_log_t)(id)AXLogBackTap();
    v35 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_0((uint64_t)v62, (uint64_t)"-[AXPhoenixDataCollectionManager uploadPackages]", objc_msgSend(v56, "count"));
      _os_log_impl(&dword_228CDB000, v36, v35, "[PHOENIX] %s Uploading %lu packages", v62, 0x16u);
    }
    objc_storeStrong((id *)&v36, 0);
    v34 = CFSTR("test-phoenix-raw-carry-fp-data");
    v3 = +[AXPhoenixBlobbyUploader sharedUploader](AXPhoenixBlobbyUploader, "sharedUploader");
    objc_msgSend(v3, "uploadPackages:toBucket:withCompletion:", v56, v34, &__block_literal_global_27);

    objc_storeStrong((id *)&v34, 0);
  }
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(v60, 0);
}

void __48__AXPhoenixDataCollectionManager_uploadPackages__block_invoke(NSObject *a1)
{
  os_log_t oslog[3];
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  oslog[2] = a1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v2, (uint64_t)"-[AXPhoenixDataCollectionManager uploadPackages]_block_invoke");
    _os_log_impl(&dword_228CDB000, oslog[0], OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Uploaded all packages", v2, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (void)updateUploadStatus:(int64_t)a3 error:(id)a4
{
  NSObject *queue;
  AXPhoenixDataCollectionManagerDelegate *v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  AXPhoenixDataCollectionManager *v11;
  id v12[2];
  id location;
  void *v14;
  SEL v15;
  AXPhoenixDataCollectionManager *v16;

  v16 = self;
  v15 = a2;
  v14 = (void *)a3;
  location = 0;
  objc_storeStrong(&location, a4);
  -[AXPhoenixDataCollectionManager setPackagesRemaining:](v16, "setPackagesRemaining:", v14);
  -[AXPhoenixDataCollectionManager setUploadErrorMessage:](v16, "setUploadErrorMessage:", location);
  v5 = -[AXPhoenixDataCollectionManager delegate](v16, "delegate");

  if (v5)
  {
    queue = MEMORY[0x24BDAC9B8];
    v6 = MEMORY[0x24BDAC760];
    v7 = -1073741824;
    v8 = 0;
    v9 = __59__AXPhoenixDataCollectionManager_updateUploadStatus_error___block_invoke;
    v10 = &unk_24F18F850;
    v11 = v16;
    v12[1] = v14;
    v12[0] = location;
    dispatch_async(queue, &v6);

    objc_storeStrong(v12, 0);
    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(&location, 0);
}

void __59__AXPhoenixDataCollectionManager_updateUploadStatus_error___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "uploadStatusChanged:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)reportFalsePositive:(id)a3
{
  id v3;
  id v4;
  id v5;
  os_log_type_t v6;
  id v7;
  id location[3];
  _QWORD v9[2];
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)AXLogBackTap();
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v10, (uint64_t)"-[AXPhoenixDataCollectionManager reportFalsePositive:]", (uint64_t)location[0]);
    _os_log_impl(&dword_228CDB000, (os_log_t)v7, v6, "[PHOENIX] %s False positive reported, moving files to FP folder: %@", v10, 0x16u);
  }
  objc_storeStrong(&v7, 0);
  v5 = (id)objc_msgSend(location[0], "stringByAppendingString:", CFSTR("_metadata.json"));
  v4 = (id)objc_msgSend(location[0], "stringByAppendingString:", CFSTR("_motion.json"));
  v9[0] = v5;
  v9[1] = v4;
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  +[AXPhoenixDataCollectionUtils moveFiles:from:to:](AXPhoenixDataCollectionUtils, "moveFiles:from:to:");

  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (int64_t)packagesRemaining
{
  return self->_packagesRemaining;
}

- (void)setPackagesRemaining:(int64_t)a3
{
  self->_packagesRemaining = a3;
}

- (AXPhoenixDataCollectionManagerDelegate)delegate
{
  return (AXPhoenixDataCollectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)uploadErrorMessage
{
  return self->_uploadErrorMessage;
}

- (void)setUploadErrorMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadErrorMessage, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
