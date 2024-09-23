@implementation TTSAXResourceMigrationUtilities

- (TTSAXResourceMigrationUtilities)init
{
  TTSAXResourceMigrationUtilities *v2;
  AXAssetsService *v3;
  AXAssetsService *assetsService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TTSAXResourceMigrationUtilities;
  v2 = -[TTSAXResourceMigrationUtilities init](&v6, sel_init);
  if (v2)
  {
    v3 = (AXAssetsService *)objc_alloc_init(MEMORY[0x1E0CF2D88]);
    assetsService = v2->_assetsService;
    v2->_assetsService = v3;

  }
  return v2;
}

- (id)_remapGenderedSiriVoiceIdentifiers:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  unsigned int hasPrefix;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  int hasSuffix;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _BOOL4 v86;
  char v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _BOOL4 v101;
  char v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  char isEqualToString;
  uint64_t v126;
  id v127;
  NSObject *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v135;
  void *v136;
  void *v137;
  unint64_t v138;
  int v139;
  int v140;
  void *v141;
  void *v142;
  id obj;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t v151;
  uint8_t v152[128];
  __int128 buf;
  Class (*v154)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v155;
  uint64_t *v156;
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (qword_1ED1B5BB0 != -1)
    dispatch_once(&qword_1ED1B5BB0, &unk_1E4A9DA70);
  hasPrefix = objc_msgSend_hasPrefix_(v6, v3, qword_1ED1B5B98, v4, v5);
  v140 = objc_msgSend_hasPrefix_(v6, v8, qword_1ED1B5B90, v9, v10);
  v14 = objc_msgSend_hasPrefix_(v6, v11, qword_1ED1B5BA8, v12, v13);
  v139 = objc_msgSend_hasPrefix_(v6, v15, qword_1ED1B5BA0, v16, v17);
  v138 = __PAIR64__(v14, hasPrefix);
  v21 = hasPrefix | v14;
  if (((hasPrefix | v14) & 1) == 0 && (v140 & 1) == 0 && !v139)
    goto LABEL_55;
  v136 = v6;
  objc_msgSend_componentsSeparatedByString_(v6, v18, (uint64_t)CFSTR("_"), v19, v20);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v137, v22, v23, v24, v25) != 4)
  {
    v127 = v6;

    goto LABEL_56;
  }
  objc_msgSend_objectAtIndexedSubscript_(v137, v26, 2, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v137, v30, 3, v31, v32);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = 0;
  v149 = &v148;
  v150 = 0x2050000000;
  v37 = (void *)qword_1EE6D5638;
  v151 = qword_1EE6D5638;
  if (!qword_1EE6D5638)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v154 = sub_1A39568F8;
    v155 = &unk_1E4A9FC10;
    v156 = &v148;
    sub_1A39568F8((uint64_t)&buf, v33, v34, v35, v36);
    v37 = (void *)v149[3];
  }
  v38 = objc_retainAutorelease(v37);
  _Block_object_dispose(&v148, 8);
  objc_msgSend_sharedInstance(v38, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v43;
  if (v21)
    objc_msgSend_voiceNamesForOutputLanguageCode_gender_(v43, v44, (uint64_t)v29, 1, v45);
  else
    objc_msgSend_voiceNamesForOutputLanguageCode_gender_(v43, v44, (uint64_t)v29, 2, v45);
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  objc_msgSend_sharedInstance(TTSAXResourceManager, v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allVoices_(v51, v52, 0, v53, v54);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v144, (uint64_t)v152, 16);
  if (!v60)
    goto LABEL_54;
  v61 = *(_QWORD *)v145;
  v135 = v138 ^ 0x100000001;
  while (2)
  {
    v62 = 0;
    do
    {
      if (*(_QWORD *)v145 != v61)
        objc_enumerationMutation(obj);
      v63 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v62);
      objc_msgSend_language(v63, v56, v57, v58, v59, v135);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v64, v65, (uint64_t)v29, v66, v67) & 1) == 0)
      {

        goto LABEL_27;
      }
      objc_msgSend_identifier(v63, v68, v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      hasSuffix = objc_msgSend_hasSuffix_(v72, v73, (uint64_t)v142, v74, v75);

      if (!hasSuffix)
        goto LABEL_27;
      objc_msgSend_identifier(v63, v56, v57, v58, v59);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_hasPrefix_(v77, v78, (uint64_t)CFSTR("com.apple.ttsbundle.gryphon"), v79, v80))
        goto LABEL_31;
      if (!v139)
      {
        if (HIDWORD(v138))
          goto LABEL_30;
LABEL_31:
        v86 = 0;
        goto LABEL_32;
      }
      v85 = objc_msgSend_gender(v63, v81, v82, v83, v84);
      v86 = v85 == 2;
      if (v85 == 2)
        v87 = 1;
      else
        v87 = BYTE4(v135);
      if ((v87 & 1) == 0)
