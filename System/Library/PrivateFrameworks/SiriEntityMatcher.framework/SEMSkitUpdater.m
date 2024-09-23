@implementation SEMSkitUpdater

+ (id)indexName
{
  return CFSTR("SKIT");
}

+ (id)indexDirectory:(id)a3
{
  objc_msgSend_skitDirectoryURL(a3, a2, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)updaterForIndexSite:(id)a3 localization:(id)a4
{
  id v5;
  id v6;
  SEMSkitWriter *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = [SEMSkitWriter alloc];
  objc_msgSend_indexDirectory_(SEMSkitUpdater, v8, (uint64_t)v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_dataProtectionClass(v5, v10, v11);
  v14 = (void *)objc_msgSend_initWithSkitDirectoryURL_dataProtectionClass_flushThreshold_(v7, v13, (uint64_t)v9, v12, 5242880);

  if (v14)
  {
    v15 = objc_alloc((Class)objc_opt_class());
    v17 = (void *)objc_msgSend_initWithIndexSite_localization_writer_(v15, v16, (uint64_t)v5, v6, v14);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (SEMSkitUpdater)initWithIndexSite:(id)a3 localization:(id)a4 writer:(id)a5
{
  id v9;
  id v10;
  id v11;
  SEMSkitUpdater *v12;
  SEMSkitUpdater *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SEMSkitUpdater;
  v12 = -[SEMSkitUpdater init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_indexSite, a3);
    objc_storeStrong((id *)&v13->_writer, a5);
    objc_storeStrong((id *)&v13->_localization, a4);
  }

  return v13;
}

- (BOOL)clear:(id *)a3
{
  int v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend_clearWithError_(self->_writer, a2, (uint64_t)a3);
  if (v5)
  {
    v6 = sub_2462F2B4C();
    v7 = (id)qword_25441F970;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      sub_2462FF658(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[SEMSkitUpdater clear:]";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_2462C4000, v7, OS_LOG_TYPE_INFO, "%s Setting transaction index features: %@", (uint8_t *)&v11, 0x16u);

    }
    LOBYTE(v5) = objc_msgSend_setTransactionIndexFeatures_error_(self->_writer, v9, v6, a3);
  }
  return v5;
}

- (BOOL)commitUpdates:(id *)a3 shouldRebuild:(BOOL *)a4
{
  int v5;
  BOOL v7;

  v7 = 0;
  v5 = objc_msgSend_commitChanges_error_(self->_writer, a2, (uint64_t)&v7, a3);
  if (a4 && v5)
    *a4 = v7;
  return v5;
}

- (BOOL)rollbackUpdates:(id *)a3
{
  return MEMORY[0x24BEDD108](self->_writer, sel_rollbackChanges_, a3);
}

- (BOOL)cleanup:(id *)a3
{
  return objc_msgSend_cleanup_(self->_writer, a2, (uint64_t)a3);
}

- (BOOL)indexUpdatesToSets:(id)a3 changeRegistry:(id)a4 shouldDefer:(id)a5 error:(id *)a6
{
  SEMLocalization *localization;
  const char *v10;
  uint64_t v11;
  const char *v12;
  SEMSkitWriter *writer;
  id *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  SEMIndexSite *indexSite;
  int v21;
  const char *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t i;
  SEMIndexSite *v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  id v40;
  uint64_t *v41;
  NSObject *v42;
  int v43;
  void *v44;
  NSObject *v45;
  SEMIndexSite *v46;
  const __CFString *v47;
  int v48;
  int v49;
  int v50;
  const char *v51;
  SEMIndexSite *v52;
  SEMIndexSite *v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  BOOL v57;
  void *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  SEMIndexSite *v62;
  int v63;
  SEMIndexSite *v65;
  uint64_t v66;
  SEMIndexSite *v67;
  __int128 v68;
  id v69;
  id v70;
  int v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v78;
  _QWORD v79[6];
  id v80;
  id v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t *v86;
  _QWORD v87[4];
  id v88;
  SEMIndexSite *v89;
  uint64_t *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  char v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  id v112;
  id obj;
  id v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  uint8_t buf[4];
  const char *v122;
  __int16 v123;
  SEMIndexSite *v124;
  __int16 v125;
  _BYTE v126[10];
  SEMIndexSite *v127;
  _BYTE v128[6];
  __int16 v129;
  int v130;
  __int16 v131;
  int v132;
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  v69 = a3;
  v78 = a4;
  v76 = a5;
  v115 = 0;
  v116 = &v115;
  v117 = 0x3032000000;
  v118 = sub_2462C6EAC;
  v119 = sub_2462C6EBC;
  v120 = 0;
  localization = self->_localization;
  v114 = 0;
  obj = 0;
  v11 = objc_msgSend_locateMorphunAssetForSiriLanguage_error_(localization, v10, (uint64_t)&v114, &obj);
  v70 = v114;
  objc_storeStrong(&v120, obj);
  if ((unint64_t)(v11 - 1) >= 0x2C)
  {
    v54 = (id)qword_25441F970;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_siriLanguageCode(self->_localization, v55, v56);
      v65 = (SEMIndexSite *)objc_claimAutoreleasedReturnValue();
      v66 = v116[5];
      *(_DWORD *)buf = 136315650;
      v122 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
      v123 = 2112;
      v124 = v65;
      v125 = 2112;
      *(_QWORD *)v126 = v66;
      _os_log_error_impl(&dword_2462C4000, v54, OS_LOG_TYPE_ERROR, "%s Cannot update SKIT without Morphun asset for Siri language: %@ error: %@", buf, 0x20u);

    }
    goto LABEL_33;
  }
  writer = self->_writer;
  v14 = (id *)(v116 + 5);
  v112 = (id)v116[5];
  v15 = objc_msgSend_setTransactionLocale_assetPath_error_(writer, v12, v11, v70, &v112);
  objc_storeStrong(v14, v112);
  v16 = qword_25441F970;
  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v67 = (SEMIndexSite *)v116[5];
      *(_DWORD *)buf = 136315394;
      v122 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
      v123 = 2112;
      v124 = v67;
      _os_log_error_impl(&dword_2462C4000, v16, OS_LOG_TYPE_ERROR, "%s Failed to set SKIT transaction locale. error: %@", buf, 0x16u);
    }
LABEL_33:
    v57 = 0;
    if (a6)
    {
      v58 = (void *)v116[5];
      if (v58)
      {
        v57 = 0;
        *a6 = objc_retainAutorelease(v58);
      }
    }
    goto LABEL_41;
  }
  v17 = (id)qword_25441F970;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    indexSite = self->_indexSite;
    v21 = objc_msgSend_count(v69, v18, v19);
    *(_DWORD *)buf = 136315650;
    v122 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
    v123 = 2112;
    v124 = indexSite;
    v125 = 1024;
    *(_DWORD *)v126 = v21;
    _os_log_impl(&dword_2462C4000, v17, OS_LOG_TYPE_INFO, "%s (%@) Enumerating %u set(s) for updates to SKIT", buf, 0x1Cu);
  }

  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v73 = v69;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v22, (uint64_t)&v108, v133, 16);
  if (v23)
  {
    v71 = 0;
    v72 = 0;
    v74 = *MEMORY[0x24BE155F8];
    v75 = *(_QWORD *)v109;
    *(_QWORD *)&v24 = 136315906;
    v68 = v24;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v109 != v75)
          objc_enumerationMutation(v73);
        v26 = *(SEMIndexSite **)(*((_QWORD *)&v108 + 1) + 8 * i);
        v104 = 0;
        v105 = &v104;
        v106 = 0x2020000000;
        v107 = 1;
        v27 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v122 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
          v123 = 2112;
          v124 = v26;
          _os_log_impl(&dword_2462C4000, v27, OS_LOG_TYPE_INFO, "%s Enumerating set: %@", buf, 0x16u);
        }
        objc_msgSend_descriptorWithKey_(v26, v28, v74, v68);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_value(v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v100 = 0;
        v101 = &v100;
        v102 = 0x2020000000;
        v103 = 0;
        v96 = 0;
        v97 = &v96;
        v98 = 0x2020000000;
        v99 = 0;
        v92 = 0;
        v93 = &v92;
        v94 = 0x2020000000;
        v95 = 0;
        objc_msgSend_bookmarkForSet_(v78, v33, (uint64_t)v26);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_changePublisherWithUseCase_(v26, v35, 0x251784FD0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = MEMORY[0x24BDAC760];
        v87[0] = MEMORY[0x24BDAC760];
        v87[1] = 3221225472;
        v87[2] = sub_2462C6EC4;
        v87[3] = &unk_25175EA48;
        v90 = &v104;
        v88 = v78;
        v89 = v26;
        v91 = &v115;
        v79[0] = v37;
        v79[1] = 3221225472;
        v79[2] = sub_2462C6FB0;
        v79[3] = &unk_25175EA70;
        v81 = v76;
        v82 = &v104;
        v79[4] = self;
        v79[5] = v26;
        v83 = &v100;
        v84 = &v96;
        v85 = &v92;
        v86 = &v115;
        v38 = v32;
        v80 = v38;
        v40 = (id)objc_msgSend_drivableSinkWithBookmark_completion_shouldContinue_(v36, v39, (uint64_t)v34, v87, v79);

        v41 = v116;
        if (*((_BYTE *)v105 + 24) && !v116[5])
        {
          v45 = qword_25441F970;
          if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
          {
            v46 = self->_indexSite;
            v47 = CFSTR("delta");
            if (!v34)
              v47 = CFSTR("full");
            v48 = *((_DWORD *)v101 + 6);
            v49 = *((_DWORD *)v97 + 6);
            v50 = *((_DWORD *)v93 + 6);
            *(_DWORD *)buf = 136316674;
            v122 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
            v123 = 2112;
            v124 = v46;
            v125 = 2112;
            *(_QWORD *)v126 = v47;
            *(_WORD *)&v126[8] = 2112;
            v127 = v26;
            *(_WORD *)v128 = 1024;
            *(_DWORD *)&v128[2] = v48;
            v129 = 1024;
            v130 = v49;
            v131 = 1024;
            v132 = v50;
            _os_log_impl(&dword_2462C4000, v45, OS_LOG_TYPE_INFO, "%s (%@) Completed %@ enumeration for set: %@ with %u added, %u modified, and %u removed shared item(s).", buf, 0x3Cu);
          }
          v71 += *((_DWORD *)v101 + 6);
          LODWORD(v72) = *((_DWORD *)v97 + 6) + v72;
          HIDWORD(v72) += *((_DWORD *)v93 + 6);
          v43 = 1;
        }
        else
        {
          v42 = qword_25441F970;
          if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
          {
            v52 = self->_indexSite;
            v53 = (SEMIndexSite *)v41[5];
            *(_DWORD *)buf = v68;
            v122 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
            v123 = 2112;
            v124 = v52;
            v125 = 2112;
            *(_QWORD *)v126 = v26;
            *(_WORD *)&v126[8] = 2112;
            v127 = v53;
            _os_log_error_impl(&dword_2462C4000, v42, OS_LOG_TYPE_ERROR, "%s (%@) Enumeration for set: %@ aborted: %@", buf, 0x2Au);
            v41 = v116;
          }
          v43 = 0;
          if (a6)
          {
            v44 = (void *)v41[5];
            if (v44)
            {
              v43 = 0;
              *a6 = objc_retainAutorelease(v44);
            }
          }
        }

        _Block_object_dispose(&v92, 8);
        _Block_object_dispose(&v96, 8);
        _Block_object_dispose(&v100, 8);

        _Block_object_dispose(&v104, 8);
        if (!v43)
        {
          v57 = 0;
          v59 = v73;
          goto LABEL_40;
        }
      }
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v51, (uint64_t)&v108, v133, 16);
      if (v23)
        continue;
      break;
    }
  }
  else
  {
    v71 = 0;
    v72 = 0;
  }

  v59 = (id)qword_25441F970;
  v57 = 1;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    v62 = self->_indexSite;
    v63 = objc_msgSend_count(v73, v60, v61);
    *(_DWORD *)buf = 136316418;
    v122 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
    v123 = 2112;
    v124 = v62;
    v125 = 1024;
    *(_DWORD *)v126 = v63;
    *(_WORD *)&v126[4] = 1024;
    *(_DWORD *)&v126[6] = v71;
    LOWORD(v127) = 1024;
    *(_DWORD *)((char *)&v127 + 2) = v72;
    HIWORD(v127) = 1024;
    *(_DWORD *)v128 = HIDWORD(v72);
    v57 = 1;
    _os_log_impl(&dword_2462C4000, v59, OS_LOG_TYPE_INFO, "%s (%@) Completed enumeration for %u set(s) cumulatively producing %u added, %u modified, and %u removed shared item(s) from SKIT", buf, 0x2Eu);
  }
