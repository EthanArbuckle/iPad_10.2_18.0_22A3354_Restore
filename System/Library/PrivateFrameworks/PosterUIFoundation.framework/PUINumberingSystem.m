@implementation PUINumberingSystem

+ (id)systemDefaultNumberingSystem
{
  void *v3;
  void *v4;

  PUISystemDefaultNumberingSystemType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "numberingSystemForType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allNumberingSystemTypes
{
  if (allNumberingSystemTypes_onceToken != -1)
    dispatch_once(&allNumberingSystemTypes_onceToken, &__block_literal_global_44);
  return (id)allNumberingSystemTypes_allNumberingSystems;
}

void __45__PUINumberingSystem_allNumberingSystemTypes__block_invoke()
{
  void *v0;
  void *v1;
  objc_class *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[17];

  v6[16] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("latn");
  v6[1] = CFSTR("arab");
  v6[2] = CFSTR("deva");
  v6[3] = CFSTR("khmr");
  v6[4] = CFSTR("mymr");
  v6[5] = CFSTR("beng");
  v6[6] = CFSTR("guru");
  v6[7] = CFSTR("gujr");
  v6[8] = CFSTR("taml");
  v6[9] = CFSTR("telu");
  v6[10] = CFSTR("mlym");
  v6[11] = CFSTR("knda");
  v6[12] = CFSTR("orya");
  v6[13] = CFSTR("olck");
  v6[14] = CFSTR("mtei");
  v6[15] = CFSTR("arabext");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 16);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "sortedArrayUsingComparator:", &__block_literal_global_20);
  v2 = (objc_class *)MEMORY[0x24BDBCF00];
  v3 = v1;
  v4 = objc_msgSend([v2 alloc], "initWithArray:", v3);

  v5 = (void *)allNumberingSystemTypes_allNumberingSystems;
  allNumberingSystemTypes_allNumberingSystems = v4;

}

+ (id)allNumberingSystems
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "allNumberingSystemTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__PUINumberingSystem_allNumberingSystems__block_invoke;
  v6[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v6[4] = a1;
  objc_msgSend(v3, "bs_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __41__PUINumberingSystem_allNumberingSystems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "numberingSystemForType:", a2);
}

+ (id)supportedNumberingSystemTypes
{
  if (supportedNumberingSystemTypes_onceToken != -1)
    dispatch_once(&supportedNumberingSystemTypes_onceToken, &__block_literal_global_48_0);
  return (id)supportedNumberingSystemTypes_allNumberingSystems;
}

void __51__PUINumberingSystem_supportedNumberingSystemTypes__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[10];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v10[0] = CFSTR("latn");
  v10[1] = CFSTR("arab");
  v10[2] = CFSTR("deva");
  v10[3] = CFSTR("khmr");
  v10[4] = CFSTR("mymr");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithArray:", v1);

  if (_os_feature_enabled_impl())
  {
    v9[0] = CFSTR("beng");
    v9[1] = CFSTR("guru");
    v9[2] = CFSTR("gujr");
    v9[3] = CFSTR("telu");
    v9[4] = CFSTR("mlym");
    v9[5] = CFSTR("knda");
    v9[6] = CFSTR("orya");
    v9[7] = CFSTR("olck");
    v9[8] = CFSTR("mtei");
    v9[9] = CFSTR("arabext");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v3);

  }
  v4 = (void *)objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_20);
  v5 = (objc_class *)MEMORY[0x24BDBCF00];
  v6 = v4;
  v7 = objc_msgSend([v5 alloc], "initWithArray:", v6);

  v8 = (void *)supportedNumberingSystemTypes_allNumberingSystems;
  supportedNumberingSystemTypes_allNumberingSystems = v7;

}

+ (id)supportedNumberingSystems
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "supportedNumberingSystemTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__PUINumberingSystem_supportedNumberingSystems__block_invoke;
  v6[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v6[4] = a1;
  objc_msgSend(v3, "bs_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __47__PUINumberingSystem_supportedNumberingSystems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "numberingSystemForType:", a2);
}

+ (id)numberingSystemForType:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__PUINumberingSystem_numberingSystemForType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = numberingSystemForType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&numberingSystemForType__onceToken, block);
  objc_msgSend((id)numberingSystemForType__numberingSystemForType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __45__PUINumberingSystem_numberingSystemForType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_opt_new();
  v3 = (void *)numberingSystemForType__numberingSystemForType;
  numberingSystemForType__numberingSystemForType = v2;

  objc_msgSend(*(id *)(a1 + 32), "allNumberingSystemTypes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_54);

}

void __45__PUINumberingSystem_numberingSystemForType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PUINumberingSystem *v3;

  v2 = a2;
  v3 = -[PUINumberingSystem initWithNumberingSystemType:]([PUINumberingSystem alloc], "initWithNumberingSystemType:", v2);
  objc_msgSend((id)numberingSystemForType__numberingSystemForType, "setObject:forKeyedSubscript:", v3, v2);

}

