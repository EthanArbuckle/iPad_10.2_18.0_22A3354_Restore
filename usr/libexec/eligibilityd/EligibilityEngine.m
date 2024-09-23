@implementation EligibilityEngine

- (EligibilityEngine)init
{
  EligibilityEngine *v2;
  EligibilityEngine *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  NSDictionary *v10;
  NSDictionary *domains;
  EligibilityOverride *v12;
  id v13;
  id v14;
  NSObject *v15;
  EligibilityOverride *eligibilityOverrides;
  EligibilityOverride *v17;
  NSMutableSet *v18;
  NSMutableSet *notificationsToSend;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *internalQueue;
  void *v24;
  id v26;
  id v27;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;

  v28.receiver = self;
  v28.super_class = (Class)EligibilityEngine;
  v2 = -[EligibilityEngine init](&v28, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine _createDefaultDomains](v2, "_createDefaultDomains"));
    v5 = objc_msgSend(v4, "mutableCopy");

    v27 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine _loadDomainsWithError:](v3, "_loadDomainsWithError:", &v27));
    v7 = v27;
    if (v6)
    {
      objc_msgSend(v5, "addEntriesFromDictionary:", v6);
    }
    else
    {
      v8 = sub_10000C5FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[EligibilityEngine init]";
        v31 = 2112;
        v32 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Unable to load serialized domains, initing with empty values: %@", buf, 0x16u);
      }

      v7 = 0;
    }
    v10 = (NSDictionary *)objc_msgSend(v5, "copy");
    domains = v3->_domains;
    v3->_domains = v10;

    v26 = v7;
    v12 = (EligibilityOverride *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine _loadOverridesWithError:](v3, "_loadOverridesWithError:", &v26));
    v13 = v26;

    if (!v12)
    {
      v14 = sub_10000C5FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[EligibilityEngine init]";
        v31 = 2112;
        v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Unable to load serialized overrides, initing with no overrides: %@", buf, 0x16u);
      }

      v12 = objc_opt_new(EligibilityOverride);
    }
    eligibilityOverrides = v3->_eligibilityOverrides;
    v3->_eligibilityOverrides = v12;
    v17 = v12;

    v18 = objc_opt_new(NSMutableSet);
    notificationsToSend = v3->_notificationsToSend;
    v3->_notificationsToSend = v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = dispatch_queue_create("com.apple.eligibility.EligibilityEngine.internal", v21);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v24, "addObserver:selector:name:object:", v3, "_currentLocaleDidChange:", NSCurrentLocaleDidChangeNotification, 0);

  }
  return v3;
}

