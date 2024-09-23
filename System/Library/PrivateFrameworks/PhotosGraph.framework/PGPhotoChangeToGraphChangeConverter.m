@implementation PGPhotoChangeToGraphChangeConverter

- (PGPhotoChangeToGraphChangeConverter)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v6;
  id v7;
  PGPhotoChangeToGraphChangeConverter *v8;
  PGPhotoChangeToGraphChangeConverter *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGPhotoChangeToGraphChangeConverter;
  v8 = -[PGPhotoChangeToGraphChangeConverter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PGPhotoChangeToGraphChangeConverter _registerTranslatorsWithPhotoLibrary:](v8, "_registerTranslatorsWithPhotoLibrary:", v6);
    objc_storeStrong((id *)&v9->_loggingConnection, a4);
  }

  return v9;
}

- (void)_registerTranslatorsWithPhotoLibrary:(id)a3
{
  void *v4;
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *entityTranslatorByEntityClassName;
  PGGraphAssetTranslator *v8;
  NSMutableDictionary *v9;
  void *v10;
  PGGraphMomentTranslator *v11;
  NSMutableDictionary *v12;
  void *v13;
  PGGraphHighlightTranslator *v14;
  NSMutableDictionary *v15;
  void *v16;
  PGGraphFaceTranslator *v17;
  NSMutableDictionary *v18;
  void *v19;
  PGGraphPersonTranslator *v20;
  NSMutableDictionary *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  PGGraphSocialGroupTranslator *v25;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  entityTranslatorByEntityClassName = self->_entityTranslatorByEntityClassName;
  self->_entityTranslatorByEntityClassName = v6;

  v8 = -[PGGraphEntityTranslator initWithPhotoLibrary:]([PGGraphAssetTranslator alloc], "initWithPhotoLibrary:", v5);
  v9 = self->_entityTranslatorByEntityClassName;
  +[PGGraphEntityTranslator entityClassName](PGGraphAssetTranslator, "entityClassName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v10);

  v11 = -[PGGraphEntityTranslator initWithPhotoLibrary:]([PGGraphMomentTranslator alloc], "initWithPhotoLibrary:", v5);
  v12 = self->_entityTranslatorByEntityClassName;
  +[PGGraphEntityTranslator entityClassName](PGGraphMomentTranslator, "entityClassName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

  v14 = -[PGGraphEntityTranslator initWithPhotoLibrary:]([PGGraphHighlightTranslator alloc], "initWithPhotoLibrary:", v5);
  v15 = self->_entityTranslatorByEntityClassName;
  +[PGGraphEntityTranslator entityClassName](PGGraphHighlightTranslator, "entityClassName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, v16);

  v17 = -[PGGraphEntityTranslator initWithPhotoLibrary:]([PGGraphFaceTranslator alloc], "initWithPhotoLibrary:", v5);
  v18 = self->_entityTranslatorByEntityClassName;
  +[PGGraphEntityTranslator entityClassName](PGGraphFaceTranslator, "entityClassName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v19);

  v20 = -[PGGraphEntityTranslator initWithPhotoLibrary:]([PGGraphPersonTranslator alloc], "initWithPhotoLibrary:", v5);
  v21 = self->_entityTranslatorByEntityClassName;
  +[PGGraphEntityTranslator entityClassName](PGGraphPersonTranslator, "entityClassName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v20, v22);

  v25 = -[PGGraphEntityTranslator initWithPhotoLibrary:]([PGGraphSocialGroupTranslator alloc], "initWithPhotoLibrary:", v5);
  v23 = self->_entityTranslatorByEntityClassName;
  +[PGGraphEntityTranslator entityClassName](PGGraphSocialGroupTranslator, "entityClassName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v25, v24);

}

- (id)graphChangesWithPhotoChange:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  char v10;
  id v11;
  NSObject *loggingConnection;
  void *v13;
  NSMutableDictionary *entityTranslatorByEntityClassName;
  id v15;
  id v16;
  double Current;
  char v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  __int128 v27;
  char v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  _BYTE v38[14];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _Block_copy(v7);
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x2020000000;
  v32 = 0;
  if (v8
    && (v9 = CFAbsoluteTimeGetCurrent(), v9 - v30[3] >= 0.01)
    && (v30[3] = v9,
        v28 = 0,
        (*((void (**)(void *, char *, double))v8 + 2))(v8, &v28, 0.0),
        v10 = *((_BYTE *)v34 + 24) | v28,
        (*((_BYTE *)v34 + 24) = v10) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v38 = 70;
      *(_WORD *)&v38[4] = 2080;
      *(_QWORD *)&v38[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Core/PGPhotoChangeToGraphChangeConverter.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v38 = v6;
      _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "PGPhotoChangeToGraphChangeConverter: handling change %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    entityTranslatorByEntityClassName = self->_entityTranslatorByEntityClassName;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __81__PGPhotoChangeToGraphChangeConverter_graphChangesWithPhotoChange_progressBlock___block_invoke;
    v20[3] = &unk_1E842DEB0;
    v20[4] = self;
    v21 = v6;
    v23 = v7;
    v15 = v13;
    v22 = v15;
    v16 = v8;
    v24 = v16;
    v25 = &v29;
    v27 = xmmword_1CA8EDA00;
    v26 = &v33;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](entityTranslatorByEntityClassName, "enumerateKeysAndObjectsUsingBlock:", v20);
    if (v8
      && (Current = CFAbsoluteTimeGetCurrent(), Current - v30[3] >= 0.01)
      && (v30[3] = Current,
          v28 = 0,
          (*((void (**)(id, char *, double))v16 + 2))(v16, &v28, 1.0),
          v18 = *((_BYTE *)v34 + 24) | v28,
          (*((_BYTE *)v34 + 24) = v18) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v38 = 172;
        *(_WORD *)&v38[4] = 2080;
        *(_QWORD *)&v38[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Core/PGPhotoChangeToGraphChangeConverter.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v11 = v15;
    }

  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_entityTranslatorByEntityClassName, 0);
}

void __81__PGPhotoChangeToGraphChangeConverter_graphChangesWithPhotoChange_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  NSString *v6;
  id v7;
  Class v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  mach_timebase_info v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  double Current;
  uint64_t v31;
  void *v32;
  double v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  int v45;
  unint64_t v46;
  unint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_signpost_id_t v52;
  NSObject *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  mach_timebase_info v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  double v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  int v68;
  NSObject *v69;
  os_signpost_id_t v70;
  NSObject *v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  mach_timebase_info v75;
  NSObject *v76;
  NSObject *v77;
  NSObject *v78;
  double v79;
  double v80;
  uint64_t v81;
  double v82;
  uint64_t v83;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  NSString *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  objc_class *v94;
  uint64_t v95;
  void (**v96)(void);
  id obj;
  mach_timebase_info v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD aBlock[4];
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v111[10];
  double v112;
  __int16 v113;
  double v114;
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v89 = v6;
  v8 = NSClassFromString(v6);
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v111 = v6;
    _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "PGPhotoChangeToGraphChangeConverter: handling entity %@", buf, 0xCu);
  }
  v87 = v7;

  v10 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v11 = os_signpost_id_generate(v10);
  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ChangedLocalIdentifiersForEntityClass", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v14 = mach_absolute_time();
  objc_msgSend(*(id *)(a1 + 40), "changedLocalIdentifiersForEntityClass:", v8);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = mach_absolute_time();
  v16 = info;
  v17 = v13;
  v18 = v17;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v18, OS_SIGNPOST_INTERVAL_END, v11, "ChangedLocalIdentifiersForEntityClass", ", buf, 2u);
  }

  v19 = v18;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v111 = "ChangedLocalIdentifiersForEntityClass";
    *(_WORD *)&v111[8] = 2048;
    v112 = (float)((float)((float)((float)(v15 - v14) * (float)v16.numer) / (float)v16.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v85 = v19;

  v20 = v88;
  objc_msgSend(v88, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C78]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1B38]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1E50]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v21;
  v24 = objc_msgSend(v21, "count");
  v90 = v22;
  v25 = objc_msgSend(v22, "count");
  v86 = v23;
  v26 = objc_msgSend(v23, "count");
  v27 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v111 = v24;
    *(_WORD *)&v111[4] = 1024;
    *(_DWORD *)&v111[6] = v25;
    LOWORD(v112) = 1024;
    *(_DWORD *)((char *)&v112 + 2) = v26;
    _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "PGPhotoChangeToGraphChangeConverter: %d insertions, %d deletions, %d updates", buf, 0x14u);
  }

  v28 = v87;
  if (v24)
  {
    objc_msgSend(v87, "graphChangesForInsertedLocalIdentifiers:progressBlock:", v91, *(_QWORD *)(a1 + 56));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v29);

  }
  if (*(_QWORD *)(a1 + 64))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (Current - *(double *)(v31 + 24) >= *(double *)(a1 + 88))
    {
      *(double *)(v31 + 24) = Current;
      buf[0] = 0;
      (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(a1 + 96));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) |= buf[0];
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
        goto LABEL_82;
    }
  }
  if (v25)
  {
    objc_msgSend(v87, "graphChangesForDeletedLocalIdentifiers:progressBlock:", v90, *(_QWORD *)(a1 + 56));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v32);

  }
  if (*(_QWORD *)(a1 + 64))
  {
    v33 = CFAbsoluteTimeGetCurrent();
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (v33 - *(double *)(v34 + 24) >= *(double *)(a1 + 88))
    {
      *(double *)(v34 + 24) = v33;
      buf[0] = 0;
      (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(a1 + 96));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) |= buf[0];
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
        goto LABEL_82;
    }
  }
  if (!v26)
    goto LABEL_86;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PGPhotoChangeToGraphChangeConverter_graphChangesWithPhotoChange_progressBlock___block_invoke_139;
  aBlock[3] = &unk_1E842DE88;
  v104 = v87;
  v36 = v35;
  v105 = v36;
  v106 = *(id *)(a1 + 40);
  v108 = *(id *)(a1 + 56);
  v107 = *(id *)(a1 + 48);
  v96 = (void (**)(void))_Block_copy(aBlock);
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v86;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v100;
    v93 = *(_QWORD *)v100;
    v94 = v8;
    while (2)
    {
      v40 = 0;
      v95 = v38;
      do
      {
        if (*(_QWORD *)v100 != v39)
          objc_enumerationMutation(obj);
        v41 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v40);
        objc_msgSend(*(id *)(a1 + 40), "changedPropertyNamesForLocalIdentifier:entityClass:", v41, v8);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "count");
        v44 = v42;
        if (v43
          || objc_msgSend((id)objc_opt_class(), "includesRelationshipChanges")
          && (v45 = objc_msgSend(*(id *)(a1 + 40), "hasRelationshipChangesForLocalIdentifier:", v41), v44 = v92, v45))
        {
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v44, v41);
        }
        v46 = objc_msgSend(v36, "count", v44);
        if (v46 >= 0xC8)
        {
          v47 = v46;
          if (*(_QWORD *)(a1 + 64))
          {
            v48 = CFAbsoluteTimeGetCurrent();
            v49 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
            if (v48 - *(double *)(v49 + 24) >= *(double *)(a1 + 88))
            {
              *(double *)(v49 + 24) = v48;
              buf[0] = 0;
              (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(a1 + 96));
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) |= buf[0];
              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
              {
                *a4 = 1;
LABEL_62:

                v68 = 0;
                goto LABEL_77;
              }
            }
          }
          v50 = a1;
          v51 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
          v52 = os_signpost_id_generate(v51);
          v53 = v51;
          v54 = v53;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v52, "ProcessChangedPropertyNames", ", buf, 2u);
          }

          v98 = 0;
          mach_timebase_info(&v98);
          v55 = mach_absolute_time();
          v96[2]();
          v56 = mach_absolute_time();
          v57 = v98;
          v58 = v54;
          v59 = v58;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v111 = v47;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v59, OS_SIGNPOST_INTERVAL_END, v52, "ProcessChangedPropertyNames", "%d entities", buf, 8u);
          }

          v60 = v59;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d entities"), v47);
            v61 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)v111 = "ProcessChangedPropertyNames";
            *(_WORD *)&v111[8] = 2112;
            v112 = v61;
            v113 = 2048;
            v114 = (float)((float)((float)((float)(v56 - v55) * (float)v57.numer) / (float)v57.denom) / 1000000.0);
            _os_log_impl(&dword_1CA237000, v60, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

          }
          a1 = v50;
          v8 = v94;
          if (*(_QWORD *)(v50 + 64))
          {
            v62 = CFAbsoluteTimeGetCurrent();
            v63 = *(_QWORD *)(*(_QWORD *)(v50 + 72) + 8);
            if (v62 - *(double *)(v63 + 24) >= *(double *)(v50 + 88))
            {
              *(double *)(v63 + 24) = v62;
              buf[0] = 0;
              (*(void (**)(double))(*(_QWORD *)(v50 + 64) + 16))(*(double *)(v50 + 96));
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v50 + 80) + 8) + 24) |= buf[0];
              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v50 + 80) + 8) + 24))
              {
                *a4 = 1;

                goto LABEL_62;
              }
            }
          }

          v38 = v95;
          v39 = v93;
        }

        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
      if (v38)
        continue;
      break;
    }
  }

  v64 = objc_msgSend(v36, "count");
  if (v64)
  {
    v65 = v64;
    if (!*(_QWORD *)(a1 + 64))
      goto LABEL_63;
    v66 = CFAbsoluteTimeGetCurrent();
    v67 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (v66 - *(double *)(v67 + 24) >= *(double *)(a1 + 88)
      && (*(double *)(v67 + 24) = v66,
          buf[0] = 0,
          (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(a1 + 96)),
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) |= buf[0],
          v20 = v88,
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)))
    {
      v68 = 0;
      *a4 = 1;
    }
    else
    {
LABEL_63:
      v69 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
      v70 = os_signpost_id_generate(v69);
      v71 = v69;
      v72 = v71;
      if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v72, OS_SIGNPOST_INTERVAL_BEGIN, v70, "ProcessChangedPropertyNames", ", buf, 2u);
      }

      v98 = 0;
      mach_timebase_info(&v98);
      v73 = mach_absolute_time();
      v96[2]();
      v74 = mach_absolute_time();
      v75 = v98;
      v76 = v72;
      v77 = v76;
      if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v111 = v65;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v77, OS_SIGNPOST_INTERVAL_END, v70, "ProcessChangedPropertyNames", "%d entities", buf, 8u);
      }

      v78 = v77;
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d entities"), v65);
        v79 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)v111 = "ProcessChangedPropertyNames";
        *(_WORD *)&v111[8] = 2112;
        v112 = v79;
        v113 = 2048;
        v114 = (float)((float)((float)((float)(v74 - v73) * (float)v75.numer) / (float)v75.denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v78, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

      }
      v20 = v88;
      if (!*(_QWORD *)(a1 + 64))
        goto LABEL_75;
      v80 = CFAbsoluteTimeGetCurrent();
      v81 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (v80 - *(double *)(v81 + 24) >= *(double *)(a1 + 88)
        && (*(double *)(v81 + 24) = v80,
            buf[0] = 0,
            (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(a1 + 96)),
            (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) |= buf[0]) != 0))
      {
        *a4 = 1;

        v68 = 0;
      }
      else
      {
LABEL_75:

        v68 = 1;
      }
    }
  }
  else
  {
    v68 = 1;
LABEL_77:
    v20 = v88;
  }

  v28 = v87;
  if (v68)
  {
LABEL_86:
    if (*(_QWORD *)(a1 + 64))
    {
      v82 = CFAbsoluteTimeGetCurrent();
      v83 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (v82 - *(double *)(v83 + 24) >= *(double *)(a1 + 88))
      {
        *(double *)(v83 + 24) = v82;
        buf[0] = 0;
        (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(a1 + 96));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) |= buf[0];
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
LABEL_82:
          *a4 = 1;
      }
    }
  }

}

