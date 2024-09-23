@implementation TTSAXResourceManager

- (int64_t)readResourceCacheVersionFromPreferences
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint8_t v11[16];

  v2 = (void *)TTSPreferencesCopyValueForKey(CFSTR("TTSResourceCacheVersionKey"));
  AXTTSLogResourceManager();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_1A3AB1CB0();

    v9 = objc_msgSend_integerValue(v2, v5, v6, v7, v8);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A3940000, v4, OS_LOG_TYPE_INFO, "No resource cache version found in preferences", v11, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (id)_findResourcesForLegacyAssets
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int isAssetCatalogInstalled;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  TTSAXResource *v97;
  const char *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  TTSAXResource *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const __CFString *v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const __CFString *v156;
  unint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  NSObject *v191;
  _BOOL4 v192;
  NSObject *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  void *v199;
  TTSAXResourceManager *v200;
  id obj;
  TTSAXResource *contexta;
  void *context;
  id v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  void *v209;
  uint64_t v210;
  id v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  _QWORD v220[7];
  _QWORD v221[7];
  _BYTE v222[128];
  _QWORD v223[7];
  _QWORD v224[7];
  _QWORD v225[7];
  _QWORD v226[7];
  uint8_t buf[4];
  void *v228;
  __int16 v229;
  uint64_t v230;
  __int16 v231;
  void *v232;
  __int16 v233;
  void *v234;
  __int16 v235;
  void *v236;
  __int16 v237;
  void *v238;
  _BYTE v239[128];
  uint64_t v240;

  v240 = *MEMORY[0x1E0C80C00];
  AXTTSLogResourceManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3940000, v3, OS_LOG_TYPE_INFO, "Will find resources for legacy assets", buf, 2u);
  }

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v4, v5, v6, v7);
  v211 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1A8597054]();
  v200 = self;
  objc_msgSend_legacyCombinedVocalizerAssetController(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isAssetCatalogInstalled = objc_msgSend_isAssetCatalogInstalled(v13, v14, v15, v16, v17);

  if (isAssetCatalogInstalled)
  {
    v199 = v8;
    objc_msgSend_legacyCombinedVocalizerAssetController(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_refreshWithoutCatalogUpdateSynchronously(v23, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v218 = 0u;
    v219 = 0u;
    v216 = 0u;
    v217 = 0u;
    obj = v28;
    v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v216, (uint64_t)v239, 16);
    if (v206)
    {
      v34 = *(_QWORD *)v217;
      v205 = *(_QWORD *)v217;
      do
      {
        for (i = 0; i != v206; ++i)
        {
          if (*(_QWORD *)v217 != v34)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * i);
          objc_msgSend_localURL(v36, v30, v31, v32, v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            objc_msgSend_properties(v36, v30, v31, v32, v33);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v38, v39, (uint64_t)CFSTR("Name"), v40, v41);
            v42 = objc_claimAutoreleasedReturnValue();

            objc_msgSend_properties(v36, v43, v44, v45, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v47, v48, (uint64_t)CFSTR("Languages"), v49, v50);
            v207 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_properties(v36, v51, v52, v53, v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v55, v56, (uint64_t)CFSTR("Gender"), v57, v58);
            v209 = (void *)objc_claimAutoreleasedReturnValue();

            v59 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend_properties(v36, v60, v61, v62, v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v64, v65, (uint64_t)CFSTR("VoiceId"), v66, v67);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v59, v69, (uint64_t)CFSTR("%@-%@"), v70, v71, v68, CFSTR("compact"));
            v72 = (void *)objc_claimAutoreleasedReturnValue();

            v73 = (void *)MEMORY[0x1E0CB3940];
            v74 = (void *)v42;
            objc_msgSend_properties(v36, v75, v76, v77, v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v79, v80, (uint64_t)CFSTR("VoiceId"), v81, v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v73, v84, (uint64_t)CFSTR("%@-%@"), v85, v86, v83, CFSTR("premium"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36 && v42 && v207 && v209 && v72 && v87)
            {
              contexta = [TTSAXResource alloc];
              v225[0] = CFSTR("Name");
              v225[1] = CFSTR("VoiceId");
              v226[0] = v42;
              v226[1] = v72;
              v225[2] = CFSTR("Languages");
              v225[3] = CFSTR("Type");
              v226[2] = v207;
              v226[3] = CFSTR("LegacyCombinedVocalizer");
              v225[4] = CFSTR("Subtype");
              v225[5] = CFSTR("Footprint");
              v226[4] = CFSTR("None");
              v226[5] = CFSTR("compact");
              v225[6] = CFSTR("Gender");
              v226[6] = v209;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v88, (uint64_t)v226, (uint64_t)v225, 7);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = objc_msgSend_initWithData_(contexta, v90, (uint64_t)v89, v91, v92);

              objc_msgSend_setAxAsset_(v93, v94, (uint64_t)v36, v95, v96);
              v97 = [TTSAXResource alloc];
              v223[0] = CFSTR("Name");
              v223[1] = CFSTR("VoiceId");
              v224[0] = v42;
              v224[1] = v87;
              v223[2] = CFSTR("Languages");
              v223[3] = CFSTR("Type");
              v224[2] = v207;
              v224[3] = CFSTR("LegacyCombinedVocalizer");
              v223[4] = CFSTR("Subtype");
              v223[5] = CFSTR("Footprint");
              v224[4] = CFSTR("None");
              v224[5] = CFSTR("enhanced");
              v223[6] = CFSTR("Gender");
              v224[6] = v209;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v98, (uint64_t)v224, (uint64_t)v223, 7);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v103 = (void *)objc_msgSend_initWithData_(v97, v100, (uint64_t)v99, v101, v102);

              objc_msgSend_setAxAsset_(v103, v104, (uint64_t)v36, v105, v106);
              objc_msgSend_objectForKey_(v211, v107, (uint64_t)CFSTR("LegacyCombinedVocalizer"), v108, v109);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              v115 = (void *)objc_msgSend_mutableCopy(v110, v111, v112, v113, v114);

              if (!v115)
              {
                objc_msgSend_array(MEMORY[0x1E0C99DE8], v116, v117, v118, v119);
                v115 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v120 = v93;
              if (v93 && v103)
              {
                objc_msgSend_addObject_(v115, v116, (uint64_t)v93, v118, v119);
                objc_msgSend_addObject_(v115, v121, (uint64_t)v103, v122, v123);
              }
              v124 = (void *)objc_msgSend_copy(v115, v116, v117, v118, v119);
              objc_msgSend_setObject_forKey_(v211, v125, (uint64_t)v124, (uint64_t)CFSTR("LegacyCombinedVocalizer"), v126);

              v34 = v205;
              v74 = (void *)v42;
            }
            else
            {
              AXTTSLogResourceManager();
              v120 = objc_claimAutoreleasedReturnValue();
              v34 = v205;
              if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138413570;
                v228 = v36;
                v229 = 2112;
                v230 = v42;
                v231 = 2112;
                v232 = v207;
                v233 = 2112;
                v234 = v209;
                v235 = 2112;
                v236 = v72;
                v237 = 2112;
                v238 = v87;
                _os_log_error_impl(&dword_1A3940000, v120, OS_LOG_TYPE_ERROR, "Legacy combined vocalizer asset or asset properties were nil: [Asset]: %@, [Asset Name]: %@, [Asset Languages]: %@, [Asset Gender]: %@, [Compact Identifier]: %@, [Premium Identifier]: %@", buf, 0x3Eu);
              }
            }

          }
        }
        v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v216, (uint64_t)v239, 16);
      }
      while (v206);
    }

    v8 = v199;
  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend_installedAssetsForLanguage_voiceType_(TTSSiriAssetManager, v127, 0, 1, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1A8597054]();
  v212 = 0u;
  v213 = 0u;
  v214 = 0u;
  v215 = 0u;
  v204 = v129;
  v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v204, v130, (uint64_t)&v212, (uint64_t)v222, 16);
  if (v210)
  {
    v208 = *(_QWORD *)v213;
    do
    {
      v131 = 0;
      do
      {
        if (*(_QWORD *)v213 != v208)
          objc_enumerationMutation(v204);
        v132 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * v131);
        v133 = [TTSAXResource alloc];
        v220[0] = CFSTR("Name");
        objc_msgSend_name(v132, v134, v135, v136, v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v221[0] = v138;
        v220[1] = CFSTR("VoiceId");
        objc_msgSend_identifier(v132, v139, v140, v141, v142);
        v143 = objc_claimAutoreleasedReturnValue();
        v148 = (void *)v143;
        if (v143)
          v149 = (const __CFString *)v143;
        else
          v149 = &stru_1E4AA5CE8;
        v221[1] = v149;
        v220[2] = CFSTR("Languages");
        objc_msgSend_languages(v132, v144, v145, v146, v147);
        v150 = objc_claimAutoreleasedReturnValue();
        v155 = (void *)v150;
        if (v150)
          v156 = (const __CFString *)v150;
        else
          v156 = &stru_1E4AA5CE8;
        v221[2] = v156;
        v221[3] = CFSTR("LegacyVocalizer");
        v220[3] = CFSTR("Type");
        v220[4] = CFSTR("Subtype");
        v221[4] = CFSTR("None");
        v221[5] = CFSTR("enhanced");
        v220[5] = CFSTR("Footprint");
        v220[6] = CFSTR("Gender");
        v157 = objc_msgSend_gender(v132, v151, v152, v153, v154);
        TTSStringForSpeechGender(v157);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v158, v159, v160, v161, v162);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v221[6] = v163;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v164, (uint64_t)v221, (uint64_t)v220, 7);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        v169 = (void *)objc_msgSend_initWithData_(v133, v166, (uint64_t)v165, v167, v168);

        objc_msgSend_setVoiceAsset_(v169, v170, (uint64_t)v132, v171, v172);
        objc_msgSend_objectForKey_(v211, v173, (uint64_t)CFSTR("LegacyVocalizer"), v174, v175);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        v181 = (void *)objc_msgSend_mutableCopy(v176, v177, v178, v179, v180);

        if (v181)
        {
          if (!v169)
            goto LABEL_42;
LABEL_41:
          objc_msgSend_addObject_(v181, v182, (uint64_t)v169, v184, v185);
          goto LABEL_42;
        }
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v182, v183, v184, v185);
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        if (v169)
          goto LABEL_41;
LABEL_42:
        v186 = (void *)objc_msgSend_copy(v181, v182, v183, v184, v185);
        objc_msgSend_setObject_forKey_(v211, v187, (uint64_t)v186, (uint64_t)CFSTR("LegacyVocalizer"), v188);

        ++v131;
      }
      while (v210 != v131);
      v190 = objc_msgSend_countByEnumeratingWithState_objects_count_(v204, v189, (uint64_t)&v212, (uint64_t)v222, 16);
      v210 = v190;
    }
    while (v190);
  }

  objc_autoreleasePoolPop(context);
  AXTTSLogResourceManager();
  v191 = objc_claimAutoreleasedReturnValue();
  v192 = os_log_type_enabled(v191, OS_LOG_TYPE_INFO);

  if (v192)
  {
    AXTTSLogResourceManager();
    v193 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v193, OS_LOG_TYPE_INFO))
    {
      objc_msgSend__debugCountSummaryForResources_(v200, v194, (uint64_t)v211, v195, v196);
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v228 = v197;
      _os_log_impl(&dword_1A3940000, v193, OS_LOG_TYPE_INFO, "Returning Legacy resources: %@", buf, 0xCu);

    }
  }

  return v211;
}

