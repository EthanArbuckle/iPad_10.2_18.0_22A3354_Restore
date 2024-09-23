@implementation PKPaymentSetupProduct

- (void)updateWithProductDictionary:(id)a3
{
  id v4;
  PKPaymentSetupProductConfiguration *v5;
  PKPaymentSetupProductConfiguration *configuration;
  NSString *v7;
  NSString *localizedDescription;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *displayName;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *primaryRegion;
  void *v19;
  NSSet *v20;
  NSSet *regions;
  PKPaymentSetupProductRegionData *v22;
  void *v23;
  PKPaymentSetupProductRegionData *v24;
  PKPaymentSetupProductRegionData *regionData;
  NSDictionary *v26;
  NSDictionary *rawDictionary;
  void *v28;
  NSURL *v29;
  NSURL *termsURL;
  void *v31;
  NSDictionary *v32;
  NSDictionary *readerModeMetadata;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSArray *requiredFields;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  PKPaymentSetupProductPaymentOption *v56;
  NSArray *v57;
  NSArray *paymentOptions;
  void *v59;
  NSObject *v60;
  NSArray *v61;
  NSArray *associatedStoreIdentifiers;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  __objc2_class *v70;
  PKPaymentProvisioningMethodTypeAppClip *v71;
  NSURL *v72;
  void *appClipLaunchURL;
  void *v74;
  NSArray *v75;
  void *v76;
  uint64_t v77;
  NSArray *v78;
  uint64_t v79;
  NSArray *supportedInAppTypes;
  NSArray *v81;
  void *v82;
  NSArray *v83;
  NSArray *v84;
  NSArray *v85;
  NSArray *v86;
  uint64_t v87;
  void *v88;
  NSArray *v89;
  NSArray *v90;
  NSURL *v91;
  NSURL *appLaunchURL;
  PKPaymentSetupProductImageAssetURLs *v93;
  void *v94;
  PKPaymentSetupProductImageAssetURLs *v95;
  PKPaymentSetupProductImageAssetURLs *imageAssetURLs;
  PKPaymentSetupProductImageAssets *v97;
  PKPaymentSetupProductImageAssets *imageAssets;
  uint64_t v99;
  void *v100;
  id v101;
  id v102;
  NSDictionary *v103;
  NSDictionary *minimumOSVersion;
  NSMutableDictionary *v105;
  NSMutableDictionary *requestedProvisioningMethods;
  NSArray *v107;
  NSArray *supportedTransitNetworkIdentifiers;
  id v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t k;
  PKDynamicProvisioningPageContent *v117;
  uint64_t v118;
  NSArray *onboardingItems;
  void *v120;
  uint64_t v121;
  NSString *regionIdentifier;
  uint64_t v123;
  NSDictionary *clientInfo;
  uint64_t v125;
  NSArray *searchTerms;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  id *location;
  NSObject *v133;
  PKPaymentSetupProduct *v134;
  id obj;
  id obja;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  uint8_t v156[128];
  _BYTE buf[24];
  void *v158;
  id v159;
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKPaymentSetupProductConfiguration initWithProductDictionary:]([PKPaymentSetupProductConfiguration alloc], "initWithProductDictionary:", v4);
  configuration = self->_configuration;
  self->_configuration = v5;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDescription"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedDescription = self->_localizedDescription;
  self->_localizedDescription = v7;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedProductName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDisplayName"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  displayName = self->_displayName;
  self->_displayName = v11;

  objc_msgSend(v4, "PKNumberForKey:", CFSTR("minimumSupportedAge"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("maximumSupportedAge"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v13;
  self->_minimumSupportedAge = objc_msgSend(v13, "integerValue");
  v129 = v14;
  self->_maximumSupportedAge = objc_msgSend(v14, "integerValue");
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("minimumTargetUserSupportedAge"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  self->_minimumTargetUserSupportedAge = objc_msgSend(v128, "integerValue");
  objc_msgSend(v4, "PKStringForKey:", CFSTR("region"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(","));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "firstObject");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    primaryRegion = self->_primaryRegion;
    self->_primaryRegion = v17;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v16);
    v20 = (NSSet *)objc_msgSend(v19, "copy");
    regions = self->_regions;
    self->_regions = v20;

  }
  v127 = v16;
  v22 = [PKPaymentSetupProductRegionData alloc];
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("regionData"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PKPaymentSetupProductRegionData initWithRegionDataDictionary:](v22, "initWithRegionDataDictionary:", v23);
  regionData = self->_regionData;
  self->_regionData = v24;

  v26 = (NSDictionary *)objc_msgSend(v4, "copy");
  rawDictionary = self->_rawDictionary;
  self->_rawDictionary = v26;

  objc_msgSend(v4, "PKURLForKey:", CFSTR("termsURL"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (NSURL *)objc_msgSend(v28, "copy");
  termsURL = self->_termsURL;
  self->_termsURL = v29;

  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("readerModeMetadata"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (NSDictionary *)objc_msgSend(v31, "copy");
  readerModeMetadata = self->_readerModeMetadata;
  self->_readerModeMetadata = v32;

  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("capabilities"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  self->_flags = PKPaymentProductFlagsFromArray(v34);

  objc_msgSend(v4, "PKStringForKey:", CFSTR("hsa2Requirement"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hsa2Requirement = PKPaymentSetupHSA2RequirementFromString(v35);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKArrayForKey:", CFSTR("requiredFields"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  v134 = self;
  v131 = v36;
  if (v38)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v40 = v4;
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredFields"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v156, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v150;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v150 != v43)
            objc_enumerationMutation(obj);
          v45 = *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * i);
          objc_msgSend(v40, "PKDictionaryForKey:", CFSTR("requiredFieldOptions"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "PKDictionaryForKey:", v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", v45, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "safelyAddObject:", v48);

        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v156, 16);
      }
      while (v42);
    }

    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v39);
    self = v134;
    requiredFields = v134->_requiredFields;
    v134->_requiredFields = (NSArray *)v49;

    v4 = v40;
    v36 = v131;
  }
  objc_msgSend(v4, "PKArrayForKey:", CFSTR("paymentOptions"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v145, v155, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v146;
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v146 != v54)
          objc_enumerationMutation(v51);
        v56 = -[PKPaymentSetupProductPaymentOption initWithPaymentOptionDictionary:]([PKPaymentSetupProductPaymentOption alloc], "initWithPaymentOptionDictionary:", *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * j));
        objc_msgSend(v36, "safelyAddObject:", v56);

      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v145, v155, 16);
    }
    while (v53);
  }
  objc_msgSend(v36, "sortUsingComparator:", &__block_literal_global_521);
  v57 = (NSArray *)objc_msgSend(v36, "copy");
  paymentOptions = self->_paymentOptions;
  self->_paymentOptions = v57;

  if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
  {
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("provisioningMethodDetailsList"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(6uLL);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[PKPaymentSetupProduct updateWithProductDictionary:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v59;
      _os_log_impl(&dword_18FC92000, v60, OS_LOG_TYPE_DEFAULT, "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled On: provisioningMethodDetailsList: %@", buf, 0x16u);
    }

    v61 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    associatedStoreIdentifiers = self->_associatedStoreIdentifiers;
    self->_associatedStoreIdentifiers = v61;

    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v63 = v59;
    v64 = -[NSObject countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v141, v154, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v142;
      location = (id *)&self->_appLaunchURL;
      v133 = v63;
      while (1)
      {
        v67 = 0;
        do
        {
          if (*(_QWORD *)v142 != v66)
            objc_enumerationMutation(v63);
          v68 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v67);
          objc_msgSend(v68, "PKStringForKey:", CFSTR("provisioningMethodType"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v69, "isEqualToString:", CFSTR("digitalIssuance")))
          {
            v70 = PKPaymentProvisioningMethodTypeDigitalIssuance;
LABEL_34:
            v71 = (PKPaymentProvisioningMethodTypeAppClip *)objc_msgSend([v70 alloc], "initWithDictionary:", v68);
            -[PKPaymentSetupProduct addProvisioningMethod:](self, "addProvisioningMethod:", v71);
            goto LABEL_35;
          }
          if (objc_msgSend(v69, "isEqualToString:", CFSTR("readerMode")))
          {
            v70 = PKPaymentProvisioningMethodTypeReaderMode;
            goto LABEL_34;
          }
          if (objc_msgSend(v69, "isEqualToString:", CFSTR("appClip")))
          {
            v71 = -[PKPaymentProvisioningMethodTypeAppClip initWithDictionary:]([PKPaymentProvisioningMethodTypeAppClip alloc], "initWithDictionary:", v68);
            -[PKPaymentSetupProduct addProvisioningMethod:](self, "addProvisioningMethod:", v71);
            -[PKPaymentProvisioningMethodTypeAppClip appClipLaunchURL](v71, "appClipLaunchURL");
            v72 = (NSURL *)objc_claimAutoreleasedReturnValue();
            appClipLaunchURL = self->_appClipLaunchURL;
            self->_appClipLaunchURL = v72;
            goto LABEL_46;
          }
          if (objc_msgSend(v69, "isEqualToString:", CFSTR("inApp")))
          {
            v71 = -[PKPaymentProvisioningMethodTypeInApp initWithDictionary:]([PKPaymentProvisioningMethodTypeInApp alloc], "initWithDictionary:", v68);
            -[PKPaymentSetupProduct addProvisioningMethod:](self, "addProvisioningMethod:", v71);
            -[PKPaymentProvisioningMethodTypeAppClip appLaunchURL](v71, "appLaunchURL");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            if (v74)
              objc_storeStrong(location, v74);
            v75 = self->_associatedStoreIdentifiers;
            -[PKPaymentProvisioningMethodTypeAppClip associatedStoreIdentifiers](v71, "associatedStoreIdentifiers");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray arrayByAddingObjectsFromArray:](v75, "arrayByAddingObjectsFromArray:", v76);
            v77 = objc_claimAutoreleasedReturnValue();
            v78 = v134->_associatedStoreIdentifiers;
            v134->_associatedStoreIdentifiers = (NSArray *)v77;

            self = v134;
            -[PKPaymentProvisioningMethodTypeAppClip cardTypeSupport](v71, "cardTypeSupport");
            v79 = objc_claimAutoreleasedReturnValue();
            supportedInAppTypes = v134->_supportedInAppTypes;
            v134->_supportedInAppTypes = (NSArray *)v79;

            v63 = v133;
            goto LABEL_35;
          }
          if (objc_msgSend(v69, "isEqualToString:", CFSTR("cameraCapture")))
          {
            v71 = -[PKPaymentProvisioningMethodTypeCameraCapture initWithDictionary:]([PKPaymentProvisioningMethodTypeCameraCapture alloc], "initWithDictionary:", v68);
            -[PKPaymentSetupProduct addProvisioningMethod:](self, "addProvisioningMethod:", v71);
            v81 = self->_associatedStoreIdentifiers;
            -[PKPaymentProvisioningMethodTypeAppClip associatedStoreIdentifiers](v71, "associatedStoreIdentifiers");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = v81;
            v63 = v133;
            -[NSArray arrayByAddingObjectsFromArray:](v83, "arrayByAddingObjectsFromArray:", v82);
            v84 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v85 = self->_associatedStoreIdentifiers;
            self->_associatedStoreIdentifiers = v84;

            -[PKPaymentProvisioningMethodTypeAppClip cardTypeSupport](v71, "cardTypeSupport");
            v86 = (NSArray *)objc_claimAutoreleasedReturnValue();
            appClipLaunchURL = self->_supportedCameraCaptureTypes;
            self->_supportedCameraCaptureTypes = v86;
LABEL_46:

LABEL_35:
          }

          ++v67;
        }
        while (v65 != v67);
        v87 = -[NSObject countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v141, v154, 16);
        v65 = v87;
        if (!v87)
        {
          v88 = v63;
          goto LABEL_52;
        }
      }
    }
    v88 = v63;
  }
  else
  {
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("provisioningMethods"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    self->_supportedProvisioningMethods = PKPaymentSetupProductSupportedProvisioningMethodsFromArray(v88);
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("associatedStoreIdentifiers"));
    v89 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v90 = self->_associatedStoreIdentifiers;
    self->_associatedStoreIdentifiers = v89;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("appLaunchURL"));
    v91 = (NSURL *)objc_claimAutoreleasedReturnValue();
    appLaunchURL = self->_appLaunchURL;
    self->_appLaunchURL = v91;

    PKLogFacilityTypeGetObject(6uLL);
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[PKPaymentSetupProduct updateWithProductDictionary:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v88;
      _os_log_impl(&dword_18FC92000, v63, OS_LOG_TYPE_DEFAULT, "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled Off: provisioningMethods: %@", buf, 0x16u);
    }
  }
