@implementation SFDeviceRegulatoryAttributes

- (SFDeviceRegulatoryAttributes)initWithRegulatoryAttributes:(id)a3 serialNumber:(id)a4
{
  id v6;
  id v7;
  SFDeviceRegulatoryAttributes *v8;
  uint64_t v9;
  NSString *serialNumber;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFDeviceRegulatoryAttributes;
  v8 = -[SFDeviceRegulatoryAttributes init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    serialNumber = v8->_serialNumber;
    v8->_serialNumber = (NSString *)v9;

    -[SFDeviceRegulatoryAttributes _resolveDeviceAttributes:](v8, "_resolveDeviceAttributes:", v6);
  }

  return v8;
}

+ (SFDeviceRegulatoryAttributes)currentDeviceAttributes
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SFDeviceRegulatoryAttributes_currentDeviceAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentDeviceAttributes_onceToken != -1)
    dispatch_once(&currentDeviceAttributes_onceToken, block);
  return (SFDeviceRegulatoryAttributes *)(id)currentDeviceAttributes__currentDeviceAttributes;
}

void __55__SFDeviceRegulatoryAttributes_currentDeviceAttributes__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "getRegulatoryAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MGCopyAnswer();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithRegulatoryAttributes:serialNumber:", v5, v2);
  v4 = (void *)currentDeviceAttributes__currentDeviceAttributes;
  currentDeviceAttributes__currentDeviceAttributes = v3;

}

- (void)_resolveDeviceAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  UIImage *v19;
  UIImage *resolvedRegulatoryImage;
  id v21;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v11 = 0;
    v6 = 0;
    v12 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RegulatoryInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RegulatoryInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v9 = (void *)MEMORY[0x24BDD1608];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RegulatoryInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v9, "JSONObjectWithData:options:error:", v10, 0, &v21);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v21;

      goto LABEL_8;
    }
    v6 = 0;
  }
  v11 = 0;
