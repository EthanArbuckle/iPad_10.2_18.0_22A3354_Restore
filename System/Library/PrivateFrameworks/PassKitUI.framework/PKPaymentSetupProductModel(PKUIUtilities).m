@implementation PKPaymentSetupProductModel(PKUIUtilities)

- (id)filteredPaymentSetupProductModelWithLocalCredentials:()PKUIUtilities setupContext:webService:mobileCarrierRegion:deviceRegion:
{
  id v12;
  id v13;
  int IsBridge;
  int IsSetupAssistant;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  int v24;
  _BOOL4 v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  int v33;
  int v34;
  id v35;
  unint64_t v36;
  void *v37;
  _BOOL4 v38;
  _BOOL4 v39;
  void *v40;
  char v41;
  NSObject *v42;
  _BOOL4 v43;
  id v44;
  _BOOL4 v45;
  id v46;
  _BOOL4 v47;
  id v48;
  void *v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  const char *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  _BOOL4 v57;
  id v58;
  __CFString *v59;
  NSObject *v60;
  NSObject *v61;
  id v62;
  NSObject *v63;
  NSObject *v64;
  const char *v65;
  id v66;
  id v67;
  __CFString *v68;
  uint64_t v69;
  char v70;
  uint64_t j;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  char v80;
  NSObject *v81;
  id v82;
  NSObject *v83;
  const char *v84;
  void *v85;
  int v86;
  char v87;
  int v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t k;
  void *v97;
  NSObject *v98;
  id v99;
  NSObject *v100;
  id v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  NSObject *v105;
  id v106;
  void *v108;
  PKSecurityCapabilitiesController *v109;
  id v110;
  id v111;
  id obj;
  id v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  void *v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  id v123;
  int IsAvailable;
  uint64_t v125;
  id v126;
  id v127;
  int v128;
  id v129;
  int v130;
  int IsMerchantApp;
  int v132;
  _BOOL4 v133;
  char v134;
  uint64_t v135;
  int v136;
  uint64_t v137;
  id v138;
  id v139;
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
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  uint8_t v160[128];
  uint8_t buf[4];
  id v162;
  __int16 v163;
  const __CFString *v164;
  __int16 v165;
  const __CFString *v166;
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v127 = a6;
  v126 = a7;
  v110 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v117 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  IsBridge = PKPaymentSetupContextIsBridge();
  IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  IsMerchantApp = PKPaymentSetupContextIsMerchantApp();
  IsAvailable = PKFelicaSecureElementIsAvailable();
  v108 = v13;
  objc_msgSend(v13, "targetDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appleAccountInformation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = objc_msgSend(v17, "isManagedAppleAccount");

  v128 = PKPaymentSetupContextIsiOSSetupAssistant();
  v109 = -[PKSecurityCapabilitiesController initWithRequirements:context:]([PKSecurityCapabilitiesController alloc], "initWithRequirements:context:", 4, a4);
  v114 = v12;
  if (objc_msgSend(v12, "count"))
  {
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    objc_msgSend(a1, "allSetupProducts");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v156, v170, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v157;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v157 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * i);
          if (objc_msgSend(a1, "_localCredentials:containProduct:", v114, v23))
            objc_msgSend(v117, "addObject:", v23);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v156, v170, 16);
      }
      while (v20);
    }

  }
  v119 = a1;
  objc_msgSend(a1, "filteredPaymentSetupProductModel:mobileCarrierRegion:deviceRegion:cardOnFiles:", v108, v127, v126, v117);
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v130 = IsBridge;
  v132 = IsSetupAssistant;
  v24 = IsMerchantApp;
  v138 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v152, v169, 16);
  if (v138)
  {
    v26 = (a4 & 0xFFFFFFFFFFFFFFF7) == 0 || a4 == 3;
    v133 = v26;
    v122 = IsSetupAssistant ^ 1;
    v137 = *(_QWORD *)v153;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v153 != v137)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * (_QWORD)v27);
        v29 = objc_msgSend(v117, "containsObject:", v28);
        if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
        {
          objc_msgSend(v28, "configuration");
          v30 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject type](v30, "type") != 7)
          {
            v33 = 0;
            v34 = 1;
            goto LABEL_35;
          }
          objc_msgSend(v28, "configuration");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "featureIdentifier");

          if (v32 != 2)
            goto LABEL_26;
        }
        else if (objc_msgSend(v28, "supportedProvisioningMethods") != 4)
        {
LABEL_26:
          v33 = 0;
          v34 = 1;
          goto LABEL_36;
        }
        if (a4 <= 8 && ((1 << a4) & 0x109) != 0)
        {
          v33 = 1;
          v34 = v133;
          goto LABEL_36;
        }
        PKLogFacilityTypeGetObject();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v28, "displayName");
          v35 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v162 = v35;
          _os_log_impl(&dword_19D178000, v30, OS_LOG_TYPE_DEFAULT, "Product: %@ is not supported in context", buf, 0xCu);

        }
        v33 = 1;
        v34 = v133;
