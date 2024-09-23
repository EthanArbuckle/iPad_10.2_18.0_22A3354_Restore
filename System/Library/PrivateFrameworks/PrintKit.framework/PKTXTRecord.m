@implementation PKTXTRecord

+ (id)txtRecordDictionaryForTxtRecord:(id)a3
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD applier[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __47__PKTXTRecord_txtRecordDictionaryForTxtRecord___block_invoke;
  applier[3] = &unk_24E6CE978;
  v5 = v4;
  v8 = v5;
  nw_txt_record_apply(v3, applier);

  return v5;
}

uint64_t __47__PKTXTRecord_txtRecordDictionaryForTxtRecord___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a4, a5, 4);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v9);

  return 1;
}

- (id)_initWithLowercasedDictionary:(id)a3
{
  id v4;
  PKTXTRecord *v5;
  uint64_t v6;
  NSDictionary *stringDict;
  uint64_t v8;
  NSMutableDictionary *seenDict;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTXTRecord;
  v5 = -[PKTXTRecord init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    stringDict = v5->_stringDict;
    v5->_stringDict = (NSDictionary *)v6;

    v8 = objc_opt_new();
    seenDict = v5->_seenDict;
    v5->_seenDict = (NSMutableDictionary *)v8;

  }
  return v5;
}

- (PKTXTRecord)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  PKTXTRecord *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lowercaseString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v11, v12);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = -[PKTXTRecord _initWithLowercasedDictionary:](self, "_initWithLowercasedDictionary:", v5);
  return v13;
}

- (PKTXTRecord)initWithTXTRecordData:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  PKTXTRecord *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x24BDB7460], "dictionaryFromTXTRecordData:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__PKTXTRecord_initWithTXTRecordData___block_invoke;
  v9[3] = &unk_24E6CE9A0;
  v6 = v5;
  v10 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = -[PKTXTRecord initWithDictionary:](self, "initWithDictionary:", v6);

  return v7;
}

void __37__PKTXTRecord_initWithTXTRecordData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  v7 = objc_retainAutorelease(v5);
  v8 = (void *)objc_msgSend(v6, "initWithBytes:length:encoding:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), 4);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v9);

}

