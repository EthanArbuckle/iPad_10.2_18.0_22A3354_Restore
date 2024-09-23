@implementation ICQOffer

- (ICQOffer)initWithServerDictionary:(id)a3 accountAltDSID:(id)a4 notificationID:(id)a5 retrievalDate:(id)a6 callbackInterval:(double)a7 appLaunchLink:(id)a8 bundleIdentifier:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  ICQOffer *v21;
  uint64_t v22;
  NSDictionary *serverDictionary;
  uint64_t v24;
  NSString *bundleIdentifier;
  uint64_t v26;
  NSDate *expirationDate;
  uint64_t v28;
  NSString *accountAltDSID;
  uint64_t v30;
  NSString *notificationID;
  uint64_t v32;
  NSString *offerId;
  id v34;
  id v35;
  void *v36;
  void *v37;
  _ICQBannerSpecification *v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  const __CFString *v42;
  NSObject *v43;
  NSObject *v44;
  objc_class *v45;
  const char *v46;
  objc_class *v47;
  const char *v48;
  NSObject *v49;
  objc_class *v50;
  const char *v51;
  NSObject *v52;
  objc_class *v53;
  const char *Name;
  _ICQBannerSpecification *bannerSpecification;
  id v56;
  NSObject *v57;
  NSObject *v58;
  _ICQBannerSpecification *v59;
  objc_class *v60;
  const char *v61;
  NSObject *v62;
  objc_class *v63;
  const char *v64;
  _ICQBannerSpecification *recommendationSpecification;
  id v66;
  NSObject *v67;
  NSObject *v68;
  _ICQButtonSpecification *v69;
  objc_class *v70;
  const char *v71;
  NSObject *v72;
  objc_class *v73;
  const char *v74;
  _ICQButtonSpecification *buttonSpecification;
  id v76;
  NSObject *v77;
  _ICQDetailFollowupSpecification *v78;
  NSObject *v79;
  objc_class *v80;
  const char *v81;
  _ICQFollowupSpecification *followupSpecification;
  NSObject *v83;
  id v84;
  NSObject *v85;
  NSObject *v86;
  NSObject *v87;
  id v88;
  id v89;
  NSObject *v90;
  objc_class *v91;
  const char *v92;
  _ICQUpgradeFlowSpecification *v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t i;
  void *v99;
  void *v100;
  char v101;
  NSObject *v102;
  objc_class *v103;
  const char *v104;
  NSObject *v105;
  _BOOL4 v106;
  _ICQUpgradeFlowSpecification *upgradeFlowSpecification;
  _ICQXMLSpecification *v108;
  void *v109;
  uint64_t v110;
  _ICQXMLSpecification *XMLSpecification;
  id v112;
  NSObject *v113;
  NSObject *v114;
  _ICQBannerSpecification *v115;
  objc_class *v116;
  const char *v117;
  NSObject *v118;
  objc_class *v119;
  const char *v120;
  _ICQBannerSpecification *universalLinkSpecification;
  NSObject *v122;
  ICQActionBasedUniversalLinkSpecification *v123;
  NSObject *v124;
  objc_class *v125;
  const char *v126;
  ICQActionBasedUniversalLinkSpecification *actionBasedUniversalLinkSpecification;
  uint64_t v128;
  _ICQBannerSpecification *settingsBannerSpecification;
  void *v130;
  NSObject *v132;
  id v133;
  id v134;
  NSObject *v135;
  id v136;
  id v137;
  id v138;
  id obj;
  id v140;
  id v141;
  objc_super v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  uint8_t v147[4];
  const char *v148;
  __int16 v149;
  void *v150;
  uint8_t buf[4];
  const char *v152;
  __int16 v153;
  NSObject *v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v141 = a8;
  v20 = a9;
  v142.receiver = self;
  v142.super_class = (Class)ICQOffer;
  v21 = -[ICQOffer init](&v142, sel_init);
  if (!v21)
    goto LABEL_120;
  v137 = v19;
  obj = a8;
  v22 = objc_msgSend(v16, "copy");
  serverDictionary = v21->_serverDictionary;
  v21->_serverDictionary = (NSDictionary *)v22;

  v24 = objc_msgSend(v20, "copy");
  bundleIdentifier = v21->_bundleIdentifier;
  v21->_bundleIdentifier = (NSString *)v24;

  objc_storeStrong((id *)&v21->_retrievalDate, a6);
  -[NSDate dateByAddingTimeInterval:](v21->_retrievalDate, "dateByAddingTimeInterval:", a7);
  v26 = objc_claimAutoreleasedReturnValue();
  expirationDate = v21->_expirationDate;
  v21->_expirationDate = (NSDate *)v26;

  _ICQServerDictToOfferTypeAndLevel(v16, (unint64_t *)&v21->_offerType, &v21->_level);
  v140 = v17;
  v28 = objc_msgSend(v17, "copy");
  accountAltDSID = v21->_accountAltDSID;
  v21->_accountAltDSID = (NSString *)v28;

  v138 = v18;
  v30 = objc_msgSend(v18, "copy");
  notificationID = v21->_notificationID;
  v21->_notificationID = (NSString *)v30;

  _ICQStringForKey(v16, CFSTR("offerId"));
  v32 = objc_claimAutoreleasedReturnValue();
  offerId = v21->_offerId;
  v21->_offerId = (NSString *)v32;

  v34 = v16;
  v35 = v20;
  _ICQBubbleBannerSpecificationForServerDict(v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  v136 = v20;
  if (v36)
  {
    v38 = v36;
    goto LABEL_33;
  }
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("detailAppBannerInfo"));
  v39 = objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
    v40 = v35;
    v41 = v34;
    if (-[NSObject isEqualToString:](v40, "isEqualToString:", CFSTR("com.apple.icq")))
      v42 = CFSTR("universalLinkInfo");
    else
      v42 = CFSTR("appBannerInfo");
    objc_msgSend(v41, "objectForKeyedSubscript:", v42);
    v43 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      _ICQServerDictionaryForBundleIdentifier(v43, v40, 0, 0);
      v44 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = -[_ICQBannerSpecification initWithServerDictionary:]([_ICQBannerSpecification alloc], "initWithServerDictionary:", v44);
      }
      else
      {
        if (v44)
        {
          _ICQGetLogSystem();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v53 = (objc_class *)objc_opt_class();
            Name = class_getName(v53);
            *(_DWORD *)buf = 136315394;
            v152 = Name;
            v153 = 2112;
            v154 = v44;
            _os_log_impl(&dword_1CDEBD000, v52, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
          }

        }
        v38 = 0;
      }
    }
    else
    {
      if (!v43)
      {
        v38 = 0;
        goto LABEL_31;
      }
      _ICQGetLogSystem();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v47 = (objc_class *)objc_opt_class();
        v48 = class_getName(v47);
        *(_DWORD *)buf = 136315394;
        v152 = v48;
        v153 = 2112;
        v154 = v43;
        _os_log_impl(&dword_1CDEBD000, v44, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
      v38 = 0;
    }

LABEL_31:
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _ICQGetLogSystem();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v45 = (objc_class *)objc_opt_class();
      v46 = class_getName(v45);
      *(_DWORD *)buf = 136315394;
      v152 = v46;
      v153 = 2112;
      v154 = v39;
      _os_log_impl(&dword_1CDEBD000, v40, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
    }
    goto LABEL_24;
  }
  _ICQServerDictionaryForBundleIdentifier(v39, v35, 0, 0);
  v40 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v40)
    {
      _ICQGetLogSystem();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = (objc_class *)objc_opt_class();
        v51 = class_getName(v50);
        *(_DWORD *)buf = 136315394;
        v152 = v51;
        v153 = 2112;
        v154 = v40;
        _os_log_impl(&dword_1CDEBD000, v49, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }

    }