- (id)_createDefaultDomains
{
  TitaniumDomain *v2;
  VanadiumDomain *v3;
  ChromiumDomain *v4;
  ManganeseDomain *v5;
  IronDomain *v6;
  CobaltDomain *v7;
  NickelDomain *v8;
  CopperDomain *v9;
  ZincDomain *v10;
  KryptonDomain *v11;
  void *v12;
  id v13;
  TestDomain *v14;
  id v15;
  ScandiumDomain *v17;
  CalciumDomain *v18;
  PotassiumDomain *v19;
  ArgonDomain *v20;
  ChlorineDomain *v21;
  void *v22;
  SulfurDomain *v23;
  PhosphorusDomain *v24;
  SiliconDomain *v25;
  AluminumDomain *v26;
  MagnesiumDomain *v27;
  SodiumDomain *v28;
  NeonDomain *v29;
  FluorineDomain *v30;
  OxygenDomain *v31;
  NitrogenDomain *v32;
  CarbonDomain *v33;
  BoronDomain *v34;
  BerylliumDomain *v35;
  LithiumDomain *v36;
  HeliumDomain *v37;
  HydrogenDomain *v38;
  SwiftAssistDomain *v39;
  SearchMarketplacesDomain *v40;
  XcodeLLMDomain *v41;
  GreymatterDomain *v42;
  PodcastsTranscriptsDomain *v43;
  LotXDomain *v44;
  _QWORD v45[37];
  _QWORD v46[37];

  v45[0] = CFSTR("OS_ELIGIBILITY_DOMAIN_LOTX");
  v44 = objc_opt_new(LotXDomain);
  v46[0] = v44;
  v45[1] = CFSTR("OS_ELIGIBILITY_DOMAIN_PODCASTS_TRANSCRIPTS");
  v43 = objc_opt_new(PodcastsTranscriptsDomain);
  v46[1] = v43;
  v45[2] = CFSTR("OS_ELIGIBILITY_DOMAIN_GREYMATTER");
  v42 = objc_opt_new(GreymatterDomain);
  v46[2] = v42;
  v45[3] = CFSTR("OS_ELIGIBILITY_DOMAIN_XCODE_LLM");
  v41 = objc_opt_new(XcodeLLMDomain);
  v46[3] = v41;
  v45[4] = CFSTR("OS_ELIGIBILITY_DOMAIN_SEARCH_MARKETPLACES");
  v40 = objc_opt_new(SearchMarketplacesDomain);
  v46[4] = v40;
  v45[5] = CFSTR("OS_ELIGIBILITY_DOMAIN_SWIFT_ASSIST");
  v39 = objc_opt_new(SwiftAssistDomain);
  v46[5] = v39;
  v45[6] = CFSTR("OS_ELIGIBILITY_DOMAIN_HYDROGEN");
  v38 = objc_opt_new(HydrogenDomain);
  v46[6] = v38;
  v45[7] = CFSTR("OS_ELIGIBILITY_DOMAIN_HELIUM");
  v37 = objc_opt_new(HeliumDomain);
  v46[7] = v37;
  v45[8] = CFSTR("OS_ELIGIBILITY_DOMAIN_LITHIUM");
  v36 = objc_opt_new(LithiumDomain);
  v46[8] = v36;
  v45[9] = CFSTR("OS_ELIGIBILITY_DOMAIN_BERYLLIUM");
  v35 = objc_opt_new(BerylliumDomain);
  v46[9] = v35;
  v45[10] = CFSTR("OS_ELIGIBILITY_DOMAIN_BORON");
  v34 = objc_opt_new(BoronDomain);
  v46[10] = v34;
  v45[11] = CFSTR("OS_ELIGIBILITY_DOMAIN_CARBON");
  v33 = objc_opt_new(CarbonDomain);
  v46[11] = v33;
  v45[12] = CFSTR("OS_ELIGIBILITY_DOMAIN_NITROGEN");
  v32 = objc_opt_new(NitrogenDomain);
  v46[12] = v32;
  v45[13] = CFSTR("OS_ELIGIBILITY_DOMAIN_OXYGEN");
  v31 = objc_opt_new(OxygenDomain);
  v46[13] = v31;
  v45[14] = CFSTR("OS_ELIGIBILITY_DOMAIN_FLUORINE");
  v30 = objc_opt_new(FluorineDomain);
  v46[14] = v30;
  v45[15] = CFSTR("OS_ELIGIBILITY_DOMAIN_NEON");
  v29 = objc_opt_new(NeonDomain);
  v46[15] = v29;
  v45[16] = CFSTR("OS_ELIGIBILITY_DOMAIN_SODIUM");
  v28 = objc_opt_new(SodiumDomain);
  v46[16] = v28;
  v45[17] = CFSTR("OS_ELIGIBILITY_DOMAIN_MAGNESIUM");
  v27 = objc_opt_new(MagnesiumDomain);
  v46[17] = v27;
  v45[18] = CFSTR("OS_ELIGIBILITY_DOMAIN_ALUMINUM");
  v26 = objc_opt_new(AluminumDomain);
  v46[18] = v26;
  v45[19] = CFSTR("OS_ELIGIBILITY_DOMAIN_SILICON");
  v25 = objc_opt_new(SiliconDomain);
  v46[19] = v25;
  v45[20] = CFSTR("OS_ELIGIBILITY_DOMAIN_PHOSPHORUS");
  v24 = objc_opt_new(PhosphorusDomain);
  v46[20] = v24;
  v45[21] = CFSTR("OS_ELIGIBILITY_DOMAIN_SULFUR");
  v23 = objc_opt_new(SulfurDomain);
  v46[21] = v23;
  v45[22] = CFSTR("OS_ELIGIBILITY_DOMAIN_CHLORINE");
  v21 = objc_opt_new(ChlorineDomain);
  v46[22] = v21;
  v45[23] = CFSTR("OS_ELIGIBILITY_DOMAIN_ARGON");
  v20 = objc_opt_new(ArgonDomain);
  v46[23] = v20;
  v45[24] = CFSTR("OS_ELIGIBILITY_DOMAIN_POTASSIUM");
  v19 = objc_opt_new(PotassiumDomain);
  v46[24] = v19;
  v45[25] = CFSTR("OS_ELIGIBILITY_DOMAIN_CALCIUM");
  v18 = objc_opt_new(CalciumDomain);
  v46[25] = v18;
  v45[26] = CFSTR("OS_ELIGIBILITY_DOMAIN_SCANDIUM");
  v17 = objc_opt_new(ScandiumDomain);
  v46[26] = v17;
  v45[27] = CFSTR("OS_ELIGIBILITY_DOMAIN_TITANIUM");
  v2 = objc_opt_new(TitaniumDomain);
  v46[27] = v2;
  v45[28] = CFSTR("OS_ELIGIBILITY_DOMAIN_VANADIUM");
  v3 = objc_opt_new(VanadiumDomain);
  v46[28] = v3;
  v45[29] = CFSTR("OS_ELIGIBILITY_DOMAIN_CHROMIUM");
  v4 = objc_opt_new(ChromiumDomain);
  v46[29] = v4;
  v45[30] = CFSTR("OS_ELIGIBILITY_DOMAIN_MANGANESE");
  v5 = objc_opt_new(ManganeseDomain);
  v46[30] = v5;
  v45[31] = CFSTR("OS_ELIGIBILITY_DOMAIN_IRON");
  v6 = objc_opt_new(IronDomain);
  v46[31] = v6;
  v45[32] = CFSTR("OS_ELIGIBILITY_DOMAIN_COBALT");
  v7 = objc_opt_new(CobaltDomain);
  v46[32] = v7;
  v45[33] = CFSTR("OS_ELIGIBILITY_DOMAIN_NICKEL");
  v8 = objc_opt_new(NickelDomain);
  v46[33] = v8;
  v45[34] = CFSTR("OS_ELIGIBILITY_DOMAIN_COPPER");
  v9 = objc_opt_new(CopperDomain);
  v46[34] = v9;
  v45[35] = CFSTR("OS_ELIGIBILITY_DOMAIN_ZINC");
  v10 = objc_opt_new(ZincDomain);
  v46[35] = v10;
  v45[36] = CFSTR("OS_ELIGIBILITY_DOMAIN_KRYPTON");
  v11 = objc_opt_new(KryptonDomain);
  v46[36] = v11;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 37));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](GlobalConfiguration, "sharedInstance"));
  LOBYTE(v5) = objc_msgSend(v12, "hasInternalContent");

  if ((v5 & 1) != 0)
  {
    v13 = objc_msgSend(v22, "mutableCopy");
    v14 = objc_opt_new(TestDomain);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("OS_ELIGIBILITY_DOMAIN_TEST"));

    v15 = objc_msgSend(v13, "copy");
  }
  else
  {
    v15 = v22;
  }

  return v15;
}

