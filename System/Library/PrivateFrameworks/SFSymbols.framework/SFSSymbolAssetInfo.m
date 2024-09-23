@implementation SFSSymbolAssetInfo

+ (id)infoForName:(id)a3 allowsPrivate:(BOOL)a4 locale:(id)a5
{
  return +[SFSSymbolAssetInfo localeAgnosticInfo:allowsPrivate:](SFSSymbolAssetInfo, "localeAgnosticInfo:allowsPrivate:", a3, a4, a5);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bundle, 0);
  objc_storeStrong((id *)&self->name, 0);
}

+ (id)localeAgnosticInfo:(id)a3 allowsPrivate:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v4 = a4;
  v5 = a3;
  if (localeAgnosticInfo_allowsPrivate__once != -1)
    dispatch_once(&localeAgnosticInfo_allowsPrivate__once, &__block_literal_global_0);
  objc_msgSend((id)localeAgnosticInfo_allowsPrivate___ResolvedCoreGlyphsNameToBundleType, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[؋ objectForKeyedSubscript:](&unk_24E592C10, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)localeAgnosticInfo_allowsPrivate___ResolvedCoreGlyphsNameToBundleType, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v7 = v10;
      SFSResolveNameAndStatus(v9, v10, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4)
      {
        +[؋ objectForKeyedSubscript:](&unk_24E592C60, "objectForKeyedSubscript:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)localeAgnosticInfo_allowsPrivate___ResolvedCoreGlyphsNameToBundleType, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v7 = v12;
          SFSResolveNameAndStatus(v11, v12, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[؋ objectForKeyedSubscript:](&unk_24E592C88, "objectForKeyedSubscript:", v5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)localeAgnosticInfo_allowsPrivate___ResolvedCoreGlyphsNameToBundleType, "objectForKeyedSubscript:", v14);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
              +[SFSSymbolAssetInfo localeAgnosticInfo:allowsPrivate:].cold.1((uint64_t)v5, (uint64_t)v14);
            SFSResolveNameAndStatus(v14, v7, 1);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {

            v8 = 0;
          }
        }
        goto LABEL_12;
      }
      v7 = 0;
      v8 = 0;
    }
    v11 = v9;
LABEL_12:

    goto LABEL_13;
  }
  v7 = v6;
  SFSResolveNameAndStatus(v5, v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v8;
}

- (SFSSymbolAssetInfo)initWithName:(id)a3 bundle:(id)a4 andType:(int64_t)a5
{
  NSString *v8;
  NSBundle *v9;
  SFSSymbolAssetInfo *v10;
  NSString *name;
  NSString *v12;
  NSBundle *bundle;
  objc_super v15;

  v8 = (NSString *)a3;
  v9 = (NSBundle *)a4;
  v15.receiver = self;
  v15.super_class = (Class)SFSSymbolAssetInfo;
  v10 = -[SFSSymbolAssetInfo init](&v15, sel_init);
  name = v10->name;
  v10->name = v8;
  v12 = v8;

  bundle = v10->bundle;
  v10->bundle = v9;

  v10->bundleType = a5;
  return v10;
}

void __55__SFSSymbolAssetInfo_localeAgnosticInfo_allowsPrivate___block_invoke()
{
  objc_storeStrong((id *)&localeAgnosticInfo_allowsPrivate___ResolvedCoreGlyphsNameToBundleType, &unk_24E592C38);
}

+ (id)localeSpecificInfo:(id)a3 locale:(id)a4
{
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24E58E138, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "integerValue");
    objc_msgSend(&unk_24E592BE8, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    switch(v10)
    {
      case 0:
        goto LABEL_10;
      case 1:
        goto LABEL_13;
      case 2:
        resolveNumeralForLocale(v11, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_15;
        goto LABEL_14;
      case 3:
        resolveLanguageForLocale(v11, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_10;
        goto LABEL_14;
      case 4:
        resolveNumeralForLocale(v11, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_14;
LABEL_10:
        resolveDirectionForLocale(v12, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_15;
        goto LABEL_14;
      case 5:
        resolveNumeralForLocale(v11, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_14;
LABEL_13:
        resolveLanguageForLocale(v12, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
LABEL_14:
          v14 = (void *)v5[1];
          v5[1] = v13;
          v15 = v13;

        }
LABEL_15:

        break;
      default:
        goto LABEL_15;
    }
  }

  return v5;
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)bundleType
{
  return self->bundleType;
}

+ (void)localeAgnosticInfo:(uint64_t)a1 allowsPrivate:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_fault_impl(&dword_21FCB6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Client requested a temporary SFSymbol alias '%@' and should migrate to the latest name '%@'", (uint8_t *)&v2, 0x16u);
}

@end