LABEL_30:
        v86 = objc_msgSend_gender(v63, v81, v82, v83, v84) == 1;
LABEL_32:

      objc_msgSend_identifier(v63, v88, v89, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_hasPrefix_(v92, v93, (uint64_t)CFSTR("com.apple.ttsbundle.siri"), v94, v95))
        goto LABEL_41;
      if (!v140)
      {
        if ((_DWORD)v138)
          goto LABEL_40;
LABEL_41:
        v101 = 0;
        goto LABEL_42;
      }
      v100 = objc_msgSend_gender(v63, v96, v97, v98, v99);
      v101 = v100 == 2;
      if (v100 == 2)
        v102 = 1;
      else
        v102 = v135;
      if ((v102 & 1) == 0)
LABEL_40:
        v101 = objc_msgSend_gender(v63, v96, v97, v98, v99) == 1;
LABEL_42:

      if (v86)
      {
        if (!objc_msgSend_count(v141, v56, v57, v58, v59))
          goto LABEL_51;
        objc_msgSend_name(v63, v103, v104, v105, v106);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v107, v108, v109, v110, v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v141, v113, 0, v114, v115);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v116, v117, v118, v119, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v112, v122, (uint64_t)v121, v123, v124);

        if ((isEqualToString & 1) != 0)
        {
LABEL_51:
          AXLogCommon();
          v128 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v136;
            _os_log_impl(&dword_1A3940000, v128, OS_LOG_TYPE_INFO, "Updated identifier: %@", (uint8_t *)&buf, 0xCu);
          }

          objc_msgSend_identifier(v63, v129, v130, v131, v132);
          v133 = objc_claimAutoreleasedReturnValue();

          v136 = (void *)v133;
          goto LABEL_54;
        }
      }
      else if (v101)
      {
        goto LABEL_51;
      }
LABEL_27:
      ++v62;
    }
    while (v60 != v62);
    v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v56, (uint64_t)&v144, (uint64_t)v152, 16);
    v60 = v126;
    if (v126)
      continue;
    break;
  }
LABEL_54:

  v6 = v136;
LABEL_55:
  v127 = v6;
LABEL_56:

  return v127;
}

- (id)convertIdentifierIfNeeded:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
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
  int isInstalled;
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
  int v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  int hasPrefix;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  NSObject *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  __CFString *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint8_t buf[4];
  __CFString *v122;
  __int16 v123;
  void *v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    return 0;
  v5 = v4;
  if (!TTSIsInternalBuild()
    || !objc_msgSend_hasPrefix_(v5, v6, (uint64_t)CFSTR("com.apple.maui.voice"), v7, v8))
  {
    goto LABEL_11;
  }
  if (objc_msgSend_containsString_(v5, v6, (uint64_t)CFSTR("premium"), v7, v8))
  {
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v9, (uint64_t)CFSTR("premium"), (uint64_t)CFSTR("enhanced"), v11);
LABEL_9:
    v15 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v15;
    goto LABEL_10;
  }
  if (objc_msgSend_containsString_(v5, v9, (uint64_t)CFSTR("high"), v10, v11))
  {
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v13, (uint64_t)CFSTR("high"), (uint64_t)CFSTR("premium"), v14);
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v13, (uint64_t)CFSTR(".maui."), (uint64_t)CFSTR("."), v14);
  v16 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v16;
