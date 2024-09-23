@implementation PGGraphMomentTranslator

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  id v4;
  void *v5;
  PGGraphMomentsInsertion *v6;
  void *v7;
  PGGraphMomentsInsertion *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Batch Updates - Insert %ld new moments", buf, 0xCu);
  }
  objc_msgSend((id)objc_opt_class(), "uuidsFromLocalIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGGraphMomentsInsertion initWithMomentUUIDs:]([PGGraphMomentsInsertion alloc], "initWithMomentUUIDs:", v5);
  v9 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  id v4;
  void *v5;
  PGGraphMomentsDeletion *v6;
  void *v7;
  PGGraphMomentsDeletion *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Batch Updates - Delete %ld moments", buf, 0xCu);
  }
  objc_msgSend((id)objc_opt_class(), "uuidsFromLocalIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGGraphMomentsDeletion initWithMomentUUIDs:]([PGGraphMomentsDeletion alloc], "initWithMomentUUIDs:", v5);
  v9 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5
{
  id v8;
  void *v9;
  double v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  double Current;
  char v28;
  id v29;
  double v30;
  char v31;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint8_t buf[4];
  int v58;
  __int16 v59;
  const char *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v34 = a4;
  v8 = a5;
  v9 = _Block_copy(v8);
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x2020000000;
  v52 = 0;
  if (!v9
    || (v10 = CFAbsoluteTimeGetCurrent(), v10 - v50[3] < 0.01)
    || (v50[3] = v10,
        v48 = 0,
        (*((void (**)(void *, char *, double))v9 + 2))(v9, &v48, 0.0),
        v11 = *((_BYTE *)v54 + 24) | v48,
        (*((_BYTE *)v54 + 24) = v11) == 0))
  {
    -[PGGraphMomentTranslator momentUpdateTypeByMomentProperty](self, "momentUpdateTypeByMomentProperty");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphMomentTranslator highlightUpdateTypeByMomentProperty](self, "highlightUpdateTypeByMomentProperty");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __101__PGGraphMomentTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke;
    v39[3] = &unk_1E8432618;
    v39[4] = self;
    v18 = v13;
    v40 = v18;
    v19 = v16;
    v41 = v19;
    v20 = v14;
    v42 = v20;
    v21 = v15;
    v43 = v21;
    v22 = v9;
    v44 = v22;
    v45 = &v49;
    v46 = &v53;
    v47 = 0x3F847AE147AE147BLL;
    objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v39);
    if (*((_BYTE *)v54 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v58 = 341;
        v59 = 2080;
        v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGG"
              "raphEntityTranslator.m";
        v23 = MEMORY[0x1E0C81028];
LABEL_10:
        _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (objc_msgSend(v21, "count"))
      {
        -[PGGraphEntityTranslator photoLibrary](self, "photoLibrary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "librarySpecificFetchOptions");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "allKeys");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1708], "fetchPhotosHighlightUUIDByMomentUUIDForMomentUUIDs:options:", v25, v33);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          Current = CFAbsoluteTimeGetCurrent();
          if (Current - v50[3] >= 0.01)
          {
            v50[3] = Current;
            v48 = 0;
            (*((void (**)(id, char *, double))v22 + 2))(v22, &v48, 0.5);
            v28 = *((_BYTE *)v54 + 24) | v48;
            *((_BYTE *)v54 + 24) = v28;
            if (v28)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v58 = 350;
                v59 = 2080;
                v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Core/PGGraphEntityTranslator.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_11;
            }
          }
        }
        v36[0] = v17;
        v36[1] = 3221225472;
        v36[2] = __101__PGGraphMomentTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_237;
        v36[3] = &unk_1E8432640;
        v29 = v26;
        v37 = v29;
        v38 = v19;
        objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v36);

      }
      if (!v9
        || (v30 = CFAbsoluteTimeGetCurrent(), v30 - v50[3] < 0.01)
        || (v50[3] = v30,
            v48 = 0,
            (*((void (**)(id, char *, double))v22 + 2))(v22, &v48, 1.0),
            v31 = *((_BYTE *)v54 + 24) | v48,
            (*((_BYTE *)v54 + 24) = v31) == 0))
      {
        v12 = v19;
        goto LABEL_26;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v58 = 364;
        v59 = 2080;
        v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGG"
              "raphEntityTranslator.m";
        v23 = MEMORY[0x1E0C81028];
        goto LABEL_10;
      }
    }