LABEL_24:
    v38 = 0;
    goto LABEL_32;
  }
  v38 = -[_ICQBannerSpecification initWithDetailBannerInfo:source:]([_ICQBannerSpecification alloc], "initWithDetailBannerInfo:source:", v40, CFSTR("ICQBannerSourceDetailAppBannerInfo"));
LABEL_32:

LABEL_33:
  bannerSpecification = v21->_bannerSpecification;
  v21->_bannerSpecification = v38;

  v56 = v35;
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("iCloudInAppRecommendations"));
  v57 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _ICQServerDictionaryForBundleIdentifier(v57, v56, 0, 0);
    v58 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = -[_ICQBannerSpecification initWithDetailBannerInfo:source:]([_ICQBannerSpecification alloc], "initWithDetailBannerInfo:source:", v58, CFSTR("ICQBannerSourceBubbleBannerInfo"));
LABEL_44:

      goto LABEL_45;
    }
    if (v58)
    {
      _ICQGetLogSystem();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = (objc_class *)objc_opt_class();
        v64 = class_getName(v63);
        *(_DWORD *)buf = 136315394;
        v152 = v64;
        v153 = 2112;
        v154 = v58;
        _os_log_impl(&dword_1CDEBD000, v62, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }

    }
LABEL_43:
    v59 = 0;
    goto LABEL_44;
  }
  if (v57)
  {
    _ICQGetLogSystem();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v60 = (objc_class *)objc_opt_class();
      v61 = class_getName(v60);
      *(_DWORD *)buf = 136315394;
      v152 = v61;
      v153 = 2112;
      v154 = v57;
      _os_log_impl(&dword_1CDEBD000, v58, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
    }
    goto LABEL_43;
  }
  v59 = 0;
LABEL_45:

  recommendationSpecification = v21->_recommendationSpecification;
  v21->_recommendationSpecification = v59;

  v66 = v56;
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("appBannerInfo"));
  v67 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _ICQServerDictionaryForBundleIdentifier(v67, v66, 0, 1);
    v68 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v69 = -[_ICQButtonSpecification initWithServerDictionary:]([_ICQButtonSpecification alloc], "initWithServerDictionary:", v68);
LABEL_56:

      goto LABEL_57;
    }
    if (v68)
    {
      _ICQGetLogSystem();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        v73 = (objc_class *)objc_opt_class();
        v74 = class_getName(v73);
        *(_DWORD *)buf = 136315394;
        v152 = v74;
        v153 = 2112;
        v154 = v68;
        _os_log_impl(&dword_1CDEBD000, v72, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }

    }
LABEL_55:
    v69 = 0;
    goto LABEL_56;
  }
  if (v67)
  {
    _ICQGetLogSystem();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v70 = (objc_class *)objc_opt_class();
      v71 = class_getName(v70);
      *(_DWORD *)buf = 136315394;
      v152 = v71;
      v153 = 2112;
      v154 = v67;
      _os_log_impl(&dword_1CDEBD000, v68, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
    }
    goto LABEL_55;
  }
  v69 = 0;
