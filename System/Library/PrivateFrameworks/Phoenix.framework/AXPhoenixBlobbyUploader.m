@implementation AXPhoenixBlobbyUploader

- (id)_hmacSHA1WithKey:(id)a3 forData:(id)a4
{
  void *key;
  uint64_t keyLength;
  void *data;
  id v9;
  int v10;
  id v11;
  id location[3];
  id v13;
  _BYTE macOut[20];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  if (v11)
  {
    key = (void *)objc_msgSend(objc_retainAutorelease(location[0]), "bytes");
    keyLength = objc_msgSend(location[0], "length");
    data = (void *)objc_msgSend(objc_retainAutorelease(v11), "bytes");
    CCHmac(0, key, keyLength, data, objc_msgSend(v11, "length"), macOut);
    v9 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", macOut, 20);
    v13 = v9;
    v10 = 1;
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v13 = 0;
    v10 = 1;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (id)_getAuthorizationForRequest:(id)a3 headers:(id)a4
{
  id v5;
  id v6;
  id v7;
  AXPhoenixBlobbyUploader *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location[2];
  AXPhoenixBlobbyUploader *v29;

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = 0;
  objc_storeStrong(&v27, a4);
  v26 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (id)objc_msgSend(location[0], "HTTPMethod");
  objc_msgSend(v26, "addObject:");

  v25 = (id)objc_msgSend(v27, "objectForKey:", CFSTR("Content-MD5"));
  if (v25)
    v18 = (const __CFString *)v25;
  else
    v18 = &stru_24F18FC50;
  objc_msgSend(v26, "addObject:", v18);
  v24 = (id)objc_msgSend(v27, "objectForKey:", CFSTR("Content-Type"));
  if (v24)
    v17 = (const __CFString *)v24;
  else
    v17 = &stru_24F18FC50;
  objc_msgSend(v26, "addObject:", v17);
  v23 = (id)objc_msgSend(v27, "objectForKey:", CFSTR("Date"));
  if (v23)
    v16 = (const __CFString *)v23;
  else
    v16 = &stru_24F18FC50;
  objc_msgSend(v26, "addObject:", v16);
  v5 = v26;
  v7 = (id)objc_msgSend(location[0], "URL");
  v6 = (id)objc_msgSend(v7, "path");
  objc_msgSend(v5, "addObject:");

  v22 = (id)objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
  v8 = v29;
  v11 = -[NSDictionary objectForKeyedSubscript:](v29->_bucketInfo, "objectForKeyedSubscript:", CFSTR("SecretKey"));
  v10 = (id)objc_msgSend(v11, "dataUsingEncoding:", 4);
  v9 = (id)objc_msgSend(v22, "dataUsingEncoding:", 134217984);
  v21 = -[AXPhoenixBlobbyUploader _hmacSHA1WithKey:forData:](v8, "_hmacSHA1WithKey:forData:", v10);

  v12 = (void *)MEMORY[0x24BDD17C8];
  v14 = -[NSDictionary objectForKeyedSubscript:](v29->_bucketInfo, "objectForKeyedSubscript:", CFSTR("AccessIdentifier"));
  v13 = (id)objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
  v15 = (id)objc_msgSend(v12, "stringWithFormat:", CFSTR("AWS %@:%@"), v14, v13);

  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v15;
}

- (id)_dateStringForHeaderForDate:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;
  id location[3];
  id v11;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v8, "setDateFormat:", CFSTR("EEE',' dd' 'MMM' 'yyyy HH':'mm':'ss Z"));
    v4 = v8;
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF38]), "initWithName:", CFSTR("UTC"));
    objc_msgSend(v4, "setTimeZone:");

    v6 = v8;
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v6, "setLocale:");

    v11 = (id)objc_msgSend(v8, "stringFromDate:", location[0]);
    v9 = 1;
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v11 = 0;
    v9 = 1;
  }
  objc_storeStrong(location, 0);
  return v11;
}

- (id)_md5OfData:(id)a3
{
  void *data;
  id v5;
  id location[3];
  unsigned __int8 md[16];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  data = (void *)objc_msgSend(objc_retainAutorelease(location[0]), "bytes");
  CC_MD5(data, objc_msgSend(location[0], "length"), md);
  v5 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 16);
  objc_storeStrong(location, 0);
  return v5;
}

