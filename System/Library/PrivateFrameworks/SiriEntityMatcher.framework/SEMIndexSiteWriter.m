@implementation SEMIndexSiteWriter

- (SEMIndexSiteWriter)initWithIndexSite:(id)a3 settings:(id)a4
{
  id v7;
  id v8;
  SEMIndexSiteWriter *v9;
  SEMIndexSiteWriter *v10;
  uint64_t v11;
  SEMIndexUpdaterConfiguration *skit;
  SEMIndexUpdaterConfiguration *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  SEMIndexUpdaterConfiguration *fts;
  SEMIndexUpdaterConfiguration *v18;
  uint64_t v19;
  const char *v20;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SEMIndexSiteWriter;
  v9 = -[SEMIndexSiteWriter init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_indexSite, a3);
    objc_storeStrong((id *)&v10->_settings, a4);
    v11 = objc_opt_new();
    skit = v10->_skit;
    v10->_skit = (SEMIndexUpdaterConfiguration *)v11;

    v13 = v10->_skit;
    v14 = objc_opt_class();
    objc_msgSend_setUpdaterClass_(v13, v15, v14);
    v16 = objc_opt_new();
    fts = v10->_fts;
    v10->_fts = (SEMIndexUpdaterConfiguration *)v16;

    v18 = v10->_fts;
    v19 = objc_opt_class();
    objc_msgSend_setUpdaterClass_(v18, v20, v19);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SEMIndexSiteWriter;
  -[SEMIndexSiteWriter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("%@ %@"), v4, self->_indexSite);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)indexUpdatesToSets:(id)a3 allSets:(id)a4 shouldDefer:(id)a5
{
  __CFString *v8;
  id v9;
  const char *v10;
  id v11;
  int shouldDefer;
  const char *v13;
  NSObject *v14;
  BOOL v15;
  const __CFString *v16;
  SEMIndexSite *v17;
  NSObject *v18;
  SEMIndexSite *indexSite;
  int v21;
  const char *v22;
  __int16 v23;
  SEMIndexSite *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v9 = a4;
  v11 = a5;
  if (!v9)
  {
    v18 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      indexSite = self->_indexSite;
      v21 = 136315650;
      v22 = "-[SEMIndexSiteWriter indexUpdatesToSets:allSets:shouldDefer:]";
      v23 = 2112;
      v24 = indexSite;
      v25 = 2112;
      v26 = v8;
      _os_log_error_impl(&dword_2462C4000, v18, OS_LOG_TYPE_ERROR, "%s (%@) Missing allSets block (updated: %@)", (uint8_t *)&v21, 0x20u);
    }
    goto LABEL_9;
  }
  shouldDefer = objc_msgSend__updateOrRebuildIndex_updatedSets_allSets_shouldDefer_(self, v10, (uint64_t)self->_skit, v8, v9, v11);
  if ((shouldDefer & objc_msgSend__updateOrRebuildIndex_updatedSets_allSets_shouldDefer_(self, v13, (uint64_t)self->_fts, v8, v9, v11)) != 1)
  {
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  v14 = qword_25441F970;
  v15 = 1;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v16 = CFSTR("set updates");
    v17 = self->_indexSite;
    v22 = "-[SEMIndexSiteWriter indexUpdatesToSets:allSets:shouldDefer:]";
    v21 = 136315650;
    if (!v8)
      v16 = CFSTR("all sets");
    v23 = 2112;
    v24 = v17;
    v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_2462C4000, v14, OS_LOG_TYPE_INFO, "%s (%@) Finished indexing %@", (uint8_t *)&v21, 0x20u);
  }
LABEL_10:

  return v15;
}