- (id)_readResourcesFromPreferences
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  uint8_t buf[16];
  _QWORD v28[6];

  v28[5] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_readResourceCacheVersionFromPreferences(self, a2, v2, v3, v4) == 4)
  {
    v5 = TTSPreferencesCopyValueForKey(CFSTR("AllCachedAvailableResourcesKey"));
    if (!v5)
    {
      AXTTSLogResourceManager();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3940000, v16, OS_LOG_TYPE_INFO, "No resource data found in preferences", buf, 2u);
      }
      v18 = 0;
      goto LABEL_20;
    }
    v6 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    v28[3] = objc_opt_class();
    v28[4] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v28, 5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v6, v10, (uint64_t)v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0;
    objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E0CB3710], v14, (uint64_t)v13, (uint64_t)v5, (uint64_t)&v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v26;
    if (v16)
    {
      AXTTSLogResourceManager();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1A3AB1D9C();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        AXTTSLogResourceManager();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          sub_1A3AB1DFC();

        v18 = (void *)objc_msgSend_mutableCopy(v15, v20, v21, v22, v23);
        goto LABEL_19;
      }
      AXTTSLogResourceManager();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_opt_class();
        sub_1A3AB1E5C(v24, (uint64_t)buf, v17);
      }
    }

    v18 = 0;
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  AXTTSLogResourceManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3940000, v5, OS_LOG_TYPE_INFO, "Cache version mismatch. Returning nil for resource preferences.", buf, 2u);
  }
  v18 = 0;
LABEL_21:

  return v18;
}

- (TTSAXResourceManager)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  TTSAXResourceManager *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  AXAssetController *assetController;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  AXAssetController *legacyCombinedVocalizerAssetController;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  AXAssetController *legacyMacinTalkAssetController;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  AXAssetsService *v52;
  AXAssetsService *assetsService;
  uint64_t v54;
  NSHashTable *observers;
  NSObject *v56;
  dispatch_queue_t v57;
  OS_dispatch_queue *preferenceWriteQueue;
  dispatch_queue_t v59;
  OS_dispatch_queue *assetLoadingQueue;
  dispatch_queue_t v61;
  OS_dispatch_queue *siriServiceQueue;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v64;
  objc_super v66;

  v66.receiver = self;
  v66.super_class = (Class)TTSAXResourceManager;
  v6 = -[TTSAXResourceManager init](&v66, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CF2D68];
    objc_msgSend_policy(MEMORY[0x1E0CF2DC8], v2, v3, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetControllerWithPolicy_qosClass_shouldRefreshForAssetInstallNotifications_(v7, v9, (uint64_t)v8, 25, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    assetController = v6->_assetController;
    v6->_assetController = (AXAssetController *)v10;

    objc_msgSend_setUserInitiated_(v6->_assetController, v12, 1, v13, v14);
    objc_msgSend_addObserver_(v6->_assetController, v15, (uint64_t)v6, v16, v17);
    v18 = (void *)MEMORY[0x1E0CF2D68];
    objc_msgSend_policy(MEMORY[0x1E0CF2DB8], v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetControllerWithPolicy_qosClass_shouldRefreshForAssetInstallNotifications_(v18, v24, (uint64_t)v23, 25, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    legacyCombinedVocalizerAssetController = v6->_legacyCombinedVocalizerAssetController;
    v6->_legacyCombinedVocalizerAssetController = (AXAssetController *)v25;

    objc_msgSend_setUserInitiated_(v6->_legacyCombinedVocalizerAssetController, v27, 1, v28, v29);
    objc_msgSend_addObserver_(v6->_legacyCombinedVocalizerAssetController, v30, (uint64_t)v6, v31, v32);
    v33 = (void *)MEMORY[0x1E0CF2D68];
    objc_msgSend_policy(MEMORY[0x1E0CF2DC0], v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetControllerWithPolicy_qosClass_shouldRefreshForAssetInstallNotifications_(v33, v39, (uint64_t)v38, 25, 0);
    v40 = objc_claimAutoreleasedReturnValue();
    legacyMacinTalkAssetController = v6->_legacyMacinTalkAssetController;
    v6->_legacyMacinTalkAssetController = (AXAssetController *)v40;

    objc_msgSend_setUserInitiated_(v6->_legacyMacinTalkAssetController, v42, 1, v43, v44);
    objc_msgSend_addObserver_(v6->_legacyMacinTalkAssetController, v45, (uint64_t)v6, v46, v47);
    if ((TTSIsBaseSystem() & 1) == 0)
    {
      v52 = (AXAssetsService *)objc_alloc_init(MEMORY[0x1E0CF2D88]);
      assetsService = v6->_assetsService;
      v6->_assetsService = v52;

    }
    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v48, v49, v50, v51);
    v54 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v54;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = dispatch_queue_create("com.accessibility.resourcepref", v56);
    preferenceWriteQueue = v6->_preferenceWriteQueue;
    v6->_preferenceWriteQueue = (OS_dispatch_queue *)v57;

    v59 = dispatch_queue_create("com.accessibility.asset-loading", v56);
    assetLoadingQueue = v6->_assetLoadingQueue;
    v6->_assetLoadingQueue = (OS_dispatch_queue *)v59;

    v61 = dispatch_queue_create("com.accessibility.siri-service", v56);
    siriServiceQueue = v6->_siriServiceQueue;
    v6->_siriServiceQueue = (OS_dispatch_queue *)v61;

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_1A397493C, (CFStringRef)*MEMORY[0x1E0DDE358], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v64 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v64, v6, (CFNotificationCallback)sub_1A397493C, CFSTR("com.apple.TTS.synthProviderVoicesDidUpdate"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  return v6;
}

- (id)_debugCountSummaryForResources:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;

  v3 = a3;
  objc_msgSend_string(MEMORY[0x1E0CB37A0], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v3, v9, v10, v11, v12))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1A3945170;
    v20[3] = &unk_1E4AA06A0;
    v21 = v8;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v3, v16, (uint64_t)v20, v17, v18);

  }
  else
  {
    objc_msgSend_appendString_(v8, v13, (uint64_t)CFSTR("None"), v14, v15);
  }

  return v8;
}

- (id)resourceWithVoiceId:(id)a3
{
  uint64_t v3;

  if (!a3)
    return 0;
  objc_msgSend__resourceWithVoiceId_assetId_(self, a2, (uint64_t)a3, 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_resourceWithVoiceId:(id)a3 assetId:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1A3974900;
  v23 = sub_1A3974910;
  v24 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1A3977878;
  v15[3] = &unk_1E4AA08C8;
  v18 = &v19;
  v15[4] = self;
  v8 = v6;
  v16 = v8;
  v9 = v7;
  v17 = v9;
  objc_msgSend__accessResourceCache_(self, v10, (uint64_t)v15, v11, v12);
  v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (id)_locked_ResourceWithVoiceId:(id)a3 assetId:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *resourcesById;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v12 = v7;
  if (v6)
  {
    resourcesById = self->_resourcesById;
    objc_msgSend_lowercaseString(v6, v8, v9, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(resourcesById, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v7)
  {
    objc_msgSend_objectForKey_(self->_resourcesByAssetId, v8, (uint64_t)v7, v10, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)sharedInstance
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = sub_1A3974900;
  v8 = sub_1A3974910;
  v9 = 0;
  AX_PERFORM_WITH_LOCK();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (id)allVoices:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v7[6];
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1A3974900;
  v13 = sub_1A3974910;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A3947B70;
  v7[3] = &unk_1E4AA09C8;
  v8 = a3;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend__accessResourceCache_(self, a2, (uint64_t)v7, v3, v4);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)_getSynthesisProviderResources
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  TTSAXResource *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  AXTTSLogResourceManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3940000, v2, OS_LOG_TYPE_INFO, "Will find resources for synthesis providers", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1A8597054]();
  objc_msgSend_allSynthesisProviderVoices(TTSSynthesisProviderVoiceManager, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v36, (uint64_t)v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v37;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v18);
        v20 = [TTSAXResource alloc];
        v27 = (void *)objc_msgSend_initWithSSEVoice_(v20, v21, v19, v22, v23);
        if (v27)
          objc_msgSend_addObject_(v7, v24, (uint64_t)v27, v25, v26);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v28, (uint64_t)&v36, (uint64_t)v42, 16);
    }
    while (v16);
  }

  objc_autoreleasePoolPop(v8);
  AXTTSLogResourceManager();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v34 = objc_msgSend_count(v7, v30, v31, v32, v33);
    *(_DWORD *)buf = 134217984;
    v41 = v34;
    _os_log_impl(&dword_1A3940000, v29, OS_LOG_TYPE_INFO, "Did find %ld resources for synthesis providers", buf, 0xCu);
  }

  return v7;
}

- (AXAssetController)legacyCombinedVocalizerAssetController
{
  return self->_legacyCombinedVocalizerAssetController;
}

- (OS_dispatch_queue)assetLoadingQueue
{
  return self->_assetLoadingQueue;
}

+ (void)freeSharedInstance
{
  AX_PERFORM_WITH_LOCK();
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)TTSAXResourceManager;
  -[TTSAXResourceManager dealloc](&v4, sel_dealloc);
}

- (void)_accessResourceCache:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[3];
  char IsAXAssetsd;

  v3 = a3;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  IsAXAssetsd = 0;
  IsAXAssetsd = AXProcessIsAXAssetsd();
  v4 = v3;
  AX_PERFORM_WITH_LOCK();

  _Block_object_dispose(v5, 8);
}

- (void)_updateCachedResources_locked:(id)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *resourcesById;
  NSMutableDictionary *v7;
  NSMutableDictionary *resourcesByAssetId;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t i;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSMutableDictionary *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  id v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  objc_storeStrong((id *)&self->_resources, a3);
  v5 = (NSMutableDictionary *)objc_opt_new();
  resourcesById = self->_resourcesById;
  self->_resourcesById = v5;

  v7 = (NSMutableDictionary *)objc_opt_new();
  resourcesByAssetId = self->_resourcesByAssetId;
  self->_resourcesByAssetId = v7;

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend_allValues(self->_resources, v9, v10, v11, v12);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v54, (uint64_t)v59, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v55 != v48)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v16 = v15;
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v50, (uint64_t)v58, 16, v46);
        if (v18)
        {
          v23 = v18;
          v24 = *(_QWORD *)v51;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v51 != v24)
                objc_enumerationMutation(v16);
              v26 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
              v27 = self->_resourcesById;
              objc_msgSend_voiceId(v26, v19, v20, v21, v22);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_lowercaseString(v28, v29, v30, v31, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKey_(v27, v34, (uint64_t)v26, (uint64_t)v33, v35);

              objc_msgSend_assetId(v26, v36, v37, v38, v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              if (v40)
              {
                v41 = self->_resourcesByAssetId;
                objc_msgSend_assetId(v26, v19, v20, v21, v22);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKey_(v41, v43, (uint64_t)v26, (uint64_t)v42, v44);

              }
            }
            v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v50, (uint64_t)v58, 16);
          }
          while (v23);
        }

      }
      v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v54, (uint64_t)v59, 16);
    }
    while (v49);
  }

}