+ (id)_getStringforDate:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v6, "setDateFormat:", CFSTR("yyyyMMdd"));
  v5 = (id)objc_msgSend(v6, "stringFromDate:", location[0]);
  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_urlRequestForFileAtPath:(id)a3 bucket:(id)a4 prefix:(id)a5 error:(id *)a6
{
  id v6;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  AXPhoenixBlobbyUploader *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v28;
  os_log_type_t v29;
  os_log_t oslog;
  id v31;
  id v32;
  os_log_type_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  int v38;
  os_log_type_t v39;
  id v40;
  id v41;
  uint64_t *v42;
  id v43;
  id v44;
  id location[2];
  AXPhoenixBlobbyUploader *v46;
  id v47;
  uint8_t v48[32];
  uint8_t v49[32];
  uint8_t v50[40];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v44 = 0;
  objc_storeStrong(&v44, a4);
  v43 = 0;
  objc_storeStrong(&v43, a5);
  v42 = (uint64_t *)a6;
  v41 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", location[0], 8, a6);
  if (*a6)
  {
    v40 = (id)AXLogBackTap();
    v39 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v50, (uint64_t)"-[AXPhoenixBlobbyUploader _urlRequestForFileAtPath:bucket:prefix:error:]", (uint64_t)location[0], *v42);
      _os_log_error_impl(&dword_228CDB000, (os_log_t)v40, v39, "[PHOENIX] %s Unable to memory map %@ %@", v50, 0x20u);
    }
    objc_storeStrong(&v40, 0);
    v47 = 0;
    v38 = 1;
  }
  else
  {
    v37 = (id)objc_msgSend(location[0], "lastPathComponent");
    v36 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@/%@"), v44, v43, v37);
    v19 = (void *)MEMORY[0x24BDBCF48];
    v24 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v36);
    v23 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
    v22 = (id)objc_msgSend(v24, "stringByAddingPercentEncodingWithAllowedCharacters:");
    v18 = (void *)MEMORY[0x24BDBCF48];
    v21 = -[NSDictionary objectForKeyedSubscript:](v46->_bucketInfo, "objectForKeyedSubscript:", CFSTR("Endpoint"));
    v20 = (id)objc_msgSend(v18, "URLWithString:");
    v35 = (id)objc_msgSend(v19, "URLWithString:relativeToURL:", v22);

    v34 = (id)AXLogBackTap();
    v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v49, (uint64_t)"-[AXPhoenixBlobbyUploader _urlRequestForFileAtPath:bucket:prefix:error:]", (uint64_t)v35);
      _os_log_impl(&dword_228CDB000, (os_log_t)v34, v33, "[PHOENIX] %s Blobby upload URL: %@", v49, 0x16u);
    }
    objc_storeStrong(&v34, 0);
    v6 = objc_alloc(MEMORY[0x24BDD16B0]);
    v32 = (id)objc_msgSend(v6, "initWithURL:", v35);
    objc_msgSend(v32, "setHTTPMethod:", CFSTR("PUT"));
    v31 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("application/octet-stream"), CFSTR("Content-Type"));
    v11 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v41, "length"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:");

    v13 = -[AXPhoenixBlobbyUploader _md5OfData:](v46, "_md5OfData:", v41);
    v12 = (id)objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
    objc_msgSend(v31, "setObject:forKeyedSubscript:");

    v14 = v46;
    v16 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = -[AXPhoenixBlobbyUploader _dateStringForHeaderForDate:](v14, "_dateStringForHeaderForDate:");
    objc_msgSend(v31, "setObject:forKeyedSubscript:");

    objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("100-continue"), CFSTR("Expect"));
    v17 = -[AXPhoenixBlobbyUploader _getAuthorizationForRequest:headers:](v46, "_getAuthorizationForRequest:headers:", v32, v31);
    objc_msgSend(v31, "setObject:forKeyedSubscript:");

    objc_msgSend(v32, "setAllHTTPHeaderFields:", v31);
    objc_msgSend(v32, "setCachePolicy:", 1);
    objc_msgSend(v32, "setHTTPShouldHandleCookies:", 0);
    objc_msgSend(v32, "setTimeoutInterval:", (double)kRequestTimeout);
    oslog = (os_log_t)(id)AXLogBackTap();
    v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = oslog;
      v9 = v29;
      v10 = (id)objc_msgSend(v32, "allHTTPHeaderFields");
      v28 = v10;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v48, (uint64_t)"-[AXPhoenixBlobbyUploader _urlRequestForFileAtPath:bucket:prefix:error:]", (uint64_t)v28);
      _os_log_impl(&dword_228CDB000, v8, v9, "[PHOENIX] %s URL request: %@", v48, 0x16u);

      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v47 = v32;
    v38 = 1;
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
  }
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
  return v47;
}

