@implementation PKDefaults

+ (void)lastUsedPrintersCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__PKDefaults_lastUsedPrintersCompletionHandler___block_invoke;
  v6[3] = &unk_24E6CCE88;
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "getLastUsedPrintersForCurrentNetworkCompletionHandler:", v6);

}

void __48__PKDefaults_lastUsedPrintersCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;
  NSDictionary *v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  BOOL v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v17 = a1;
  v27 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v20 = (void *)objc_opt_new();
  v19 = +[PKDefaults mcProfilePrintersOnlyAllowed](PKDefaults, "mcProfilePrintersOnlyAllowed");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v18;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v3)
    goto LABEL_13;
  v4 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v23 != v4)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.mcprofile-added"), v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      if (!v8)
      {
        if (v19)
          continue;
LABEL_10:
        v11 = v6;
        v12 = (NSMutableDictionary *)-[NSDictionary mutableCopy](v11, "mutableCopy");
        unxferSize(v12, v11, CFSTR("com.apple.last-used-size"));
        unxferSize(v12, v11, CFSTR("com.apple.last-used-photo-size"));
        unxferSize(v12, v11, CFSTR("com.apple.last-used-document-size"));

        objc_msgSend(v20, "addObject:", v12);
        continue;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("printer-dns-sd-name"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[PKDefaults uriMatchesMCProfileAdded:](PKDefaults, "uriMatchesMCProfileAdded:", v9);

      if (v10)
        goto LABEL_10;
    }
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v3);
LABEL_13:

  v13 = *(_QWORD *)(v17 + 32);
  v14 = v20;
  if ((unint64_t)objc_msgSend(v14, "count") > 3)
  {
    objc_msgSend(v14, "subarrayWithRange:", 0, 3);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v14;
  }
  v16 = v15;

  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v16);
}

+ (id)lastUsedPrinters
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = a1;
  if (object_isClass(v2))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PKDefaults lastUsedPrinters]");
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %s"), objc_opt_class(), v2, "+[PKDefaults lastUsedPrinters]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__PKDefaults_lastUsedPrinters__block_invoke;
  v6[3] = &__block_descriptor_40_e24_v16__0___v____NSArray__8l;
  v6[4] = v2;
  withDebuggableSemaphore<NSArray * {__strong}>(v3, v6, 3.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __30__PKDefaults_lastUsedPrinters__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "lastUsedPrintersCompletionHandler:", a2);
}

+ (void)lastUsedPrintersForPhoto:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  __CFString **v7;
  __CFString *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  BOOL v26;
  id v27;
  id v28;
  void *v29;
  void (**v30)(id, void *);
  id obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v4 = a3;
  v48 = *MEMORY[0x24BDAC8D0];
  v30 = (void (**)(id, void *))a4;
  v32 = (void *)objc_opt_new();
  +[PKDefaults lastUsedPrinters](PKDefaults, "lastUsedPrinters");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v42;
    v7 = PKPrinterWasLastUsedPrinterForDocumentKey;
    if (v4)
      v7 = PKPrinterWasLastUsedPrinterForPhotoKey;
    v8 = *v7;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "BOOLValue"))
        {
          objc_msgSend(v32, "addObject:", v10);
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v13 = obj;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          if (v14)
          {
            v15 = *(_QWORD *)v38;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v38 != v15)
                  objc_enumerationMutation(v13);
                if (*(void **)(*((_QWORD *)&v37 + 1) + 8 * j) != v10)
                  objc_msgSend(v32, "addObject:");
              }
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            }
            while (v14);
          }

          goto LABEL_23;
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_23:

  if (!objc_msgSend(v32, "count"))
    objc_msgSend(v32, "addObjectsFromArray:", obj);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v17 = v32;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * k);
        if (v4)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * k), "objectForKeyedSubscript:", CFSTR("com.apple.last-used-photo-size"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22 == 0;

          if (v23)
            continue;
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("com.apple.last-used-photo-size"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("com.apple.last-used-size"));
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * k), "objectForKeyedSubscript:", CFSTR("com.apple.last-used-document-size"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25 == 0;

          if (v26)
            continue;
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("com.apple.last-used-document-size"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("com.apple.last-used-size"));
        }

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v18);
  }

  v27 = v17;
  if ((unint64_t)objc_msgSend(v27, "count") > 3)
  {
    objc_msgSend(v27, "subarrayWithRange:", 0, 3);
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = v27;
  }
  v29 = v28;

  v30[2](v30, v29);
}