- (PKTXTRecord)initWithNWTXTRecord:(id)a3
{
  void *v4;
  PKTXTRecord *v5;

  +[PKTXTRecord txtRecordDictionaryForTxtRecord:](PKTXTRecord, "txtRecordDictionaryForTxtRecord:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKTXTRecord _initWithLowercasedDictionary:](self, "_initWithLowercasedDictionary:", v4);

  return v5;
}

- (PKTXTRecord)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  PKTXTRecord *v7;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v5, objc_opt_class(), CFSTR("txtDict"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKTXTRecord initWithDictionary:](self, "initWithDictionary:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_stringDict, CFSTR("txtDict"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_stringValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
    __assert_rtn("-[PKTXTRecord _stringValueForKey:]", "PKTXTRecord.m", 89, "[[key lowercaseString] isEqualToString:key]");

  -[NSDictionary objectForKey:](self->_stringDict, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_checkMake:(id)a3 propertyName:(id)a4 maker:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_seenDict, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[PKTXTRecord _stringValueForKey:](self, "_stringValueForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 || (v10[2](v10, v12), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_seenDict, "setObject:forKeyedSubscript:", v11, v9);

  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v13)
    v14 = 0;
  else
    v14 = v11;

  return v14;
}

- (int64_t)_checkMakeInt:(id)a3 propertyName:(id)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[PKTXTRecord _checkMake:propertyName:maker:](self, "_checkMake:propertyName:maker:", a3, a4, &__block_literal_global_12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = -1;

  return v6;
}

id __42__PKTXTRecord__checkMakeInt_propertyName___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v2, "integerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_checkMakeString:(id)a3 propertyName:(id)a4
{
  -[PKTXTRecord _checkMake:propertyName:maker:](self, "_checkMake:propertyName:maker:", a3, a4, &__block_literal_global_12);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __45__PKTXTRecord__checkMakeString_propertyName___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

- (id)_checkMakeStringArray:(id)a3 propertyName:(id)a4
{
  -[PKTXTRecord _checkMake:propertyName:maker:](self, "_checkMake:propertyName:maker:", a3, a4, &__block_literal_global_14);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __50__PKTXTRecord__checkMakeStringArray_propertyName___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(","));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)_checkMakeAvail:(id)a3 propertyName:(id)a4
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[PKTXTRecord _checkMake:propertyName:maker:](self, "_checkMake:propertyName:maker:", a3, a4, &__block_literal_global_17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 2;

  return v6;
}

id __44__PKTXTRecord__checkMakeAvail_propertyName___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isEqualToString:", CFSTR("t")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_checkMakeUUID:(id)a3 propertyName:(id)a4
{
  -[PKTXTRecord _checkMake:propertyName:maker:](self, "_checkMake:propertyName:maker:", a3, a4, &__block_literal_global_21_0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __43__PKTXTRecord__checkMakeUUID_propertyName___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v2);

  return v3;
}

- (id)_checkMakeURL:(id)a3 propertyName:(id)a4
{
  -[PKTXTRecord _checkMake:propertyName:maker:](self, "_checkMake:propertyName:maker:", a3, a4, &__block_literal_global_24_0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __42__PKTXTRecord__checkMakeURL_propertyName___block_invoke(uint64_t a1, void *a2)
{
  PKURLWithString(a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)_checkMakeTLS:(id)a3 propertyName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int16 v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PKTXTRecord _checkMakeString:propertyName:](self, "_checkMakeString:propertyName:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_11;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("1.1")) & 1) == 0)
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("1.2")) & 1) != 0)
    {
      v10 = 771;
      goto LABEL_12;
    }
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("1.3")) & 1) != 0)
    {
      v10 = 772;
      goto LABEL_12;
    }
    _PKLogCategory(PKLogCategoryNetwork[0]);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_220F9A000, v11, OS_LOG_TYPE_ERROR, "Unknown tls level '%{public}@', returning 0", (uint8_t *)&v13, 0xCu);
    }

LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v10 = 770;
LABEL_12:

  return v10;
}

- (id)_wrapProduct:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4)
  {
    -[PKTXTRecord printerType](self, "printerType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)"), v5);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (unint64_t)supportsColor
{
  return -[PKTXTRecord _checkMakeAvail:propertyName:](self, "_checkMakeAvail:propertyName:", CFSTR("Color"), CFSTR("supportsColor"));
}

- (unint64_t)supportsDuplex
{
  return -[PKTXTRecord _checkMakeAvail:propertyName:](self, "_checkMakeAvail:propertyName:", CFSTR("Duplex"), CFSTR("supportsDuplex"));
}

- (unint64_t)supportsStaple
{
  return -[PKTXTRecord _checkMakeAvail:propertyName:](self, "_checkMakeAvail:propertyName:", CFSTR("Staple"), CFSTR("supportsStaple"));
}

- (unint64_t)supportsCopies
{
  return -[PKTXTRecord _checkMakeAvail:propertyName:](self, "_checkMakeAvail:propertyName:", CFSTR("Copies"), CFSTR("supportsCopies"));
}

- (unint64_t)supportsCollate
{
  return -[PKTXTRecord _checkMakeAvail:propertyName:](self, "_checkMakeAvail:propertyName:", CFSTR("Collate"), CFSTR("supportsCollate"));
}

- (unint64_t)supportsBind
{
  return -[PKTXTRecord _checkMakeAvail:propertyName:](self, "_checkMakeAvail:propertyName:", CFSTR("Bind"), CFSTR("supportsBind"));
}

- (unint64_t)supportsSort
{
  return -[PKTXTRecord _checkMakeAvail:propertyName:](self, "_checkMakeAvail:propertyName:", CFSTR("Sort"), CFSTR("supportsSort"));
}

- (unint64_t)supportsScan
{
  return -[PKTXTRecord _checkMakeAvail:propertyName:](self, "_checkMakeAvail:propertyName:", CFSTR("Scan"), CFSTR("supportsScan"));
}