LABEL_11:
  objc_msgSend__remapGenderedSiriVoiceIdentifiers_(self, v6, (uint64_t)v5, v7, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (__CFString *)objc_msgSend_copy(v17, v18, v19, v20, v21);
  if (!objc_msgSend_hasPrefix_(v22, v23, (uint64_t)CFSTR("com.apple.ttsbundle"), v24, v25))
    goto LABEL_19;
  objc_msgSend_updatedIdentifierForLegacyIdentifier_withLanguageCode_(self, v26, (uint64_t)v22, 0, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasSuffix_(v17, v30, (uint64_t)CFSTR("compact"), v31, v32))
    goto LABEL_13;
  if (!objc_msgSend_hasSuffix_(v17, v33, (uint64_t)CFSTR("premium"), v34, v35))
    goto LABEL_18;
  objc_msgSend_sharedInstance(TTSAXResourceManager, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resourceWithVoiceId_(v41, v42, (uint64_t)v29, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  isInstalled = objc_msgSend_isInstalled(v45, v46, v47, v48, v49);

  if (isInstalled)
  {
LABEL_13:
    v36 = v29;
  }
  else
  {
    objc_msgSend_sharedInstance(TTSAXResourceManager, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resourceWithVoiceId_(v55, v56, (uint64_t)v22, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend_isInstalled(v59, v60, v61, v62, v63);

    if ((v64 & 1) != 0)
      goto LABEL_18;
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v22, v65, (uint64_t)CFSTR("premium"), (uint64_t)CFSTR("compact"), v66);
    v118 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_updatedIdentifierForLegacyIdentifier_withLanguageCode_(self, v119, v118, 0, v120);
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v22 = (__CFString *)v118;
  }

  v22 = v36;
LABEL_18:

LABEL_19:
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v26, (uint64_t)CFSTR("%@.compact"), v27, v28, CFSTR("com.apple.voice"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  hasPrefix = objc_msgSend_hasPrefix_(v22, v68, (uint64_t)v67, v69, v70);

  if (!hasPrefix)
    goto LABEL_27;
  objc_msgSend_sharedInstance(TTSAXResourceManager, v72, v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resourceWithVoiceId_(v76, v77, (uint64_t)v22, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_isInstalled(v80, v81, v82, v83, v84))
  {
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v22, v85, (uint64_t)CFSTR(".compact."), (uint64_t)CFSTR(".super-compact."), v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedInstance(TTSAXResourceManager, v88, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resourceWithVoiceId_(v92, v93, (uint64_t)v87, v94, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend_isInstalled(v96, v97, v98, v99, v100);

    if ((v101 & 1) != 0)
    {
      AXTTSLogResourceMigration();
      v102 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v122 = v22;
        v123 = 2112;
        v124 = v87;
        _os_log_impl(&dword_1A3940000, v102, OS_LOG_TYPE_INFO, "Compact resource is not installed, falling back to on disk super-compact variant %@ => %@", buf, 0x16u);
      }

      goto LABEL_33;
    }

LABEL_27:
    if (objc_msgSend_isEqualToString_(v17, v72, (uint64_t)CFSTR("com.apple.speech.voice.Alex"), v74, v75))
    {

      v22 = CFSTR("com.apple.speech.synthesis.voice.Alex");
    }
    objc_msgSend_sharedInstance(TTSAXResourceManager, v103, v104, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resourceWithVoiceId_(v107, v108, (uint64_t)v22, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend_isInstalled(v111, v112, v113, v114, v115);

    if ((v116 & 1) != 0)
    {
      v117 = v22;
      v22 = v117;
    }
    else
    {
      v117 = v17;
    }
    v87 = v117;
    goto LABEL_33;
  }
  v22 = v22;

  v87 = v22;
LABEL_33:

  return v87;
}

+ (id)sharedInstance
{
  if (qword_1ED1B5CB0 != -1)
    dispatch_once(&qword_1ED1B5CB0, &unk_1E4A9F2A8);
  return (id)qword_1ED1B5CA0;
}

- (BOOL)isMigrationComplete
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  if (self->_isMigrationComplete)
    return 1;
  objc_msgSend__readVoiceIdentifiersToMigrateFromPreferences(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v7, v8, v9, v10, v11))
  {
    self->_isMigrationComplete = 0;
  }
  else
  {
    objc_msgSend__readIsMigrationCompleteFromPreferences(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isMigrationComplete = objc_msgSend_isEqualToNumber_(v16, v17, (uint64_t)&unk_1E4ABC750, v18, v19);

  }
  return self->_isMigrationComplete;
}

- (void)restartMigrationIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char isMigrationComplete;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];
  uint8_t buf[16];

  isMigrationComplete = objc_msgSend_isMigrationComplete(self, a2, v2, v3, v4);
  AXTTSLogResourceMigration();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if ((isMigrationComplete & 1) != 0)
  {
    if (v8)
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1A3940000, v7, OS_LOG_TYPE_INFO, "Migration is complete, no need to restart.", v17, 2u);
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3940000, v7, OS_LOG_TYPE_INFO, "Migration is not complete, attempting to complete now.", buf, 2u);
    }

    objc_msgSend_assetsService(self, v9, v10, v11, v12);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_restartTTSResourceMigration(v7, v13, v14, v15, v16);
  }

}

- (id)updatedIdentifierForLegacyIdentifier:(id)a3 withLanguageCode:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
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
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int isEqualToString;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  void *v127;
  NSObject *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  NSObject *v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const __CFString *v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v148;
  void *v149;
  void *v150;
  uint8_t buf[4];
  id v152;
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v10 = a4;
  if (v6)
  {
    if ((objc_msgSend_isEqualToString_(v6, v7, (uint64_t)CFSTR("com.apple.speech.voice.Alex"), v8, v9) & 1) != 0)
    {
      v15 = CFSTR("com.apple.speech.synthesis.voice.Alex");
      goto LABEL_40;
    }
    objc_msgSend_lowercaseString(v6, v11, v12, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_containsObject_(&unk_1E4ABC660, v18, (uint64_t)v17, v19, v20);

    if (v21)
    {
      v15 = (__CFString *)v6;
      goto LABEL_40;
    }
    objc_msgSend_obsoleteVoicesWithReplacements(self, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v6, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v26, v32, (uint64_t)v31, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v15 = v35;
LABEL_39:

      goto LABEL_40;
    }
    objc_msgSend_sharedInstance(TTSRegexCache, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_regexForString_atStart_(v40, v41, (uint64_t)CFSTR("com\\.apple\\.ttsbundle\\.(?<name>[^.]*)\\-(?<quality>premium|compact|Premium|Compact)$"), 1, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = objc_msgSend_length(v6, v44, v45, v46, v47);
    objc_msgSend_firstMatchInString_options_range_(v43, v49, (uint64_t)v6, 2, 0, v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_numberOfRanges(v50, v51, v52, v53, v54))
    {
      v15 = (__CFString *)v6;
LABEL_38:

      goto LABEL_39;
    }
    v58 = objc_msgSend_rangeWithName_(v50, v55, (uint64_t)CFSTR("name"), v56, v57);
    v60 = (uint64_t)v59;
    v63 = objc_msgSend_rangeWithName_(v50, v59, (uint64_t)CFSTR("quality"), v61, v62);
    v65 = (uint64_t)v64;
    objc_msgSend_substringWithRange_(v6, v64, v58, v60, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringWithRange_(v6, v68, v63, v65, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v70, v71, v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_containsString_(v67, v76, (uint64_t)CFSTR("-"), v77, v78))
    {
      objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v67, v79, (uint64_t)CFSTR("-"), (uint64_t)&stru_1E4AA5CE8, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lowercaseString(v82, v83, v84, v85, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_capitalizedString(v87, v88, v89, v90, v91);
      v92 = objc_claimAutoreleasedReturnValue();

      v67 = (void *)v92;
    }
    isEqualToString = objc_msgSend_isEqualToString_(v75, v79, (uint64_t)CFSTR("compact"), v80, v81);
    if (v10 && isEqualToString)
    {
      objc_msgSend_sharedInstance(TTSLocaleUtilities, v94, v95, v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_defaultVoiceIdentifierForGeneralLanguageCode_(v98, v99, (uint64_t)v10, v100, v101);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
LABEL_37:

        goto LABEL_38;
      }
    }
    else if (!v10)
    {
      objc_msgSend_sharedInstance(TTSAXResourceManager, v94, v95, v96, v97);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_languageCodeForResourceName_withType_(v107, v108, (uint64_t)v67, 4, v109);
      v106 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    v106 = v10;
LABEL_22:
    _BuiltInVoiceNameForLanguage((uint64_t)v106, v102, v103, v104, v105);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = v50;
    v149 = v43;
    v150 = v110;
    v114 = v75;
    if (v110)
    {
      if ((objc_msgSend_isEqualToString_(v110, v111, (uint64_t)v67, v112, v113) & 1) == 0)
      {
        objc_msgSend_sharedInstance(TTSAXResourceManager, v115, v116, v117, v118);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_languageCodeForResourceName_withType_(v119, v120, (uint64_t)v67, 4, v121);
        v122 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend_isEqualToString_(v106, v123, (uint64_t)v122, v124, v125) & 1) == 0)
        {
          v126 = v150;

          v67 = v126;
        }

      }
      v127 = v106;
    }
    else
    {
      AXTTSLogResourceMigration();
      v128 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v152 = v106;
        _os_log_impl(&dword_1A3940000, v128, OS_LOG_TYPE_INFO, "No voice found for language code: %@. Attempting to find fallback language.", buf, 0xCu);
      }

      objc_msgSend_sharedInstance(TTSAXResourceManager, v129, v130, v131, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_languageCodeForResourceName_withType_(v133, v134, (uint64_t)v67, 4, v135);
      v127 = (void *)objc_claimAutoreleasedReturnValue();

      AXTTSLogResourceMigration();
      v136 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v152 = v127;
        _os_log_impl(&dword_1A3940000, v136, OS_LOG_TYPE_INFO, "Found fallback language code: %@", buf, 0xCu);
      }

    }
    v137 = (void *)MEMORY[0x1E0CB3940];
    v75 = v114;
    if (objc_msgSend_isEqualToString_(v114, v115, (uint64_t)CFSTR("compact"), v117, v118))
      v142 = CFSTR("compact");
    else
      v142 = CFSTR("enhanced");
    objc_msgSend_capitalizedString(v67, v138, v139, v140, v141);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v137, v144, (uint64_t)CFSTR("%@.%@.%@.%@"), v145, v146, CFSTR("com.apple.voice"), v142, v127, v143);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v50 = v148;
    v43 = v149;
    goto LABEL_37;
  }
  AXTTSLogResourceMigration();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_1A3AAFFF8();

  v15 = 0;
LABEL_40:

  return v15;
}

- (id)legacyIdentifierForUpdatedIdentifierDuringMigration:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
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
  uint64_t v30;
  uint64_t v31;
  char isEqualToString;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend__readVoiceIdentifiersToMigrateFromPreferences(self, v5, v6, v7, v8);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        objc_msgSend_objectForKeyedSubscript_(v9, v11, (uint64_t)v17, v12, v13, (_QWORD)v34);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v18, v19, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v4, v24, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v23, v29, (uint64_t)v28, v30, v31);

        if ((isEqualToString & 1) != 0)
        {
          v14 = v17;
          goto LABEL_11;
        }
      }
      v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v34, (uint64_t)v38, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_11:

  return v14;
}

- (void)downloadCompactResourceIfNeededForIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int hasPrefix;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
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
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char isInstalled;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("%@.%@"), v6, v7, CFSTR("com.apple.voice"), CFSTR("compact"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  hasPrefix = objc_msgSend_hasPrefix_(v4, v9, (uint64_t)v8, v10, v11);

  if (hasPrefix)
  {
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v4, v13, (uint64_t)CFSTR(".compact."), (uint64_t)CFSTR(".super-compact."), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedInstance(TTSAXResourceManager, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resourceWithVoiceId_(v20, v21, (uint64_t)v4, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sharedInstance(TTSAXResourceManager, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resourceWithVoiceId_(v29, v30, (uint64_t)v15, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isInstalled(v33, v34, v35, v36, v37))
    {
      isInstalled = objc_msgSend_isInstalled(v24, v38, v39, v40, v41);

      if ((isInstalled & 1) == 0)
      {
        AXTTSLogResourceMigration();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v15;
          _os_log_impl(&dword_1A3940000, v43, OS_LOG_TYPE_INFO, "Beginning compact identifier download for %@", buf, 0xCu);
        }

        objc_msgSend_assetsService(self, v44, v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_downloadTTSResourceForVoiceId_(v48, v49, (uint64_t)v4, v50, v51);

      }
    }
    else
    {

    }
  }

}

- (void)deleteCompactResourceIfNeededForIdentifier:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int hasPrefix;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("%@.compact"), v5, v6, CFSTR("com.apple.voice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  hasPrefix = objc_msgSend_hasPrefix_(v20, v8, (uint64_t)v7, v9, v10);

  if (hasPrefix)
  {
    objc_msgSend_assetsService(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteCompactResourceIfNeededForIdentifier_(v16, v17, (uint64_t)v20, v18, v19);

  }
}

- (BOOL)resourceNeedsMigration:(id)a3
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
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  objc_msgSend__readVoiceIdentifiersToMigrateFromPreferences(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_voiceId(v4, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend_containsObject_(v14, v20, (uint64_t)v19, v21, v22);
  return (char)v4;
}

- (void)resourceCompletedMigration:(id)a3
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
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;

  v4 = a3;
  objc_msgSend__readVoiceIdentifiersToMigrateFromPreferences(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_mutableCopy(v9, v10, v11, v12, v13);

  if (v4
    && (objc_msgSend_voiceId(v4, v15, v16, v17, v18),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v19))
  {
    objc_msgSend_voiceId(v4, v20, v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v14, v30, (uint64_t)v29, v31, v32);

  }
  else
  {
    AXTTSLogResourceMigration();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      sub_1A3AB00B8();
  }

  AXTTSLogResourceMigration();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    sub_1A3AB0058();

  objc_msgSend_writeVoiceIdentifiersToMigrateToPreferences_(self, v34, (uint64_t)v14, v35, v36);
  if (!objc_msgSend_count(v14, v37, v38, v39, v40))
    objc_msgSend_writeIsMigrationCompleteToPreferences_(self, v41, (uint64_t)&unk_1E4ABC750, v42, v43);

}

- (void)writeIsMigrationCompleteToPreferences:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;

  v6 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], a2, (uint64_t)a3, 1, (uint64_t)&v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (v4)
  {
    AXTTSLogResourceMigration();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1A3AB0134();

  }
  TTSPreferencesSetValueForKey(CFSTR("TTSCachedIsMigrationCompleteKey"), v3);

}

- (id)_readIsMigrationCompleteFromPreferences
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)TTSPreferencesCopyValueForKey(CFSTR("TTSCachedIsMigrationCompleteKey"));
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3710]);
    v20 = 0;
    v6 = (void *)objc_msgSend_initForReadingFromData_error_(v3, v4, (uint64_t)v2, (uint64_t)&v20, v5);
    v7 = v20;
    if (v7)
    {
      AXTTSLogResourceMigration();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1A3AB0194();
      v9 = 0;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C99E60];
      v21[0] = objc_opt_class();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v21, 1, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(v10, v14, (uint64_t)v13, v15, v16);
      v8 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_decodeObjectOfClasses_forKey_(v6, v17, (uint64_t)v8, *MEMORY[0x1E0CB2CD0], v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)writeVoiceIdentifiersToMigrateToPreferences:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  v3 = a3;
  if ((AXProcessIsAXAssetsd() & 1) != 0)
  {
    v8 = 0;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v4, (uint64_t)v3, 1, (uint64_t)&v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (v6)
    {
      AXTTSLogResourceMigration();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1A3AB01F4();

    }
    TTSPreferencesSetValueForKey(CFSTR("TTSCachedVoiceIdentifiersToMigrateKey"), v5);

  }
  else
  {
    AXTTSLogResourceMigration();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1A3AB0254(v6);
  }

}