+ (id)lastUsedPrintersForPhoto:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  v4 = a1;
  if (object_isClass(v4))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PKDefaults lastUsedPrintersForPhoto:]");
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %s"), objc_opt_class(), v4, "+[PKDefaults lastUsedPrintersForPhoto:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__PKDefaults_lastUsedPrintersForPhoto___block_invoke;
  v8[3] = &__block_descriptor_41_e24_v16__0___v____NSArray__8l;
  v8[4] = v4;
  v9 = a3;
  withDebuggableSemaphore<NSArray * {__strong}>(v5, v8, 3.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __39__PKDefaults_lastUsedPrintersForPhoto___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "lastUsedPrintersForPhoto:completionHandler:", *(unsigned __int8 *)(a1 + 40), a2);
}

+ (void)addLastUsedPrinter:(id)a3 duplexMode:(id)a4 lastUsedSize:(CGSize)a5 forPhoto:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  id v10;
  __CFString *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString **v27;
  __CFString *v28;
  char *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  uint8_t buf[144];
  uint64_t v45;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (__CFString *)a4;
  objc_msgSend(v10, "browseInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEphemeral");

  if (v13)
  {
    _PKLogCategory(PKLogCategoryDiscovery[0]);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220F9A000, v14, OS_LOG_TYPE_INFO, "Not adding ephemeral printer to last used", buf, 2u);
    }
  }
  else
  {
    v14 = objc_opt_new();
    objc_msgSend(v10, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v10, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v16, CFSTR("printer-uuid"));

    }
    objc_msgSend(v10, "name");
    v17 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v17;
    if (v17)
      -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v17, CFSTR("printer-dns-sd-name"));
    objc_msgSend(v10, "browseInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bonjourName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dataRepresentation");
    v20 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)v20;
    if (v20)
      -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v20, CFSTR("com.apple.printer-endpoint-data"));
    objc_msgSend(v10, "displayName");
    v21 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v21;
    if (v21)
      -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v21, CFSTR("com.apple.printkit.printer-display-name"));
    objc_msgSend(v10, "location");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v22, CFSTR("com.apple.printkit.printer-location"));
    objc_msgSend(v10, "printerURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "absoluteString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v25, CFSTR("com.apple.printer-url"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "type"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v26, CFSTR("com.apple.printer-type"));

    if (v11
      && (CFSTR("one-sided") == v11 || CFSTR("two-sided-long-edge") == v11 || CFSTR("two-sided-short-edge") == v11))
    {
      -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v11, CFSTR("sides"));
    }
    if (objc_msgSend(v10, "isFromMCProfile"))
      -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("com.apple.mcprofile-added"));
    if (v6)
    {
      -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("com.apple.was-last-used-printer-for-photo"));
      v27 = PKPrinterLastUsedPhotoSizeKey;
    }
    else
    {
      -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("com.apple.was-last-used-printer-for-document"));
      v27 = PKPrinterLastUsedDocumentSizeKey;
    }
    v28 = *v27;
    if (width > 0.0 && height > 0.0)
    {
      v29 = pwgMediaForSize((const char *)(int)(width * 2540.0 / 72.0 + 0.5), (int)(height * 2540.0 / 72.0 + 0.5), (char *)buf);
      if (v29)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-pwg_reference"), v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v31, v30);

        LODWORD(v31) = *((_DWORD *)v29 + 7);
        v32 = (double)*((int *)v29 + 6) * 72.0 / 2540.0;
        v40[0] = CFSTR("width");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = CFSTR("height");
        v41[0] = v33;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(int)v31 * 72.0 / 2540.0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v34;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v35, v28);

      }
      else
      {
        v42[0] = CFSTR("width");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", width);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v42[1] = CFSTR("height");
        v43[0] = v30;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", height);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v33;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v34, v28);
      }

    }
    +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setLastUsedPrintersForCurrentNetwork:", v14);

  }
}

+ (NSArray)iCloudPrintersSync
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1;
  if (object_isClass(v4))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PKDefaults iCloudPrintersSync]");
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %s"), objc_opt_class(), v4, "+[PKDefaults iCloudPrintersSync]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __32__PKDefaults_iCloudPrintersSync__block_invoke;
  v19[3] = &unk_24E6CCEF0;
  v6 = v3;
  v20 = v6;
  withDebuggableSemaphore<NSArray<NSDictionary *> * {__strong}>(v5, v19, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        +[PKiCloudPrinter PKiCloudPrinterWithInfo:](PKiCloudPrinter, "PKiCloudPrinterWithInfo:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v10);
  }

  return (NSArray *)v8;
}

uint64_t __32__PKDefaults_iCloudPrintersSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "getiCloudPrintersWithCompletionHandler:", a2);
}

+ (void)getUpdatediCloudPrintersFromPrinterTool
{
  id v2;

  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getiCloudPrintersWithCompletionHandler:", &__block_literal_global_5);

}