- (BOOL)performVerificationWithAllSets:(id)a3 shouldDefer:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  SEMIndexUpdaterConfiguration *skit;
  void *v9;
  const char *v10;
  SEMIndexUpdaterConfiguration *fts;
  void *v12;
  const char *v13;
  NSObject *v14;
  BOOL v15;
  SEMIndexSite *v16;
  NSObject *v17;
  SEMIndexSite *indexSite;
  int v20;
  const char *v21;
  __int16 v22;
  SEMIndexSite *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  if (!v6)
  {
    v17 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      indexSite = self->_indexSite;
      v20 = 136315394;
      v21 = "-[SEMIndexSiteWriter performVerificationWithAllSets:shouldDefer:]";
      v22 = 2112;
      v23 = indexSite;
      _os_log_error_impl(&dword_2462C4000, v17, OS_LOG_TYPE_ERROR, "%s (%@) Missing allSets block", (uint8_t *)&v20, 0x16u);
    }
    goto LABEL_7;
  }
  skit = self->_skit;
  v6[2](v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(skit) = objc_msgSend__updateIndex_mode_sets_shouldDefer_shouldRebuild_(self, v10, (uint64_t)skit, 3, v9, v7, 0);

  fts = self->_fts;
  v6[2](v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(fts) = objc_msgSend__updateIndex_mode_sets_shouldDefer_shouldRebuild_(self, v13, (uint64_t)fts, 3, v12, v7, 0);

  if ((skit & fts) != 1)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v14 = qword_25441F970;
  v15 = 1;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v16 = self->_indexSite;
    v20 = 136315394;
    v21 = "-[SEMIndexSiteWriter performVerificationWithAllSets:shouldDefer:]";
    v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_2462C4000, v14, OS_LOG_TYPE_INFO, "%s (%@) Finished verification", (uint8_t *)&v20, 0x16u);
  }
LABEL_8:

  return v15;
}

