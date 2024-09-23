@implementation SPSearchTopHitResult

- (SPSearchTopHitResult)initWithRankingItem:(id)a3 attributeSet:(id)a4 score:interestingDate:dataclass:bundleID:
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  id v18;
  SPSearchTopHitResult *v19;
  SPSearchTopHitResult *v20;
  objc_super v22;
  void *v23;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v15 = a4;
  v16 = v9;
  v17 = v8;
  v18 = v23;
  v22.receiver = self;
  v22.super_class = (Class)SPSearchTopHitResult;
  v19 = -[SPTopHitResult initWithRankingItem:](&v22, sel_initWithRankingItem_, a3);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_attributeSet, a4);
    -[SPTopHitResult setScore:](v20, "setScore:", v11, v10);
    -[SPTopHitResult setInterestingDate:](v20, "setInterestingDate:", v16);
    -[SPTopHitResult setDataclass:](v20, "setDataclass:", v17);
    -[SPTopHitResult setBundleID:](v20, "setBundleID:", v18);
  }

  return v20;
}

- (SPSearchTopHitResult)resultWithTime:(double)a3 searchString:(id)a4 isCorrectedQuery:(BOOL)a5 withQueryContext:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  CSSearchableItemAttributeSet *attributeSet;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  int v31;
  NSObject *v32;
  os_log_type_t v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  id v48;
  uint64_t v49;
  const __CFString *v50;
  int v51;
  void *v52;
  void *v53;
  os_log_type_t v54;
  __CFString *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  int v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  __CFString *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  os_log_type_t v95;
  __CFString *v96;
  void *v97;
  void *v98;
  int v99;
  char v100;
  os_log_type_t v101;
  id v102;
  __CFString *v103;
  __CFString *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  char v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  void *v117;
  void *v118;
  void *v119;
  SPSearchTopHitResult *v120;
  void *v121;
  __CFString *v122;
  uint8_t buf[4];
  const __CFString *v124;
  __int16 v125;
  const __CFString *v126;
  uint64_t v127;

  v7 = a5;
  v127 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  objc_msgSend(v11, "disabledApps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v12);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v121 = 0;
  }
  attributeSet = self->_attributeSet;
  if (attributeSet)
  {
    v120 = self;
    -[CSSearchableItemAttributeSet attributeDictionary](attributeSet, "attributeDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC1AE8]);
    v122 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC2160]);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = *MEMORY[0x24BDC1B90];
    objc_msgSend(v14, "objectForKeyedSubscript:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC2060]);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = *MEMORY[0x24BDC1B58];
    objc_msgSend(v14, "objectForKeyedSubscript:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v18 = v17;
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B78]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    if ((v18 >= a3 || a3 - v18 >= 300.0) && (v20 >= a3 || a3 - v20 >= 300.0))
    {

      v24 = v122;
      if ((-[__CFString isEqualToString:](v122, "isEqualToString:", *MEMORY[0x24BE849A8]) & 1) != 0
        || (-[__CFString isEqualToString:](v122, "isEqualToString:", *MEMORY[0x24BE849A0]) & 1) != 0
        || (-[__CFString isEqualToString:](v122, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")) & 1) != 0)
      {
        v23 = 0;
        goto LABEL_18;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC1EF8]);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v97;
      if (v10 && objc_msgSend(v97, "hasPrefix:", v10))
      {
        if (objc_msgSend(v98, "isEqualToString:", v10))
          v23 = 2;
        else
          v23 = 1;
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      SPLogForSPLogCategoryQuery();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = 2 * (*MEMORY[0x24BE84AF8] == 0);
      if (os_log_type_enabled(v21, v22))
      {
        *(_DWORD *)buf = 138412290;
        v124 = CFSTR("Very recently created/modified");
        _os_log_impl(&dword_2279CC000, v21, v22, "%@", buf, 0xCu);
      }

      v23 = 1;
    }
    v24 = v122;
LABEL_18:
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE84AE0])
      && ((-[__CFString isEqualToString:](v24, "isEqualToString:", *MEMORY[0x24BE849A8]) & 1) != 0
       || -[__CFString isEqualToString:](v24, "isEqualToString:", *MEMORY[0x24BE849A0])))
    {
      -[SPTopHitResult dataclass](v120, "dataclass");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SPTopHitResult score](v120, "score");
      -[SPSearchTopHitResult makeApplicationResult:dataclass:score:](v120, "makeApplicationResult:dataclass:score:", v14, v26, v27, v28);
      v29 = (id)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v29, "applicationBundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v121, "containsObject:", v30);

        if (v31)
        {
          SPLogForSPLogCategoryDefault();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = 2 * (*MEMORY[0x24BE84AF8] == 0);
          v34 = v122;
          if (os_log_type_enabled(v32, v33))
          {
            objc_msgSend(v29, "applicationBundleIdentifier");
            v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v124 = v35;
            _os_log_impl(&dword_2279CC000, v32, v33, "disabledAppSet contains  %@", buf, 0xCu);

          }
          v25 = 0;
          goto LABEL_87;
        }
        goto LABEL_36;
      }
      goto LABEL_39;
    }
    if (-[__CFString isEqualToString:](v24, "isEqualToString:", *MEMORY[0x24BEB05C0]))
    {
      -[SPTopHitResult dataclass](v120, "dataclass");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[SPTopHitResult score](v120, "score");
      -[SPSearchTopHitResult makeMailResult:dataclass:score:searchString:](v120, "makeMailResult:dataclass:score:searchString:", v14, v36, v37, v38, v10);
      v39 = objc_claimAutoreleasedReturnValue();
LABEL_34:
      v29 = (id)v39;

      objc_msgSend(v29, "setResultBundleId:", v24);
      goto LABEL_35;
    }
    if (-[__CFString isEqualToString:](v24, "isEqualToString:", *MEMORY[0x24BEB05D0]))
    {
      -[SPTopHitResult dataclass](v120, "dataclass");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[SPTopHitResult score](v120, "score");
      -[SPSearchTopHitResult makeMessagesResult:dataclass:queryContext:score:](v120, "makeMessagesResult:dataclass:queryContext:score:", v14, v36, v11, v40, v41);
      v39 = objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    if (-[__CFString isEqualToString:](v24, "isEqualToString:", *MEMORY[0x24BEB05F0]))
    {
      -[SPTopHitResult dataclass](v120, "dataclass");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[SPTopHitResult score](v120, "score");
      -[SPSearchTopHitResult makePhotosResult:dataclass:queryContext:score:](v120, "makePhotosResult:dataclass:queryContext:score:", v14, v36, v11, v42, v43);
      v39 = objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    if (-[__CFString isEqualToString:](v24, "isEqualToString:", *MEMORY[0x24BEB05E8]))
    {
      -[SPTopHitResult dataclass](v120, "dataclass");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[SPTopHitResult score](v120, "score");
      -[SPSearchTopHitResult makePersonResult:dataclass:queryContext:score:](v120, "makePersonResult:dataclass:queryContext:score:", v14, v36, v11, v44, v45);
      v39 = objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    v86 = (void *)objc_opt_new();
    v87 = -[SPTopHitResult score](v120, "score");
    objc_msgSend(v86, "setScore:", v87, v88);
    -[SPTopHitResult dataclass](v120, "dataclass");
    v89 = v24;
    v90 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setProtectionClass:", v90);

    -[SPSearchTopHitResult populateCoreSpotlightResult:attrs:bundleID:queryContext:](v120, "populateCoreSpotlightResult:attrs:bundleID:queryContext:", v86, v14, v89, v11);
    v29 = v86;
    objc_msgSend(v29, "fileProviderIdentifier");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v90) = objc_opt_isKindOfClass();

    if ((v90 & 1) != 0)
    {
      objc_msgSend(v29, "fileProviderIdentifier");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v92, "length"))
      {
        objc_msgSend(v29, "userActivityRequiredString");
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v93)
        {

          if (objc_msgSend(v117, "unsignedIntValue"))
            objc_msgSend(v29, "setSectionBundleIdentifier:", *MEMORY[0x24BEB06C8]);
          SPLogForSPLogCategoryDefault();
          v94 = objc_claimAutoreleasedReturnValue();
          v95 = 2 * (*MEMORY[0x24BE84AF8] == 0);
          if (os_log_type_enabled(v94, v95))
          {
            *(_DWORD *)buf = 138412546;
            v124 = CFSTR("com.apple.DocumentsApp");
            v125 = 2112;
            v126 = CFSTR("com.apple.DocumentsApp");
            _os_log_impl(&dword_2279CC000, v94, v95, "remap %@ to %@", buf, 0x16u);
          }

          v96 = CFSTR("com.apple.DocumentsApp");
LABEL_119:
          objc_msgSend(v29, "setBundleID:", v96);
          objc_msgSend(v29, "sectionBundleIdentifier");
          v109 = objc_claimAutoreleasedReturnValue();
          v110 = (void *)v109;
          if (v109)
            v111 = v109;
          else
            v111 = (uint64_t)v96;
          objc_msgSend(v29, "setSectionBundleIdentifier:", v111);

          objc_msgSend(v29, "setApplicationBundleIdentifier:", v96);
          if (-[__CFString isEqualToString:](v96, "isEqualToString:", CFSTR("com.apple.shortcuts"))
            && v118)
          {
            objc_msgSend(v29, "setApplicationBundleIdentifier:", v118);
          }
          v122 = v96;
          if (-[__CFString isEqualToString:](v96, "isEqualToString:", *MEMORY[0x24BEB0480]))
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BE0]);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setStringForDedupe:", v112);
            objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BF8]);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setDomainIdentifier:", v113);

          }
LABEL_35:
          if (v29)
          {
LABEL_36:
            v119 = v15;
            SPLogForSPLogCategoryDefault();
            v46 = objc_claimAutoreleasedReturnValue();
            v47 = 2 * (*MEMORY[0x24BE84AF8] == 0);
            if (os_log_type_enabled(v46, v47))
            {
              v48 = v10;
              v49 = objc_msgSend(v29, "score");
              objc_msgSend(v29, "score");
              *(_DWORD *)buf = 134218240;
              v124 = (const __CFString *)v49;
              v10 = v48;
              v125 = 2048;
              v126 = v50;
              _os_log_impl(&dword_2279CC000, v46, v47, "Result score: 0x%08llx 0x%08llx", buf, 0x16u);
            }
            v51 = 0;
            goto LABEL_42;
          }
LABEL_39:
          v119 = v15;
          SPLogForSPLogCategoryDefault();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2279CC000, v46, OS_LOG_TYPE_DEFAULT, "*warn* Couldn't determine score for nil result", buf, 2u);
          }
          v29 = 0;
          v51 = 1;
LABEL_42:

          if (v23 > (int)objc_msgSend(v29, "topHit"))
            objc_msgSend(v29, "setTopHit:", SSSetTopHitWithReasonString());
          if (objc_msgSend(v119, "isEqualToString:", CFSTR("public.calendar-event")))
          {
            objc_msgSend(v29, "title");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "text");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setCompletedQuery:", v53);

          }
          if (v51)
          {
            SPLogForSPLogCategoryDefault();
            v32 = objc_claimAutoreleasedReturnValue();
            v54 = *MEMORY[0x24BE84B00] ^ 1;
            v34 = v122;
            if (os_log_type_enabled(v32, v54))
            {
              objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC22E8]);
              v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v124 = v55;
              v125 = 2112;
              v126 = v122;
              _os_log_impl(&dword_2279CC000, v32, v54, "No result object for CoreSpotlight result, identifier:%@, bundleID:%@", buf, 0x16u);

            }
            v29 = 0;
