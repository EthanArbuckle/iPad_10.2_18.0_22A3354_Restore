@implementation SEMFTSUpdater

+ (id)indexName
{
  return CFSTR("FTS");
}

+ (id)indexDirectory:(id)a3
{
  return (id)objc_msgSend_ftsDirectoryURL(a3, a2, (uint64_t)a3);
}

+ (id)updaterForIndexSite:(id)a3 localization:(id)a4
{
  id v4;
  SEMFTSWriter *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  void *v16;

  v4 = a3;
  v5 = [SEMFTSWriter alloc];
  objc_msgSend_ftsDatabaseURL(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_dataProtectionClass(v4, v9, v10);
  v13 = (void *)objc_msgSend_initWithDatabaseURL_dataProtectionClass_(v5, v12, (uint64_t)v8, v11);

  if (v13)
  {
    v14 = objc_alloc((Class)objc_opt_class());
    v16 = (void *)objc_msgSend_initWithIndexSite_writer_(v14, v15, (uint64_t)v4, v13);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (SEMFTSUpdater)initWithIndexSite:(id)a3 writer:(id)a4
{
  id v7;
  id v8;
  SEMFTSUpdater *v9;
  SEMFTSUpdater *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SEMFTSUpdater;
  v9 = -[SEMFTSUpdater init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_indexSite, a3);
    objc_storeStrong((id *)&v10->_writer, a4);
  }

  return v10;
}

- (BOOL)clear:(id *)a3
{
  return objc_msgSend_clearWithError_(self->_writer, a2, (uint64_t)a3);
}

- (BOOL)commitUpdates:(id *)a3 shouldRebuild:(BOOL *)a4
{
  return MEMORY[0x24BEDD108](self->_writer, sel_commitChanges_, a3);
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
  id v8;
  id v9;
  void *v10;
  SEMIndexSite *indexSite;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  SEMIndexSite *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  id v33;
  id v34;
  uint64_t *v35;
  NSObject *v36;
  int v37;
  void *v38;
  NSObject *v39;
  SEMIndexSite *v40;
  const __CFString *v41;
  int v42;
  int v43;
  SEMIndexSite *v44;
  SEMIndexSite *v45;
  BOOL v46;
  void *v47;
  SEMIndexSite *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  int v52;
  __int128 v54;
  uint64_t v55;
  id obj;
  id v57;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[6];
  id v63;
  id v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t *v68;
  _QWORD v69[4];
  id v70;
  SEMIndexSite *v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  char v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t buf[4];
  const char *v97;
  __int16 v98;
  SEMIndexSite *v99;
  __int16 v100;
  _BYTE v101[10];
  SEMIndexSite *v102;
  __int16 v103;
  int v104;
  __int16 v105;
  int v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v57 = a5;
  v10 = (void *)qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    indexSite = self->_indexSite;
    v12 = v10;
    *(_DWORD *)buf = 136315650;
    v97 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
    v98 = 2112;
    v99 = indexSite;
    v100 = 1024;
    *(_DWORD *)v101 = objc_msgSend_count(v8, v13, v14);
    _os_log_impl(&dword_2462C4000, v12, OS_LOG_TYPE_INFO, "%s (%@) Enumerating %u sets for updates to FTS", buf, 0x1Cu);

  }
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = v8;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v92, v107, 16);
  if (v17)
  {
    v55 = 0;
    v60 = *MEMORY[0x24BE155F8];
    v61 = *(_QWORD *)v93;
    *(_QWORD *)&v18 = 136315906;
    v54 = v18;
LABEL_5:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v93 != v61)
        objc_enumerationMutation(obj);
      v20 = *(SEMIndexSite **)(*((_QWORD *)&v92 + 1) + 8 * v19);
      v88 = 0;
      v89 = &v88;
      v90 = 0x2020000000;
      v91 = 1;
      v82 = 0;
      v83 = &v82;
      v84 = 0x3032000000;
      v85 = sub_246301AB0;
      v86 = sub_246301AC0;
      v87 = 0;
      objc_msgSend_descriptorWithKey_(v20, v16, v60, v54);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_value(v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = qword_25441F970;
      v26 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
      if (!v24)
      {
        if (v26)
        {
          *(_DWORD *)buf = 136315394;
          v97 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
          v98 = 2112;
          v99 = v20;
          _os_log_impl(&dword_2462C4000, v25, OS_LOG_TYPE_INFO, "%s Skipping set missing source identifier descriptor: %@", buf, 0x16u);
        }
        v37 = 5;
        goto LABEL_28;
      }
      if (v26)
      {
        *(_DWORD *)buf = 136315650;
        v97 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
        v98 = 2112;
        v99 = v20;
        v100 = 2112;
        *(_QWORD *)v101 = v24;
        _os_log_impl(&dword_2462C4000, v25, OS_LOG_TYPE_INFO, "%s Enumerating set: %@ using originAppId: %@", buf, 0x20u);
      }
      v78 = 0;
      v79 = &v78;
      v80 = 0x2020000000;
      v81 = 0;
      v74 = 0;
      v75 = &v74;
      v76 = 0x2020000000;
      v77 = 0;
      objc_msgSend_bookmarkForSet_(v9, v27, (uint64_t)v20);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_changePublisherWithUseCase_(v20, v29, 0x251784FD0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = MEMORY[0x24BDAC760];
      v69[0] = MEMORY[0x24BDAC760];
      v69[1] = 3221225472;
      v69[2] = sub_246301AC8;
      v69[3] = &unk_251782E40;
      v72 = &v88;
      v70 = v9;
      v71 = v20;
      v73 = &v82;
      v62[0] = v31;
      v62[1] = 3221225472;
      v62[2] = sub_246301B90;
      v62[3] = &unk_251782E68;
      v64 = v57;
      v65 = &v88;
      v62[4] = self;
      v62[5] = v20;
      v63 = v24;
      v66 = &v82;
      v67 = &v78;
      v68 = &v74;
      v33 = (id)objc_msgSend_drivableSinkWithBookmark_completion_shouldContinue_(v30, v32, (uint64_t)v28, v69, v62);

      v34 = v9;
      v35 = v83;
      if (*((_BYTE *)v89 + 24))
      {
        if (!v83[5])
          break;
      }
      v36 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v44 = self->_indexSite;
        v45 = (SEMIndexSite *)v35[5];
        *(_DWORD *)buf = v54;
        v97 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
        v98 = 2112;
        v99 = v44;
        v100 = 2112;
        *(_QWORD *)v101 = v20;
        *(_WORD *)&v101[8] = 2112;
        v102 = v45;
        _os_log_error_impl(&dword_2462C4000, v36, OS_LOG_TYPE_ERROR, "%s (%@) Enumeration for set: %@ aborted: %@", buf, 0x2Au);
        v35 = v83;
      }
      v37 = 1;
      if (!a6)
        goto LABEL_26;
      v38 = (void *)v35[5];
      if (!v38)
        goto LABEL_26;
      v9 = v34;
      *a6 = objc_retainAutorelease(v38);
LABEL_27:

      _Block_object_dispose(&v74, 8);
      _Block_object_dispose(&v78, 8);
LABEL_28:

      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(&v88, 8);
      if (v37 != 5 && v37)
      {

        v46 = 0;
        goto LABEL_37;
      }
      if (v17 == ++v19)
      {
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v92, v107, 16);
        if (v17)
          goto LABEL_5;
        goto LABEL_35;
      }
    }
    v39 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v40 = self->_indexSite;
      v41 = CFSTR("delta");
      if (!v28)
        v41 = CFSTR("full");
      v42 = *((_DWORD *)v79 + 6);
      v43 = *((_DWORD *)v75 + 6);
      *(_DWORD *)buf = 136316418;
      v97 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
      v98 = 2112;
      v99 = v40;
      v100 = 2112;
      *(_QWORD *)v101 = v41;
      *(_WORD *)&v101[8] = 2112;
      v102 = v20;
      v103 = 1024;
      v104 = v42;
      v105 = 1024;
      v106 = v43;
      _os_log_impl(&dword_2462C4000, v39, OS_LOG_TYPE_INFO, "%s (%@) Completed %@ enumeration for set: %@ with %u added and %u removed local item instances.", buf, 0x36u);
    }
    v37 = 0;
    LODWORD(v55) = *((_DWORD *)v79 + 6) + v55;
    HIDWORD(v55) += *((_DWORD *)v75 + 6);