LABEL_8:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RegulatoryImages"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RegulatoryImages"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) == 0)
    {
      v12 = 0;
      if (!v11)
        goto LABEL_17;
      goto LABEL_14;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RegulatoryImages"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v11)
    goto LABEL_17;
LABEL_14:
  SFLogForCategory(3uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[SFDeviceRegulatoryAttributes _resolveDeviceAttributes:].cold.1();

LABEL_17:
  -[SFDeviceRegulatoryAttributes _resolveManufacturingDateRelatedFields:](self, "_resolveManufacturingDateRelatedFields:", v6);
  -[SFDeviceRegulatoryAttributes _resolveIndiaBISRegulatoryNumber:](self, "_resolveIndiaBISRegulatoryNumber:", v6);
  -[SFDeviceRegulatoryAttributes _resolveCountryOfOrigin:](self, "_resolveCountryOfOrigin:", v6);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "environment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("XCTestBundlePath"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v18, "containsString:", CFSTR("SettingsFoundation")))
  {
    v19 = (UIImage *)objc_opt_new();
    resolvedRegulatoryImage = self->__resolvedRegulatoryImage;
    self->__resolvedRegulatoryImage = v19;

  }
  else
  {
    -[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:](self, "_resolveRegulatoryImage:", v12);
  }

}

- (void)_resolveManufacturingDateRelatedFields:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  NSDate *v11;
  NSDate *resolvedManufacturingDate;
  NSDate *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSDate *v36;
  NSDate *resolvedStartingWeek;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("manufacturingDate"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("manufacturingDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("manufacturingDate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SFDeviceRegulatoryAttributes _dateFormatter](SFDeviceRegulatoryAttributes, "_dateFormatter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateFromString:", v9);
      v11 = (NSDate *)objc_claimAutoreleasedReturnValue();

      resolvedManufacturingDate = self->__resolvedManufacturingDate;
      self->__resolvedManufacturingDate = v11;
      v13 = v11;

      +[SFDeviceRegulatoryAttributes _calendar](SFDeviceRegulatoryAttributes, "_calendar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_yearForWeekOfManufacture = objc_msgSend(v14, "component:fromDate:", 4, v13);

      +[SFDeviceRegulatoryAttributes _calendar](SFDeviceRegulatoryAttributes, "_calendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self->_yearOfManufacture = objc_msgSend(v15, "component:fromDate:", 4, v13);

      +[SFDeviceRegulatoryAttributes _calendar](SFDeviceRegulatoryAttributes, "_calendar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      self->_monthOfManufacture = objc_msgSend(v16, "component:fromDate:", 8, v13);

      +[SFDeviceRegulatoryAttributes _calendar](SFDeviceRegulatoryAttributes, "_calendar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "component:fromDate:", 0x2000, v13);

      self->_weekOfManufacture = v18;
LABEL_12:

      goto LABEL_13;
    }
  }
  SFLogForCategory(3uLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[SFDeviceRegulatoryAttributes _resolveManufacturingDateRelatedFields:].cold.1();

  -[SFDeviceRegulatoryAttributes serialNumber](self, "serialNumber");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21 == 12)
  {
    -[SFDeviceRegulatoryAttributes serialNumber](self, "serialNumber");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "substringWithRange:", 3, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SFDeviceRegulatoryAttributes serialNumber](self, "serialNumber");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "substringWithRange:", 4, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[SFDeviceRegulatoryAttributes _yearCodeToStartDateLookup](SFDeviceRegulatoryAttributes, "_yearCodeToStartDateLookup");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      +[SFDeviceRegulatoryAttributes _yearCodeToStartDateLookup](SFDeviceRegulatoryAttributes, "_yearCodeToStartDateLookup");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v9);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      +[SFDeviceRegulatoryAttributes _weekCodeLookup](SFDeviceRegulatoryAttributes, "_weekCodeLookup");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "rangeOfString:", v24);
      v32 = v31;

      if (v32 == 1)
      {
        +[SFDeviceRegulatoryAttributes _calendar](SFDeviceRegulatoryAttributes, "_calendar");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "components:fromDate:", 0x2000, v28);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "setWeekOfYear:", objc_msgSend(v34, "weekOfYear") + v30);
        +[SFDeviceRegulatoryAttributes _calendar](SFDeviceRegulatoryAttributes, "_calendar");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "dateByAddingUnit:value:toDate:options:", 0x2000, v30, v28, 1);
        v36 = (NSDate *)objc_claimAutoreleasedReturnValue();
        resolvedStartingWeek = self->__resolvedStartingWeek;
        self->__resolvedStartingWeek = v36;

        +[SFDeviceRegulatoryAttributes _calendar](SFDeviceRegulatoryAttributes, "_calendar");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDeviceRegulatoryAttributes _resolvedStartingWeek](self, "_resolvedStartingWeek");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        self->_yearForWeekOfManufacture = objc_msgSend(v38, "component:fromDate:", 0x4000, v39);

        +[SFDeviceRegulatoryAttributes _calendar](SFDeviceRegulatoryAttributes, "_calendar");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDeviceRegulatoryAttributes _resolvedStartingWeek](self, "_resolvedStartingWeek");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        self->_yearOfManufacture = objc_msgSend(v40, "component:fromDate:", 4, v41);

        +[SFDeviceRegulatoryAttributes _calendar](SFDeviceRegulatoryAttributes, "_calendar");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDeviceRegulatoryAttributes _resolvedStartingWeek](self, "_resolvedStartingWeek");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        self->_monthOfManufacture = objc_msgSend(v42, "component:fromDate:", 8, v43);

        +[SFDeviceRegulatoryAttributes _calendar](SFDeviceRegulatoryAttributes, "_calendar");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDeviceRegulatoryAttributes _resolvedStartingWeek](self, "_resolvedStartingWeek");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        self->_weekOfManufacture = objc_msgSend(v44, "component:fromDate:", 0x2000, v45);

      }
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)_resolveIndiaBISRegulatoryNumber:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSString *v22;
  NSString *resolvedIndiaBISNumber;
  NSObject *v24;
  NSString **p_resolvedIndiaBISNumber;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSString *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  NSString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("elabel"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("elabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("elabel"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = v9;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bis"));
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11
          && (v12 = (void *)v11,
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bis")),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              v14 = objc_opt_isKindOfClass(),
              v13,
              v12,
              (v14 & 1) != 0))
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bis"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("regulatory"));
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bis"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("regulatory"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v20 = objc_opt_isKindOfClass();

            if ((v20 & 1) != 0)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bis"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("regulatory"));
              v22 = (NSString *)objc_claimAutoreleasedReturnValue();

              resolvedIndiaBISNumber = self->__resolvedIndiaBISNumber;
              self->__resolvedIndiaBISNumber = v22;

              goto LABEL_12;
            }
          }
          else
          {

          }
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bis"));
          v40 = objc_claimAutoreleasedReturnValue();
          if (!v40)
            goto LABEL_33;
          v41 = (void *)v40;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bis"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("regulatory"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v43)
          {
            SFLogForCategory(3uLL);
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              -[SFDeviceRegulatoryAttributes _resolveIndiaBISRegulatoryNumber:].cold.4();
          }
          else
          {
LABEL_33:
            SFLogForCategory(3uLL);
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              -[SFDeviceRegulatoryAttributes _resolveIndiaBISRegulatoryNumber:].cold.3();
          }
        }
        else
        {
          SFLogForCategory(3uLL);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            -[SFDeviceRegulatoryAttributes _resolveIndiaBISRegulatoryNumber:].cold.2();
        }

        goto LABEL_12;
      }
    }
  }
  SFLogForCategory(3uLL);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[SFDeviceRegulatoryAttributes _resolveIndiaBISRegulatoryNumber:].cold.1();

  v10 = 0;