LABEL_35:

LABEL_36:
        if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
        {
          LODWORD(v36) = objc_msgSend(v28, "supportsProvisioningMethodForType:", 2);
          if ((_DWORD)v36)
          {
            objc_msgSend(v28, "provisioningMethods");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "count") == 1;

          }
          else
          {
            v38 = 0;
          }
          if (objc_msgSend(v28, "supportsProvisioningMethodForType:", 16))
          {
            objc_msgSend(v28, "provisioningMethods");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v40, "count") == 1;

            if (!v33)
              goto LABEL_48;
          }
          else
          {
            v39 = 0;
            if (!v33)
              goto LABEL_48;
          }
        }
        else
        {
          v36 = ((unint64_t)objc_msgSend(v28, "supportedProvisioningMethods") >> 1) & 1;
          v38 = objc_msgSend(v28, "supportedProvisioningMethods") == 2;
          v39 = objc_msgSend(v28, "supportedProvisioningMethods") == 16;
          if (!v33)
            goto LABEL_48;
        }
        v41 = 1;
        if (a4 > 8 || ((1 << a4) & 0x109) == 0)
          goto LABEL_54;
LABEL_48:
        if (((v38 || v39) & v132) != 1)
        {
          v41 = 1;
LABEL_54:
          IsBridge = v130;
          goto LABEL_55;
        }
        PKLogFacilityTypeGetObject();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
        IsBridge = v130;
        if (!v29)
        {
          IsSetupAssistant = v132;
          if (v43)
          {
            objc_msgSend(v28, "displayName");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v162 = v54;
            _os_log_impl(&dword_19D178000, v42, OS_LOG_TYPE_DEFAULT, "Product: %@ is not supported in setup context due to lack of card on file", buf, 0xCu);

          }
          v24 = IsMerchantApp;
          goto LABEL_108;
        }
        if (v43)
        {
          objc_msgSend(v28, "displayName");
          v44 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v162 = v44;
          _os_log_impl(&dword_19D178000, v42, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to matching card on file (DCI / In-App check)", buf, 0xCu);

        }
        v41 = 0;
        v34 = 1;
LABEL_55:
        if (((v34 ^ 1 | v36 | v132) & 1) != 0
          || (objc_msgSend(v28, "allSupportedProtocols") & 4) == 0
          || IsAvailable)
        {
          v24 = IsMerchantApp;
          if ((v34 & 1) == 0)
          {
            PKLogFacilityTypeGetObject();
            v42 = objc_claimAutoreleasedReturnValue();
            goto LABEL_95;
          }
        }
        else
        {
          PKLogFacilityTypeGetObject();
          v42 = objc_claimAutoreleasedReturnValue();
          v45 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          v24 = IsMerchantApp;
          if (!v29)
          {
            if (v45)
            {
              objc_msgSend(v28, "displayName");
              v62 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v162 = v62;
              _os_log_impl(&dword_19D178000, v42, OS_LOG_TYPE_DEFAULT, "Product: %@ is not supported due to lack of card on file and Type F support", buf, 0xCu);
              goto LABEL_93;
            }
LABEL_94:

LABEL_95:
            IsSetupAssistant = v132;
            goto LABEL_108;
          }
          if (v45)
          {
            objc_msgSend(v28, "displayName");
            v46 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v162 = v46;
            _os_log_impl(&dword_19D178000, v42, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to matching card on file (type f support check)", buf, 0xCu);

            v24 = IsMerchantApp;
          }

          v41 = 0;
        }
        if (!PKSecureElementIsAvailable())
        {
          PKLogFacilityTypeGetObject();
          v42 = objc_claimAutoreleasedReturnValue();
          v47 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          if ((v29 & IsBridge) != 1)
          {
            if (v47)
            {
              objc_msgSend(v28, "displayName");
              v62 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v162 = v62;
              _os_log_impl(&dword_19D178000, v42, OS_LOG_TYPE_DEFAULT, "Product: %@ is not supported due to lack of SE", buf, 0xCu);

LABEL_93:
            }
            goto LABEL_94;
          }
          if (v47)
          {
            objc_msgSend(v28, "displayName");
            v48 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v162 = v48;
            _os_log_impl(&dword_19D178000, v42, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to matching card on file and bridge context (SE check)", buf, 0xCu);

            v24 = IsMerchantApp;
          }

          v41 = 0;
        }
        if (!v128
          || objc_msgSend(v28, "hsa2Requirement") != 2
          || -[PKSecurityCapabilitiesController isHSA2Enabled](v109, "isHSA2Enabled"))
        {
          objc_msgSend(v28, "configuration");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "state");

          IsSetupAssistant = v132;
          if ((unint64_t)(v50 - 3) >= 2)
          {
            v24 = IsMerchantApp;
            if (v50 != 2)
              goto LABEL_84;
            objc_msgSend(v28, "featureApplications");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "count");

            PKLogFacilityTypeGetObject();
            v42 = objc_claimAutoreleasedReturnValue();
            v57 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
            if (v56)
            {
              if (v57)
              {
                objc_msgSend(v28, "displayName");
                v58 = (id)objc_claimAutoreleasedReturnValue();
                PKPaymentSetupProductStateToString();
                v59 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v162 = v58;
                v163 = 2114;
                v164 = v59;
                _os_log_impl(&dword_19D178000, v42, OS_LOG_TYPE_DEFAULT, "Product: %{public}@ is set as: %{public}@ but has existing featureApplications so including", buf, 0x16u);

                v24 = IsMerchantApp;
              }

LABEL_84:
              v60 = v28;
              v61 = v60;
              if ((v41 & 1) != 0)
              {
                v42 = v60;
LABEL_102:
                objc_msgSend(v110, "addObject:", v42);
                goto LABEL_110;
              }
              v42 = -[NSObject copy](v60, "copy");

              if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
              {
                -[NSObject addProvisioningMethodType:](v42, "addProvisioningMethodType:", 0);
                PKLogFacilityTypeGetObject();
                v63 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v64 = v63;
                  v65 = "PKPaymentSetupProductUIFiltering: PKPaymentSetupMergeProductsPartnersAPIEnabled On: add PKPaymen"
                        "tSupportedProvisioningMethodUnknown";
                  goto LABEL_98;
                }
              }
              else
              {
                -[NSObject setSupportedProvisioningMethods:](v42, "setSupportedProvisioningMethods:", 0);
                PKLogFacilityTypeGetObject();
                v63 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v64 = v63;
                  v65 = "PKPaymentSetupProductUIFiltering: PKPaymentSetupMergeProductsPartnersAPIEnabled Off: add PKPayme"
                        "ntSupportedProvisioningMethodUnknown";
LABEL_98:
                  _os_log_impl(&dword_19D178000, v64, OS_LOG_TYPE_DEFAULT, v65, buf, 2u);
                }
              }

              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                -[NSObject displayName](v61, "displayName");
                v66 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v162 = v66;
                _os_log_impl(&dword_19D178000, v63, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to matching card but cannot be manually provisioned", buf, 0xCu);

              }
              v24 = IsMerchantApp;
              goto LABEL_102;
            }
            if (!v57)
              goto LABEL_107;
            objc_msgSend(v28, "displayName");
            v51 = (id)objc_claimAutoreleasedReturnValue();
            PKPaymentSetupProductStateToString();
            v68 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v162 = v51;
            v163 = 2114;
            v164 = v68;
            _os_log_impl(&dword_19D178000, v42, OS_LOG_TYPE_DEFAULT, "Product: %{public}@ is set as: %{public}@ not including", buf, 0x16u);

            v24 = IsMerchantApp;
          }
          else
          {
            v24 = IsMerchantApp;
            if (((v122 | v29) & 1) != 0)
              goto LABEL_84;
            PKLogFacilityTypeGetObject();
            v42 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              goto LABEL_107;
            objc_msgSend(v28, "displayName");
            v51 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v162 = v51;
            v52 = v42;
            v53 = "Product: %{public}@ is set allowed during setup assistant as it requires onboarding";
LABEL_105:
            _os_log_impl(&dword_19D178000, v52, OS_LOG_TYPE_DEFAULT, v53, buf, 0xCu);

          }
          goto LABEL_107;
        }
        PKLogFacilityTypeGetObject();
        v42 = objc_claimAutoreleasedReturnValue();
        IsSetupAssistant = v132;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v28, "displayName");
          v51 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v162 = v51;
          v52 = v42;
          v53 = "Product: %@ is not supported in setup context due to HSA requirement";
          goto LABEL_105;
        }
