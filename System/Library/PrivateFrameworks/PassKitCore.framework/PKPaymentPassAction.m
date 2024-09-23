@implementation PKPaymentPassAction

- (PKPaymentPassAction)initWithDictionary:(id)a3 localizations:(id)a4
{
  id v6;
  id v7;
  PKPaymentPassAction *v8;
  PKPaymentPassAction *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  NSDictionary *rawDictionary;
  uint64_t v14;
  NSDictionary *localizations;
  void *v16;
  uint64_t v17;
  NSString *identifier;
  void *v19;
  PKPaymentPassActionRemoteConfiguration *v20;
  void *v21;
  uint64_t v22;
  PKPaymentPassActionRemoteConfiguration *remoteContentConfiguration;
  PKPaymentPassActionRemoteConfiguration *v24;
  PKPaymentPassActionRemoteConfiguration *v25;
  void *v26;
  uint64_t v27;
  NSString *title;
  void *v29;
  uint64_t v30;
  NSString *actionDescription;
  void *v32;
  uint64_t v33;
  NSString *confirmationTitle;
  void *v35;
  uint64_t v36;
  NSString *relevantPropertyIdentifier;
  void *v38;
  uint64_t v39;
  NSString *associatedPlanIdentifier;
  void *v41;
  uint64_t v42;
  NSString *associatedEnteredValueIdentifier;
  void *v44;
  uint64_t v45;
  NSString *associatedAutoTopUpIdentifier;
  void *v47;
  uint64_t v48;
  NSDictionary *appletData;
  void *v50;
  uint64_t v51;
  NSDate *availableFromRaw;
  void *v53;
  uint64_t v54;
  NSDate *availableUntilRaw;
  void *v56;
  uint64_t v57;
  NSString *unavailableBeforeReason;
  void *v59;
  uint64_t v60;
  NSString *unavailableAfterReason;
  void *v62;
  uint64_t v63;
  NSString *unavailableActionReason;
  void *v65;
  uint64_t v66;
  NSString *unavailableActionTitle;
  void *v68;
  uint64_t v69;
  NSString *unavailableActionURL;
  void *v71;
  uint64_t v72;
  NSString *serviceProviderIdentifier;
  void *v74;
  uint64_t v75;
  NSString *serviceProviderLocalizedDisplayName;
  void *v77;
  uint64_t v78;
  NSString *serviceProviderCountryCode;
  void *v80;
  void *v81;
  uint64_t v82;
  NSArray *serviceProviderAcceptedNetworks;
  void *v84;
  void *v85;
  void *v86;
  id auxiliaryPassInformationItemIdentifier;
  PKEnteredValueActionItem *v88;
  void *enteredValueItem;
  void *v90;
  uint64_t v91;
  NSString *headerText;
  void *v93;
  uint64_t v94;
  NSString *footerText;
  double v96;
  double v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t i;
  uint64_t v103;
  PKSelectedItemActionItem *v104;
  uint64_t v105;
  NSArray *selectedActionItems;
  void *v107;
  void *v108;
  void *v109;
  NSString *v110;
  void *v111;
  id v112;
  void *v113;
  uint64_t v114;
  void *v115;
  BOOL v116;
  NSString *v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  id v121;
  uint64_t v122;
  NSDictionary *vehicleFunctionActions;
  void *v124;
  uint64_t v125;
  NSString *v126;
  void *v127;
  uint64_t v128;
  NSString *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t j;
  uint64_t v135;
  PKPurchaseNewActionItem *v136;
  uint64_t v137;
  NSArray *purchaseNewActionItems;
  void *v139;
  void *v140;
  NSString *v141;
  void *v142;
  id v143;
  void *v144;
  uint64_t v145;
  BOOL v146;
  NSString *v147;
  void *v148;
  uint64_t v149;
  NSString *v150;
  void *v151;
  uint64_t v152;
  NSString *v153;
  PKAutoTopUpActionItem *v154;
  uint64_t v155;
  NSString *auxiliaryPassInformationIdentifier;
  uint64_t v157;
  NSString *v158;
  NSString *v159;
  PKPaymentPassAction *v160;
  void *v162;
  void *v163;
  id v164;
  void *v165;
  void *v166;
  void *v167;
  _QWORD v168[4];
  PKPaymentPassAction *v169;
  _QWORD v170[4];
  id v171;
  uint64_t v172;
  uint64_t v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  double v182;
  objc_super v183;
  _BYTE v184[128];
  _BYTE v185[128];
  uint64_t v186;

  v186 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v183.receiver = self;
  v183.super_class = (Class)PKPaymentPassAction;
  v8 = -[PKPaymentPassAction init](&v183, sel_init);
  v9 = v8;
  v10 = MEMORY[0x1E0C809B0];
  v11 = &unk_190441000;
  if (!v8)
    goto LABEL_72;
  v8->_reverseButtonTitleForLegacySuica = 0;
  v12 = objc_msgSend(v6, "copy");
  rawDictionary = v9->_rawDictionary;
  v9->_rawDictionary = (NSDictionary *)v12;

  v14 = objc_msgSend(v7, "copy");
  localizations = v9->_localizations;
  v9->_localizations = (NSDictionary *)v14;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "copy");
  identifier = v9->_identifier;
  v9->_identifier = (NSString *)v17;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("type"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_type = PKPaymentPassActionTypeFromString(v19);

  v20 = [PKPaymentPassActionRemoteConfiguration alloc];
  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("remoteContentConfiguration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PKPaymentPassActionRemoteConfiguration initWithDictionary:](v20, "initWithDictionary:", v21);
  remoteContentConfiguration = v9->_remoteContentConfiguration;
  v9->_remoteContentConfiguration = (PKPaymentPassActionRemoteConfiguration *)v22;

  if (!v9->_remoteContentConfiguration && objc_msgSend(v6, "PKBoolForKey:", CFSTR("hasRemoteContent")))
  {
    v24 = -[PKPaymentPassActionRemoteConfiguration initWithRequiresAppletData:appletDataRequiresEncryption:]([PKPaymentPassActionRemoteConfiguration alloc], "initWithRequiresAppletData:appletDataRequiresEncryption:", objc_msgSend(v6, "PKBoolForKey:", CFSTR("remoteContentRequiresAppletData")), 1);
    v25 = v9->_remoteContentConfiguration;
    v9->_remoteContentConfiguration = v24;

  }
  objc_msgSend(v6, "PKStringForKey:", CFSTR("title"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "copy");
  title = v9->_title;
  v9->_title = (NSString *)v27;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("description"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "copy");
  actionDescription = v9->_actionDescription;
  v9->_actionDescription = (NSString *)v30;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("confirmationTitle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "copy");
  confirmationTitle = v9->_confirmationTitle;
  v9->_confirmationTitle = (NSString *)v33;

  v9->_featured = objc_msgSend(v6, "PKBoolForKey:", CFSTR("featured"));
  objc_msgSend(v6, "PKStringForKey:", CFSTR("relevantPropertyIdentifier"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "copy");
  relevantPropertyIdentifier = v9->_relevantPropertyIdentifier;
  v9->_relevantPropertyIdentifier = (NSString *)v36;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("associatedPlanIdentifier"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "copy");
  associatedPlanIdentifier = v9->_associatedPlanIdentifier;
  v9->_associatedPlanIdentifier = (NSString *)v39;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("associatedEnteredValueIdentifier"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "copy");
  associatedEnteredValueIdentifier = v9->_associatedEnteredValueIdentifier;
  v9->_associatedEnteredValueIdentifier = (NSString *)v42;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("associatedAutoTopUpIdentifier"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "copy");
  associatedAutoTopUpIdentifier = v9->_associatedAutoTopUpIdentifier;
  v9->_associatedAutoTopUpIdentifier = (NSString *)v45;

  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("appletData"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "copy");
  appletData = v9->_appletData;
  v9->_appletData = (NSDictionary *)v48;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("availableFrom"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = 0.0;
  _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v50, 0, &v182);
  v51 = objc_claimAutoreleasedReturnValue();
  availableFromRaw = v9->_availableFromRaw;
  v9->_availableFromRaw = (NSDate *)v51;

  if (v9->_availableFromRaw)
    v9->_availableFromOffsetFromUTC = v182;
  objc_msgSend(v6, "PKDateForKey:", CFSTR("availableUntil"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "copy");
  availableUntilRaw = v9->_availableUntilRaw;
  v9->_availableUntilRaw = (NSDate *)v54;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("unavailableBeforeReason"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "copy");
  unavailableBeforeReason = v9->_unavailableBeforeReason;
  v9->_unavailableBeforeReason = (NSString *)v57;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("unavailableAfterReason"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "copy");
  unavailableAfterReason = v9->_unavailableAfterReason;
  v9->_unavailableAfterReason = (NSString *)v60;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("unavailableActionReason"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "copy");
  unavailableActionReason = v9->_unavailableActionReason;
  v9->_unavailableActionReason = (NSString *)v63;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("unavailableActionTitle"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "copy");
  unavailableActionTitle = v9->_unavailableActionTitle;
  v9->_unavailableActionTitle = (NSString *)v66;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("unavailableActionURL"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "copy");
  unavailableActionURL = v9->_unavailableActionURL;
  v9->_unavailableActionURL = (NSString *)v69;

  v9->_unavailableActionBehavior = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("unavailableActionBehavior"));
  objc_msgSend(v6, "PKStringForKey:", CFSTR("serviceProviderIdentifier"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "copy");
  serviceProviderIdentifier = v9->_serviceProviderIdentifier;
  v9->_serviceProviderIdentifier = (NSString *)v72;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("serviceProviderLocalizedDisplayName"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "copy");
  serviceProviderLocalizedDisplayName = v9->_serviceProviderLocalizedDisplayName;
  v9->_serviceProviderLocalizedDisplayName = (NSString *)v75;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("serviceProviderCountryCode"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "copy");
  serviceProviderCountryCode = v9->_serviceProviderCountryCode;
  v9->_serviceProviderCountryCode = (NSString *)v78;

  objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("serviceProviderAcceptedNetworks"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v80)
  {
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("serviceProviderSupportedNetworks"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[PKServiceProviderPaymentRequest availableNetworks](PKServiceProviderPaymentRequest, "availableNetworks");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "pk_intersectArray:", v81);
  v82 = objc_claimAutoreleasedReturnValue();
  serviceProviderAcceptedNetworks = v9->_serviceProviderAcceptedNetworks;
  v9->_serviceProviderAcceptedNetworks = (NSArray *)v82;

  objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("serviceProviderCapabilities"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_serviceProviderCapabilities = PKMerchantCapabilityFromStrings(v84);

  objc_msgSend(v6, "PKSetForKey:", CFSTR("serviceProviderSupportedCountries"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v85, "count"))
    v86 = v85;
  else
    v86 = 0;
  objc_storeStrong((id *)&v9->_serviceProviderSupportedCountries, v86);
  switch(v9->_type)
  {
    case 1uLL:
      objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("item"));
      auxiliaryPassInformationItemIdentifier = (id)objc_claimAutoreleasedReturnValue();
      if (!auxiliaryPassInformationItemIdentifier)
        goto LABEL_70;
      v88 = -[PKEnteredValueActionItem initWithDictionary:]([PKEnteredValueActionItem alloc], "initWithDictionary:", auxiliaryPassInformationItemIdentifier);
      enteredValueItem = v9->_enteredValueItem;
      v9->_enteredValueItem = v88;
      goto LABEL_56;
    case 2uLL:
      v166 = v85;
      v167 = v80;
      v164 = v7;
      v165 = v50;
      objc_msgSend(v6, "PKStringForKey:", CFSTR("headerText"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v90, "copy");
      headerText = v9->_headerText;
      v9->_headerText = (NSString *)v91;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("footerText"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v93, "copy");
      footerText = v9->_footerText;
      v9->_footerText = (NSString *)v94;

      objc_msgSend(v6, "PKDoubleForKey:", CFSTR("availableFromRelative"));
      v9->_availableFromRelative = v96;
      objc_msgSend(v6, "PKDoubleForKey:", CFSTR("availableUntilRelative"));
      v9->_availableUntilRelative = v97;
      auxiliaryPassInformationItemIdentifier = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v178 = 0u;
      v179 = 0u;
      v180 = 0u;
      v181 = 0u;
      objc_msgSend(v6, "PKArrayForKey:", CFSTR("items"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v178, v185, 16);
      if (v99)
      {
        v100 = v99;
        v101 = *(_QWORD *)v179;
        do
        {
          for (i = 0; i != v100; ++i)
          {
            if (*(_QWORD *)v179 != v101)
              objc_enumerationMutation(v98);
            v103 = *(_QWORD *)(*((_QWORD *)&v178 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v104 = -[PKSelectedItemActionItem initWithDictionary:]([PKSelectedItemActionItem alloc], "initWithDictionary:", v103);
              if (v104)
                objc_msgSend(auxiliaryPassInformationItemIdentifier, "addObject:", v104);

            }
          }
          v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v178, v185, 16);
        }
        while (v100);
      }

      v105 = objc_msgSend(auxiliaryPassInformationItemIdentifier, "copy");
      selectedActionItems = v9->_selectedActionItems;
      v9->_selectedActionItems = (NSArray *)v105;

      if (-[NSArray count](v9->_selectedActionItems, "count") != 1)
        goto LABEL_59;
      -[NSArray firstObject](v9->_selectedActionItems, "firstObject");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "amount");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "currency");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      PKFormattedCurrencyStringFromNumber(v108, v109);
      v162 = (void *)objc_claimAutoreleasedReturnValue();

      v110 = v9->_actionDescription;
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByTrimmingCharactersInSet:](v110, "stringByTrimmingCharactersInSet:", v111);
      v112 = (id)objc_claimAutoreleasedReturnValue();
      v85 = v166;
      v80 = v167;
      if (v112)
      {
        v113 = v112;
        v114 = objc_msgSend(v112, "length");

        if (v114)
        {
          v115 = v162;
          v7 = v164;
          v10 = MEMORY[0x1E0C809B0];
          v11 = (_QWORD *)&unk_190441000;
          if (v162)
          {
            v116 = -[NSString containsString:](v9->_actionDescription, "containsString:", v162);
            v115 = v162;
            if (!v116)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v162, v9->_actionDescription);
              v117 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_63:
              v158 = v9->_actionDescription;
              v9->_actionDescription = v117;

              v115 = v162;
            }
          }

LABEL_69:
          goto LABEL_70;
        }
      }
      else
      {

      }
      v117 = v162;
      v7 = v164;
      v10 = MEMORY[0x1E0C809B0];
      v11 = (_QWORD *)&unk_190441000;
      goto LABEL_63;
    case 3uLL:
      objc_msgSend(v6, "PKStringForKey:", CFSTR("url"));
      auxiliaryPassInformationItemIdentifier = (id)objc_claimAutoreleasedReturnValue();
      if (!auxiliaryPassInformationItemIdentifier)
        goto LABEL_70;
      v118 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", auxiliaryPassInformationItemIdentifier);
      enteredValueItem = v9->_externalURL;
      v9->_externalURL = (NSURL *)v118;
      goto LABEL_56;
    case 4uLL:
      objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("vehicleFunctionActions"));
      auxiliaryPassInformationItemIdentifier = (id)objc_claimAutoreleasedReturnValue();
      if (!auxiliaryPassInformationItemIdentifier)
        goto LABEL_70;
      v166 = v85;
      v167 = v80;
      v119 = v10;
      v120 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v170[0] = v119;
      v170[1] = 3221225472;
      v170[2] = __56__PKPaymentPassAction_initWithDictionary_localizations___block_invoke;
      v170[3] = &unk_1E2AC9888;
      v172 = objc_opt_class();
      v173 = objc_opt_class();
      v121 = v120;
      v171 = v121;
      objc_msgSend(auxiliaryPassInformationItemIdentifier, "enumerateKeysAndObjectsUsingBlock:", v170);
      if (objc_msgSend(v121, "count"))
      {
        v122 = objc_msgSend(v121, "copy");
        vehicleFunctionActions = v9->_vehicleFunctionActions;
        v9->_vehicleFunctionActions = (NSDictionary *)v122;

      }
      v10 = v119;
      v11 = &unk_190441000;
      goto LABEL_60;
    case 5uLL:
      v166 = v85;
      v167 = v80;
      v164 = v7;
      v165 = v50;
      objc_msgSend(v6, "PKStringForKey:", CFSTR("headerText"));
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = objc_msgSend(v124, "copy");
      v126 = v9->_headerText;
      v9->_headerText = (NSString *)v125;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("footerText"));
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = objc_msgSend(v127, "copy");
      v129 = v9->_footerText;
      v9->_footerText = (NSString *)v128;

      auxiliaryPassInformationItemIdentifier = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v174 = 0u;
      v175 = 0u;
      v176 = 0u;
      v177 = 0u;
      objc_msgSend(v6, "PKArrayForKey:", CFSTR("items"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v174, v184, 16);
      if (v131)
      {
        v132 = v131;
        v133 = *(_QWORD *)v175;
        do
        {
          for (j = 0; j != v132; ++j)
          {
            if (*(_QWORD *)v175 != v133)
              objc_enumerationMutation(v130);
            v135 = *(_QWORD *)(*((_QWORD *)&v174 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v136 = -[PKPurchaseNewActionItem initWithDictionary:]([PKPurchaseNewActionItem alloc], "initWithDictionary:", v135);
              if (v136)
                objc_msgSend(auxiliaryPassInformationItemIdentifier, "addObject:", v136);

            }
          }
          v132 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v174, v184, 16);
        }
        while (v132);
      }

      v137 = objc_msgSend(auxiliaryPassInformationItemIdentifier, "copy");
      purchaseNewActionItems = v9->_purchaseNewActionItems;
      v9->_purchaseNewActionItems = (NSArray *)v137;

      if (-[NSArray count](v9->_purchaseNewActionItems, "count") == 1)
      {
        -[NSArray firstObject](v9->_purchaseNewActionItems, "firstObject");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "amount");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "currency");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        PKFormattedCurrencyStringFromNumber(v139, v140);
        v163 = (void *)objc_claimAutoreleasedReturnValue();

        v141 = v9->_actionDescription;
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString stringByTrimmingCharactersInSet:](v141, "stringByTrimmingCharactersInSet:", v142);
        v143 = (id)objc_claimAutoreleasedReturnValue();
        v85 = v166;
        v80 = v167;
        if (v143)
        {
          v144 = v143;
          v145 = objc_msgSend(v143, "length");

          if (v145)
          {
            v146 = -[NSString containsString:](v9->_actionDescription, "containsString:", v163);
            v7 = v164;
            v10 = MEMORY[0x1E0C809B0];
            v11 = (_QWORD *)&unk_190441000;
            if (v146)
            {
LABEL_68:

              goto LABEL_69;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v163, v9->_actionDescription);
            v147 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_67:
            v159 = v9->_actionDescription;
            v9->_actionDescription = v147;

            goto LABEL_68;
          }
        }
        else
        {

        }
        v147 = v163;
        v7 = v164;
        v10 = MEMORY[0x1E0C809B0];
        v11 = &unk_190441000;
        goto LABEL_67;
      }
LABEL_59:
      v7 = v164;
      v50 = v165;
      v10 = MEMORY[0x1E0C809B0];
      v11 = (_QWORD *)&unk_190441000;
LABEL_60:
      v85 = v166;
      v80 = v167;
LABEL_70:

LABEL_71:
LABEL_72:
      v168[0] = v10;
      v168[1] = v11[267];
      v168[2] = __56__PKPaymentPassAction_initWithDictionary_localizations___block_invoke_2;
      v168[3] = &unk_1E2AC98B0;
      v160 = v9;
      v169 = v160;
      -[PKPaymentPassAction _processLocalizableStrings:](v160, "_processLocalizableStrings:", v168);

      return v160;
    case 6uLL:
      objc_msgSend(v6, "PKStringForKey:", CFSTR("headerText"));
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = objc_msgSend(v148, "copy");
      v150 = v9->_headerText;
      v9->_headerText = (NSString *)v149;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("footerText"));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = objc_msgSend(v151, "copy");
      v153 = v9->_footerText;
      v9->_footerText = (NSString *)v152;

      objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("item"));
      auxiliaryPassInformationItemIdentifier = (id)objc_claimAutoreleasedReturnValue();
      if (!auxiliaryPassInformationItemIdentifier)
        goto LABEL_70;
      v154 = -[PKAutoTopUpActionItem initWithDictionary:]([PKAutoTopUpActionItem alloc], "initWithDictionary:", auxiliaryPassInformationItemIdentifier);
      enteredValueItem = v9->_autoTopUpItem;
      v9->_autoTopUpItem = v154;
