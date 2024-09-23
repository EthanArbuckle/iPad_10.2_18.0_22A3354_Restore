@implementation AXPhoenixDataPackager

- (AXPhoenixDataPackager)initWithFileSuffixes:(id)a3 fromDataDirectory:(id)a4
{
  AXPhoenixDataPackager *v4;
  AXPhoenixDataPackager *v6;
  objc_super v8;
  id v9;
  id location[2];
  AXPhoenixDataPackager *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AXPhoenixDataPackager;
  v11 = -[AXPhoenixDataPackager init](&v8, sel_init);
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    -[AXPhoenixDataPackager setAllowedFileSuffixes:](v11, "setAllowedFileSuffixes:", location[0]);
    -[AXPhoenixDataPackager setDataDirectory:](v11, "setDataDirectory:", v9);
  }
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (id)packageDataUsingFiles:(id)a3
{
  id v4;
  AXPhoenixDataPackager *v5;
  NSString *v6;
  NSString *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id obj;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD __b[8];
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id location[2];
  AXPhoenixDataPackager *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF ENDSWITH %@"), kMetadataFileExtension);
  v22 = (id)objc_msgSend(location[0], "filteredArrayUsingPredicate:", v23);
  v21 = (id)objc_opt_new();
  memset(__b, 0, sizeof(__b));
  obj = v22;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
  if (v14)
  {
    v10 = *(_QWORD *)__b[2];
    v11 = 0;
    v12 = v14;
    while (1)
    {
      v9 = v11;
      if (*(_QWORD *)__b[2] != v10)
        objc_enumerationMutation(obj);
      v20 = *(_QWORD *)(__b[1] + 8 * v11);
      v18 = -[AXPhoenixDataPackager _getDataForSubsession:](v25, "_getDataForSubsession:", v20);
      v17 = -[AXPhoenixDataPackager _buildPackageDirectoryNameFromFilename:withMetadata:](v25, "_buildPackageDirectoryNameFromFilename:withMetadata:", v20, v18);
      v5 = v25;
      v6 = -[AXPhoenixDataPackager dataDirectory](v25, "dataDirectory");
      v16 = -[AXPhoenixDataPackager _createPackageDirectory:withPackageDirectoryName:](v5, "_createPackageDirectory:withPackageDirectoryName:");

      v8 = (id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("data_files"));
      v7 = -[AXPhoenixDataPackager dataDirectory](v25, "dataDirectory");
      +[AXPhoenixDataCollectionUtils moveFiles:from:to:](AXPhoenixDataCollectionUtils, "moveFiles:from:to:", v8);

      v15 = -[AXPhoenixDataPackager _archiveDirectory:](v25, "_archiveDirectory:", v16);
      objc_msgSend(v21, "addObject:", v15);
      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v18, 0);
      ++v11;
      if (v9 + 1 >= v12)
      {
        v11 = 0;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
        if (!v12)
          break;
      }
    }
  }

  v4 = v21;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)isValidFile:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSArray *obj;
  uint64_t v9;
  int v10;
  _QWORD __b[8];
  uint64_t v12;
  id location[2];
  AXPhoenixDataPackager *v14;
  char v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  obj = -[AXPhoenixDataPackager allowedFileSuffixes](v14, "allowedFileSuffixes");
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(__b[1] + 8 * v6);
      if ((objc_msgSend(location[0], "hasSuffix:", v12) & 1) != 0)
        break;
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v7)
          goto LABEL_9;
      }
    }
    v15 = 1;
    v10 = 1;
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  if (!v10)
    v15 = 0;
  objc_storeStrong(location, 0);
  return v15 & 1;
}