- (void)_completeUploadRequestWithData:(id)a3 urlResponse:(id)a4 error:(id)a5 forPackagePath:(id)a6 withCompletion:(id)a7
{
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  id v17;
  os_log_type_t v18;
  os_log_t oslog;
  id v20;
  os_log_type_t v21;
  id v22;
  id v23;
  os_log_type_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id location[3];
  uint8_t v31[32];
  uint8_t v32[32];
  uint8_t v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v28 = 0;
  objc_storeStrong(&v28, a5);
  v27 = 0;
  objc_storeStrong(&v27, a6);
  v26 = 0;
  objc_storeStrong(&v26, a7);
  if (v28)
  {
    v25 = (id)AXLogBackTap();
    v24 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v33, (uint64_t)"-[AXPhoenixBlobbyUploader _completeUploadRequestWithData:urlResponse:error:forPackagePath:withCompletion:]", (uint64_t)v28);
      _os_log_error_impl(&dword_228CDB000, (os_log_t)v25, v24, "[PHOENIX] %s Upload task error: %@", v33, 0x16u);
    }
    objc_storeStrong(&v25, 0);
    (*((void (**)(id, _QWORD, id))v26 + 2))(v26, 0, v28);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v29;
      if (objc_msgSend(v23, "statusCode") == 200)
      {
        v22 = (id)AXLogBackTap();
        v21 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v22;
          v11 = v21;
          v12 = (id)objc_msgSend(v27, "lastPathComponent");
          v20 = v12;
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v32, (uint64_t)"-[AXPhoenixBlobbyUploader _completeUploadRequestWithData:urlResponse:error:forPackagePath:withCompletion:]", (uint64_t)v20);
          _os_log_impl(&dword_228CDB000, v10, v11, "[PHOENIX] %s Upload successful for %@.", v32, 0x16u);

          objc_storeStrong(&v20, 0);
        }
        objc_storeStrong(&v22, 0);
        (*((void (**)(id, uint64_t, _QWORD))v26 + 2))(v26, 1, 0);
      }
      else
      {
        oslog = (os_log_t)(id)AXLogBackTap();
        v18 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v7 = oslog;
          v8 = v18;
          v9 = (id)objc_msgSend(MEMORY[0x24BDD15B8], "localizedStringForStatusCode:", objc_msgSend(v23, "statusCode"));
          v17 = v9;
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v31, (uint64_t)"-[AXPhoenixBlobbyUploader _completeUploadRequestWithData:urlResponse:error:forPackagePath:withCompletion:]", (uint64_t)v17);
          _os_log_impl(&dword_228CDB000, v7, v8, "[PHOENIX] %s Upload task response message: %@", v31, 0x16u);

          objc_storeStrong(&v17, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      objc_storeStrong(&v23, 0);
    }
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)_uploadPackage:(id)a3 bucket:(id)a4 prefix:(id)a5 withCompletion:(id)a6
{
  NSObject *log;
  os_log_type_t v7;
  id v8;
  id v9;
  id v10;
  NSURLSession *session;
  id v15;
  id v16;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v19;
  int v20;
  int v21;
  void (*v22)(uint64_t, void *, void *, void *);
  void *v23;
  AXPhoenixBlobbyUploader *v24;
  id v25;
  id v26;
  NSURLSessionUploadTask *v27;
  id v28;
  int v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id location[2];
  AXPhoenixBlobbyUploader *v37;
  uint8_t v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  v34 = 0;
  objc_storeStrong(&v34, a5);
  v33 = 0;
  objc_storeStrong(&v33, a6);
  v32 = 0;
  v30 = 0;
  v15 = -[AXPhoenixBlobbyUploader _urlRequestForFileAtPath:bucket:prefix:error:](v37, "_urlRequestForFileAtPath:bucket:prefix:error:", location[0], v35, v34, &v30);
  objc_storeStrong(&v32, v30);
  v31 = v15;
  if (v32)
  {
    (*((void (**)(id, _QWORD, id))v33 + 2))(v33, 0, v32);
    v29 = 1;
  }
  else
  {
    v28 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", location[0]);
    session = v37->_session;
    v9 = v31;
    v10 = v28;
    v19 = MEMORY[0x24BDAC760];
    v20 = -1073741824;
    v21 = 0;
    v22 = __71__AXPhoenixBlobbyUploader__uploadPackage_bucket_prefix_withCompletion___block_invoke;
    v23 = &unk_24F18F310;
    v24 = v37;
    v25 = location[0];
    v26 = v33;
    v27 = -[NSURLSession uploadTaskWithRequest:fromFile:completionHandler:](session, "uploadTaskWithRequest:fromFile:completionHandler:", v9, v10, &v19);
    oslog = (os_log_t)(id)AXLogBackTap();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      v7 = type;
      v8 = (id)objc_msgSend(location[0], "lastPathComponent");
      v16 = v8;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v38, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackage:bucket:prefix:withCompletion:]", (uint64_t)v16);
      _os_log_impl(&dword_228CDB000, log, v7, "[PHOENIX] %s Uploading package: %@", v38, 0x16u);

      objc_storeStrong(&v16, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[NSURLSessionUploadTask resume](v27, "resume");
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong((id *)&v24, 0);
    objc_storeStrong(&v28, 0);
    v29 = 0;
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __71__AXPhoenixBlobbyUploader__uploadPackage_bucket_prefix_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  objc_msgSend(*(id *)(a1 + 32), "_completeUploadRequestWithData:urlResponse:error:forPackagePath:withCompletion:", location[0], v8, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_uploadPackagePath:(id)a3 bucket:(id)a4 prefix:(id)a5 withCompletion:(id)a6
{
  NSObject *queue;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  os_log_type_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location[2];
  AXPhoenixBlobbyUploader *v27;
  uint8_t v28[56];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = 0;
  objc_storeStrong(&v23, a6);
  v22 = (id)AXLogBackTap();
  v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v28, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackagePath:bucket:prefix:withCompletion:]", (uint64_t)location[0], (uint64_t)v25, (uint64_t)v24);
    _os_log_impl(&dword_228CDB000, (os_log_t)v22, v21, "[PHOENIX] %s Blobby uploader called with file:%@ bucket:%@ prefix:%@", v28, 0x2Au);
  }
  objc_storeStrong(&v22, 0);
  objc_initWeak(&v20, v27);
  queue = v27->_queue;
  v10 = MEMORY[0x24BDAC760];
  v11 = -1073741824;
  v12 = 0;
  v13 = __75__AXPhoenixBlobbyUploader__uploadPackagePath_bucket_prefix_withCompletion___block_invoke;
  v14 = &unk_24F18F360;
  objc_copyWeak(&v19, &v20);
  v15 = location[0];
  v16 = v25;
  v17 = v24;
  v18 = v23;
  dispatch_async(queue, &v10);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v20);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

void __75__AXPhoenixBlobbyUploader__uploadPackagePath_bucket_prefix_withCompletion___block_invoke(uint64_t a1)
{
  dispatch_time_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *dsema;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, char, id);
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  os_log_type_t v18;
  id v19;
  os_log_type_t v20;
  id location;
  id v22[3];
  uint8_t v23[32];
  uint8_t v24[56];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22[2] = (id)a1;
  v22[1] = (id)a1;
  v22[0] = objc_loadWeakRetained((id *)(a1 + 64));
  location = (id)AXLogBackTap();
  v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v24, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackagePath:bucket:prefix:withCompletion:]_block_invoke", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    _os_log_impl(&dword_228CDB000, (os_log_t)location, v20, "[PHOENIX] %s Blobby uploader starting to upload %@ to %@/%@", v24, 0x2Au);
  }
  objc_storeStrong(&location, 0);
  dsema = *((_QWORD *)v22[0] + 2);
  v1 = dispatch_time(0, 1000000000 * kSemaphoreTimeoutInSeconds);
  dispatch_semaphore_wait(dsema, v1);
  v19 = (id)AXLogBackTap();
  v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v23, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackagePath:bucket:prefix:withCompletion:]_block_invoke", *(_QWORD *)(a1 + 32));
    _os_log_impl(&dword_228CDB000, (os_log_t)v19, v18, "[PHOENIX] %s Blobby uploader semaphore wait completed for %@", v23, 0x16u);
  }
  objc_storeStrong(&v19, 0);
  v5 = v22[0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __75__AXPhoenixBlobbyUploader__uploadPackagePath_bucket_prefix_withCompletion___block_invoke_61;
  v12 = &unk_24F18F338;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = v22[0];
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v5, "_uploadPackage:bucket:prefix:withCompletion:", v2, v3, v4, &v8);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v22, 0);
}