- (void)_mergeInResources:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  id obj;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v5;
  v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v71, (uint64_t)v76, 16);
  if (v63)
  {
    v61 = *(_QWORD *)v72;
    v62 = v6;
    do
    {
      for (i = 0; i != v63; ++i)
      {
        if (*(_QWORD *)v72 != v61)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v6, v8, (uint64_t)v12, v9, v10);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        v15 = (void *)MEMORY[0x1E0C9AA60];
        if (v13)
          v15 = (void *)v13;
        v16 = v15;

        v66 = v16;
        objc_msgSend__dictionaryForResources_(self, v17, (uint64_t)v16, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend_mutableCopy(v20, v21, v22, v23, v24);

        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend_objectForKeyedSubscript_(obj, v26, (uint64_t)v12, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v67, (uint64_t)v75, 16);
        if (v31)
        {
          v36 = v31;
          v37 = *(_QWORD *)v68;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v68 != v37)
                objc_enumerationMutation(v29);
              v39 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
              objc_msgSend_voiceId(v39, v32, v33, v34, v35);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              if (v40)
              {
                objc_msgSend_voiceId(v39, v32, v33, v34, v35);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_lowercaseString(v41, v42, v43, v44, v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v25, v47, (uint64_t)v39, (uint64_t)v46, v48);

              }
            }
            v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v67, (uint64_t)v75, 16);
          }
          while (v36);
        }

        objc_msgSend_allValues(v25, v49, v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v12, v54, (uint64_t)CFSTR("MacinTalk"), v55, v56))
        {
          objc_msgSend__findAndSwapLegacyMacinTalkAssetsForMacinTalkResources_(self, v57, (uint64_t)v53, v58, v59);
          v60 = objc_claimAutoreleasedReturnValue();

          v53 = (void *)v60;
        }
        v6 = v62;
        objc_msgSend_setObject_forKeyedSubscript_(v62, v57, (uint64_t)v53, (uint64_t)v12, v59);

      }
      v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v71, (uint64_t)v76, 16);
    }
    while (v63);
  }

}

- (id)_expensiveResources
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t v29[16];
  uint8_t buf[16];

  AXTTSLogResourceManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3940000, v3, OS_LOG_TYPE_INFO, "Running block to compute expensive resources", buf, 2u);
  }

  objc_msgSend__findResourcesForLegacyAssets(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AXTTSLogResourceManager();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_1A3940000, v9, OS_LOG_TYPE_INFO, "Will ask assetController to refresh only-installed TTSResource AXAssets now", v29, 2u);
  }

  objc_msgSend__axAssetsForTTSAXResourceModel_(self, v10, 1, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__resourcesForAssets_(self, v14, (uint64_t)v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__refreshSiriResources_(self, v18, 1, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(v8, v22, (uint64_t)v17, v23, v24);
  objc_msgSend_addEntriesFromDictionary_(v8, v25, (uint64_t)v21, v26, v27);

  return v8;
}

- (void)_mergeInExpensiveInstalledAssets_locked:(BOOL)a3 notifyObservers:(BOOL)a4
{
  _BOOL4 v5;
  uint64_t v7;
  void (**v8)(void *, void *);
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  void (**v17)(void *, void *);
  _QWORD aBlock[5];
  id v19;
  BOOL v20;
  BOOL v21;
  id location;
  uint8_t buf[4];
  _BOOL8 v24;
  uint64_t v25;

  v5 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if ((TTSIsBaseSystem() & 1) == 0)
  {
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A3975648;
    aBlock[3] = &unk_1E4AA06C8;
    objc_copyWeak(&v19, &location);
    aBlock[4] = self;
    v20 = v5;
    v21 = a4;
    v8 = (void (**)(void *, void *))_Block_copy(aBlock);
    AXTTSLogResourceManager();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v5;
      _os_log_impl(&dword_1A3940000, v9, OS_LOG_TYPE_INFO, "Will merge in expensive resources. sync=%ld", buf, 0xCu);
    }

    if (v5)
    {
      objc_msgSend__expensiveResources(self, v10, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v14);

    }
    else
    {
      objc_msgSend_assetLoadingQueue(self, v10, v11, v12, v13);
      v15 = objc_claimAutoreleasedReturnValue();
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = sub_1A3975760;
      v16[3] = &unk_1E4AA0718;
      v16[4] = self;
      v17 = v8;
      dispatch_async(v15, v16);

    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (AXAsset)samplesAsset
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  AXAsset *v7;
  AXAsset *samplesAsset;
  AXAsset *v9;
  NSObject *v10;
  _BOOL4 v11;
  AXAsset *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v17;
  AXAsset *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->_samplesAsset)
  {
    AXTTSLogResourceManager();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A3940000, v3, OS_LOG_TYPE_INFO, "Samples asset has not been initialized, attempting to read from mobile asset.", (uint8_t *)&v17, 2u);
    }

    objc_msgSend__refreshSamples_(self, v4, 1, v5, v6);
    v7 = (AXAsset *)objc_claimAutoreleasedReturnValue();
    samplesAsset = self->_samplesAsset;
    self->_samplesAsset = v7;

    v9 = self->_samplesAsset;
    AXTTSLogResourceManager();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        v12 = self->_samplesAsset;
        v17 = 138412290;
        v18 = v12;
        v13 = "Samples asset has been found: %@";
        v14 = v10;
        v15 = 12;
LABEL_9:
        _os_log_impl(&dword_1A3940000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v17, v15);
      }
    }
    else if (v11)
    {
      LOWORD(v17) = 0;
      v13 = "Samples asset was nil, it has not been downloaded yet.";
      v14 = v10;
      v15 = 2;
      goto LABEL_9;
    }

  }
  return self->_samplesAsset;
}

- (id)_refreshSamples:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const __CFString *v24;
  _QWORD v25[2];

  v5 = a3;
  v25[1] = *MEMORY[0x1E0C80C00];
  v24 = CFSTR("Sample");
  objc_msgSend_stringValue(MEMORY[0x1E0C9AAB0], a2, a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v25, (uint64_t)&v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_assetController(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_refreshAssetsWithAttributesSynchronously_installedOnly_(v14, v15, (uint64_t)v9, v5, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)_refreshResourcesForManagerType:(unint64_t)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  int v90;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  AXTTSLogResourceManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v6, a3, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = 138412290;
    v91 = v9;
    _os_log_impl(&dword_1A3940000, v5, OS_LOG_TYPE_INFO, "Will refresh resources for type: %@", (uint8_t *)&v90, 0xCu);

  }
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v10, v11, v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 1) != 0)
  {
    objc_msgSend_bundleWithPath_(MEMORY[0x1E0CB34D0], v14, (uint64_t)CFSTR("/System/Library/PrivateFrameworks/TextToSpeechMauiSupport.framework"), v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v18;
    if (v18)
    {
      objc_msgSend_pathForResource_ofType_(v18, v19, (uint64_t)CFSTR("TTSResources"), 0, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__findLocalResourcesForPath_(self, v23, (uint64_t)v22, v24, v25);
      v26 = objc_claimAutoreleasedReturnValue();

      if (v26)
        objc_msgSend_addEntriesFromDictionary_(v17, v27, (uint64_t)v26, v28, v29);
    }
    else
    {
      AXTTSLogResourceManager();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_1A3AB172C();
    }

    if ((TTSIsBaseSystem() & 1) != 0)
      goto LABEL_19;
    AXTTSLogResourceManager();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      LOWORD(v90) = 0;
      _os_log_impl(&dword_1A3940000, v30, OS_LOG_TYPE_INFO, "Will ask assetController to refresh TTSResource AXAssets now", (uint8_t *)&v90, 2u);
    }

    objc_msgSend__axAssetsForTTSAXResourceModel_(self, v31, 0, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__resourcesForAssets_(self, v35, (uint64_t)v34, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKey_(v17, v39, (uint64_t)CFSTR("Maui"), v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v42;
    if (!v42)
      v42 = (void *)MEMORY[0x1E0C9AA60];
    v48 = (void *)objc_msgSend_mutableCopy(v42, v43, v44, v45, v46);

    objc_msgSend_objectForKey_(v38, v49, (uint64_t)CFSTR("Maui"), v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v48, v53, (uint64_t)v52, v54, v55);

    objc_msgSend_objectForKey_(v17, v56, (uint64_t)CFSTR("MacinTalk"), v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v59;
    if (!v59)
      v59 = (void *)MEMORY[0x1E0C9AA60];
    v65 = (void *)objc_msgSend_mutableCopy(v59, v60, v61, v62, v63);

    objc_msgSend_objectForKey_(v38, v66, (uint64_t)CFSTR("MacinTalk"), v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v65, v70, (uint64_t)v69, v71, v72);

    v77 = (void *)objc_msgSend_copy(v48, v73, v74, v75, v76);
    objc_msgSend_setObject_forKey_(v17, v78, (uint64_t)v77, (uint64_t)CFSTR("Maui"), v79);

    objc_msgSend__findAndSwapLegacyMacinTalkAssetsForMacinTalkResources_(self, v80, (uint64_t)v65, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v17, v84, (uint64_t)v83, (uint64_t)CFSTR("MacinTalk"), v85);

  }
  if ((a3 & 2) != 0)
  {
    objc_msgSend__refreshSiriResources_(self, v14, 0, v15, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addEntriesFromDictionary_(v17, v86, (uint64_t)v21, v87, v88);
LABEL_19:

  }
  return v17;
}

- (void)rebuildSystemCacheForActionType:(unint64_t)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  AXTTSLogResourceManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1A3AB1758();

  objc_msgSend_assetsService(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateTTSResourcesForActionType_(v10, v11, a3, v12, v13);

}

- (void)downloadResourceWithAssetId:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_resourceWithAssetId_(self, a2, (uint64_t)a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__downloadResource_userInitiated_(self, v6, (uint64_t)v8, 1, v7);

}

- (void)downloadResourceWithVoiceId:(id)a3
{
  ((void (*)(TTSAXResourceManager *, char *, id, uint64_t))MEMORY[0x1E0DE7D20])(self, sel_downloadResourceWithVoiceId_userInitiated_, a3, 1);
}

- (void)downloadResourceWithVoiceId:(id)a3 userInitiated:(BOOL)a4
{
  uint64_t v4;
  _BOOL8 v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v5 = a4;
  objc_msgSend_resourceWithVoiceId_(self, a2, (uint64_t)a3, a4, v4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v15, v7, v8, v9, v10) == 3 || objc_msgSend_type(v15, v11, v12, v13, v14) == 10)
    objc_msgSend__downloadSiriVoiceAssetWithResource_(self, v11, (uint64_t)v15, v13, v14);
  else
    objc_msgSend__downloadResource_userInitiated_(self, v11, (uint64_t)v15, v5, v14);

}

- (void)stopDownloadResourceWithVoiceId:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_msgSend_resourceWithVoiceId_(self, a2, (uint64_t)a3, v3, v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v14, v6, v7, v8, v9) == 3 || objc_msgSend_type(v14, v10, v11, v12, v13) == 10)
    objc_msgSend__stopDownloadSiriVoiceAssetWithResource_(self, v10, (uint64_t)v14, v12, v13);
  else
    objc_msgSend__stopDownloadResource_(self, v10, (uint64_t)v14, v12, v13);

}

- (void)_stopDownloadSiriVoiceAssetWithResource:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    objc_msgSend_primaryLanguage(v4, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_gender(v9, v11, v12, v13, v14);
    v20 = objc_msgSend_footprint(v9, v16, v17, v18, v19);
    objc_msgSend_name(v9, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_speechVoice(v9, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_voiceType(v30, v31, v32, v33, v34);
    objc_msgSend_assetForLanguage_gender_footprint_voiceName_voiceType_(TTSSiriAssetManager, v36, (uint64_t)v10, v15, v20, v25, v35);
    v37 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_stopDownload_(TTSSiriAssetManager, v38, (uint64_t)v37, v39, v40);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = sub_1A3976074;
    v44[3] = &unk_1E4AA0740;
    v45 = v9;
    objc_msgSend__performBlockOnObservers_(self, v41, (uint64_t)v44, v42, v43);

  }
  else
  {
    AXTTSLogResourceManager();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_1A3AB1790();
  }

}

- (void)_stopDownloadResource:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v4 = a3;
  objc_msgSend_assetController(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v10, (uint64_t)v4, (uint64_t)v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v11)
  {
    objc_msgSend_assetController(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1A397625C;
    v20[3] = &unk_1E4AA0768;
    v20[4] = self;
    v21 = v4;
    v22 = v11;
    objc_msgSend_stopDownloadAsset_completion_(v16, v17, (uint64_t)v22, (uint64_t)v20, v18);

  }
  else
  {
    AXTTSLogResourceManager();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1A3AB17BC();

  }
}

- (void)_downloadResource:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  _QWORD v41[4];
  NSObject *v42;
  _QWORD v43[2];

  v4 = a4;
  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = v6;
  if (v6)
  {
    if (objc_msgSend_isInstalled(v6, v7, v8, v9, v10))
    {
      AXTTSLogResourceManager();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1A3AB18E8();
    }
    else
    {
      if (objc_msgSend_type(v11, v12, v13, v14, v15) == 6 || objc_msgSend_type(v11, v24, v25, v26, v27) == 7)
      {
        objc_msgSend_legacyCombinedVocalizerAssetController(self, v24, v25, v26, v27);
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v28, (uint64_t)v11, (uint64_t)v16, 0);
      }
      else
      {
        objc_msgSend_assetController(self, v24, v25, v26, v27);
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_setUserInitiated_(v16, v29, v4, v30, v31);
        objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v32, (uint64_t)v11, (uint64_t)v16, 0);
      }
      v33 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v33;
      if (v33)
      {
        v43[0] = v33;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v34, (uint64_t)v43, 1, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = sub_1A397659C;
        v41[3] = &unk_1E4AA0790;
        v42 = v36;
        objc_msgSend_downloadAssets_successStartBlock_(v16, v38, (uint64_t)v37, (uint64_t)v41, v39);

        v40 = v42;
      }
      else
      {
        AXTTSLogResourceManager();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          sub_1A3AB17BC();
      }

    }
  }
  else
  {
    AXTTSLogResourceManager();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1A3AB1880(v16, v17, v18, v19, v20, v21, v22, v23);
  }

}