- (id)_decodeObjectOfClasses:(id)a3 atURL:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  NSObject *v33;
  __int16 v34;
  NSObject *v35;

  v7 = a3;
  v8 = a4;
  v29 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v8, 3, &v29));
  v10 = v29;
  v11 = v10;
  if (!v9)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v10, "domain"));
    if (objc_msgSend(v16, "isEqualToString:", NSCocoaErrorDomain))
    {
      v17 = -[NSObject code](v11, "code");

      if (v17 == (id)260)
      {
        v18 = sub_10000C5FC();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
          *(_DWORD *)buf = 136315650;
          v31 = "-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]";
          v32 = 2112;
          v33 = v20;
          v34 = 2112;
          v35 = v11;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: URL %@ doesn't exist yet: %@", buf, 0x20u);
LABEL_23:

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else
    {

    }
    v22 = sub_10000C5FC();
    v19 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
      *(_DWORD *)buf = 136315650;
      v31 = "-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]";
      v32 = 2112;
      v33 = v20;
      v34 = 2112;
      v35 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Failed to deserialize data in %@: %@", buf, 0x20u);
      goto LABEL_23;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_18;
  }
  v28 = v10;
  v12 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v9, &v28);
  v13 = v28;

  if (v12)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "decodeObjectOfClasses:forKey:", v7, NSKeyedArchiveRootObjectKey));
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v12, "finishDecoding");
      goto LABEL_21;
    }
    v23 = sub_10000C5FC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "error"));
      *(_DWORD *)buf = 136315650;
      v31 = "-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]";
      v32 = 2112;
      v33 = v26;
      v34 = 2112;
      v35 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: Failed to decode data at %@ : %@", buf, 0x20u);

    }
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "error"));
    v19 = v13;
  }
  else
  {
    v21 = sub_10000C5FC();
    v19 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]";
      v32 = 2112;
      v33 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Failed to create unarchiver: %@", buf, 0x16u);
    }
    v12 = 0;
    v11 = v13;
  }
LABEL_18:

  if (a5)
  {
    v13 = objc_retainAutorelease(v11);
    v15 = 0;
    *a5 = v13;
  }
  else
  {
    v15 = 0;
    v13 = v11;
  }
LABEL_21:

  return v15;
}