LABEL_52:

  v93 = [PKPaymentSetupProductImageAssetURLs alloc];
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("imageAssets"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = -[PKPaymentSetupProductImageAssetURLs initWithImageAssetsDictionary:](v93, "initWithImageAssetsDictionary:", v94);
  imageAssetURLs = self->_imageAssetURLs;
  self->_imageAssetURLs = v95;

  v97 = objc_alloc_init(PKPaymentSetupProductImageAssets);
  imageAssets = self->_imageAssets;
  self->_imageAssets = v97;

  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("minimumOSVersion"));
  v99 = objc_claimAutoreleasedReturnValue();
  obja = (id)v99;
  if (v99)
  {
    v100 = (void *)v99;
    v101 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __PKPaymentMinOSDictionaryFromDictionary_block_invoke;
    v158 = &unk_1E2AC28C8;
    v159 = v101;
    v102 = v101;
    objc_msgSend(v100, "enumerateKeysAndObjectsUsingBlock:", buf);
    v103 = (NSDictionary *)objc_msgSend(v102, "copy");

    minimumOSVersion = self->_minimumOSVersion;
    self->_minimumOSVersion = v103;
  }
  else
  {
    minimumOSVersion = self->_minimumOSVersion;
    self->_minimumOSVersion = 0;
  }

  v105 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  requestedProvisioningMethods = self->_requestedProvisioningMethods;
  self->_requestedProvisioningMethods = v105;

  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedTransitNetworkIdentifiers"));
  v107 = (NSArray *)objc_claimAutoreleasedReturnValue();
  supportedTransitNetworkIdentifiers = self->_supportedTransitNetworkIdentifiers;
  self->_supportedTransitNetworkIdentifiers = v107;

  self->_suppressPendingPurchases = objc_msgSend(v4, "PKBoolForKey:", CFSTR("suppressPendingPurchases"));
  v109 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "PKArrayForKey:", CFSTR("onboardingItems"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v110;
  if (v110)
  {
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v112 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v137, v153, 16);
    if (v112)
    {
      v113 = v112;
      v114 = 0;
      v115 = *(_QWORD *)v138;
      do
      {
        for (k = 0; k != v113; ++k)
        {
          if (*(_QWORD *)v138 != v115)
            objc_enumerationMutation(v111);
          v117 = -[PKDynamicProvisioningPageContent initWithDictonary:]([PKDynamicProvisioningPageContent alloc], "initWithDictonary:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * k));
          -[PKDynamicProvisioningPageContent setPageNumber:](v117, "setPageNumber:", v114 + k);
          objc_msgSend(v109, "addObject:", v117);

        }
        v113 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v137, v153, 16);
        v114 += k;
      }
      while (v113);
    }
  }
  v118 = objc_msgSend(v109, "copy");
  onboardingItems = v134->_onboardingItems;
  v134->_onboardingItems = (NSArray *)v118;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("registrationRegionIdentifier"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v120, "copy");
  regionIdentifier = v134->_regionIdentifier;
  v134->_regionIdentifier = (NSString *)v121;

  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("clientInfo"));
  v123 = objc_claimAutoreleasedReturnValue();
  clientInfo = v134->_clientInfo;
  v134->_clientInfo = (NSDictionary *)v123;

  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("searchTerms"));
  v125 = objc_claimAutoreleasedReturnValue();
  searchTerms = v134->_searchTerms;
  v134->_searchTerms = (NSArray *)v125;

  v134->_allowOnManagedAccount = objc_msgSend(v4, "PKBoolForKey:", CFSTR("allowOnManagedAccount"));
}