- (void)_downloadSiriVoiceAssetWithResource:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  _QWORD v42[4];
  NSObject *v43;
  TTSAXResourceManager *v44;
  NSObject *v45;
  uint8_t buf[4];
  NSObject *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = v4;
  if (v4)
  {
    objc_msgSend_primaryLanguage(v4, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_gender(v9, v11, v12, v13, v14);
    v20 = objc_msgSend_footprint(v9, v16, v17, v18, v19);
    objc_msgSend_name(v9, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_speechVoice(v9, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_voiceType(v30, v31, v32, v33, v34);
    objc_msgSend_assetForLanguage_gender_footprint_voiceName_voiceType_(TTSSiriAssetManager, v36, (uint64_t)v10, v15, v20, v25, v35);
    v37 = objc_claimAutoreleasedReturnValue();

    AXTTSLogResourceManager();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v37)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v37;
        _os_log_impl(&dword_1A3940000, v39, OS_LOG_TYPE_DEFAULT, "Will ask SiriTTS to download asset: %@", buf, 0xCu);
      }

      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = sub_1A39767E4;
      v42[3] = &unk_1E4AA0830;
      v43 = v9;
      v44 = self;
      v45 = v37;
      objc_msgSend_downloadAsset_progressHandler_(TTSSiriAssetManager, v40, (uint64_t)v45, (uint64_t)v42, v41);

      v39 = v43;
    }
    else if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      sub_1A3AB19D8();
    }

  }
  else
  {
    AXTTSLogResourceManager();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_1A3AB19AC();
  }

}

- (void)downloadSamplesIfNecessary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  uint64_t isDownloading;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  objc_msgSend_samplesAsset(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localURL(v6, v7, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v16 = (void *)v11;
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v12, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localURL(v6, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v22, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_fileExistsAtPath_(v17, v28, (uint64_t)v27, v29, v30);

    if (v31)
    {
      AXTTSLogResourceManager();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3940000, v32, OS_LOG_TYPE_INFO, "Speech sample DL: Already downloaded. Bailing", buf, 2u);
      }

LABEL_11:
      return;
    }
  }
  if ((objc_msgSend_isDownloading(v6, v12, v13, v14, v15) & 1) != 0
    || objc_msgSend_downloadingSamples(self, v33, v34, v35, v36))
  {
    AXTTSLogResourceManager();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v81 = objc_msgSend_downloadingSamples(self, v41, v42, v43, v44);
      v82 = 2048;
      isDownloading = objc_msgSend_isDownloading(v6, v45, v46, v47, v48);
      _os_log_impl(&dword_1A3940000, v40, OS_LOG_TYPE_INFO, "Speech sample DL: Already in progress. downloadingSamples=%ld samplesAsset.isDownloading=%ld", buf, 0x16u);
    }

    goto LABEL_11;
  }
  objc_msgSend_setDownloadingSamples_(self, v37, 1, v38, v39);
  objc_msgSend__refreshSamples_(self, v49, 0, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend_setSamplesAsset_(self, v53, (uint64_t)v52, v54, v55);
    objc_msgSend_assetController(self, v56, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserInitiated_(v60, v61, 0, v62, v63);

    AXTTSLogResourceManager();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3940000, v64, OS_LOG_TYPE_INFO, "Speech sample DL: About to kick off download.", buf, 2u);
    }

    objc_msgSend_assetController(self, v65, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v52;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v70, (uint64_t)&v79, 1, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_downloadAssets_successStartBlock_(v69, v73, (uint64_t)v72, (uint64_t)&unk_1E4A95ED8, v74);

  }
  else
  {
    AXTTSLogResourceManager();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      sub_1A3AB1A38();

    objc_msgSend_setDownloadingSamples_(self, v76, 0, v77, v78);
  }
}

- (void)deleteResourceWithAssetId:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_resourceWithAssetId_(self, a2, (uint64_t)a3, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__deleteResource_(self, v6, (uint64_t)v9, v7, v8);

}

- (void)deleteResourceWithVoiceId:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  objc_msgSend_resourceWithVoiceId_(self, a2, (uint64_t)a3, v3, v4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v15, v6, v7, v8, v9) == 3
    || objc_msgSend_type(v15, v10, v11, v12, v13) == 7
    || objc_msgSend_type(v15, v10, v14, v12, v13) == 10)
  {
    objc_msgSend__deleteSiriVoiceAssetWithResource_(self, v10, (uint64_t)v15, v12, v13);
  }
  else
  {
    objc_msgSend__deleteResource_(self, v10, (uint64_t)v15, v12, v13);
  }

}

- (void)_deleteResource:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend_isInstalled(v4, v5, v6, v7, v8) & 1) != 0)
  {
    if (objc_msgSend_type(v4, v9, v10, v11, v12) == 6 || objc_msgSend_type(v4, v13, v14, v15, v16) == 7)
    {
      objc_msgSend_legacyCombinedVocalizerAssetController(self, v13, v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_assetController(self, v13, v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v19 = v17;
    objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v18, (uint64_t)v4, v17, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v25 = v20;
    }
    else
    {
      objc_msgSend_legacyMacinTalkAssetController(self, v21, v22, v23, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v27, (uint64_t)v4, (uint64_t)v26, 1);
      v25 = objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        AXTTSLogResourceManager();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1A3AB17BC();
        goto LABEL_13;
      }
      objc_msgSend_legacyMacinTalkAssetController(self, v28, v29, v30, v31);
      v32 = objc_claimAutoreleasedReturnValue();

      v19 = v32;
    }
    v45[0] = v25;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v21, (uint64_t)v45, 1, v24);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_purgeAssetsSynchronously_(v19, v34, (uint64_t)v33, v35, v36);

    objc_msgSend_rebuildSystemCacheForActionType_(self, v37, 0, v38, v39);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = sub_1A3977194;
    v43[3] = &unk_1E4AA0740;
    v44 = v4;
    objc_msgSend__performBlockOnObservers_(self, v40, (uint64_t)v43, v41, v42);

LABEL_13:
    goto LABEL_14;
  }
  AXTTSLogResourceManager();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_1A3AB1A64();
LABEL_14:

}