LABEL_50:
            v25 = 0;
LABEL_86:
            v15 = v119;
LABEL_87:

LABEL_88:
            goto LABEL_89;
          }
          objc_msgSend(v29, "compatibilityTitle");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v56)
          {
            objc_msgSend(v29, "bundleID");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v56, "isEqualToString:", *MEMORY[0x24BEB05F0]) & 1) == 0)
            {
              objc_msgSend(v29, "sectionBundleIdentifier");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if ((SSSectionIsSyndicatedPhotos() & 1) == 0)
              {
                v58 = objc_msgSend(v11, "queryKind");
                objc_msgSend(v11, "clientBundleID");
                v59 = (id)objc_claimAutoreleasedReturnValue();
                if ((_os_feature_enabled_impl() & 1) == 0)
                {
                  if ((objc_msgSend(v59, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0
                    || (objc_msgSend(v59, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0
                    || (v99 = objc_msgSend(v59, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v58 == 12)
                    || v99)
                  {
                    v100 = _os_feature_enabled_impl();

                    if ((v100 & 1) != 0)
                    {
LABEL_58:
                      objc_msgSend(v29, "setUserInput:", v10);
                      if (!objc_msgSend(v29, "type"))
                      {
                        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC2310]);
                        v60 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v60)
                          v61 = 4;
                        else
                          v61 = 2;
                        objc_msgSend(v29, "setType:", v61);

                      }
                      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC1EF8]);
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "setLaunchString:", v62);

                      objc_msgSend(v29, "setRelatedBundleID:", v118);
                      objc_msgSend(v29, "setRelatedAppIdentifier:", v118);
                      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC2128]);
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "setLaunchDates:", v63);

                      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC2110]);
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "setItemProviderDataTypes:", v64);

                      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC2118]);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "setItemProviderFileTypes:", v65);

                      if (-[__CFString isEqualToString:](v122, "isEqualToString:", *MEMORY[0x24BEB0748])
                        || (-[__CFString hasPrefix:](v122, "hasPrefix:", CFSTR("com.apple")) & 1) == 0
                        && objc_msgSend(MEMORY[0x24BEB02B8], "isLowEngagementBundle:", v122))
                      {
                        objc_msgSend(v29, "setHasTextContentMatch:", -[SPSearchTopHitResult doesQueryMatchContentForLowEngagementBundle:queryContext:](v120, "doesQueryMatchContentForLowEngagementBundle:queryContext:", v14, v11));
                      }
                      else if ((-[__CFString isEqualToString:](v122, "isEqualToString:", *MEMORY[0x24BEB05E8]) & 1) == 0
                             && (-[__CFString isEqualToString:](v122, "isEqualToString:", *MEMORY[0x24BEB0548]) & 1) == 0)
                      {
                        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC23A8]);
                        v66 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "setHasTextContentMatch:", BOOLValueForAttr(v66));

                      }
                      objc_msgSend(v29, "contentType");
                      v67 = objc_claimAutoreleasedReturnValue();
                      if (!v67
                        || (v68 = (void *)v67,
                            objc_msgSend(v29, "contentTypeTree"),
                            v69 = (void *)objc_claimAutoreleasedReturnValue(),
                            v69,
                            v68,
                            !v69))
                      {
                        objc_msgSend(v14, "objectForKeyedSubscript:", v115);
                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "setContentType:", v70);

                        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B98]);
                        v71 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "setContentTypeTree:", v71);

                      }
                      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BD8]);
                      v116 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "setDataOwnerType:", -[NSObject integerValue](v116, "integerValue"));
                      objc_msgSend(v29, "contentCreationDate");
                      v72 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v72)
                      {
                        objc_msgSend(v14, "objectForKeyedSubscript:", v114);
                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "setContentCreationDate:", v73);

                      }
                      if (v7)
                      {
                        objc_msgSend(v11, "searchString");
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "setCorrectedQuery:", v74);

                      }
                      -[SPTopHitResult rankingItem](v120, "rankingItem");
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "setQueryId:", objc_msgSend(v11, "queryIdent"));
                      objc_msgSend(v29, "sectionBundleIdentifier");
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v76, "isEqualToString:", *MEMORY[0x24BEB0358]))
                      {

                        v34 = v122;
                        v32 = v116;
                      }
                      else
                      {
                        objc_msgSend(v29, "sectionBundleIdentifier");
                        v77 = v12;
                        v78 = v11;
                        v79 = v10;
                        v80 = (void *)objc_claimAutoreleasedReturnValue();
                        v81 = objc_msgSend(v80, "isEqualToString:", *MEMORY[0x24BEB0350]);

                        v10 = v79;
                        v11 = v78;
                        v12 = v77;

                        v34 = v122;
                        v32 = v116;
                        if (!v81)
                        {
LABEL_85:
                          objc_msgSend(v29, "setRankingItem:", v75);
                          objc_msgSend(v75, "score");
                          objc_msgSend(v29, "setL2score:");
                          objc_msgSend(v11, "answerAttributes");
                          v83 = (void *)objc_claimAutoreleasedReturnValue();
                          v84 = (void *)objc_msgSend(v83, "copy");
                          objc_msgSend(v29, "setAnswerAttributes:", v84);

                          -[SPSearchTopHitResult populateAttributesForResult:withAttrs:](v120, "populateAttributesForResult:withAttrs:", v29, v14);
                          v29 = v29;

                          v25 = v29;
                          goto LABEL_86;
                        }
                      }
                      if ((objc_msgSend(v75, "didMatchRankingDescriptor:", *MEMORY[0x24BEB03B0]) & 1) != 0
                        || (objc_msgSend(v75, "didMatchRankingDescriptor:", *MEMORY[0x24BEB04E8]) & 1) != 0)
                      {
                        v82 = 0;
                      }
                      else
                      {
                        v82 = objc_msgSend(v75, "didMatchRankingDescriptor:", *MEMORY[0x24BEB0390]);
                      }
                      objc_msgSend(v29, "setIsStaticCorrection:", v82);
                      goto LABEL_85;
                    }
                  }
                  else
                  {

                  }
                  SPLogForSPLogCategoryDefault();
                  v32 = objc_claimAutoreleasedReturnValue();
                  v101 = *MEMORY[0x24BE84B00] ^ 1;
                  v34 = v122;
                  if (os_log_type_enabled(v32, v101))
                  {
                    objc_msgSend(v29, "identifier");
                    v102 = v10;
                    v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "bundleID");
                    v104 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v124 = v103;
                    v125 = 2112;
                    v126 = v104;
                    _os_log_impl(&dword_2279CC000, v32, v101, "No title for CoreSpotlight result, identifier:%@, bundleID:%@", buf, 0x16u);

                    v10 = v102;
                  }
                  goto LABEL_50;
                }

              }
            }
          }

          goto LABEL_58;
        }
LABEL_115:
        objc_msgSend(v29, "userActivityRequiredString");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = objc_msgSend(v105, "length");

        if (v106)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B18]);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = objc_msgSend(v107, "isEqualToString:", CFSTR("com.apple.DocumentManager"));

          if ((v108 & 1) != 0)
          {
            v25 = 0;
            v34 = v122;
            goto LABEL_88;
          }
        }
        v96 = v122;
        goto LABEL_119;
      }

    }
    goto LABEL_115;
  }
  v25 = 0;
LABEL_89:

  return (SPSearchTopHitResult *)v25;
}

- (id)makeApplicationResult:(id)a3 dataclass:(id)a4 score:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  uint8_t buf[4];
  NSObject *v70;
  _QWORD v71[2];

  v6 = v5;
  v7 = v4;
  v71[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v67 = a4;
  SPFastApplicationsGetNoBuild();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDC22E8];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC22E8]);
  v12 = objc_claimAutoreleasedReturnValue();
  v65 = v10;
  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v66 = (void *)v13;
  if (!v13)
  {
    if ((-[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("com.apple.TVRemoteUIService")) & 1) != 0
      || !v10
      && (SPCopyVisibleApps(),
          v42 = (void *)objc_claimAutoreleasedReturnValue(),
          v43 = objc_msgSend(v42, "containsObject:", v12),
          v42,
          v43))
    {
      v63 = v7;
      v64 = v6;
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC1AE8]);
      v17 = objc_claimAutoreleasedReturnValue();
      v30 = objc_alloc_init(MEMORY[0x24BE84958]);
      v31 = *MEMORY[0x24BE849A0];
      -[NSObject setIsAppClip:](v30, "setIsAppClip:", -[NSObject isEqualToString:](v17, "isEqualToString:", *MEMORY[0x24BE849A0]));
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC1EC0]);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setIsWebClip:](v30, "setIsWebClip:", objc_msgSend(v62, "BOOLValue"));
      v32 = -[NSObject isAppClip](v30, "isAppClip");
      v33 = *MEMORY[0x24BE849A8];
      if (v32)
        v34 = v31;
      else
        v34 = *MEMORY[0x24BE849A8];
      -[NSObject setSectionBundleIdentifier:](v30, "setSectionBundleIdentifier:", v34);
      if ((-[NSObject isAppClip](v30, "isAppClip") & 1) != 0)
      {
        v35 = objc_alloc(MEMORY[0x24BDD17C8]);
        v36 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("%@%@"), *MEMORY[0x24BE16E78], v12);
        -[NSObject setIdentifier:](v30, "setIdentifier:", v36);

      }
      else
      {
        -[NSObject setIdentifier:](v30, "setIdentifier:", v12);
      }
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BE8]);
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = objc_alloc_init(MEMORY[0x24BE85018]);
      v46 = v45;
      if (v44)
        objc_msgSend(v45, "setText:", v44);
      -[NSObject setTitle:](v30, "setTitle:", v46);
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC2238]);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", v47);
        v48 = v47;
        v49 = v46;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v50;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setDescriptions:](v30, "setDescriptions:", v51);

        v46 = v49;
        v47 = v48;
      }
      -[NSObject setSectionBundleIdentifier:](v30, "setSectionBundleIdentifier:", v17);
      v61 = (void *)v44;
      if (-[NSObject isAppClip](v30, "isAppClip"))
      {
        -[NSObject setBundleID:](v30, "setBundleID:", v33);
        -[NSObject setType:](v30, "setType:", 22);
        v52 = objc_alloc(MEMORY[0x24BE84D50]);
        -[NSObject identifier](v30, "identifier");
        v53 = v46;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setBundleIdentifier:", v54);

        -[NSObject setThumbnail:](v30, "setThumbnail:", v52);
        objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC2160]);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setApplicationBundleIdentifier:](v30, "setApplicationBundleIdentifier:", v55);

        v46 = v53;
      }
      else
      {
        v56 = -[NSObject isWebClip](v30, "isWebClip");
        v57 = v12;
        if (v56)
        {
          -[NSObject setType:](v30, "setType:", 24);
          v57 = v17;
        }
        -[NSObject setApplicationBundleIdentifier:](v30, "setApplicationBundleIdentifier:", v57);
        -[NSObject setExternalIdentifier:](v30, "setExternalIdentifier:", v12);
        -[NSObject applicationBundleIdentifier](v30, "applicationBundleIdentifier");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setBundleID:](v30, "setBundleID:", v58);

        -[NSObject setResultBundleId:](v30, "setResultBundleId:", v12);
      }
      v41 = 0;
      -[NSObject setScore:](v30, "setScore:", v63, v64);
      -[NSObject setProtectionClass:](v30, "setProtectionClass:", v67);
      -[NSObject setIsLocalApplicationResult:](v30, "setIsLocalApplicationResult:", 1);
      -[NSObject applicationBundleIdentifier](v30, "applicationBundleIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v59)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v30;
          _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "No applicationBundleIdentifier for %@", buf, 0xCu);
        }

        v30 = 0;
      }

    }
    else
    {
      SPLogForSPLogCategoryDefault();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SPSearchTopHitResult makeApplicationResult:dataclass:score:].cold.1((uint64_t)v12, v17);
      v30 = 0;
      v41 = 0;
    }
    goto LABEL_47;
  }
  v14 = (void *)v13;
  v15 = v9;
  v16 = v7;
  v17 = objc_alloc_init(MEMORY[0x24BE84958]);
  objc_msgSend(v14, "copyToSearchFoundationResult:", v17);
  -[NSObject compatibilityTitle](v17, "compatibilityTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BE8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject title](v17, "title");
    v20 = v6;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v19);

    v6 = v20;
    v14 = v66;

  }
  objc_msgSend(v14, "subtitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDC2238]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", v23);
      v24 = v6;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setDescriptions:](v17, "setDescriptions:", v26);

      v14 = v66;
      v6 = v24;
    }

  }
  if (objc_msgSend(v14, "isWebClip"))
    -[NSObject setType:](v17, "setType:", 24);
  v27 = v16;
  if (objc_msgSend(v14, "isAppClip"))
  {
    -[NSObject setSectionBundleIdentifier:](v17, "setSectionBundleIdentifier:", *MEMORY[0x24BEB0350]);
    -[NSObject setBundleID:](v17, "setBundleID:", *MEMORY[0x24BE849A8]);
    -[NSObject setType:](v17, "setType:", 22);
    v28 = objc_alloc(MEMORY[0x24BE84D50]);
    -[NSObject identifier](v17, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setBundleIdentifier:", v29);

    -[NSObject setThumbnail:](v17, "setThumbnail:", v28);
    v9 = v15;
  }
  else
  {
    -[NSObject setSectionBundleIdentifier:](v17, "setSectionBundleIdentifier:", *MEMORY[0x24BEB0358]);
    if (objc_msgSend(v14, "isWebClip"))
      v37 = *MEMORY[0x24BDC1AE8];
    else
      v37 = v11;
    v9 = v15;
    objc_msgSend(v15, "objectForKeyedSubscript:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setApplicationBundleIdentifier:](v17, "setApplicationBundleIdentifier:", v38);

    objc_msgSend(v15, "objectForKeyedSubscript:", v11);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setExternalIdentifier:](v17, "setExternalIdentifier:", v39);

    -[NSObject applicationBundleIdentifier](v17, "applicationBundleIdentifier");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    -[NSObject setBundleID:](v17, "setBundleID:", v28);
  }

  -[NSObject setScore:](v17, "setScore:", v27, v6);
  -[NSObject setProtectionClass:](v17, "setProtectionClass:", v67);
  -[NSObject setIsLocalApplicationResult:](v17, "setIsLocalApplicationResult:", 1);
  -[NSObject applicationBundleIdentifier](v17, "applicationBundleIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    v41 = v66;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v17;
      _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "No applicationBundleIdentifier for %@", buf, 0xCu);
    }
    v30 = 0;