void __53__PKDefaults_getUpdatediCloudPrintersFromPrinterTool__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12 = a2;
  obj = (id)objc_opt_new();
  v2 = +[PKDefaults mcProfilePrintersOnlyAllowed](PKDefaults, "mcProfilePrintersOnlyAllowed");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v12;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        +[PKiCloudPrinter PKiCloudPrinterWithInfo:](PKiCloudPrinter, "PKiCloudPrinterWithInfo:", v7, v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "isFromMCProfile"))
        {
          if (v2)
            goto LABEL_11;
LABEL_10:
          objc_msgSend(obj, "addObject:", v8);
          goto LABEL_11;
        }
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("printer-dns-sd-name"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = +[PKDefaults uriMatchesMCProfileAdded:](PKDefaults, "uriMatchesMCProfileAdded:", v9);

        if (v10)
          goto LABEL_10;
LABEL_11:

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  objc_storeStrong((id *)&_iCloudPrinters, obj);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("com.apple.printkit.iCloudPrintersChanged.notification"), 0);

}

+ (NSArray)iCloudPrinters
{
  void *v2;

  +[PKDefaults startiCloudListening](PKDefaults, "startiCloudListening");
  v2 = (void *)_iCloudPrinters;
  if (!_iCloudPrinters)
  {
    +[PKDefaults getUpdatediCloudPrintersFromPrinterTool](PKDefaults, "getUpdatediCloudPrintersFromPrinterTool");
    v2 = (void *)_iCloudPrinters;
  }
  return (NSArray *)v2;
}

+ (void)startiCloudListening
{
  if (+[PKDefaults startiCloudListening]::onceToken != -1)
    dispatch_once(&+[PKDefaults startiCloudListening]::onceToken, &__block_literal_global_18_0);
}

void __34__PKDefaults_startiCloudListening__block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v1;
  id v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)pk_iCloudPrintersChanged, CFSTR("com.apple.printerTool.iCloud-printers-changed"), 0, (CFNotificationSuspensionBehavior)0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", CFSTR("PRINTERTOOL_ICLOUDPRINTERS_CHANGED_NOTIFICATION"), 0, 0, &__block_literal_global_24);

}

uint64_t __34__PKDefaults_startiCloudListening__block_invoke_2()
{
  return +[PKDefaults getUpdatediCloudPrintersFromPrinterTool](PKDefaults, "getUpdatediCloudPrintersFromPrinterTool");
}

+ (void)setICloudPrinters:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[PKDefaults startiCloudListening](PKDefaults, "startiCloudListening");
  objc_storeStrong((id *)&_iCloudPrinters, a3);
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setiCloudPrinters:", v5);

}

+ (void)addPrinterToiCloud:(id)a3 displayName:(id)a4
{
  +[PKDefaults addPrinterToiCloud:displayName:location:](PKDefaults, "addPrinterToiCloud:displayName:location:", a3, a4, 0);
}

+ (void)addPrinterToiCloud:(id)a3 displayName:(id)a4 location:(id)a5
{
  void *v5;
  void *v6;
  id v7;

  +[PKiCloudPrinter PKiCloudPrinterWithPKPrinter:displayName:location:](PKiCloudPrinter, "PKiCloudPrinterWithPKPrinter:displayName:location:", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addPrinterToiCloud:", v7);
  v6 = (void *)_iCloudPrinters;
  _iCloudPrinters = 0;

}

+ (void)removePrinterFromiCloud:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  +[PKDefaults startiCloudListening](PKDefaults, "startiCloudListening");
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removePrinterFromiCloud:", v5);
  v4 = (void *)_iCloudPrinters;
  _iCloudPrinters = 0;

}

+ (void)updateiCloudPrinterDisplayName:(id)a3 displayName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  +[PKDefaults startiCloudListening](PKDefaults, "startiCloudListening");
  if (v8)
  {
    +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateiCloudPrinterDisplayName:newDisplayName:", v8, v5);
    v7 = (void *)_iCloudPrinters;
    _iCloudPrinters = 0;

  }
}

+ (void)updateiCloudPrinterLocation:(id)a3 location:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  +[PKDefaults startiCloudListening](PKDefaults, "startiCloudListening");
  if (v8)
  {
    +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateiCloudPrinterLocation:location:", v8, v5);
    v7 = (void *)_iCloudPrinters;
    _iCloudPrinters = 0;

  }
}

+ (void)resetPKCloudData
{
  void *v2;
  void *v3;
  id v4;

  +[PKDefaults startiCloudListening](PKDefaults, "startiCloudListening");
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetPKCloudData");
  v2 = (void *)_iCloudPrinters;
  _iCloudPrinters = 0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.printkit.iCloudPrintersChanged.notification"), 0);

}

+ (void)seenPrintersCompletionHandler:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getLastUsedPrintersForCurrentNetworkCompletionHandler:", v4);

}

+ (BOOL)urfIsOptional
{
  if (+[PKDefaults(PrintKitPrivate) urfIsOptional]::sOncePredicate != -1)
    dispatch_once(&+[PKDefaults(PrintKitPrivate) urfIsOptional]::sOncePredicate, &__block_literal_global_52);
  return +[PKDefaults(PrintKitPrivate) urfIsOptional]::optionalURF;
}