- (void)logCurrentStateWithAllSets:(id)a3
{
  SEMIndexUpdaterConfiguration *fts;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  __int128 v9;
  __CFString *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  SEMIndexSite *indexSite;
  __CFString *v30;
  __CFString *v31;
  const char *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  SEMIndexSite *v36;
  int v37;
  uint64_t v38;
  const __CFString *v39;
  __CFString *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  __CFString *v51;
  SEMIndexSite *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  SEMIndexSite *v58;
  NSObject *v59;
  SEMIndexSite *v60;
  __int128 v61;
  id obj;
  __CFString *v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t i;
  id v72;
  SEMIndexSiteWriter *v73;
  __CFString *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  __CFString *v80;
  SEMIndexSiteWriter *v81;
  id v82;
  __CFString *v83;
  uint64_t *v84;
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  int v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t buf[4];
  const char *v96;
  __int16 v97;
  SEMIndexSite *v98;
  __int16 v99;
  id v100;
  __int16 v101;
  _BYTE v102[18];
  __int16 v103;
  uint64_t v104;
  _BYTE v105[128];
  _QWORD v106[2];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v65 = a3;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  fts = self->_fts;
  v73 = self;
  v106[0] = self->_skit;
  v106[1] = fts;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v5, (uint64_t)v106, 2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v91, v107, 16);
  if (v67)
  {
    v64 = *(_QWORD *)v92;
    v10 = CFSTR("SiriEntityMatcher");
    *(_QWORD *)&v9 = 136316162;
    v61 = v9;
    do
    {
      for (i = 0; i != v67; ++i)
      {
        if (*(_QWORD *)v92 != v64)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
        v12 = (void *)objc_msgSend_updaterClass(v11, v7, v8, v61);
        objc_msgSend_indexName(v12, v13, v14);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__indexDirectory_(v73, v15, (uint64_t)v11);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BDBCEF0];
        v19 = objc_msgSend_updaterClass(v11, v17, v18);
        objc_msgSend__applicableSets_toUpdaterClass_(v73, v20, (uint64_t)v65, v19);
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_setWithArray_(v16, v22, v21);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        v90 = 0;
        LOBYTE(v21) = objc_msgSend__loadChangeRegistry_indexDirectory_createIfNotExists_error_(v73, v23, (uint64_t)v11, v70, 0, &v90);
        v26 = v90;
        if ((v21 & 1) != 0)
        {
          objc_msgSend_changeRegistry(v11, v24, v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = 0;
          v87 = &v86;
          v88 = 0x2020000000;
          v89 = 0;
          v28 = qword_25441F970;
          if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
          {
            indexSite = v73->_indexSite;
            *(_DWORD *)buf = 136315650;
            v96 = "-[SEMIndexSiteWriter logCurrentStateWithAllSets:]";
            v97 = 2112;
            v98 = indexSite;
            v99 = 2112;
            v100 = v69;
            _os_log_impl(&dword_2462C4000, v28, OS_LOG_TYPE_INFO, "%s (%@) [%@] Enumerating all registered bookmarks", buf, 0x20u);
          }
          v85 = v26;
          v79[0] = MEMORY[0x24BDAC760];
          v79[1] = 3221225472;
          v79[2] = sub_2463101C4;
          v79[3] = &unk_251783608;
          v30 = v27;
          v80 = v30;
          v81 = v73;
          v72 = v69;
          v82 = v72;
          v31 = v68;
          v83 = v31;
          v84 = &v86;
          v63 = v30;
          LOBYTE(v30) = objc_msgSend_enumerateAllBookmarks_usingBlock_(v30, v32, (uint64_t)&v85, v79);
          v66 = v85;

          if ((v30 & 1) != 0)
          {

            v33 = (id)qword_25441F970;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              v36 = v73->_indexSite;
              v37 = *((_DWORD *)v87 + 6);
              v38 = objc_msgSend_count(v31, v34, v35);
              *(_DWORD *)buf = v61;
              v39 = CFSTR("none");
              if (v38)
                v39 = v31;
              v96 = "-[SEMIndexSiteWriter logCurrentStateWithAllSets:]";
              v97 = 2112;
              v98 = v36;
              v99 = 2112;
              v100 = v72;
              v101 = 1024;
              *(_DWORD *)v102 = v37;
              *(_WORD *)&v102[4] = 2112;
              *(_QWORD *)&v102[6] = v39;
              _os_log_impl(&dword_2462C4000, v33, OS_LOG_TYPE_INFO, "%s (%@) [%@] Enumerated %u bookmarks for sets excluding %@", buf, 0x30u);
            }

            v77 = 0u;
            v78 = 0u;
            v75 = 0u;
            v76 = 0u;
            v40 = v31;
            v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v75, v105, 16);
            if (v43)
            {
              v44 = *(_QWORD *)v76;
              v74 = v40;
              do
              {
                for (j = 0; j != v43; ++j)
                {
                  if (*(_QWORD *)v76 != v44)
                    objc_enumerationMutation(v74);
                  v46 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
                  objc_msgSend_changePublisherWithUseCase_(v46, v42, (uint64_t)v10);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = (id)qword_25441F970;
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                  {
                    v51 = v10;
                    v52 = v73->_indexSite;
                    v53 = objc_msgSend_sharedItemCount(v47, v49, v50);
                    v56 = objc_msgSend_localItemInstanceCount(v47, v54, v55);
                    *(_DWORD *)buf = 136316418;
                    v96 = "-[SEMIndexSiteWriter logCurrentStateWithAllSets:]";
                    v97 = 2112;
                    v98 = v52;
                    v99 = 2112;
                    v100 = v72;
                    v101 = 2112;
                    *(_QWORD *)v102 = v46;
                    *(_WORD *)&v102[8] = 2048;
                    *(_QWORD *)&v102[10] = v53;
                    v103 = 2048;
                    v104 = v56;
                    _os_log_impl(&dword_2462C4000, v48, OS_LOG_TYPE_INFO, "%s (%@) [%@] EXCLUDED applicable set: %@ has sharedItemCount: %lu localItemInstanceCount: %lu", buf, 0x3Eu);
                    v10 = v51;
                  }

                }
                v40 = v74;
                v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v42, (uint64_t)&v75, v105, 16);
              }
              while (v43);
            }
          }
          else
          {
            v59 = qword_25441F970;
            if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
            {
              v60 = v73->_indexSite;
              *(_DWORD *)buf = 136315906;
              v96 = "-[SEMIndexSiteWriter logCurrentStateWithAllSets:]";
              v97 = 2112;
              v98 = v60;
              v99 = 2112;
              v100 = v72;
              v101 = 2112;
              *(_QWORD *)v102 = v66;
              _os_log_error_impl(&dword_2462C4000, v59, OS_LOG_TYPE_ERROR, "%s (%@) [%@] Failed to enumerate change registry: %@", buf, 0x2Au);
            }

            v40 = v80;
          }

          _Block_object_dispose(&v86, 8);
          v26 = v66;
        }
        else
        {
          v57 = qword_25441F970;
          if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
          {
            v58 = v73->_indexSite;
            *(_DWORD *)buf = 136315906;
            v96 = "-[SEMIndexSiteWriter logCurrentStateWithAllSets:]";
            v97 = 2112;
            v98 = v58;
            v99 = 2112;
            v100 = v69;
            v101 = 2112;
            *(_QWORD *)v102 = v68;
            _os_log_impl(&dword_2462C4000, v57, OS_LOG_TYPE_INFO, "%s (%@) [%@] Change registry not found with current applicable sets: %@", buf, 0x2Au);
          }
        }

      }
      v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v91, v107, 16);
    }
    while (v67);
  }

}