LABEL_12:
  p_resolvedIndiaBISNumber = &self->__resolvedIndiaBISNumber;
  if (self->__resolvedIndiaBISNumber)
    goto LABEL_26;
  -[SFDeviceRegulatoryAttributes plantCode](self, "plantCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = (void *)MGCopyAnswer();
    v28 = (void *)MEMORY[0x24BDBCE70];
    SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/RegulatoryImages"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x24BDD17C8];
    if (v27)
    {
      objc_msgSend(v27, "lowercaseString");
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = &stru_24C398458;
    }
    objc_msgSend(v30, "stringWithFormat:", CFSTR("IndiaBISMappings~%@.plist"), v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByAppendingPathComponent:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryWithContentsOfFile:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    -[SFDeviceRegulatoryAttributes plantCode](self, "plantCode");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKey:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
      objc_storeStrong((id *)p_resolvedIndiaBISNumber, v37);

  }
  if (*p_resolvedIndiaBISNumber)
  {
LABEL_26:
    SFLogForCategory(3uLL);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *p_resolvedIndiaBISNumber;
      *(_DWORD *)buf = 136315394;
      v45 = "-[SFDeviceRegulatoryAttributes _resolveIndiaBISRegulatoryNumber:]";
      v46 = 2112;
      v47 = v39;
      _os_log_impl(&dword_20AC93000, v38, OS_LOG_TYPE_DEFAULT, "%{Public}s: BIS e-label: '%{Public}@'", buf, 0x16u);
    }

  }
}

- (void)_resolveCountryOfOrigin:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSString *v16;
  NSObject *v17;
  NSObject *v18;
  NSString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  NSString *resolvedCountryOfOrigin;
  int v25;
  const char *v26;
  __int16 v27;
  NSString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countryOfOrigin"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countryOfOrigin"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countryOfOrigin"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = v9;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("assembledIn"));
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11
          && (v12 = (void *)v11,
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("assembledIn")),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              v14 = objc_opt_isKindOfClass(),
              v13,
              v12,
              (v14 & 1) != 0))
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("assembledIn"));
          v15 = objc_claimAutoreleasedReturnValue();
          SF_LocalizedStringForCountryOfOriginAssembledIn(v15);
          v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("madeIn"));
          v20 = objc_claimAutoreleasedReturnValue();
          if (!v20
            || (v21 = (void *)v20,
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("madeIn")),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                v23 = objc_opt_isKindOfClass(),
                v22,
                v21,
                (v23 & 1) == 0))
          {
            SFLogForCategory(3uLL);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[SFDeviceRegulatoryAttributes _resolveCountryOfOrigin:].cold.2();
            goto LABEL_21;
          }
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("madeIn"));
          v15 = objc_claimAutoreleasedReturnValue();
          SF_LocalizedStringForCountryOfOriginMadeIn(v15);
          v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        resolvedCountryOfOrigin = self->__resolvedCountryOfOrigin;
        self->__resolvedCountryOfOrigin = v16;