- (id)_loadOverridesWithError:(id *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSSet *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;

  v18 = 0;
  v5 = sub_100018710(&v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v18;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Caches/NeverRestore/eligibility_overrides.data"), 0));
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(EligibilityOverride), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v17 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:](self, "_decodeObjectOfClasses:atURL:withError:", v10, v8, &v17));
    v12 = v17;

    if (v11)
    {
      v7 = v12;
      goto LABEL_13;
    }
    v15 = sub_10000C5FC();
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[EligibilityEngine _loadOverridesWithError:]";
      v21 = 2112;
      v22 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Failed to decode eligibility overrides: %@", buf, 0x16u);
    }
    v7 = v12;
  }
  else
  {
    v13 = sub_10000C5FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[EligibilityEngine _loadOverridesWithError:]";
      v21 = 2112;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Failed to obtain the URL for our data container: %@", buf, 0x16u);
    }
    v8 = 0;
  }

  if (a3)
  {
    v7 = objc_retainAutorelease(v7);
    v11 = 0;
    *a3 = v7;
  }
  else
  {
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (id)_loadDomainsWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSSet *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v21;
  char *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;

  v5 = objc_opt_class(NSDictionary);
  v6 = objc_opt_class(EligibilityDomain);
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, objc_opt_class(NSString), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v22 = 0;
  if (asprintf(&v22, "%s%s", "/", "/private/var/db/eligibilityd/domains.data") == -1)
  {
    v9 = sub_10000C5FC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "copy_eligibility_domain_domains_serialization_path";
      v25 = 2080;
      v26 = "/private/var/db/eligibilityd/domains.data";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  v10 = v22;
  if (!v22)
  {
    v16 = sub_10000C5FC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[EligibilityEngine _loadDomainsWithError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Failed to copy domains serialization path", buf, 0xCu);
    }

    v12 = 0;
    v11 = 0;
    v14 = 0;
    goto LABEL_13;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v22));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v11, 0));
  v21 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:](self, "_decodeObjectOfClasses:atURL:withError:", v8, v12, &v21));
  v14 = (char *)v21;
  if (!v13)
  {
    v18 = sub_10000C5FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[EligibilityEngine _loadDomainsWithError:]";
      v25 = 2112;
      v26 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Failed to decode domains: %@", buf, 0x16u);
    }

LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v15 = v13;
LABEL_14:
  free(v10);
  if (a3 && !v15)
    *a3 = objc_retainAutorelease(v14);

  return v15;
}

- (BOOL)_onQueue_saveDomainsWithError:(id *)a3
{
  NSObject *v5;
  unsigned int v6;
  id v7;
  id v8;
  unsigned int v9;
  id v10;
  unsigned int v11;
  BOOL v12;
  id v14;
  id v15;
  id v16;

  v5 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  v16 = 0;
  v6 = -[EligibilityEngine _onQueue_serializeInternalDomainStateToDiskWithError:](self, "_onQueue_serializeInternalDomainStateToDiskWithError:", &v16);
  v7 = v16;
  v8 = v7;
  if (v6)
  {
    v15 = v7;
    v9 = -[EligibilityEngine _onQueue_saveDomainAnswerOutputsWithError:](self, "_onQueue_saveDomainAnswerOutputsWithError:", &v15);
    v10 = v15;

    if (v9)
    {
      v14 = v10;
      v11 = -[EligibilityEngine _onQueue_serializeOverrideDataToDiskWithError:](self, "_onQueue_serializeOverrideDataToDiskWithError:", &v14);
      v8 = v14;

      if (v11)
      {
        -[EligibilityEngine _onQueue_notifySADSupportFramework](self, "_onQueue_notifySADSupportFramework");
        v12 = 1;
        goto LABEL_9;
      }
    }
    else
    {
      v8 = v10;
    }
  }
  if (a3)
  {
    v8 = objc_retainAutorelease(v8);
    v12 = 0;
    *a3 = v8;
  }
  else
  {
    v12 = 0;
  }
LABEL_9:

  return v12;
}

- (BOOL)_serializeObject:(id)a3 toURL:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v9, "encodeObject:forKey:", v7, NSKeyedArchiveRootObjectKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "encodedData"));

  v18 = 0;
  v11 = objc_msgSend(v10, "writeToURL:options:error:", v8, 268435457, &v18);
  v12 = v18;
  if ((v11 & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    v14 = sub_10000C5FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
      *(_DWORD *)buf = 136315906;
      v20 = "-[EligibilityEngine _serializeObject:toURL:withError:]";
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Failed to write data %@ to disk at %@: %@", buf, 0x2Au);

    }
    if (a5)
    {
      v12 = objc_retainAutorelease(v12);
      v13 = 0;
      *a5 = v12;
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (BOOL)_onQueue_serializeOverrideDataToDiskWithError:(id *)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  id v16;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;

  v5 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  v19 = 0;
  v6 = sub_100018710(&v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v19;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Caches/NeverRestore/eligibility_overrides.data"), 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine eligibilityOverrides](self, "eligibilityOverrides"));
    v18 = v8;
    v11 = -[EligibilityEngine _serializeObject:toURL:withError:](self, "_serializeObject:toURL:withError:", v10, v9, &v18);
    v12 = v18;

    if ((v11 & 1) != 0)
    {
      v13 = 1;
      goto LABEL_13;
    }
    v16 = sub_10000C5FC();
    v15 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[EligibilityEngine _onQueue_serializeOverrideDataToDiskWithError:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Failed to write eligibility overrides data to disk: %@", buf, 0x16u);
    }
    v8 = v12;
  }
  else
  {
    v14 = sub_10000C5FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[EligibilityEngine _onQueue_serializeOverrideDataToDiskWithError:]";
      v22 = 2112;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Failed to obtain the URL for our data container: %@", buf, 0x16u);
    }
    v9 = 0;
  }

  if (a3)
  {
    v12 = objc_retainAutorelease(v8);
    v13 = 0;
    *a3 = v12;
  }
  else
  {
    v13 = 0;
    v12 = v8;
  }
LABEL_13:

  return v13;
}