- (BOOL)_updateOrRebuildIndex:(id)a3 updatedSets:(id)a4 allSets:(id)a5 shouldDefer:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  const char *v13;
  id v14;
  char shouldRebuild;
  char v16;
  void *v17;
  const char *v18;
  char v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  SEMIndexSite *indexSite;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  char v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  SEMIndexSite *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a5;
  v14 = a6;
  v31 = 0;
  if (v11)
  {
    shouldRebuild = objc_msgSend__updateIndex_mode_sets_shouldDefer_shouldRebuild_(self, v13, (uint64_t)v10, 1, v11, v14, &v31);
    if (v31)
      v16 = 0;
    else
      v16 = shouldRebuild;
    if (!v31)
      goto LABEL_15;
  }
  else
  {
    v31 = 1;
  }
  v12[2](v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend__updateIndex_mode_sets_shouldDefer_shouldRebuild_(self, v18, (uint64_t)v10, 2, v17, v14, &v31);

  if (v31)
    v19 = v16;
  else
    v19 = 1;
  if ((v19 & 1) == 0)
  {
    v20 = (id)qword_25441F970;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      indexSite = self->_indexSite;
      v24 = (void *)objc_msgSend_updaterClass(v10, v21, v22);
      objc_msgSend_indexName(v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v33 = "-[SEMIndexSiteWriter _updateOrRebuildIndex:updatedSets:allSets:shouldDefer:]";
      v34 = 2112;
      v35 = indexSite;
      v36 = 2112;
      v37 = v27;
      _os_log_impl(&dword_2462C4000, v20, OS_LOG_TYPE_INFO, "%s (%@) Failed to rebuild %@. Retrying one more time", buf, 0x20u);

    }
    v12[2](v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend__updateIndex_mode_sets_shouldDefer_shouldRebuild_(self, v29, (uint64_t)v10, 2, v28, v14, 0);

  }
LABEL_15:

  return v16;
}

- (BOOL)_updateIndex:(id)a3 mode:(unsigned __int8)a4 sets:(id)a5 shouldDefer:(id)a6 shouldRebuild:(BOOL *)a7
{
  unsigned int v9;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  SEMIndexSite *v18;
  BOOL v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  SEMIndexSite *indexSite;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  char v36;
  char v37;
  void *v38;
  NSObject *v39;
  const char *v40;
  SEMIndexSite *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  int v45;
  const char *v46;
  uint64_t v47;
  int v48;
  void *v49;
  id v50;
  const char *v51;
  uint64_t v52;
  SEMIndexSite *v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  char v58;
  id v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  char v65;
  const char *v66;
  __objc2_class *v67;
  NSObject *v68;
  NSObject *v69;
  SEMIndexSite *v70;
  void *v71;
  NSObject *v72;
  int v73;
  NSObject *v74;
  SEMIndexSite *v75;
  NSObject *cache;
  const char *v77;
  SEMIndexSite *v78;
  char v79;
  id v80;
  const char *v81;
  uint64_t v82;
  char v83;
  id v84;
  const char *v85;
  void *v86;
  char shouldRebuild;
  id v88;
  const char *v89;
  void *v90;
  char v91;
  id v92;
  const char *v93;
  char v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  char v99;
  NSObject *v100;
  SEMIndexSite *v101;
  const char *v102;
  NSObject *v103;
  SEMIndexSite *v104;
  NSObject *v105;
  const char *v106;
  uint64_t v107;
  SEMIndexSite *v108;
  void *v109;
  char v110;
  NSObject *v111;
  _BOOL4 v112;
  const char *v113;
  uint64_t v114;
  SEMIndexSite *v115;
  void *v116;
  NSObject *v117;
  const char *v118;
  uint64_t v119;
  SEMIndexSite *v120;
  void *v121;
  SEMIndexSite *v122;
  NSObject *v123;
  SEMIndexSite *v124;
  NSObject *v125;
  const char *v126;
  uint64_t v127;
  SEMIndexSite *v128;
  SEMIndexSite *v130;
  SEMIndexSite *v131;
  SEMIndexSite *v132;
  SEMIndexSite *v133;
  uint64_t v134;
  void *v135;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  uint8_t buf[4];
  const char *v151;
  __int16 v152;
  SEMIndexSite *v153;
  __int16 v154;
  id v155;
  __int16 v156;
  id v157;
  __int16 v158;
  _BYTE v159[10];
  __int16 v160;
  void *v161;
  uint64_t v162;

  v9 = a4;
  v162 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v16 = v13;
  if (!v13 || !(*((unsigned int (**)(id))v13 + 2))(v13))
  {
    v20 = (void *)objc_msgSend_updaterClass(v11, v14, v15);
    objc_msgSend__indexDirectory_(self, v21, (uint64_t)v11);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_indexName(v20, v22, v23);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__applicableSets_toUpdaterClass_(self, v24, (uint64_t)v12, v20);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_count(v138, v25, v26))
    {
      v27 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        indexSite = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        v152 = 2112;
        v153 = indexSite;
        v154 = 2112;
        v155 = v137;
        v156 = 2112;
        v157 = v12;
        _os_log_impl(&dword_2462C4000, v27, OS_LOG_TYPE_INFO, "%s (%@) No sets applicable to %@: %@", buf, 0x2Au);
      }
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v28, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v139, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend_fileExistsAtPath_(v31, v35, (uint64_t)v34);
      v37 = v9 == 1 ? 0 : v36;

      v38 = v138;
      if ((v37 & 1) == 0)
      {
        v19 = 1;
LABEL_88:

        goto LABEL_89;
      }
    }
    v39 = (id)qword_25441F970;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v41 = self->_indexSite;
      sub_24630BC80(v9, v40);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend_count(v138, v43, v44);
      v48 = objc_msgSend_count(v12, v46, v47);
      *(_DWORD *)buf = 136316674;
      v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
      v152 = 2112;
      v153 = v41;
      v154 = 2112;
      v155 = v42;
      v156 = 2112;
      v157 = v137;
      v158 = 1024;
      *(_DWORD *)v159 = v45;
      *(_WORD *)&v159[4] = 1024;
      *(_DWORD *)&v159[6] = v48;
      v160 = 2112;
      v161 = v138;
      _os_log_impl(&dword_2462C4000, v39, OS_LOG_TYPE_INFO, "%s (%@) Initiating update mode \"%@\" for %@ with %u / %u applicable set(s): %@", buf, 0x40u);

    }
    v149 = 0;
    sub_2462ED484(v139, &v149);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v149;

    if (!v49)
    {
      v68 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v122 = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        v152 = 2112;
        v153 = v122;
        v154 = 2112;
        v155 = v137;
        v156 = 2112;
        v157 = v50;
        _os_log_error_impl(&dword_2462C4000, v68, OS_LOG_TYPE_ERROR, "%s (%@) Failed to resolve %@ directory: %@", buf, 0x2Au);
      }
      v19 = 0;
      goto LABEL_87;
    }
    v53 = self->_indexSite;
    objc_msgSend_localization(self->_settings, v51, v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updaterForIndexSite_localization_(v20, v55, (uint64_t)v53, v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v56)
    {
      v69 = (id)qword_25441F970;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        v70 = self->_indexSite;
        NSStringFromClass((Class)v20);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        v152 = 2112;
        v153 = v70;
        v154 = 2112;
        v155 = v71;
        _os_log_impl(&dword_2462C4000, v69, OS_LOG_TYPE_INFO, "%s (%@) Failed to initialize updater class: %@", buf, 0x20u);

      }
      v19 = 0;
      goto LABEL_86;
    }
    v148 = v50;
    v58 = objc_msgSend__loadChangeRegistry_indexDirectory_createIfNotExists_error_(self, v57, (uint64_t)v11, v139, 1, &v148);
    v59 = v148;

    if ((v58 & 1) == 0)
    {
      v72 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v128 = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        v152 = 2112;
        v153 = v128;
        v154 = 2112;
        v155 = v137;
        v156 = 2112;
        v157 = v59;
        _os_log_error_impl(&dword_2462C4000, v72, OS_LOG_TYPE_ERROR, "%s (%@) Failed to load %@ change registry: %@", buf, 0x2Au);
      }
      v19 = 0;
      v50 = v59;
      goto LABEL_86;
    }
    objc_msgSend_changeRegistry(v11, v60, v61);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v62 = v16;
    else
      v62 = &unk_251783648;
    v134 = MEMORY[0x2495571C4](v62);

    if (v9 != 2)
    {
      v64 = (uint64_t)v138;
      if (v9 != 3)
      {
        v73 = 0;
        goto LABEL_45;
      }
      v147 = v59;
      v65 = objc_msgSend_cleanupWithAllSets_error_(v135, v63, (uint64_t)v138, &v147);
      v50 = v147;

      if ((v65 & 1) == 0)
      {
        v67 = &OBJC_METACLASS___SEMDatabaseExecutionResult;
        v74 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
        {
          v75 = self->_indexSite;
          *(_DWORD *)buf = 136315906;
          v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
          v152 = 2112;
          v153 = v75;
          v154 = 2112;
          v155 = v137;
          v156 = 2112;
          v157 = v50;
          _os_log_impl(&dword_2462C4000, v74, OS_LOG_TYPE_INFO, "%s (%@) %@ rebuild required after registry cleanup failed: %@", buf, 0x2Au);
        }
        v59 = v50;
        goto LABEL_41;
      }
      if ((objc_msgSend_isRebuildRequiredWithAllSets_(v56, v66, (uint64_t)v138) & 1) == 0)
      {
        v123 = qword_25441F970;
        v19 = 1;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
        {
          v124 = self->_indexSite;
          *(_DWORD *)buf = 136315650;
          v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
          v152 = 2112;
          v153 = v124;
          v154 = 2112;
          v155 = v137;
          _os_log_impl(&dword_2462C4000, v123, OS_LOG_TYPE_INFO, "%s (%@) %@ rebuild not required", buf, 0x20u);
        }
        goto LABEL_85;
      }
      v59 = v50;
    }
    v67 = &OBJC_METACLASS___SEMDatabaseExecutionResult;