+ (id)numberingSystemDisplayFontForFont:(id)a3
{
  if (a3)
    objc_msgSend(a3, "fontWithSize:", 50.0);
  else
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 50.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PUINumberingSystem)initWithNumberingSystemType:(id)a3
{
  __CFString *v4;
  PUINumberingSystem *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIImage *image;
  void *v12;
  uint64_t v13;
  NSString *localizedDisplayName;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSLocale *locale;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  NSString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  NSString *v31;
  void *v32;
  uint64_t v33;
  NSString *v34;
  void *v35;
  uint64_t v36;
  NSString *v37;
  void *v38;
  uint64_t v39;
  NSString *v40;
  void *v41;
  uint64_t v42;
  NSString *v43;
  void *v44;
  uint64_t v45;
  NSString *v46;
  void *v47;
  uint64_t v48;
  NSString *v49;
  void *v50;
  uint64_t v51;
  NSString *v52;
  void *v53;
  uint64_t v54;
  NSString *v55;
  void *v56;
  uint64_t v57;
  NSString *v58;
  void *v59;
  uint64_t v60;
  NSString *v61;
  void *v62;
  uint64_t v63;
  NSString *v64;
  void *v65;
  uint64_t v66;
  NSString *v67;
  uint64_t v68;
  objc_super v70;

  v4 = (__CFString *)a3;
  v70.receiver = self;
  v70.super_class = (Class)PUINumberingSystem;
  v5 = -[PUINumberingSystem init](&v70, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "allNumberingSystemTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if ((v7 & 1) == 0)
    {

      v4 = CFSTR("latn");
    }
    v8 = (void *)MEMORY[0x24BDF6AC8];
    PUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:withConfiguration:", CFSTR("textformat.12"), v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v10;

    PUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ARABIC_NUMBERS"), &stru_25154D128, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v13;

    objc_storeStrong((id *)&v5->_type, v4);
    objc_storeStrong((id *)&v5->_systemName, v4);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localeIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "setObject:forKey:", v5->_systemName, CFSTR("numbers"));
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeIdentifierFromComponents:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v20;

    if ((-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("latn")) & 1) != 0)
      goto LABEL_36;
    if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("arab")))
    {
      PUIBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = CFSTR("ARABIC_INDIC_NUMBERS");
    }
    else
    {
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("deva")))
      {
        PUIBundle();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("DEVANAGARI_NUMBERS"), &stru_25154D128, 0);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v30;

        v27 = (void *)MEMORY[0x24BDF6AC8];
        v28 = CFSTR("textformat.numbers.hi");
        goto LABEL_34;
      }
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("khmr")))
      {
        PUIBundle();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("KHMER_NUMBERS"), &stru_25154D128, 0);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v33;

        v27 = (void *)MEMORY[0x24BDF6AC8];
        v28 = CFSTR("textformat.numbers.km");
        goto LABEL_34;
      }
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("mymr")))
      {
        PUIBundle();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("BURMESE_NUMBERS"), &stru_25154D128, 0);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v36;

        v27 = (void *)MEMORY[0x24BDF6AC8];
        v28 = CFSTR("textformat.numbers.my");
        goto LABEL_34;
      }
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("beng")))
      {
        PUIBundle();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("BANGLA_NUMBERS"), &stru_25154D128, 0);
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v39;

        v27 = (void *)MEMORY[0x24BDF6AC8];
        v28 = CFSTR("textformat.numbers.bn");
        goto LABEL_34;
      }
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("guru")))
      {
        PUIBundle();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("GURMUKHI_NUMBERS"), &stru_25154D128, 0);
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v42;

        v27 = (void *)MEMORY[0x24BDF6AC8];
        v28 = CFSTR("textformat.numbers.pa");
        goto LABEL_34;
      }
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("gujr")))
      {
        PUIBundle();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("GUJARATI_NUMBERS"), &stru_25154D128, 0);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v45;

        v27 = (void *)MEMORY[0x24BDF6AC8];
        v28 = CFSTR("textformat.numbers.gu");
        goto LABEL_34;
      }
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("taml")))
      {
        PUIBundle();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("TAMIL_NUMBERS"), &stru_25154D128, 0);
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v48;