- (void)_deleteSiriVoiceAssetWithResource:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;

  v4 = a3;
  objc_msgSend_primaryLanguage(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_gender(v4, v10, v11, v12, v13);
  v19 = objc_msgSend_footprint(v4, v15, v16, v17, v18);
  objc_msgSend_name(v4, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_speechVoice(v4, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_voiceType(v29, v30, v31, v32, v33);
  objc_msgSend_assetForLanguage_gender_footprint_voiceName_voiceType_(TTSSiriAssetManager, v35, (uint64_t)v9, v14, v19, v24, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_purgeAsset_(TTSSiriAssetManager, v37, (uint64_t)v36, v38, v39);
  objc_msgSend_rebuildSystemCacheForActionType_(self, v40, 0, v41, v42);
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = sub_1A3977398;
  v47[3] = &unk_1E4AA0740;
  v48 = v4;
  v43 = v4;
  objc_msgSend__performBlockOnObservers_(self, v44, (uint64_t)v47, v45, v46);

}

- (id)resourcesWithLanguage:(id)a3 type:(unint64_t)a4
{
  return (id)objc_msgSend__resourcesWithType_subType_languageCode_(self, a2, a4, 1, (uint64_t)a3);
}

- (id)resourcesWithType:(unint64_t)a3 subType:(unint64_t)a4
{
  void *v4;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend__resourcesWithType_subType_languageCode_(self, a2, a3, a4, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_resourcesWithType:(unint64_t)a3 subType:(unint64_t)a4 languageCode:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1A3974900;
  v24 = sub_1A3974910;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1A39775A4;
  v15[3] = &unk_1E4AA08A0;
  v18 = a3;
  v19 = a4;
  v15[4] = self;
  v9 = v8;
  v16 = v9;
  v17 = &v20;
  objc_msgSend__accessResourceCache_(self, v10, (uint64_t)v15, v11, v12);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)resourceWithAssetId:(id)a3
{
  uint64_t v3;

  if (!a3)
    return 0;
  objc_msgSend__resourceWithVoiceId_assetId_(self, a2, 0, (uint64_t)a3, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultVoiceForLanguage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint8_t v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_resourcesWithLanguage_type_(self, v5, (uint64_t)v4, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ax_filteredArrayUsingBlock_(v7, v8, (uint64_t)&unk_1E4AA0908, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_count(v11, v12, v13, v14, v15) >= 2)
  {
    AXTTSLogResourceManager();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 138412290;
      *(_QWORD *)&v33[4] = v4;
      v21 = "Multiple default resources found for language: %@. Returning one at random";
LABEL_7:
      _os_log_impl(&dword_1A3940000, v20, OS_LOG_TYPE_DEFAULT, v21, v33, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (!objc_msgSend_count(v11, v16, v17, v18, v19))
  {
    AXTTSLogResourceManager();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 138412290;
      *(_QWORD *)&v33[4] = v4;
      v21 = "No default resources found for language: %@. ";
      goto LABEL_7;
    }
LABEL_8:

  }
  objc_msgSend_firstObject(v11, v22, v23, v24, v25, *(_OWORD *)v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_speechVoice(v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)languageCodeForResourceName:(id)a3 withType:(unint64_t)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  BOOL (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  unint64_t v30;

  v8 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend_resourcesWithType_subType_(self, v6, a4, 1, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = sub_1A3977B60;
    v28 = &unk_1E4AA0930;
    v29 = v8;
    v30 = a4;
    v14 = objc_msgSend_indexOfObjectPassingTest_(v10, v11, (uint64_t)&v25, v12, v13);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = 0;
      objc_msgSend_primaryLanguage(0, v15, v16, v17, v18, v25, v26, v27, v28);
    }
    else
    {
      objc_msgSend_objectAtIndex_(v10, v15, v14, v17, v18, v25, v26, v27, v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_primaryLanguage(v19, v20, v21, v22, v23, v25, v26, v27, v28);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)superCompactVoiceIdForCompactVoiceId:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  if (objc_msgSend_hasPrefix_(v3, v4, (uint64_t)CFSTR("com.apple.voice.compact"), v5, v6))
  {
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v3, v7, (uint64_t)CFSTR("compact"), (uint64_t)CFSTR("super-compact"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_findLocalResourcesForPath:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  NSObject *v20;
  id v21;
  id v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  TTSAXResource *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSObject *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  NSObject *v123;
  NSObject *v124;
  _BOOL4 v125;
  NSObject *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  NSObject *v132;
  TTSAXResourceManager *v133;
  void *v134;
  uint64_t v135;
  NSObject *v136;
  NSObject *v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  id obj;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  id v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  id v156;
  id v157;
  uint8_t buf[4];
  uint64_t v159;
  __int16 v160;
  void *v161;
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXTTSLogResourceManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v159 = (uint64_t)v4;
    _os_log_impl(&dword_1A3940000, v5, OS_LOG_TYPE_INFO, "Will find local resources at path: %@", buf, 0xCu);
  }

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v6, v7, v8, v9);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0x1E0CB3000uLL;
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = 0;
  objc_msgSend_contentsOfDirectoryAtPath_error_(v15, v16, (uint64_t)v4, (uint64_t)&v157, v17);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v157;

  if (v18)
  {
    AXTTSLogResourceManager();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1A3AB1B50();
LABEL_6:
    v21 = 0;
    goto LABEL_48;
  }
  v133 = self;
  v156 = 0;
  objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E0CB38E8], v19, (uint64_t)CFSTR("^[^-]{2,3}-[^-]{2,3}(-[^-]{2,3})?$"), 0, (uint64_t)&v156);
  v20 = objc_claimAutoreleasedReturnValue();
  v22 = v156;
  if (!v22)
  {
    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    v23 = v134;
    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v152, (uint64_t)v163, 16);
    if (!v25)
      goto LABEL_42;
    v29 = v25;
    v30 = *(_QWORD *)v153;
    v137 = v20;
    v138 = v4;
    v135 = *(_QWORD *)v153;
    v136 = v23;
LABEL_12:
    v31 = 0;
    v139 = v29;
    while (1)
    {
      if (*(_QWORD *)v153 != v30)
        objc_enumerationMutation(v23);
      v32 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * v31);
      if ((objc_msgSend_isEqualToString_(v32, v26, (uint64_t)CFSTR("common"), v27, v28) & 1) == 0)
      {
        v34 = objc_msgSend_length(v32, v26, v33, v27, v28);
        objc_msgSend_matchesInString_options_range_(v20, v35, (uint64_t)v32, 0, 0, v34);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_count(v141, v36, v37, v38, v39))
        {
          objc_msgSend_stringByAppendingPathComponent_(v4, v40, (uint64_t)v32, v41, v42);
          v43 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_defaultManager(*(void **)(v10 + 1568), v44, v45, v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v151 = 0;
          v143 = (void *)v43;
          objc_msgSend_contentsOfDirectoryAtPath_error_(v48, v49, v43, (uint64_t)&v151, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v151;

          if (v18)
          {
            AXTTSLogResourceManager();
            v132 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
              sub_1A3AB1A90();

            goto LABEL_6;
          }
          v140 = v31;
          v149 = 0u;
          v150 = 0u;
          v147 = 0u;
          v148 = 0u;
          obj = v51;
          v53 = v143;
          v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v147, (uint64_t)v162, 16);
          if (!v145)
            goto LABEL_36;
          v144 = *(_QWORD *)v148;
          while (2)
          {
            v57 = 0;
LABEL_21:
            if (*(_QWORD *)v148 != v144)
              objc_enumerationMutation(obj);
            v58 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * v57);
            objc_msgSend_stringByAppendingPathComponent_(v53, v54, v58, v55, v56);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByAppendingPathComponent_(v59, v60, (uint64_t)CFSTR("Info.plist"), v61, v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E0C99D80], v64, (uint64_t)v63, v65, v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v67, v68, (uint64_t)CFSTR("MobileAssetProperties"), v69, v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = (void *)objc_msgSend_mutableCopy(v71, v72, v73, v74, v75);

            v77 = [TTSAXResource alloc];
            v81 = (void *)objc_msgSend_initWithData_(v77, v78, (uint64_t)v76, v79, v80);
            objc_msgSend_voiceId(v81, v82, v83, v84, v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_hasPrefix_(v86, v87, (uint64_t)CFSTR("com.apple.maui.voice"), v88, v89))
            {
              v90 = TTSIsInternalBuild();

              if ((v90 & 1) != 0)
                goto LABEL_34;
            }
            else
            {

            }
            v95 = objc_msgSend_type(v81, v91, v92, v93, v94);
            TTSStringForResourceType(v95);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v146, v97, (uint64_t)v96, v98, v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = (void *)objc_msgSend_mutableCopy(v100, v101, v102, v103, v104);

            if (!v105)
            {
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v106, v107, v108, v109);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v53 = v143;
            if (v81)
            {
              objc_msgSend_addObject_(v105, v106, (uint64_t)v81, v108, v109);
              v114 = objc_msgSend_copy(v105, v110, v111, v112, v113);
              v119 = objc_msgSend_type(v81, v115, v116, v117, v118);
              TTSStringForResourceType(v119);
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKey_(v146, v121, (uint64_t)v114, (uint64_t)v120, v122);

            }
            else
            {
              AXTTSLogResourceManager();
              v114 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v159 = v58;
                _os_log_error_impl(&dword_1A3940000, v114, OS_LOG_TYPE_ERROR, "Resource for %@ is nil", buf, 0xCu);
              }
            }

LABEL_34:
            if (v145 == ++v57)
            {
              v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v147, (uint64_t)v162, 16);
              if (!v145)
              {
LABEL_36:

                v20 = v137;
                v4 = v138;
                v30 = v135;
                v23 = v136;
                v10 = 0x1E0CB3000;
                v29 = v139;
                v31 = v140;
                goto LABEL_39;
              }
              continue;
            }
            goto LABEL_21;
          }
        }
        AXTTSLogResourceManager();
        v123 = objc_claimAutoreleasedReturnValue();
        v143 = v123;
        if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v159 = (uint64_t)v32;
          _os_log_impl(&dword_1A3940000, v123, OS_LOG_TYPE_INFO, "Invalid directory format %@", buf, 0xCu);
        }
LABEL_39:

      }
      if (++v31 == v29)
      {
        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v152, (uint64_t)v163, 16);
        if (!v29)
        {
LABEL_42:
          v18 = 0;
          goto LABEL_43;
        }
        goto LABEL_12;
      }
    }
  }
  v18 = v22;
  AXTTSLogResourceManager();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    sub_1A3AB1AF0();
LABEL_43:

  AXTTSLogResourceManager();
  v124 = objc_claimAutoreleasedReturnValue();
  v125 = os_log_type_enabled(v124, OS_LOG_TYPE_INFO);

  if (v125)
  {
    AXTTSLogResourceManager();
    v126 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
    {
      objc_msgSend__debugCountSummaryForResources_(v133, v127, (uint64_t)v146, v128, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v159 = (uint64_t)v4;
      v160 = 2112;
      v161 = v130;
      _os_log_impl(&dword_1A3940000, v126, OS_LOG_TYPE_INFO, "Did find local resources at path: %@. %@", buf, 0x16u);

    }
  }
  v21 = v146;
LABEL_48:

  return v21;
}

- (id)speechVoiceWithVoiceId:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend_allVoices_(self, v5, 0, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1A39783F4;
  v19[3] = &unk_1E4AA0958;
  v9 = v4;
  v20 = v9;
  v13 = objc_msgSend_indexOfObjectPassingTest_(v8, v10, (uint64_t)v19, v11, v12);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndex_(v8, v14, v13, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)refreshedResourcesForResources:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v4;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v12)
  {
    v17 = v12;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v10);
        objc_msgSend_voiceId(*(void **)(*((_QWORD *)&v29 + 1) + 8 * v19), v13, v14, v15, v16, (_QWORD)v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend_resourceWithVoiceId_(self, v20, (uint64_t)v23, v21, v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            objc_msgSend_addObject_(v9, v24, (uint64_t)v27, v25, v26);

        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v17);
  }

  return v9;
}

- (void)sampleURLForVoiceId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *siriServiceQueue;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  _QWORD block[4];
  id v60;
  id v61;
  id v62;

  v6 = a3;
  v7 = a4;
  objc_msgSend_resourceWithVoiceId_(self, v8, (uint64_t)v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v11, v12, v13, v14, v15) == 3)
  {
    siriServiceQueue = self->_siriServiceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A39787C0;
    block[3] = &unk_1E4AA0600;
    v60 = v11;
    v62 = v7;
    v61 = v6;
    dispatch_async(siriServiceQueue, block);

  }
  else
  {
    objc_msgSend_samplesAsset(self, v16, v17, v18, v19);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_9;
    v26 = (void *)v21;
    objc_msgSend_samplesAsset(self, v22, v23, v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localURL(v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend_objectForKeyedSubscript_(&unk_1E4ABC990, v33, (uint64_t)v6, v34, v35);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      if (v36)
        v38 = (void *)v36;
      else
        v38 = v6;
      v39 = v38;

      objc_msgSend_samplesAsset(self, v40, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localURL(v44, v45, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v50, (uint64_t)CFSTR("Contents/%@.caf"), v51, v52, v39);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_URLByAppendingPathComponent_(v49, v54, (uint64_t)v53, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v57);

    }
    else
    {
LABEL_9:
      AXTTSLogResourceManager();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        sub_1A3AB1B7C();

      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
  }

}

- (id)_resourcesForAssets:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _UNKNOWN **v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  char hasPrefix;
  unint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _UNKNOWN **v64;
  void *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  BOOL v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t i;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  id v109;
  uint64_t v110;
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v9 = v3;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v116, (uint64_t)v121, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v117;
    v14 = &off_1E4A95000;
    v109 = v9;
    v110 = *(_QWORD *)v117;
    do
    {
      v15 = 0;
      v111 = v12;
      do
      {
        if (*(_QWORD *)v117 != v13)
          objc_enumerationMutation(v9);
        v16 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v15);
        v17 = objc_alloc((Class)v14[17]);
        v21 = (void *)objc_msgSend_initWithAsset_(v17, v18, v16, v19, v20);
        if (v21)
        {
          if (!TTSIsInternalBuild()
            || (objc_msgSend_voiceId(v21, v22, v23, v24, v25),
                v26 = (void *)objc_claimAutoreleasedReturnValue(),
                hasPrefix = objc_msgSend_hasPrefix_(v26, v27, (uint64_t)CFSTR("com.apple.maui.voice"), v28, v29),
                v26,
                (hasPrefix & 1) == 0))
          {
            v31 = objc_msgSend_type(v21, v22, v23, v24, v25);
            TTSStringForResourceType(v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v8, v33, (uint64_t)v32, v34, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v36)
            {
              objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v37, v38, v39, v40);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend_voiceId(v21, v37, v38, v39, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v36, v42, (uint64_t)v41, v43, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v45)
              goto LABEL_15;
            if (!objc_msgSend_isInstalled(v45, v46, v47, v48, v49)
              || objc_msgSend_isInstalled(v21, v50, v51, v52, v53))
            {
              objc_msgSend_axAsset(v45, v50, v51, v52, v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = objc_msgSend_contentVersion(v54, v55, v56, v57, v58);
              objc_msgSend_axAsset(v21, v60, v61, v62, v63);
              v64 = v14;
              v65 = v8;
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = objc_msgSend_contentVersion(v66, v67, v68, v69, v70);

              v8 = v65;
              v14 = v64;

              v72 = v59 > v71;
              v9 = v109;
              v13 = v110;
              if (!v72)
              {
LABEL_15:
                objc_msgSend_voiceId(v21, v46, v47, v48, v49);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v36, v74, (uint64_t)v21, (uint64_t)v73, v75);

                v80 = objc_msgSend_type(v21, v76, v77, v78, v79);
                TTSStringForResourceType(v80);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKey_(v8, v82, (uint64_t)v36, (uint64_t)v81, v83);

              }
            }

            v12 = v111;
          }
        }

        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v84, (uint64_t)&v116, (uint64_t)v121, 16);
    }
    while (v12);
  }

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v85, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v90 = v8;
  v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v91, (uint64_t)&v112, (uint64_t)v120, 16);
  if (v92)
  {
    v96 = v92;
    v97 = *(_QWORD *)v113;
    do
    {
      for (i = 0; i != v96; ++i)
      {
        if (*(_QWORD *)v113 != v97)
          objc_enumerationMutation(v90);
        v99 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v90, v93, v99, v94, v95);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allValues(v100, v101, v102, v103, v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v89, v106, (uint64_t)v105, v99, v107);

      }
      v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v93, (uint64_t)&v112, (uint64_t)v120, 16);
    }
    while (v96);
  }

  return v89;
}