LABEL_47:

    v17 = v30;
    goto LABEL_48;
  }
  v41 = v66;
LABEL_48:

  return v17;
}

- (id)authorStringFromAttrs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  v4 = 0;
  if (!objc_msgSend(0, "length"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDC1AD0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDC1AB8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }

  }
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDC1AA0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
    }

  }
  return v4;
}

- (id)makeMailResult:(SPSearchTopHitResult *)self dataclass:(SEL)a2 score:(id)a3 searchString:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = v5;
  v7 = v4;
  v10 = *MEMORY[0x24BDC22E8];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchTopHitResult authorStringFromAttrs:](self, "authorStringFromAttrs:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x24BE84958]);
  objc_msgSend(MEMORY[0x24BE85018], "textWithString:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:", v16);

  objc_msgSend(v15, "setCompatibilityTitle:", v14);
  objc_msgSend(v15, "setIdentifier:", v13);
  v17 = *MEMORY[0x24BDC1AE8];
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDC1AE8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSectionBundleIdentifier:", v18);

  objc_msgSend(v15, "sectionBundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setApplicationBundleIdentifier:", v19);

  objc_msgSend(v15, "applicationBundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSectionBundleIdentifier:", v20);

  objc_msgSend(v15, "sectionBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBundleID:", v21);

  objc_msgSend(v15, "setScore:", v7, v6);
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDC1DE8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setItemIdentifier:", v22);

  objc_msgSend(v15, "setUserActivityType:", *MEMORY[0x24BDC19C0]);
  objc_msgSend(v15, "setExternalIdentifier:", v13);
  objc_msgSend(v12, "objectForKeyedSubscript:", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBundleID:", v23);

  objc_msgSend(v15, "setProtectionClass:", v11);
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B58]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInterestingDate:", v24);

  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDC2328]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setMailConversationIdentifier:", v25);
  return v15;
}

- (id)titleStringFromAttrs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (titleStringFromAttrs__onceToken != -1)
    dispatch_once(&titleStringFromAttrs__onceToken, &__block_literal_global_10);
  v5 = 0;
  if (!objc_msgSend(0, "length"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BE8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC22D8]);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if (!objc_msgSend(v5, "length"))
  {
    -[SPSearchTopHitResult authorStringFromAttrs:](self, "authorStringFromAttrs:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC2230]);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", titleStringFromAttrs__sTrimSet);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __45__SPSearchTopHitResult_titleStringFromAttrs___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1690], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)titleStringFromAttrs__sTrimSet;
  titleStringFromAttrs__sTrimSet = v0;

  return objc_msgSend((id)titleStringFromAttrs__sTrimSet, "addCharactersInRange:", 65532, 0xFFFFLL);
}

- (BOOL)_contentType:(id)a3 orContentTypeTree:(id)a4 representsType:(id)a5
{
  id v7;
  id v8;
  char v9;

  v7 = a4;
  v8 = a5;
  if ((objc_msgSend(a3, "isEqualToString:", v8) & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(v7, "containsObject:", v8);

  return v9;
}

- (BOOL)audioOrVideoIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (void *)*MEMORY[0x24BDF82D8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SPSearchTopHitResult _contentType:orContentTypeTree:representsType:](self, "_contentType:orContentTypeTree:representsType:", v8, v7, v9);

  return (char)self;
}

- (BOOL)audioIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (void *)*MEMORY[0x24BDF82D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SPSearchTopHitResult _contentType:orContentTypeTree:representsType:](self, "_contentType:orContentTypeTree:representsType:", v8, v7, v9);

  return (char)self;
}

- (BOOL)playlistOrAlbumIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (void *)*MEMORY[0x24BDF8518];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SPSearchTopHitResult _contentType:orContentTypeTree:representsType:](self, "_contentType:orContentTypeTree:representsType:", v8, v7, v9);

  return (char)self;
}

- (BOOL)bookIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  return -[SPSearchTopHitResult _contentType:orContentTypeTree:representsType:](self, "_contentType:orContentTypeTree:representsType:", a3, a4, CFSTR("org.idpf.epub-container"));
}

- (BOOL)messageIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (void *)*MEMORY[0x24BDF84A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SPSearchTopHitResult _contentType:orContentTypeTree:representsType:](self, "_contentType:orContentTypeTree:representsType:", v8, v7, v9);

  return (char)self;
}

- (BOOL)contactIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (void *)*MEMORY[0x24BDF8340];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SPSearchTopHitResult _contentType:orContentTypeTree:representsType:](self, "_contentType:orContentTypeTree:representsType:", v8, v7, v9);

  return (char)self;
}

- (BOOL)documentIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (void *)*MEMORY[0x24BDF8348];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SPSearchTopHitResult _contentType:orContentTypeTree:representsType:](self, "_contentType:orContentTypeTree:representsType:", v8, v7, v9);

  return (char)self;
}

- (void)setupGenericItem:(id)a3 attrs:(id)a4 utiType:(id)a5 bundleID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B98]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC19E8]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1D70]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1D68]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC2170]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC2320]);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  v19 = *MEMORY[0x24BDC19D0];
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC19D0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v19);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

  if (v18)
  {
    objc_msgSend(v10, "setRelatedUniqueIdentifier:", v18);
  }
  else
  {
    objc_msgSend(v10, "relatedUniqueIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRelatedUniqueIdentifier:", v24);

  }
  if (v23)
  {
    objc_msgSend(v10, "setAccountIdentifier:", v23);
  }
  else
  {
    objc_msgSend(v10, "accountIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccountIdentifier:", v25);

  }
  objc_msgSend(v10, "setFileProviderIdentifier:", v43);
  objc_msgSend(v10, "setFileProviderDomainIdentifier:", v42);
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B18]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRelatedBundleID:", v26);

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC21B8]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDisplayOrder:", v27);

  if ((-[SPSearchTopHitResult audioOrVideoIsRepresentedByContentType:orContentTypeTree:](self, "audioOrVideoIsRepresentedByContentType:orContentTypeTree:", v12, v14)|| -[SPSearchTopHitResult audioIsRepresentedByContentType:orContentTypeTree:](self, "audioIsRepresentedByContentType:orContentTypeTree:", v12, v14)|| -[SPSearchTopHitResult playlistOrAlbumIsRepresentedByContentType:orContentTypeTree:](self, "playlistOrAlbumIsRepresentedByContentType:orContentTypeTree:", v12, v14)|| -[SPSearchTopHitResult bookIsRepresentedByContentType:orContentTypeTree:](self, "bookIsRepresentedByContentType:orContentTypeTree:", v12, v14))
    && (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.podcasts")) & 1) == 0)
  {
    objc_msgSend(v10, "setStoreIdentifier:", v41);
  }
  else
  {
    objc_msgSend(v10, "compatibilityTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {

    }
    else if (-[SPSearchTopHitResult messageIsRepresentedByContentType:orContentTypeTree:](self, "messageIsRepresentedByContentType:orContentTypeTree:", v12, v14)|| -[SPSearchTopHitResult contactIsRepresentedByContentType:orContentTypeTree:](self, "contactIsRepresentedByContentType:orContentTypeTree:", v12, v14))
    {
      -[SPSearchTopHitResult authorStringFromAttrs:](self, "authorStringFromAttrs:", v11);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCompatibilityTitle:", v29);

    }
  }
  SPLogForSPLogCategoryDefault();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v30, v31))
  {
    v39 = v14;
    v32 = v13;
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BE8]);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    v40 = v12;
    v38 = v18;
    if (v33)
    {
      v35 = 0;
      v36 = (void *)v33;
    }
    else
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC22D8]);
      v37 = objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        v35 = 0;
        v18 = (void *)v37;
        v36 = (void *)v37;
      }
      else
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC2230]);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        v35 = 1;
      }
    }
    *(_DWORD *)buf = 138412802;
    v45 = v32;
    v46 = 2112;
    v47 = v43;
    v48 = 2112;
    v49 = v36;
    _os_log_impl(&dword_2279CC000, v30, v31, "Bundle id: %@ FPId: %@ Title:%@", buf, 0x20u);
    if (v35)

    if (!v34)
    v13 = v32;
    v14 = v39;
    v12 = v40;
    v18 = v38;
  }

}