LABEL_57:

  buttonSpecification = v21->_buttonSpecification;
  v21->_buttonSpecification = v69;

  v76 = v34;
  objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("followUpInfo"));
  v77 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v78 = -[_ICQDetailFollowupSpecification initWithServerDictionary:]([_ICQDetailFollowupSpecification alloc], "initWithServerDictionary:", v76);
  }
  else
  {
    if (v77)
    {
      _ICQGetLogSystem();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        v80 = (objc_class *)objc_opt_class();
        v81 = class_getName(v80);
        *(_DWORD *)buf = 136315394;
        v152 = v81;
        v153 = 2112;
        v154 = v77;
        _os_log_impl(&dword_1CDEBD000, v79, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }

    }
    v78 = 0;
  }

  followupSpecification = v21->_followupSpecification;
  v21->_followupSpecification = &v78->super;

  v83 = v76;
  v84 = v66;
  -[NSObject objectForKeyedSubscript:](v83, "objectForKeyedSubscript:", CFSTR("appContextInfo"));
  v85 = objc_claimAutoreleasedReturnValue();
  v86 = v83;
  if (!v85)
  {
LABEL_97:
    v93 = -[_ICQUpgradeFlowSpecification initWithServerDictionary:]([_ICQUpgradeFlowSpecification alloc], "initWithServerDictionary:", v86);
    goto LABEL_98;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v135 = v85;
    v87 = v85;
    v88 = v84;
    if (objc_msgSend(v88, "isEqualToString:", CFSTR("__WILDCARD__")))
    {
      -[NSObject firstObject](v87, "firstObject");
      v89 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v133 = v84;
      v134 = v16;
      v145 = 0u;
      v146 = 0u;
      v143 = 0u;
      v144 = 0u;
      v132 = v87;
      v94 = v87;
      v95 = -[NSObject countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v143, buf, 16);
      if (v95)
      {
        v96 = v95;
        v97 = *(_QWORD *)v144;
        do
        {
          for (i = 0; i != v96; ++i)
          {
            if (*(_QWORD *)v144 != v97)
              objc_enumerationMutation(v94);
            v99 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("appId"));
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = objc_msgSend(v100, "isEqualToString:", v88);

              if ((v101 & 1) != 0)
              {
                v89 = v99;

                goto LABEL_88;
              }
            }
            else if (v99)
            {
              _ICQGetLogSystem();
              v102 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
              {
                v103 = (objc_class *)objc_opt_class();
                v104 = class_getName(v103);
                *(_DWORD *)v147 = 136315394;
                v148 = v104;
                v149 = 2112;
                v150 = v99;
                _os_log_impl(&dword_1CDEBD000, v102, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", v147, 0x16u);
              }

            }
          }
          v96 = -[NSObject countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v143, buf, 16);
        }
        while (v96);
      }

      v89 = 0;
LABEL_88:
      v84 = v133;
      v16 = v134;
      v87 = v132;
    }

    _ICQGetLogSystem();
    v105 = objc_claimAutoreleasedReturnValue();
    v106 = os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT);
    if (v89)
    {
      if (v106)
      {
        *(_DWORD *)buf = 138412290;
        v152 = (const char *)v88;
        _os_log_impl(&dword_1CDEBD000, v105, OS_LOG_TYPE_DEFAULT, "found app-specific flow for %@", buf, 0xCu);
      }

      v86 = v89;
      v105 = v83;
    }
    else
    {
      if (v106)
      {
        *(_DWORD *)buf = 138412290;
        v152 = (const char *)v88;
        _os_log_impl(&dword_1CDEBD000, v105, OS_LOG_TYPE_DEFAULT, "app-specific flow for %@ not found; using top-level flow",
          buf,
          0xCu);
      }
      v86 = v83;
    }

    v85 = v135;
    goto LABEL_97;
  }
  _ICQGetLogSystem();
  v90 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
    v91 = (objc_class *)objc_opt_class();
    v92 = class_getName(v91);
    *(_DWORD *)buf = 136315394;
    v152 = v92;
    v153 = 2112;
    v154 = v85;
    _os_log_impl(&dword_1CDEBD000, v90, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
  }

  v93 = 0;
  v86 = v83;
LABEL_98:

  upgradeFlowSpecification = v21->_upgradeFlowSpecification;
  v21->_upgradeFlowSpecification = v93;

  v108 = [_ICQXMLSpecification alloc];
  -[NSObject objectForKeyedSubscript:](v83, "objectForKeyedSubscript:", CFSTR("placeHolderInfo"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = -[_ICQXMLSpecification initWithPlaceholderInfo:](v108, "initWithPlaceholderInfo:", v109);
  XMLSpecification = v21->_XMLSpecification;
  v21->_XMLSpecification = (_ICQXMLSpecification *)v110;

  v112 = v84;
  -[NSObject objectForKeyedSubscript:](v83, "objectForKeyedSubscript:", CFSTR("universalLinkInfo"));
  v113 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v113)
    {
      v115 = 0;
      goto LABEL_112;
    }
    _ICQGetLogSystem();
    v114 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      v116 = (objc_class *)objc_opt_class();
      v117 = class_getName(v116);
      *(_DWORD *)buf = 136315394;
      v152 = v117;
      v153 = 2112;
      v154 = v113;
      _os_log_impl(&dword_1CDEBD000, v114, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
    }
    goto LABEL_110;
  }
  _ICQServerDictionaryForBundleIdentifier(v113, v112, 0, 0);
  v114 = objc_claimAutoreleasedReturnValue();
  if (!v114)
  {
    _ICQServerDictionaryForBundleIdentifier(v113, CFSTR("com.apple.icq"), 0, 0);
    v114 = objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v114)
    {
      _ICQGetLogSystem();
      v118 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        v119 = (objc_class *)objc_opt_class();
        v120 = class_getName(v119);
        *(_DWORD *)buf = 136315394;
        v152 = v120;
        v153 = 2112;
        v154 = v114;
        _os_log_impl(&dword_1CDEBD000, v118, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }

    }
