@implementation PGGraphAssetTranslator

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double Current;
  char v27;
  id v28;
  double v29;
  char v30;
  NSObject *v31;
  void *v32;
  void *v33;
  double v34;
  char v35;
  id v36;
  double v37;
  char v38;
  void *v40;
  id v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  double *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint8_t buf[4];
  int v68;
  __int16 v69;
  const char *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v41 = a4;
  v9 = a5;
  v10 = _Block_copy(v9);
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0;
  v60 = (double *)&v59;
  v61 = 0x2020000000;
  v62 = 0;
  if (!v10
    || (v11 = CFAbsoluteTimeGetCurrent(), v11 - v60[3] < 0.01)
    || (v60[3] = v11,
        v58 = 0,
        (*((void (**)(void *, char *, double))v10 + 2))(v10, &v58, 0.0),
        v12 = *((_BYTE *)v64 + 24) | v58,
        (*((_BYTE *)v64 + 24) = v12) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphAssetTranslator momentUpdateTypeByAssetProperty](self, "momentUpdateTypeByAssetProperty");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphAssetTranslator highlightUpdateTypeByAssetProperty](self, "highlightUpdateTypeByAssetProperty");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke;
    v49[3] = &unk_1E8432618;
    v49[4] = self;
    v18 = v14;
    v50 = v18;
    v19 = v15;
    v51 = v19;
    v20 = v16;
    v52 = v20;
    v21 = v17;
    v53 = v21;
    v22 = v10;
    v54 = v22;
    v55 = &v59;
    v56 = &v63;
    v57 = 0x3F847AE147AE147BLL;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v49);
    if (*((_BYTE *)v64 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v68 = 197;
        v69 = 2080;
        v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGG"
              "raphEntityTranslator.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v13 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_41;
    }
    -[PGGraphEntityTranslator photoLibrary](self, "photoLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "librarySpecificFetchOptions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v19, "allKeys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentUUIDByAssetUUIDForAssetUUIDs:options:", v24, v40);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v60[3] >= 0.01)
        {
          v60[3] = Current;
          v58 = 0;
          (*((void (**)(id, char *, double))v22 + 2))(v22, &v58, 0.5);
          v27 = *((_BYTE *)v64 + 24) | v58;
          *((_BYTE *)v64 + 24) = v27;
          if (v27)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v68 = 206;
              v69 = 2080;
              v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Co"
                    "re/PGGraphEntityTranslator.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_38;
          }
        }
      }
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_214;
      v46[3] = &unk_1E8432640;
      v28 = v25;
      v47 = v28;
      v48 = v42;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v46);

    }
    if (v10
      && (v29 = CFAbsoluteTimeGetCurrent(), v29 - v60[3] >= 0.01)
      && (v60[3] = v29,
          v58 = 0,
          (*((void (**)(id, char *, double))v22 + 2))(v22, &v58, 0.5),
          v30 = *((_BYTE *)v64 + 24) | v58,
          (*((_BYTE *)v64 + 24) = v30) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v68 = 220;
        v69 = 2080;
        v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGG"
              "raphEntityTranslator.m";
        v31 = MEMORY[0x1E0C81028];
LABEL_37:
        _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (objc_msgSend(v21, "count"))
      {
        objc_msgSend(v21, "allKeys");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1708], "fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs:options:", v32, v40);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v34 = CFAbsoluteTimeGetCurrent();
          if (v34 - v60[3] >= 0.01)
          {
            v60[3] = v34;
            v58 = 0;
            (*((void (**)(id, char *, double))v22 + 2))(v22, &v58, 0.5);
            v35 = *((_BYTE *)v64 + 24) | v58;
            *((_BYTE *)v64 + 24) = v35;
            if (v35)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v68 = 227;
                v69 = 2080;
                v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Core/PGGraphEntityTranslator.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_38;
            }
          }
        }
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_219;
        v43[3] = &unk_1E8432640;
        v36 = v33;
        v44 = v36;
        v45 = v42;
        objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v43);

      }
      if (!v10
        || (v37 = CFAbsoluteTimeGetCurrent(), v37 - v60[3] < 0.01)
        || (v60[3] = v37,
            v58 = 0,
            (*((void (**)(id, char *, double))v22 + 2))(v22, &v58, 1.0),
            v38 = *((_BYTE *)v64 + 24) | v58,
            (*((_BYTE *)v64 + 24) = v38) == 0))
      {
        v13 = v42;
        goto LABEL_40;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v68 = 241;
        v69 = 2080;
        v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGG"
              "raphEntityTranslator.m";
        v31 = MEMORY[0x1E0C81028];
        goto LABEL_37;
      }
    }
LABEL_38:
    v13 = (id)MEMORY[0x1E0C9AA60];
LABEL_40:

LABEL_41:
    goto LABEL_42;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v68 = 150;
    v69 = 2080;
    v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGGraph"
          "EntityTranslator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v13 = (id)MEMORY[0x1E0C9AA60];
LABEL_42:
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return v13;
}

- (id)momentUpdateTypeByAssetProperty
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("favorite");
  v3[1] = CFSTR("adjustmentTimestamp");
  v4[0] = &unk_1E84E4B80;
  v4[1] = &unk_1E84E4B80;
  v3[2] = CFSTR("analysisStateModificationDate");
  v4[2] = &unk_1E84E4B80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)highlightUpdateTypeByAssetProperty
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("favorite");
  v3[1] = CFSTR("adjustmentTimestamp");
  v4[0] = &unk_1E84E4B80;
  v4[1] = &unk_1E84E4B80;
  v3[2] = CFSTR("analysisStateModificationDate");
  v4[2] = &unk_1E84E4B80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double Current;
  uint64_t v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v22 = v6;
  objc_msgSend((id)objc_opt_class(), "uuidFromLocalIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v16, v8);
          }
          objc_msgSend(v16, "addIndex:", objc_msgSend(v15, "unsignedIntegerValue"));

        }
        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v18, v8);
          }
          objc_msgSend(v18, "addIndex:", objc_msgSend(v17, "unsignedIntegerValue"));

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  if (*(_QWORD *)(a1 + 72))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    if (Current - *(double *)(v20 + 24) >= *(double *)(a1 + 96))
    {
      *(double *)(v20 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 72) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
        *a4 = 1;
    }
  }

}

void __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_214(uint64_t a1, uint64_t a2, void *a3)
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
    v8[2] = __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2;
    v8[3] = &unk_1E84348D0;
    v9 = v5;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v8);

  }
}

void __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_219(uint64_t a1, uint64_t a2, void *a3)
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
    v8[2] = __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2_220;
    v8[3] = &unk_1E84348D0;
    v9 = v5;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v8);

  }
}

void __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2_220(uint64_t a1, uint64_t a2)
{
  PGGraphHighlightChange *v3;

  v3 = -[PGGraphHighlightChange initWithHighlightUUID:updateTypes:]([PGGraphHighlightChange alloc], "initWithHighlightUUID:updateTypes:", *(_QWORD *)(a1 + 32), a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  PGGraphMomentChange *v3;

  v3 = -[PGGraphMomentChange initWithMomentUUID:updateTypes:]([PGGraphMomentChange alloc], "initWithMomentUUID:updateTypes:", *(_QWORD *)(a1 + 32), a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

@end