- (id)makeMessagesResult:(id)a3 dataclass:(id)a4 queryContext:(id)a5 score:
{
  uint64_t v5;
  uint64_t v6;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;

  v33 = v5;
  v34 = v6;
  v10 = a3;
  v11 = *MEMORY[0x24BDC22E8];
  v32 = a5;
  v35 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC2060]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC1AE8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC2360]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B90]);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B98]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchTopHitResult titleStringFromAttrs:](self, "titleStringFromAttrs:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v14;
  v36 = v15;
  v37 = v13;
  v38 = (void *)v12;
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("lnk")))
  {

    v31 = (id)*MEMORY[0x24BEB06C0];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC22E0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    getURLString(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = &unk_24F0251A0;
  }
  else
  {
    if (!isMessagesAttachmentCoreSpotlightId())
    {
      v22 = 0;
      v31 = v19;
      v24 = (void *)v16;
      goto LABEL_10;
    }
    if (objc_msgSend(v13, "unsignedIntValue"))
      v23 = (id *)MEMORY[0x24BEB06C8];
    else
      v23 = (id *)MEMORY[0x24BEB06F8];
    v31 = *v23;
    v22 = 0;
    v21 = v19;
  }
  v24 = (void *)v16;

LABEL_10:
  v25 = objc_alloc_init(MEMORY[0x24BE84958]);
  -[SPSearchTopHitResult setupGenericItem:attrs:utiType:bundleID:](self, "setupGenericItem:attrs:utiType:bundleID:", v25, v10, v24, v19);
  objc_msgSend(v25, "bundleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchTopHitResult populateCoreSpotlightResult:attrs:bundleID:queryContext:](self, "populateCoreSpotlightResult:attrs:bundleID:queryContext:", v25, v10, v26, v32);

  objc_msgSend(MEMORY[0x24BE85018], "textWithString:", v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTitle:", v27);

  objc_msgSend(v25, "setCompatibilityTitle:", v18);
  objc_msgSend(v25, "setBundleID:", v19);
  objc_msgSend(v25, "setApplicationBundleIdentifier:", v19);
  objc_msgSend(v25, "setSectionBundleIdentifier:", v31);
  objc_msgSend(v25, "setExternalIdentifier:", v38);
  objc_msgSend(v25, "setIdentifier:", v38);
  objc_msgSend(v25, "setScore:", v33, v34);
  objc_msgSend(v25, "setUserActivityType:", *MEMORY[0x24BDC19C0]);
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B58]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setInterestingDate:", v28);

  objc_msgSend(v25, "setProtectionClass:", v35);
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BF8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDomainIdentifier:", v29);

  objc_msgSend(v25, "setContentType:", v24);
  objc_msgSend(v25, "setContentTypeTree:", v17);
  if (v22)
    objc_msgSend(v25, "setUrl:", v22);

  return v25;
}

- (void)makeDateBasedResult:(id)a3 result:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B28]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B58]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDC1C00]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B78]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDC2220]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B08]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCalendarIdentifier:", v12);
  v13 = v11;
  if (v11 || (v13 = v7) != 0 || (v13 = v9) != 0 || (v13 = v10) != 0 || (v13 = v8) != 0)
    -[SPTopHitResult setInterestingDate:](self, "setInterestingDate:", v13);
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BF8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDomainIdentifier:", v14);

  if (v7)
    objc_msgSend(v6, "setCompleted:", 1);

}

- (void)updateDataOwnerTypeForResult:(id)a3 accountID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  v5 = a3;
  v6 = a4;
  if (v6 && !objc_msgSend(v5, "dataOwnerType"))
  {
    if (updateDataOwnerTypeForResult_accountID__onceToken != -1)
      dispatch_once(&updateDataOwnerTypeForResult_accountID__onceToken, &__block_literal_global_168);
    objc_msgSend((id)updateDataOwnerTypeForResult_accountID__sAccountsDictionary, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_20;
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v8, "accountWithIdentifier:error:", v6, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;

    if (v9)
    {
      v11 = (void *)MEMORY[0x24BDD16E0];
      v12 = objc_msgSend(v9, "MCIsManaged");
      v13 = v11;
    }
    else
    {
      if (!v10 || objc_msgSend(v10, "code") == 10002)
      {
LABEL_13:

        goto LABEL_14;
      }
      v13 = (void *)MEMORY[0x24BDD16E0];
      v12 = 1;
    }
    objc_msgSend(v13, "numberWithBool:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)updateDataOwnerTypeForResult_accountID__sAccountsDictionary, "setObject:forKey:", v7, v6);

    if (v7)
    {
LABEL_20:
      if (objc_msgSend(v7, "BOOLValue"))
        v14 = 2;
      else
        v14 = 1;
      objc_msgSend(v5, "setDataOwnerType:", v14);
      v10 = v7;
      goto LABEL_13;
    }
  }
LABEL_14:

}

void __63__SPSearchTopHitResult_updateDataOwnerTypeForResult_accountID___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)updateDataOwnerTypeForResult_accountID__sAccountsDictionary;
  updateDataOwnerTypeForResult_accountID__sAccountsDictionary = (uint64_t)v0;

}

- (id)matchContentForPerson:(id)a3 queryContext:(id)a4 spotlightQueryTerms:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t n;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t ii;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t jj;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  id obj;
  id v98;
  void *v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[4];
  id v126;
  uint64_t *v127;
  uint64_t *v128;
  uint64_t v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[4];
  id v135;
  uint64_t *v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  BOOL v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v86 = a4;
  v100 = a5;
  v94 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BE8]);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B40]);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDC1A28]);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDC1C10]);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDC1A20]);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDC2048]);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDC1A30]);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v92, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v92);
  if (objc_msgSend(v87, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v87);
  if (objc_msgSend(v91, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v91);
  if (objc_msgSend(v90, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v90);
  if (objc_msgSend(v89, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v89);
  if (objc_msgSend(v88, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v88);
  objc_msgSend(v86, "normalizedSearchString");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "componentsSeparatedByString:", CFSTR(" "));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v96, "count");
  if (v93)
  {
    objc_msgSend(v93, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SSNormalizedQueryString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v99)
      v11 = objc_msgSend(v10, "localizedStandardRangeOfString:");
    else
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    v13 = v93;
    v143 = 0;
    v144 = &v143;
    v145 = 0x2020000000;
    v146 = v11 == 0;
    if (v11)
    {
      v139 = 0;
      v140 = &v139;
      v141 = 0x2020000000;
      v142 = 0;
      v14 = objc_msgSend(v10, "length");
      v134[0] = MEMORY[0x24BDAC760];
      v134[1] = 3221225472;
      v134[2] = __79__SPSearchTopHitResult_matchContentForPerson_queryContext_spotlightQueryTerms___block_invoke;
      v134[3] = &unk_24F01C020;
      v135 = v96;
      v136 = &v139;
      v138 = v95;
      v137 = &v143;
      objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v14, 3, v134);

      _Block_object_dispose(&v139, 8);
      v15 = *((unsigned __int8 *)v144 + 24);
      v13 = v93;
    }
    else
    {
      v15 = 1;
    }
    v12 = v15 != 0;
    if (v15)
    {
      v98 = v13;
    }
    else
    {
      if (v100)
      {
        v16 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "stringByTrimmingCharactersInSet:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("name=%@"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addObject:", v19);

      }
      v98 = 0;
    }
    _Block_object_dispose(&v143, 8);

  }
  else
  {
    v12 = 0;
    v98 = 0;
  }
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  obj = v8;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v153, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v131;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v131 != v21)
          objc_enumerationMutation(obj);
        if (v12)
        {
          v12 = 1;
        }
        else
        {
          v23 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
          objc_msgSend(v23, "lowercaseString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          SSNormalizedQueryString();
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v99)
            v26 = objc_msgSend(v25, "localizedStandardRangeOfString:", v99);
          else
            v26 = 0x7FFFFFFFFFFFFFFFLL;
          v143 = 0;
          v144 = &v143;
          v145 = 0x2020000000;
          v146 = v26 == 0;
          if (v26)
          {
            v139 = 0;
            v140 = &v139;
            v141 = 0x2020000000;
            v142 = 0;
            v27 = objc_msgSend(v25, "length");
            v125[0] = MEMORY[0x24BDAC760];
            v125[1] = 3221225472;
            v125[2] = __79__SPSearchTopHitResult_matchContentForPerson_queryContext_spotlightQueryTerms___block_invoke_2;
            v125[3] = &unk_24F01C020;
            v126 = v96;
            v127 = &v139;
            v129 = v95;
            v128 = &v143;
            objc_msgSend(v25, "enumerateSubstringsInRange:options:usingBlock:", 0, v27, 3, v125);

            _Block_object_dispose(&v139, 8);
            v28 = *((unsigned __int8 *)v144 + 24);
          }
          else
          {
            v28 = 1;
          }
          v12 = v28 != 0;
          if (v28)
          {
            v29 = v23;

            v98 = v29;
          }
          _Block_object_dispose(&v143, 8);

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v153, 16);
    }
    while (v20);
  }

  if (v100)
  {
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v30 = v92;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v121, v152, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v122;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v122 != v32)
            objc_enumerationMutation(v30);
          v34 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
          v35 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringByTrimmingCharactersInSet:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", CFSTR("name=%@"), v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "addObject:", v38);

        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v121, v152, 16);
      }
      while (v31);
    }

    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v39 = v91;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v117, v151, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v118;
      do
      {
        for (k = 0; k != v40; ++k)
        {
          if (*(_QWORD *)v118 != v41)
            objc_enumerationMutation(v39);
          v43 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * k);
          v44 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringByTrimmingCharactersInSet:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringWithFormat:", CFSTR("email=%@"), v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "addObject:", v47);

        }
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v117, v151, 16);
      }
      while (v40);
    }

    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v48 = v90;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v113, v150, 16);
    if (v49)
    {
      v50 = *(_QWORD *)v114;
      do
      {
        for (m = 0; m != v49; ++m)
        {
          if (*(_QWORD *)v114 != v50)
            objc_enumerationMutation(v48);
          v52 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * m);
          v53 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "stringByTrimmingCharactersInSet:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "stringWithFormat:", CFSTR("sharedEmail=%@"), v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "addObject:", v56);

        }
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v113, v150, 16);
      }
      while (v49);
    }

    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v57 = v89;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v109, v149, 16);
    if (v58)
    {
      v59 = *(_QWORD *)v110;
      do
      {
        for (n = 0; n != v58; ++n)
        {
          if (*(_QWORD *)v110 != v59)
            objc_enumerationMutation(v57);
          v61 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * n);
          v62 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "stringByTrimmingCharactersInSet:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "stringWithFormat:", CFSTR("phone=%@"), v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "addObject:", v65);

        }
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v109, v149, 16);
      }
      while (v58);
    }

    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v66 = v88;
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v105, v148, 16);
    if (v67)
    {
      v68 = *(_QWORD *)v106;
      do
      {
        for (ii = 0; ii != v67; ++ii)
        {
          if (*(_QWORD *)v106 != v68)
            objc_enumerationMutation(v66);
          v70 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * ii);
          v71 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "stringByTrimmingCharactersInSet:", v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "stringWithFormat:", CFSTR("sharedPhone=%@"), v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "addObject:", v74);

        }
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v105, v148, 16);
      }
      while (v67);
    }

    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v75 = v87;
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v101, v147, 16);
    if (v76)
    {
      v77 = *(_QWORD *)v102;
      do
      {
        for (jj = 0; jj != v76; ++jj)
        {
          if (*(_QWORD *)v102 != v77)
            objc_enumerationMutation(v75);
          v79 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * jj);
          v80 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "stringByTrimmingCharactersInSet:", v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "stringWithFormat:", CFSTR("rawName=%@"), v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "addObject:", v83);

        }
        v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v101, v147, 16);
      }
      while (v76);
    }

  }
  v84 = v98;

  return v84;
}