LABEL_26:
    v9 = v34;
    goto LABEL_27;
  }
  v55 = 0;
LABEL_35:

  v47 = (void *)qword_25441F970;
  v46 = 1;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v48 = self->_indexSite;
    v49 = v47;
    v52 = objc_msgSend_count(obj, v50, v51);
    *(_DWORD *)buf = 136316162;
    v97 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
    v98 = 2112;
    v99 = v48;
    v100 = 1024;
    *(_DWORD *)v101 = v52;
    *(_WORD *)&v101[4] = 1024;
    *(_DWORD *)&v101[6] = v55;
    LOWORD(v102) = 1024;
    *(_DWORD *)((char *)&v102 + 2) = HIDWORD(v55);
    _os_log_impl(&dword_2462C4000, v49, OS_LOG_TYPE_INFO, "%s (%@) Completed enumeration for %u set(s) cumulatively producing %u added and %u removed local item instances from FTS", buf, 0x28u);

    v46 = 1;
  }
LABEL_37:

  return v46;
}

- (BOOL)isRebuildRequiredWithAllSets:(id)a3
{
  char v4;
  NSObject *v5;
  SEMIndexSite *indexSite;
  int v8;
  const char *v9;
  __int16 v10;
  SEMIndexSite *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend_databaseExists(self->_writer, a2, (uint64_t)a3);
  if ((v4 & 1) == 0)
  {
    v5 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      indexSite = self->_indexSite;
      v8 = 136315394;
      v9 = "-[SEMFTSUpdater isRebuildRequiredWithAllSets:]";
      v10 = 2112;
      v11 = indexSite;
      _os_log_impl(&dword_2462C4000, v5, OS_LOG_TYPE_INFO, "%s (%@) FTS database index does not exist", (uint8_t *)&v8, 0x16u);
    }
  }
  return v4 ^ 1;
}

+ (unsigned)supportedDevicePlatformForSet:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend_itemType(a3, a2, (uint64_t)a3);
  return MEMORY[0x24BEDD108](SEMFTSWriter, sel_capabilityRequirementForItemType_, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_indexSite, 0);
}

@end