LABEL_110:
    v115 = 0;
    goto LABEL_111;
  }
  v115 = -[_ICQBannerSpecification initWithServerDictionary:]([_ICQBannerSpecification alloc], "initWithServerDictionary:", v114);
LABEL_111:

LABEL_112:
  universalLinkSpecification = v21->_universalLinkSpecification;
  v21->_universalLinkSpecification = v115;

  -[NSObject objectForKeyedSubscript:](v83, "objectForKeyedSubscript:", CFSTR("actionBasedUniversalLinkInfo"));
  v122 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v123 = -[ICQActionBasedUniversalLinkSpecification initWithServerDictionary:]([ICQActionBasedUniversalLinkSpecification alloc], "initWithServerDictionary:", v122);
  }
  else
  {
    if (v122)
    {
      _ICQGetLogSystem();
      v124 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        v125 = (objc_class *)objc_opt_class();
        v126 = class_getName(v125);
        *(_DWORD *)buf = 136315394;
        v152 = v126;
        v153 = 2112;
        v154 = v122;
        _os_log_impl(&dword_1CDEBD000, v124, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }

    }
    v123 = 0;
  }

  actionBasedUniversalLinkSpecification = v21->_actionBasedUniversalLinkSpecification;
  v21->_actionBasedUniversalLinkSpecification = v123;

  objc_storeStrong((id *)&v21->_inAppMessageSpecification, v21->_bannerSpecification);
  +[ICQOffer _settingsBannerSpecificationWithServerDictionary:bundleId:](ICQOffer, "_settingsBannerSpecificationWithServerDictionary:bundleId:", v83, v112);
  v128 = objc_claimAutoreleasedReturnValue();
  settingsBannerSpecification = v21->_settingsBannerSpecification;
  v21->_settingsBannerSpecification = (_ICQBannerSpecification *)v128;

  -[NSObject objectForKeyedSubscript:](v83, "objectForKeyedSubscript:", CFSTR("iTunesAccountExists"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v21->_iTunesAccountExists = _ICQBooleanForServerObjectDefault(v130, 1);

  objc_storeStrong((id *)&v21->_appLaunchLink, obj);
  v17 = v140;
  v19 = v137;
  v18 = v138;
  v20 = v136;
LABEL_120:

  return v21;
}

- (BOOL)showsPhotoVideoCounts
{
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  ICQOffer *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[ICQOffer bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobileslideshow"))
    || !-[ICQOffer isDetailAppBannerOffer](self, "isDetailAppBannerOffer"))
  {

    return 0;
  }
  v4 = -[ICQOffer placeholderExists](self, "placeholderExists");

  if (!v4)
    return 0;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "Offer %@ will show count", (uint8_t *)&v7, 0xCu);
  }

  return 1;
}

- (void)setAppVersionId:(id)a3
{
  objc_storeStrong((id *)&self->_appVersionId, a3);
}

- (int64_t)offerType
{
  return self->_offerType;
}