- (BOOL)_onQueue_serializeInternalDomainStateToDiskWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  char *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  id v16;
  id v18;
  char *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;

  v5 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  v19 = 0;
  if (asprintf(&v19, "%s%s", "/", "/private/var/db/eligibilityd/domains.data") == -1)
  {
    v6 = sub_10000C5FC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "copy_eligibility_domain_domains_serialization_path";
      v22 = 2080;
      v23 = "/private/var/db/eligibilityd/domains.data";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  v7 = v19;
  if (v19)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v19));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v8, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine domains](self, "domains"));
    v18 = 0;
    v11 = -[EligibilityEngine _serializeObject:toURL:withError:](self, "_serializeObject:toURL:withError:", v10, v9, &v18);
    v12 = (char *)v18;

    if (v11)
    {
      free(v7);
      v13 = 1;
      goto LABEL_15;
    }
    v16 = sub_10000C5FC();
    v15 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[EligibilityEngine _onQueue_serializeInternalDomainStateToDiskWithError:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Failed to write domain data to disk: %@", buf, 0x16u);
    }
  }
  else
  {
    v14 = sub_10000C5FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[EligibilityEngine _onQueue_serializeInternalDomainStateToDiskWithError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Failed to copy domains serialization path", buf, 0xCu);
    }
    v9 = 0;
    v8 = 0;
    v12 = 0;
  }

  free(v7);
  if (a3)
  {
    v12 = objc_retainAutorelease(v12);
    v13 = 0;
    *a3 = v12;
  }
  else
  {
    v13 = 0;
  }
LABEL_15:

  return v13;
}

- (void)_onQueue_notifySADSupportFramework
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  NSMutableDictionary *v6;
  void *v7;
  id v8;
  NSMutableDictionary *v9;
  _QWORD v10[5];
  NSMutableDictionary *v11;
  uint64_t v12;
  uint64_t v13;

  if (&_SADSEligiblilityDidChange)
  {
    v12 = v2;
    v13 = v3;
    v5 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
    dispatch_assert_queue_V2(v5);

    v6 = objc_opt_new(NSMutableDictionary);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine domains](self, "domains"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001E0D0;
    v10[3] = &unk_100030E30;
    v10[4] = self;
    v11 = v6;
    v9 = v6;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

    v8 = -[NSMutableDictionary copy](v9, "copy");
    SADSEligiblilityDidChange();

  }
}

- (id)_onQueue_finalEligibilityDictionaryForDomain:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine eligibilityOverrides](self, "eligibilityOverrides"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "overrideResultDictionaryForDomain:", objc_msgSend(v4, "domain")));

  if (v7)
    v8 = v7;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialize"));
  v9 = v8;

  return v9;
}

- (id)_onQueue_urlToDomainData
{
  NSObject *v3;
  NSMutableDictionary *v4;
  void *v5;
  NSMutableDictionary *v6;
  id v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  NSMutableDictionary *v13;
  EligibilityEngine *v14;

  v3 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine domains](self, "domains"));
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10001DE40;
  v12 = &unk_100030E30;
  v13 = v4;
  v14 = self;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v9);

  v7 = -[NSMutableDictionary copy](v6, "copy", v9, v10, v11, v12);
  return v7;
}

- (BOOL)_onQueue_saveDomainAnswerOutputsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10001CFF8;
  v18 = sub_10001D008;
  v19 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine _onQueue_urlToDomainData](self, "_onQueue_urlToDomainData"));
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001DCB0;
  v9[3] = &unk_100030E58;
  v9[4] = &v14;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = *((unsigned __int8 *)v11 + 24);
  if (a3 && !*((_BYTE *)v11 + 24))
    *a3 = objc_retainAutorelease((id)v15[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v14, 8);
  return v7 != 0;
}

- (BOOL)_sendNotification:(id)a3
{
  const char *v3;
  uint32_t v4;
  id v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint32_t v13;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = notify_post(v3);
  if (v4)
  {
    v5 = sub_10000C5FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315650;
      v9 = "-[EligibilityEngine _sendNotification:]";
      v10 = 2080;
      v11 = v3;
      v12 = 1024;
      v13 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Could not post domain change notification \"%s\": %u", (uint8_t *)&v8, 0x1Cu);
    }

  }
  return v4 == 0;
}