LABEL_41:
    cache = v67[60].cache;
    if (os_log_type_enabled(cache, OS_LOG_TYPE_INFO))
    {
      v78 = self->_indexSite;
      *(_DWORD *)buf = 136315650;
      v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
      v152 = 2112;
      v153 = v78;
      v154 = 2112;
      v155 = v137;
      _os_log_impl(&dword_2462C4000, cache, OS_LOG_TYPE_INFO, "%s (%@) Clearing %@", buf, 0x20u);
    }
    v146 = v59;
    v79 = objc_msgSend_clear_(v56, v77, (uint64_t)&v146, v134);
    v80 = v146;

    if ((v79 & 1) == 0)
    {
      v103 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        v104 = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        v152 = 2112;
        v153 = v104;
        v154 = 2112;
        v155 = v137;
        v156 = 2112;
        v157 = v80;
        _os_log_impl(&dword_2462C4000, v103, OS_LOG_TYPE_INFO, "%s (%@) Failed to clear %@: %@", buf, 0x2Au);
        v103 = qword_25441F970;
      }
      v105 = v103;
      if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
      {
        v108 = self->_indexSite;
        objc_msgSend_path(v139, v106, v107);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        v152 = 2112;
        v153 = v108;
        v154 = 2112;
        v155 = v137;
        v156 = 2112;
        v157 = v109;
        _os_log_impl(&dword_2462C4000, v105, OS_LOG_TYPE_INFO, "%s (%@) Force removing bad index directory %@ at location %@", buf, 0x2Au);

      }
      v145 = v80;
      v110 = sub_2462ED544(v139, &v145);
      v50 = v145;

      v111 = (id)qword_25441F970;
      v112 = os_log_type_enabled(v111, OS_LOG_TYPE_INFO);
      if ((v110 & 1) != 0)
      {
        if (v112)
        {
          v115 = self->_indexSite;
          objc_msgSend_path(v139, v113, v114);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
          v152 = 2112;
          v153 = v115;
          v154 = 2112;
          v155 = v137;
          v156 = 2112;
          v157 = v116;
          _os_log_impl(&dword_2462C4000, v111, OS_LOG_TYPE_INFO, "%s (%@) Removed bad index %@ at path %@", buf, 0x2Au);

        }
        if (a7)
        {
          v19 = 0;
          *a7 = 1;
          goto LABEL_85;
        }
      }
      else
      {
        if (v112)
        {
          v120 = self->_indexSite;
          objc_msgSend_path(v139, v113, v114);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316162;
          v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
          v152 = 2112;
          v153 = v120;
          v154 = 2112;
          v155 = v137;
          v156 = 2112;
          v157 = v121;
          v158 = 2112;
          *(_QWORD *)v159 = v50;
          _os_log_impl(&dword_2462C4000, v111, OS_LOG_TYPE_INFO, "%s (%@) Failed to remove bad index %@ at path %@: %@", buf, 0x34u);

        }
      }
      goto LABEL_74;
    }
    objc_msgSend_clearAllBookmarks(v135, v81, v82);
    v73 = 1;
    v59 = v80;
    v64 = (uint64_t)v138;
