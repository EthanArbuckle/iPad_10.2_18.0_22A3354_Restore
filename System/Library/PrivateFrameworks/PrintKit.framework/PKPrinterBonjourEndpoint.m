@implementation PKPrinterBonjourEndpoint

+ (id)endpointWithURL:(id)a3
{
  id v3;
  PKPrinterBonjourEndpoint *v4;

  v3 = a3;
  v4 = -[PKPrinterBonjourEndpoint initWithURL:txtRecord:provenance:provenanceIdentifier:]([PKPrinterBonjourEndpoint alloc], "initWithURL:txtRecord:provenance:provenanceIdentifier:", v3, 0, 0, 0);

  return v4;
}

+ (id)endpointWithBonjourString:(id)a3
{
  id v3;
  PKPrinterBonjourEndpoint *v4;

  v3 = a3;
  v4 = -[PKPrinterBonjourEndpoint initWithBonjourString:provenance:provenanceIdentifier:]([PKPrinterBonjourEndpoint alloc], "initWithBonjourString:provenance:provenanceIdentifier:", v3, 0, 0);

  return v4;
}

- (PKPrinterBonjourEndpoint)initWithEndpoint:(id)a3 provenance:(int)a4 provenanceIdentifier:(id)a5
{
  NSObject *v8;
  id v9;
  PKPrinterBonjourEndpoint *v10;
  PKPrinterBonjourEndpoint *v11;
  uint64_t v12;
  NWEndpoint *nwEndpoint;
  const char *url;
  uint64_t v15;
  NSURL *resolvedURL;
  nw_txt_record_t v17;
  uint64_t v18;
  NSDictionary *resolvedTXT;
  objc_super v21;

  v8 = a3;
  v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKPrinterBonjourEndpoint;
  v10 = -[PKPrinterBonjourEndpoint init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_provenance = a4;
    objc_storeStrong((id *)&v10->_provenanceIdentifier, a5);
    objc_msgSend(MEMORY[0x24BDE07C8], "endpointWithCEndpoint:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    nwEndpoint = v11->_nwEndpoint;
    v11->_nwEndpoint = (NWEndpoint *)v12;

    if (nw_endpoint_get_type(v8) == nw_endpoint_type_url)
    {
      url = nw_endpoint_get_url(v8);
      if (url)
      {
        PKURLWithUTF8String((uint64_t)url);
        v15 = objc_claimAutoreleasedReturnValue();
        resolvedURL = v11->_resolvedURL;
        v11->_resolvedURL = (NSURL *)v15;

      }
    }
    v17 = nw_endpoint_copy_txt_record(v8);
    if (v17)
    {
      +[PKTXTRecord txtRecordDictionaryForTxtRecord:](PKTXTRecord, "txtRecordDictionaryForTxtRecord:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      resolvedTXT = v11->_resolvedTXT;
      v11->_resolvedTXT = (NSDictionary *)v18;

    }
  }

  return v11;
}

- (PKPrinterBonjourEndpoint)initWithURL:(id)a3 txtRecord:(id)a4 provenance:(int)a5 provenanceIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPrinterBonjourEndpoint *v13;
  PKPrinterBonjourEndpoint *v14;
  id v15;
  NSObject *url;
  uint64_t v17;
  NWEndpoint *nwEndpoint;
  const char *v19;
  uint64_t v20;
  NSURL *resolvedURL;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PKPrinterBonjourEndpoint;
  v13 = -[PKPrinterBonjourEndpoint init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_provenance = a5;
    objc_storeStrong((id *)&v13->_provenanceIdentifier, a6);
    objc_msgSend(v10, "absoluteString");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    url = nw_endpoint_create_url((const char *)objc_msgSend(v15, "UTF8String"));

    objc_msgSend(MEMORY[0x24BDE07C8], "endpointWithCEndpoint:", url);
    v17 = objc_claimAutoreleasedReturnValue();
    nwEndpoint = v14->_nwEndpoint;
    v14->_nwEndpoint = (NWEndpoint *)v17;

    v19 = nw_endpoint_get_url(url);
    PKURLWithUTF8String((uint64_t)v19);
    v20 = objc_claimAutoreleasedReturnValue();
    resolvedURL = v14->_resolvedURL;
    v14->_resolvedURL = (NSURL *)v20;

    objc_storeStrong((id *)&v14->_resolvedTXT, a4);
  }

  return v14;
}

- (PKPrinterBonjourEndpoint)initWithBonjourString:(id)a3 provenance:(int)a4 provenanceIdentifier:(id)a5
{
  id v8;
  id v9;
  PKPrinterBonjourEndpoint *v10;
  PKPrinterBonjourEndpoint *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint8_t *v21;
  char *i;
  int v23;
  int v24;
  char v25;
  id v26;
  const char *v27;
  id v28;
  nw_endpoint_t bonjour_service;
  uint64_t v30;
  NWEndpoint *nwEndpoint;
  PKPrinterBonjourEndpoint *v32;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v35.receiver = self;
  v35.super_class = (Class)PKPrinterBonjourEndpoint;
  v10 = -[PKPrinterBonjourEndpoint init](&v35, sel_init);
  v11 = v10;
  if (!v10)
  {
LABEL_18:
    v32 = v11;
    goto LABEL_21;
  }
  v10->_provenance = a4;
  objc_storeStrong((id *)&v10->_provenanceIdentifier, a5);
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "count") <= 3)
  {
    _PKLogCategory(PKLogCategoryDiscovery[0]);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v8;
      _os_log_impl(&dword_220F9A000, v13, OS_LOG_TYPE_ERROR, "Invalid Bonjour service: %@{public}", buf, 0xCu);
    }

    goto LABEL_20;
  }
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v34, "length") + objc_msgSend(v17, "length") + 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_retainAutorelease(v34);
  v20 = objc_msgSend(v19, "UTF8String");
  if (strlen((const char *)v20) > 0xFF)
    __assert_rtn("unescape", "PKPrinterBonjourEndpoint.mm", 72, "strlen(src) < dstLen");
  v21 = buf;
  for (i = (char *)v20; ; v20 = (uint64_t)i)
  {
    v24 = *i++;
    v23 = v24;
    if (v24 == 92)
    {
      i = (char *)(v20 + 2);
      v23 = *(unsigned __int8 *)(v20 + 1);
      if (v23 == 48)
        break;
    }
    if (!v23)
      goto LABEL_16;
LABEL_15:
    *v21++ = v23;
  }
  v25 = *i;
  if (*i && *(_BYTE *)(v20 + 3))
  {
    i = (char *)(v20 + 4);
    LOBYTE(v23) = *(_BYTE *)(v20 + 3) + 10 * v25 - 16;
    goto LABEL_15;
  }