- (void)_onQueue_sendNotifications
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine notificationsToSend](self, "notificationsToSend"));
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v4, "addObject:", CFSTR("com.apple.os-eligibility-domain.change"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (-[EligibilityEngine _sendNotification:](self, "_sendNotification:", v10))
          objc_msgSend(v4, "removeObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)recomputeAllDomainAnswers
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DCA8;
  block[3] = &unk_100030E80;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)_onQueue_recomputeAllDomainAnswers
{
  NSObject *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;

  v3 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine domains](self, "domains"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001DB48;
  v10[3] = &unk_100030EA8;
  v10[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

  v9 = 0;
  v5 = -[EligibilityEngine _onQueue_saveDomainsWithError:](self, "_onQueue_saveDomainsWithError:", &v9);
  v6 = v9;
  if ((v5 & 1) != 0)
  {
    -[EligibilityEngine _onQueue_sendNotifications](self, "_onQueue_sendNotifications");
  }
  else
  {
    v7 = sub_10000C5FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[EligibilityEngine _onQueue_recomputeAllDomainAnswers]";
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Failed to save domains to disk: %@", buf, 0x16u);
    }

  }
}

- (BOOL)setInput:(unint64_t)a3 to:(id)a4 status:(unint64_t)a5 fromProcess:(id)a6 withError:(id *)a7
{
  id v12;
  id v13;
  LocatedCountryInput *v14;
  id v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  LocatedCountryInput *v20;
  void *v21;
  LocatedCountryInput *v22;
  id v23;
  BOOL v24;
  id v25;
  _QWORD v27[4];
  LocatedCountryInput *v28;
  EligibilityEngine *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  unint64_t v33;

  v12 = a4;
  v13 = a6;
  switch(a3)
  {
    case 1uLL:
      v14 = -[LocatedCountryInput initWithCountryCodes:status:process:]([LocatedCountryInput alloc], "initWithCountryCodes:status:process:", v12, a5, v13);
      goto LABEL_8;
    case 2uLL:
      v14 = -[CountryBillingInput initWithBillingCountry:status:process:]([CountryBillingInput alloc], "initWithBillingCountry:status:process:", v12, a5, v13);
      goto LABEL_8;
    case 4uLL:
      v14 = -[DeviceLocaleInput initWithDeviceLocale:status:process:]([DeviceLocaleInput alloc], "initWithDeviceLocale:status:process:", v12, a5, v13);
      goto LABEL_8;
    case 9uLL:
      v14 = -[GreymatterQueueInput initOnQueue:status:process:]([GreymatterQueueInput alloc], "initOnQueue:status:process:", v12, a5, v13);
LABEL_8:
      v20 = v14;
      if (v14)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10001DA3C;
        v27[3] = &unk_100030ED0;
        v28 = v20;
        v29 = self;
        v22 = v20;
        sub_1000159C8(v21, v27);

        v23 = 0;
        v24 = 1;
      }
      else
      {
        v25 = sub_10000C5FC();
        v16 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v31 = "-[EligibilityEngine setInput:to:status:fromProcess:withError:]";
          v17 = "%s: Failed to initalize input type";
          v18 = v16;
          v19 = 12;
LABEL_16:
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
        }
LABEL_11:

        v23 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
        if (a7)
        {
          v23 = objc_retainAutorelease(v23);
          v24 = 0;
          *a7 = v23;
        }
        else
        {
          v24 = 0;
        }
      }

      return v24;
    default:
      v15 = sub_10000C5FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 136315394;
      v31 = "-[EligibilityEngine setInput:to:status:fromProcess:withError:]";
      v32 = 2048;
      v33 = a3;
      v17 = "%s: Unsupported eligibility input type %llu";
      v18 = v16;
      v19 = 22;
      goto LABEL_16;
  }
}

