@implementation PKPrinterBrowseInfo

- (PKPrinterBrowseInfo)initWithBonjourName:(id)a3 txtRecord:(id)a4
{
  id v7;
  NSDictionary *v8;
  PKPrinterBrowseInfo *v9;
  PKPrinterBrowseInfo *v10;
  uint64_t v11;
  NSDictionary *txtRecord;
  objc_super v14;

  v7 = a3;
  v8 = (NSDictionary *)a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPrinterBrowseInfo;
  v9 = -[PKPrinterBrowseInfo init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bonjourName, a3);
    dictionaryWithLowercasedKeys(v8);
    v11 = objc_claimAutoreleasedReturnValue();
    txtRecord = v10->_txtRecord;
    v10->_txtRecord = (NSDictionary *)v11;

  }
  return v10;
}

- (PKPrinterBrowseInfo)initWithResolvedBonjourName:(id)a3
{
  id v5;
  PKPrinterBrowseInfo *v6;
  PKPrinterBrowseInfo *v7;
  uint64_t v8;
  NSDictionary *txtRecord;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPrinterBrowseInfo;
  v6 = -[PKPrinterBrowseInfo init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bonjourName, a3);
    objc_msgSend(v5, "resolvedTXT");
    v8 = objc_claimAutoreleasedReturnValue();
    txtRecord = v7->_txtRecord;
    v7->_txtRecord = (NSDictionary *)v8;

  }
  return v7;
}

- (NSURL)printerURL
{
  PKPrinterBonjourEndpoint *v3;
  PKPrinterBrowseInfo *v4;
  void *v5;
  PKPrinterBonjourEndpoint *v6;
  void *v7;
  _QWORD v9[4];
  PKPrinterBonjourEndpoint *v10;

  v3 = self->_bonjourName;
  v4 = self;
  if (object_isClass(v4))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PKPrinterBrowseInfo printerURL]");
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>: %s"), objc_opt_class(), v4, "-[PKPrinterBrowseInfo printerURL]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__PKPrinterBrowseInfo_printerURL__block_invoke;
  v9[3] = &unk_24E6CD018;
  v6 = v3;
  v10 = v6;
  withDebuggableSemaphore<NSURL * {__strong}>(v5, v9, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

uint64_t __33__PKPrinterBrowseInfo_printerURL__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "withResolvedURL:", a2);
}

- (PKPrinterBrowseInfo)initWithCoder:(id)a3
{
  id v4;
  PKPrinterBrowseInfo *v5;
  uint64_t v6;
  PKPrinterBonjourEndpoint *bonjourName;
  uint64_t v8;
  NSDictionary *v9;
  uint64_t v10;
  NSDictionary *txtRecord;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPrinterBrowseInfo;
  v5 = -[PKPrinterBrowseInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bonjourName"));
    v6 = objc_claimAutoreleasedReturnValue();
    bonjourName = v5->_bonjourName;
    v5->_bonjourName = (PKPrinterBonjourEndpoint *)v6;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("txt")))
    {
      v8 = objc_opt_class();
      objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("txt"));
      v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      dictionaryWithLowercasedKeys(v9);
      v10 = objc_claimAutoreleasedReturnValue();
      txtRecord = v5->_txtRecord;
      v5->_txtRecord = (NSDictionary *)v10;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *txtRecord;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_bonjourName, CFSTR("bonjourName"));
  txtRecord = self->_txtRecord;
  if (txtRecord)
    objc_msgSend(v5, "encodeObject:forKey:", txtRecord, CFSTR("txt"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PKPrinterBrowseInfo isEqualToBrowseInfo:](self, "isEqualToBrowseInfo:", v4);

  return v5;
}