- (id)messageSpecificationForPlacement:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("InSettingsAppDetail")))
    -[ICQOffer settingsBannerSpecification](self, "settingsBannerSpecification");
  else
    -[ICQOffer inAppMessageSpecification](self, "inAppMessageSpecification");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_ICQBannerSpecification)inAppMessageSpecification
{
  return self->_inAppMessageSpecification;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Offer server dictionary: %@"), self->_serverDictionary);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

+ (id)_settingsBannerSpecificationWithServerDictionary:(id)a3 bundleId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _ICQBannerSpecification *v10;
  objc_class *v11;
  NSObject *v12;
  objc_class *v13;
  int v15;
  const char *Name;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settingsBannerInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settingsBannerInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      _ICQServerDictionaryForBundleIdentifier(v8, v6, 0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = -[_ICQBannerSpecification initWithDetailBannerInfo:source:]([_ICQBannerSpecification alloc], "initWithDetailBannerInfo:source:", v9, CFSTR("ICQBannerSourceSettingsBannerInfo"));
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }
      if (v9)
      {
        _ICQGetLogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = (objc_class *)objc_opt_class();
          v15 = 136315394;
          Name = class_getName(v13);
          v17 = 2112;
          v18 = v9;
          _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v15, 0x16u);
        }

      }
    }
    else
    {
      if (!v8)
      {
        v10 = 0;
        goto LABEL_15;
      }
      _ICQGetLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        v15 = 136315394;
        Name = class_getName(v11);
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v15, 0x16u);
      }
    }
    v10 = 0;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (BOOL)isExpired
{
  NSDate *expirationDate;
  void *v3;

  expirationDate = self->_expirationDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(expirationDate) = -[NSDate compare:](expirationDate, "compare:", v3) == NSOrderedAscending;

  return (char)expirationDate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *serverDictionary;
  void *v5;
  id v6;

  serverDictionary = self->_serverDictionary;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", serverDictionary, CFSTR("serverDict"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_accountAltDSID, CFSTR("accountAltDSID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_notificationID, CFSTR("notificationID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_retrievalDate, CFSTR("retrievalDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_appVersionId, CFSTR("appVersionId"));
  -[ICQOffer _callbackInterval](self, "_callbackInterval");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("callbackInterval"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_context, CFSTR("context"));
  -[ICQOffer requestedServerUIURL](self, "requestedServerUIURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("requestedServerUIURL"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_actionOverride, CFSTR("actionOverride"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_appLaunchLink, CFSTR("appLaunchLink"));

}

- (ICQOffer)initWithCoder:(id)a3
{
  id v4;
  ICQOffer *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ICQOffer;
  v5 = -[ICQOffer init](&v25, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("serverDict"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountAltDSID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("retrievalDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("callbackInterval"));
    v17 = v16;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appVersionId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appLaunchLink"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedServerUIURL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQOffer setRequestedServerUIURL:](v5, "setRequestedServerUIURL:", v21);

    v5->_actionOverride = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionOverride"));
    -[ICQOffer setContext:](v5, "setContext:", v18);
    -[ICQOffer setAppVersionId:](v5, "setAppVersionId:", v19);
    v5 = -[ICQOffer initWithServerDictionary:accountAltDSID:notificationID:retrievalDate:callbackInterval:appLaunchLink:bundleIdentifier:](v5, "initWithServerDictionary:accountAltDSID:notificationID:retrievalDate:callbackInterval:appLaunchLink:bundleIdentifier:", v23, v12, v13, v14, v20, v15, v17);

  }
  return v5;
}

- (NSURL)serverUIURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *bannerSpecification;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[ICQOffer requestedServerUIURL](self, "requestedServerUIURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICQOffer requestedServerUIURL](self, "requestedServerUIURL");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_ICQBannerSpecification serverUIURL](self->_bannerSpecification, "serverUIURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      bannerSpecification = self->_bannerSpecification;
    }
    else
    {
      -[_ICQFollowupSpecification serverUIURL](self->_followupSpecification, "serverUIURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        bannerSpecification = self->_followupSpecification;
      }
      else
      {
        -[_ICQBannerSpecification serverUIURL](self->_universalLinkSpecification, "serverUIURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          return (NSURL *)v8;
        bannerSpecification = self->_universalLinkSpecification;
      }
    }
    objc_msgSend(bannerSpecification, "serverUIURL");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v4;
  if (v4)
  {
    -[ICQOffer bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.icq")))
    {
LABEL_14:

      return (NSURL *)v8;
    }
    -[ICQOffer context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[ICQOffer _processICQURL:](self, "_processICQURL:", v8);
      v9 = v8;
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  return (NSURL *)v8;
}

- (_ICQDynamicUISpecification)dynamicUISpecification
{
  void *v3;
  id *p_bannerSpecification;
  void *v5;
  void *v6;
  _ICQBannerSpecification **p_universalLinkSpecification;
  _ICQBannerSpecification *universalLinkSpecification;
  void *v9;
  void *v10;
  _ICQDynamicUISpecification *v11;

  -[ICQOffer serverUIURL](self, "serverUIURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_bannerSpecification = (id *)&self->_bannerSpecification;
  -[_ICQBannerSpecification dynamicUIRouteURL](self->_bannerSpecification, "dynamicUIRouteURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    p_bannerSpecification = (id *)&self->_followupSpecification;
    -[_ICQFollowupSpecification dynamicUIRouteURL](self->_followupSpecification, "dynamicUIRouteURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      universalLinkSpecification = self->_universalLinkSpecification;
      p_universalLinkSpecification = &self->_universalLinkSpecification;
      -[_ICQBannerSpecification dynamicUIRouteURL](universalLinkSpecification, "dynamicUIRouteURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = 0;
        goto LABEL_6;
      }
      p_bannerSpecification = (id *)p_universalLinkSpecification;
    }
  }
  objc_msgSend(*p_bannerSpecification, "dynamicUIRouteURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*p_bannerSpecification, "purchaseAttribution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v11 = -[_ICQDynamicUISpecification initWithRouteURL:pageContentsURL:attributionSuffix:]([_ICQDynamicUISpecification alloc], "initWithRouteURL:pageContentsURL:attributionSuffix:", v10, v3, v9);

  return v11;
}

- (id)universalLink
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  -[ICQOffer universalLinkSpecification](self, "universalLinkSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "links");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[ICQOffer universalLinkSpecification](self, "universalLinkSpecification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "links");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ICQOffer universalLink].cold.1(self, v9);

    v8 = 0;
  }
  return v8;
}

- (id)_processICQURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DE8];
  v27 = v4;
  objc_msgSend(v4, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3998];
  -[ICQOffer context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = v9;
  objc_msgSend(v9, "queryItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lowercaseString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("context"));

        if (v19)
        {
          v20 = (void *)MEMORY[0x1E0CB39D8];
          objc_msgSend(v16, "value");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "queryItemWithName:value:", CFSTR("clientContext"), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v22);

        }
        else
        {
          objc_msgSend(v10, "addObject:", v16);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

  objc_msgSend(v26, "addObjectsFromArray:", v10);
  objc_msgSend(v27, "setQueryItems:", v26);
  objc_msgSend(v27, "URL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)journeyLinkForId:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_serverDictionary, "objectForKeyedSubscript:", CFSTR("journeyLinks"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("btnId"), (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqualToString:", v4) & 1) != 0)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("btnTitle"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("btnAction"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("btnActParams"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("btnId"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          _ICQLinkForServerValues(v13, v14, v15, 0, v16, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)universalLinkForContext:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICQOffer universalLinkForContext:].cold.1((uint64_t)v4, v5, v6);

  -[ICQActionBasedUniversalLinkSpecification icqLinkForContext:](self->_actionBasedUniversalLinkSpecification, "icqLinkForContext:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "universalLinkForContext found action based link", buf, 2u);
    }

    v9 = v7;
  }
  else
  {
    -[ICQActionBasedUniversalLinkSpecification defaultLink](self->_actionBasedUniversalLinkSpecification, "defaultLink");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "universalLinkForContext using action based default link", v16, 2u);
      }

      -[ICQActionBasedUniversalLinkSpecification defaultLink](self->_actionBasedUniversalLinkSpecification, "defaultLink");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12)
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "universalLinkForContext falling back to legacy universal link", v15, 2u);
      }

      -[ICQOffer universalLink](self, "universalLink");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v13 = v9;

  return v13;
}

- (id)messageSpecificationForReason:(id)a3 bundleId:(id)a4 placement:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("InSettingsAppDetail")))
    -[ICQOffer settingsBannerSpecificationForReason:bundleId:](self, "settingsBannerSpecificationForReason:bundleId:", v9, v8);
  else
    -[ICQOffer inAppMessageSpecificationForReason:bundleId:](self, "inAppMessageSpecificationForReason:bundleId:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)inAppMessageSpecificationForReason:(id)a3 bundleId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _ICQBannerSpecification *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  objc_class *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  const char *Name;
  int v28;
  const char *v29;
  __int16 v30;
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSDictionary objectForKeyedSubscript:](self->_serverDictionary, "objectForKeyedSubscript:", CFSTR("detailAppBannerInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    goto LABEL_4;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_serverDictionary, "objectForKeyedSubscript:", CFSTR("bubbleBannerInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_4:
    -[NSDictionary objectForKeyedSubscript:](self->_serverDictionary, "objectForKeyedSubscript:", CFSTR("bubbleBannerInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQBubbleBannerSpecificationForServerDict(v10, v7);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v11 = v11;
      v12 = (_ICQBannerSpecification *)v11;
      goto LABEL_26;
    }
    -[NSDictionary objectForKeyedSubscript:](self->_serverDictionary, "objectForKeyedSubscript:", CFSTR("detailAppBannerInfo"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      _ICQServerDictionaryForBundleIdentifier(v13, v7, v6, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        _ICQGetLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 138412290;
          v29 = (const char *)v6;
          _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "Using banner fallback search for reason %@", (uint8_t *)&v28, 0xCu);
        }

        _ICQServerDictionaryForBundleIdentifier(v13, CFSTR("__WILDCARD__"), v6, 0);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = -[_ICQBannerSpecification initWithDetailBannerInfo:source:]([_ICQBannerSpecification alloc], "initWithDetailBannerInfo:source:", v14, CFSTR("ICQBannerSourceDetailAppBannerInfo"));
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      if (v14)
      {
        _ICQGetLogSystem();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = (objc_class *)objc_opt_class();
          Name = class_getName(v25);
          v28 = 136315394;
          v29 = Name;
          v30 = 2112;
          v31 = v14;
          _os_log_impl(&dword_1CDEBD000, v24, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v28, 0x16u);
        }

      }
    }
    else
    {
      if (!v13)
      {
        v12 = 0;
        goto LABEL_25;
      }
      _ICQGetLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (objc_class *)objc_opt_class();
        v28 = 136315394;
        v29 = class_getName(v16);
        v30 = 2112;
        v31 = v13;
        _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v28, 0x16u);
      }
    }
    v12 = 0;
    goto LABEL_24;
  }
  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[ICQOffer inAppMessageSpecificationForReason:bundleId:].cold.1(v11, v17, v18, v19, v20, v21, v22, v23);
  v12 = 0;