- (BOOL)resetDomain:(unint64_t)a3 withError:(id *)a4
{
  const char *v7;
  const char *v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  _QWORD block[9];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_10001CFF8;
  v23 = sub_10001D008;
  v24 = 0;
  v7 = sub_100005948(a3);
  if (a3 && (v8 = v7) != 0)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v9 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D7C0;
    block[3] = &unk_100030EF8;
    block[7] = v8;
    block[8] = a3;
    block[4] = self;
    block[5] = &v19;
    block[6] = &v15;
    dispatch_sync(v9, block);

    v10 = *((_BYTE *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
    if (!a4)
      goto LABEL_8;
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    v12 = (void *)v20[5];
    v20[5] = v11;

    v10 = 0;
    if (!a4)
      goto LABEL_8;
  }
  if (!v10)
    *a4 = objc_retainAutorelease((id)v20[5]);
LABEL_8:
  _Block_object_dispose(&v19, 8);

  return v10;
}

- (BOOL)resetAllDomainsWithError:(id *)a3
{
  NSObject *v5;
  int v6;
  BOOL v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10001CFF8;
  v14 = sub_10001D008;
  v15 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D588;
  block[3] = &unk_100030F20;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v16;
  dispatch_sync(v5, block);

  v6 = *((unsigned __int8 *)v17 + 24);
  if (a3 && !*((_BYTE *)v17 + 24))
  {
    *a3 = objc_retainAutorelease((id)v11[5]);
    v6 = *((unsigned __int8 *)v17 + 24);
  }
  v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (BOOL)forceDomainAnswer:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5 withError:(id *)a6
{
  id v10;
  const char *v11;
  const char *v12;
  xpc_type_t type;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  NSObject *v23;
  const char *name;
  _QWORD block[5];
  id v27;
  uint64_t *v28;
  _BYTE *v29;
  const char *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE buf[24];
  char v40;

  v10 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_10001CFF8;
  v37 = sub_10001D008;
  v38 = 0;
  v11 = sub_100005948(a3);
  if (!a3 || (v12 = v11) == 0)
  {
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    v19 = (void *)v34[5];
    v34[5] = v18;

    goto LABEL_9;
  }
  if (!v10)
  {
    v22 = 0;
    goto LABEL_13;
  }
  type = xpc_get_type(v10);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v22 = (void *)_CFXPCCreateCFObjectFromXPCObject(v10);
LABEL_13:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v40 = 0;
    v23 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D324;
    block[3] = &unk_100030F48;
    v30 = v12;
    v31 = a3;
    block[4] = self;
    v28 = &v33;
    v32 = a4;
    v21 = v22;
    v27 = v21;
    v29 = buf;
    dispatch_sync(v23, block);

    v20 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
    if (!a6)
      goto LABEL_16;
    goto LABEL_14;
  }
  v14 = sub_10000C5FC();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    name = xpc_type_get_name(type);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[EligibilityEngine forceDomainAnswer:answer:context:withError:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = name;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Expected context to be a dictionary but instead was a %s", buf, 0x16u);
  }

  v16 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
  v17 = (void *)v34[5];
  v34[5] = v16;

LABEL_9:
  v20 = 0;
  v21 = 0;
  if (!a6)
    goto LABEL_16;
LABEL_14:
  if (!v20)
    *a6 = objc_retainAutorelease((id)v34[5]);
LABEL_16:

  _Block_object_dispose(&v33, 8);
  return v20;
}

- (BOOL)forceDomainSetAnswers:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5 withError:(id *)a6
{
  id v10;
  void *v11;
  xpc_type_t type;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  NSObject *v20;
  const char *name;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  _BYTE *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE buf[24];
  char v36;

  v10 = a5;
  v11 = v10;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_10001CFF8;
  v33 = sub_10001D008;
  v34 = 0;
  if (!v10)
  {
    v19 = 0;
    goto LABEL_9;
  }
  type = xpc_get_type(v10);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v19 = (void *)_CFXPCCreateCFObjectFromXPCObject(v11);
LABEL_9:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v36 = 0;
    v20 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001D010;
    v23[3] = &unk_100030F70;
    v23[4] = self;
    v27 = a3;
    v28 = a4;
    v18 = v19;
    v24 = v18;
    v25 = &v29;
    v26 = buf;
    dispatch_sync(v20, v23);

    v17 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
    if (!a6)
      goto LABEL_12;
    goto LABEL_10;
  }
  v13 = sub_10000C5FC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    name = xpc_type_get_name(type);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[EligibilityEngine forceDomainSetAnswers:answer:context:withError:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = name;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Expected context to be a dictionary but instead was a %s", buf, 0x16u);
  }

  v15 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
  v16 = (void *)v30[5];
  v30[5] = v15;

  v17 = 0;
  v18 = 0;
  if (a6)
  {
LABEL_10:
    if (!v17)
      *a6 = objc_retainAutorelease((id)v30[5]);
  }
LABEL_12:

  _Block_object_dispose(&v29, 8);
  return v17;
}

- (id)internalStateWithError:(id *)a3
{
  NSMutableDictionary *v4;
  NSObject *v5;
  NSMutableDictionary *v6;
  id v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  NSMutableDictionary *v13;
  EligibilityEngine *v14;

  v4 = objc_opt_new(NSMutableDictionary);
  v5 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10001CE50;
  v12 = &unk_100030ED0;
  v13 = v4;
  v14 = self;
  v6 = v4;
  dispatch_sync(v5, &v9);

  v7 = -[NSMutableDictionary copy](v6, "copy", v9, v10, v11, v12);
  return v7;
}

