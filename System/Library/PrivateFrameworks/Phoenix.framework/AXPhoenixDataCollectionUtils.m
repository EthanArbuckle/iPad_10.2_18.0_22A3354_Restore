@implementation AXPhoenixDataCollectionUtils

+ (id)createFilename:(id)a3 usingTimestamp:(id)a4 withFileExtension:(id)a5 underDirectory:(id)a6
{
  id v6;
  id v7;
  id v9;
  id v10;
  id v11;
  char v12;
  id v16;
  id v17;
  id v18;
  id v19;
  os_log_type_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id location[3];
  uint8_t v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v29 = 0;
  objc_storeStrong(&v29, a5);
  v28 = 0;
  objc_storeStrong(&v28, a6);
  v27 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v27, "setDateFormat:", CFSTR("YYYY-MM-dd-HH-mm-ss-SSS"));
  v26 = (id)objc_msgSend(v27, "stringFromDate:", v30);
  v18 = (id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v17 = (id)objc_msgSend(v18, "identifierForVendor");
  v16 = (id)objc_msgSend(v17, "UUIDString");
  v25 = (id)objc_msgSend(v16, "substringToIndex:", 5);

  v24 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@_%@.%@"), v25, v26, location[0], v29);
  if ((objc_msgSend(v26, "isEqualToString:", &stru_24F18FC50) & 1) != 0)
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), location[0], v29);
    v7 = v24;
    v24 = v6;

  }
  v11 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v28, 0);

  if ((v12 & 1) == 0)
  {
    v23 = 0;
    v10 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v22 = v23;
    objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v28, 1, 0, &v22);
    objc_storeStrong(&v23, v22);

    if (v23)
    {
      v21 = (id)AXLogBackTap();
      v20 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v32, (uint64_t)"+[AXPhoenixDataCollectionUtils createFilename:usingTimestamp:withFileExtension:underDirectory:]", (uint64_t)v23);
        _os_log_error_impl(&dword_228CDB000, (os_log_t)v21, v20, "[PHOENIX] %s Error creating directory: %@", v32, 0x16u);
      }
      objc_storeStrong(&v21, 0);
    }
    objc_storeStrong(&v23, 0);
  }
  v19 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v28, v24);
  v9 = v19;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v9;
}

+ (void)deleteItem:(id)a3
{
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  NSObject *log;
  os_log_type_t type;
  id v8;
  id v9;
  id v10;
  os_log_type_t v11;
  os_log_t oslog;
  id v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id v17;
  id location[3];
  uint8_t v19[32];
  uint8_t v20[40];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  v9 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v16 = v17;
  objc_msgSend(v9, "removeItemAtPath:error:", location[0], &v16);
  objc_storeStrong(&v17, v16);

  if (v17)
  {
    v15 = (id)AXLogBackTap();
    v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      log = v15;
      type = v14;
      v8 = (id)objc_msgSend(location[0], "lastPathComponent");
      v13 = v8;
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v20, (uint64_t)"+[AXPhoenixDataCollectionUtils deleteItem:]", (uint64_t)v13, (uint64_t)v17);
      _os_log_impl(&dword_228CDB000, log, type, "[PHOENIX] %s Error deleting %@: %@", v20, 0x20u);

      objc_storeStrong(&v13, 0);
    }
    objc_storeStrong(&v15, 0);
  }
  else
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v3 = oslog;
      v4 = v11;
      v5 = (id)objc_msgSend(location[0], "lastPathComponent");
      v10 = v5;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v19, (uint64_t)"+[AXPhoenixDataCollectionUtils deleteItem:]", (uint64_t)v10);
      _os_log_impl(&dword_228CDB000, v3, v4, "[PHOENIX] %s Deleted: %@", v19, 0x16u);

      objc_storeStrong(&v10, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

+ (void)moveFiles:(id)a3 from:(id)a4 to:(id)a5
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  os_log_t v21;
  id v22;
  id v23;
  _QWORD __b[8];
  uint64_t v25;
  os_log_type_t type;
  os_log_t oslog;
  id v28;
  id v29;
  id v30;
  id location[3];
  uint8_t v32[32];
  _QWORD v33[2];
  _QWORD v34[2];
  _BYTE v35[128];
  uint8_t v36[40];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v29 = 0;
  objc_storeStrong(&v29, a5);
  v28 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  if ((objc_msgSend(v28, "fileExistsAtPath:", v29) & 1) == 0)
    objc_msgSend(v28, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v29, 1, 0);
  oslog = (os_log_t)(id)AXLogBackTap();
  type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v36, (uint64_t)"+[AXPhoenixDataCollectionUtils moveFiles:from:to:]", (uint64_t)v30, (uint64_t)v29);
    _os_log_impl(&dword_228CDB000, oslog, type, "[PHOENIX] %s Moving files from %@ to %@", v36, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  memset(__b, 0, sizeof(__b));
  v17 = location[0];
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
  if (v18)
  {
    v14 = *(_QWORD *)__b[2];
    v15 = 0;
    v16 = v18;
    while (1)
    {
      v13 = v15;
      if (*(_QWORD *)__b[2] != v14)
        objc_enumerationMutation(v17);
      v25 = *(_QWORD *)(__b[1] + 8 * v15);
      v23 = 0;
      v8 = v28;
      v6 = (void *)MEMORY[0x24BDD17C8];
      v34[0] = v30;
      v34[1] = v25;
      v12 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34);
      v11 = (id)objc_msgSend(v6, "pathWithComponents:");
      v7 = (void *)MEMORY[0x24BDD17C8];
      v33[0] = v29;
      v33[1] = v25;
      v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
      v9 = (id)objc_msgSend(v7, "pathWithComponents:");
      v22 = v23;
      objc_msgSend(v8, "moveItemAtPath:toPath:error:", v11);
      objc_storeStrong(&v23, v22);

      if (v23)
      {
        v21 = (os_log_t)(id)AXLogBackTap();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v5 = v21;
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v32, (uint64_t)"+[AXPhoenixDataCollectionUtils moveFiles:from:to:]", v25);
          _os_log_error_impl(&dword_228CDB000, v5, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error moving file to package directory: %@", v32, 0x16u);
        }
        objc_storeStrong((id *)&v21, 0);
      }
      objc_storeStrong(&v23, 0);
      ++v15;
      if (v13 + 1 >= v16)
      {
        v15 = 0;
        v16 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
        if (!v16)
          break;
      }
    }
  }

  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

@end
