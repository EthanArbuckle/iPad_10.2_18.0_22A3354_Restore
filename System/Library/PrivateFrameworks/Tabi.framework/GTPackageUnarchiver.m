@implementation GTPackageUnarchiver

+ (BOOL)unarchivePackages:(id)a3 into:(id)a4 error:(id *)a5
{
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  NSObject *log;
  os_log_type_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  id v37;
  os_log_t v38;
  os_log_type_t v39;
  os_log_t v40;
  os_log_type_t v41;
  os_log_t v42;
  double v43;
  int v44;
  os_log_type_t type;
  os_log_t oslog;
  id v47;
  double v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  _QWORD __b[8];
  id v54;
  uint64_t v55;
  int v56;
  id *v57;
  id v58;
  id location[3];
  char v60;
  uint8_t v61[32];
  uint64_t v62;
  id v63;
  uint8_t v64[32];
  uint8_t v65[32];
  uint64_t v66;
  id v67;
  uint8_t v68[24];
  const __CFString *v69;
  uint64_t v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v58 = 0;
  objc_storeStrong(&v58, a4);
  v57 = a5;
  v37 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  objc_msgSend(v37, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v58, 1, 0, a5);

  if (*a5)
  {
    v60 = 0;
    v56 = 1;
  }
  else
  {
    v55 = 0;
    memset(__b, 0, sizeof(__b));
    v33 = location[0];
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", __b, v71, 16);
    if (v34)
    {
      v30 = *(_QWORD *)__b[2];
      v31 = 0;
      v32 = v34;
      while (1)
      {
        v29 = v31;
        if (*(_QWORD *)__b[2] != v30)
          objc_enumerationMutation(v33);
        v54 = *(id *)(__b[1] + 8 * v31);
        v26 = v58;
        v27 = (id)objc_msgSend(v54, "identifier");
        v52 = (id)objc_msgSend(v26, "stringByAppendingPathComponent:");

        v28 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        objc_msgSend(v28, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v52, 1, 0, v57);

        if (*v57)
        {
          v60 = 0;
          v56 = 1;
        }
        else
        {
          v51 = 0;
          v51 = BOMCopierNew();
          v50 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          BOMCopierSetUserData();
          BOMCopierSetCopyFileFinishedHandler();
          BOMCopierSetFatalErrorHandler();
          v69 = CFSTR("extractPKZip");
          v70 = MEMORY[0x24BDBD1C8];
          v49 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
          v48 = 0.0;
          objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
          v48 = v5;
          v47 = (id)objc_msgSend(v54, "fileURL");
          if (v47)
          {
            v44 = 0;
            objc_msgSend(objc_retainAutorelease(v47), "fileSystemRepresentation");
            objc_msgSend(objc_retainAutorelease(v52), "fileSystemRepresentation");
            v44 = BOMCopierCopyWithOptions();
            v43 = 0.0;
            objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
            v43 = v6;
            BOMCopierFree();
            if (v44)
            {
              v40 = (os_log_t)APDefaultLog();
              v39 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                v15 = v40;
                v8 = objc_msgSend(v50, "count");
                __os_log_helper_16_2_3_8_0_8_0_8_66((uint64_t)v64, v8, COERCE__INT64(v43 - v48), (uint64_t)v52);
                _os_log_error_impl(&dword_247DB8000, v15, v39, "failed to extract %lu files from zip archive in %.2fs to %{public}@", v64, 0x20u);
              }
              objc_storeStrong((id *)&v40, 0);
              v11 = (void *)MEMORY[0x24BDD1540];
              v62 = *MEMORY[0x24BDD0FC8];
              v10 = (void *)MEMORY[0x24BDD17C8];
              v14 = (id)objc_msgSend(v54, "identifier");
              v13 = (id)objc_msgSend(v10, "stringWithFormat:", CFSTR("Failed to extract resource %@"), v14);
              v63 = v13;
              v12 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62);
              *v57 = (id)objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("GTPackageUnarchiverErrorDomain"), 1);

              v60 = 0;
              v56 = 1;
            }
            else
            {
              v55 += objc_msgSend(v50, "count");
              v42 = (os_log_t)APDefaultLog();
              v41 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                v16 = v42;
                v17 = v41;
                v7 = objc_msgSend(v50, "count");
                __os_log_helper_16_2_3_8_0_8_0_8_66((uint64_t)v65, v7, COERCE__INT64(v43 - v48), (uint64_t)v52);
                _os_log_impl(&dword_247DB8000, v16, v17, "successfully extracted %lu files from zip archive in %.2fs to %{public}@", v65, 0x20u);
              }
              objc_storeStrong((id *)&v42, 0);
              v56 = 0;
            }
          }
          else
          {
            oslog = (os_log_t)APDefaultLog();
            type = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              log = oslog;
              v24 = type;
              v25 = (id)objc_msgSend(v54, "identifier");
              __os_log_helper_16_2_1_8_64((uint64_t)v68, (uint64_t)v25);
              _os_log_error_impl(&dword_247DB8000, log, v24, "Failed to extract resource %@ due to missing on-disk URL.", v68, 0xCu);

            }
            objc_storeStrong((id *)&oslog, 0);
            v19 = (void *)MEMORY[0x24BDD1540];
            v66 = *MEMORY[0x24BDD0FC8];
            v18 = (void *)MEMORY[0x24BDD17C8];
            v22 = (id)objc_msgSend(v54, "identifier");
            v21 = (id)objc_msgSend(v18, "stringWithFormat:", CFSTR("Failed to extract resource %@ due to missing on-disk URL."), v22);
            v67 = v21;
            v20 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
            *v57 = (id)objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("GTPackageUnarchiverErrorDomain"), 2);

            v60 = 0;
            v56 = 1;
          }
          objc_storeStrong(&v47, 0);
          objc_storeStrong(&v49, 0);
          objc_storeStrong(&v50, 0);
        }
        objc_storeStrong(&v52, 0);
        if (v56)
          break;
        ++v31;
        if (v29 + 1 >= v32)
        {
          v31 = 0;
          v32 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", __b, v71, 16);
          if (!v32)
            goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_24:
      v56 = 0;
    }

    if (!v56)
    {
      v38 = (os_log_t)APDefaultLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_0_8_66((uint64_t)v61, v55, (uint64_t)v58);
        _os_log_impl(&dword_247DB8000, v38, OS_LOG_TYPE_DEFAULT, "finished unzipping %lu total files to %{public}@", v61, 0x16u);
      }
      objc_storeStrong((id *)&v38, 0);
      v60 = 1;
      v56 = 1;
    }
  }
  objc_storeStrong(&v58, 0);
  objc_storeStrong(location, 0);
  return v60 & 1;
}

@end