void __75__AXPhoenixBlobbyUploader__uploadPackagePath_bucket_prefix_withCompletion___block_invoke_61(uint64_t a1, char a2, id obj)
{
  os_log_t v4;
  os_log_type_t v5;
  os_log_t v6;
  os_log_type_t type;
  os_log_t oslog[2];
  id location;
  char v10;
  uint64_t v11;
  uint8_t v12[48];
  uint8_t v13[32];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  v10 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = (os_log_t)a1;
  if ((v10 & 1) != 0)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v14, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackagePath:bucket:prefix:withCompletion:]_block_invoke", *(_QWORD *)(a1 + 32));
      _os_log_impl(&dword_228CDB000, oslog[0], type, "[PHOENIX] %s Package %@ uploaded successfully", v14, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    v6 = (os_log_t)(id)AXLogBackTap();
    v5 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v13, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackagePath:bucket:prefix:withCompletion:]_block_invoke", *(_QWORD *)(a1 + 32), (uint64_t)location);
      _os_log_error_impl(&dword_228CDB000, v6, v5, "[PHOENIX] %s Package upload %@ failed %@", v13, 0x20u);
    }
    objc_storeStrong((id *)&v6, 0);
  }
  v4 = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v12, (uint64_t)"-[AXPhoenixBlobbyUploader _uploadPackagePath:bucket:prefix:withCompletion:]_block_invoke", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    _os_log_impl(&dword_228CDB000, v4, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Blobby uploader done uploading %@ to %@/%@", v12, 0x2Au);
  }
  objc_storeStrong((id *)&v4, 0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 56) + 16));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_storeStrong(&location, 0);
}

