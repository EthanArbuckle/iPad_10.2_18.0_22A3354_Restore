@implementation PPNamedEntityDissector

- (id)entitiesInPlainText:(id)a3 eligibleRegions:(id)a4 source:(id)a5 cloudSync:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "language");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v14, v15, 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPNamedEntityDissector entitiesInPlainText:eligibleRegions:source:cloudSync:algorithms:](self, "entitiesInPlainText:eligibleRegions:source:cloudSync:algorithms:", v12, v11, v10, v6, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)entitiesInPlainText:(id)a3 eligibleRegions:(id)a4 source:(id)a5 cloudSync:(BOOL)a6 algorithms:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  double v19;
  void *v20;
  float v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  BOOL v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t i;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[5];
  id v101;
  id v102;
  id v103;
  id v104;
  _QWORD v105[4];
  id v106;
  id v107;
  uint64_t *v108;
  double v109;
  BOOL v110;
  char v111;
  _QWORD v112[4];
  id v113;
  id v114;
  uint64_t *v115;
  double v116;
  BOOL v117;
  char v118;
  _QWORD aBlock[4];
  id v120;
  id v121;
  id v122;
  id v123;
  PPNamedEntityDissector *v124;
  uint64_t *v125;
  double v126;
  BOOL v127;
  char v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  _BYTE v135[128];
  uint8_t v136[128];
  uint8_t buf[4];
  uint64_t v138;
  __int16 v139;
  void *v140;
  _BYTE v141[128];
  _QWORD v142[3];
  _QWORD v143[6];

  v143[3] = *MEMORY[0x1E0C80C00];
  v82 = a3;
  v79 = a4;
  v12 = a5;
  v13 = a7;
  objc_msgSend(v12, "bundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)*MEMORY[0x1E0D70E28];
  v16 = objc_msgSend((id)*MEMORY[0x1E0D70E28], "isEqualToString:", v14);

  objc_msgSend(v12, "bundleId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", v17))
  {

  }
  else
  {
    v18 = objc_msgSend((id)*MEMORY[0x1E0D70E18], "isEqualToString:", v17);

    v19 = 0.0;
    if (!v18)
      goto LABEL_5;
  }
  +[PPSentiment sharedInstance](PPSentiment, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sentimentScoreForText:", v82);
  v19 = v21;

LABEL_5:
  v22 = (void *)MEMORY[0x1C3BD6630]();
  v142[0] = &unk_1E7E59078;
  v142[1] = &unk_1E7E59060;
  v143[0] = &unk_1E7E59090;
  v143[1] = &unk_1E7E590A8;
  v142[2] = &unk_1E7E590C0;
  v143[2] = &unk_1E7E590D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v143, v142, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v22);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "language");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v25, v26, 0, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v129 = 0;
  v130 = &v129;
  v131 = 0x3032000000;
  v132 = __Block_byref_object_copy_;
  v133 = __Block_byref_object_dispose_;
  v28 = MEMORY[0x1E0C809B0];
  v134 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke;
  aBlock[3] = &unk_1E7E14A08;
  v125 = &v129;
  v29 = v12;
  v120 = v29;
  v127 = a6;
  v128 = v16;
  v126 = v19;
  v81 = v13;
  v121 = v81;
  v75 = v23;
  v122 = v75;
  v30 = v27;
  v123 = v30;
  v124 = self;
  v80 = _Block_copy(aBlock);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bundleId");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "language");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v32, v33, 0, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v112[0] = v28;
  v112[1] = 3221225472;
  v112[2] = __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke_2;
  v112[3] = &unk_1E7E14A30;
  v115 = &v129;
  v74 = v34;
  v113 = v74;
  v35 = v29;
  v114 = v35;
  v117 = a6;
  v118 = v16;
  v116 = v19;
  v77 = _Block_copy(v112);
  v105[0] = v28;
  v105[1] = 3221225472;
  v105[2] = __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke_3;
  v105[3] = &unk_1E7E14A58;
  v108 = &v129;
  v73 = v30;
  v106 = v73;
  v76 = v35;
  v107 = v76;
  v110 = a6;
  v111 = v16;
  v109 = v19;
  v78 = _Block_copy(v105);
  v36 = objc_msgSend(v81, "containsObject:", &unk_1E7E59060);
  objc_msgSend(v76, "bundleId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x1E0D70E68]);

  if (!(_DWORD)v35)
  {
    if (!v36)
      goto LABEL_10;
    goto LABEL_9;
  }
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance", v73, v74, v75);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "safariDataDetectorsEnabledForHighMemoryDevices");

  if ((v36 & v39 & 1) != 0)
LABEL_9:
    v40 = -[PPNamedEntityDissector _collectDataDetectorsWithText:algorithms:isMessagesSource:addNamedEntity:](self, "_collectDataDetectorsWithText:algorithms:isMessagesSource:addNamedEntity:", v82, v81, v16, v80, v73);
LABEL_10:
  if (v79)
  {
    v100[0] = v28;
    v100[1] = 3221225472;
    v100[2] = __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke_4;
    v100[3] = &unk_1E7E14A80;
    v100[4] = self;
    v101 = v82;
    v102 = v80;
    v103 = v77;
    v104 = v78;
    objc_msgSend(v79, "enumerateRangesUsingBlock:", v100);

  }
  else
  {
    -[PPNamedEntityDissector _collectAugmentedGazetteerWithText:addNamedEntity:addTopic:addLocation:](self, "_collectAugmentedGazetteerWithText:addNamedEntity:addTopic:addLocation:", v82, v80, v77, v78);
  }
  v83 = (id)objc_opt_new();
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v85 = objc_msgSend(&unk_1E7E5B278, "countByEnumeratingWithState:objects:count:", &v96, v141, 16);
  if (v85)
  {
    v84 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v85; ++i)
      {
        if (*(_QWORD *)v97 != v84)
          objc_enumerationMutation(&unk_1E7E5B278);
        objc_msgSend((id)v130[5], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i), v73);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v87;
        if (v87)
        {
          objc_msgSend(v83, "addObject:");
          pp_default_log_handle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v87, "entities");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "count");
            objc_msgSend(MEMORY[0x1E0D70BD8], "describeAlgorithm:", objc_msgSend(v87, "entityAlgorithm"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v138 = v44;
            v139 = 2112;
            v140 = v45;
            _os_log_impl(&dword_1C392E000, v42, OS_LOG_TYPE_DEFAULT, "PPNamedEntityDissector: entitiesInPlainText detected %lu entities with algorithm \"%@\".", buf, 0x16u);

          }
          v94 = 0u;
          v95 = 0u;
          v92 = 0u;
          v93 = 0u;
          objc_msgSend(v87, "entities");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v92, v136, 16);
          if (v47)
          {
            v48 = *(_QWORD *)v93;
            do
            {
              for (j = 0; j != v47; ++j)
              {
                if (*(_QWORD *)v93 != v48)
                  objc_enumerationMutation(v46);
                v50 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * j);
                pp_private_log_handle();
                v51 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                {
                  v53 = (void *)MEMORY[0x1E0D70BC0];
                  objc_msgSend(v50, "item");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "describeCategory:", objc_msgSend(v54, "category"));
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v138 = (uint64_t)v55;
                  _os_log_debug_impl(&dword_1C392E000, v51, OS_LOG_TYPE_DEBUG, "   category: %@", buf, 0xCu);

                }
                pp_private_log_handle();
                v52 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v50, "item");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "name");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v138 = (uint64_t)v57;
                  _os_log_debug_impl(&dword_1C392E000, v52, OS_LOG_TYPE_DEBUG, "       name: %@", buf, 0xCu);

                }
              }
              v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v92, v136, 16);
            }
            while (v47);
          }

          objc_msgSend(v87, "topics");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "count") == 0;

          if (!v59)
          {
            pp_default_log_handle();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v87, "topics");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = objc_msgSend(v61, "count");
              objc_msgSend(MEMORY[0x1E0D70CD0], "describeAlgorithm:", objc_msgSend(v87, "topicAlgorithm"));
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v138 = v62;
              v139 = 2112;
              v140 = v63;
              _os_log_impl(&dword_1C392E000, v60, OS_LOG_TYPE_DEFAULT, "PPNamedEntityDissector: entitiesInPlainText detected %lu topics with algorithm \"%@\".", buf, 0x16u);

            }
          }
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          objc_msgSend(v87, "topics");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v88, v135, 16);
          if (v65)
          {
            v66 = *(_QWORD *)v89;
            do
            {
              for (k = 0; k != v65; ++k)
              {
                if (*(_QWORD *)v89 != v66)
                  objc_enumerationMutation(v64);
                v68 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * k);
                pp_private_log_handle();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v68, "item");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "topicIdentifier");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v138 = (uint64_t)v71;
                  _os_log_debug_impl(&dword_1C392E000, v69, OS_LOG_TYPE_DEBUG, "  %@", buf, 0xCu);

                }
              }
              v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v88, v135, 16);
            }
            while (v65);
          }

          v41 = v87;
        }

      }
      v85 = objc_msgSend(&unk_1E7E5B278, "countByEnumeratingWithState:objects:count:", &v96, v141, 16);
    }
    while (v85);
  }

  _Block_object_dispose(&v129, 8);
  return v83;
}