void __79__SPSearchTopHitResult_matchContentForPerson_queryContext_spotlightQueryTerms___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = *(id *)(a1 + 32);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (((objc_msgSend(v9, "hasPrefix:", v15, (_QWORD)v16) & 1) != 0
           || objc_msgSend(v9, "isEqualToString:", v15))
          && *(_QWORD *)(a1 + 56) == ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          *a7 = 1;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_13:

}

void __79__SPSearchTopHitResult_matchContentForPerson_queryContext_spotlightQueryTerms___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = *(id *)(a1 + 32);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (((objc_msgSend(v9, "hasPrefix:", v15, (_QWORD)v16) & 1) != 0
           || objc_msgSend(v9, "isEqualToString:", v15))
          && *(_QWORD *)(a1 + 56) == ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          *a7 = 1;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)makeContactResult:(id)a3 identifier:(id)a4 queryContext:(id)a5 result:(id)a6
{
  id v10;
  id v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  v10 = a4;
  v11 = a6;
  -[SPSearchTopHitResult matchContentForPerson:queryContext:spotlightQueryTerms:](self, "matchContentForPerson:queryContext:spotlightQueryTerms:", v25, a5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContactIdentifier:", v10);
  if (v12)
  {
    objc_msgSend(v11, "setCompletion:", v12);
    objc_msgSend(v11, "setIdentifier:", v10);
    objc_msgSend(v11, "setType:", 36);
    if (makeContactResult_identifier_queryContext_result__onceToken != -1)
      dispatch_once(&makeContactResult_identifier_queryContext_result__onceToken, &__block_literal_global_189);
    v13 = 1;
  }
  else
  {
    objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BE8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCompletion:", v14);

    objc_msgSend(v11, "setIdentifier:", v10);
    objc_msgSend(v11, "setType:", 36);
    if (makeContactResult_identifier_queryContext_result__onceToken != -1)
      dispatch_once(&makeContactResult_identifier_queryContext_result__onceToken, &__block_literal_global_189);
    v15 = -[SPTopHitResult score](self, "score");
    v13 = (makeContactResult_identifier_queryContext_result__mask & v15 | *(_QWORD *)algn_253E93728 & v16) != 0;
  }
  objc_msgSend(v11, "setHasTextContentMatch:", v13);
  objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x24BDC1E28]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    v18 = 0;
    while (1)
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "longLongValue");

      if (v20 >= 1)
        break;
      if (++v18 >= (unint64_t)objc_msgSend(v17, "count"))
        goto LABEL_14;
    }
    objc_msgSend(v11, "setHasCommunicationContent:", 1);
  }
LABEL_14:
  if ((objc_msgSend(v11, "hasCommunicationContent") & 1) == 0)
  {
    objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x24BDC1FC0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      v22 = 0;
      while (1)
      {
        objc_msgSend(v21, "objectAtIndexedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "longLongValue");

        if (v24 >= 1)
          break;
        if (++v22 >= (unint64_t)objc_msgSend(v21, "count"))
          goto LABEL_21;
      }
      objc_msgSend(v11, "setHasCommunicationContent:", 1);
    }
LABEL_21:

  }
}

void __73__SPSearchTopHitResult_makeContactResult_identifier_queryContext_result___block_invoke()
{
  void *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  PRSRankingQueryIndexDictionary();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEB03A0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "integerValue");
  v2 = 1 << v1;
  if ((v1 & 0x40) != 0)
    v3 = 0;
  else
    v3 = 1 << v1;
  if ((v1 & 0x40) == 0)
    v2 = 0;
  makeContactResult_identifier_queryContext_result__mask |= v3;
  *(_QWORD *)algn_253E93728 |= v2;

}

- (id)makePhotosResult:(id)a3 dataclass:(id)a4 queryContext:(id)a5 score:
{
  uint64_t v5;
  uint64_t v6;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  _QWORD v33[2];

  v29 = v5;
  v30 = v6;
  v33[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = *MEMORY[0x24BDC22E8];
  v12 = a5;
  v31 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC1AE8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B90]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B98]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchTopHitResult titleStringFromAttrs:](self, "titleStringFromAttrs:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC2060]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v32, "unsignedIntValue");
  v18 = (id *)MEMORY[0x24BEB06F8];
  if (v17)
    v18 = (id *)MEMORY[0x24BEB06C8];
  v19 = *v18;
  v20 = objc_alloc_init(MEMORY[0x24BE84958]);
  -[SPSearchTopHitResult setupGenericItem:attrs:utiType:bundleID:](self, "setupGenericItem:attrs:utiType:bundleID:", v20, v10, v14, v13);
  objc_msgSend(v20, "bundleID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchTopHitResult populateCoreSpotlightResult:attrs:bundleID:queryContext:](self, "populateCoreSpotlightResult:attrs:bundleID:queryContext:", v20, v10, v21, v12);

  objc_msgSend(MEMORY[0x24BE85018], "textWithString:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:", v22);

  objc_msgSend(v20, "setCompatibilityTitle:", v16);
  objc_msgSend(v20, "setBundleID:", v13);
  objc_msgSend(v20, "setApplicationBundleIdentifier:", v13);
  objc_msgSend(v20, "setSectionBundleIdentifier:", v19);
  objc_msgSend(v20, "setExternalIdentifier:", v28);
  objc_msgSend(v20, "setIdentifier:", v28);
  objc_msgSend(v20, "setScore:", v29, v30);
  objc_msgSend(v20, "setUserActivityType:", *MEMORY[0x24BDC19C0]);
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B58]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setInterestingDate:", v23);

  objc_msgSend(v20, "setProtectionClass:", v31);
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BF8]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDomainIdentifier:", v24);

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B50]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContainerIdentifier:", v25);

  objc_msgSend(v20, "setContentType:", v14);
  if (v15 && objc_msgSend(v15, "count"))
  {
    objc_msgSend(v20, "setContentTypeTree:", v15);
  }
  else
  {
    v33[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setContentTypeTree:", v26);

  }
  return v20;
}

- (id)makePersonResult:(id)a3 dataclass:(id)a4 queryContext:(id)a5 score:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  const __CFString *v46;
  uint64_t v47;
  uint64_t v48;

  v7 = v6;
  v8 = v5;
  v48 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v45 = a5;
  v42 = v13;
  v38 = v7;
  if (makePersonResult_dataclass_queryContext_score__onceToken != -1)
    dispatch_once(&makePersonResult_dataclass_queryContext_score__onceToken, &__block_literal_global_190);
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDC22E8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B38]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDC1AE8]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *MEMORY[0x24BDC1BF8];
  objc_msgSend(v12, "objectForKeyedSubscript:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDC2020]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B90]);
  v46 = CFSTR("public.contact");
  v47 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v47;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  -[SPSearchTopHitResult matchContentForPerson:queryContext:spotlightQueryTerms:](self, "matchContentForPerson:queryContext:spotlightQueryTerms:", v12, v45, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("contactIdentifier=%@"), v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v18);

  }
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("personIdentifier=%@"), v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v19);

  }
  if (v17)
  {
    v20 = 1;
  }
  else
  {
    v21 = -[SPTopHitResult score](self, "score");
    v20 = (makePersonResult_dataclass_queryContext_score__mask & v21 | *(_QWORD *)algn_255916C78 & v22) != 0;
  }
  v23 = objc_alloc_init(MEMORY[0x24BE84958]);
  -[SPSearchTopHitResult setupGenericItem:attrs:utiType:bundleID:](self, "setupGenericItem:attrs:utiType:bundleID:", v23, v12, CFSTR("com.apple.spotlight.contact"), v44);
  objc_msgSend(v23, "bundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchTopHitResult populateCoreSpotlightResult:attrs:bundleID:queryContext:](self, "populateCoreSpotlightResult:attrs:bundleID:queryContext:", v23, v12, v24, v45);

  objc_msgSend(v23, "setPersonIdentifier:", v14);
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\t"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPersonQueryIdentifier:", v25);

  objc_msgSend(v23, "setContactIdentifier:", v15);
  objc_msgSend(v23, "setCompletion:", v17);
  v26 = (void *)MEMORY[0x24BE85018];
  objc_msgSend(v23, "completion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "textWithString:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTitle:", v28);

  objc_msgSend(v23, "completion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCompatibilityTitle:", v29);

  objc_msgSend(v23, "setBundleID:", v43);
  v30 = (_QWORD *)MEMORY[0x24BEB0698];
  if (!v20)
    v30 = (_QWORD *)MEMORY[0x24BEB05E8];
  objc_msgSend(v23, "setSectionBundleIdentifier:", *v30);
  objc_msgSend(v23, "setExternalIdentifier:", v14);
  objc_msgSend(v23, "setIdentifier:", v14);
  objc_msgSend(v23, "setScore:", v8, v38);
  objc_msgSend(v23, "setType:", 37);
  if (v41)
    objc_msgSend(v41, "doubleValue");
  else
    v31 = 0.0;
  objc_msgSend(v23, "setRankingScore:", v31);
  objc_msgSend(v23, "setUserActivityType:", *MEMORY[0x24BDC19C0]);
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B58]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setInterestingDate:", v32);

  objc_msgSend(v23, "setProtectionClass:", v42);
  objc_msgSend(v12, "objectForKeyedSubscript:", v37);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDomainIdentifier:", v33);

  objc_msgSend(v23, "domainIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setApplicationBundleIdentifier:", v34);

  objc_msgSend(v23, "setContentType:", v40);
  objc_msgSend(v23, "setContentTypeTree:", v39);
  objc_msgSend(v23, "setHasTextContentMatch:", v20);
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDC2028]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPersonType:", v35);

  return v23;
}

void __70__SPSearchTopHitResult_makePersonResult_dataclass_queryContext_score___block_invoke()
{
  void *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  PRSRankingQueryIndexDictionary();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BEB03A0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "integerValue");
  v2 = 1 << v1;
  if ((v1 & 0x40) != 0)
    v3 = 0;
  else
    v3 = 1 << v1;
  if ((v1 & 0x40) == 0)
    v2 = 0;
  makePersonResult_dataclass_queryContext_score__mask |= v3;
  *(_QWORD *)algn_255916C78 |= v2;

  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BEB0348]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  v6 = 1 << v5;
  if ((v5 & 0x40) != 0)
    v7 = 0;
  else
    v7 = 1 << v5;
  if ((v5 & 0x40) == 0)
    v6 = 0;
  makePersonResult_dataclass_queryContext_score__mask |= v7;
  *(_QWORD *)algn_255916C78 |= v6;

  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BEB0340]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  v10 = 1 << v9;
  if ((v9 & 0x40) != 0)
    v11 = 0;
  else
    v11 = 1 << v9;
  if ((v9 & 0x40) == 0)
    v10 = 0;
  makePersonResult_dataclass_queryContext_score__mask |= v11;
  *(_QWORD *)algn_255916C78 |= v10;

  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BEB0338]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");
  v14 = 1 << v13;
  if ((v13 & 0x40) != 0)
    v15 = 0;
  else
    v15 = 1 << v13;
  if ((v13 & 0x40) == 0)
    v14 = 0;
  makePersonResult_dataclass_queryContext_score__mask |= v15;
  *(_QWORD *)algn_255916C78 |= v14;

}