LABEL_16:
  *v21 = 0;
  v26 = objc_retainAutorelease(v17);
  v27 = (const char *)objc_msgSend(v26, "UTF8String");
  v28 = objc_retainAutorelease(v18);
  bonjour_service = nw_endpoint_create_bonjour_service((const char *)buf, v27, (const char *)objc_msgSend(v28, "UTF8String"));
  if (bonjour_service)
  {
    objc_msgSend(MEMORY[0x24BDE07C8], "endpointWithCEndpoint:", bonjour_service);
    v30 = objc_claimAutoreleasedReturnValue();
    nwEndpoint = v11->_nwEndpoint;
    v11->_nwEndpoint = (NWEndpoint *)v30;

    goto LABEL_18;
  }

LABEL_20:
  v32 = 0;
LABEL_21:

  return v32;
}

- (PKPrinterBonjourEndpoint)initWithCoder:(id)a3
{
  id v4;
  PKPrinterBonjourEndpoint *v5;
  uint64_t v6;
  NSString *provenanceIdentifier;
  uint64_t v8;
  NWEndpoint *nwEndpoint;
  uint64_t v10;
  NSURL *resolvedURL;
  uint64_t v12;
  uint64_t v13;
  NSDictionary *resolvedTXT;
  NSObject *v15;
  nw_txt_record_t v16;
  uint64_t v17;
  NSDictionary *v18;
  NSObject *v19;
  nw_endpoint_type_t type;
  NSObject *v21;
  const char *url;
  uint64_t v23;
  NSURL *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKPrinterBonjourEndpoint;
  v5 = -[PKPrinterBonjourEndpoint init](&v26, sel_init);
  if (v5)
  {
    v5->_provenance = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("provenance"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provenanceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    provenanceIdentifier = v5->_provenanceIdentifier;
    v5->_provenanceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpoint"));
    v8 = objc_claimAutoreleasedReturnValue();
    nwEndpoint = v5->_nwEndpoint;
    v5->_nwEndpoint = (NWEndpoint *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v10 = objc_claimAutoreleasedReturnValue();
    resolvedURL = v5->_resolvedURL;
    v5->_resolvedURL = (NSURL *)v10;

    v12 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v12, objc_opt_class(), CFSTR("txt"));
    v13 = objc_claimAutoreleasedReturnValue();
    resolvedTXT = v5->_resolvedTXT;
    v5->_resolvedTXT = (NSDictionary *)v13;

    if (!v5->_resolvedTXT)
    {
      v15 = -[NWEndpoint copyCEndpoint](v5->_nwEndpoint, "copyCEndpoint");
      v16 = nw_endpoint_copy_txt_record(v15);

      if (v16)
      {
        +[PKTXTRecord txtRecordDictionaryForTxtRecord:](PKTXTRecord, "txtRecordDictionaryForTxtRecord:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v5->_resolvedTXT;
        v5->_resolvedTXT = (NSDictionary *)v17;

      }
    }
    if (!v5->_resolvedURL)
    {
      v19 = -[NWEndpoint copyCEndpoint](v5->_nwEndpoint, "copyCEndpoint");
      type = nw_endpoint_get_type(v19);

      if (type == nw_endpoint_type_url)
      {
        v21 = -[NWEndpoint copyCEndpoint](v5->_nwEndpoint, "copyCEndpoint");
        url = nw_endpoint_get_url(v21);

        if (url)
        {
          PKURLWithUTF8String((uint64_t)url);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v5->_resolvedURL;
          v5->_resolvedURL = (NSURL *)v23;

        }
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *provenanceIdentifier;
  NSURL *resolvedURL;
  NSDictionary *resolvedTXT;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", self->_provenance, CFSTR("provenance"));
  provenanceIdentifier = self->_provenanceIdentifier;
  if (provenanceIdentifier)
    objc_msgSend(v7, "encodeObject:forKey:", provenanceIdentifier, CFSTR("provenanceIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_nwEndpoint, CFSTR("endpoint"));
  resolvedURL = self->_resolvedURL;
  if (resolvedURL)
    objc_msgSend(v7, "encodeObject:forKey:", resolvedURL, CFSTR("url"));
  resolvedTXT = self->_resolvedTXT;
  if (resolvedTXT)
    objc_msgSend(v7, "encodeObject:forKey:", resolvedTXT, CFSTR("txt"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  NSURL *v6;
  id v7;
  void *v8;
  BOOL v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    v6 = self->_resolvedURL;
    v7 = v5[3];
    v8 = v7;
    if ((v6 != 0) != (v7 != 0))
    {
      v9 = 0;
    }
    else
    {
      if (v6 && v7)
        v10 = -[NSURL isEqual:](v6, "isEqual:", v7);
      else
        v10 = -[NWEndpoint isEqual:](self->_nwEndpoint, "isEqual:", v5[2]);
      v9 = v10;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *resolvedURL;

  resolvedURL = self->_resolvedURL;
  if (!resolvedURL)
    resolvedURL = self->_nwEndpoint;
  return objc_msgSend(resolvedURL, "hash");
}

- (id)dataRepresentation
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (v3)
  {
    _PKLogCategory(PKLogCategoryNetwork[0]);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v8 = v3;
      _os_log_impl(&dword_220F9A000, v4, OS_LOG_TYPE_ERROR, "endpoint serialization error %{public}@", buf, 0xCu);
    }

    v2 = 0;
  }

  return v2;
}

+ (id)endpointWithData:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", a1, a3, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    _PKLogCategory(PKLogCategoryNetwork[0]);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v4;
      _os_log_impl(&dword_220F9A000, v5, OS_LOG_TYPE_ERROR, "endpoint deserialization error %{public}@", buf, 0xCu);
    }

    v3 = 0;
  }

  return v3;
}

- (NSString)persistentNameRepresentationForPrintKitUI
{
  NSObject *v3;
  nw_endpoint_type_t type;
  const char *bonjour_service_name;
  uint64_t bonjour_fullname;
  void *v7;
  NSURL *resolvedURL;
  NSDictionary *resolvedTXT;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  NWEndpoint *nwEndpoint;
  const __CFString *v16;

  v3 = -[NWEndpoint copyCEndpoint](self->_nwEndpoint, "copyCEndpoint");
  type = nw_endpoint_get_type(v3);
  if (type == nw_endpoint_type_bonjour_service)
  {
    bonjour_fullname = nw_endpoint_get_bonjour_fullname();
    if (bonjour_fullname)
      goto LABEL_7;
    bonjour_service_name = nw_endpoint_get_bonjour_service_name(v3);
  }
  else
  {
    if (type != nw_endpoint_type_url)
      goto LABEL_9;
    bonjour_service_name = nw_endpoint_get_url(v3);
  }
  bonjour_fullname = (uint64_t)bonjour_service_name;
  if (bonjour_service_name)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", bonjour_fullname);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      return (NSString *)v7;
    goto LABEL_10;
  }
LABEL_9:

LABEL_10:
  resolvedURL = self->_resolvedURL;
  if (!resolvedURL
    || (-[NSURL absoluteString](resolvedURL, "absoluteString"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    resolvedTXT = self->_resolvedTXT;
    if (!resolvedTXT)
      goto LABEL_18;
    -[NSDictionary objectForKeyedSubscript:](resolvedTXT, "objectForKeyedSubscript:", CFSTR("display-name"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_18;
    v11 = (void *)v10;
    v12 = (void *)MEMORY[0x24BDD17C8];
    v13 = -[PKPrinterBonjourEndpoint isIPPS](self, "isIPPS") ? CFSTR("ipps") : CFSTR("ipp");
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@.%@._tcp.local."), v11, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_18:
      v14 = (void *)MEMORY[0x24BDD17C8];
      nwEndpoint = self->_nwEndpoint;
      if (-[PKPrinterBonjourEndpoint isIPPS](self, "isIPPS"))
        v16 = CFSTR("ipps");
      else
        v16 = CFSTR("ipp");
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Printer_%@._%@._tcp.local."), nwEndpoint, v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (NSString *)v7;
}

- (NSString)displayNameForPrintKitUI
{
  NSDictionary *resolvedTXT;
  __CFString *v4;
  NSObject *v5;
  nw_endpoint_type_t type;
  uint64_t bonjour_fullname;
  const char *bonjour_service_name;

  resolvedTXT = self->_resolvedTXT;
  if (resolvedTXT)
  {
    -[NSDictionary objectForKeyedSubscript:](resolvedTXT, "objectForKeyedSubscript:", CFSTR("display-name"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v4)
      return (NSString *)v4;
  }
  v5 = -[NWEndpoint copyCEndpoint](self->_nwEndpoint, "copyCEndpoint");
  type = nw_endpoint_get_type(v5);
  if (type == nw_endpoint_type_bonjour_service)
  {
    bonjour_service_name = nw_endpoint_get_bonjour_service_name(v5);
    if (bonjour_service_name)
      goto LABEL_9;
    bonjour_fullname = nw_endpoint_get_bonjour_fullname();
  }
  else
  {
    if (type != nw_endpoint_type_url)
    {
LABEL_11:

LABEL_12:
      v4 = &stru_24E6CFEB0;
      return (NSString *)v4;
    }
    bonjour_fullname = (uint64_t)nw_endpoint_get_url(v5);
  }
  bonjour_service_name = (const char *)bonjour_fullname;
  if (!bonjour_fullname)
    goto LABEL_11;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", bonjour_service_name);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_12;
  return (NSString *)v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PKPrinterBonjourEndpoint;
  -[PKPrinterBonjourEndpoint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPrinterBonjourEndpoint persistentNameRepresentationForPrintKitUI](self, "persistentNameRepresentationForPrintKitUI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { \"%@\" }"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  const char *url;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  nw_txt_record_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v3 = (void *)-[NWEndpoint copyCEndpoint](self->_nwEndpoint, "copyCEndpoint");
  v4 = v3;
  v5 = CFSTR("NO");
  if (self->_resolvedURL)
  {
    v6 = CFSTR("YES(R)");
  }
  else
  {
    v7 = v3;
    if (nw_endpoint_get_type(v7) == nw_endpoint_type_url)
    {
      url = nw_endpoint_get_url(v7);

      v6 = CFSTR("YES(E)");
      if (!url)
        v6 = CFSTR("NO");
    }
    else
    {

      v6 = CFSTR("NO");
    }
  }
  v9 = v6;
  if (self->_resolvedTXT)
  {
    v10 = CFSTR("YES(R)");
  }
  else
  {
    v11 = v4;
    if (nw_endpoint_get_type(v11) == nw_endpoint_type_bonjour_service)
    {
      v12 = nw_endpoint_copy_txt_record(v11);

      v10 = CFSTR("YES(E)");
      if (!v12)
        v10 = CFSTR("NO");
    }
    else
    {

      v10 = CFSTR("NO");
    }
  }
  v13 = v10;
  v14 = (void *)MEMORY[0x24BDD17C8];
  v21.receiver = self;
  v21.super_class = (Class)PKPrinterBonjourEndpoint;
  -[PKPrinterBonjourEndpoint description](&v21, sel_description);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPrinterBonjourEndpoint persistentNameRepresentationForPrintKitUI](self, "persistentNameRepresentationForPrintKitUI");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_resolvedCallouts, "count"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  if (-[PKPrinterBonjourEndpoint isIPPS](self, "isIPPS"))
    v5 = CFSTR("YES");
  toString(-[PKPrinterBonjourEndpoint provenance](self, "provenance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ { \"%@\"(hasURL? %@, hasTXT? %@, resolving? %@, secure? %@, from? %@) }"), v15, v16, v9, v13, v17, v5, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

+ (id)serviceFromEndpoint:(id)a3
{
  NSObject *v3;
  const char *bonjour_service_type;
  NSObject *v5;
  NSObject *v6;
  void *v7;

  v3 = a3;
  if (nw_endpoint_get_type(v3) == nw_endpoint_type_bonjour_service)
  {
    bonjour_service_type = nw_endpoint_get_bonjour_service_type(v3);
    if (bonjour_service_type)
      goto LABEL_6;
  }
  v5 = nw_endpoint_copy_parent_endpoint();
  v6 = v5;
  if (!v5 || nw_endpoint_get_type(v5) != nw_endpoint_type_bonjour_service)
  {

    goto LABEL_8;
  }
  bonjour_service_type = nw_endpoint_get_bonjour_service_type(v6);

  if (!bonjour_service_type)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", bonjour_service_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v7;
}

- (BOOL)isIPPS
{
  NSURL *resolvedURL;
  NSObject *v4;
  char v5;
  const char *url;
  void *v7;
  void *v8;

  resolvedURL = self->_resolvedURL;
  if (resolvedURL)
  {
    -[NSURL scheme](resolvedURL, "scheme");
    v4 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqualToString:](v4, "isEqualToString:", CFSTR("ipps")) & 1) == 0)
    {
      v5 = -[NSObject isEqualToString:](v4, "isEqualToString:", CFSTR("https"));
      goto LABEL_14;
    }
LABEL_3:
    v5 = 1;
    goto LABEL_14;
  }
  v4 = -[NWEndpoint copyCEndpoint](self->_nwEndpoint, "copyCEndpoint");
  if (nw_endpoint_get_type(v4) == nw_endpoint_type_url)
  {
    url = nw_endpoint_get_url(v4);
    if (strncmp(url, "ipps:", 5uLL))
    {
      v5 = strncmp(url, "https:", 6uLL) == 0;
      goto LABEL_14;
    }
    goto LABEL_3;
  }
  +[PKPrinterBonjourEndpoint serviceFromEndpoint:](PKPrinterBonjourEndpoint, "serviceFromEndpoint:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "hasPrefix:", CFSTR("_ipps.")) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v8, "hasPrefix:", CFSTR("_https."));
  }
  else
  {
    v5 = 0;
  }

LABEL_14:
  return v5;
}

- (void)withResolvedTXT:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[5];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_resolvedTXT)
  {
    v4[2](v4);
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __44__PKPrinterBonjourEndpoint_withResolvedTXT___block_invoke;
    v6[3] = &unk_24E6CCDF0;
    v6[4] = self;
    v7 = v4;
    -[PKPrinterBonjourEndpoint _resolveEndpoint:](self, "_resolveEndpoint:", v6);

  }
}

uint64_t __44__PKPrinterBonjourEndpoint_withResolvedTXT___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)withResolvedURL:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[5];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_resolvedURL)
  {
    v4[2](v4);
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __44__PKPrinterBonjourEndpoint_withResolvedURL___block_invoke;
    v6[3] = &unk_24E6CCDF0;
    v6[4] = self;
    v7 = v4;
    -[PKPrinterBonjourEndpoint _resolveEndpoint:](self, "_resolveEndpoint:", v6);

  }
}

uint64_t __44__PKPrinterBonjourEndpoint_withResolvedURL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)_resolveEndpoint:(id)a3
{
  id v4;
  NSArray *resolvedCallouts;
  void *v6;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  NSArray *v10;
  void *v11;
  NWEndpoint *nwEndpoint;
  PKPrinterBonjourEndpoint *obj;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  resolvedCallouts = obj->_resolvedCallouts;
  v6 = (void *)MEMORY[0x227667BF0](v4);

  if (resolvedCallouts)
  {
    -[NSArray arrayByAddingObject:](resolvedCallouts, "arrayByAddingObject:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = obj->_resolvedCallouts;
    obj->_resolvedCallouts = (NSArray *)v7;

    objc_sync_exit(obj);
  }
  else
  {
    v16[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = obj->_resolvedCallouts;
    obj->_resolvedCallouts = (NSArray *)v9;

    objc_sync_exit(obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __45__PKPrinterBonjourEndpoint__resolveEndpoint___block_invoke;
      v15[3] = &unk_24E6CCE18;
      v15[4] = obj;
      -[PKPrinterBonjourEndpoint resolveWithinPrinterToolWithTimeout:completionHandler:](obj, "resolveWithinPrinterToolWithTimeout:completionHandler:", v15, 30.0);
    }
    else
    {
      +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      nwEndpoint = obj->_nwEndpoint;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __45__PKPrinterBonjourEndpoint__resolveEndpoint___block_invoke_2;
      v14[3] = &unk_24E6CCE40;
      v14[4] = obj;
      objc_msgSend(v11, "endpointResolve:timeout:completionHandler:", nwEndpoint, v14, 30.0);

    }
  }
}

void __45__PKPrinterBonjourEndpoint__resolveEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(v3, "resolvedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedTXT");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_resolve_finish_resolvedURL:resolvedTXT:", v5, v6);

}

uint64_t __45__PKPrinterBonjourEndpoint__resolveEndpoint___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolve_finish_resolvedURL:resolvedTXT:", a2, a3);
}

- (void)_resolve_finish_resolvedURL:(id)a3 resolvedTXT:(id)a4
{
  id v7;
  id v8;
  PKPrinterBonjourEndpoint *v9;
  NSObject *v10;
  NWEndpoint *nwEndpoint;
  NSArray *resolvedCallouts;
  NSArray *v13;
  int v14;
  NWEndpoint *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  objc_storeStrong((id *)&v9->_resolvedURL, a3);
  objc_storeStrong((id *)&v9->_resolvedTXT, a4);
  if (!v9->_resolvedURL || !v9->_resolvedTXT)
  {
    _PKLogCategory(PKLogCategoryDiscovery[0]);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      nwEndpoint = v9->_nwEndpoint;
      v14 = 138477827;
      v15 = nwEndpoint;
      _os_log_impl(&dword_220F9A000, v10, OS_LOG_TYPE_ERROR, "Endpoint %{private}@ not completely resolved", (uint8_t *)&v14, 0xCu);
    }

  }
  resolvedCallouts = v9->_resolvedCallouts;
  v9->_resolvedCallouts = 0;
  v13 = resolvedCallouts;

  objc_sync_exit(v9);
  -[NSArray enumerateObjectsUsingBlock:](v13, "enumerateObjectsUsingBlock:", &__block_literal_global_4);

}

void __68__PKPrinterBonjourEndpoint__resolve_finish_resolvedURL_resolvedTXT___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, a2);

}

- (id)userCodableDictionary
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;

  v3 = (void *)objc_opt_new();
  -[PKPrinterBonjourEndpoint persistentNameRepresentationForPrintKitUI](self, "persistentNameRepresentationForPrintKitUI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  -[PKPrinterBonjourEndpoint displayNameForPrintKitUI](self, "displayNameForPrintKitUI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("display-name"));

  if (-[PKPrinterBonjourEndpoint isIPPS](self, "isIPPS"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("secure"));
  toString(-[PKPrinterBonjourEndpoint provenance](self, "provenance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("source"));

  -[PKPrinterBonjourEndpoint provenanceIdentifier](self, "provenanceIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("source-ident"));

  return v3;
}

- (int)provenance
{
  return self->_provenance;
}

- (NSString)provenanceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NWEndpoint)nwEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNwEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSURL)resolvedURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResolvedURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)resolvedTXT
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResolvedTXT:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provenanceIdentifier, 0);
  objc_storeStrong((id *)&self->_resolvedTXT, 0);
  objc_storeStrong((id *)&self->_resolvedURL, 0);
  objc_storeStrong((id *)&self->_nwEndpoint, 0);
  objc_storeStrong((id *)&self->_resolvedCallouts, 0);
}

@end