- (id)_collectDataDetectorsWithText:(id)a3 algorithms:(id)a4 isMessagesSource:(BOOL)a5 addNamedEntity:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void (**v18)(void *, void *, uint64_t);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id obj;
  void *v48;
  void *v49;
  void *v50;
  _QWORD aBlock[4];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v46 = a4;
  v42 = a6;
  v9 = (void *)MEMORY[0x1E0D19E68];
  v10 = (void *)objc_opt_new();
  v43 = v8;
  objc_msgSend(v9, "detectionsInPlainText:baseDate:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (id)objc_opt_new();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v54;
    v41 = *(_QWORD *)v54;
    do
    {
      v15 = 0;
      v44 = v13;
      do
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1C3BD6630]();
        if (objc_msgSend(v16, "matchType") == 1
          && objc_msgSend(v46, "containsObject:", &unk_1E7E59060))
        {
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __99__PPNamedEntityDissector__collectDataDetectorsWithText_algorithms_isMessagesSource_addNamedEntity___block_invoke;
          aBlock[3] = &unk_1E7E149E0;
          v52 = v42;
          v18 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
          v19 = (void *)MEMORY[0x1C3BD6630]();
          v20 = objc_msgSend(v16, "range");
          objc_msgSend(v43, "substringWithRange:", v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v19);
          SGPostalAddressParse();
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Street"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("City"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("State"));
          v26 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ZIP"));
          v27 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Country"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v18[2](v18, v24, 8);
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = (id)((uint64_t (*)(void *, void *, uint64_t))v18[2])(v18, v25, 9);
          v31 = (id)((uint64_t (*)(void *, uint64_t, uint64_t))v18[2])(v18, v26, 10);
          v32 = (id)((uint64_t (*)(void *, void *, uint64_t))v18[2])(v18, v28, 11);
          v49 = (void *)v27;
          v50 = (void *)v26;
          +[PPNamedEntitySupport fullAddressForStreetAddress:city:state:postalCode:country:](PPNamedEntitySupport, "fullAddressForStreetAddress:city:state:postalCode:country:", v24, v25, v26, v27, v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (id)((uint64_t (*)(void *, void *, uint64_t))v18[2])(v18, v33, 12);
          v48 = (void *)v29;
          if (v29)
          {
            objc_msgSend(MEMORY[0x1E0D70B98], "placemarkWithLocation:name:thoroughfare:subthoroughFare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:countryCode:country:inlandWater:ocean:areasOfInterest:", 0, 0, v24, 0, v25, 0, v50, 0, v27, 0, v28, 0, 0, 0, v40);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B78]), "initWithPlacemark:category:mostRelevantRecord:", v45, 0, 0);
            v36 = v25;
            v37 = v24;
            v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C48]), "initWithLocation:score:sentimentScore:", v35, 1.0, 0.0);
            objc_msgSend(v48, "addLocation:algorithm:", v38, 4);

            v24 = v37;
            v25 = v36;

          }
          v13 = v44;
          v14 = v41;
        }
        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v13);
  }

  return v40;
}