- (id)_readVoiceIdentifiersToMigrateFromPreferences
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)TTSPreferencesCopyValueForKey(CFSTR("TTSCachedVoiceIdentifiersToMigrateKey"));
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3710]);
    v20 = 0;
    v6 = (void *)objc_msgSend_initForReadingFromData_error_(v3, v4, (uint64_t)v2, (uint64_t)&v20, v5);
    v7 = v20;
    if (v7)
    {
      AXTTSLogResourceMigration();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1A3AB0294();
      v9 = 0;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C99E60];
      v21[0] = objc_opt_class();
      v21[1] = objc_opt_class();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v21, 2, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(v10, v14, (uint64_t)v13, v15, v16);
      v8 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_decodeObjectOfClasses_forKey_(v6, v17, (uint64_t)v8, *MEMORY[0x1E0CB2CD0], v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSDictionary)obsoleteVoicesWithReplacements
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  TTSAXResourceMigrationUtilities *v5;
  NSDictionary *obsoleteVoicesWithReplacements;
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSDictionary *v68;
  TTSAXResourceMigrationUtilities *v70;
  id obj;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t buf[4];
  void *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v5 = self;
  v92 = *MEMORY[0x1E0C80C00];
  obsoleteVoicesWithReplacements = self->_obsoleteVoicesWithReplacements;
  if (!obsoleteVoicesWithReplacements)
  {
    objc_msgSend_deprecatedVoicesMap(TTSSiriAssetManager, a2, v2, v3, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v70 = v5;
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9, v10);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      objc_msgSend_allKeys(v11, v12, v13, v14, v15);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v84, (uint64_t)v91, 16);
      if (v73)
      {
        v72 = *(_QWORD *)v85;
        v76 = v11;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v85 != v72)
              objc_enumerationMutation(obj);
            v74 = v20;
            v21 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v20);
            v80 = 0u;
            v81 = 0u;
            v82 = 0u;
            v83 = 0u;
            objc_msgSend_objectForKeyedSubscript_(v11, v17, v21, v18, v19);
            v75 = (id)objc_claimAutoreleasedReturnValue();
            v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v22, (uint64_t)&v80, (uint64_t)v90, 16);
            if (v79)
            {
              v78 = *(_QWORD *)v81;
              do
              {
                v26 = 0;
                do
                {
                  if (*(_QWORD *)v81 != v78)
                    objc_enumerationMutation(v75);
                  v27 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v26);
                  objc_msgSend_objectForKeyedSubscript_(v11, v23, v21, v24, v25);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v28, v29, v27, v30, v31);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v32)
                  {
                    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v33, (uint64_t)CFSTR("%@_%@_%@_premium"), v34, v35, CFSTR("com.apple.ttsbundle.gryphon"), v32, v21);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v37, (uint64_t)CFSTR("%@_%@_%@_premium"), v38, v39, CFSTR("com.apple.ttsbundle.gryphon"), v27, v21);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_lowercaseString(v40, v41, v42, v43, v44);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setObject_forKey_(v77, v46, (uint64_t)v36, (uint64_t)v45, v47);

                    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v48, (uint64_t)CFSTR("%@_%@_%@_premium"), v49, v50, CFSTR("com.apple.ttsbundle.gryphon-neural"), v32, v21);
                    v51 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v52, (uint64_t)CFSTR("%@_%@_%@_premium"), v53, v54, CFSTR("com.apple.ttsbundle.gryphon-neural"), v27, v21);
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_lowercaseString(v55, v56, v57, v58, v59);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setObject_forKey_(v77, v61, (uint64_t)v51, (uint64_t)v60, v62);

                    v11 = v76;
                  }
                  else
                  {
                    AXTTSLogResourceMigration();
                    v51 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v89 = v11;
                      _os_log_error_impl(&dword_1A3940000, v51, OS_LOG_TYPE_ERROR, "SiriTTS returned nil deprecated voices. %@", buf, 0xCu);
                    }
                  }

                  ++v26;
                }
                while (v79 != v26);
                v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v23, (uint64_t)&v80, (uint64_t)v90, 16);
              }
              while (v79);
            }

            ++v20;
          }
          while (v74 + 1 != v73);
          v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v84, (uint64_t)v91, 16);
        }
        while (v73);
      }

      v67 = objc_msgSend_copy(v77, v63, v64, v65, v66);
      v5 = v70;
      v68 = v70->_obsoleteVoicesWithReplacements;
      v70->_obsoleteVoicesWithReplacements = (NSDictionary *)v67;

    }
    obsoleteVoicesWithReplacements = v5->_obsoleteVoicesWithReplacements;
  }
  return obsoleteVoicesWithReplacements;
}

- (void)setObsoleteVoicesWithReplacements:(id)a3
{
  objc_storeStrong((id *)&self->_obsoleteVoicesWithReplacements, a3);
}

- (AXAssetsService)assetsService
{
  return self->_assetsService;
}

- (void)setAssetsService:(id)a3
{
  objc_storeStrong((id *)&self->_assetsService, a3);
}

- (void)setIsMigrationComplete:(BOOL)a3
{
  self->_isMigrationComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsService, 0);
  objc_storeStrong((id *)&self->_obsoleteVoicesWithReplacements, 0);
}

@end