uint64_t __53__PKPaymentSetupProduct_updateWithProductDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "priority");
  if (v6 >= objc_msgSend(v5, "priority"))
  {
    v8 = objc_msgSend(v4, "priority");
    v7 = v8 > objc_msgSend(v5, "priority");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (void)addProvisioningMethod:(id)a3
{
  id v4;
  NSArray *provisioningMethods;
  NSArray *v6;
  NSArray *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    provisioningMethods = self->_provisioningMethods;
    if (!provisioningMethods)
    {
      v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v7 = self->_provisioningMethods;
      self->_provisioningMethods = v6;

      provisioningMethods = self->_provisioningMethods;
    }
    v8 = (void *)-[NSArray mutableCopy](provisioningMethods, "mutableCopy");
    objc_msgSend(v8, "addObject:", v11);
    v9 = (NSArray *)objc_msgSend(v8, "copy");
    v10 = self->_provisioningMethods;
    self->_provisioningMethods = v9;

    v4 = v11;
  }

}

- (void)addProvisioningMethodType:(unint64_t)a3
{
  __objc2_class *v4;
  PKPaymentProvisioningMethod *v5;
  PKPaymentProvisioningMethod *v6;

  if ((uint64_t)a3 <= 15)
  {
    if (a3 == 1)
    {
      v4 = PKPaymentProvisioningMethodTypeReaderMode;
      goto LABEL_12;
    }
    if (a3 == 2)
    {
      v4 = PKPaymentProvisioningMethodTypeDigitalIssuance;
      goto LABEL_12;
    }
LABEL_14:
    v5 = -[PKPaymentProvisioningMethod initWithType:]([PKPaymentProvisioningMethod alloc], "initWithType:", a3);
    goto LABEL_13;
  }
  if (a3 == 16)
  {
    v4 = PKPaymentProvisioningMethodTypeInApp;
    goto LABEL_12;
  }
  if (a3 == 32)
  {
    v4 = PKPaymentProvisioningMethodTypeAppClip;
    goto LABEL_12;
  }
  if (a3 != 64)
    goto LABEL_14;
  v4 = PKPaymentProvisioningMethodTypeCameraCapture;
LABEL_12:
  v5 = (PKPaymentProvisioningMethod *)objc_alloc_init(v4);
LABEL_13:
  v6 = v5;
  -[PKPaymentSetupProduct addProvisioningMethod:](self, "addProvisioningMethod:", v5);

}