LABEL_21:
        goto LABEL_10;
      }
    }
  }
  SFLogForCategory(3uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[SFDeviceRegulatoryAttributes _resolveCountryOfOrigin:].cold.1();

  v10 = 0;
LABEL_10:
  if (self->__resolvedCountryOfOrigin)
  {
    SFLogForCategory(3uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->__resolvedCountryOfOrigin;
      v25 = 136315394;
      v26 = "-[SFDeviceRegulatoryAttributes _resolveCountryOfOrigin:]";
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_20AC93000, v18, OS_LOG_TYPE_DEFAULT, "%{Public}s: Country of Origin e-label: '%{Public}@'", (uint8_t *)&v25, 0x16u);
    }

  }
}

- (void)_resolveRegulatoryImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const __CFData *v21;
  CGImageSource *v22;
  CGImageSource *v23;
  size_t Count;
  size_t v25;
  CGImageRef ImageAtIndex;
  CGImage *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  CGImageRef v34;
  CGImage *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  UIImage *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  UIImage *resolvedRegulatoryImage;
  CGImage *image;
  void *v56;
  void *v57;
  SFDeviceRegulatoryAttributes *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  int v69;
  __int128 v70;
  int v71;
  __int128 v72;
  int v73;
  __int128 v74;
  int v75;
  __int128 v76;
  int v77;
  __int128 v78;
  int v79;
  __int128 v80;
  int v81;
  __int128 v82;
  int v83;
  uint8_t v84[4];
  uint64_t v85;
  uint8_t v86[4];
  uint64_t v87;
  _QWORD v88[2];
  _QWORD v89[2];
  uint8_t v90[128];
  uint8_t buf[4];
  const char *v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    SFLogForCategory(3uLL);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:].cold.1(v31);

    goto LABEL_61;
  }
  v5 = (void *)MGCopyAnswer();
  v6 = (void *)MGCopyAnswer();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("-%@"), v6);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "length");
  SFLogForCategory(3uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:].cold.2(v9, v32, v33);
    goto LABEL_59;
  }
  v58 = self;
  v59 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v92 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
    v93 = 2112;
    v94 = v61;
    _os_log_impl(&dword_20AC93000, v9, OS_LOG_TYPE_DEFAULT, "%{Public}s: Looking for Lockdown Regulatory Image '%@'", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v60 = v4;
  obj = v4;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v90, 16);
  v14 = v61;
  if (!v13)
  {
LABEL_35:

    self = v58;
    v6 = v59;
    v4 = v60;
    goto LABEL_57;
  }
  v15 = v13;
  v16 = *(_QWORD *)v65;
  v62 = v5;
LABEL_7:
  v17 = 0;
  while (1)
  {
    if (*(_QWORD *)v65 != v16)
      objc_enumerationMutation(obj);
    v18 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v17);
    objc_msgSend(v18, "objectForKey:", CFSTR("ImageId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SFLogForCategory(3uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v92 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
      v93 = 2112;
      v94 = v19;
      _os_log_impl(&dword_20AC93000, v20, OS_LOG_TYPE_DEFAULT, "%{Public}s: Candidate Lockdown Regulatory Image '%@'", buf, 0x16u);
    }

    if (objc_msgSend(v5, "caseInsensitiveCompare:", v19) && objc_msgSend(v14, "caseInsensitiveCompare:", v19))
      goto LABEL_33;
    objc_msgSend(v18, "objectForKey:", CFSTR("ImageData"));
    v21 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      SFLogForCategory(3uLL);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:].cold.5(v84, &v85, v29);

      goto LABEL_32;
    }
    v22 = CGImageSourceCreateWithData(v21, 0);
    if (!v22)
    {
      SFLogForCategory(3uLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:].cold.3(v86, &v87, v30);

      goto LABEL_31;
    }
    v23 = v22;
    Count = CGImageSourceGetCount(v22);
    if (Count)
      break;
    SFLogForCategory(3uLL);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v92 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
      v93 = 2112;
      v94 = v19;
      _os_log_error_impl(&dword_20AC93000, v28, OS_LOG_TYPE_ERROR, "%{Public}s: Empty Lockdown Regulatory Image '%{Public}@'", buf, 0x16u);
    }
    v14 = v61;