LABEL_11:
    v12 = (id)MEMORY[0x1E0C9AA60];
LABEL_26:

    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v58 = 292;
    v59 = 2080;
    v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGGraph"
          "EntityTranslator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v12 = (id)MEMORY[0x1E0C9AA60];
LABEL_27:
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return v12;
}

- (id)momentUpdateTypeByMomentProperty
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("startDate");
  v3[1] = CFSTR("endDate");
  v4[0] = &unk_1E84E4B98;
  v4[1] = &unk_1E84E4B98;
  v3[2] = CFSTR("approximateLatitude");
  v3[3] = CFSTR("approximateLongitude");
  v4[2] = &unk_1E84E4BB0;
  v4[3] = &unk_1E84E4BB0;
  v3[4] = CFSTR("estimatedAssetCount");
  v4[4] = &unk_1E84E4BC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)highlightUpdateTypeByMomentProperty
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("approximateLatitude");
  v3[1] = CFSTR("approximateLongitude");
  v4[0] = &unk_1E84E4BE0;
  v4[1] = &unk_1E84E4BE0;
  v3[2] = CFSTR("estimatedAssetCount");
  v4[2] = &unk_1E84E4BF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __101__PGGraphMomentTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PGGraphMomentChange *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double Current;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _BYTE *v29;
  id v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "uuidFromLocalIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "length"))
  {
    v29 = a4;
    v30 = v8;
    v31 = v7;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v18 = objc_msgSend(v16, "unsignedIntegerValue");
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              PGGraphChangeStringFromMomentUpdateType(v18);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v39 = v10;
              v40 = 2112;
              v41 = v15;
              v42 = 2112;
              v43 = (uint64_t)v23;
              _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Moment Updated %@, Property changed %@, Need to trigger an %@", buf, 0x20u);

            }
            v19 = -[PGGraphMomentChange initWithMomentUUID:updateTypes:]([PGGraphMomentChange alloc], "initWithMomentUUID:updateTypes:", v10, v18);
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v19);

          }
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v10);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v21)
            {
              objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v21, v10);
            }
            v22 = objc_msgSend(v20, "unsignedIntegerValue");
            objc_msgSend(v21, "addIndex:", v22);
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              PGGraphChangeStringFromHighlightUpdateType(v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v39 = v10;
              v40 = 2112;
              v41 = v15;
              v42 = 2112;
              v43 = (uint64_t)v24;
              _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Moment %@ updated %@, Need to update highlight for updateType %@", buf, 0x20u);

            }
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v12);
    }

    v8 = v30;
    v7 = v31;
    if (*(_QWORD *)(a1 + 72))
    {
      Current = CFAbsoluteTimeGetCurrent();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      if (Current - *(double *)(v26 + 24) >= *(double *)(a1 + 96))
      {
        *(double *)(v26 + 24) = Current;
        buf[0] = 0;
        (*(void (**)(double))(*(_QWORD *)(a1 + 72) + 16))(0.5);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) |= buf[0];
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
          *v29 = 1;
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = objc_opt_class();
    objc_msgSend((id)objc_opt_class(), "entityClassName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v39 = v10;
    v40 = 2112;
    v41 = v7;
    v42 = 2112;
    v43 = v27;
    v44 = 2112;
    v45 = v28;
    v46 = 2112;
    v47 = v8;
    _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Moment updated but momentUUID is invalid (%@) for local identifier: %@, class: %@, entityClassName: %@, changedPropertyNames: %@", buf, 0x34u);

  }
}

void __101__PGGraphMomentTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_237(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __101__PGGraphMomentTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2;
    v8[3] = &unk_1E84348D0;
    v9 = v5;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v8);

  }
}

void __101__PGGraphMomentTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  PGGraphHighlightChange *v3;

  v3 = -[PGGraphHighlightChange initWithHighlightUUID:updateTypes:]([PGGraphHighlightChange alloc], "initWithHighlightUUID:updateTypes:", *(_QWORD *)(a1 + 32), a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

@end