LABEL_56:

      goto LABEL_70;
    case 7uLL:
      objc_msgSend(v6, "PKStringForKey:", CFSTR("auxiliaryPassInformationIdentifier"));
      v155 = objc_claimAutoreleasedReturnValue();
      auxiliaryPassInformationIdentifier = v9->_auxiliaryPassInformationIdentifier;
      v9->_auxiliaryPassInformationIdentifier = (NSString *)v155;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("auxiliaryPassInformationItemIdentifier"));
      v157 = objc_claimAutoreleasedReturnValue();
      auxiliaryPassInformationItemIdentifier = v9->_auxiliaryPassInformationItemIdentifier;
      v9->_auxiliaryPassInformationItemIdentifier = (NSString *)v157;
      goto LABEL_70;
    case 8uLL:
      objc_msgSend(v6, "PKStringForKey:", CFSTR("context"));
      auxiliaryPassInformationItemIdentifier = (id)objc_claimAutoreleasedReturnValue();
      v9->_context = PKPassTileContextFromString(auxiliaryPassInformationItemIdentifier);
      goto LABEL_70;
    default:
      goto LABEL_71;
  }
}

void __56__PKPaymentPassAction_initWithDictionary_localizations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;

  v5 = a2;
  v6 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v5);
    if (objc_msgSend(v7, "scanHexInt:", &v10) && objc_msgSend(v7, "isAtEnd"))
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

    }
  }

}