LABEL_45:
    v144 = v59;
    v83 = objc_msgSend_indexUpdatesToSets_changeRegistry_shouldDefer_error_(v56, v63, v64, v135, v134, &v144, v134);
    v84 = v144;

    v86 = v84;
    if ((v83 & 1) == 0)
    {
      v95 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v131 = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        v152 = 2112;
        v153 = v131;
        v154 = 2112;
        v155 = v137;
        v156 = 2112;
        v157 = v86;
        _os_log_error_impl(&dword_2462C4000, v95, OS_LOG_TYPE_ERROR, "%s (%@) %@ Update failed: %@ Rolling back updates", buf, 0x2Au);
      }
      objc_msgSend_rollbackAllBookmarkUpdates(v135, v96, v97);
      if (a7)
        *a7 = 1;
      v143 = v86;
      v99 = objc_msgSend_rollbackUpdates_(v56, v98, (uint64_t)&v143);
      v50 = v143;

      if ((v99 & 1) != 0)
        goto LABEL_74;
      v100 = qword_25441F970;
      if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
        goto LABEL_74;
      v101 = self->_indexSite;
      *(_DWORD *)buf = 136315906;
      v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
      v152 = 2112;
      v153 = v101;
      v154 = 2112;
      v155 = v137;
      v156 = 2112;
      v157 = v50;
      v102 = "%s (%@) Failed to rollback %@ updates: %@";
      goto LABEL_58;
    }
    v142 = v84;
    shouldRebuild = objc_msgSend_commitUpdates_shouldRebuild_(v56, v85, (uint64_t)&v142, a7);
    v88 = v142;

    v90 = v88;
    if ((shouldRebuild & 1) != 0)
    {
      v141 = v88;
      v91 = objc_msgSend_commitAllBookmarkUpdates_(v135, v89, (uint64_t)&v141);
      v92 = v141;

      v90 = v92;
      if ((v91 & 1) != 0)
      {
        if (v73)
        {
          v140 = v92;
          v94 = objc_msgSend_cleanup_(v56, v93, (uint64_t)&v140);
          v50 = v140;

          if ((v94 & 1) != 0)
          {
            v19 = 1;
LABEL_85:

            v16 = (void *)v134;
LABEL_86:

LABEL_87:
            v38 = v138;
            goto LABEL_88;
          }
          v100 = qword_25441F970;
          if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
          {
            v130 = self->_indexSite;
            *(_DWORD *)buf = 136315906;
            v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
            v152 = 2112;
            v153 = v130;
            v154 = 2112;
            v155 = v137;
            v156 = 2112;
            v157 = v50;
            v102 = "%s (%@) Failed to cleanup %@: %@";
LABEL_58:
            _os_log_error_impl(&dword_2462C4000, v100, OS_LOG_TYPE_ERROR, v102, buf, 0x2Au);
          }
LABEL_74:
          v19 = 0;
          goto LABEL_85;
        }
        v19 = 1;
LABEL_84:
        v50 = v90;
        goto LABEL_85;
      }
      v125 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v133 = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        v152 = 2112;
        v153 = v133;
        v154 = 2112;
        v155 = v137;
        v156 = 2112;
        v157 = v90;
        _os_log_error_impl(&dword_2462C4000, v125, OS_LOG_TYPE_ERROR, "%s (%@) Failed to commit %@ change registry transaction: %@", buf, 0x2Au);
      }
      objc_msgSend_rollbackAllBookmarkUpdates(v135, v126, v127);
    }
    else
    {
      v117 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v132 = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        v152 = 2112;
        v153 = v132;
        v154 = 2112;
        v155 = v137;
        v156 = 2112;
        v157 = v90;
        _os_log_error_impl(&dword_2462C4000, v117, OS_LOG_TYPE_ERROR, "%s (%@) Failed to commit %@ updates: %@", buf, 0x2Au);
      }
      objc_msgSend_rollbackAllBookmarkUpdates(v135, v118, v119);
    }
    v19 = 0;
    if (a7)
      *a7 = 1;
    goto LABEL_84;
  }
  v17 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v18 = self->_indexSite;
    *(_DWORD *)buf = 136315394;
    v151 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
    v152 = 2112;
    v153 = v18;
    _os_log_impl(&dword_2462C4000, v17, OS_LOG_TYPE_INFO, "%s (%@) Exiting after deferral signal", buf, 0x16u);
  }
  v19 = 0;
