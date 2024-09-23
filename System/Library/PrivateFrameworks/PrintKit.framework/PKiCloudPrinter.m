@implementation PKiCloudPrinter

+ (id)PKiCloudPrinterWithInfo:(id)a3
{
  id v3;
  PKiCloudPrinter *v4;

  v3 = a3;
  v4 = objc_alloc_init(PKiCloudPrinter);
  -[PKiCloudPrinter setICloudInfo:](v4, "setICloudInfo:", v3);

  return v4;
}

+ (id)PKiCloudPrinterWithPKPrinter:(id)a3 displayName:(id)a4 location:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v7, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("printer-uuid"));

  }
  objc_msgSend(v7, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("printer-dns-sd-name"));
  objc_msgSend(v7, "browseInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bonjourName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("com.apple.printer-endpoint-data"));
  if (!v8)
  {
    objc_msgSend(v7, "displayName");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("com.apple.printkit.printer-display-name"));
  if (v9 || (objc_msgSend(v7, "location"), (v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("com.apple.printkit.printer-location"));
  objc_msgSend(v7, "printerURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("com.apple.printer-url"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "type"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("com.apple.printer-type"));

  if (objc_msgSend(v7, "isFromMCProfile"))
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("com.apple.mcprofile-added"));
  objc_msgSend(v7, "printerImageData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v7, "printerImageData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("com.apple.printkit.printer-image-data"));

  }
  +[PKiCloudPrinter PKiCloudPrinterWithInfo:](PKiCloudPrinter, "PKiCloudPrinterWithInfo:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  -[PKiCloudPrinter iCloudInfo](self, "iCloudInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("printer-uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)dnssdName
{
  void *v2;
  void *v3;

  -[PKiCloudPrinter iCloudInfo](self, "iCloudInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("printer-dns-sd-name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[PKiCloudPrinter iCloudInfo](self, "iCloudInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.printkit.printer-display-name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)location
{
  void *v2;
  void *v3;

  -[PKiCloudPrinter iCloudInfo](self, "iCloudInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.printkit.printer-location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)printerURLs
{
  void *v2;
  void *v3;

  -[PKiCloudPrinter iCloudInfo](self, "iCloudInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.printkit.printer-urls"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)endPoints
{
  void *v2;
  void *v3;

  -[PKiCloudPrinter iCloudInfo](self, "iCloudInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.printkit.printer-endpoints"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDate)lastUsedDate
{
  void *v2;
  void *v3;

  -[PKiCloudPrinter iCloudInfo](self, "iCloudInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.printkit.last-used-date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (int64_t)printerType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PKiCloudPrinter iCloudInfo](self, "iCloudInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.printer-type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)isFromMCProfile
{
  void *v2;
  void *v3;
  char v4;

  -[PKiCloudPrinter iCloudInfo](self, "iCloudInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.mcprofile-added"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSData)printerImageData
{
  void *v2;
  void *v3;

  -[PKiCloudPrinter iCloudInfo](self, "iCloudInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.printkit.printer-image-data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)userCodableDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  int64_t v16;
  __CFString *v17;
  _BOOL4 v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[9];
  _QWORD v51[9];
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PKiCloudPrinter uuid](self, "uuid");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("UUID-MISSING");
  if (v4)
    v6 = (const __CFString *)v4;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PKiCloudPrinter{%@}"), v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v52 = v7;
  v50[0] = CFSTR("displayName");
  v38 = (void *)v7;
  -[PKiCloudPrinter displayName](self, "displayName");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("none");
  v39 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("none");
  v51[0] = v10;
  v50[1] = CFSTR("dnssdName");
  -[PKiCloudPrinter dnssdName](self, "dnssdName");
  v11 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v11;
  if (v11)
    v12 = (const __CFString *)v11;
  else
    v12 = CFSTR("none");
  v51[1] = v12;
  v50[2] = CFSTR("lastUsedDate");
  -[PKiCloudPrinter lastUsedDate](self, "lastUsedDate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    -[PKiCloudPrinter lastUsedDate](self, "lastUsedDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "description");
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("none");
  }
  v37 = (__CFString *)v13;
  v51[2] = v13;
  v50[3] = CFSTR("location");
  -[PKiCloudPrinter location](self, "location");
  v14 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v14;
  if (v14)
    v15 = (const __CFString *)v14;
  else
    v15 = CFSTR("none");
  v51[3] = v15;
  v50[4] = CFSTR("printerType");
  v16 = -[PKiCloudPrinter printerType](self, "printerType");
  if ((unint64_t)(v16 + 1) >= 5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown(%ld)"), v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_24E6CD618[v16 + 1];
  }
  v42 = v17;
  v51[4] = v17;
  v50[5] = CFSTR("isFromMDM");
  v18 = -[PKiCloudPrinter isFromMCProfile](self, "isFromMCProfile");
  v19 = CFSTR("NO");
  if (v18)
    v19 = CFSTR("YES");
  v51[5] = v19;
  v50[6] = CFSTR("imageData");
  -[PKiCloudPrinter printerImageData](self, "printerImageData");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    -[PKiCloudPrinter printerImageData](self, "printerImageData");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%d bytes"), objc_msgSend(v36, "length"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v51[6] = v9;
  v50[7] = CFSTR("printerURLs");
  -[PKiCloudPrinter printerURLs](self, "printerURLs");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v43;
  v50[8] = CFSTR("endPoints");
  -[PKiCloudPrinter endPoints](self, "endPoints");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v22 = v34;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v47 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        +[PKPrinterBonjourEndpoint endpointWithData:](PKPrinterBonjourEndpoint, "endpointWithData:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          objc_msgSend(v27, "userCodableDictionary");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v29);
        }
        else
        {
          v54 = CFSTR("ERROR: ");
          objc_msgSend(v26, "description");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v29;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v30);

        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v23);
  }

  v51[8] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {

  }
  if (v44)
  {

  }
  return v32;
}

- (NSDictionary)iCloudInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setICloudInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudInfo, 0);
}

@end