id __56__PKPaymentPassAction_initWithDictionary_localizations___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v3 = a2;
    objc_msgSend(v2, "objectForKeyedSubscript:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (void *)v4;
    else
      v6 = v3;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (PKPaymentPassAction)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  PKPaymentPassAction *v8;

  v6 = a3;
  if (a4)
  {
    objc_msgSend(a4, "pathForResource:ofType:", CFSTR("actions"), CFSTR("strings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v7);
    a4 = (id)objc_claimAutoreleasedReturnValue();
    self = -[PKPaymentPassAction initWithDictionary:localizations:](self, "initWithDictionary:localizations:", v6, a4);

  }
  v8 = -[PKPaymentPassAction initWithDictionary:localizations:](self, "initWithDictionary:localizations:", v6, a4);

  return v8;
}

- (id)_initWithExternalURL:(id)a3
{
  id v5;
  PKPaymentPassAction *v6;
  PKPaymentPassAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPassAction;
  v6 = -[PKPaymentPassAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong((id *)&v6->_externalURL, a3);
  }

  return v7;
}

- (id)_initWithContext:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentPassAction;
  result = -[PKPaymentPassAction init](&v5, sel_init);
  if (result)
  {
    *((_QWORD *)result + 8) = 8;
    *((_QWORD *)result + 32) = a3;
  }
  return result;
}

- (id)_initWithImage:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  PKPaymentPassAction *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPassAction;
  v9 = -[PKPaymentPassAction init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    v9->_type = 9;
    objc_storeStrong((id *)&v9->_image, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (id)_localizableKeys
{
  return &unk_1E2C3DF48;
}

- (NSString)title
{
  uint64_t v2;

  v2 = 96;
  if (!self->_reverseButtonTitleForLegacySuica)
    v2 = 24;
  return (NSString *)*(id *)((char *)&self->super.isa + v2);
}

- (void)_processLocalizableStrings:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[PKPaymentPassAction _localizableKeys](self, "_localizableKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[PKPaymentPassAction valueForKey:](self, "valueForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v4[2](v4, v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              -[PKPaymentPassAction setValue:forKey:](self, "setValue:forKey:", v12, v10);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }

    -[PKEnteredValueActionItem _processLocalizableStrings:](self->_enteredValueItem, "_processLocalizableStrings:", v4);
    -[PKAutoTopUpActionItem _processLocalizableStrings:](self->_autoTopUpItem, "_processLocalizableStrings:", v4);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = self->_selectedActionItems;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "_processLocalizableStrings:", v4, (_QWORD)v18);
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v15);
    }

  }
}