- (BOOL)doesQueryMatchContentForLowEngagementBundle:(id)a3 queryContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDC22D8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "normalizedSearchString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  v38 = v7;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = v8;
    if ((unint64_t)objc_msgSend(v8, "length") >= 4)
    {
      objc_msgSend(v7, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      SSNormalizedQueryString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = v11;
      objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v13;
      objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(" "));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v15 = v14;
      v42 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v42)
      {
        v16 = 0;
        v17 = 0;
        v39 = 0;
        v40 = *(_QWORD *)v53;
        v41 = v15;
        v36 = v6;
        v37 = v5;
        while (2)
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v53 != v40)
              objc_enumerationMutation(v15);
            v46 = v16;
            v47 = v17;
            v45 = v18;
            v19 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v18);
            v44 = objc_msgSend(v19, "length");
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v20 = v43;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            if (v21)
            {
              v22 = v21;
              v23 = 0;
              v24 = *(_QWORD *)v49;
              v25 = 0x7FFFFFFFLL;
              while (2)
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v49 != v24)
                    objc_enumerationMutation(v20);
                  v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                  if (objc_msgSend(v27, "localizedStandardRangeOfString:", v19) != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v29 = v28;
                    v30 = objc_msgSend(v27, "length");
                    v31 = objc_msgSend(v27, "length");
                    v32 = v31;
                    if (v29 == v30)
                    {

                      v25 = v32;
                      v15 = v41;
                      goto LABEL_36;
                    }
                    if (v31 < v25)
                      v25 = objc_msgSend(v27, "length");
                    v23 = 1;
                  }
                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
                if (v22)
                  continue;
                break;
              }
            }
            else
            {
              v23 = 0;
              v25 = 0x7FFFFFFFLL;
            }

            v15 = v41;
            if ((v23 & 1) == 0
              || v39 > 0
              || (unint64_t)objc_msgSend(v19, "length") <= 3 && 3 * v25 > 4 * objc_msgSend(v19, "length"))
            {

              v10 = 0;
              v6 = v36;
              v5 = v37;
              goto LABEL_43;
            }
            v39 = 1;
LABEL_36:
            v17 = v44 + v47;
            v16 = v25 + v46;
            v18 = v45 + 1;
          }
          while (v45 + 1 != v42);
          v6 = v36;
          v5 = v37;
          v42 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
          if (v42)
            continue;
          break;
        }

        if (v17 > 3)
        {
          v10 = 1;
          goto LABEL_43;
        }
      }
      else
      {

        v17 = 0;
        v16 = 0;
      }
      v10 = 3 * v16 <= 4 * v17;
LABEL_43:

      v8 = v35;
    }
    else
    {
      v10 = 0;
      v8 = v11;
    }
  }

  return v10;
}

- (void)populateCoreSpotlightResult:(id)a3 attrs:(id)a4 bundleID:(id)a5 queryContext:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  NSObject *v35;
  os_log_type_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  os_log_type_t v42;
  const char *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  os_log_type_t v48;
  NSObject *v49;
  os_log_t log;
  os_log_t loga;
  void *v52;
  SPSearchTopHitResult *v53;
  id v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  uint8_t buf[4];
  NSObject *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v54 = a6;
  if (populateCoreSpotlightResult_attrs_bundleID_queryContext__onceToken != -1)
    dispatch_once(&populateCoreSpotlightResult_attrs_bundleID_queryContext__onceToken, &__block_literal_global_201);
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B90]);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC2318]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC22E8]);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1DE8]);
  v56 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BA0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  getURLString(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)v15;
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC2310]);
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC2060]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = self;
  -[SPSearchTopHitResult titleStringFromAttrs:](self, "titleStringFromAttrs:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByTrimmingCharactersInSet:", populateCoreSpotlightResult_attrs_bundleID_queryContext__sTrimSet);
  v21 = objc_claimAutoreleasedReturnValue();

  v55 = v21;
  objc_msgSend(v10, "setCompatibilityTitle:", v21);
  objc_msgSend(v10, "setIdentifier:", v18);
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1AE8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResultBundleId:", v22);

  objc_msgSend(v10, "setContentURL:", v17);
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1D60]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFileIdentifier:", v23);

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1FF0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setParentFileIdentifier:", v24);

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1D80]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilename:", v25);

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1BF0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDocumentIdentifier:", v26);

  objc_msgSend(v10, "setUserActivityType:", v14);
  v57 = (void *)v19;
  objc_msgSend(v10, "setUserActivityRequiredString:", v19);
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC2160]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRelatedBundleID:", v27);

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC1DC8]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHasAppTopHitShortcut:", BOOLValueForAttr(v28));

  v29 = -[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("com.apple.shortcuts"));
  v30 = -[NSObject hasPrefix:](v13, "hasPrefix:", *MEMORY[0x24BDD9968]);
  if (!v14 && (v29 & 1) == 0 && !v30)
  {
    v31 = v54;
    v32 = (void *)v56;
    if ((-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("com.apple.mobilenotes.spotlightrecord")) & 1) != 0
      || (-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("com.apple.notes.spotlightrecord")) & 1) != 0
      || -[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("com.apple.mobilenotes")))
    {
      -[SPSearchTopHitResult setupGenericItem:attrs:utiType:bundleID:](v53, "setupGenericItem:attrs:utiType:bundleID:", v10, v11, v13, v12);
      v33 = v52;
      if (objc_msgSend(v52, "unsignedIntValue"))
      {
        v34 = (_QWORD *)MEMORY[0x24BEB06C8];
      }
      else
      {
        if (!isImageOrVideoContentType())
        {
LABEL_22:
          objc_msgSend(v10, "setUserActivityType:", *MEMORY[0x24BDC19C0]);
          goto LABEL_23;
        }
        v34 = (_QWORD *)MEMORY[0x24BEB06F8];
      }
      objc_msgSend(v10, "setSectionBundleIdentifier:", *v34);
      goto LABEL_22;
    }
    if ((-[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("com.apple.reminders")) & 1) != 0
      || -[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("com.apple.mobilecal")))
    {
      if (-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("public.to-do-item")))
        -[SPSearchTopHitResult makeDateBasedResult:result:](v53, "makeDateBasedResult:result:", v11, v10);
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC19D0]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPSearchTopHitResult updateDataOwnerTypeForResult:accountID:](v53, "updateDataOwnerTypeForResult:accountID:", v10, v40);

      goto LABEL_29;
    }
    if (-[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("com.apple.VoiceMemos")))
    {
      SPLogForSPLogCategoryQuery();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = 2 * (*MEMORY[0x24BE84AF8] == 0);
      log = v41;
      if (!os_log_type_enabled(v41, v42))
      {
LABEL_34:

        -[SPSearchTopHitResult setupGenericItem:attrs:utiType:bundleID:](v53, "setupGenericItem:attrs:utiType:bundleID:", v10, v11, v13, v12);
LABEL_29:
        v33 = v52;
        v32 = (void *)v56;
        goto LABEL_23;
      }
      *(_DWORD *)buf = 138412290;
      v59 = v55;
      v43 = "Adding voice memo: %@";
LABEL_33:
      _os_log_impl(&dword_2279CC000, log, v42, v43, buf, 0xCu);
      goto LABEL_34;
    }
    if (-[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
    {
      loga = v13;
      v44 = v12;
      v45 = v17;
      v46 = (void *)v56;
      -[SPSearchTopHitResult makeContactResult:identifier:queryContext:result:](v53, "makeContactResult:identifier:queryContext:result:", v11, v18, v54, v10);
      SPLogForSPLogCategoryQuery();
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = 2 * (*MEMORY[0x24BE84AF8] == 0);
      if (os_log_type_enabled(v47, v48))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v55;
LABEL_41:
        _os_log_impl(&dword_2279CC000, v47, v48, "Adding contact: %@", buf, 0xCu);
      }
    }
    else
    {
      if (!-[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("com.apple.CoreSuggestions")))
      {
        objc_msgSend(v10, "setUserActivityType:", *MEMORY[0x24BDC19C0]);
        SPLogForSPLogCategoryQuery();
        v49 = objc_claimAutoreleasedReturnValue();
        v42 = 2 * (*MEMORY[0x24BE84AF8] == 0);
        log = v49;
        if (!os_log_type_enabled(v49, v42))
          goto LABEL_34;
        *(_DWORD *)buf = 138412290;
        v59 = v13;
        v43 = "Adding app search UTI: %@";
        goto LABEL_33;
      }
      loga = v13;
      v44 = v12;
      v45 = v17;
      v46 = (void *)v56;
      -[SPSearchTopHitResult makeContactResult:identifier:queryContext:result:](v53, "makeContactResult:identifier:queryContext:result:", v11, v18, v54, v10);
      SPLogForSPLogCategoryQuery();
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = 2 * (*MEMORY[0x24BE84AF8] == 0);
      if (os_log_type_enabled(v47, v48))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v55;
        goto LABEL_41;
      }
    }

    v32 = v46;
    v17 = v45;
    v14 = 0;
    v12 = v44;
    v13 = loga;
    v33 = v52;
    goto LABEL_23;
  }
  v32 = (void *)v56;
  SPLogForSPLogCategoryQuery();
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v35, v36))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v12;
    _os_log_impl(&dword_2279CC000, v35, v36, "Found #apphistory item for %@", buf, 0xCu);
  }

  if (v56)
    v37 = (void *)v56;
  else
    v37 = v57;
  objc_msgSend(v10, "setUserActivityRequiredString:", v37);
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDC2308]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
    objc_msgSend(v10, "setPubliclyIndexable:", objc_msgSend(v38, "BOOLValue"));
  -[SPSearchTopHitResult setupGenericItem:attrs:utiType:bundleID:](v53, "setupGenericItem:attrs:utiType:bundleID:", v10, v11, v13, v12);

  v31 = v54;
  v33 = v52;
LABEL_23:

}

uint64_t __80__SPSearchTopHitResult_populateCoreSpotlightResult_attrs_bundleID_queryContext___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1690], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)populateCoreSpotlightResult_attrs_bundleID_queryContext__sTrimSet;
  populateCoreSpotlightResult_attrs_bundleID_queryContext__sTrimSet = v0;

  return objc_msgSend((id)populateCoreSpotlightResult_attrs_bundleID_queryContext__sTrimSet, "addCharactersInRange:", 65532, 0xFFFFLL);
}