uint64_t __44__PKDefaults_PrintKitPrivate__urfIsOptional__block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("PrintKitOptionalURF"), CFSTR(".GlobalPreferences"), 0);
  +[PKDefaults(PrintKitPrivate) urfIsOptional]::optionalURF = (_DWORD)result != 0;
  return result;
}

+ (id)requiredPDL
{
  if (+[PKDefaults urfIsOptional](PKDefaults, "urfIsOptional"))
    return 0;
  else
    return CFSTR("image/urf");
}

+ (BOOL)ippsIsRequired
{
  if (+[PKDefaults(PrintKitPrivate) ippsIsRequired]::sOncePredicateIPPSRequired != -1)
    dispatch_once(&+[PKDefaults(PrintKitPrivate) ippsIsRequired]::sOncePredicateIPPSRequired, &__block_literal_global_57);
  return +[PKDefaults(PrintKitPrivate) ippsIsRequired]::ippsRequired;
}

void __45__PKDefaults_PrintKitPrivate__ippsIsRequired__block_invoke()
{
  id v0;

  objc_msgSend((id)getMCProfileConnectionClass(), "sharedConnection");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[PKDefaults(PrintKitPrivate) ippsIsRequired]::ippsRequired = objc_msgSend(v0, "isAirPrintTrustedTLSRequirementEnforced");

}

+ (BOOL)mcProfilePrintersOnlyAllowed
{
  if (+[PKDefaults(PrintKitPrivate) mcProfilePrintersOnlyAllowed]::sOncePredicateProfileOnly != -1)
    dispatch_once(&+[PKDefaults(PrintKitPrivate) mcProfilePrintersOnlyAllowed]::sOncePredicateProfileOnly, &__block_literal_global_58);
  return +[PKDefaults(PrintKitPrivate) mcProfilePrintersOnlyAllowed]::onlyProfilePrintersAllowed;
}

void __59__PKDefaults_PrintKitPrivate__mcProfilePrintersOnlyAllowed__block_invoke()
{
  void *v0;
  char v1;

  objc_msgSend((id)getMCProfileConnectionClass(), "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isAirPrintAllowed");

  +[PKDefaults(PrintKitPrivate) mcProfilePrintersOnlyAllowed]::onlyProfilePrintersAllowed = v1 ^ 1;
}

+ (BOOL)airPrintBeaconDiscoveryAllowed
{
  if (+[PKDefaults(PrintKitPrivate) airPrintBeaconDiscoveryAllowed]::sOncePredicateProfileOnly != -1)
    dispatch_once(&+[PKDefaults(PrintKitPrivate) airPrintBeaconDiscoveryAllowed]::sOncePredicateProfileOnly, &__block_literal_global_59);
  return +[PKDefaults(PrintKitPrivate) airPrintBeaconDiscoveryAllowed]::allowed;
}

void __61__PKDefaults_PrintKitPrivate__airPrintBeaconDiscoveryAllowed__block_invoke()
{
  id v0;

  objc_msgSend((id)getMCProfileConnectionClass(), "sharedConnection");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[PKDefaults(PrintKitPrivate) airPrintBeaconDiscoveryAllowed]::allowed = objc_msgSend(v0, "isAirPrintiBeaconDiscoveryAllowed");

}

+ (BOOL)uriMatchesMCProfileAdded:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend((id)getMCProfileConnectionClass(), "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "knownAirPrintIPPURLStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        if (v6 || (v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i), !objc_msgSend(v10, "caseInsensitiveCompare:", v3)))
        {
          v6 = 1;
        }
        else
        {
          objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ipp://"), CFSTR("ipps://"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v11, "caseInsensitiveCompare:", v3) == 0;

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v6;
}

+ (id)absoluteSpoolDirectory
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1;
  if (object_isClass(v4))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PKDefaults(PrintKitPrivate) absoluteSpoolDirectory]");
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %s"), objc_opt_class(), v4, "+[PKDefaults(PrintKitPrivate) absoluteSpoolDirectory]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__PKDefaults_PrintKitPrivate__absoluteSpoolDirectory__block_invoke;
  v9[3] = &unk_24E6CD018;
  v6 = v3;
  v10 = v6;
  withDebuggableSemaphore<NSURL * {__strong}>(v5, v9, 5.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/private/var/tmp/"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __53__PKDefaults_PrintKitPrivate__absoluteSpoolDirectory__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "printerTool_realPathForTmp:", a2);
}

+ (void)setListenerProxy:(id)a3
{
  objc_storeStrong((id *)&gProxyListener, a3);
}

+ (NSXPCListener)listenerProxy
{
  return (NSXPCListener *)(id)gProxyListener;
}

@end