- (id)actionUpdatedWithDictionary:(id)a3 localizations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  -[PKPaymentPassAction identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11 = (void *)-[NSDictionary mutableCopy](self->_rawDictionary, "mutableCopy");
    objc_msgSend(v11, "addEntriesFromDictionary:", v6);
    v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDictionary:localizations:", v11, v7);
    v13 = v12;
    if (v12)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __65__PKPaymentPassAction_actionUpdatedWithDictionary_localizations___block_invoke;
      v15[3] = &unk_1E2AC98B0;
      v15[4] = self;
      objc_msgSend(v12, "_processLocalizableStrings:", v15);
      objc_msgSend(v13, "setAssociatedPlan:", self->_associatedPlan);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __65__PKPaymentPassAction_actionUpdatedWithDictionary_localizations___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v3 = a2;
    objc_msgSend(v2, "objectForKeyedSubscript:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (void *)v4;
    else
      v6 = v3;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)effectiveActionForActions:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_69);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __49__PKPaymentPassAction_effectiveActionForActions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActionAvailable");
}

- (NSDate)availableFrom
{
  PKTransitCommutePlan *associatedPlan;
  NSDate *v4;
  NSDate *v5;
  NSDate *availableFromRaw;
  NSDate *v7;
  void *v9;
  void *v10;
  void *v11;

  if (self->_type == 2
    && (associatedPlan = self->_associatedPlan) != 0
    && !self->_availableFromRaw
    && self->_availableFromRelative != 0.0
    && (-[PKTransitCommutePlan startDate](associatedPlan, "startDate"),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v10 = v9,
        objc_msgSend(v9, "dateByAddingTimeInterval:", self->_availableFromRelative),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    v4 = v11;
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }
  if (self->_availableFromRaw)
    availableFromRaw = self->_availableFromRaw;
  else
    availableFromRaw = v4;
  v7 = availableFromRaw;

  return v7;
}

- (NSDate)availableUntil
{
  PKTransitCommutePlan *associatedPlan;
  NSDate *v4;
  NSDate *v5;
  NSDate *availableUntilRaw;
  NSDate *v7;
  void *v9;
  void *v10;
  void *v11;

  if (self->_type == 2
    && (associatedPlan = self->_associatedPlan) != 0
    && !self->_availableUntilRaw
    && self->_availableUntilRelative != 0.0
    && (-[PKTransitCommutePlan expiryDate](associatedPlan, "expiryDate"),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v10 = v9,
        objc_msgSend(v9, "dateByAddingTimeInterval:", self->_availableUntilRelative),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    v4 = v11;
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }
  if (self->_availableUntilRaw)
    availableUntilRaw = self->_availableUntilRaw;
  else
    availableUntilRaw = v4;
  v7 = availableUntilRaw;

  return v7;
}

- (BOOL)isActionAvailable
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PKPaymentPassAction availableFrom](self, "availableFrom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassAction availableUntil](self, "availableUntil");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", v3) == 1 && objc_msgSend(v5, "compare:", v4) == -1;

  return v6;
}