void __81__PGPhotoChangeToGraphChangeConverter_graphChangesWithPhotoChange_progressBlock___block_invoke_139(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(*(id *)(a1 + 32), "graphChangesForChangedPropertyNamesByLocalIdentifier:change:progressBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v3);
  objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");

  objc_autoreleasePoolPop(v2);
}

+ (id)managedEntityNamesToTranslate
{
  if (managedEntityNamesToTranslate_onceToken != -1)
    dispatch_once(&managedEntityNamesToTranslate_onceToken, &__block_literal_global_37326);
  return (id)managedEntityNamesToTranslate_managedEntityNamesToTranslate;
}

void __68__PGPhotoChangeToGraphChangeConverter_managedEntityNamesToTranslate__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  +[PGGraphEntityTranslator managedEntityName](PGGraphAssetTranslator, "managedEntityName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v1;
  +[PGGraphEntityTranslator managedEntityName](PGGraphMomentTranslator, "managedEntityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v2;
  +[PGGraphEntityTranslator managedEntityName](PGGraphHighlightTranslator, "managedEntityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v3;
  +[PGGraphEntityTranslator managedEntityName](PGGraphFaceTranslator, "managedEntityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v4;
  +[PGGraphEntityTranslator managedEntityName](PGGraphPersonTranslator, "managedEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v5;
  +[PGGraphEntityTranslator managedEntityName](PGGraphSocialGroupTranslator, "managedEntityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)managedEntityNamesToTranslate_managedEntityNamesToTranslate;
  managedEntityNamesToTranslate_managedEntityNamesToTranslate = v8;

}

@end