- (id)_prefixFromPackageFilePath:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(location[0], "lastPathComponent");
  v5 = (id)objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("_"));
  v4 = (id)objc_msgSend(v5, "lastObject");
  v7 = (id)objc_msgSend(v4, "substringToIndex:", 10);

  objc_storeStrong(location, 0);
  return v7;
}

- (void)uploadPackages:(id)a3 toBucket:(id)a4 withCompletion:(id)a5
{
  NSObject *queue;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  AXPhoenixBlobbyUploader *v14;
  id v15;
  id v16[2];
  _QWORD v17[2];
  int v18;
  int v19;
  int v20;
  id v21;
  id v22;
  id location[2];
  AXPhoenixBlobbyUploader *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v17[0] = 0;
  v17[1] = v17;
  v18 = 0x20000000;
  v19 = 32;
  v20 = 0;
  queue = v24->_queue;
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __66__AXPhoenixBlobbyUploader_uploadPackages_toBucket_withCompletion___block_invoke;
  v12 = &unk_24F18F3B0;
  v13 = location[0];
  v14 = v24;
  v15 = v22;
  v16[1] = v17;
  v16[0] = v21;
  dispatch_async(queue, &v8);
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v13, 0);
  _Block_object_dispose(v17, 8);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __66__AXPhoenixBlobbyUploader_uploadPackages_toBucket_withCompletion___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *log;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id obj;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(uint64_t, char, id);
  void *v20;
  id v21;
  id v22;
  id v23[2];
  int v24;
  os_log_type_t v25;
  os_log_t v26;
  id v27;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD __b[8];
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t v34[32];
  uint8_t v35[24];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v33 = a1;
  v32 = a1;
  memset(__b, 0, sizeof(__b));
  obj = *(id *)(a1 + 32);
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
  if (v15)
  {
    v10 = *(_QWORD *)__b[2];
    v11 = 0;
    v12 = v15;
    while (1)
    {
      v9 = v11;
      if (*(_QWORD *)__b[2] != v10)
        objc_enumerationMutation(obj);
      v31 = *(id *)(__b[1] + 8 * v11);
      if (v31)
      {
        v27 = (id)objc_msgSend(*(id *)(a1 + 40), "_prefixFromPackageFilePath:", v31);
        if (objc_msgSend(v27, "length"))
        {
          v4 = *(void **)(a1 + 40);
          v1 = v31;
          v2 = *(_QWORD *)(a1 + 48);
          v3 = v27;
          v16 = MEMORY[0x24BDAC760];
          v17 = -1073741824;
          v18 = 0;
          v19 = __66__AXPhoenixBlobbyUploader_uploadPackages_toBucket_withCompletion___block_invoke_66;
          v20 = &unk_24F18F388;
          v21 = v31;
          v22 = *(id *)(a1 + 32);
          v23[1] = *(id *)(a1 + 64);
          v23[0] = *(id *)(a1 + 56);
          objc_msgSend(v4, "_uploadPackagePath:bucket:prefix:withCompletion:", v1, v2, v3, &v16);
          objc_storeStrong(v23, 0);
          objc_storeStrong(&v22, 0);
          objc_storeStrong(&v21, 0);
          v24 = 0;
        }
        else
        {
          v26 = (os_log_t)(id)AXLogBackTap();
          v25 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v5 = v26;
            v6 = v25;
            __os_log_helper_16_2_2_8_32_8_64((uint64_t)v34, (uint64_t)"-[AXPhoenixBlobbyUploader uploadPackages:toBucket:withCompletion:]_block_invoke", (uint64_t)v31);
            _os_log_impl(&dword_228CDB000, v5, v6, "[PHOENIX] %s Skipping upload of invalid prefix for %@", v34, 0x16u);
          }
          objc_storeStrong((id *)&v26, 0);
          v24 = 3;
        }
        objc_storeStrong(&v27, 0);
      }
      else
      {
        oslog = (os_log_t)(id)AXLogBackTap();
        type = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          log = oslog;
          v8 = type;
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v35, (uint64_t)"-[AXPhoenixBlobbyUploader uploadPackages:toBucket:withCompletion:]_block_invoke", (uint64_t)v31);
          _os_log_impl(&dword_228CDB000, log, v8, "[PHOENIX] %s Skipping upload of invalid package file path for %@", v35, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      ++v11;
      if (v9 + 1 >= v12)
      {
        v11 = 0;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
        if (!v12)
          break;
      }
    }
  }

}