- (id)stateDumpWithError:(id *)a3
{
  NSMutableDictionary *v4;
  NSObject *v5;
  NSMutableDictionary *v6;
  id v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  NSMutableDictionary *v13;
  EligibilityEngine *v14;

  v4 = objc_opt_new(NSMutableDictionary);
  v5 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10001CC40;
  v12 = &unk_100030ED0;
  v13 = v4;
  v14 = self;
  v6 = v4;
  dispatch_sync(v5, &v9);

  v7 = -[NSMutableDictionary copy](v6, "copy", v9, v10, v11, v12);
  return v7;
}

- (BOOL)dumpToDirectory:(id)a3 withError:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  id v15;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("state.plist"), 0));
  v18 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine stateDumpWithError:](self, "stateDumpWithError:", &v18));
  v8 = v18;
  v9 = v8;
  if (v7)
  {
    v17 = v8;
    v10 = objc_msgSend(v7, "writeToURL:error:", v6, &v17);
    v11 = v17;

    if ((v10 & 1) != 0)
    {
      v12 = 1;
      goto LABEL_12;
    }
    v15 = sub_10000C5FC();
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[EligibilityEngine dumpToDirectory:withError:]";
      v21 = 2112;
      v22 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Failed to save state dump to disk: %@", buf, 0x16u);
    }
    v9 = v11;
  }
  else
  {
    v13 = sub_10000C5FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[EligibilityEngine dumpToDirectory:withError:]";
      v21 = 2112;
      v22 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Failed to generate state dump: %@", buf, 0x16u);
    }
  }

  if (a4)
  {
    v11 = objc_retainAutorelease(v9);
    v12 = 0;
    *a4 = v11;
  }
  else
  {
    v12 = 0;
    v11 = v9;
  }
LABEL_12:

  return v12;
}

- (void)asyncUpdateAndRecomputeAllAnswers
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001CB34;
  v4[3] = &unk_100030E80;
  v4[4] = self;
  sub_1000159C8(v3, v4);

}

- (void)_onQueue_handleRecompute:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  id v15;
  NSObject *v16;
  id v17;
  unsigned __int8 v18;
  id v19;
  NSObject *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001CA68;
  v26[3] = &unk_100030F98;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v27 = v6;
  v28 = &v29;
  objc_msgSend(v4, "setExpirationHandler:", v26);
  v7 = sub_10000C5FC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[EligibilityEngine _onQueue_handleRecompute:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Refresh MobileAsset parameters", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](MobileAssetManager, "sharedInstance"));
  objc_msgSend(v9, "asyncRefetchMobileAsset");

  if (*((_BYTE *)v30 + 24))
    goto LABEL_18;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine domains](self, "domains"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v37, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "updateParameters");
        if (*((_BYTE *)v30 + 24))
        {

          goto LABEL_18;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v37, 16);
      if (v12)
        continue;
      break;
    }
  }

  v15 = sub_10000C5FC();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[EligibilityEngine _onQueue_handleRecompute:]";
    v35 = 2112;
    v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Recomputing eligiblity for %@", buf, 0x16u);
  }

  -[EligibilityEngine _onQueue_recomputeAllDomainAnswers](self, "_onQueue_recomputeAllDomainAnswers");
  if (*((_BYTE *)v30 + 24)
    || (-[EligibilityEngine _sendNotification:](self, "_sendNotification:", CFSTR("com.apple.os-eligibility-domain.input-needed")), *((_BYTE *)v30 + 24)))
  {
LABEL_18:
    v21 = 0;
    v18 = objc_msgSend(v4, "setTaskExpiredWithRetryAfter:error:", &v21, 0.0);
    v17 = v21;
    if ((v18 & 1) == 0)
    {
      v19 = sub_10000C5FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[EligibilityEngine _onQueue_handleRecompute:]";
        v35 = 2112;
        v36 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Failed to expire task with error: %@", buf, 0x16u);
      }

      objc_msgSend(v4, "setTaskCompleted");
    }
  }
  else
  {
    objc_msgSend(v4, "setTaskCompleted");
    v17 = 0;
  }

  _Block_object_dispose(&v29, 8);
}

- (void)scheduleDailyRecompute
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001CA5C;
  v5[3] = &unk_100030FC0;
  v5[4] = self;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.eligibility.recompute"), v4, v5);

}

- (NSDictionary)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
  objc_storeStrong((id *)&self->_domains, a3);
}

- (NSMutableSet)notificationsToSend
{
  return self->_notificationsToSend;
}

- (void)setNotificationsToSend:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsToSend, a3);
}

- (EligibilityOverride)eligibilityOverrides
{
  return self->_eligibilityOverrides;
}

- (void)setEligibilityOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_eligibilityOverrides, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_eligibilityOverrides, 0);
  objc_storeStrong((id *)&self->_notificationsToSend, 0);
  objc_storeStrong((id *)&self->_domains, 0);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E1E8;
  block[3] = &unk_100030E08;
  block[4] = a1;
  if (qword_10003F430 != -1)
    dispatch_once(&qword_10003F430, block);
  return (id)qword_10003F428;
}

@end