- (PPNamedEntityDissector)initWithPurgeableGazetteer:(id)a3
{
  id v4;
  PPNamedEntityDissector *v5;
  PPNamedEntityDissector *v6;
  void *v7;
  uint64_t v8;
  _PASLock *lock;
  void *v10;
  uint64_t v11;
  NSString *userLanguage;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *meCardContactsIdentifier;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PPNamedEntityDissector;
  v5 = -[PPNamedEntityDissector init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PPNamedEntityDissector _registerForNotifications](v5, "_registerForNotifications");
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setPurgeableGazetteer:", v4);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v7);
    lock = v6->_lock;
    v6->_lock = (_PASLock *)v8;

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "languageCode");
    v11 = objc_claimAutoreleasedReturnValue();
    userLanguage = v6->_userLanguage;
    v6->_userLanguage = (NSString *)v11;

    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_userIsMultilingual = objc_msgSend(v13, "isMultilingual");

    +[PPLocalContactStore defaultStore](PPLocalContactStore, "defaultStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "meCard");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = objc_claimAutoreleasedReturnValue();
    meCardContactsIdentifier = v6->_meCardContactsIdentifier;
    v6->_meCardContactsIdentifier = (NSString *)v16;

  }
  return v6;
}

- (PPNamedEntityDissector)init
{
  void *v3;
  PPNamedEntityDissector *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:idleTimeout:", &__block_literal_global_146, 240.0);
  v4 = -[PPNamedEntityDissector initWithPurgeableGazetteer:](self, "initWithPurgeableGazetteer:", v3);

  return v4;
}