- (void)populateAttributesForResult:(id)a3 withAttrs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unsigned int v149;
  uint64_t v150;
  unsigned int v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  unsigned int v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unsigned int v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  unsigned int v220;
  unsigned int v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  unsigned int v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  _QWORD v402[3];

  v402[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v224 = *MEMORY[0x24BDC1E70];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v221 = BOOLValueForAttr(v7);

  v223 = *MEMORY[0x24BDC1AE0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v220 = BOOLValueForAttr(v8);

  v222 = *MEMORY[0x24BDC1D78];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v11, "numberWithDouble:", v12 * 1000000.0);
    v399 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v399 = 0;
  }
  v210 = *MEMORY[0x24BDC19E0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v398 = (void *)objc_claimAutoreleasedReturnValue();
  v207 = *MEMORY[0x24BDC19F8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = *MEMORY[0x24BDC1A28];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = *MEMORY[0x24BDC1A60];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  v215 = *MEMORY[0x24BDC1A68];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  v219 = *MEMORY[0x24BDC1A80];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  v216 = *MEMORY[0x24BDC1A88];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = *MEMORY[0x24BDC1A90];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  v218 = *MEMORY[0x24BDC1AB0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = *MEMORY[0x24BDC1AA0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  v213 = *MEMORY[0x24BDC1AA8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  v211 = *MEMORY[0x24BDC1AB8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  v208 = *MEMORY[0x24BDC1AD0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  v237 = *MEMORY[0x24BDC2048];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  v238 = *MEMORY[0x24BDC2270];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v229 = BOOLValueForAttr(v13);

  v236 = *MEMORY[0x24BDC2090];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  v235 = *MEMORY[0x24BDC2098];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  v233 = *MEMORY[0x24BDC20A0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  v240 = *MEMORY[0x24BDC20A8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  v239 = *MEMORY[0x24BDC20D0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  v230 = *MEMORY[0x24BDC20C8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  v226 = *MEMORY[0x24BDC20C0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  v225 = *MEMORY[0x24BDC20B8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = *MEMORY[0x24BDC1C10];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  v228 = *MEMORY[0x24BDC20E8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  v234 = *MEMORY[0x24BDC2158];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  v232 = *MEMORY[0x24BDC2148];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  v231 = *MEMORY[0x24BDC2168];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDC23B0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") != 2)
    goto LABEL_11;
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_11;
  }
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("kMDItemTextContent"));

  v18 = 0;
  if ((v17 & 1) == 0)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      v21 = objc_opt_isKindOfClass();

      if ((v21 & 1) != 0)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v402[0] = v22;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v402, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
LABEL_11:
      v18 = 0;
    }
  }
LABEL_12:
  v371 = v18;

  v113 = *MEMORY[0x24BDC2190];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  v205 = *MEMORY[0x24BDC21B8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = *MEMORY[0x24BDC21B0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = *MEMORY[0x24BDC2300];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = *MEMORY[0x24BDC21C8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  v202 = *MEMORY[0x24BDC21A0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = *MEMORY[0x24BDC21C0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = *MEMORY[0x24BDC2198];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  v199 = *MEMORY[0x24BDC21D0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = *MEMORY[0x24BDC21E0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = *MEMORY[0x24BDC21D8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = *MEMORY[0x24BDC21A8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = *MEMORY[0x24BDC1B28];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = *MEMORY[0x24BDC1B58];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = *MEMORY[0x24BDC1C00];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = *MEMORY[0x24BDC1C20];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = *MEMORY[0x24BDC1D40];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDC1EE8]);
  v23 = objc_claimAutoreleasedReturnValue();
  v193 = *MEMORY[0x24BDC1B78];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDC21F8]);
  v24 = objc_claimAutoreleasedReturnValue();
  v195 = *MEMORY[0x24BDC2220];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = *MEMORY[0x24BDC1A58];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = *MEMORY[0x24BDC1A50];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = *MEMORY[0x24BDC1AD8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = *MEMORY[0x24BDC1C08];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = *MEMORY[0x24BDC1EF0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = *MEMORY[0x24BDC1F00];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = *MEMORY[0x24BDC2268];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = BOOLValueForAttr(v25);

  v194 = *MEMORY[0x24BDC2218];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = *MEMORY[0x24BDC1A18];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = *MEMORY[0x24BDC1A70];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = *MEMORY[0x24BDC1B00];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = *MEMORY[0x24BDC1B38];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = *MEMORY[0x24BDC1B48];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = *MEMORY[0x24BDC1BA0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  getURLString(v26);
  v339 = (void *)objc_claimAutoreleasedReturnValue();

  v131 = *MEMORY[0x24BDC1BE0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = *MEMORY[0x24BDC1BE8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = *MEMORY[0x24BDC1DE8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = *MEMORY[0x24BDC1ED8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = *MEMORY[0x24BDC2360];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = *MEMORY[0x24BDC1F70];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = *MEMORY[0x24BDC2018];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = *MEMORY[0x24BDC2120];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = *MEMORY[0x24BDC2138];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = *MEMORY[0x24BDC2160];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B88]);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = *MEMORY[0x24BDC21F0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = *MEMORY[0x24BDC2230];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = *MEMORY[0x24BDC22B0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = *MEMORY[0x24BDC22B8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = *MEMORY[0x24BDC22C0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = *MEMORY[0x24BDC22C8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = *MEMORY[0x24BDC22D0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = *MEMORY[0x24BDC1BD0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = *MEMORY[0x24BDC22D8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = *MEMORY[0x24BDC22E8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = *MEMORY[0x24BDC22E0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  getURLString(v27);
  v318 = (void *)objc_claimAutoreleasedReturnValue();

  v172 = *MEMORY[0x24BDC2310];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = *MEMORY[0x24BDC2318];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = *MEMORY[0x24BDC1B90];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x24BDC1FA8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDC1FA8]);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = *MEMORY[0x24BDC1DC0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = *MEMORY[0x24BDC1EE0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = *MEMORY[0x24BDC1DA0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDC2358]);
  v312 = (void *)objc_claimAutoreleasedReturnValue();

  v163 = *MEMORY[0x24BDC2280];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = *MEMORY[0x24BDC2278];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = *MEMORY[0x24BDC1AF8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = *MEMORY[0x24BDC2070];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = *MEMORY[0x24BDC2080];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = *MEMORY[0x24BDC1BF8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = *MEMORY[0x24BDC1B80];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = BOOLValueForAttr(v31);

  v150 = *MEMORY[0x24BDC1B20];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = *MEMORY[0x24BDC1DD0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = *MEMORY[0x24BDC2178];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = *MEMORY[0x24BDC2180];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = *MEMORY[0x24BDC1F90];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = BOOLValueForAttr(v32);

  v152 = *MEMORY[0x24BDC1F88];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = BOOLValueForAttr(v33);

  v138 = *MEMORY[0x24BDC1F80];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = *MEMORY[0x24BDC1F78];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = *MEMORY[0x24BDC2038];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v34 = objc_claimAutoreleasedReturnValue();
  v144 = *MEMORY[0x24BDC2030];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = *MEMORY[0x24BDC2040];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v242 = (void *)v23;
  v241 = (void *)v24;
  v299 = (void *)v34;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v5, "resultBundleId");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = (void *)v36;
      objc_msgSend(v5, "resultBundleId");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isEqualToString:", *MEMORY[0x24BEB0598]);

      if (v39)
      {
        objc_msgSend(v5, "personalAnswerString");
        v40 = objc_claimAutoreleasedReturnValue();

        v400 = (void *)v40;
      }
    }
  }
  v127 = *MEMORY[0x24BDC1A10];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = *MEMORY[0x24BDC1B10];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = *MEMORY[0x24BDC1BA8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = *MEMORY[0x24BDC1BC0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = *MEMORY[0x24BDC1D88];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = *MEMORY[0x24BDC1DB0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = *MEMORY[0x24BDC1E60];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = *MEMORY[0x24BDC2088];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = *MEMORY[0x24BDC2100];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = *MEMORY[0x24BDC2140];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = *MEMORY[0x24BDC2150];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = *MEMORY[0x24BDC2228];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = *MEMORY[0x24BDC2290];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = *MEMORY[0x24BDC1F68];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = *MEMORY[0x24BDC1E68];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = *MEMORY[0x24BDC2000];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = *MEMORY[0x24BDC2008];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = *MEMORY[0x24BDC2348];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = *MEMORY[0x24BDC1D38];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = *MEMORY[0x24BDC2380];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = *MEMORY[0x24BDC1C98];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = *MEMORY[0x24BDC1CA0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = *MEMORY[0x24BDC1C68];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = *MEMORY[0x24BDC1C50];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = *MEMORY[0x24BDC1C58];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = *MEMORY[0x24BDC1C60];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = *MEMORY[0x24BDC1C48];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = *MEMORY[0x24BDC1C90];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = *MEMORY[0x24BDC1C30];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = *MEMORY[0x24BDC1C38];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = *MEMORY[0x24BDC1C78];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = *MEMORY[0x24BDC1C80];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = *MEMORY[0x24BDC1C70];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = *MEMORY[0x24BDC1CA8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = *MEMORY[0x24BDC1CB0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = *MEMORY[0x24BDC1C40];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = *MEMORY[0x24BDC1C88];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = *MEMORY[0x24BDC1CD8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = *MEMORY[0x24BDC1CE8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = *MEMORY[0x24BDC1CE0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = *MEMORY[0x24BDC1CB8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = *MEMORY[0x24BDC1CC8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = *MEMORY[0x24BDC1CC0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = *MEMORY[0x24BDC1CD0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = *MEMORY[0x24BDC1D18];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = *MEMORY[0x24BDC1D28];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = *MEMORY[0x24BDC1D20];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = *MEMORY[0x24BDC1CF8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = *MEMORY[0x24BDC1D08];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = *MEMORY[0x24BDC1D10];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = *MEMORY[0x24BDC1D00];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = *MEMORY[0x24BDC1A38];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = *MEMORY[0x24BDC1A40];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = *MEMORY[0x24BDC21E8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = *MEMORY[0x24BDC2050];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = *MEMORY[0x24BDC20D8];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = *MEMORY[0x24BDC2068];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v42 = objc_claimAutoreleasedReturnValue();
  v65 = *MEMORY[0x24BDC1CF0];
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentType");
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v44;
  if (v44)
    v46 = (void *)v44;
  else
    v46 = v28;
  v401 = v5;
  v47 = v46;

  v48 = (void *)objc_opt_new();
  objc_msgSend(v48, "beginDictionary");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v221);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeObject:withKey:", v49, v224);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v220);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeObject:withKey:", v50, v223);

  objc_msgSend(v48, "encodeObject:withKey:", v399, v222);
  objc_msgSend(v48, "encodeObject:withKey:", v315, v29);
  objc_msgSend(v48, "encodeObject:withKey:", v398, v210);
  objc_msgSend(v48, "encodeObject:withKey:", v397, v207);
  objc_msgSend(v48, "encodeObject:withKey:", v344, v109);
  objc_msgSend(v48, "encodeObject:withKey:", v396, v212);
  objc_msgSend(v48, "encodeObject:withKey:", v350, v134);
  objc_msgSend(v48, "encodeObject:withKey:", v351, v142);
  objc_msgSend(v48, "encodeObject:withKey:", v395, v217);
  objc_msgSend(v48, "encodeObject:withKey:", v394, v215);
  objc_msgSend(v48, "encodeObject:withKey:", v343, v120);
  objc_msgSend(v48, "encodeObject:withKey:", v393, v219);
  objc_msgSend(v48, "encodeObject:withKey:", v392, v216);
  objc_msgSend(v48, "encodeObject:withKey:", v391, v214);
  objc_msgSend(v48, "encodeObject:withKey:", v389, v209);
  objc_msgSend(v48, "encodeObject:withKey:", v390, v218);
  objc_msgSend(v48, "encodeObject:withKey:", v388, v213);
  objc_msgSend(v48, "encodeObject:withKey:", v387, v211);
  objc_msgSend(v48, "encodeObject:withKey:", v386, v208);
  objc_msgSend(v48, "encodeObject:withKey:", v349, v155);
  objc_msgSend(v48, "encodeObject:withKey:", v342, v132);
  objc_msgSend(v48, "encodeObject:withKey:", v358, v190);
  objc_msgSend(v48, "encodeObject:withKey:", v339, v128);
  objc_msgSend(v48, "encodeObject:withKey:", v355, v189);
  objc_msgSend(v48, "encodeObject:withKey:", v354, v188);
  objc_msgSend(v48, "encodeObject:withKey:", v341, v137);
  objc_msgSend(v48, "encodeObject:withKey:", v340, v135);
  objc_msgSend(v48, "encodeObject:withKey:", v357, v191);
  objc_msgSend(v48, "encodeObject:withKey:", v338, v131);
  objc_msgSend(v48, "encodeObject:withKey:", v400, v129);
  objc_msgSend(v48, "encodeObject:withKey:", v356, v192);
  objc_msgSend(v48, "encodeObject:withKey:", v348, v173);
  objc_msgSend(v48, "encodeObject:withKey:", v337, v133);
  objc_msgSend(v48, "encodeObject:withKey:", v336, v130);
  objc_msgSend(v48, "encodeObject:withKey:", v347, v176);
  objc_msgSend(v48, "encodeObject:withKey:", v346, v174);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v169);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeObject:withKey:", v51, v175);

  objc_msgSend(v48, "encodeObject:withKey:", v353, v193);
  objc_msgSend(v48, "encodeObject:withKey:", v335, v141);
  objc_msgSend(v48, "encodeObject:withKey:", v334, v140);
  objc_msgSend(v48, "encodeObject:withKey:", v333, v139);
  objc_msgSend(v48, "encodeObject:withKey:", v385, v237);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v229);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeObject:withKey:", v52, v238);

  objc_msgSend(v48, "encodeObject:withKey:", v384, v236);
  objc_msgSend(v48, "encodeObject:withKey:", v383, v235);
  objc_msgSend(v48, "encodeObject:withKey:", v382, v233);
  objc_msgSend(v48, "encodeObject:withKey:", v377, v225);
  objc_msgSend(v48, "encodeObject:withKey:", v378, v226);
  objc_msgSend(v48, "encodeObject:withKey:", v379, v230);
  objc_msgSend(v48, "encodeObject:withKey:", v381, v240);
  objc_msgSend(v48, "encodeObject:withKey:", v380, v239);
  objc_msgSend(v48, "encodeObject:withKey:", v376, v227);
  objc_msgSend(v48, "encodeObject:withKey:", v332, v160);
  objc_msgSend(v48, "encodeObject:withKey:", v375, v228);
  objc_msgSend(v48, "encodeObject:withKey:", v331, v161);
  objc_msgSend(v48, "encodeObject:withKey:", v345, v194);
  objc_msgSend(v48, "encodeObject:withKey:", v374, v234);
  objc_msgSend(v48, "encodeObject:withKey:", v373, v232);
  objc_msgSend(v48, "encodeObject:withKey:", v372, v231);
  objc_msgSend(v48, "encodeObject:withKey:", v330, v165);
  objc_msgSend(v48, "encodeObject:withKey:", v368, v204);
  objc_msgSend(v48, "encodeObject:withKey:", v370, v113);
  objc_msgSend(v48, "encodeObject:withKey:", v369, v205);
  objc_msgSend(v48, "encodeObject:withKey:", v366, v203);
  objc_msgSend(v48, "encodeObject:withKey:", v365, v202);
  objc_msgSend(v48, "encodeObject:withKey:", v364, v201);
  objc_msgSend(v48, "encodeObject:withKey:", v363, v200);
  objc_msgSend(v48, "encodeObject:withKey:", v362, v199);
  objc_msgSend(v48, "encodeObject:withKey:", v361, v198);
  objc_msgSend(v48, "encodeObject:withKey:", v360, v197);
  objc_msgSend(v48, "encodeObject:withKey:", v359, v196);
  objc_msgSend(v48, "encodeObject:withKey:", v328, v184);
  objc_msgSend(v48, "encodeObject:withKey:", v329, *MEMORY[0x24BDC2210]);
  objc_msgSend(v48, "encodeObject:withKey:", v352, v195);
  objc_msgSend(v48, "encodeObject:withKey:", v327, v187);
  objc_msgSend(v48, "encodeObject:withKey:", v326, v186);
  objc_msgSend(v48, "encodeObject:withKey:", v325, v185);
  objc_msgSend(v48, "encodeObject:withKey:", v324, v183);
  objc_msgSend(v48, "encodeObject:withKey:", v323, v182);
  objc_msgSend(v48, "encodeObject:withKey:", v322, v179);
  objc_msgSend(v48, "encodeObject:withKey:", v367, v206);
  objc_msgSend(v48, "encodeObject:withKey:", v321, v181);
  objc_msgSend(v48, "encodeObject:withKey:", v320, v178);
  objc_msgSend(v48, "encodeObject:withKey:", v371, CFSTR("SSAttributeTopMatchedStrings"));
  objc_msgSend(v48, "encodeObject:withKey:", v319, v180);
  objc_msgSend(v48, "encodeObject:withKey:", v318, v177);
  objc_msgSend(v48, "encodeObject:withKey:", v317, v172);
  objc_msgSend(v48, "encodeObject:withKey:", v316, v171);
  objc_msgSend(v48, "encodeObject:withKey:", v47, v170);

  objc_msgSend(v48, "encodeObject:withKey:", v314, v168);
  objc_msgSend(v48, "encodeObject:withKey:", v313, v167);
  objc_msgSend(v48, "encodeObject:withKey:", v312, v166);
  objc_msgSend(v48, "encodeObject:withKey:", v311, v163);
  objc_msgSend(v48, "encodeObject:withKey:", v310, v162);
  objc_msgSend(v48, "encodeObject:withKey:", v309, v159);
  objc_msgSend(v48, "encodeObject:withKey:", v308, v158);
  objc_msgSend(v48, "encodeObject:withKey:", v307, v156);
  objc_msgSend(v48, "encodeObject:withKey:", v306, v154);
  objc_msgSend(v48, "encodeObject:withKey:", v305, v150);
  objc_msgSend(v48, "encodeObject:withKey:", v304, v148);
  objc_msgSend(v48, "encodeObject:withKey:", v303, v147);
  objc_msgSend(v48, "encodeObject:withKey:", v302, v145);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v157);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeObject:withKey:", v53, v164);

  objc_msgSend(v48, "encodeObject:withKey:", v301, v138);
  objc_msgSend(v48, "encodeObject:withKey:", v300, v136);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v151);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeObject:withKey:", v54, v153);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v149);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeObject:withKey:", v55, v152);

  objc_msgSend(v48, "encodeObject:withKey:", v299, v146);
  objc_msgSend(v48, "encodeObject:withKey:", v35, v144);
  objc_msgSend(v48, "encodeObject:withKey:", v298, v143);
  objc_msgSend(v48, "encodeObject:withKey:", v297, v127);
  objc_msgSend(v48, "encodeObject:withKey:", v296, v126);
  objc_msgSend(v48, "encodeObject:withKey:", v295, v125);
  objc_msgSend(v48, "encodeObject:withKey:", v294, v124);
  objc_msgSend(v48, "encodeObject:withKey:", v293, v123);
  objc_msgSend(v48, "encodeObject:withKey:", v292, v122);
  objc_msgSend(v48, "encodeObject:withKey:", v291, v121);
  objc_msgSend(v48, "encodeObject:withKey:", v290, v119);
  objc_msgSend(v48, "encodeObject:withKey:", v289, v118);
  objc_msgSend(v48, "encodeObject:withKey:", v288, v117);
  objc_msgSend(v48, "encodeObject:withKey:", v287, v116);
  objc_msgSend(v48, "encodeObject:withKey:", v286, v115);
  objc_msgSend(v48, "encodeObject:withKey:", v285, v114);
  objc_msgSend(v48, "encodeObject:withKey:", v284, v112);
  objc_msgSend(v48, "encodeObject:withKey:", v283, v111);
  objc_msgSend(v48, "encodeObject:withKey:", v282, v110);
  objc_msgSend(v48, "encodeObject:withKey:", v281, v108);
  objc_msgSend(v48, "encodeObject:withKey:", v280, v107);
  objc_msgSend(v48, "encodeObject:withKey:", v279, v106);
  objc_msgSend(v48, "encodeObject:withKey:", v278, v105);
  objc_msgSend(v48, "encodeObject:withKey:", v277, v104);
  objc_msgSend(v48, "encodeObject:withKey:", v276, v103);
  objc_msgSend(v48, "encodeObject:withKey:", v275, v102);
  objc_msgSend(v48, "encodeObject:withKey:", v274, v101);
  objc_msgSend(v48, "encodeObject:withKey:", v273, v100);
  objc_msgSend(v48, "encodeObject:withKey:", v272, v99);
  objc_msgSend(v48, "encodeObject:withKey:", v271, v98);
  objc_msgSend(v48, "encodeObject:withKey:", v270, v97);
  objc_msgSend(v48, "encodeObject:withKey:", v269, v96);
  objc_msgSend(v48, "encodeObject:withKey:", v268, v95);
  objc_msgSend(v48, "encodeObject:withKey:", v267, v94);
  objc_msgSend(v48, "encodeObject:withKey:", v266, v93);
  objc_msgSend(v48, "encodeObject:withKey:", v265, v92);
  objc_msgSend(v48, "encodeObject:withKey:", v264, v91);
  objc_msgSend(v48, "encodeObject:withKey:", v263, v90);
  objc_msgSend(v48, "encodeObject:withKey:", v262, v89);
  objc_msgSend(v48, "encodeObject:withKey:", v261, v88);
  objc_msgSend(v48, "encodeObject:withKey:", v260, v87);
  objc_msgSend(v48, "encodeObject:withKey:", v259, v86);
  objc_msgSend(v48, "encodeObject:withKey:", v258, v85);
  objc_msgSend(v48, "encodeObject:withKey:", v257, v84);
  objc_msgSend(v48, "encodeObject:withKey:", v256, v83);
  objc_msgSend(v48, "encodeObject:withKey:", v255, v82);
  objc_msgSend(v48, "encodeObject:withKey:", v254, v81);
  objc_msgSend(v48, "encodeObject:withKey:", v253, v80);
  objc_msgSend(v48, "encodeObject:withKey:", v252, v79);
  objc_msgSend(v48, "encodeObject:withKey:", v251, v78);
  objc_msgSend(v48, "encodeObject:withKey:", v250, v77);
  objc_msgSend(v48, "encodeObject:withKey:", v249, v76);
  objc_msgSend(v48, "encodeObject:withKey:", v248, v75);
  objc_msgSend(v48, "encodeObject:withKey:", v247, v74);
  objc_msgSend(v48, "encodeObject:withKey:", v246, v73);
  objc_msgSend(v48, "encodeObject:withKey:", v245, v72);
  objc_msgSend(v48, "encodeObject:withKey:", v244, v71);
  objc_msgSend(v48, "encodeObject:withKey:", v243, v70);
  objc_msgSend(v48, "encodeObject:withKey:");
  objc_msgSend(v48, "encodeObject:withKey:");
  objc_msgSend(v48, "encodeObject:withKey:", v41, v69);
  v56 = (void *)v42;
  objc_msgSend(v48, "encodeObject:withKey:", v42, v67);
  v57 = (void *)v43;
  objc_msgSend(v48, "encodeObject:withKey:", v43, v65);
  objc_msgSend(v48, "endDictionary");
  objc_msgSend(v48, "data");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(v58, "copy");
  objc_msgSend(v401, "setAttributeData:", v59);

  objc_msgSend(v401, "lastUsedDate");
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)v60;
  if (v241)
    v62 = (uint64_t)v241;
  else
    v62 = (uint64_t)v242;
  if (v60)
    v63 = v60;
  else
    v63 = v62;
  objc_msgSend(v401, "setLastUsedDate:", v63);

  if (v241 && v242)
  {
    objc_msgSend(v241, "laterDate:", v242);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v401, "setLastUsedDate:", v64);

  }
}

- (CSSearchableItemAttributeSet)attributeSet
{
  return self->_attributeSet;
}

- (void)setAttributeSet:(id)a3
{
  objc_storeStrong((id *)&self->_attributeSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeSet, 0);
}

- (void)makeApplicationResult:(uint64_t)a1 dataclass:(NSObject *)a2 score:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2279CC000, a2, OS_LOG_TYPE_ERROR, "Not processing app %@", (uint8_t *)&v2, 0xCu);
}

@end