- (BOOL)supportsProvisioningMethodForType:(unint64_t)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3 && !-[NSArray count](self->_provisioningMethods, "count"))
    return 1;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_provisioningMethods;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "type", (_QWORD)v12) == a3)
        {
          v10 = 1;
          goto LABEL_13;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (PKPaymentSetupProduct)initWithFeatureIdentifier:(unint64_t)a3
{
  PKPaymentSetupProduct *v4;
  PKPaymentSetupProduct *v5;
  PKPaymentSetupProductConfiguration *configuration;
  const __CFString *v7;

  v4 = -[PKPaymentSetupProduct init](self, "init");
  v5 = v4;
  if (v4)
  {
    -[PKPaymentSetupProduct updateWithProductDictionary:](v4, "updateWithProductDictionary:", 0);
    switch(a3)
    {
      case 0uLL:
        configuration = v5->_configuration;
        v7 = CFSTR("unknown");
        goto LABEL_8;
      case 1uLL:
        configuration = v5->_configuration;
        v7 = CFSTR("peerPayment");
        goto LABEL_8;
      case 2uLL:
        -[PKPaymentSetupProductConfiguration setProductIdentifier:](v5->_configuration, "setProductIdentifier:", CFSTR("3-argon-CCS"));
        v5->_isServerDriven = 1;
        break;
      case 3uLL:
        configuration = v5->_configuration;
        v7 = CFSTR("4-argon-FPS");
        goto LABEL_8;
      case 5uLL:
        configuration = v5->_configuration;
        v7 = CFSTR("savings");
LABEL_8:
        -[PKPaymentSetupProductConfiguration setProductIdentifier:](configuration, "setProductIdentifier:", v7);
        break;
      default:
        break;
    }
    -[PKPaymentSetupProductConfiguration setFeatureIdentifier:](v5->_configuration, "setFeatureIdentifier:", a3);
    -[PKPaymentSetupProductConfiguration setType:](v5->_configuration, "setType:", 7);
    -[PKPaymentSetupProductConfiguration setState:](v5->_configuration, "setState:", 0);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentSetupProduct *v5;
  PKPaymentSetupProductConfiguration *v6;
  PKPaymentSetupProductConfiguration *configuration;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSString *localizedDescription;
  uint64_t v12;
  NSSet *regions;
  PKPaymentSetupProductRegionData *v14;
  PKPaymentSetupProductRegionData *regionData;
  uint64_t v16;
  NSArray *requiredFields;
  uint64_t v18;
  NSArray *supportedProtocols;
  uint64_t v20;
  NSURL *termsURL;
  uint64_t v22;
  NSArray *associatedStoreIdentifiers;
  uint64_t v24;
  NSURL *appLaunchURL;
  uint64_t v26;
  NSURL *appClipLaunchURL;
  uint64_t v28;
  NSDictionary *minimumOSVersion;
  uint64_t v30;
  NSArray *provisioningMethods;
  uint64_t v32;
  NSArray *paymentOptions;
  uint64_t v34;
  NSDictionary *rawDictionary;
  uint64_t v36;
  NSDictionary *readerModeMetadata;
  uint64_t v38;
  NSMutableDictionary *requestedProvisioningMethods;
  PKPaymentSetupProductImageAssets *v40;
  PKPaymentSetupProductImageAssets *imageAssets;
  PKPaymentSetupProductImageAssetURLs *v42;
  PKPaymentSetupProductImageAssetURLs *imageAssetURLs;
  uint64_t v44;
  NSArray *supportedTransitNetworkIdentifiers;
  uint64_t v46;
  NSArray *featureApplications;
  uint64_t v48;
  NSArray *accounts;
  uint64_t v50;
  NSArray *onboardingItems;
  uint64_t v52;
  NSDictionary *clientInfo;
  uint64_t v54;
  NSArray *searchTerms;
  uint64_t v56;
  NSArray *supportedCameraCaptureTypes;
  uint64_t v58;
  NSArray *supportedInAppTypes;

  v5 = -[PKPaymentSetupProduct init](+[PKPaymentSetupProduct allocWithZone:](PKPaymentSetupProduct, "allocWithZone:"), "init");
  v6 = -[PKPaymentSetupProductConfiguration copyWithZone:](self->_configuration, "copyWithZone:", a3);
  configuration = v5->_configuration;
  v5->_configuration = v6;

  v8 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_localizedDescription, "copyWithZone:", a3);
  localizedDescription = v5->_localizedDescription;
  v5->_localizedDescription = (NSString *)v10;

  v12 = -[NSSet copyWithZone:](self->_regions, "copyWithZone:", a3);
  regions = v5->_regions;
  v5->_regions = (NSSet *)v12;

  v14 = -[PKPaymentSetupProductRegionData copyWithZone:](self->_regionData, "copyWithZone:", a3);
  regionData = v5->_regionData;
  v5->_regionData = v14;

  v16 = -[NSArray copyWithZone:](self->_requiredFields, "copyWithZone:", a3);
  requiredFields = v5->_requiredFields;
  v5->_requiredFields = (NSArray *)v16;

  v18 = -[NSArray copyWithZone:](self->_supportedProtocols, "copyWithZone:", a3);
  supportedProtocols = v5->_supportedProtocols;
  v5->_supportedProtocols = (NSArray *)v18;

  v20 = -[NSURL copyWithZone:](self->_termsURL, "copyWithZone:", a3);
  termsURL = v5->_termsURL;
  v5->_termsURL = (NSURL *)v20;

  v22 = -[NSArray copyWithZone:](self->_associatedStoreIdentifiers, "copyWithZone:", a3);
  associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
  v5->_associatedStoreIdentifiers = (NSArray *)v22;

  v24 = -[NSURL copyWithZone:](self->_appLaunchURL, "copyWithZone:", a3);
  appLaunchURL = v5->_appLaunchURL;
  v5->_appLaunchURL = (NSURL *)v24;

  v26 = -[NSURL copyWithZone:](self->_appClipLaunchURL, "copyWithZone:", a3);
  appClipLaunchURL = v5->_appClipLaunchURL;
  v5->_appClipLaunchURL = (NSURL *)v26;

  v28 = -[NSDictionary copyWithZone:](self->_minimumOSVersion, "copyWithZone:", a3);
  minimumOSVersion = v5->_minimumOSVersion;
  v5->_minimumOSVersion = (NSDictionary *)v28;

  v30 = -[NSArray copyWithZone:](self->_provisioningMethods, "copyWithZone:", a3);
  provisioningMethods = v5->_provisioningMethods;
  v5->_provisioningMethods = (NSArray *)v30;

  v5->_supportedProvisioningMethods = self->_supportedProvisioningMethods;
  v32 = -[NSArray copyWithZone:](self->_paymentOptions, "copyWithZone:", a3);
  paymentOptions = v5->_paymentOptions;
  v5->_paymentOptions = (NSArray *)v32;

  v34 = -[NSDictionary copyWithZone:](self->_rawDictionary, "copyWithZone:", a3);
  rawDictionary = v5->_rawDictionary;
  v5->_rawDictionary = (NSDictionary *)v34;

  v36 = -[NSDictionary copyWithZone:](self->_readerModeMetadata, "copyWithZone:", a3);
  readerModeMetadata = v5->_readerModeMetadata;
  v5->_readerModeMetadata = (NSDictionary *)v36;

  v5->_flags = self->_flags;
  v5->_hsa2Requirement = self->_hsa2Requirement;
  v38 = -[NSMutableDictionary mutableCopyWithZone:](self->_requestedProvisioningMethods, "mutableCopyWithZone:", a3);
  requestedProvisioningMethods = v5->_requestedProvisioningMethods;
  v5->_requestedProvisioningMethods = (NSMutableDictionary *)v38;

  v40 = -[PKPaymentSetupProductImageAssets copyWithZone:](self->_imageAssets, "copyWithZone:", a3);
  imageAssets = v5->_imageAssets;
  v5->_imageAssets = v40;

  v42 = -[PKPaymentSetupProductImageAssetURLs copyWithZone:](self->_imageAssetURLs, "copyWithZone:", a3);
  imageAssetURLs = v5->_imageAssetURLs;
  v5->_imageAssetURLs = v42;

  v44 = -[NSArray copyWithZone:](self->_supportedTransitNetworkIdentifiers, "copyWithZone:", a3);
  supportedTransitNetworkIdentifiers = v5->_supportedTransitNetworkIdentifiers;
  v5->_supportedTransitNetworkIdentifiers = (NSArray *)v44;

  v5->_preventsFeatureApplication = self->_preventsFeatureApplication;
  v5->_provisioningStatus = self->_provisioningStatus;
  v46 = -[NSArray copyWithZone:](self->_featureApplications, "copyWithZone:", a3);
  featureApplications = v5->_featureApplications;
  v5->_featureApplications = (NSArray *)v46;

  v48 = -[NSArray copyWithZone:](self->_accounts, "copyWithZone:", a3);
  accounts = v5->_accounts;
  v5->_accounts = (NSArray *)v48;

  v5->_suppressPendingPurchases = self->_suppressPendingPurchases;
  v50 = -[NSArray copyWithZone:](self->_onboardingItems, "copyWithZone:", a3);
  onboardingItems = v5->_onboardingItems;
  v5->_onboardingItems = (NSArray *)v50;

  v5->_minimumSupportedAge = self->_minimumSupportedAge;
  v5->_maximumSupportedAge = self->_maximumSupportedAge;
  v5->_minimumTargetUserSupportedAge = self->_minimumTargetUserSupportedAge;
  v5->_meetsAgeRequirements = self->_meetsAgeRequirements;
  v52 = -[NSDictionary copyWithZone:](self->_clientInfo, "copyWithZone:", a3);
  clientInfo = v5->_clientInfo;
  v5->_clientInfo = (NSDictionary *)v52;

  v54 = -[NSArray copyWithZone:](self->_searchTerms, "copyWithZone:", a3);
  searchTerms = v5->_searchTerms;
  v5->_searchTerms = (NSArray *)v54;

  v56 = -[NSArray copyWithZone:](self->_supportedCameraCaptureTypes, "copyWithZone:", a3);
  supportedCameraCaptureTypes = v5->_supportedCameraCaptureTypes;
  v5->_supportedCameraCaptureTypes = (NSArray *)v56;

  v58 = -[NSArray copyWithZone:](self->_supportedInAppTypes, "copyWithZone:", a3);
  supportedInAppTypes = v5->_supportedInAppTypes;
  v5->_supportedInAppTypes = (NSArray *)v58;

  objc_storeStrong((id *)&v5->_provisioningExtension, self->_provisioningExtension);
  v5->_provisioningExtensionRequiresAuthorization = self->_provisioningExtensionRequiresAuthorization;
  v5->_allowOnManagedAccount = self->_allowOnManagedAccount;
  return v5;
}

- (NSString)partnerName
{
  return (NSString *)-[NSDictionary PKStringForKey:](self->_rawDictionary, "PKStringForKey:", CFSTR("partnerLocalizedDisplayName"));
}

- (int64_t)allSupportedProtocols
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_paymentOptions;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "supportedProtocols", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)provisioningMethodMetadataForType:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_requestedProvisioningMethods, "objectForKey:", a3);
}

