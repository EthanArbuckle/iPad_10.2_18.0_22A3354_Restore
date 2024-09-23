@implementation PKPaymentPassContent

- (PKDynamicLayerConfiguration)dynamicLayerConfiguration
{
  return self->_dynamicLayerConfiguration;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPassContent;
  v4 = a3;
  -[PKPassContent encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cobrandName, CFSTR("cobrandName"), v8.receiver, v8.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionServiceURL, CFSTR("transactionServiceURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionServiceRegistrationURL, CFSTR("transactionServiceRegistrationURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionPushTopic, CFSTR("transactionPushTopic"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_messageServiceURL, CFSTR("messageServiceURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_messageServiceRegistrationURL, CFSTR("messageServiceRegistrationURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_messagePushTopic, CFSTR("messagePushTopic"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_appURLScheme, CFSTR("appLaunchURLScheme"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_customerServiceIdentifier, CFSTR("customerServiceIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shippingAddressSeed, CFSTR("shippingAddressSeed"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_speakableMake, CFSTR("speakableCarMake"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_speakableModel, CFSTR("speakableCarModel"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedSuspendedReasonsByAID, CFSTR("suspendedReason"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsTransitOnly, CFSTR("showTransitOnly"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_transitCommutePlanType, CFSTR("commutePlanPassContentType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_availableActions, CFSTR("actions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionGroups, CFSTR("actionGroups"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitCommutePlans, CFSTR("transitCommutePlans"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_upgradeRequests, CFSTR("passUpgrades"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionLocalizations, CFSTR("actionLocalizations"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_auxiliaryRegistrationRequirements, CFSTR("auxiliaryRegistrationRequirements"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dynamicLayerConfiguration, CFSTR("dynamicLayerConfiguration"));
  PKSecureElementIdentityPassTypeToString(self->_identityType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identityType"));

  PKSecureElementAccessPassTypeToString(self->_accessType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accessType"));

  PKSecureElementPaymentPassTypeToString(self->_paymentType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("paymentType"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedSiriIntents, CFSTR("supportedSiriIntents"));
}

- (PKPaymentPassContent)initWithDictionary:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6
{
  id v10;
  id v11;
  PKPaymentPassContent *v12;
  PKPaymentPassContent *v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  PKSiriIntentsConfiguration *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  PKTransitCommutePlanPackage *v58;
  void *v59;
  PKTransitCommutePlanPackage *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t j;
  PKPaymentPassActionGroup *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  PKPaymentPassAction *v80;
  PKPaymentPassAction *v81;
  void *v82;
  void *v83;
  void *v84;
  __CFString *v85;
  __CFString *v86;
  __CFString *v87;
  __CFString *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t m;
  void *v101;
  uint64_t v102;
  NSArray *upgradeRequests;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  PKPassAuxiliaryRegistrationRequirements *v108;
  PKPassAuxiliaryRegistrationRequirements *auxiliaryRegistrationRequirements;
  void *v110;
  PKDynamicLayerConfiguration *v111;
  PKDynamicLayerConfiguration *dynamicLayerConfiguration;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  int *v118;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  PKPaymentPassContent *v130;
  PKTransitCommutePlanPackage *v131;
  id v132;
  void *v133;
  void *v134;
  id obj;
  id v136;
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
  objc_super v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v153.receiver = self;
  v153.super_class = (Class)PKPaymentPassContent;
  v136 = a5;
  v12 = -[PKPassContent initWithDictionary:bundle:privateBundle:passType:](&v153, sel_initWithDictionary_bundle_privateBundle_passType_, v10, v11);
  v13 = v12;
  if (v12)
  {
    -[PKPassContent setLogoText:](v12, "setLogoText:", 0);
    objc_msgSend(v10, "PKStringForKey:", CFSTR("cobrandName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setCobrandName:](v13, "setCobrandName:", v14);

    v15 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v10, "PKStringForKey:", CFSTR("transactionServiceURL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setTransactionServiceURL:](v13, "setTransactionServiceURL:", v17);

    v18 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v10, "PKStringForKey:", CFSTR("transactionServiceRegistrationURL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLWithString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setTransactionServiceRegistrationURL:](v13, "setTransactionServiceRegistrationURL:", v20);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("transactionPushTopic"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setTransactionPushTopic:](v13, "setTransactionPushTopic:", v21);

    v22 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v10, "PKStringForKey:", CFSTR("messageServiceURL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLWithString:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setMessageServiceURL:](v13, "setMessageServiceURL:", v24);

    v25 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v10, "PKStringForKey:", CFSTR("messageServiceRegistrationURL"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "URLWithString:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setMessageServiceRegistrationURL:](v13, "setMessageServiceRegistrationURL:", v27);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("messagePushTopic"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setMessagePushTopic:](v13, "setMessagePushTopic:", v28);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("appLaunchURLScheme"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setAppURLScheme:](v13, "setAppURLScheme:", v29);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("customerServiceIdentifier"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setCustomerServiceIdentifier:](v13, "setCustomerServiceIdentifier:", v30);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("shippingAddressSeed"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setShippingAddressSeed:](v13, "setShippingAddressSeed:", v31);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("speakableCarMake"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setSpeakableMake:](v13, "setSpeakableMake:", v32);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("speakableCarModel"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setSpeakableModel:](v13, "setSpeakableModel:", v33);

    objc_msgSend(v10, "PKDictionaryForKey:", CFSTR("supportedSiriIntents"));
    v34 = objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = -[PKSiriIntentsConfiguration initWithDictionary:]([PKSiriIntentsConfiguration alloc], "initWithDictionary:", v34);
      -[PKPaymentPassContent setSupportedSiriIntents:](v13, "setSupportedSiriIntents:", v35);

    }
    v127 = (void *)v34;
    v130 = v13;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("paymentApplications"));
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v36;
    v38 = (void *)MEMORY[0x1E0C9AA60];
    if (v36)
      v39 = (void *)v36;
    else
      v39 = (void *)MEMORY[0x1E0C9AA60];
    v40 = v39;

    v129 = v10;
    objc_msgSend(v10, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("auxiliaryPaymentApplications"));
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    if (v41)
      v43 = (void *)v41;
    else
      v43 = v38;
    v44 = v43;

    v125 = v44;
    v126 = v40;
    objc_msgSend(v40, "arrayByAddingObjectsFromArray:", v44);
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v157, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v150;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v150 != v47)
            objc_enumerationMutation(obj);
          v49 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
          objc_msgSend(v49, "PKStringForKey:", CFSTR("applicationIdentifier"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "PKStringForKey:", CFSTR("suspendedReason"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPassStringForPassBundle(v51, v11, v136);
          v52 = objc_claimAutoreleasedReturnValue();
          v53 = (void *)v52;
          if (v50)
            v54 = v52 == 0;
          else
            v54 = 1;
          if (!v54)
            objc_msgSend(v134, "setObject:forKey:", v52, v50);

        }
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v157, 16);
      }
      while (v46);
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v134);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setLocalizedSuspendedReasonsByAID:](v130, "setLocalizedSuspendedReasonsByAID:", v55);

    v10 = v129;
    objc_msgSend(v129, "PKDictionaryForKey:", CFSTR("transitCard"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v56)
      -[PKPaymentPassContent setSupportsTransitOnly:](v130, "setSupportsTransitOnly:", objc_msgSend(v56, "PKBoolForKey:", CFSTR("showTransitOnly")));
    v124 = v57;
    v58 = [PKTransitCommutePlanPackage alloc];
    -[PKPassContent backFieldBuckets](v130, "backFieldBuckets");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = -[PKTransitCommutePlanPackage initWithDictionary:backFieldBuckets:bundle:privateBundle:passType:](v58, "initWithDictionary:backFieldBuckets:bundle:privateBundle:passType:", v129, v59, v11, v136, a6);

    -[PKTransitCommutePlanPackage transitCommutePlans](v60, "transitCommutePlans");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)objc_msgSend(v61, "copy");
    -[PKPaymentPassContent setTransitCommutePlans:](v130, "setTransitCommutePlans:", v62);

    v131 = v60;
    -[PKPaymentPassContent setTransitCommutePlanType:](v130, "setTransitCommutePlanType:", -[PKTransitCommutePlanPackage transitCommutePlanType](v60, "transitCommutePlanType"));
    objc_msgSend(v11, "pathForResource:ofType:", CFSTR("actions"), CFSTR("strings"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassContent setActionLocalizations:](v130, "setActionLocalizations:", v63);
    v128 = v11;
    objc_msgSend(v11, "bundleURL");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentPassActionsDictionaryWithError(v64, 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    v122 = v65;
    if (v65 && objc_msgSend(v65, "count"))
    {
      objc_msgSend(v65, "objectForKey:", CFSTR("actionGroups"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v66, "count"));
      v145 = 0u;
      v146 = 0u;
      v147 = 0u;
      v148 = 0u;
      v68 = v66;
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v145, v156, 16);
      if (v69)
      {
        v70 = v69;
        v71 = *(_QWORD *)v146;
        do
        {
          for (j = 0; j != v70; ++j)
          {
            if (*(_QWORD *)v146 != v71)
              objc_enumerationMutation(v68);
            v73 = -[PKPaymentPassActionGroup initWithDictionary:localizations:]([PKPaymentPassActionGroup alloc], "initWithDictionary:localizations:", *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * j), v63);
            objc_msgSend(v67, "safelyAddObject:", v73);

          }
          v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v145, v156, 16);
        }
        while (v70);
      }
      v120 = v68;

      v121 = v67;
      v74 = (void *)objc_msgSend(v67, "copy");
      -[PKPaymentPassContent setActionGroups:](v130, "setActionGroups:", v74);

      objc_msgSend(v65, "objectForKey:", CFSTR("actions"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v75, "count"));
      v141 = 0u;
      v142 = 0u;
      v143 = 0u;
      v144 = 0u;
      v132 = v75;
      v76 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v141, v155, 16);
      if (v76)
      {
        v77 = v76;
        v78 = *(_QWORD *)v142;
        do
        {
          for (k = 0; k != v77; ++k)
          {
            if (*(_QWORD *)v142 != v78)
              objc_enumerationMutation(v132);
            v80 = -[PKPaymentPassAction initWithDictionary:localizations:]([PKPaymentPassAction alloc], "initWithDictionary:localizations:", *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * k), v63);
            v81 = v80;
            if (v80)
            {
              v82 = v63;
              -[PKPaymentPassAction associatedPlanIdentifier](v80, "associatedPlanIdentifier");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = v83;
              if (v83)
              {
                v85 = v83;
              }
              else
              {
                -[PKPaymentPassAction relevantPropertyIdentifier](v81, "relevantPropertyIdentifier");
                v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              v86 = v85;

              if (v86)
                v87 = v86;
              else
                v87 = CFSTR("commute_plan");
              v88 = v87;

              if (v88)
              {
                -[PKTransitCommutePlanPackage planForIdentifier:](v131, "planForIdentifier:", v88);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = (void *)objc_msgSend(v89, "copy");

                if (v90)
                {
                  -[PKPaymentPassAction setAssociatedPlanIdentifier:](v81, "setAssociatedPlanIdentifier:", v88);
                  -[PKPaymentPassAction setAssociatedPlan:](v81, "setAssociatedPlan:", v90);
                }

              }
              objc_msgSend(v133, "addObject:", v81);

              v63 = v82;
            }

          }
          v77 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v141, v155, 16);
        }
        while (v77);
      }

      -[PKPaymentPassContent setAvailableActions:](v130, "setAvailableActions:", v133);
      v10 = v129;
    }
    objc_msgSend(v10, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("passUpgrades"));
    v91 = objc_claimAutoreleasedReturnValue();
    v92 = (void *)v91;
    v93 = (void *)MEMORY[0x1E0C9AA60];
    if (v91)
      v93 = (void *)v91;
    v94 = v93;

    v95 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v96 = v94;
    v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v137, v154, 16);
    if (v97)
    {
      v98 = v97;
      v99 = *(_QWORD *)v138;
      do
      {
        for (m = 0; m != v98; ++m)
        {
          if (*(_QWORD *)v138 != v99)
            objc_enumerationMutation(v96);
          +[PKPassUpgradeRequest passUpgradeRequestFromDictionary:](PKPassUpgradeRequest, "passUpgradeRequestFromDictionary:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * m));
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          if (v101)
            objc_msgSend(v95, "addObject:", v101);

        }
        v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v137, v154, 16);
      }
      while (v98);
    }

    v102 = objc_msgSend(v95, "copy");
    v13 = v130;
    upgradeRequests = v130->_upgradeRequests;
    v130->_upgradeRequests = (NSArray *)v102;

    objc_msgSend(v10, "PKDictionaryForKey:", CFSTR("auxiliaryCapabilities"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v104;
    if (v104)
    {
      v106 = v104;
    }
    else
    {
      objc_msgSend(v10, "PKDictionaryForKey:", CFSTR("auxiliaryRegistrationRequirements"));
      v106 = (id)objc_claimAutoreleasedReturnValue();
    }
    v107 = v106;

    v108 = -[PKPassAuxiliaryRegistrationRequirements initWithDictionary:]([PKPassAuxiliaryRegistrationRequirements alloc], "initWithDictionary:", v107);
    auxiliaryRegistrationRequirements = v130->_auxiliaryRegistrationRequirements;
    v130->_auxiliaryRegistrationRequirements = v108;

    objc_msgSend(v10, "PKDictionaryForKey:", CFSTR("dynamicLayerConfiguration"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (v110)
    {
      v111 = -[PKDynamicLayerConfiguration initWithDictionary:]([PKDynamicLayerConfiguration alloc], "initWithDictionary:", v110);
      dynamicLayerConfiguration = v130->_dynamicLayerConfiguration;
      v130->_dynamicLayerConfiguration = v111;

    }
    objc_msgSend(v10, "PKStringForKey:", CFSTR("cardType"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = PKPaymentCardTypeFromString(v113);

    if (v114 == 4)
    {
      objc_msgSend(v10, "PKStringForKey:", CFSTR("cardSubtype"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = PKSecureElementIdentityPassTypeFromString(v116);
      v118 = &OBJC_IVAR___PKPaymentPassContent__identityType;
      v115 = v127;
    }
    else
    {
      v115 = v127;
      if (v114 == 3)
      {
        objc_msgSend(v10, "PKStringForKey:", CFSTR("cardSubtype"));
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = PKSecureElementAccessPassTypeFromString(v116);
        v118 = &OBJC_IVAR___PKPaymentPassContent__accessType;
      }
      else
      {
        if (v114 != 1)
        {
LABEL_76:

          v11 = v128;
          goto LABEL_77;
        }
        objc_msgSend(v10, "PKStringForKey:", CFSTR("cardSubtype"));
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = PKSecureElementPaymentPassTypeFromString(v116);
        v118 = &OBJC_IVAR___PKPaymentPassContent__paymentType;
      }
    }
    *(Class *)((char *)&v130->super.super.super.isa + *v118) = (Class)v117;

    goto LABEL_76;
  }
LABEL_77:

  return v13;
}

- (void)setTransitCommutePlans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (void)setTransitCommutePlanType:(unint64_t)a3
{
  self->_transitCommutePlanType = a3;
}

- (void)setTransactionServiceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setTransactionServiceRegistrationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setTransactionPushTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setSpeakableModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void)setSpeakableMake:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (void)setShippingAddressSeed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (void)setMessageServiceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void)setMessageServiceRegistrationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setMessagePushTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setLocalizedSuspendedReasonsByAID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void)setCustomerServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setCobrandName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setAppURLScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentPassContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PKPaymentPassContent *v6;
  uint64_t v7;
  NSString *cobrandName;
  uint64_t v9;
  NSURL *transactionServiceURL;
  uint64_t v11;
  NSURL *transactionServiceRegistrationURL;
  uint64_t v13;
  NSString *transactionPushTopic;
  uint64_t v15;
  NSURL *messageServiceURL;
  uint64_t v17;
  NSURL *messageServiceRegistrationURL;
  uint64_t v19;
  NSString *messagePushTopic;
  uint64_t v21;
  NSString *appURLScheme;
  uint64_t v23;
  NSString *customerServiceIdentifier;
  uint64_t v25;
  NSString *shippingAddressSeed;
  uint64_t v27;
  NSString *speakableMake;
  uint64_t v29;
  NSString *speakableModel;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSDictionary *localizedSuspendedReasonsByAID;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSDictionary *actionLocalizations;
  uint64_t v43;
  NSArray *availableActions;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSArray *transitCommutePlans;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSArray *actionGroups;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSArray *upgradeRequests;
  uint64_t v62;
  PKSiriIntentsConfiguration *supportedSiriIntents;
  uint64_t v64;
  PKPassAuxiliaryRegistrationRequirements *auxiliaryRegistrationRequirements;
  uint64_t v66;
  PKDynamicLayerConfiguration *dynamicLayerConfiguration;
  void *v68;
  void *v69;
  void *v70;
  void *v72;
  void *v73;
  objc_super v74;

  v4 = a3;
  v5 = (void *)MEMORY[0x19400CFE8]();
  v74.receiver = self;
  v74.super_class = (Class)PKPaymentPassContent;
  v6 = -[PKPassContent initWithCoder:](&v74, sel_initWithCoder_, v4);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cobrandName"));
    v7 = objc_claimAutoreleasedReturnValue();
    cobrandName = v6->_cobrandName;
    v6->_cobrandName = (NSString *)v7;

    v73 = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionServiceURL"));
    v9 = objc_claimAutoreleasedReturnValue();
    transactionServiceURL = v6->_transactionServiceURL;
    v6->_transactionServiceURL = (NSURL *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionServiceRegistrationURL"));
    v11 = objc_claimAutoreleasedReturnValue();
    transactionServiceRegistrationURL = v6->_transactionServiceRegistrationURL;
    v6->_transactionServiceRegistrationURL = (NSURL *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionPushTopic"));
    v13 = objc_claimAutoreleasedReturnValue();
    transactionPushTopic = v6->_transactionPushTopic;
    v6->_transactionPushTopic = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageServiceURL"));
    v15 = objc_claimAutoreleasedReturnValue();
    messageServiceURL = v6->_messageServiceURL;
    v6->_messageServiceURL = (NSURL *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageServiceRegistrationURL"));
    v17 = objc_claimAutoreleasedReturnValue();
    messageServiceRegistrationURL = v6->_messageServiceRegistrationURL;
    v6->_messageServiceRegistrationURL = (NSURL *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messagePushTopic"));
    v19 = objc_claimAutoreleasedReturnValue();
    messagePushTopic = v6->_messagePushTopic;
    v6->_messagePushTopic = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appLaunchURLScheme"));
    v21 = objc_claimAutoreleasedReturnValue();
    appURLScheme = v6->_appURLScheme;
    v6->_appURLScheme = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customerServiceIdentifier"));
    v23 = objc_claimAutoreleasedReturnValue();
    customerServiceIdentifier = v6->_customerServiceIdentifier;
    v6->_customerServiceIdentifier = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingAddressSeed"));
    v25 = objc_claimAutoreleasedReturnValue();
    shippingAddressSeed = v6->_shippingAddressSeed;
    v6->_shippingAddressSeed = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speakableCarMake"));
    v27 = objc_claimAutoreleasedReturnValue();
    speakableMake = v6->_speakableMake;
    v6->_speakableMake = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speakableCarModel"));
    v29 = objc_claimAutoreleasedReturnValue();
    speakableModel = v6->_speakableModel;
    v6->_speakableModel = (NSString *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v72, CFSTR("suspendedReason"));
    v33 = objc_claimAutoreleasedReturnValue();
    localizedSuspendedReasonsByAID = v6->_localizedSuspendedReasonsByAID;
    v6->_localizedSuspendedReasonsByAID = (NSDictionary *)v33;

    v6->_supportsTransitOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showTransitOnly"));
    v6->_transitCommutePlanType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("commutePlanPassContentType"));
    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0C99E60];
    v39 = objc_opt_class();
    objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("actionLocalizations"));
    v41 = objc_claimAutoreleasedReturnValue();
    actionLocalizations = v6->_actionLocalizations;
    v6->_actionLocalizations = (NSDictionary *)v41;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("actions"));
    v43 = objc_claimAutoreleasedReturnValue();
    availableActions = v6->_availableActions;
    v6->_availableActions = (NSArray *)v43;

    v45 = (void *)MEMORY[0x1E0C99E60];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("transitCommutePlans"));
    v48 = objc_claimAutoreleasedReturnValue();
    transitCommutePlans = v6->_transitCommutePlans;
    v6->_transitCommutePlans = (NSArray *)v48;

    v50 = (void *)MEMORY[0x1E0C99E60];
    v51 = objc_opt_class();
    objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, CFSTR("actionGroups"));
    v53 = objc_claimAutoreleasedReturnValue();
    actionGroups = v6->_actionGroups;
    v6->_actionGroups = (NSArray *)v53;

    v55 = (void *)MEMORY[0x1E0C99E60];
    v56 = objc_opt_class();
    v57 = objc_opt_class();
    v58 = objc_opt_class();
    objc_msgSend(v55, "setWithObjects:", v56, v57, v58, objc_opt_class(), 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v59, CFSTR("passUpgrades"));
    v60 = objc_claimAutoreleasedReturnValue();
    upgradeRequests = v6->_upgradeRequests;
    v6->_upgradeRequests = (NSArray *)v60;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportedSiriIntents"));
    v62 = objc_claimAutoreleasedReturnValue();
    supportedSiriIntents = v6->_supportedSiriIntents;
    v6->_supportedSiriIntents = (PKSiriIntentsConfiguration *)v62;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auxiliaryRegistrationRequirements"));
    v64 = objc_claimAutoreleasedReturnValue();
    auxiliaryRegistrationRequirements = v6->_auxiliaryRegistrationRequirements;
    v6->_auxiliaryRegistrationRequirements = (PKPassAuxiliaryRegistrationRequirements *)v64;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dynamicLayerConfiguration"));
    v66 = objc_claimAutoreleasedReturnValue();
    dynamicLayerConfiguration = v6->_dynamicLayerConfiguration;
    v6->_dynamicLayerConfiguration = (PKDynamicLayerConfiguration *)v66;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identityType"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_identityType = PKSecureElementIdentityPassTypeFromString(v68);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessType"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_accessType = PKSecureElementAccessPassTypeFromString(v69);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentType"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_paymentType = PKSecureElementPaymentPassTypeFromString(v70);

    v5 = v73;
  }
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicLayerConfiguration, 0);
  objc_storeStrong((id *)&self->_auxiliaryRegistrationRequirements, 0);
  objc_storeStrong((id *)&self->_supportedSiriIntents, 0);
  objc_storeStrong((id *)&self->_speakableModel, 0);
  objc_storeStrong((id *)&self->_speakableMake, 0);
  objc_storeStrong((id *)&self->_shippingAddressSeed, 0);
  objc_storeStrong((id *)&self->_upgradeRequests, 0);
  objc_storeStrong((id *)&self->_transitCommutePlans, 0);
  objc_storeStrong((id *)&self->_actionGroups, 0);
  objc_storeStrong((id *)&self->_actionLocalizations, 0);
  objc_storeStrong((id *)&self->_availableActions, 0);
  objc_storeStrong((id *)&self->_localizedSuspendedReasonsByAID, 0);
  objc_storeStrong((id *)&self->_customerServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_appURLScheme, 0);
  objc_storeStrong((id *)&self->_messagePushTopic, 0);
  objc_storeStrong((id *)&self->_messageServiceRegistrationURL, 0);
  objc_storeStrong((id *)&self->_messageServiceURL, 0);
  objc_storeStrong((id *)&self->_transactionPushTopic, 0);
  objc_storeStrong((id *)&self->_transactionServiceRegistrationURL, 0);
  objc_storeStrong((id *)&self->_transactionServiceURL, 0);
  objc_storeStrong((id *)&self->_cobrandName, 0);
}

- (NSString)cobrandName
{
  return self->_cobrandName;
}

- (NSURL)transactionServiceURL
{
  return self->_transactionServiceURL;
}

- (NSURL)transactionServiceRegistrationURL
{
  return self->_transactionServiceRegistrationURL;
}

- (NSString)transactionPushTopic
{
  return self->_transactionPushTopic;
}

- (NSURL)messageServiceURL
{
  return self->_messageServiceURL;
}

- (NSURL)messageServiceRegistrationURL
{
  return self->_messageServiceRegistrationURL;
}

- (NSString)messagePushTopic
{
  return self->_messagePushTopic;
}

- (NSString)appURLScheme
{
  return self->_appURLScheme;
}

- (NSString)customerServiceIdentifier
{
  return self->_customerServiceIdentifier;
}

- (NSDictionary)localizedSuspendedReasonsByAID
{
  return self->_localizedSuspendedReasonsByAID;
}

- (BOOL)supportsTransitOnly
{
  return self->_supportsTransitOnly;
}

- (void)setSupportsTransitOnly:(BOOL)a3
{
  self->_supportsTransitOnly = a3;
}

- (NSArray)availableActions
{
  return self->_availableActions;
}

- (void)setAvailableActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSDictionary)actionLocalizations
{
  return self->_actionLocalizations;
}

- (void)setActionLocalizations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSArray)actionGroups
{
  return self->_actionGroups;
}

- (void)setActionGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSArray)transitCommutePlans
{
  return self->_transitCommutePlans;
}

- (unint64_t)transitCommutePlanType
{
  return self->_transitCommutePlanType;
}

- (NSArray)upgradeRequests
{
  return self->_upgradeRequests;
}

- (void)setUpgradeRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)shippingAddressSeed
{
  return self->_shippingAddressSeed;
}

- (NSString)speakableMake
{
  return self->_speakableMake;
}

- (NSString)speakableModel
{
  return self->_speakableModel;
}

- (PKSiriIntentsConfiguration)supportedSiriIntents
{
  return self->_supportedSiriIntents;
}

- (void)setSupportedSiriIntents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (PKPassAuxiliaryRegistrationRequirements)auxiliaryRegistrationRequirements
{
  return self->_auxiliaryRegistrationRequirements;
}

- (void)setAuxiliaryRegistrationRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryRegistrationRequirements, a3);
}

- (void)setDynamicLayerConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicLayerConfiguration, a3);
}

- (int64_t)identityType
{
  return self->_identityType;
}

- (void)setIdentityType:(int64_t)a3
{
  self->_identityType = a3;
}

- (int64_t)accessType
{
  return self->_accessType;
}

- (void)setAccessType:(int64_t)a3
{
  self->_accessType = a3;
}

- (int64_t)paymentType
{
  return self->_paymentType;
}

- (void)setPaymentType:(int64_t)a3
{
  self->_paymentType = a3;
}

@end