- (id)_getDataForSubsession:(id)a3
{
  NSString *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSString *v14;
  id location[2];
  AXPhoenixDataPackager *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[AXPhoenixDataPackager dataDirectory](v16, "dataDirectory");
  v14 = -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", location[0]);

  v13 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v14);
  v12 = (id)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v13, 0, 0);
  v5 = (id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("sensors"));
  v11 = (id)objc_msgSend(v5, "allValues");

  v6 = (id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("annotations"));
  v10 = (id)objc_msgSend(v6, "allValues");

  v9 = (id)objc_opt_new();
  objc_msgSend(v9, "addObjectsFromArray:", v11);
  objc_msgSend(v9, "addObjectsFromArray:", v10);
  objc_msgSend(v9, "addObject:", location[0]);
  v17[0] = CFSTR("data_files");
  v18[0] = v9;
  v17[1] = CFSTR("username");
  v7 = (id)objc_msgSend(v12, "objectForKeyedSubscript:");
  v18[1] = v7;
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_buildPackageDirectoryNameFromFilename:(id)a3 withMetadata:(id)a4
{
  uint64_t v4;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v7 = objc_msgSend(location[0], "length");
  v17 = v7 - objc_msgSend((id)kMetadataFileExtension, "length");
  v16 = (id)objc_msgSend(location[0], "substringToIndex:", v17);
  v13 = objc_msgSend(location[0], "rangeOfString:", CFSTR("-"));
  v14 = v4;
  v15 = v13 + 1;
  v12 = (id)objc_msgSend(v16, "substringFromIndex:", v13 + 1);
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("username"));
  v11 = (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%@"), v9, v12);

  v10 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)_createPackageDirectory:(id)a3 withPackageDirectoryName:(id)a4
{
  void *v6;
  id v7;
  id v8;
  os_log_t v9;
  int v10;
  os_log_type_t type;
  os_log_t oslog;
  id v13;
  id v14;
  id v15;
  id v16;
  id location[3];
  __CFString *v18;
  uint8_t v19[32];
  uint8_t v20[24];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v21[0] = location[0];
  v21[1] = v16;
  v7 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v15 = (id)objc_msgSend(v6, "pathWithComponents:");

  v14 = 0;
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = v14;
  objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 0, 0, &v13);
  objc_storeStrong(&v14, v13);

  if (v14)
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v20, (uint64_t)"-[AXPhoenixDataPackager _createPackageDirectory:withPackageDirectoryName:]", (uint64_t)v14);
      _os_log_error_impl(&dword_228CDB000, oslog, type, "[PHOENIX] %s Error while creating package directory: %@. Using /tmp...", v20, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v18 = CFSTR("/tmp");
    v10 = 1;
  }
  else
  {
    v9 = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v19, (uint64_t)"-[AXPhoenixDataPackager _createPackageDirectory:withPackageDirectoryName:]", (uint64_t)v15);
      _os_log_impl(&dword_228CDB000, v9, OS_LOG_TYPE_INFO, "[PHOENIX] %s Created package directory at %@", v19, 0x16u);
    }
    objc_storeStrong((id *)&v9, 0);
    v18 = (__CFString *)v15;
    v10 = 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v18;
}

- (id)_archiveDirectory:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  id v8;
  NSObject *log;
  os_log_type_t type;
  id v11;
  id v12;
  id v13;
  id v14;
  os_log_t oslog;
  id obj;
  id v17;
  os_log_type_t v18;
  id v19;
  id v20;
  os_log_type_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location[3];
  uint8_t v29[32];
  uint8_t v30[32];
  uint8_t v31[40];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.tgz"), location[0]);
  v26 = (id)objc_msgSend(v27, "stringByAppendingString:", CFSTR(".tmp"));
  v25 = -[AXPhoenixDataArchiver initWithPath:]([AXPhoenixDataArchiver alloc], "initWithPath:", v26);
  v12 = location[0];
  v13 = (id)objc_msgSend(location[0], "lastPathComponent");
  objc_msgSend(v25, "addDirectoryToArchive:withDirName:", v12);

  objc_msgSend(v25, "closeArchive");
  v24 = 0;
  v14 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v23 = v24;
  objc_msgSend(v14, "removeItemAtPath:error:", location[0], &v23);
  objc_storeStrong(&v24, v23);

  if (v24)
  {
    v22 = (id)AXLogBackTap();
    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      log = v22;
      type = v21;
      v11 = (id)objc_msgSend(location[0], "lastPathComponent");
      v20 = v11;
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v31, (uint64_t)"-[AXPhoenixDataPackager _archiveDirectory:]", (uint64_t)v20, (uint64_t)v24);
      _os_log_impl(&dword_228CDB000, log, type, "[PHOENIX] %s Error deleting %@: %@", v31, 0x20u);

      objc_storeStrong(&v20, 0);
    }
    objc_storeStrong(&v22, 0);
  }
  else
  {
    v19 = (id)AXLogBackTap();
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v19;
      v7 = v18;
      v8 = (id)objc_msgSend(location[0], "lastPathComponent");
      v17 = v8;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v30, (uint64_t)"-[AXPhoenixDataPackager _archiveDirectory:]", (uint64_t)v17);
      _os_log_impl(&dword_228CDB000, v6, v7, "[PHOENIX] %s Deleted: %@", v30, 0x16u);

      objc_storeStrong(&v17, 0);
    }
    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(&v24, 0);
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  obj = v24;
  objc_msgSend(v5, "moveItemAtPath:toPath:error:", v26, v27, &obj);
  objc_storeStrong(&v24, obj);

  if (v24)
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v29, (uint64_t)"-[AXPhoenixDataPackager _archiveDirectory:]", (uint64_t)v24);
      _os_log_error_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error while renaming temporary archive file: %@", v29, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v4 = v27;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (NSString)dataDirectory
{
  return self->_dataDirectory;
}

- (void)setDataDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_dataDirectory, a3);
}

- (NSArray)allowedFileSuffixes
{
  return self->_allowedFileSuffixes;
}

- (void)setAllowedFileSuffixes:(id)a3
{
  objc_storeStrong((id *)&self->_allowedFileSuffixes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedFileSuffixes, 0);
  objc_storeStrong((id *)&self->_dataDirectory, 0);
}

@end