LABEL_30:

    CFRelease(v23);
LABEL_31:
    v5 = v62;
LABEL_32:

LABEL_33:
    if (v15 == ++v17)
    {
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v90, 16);
      if (v15)
        goto LABEL_7;
      goto LABEL_35;
    }
  }
  v25 = Count;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v23, 0, 0);
  v27 = ImageAtIndex;
  if (v25 != 2)
  {
    v14 = v61;
    if (ImageAtIndex)
    {
      v47 = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", ImageAtIndex, 0, v12);
      CGImageRelease(v27);
      CFRelease(v23);
      SFLogForCategory(3uLL);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v92 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
        v93 = 2112;
        v94 = v19;
        _os_log_impl(&dword_20AC93000, v36, OS_LOG_TYPE_DEFAULT, "%{Public}s: Matched Lockdown Regulatory Image '%@'", buf, 0x16u);
      }
LABEL_48:
      self = v58;
      v6 = v59;
      v4 = v60;
      goto LABEL_56;
    }
    SFLogForCategory(3uLL);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v92 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
      v93 = 2112;
      v94 = v19;
      _os_log_error_impl(&dword_20AC93000, v28, OS_LOG_TYPE_ERROR, "%{Public}s: Failed decoding Lockdown Regulatory Image '%{Public}@'", buf, 0x16u);
    }
    goto LABEL_30;
  }
  v34 = CGImageSourceCreateImageAtIndex(v23, 1uLL, 0);
  v35 = v34;
  if (v27 && v34)
  {
    v36 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", v27, 0, v12);
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", v35, 0, v12);
    objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithDisplayScale:", v12);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    image = v35;
    v38 = objc_alloc_init(MEMORY[0x24BDF6AD0]);
    v39 = (void *)MEMORY[0x24BDF6F30];
    v89[0] = v37;
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v89[1] = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "traitCollectionWithTraitsFromCollections:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "registerImage:withTraitCollection:", v36, v42);

    v43 = (void *)MEMORY[0x24BDF6F30];
    v88[0] = v37;
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v44;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "traitCollectionWithTraitsFromCollections:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "registerImage:withTraitCollection:", v57, v46);

    objc_msgSend(v38, "imageWithTraitCollection:", v56);
    v47 = (UIImage *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v27);
    CGImageRelease(image);
    CFRelease(v23);
    SFLogForCategory(3uLL);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v92 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
      v93 = 2112;
      v94 = v19;
      _os_log_impl(&dword_20AC93000, v48, OS_LOG_TYPE_DEFAULT, "%{Public}s: Matched style-sensitive Lockdown Regulatory Image '%{Public}@'", buf, 0x16u);
    }

    goto LABEL_48;
  }
  if (v27)
    CGImageRelease(v27);
  v6 = v59;
  v4 = v60;
  if (v35)
    CGImageRelease(v35);
  CFRelease(v23);
  SFLogForCategory(3uLL);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    -[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:].cold.4();
  v47 = 0;
  self = v58;
LABEL_56:
  v5 = v62;

  if (v47)
    goto LABEL_60;
LABEL_57:
  SFLogForCategory(3uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v92 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
    v93 = 2112;
    v94 = v61;
    _os_log_impl(&dword_20AC93000, v9, OS_LOG_TYPE_DEFAULT, "%{Public}s: No matching Lockdown Regulatory Image for '%{Public}@'", buf, 0x16u);
  }
LABEL_59:

  v47 = 0;