- (unint64_t)supportsFax
{
  return -[PKTXTRecord _checkMakeAvail:propertyName:](self, "_checkMakeAvail:propertyName:", CFSTR("Fax"), CFSTR("supportsFax"));
}

- (int64_t)optionPunch
{
  return -[PKTXTRecord _checkMakeInt:propertyName:](self, "_checkMakeInt:propertyName:", CFSTR("Punch"), CFSTR("optionPunch"));
}

- (int64_t)optionPriority
{
  return -[PKTXTRecord _checkMakeInt:propertyName:](self, "_checkMakeInt:propertyName:", CFSTR("Priority"), CFSTR("optionPriority"));
}

- (int64_t)optionQueueTotal
{
  return -[PKTXTRecord _checkMakeInt:propertyName:](self, "_checkMakeInt:propertyName:", CFSTR("qtotal"), CFSTR("optionQueueTotal"));
}

- (NSString)optionPaperMax
{
  return (NSString *)-[PKTXTRecord _checkMakeString:propertyName:](self, "_checkMakeString:propertyName:", CFSTR("PaperMax"), CFSTR("optionPaperMax"));
}

- (NSString)versionString
{
  return (NSString *)-[PKTXTRecord _checkMakeString:propertyName:](self, "_checkMakeString:propertyName:", CFSTR("vers"), CFSTR("versionString"));
}

- (NSString)resourcePath
{
  return (NSString *)-[PKTXTRecord _checkMakeString:propertyName:](self, "_checkMakeString:propertyName:", CFSTR("rp"), CFSTR("resourcePath"));
}

- (NSString)printerType
{
  return (NSString *)-[PKTXTRecord _checkMakeString:propertyName:](self, "_checkMakeString:propertyName:", CFSTR("type"), CFSTR("printerType"));
}

- (NSString)location
{
  return (NSString *)-[PKTXTRecord _checkMakeString:propertyName:](self, "_checkMakeString:propertyName:", CFSTR("note"), CFSTR("location"));
}

- (unsigned)tlsVersion
{
  return -[PKTXTRecord _checkMakeTLS:propertyName:](self, "_checkMakeTLS:propertyName:", CFSTR("TLS"), CFSTR("tlsVersion"));
}

- (NSURL)adminURL
{
  return (NSURL *)-[PKTXTRecord _checkMakeURL:propertyName:](self, "_checkMakeURL:propertyName:", CFSTR("adminurl"), CFSTR("adminURL"));
}

- (NSString)printerProduct
{
  void *v3;
  void *v4;

  -[PKTXTRecord _checkMakeString:propertyName:](self, "_checkMakeString:propertyName:", CFSTR("product"), CFSTR("printerProduct"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTXTRecord _wrapProduct:](self, "_wrapProduct:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSArray)printerKind
{
  return (NSArray *)-[PKTXTRecord _checkMakeStringArray:propertyName:](self, "_checkMakeStringArray:propertyName:", CFSTR("kind"), CFSTR("printerKind"));
}

- (NSArray)pageDescriptions
{
  return (NSArray *)-[PKTXTRecord _checkMakeStringArray:propertyName:](self, "_checkMakeStringArray:propertyName:", CFSTR("pdl"), CFSTR("pageDescriptions"));
}

- (NSArray)urfCapabilities
{
  return (NSArray *)-[PKTXTRecord _checkMakeStringArray:propertyName:](self, "_checkMakeStringArray:propertyName:", CFSTR("urf"), CFSTR("urfCapabilities"));
}

- (NSUUID)UUID
{
  return (NSUUID *)-[PKTXTRecord _checkMakeUUID:propertyName:](self, "_checkMakeUUID:propertyName:", CFSTR("uuid"), CFSTR("UUID"));
}

- (NSString)authInfoRequired
{
  return (NSString *)-[PKTXTRecord _checkMakeString:propertyName:](self, "_checkMakeString:propertyName:", CFSTR("air"), CFSTR("authInfoRequired"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seenDict, 0);
  objc_storeStrong((id *)&self->_stringDict, 0);
}

@end