- (id)allLanguagesForVoices:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_msgSend_allVoices_(self, a2, a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ax_flatMappedArrayUsingBlock_(v5, v6, (uint64_t)&unk_1E4AA0A08, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v10, (uint64_t)v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSSet)allAvailableLanguages
{
  uint64_t v2;
  NSSet *allAvailableLanguages;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSSet *v29;
  NSSet *v30;

  allAvailableLanguages = self->_allAvailableLanguages;
  if (!allAvailableLanguages)
  {
    objc_msgSend_resourcesWithType_subType_(self, a2, 4, 2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resourcesWithType_subType_(self, v6, 9, 2, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ax_filteredArrayUsingBlock_(v5, v9, (uint64_t)&unk_1E4AA0A28, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObjectsFromArray_(v12, v13, (uint64_t)v8, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set(MEMORY[0x1E0C99E60], v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ax_flatMappedArrayUsingBlock_(v16, v22, (uint64_t)&unk_1E4AA0A48, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setByAddingObjectsFromArray_(v21, v26, (uint64_t)v25, v27, v28);
    v29 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v30 = self->_allAvailableLanguages;
    self->_allAvailableLanguages = v29;

    allAvailableLanguages = self->_allAvailableLanguages;
  }
  return allAvailableLanguages;
}

- (unint64_t)_managerTypeForResourceType:(unint64_t)a3
{
  if (a3 - 2 > 8)
    return 3;
  else
    return qword_1A3ABF398[a3 - 2];
}

- (BOOL)_isValidResourceTypeKey:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  char isEqualToString;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("MacinTalk"), v5, v6) & 1) != 0
      || (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("Gryphon"), v8, v9) & 1) != 0
      || (objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("Custom"), v11, v12) & 1) != 0
      || (objc_msgSend_isEqualToString_(v3, v13, (uint64_t)CFSTR("Maui"), v14, v15) & 1) != 0
      || (objc_msgSend_isEqualToString_(v3, v16, (uint64_t)CFSTR("Kona"), v17, v18) & 1) != 0
      || (objc_msgSend_isEqualToString_(v3, v19, (uint64_t)CFSTR("LegacyCombinedVocalizer"), v20, v21) & 1) != 0
      || (objc_msgSend_isEqualToString_(v3, v22, (uint64_t)CFSTR("LegacyVocalizer"), v23, v24) & 1) != 0)
    {
      isEqualToString = 1;
    }
    else
    {
      isEqualToString = objc_msgSend_isEqualToString_(v3, v25, (uint64_t)CFSTR("SynthesizerExtension"), v26, v27);
    }
  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

- (id)_dictionaryForResources:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = v3;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v11)
  {
    v16 = v11;
    v17 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v9);
        v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend_voiceId(v19, v12, v13, v14, v15, (_QWORD)v30);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend_voiceId(v19, v12, v13, v14, v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lowercaseString(v21, v22, v23, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v8, v27, (uint64_t)v19, (uint64_t)v26, v28);

        }
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v16);
  }

  return v8;
}

- (id)_axAssetsForTTSAXResourceModel:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v18;
  _BOOL8 v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  AXTTSLogResourceManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v18 = 134217984;
    v19 = v3;
    _os_log_impl(&dword_1A3940000, v5, OS_LOG_TYPE_INFO, "Requesting refreshed TTSResource assets (sync). onlyInstalled=%ld", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend_assetController(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  if (v3)
    objc_msgSend_refreshInstalledAssetsSynchronously(v10, v11, v12, v13, v14);
  else
    objc_msgSend_refreshWithoutCatalogUpdateSynchronously(v10, v11, v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)resetResourcesCache
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[16];

  AXTTSLogResourceManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3940000, v3, OS_LOG_TYPE_INFO, "Resetting in-memory resources to nil", buf, 2u);
  }

  AX_PERFORM_WITH_LOCK();
  objc_msgSend_setAllAvailableLanguages_(self, v4, 0, v5, v6);
  objc_msgSend__notifyObserversOfCacheUpdate(self, v7, v8, v9, v10);
}

- (void)resetInMemoryAssetCatalogs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  objc_msgSend_assetController(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_purgeInMemoryCachedAssets(v6, v7, v8, v9, v10);

  objc_msgSend_legacyCombinedVocalizerAssetController(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_purgeInMemoryCachedAssets(v15, v16, v17, v18, v19);

  objc_msgSend_legacyMacinTalkAssetController(self, v20, v21, v22, v23);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_purgeInMemoryCachedAssets(v28, v24, v25, v26, v27);

}

- (void)_notifyObserversOfCacheUpdate
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend__performBlockOnObservers_(self, a2, (uint64_t)&unk_1E4AA0A88, v2, v3);
  AXPerformBlockAsynchronouslyOnMainThread();
}

- (void)updateCatalogIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  objc_msgSend_assetsService(self, a2, v2, v3, v4);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetController(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetPolicy(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateAssetForPolicy_(v19, v16, (uint64_t)v15, v17, v18);

}

- (NSString)catalogBuildVersion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString *catalogBuildVersion;
  NSString *v7;
  NSString *v8;

  catalogBuildVersion = self->_catalogBuildVersion;
  if (!catalogBuildVersion)
  {
    objc_msgSend__readCatalogBuildNumberFromPreferences(self, a2, v2, v3, v4);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_catalogBuildVersion;
    self->_catalogBuildVersion = v7;

    catalogBuildVersion = self->_catalogBuildVersion;
  }
  return catalogBuildVersion;
}

- (id)refreshAssetForResource:(id)a3 installedOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;

  v4 = a4;
  v6 = a3;
  objc_msgSend_assetController(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v6, v12, v13, v14, v15) == 6)
  {
    objc_msgSend_legacyCombinedVocalizerAssetController(self, v16, v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v20;
  }
  objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v16, (uint64_t)v6, (uint64_t)v11, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v6, v22, v23, v24, v25) == 2 && !v21)
  {
    objc_msgSend_legacyMacinTalkAssetController(self, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v31, (uint64_t)v6, (uint64_t)v30, v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

- (id)_refreshAssetForResource:(id)a3 withAssetController:(id)a4 installedOnly:(BOOL)a5
{
  void *v5;
  _BOOL8 v6;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v49;
  id v50;
  const __CFString *v51;
  _QWORD v52[2];

  v6 = a5;
  v52[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend_voiceId(v9, v11, v12, v13, v14);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_legacyMacinTalkAssetController(self, v16, v17, v18, v19);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 == v10
    && objc_msgSend_isEqualToString_(v15, v21, (uint64_t)CFSTR("com.apple.speech.synthesis.voice.Alex"), v23, v24))
  {

    v15 = CFSTR("com.apple.speech.voice.Alex");
  }
  v51 = CFSTR("VoiceId");
  v28 = objc_msgSend_type(v9, v21, v22, v23, v24);
  v29 = v15;
  if (v28 == 6)
  {
    objc_msgSend_componentsSeparatedByString_(v15, v25, (uint64_t)CFSTR("-"), v26, v27);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v5, v30, v31, v32, v33);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v52[0] = v29;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)v52, (uint64_t)&v51, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 == 6)
  {

  }
  objc_msgSend_refreshAssetsWithAttributesSynchronously_installedOnly_(v10, v34, (uint64_t)v36, v6, v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_assetId(v42, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    v49 = v9;
    v50 = v42;
    AX_PERFORM_WITH_LOCK();

  }
  return v42;
}

- (id)refreshResourcesCacheForManagerType:(unint64_t)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v20;
  _QWORD v22[5];
  NSObject *v23;
  uint64_t *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  if ((AXProcessIsAXAssetsd() & 1) != 0)
  {
    objc_msgSend__refreshResourcesForManagerType_(self, v5, a3, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = sub_1A3974900;
    v30 = sub_1A3974910;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10, v11, v12);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_preferenceWriteQueue(self, v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1A3979968;
    v22[3] = &unk_1E4AA0AD0;
    v22[4] = self;
    v18 = v8;
    v23 = v18;
    v24 = &v26;
    v25 = (~(_BYTE)a3 & 3) == 0;
    dispatch_sync(v17, v22);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0DDE358], 0, 0, 1u);
    v20 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    AXTTSLogResourceManager();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1A3AB1C0C();
    v20 = 0;
  }

  return v20;
}

- (BOOL)readDidMigrateUninformedSiriVoicesFromPreferences
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  NSObject *v8;

  v2 = (void *)TTSPreferencesCopyValueForKey(CFSTR("DidMigrateUninformedSiriVoices"));
  v7 = objc_msgSend_BOOLValue(v2, v3, v4, v5, v6);

  AXTTSLogResourceManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1A3AB1C38();

  return v7;
}

- (void)updateDidMigrateUninformedSiriVoices:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const void *v5;

  v5 = (const void *)objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  TTSPreferencesSetValueForKey(CFSTR("DidMigrateUninformedSiriVoices"), v5);
}

- (void)_writeResourceCacheVersionToPreferences
{
  TTSPreferencesSetValueForKey(CFSTR("TTSResourceCacheVersionKey"), &unk_1E4ABC930);
}

- (id)_readCatalogBuildNumberFromPreferences
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  uint8_t v7[16];

  v2 = (void *)TTSPreferencesCopyValueForKey(CFSTR("TTSCachedBuildNumberKey"));
  AXTTSLogResourceManager();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_1A3AB1D10();

    v5 = v2;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A3940000, v4, OS_LOG_TYPE_INFO, "No catalog build number found in preferences", v7, 2u);
    }

  }
  return v2;
}

- (void)updateCatalogBuildVersion:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if ((AXProcessIsAXAssetsd() & 1) != 0)
  {
    TTSPreferencesSetValueForKey(CFSTR("TTSCachedBuildNumberKey"), v3);
  }
  else
  {
    AXTTSLogResourceManager();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1A3AB1D70();

  }
}

- (void)_writeResourcesToPreferences:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v25 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v4, (uint64_t)v3, 1, (uint64_t)&v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v25;
  if (v10)
  {
    AXTTSLogResourceManager();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1A3AB1F04();

  }
  else
  {
    v12 = objc_msgSend_length(v5, v6, v7, v8, v9);
    AXTTSLogResourceManager();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 <= 0x7A120)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)MEMORY[0x1E0CB37E8];
        v20 = objc_msgSend_length(v5, v15, v16, v17, v18);
        objc_msgSend_numberWithUnsignedInteger_(v19, v21, v20, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v24;
        _os_log_impl(&dword_1A3940000, v14, OS_LOG_TYPE_INFO, "Writing %@ bytes to the resource cache", buf, 0xCu);

      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      sub_1A3AB1E98();
    }

    TTSPreferencesSetValueForKey(CFSTR("AllCachedAvailableResourcesKey"), v5);
  }

}