- (BOOL)isEphemeral
{
  void *v2;
  int v3;

  -[PKPrinterBrowseInfo bonjourName](self, "bonjourName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "provenance");

  return ((v3 - 16) & 0xFFFFFFEF) == 0;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  NSDictionary *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  int v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  BOOL v40;

  v4 = a3;
  v5 = 0;
  while (2)
  {
    switch(v5)
    {
      case 0:
        -[PKPrinterBrowseInfo bonjourName](self, "bonjourName");
        v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary displayNameForPrintKitUI](v6, "displayNameForPrintKitUI");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bonjourName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "displayNameForPrintKitUI");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "compare:", v9);
        goto LABEL_16;
      case 1:
        v11 = -[PKPrinterBrowseInfo isIPPS](self, "isIPPS");
        v12 = objc_msgSend(v4, "isIPPS");
        if ((v11 & (v12 ^ 1)) != 0)
          v13 = -1;
        else
          v13 = 1;
        if (v11 != v12)
          v14 = v13;
        else
          v14 = 0;
        goto LABEL_55;
      case 2:
        -[PKPrinterBrowseInfo bonjourName](self, "bonjourName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "provenance");
        objc_msgSend(v4, "bonjourName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "provenance");
        v19 = v16 - 1;
        if ((v16 - 1) < 8 && ((0x8Bu >> v19) & 1) != 0)
          v20 = qword_220FE0DC0[v19];
        else
          v20 = (10 * v16 + 100);
        v31 = v18 - 1;
        if ((v18 - 1) < 8 && ((0x8Bu >> v31) & 1) != 0)
          v32 = qword_220FE0DC0[v31];
        else
          v32 = (10 * v18 + 100);

        if (v20 == v32)
        {
          -[PKPrinterBrowseInfo bonjourName](self, "bonjourName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "provenanceIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "bonjourName");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "provenanceIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v34;
          v38 = v36;
          v39 = v38;
          if (v37 && v38)
          {
            v14 = objc_msgSend(v37, "compare:", v38);
          }
          else if (!v37 || v38)
          {
            if (v37)
              v40 = 1;
            else
              v40 = v38 == 0;
            v14 = !v40;
          }
          else
          {
            v14 = -1;
          }

LABEL_55:
          ++v5;
          if (v14)
            goto LABEL_56;
          continue;
        }
        if (v20 < v32)
          v14 = -1;
        else
          v14 = 1;
LABEL_56:

        return v14;
      case 3:
        v21 = -[PKPrinterBrowseInfo type](self, "type");
        v22 = objc_msgSend(v4, "type");
        if (v21 > 3)
          v23 = 100;
        else
          v23 = qword_220FE0E00[v21];
        if (v22 > 3)
          v28 = 100;
        else
          v28 = qword_220FE0E00[v22];
        v29 = v23 == v28;
        if (v23 < v28)
          v30 = -1;
        else
          v30 = 1;
        if (v29)
          v14 = 0;
        else
          v14 = v30;
        goto LABEL_55;
      case 4:
        -[PKPrinterBrowseInfo bonjourName](self, "bonjourName");
        v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary persistentNameRepresentationForPrintKitUI](v6, "persistentNameRepresentationForPrintKitUI");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bonjourName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "persistentNameRepresentationForPrintKitUI");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "compare:options:", v9, 1);
LABEL_16:
        v14 = v10;

        goto LABEL_25;
      case 5:
        v24 = (void *)v4[3];
        v6 = self->_txtRecord;
        v7 = v24;
        if (-[NSDictionary isEqualToDictionary:](v6, "isEqualToDictionary:", v7))
        {
          v14 = 0;
        }
        else
        {
          v25 = -[NSDictionary hash](v6, "hash");
          v26 = objc_msgSend(v7, "hash");
          if (v25 < v26)
            v27 = -1;
          else
            v27 = 1;
          if (v25 == v26)
            v14 = 0;
          else
            v14 = v27;
        }