void __66__AXPhoenixBlobbyUploader_uploadPackages_toBucket_withCompletion___block_invoke_66(uint64_t a1, char a2, id obj)
{
  uint64_t v3;
  AXPhoenixDataCollectionManager *v4;
  id v5;
  AXPhoenixDataCollectionManager *v6;
  AXPhoenixDataCollectionManager *v7;
  AXPhoenixDataCollectionManager *v8;
  os_log_t oslog;
  os_log_type_t v11;
  id v12;
  os_log_type_t v13;
  id v14[2];
  id location;
  char v16;
  uint64_t v17;
  uint8_t v18[32];
  uint8_t v19[16];
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v17 = a1;
  v16 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v14[1] = (id)a1;
  if (!location && (v16 & 1) != 0)
  {
    v12 = (id)AXLogBackTap();
    v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v19, (uint64_t)"-[AXPhoenixBlobbyUploader uploadPackages:toBucket:withCompletion:]_block_invoke");
      _os_log_impl(&dword_228CDB000, (os_log_t)v12, v11, "[PHOENIX] %s Upload successful.", v19, 0xCu);
    }
    objc_storeStrong(&v12, 0);
    +[AXPhoenixDataCollectionUtils deleteItem:](AXPhoenixDataCollectionUtils, "deleteItem:", *(_QWORD *)(a1 + 32));
    v4 = +[AXPhoenixDataCollectionManager sharedInstance](AXPhoenixDataCollectionManager, "sharedInstance");
    -[AXPhoenixDataCollectionManager updateUploadStatus:error:](v4, "updateUploadStatus:error:", objc_msgSend(*(id *)(a1 + 40), "count"), 0);

  }
  else
  {
    v14[0] = (id)AXLogBackTap();
    v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v14[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v20, (uint64_t)"-[AXPhoenixBlobbyUploader uploadPackages:toBucket:withCompletion:]_block_invoke", (uint64_t)location);
      _os_log_impl(&dword_228CDB000, (os_log_t)v14[0], v13, "[PHOENIX] %s Upload task error: %@", v20, 0x16u);
    }
    objc_storeStrong(v14, 0);
    if (objc_msgSend(location, "code") == -1009)
    {
      v8 = +[AXPhoenixDataCollectionManager sharedInstance](AXPhoenixDataCollectionManager, "sharedInstance");
      -[AXPhoenixDataCollectionManager updateUploadStatus:error:](v8, "updateUploadStatus:error:", -1, CFSTR("Device offline"));

    }
    else if (objc_msgSend(location, "code") == -1003)
    {
      v7 = +[AXPhoenixDataCollectionManager sharedInstance](AXPhoenixDataCollectionManager, "sharedInstance");
      -[AXPhoenixDataCollectionManager updateUploadStatus:error:](v7, "updateUploadStatus:error:", -1, CFSTR("Unable to reach server."));

    }
    else
    {
      v6 = +[AXPhoenixDataCollectionManager sharedInstance](AXPhoenixDataCollectionManager, "sharedInstance");
      v5 = (id)objc_msgSend(location, "localizedDescription");
      -[AXPhoenixDataCollectionManager updateUploadStatus:error:](v6, "updateUploadStatus:error:", -1);

    }
  }
  v3 = (int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v3 == objc_msgSend(*(id *)(a1 + 40), "count") && *(_QWORD *)(a1 + 48))
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v18, (uint64_t)"-[AXPhoenixBlobbyUploader uploadPackages:toBucket:withCompletion:]_block_invoke", *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s %d packages attempted to upload.", v18, 0x12u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  objc_storeStrong(&location, 0);
}