LABEL_107:

LABEL_108:
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v28, "displayName");
          v67 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v162 = v67;
          _os_log_impl(&dword_19D178000, v42, OS_LOG_TYPE_DEFAULT, "Product: %@ is unsupported and will not be shown in the flow picker", buf, 0xCu);

        }
LABEL_110:

        v27 = (char *)v27 + 1;
      }
      while (v138 != v27);
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v152, v169, 16);
      v138 = (id)v69;
    }
    while (v69);
  }

  if ((PKIsPhone() & 1) != 0)
    v70 = 1;
  else
    v70 = PKIsWatch();
  v129 = objc_alloc_init(MEMORY[0x1E0D67328]);
  objc_msgSend(v129, "updatePaymentSetupProducts:", v110);
  v113 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  objc_msgSend(v119, "allSections");
  v111 = (id)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v148, v168, 16);
  if (v116)
  {
    v115 = *(_QWORD *)v149;
    v125 = *MEMORY[0x1E0D6AFF0];
    v121 = *MEMORY[0x1E0D6AFE8];
    v134 = v70;
    do
    {
      for (j = 0; j != v116; j = v104 + 1)
      {
        if (*(_QWORD *)v149 != v115)
          objc_enumerationMutation(v111);
        v120 = j;
        v72 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * j);
        v123 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v144 = 0u;
        v145 = 0u;
        v146 = 0u;
        v147 = 0u;
        v118 = v72;
        objc_msgSend(v72, "categories");
        v139 = (id)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v144, v167, 16);
        if (v73)
        {
          v74 = v73;
          v75 = *(_QWORD *)v145;
          v135 = *(_QWORD *)v145;
          do
          {
            v76 = 0;
            do
            {
              if (*(_QWORD *)v145 != v75)
                objc_enumerationMutation(v139);
              v77 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v76);
              if (IsSetupAssistant
                && (objc_msgSend(*(id *)(*((_QWORD *)&v144 + 1) + 8 * v76), "excludedContexts") & 1) != 0)
              {
                PKLogFacilityTypeGetObject();
                v81 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v77, "identifier");
                  v82 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v162 = v82;
                  v83 = v81;
                  v84 = "Dropping category: %@ as it is not supported in setup assistant";
                  goto LABEL_149;
                }
LABEL_151:

                objc_msgSend(v77, "regions");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_152;
              }
              if (IsBridge && (objc_msgSend(v77, "excludedContexts") & 2) != 0)
              {
                PKLogFacilityTypeGetObject();
                v81 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_151;
                objc_msgSend(v77, "identifier");
                v82 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v162 = v82;
                v83 = v81;
                v84 = "Dropping category: %@ as it is not supported in bridge";
                goto LABEL_149;
              }
              if ((v70 & 1) == 0 && (objc_msgSend(v77, "capabilities") & 1) != 0)
              {
                PKLogFacilityTypeGetObject();
                v81 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_151;
                objc_msgSend(v77, "identifier");
                v82 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v162 = v82;
                v83 = v81;
                v84 = "Dropping category: %@ as it requires NFC support";
LABEL_149:
                _os_log_impl(&dword_19D178000, v83, OS_LOG_TYPE_DEFAULT, v84, buf, 0xCu);
LABEL_150:

                goto LABEL_151;
              }
              if (v24 && (objc_msgSend(v77, "excludedContexts") & 4) != 0)
              {
                PKLogFacilityTypeGetObject();
                v81 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_151;
                objc_msgSend(v77, "identifier");
                v82 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v162 = v82;
                v83 = v81;
                v84 = "Dropping category: %@ as it is not supported in merchant apps";
                goto LABEL_149;
              }
              if (v136 && (objc_msgSend(v77, "allowOnManagedAccount") & 1) == 0)
              {
                PKLogFacilityTypeGetObject();
                v81 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_151;
                objc_msgSend(v77, "identifier");
                v82 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v162 = v82;
                _os_log_impl(&dword_19D178000, v81, OS_LOG_TYPE_DEFAULT, "Dropping category: %@ as it is not supported on managed account", buf, 0xCu);

                goto LABEL_150;
              }
              objc_msgSend(v77, "regions");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v78, "count"))
                goto LABEL_166;
              objc_msgSend(v77, "identifier");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v79, "isEqualToString:", v125) & 1) != 0)
              {
                v80 = 1;
              }
              else
              {
                objc_msgSend(v77, "identifier");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = objc_msgSend(v85, "isEqualToString:", v121);

                v70 = v134;
              }

              if (v126)
                v86 = objc_msgSend(v78, "containsObject:");
              else
                v86 = 0;
              v87 = v80 ^ 1;
              if (!v127)
                v87 = 1;
              v88 = (v87 & 1) != 0 ? 0 : objc_msgSend(v78, "containsObject:");
              v75 = v135;
              if (((v86 | v88) & 1) == 0)
              {
                PKLogFacilityTypeGetObject();
                v98 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v77, "identifier");
                  v99 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v162 = v99;
                  v163 = 2112;
                  v164 = CFSTR("NO");
                  v165 = 2112;
                  v166 = CFSTR("NO");
                  _os_log_impl(&dword_19D178000, v98, OS_LOG_TYPE_DEFAULT, "Dropping category: %@ as it was not in device region: %@ carrier region: %@", buf, 0x20u);

                }
              }
              else
              {
LABEL_166:
                v89 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                objc_msgSend(v77, "productIdentifiers");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "productsForProductIdentifiers:", v90);
                v91 = (void *)objc_claimAutoreleasedReturnValue();

                v142 = 0u;
                v143 = 0u;
                v140 = 0u;
                v141 = 0u;
                v92 = v91;
                v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v140, v160, 16);
                if (v93)
                {
                  v94 = v93;
                  v95 = *(_QWORD *)v141;
                  do
                  {
                    for (k = 0; k != v94; ++k)
                    {
                      if (*(_QWORD *)v141 != v95)
                        objc_enumerationMutation(v92);
                      objc_msgSend(*(id *)(*((_QWORD *)&v140 + 1) + 8 * k), "productIdentifier");
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v89, "addObject:", v97);

                    }
                    v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v140, v160, 16);
                  }
                  while (v94);
                }

                objc_msgSend(v77, "setProductIdentifiers:", v89);
                if (objc_msgSend(v77, "needsProducts") && !objc_msgSend(v89, "count"))
                {
                  PKLogFacilityTypeGetObject();
                  v100 = objc_claimAutoreleasedReturnValue();
                  IsBridge = v130;
                  IsSetupAssistant = v132;
                  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v77, "identifier");
                    v101 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v162 = v101;
                    _os_log_impl(&dword_19D178000, v100, OS_LOG_TYPE_DEFAULT, "Dropping category: %@ as it has no products that are supported", buf, 0xCu);

                  }
                }
                else
                {

                  objc_msgSend(v123, "addObject:", v77);
                  IsBridge = v130;
                  IsSetupAssistant = v132;
                }
                v24 = IsMerchantApp;
                v70 = v134;
                v75 = v135;
              }
LABEL_152:

              ++v76;
            }
            while (v76 != v74);
            v102 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v144, v167, 16);
            v74 = v102;
          }
          while (v102);
        }

        v103 = v123;
        if (objc_msgSend(v123, "count"))
        {
          objc_msgSend(v118, "setCategories:", v123);
          objc_msgSend(v113, "addObject:", v118);
          v104 = v120;
        }
        else
        {
          PKLogFacilityTypeGetObject();
          v105 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v105, OS_LOG_TYPE_DEFAULT, "Dropping section all its categories have no products", buf, 2u);
          }

          v104 = v120;
          v103 = v123;
        }

      }
      v116 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v148, v168, 16);
    }
    while (v116);
  }

  objc_msgSend(v129, "setAllSections:", v113);
  v106 = v129;

  return v106;
}

- (uint64_t)_localCredentials:()PKUIUtilities containProduct:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  objc_msgSend(a4, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "productIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__PKPaymentSetupProductModel_PKUIUtilities___localCredentials_containProduct___block_invoke;
    v10[3] = &unk_1E3E764A8;
    v11 = v7;
    v8 = objc_msgSend(v5, "pk_containsObjectPassingTest:", v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