LABEL_89:

  return v19;
}

- (BOOL)_loadChangeRegistry:(id)a3 indexDirectory:(id)a4 createIfNotExists:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  int v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  void *v31;
  BOOL v32;

  v10 = a3;
  v11 = a4;
  objc_msgSend_changeRegistry(v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (!a5)
    {
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fileURLWithPath_relativeToURL_(MEMORY[0x24BDBCF48], v18, (uint64_t)CFSTR("registry"), v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend_fileExistsAtPath_(v17, v23, (uint64_t)v22);

      if (!v24)
        goto LABEL_8;
    }
    v25 = objc_alloc(MEMORY[0x24BE156E0]);
    v28 = objc_msgSend_dataProtectionClass(self->_indexSite, v26, v27);
    v31 = (void *)objc_msgSend_initWithFilename_directory_protectionClass_error_(v25, v29, (uint64_t)CFSTR("registry"), v11, v28, a6);
    if (!v31)
    {
LABEL_8:
      v32 = 0;
      goto LABEL_7;
    }
    objc_msgSend_setChangeRegistry_(v10, v30, (uint64_t)v31);

  }
  v32 = 1;
LABEL_7:

  return v32;
}

- (id)_indexDirectory:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  v7 = (void *)objc_msgSend_updaterClass(v4, v5, v6);
  objc_msgSend_indexDirectory_(v7, v8, (uint64_t)self->_indexSite);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_applicableSets:(id)a3 toUpdaterClass:(Class)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v18, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v15 = objc_msgSend_supportedDevicePlatformForSet_(a4, v10, v14, (_QWORD)v18);
        if (objc_msgSend_isSupportedDevicePlatform_(self->_settings, v16, v15))
          objc_msgSend_addObject_(v7, v10, v14);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v18, v22, 16);
    }
    while (v11);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fts, 0);
  objc_storeStrong((id *)&self->_skit, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_indexSite, 0);
}

@end