- (void)addObserver:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AX_PERFORM_WITH_LOCK();

}

- (void)removeObserver:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AX_PERFORM_WITH_LOCK();

}

- (void)_performBlockOnObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v18;
  TTSAXResourceManager *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1A3974900;
  v25 = sub_1A3974910;
  v26 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = sub_1A397A2B8;
  v18 = &unk_1E4AA0AF8;
  v19 = self;
  v20 = &v21;
  AX_PERFORM_WITH_LOCK();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (id)v22[5];
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v11, (uint64_t)v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v10, (uint64_t)&v11, (uint64_t)v27, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v21, 8);
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char isKindOfClass;
  TTSAXResource *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend_assetId(v11, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resourceWithAssetId_(self, v18, (uint64_t)v17, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  AXTTSLogResourceManager();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v61 = v21;
    v62 = 2112;
    v63 = v11;
    _os_log_impl(&dword_1A3940000, v22, OS_LOG_TYPE_INFO, "AXAssetControllerObserver: Download completed for resource: %@ with asset: %@", buf, 0x16u);
  }

  objc_msgSend_assetPolicy(v10, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    objc_msgSend_assetPolicy(v10, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_7;
  }
  v34 = [TTSAXResource alloc];
  v38 = objc_msgSend_initWithAsset_(v34, v35, (uint64_t)v11, v36, v37);

  v21 = (void *)v38;
LABEL_7:
  AXTTSLogResourceManager();
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v12)
  {
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_1A3AB1FC4();
  }
  else if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v11;
    _os_log_impl(&dword_1A3940000, v40, OS_LOG_TYPE_INFO, "Download succeeded: %@", buf, 0xCu);
  }

  objc_msgSend_properties(v11, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v45, v46, (uint64_t)CFSTR("Sample"), v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend_setDownloadingSamples_(self, v50, 0, v51, v52);
  }
  else if (v21)
  {
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = sub_1A397A5E0;
    v57[3] = &unk_1E4AA0808;
    v58 = v21;
    v59 = v12;
    objc_msgSend__performBlockOnObservers_(self, v53, (uint64_t)v57, v54, v55);

  }
  else
  {
    AXTTSLogResourceManager();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      sub_1A3AB1F64();

  }
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[4];
  id v55;
  id v56;
  float v57;
  uint8_t buf[4];
  const __CFString *v59;
  __int16 v60;
  double v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  objc_msgSend_assetId(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resourceWithAssetId_(self, v17, (uint64_t)v16, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend_properties(v11, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v25, v26, (uint64_t)CFSTR("VoiceId"), v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_properties(v11, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v34, v35, (uint64_t)CFSTR("VoiceId"), v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resourceWithVoiceId_(self, v39, (uint64_t)v38, v40, v41);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }
  }
  v42 = (float)a5 / (float)a6;
  AXTTSLogResourceManager();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_voiceId(v20, v44, v45, v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)v48;
    v50 = CFSTR("Sample");
    if (v48)
      v50 = (const __CFString *)v48;
    *(_DWORD *)buf = 138543618;
    v59 = v50;
    v60 = 2050;
    v61 = v42;
    _os_log_impl(&dword_1A3940000, v43, OS_LOG_TYPE_INFO, "DL progress: %{public}@ %{public}f", buf, 0x16u);

  }
  if (v20)
  {
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = sub_1A397A8F4;
    v54[3] = &unk_1E4AA0B48;
    v55 = v20;
    v57 = v42;
    v56 = v11;
    objc_msgSend__performBlockOnObservers_(self, v51, (uint64_t)v54, v52, v53);

  }
}

- (id)_refreshSiriResources:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  __CFString *v110;
  uint64_t v111;
  __CFString *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  __CFString *v118;
  __CFString *v119;
  TTSAXResource *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const __CFString *v140;
  unint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  NSObject *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  NSObject *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  NSObject *v183;
  _BOOL4 v184;
  NSObject *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  void *v192;
  _BOOL4 v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  uint64_t v201;
  id v202;
  void *v203;
  uint64_t v204;
  void *context;
  void *contexta;
  uint8_t v207;
  char v208[15];
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  uint8_t buf[4];
  unint64_t v218;
  __int16 v219;
  void *v220;
  __int16 v221;
  void *v222;
  _QWORD v223[7];
  _QWORD v224[7];
  _BYTE v225[128];
  _BYTE v226[128];
  uint64_t v227;

  v3 = a3;
  v227 = *MEMORY[0x1E0C80C00];
  AXTTSLogResourceManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v218 = v3;
    _os_log_impl(&dword_1A3940000, v4, OS_LOG_TYPE_INFO, "Will find Siri resources. onlyInstalled=%ld", buf, 0xCu);
  }

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12, v13);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v14, v15, v16, v17);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v18, v19, v20, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend_installedAssetsForLanguage_voiceType_(TTSSiriAssetManager, v22, 0, 4, v23);
  else
    objc_msgSend_assetsForLanguage_voiceType_(TTSSiriAssetManager, v22, 0, 4, v23);
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_installedAssetsForLanguage_voiceType_(TTSSiriAssetManager, v26, 0, 2, v27, self);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend_mutableCopy(v28, v29, v30, v31, v32);

  v195 = (void *)v9;
  v196 = (void *)v25;
  v193 = v3;
  v203 = v33;
  if (v3)
  {
    if (TTSSupportsNeuralVoices())
    {
      objc_msgSend_installedAssetsForLanguage_voiceType_(TTSSiriAssetManager, v37, 0, 5, v38);
      v197 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v197 = 0;
    }
  }
  else
  {
    objc_msgSend_ax_flatMappedArrayUsingBlock_(v33, v34, (uint64_t)&unk_1E4A9D408, v35, v36);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)MEMORY[0x1A8597054]();
    objc_msgSend_assetsForLanguage_voiceType_(TTSSiriAssetManager, v40, 0, 2, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v213 = 0u;
    v214 = 0u;
    v215 = 0u;
    v216 = 0u;
    v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v213, (uint64_t)v226, 16);
    if (v44)
    {
      v49 = v44;
      v50 = *(_QWORD *)v214;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v214 != v50)
            objc_enumerationMutation(v42);
          v52 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * i);
          objc_msgSend_identifier(v52, v45, v46, v47, v48);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend_containsObject_(v39, v54, (uint64_t)v53, v55, v56);

          if ((v57 & 1) == 0)
            objc_msgSend_addObject_(v203, v45, (uint64_t)v52, v47, v48);
        }
        v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v213, (uint64_t)v226, 16);
      }
      while (v49);
    }

    objc_autoreleasePoolPop(context);
    v25 = (uint64_t)v196;
    if ((TTSSupportsNeuralVoices() & 1) != 0)
    {
      objc_msgSend_assetsForLanguage_voiceType_(TTSSiriAssetManager, v58, 0, 5, v59);
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = TTSSupportsNeuralAXVoices();
      v198 = 0;
      v64 = (uint64_t)v203;
      if ((v60 & 1) != 0)
        goto LABEL_70;
LABEL_27:
      if (!v25)
        goto LABEL_29;
      goto LABEL_28;
    }
    v197 = 0;
    LOBYTE(v3) = v193;
  }
  v64 = (uint64_t)v203;
  v60 = TTSSupportsNeuralAXVoices();
  if ((v60 & 1) == 0)
  {
    v198 = 0;
    goto LABEL_27;
  }
  if (v3)
  {
    objc_msgSend_installedAssetsForLanguage_voiceType_(TTSSiriAssetManager, v61, 0, 7, v63);
    v60 = objc_claimAutoreleasedReturnValue();
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend_assetsForLanguage_voiceType_(TTSSiriAssetManager, v61, 0, 7, v63);
  v60 = objc_claimAutoreleasedReturnValue();
LABEL_71:
  v198 = (void *)v60;
  if (v25)
LABEL_28:
    v60 = objc_msgSend_addObjectsFromArray_(v24, v61, v25, v62, v63);
LABEL_29:
  if (v64)
    v60 = objc_msgSend_addObjectsFromArray_(v24, v61, v64, v62, v63);
  if (v197)
    v60 = objc_msgSend_addObjectsFromArray_(v24, v61, (uint64_t)v197, v62, v63);
  if (v198)
    v60 = objc_msgSend_addObjectsFromArray_(v24, v61, (uint64_t)v198, v62, v63);
  v194 = (void *)MEMORY[0x1A8597054](v60);
  v209 = 0u;
  v210 = 0u;
  v211 = 0u;
  v212 = 0u;
  v65 = v24;
  v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v209, (uint64_t)v225, 16);
  if (v67)
  {
    v72 = v67;
    v73 = *(_QWORD *)v210;
    v201 = *(_QWORD *)v210;
    v202 = v65;
    do
    {
      v74 = 0;
      v204 = v72;
      do
      {
        if (*(_QWORD *)v210 != v73)
          objc_enumerationMutation(v65);
        v75 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * v74);
        if (v75)
        {
          objc_msgSend_name(*(void **)(*((_QWORD *)&v209 + 1) + 8 * v74), v68, v69, v70, v71);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_length(v76, v77, v78, v79, v80))
          {
            objc_msgSend_identifier(v75, v81, v82, v83, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = objc_msgSend_length(v85, v86, v87, v88, v89);

            if (v90)
            {
              v95 = objc_msgSend_footprint(v75, v91, v92, v93, v94);
              TTSStringForSpeechFootprint(v95);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_lowercaseString(v96, v97, v98, v99, v100);
              v101 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend_footprint(v75, v102, v103, v104, v105) == 4)
              {
                v110 = CFSTR("enhanced");

                v101 = v110;
              }
              objc_msgSend_name(v75, v106, v107, v108, v109);
              v111 = objc_claimAutoreleasedReturnValue();
              v112 = CFSTR("None");
              v117 = objc_msgSend_voiceType(v75, v113, v114, v115, v116);
              v118 = CFSTR("Gryphon");
              if (v117 == 4 || (v118 = CFSTR("SiriNeuralAX"), v117 == 7) || (v118 = CFSTR("SiriNeural"), v117 == 5))
              {
                v119 = v118;

                v112 = v119;
              }
              v120 = [TTSAXResource alloc];
              v224[0] = v111;
              v223[0] = CFSTR("Name");
              v223[1] = CFSTR("VoiceId");
              objc_msgSend_identifier(v75, v121, v122, v123, v124);
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              v224[1] = v125;
              v223[2] = CFSTR("Languages");
              objc_msgSend_languages(v75, v126, v127, v128, v129);
              contexta = (void *)v111;
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              v224[2] = v130;
              v223[3] = CFSTR("Type");
              v135 = objc_msgSend_voiceType(v75, v131, v132, v133, v134);
              v140 = CFSTR("Custom");
              if (v135 != 2)
                v140 = CFSTR("Gryphon");
              v224[3] = v140;
              v224[4] = v112;
              v223[4] = CFSTR("Subtype");
              v223[5] = CFSTR("Footprint");
              v224[5] = v101;
              v223[6] = CFSTR("Gender");
              v141 = objc_msgSend_gender(v75, v136, v137, v138, v139);
              TTSStringForSpeechGender(v141);
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_lowercaseString(v142, v143, v144, v145, v146);
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              v224[6] = v147;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v148, (uint64_t)v224, (uint64_t)v223, 7);
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              v153 = objc_msgSend_initWithData_(v120, v150, (uint64_t)v149, v151, v152);

              objc_msgSend_setVoiceAsset_(v153, v154, (uint64_t)v75, v155, v156);
              if (v153)
              {
                v73 = v201;
                v65 = v202;
                v72 = v204;
                if (objc_msgSend_type(v153, v157, v158, v159, v160) == 3)
                {
                  objc_msgSend_addObject_(v200, v161, (uint64_t)v153, v163, v164);
                }
                else if (objc_msgSend_type(v153, v161, v162, v163, v164) == 10)
                {
                  objc_msgSend_addObject_(v199, v170, (uint64_t)v153, v171, v172);
                }
              }
              else
              {
                v73 = v201;
                v65 = v202;
                v72 = v204;
              }
              goto LABEL_63;
            }
          }
          else
          {

          }
          AXTTSLogResourceManager();
          v165 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_name(v75, v166, v167, v168, v169);
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_identifier(v75, v174, v175, v176, v177);
            v178 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v218 = (unint64_t)v173;
            v219 = 2112;
            v220 = v178;
            v221 = 2112;
            v222 = v75;
            _os_log_error_impl(&dword_1A3940000, v165, OS_LOG_TYPE_ERROR, "Error: TTSAsset had nil name %@ or identifier %@. Asset: %@", buf, 0x20u);

          }
          v153 = 0;
        }
        else
        {
          AXTTSLogResourceManager();
          v153 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
            sub_1A3AB2040(&v207, v208, v153);
        }