- (void)setProvisioningMethodMetadata:(id)a3 forType:(id)a4
{
  NSMutableDictionary *requestedProvisioningMethods;

  requestedProvisioningMethods = self->_requestedProvisioningMethods;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](requestedProvisioningMethods, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](requestedProvisioningMethods, "removeObjectForKey:", a4);
}

- (id)provisioningMethodTypes
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  const char *v11;
  unint64_t supportedProvisioningMethods;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_provisioningMethods;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          PKPaymentSupportedProvisioningMethodToString(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "type", (_QWORD)v14));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v3, "addObject:", v9);

        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v6);
    }

    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[PKPaymentSetupProduct provisioningMethodTypes]";
      v20 = 2112;
      v21 = v3;
      v11 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled On: provisioningMethodTypes: %@";
LABEL_21:
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  supportedProvisioningMethods = self->_supportedProvisioningMethods;
  if ((supportedProvisioningMethods & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("readerMode"));
    supportedProvisioningMethods = self->_supportedProvisioningMethods;
    if ((supportedProvisioningMethods & 2) == 0)
    {
LABEL_15:
      if ((supportedProvisioningMethods & 0x10) == 0)
        goto LABEL_16;
      goto LABEL_25;
    }
  }
  else if ((supportedProvisioningMethods & 2) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(v3, "addObject:", CFSTR("digitalIssuance"));
  supportedProvisioningMethods = self->_supportedProvisioningMethods;
  if ((supportedProvisioningMethods & 0x10) == 0)
  {
LABEL_16:
    if ((supportedProvisioningMethods & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "addObject:", CFSTR("inApp"));
  supportedProvisioningMethods = self->_supportedProvisioningMethods;
  if ((supportedProvisioningMethods & 0x20) == 0)
  {
LABEL_17:
    if ((supportedProvisioningMethods & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_26:
  objc_msgSend(v3, "addObject:", CFSTR("appClip"));
  if ((self->_supportedProvisioningMethods & 0x40) != 0)
LABEL_18:
    objc_msgSend(v3, "addObject:", CFSTR("cameraCapture"));
LABEL_19:
  PKLogFacilityTypeGetObject(6uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[PKPaymentSetupProduct provisioningMethodTypes]";
    v20 = 2112;
    v21 = v3;
    v11 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled Off: provisioningMethodTypes: %@";
    goto LABEL_21;
  }
LABEL_22:

  return v3;
}

- (NSString)displayName
{
  NSString *displayName;
  NSString *v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v14;

  displayName = self->_displayName;
  if (!displayName)
  {
    v5 = -[PKPaymentSetupProductConfiguration featureIdentifier](self->_configuration, "featureIdentifier");
    switch(v5)
    {
      case 4uLL:
        v11 = CFSTR("APPLY_FLOW_NEW_APPLICATION_TITLE");
        v12 = 4;
        break;
      case 3uLL:
        v11 = CFSTR("APPLY_FLOW_NEW_APPLICATION_TITLE");
        v12 = 3;
        break;
      case 2uLL:
        if (-[NSArray count](self->_featureApplications, "count"))
        {
          v11 = CFSTR("APPLY_FLOW_RESUME_APPLICATION_TITLE");
        }
        else if (-[NSArray count](self->_accounts, "count"))
        {
          v11 = CFSTR("APPLY_FLOW_NEW_APPLICATION_WITH_ACCOUNT_TITLE");
        }
        else
        {
          v11 = CFSTR("APPLY_FLOW_NEW_APPLICATION_TITLE");
        }
        v12 = 2;
        break;
      default:
        v3 = 0;
        return v3;
    }
    PKLocalizedFeatureString(v11, v12, 0, v6, v7, v8, v9, v10, v14);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = displayName;
  return v3;
}

- (NSString)longLocalizedDescription
{
  unint64_t v3;
  __CFString *v4;
  void *v5;

  v3 = -[PKPaymentSetupProductConfiguration type](self->_configuration, "type");
  if (v3 == 3)
  {
    v4 = CFSTR("PAYMENT_SETUP_TRANSIT_LONG_DESCRIPTION");
    goto LABEL_6;
  }
  if (v3 == 7)
  {
    if (-[PKPaymentSetupProductConfiguration featureIdentifier](self->_configuration, "featureIdentifier") == 4)
    {
      PKLocalizedLynxString(CFSTR("APPLE_ACCOUNT_BODY"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v5;
    }
LABEL_9:
    v5 = 0;
    return (NSString *)v5;
  }
  if (v3 != 4)
    goto LABEL_9;
  v4 = CFSTR("PAYMENT_SETUP_EMONEY_LONG_DESCRIPTION");
LABEL_6:
  PKLocalizedPaymentString(&v4->isa, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v5;
}

- (NSString)displayStatus
{
  __CFString *v3;
  void *v4;

  if (-[PKPaymentSetupProductConfiguration type](self->_configuration, "type") == 10)
  {
    v3 = CFSTR("CARD_TYPE_IDENTITY_PENDING");
    switch(self->_provisioningStatus)
    {
      case 1uLL:
        break;
      case 2uLL:
        v3 = CFSTR("CARD_TYPE_IDENTITY_ACTION_REQUIRED");
        break;
      case 3uLL:
        v3 = CFSTR("CARD_TYPE_IDENTITY_READY");
        break;
      case 4uLL:
        v3 = CFSTR("CARD_TYPE_IDENTITY_AUTH_CODE");
        break;
      case 5uLL:
        v3 = CFSTR("CARD_TYPE_IDENTITY_RETRY_AUTH_CODE");
        break;
      case 6uLL:
        v3 = CFSTR("CARD_TYPE_IDENTITY_RETRY_ADDING");
        break;
      case 7uLL:
        if (PKUseWLAN())
          v3 = CFSTR("CARD_TYPE_IDENTITY_WAITING_WLAN");
        else
          v3 = CFSTR("CARD_TYPE_IDENTITY_WAITING_WIFI");
        break;
      case 8uLL:
        v3 = CFSTR("CARD_TYPE_IDENTITY_UNABLE_TO_ADD");
        break;
      case 9uLL:
        v3 = CFSTR("CARD_TYPE_IDENTITY_CANNOT_ADD");
        break;
      case 0xAuLL:
        v3 = CFSTR("CARD_TYPE_IDENTITY_LIVENESS_STEP_UP");
        break;
      default:
        goto LABEL_4;
    }
    PKLocalizedIdentityString(&v3->isa, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)badge
{
  unint64_t provisioningStatus;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  void *v7;

  if (-[PKPaymentSetupProductConfiguration type](self->_configuration, "type") != 10
    || ((provisioningStatus = self->_provisioningStatus,
         v4 = provisioningStatus > 0xA,
         v5 = (1 << provisioningStatus) & 0x77C,
         !v4)
      ? (v6 = v5 == 0)
      : (v6 = 1),
        v6))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", &unk_1E2C3F838, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v7;
}

- (unint64_t)supportedProvisioningMethods
{
  unint64_t supportedProvisioningMethods;
  unint64_t v4;

  supportedProvisioningMethods = self->_supportedProvisioningMethods;
  v4 = -[PKPaymentSetupProductConfiguration type](self->_configuration, "type");
  if (v4 == 7)
  {
    if (-[PKPaymentSetupProductConfiguration featureIdentifier](self->_configuration, "featureIdentifier") == 2)
      return 4;
    else
      return supportedProvisioningMethods;
  }
  else if (v4 == 5)
  {
    return 16;
  }
  else
  {
    return supportedProvisioningMethods;
  }
}

- (BOOL)supportsOSVersion:(id)a3 deviceClass:(id)a4
{
  id v6;
  NSDictionary *minimumOSVersion;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  minimumOSVersion = self->_minimumOSVersion;
  if (minimumOSVersion)
  {
    -[NSDictionary objectForKey:](minimumOSVersion, "objectForKey:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = (unint64_t)(objc_msgSend(v8, "compare:options:", v6, 64) + 1) < 2;
    else
      v10 = 0;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)supportsDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "deviceVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "cellularNetworkRegion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, "versionForDeviceClass:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKPaymentSetupProduct supportsOSVersion:deviceClass:](self, "supportsOSVersion:deviceClass:", v9, v6);

  if (v10
    && (v7 && -[NSSet containsObject:](self->_regions, "containsObject:", v7)
     || v8 && -[NSSet containsObject:](self->_regions, "containsObject:", v8))
    && ((-[PKPaymentSetupProduct allSupportedProtocols](self, "allSupportedProtocols") & 4) == 0
     || objc_msgSend(v4, "felicaSecureElementIsAvailable")))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[PKPaymentSetupProduct paymentOptions](self, "paymentOptions", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v11);
            if ((objc_msgSend(v4, "supportsCredentialType:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "cardType")) & 1) != 0)
            {
              LOBYTE(v12) = 1;
              goto LABEL_25;
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_25:

    }
    else
    {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)augmentWithProduct:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSArray *onboardingItems;
  int v9;
  PKPaymentSetupProduct *v10;
  __int16 v11;
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_augmentedProduct, a3);
    objc_msgSend(v5, "onboardingItems");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        onboardingItems = self->_onboardingItems;
        v9 = 138412546;
        v10 = (PKPaymentSetupProduct *)onboardingItems;
        v11 = 2112;
        v12 = v6;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "augmentWithProduct: Replacing old onboardingItems (%@) with new onboardingItems (%@)", (uint8_t *)&v9, 0x16u);
      }

      objc_storeStrong((id *)&self->_onboardingItems, v6);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Invalid request to augment self with nil augmenting product: %@", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (BOOL)isCarKey
{
  void *v2;
  BOOL v3;

  -[PKPaymentSetupProduct configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 11;

  return v3;
}

- (id)productIdentifier
{
  void *v2;
  void *v3;

  -[PKPaymentSetupProduct configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)partnerIdentifier
{
  void *v2;
  void *v3;

  -[PKPaymentSetupProduct configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "partnerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateDebugConfigurationForState:(unint64_t)a3
{
  PKDynamicProvisioningPageContent *v5;
  PKDynamicProvisioningPageContent *onboardingItems;
  NSArray *v7;
  NSArray *v8;
  void *v9;
  PKDynamicProvisioningPageContent **v10;
  NSArray *v11;
  PKDynamicProvisioningPageContent *v12;
  PKDynamicProvisioningPageContent *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[PKPaymentSetupProductConfiguration setState:](self->_configuration, "setState:");
  if (a3 == 4)
  {
    v5 = objc_alloc_init(PKDynamicProvisioningPageContent);
    -[PKDynamicProvisioningPageContent setPageNumber:](v5, "setPageNumber:", 0);
    -[PKDynamicProvisioningPageContent setTitle:](v5, "setTitle:", CFSTR("Notify Requested Demo"));
    -[PKDynamicProvisioningPageContent setSubtitle:](v5, "setSubtitle:", CFSTR("You're all set. We'll be in touch soon."));
    -[PKDynamicProvisioningPageContent setPrimaryActionTitle:](v5, "setPrimaryActionTitle:", CFSTR("Done"));
    v12 = v5;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = &v12;
LABEL_7:
    objc_msgSend(v9, "arrayWithObjects:count:", v10, 1);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    onboardingItems = (PKDynamicProvisioningPageContent *)self->_onboardingItems;
    self->_onboardingItems = v11;
    goto LABEL_8;
  }
  if (a3 == 3)
  {
    v5 = objc_alloc_init(PKDynamicProvisioningPageContent);
    -[PKDynamicProvisioningPageContent setPageNumber:](v5, "setPageNumber:", 0);
    -[PKDynamicProvisioningPageContent setTitle:](v5, "setTitle:", CFSTR("Notify Demo"));
    -[PKDynamicProvisioningPageContent setSubtitle:](v5, "setSubtitle:", CFSTR("Do you want to be notified ?"));
    -[PKDynamicProvisioningPageContent setPrimaryActionTitle:](v5, "setPrimaryActionTitle:", CFSTR("Notify Me"));
    -[PKDynamicProvisioningPageContent setSecondaryActionTitle:](v5, "setSecondaryActionTitle:", CFSTR("Cancel"));
    v13 = v5;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = &v13;
    goto LABEL_7;
  }
  if (a3 != 1)
    return;
  v5 = objc_alloc_init(PKDynamicProvisioningPageContent);
  -[PKDynamicProvisioningPageContent setPageNumber:](v5, "setPageNumber:", 0);
  -[PKDynamicProvisioningPageContent setTitle:](v5, "setTitle:", CFSTR("Demo Page 1"));
  -[PKDynamicProvisioningPageContent setSubtitle:](v5, "setSubtitle:", CFSTR("Demo Demo Page"));
  -[PKDynamicProvisioningPageContent setHeroImageURL:](v5, "setHeroImageURL:", &stru_1E2ADF4C0);
  -[PKDynamicProvisioningPageContent setPrimaryActionTitle:](v5, "setPrimaryActionTitle:", CFSTR("Continue"));
  -[PKDynamicProvisioningPageContent setSecondaryActionTitle:](v5, "setSecondaryActionTitle:", CFSTR("Cancel"));
  -[PKDynamicProvisioningPageContent setContentAlignment:](v5, "setContentAlignment:", 4);
  onboardingItems = objc_alloc_init(PKDynamicProvisioningPageContent);
  -[PKDynamicProvisioningPageContent setPageNumber:](onboardingItems, "setPageNumber:", 1);
  -[PKDynamicProvisioningPageContent setTitle:](onboardingItems, "setTitle:", CFSTR("Demo Page 2"));
  -[PKDynamicProvisioningPageContent setSubtitle:](onboardingItems, "setSubtitle:", CFSTR("Demo Demo Page"));
  -[PKDynamicProvisioningPageContent setIdentifier:](onboardingItems, "setIdentifier:", CFSTR("mainFeatureOnboardingPageIdentifier"));
  v14[0] = v5;
  v14[1] = onboardingItems;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = self->_onboardingItems;
  self->_onboardingItems = v7;

LABEL_8:
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupProductConfiguration productIdentifier](self->_configuration, "productIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("productIdentifier: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("displayName: '%@'; "), self->_displayName);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (PKPaymentSetupProductConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PKPaymentSetupProductRegionData)regionData
{
  return self->_regionData;
}

- (NSString)primaryRegion
{
  return self->_primaryRegion;
}

- (NSArray)requiredFields
{
  return self->_requiredFields;
}

- (void)setRequiredFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)supportedProtocols
{
  return self->_supportedProtocols;
}

- (void)setSupportedProtocols:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)readerModeMetadata
{
  return self->_readerModeMetadata;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (int64_t)hsa2Requirement
{
  return self->_hsa2Requirement;
}

- (void)setHsa2Requirement:(int64_t)a3
{
  self->_hsa2Requirement = a3;
}

- (PKPaymentSetupProductImageAssetURLs)imageAssetURLs
{
  return self->_imageAssetURLs;
}

- (PKPaymentSetupProductImageAssets)imageAssets
{
  return self->_imageAssets;
}

- (void)setImageAssets:(id)a3
{
  objc_storeStrong((id *)&self->_imageAssets, a3);
}

- (BOOL)suppressPendingPurchases
{
  return self->_suppressPendingPurchases;
}

- (int64_t)minimumSupportedAge
{
  return self->_minimumSupportedAge;
}

- (void)setMinimumSupportedAge:(int64_t)a3
{
  self->_minimumSupportedAge = a3;
}

- (int64_t)maximumSupportedAge
{
  return self->_maximumSupportedAge;
}

- (void)setMaximumSupportedAge:(int64_t)a3
{
  self->_maximumSupportedAge = a3;
}

- (int64_t)minimumTargetUserSupportedAge
{
  return self->_minimumTargetUserSupportedAge;
}

- (void)setMinimumTargetUserSupportedAge:(int64_t)a3
{
  self->_minimumTargetUserSupportedAge = a3;
}

- (BOOL)meetsAgeRequirements
{
  return self->_meetsAgeRequirements;
}

- (void)setMeetsAgeRequirements:(BOOL)a3
{
  self->_meetsAgeRequirements = a3;
}

- (NSDictionary)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)allowOnManagedAccount
{
  return self->_allowOnManagedAccount;
}

- (void)setSupportedProvisioningMethods:(unint64_t)a3
{
  self->_supportedProvisioningMethods = a3;
}

- (NSArray)provisioningMethods
{
  return self->_provisioningMethods;
}

- (NSURL)appClipLaunchURL
{
  return self->_appClipLaunchURL;
}

- (NSArray)associatedStoreIdentifiers
{
  return self->_associatedStoreIdentifiers;
}

- (void)setAssociatedStoreIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSURL)appLaunchURL
{
  return self->_appLaunchURL;
}

- (void)setAppLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)supportedCameraCaptureTypes
{
  return self->_supportedCameraCaptureTypes;
}

- (NSArray)supportedInAppTypes
{
  return self->_supportedInAppTypes;
}

- (NSArray)supportedTransitNetworkIdentifiers
{
  return self->_supportedTransitNetworkIdentifiers;
}

- (NSExtension)provisioningExtension
{
  return self->_provisioningExtension;
}

- (BOOL)provisioningExtensionRequiresAuthorization
{
  return self->_provisioningExtensionRequiresAuthorization;
}

- (NSArray)featureApplications
{
  return self->_featureApplications;
}

- (void)setFeatureApplications:(id)a3
{
  objc_storeStrong((id *)&self->_featureApplications, a3);
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (BOOL)preventsFeatureApplication
{
  return self->_preventsFeatureApplication;
}

- (void)setPreventsFeatureApplication:(BOOL)a3
{
  self->_preventsFeatureApplication = a3;
}

- (NSArray)onboardingItems
{
  return self->_onboardingItems;
}

- (void)setOnboardingItems:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingItems, a3);
}

- (NSString)regionIdentifier
{
  return self->_regionIdentifier;
}

- (NSArray)paymentOptions
{
  return self->_paymentOptions;
}

- (NSDictionary)rawDictionary
{
  return self->_rawDictionary;
}

- (void)setRawDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (PKPaymentSetupProduct)augmentedProduct
{
  return self->_augmentedProduct;
}

- (NSDictionary)minimumOSVersion
{
  return self->_minimumOSVersion;
}

- (void)setMinimumOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_minimumOSVersion, a3);
}

- (NSMutableDictionary)requestedProvisioningMethods
{
  return self->_requestedProvisioningMethods;
}

- (void)setRequestedProvisioningMethods:(id)a3
{
  objc_storeStrong((id *)&self->_requestedProvisioningMethods, a3);
}

- (BOOL)isServerDriven
{
  return self->_isServerDriven;
}

- (void)setIsServerDriven:(BOOL)a3
{
  self->_isServerDriven = a3;
}

- (void)setDisplayStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (void)setBadge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (unint64_t)provisioningStatus
{
  return self->_provisioningStatus;
}

- (void)setProvisioningStatus:(unint64_t)a3
{
  self->_provisioningStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_displayStatus, 0);
  objc_storeStrong((id *)&self->_requestedProvisioningMethods, 0);
  objc_storeStrong((id *)&self->_minimumOSVersion, 0);
  objc_storeStrong((id *)&self->_augmentedProduct, 0);
  objc_storeStrong((id *)&self->_rawDictionary, 0);
  objc_storeStrong((id *)&self->_paymentOptions, 0);
  objc_storeStrong((id *)&self->_regionIdentifier, 0);
  objc_storeStrong((id *)&self->_onboardingItems, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_featureApplications, 0);
  objc_storeStrong((id *)&self->_provisioningExtension, 0);
  objc_storeStrong((id *)&self->_supportedTransitNetworkIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedInAppTypes, 0);
  objc_storeStrong((id *)&self->_supportedCameraCaptureTypes, 0);
  objc_storeStrong((id *)&self->_appLaunchURL, 0);
  objc_storeStrong((id *)&self->_associatedStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_appClipLaunchURL, 0);
  objc_storeStrong((id *)&self->_provisioningMethods, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_imageAssets, 0);
  objc_storeStrong((id *)&self->_imageAssetURLs, 0);
  objc_storeStrong((id *)&self->_readerModeMetadata, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_supportedProtocols, 0);
  objc_storeStrong((id *)&self->_requiredFields, 0);
  objc_storeStrong((id *)&self->_primaryRegion, 0);
  objc_storeStrong((id *)&self->_regionData, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (id)productsFromBrowseableBankApps:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  PKPaymentSetupProduct *v9;
  uint64_t v10;
  NSString *displayName;
  uint64_t v12;
  NSArray *searchTerms;
  uint64_t v14;
  uint64_t v15;
  NSArray *supportedCameraCaptureTypes;
  uint64_t v17;
  NSArray *supportedInAppTypes;
  void *v19;
  void *v20;
  uint64_t v21;
  NSURL *appLaunchURL;
  uint64_t v23;
  NSArray *associatedStoreIdentifiers;
  PKPaymentSetupProductConfiguration *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PKPaymentSetupProductConfiguration *configuration;
  void *v31;
  id obj;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[5];
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v4;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v40;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v5);
        objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("cameraCaptureSupport"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("inAppProvisioningSupport"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_alloc_init(PKPaymentSetupProduct);
        objc_msgSend(v6, "PKStringForKey:", CFSTR("displayName"));
        v10 = objc_claimAutoreleasedReturnValue();
        displayName = v9->_displayName;
        v9->_displayName = (NSString *)v10;

        objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("searchTerms"));
        v12 = objc_claimAutoreleasedReturnValue();
        searchTerms = v9->_searchTerms;
        v9->_searchTerms = (NSArray *)v12;

        v14 = MEMORY[0x1E0C809B0];
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __86__PKPaymentSetupProduct_PKBrowseableBankAppAdditions__productsFromBrowseableBankApps___block_invoke;
        v38[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8l;
        v38[4] = a1;
        objc_msgSend(v7, "pk_arrayByApplyingBlock:", v38);
        v15 = objc_claimAutoreleasedReturnValue();
        supportedCameraCaptureTypes = v9->_supportedCameraCaptureTypes;
        v9->_supportedCameraCaptureTypes = (NSArray *)v15;

        v37[0] = v14;
        v37[1] = 3221225472;
        v37[2] = __86__PKPaymentSetupProduct_PKBrowseableBankAppAdditions__productsFromBrowseableBankApps___block_invoke_2;
        v37[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8l;
        v37[4] = a1;
        objc_msgSend(v8, "pk_arrayByApplyingBlock:", v37);
        v17 = objc_claimAutoreleasedReturnValue();
        supportedInAppTypes = v9->_supportedInAppTypes;
        v9->_supportedInAppTypes = (NSArray *)v17;

        objc_msgSend(v6, "PKStringForKey:", CFSTR("appLaunchURLScheme"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "PKStringForKey:", CFSTR("appLaunchURLPath"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_inAppProvisioningURLWthScheme:path:", v19, v20);
        v21 = objc_claimAutoreleasedReturnValue();
        appLaunchURL = v9->_appLaunchURL;
        v9->_appLaunchURL = (NSURL *)v21;

        objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("associatedStoreIdentifiers"));
        v23 = objc_claimAutoreleasedReturnValue();
        associatedStoreIdentifiers = v9->_associatedStoreIdentifiers;
        v9->_associatedStoreIdentifiers = (NSArray *)v23;

        v25 = objc_alloc_init(PKPaymentSetupProductConfiguration);
        -[PKPaymentSetupProductConfiguration setType:](v25, "setType:", 5);
        v26 = (void *)MEMORY[0x1E0CB3940];
        -[PKPaymentSetupProduct displayName](v9, "displayName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupProduct appLaunchURL](v9, "appLaunchURL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("%@%@"), v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPaymentSetupProductConfiguration setProductIdentifier:](v25, "setProductIdentifier:", v29);
        configuration = v9->_configuration;
        v9->_configuration = v25;

        objc_msgSend(v35, "addObject:", v9);
        ++v5;
      }
      while (v36 != v5);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v36);
  }

  v31 = (void *)objc_msgSend(v35, "copy");
  return v31;
}

uint64_t __86__PKPaymentSetupProduct_PKBrowseableBankAppAdditions__productsFromBrowseableBankApps___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayNameForCardType:", a2);
}

uint64_t __86__PKPaymentSetupProduct_PKBrowseableBankAppAdditions__productsFromBrowseableBankApps___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayNameForCardType:", a2);
}

+ (id)_displayNameForCardType:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("credit")) & 1) != 0)
  {
    v4 = CFSTR("CARD_TYPE_CREDIT_CARD");
LABEL_9:
    PKLocalizedPaymentString(&v4->isa, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("debit")) & 1) != 0)
  {
    v4 = CFSTR("CARD_TYPE_DEBIT_CARD");
    goto LABEL_9;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("prepaid")) & 1) != 0)
  {
    v4 = CFSTR("CARD_TYPE_PREPAID_CARD");
    goto LABEL_9;
  }
  v5 = v3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("bankcard")))
  {
    v4 = CFSTR("CARD_TYPE_BANK_CARD");
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

+ (id)_inAppProvisioningURLWthScheme:(id)a3 path:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@://"), v5);
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "appendString:", v9);
      v6 = (id)v9;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)productForIssuerProvisioningExtension:(id)a3 withStatus:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKPaymentSetupProduct *v9;
  PKPaymentSetupProductConfiguration *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *displayName;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (!v6 || !v7)
    goto LABEL_16;
  if ((objc_msgSend(v7, "passEntriesAvailable") & 1) == 0
    && !objc_msgSend(v8, "remotePassEntriesAvailable"))
  {
    v9 = 0;
    goto LABEL_16;
  }
  v10 = objc_alloc_init(PKPaymentSetupProductConfiguration);
  -[PKPaymentSetupProductConfiguration setType:](v10, "setType:", 6);
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupProductConfiguration setProductIdentifier:](v10, "setProductIdentifier:", v11);

  v9 = objc_alloc_init(PKPaymentSetupProduct);
  if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
  {
    -[PKPaymentSetupProduct addProvisioningMethodType:](v9, "addProvisioningMethodType:", 8);
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315138;
      v21 = "+[PKPaymentSetupProduct(PKExtensionAdditions) productForIssuerProvisioningExtension:withStatus:]";
      v13 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled On: add PKPaymentSupportedProvisioningMethodIssuerProvisioningExtension";
LABEL_10:
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    v9->_supportedProvisioningMethods = 8;
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315138;
      v21 = "+[PKPaymentSetupProduct(PKExtensionAdditions) productForIssuerProvisioningExtension:withStatus:]";
      v13 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled Off: add PKPaymentSupportedProvisioningMethodIssuerProvisioningExtension";
      goto LABEL_10;
    }
  }

  objc_storeStrong((id *)&v9->_configuration, v10);
  objc_msgSend(v6, "_plugIn");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedContainingName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(v6, "_localizedName");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  displayName = v9->_displayName;
  v9->_displayName = v17;

  objc_storeStrong((id *)&v9->_provisioningExtension, a3);
  v9->_provisioningExtensionRequiresAuthorization = objc_msgSend(v8, "requiresAuthentication");

LABEL_16:
  return v9;
}

- (void)didAuthorizeProvisioningExtension
{
  self->_provisioningExtensionRequiresAuthorization = 0;
}

@end