LABEL_60:

  if (!v47)
  {
LABEL_61:
    v49 = (void *)MGCopyAnswer();
    v50 = (void *)MGCopyAnswer();
    _SFBuiltInRegulatoryImage(v49, v50);
    v47 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  v83 = 533419158;
  v82 = xmmword_20ACA5A00;
  v81 = 1106979518;
  v80 = xmmword_20ACA5A14;
  v79 = -1820426635;
  v78 = xmmword_20ACA5A28;
  v77 = -937652876;
  v76 = xmmword_20ACA5A3C;
  v75 = -609570151;
  v74 = xmmword_20ACA5A50;
  v73 = -874769875;
  v72 = xmmword_20ACA5A64;
  v71 = 1874287171;
  v70 = xmmword_20ACA5A78;
  v69 = -781324731;
  v68 = xmmword_20ACA5A8C;
  if (MGIsDeviceOneOfType())
  {
    v51 = (void *)MGCopyAnswer();
    v52 = (void *)MGCopyAnswer();
    _SFBuiltInRegulatoryImage(v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();

    v47 = (UIImage *)v53;
  }
  resolvedRegulatoryImage = self->__resolvedRegulatoryImage;
  self->__resolvedRegulatoryImage = v47;

}

+ (id)getRegulatoryAttributes
{
  uint64_t v2;
  char *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 1;
  v2 = container_system_group_path_for_identifier();
  if (!v2)
  {
    SFLogForCategory(3uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[SFDeviceRegulatoryAttributes getRegulatoryAttributes].cold.1((uint64_t)&v19, v4, v12, v13, v14, v15, v16, v17);
    goto LABEL_13;
  }
  v3 = (char *)v2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = chmod(v3, 0x1FFu);
  free(v3);
  if (v5 && *__error() != 1)
  {
    SFLogForCategory(3uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SFDeviceRegulatoryAttributes getRegulatoryAttributes].cold.2(v6);

  }
  if (!v4)
  {
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  -[NSObject stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", CFSTR("Library"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("RegulatoryImages"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("regulatory_images.plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  SFLogForCategory(3uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "+[SFDeviceRegulatoryAttributes getRegulatoryAttributes]";
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_20AC93000, v10, OS_LOG_TYPE_DEFAULT, "%{Public}s: Lockdown Regulatory Images at '%@'", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v11;
}

- (UIImage)regulatoryImage
{
  void *v3;
  void *v4;

  -[SFDeviceRegulatoryAttributes _resolvedRegulatoryImage](self, "_resolvedRegulatoryImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SFDeviceRegulatoryAttributes _resolvedRegulatoryImage](self, "_resolvedRegulatoryImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)objc_opt_new();
  }
  return (UIImage *)v4;
}

- (NSString)plantCode
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[SFDeviceRegulatoryAttributes serialNumber](self, "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4 == 12)
  {
    -[SFDeviceRegulatoryAttributes serialNumber](self, "serialNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringWithRange:", 0, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

+ (NSString)_weekCodeLookup
{
  if (_weekCodeLookup_onceToken != -1)
    dispatch_once(&_weekCodeLookup_onceToken, &__block_literal_global_3);
  return (NSString *)(id)_weekCodeLookup___weekCodeLookup;
}

void __47__SFDeviceRegulatoryAttributes__weekCodeLookup__block_invoke()
{
  void *v0;

  v0 = (void *)_weekCodeLookup___weekCodeLookup;
  _weekCodeLookup___weekCodeLookup = (uint64_t)CFSTR("123456789CDFGHJKLMNPQRTVWXY");

}

+ (NSCalendar)_calendar
{
  if (_calendar_onceToken != -1)
    dispatch_once(&_calendar_onceToken, &__block_literal_global_66);
  return (NSCalendar *)(id)_calendar___calendarForLookup;
}

void __41__SFDeviceRegulatoryAttributes__calendar__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_calendar___calendarForLookup;
  _calendar___calendarForLookup = v0;

}

+ (NSISO8601DateFormatter)_dateFormatter
{
  if (_dateFormatter_onceToken != -1)
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global_68);
  return (NSISO8601DateFormatter *)(id)_dateFormatter___dateFormatterForISO8601;
}

uint64_t __46__SFDeviceRegulatoryAttributes__dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  v1 = (void *)_dateFormatter___dateFormatterForISO8601;
  _dateFormatter___dateFormatterForISO8601 = (uint64_t)v0;

  return objc_msgSend((id)_dateFormatter___dateFormatterForISO8601, "setFormatOptions:", 1907);
}

+ (NSDictionary)_yearCodeToStartDateLookup
{
  if (_yearCodeToStartDateLookup_onceToken != -1)
    dispatch_once(&_yearCodeToStartDateLookup_onceToken, &__block_literal_global_70);
  return (NSDictionary *)(id)_yearCodeToStartDateLookup___yearCodeToStartDateLookup;
}

void __58__SFDeviceRegulatoryAttributes__yearCodeToStartDateLookup__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  _QWORD v23[20];
  _QWORD v24[22];

  v24[20] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v0, "setDateFormat:", CFSTR("MM/dd/yyyy"));
  v23[0] = CFSTR("P");
  objc_msgSend(v0, "dateFromString:", CFSTR("12/28/2014"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = CFSTR("Q");
  objc_msgSend(v0, "dateFromString:", CFSTR("06/28/2015"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = CFSTR("R");
  objc_msgSend(v0, "dateFromString:", CFSTR("12/27/2015"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  v23[3] = CFSTR("S");
  objc_msgSend(v0, "dateFromString:", CFSTR("06/26/2016"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  v23[4] = CFSTR("T");
  objc_msgSend(v0, "dateFromString:", CFSTR("01/01/2017"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  v23[5] = CFSTR("V");
  objc_msgSend(v0, "dateFromString:", CFSTR("07/02/2017"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v17;
  v23[6] = CFSTR("W");
  objc_msgSend(v0, "dateFromString:", CFSTR("12/31/2017"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v16;
  v23[7] = CFSTR("X");
  objc_msgSend(v0, "dateFromString:", CFSTR("07/01/2018"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v15;
  v23[8] = CFSTR("Y");
  objc_msgSend(v0, "dateFromString:", CFSTR("12/30/2018"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v14;
  v23[9] = CFSTR("Z");
  objc_msgSend(v0, "dateFromString:", CFSTR("06/30/2019"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v13;
  v23[10] = CFSTR("C");
  objc_msgSend(v0, "dateFromString:", CFSTR("12/29/2019"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v12;
  v23[11] = CFSTR("D");
  objc_msgSend(v0, "dateFromString:", CFSTR("06/28/2020"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v1;
  v23[12] = CFSTR("F");
  objc_msgSend(v0, "dateFromString:", CFSTR("12/27/2020"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[12] = v2;
  v23[13] = CFSTR("G");
  objc_msgSend(v0, "dateFromString:", CFSTR("06/27/2021"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[13] = v3;
  v23[14] = CFSTR("H");
  objc_msgSend(v0, "dateFromString:", CFSTR("12/26/2021"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[14] = v4;
  v23[15] = CFSTR("J");
  objc_msgSend(v0, "dateFromString:", CFSTR("06/26/2022"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[15] = v5;
  v23[16] = CFSTR("K");
  objc_msgSend(v0, "dateFromString:", CFSTR("01/01/2023"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[16] = v6;
  v23[17] = CFSTR("L");
  objc_msgSend(v0, "dateFromString:", CFSTR("07/02/2023"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[17] = v7;
  v23[18] = CFSTR("M");
  objc_msgSend(v0, "dateFromString:", CFSTR("12/31/2023"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[18] = v8;
  v23[19] = CFSTR("N");
  objc_msgSend(v0, "dateFromString:", CFSTR("06/30/2024"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[19] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 20);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_yearCodeToStartDateLookup___yearCodeToStartDateLookup;
  _yearCodeToStartDateLookup___yearCodeToStartDateLookup = v10;

}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSDate)manufacturingDate
{
  return self->_manufacturingDate;
}

- (unint64_t)yearForWeekOfManufacture
{
  return self->_yearForWeekOfManufacture;
}

- (unint64_t)yearOfManufacture
{
  return self->_yearOfManufacture;
}

- (unint64_t)monthOfManufacture
{
  return self->_monthOfManufacture;
}

- (unint64_t)weekOfManufacture
{
  return self->_weekOfManufacture;
}

- (NSDate)_resolvedManufacturingDate
{
  return self->__resolvedManufacturingDate;
}

- (void)set_resolvedManufacturingDate:(id)a3
{
  objc_storeStrong((id *)&self->__resolvedManufacturingDate, a3);
}

- (NSString)_resolvedIndiaBISNumber
{
  return self->__resolvedIndiaBISNumber;
}

- (void)set_resolvedIndiaBISNumber:(id)a3
{
  objc_storeStrong((id *)&self->__resolvedIndiaBISNumber, a3);
}

- (NSString)_resolvedCountryOfOrigin
{
  return self->__resolvedCountryOfOrigin;
}

- (void)set_resolvedCountryOfOrigin:(id)a3
{
  objc_storeStrong((id *)&self->__resolvedCountryOfOrigin, a3);
}

- (UIImage)_resolvedRegulatoryImage
{
  return self->__resolvedRegulatoryImage;
}

- (void)set_resolvedRegulatoryImage:(id)a3
{
  objc_storeStrong((id *)&self->__resolvedRegulatoryImage, a3);
}

- (NSDate)_resolvedStartingWeek
{
  return self->__resolvedStartingWeek;
}

- (void)set_resolvedStartingWeek:(id)a3
{
  objc_storeStrong((id *)&self->__resolvedStartingWeek, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resolvedStartingWeek, 0);
  objc_storeStrong((id *)&self->__resolvedRegulatoryImage, 0);
  objc_storeStrong((id *)&self->__resolvedCountryOfOrigin, 0);
  objc_storeStrong((id *)&self->__resolvedIndiaBISNumber, 0);
  objc_storeStrong((id *)&self->__resolvedManufacturingDate, 0);
  objc_storeStrong((id *)&self->_manufacturingDate, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

- (void)_resolveDeviceAttributes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_20AC93000, v0, v1, "%{Public}s: Invalid RegulatoryInfo: '%{Public}@'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_resolveManufacturingDateRelatedFields:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20AC93000, v0, v1, "%{Public}s: Empty manufacturingDate entry: '%@'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_resolveIndiaBISRegulatoryNumber:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20AC93000, v0, v1, "%{Public}s: Empty elabel entry: '%@'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_resolveIndiaBISRegulatoryNumber:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20AC93000, v0, v1, "%{Public}s: Empty BIS entry: '%@'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_resolveIndiaBISRegulatoryNumber:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20AC93000, v0, v1, "%{Public}s: Empty BIS Regulatory entry: '%@'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_resolveIndiaBISRegulatoryNumber:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_20AC93000, v0, v1, "%{Public}s: Invalid BIS format: '%{Public}@'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_resolveCountryOfOrigin:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20AC93000, v0, v1, "%{Public}s: No Country of Origin entry: '%@'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_resolveCountryOfOrigin:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_20AC93000, v0, v1, "%{Public}s: Invalid Country of Origin format: '%{Public}@'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_resolveRegulatoryImage:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
  _os_log_debug_impl(&dword_20AC93000, log, OS_LOG_TYPE_DEBUG, "%{Public}s: No Lockdown Regulatory Images in container", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_resolveRegulatoryImage:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
  OUTLINED_FUNCTION_4(&dword_20AC93000, a1, a3, "%{Public}s: No Lockdown Regulatory Image device model", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_resolveRegulatoryImage:(NSObject *)a3 .cold.3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
  OUTLINED_FUNCTION_4(&dword_20AC93000, a3, (uint64_t)a3, "%{Public}s: No Lockdown Regulatory Image source", a1);
}

- (void)_resolveRegulatoryImage:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_20AC93000, v0, v1, "%{Public}s: Failed decoding style-sensitive Lockdown Regulatory Image '%{Public}@'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_resolveRegulatoryImage:(NSObject *)a3 .cold.5(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
  OUTLINED_FUNCTION_4(&dword_20AC93000, a3, (uint64_t)a3, "%{Public}s: Lockdown Regulatory Image not data", a1);
}

+ (void)getRegulatoryAttributes
{
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *__error();
  v3 = 136315394;
  v4 = "+[SFDeviceRegulatoryAttributes getRegulatoryAttributes]";
  v5 = 1024;
  v6 = v2;
  _os_log_error_impl(&dword_20AC93000, a1, OS_LOG_TYPE_ERROR, "%{Public}s: Failed to set permissions on Regulatory Images group path, errno %i", (uint8_t *)&v3, 0x12u);
}

@end