- (void)dealloc
{
  int linguisticDataNotificationToken;
  objc_super v4;

  linguisticDataNotificationToken = self->_linguisticDataNotificationToken;
  if (linguisticDataNotificationToken)
    notify_cancel(linguisticDataNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)PPNamedEntityDissector;
  -[PPNamedEntityDissector dealloc](&v4, sel_dealloc);
}

- (void)_resetGazetteer
{
  NSObject *v2;
  uint8_t v3[16];

  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_67);
  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "PPNamedEntityDissector resetting gazetteer based on an asset update.", v3, 2u);
  }

}

- (void)_registerForNotifications
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD handler[4];
  id v10;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  if (_getNotificationDispatchQueue__pasOnceToken3 != -1)
    dispatch_once(&_getNotificationDispatchQueue__pasOnceToken3, &__block_literal_global_148);
  v3 = (id)_getNotificationDispatchQueue__pasExprOnceResult;
  v4 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __51__PPNamedEntityDissector__registerForNotifications__block_invoke;
  handler[3] = &unk_1E7E14918;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch("com.apple.MobileAsset.LinguisticData.ma.new-asset-installed", &self->_linguisticDataNotificationToken, v3, handler);

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __51__PPNamedEntityDissector__registerForNotifications__block_invoke_2;
  v7[3] = &unk_1E7E1FCC0;
  objc_copyWeak(&v8, &location);
  v6 = (id)objc_msgSend(v5, "addUpdateHandlerForNamespaceName:block:", CFSTR("PERSONALIZATION_PORTRAIT_GLOBAL"), v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_collectAugmentedGazetteerWithText:(id)a3 addNamedEntity:(id)a4 addTopic:(id)a5 addLocation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _PASLock *lock;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  lock = self->_lock;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke;
  v19[3] = &unk_1E7E149B8;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v19);

}