- (BOOL)hasRemoteContent
{
  return self->_remoteContentConfiguration != 0;
}

- (BOOL)remoteContentRequiresAppletData
{
  PKPaymentPassActionRemoteConfiguration *remoteContentConfiguration;

  remoteContentConfiguration = self->_remoteContentConfiguration;
  if (remoteContentConfiguration)
    LOBYTE(remoteContentConfiguration) = -[PKPaymentPassActionRemoteConfiguration requiresAppletData](remoteContentConfiguration, "requiresAppletData");
  return (char)remoteContentConfiguration;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentPassAction)initWithCoder:(id)a3
{
  id v4;
  PKPaymentPassAction *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *rawDictionary;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSDictionary *localizations;
  void *v23;
  uint64_t v24;
  NSString *identifier;
  void *v26;
  uint64_t v27;
  PKPaymentPassActionRemoteConfiguration *remoteContentConfiguration;
  void *v29;
  uint64_t v30;
  NSString *title;
  void *v32;
  uint64_t v33;
  NSString *actionDescription;
  void *v35;
  uint64_t v36;
  NSString *confirmationTitle;
  uint64_t v38;
  NSDictionary *appletData;
  void *v40;
  uint64_t v41;
  NSString *relevantPropertyIdentifier;
  void *v43;
  uint64_t v44;
  NSString *associatedPlanIdentifier;
  void *v46;
  uint64_t v47;
  NSString *associatedEnteredValueIdentifier;
  void *v49;
  uint64_t v50;
  NSString *associatedAutoTopUpIdentifier;
  void *v52;
  uint64_t v53;
  PKTransitCommutePlan *associatedPlan;
  void *v55;
  uint64_t v56;
  NSDate *availableFromRaw;
  double v58;
  void *v59;
  uint64_t v60;
  NSDate *availableUntilRaw;
  double v62;
  double v63;
  void *v64;
  uint64_t v65;
  NSString *unavailableBeforeReason;
  void *v67;
  uint64_t v68;
  NSString *unavailableAfterReason;
  void *v70;
  uint64_t v71;
  NSString *unavailableActionReason;
  void *v73;
  uint64_t v74;
  NSString *unavailableActionTitle;
  void *v76;
  uint64_t v77;
  NSString *unavailableActionURL;
  void *v79;
  uint64_t v80;
  NSString *serviceProviderIdentifier;
  void *v82;
  uint64_t v83;
  NSString *serviceProviderLocalizedDisplayName;
  void *v85;
  uint64_t v86;
  NSString *serviceProviderCountryCode;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  NSArray *serviceProviderAcceptedNetworks;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  NSSet *serviceProviderSupportedCountries;
  uint64_t v100;
  PKEnteredValueActionItem *enteredValueItem;
  uint64_t v102;
  PKAutoTopUpActionItem *autoTopUpItem;
  void *v104;
  uint64_t v105;
  NSString *headerText;
  void *v107;
  uint64_t v108;
  NSString *footerText;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  uint64_t v114;
  NSArray *selectedActionItems;
  uint64_t v116;
  NSURL *externalURL;
  id v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  NSDictionary *vehicleFunctionActions;
  uint64_t v123;
  NSString *auxiliaryPassInformationIdentifier;
  uint64_t v125;
  NSString *auxiliaryPassInformationItemIdentifier;
  void *v127;
  uint64_t v128;
  PKImage *image;
  PKPaymentPassActionRemoteConfiguration *v130;
  PKPaymentPassActionRemoteConfiguration *v131;
  void *v133;
  void *v134;
  objc_super v135;

  v4 = a3;
  v135.receiver = self;
  v135.super_class = (Class)PKPaymentPassAction;
  v5 = -[PKPaymentPassAction init](&v135, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    rawDictionary = v5->_rawDictionary;
    v5->_rawDictionary = (NSDictionary *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    localizations = v5->_localizations;
    v5->_localizations = (NSDictionary *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPaymentPassActionTypeFromString(v26);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteContentConfiguration"));
    v27 = objc_claimAutoreleasedReturnValue();
    remoteContentConfiguration = v5->_remoteContentConfiguration;
    v5->_remoteContentConfiguration = (PKPaymentPassActionRemoteConfiguration *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionDescription"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    actionDescription = v5->_actionDescription;
    v5->_actionDescription = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmationTitle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    confirmationTitle = v5->_confirmationTitle;
    v5->_confirmationTitle = (NSString *)v36;

    v5->_featured = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("featured"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletData"));
    v38 = objc_claimAutoreleasedReturnValue();
    appletData = v5->_appletData;
    v5->_appletData = (NSDictionary *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relevantPropertyIdentifier"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "copy");
    relevantPropertyIdentifier = v5->_relevantPropertyIdentifier;
    v5->_relevantPropertyIdentifier = (NSString *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPlanIdentifier"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "copy");
    associatedPlanIdentifier = v5->_associatedPlanIdentifier;
    v5->_associatedPlanIdentifier = (NSString *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedEnteredValueIdentifier"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "copy");
    associatedEnteredValueIdentifier = v5->_associatedEnteredValueIdentifier;
    v5->_associatedEnteredValueIdentifier = (NSString *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedAutoTopUpIdentifier"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "copy");
    associatedAutoTopUpIdentifier = v5->_associatedAutoTopUpIdentifier;
    v5->_associatedAutoTopUpIdentifier = (NSString *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPlan"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "copy");
    associatedPlan = v5->_associatedPlan;
    v5->_associatedPlan = (PKTransitCommutePlan *)v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availableFrom"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "copy");
    availableFromRaw = v5->_availableFromRaw;
    v5->_availableFromRaw = (NSDate *)v56;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("availableFromOffsetFromUTC"));
    v5->_availableFromOffsetFromUTC = v58;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availableUntil"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "copy");
    availableUntilRaw = v5->_availableUntilRaw;
    v5->_availableUntilRaw = (NSDate *)v60;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("availableFromRelative"));
    v5->_availableFromRelative = v62;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("availableUntilRelative"));
    v5->_availableUntilRelative = v63;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unavailableBeforeReason"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "copy");
    unavailableBeforeReason = v5->_unavailableBeforeReason;
    v5->_unavailableBeforeReason = (NSString *)v65;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unavailableAfterReason"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "copy");
    unavailableAfterReason = v5->_unavailableAfterReason;
    v5->_unavailableAfterReason = (NSString *)v68;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unavailableActionReason"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "copy");
    unavailableActionReason = v5->_unavailableActionReason;
    v5->_unavailableActionReason = (NSString *)v71;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unavailableActionTitle"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "copy");
    unavailableActionTitle = v5->_unavailableActionTitle;
    v5->_unavailableActionTitle = (NSString *)v74;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unavailableActionURL"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "copy");
    unavailableActionURL = v5->_unavailableActionURL;
    v5->_unavailableActionURL = (NSString *)v77;

    v5->_unavailableActionBehavior = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("unavailableActionBehavior"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceProviderIdentifier"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "copy");
    serviceProviderIdentifier = v5->_serviceProviderIdentifier;
    v5->_serviceProviderIdentifier = (NSString *)v80;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceProviderLocalizedDisplayName"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "copy");
    serviceProviderLocalizedDisplayName = v5->_serviceProviderLocalizedDisplayName;
    v5->_serviceProviderLocalizedDisplayName = (NSString *)v83;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceProviderCountryCode"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "copy");
    serviceProviderCountryCode = v5->_serviceProviderCountryCode;
    v5->_serviceProviderCountryCode = (NSString *)v86;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceProviderCapabilities"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_serviceProviderCapabilities = objc_msgSend(v88, "unsignedIntegerValue");

    v89 = (void *)MEMORY[0x1E0C99E60];
    v90 = objc_opt_class();
    objc_msgSend(v89, "setWithObjects:", v90, objc_opt_class(), 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v91, CFSTR("serviceProviderAcceptedNetworks"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "copy");
    serviceProviderAcceptedNetworks = v5->_serviceProviderAcceptedNetworks;
    v5->_serviceProviderAcceptedNetworks = (NSArray *)v93;

    v95 = (void *)MEMORY[0x1E0C99E60];
    v96 = objc_opt_class();
    objc_msgSend(v95, "setWithObjects:", v96, objc_opt_class(), 0);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v97, CFSTR("serviceProviderSupportedCountries"));
    v98 = objc_claimAutoreleasedReturnValue();
    serviceProviderSupportedCountries = v5->_serviceProviderSupportedCountries;
    v5->_serviceProviderSupportedCountries = (NSSet *)v98;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enteredValueItem"));
    v100 = objc_claimAutoreleasedReturnValue();
    enteredValueItem = v5->_enteredValueItem;
    v5->_enteredValueItem = (PKEnteredValueActionItem *)v100;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoTopUpItem"));
    v102 = objc_claimAutoreleasedReturnValue();
    autoTopUpItem = v5->_autoTopUpItem;
    v5->_autoTopUpItem = (PKAutoTopUpActionItem *)v102;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("headerText"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v104, "copy");
    headerText = v5->_headerText;
    v5->_headerText = (NSString *)v105;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footerText"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v107, "copy");
    footerText = v5->_footerText;
    v5->_footerText = (NSString *)v108;

    v110 = (void *)MEMORY[0x1E0C99E60];
    v111 = objc_opt_class();
    objc_msgSend(v110, "setWithObjects:", v111, objc_opt_class(), 0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v112, CFSTR("selectedActionItems"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v113, "copy");
    selectedActionItems = v5->_selectedActionItems;
    v5->_selectedActionItems = (NSArray *)v114;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalURL"));
    v116 = objc_claimAutoreleasedReturnValue();
    externalURL = v5->_externalURL;
    v5->_externalURL = (NSURL *)v116;

    v118 = objc_alloc(MEMORY[0x1E0C99E60]);
    v119 = objc_opt_class();
    v120 = (void *)objc_msgSend(v118, "initWithObjects:", v119, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v120, CFSTR("vehicleFunctionActions"));
    v121 = objc_claimAutoreleasedReturnValue();
    vehicleFunctionActions = v5->_vehicleFunctionActions;
    v5->_vehicleFunctionActions = (NSDictionary *)v121;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auxiliaryPassInformationIdentifier"));
    v123 = objc_claimAutoreleasedReturnValue();
    auxiliaryPassInformationIdentifier = v5->_auxiliaryPassInformationIdentifier;
    v5->_auxiliaryPassInformationIdentifier = (NSString *)v123;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auxiliaryPassInformationItemIdentifier"));
    v125 = objc_claimAutoreleasedReturnValue();
    auxiliaryPassInformationItemIdentifier = v5->_auxiliaryPassInformationItemIdentifier;
    v5->_auxiliaryPassInformationItemIdentifier = (NSString *)v125;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_context = PKPassTileContextFromString(v127);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v128 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (PKImage *)v128;

    if (!v5->_remoteContentConfiguration
      && objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasRemoteContent")))
    {
      v130 = -[PKPaymentPassActionRemoteConfiguration initWithRequiresAppletData:appletDataRequiresEncryption:]([PKPaymentPassActionRemoteConfiguration alloc], "initWithRequiresAppletData:appletDataRequiresEncryption:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("remoteContentRequiresAppletData")), 1);
      v131 = v5->_remoteContentConfiguration;
      v5->_remoteContentConfiguration = v130;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", self->_rawDictionary, CFSTR("rawDictionary"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_localizations, CFSTR("localizations"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_remoteContentConfiguration, CFSTR("remoteContentConfiguration"));
  v4 = self->_type - 1;
  if (v4 > 8)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AC98F0[v4];
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("type"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_appletData, CFSTR("appletData"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_actionDescription, CFSTR("actionDescription"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_confirmationTitle, CFSTR("confirmationTitle"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_featured, CFSTR("featured"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_relevantPropertyIdentifier, CFSTR("relevantPropertyIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_associatedPlanIdentifier, CFSTR("associatedPlanIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_associatedEnteredValueIdentifier, CFSTR("associatedEnteredValueIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_associatedAutoTopUpIdentifier, CFSTR("associatedAutoTopUpIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_associatedPlan, CFSTR("associatedPlan"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_availableFromRaw, CFSTR("availableFrom"));
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("availableFromOffsetFromUTC"), self->_availableFromOffsetFromUTC);
  objc_msgSend(v8, "encodeObject:forKey:", self->_availableUntilRaw, CFSTR("availableUntil"));
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("availableFromRelative"), self->_availableFromRelative);
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("availableUntilRelative"), self->_availableUntilRelative);
  objc_msgSend(v8, "encodeObject:forKey:", self->_unavailableBeforeReason, CFSTR("unavailableBeforeReason"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_unavailableAfterReason, CFSTR("unavailableAfterReason"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_unavailableActionReason, CFSTR("unavailableActionReason"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_unavailableActionTitle, CFSTR("unavailableActionTitle"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_unavailableActionURL, CFSTR("unavailableActionURL"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_unavailableActionBehavior, CFSTR("unavailableActionBehavior"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_serviceProviderIdentifier, CFSTR("serviceProviderIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_serviceProviderLocalizedDisplayName, CFSTR("serviceProviderLocalizedDisplayName"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_serviceProviderCountryCode, CFSTR("serviceProviderCountryCode"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_serviceProviderAcceptedNetworks, CFSTR("serviceProviderAcceptedNetworks"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_serviceProviderCapabilities);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("serviceProviderCapabilities"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_serviceProviderSupportedCountries, CFSTR("serviceProviderSupportedCountries"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_enteredValueItem, CFSTR("enteredValueItem"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_autoTopUpItem, CFSTR("autoTopUpItem"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_headerText, CFSTR("headerText"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_footerText, CFSTR("footerText"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_selectedActionItems, CFSTR("selectedActionItems"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_externalURL, CFSTR("externalURL"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_vehicleFunctionActions, CFSTR("vehicleFunctionActions"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_auxiliaryPassInformationIdentifier, CFSTR("auxiliaryPassInformationIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_auxiliaryPassInformationItemIdentifier, CFSTR("auxiliaryPassInformationItemIdentifier"));
  PKPassTileContextToString(self->_context);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("context"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v8, "encodeBool:forKey:", -[PKPaymentPassAction hasRemoteContent](self, "hasRemoteContent"), CFSTR("hasRemoteContent"));
  objc_msgSend(v8, "encodeBool:forKey:", -[PKPaymentPassAction remoteContentRequiresAppletData](self, "remoteContentRequiresAppletData"), CFSTR("remoteContentRequiresAppletData"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSDictionary copyWithZone:](self->_rawDictionary, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSDictionary copyWithZone:](self->_localizations, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  *(_QWORD *)(v5 + 64) = self->_type;
  v12 = -[PKPaymentPassActionRemoteConfiguration copyWithZone:](self->_remoteContentConfiguration, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v12;

  v14 = -[NSDictionary copyWithZone:](self->_appletData, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v14;

  v16 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = -[NSString copyWithZone:](self->_actionDescription, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v18;

  v20 = -[NSString copyWithZone:](self->_confirmationTitle, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v20;

  *(_BYTE *)(v5 + 49) = self->_featured;
  v22 = -[NSString copyWithZone:](self->_relevantPropertyIdentifier, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v22;

  v24 = -[NSString copyWithZone:](self->_associatedPlanIdentifier, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v24;

  v26 = -[NSString copyWithZone:](self->_associatedEnteredValueIdentifier, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v26;

  v28 = -[NSString copyWithZone:](self->_associatedAutoTopUpIdentifier, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v28;

  v30 = -[PKTransitCommutePlan copyWithZone:](self->_associatedPlan, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v30;

  v32 = -[NSDate copyWithZone:](self->_availableFromRaw, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v32;

  *(double *)(v5 + 144) = self->_availableFromOffsetFromUTC;
  *(double *)(v5 + 304) = self->_availableFromRelative;
  *(double *)(v5 + 312) = self->_availableUntilRelative;
  v34 = -[NSDate copyWithZone:](self->_availableUntilRaw, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v34;

  v36 = -[NSString copyWithZone:](self->_unavailableBeforeReason, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v36;

  v38 = -[NSString copyWithZone:](self->_unavailableAfterReason, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v38;

  v40 = -[NSString copyWithZone:](self->_unavailableActionReason, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v40;

  v42 = -[NSString copyWithZone:](self->_unavailableActionTitle, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v42;

  v44 = -[NSString copyWithZone:](self->_unavailableActionURL, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v44;

  *(_QWORD *)(v5 + 192) = self->_unavailableActionBehavior;
  v46 = -[NSString copyWithZone:](self->_serviceProviderIdentifier, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v46;

  v48 = -[NSString copyWithZone:](self->_serviceProviderLocalizedDisplayName, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v48;

  v50 = -[NSString copyWithZone:](self->_serviceProviderCountryCode, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v50;

  v52 = -[NSArray copyWithZone:](self->_serviceProviderAcceptedNetworks, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v52;

  *(_QWORD *)(v5 + 240) = self->_serviceProviderCapabilities;
  v54 = -[NSSet copyWithZone:](self->_serviceProviderSupportedCountries, "copyWithZone:", a3);
  v55 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v54;

  v56 = -[PKEnteredValueActionItem copyWithZone:](self->_enteredValueItem, "copyWithZone:", a3);
  v57 = *(void **)(v5 + 352);
  *(_QWORD *)(v5 + 352) = v56;

  v58 = -[PKAutoTopUpActionItem copyWithZone:](self->_autoTopUpItem, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v58;

  v60 = -[NSString copyWithZone:](self->_headerText, "copyWithZone:", a3);
  v61 = *(void **)(v5 + 328);
  *(_QWORD *)(v5 + 328) = v60;

  v62 = -[NSString copyWithZone:](self->_footerText, "copyWithZone:", a3);
  v63 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v62;

  v64 = -[NSArray copyWithZone:](self->_selectedActionItems, "copyWithZone:", a3);
  v65 = *(void **)(v5 + 344);
  *(_QWORD *)(v5 + 344) = v64;

  v66 = -[NSArray copyWithZone:](self->_purchaseNewActionItems, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v66;

  v68 = -[NSURL copyWithZone:](self->_externalURL, "copyWithZone:", a3);
  v69 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v68;

  v70 = -[NSDictionary copyWithZone:](self->_vehicleFunctionActions, "copyWithZone:", a3);
  v71 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v70;

  v72 = -[NSString copyWithZone:](self->_auxiliaryPassInformationIdentifier, "copyWithZone:", a3);
  v73 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v72;

  v74 = -[NSString copyWithZone:](self->_auxiliaryPassInformationItemIdentifier, "copyWithZone:", a3);
  v75 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v74;

  *(_QWORD *)(v5 + 256) = self->_context;
  v76 = -[PKImage copy](self->_image, "copy");
  v77 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v76;

  return (id)v5;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  v4 = self->_type - 1;
  if (v4 > 8)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AC98F0[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);
  if (self->_remoteContentConfiguration)
    objc_msgSend(v3, "appendFormat:", CFSTR("remoteContent: '%@'; "), self->_remoteContentConfiguration);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSArray)serviceProviderSupportedNetworks
{
  return self->_serviceProviderAcceptedNetworks;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (PKPaymentPassActionRemoteConfiguration)remoteContentConfiguration
{
  return self->_remoteContentConfiguration;
}

- (NSDictionary)appletData
{
  return self->_appletData;
}

- (void)setAppletData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)actionDescription
{
  return self->_actionDescription;
}

- (void)setActionDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)confirmationTitle
{
  return self->_confirmationTitle;
}

- (void)setConfirmationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)reverseButtonTitleForLegacySuica
{
  return self->_reverseButtonTitleForLegacySuica;
}

- (void)setReverseButtonTitleForLegacySuica:(BOOL)a3
{
  self->_reverseButtonTitleForLegacySuica = a3;
}

- (BOOL)featured
{
  return self->_featured;
}

- (NSString)relevantPropertyIdentifier
{
  return self->_relevantPropertyIdentifier;
}

- (NSString)associatedEnteredValueIdentifier
{
  return self->_associatedEnteredValueIdentifier;
}

- (void)setAssociatedEnteredValueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)associatedPlanIdentifier
{
  return self->_associatedPlanIdentifier;
}

- (void)setAssociatedPlanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)associatedAutoTopUpIdentifier
{
  return self->_associatedAutoTopUpIdentifier;
}

- (void)setAssociatedAutoTopUpIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (PKTransitCommutePlan)associatedPlan
{
  return self->_associatedPlan;
}

- (void)setAssociatedPlan:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (double)availableFromOffsetFromUTC
{
  return self->_availableFromOffsetFromUTC;
}

- (NSString)unavailableBeforeReason
{
  return self->_unavailableBeforeReason;
}

- (NSString)unavailableAfterReason
{
  return self->_unavailableAfterReason;
}

- (NSString)unavailableActionReason
{
  return self->_unavailableActionReason;
}

- (NSString)unavailableActionTitle
{
  return self->_unavailableActionTitle;
}

- (NSString)unavailableActionURL
{
  return self->_unavailableActionURL;
}

- (unint64_t)unavailableActionBehavior
{
  return self->_unavailableActionBehavior;
}

- (NSString)serviceProviderIdentifier
{
  return self->_serviceProviderIdentifier;
}

- (void)setServiceProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)serviceProviderLocalizedDisplayName
{
  return self->_serviceProviderLocalizedDisplayName;
}

- (void)setServiceProviderLocalizedDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)serviceProviderCountryCode
{
  return self->_serviceProviderCountryCode;
}

- (void)setServiceProviderCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)serviceProviderAcceptedNetworks
{
  return self->_serviceProviderAcceptedNetworks;
}

- (void)setServiceProviderAcceptedNetworks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSSet)serviceProviderSupportedCountries
{
  return self->_serviceProviderSupportedCountries;
}

- (void)setServiceProviderSupportedCountries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (unint64_t)serviceProviderCapabilities
{
  return self->_serviceProviderCapabilities;
}

- (void)setServiceProviderCapabilities:(unint64_t)a3
{
  self->_serviceProviderCapabilities = a3;
}

- (PKImage)image
{
  return self->_image;
}

- (int64_t)context
{
  return self->_context;
}

- (NSString)auxiliaryPassInformationIdentifier
{
  return self->_auxiliaryPassInformationIdentifier;
}

- (NSString)auxiliaryPassInformationItemIdentifier
{
  return self->_auxiliaryPassInformationItemIdentifier;
}

- (NSArray)purchaseNewActionItems
{
  return self->_purchaseNewActionItems;
}

- (NSDictionary)vehicleFunctionActions
{
  return self->_vehicleFunctionActions;
}

- (NSURL)externalURL
{
  return self->_externalURL;
}

- (double)availableFromRelative
{
  return self->_availableFromRelative;
}

- (void)setAvailableFromRelative:(double)a3
{
  self->_availableFromRelative = a3;
}

- (double)availableUntilRelative
{
  return self->_availableUntilRelative;
}

- (void)setAvailableUntilRelative:(double)a3
{
  self->_availableUntilRelative = a3;
}

- (PKAutoTopUpActionItem)autoTopUpItem
{
  return self->_autoTopUpItem;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (NSArray)selectedActionItems
{
  return self->_selectedActionItems;
}

- (PKEnteredValueActionItem)enteredValueItem
{
  return self->_enteredValueItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enteredValueItem, 0);
  objc_storeStrong((id *)&self->_selectedActionItems, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_autoTopUpItem, 0);
  objc_storeStrong((id *)&self->_externalURL, 0);
  objc_storeStrong((id *)&self->_vehicleFunctionActions, 0);
  objc_storeStrong((id *)&self->_purchaseNewActionItems, 0);
  objc_storeStrong((id *)&self->_auxiliaryPassInformationItemIdentifier, 0);
  objc_storeStrong((id *)&self->_auxiliaryPassInformationIdentifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_serviceProviderSupportedCountries, 0);
  objc_storeStrong((id *)&self->_serviceProviderAcceptedNetworks, 0);
  objc_storeStrong((id *)&self->_serviceProviderCountryCode, 0);
  objc_storeStrong((id *)&self->_serviceProviderLocalizedDisplayName, 0);
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_unavailableActionURL, 0);
  objc_storeStrong((id *)&self->_unavailableActionTitle, 0);
  objc_storeStrong((id *)&self->_unavailableActionReason, 0);
  objc_storeStrong((id *)&self->_unavailableAfterReason, 0);
  objc_storeStrong((id *)&self->_unavailableBeforeReason, 0);
  objc_storeStrong((id *)&self->_associatedPlan, 0);
  objc_storeStrong((id *)&self->_associatedAutoTopUpIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedPlanIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedEnteredValueIdentifier, 0);
  objc_storeStrong((id *)&self->_relevantPropertyIdentifier, 0);
  objc_storeStrong((id *)&self->_confirmationTitle, 0);
  objc_storeStrong((id *)&self->_actionDescription, 0);
  objc_storeStrong((id *)&self->_appletData, 0);
  objc_storeStrong((id *)&self->_remoteContentConfiguration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_availableUntilRaw, 0);
  objc_storeStrong((id *)&self->_availableFromRaw, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_localizations, 0);
  objc_storeStrong((id *)&self->_rawDictionary, 0);
}

@end