LABEL_26:

  return v12;
}

- (id)settingsBannerSpecificationForReason:(id)a3 bundleId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  _ICQBannerSpecification *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  NSObject *v21;
  objc_class *v22;
  int v24;
  const char *Name;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSDictionary objectForKeyedSubscript:](self->_serverDictionary, "objectForKeyedSubscript:", CFSTR("settingsBannerInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = CFSTR("ICQBannerSourceSettingsBannerInfo");
    -[NSDictionary objectForKeyedSubscript:](self->_serverDictionary, "objectForKeyedSubscript:", CFSTR("settingsBannerInfo"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      _ICQServerDictionaryForBundleIdentifier(v10, v7, v6, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = -[_ICQBannerSpecification initWithDetailBannerInfo:source:]([_ICQBannerSpecification alloc], "initWithDetailBannerInfo:source:", v11, v9);
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      if (v11)
      {
        _ICQGetLogSystem();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (objc_class *)objc_opt_class();
          v24 = 136315394;
          Name = class_getName(v22);
          v26 = 2112;
          v27 = v11;
          _os_log_impl(&dword_1CDEBD000, v21, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v24, 0x16u);
        }

      }
    }
    else
    {
      if (!v10)
      {
        v12 = 0;
        goto LABEL_17;
      }
      _ICQGetLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (objc_class *)objc_opt_class();
        v24 = 136315394;
        Name = class_getName(v20);
        v26 = 2112;
        v27 = v10;
        _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v24, 0x16u);
      }
    }
    v12 = 0;
    goto LABEL_16;
  }
  _ICQGetLogSystem();
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    -[ICQOffer settingsBannerSpecificationForReason:bundleId:].cold.1(v9, v13, v14, v15, v16, v17, v18, v19);
  v12 = 0;
LABEL_18:

  return v12;
}

- (NSDate)retrievalDate
{
  return self->_retrievalDate;
}

- (void)setRetrievalDate:(id)a3
{
  objc_storeStrong((id *)&self->_retrievalDate, a3);
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)appVersionId
{
  return self->_appVersionId;
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (void)setAccountAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_accountAltDSID, a3);
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
  objc_storeStrong((id *)&self->_notificationID, a3);
}