LABEL_25:

        goto LABEL_55;
      default:
        v14 = 0;
        goto LABEL_56;
    }
  }
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v3 = 0;
  v4 = 65537;
  while (1)
  {
    v5 = v4 << v3;
    switch(v3)
    {
      case 0:
        -[PKPrinterBrowseInfo bonjourName](self, "bonjourName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "displayNameForPrintKitUI");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "hash");
        goto LABEL_8;
      case 1:
        v4 = v5 + -[PKPrinterBrowseInfo isIPPS](self, "isIPPS");
        break;
      case 2:
        -[PKPrinterBrowseInfo bonjourName](self, "bonjourName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "provenance");
        v11 = v10 - 1;
        if ((v10 - 1) < 8 && ((0x8Bu >> v11) & 1) != 0)
          v12 = qword_220FE0DC0[v11];
        else
          v12 = (10 * v10 + 100);

        -[PKPrinterBrowseInfo bonjourName](self, "bonjourName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "provenanceIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v12 + v5 + objc_msgSend(v7, "hash");
        goto LABEL_17;
      case 3:
        v13 = -[PKPrinterBrowseInfo type](self, "type");
        if (v13 > 3)
          v14 = 100;
        else
          v14 = qword_220FE0E00[v13];
        v4 = v14 + v5;
        break;
      case 4:
        -[PKPrinterBrowseInfo bonjourName](self, "bonjourName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "persistentNameRepresentationForPrintKitUI");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "hash");
LABEL_8:
        v4 = v8 + v5;
LABEL_17:

        break;
      case 5:
        v4 = -[NSDictionary hash](self->_txtRecord, "hash") + v5;
        break;
      default:
        return v5;
    }
    ++v3;
  }
}

- (BOOL)isEqualToBrowseInfo:(id)a3
{
  return -[PKPrinterBrowseInfo compare:](self, "compare:", a3) == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)txtRecordObjectForKey:(id)a3
{
  NSDictionary *txtRecord;
  void *v4;
  void *v5;

  txtRecord = self->_txtRecord;
  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](txtRecord, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)type
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  if (self->_txtRecord)
  {
    -[PKPrinterBrowseInfo txtRecordObjectForKey:](self, "txtRecordObjectForKey:", CFSTR("Color"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPrinterBrowseInfo txtRecordObjectForKey:](self, "txtRecordObjectForKey:", CFSTR("Duplex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPrinterBrowseInfo txtRecordObjectForKey:](self, "txtRecordObjectForKey:", CFSTR("product"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_msgSend(v3, "isEqual:", CFSTR("T")) & 1) != 0)
    {
      v6 = 1;
      if (!v4)
        goto LABEL_13;
    }
    else if (v5)
    {
      v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("Color")) != 0x7FFFFFFFFFFFFFFFLL;
      if (!v4)
        goto LABEL_13;
    }
    else
    {
      v6 = 0;
      if (!v4)
      {
LABEL_13:

        return v6;
      }
    }
    if (objc_msgSend(v4, "isEqual:", CFSTR("T")))
      v6 |= 2uLL;
    goto LABEL_13;
  }
  return -1;
}

- (NSUUID)uuid
{
  NSUUID *cachedUUID;
  void *v4;
  NSUUID *v5;
  void *v6;
  NSUUID *v7;

  cachedUUID = self->_cachedUUID;
  if (!cachedUUID)
  {
    -[PKPrinterBrowseInfo txtRecordObjectForKey:](self, "txtRecordObjectForKey:", CFSTR("UUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4 || (v5 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4)) == 0)
    {
      -[PKPrinterBrowseInfo btleUUID](self, "btleUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6
        || (-[PKPrinterBrowseInfo btleUUID](self, "btleUUID"),
            (v5 = (NSUUID *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      }
    }
    v7 = self->_cachedUUID;
    self->_cachedUUID = v5;

    cachedUUID = self->_cachedUUID;
  }
  return cachedUUID;
}

- (BOOL)isIPPS
{
  void *v2;
  char v3;

  -[PKPrinterBrowseInfo bonjourName](self, "bonjourName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isIPPS");

  return v3;
}

- (NSString)makeAndModel
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[NSDictionary objectForKey:](self->_txtRecord, "objectForKey:", CFSTR("product"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && objc_msgSend(v2, "hasPrefix:", CFSTR("("))
    && objc_msgSend(v3, "hasSuffix:", CFSTR(")")))
  {
    objc_msgSend(v3, "substringWithRange:", 1, objc_msgSend(v3, "length") - 2);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return (NSString *)v3;
}

- (NSString)location
{
  return (NSString *)-[NSDictionary objectForKey:](self->_txtRecord, "objectForKey:", CFSTR("note"));
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)PKPrinterBrowseInfo;
  -[PKPrinterBrowseInfo description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPrinterBrowseInfo bonjourName](self, "bonjourName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { %@ }"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)userCodableDictionary
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[PKPrinterBrowseInfo txtRecord](self, "txtRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("txt"));

  return v3;
}

- (PKPrinterBonjourEndpoint)bonjourName
{
  return (PKPrinterBonjourEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)txtRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)btleUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBtleUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)btleMeasuredPower
{
  return self->_btleMeasuredPower;
}

- (void)setBtleMeasuredPower:(int64_t)a3
{
  self->_btleMeasuredPower = a3;
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btleUUID, 0);
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_bonjourName, 0);
  objc_storeStrong((id *)&self->_cachedUUID, 0);
}

+ (int)rollCacheGeneration
{
  void *v2;
  int v3;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = gPrinterCacheGeneration++;
  objc_sync_exit(v2);

  return v3;
}

- (void)resolveOnMainQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PKPrinterBrowseInfo bonjourName](self, "bonjourName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    __assert_rtn("-[PKPrinterBrowseInfo(PrintKit) resolveOnMainQueue:]", "PKPrinterBrowseInfo.mm", 434, "self.bonjourName != nil");

  if (!self->_txtRecord)
    __assert_rtn("-[PKPrinterBrowseInfo(PrintKit) resolveOnMainQueue:]", "PKPrinterBrowseInfo.mm", 435, "_txtRecord != nil");
  findOrMakePrinter(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _PKLogCategory(PKLogCategoryDefault[0]);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPrinterBrowseInfo bonjourName](self, "bonjourName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_220F9A000, v7, OS_LOG_TYPE_DEFAULT, "existing info %@ resolved as %@", buf, 0x16u);

  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__PKPrinterBrowseInfo_PrintKit__resolveOnMainQueue___block_invoke;
  v11[3] = &unk_24E6CCDF0;
  v12 = v6;
  v13 = v4;
  v9 = v6;
  v10 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

uint64_t __52__PKPrinterBrowseInfo_PrintKit__resolveOnMainQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)findPrinterWithBonjourEndpoint:(id)a3 withTimeout:(double)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __94__PKPrinterBrowseInfo_PrintKit__findPrinterWithBonjourEndpoint_withTimeout_completionHandler___block_invoke;
  v12[3] = &unk_24E6CEA90;
  v10 = v8;
  v14 = v10;
  v11 = v7;
  v13 = v11;
  objc_msgSend(v9, "browseInfoForPrinter:timeout:completionHandler:", v11, v12, a4);

}

void __94__PKPrinterBrowseInfo_PrintKit__findPrinterWithBonjourEndpoint_withTimeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  PKPrinterBrowseInfo *v3;
  PKPrinterBrowseInfo *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    findOrMakePrinter(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _PKLogCategory(PKLogCategoryDiscovery[0]);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_220F9A000, v6, OS_LOG_TYPE_DEFAULT, "%@ resolved as %@", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