- (void)_harvestLocationFromEntity:(id)a3 category:(unint64_t)a4 dynamicCategory:(id)a5 enrichment:(id)a6 algorithm:(unsigned __int16)a7
{
  uint64_t v7;
  id v10;
  void *v11;
  id v12;

  v7 = a7;
  v12 = a3;
  v10 = a6;
  if (+[PPLocalLocationStore isLocationRelevantNamedEntityCategory:](PPLocalLocationStore, "isLocationRelevantNamedEntityCategory:", a4))
  {
    +[PPLocalLocationStore scoredLocationFromName:category:score:sentimentScore:](PPLocalLocationStore, "scoredLocationFromName:category:score:sentimentScore:", v12, +[PPLocalLocationStore namedEntityCategoryToLocationCategory:](PPLocalLocationStore, "namedEntityCategoryToLocationCategory:", a4), 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addLocation:algorithm:", v11, v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCardContactsIdentifier, 0);
  objc_storeStrong((id *)&self->_userLanguage, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

id __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned __int16 v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *context;

  v8 = a2;
  v9 = a4;
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (!v10)
  {
    v11 = objc_opt_new();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v15 = (void *)objc_opt_new();
    v16 = (void *)objc_opt_new();
    objc_msgSend(v15, "setEntities:", v16);

    v17 = (void *)objc_opt_new();
    objc_msgSend(v15, "setTopics:", v17);

    objc_msgSend(v15, "setSource:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v15, "setEntityAlgorithm:", a5);
    objc_msgSend(v15, "setTopicAlgorithm:", 0);
    objc_msgSend(v15, "setCloudSync:", *(unsigned __int8 *)(a1 + 88));
    v18 = (double *)MEMORY[0x1E0D70F08];
    if (!*(_BYTE *)(a1 + 89))
      v18 = (double *)MEMORY[0x1E0D70F00];
    objc_msgSend(v15, "setDecayRate:", *v18);
    objc_msgSend(v15, "setSentimentScore:", *(double *)(a1 + 80));
    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v20);

  }
  v21 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v21, "containsObject:", v22);

  if ((_DWORD)v21)
  {
    context = (void *)MEMORY[0x1C3BD6630]();
    v23 = objc_alloc(MEMORY[0x1E0D70BC0]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "languageCode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v8;
    v27 = (void *)objc_msgSend(v23, "initWithName:category:dynamicCategory:language:", v8, a3, v9, v25);

    objc_msgSend(v15, "entities");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v27, 0.0);
    objc_msgSend(v28, "arrayByAddingObject:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEntities:", v30);

    objc_msgSend(*(id *)(a1 + 48), "allKeys");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = objc_msgSend(v31, "containsObject:", v32);

    if ((_DWORD)v29)
    {
      v33 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5, context);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "unsignedLongValue");

      v37 = *(void **)(a1 + 56);
      v38 = v36;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v37) = objc_msgSend(v37, "containsObject:", v39);

      if ((_DWORD)v37)
        objc_msgSend(*(id *)(a1 + 64), "_harvestLocationFromEntity:category:dynamicCategory:enrichment:algorithm:", v26, a3, v9, v15, v38);
    }

    objc_autoreleasePoolPop(context);
    v8 = v26;
  }

  return v15;
}