LABEL_40:

LABEL_41:
  _Block_object_dispose(&v115, 8);

  return v57;
}

- (BOOL)isRebuildRequiredWithAllSets:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  SEMSkitWriter *writer;
  char shouldMerge_error;
  id v16;
  NSObject *v17;
  BOOL v18;
  SEMIndexSite *v19;
  NSObject *v20;
  const char *v21;
  SEMIndexSite *indexSite;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  SEMIndexSite *v28;
  char v29;
  void *v30;
  void *v31;
  NSObject *v32;
  SEMIndexSite *v34;
  id v35;
  char v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  SEMIndexSite *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_siriLanguageCode(self->_localization, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_supportedLocaleFromLanguageCode_(SEMLocalization, v5, (uint64_t)v4);
  v9 = objc_msgSend_indexLocale(self->_writer, v7, v8);
  if (v6 != v9)
  {
    v20 = (id)qword_25441F970;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      indexSite = self->_indexSite;
      sub_24630F170(v9, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      sub_24630F170(v6, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v38 = "-[SEMSkitUpdater isRebuildRequiredWithAllSets:]";
      v39 = 2112;
      v40 = indexSite;
      v41 = 2112;
      v42 = v23;
      v43 = 2112;
      v44 = v25;
      v45 = 2112;
      v46 = v4;
      _os_log_impl(&dword_2462C4000, v20, OS_LOG_TYPE_INFO, "%s (%@) SKIT index (locale: %@) inconsistent with Siri setting (locale: %@, language code: %@)", buf, 0x34u);

    }
    goto LABEL_12;
  }
  v10 = sub_2462F2B4C();
  if (objc_msgSend_indexFeatures(self->_writer, v11, v12) != v10)
  {
    v20 = (id)qword_25441F970;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v28 = self->_indexSite;
      v29 = objc_msgSend_indexFeatures(self->_writer, v26, v27);
      sub_2462FF658(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2462FF658(v10);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v38 = "-[SEMSkitUpdater isRebuildRequiredWithAllSets:]";
      v39 = 2112;
      v40 = v28;
      v41 = 2112;
      v42 = v30;
      v43 = 2112;
      v44 = v31;
      _os_log_impl(&dword_2462C4000, v20, OS_LOG_TYPE_INFO, "%s (%@) Prior index features: %@ inconsistent with Trial index features: %@", buf, 0x2Au);

    }
LABEL_12:

    v18 = 1;
    goto LABEL_18;
  }
  v36 = 0;
  writer = self->_writer;
  v35 = 0;
  shouldMerge_error = objc_msgSend_shouldMerge_error_(writer, v13, (uint64_t)&v36, &v35);
  v16 = v35;
  if ((shouldMerge_error & 1) != 0)
  {
    if (v36)
    {
      v17 = qword_25441F970;
      v18 = 1;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        v19 = self->_indexSite;
        *(_DWORD *)buf = 136315394;
        v38 = "-[SEMSkitUpdater isRebuildRequiredWithAllSets:]";
        v39 = 2112;
        v40 = v19;
        _os_log_impl(&dword_2462C4000, v17, OS_LOG_TYPE_INFO, "%s (%@) SKIT merge is required", buf, 0x16u);
      }
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v32 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v34 = self->_indexSite;
      *(_DWORD *)buf = 136315650;
      v38 = "-[SEMSkitUpdater isRebuildRequiredWithAllSets:]";
      v39 = 2112;
      v40 = v34;
      v41 = 2112;
      v42 = v16;
      _os_log_error_impl(&dword_2462C4000, v32, OS_LOG_TYPE_ERROR, "%s (%@) Failed to check SKIT should_merge - triggering rebuild. error: %@", buf, 0x20u);
    }
    v18 = 1;
  }

LABEL_18:
  return v18;
}

+ (unsigned)supportedDevicePlatformForSet:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  int v6;
  unsigned __int8 v7;

  v3 = a3;
  v6 = objc_msgSend_itemType(v3, v4, v5);
  v7 = sub_2462DA774(v6);

  return v7;
}

- (id)_allMetaContent:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_allLocalInstances(a3, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v3, v4, v5))
  {
    v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v9 = objc_msgSend_count(v3, v7, v8);
    v11 = (void *)objc_msgSend_initWithCapacity_(v6, v10, v9);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v3;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v22, v26, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v23;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v12);
          objc_msgSend_metaContent(*(void **)(*((_QWORD *)&v22 + 1) + 8 * v18), v14, v15, (_QWORD)v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend_addObject_(v11, v19, (uint64_t)v20);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v22, v26, 16);
      }
      while (v16);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localization, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_indexSite, 0);
}

@end