LABEL_35:
LABEL_36:

        goto LABEL_37;
      }
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("telu")))
      {
        PUIBundle();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("TELUGU_NUMBERS"), &stru_25154D128, 0);
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v51;

        v27 = (void *)MEMORY[0x24BDF6AC8];
        v28 = CFSTR("textformat.numbers.te");
        goto LABEL_34;
      }
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("mlym")))
      {
        PUIBundle();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("MALAYALAM_NUMBERS"), &stru_25154D128, 0);
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v54;

        v27 = (void *)MEMORY[0x24BDF6AC8];
        v28 = CFSTR("textformat.numbers.ml");
        goto LABEL_34;
      }
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("knda")))
      {
        PUIBundle();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("KANNADA_NUMBERS"), &stru_25154D128, 0);
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v57;

        v27 = (void *)MEMORY[0x24BDF6AC8];
        v28 = CFSTR("textformat.numbers.kn");
        goto LABEL_34;
      }
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("orya")))
      {
        PUIBundle();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("ODIA_NUMBERS"), &stru_25154D128, 0);
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v60;

        v27 = (void *)MEMORY[0x24BDF6AC8];
        v28 = CFSTR("textformat.numbers.or");
        goto LABEL_34;
      }
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("olck")))
      {
        PUIBundle();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("OLCHIKI_NUMBERS"), &stru_25154D128, 0);
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v63;

        v27 = (void *)MEMORY[0x24BDF6AC8];
        v28 = CFSTR("textformat.numbers.sat");
        goto LABEL_34;
      }
      if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("mtei")))
      {
        PUIBundle();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("MEITEI_NUMBERS"), &stru_25154D128, 0);
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v66;

        v27 = (void *)MEMORY[0x24BDF6AC8];
        v28 = CFSTR("textformat.numbers.mni");
        goto LABEL_34;
      }
      if (!-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("arabext")))
        goto LABEL_36;
      PUIBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = CFSTR("URDU_NUMBERS");
    }
    objc_msgSend(v22, "localizedStringForKey:value:table:", v24, &stru_25154D128, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v25;

    v27 = (void *)MEMORY[0x24BDF6AC8];
    v28 = CFSTR("textformat.numbers.ar");
LABEL_34:
    objc_msgSend(v27, "systemImageNamed:", v28);
    v68 = objc_claimAutoreleasedReturnValue();
    v47 = v5->_image;
    v5->_image = (UIImage *)v68;
    goto LABEL_35;
  }
LABEL_37:

  return v5;
}

- (PUINumberingSystem)init
{
  void *v3;
  void *v4;
  PUINumberingSystem *v5;

  v3 = (void *)objc_opt_class();
  PUISystemDefaultNumberingSystemType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberingSystemForType:", v4);
  v5 = (PUINumberingSystem *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_type, "hash");
  return -[NSLocale hash](self->_locale, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  PUINumberingSystem *v4;
  PUINumberingSystem *v5;
  void *v6;
  char isKindOfClass;
  PUINumberingSystem *v8;
  PUINumberingSystem *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;

  v4 = (PUINumberingSystem *)a3;
  v5 = v4;
  if (self == v4)
  {
    v18 = 1;
  }
  else if (v4)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v8 = v5;
    else
      v8 = 0;
    v9 = v8;

    if ((isKindOfClass & 1) == 0)
      goto LABEL_11;
    -[PUINumberingSystem type](v5, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUINumberingSystem type](self, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_11;
    -[PUINumberingSystem localizedDisplayName](v5, "localizedDisplayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUINumberingSystem localizedDisplayName](self, "localizedDisplayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if (v15)
    {
      -[PUINumberingSystem locale](v5, "locale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUINumberingSystem locale](self, "locale");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

    }
    else
    {
LABEL_11:
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_type, CFSTR("type"));
  objc_msgSend(v3, "appendString:withName:", self->_localizedDisplayName, CFSTR("localizedDisplayName"));
  v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_image != 0, CFSTR("hasImage"), 0);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_locale, CFSTR("locale"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PUINumberingSystem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PUINumberingSystem *v7;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("_type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PUINumberingSystem initWithNumberingSystemType:](self, "initWithNumberingSystemType:", v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_type, CFSTR("_type"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)type
{
  return self->_type;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