LABEL_63:

        ++v74;
      }
      while (v72 != v74);
      v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v68, (uint64_t)&v209, (uint64_t)v225, 16);
    }
    while (v72);
  }

  objc_autoreleasePoolPop(v194);
  objc_msgSend_setObject_forKey_(v195, v179, (uint64_t)v200, (uint64_t)CFSTR("Gryphon"), v180);
  objc_msgSend_setObject_forKey_(v195, v181, (uint64_t)v199, (uint64_t)CFSTR("Custom"), v182);
  AXTTSLogResourceManager();
  v183 = objc_claimAutoreleasedReturnValue();
  v184 = os_log_type_enabled(v183, OS_LOG_TYPE_INFO);

  if (v184)
  {
    AXTTSLogResourceManager();
    v185 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v185, OS_LOG_TYPE_INFO))
    {
      objc_msgSend__debugCountSummaryForResources_(v192, v186, (uint64_t)v195, v187, v188);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v218 = v193;
      v219 = 2112;
      v220 = v189;
      _os_log_impl(&dword_1A3940000, v185, OS_LOG_TYPE_INFO, "Returning Siri resources (onlyInstalled=%ld): %@", buf, 0x16u);

    }
  }

  return v195;
}

- (id)_findAndSwapLegacyMacinTalkAssetsForMacinTalkResources:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int isAssetCatalogInstalled;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  char isEqualToString;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __CFString *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  __CFString *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  TTSAXResource *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  __CFString *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v109;
  id v110;
  uint64_t v111;
  id obj;
  _QWORD v113[4];
  __CFString *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint8_t buf[4];
  uint64_t v120;
  _QWORD v121[6];
  _QWORD v122[6];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXTTSLogResourceManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3940000, v5, OS_LOG_TYPE_INFO, "Will find Macintalk resources", buf, 2u);
  }

  v14 = (void *)objc_msgSend_mutableCopy(v4, v6, v7, v8, v9);
  if (!v14)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)MEMORY[0x1A8597054]();
  objc_msgSend_legacyMacinTalkAssetController(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  isAssetCatalogInstalled = objc_msgSend_isAssetCatalogInstalled(v20, v21, v22, v23, v24);

  if (isAssetCatalogInstalled)
  {
    v109 = v15;
    v110 = v4;
    objc_msgSend_legacyMacinTalkAssetController(self, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_refreshWithoutCatalogUpdateSynchronously(v30, v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    obj = v35;
    v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v115, (uint64_t)v123, 16);
    if (v37)
    {
      v42 = v37;
      v43 = *(_QWORD *)v116;
      v111 = *(_QWORD *)v116;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v116 != v43)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
          objc_msgSend_localURL(v45, v38, v39, v40, v41);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            objc_msgSend_properties(v45, v38, v39, v40, v41);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v47, v48, (uint64_t)CFSTR("Name"), v49, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v51, v52, (uint64_t)CFSTR("Alex"), v53, v54);

            v60 = CFSTR("com.apple.speech.synthesis.voice.Alex");
            if ((isEqualToString & 1) == 0)
            {
              objc_msgSend_properties(v45, v56, v57, v58, v59);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v61, v62, (uint64_t)CFSTR("VoiceId"), v63, v64);
              v60 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            v113[0] = MEMORY[0x1E0C809B0];
            v113[1] = 3221225472;
            v113[2] = sub_1A397B7E8;
            v113[3] = &unk_1E4AA0980;
            v114 = v60;
            v65 = v60;
            v69 = objc_msgSend_indexOfObjectPassingTest_(v14, v66, (uint64_t)v113, v67, v68);
            if (v69 == 0x7FFFFFFFFFFFFFFFLL
              || (objc_msgSend_objectAtIndex_(v14, v70, v69, v71, v72),
                  (v73 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              v78 = [TTSAXResource alloc];
              v121[0] = CFSTR("Name");
              objc_msgSend_properties(v45, v79, v80, v81, v82);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v83, v84, (uint64_t)CFSTR("Name"), v85, v86);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v122[0] = v87;
              v122[1] = v65;
              v121[1] = CFSTR("VoiceId");
              v121[2] = CFSTR("Languages");
              v122[2] = &unk_1E4ABC6D8;
              v122[3] = CFSTR("MacinTalk");
              v121[3] = CFSTR("Type");
              v121[4] = CFSTR("Subtype");
              v121[5] = CFSTR("Footprint");
              v122[4] = CFSTR("None");
              v122[5] = CFSTR("enhanced");
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v88, (uint64_t)v122, (uint64_t)v121, 6);
              v89 = v65;
              v90 = v42;
              v91 = v14;
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = (void *)objc_msgSend_initWithData_(v78, v93, (uint64_t)v92, v94, v95);

              v14 = v91;
              v42 = v90;
              v65 = v89;

              v43 = v111;
              objc_msgSend_setAxAsset_(v77, v96, (uint64_t)v45, v97, v98);
              objc_msgSend_addObject_(v14, v99, (uint64_t)v77, v100, v101);
            }
            else
            {
              v77 = v73;
              objc_msgSend_setAxAsset_(v73, v74, (uint64_t)v45, v75, v76);
            }

          }
        }
        v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v115, (uint64_t)v123, 16);
      }
      while (v42);
    }

    v15 = v109;
    v4 = v110;
  }
  objc_autoreleasePoolPop(v15);
  AXTTSLogResourceManager();
  v102 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
  {
    v107 = objc_msgSend_count(v14, v103, v104, v105, v106);
    *(_DWORD *)buf = 134217984;
    v120 = v107;
    _os_log_impl(&dword_1A3940000, v102, OS_LOG_TYPE_INFO, "Did find %ld Macintalk resources", buf, 0xCu);
  }

  return v14;
}

- (void)_downloadLegacyResourceForTesting:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int hasPrefix;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXTTSLogResourceManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v4;
    _os_log_impl(&dword_1A3940000, v5, OS_LOG_TYPE_INFO, "Will download legacy resource for testing: %@", buf, 0xCu);
  }

  objc_msgSend_voiceId(v4, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  hasPrefix = objc_msgSend_hasPrefix_(v10, v11, (uint64_t)CFSTR("com.apple.speech.synthesis.voice"), v12, v13);

  if (hasPrefix)
  {
    objc_msgSend_legacyMacinTalkAssetController(self, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend_type(v4, v15, v16, v17, v18) != 6)
      goto LABEL_9;
    objc_msgSend_legacyCombinedVocalizerAssetController(self, v20, v21, v22, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = v19;
  if (v19)
  {
    v25 = objc_initWeak((id *)buf, v19);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = sub_1A397BAE4;
    v52[3] = &unk_1E4AA0B90;
    v53 = v4;
    objc_copyWeak(&v54, (id *)buf);
    objc_msgSend_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion_(v24, v26, 1, 1, (uint64_t)&unk_1E4ABC948, v52);

    objc_destroyWeak(&v54);
    objc_destroyWeak((id *)buf);
LABEL_11:

    goto LABEL_12;
  }
LABEL_9:
  if (objc_msgSend_type(v4, v20, v21, v22, v23) == 7)
  {
    objc_msgSend_primaryLanguage(v4, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_gender(v4, v32, v33, v34, v35);
    v41 = objc_msgSend_footprint(v4, v37, v38, v39, v40);
    objc_msgSend_name(v4, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetForLanguage_gender_footprint_voiceName_voiceType_(TTSSiriAssetManager, v47, (uint64_t)v31, v36, v41, v46, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = sub_1A397BDEC;
    v50[3] = &unk_1E4AA0BB8;
    v50[4] = self;
    v51 = v4;
    objc_msgSend_downloadAsset_progressHandler_(TTSSiriAssetManager, v48, (uint64_t)v24, (uint64_t)v50, v49);

    goto LABEL_11;
  }
LABEL_12:

}

- (void)purgeLegacyResourceCache
{
  TTSPreferencesSetValueForKey(CFSTR("AllAvailableVoicesPreference"), 0);
  TTSPreferencesSetValueForKey(CFSTR("AXSExtantVoicesPreference"), 0);
}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
  objc_storeStrong((id *)&self->_assetController, a3);
}

- (void)setLegacyCombinedVocalizerAssetController:(id)a3
{
  objc_storeStrong((id *)&self->_legacyCombinedVocalizerAssetController, a3);
}

- (AXAssetController)legacyMacinTalkAssetController
{
  return self->_legacyMacinTalkAssetController;
}

- (void)setLegacyMacinTalkAssetController:(id)a3
{
  objc_storeStrong((id *)&self->_legacyMacinTalkAssetController, a3);
}

- (AXAssetsService)assetsService
{
  return self->_assetsService;
}

- (void)setAssetsService:(id)a3
{
  objc_storeStrong((id *)&self->_assetsService, a3);
}

- (void)setAllAvailableLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_allAvailableLanguages, a3);
}

- (void)setSamplesAsset:(id)a3
{
  objc_storeStrong((id *)&self->_samplesAsset, a3);
}

- (void)setCatalogBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_catalogBuildVersion, a3);
}

- (BOOL)downloadingSamples
{
  return self->_downloadingSamples;
}

- (void)setDownloadingSamples:(BOOL)a3
{
  self->_downloadingSamples = a3;
}

- (OS_dispatch_queue)preferenceWriteQueue
{
  return self->_preferenceWriteQueue;
}

- (void)setPreferenceWriteQueue:(id)a3
{
  objc_storeStrong((id *)&self->_preferenceWriteQueue, a3);
}

- (void)setAssetLoadingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assetLoadingQueue, a3);
}

- (OS_dispatch_queue)siriServiceQueue
{
  return self->_siriServiceQueue;
}

- (void)setSiriServiceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_siriServiceQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriServiceQueue, 0);
  objc_storeStrong((id *)&self->_assetLoadingQueue, 0);
  objc_storeStrong((id *)&self->_preferenceWriteQueue, 0);
  objc_storeStrong((id *)&self->_catalogBuildVersion, 0);
  objc_storeStrong((id *)&self->_samplesAsset, 0);
  objc_storeStrong((id *)&self->_allAvailableLanguages, 0);
  objc_storeStrong((id *)&self->_assetsService, 0);
  objc_storeStrong((id *)&self->_legacyMacinTalkAssetController, 0);
  objc_storeStrong((id *)&self->_legacyCombinedVocalizerAssetController, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_resourcesByAssetId, 0);
  objc_storeStrong((id *)&self->_resourcesById, 0);
}

@end