- (NSString)offerId
{
  return self->_offerId;
}

- (void)setOfferId:(id)a3
{
  objc_storeStrong((id *)&self->_offerId, a3);
}

- (ICQActionBasedUniversalLinkSpecification)actionBasedUniversalLinkSpecification
{
  return self->_actionBasedUniversalLinkSpecification;
}

- (_ICQBannerSpecification)bannerSpecification
{
  return self->_bannerSpecification;
}

- (void)setBannerSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_bannerSpecification, a3);
}

- (_ICQBannerSpecification)recommendationSpecification
{
  return self->_recommendationSpecification;
}

- (void)setRecommendationSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationSpecification, a3);
}

- (void)setInAppMessageSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_inAppMessageSpecification, a3);
}

- (_ICQBannerSpecification)settingsBannerSpecification
{
  return self->_settingsBannerSpecification;
}

- (void)setSettingsBannerSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_settingsBannerSpecification, a3);
}

- (_ICQButtonSpecification)buttonSpecification
{
  return self->_buttonSpecification;
}

- (void)setButtonSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_buttonSpecification, a3);
}

- (_ICQFollowupSpecification)followupSpecification
{
  return self->_followupSpecification;
}

- (void)setFollowupSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_followupSpecification, a3);
}

- (_ICQUpgradeFlowSpecification)upgradeFlowSpecification
{
  return self->_upgradeFlowSpecification;
}

- (void)setUpgradeFlowSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_upgradeFlowSpecification, a3);
}

- (_ICQXMLSpecification)XMLSpecification
{
  return self->_XMLSpecification;
}

- (void)setXMLSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_XMLSpecification, a3);
}

- (_ICQDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (_ICQBannerSpecification)universalLinkSpecification
{
  return self->_universalLinkSpecification;
}

- (void)setUniversalLinkSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_universalLinkSpecification, a3);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)iTunesAccountExists
{
  return self->_iTunesAccountExists;
}

- (void)setITunesAccountExists:(BOOL)a3
{
  self->_iTunesAccountExists = a3;
}

- (_ICQAppLaunchLink)appLaunchLink
{
  return self->_appLaunchLink;
}

- (void)setAppLaunchLink:(id)a3
{
  objc_storeStrong((id *)&self->_appLaunchLink, a3);
}

- (NSURL)requestedServerUIURL
{
  return self->_requestedServerUIURL;
}

- (void)setRequestedServerUIURL:(id)a3
{
  objc_storeStrong((id *)&self->_requestedServerUIURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedServerUIURL, 0);
  objc_storeStrong((id *)&self->_appLaunchLink, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_universalLinkSpecification, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_XMLSpecification, 0);
  objc_storeStrong((id *)&self->_upgradeFlowSpecification, 0);
  objc_storeStrong((id *)&self->_followupSpecification, 0);
  objc_storeStrong((id *)&self->_buttonSpecification, 0);
  objc_storeStrong((id *)&self->_settingsBannerSpecification, 0);
  objc_storeStrong((id *)&self->_inAppMessageSpecification, 0);
  objc_storeStrong((id *)&self->_recommendationSpecification, 0);
  objc_storeStrong((id *)&self->_bannerSpecification, 0);
  objc_storeStrong((id *)&self->_actionBasedUniversalLinkSpecification, 0);
  objc_storeStrong((id *)&self->_offerId, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_accountAltDSID, 0);
  objc_storeStrong((id *)&self->_appVersionId, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_retrievalDate, 0);
  objc_storeStrong((id *)&self->_planDetailsOverride, 0);
  objc_storeStrong((id *)&self->_serverDictionary, 0);
}

+ (id)sampleOfferForLevel:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "setRetrievalDate:", v5);

  objc_msgSend(v4, "setLevel:", a3);
  objc_msgSend(v4, "setAccountAltDSID:", &stru_1E8B3C468);
  objc_msgSend(v4, "setNotificationID:", &stru_1E8B3C468);
  objc_msgSend(v4, "setOfferId:", &stru_1E8B3C468);
  +[_ICQBannerSpecification bannerSpecificationSampleForLevel:](_ICQBannerSpecification, "bannerSpecificationSampleForLevel:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBannerSpecification:", v6);

  +[_ICQButtonSpecification buttonSpecificationSampleForLevel:](_ICQButtonSpecification, "buttonSpecificationSampleForLevel:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setButtonSpecification:", v7);

  +[_ICQUpgradeFlowSpecification upgradeFlowSpecificationSampleForLevel:](_ICQUpgradeFlowSpecification, "upgradeFlowSpecificationSampleForLevel:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpgradeFlowSpecification:", v8);

  return v4;
}