id __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v7 = a2;
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v8)
  {
    v9 = objc_opt_new();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_msgSend(v14, "containsObject:", v15);

  if ((v14 & 1) != 0)
  {
    if (!v13)
    {
      v13 = (void *)objc_opt_new();
      v16 = (void *)objc_opt_new();
      objc_msgSend(v13, "setEntities:", v16);

      v17 = (void *)objc_opt_new();
      objc_msgSend(v13, "setTopics:", v17);

      objc_msgSend(v13, "setSource:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v13, "setEntityAlgorithm:", a4);
      objc_msgSend(v13, "setCloudSync:", *(unsigned __int8 *)(a1 + 64));
      v18 = (double *)MEMORY[0x1E0D70F08];
      if (!*(_BYTE *)(a1 + 65))
        v18 = (double *)MEMORY[0x1E0D70F00];
      objc_msgSend(v13, "setDecayRate:", *v18);
      objc_msgSend(v13, "setSentimentScore:", *(double *)(a1 + 56));
      v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, v20);

    }
    objc_msgSend(v13, "setTopicAlgorithm:", a3);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70CB8]), "initWithTopicIdentifier:", v7);
    v22 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v13, "topics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v21, 0.0);
    objc_msgSend(v23, "arrayByAddingObject:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v22);
    objc_msgSend(v13, "setTopics:", v25);

    v26 = v13;
  }
  else
  {
    v26 = v13;
  }

  return v26;
}

id __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v9 = a2;
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v10)
  {
    v11 = objc_opt_new();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend(v16, "containsObject:", v17);

  if ((v16 & 1) != 0)
  {
    if (!v15)
    {
      v15 = (void *)objc_opt_new();
      v18 = (void *)objc_opt_new();
      objc_msgSend(v15, "setEntities:", v18);

      v19 = (void *)objc_opt_new();
      objc_msgSend(v15, "setTopics:", v19);

      objc_msgSend(v15, "setSource:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v15, "setEntityAlgorithm:", a5);
      objc_msgSend(v15, "setCloudSync:", *(unsigned __int8 *)(a1 + 64));
      v20 = (double *)MEMORY[0x1E0D70F08];
      if (!*(_BYTE *)(a1 + 65))
        v20 = (double *)MEMORY[0x1E0D70F00];
      objc_msgSend(v15, "setDecayRate:", *v20);
      objc_msgSend(v15, "setSentimentScore:", *(double *)(a1 + 56));
      v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, v22);

    }
    +[PPLocalLocationStore scoredLocationFromName:category:score:sentimentScore:](PPLocalLocationStore, "scoredLocationFromName:category:score:sentimentScore:", v9, a4, 1.0, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addLocation:algorithm:", v23, a3);
    v24 = v15;

  }
  else
  {
    v24 = v15;
  }

  return v24;
}

void __90__PPNamedEntityDissector_entitiesInPlainText_eligibleRegions_source_cloudSync_algorithms___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a2, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "_collectAugmentedGazetteerWithText:addNamedEntity:addTopic:addLocation:", v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __99__PPNamedEntityDissector__collectDataDetectorsWithText_algorithms_isMessagesSource_addNamedEntity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (objc_msgSend(v3, "length"))
    v4 = (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return 0;
}

void __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(a2, "purgeableGazetteer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke_2;
  v11[3] = &unk_1E7E14940;
  v6 = *(_QWORD *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke_3;
  v9[3] = &unk_1E7E14968;
  v10 = *(id *)(a1 + 48);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke_4;
  v7[3] = &unk_1E7E14990;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "iterExtractionsForText:addEntity:addTopic:addLocation:", v6, v11, v9, v7);

}

id __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke_2(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke_3(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __97__PPNamedEntityDissector__collectAugmentedGazetteerWithText_addNamedEntity_addTopic_addLocation___block_invoke_4(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__PPNamedEntityDissector__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_resetGazetteer");
    WeakRetained = v2;
  }

}

void __51__PPNamedEntityDissector__registerForNotifications__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_resetGazetteer");
    WeakRetained = v2;
  }

}

void __41__PPNamedEntityDissector__resetGazetteer__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;

  v2 = (objc_class *)MEMORY[0x1E0D815E0];
  v3 = a2;
  v4 = (id)objc_msgSend([v2 alloc], "initWithBlock:idleTimeout:", &__block_literal_global_146, 240.0);
  objc_msgSend(v3, "setPurgeableGazetteer:", v4);

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global);
  return (id)sharedInstance__pasExprOnceResult;
}

void __40__PPNamedEntityDissector_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