- (AXPhoenixBlobbyUploader)init
{
  dispatch_queue_t v2;
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  AXPhoenixBlobbyUploader *v11;
  os_log_t oslog;
  id v13;
  objc_super v14;
  SEL v15;
  id v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = a2;
  v16 = 0;
  v14.receiver = self;
  v14.super_class = (Class)AXPhoenixBlobbyUploader;
  v16 = -[AXPhoenixBlobbyUploader init](&v14, sel_init);
  objc_storeStrong(&v16, v16);
  if (v16)
  {
    v2 = dispatch_queue_create("com.apple.accessibility.phoenix.blobbyUploader", 0);
    v3 = (void *)*((_QWORD *)v16 + 1);
    *((_QWORD *)v16 + 1) = v2;

    v4 = dispatch_semaphore_create(kMaxConcurrentUploads);
    v5 = (void *)*((_QWORD *)v16 + 2);
    *((_QWORD *)v16 + 2) = v4;

    v13 = (id)objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    objc_msgSend(v13, "setWaitsForConnectivity:", 1);
    objc_msgSend(v13, "setAllowsCellularAccess:", 1);
    objc_msgSend(v13, "setNetworkServiceType:", 6);
    objc_msgSend(v13, "setTimeoutIntervalForRequest:", (double)kResponseTimeout);
    v6 = (id)objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v13);
    v7 = (void *)*((_QWORD *)v16 + 3);
    *((_QWORD *)v16 + 3) = v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", CFSTR("/AppleInternal/Library/Accessibility/BucketInfo.plist"));
    v9 = (void *)*((_QWORD *)v16 + 4);
    *((_QWORD *)v16 + 4) = v8;

    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v17, (uint64_t)"-[AXPhoenixBlobbyUploader init]", *((_QWORD *)v16 + 4));
      _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Loaded bucket info %@", v17, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_storeStrong(&v13, 0);
  }
  v11 = (AXPhoenixBlobbyUploader *)v16;
  objc_storeStrong(&v16, 0);
  return v11;
}

+ (id)sharedUploader
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedUploader_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_0);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedUploader_blobbyUploader;
}

void __41__AXPhoenixBlobbyUploader_sharedUploader__block_invoke()
{
  AXPhoenixBlobbyUploader *v0;
  void *v1;

  v0 = objc_alloc_init(AXPhoenixBlobbyUploader);
  v1 = (void *)sharedUploader_blobbyUploader;
  sharedUploader_blobbyUploader = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketInfo, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