- (int64_t)action
{
  uint64_t actionOverride;
  void *v4;
  void *v5;
  void *v6;

  actionOverride = self->_actionOverride;
  if (!actionOverride)
  {
    -[ICQOffer buttonSpecification](self, "buttonSpecification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buttonLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    actionOverride = objc_msgSend(v5, "action");

    if (!actionOverride)
    {
      -[ICQOffer followupSpecification](self, "followupSpecification");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      actionOverride = objc_msgSend(v6, "primaryAction");

    }
  }
  return actionOverride;
}

- (void)updateOfferWithPlanDetails:(id)a3 actionString:(id)a4
{
  id v6;
  NSDictionary *v7;
  NSDictionary *planDetailsOverride;
  int64_t v9;

  v6 = a4;
  v7 = (NSDictionary *)objc_msgSend(a3, "copy");
  planDetailsOverride = self->_planDetailsOverride;
  self->_planDetailsOverride = v7;

  v9 = _ICQActionForServerActionString(v6);
  self->_actionOverride = v9;
}

- (void)updateOfferWithAction:(int64_t)a3
{
  self->_actionOverride = a3;
}

- (double)_callbackInterval
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[ICQOffer expirationDate](self, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQOffer retrievalDate](self, "retrievalDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (BOOL)isBuddyOffer
{
  return _ICQIsBuddyOfferDictionary(self->_serverDictionary);
}

- (BOOL)isDefaultOffer
{
  return _ICQIsDefaultOfferDictionary(self->_serverDictionary);
}

- (BOOL)isPremiumOffer
{
  return _ICQIsPremiumOfferDictionary(self->_serverDictionary);
}

- (id)storagePurchaseKeybagForButtonId:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *planDetailsOverride;
  NSDictionary *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  planDetailsOverride = self->_planDetailsOverride;
  if (planDetailsOverride)
  {
    v7 = planDetailsOverride;
LABEL_6:
    v9 = v7;
    goto LABEL_7;
  }
  if (!v4
    || (_ICQDictionaryForKey(self->_serverDictionary, CFSTR("planDetailsByBtnId")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        _ICQDictionaryForKey(v8, v5),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    _ICQDictionaryForKey(self->_serverDictionary, CFSTR("planDetails"));
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (id)alertSpecificationForAlertKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  const __CFString *v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  const __CFString *v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_serverDictionary, "objectForKeyedSubscript:", CFSTR("inlineAlertInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v5;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v7)
    {
      v8 = v7;
      v28 = 0;
      v9 = *(_QWORD *)v30;
      v10 = 0x1E0C99000uLL;
      v11 = CFSTR("alertKey");
      v12 = 0x1E0CB3000uLL;
      do
      {
        v13 = 0;
        v27 = v8;
        do
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v6);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", v11);
            v15 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && -[NSObject isEqualToString:](v15, "isEqualToString:", v4))
            {
              v35 = CFSTR("alertInfo");
              v36 = v14;
              objc_msgSend(*(id *)(v10 + 3456), "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              _ICQAlertSpecificationForServerDict(v16);
              v17 = v9;
              v18 = v10;
              v19 = v6;
              v20 = v11;
              v21 = v12;
              v22 = v4;
              v23 = objc_claimAutoreleasedReturnValue();

              v28 = (void *)v23;
              v4 = v22;
              v12 = v21;
              v11 = v20;
              v6 = v19;
              v10 = v18;
              v9 = v17;
              v8 = v27;
            }
          }
          else
          {
            _ICQGetLogSystem();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v14;
              _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "expected inlineAlertInfo to be NSArray<NSDictionary *> but found %@", buf, 0xCu);
            }
          }

          ++v13;
        }
        while (v8 != v13);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v8);
    }
    else
    {
      v28 = 0;
    }

    v5 = v26;
    v24 = v28;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)alertSpecificationAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_serverDictionary, "objectForKeyedSubscript:", CFSTR("inlineAlertInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count") > a3)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alertKey"));
      v6 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = CFSTR("alertInfo");
        v13[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        _ICQAlertSpecificationForServerDict(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      _ICQGetLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "expected inlineAlertInfo to be NSArray<NSDictionary *> but found %@", (uint8_t *)&v10, 0xCu);
      }
    }
    v8 = 0;
    goto LABEL_10;
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)isDetailAppBannerOffer
{
  return -[_ICQBannerSpecification isDetailBannerInfoAvailable](self->_bannerSpecification, "isDetailBannerInfoAvailable");
}

- (BOOL)placeholderExists
{
  return -[_ICQBannerSpecification placeholderExists](self->_bannerSpecification, "placeholderExists");
}

+ (id)offerReasonForServerReason:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iCloudFullViolation")) & 1) != 0)
  {
    v4 = CFSTR("iCloudStorageFull");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iCloudAlmostFullViolation")) & 1) != 0)
  {
    v4 = CFSTR("iCloudStorageAlmostFull");
  }
  else
  {
    v4 = (__CFString *)v3;
  }

  return v4;
}

- (NSDate)lastUpdated
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[ICQOffer recommendationSpecification](self, "recommendationSpecification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "reason"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    objc_msgSend(v3, "decayUntil");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    objc_msgSend(v3, "reason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ICQHelperFunctions lastUpdatedForReason:decayUntil:](_ICQHelperFunctions, "lastUpdatedForReason:decayUntil:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _ICQBannerLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "reason");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v11;
      v16 = 2048;
      v17 = v7;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, "Providing last updated for Photos Bubble Banner - Reason: %@ Decay: %f lastUpdated: %@", (uint8_t *)&v14, 0x20u);

    }
  }
  else
  {
    _ICQBannerLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "We do not have a recommendation banner spec. In this case sending the current timestamp.", (uint8_t *)&v14, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDate *)v9;
}

- (unint64_t)bannerPriority
{
  return 2;
}

- (void)universalLink
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_6(&dword_1CDEBD000, a2, v4, "Universal link is not available in offer %@", (uint8_t *)&v5);

}

- (void)universalLinkForContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_6(&dword_1CDEBD000, a2, a3, "universalLinkForContext: %@", (uint8_t *)&v3);
}

- (void)inAppMessageSpecificationForReason:(uint64_t)a3 bundleId:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, a1, a3, "No detail banners found in default offer", a5, a6, a7, a8, 0);
}

- (void)settingsBannerSpecificationForReason:(uint64_t)a3 bundleId:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, a1, a3, "No settings banners found in default offer", a5, a6, a7, a8, 0);
}

@end
