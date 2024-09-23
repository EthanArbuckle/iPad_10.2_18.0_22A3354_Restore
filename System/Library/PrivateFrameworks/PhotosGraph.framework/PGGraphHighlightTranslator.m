@implementation PGGraphHighlightTranslator

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)includesRelationshipChanges
{
  return 1;
}

- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  id v4;
  void *v5;
  PGGraphHighlightsInsertion *v6;
  void *v7;
  PGGraphHighlightsInsertion *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Batch Updates - Insert %ld new highlights", buf, 0xCu);
  }
  objc_msgSend((id)objc_opt_class(), "uuidsFromLocalIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGGraphHighlightsInsertion initWithHighlightUUIDs:]([PGGraphHighlightsInsertion alloc], "initWithHighlightUUIDs:", v5);
  v9 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  id v4;
  void *v5;
  PGGraphHighlightsDeletion *v6;
  void *v7;
  PGGraphHighlightsDeletion *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Batch Updates - Delete %ld highlights", buf, 0xCu);
  }
  objc_msgSend((id)objc_opt_class(), "uuidsFromLocalIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGGraphHighlightsDeletion initWithHighlightUUIDs:]([PGGraphHighlightsDeletion alloc], "initWithHighlightUUIDs:", v5);
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
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double Current;
  char v29;
  id v30;
  double v31;
  char v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  double *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint8_t buf[4];
  int v66;
  __int16 v67;
  const char *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v39 = a4;
  v8 = a5;
  v9 = _Block_copy(v8);
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v57 = 0;
  v58 = (double *)&v57;
  v59 = 0x2020000000;
  v60 = 0;
  if (!v9
    || (v10 = CFAbsoluteTimeGetCurrent(), v10 - v58[3] < 0.01)
    || (v58[3] = v10,
        v56 = 0,
        (*((void (**)(void *, char *, double))v9 + 2))(v9, &v56, 0.0),
        v11 = *((_BYTE *)v62 + 24) | v56,
        (*((_BYTE *)v62 + 24) = v11) == 0))
  {
    -[PGGraphHighlightTranslator highlightUpdateDateProperties](self, "highlightUpdateDateProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphHighlightTranslator highlightUpdateTypeProperties](self, "highlightUpdateTypeProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphHighlightTranslator highlightUpdateAssetCountProperties](self, "highlightUpdateAssetCountProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphHighlightTranslator highlightUpdateSearchProperties](self, "highlightUpdateSearchProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphHighlightTranslator momentUpdateTypeByHighlightProperty](self, "momentUpdateTypeByHighlightProperty");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __104__PGGraphHighlightTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke;
    v43[3] = &unk_1E8432668;
    v34 = v13;
    v44 = v34;
    v35 = v14;
    v45 = v35;
    v46 = v39;
    v37 = v16;
    v47 = v37;
    v36 = v15;
    v48 = v36;
    v20 = v19;
    v49 = v20;
    v21 = v17;
    v50 = v21;
    v22 = v18;
    v51 = v22;
    v23 = v9;
    v52 = v23;
    v53 = &v57;
    v54 = &v61;
    v55 = 0x3F847AE147AE147BLL;
    objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v43);
    if (objc_msgSend(v22, "count"))
    {
      -[PGGraphEntityTranslator photoLibrary](self, "photoLibrary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "librarySpecificFetchOptions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "allKeys");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs:options:", v26, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v58[3] >= 0.01)
        {
          v58[3] = Current;
          v56 = 0;
          (*((void (**)(id, char *, double))v23 + 2))(v23, &v56, 0.5);
          v29 = *((_BYTE *)v62 + 24) | v56;
          *((_BYTE *)v62 + 24) = v29;
          if (v29)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v66 = 487;
              v67 = 2080;
              v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Co"
                    "re/PGGraphEntityTranslator.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_20;
          }
        }
      }
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __104__PGGraphHighlightTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_255;
      v40[3] = &unk_1E8432640;
      v30 = v27;
      v41 = v30;
      v42 = v20;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v40);

    }
    if (!v9
      || (v31 = CFAbsoluteTimeGetCurrent(), v31 - v58[3] < 0.01)
      || (v58[3] = v31,
          v56 = 0,
          (*((void (**)(id, char *, double))v23 + 2))(v23, &v56, 1.0),
          v32 = *((_BYTE *)v62 + 24) | v56,
          (*((_BYTE *)v62 + 24) = v32) == 0))
    {
      v12 = v20;
      goto LABEL_22;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v66 = 499;
      v67 = 2080;
      v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGGra"
            "phEntityTranslator.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_20:
    v12 = (id)MEMORY[0x1E0C9AA60];
LABEL_22:

    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v66 = 418;
    v67 = 2080;
    v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGGraph"
          "EntityTranslator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v12 = (id)MEMORY[0x1E0C9AA60];
LABEL_23:
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  return v12;
}

- (id)highlightUpdateDateProperties
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("startDate");
  v6[1] = CFSTR("endDate");
  v6[2] = CFSTR("startTimeZoneOffset");
  v6[3] = CFSTR("endTimeZoneOffset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)highlightUpdateTypeProperties
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("type");
  v6[1] = CFSTR("category");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)highlightUpdateAssetCountProperties
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("estimatedAssetCount");
  v6[1] = CFSTR("dayGroupAssetsCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)highlightUpdateSearchProperties
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("verboseSmartDescription");
  v6[1] = CFSTR("subtitle");
  v6[2] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)momentUpdateTypeByHighlightProperty
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("extendedCount");
  v4[0] = &unk_1E84E4B80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __104__PGGraphHighlightTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  PGGraphHighlightChange *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double Current;
  uint64_t v23;
  _BYTE *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CD1708], "uuidFromLocalIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "intersectsSet:", *(_QWORD *)(a1 + 32)))
    v9 = 2;
  else
    v9 = 0;
  if (objc_msgSend(v7, "intersectsSet:", *(_QWORD *)(a1 + 40), a4))
    v9 |= 4uLL;
  if ((objc_msgSend(*(id *)(a1 + 48), "momentRelationshipChangedForHighlightWithLocalIdentifier:", v6) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 48), "highlightGroupRelationshipChangedForHighlightWithLocalIdentifier:", v6))
  {
    v9 |= 8uLL;
  }
  v10 = v9 | objc_msgSend(*(id *)(a1 + 48), "assetsOrDayGroupAssetsRelationshipChangedForHighlightWithLocalIdentifier:", v6);
  if ((objc_msgSend(v7, "intersectsSet:", *(_QWORD *)(a1 + 56)) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "keyAssetPrivateOrDayGroupKeyAssetPrivateChangedForHighlightWithLocalIdentifier:", v6) & 1) != 0|| objc_msgSend(*(id *)(a1 + 48), "keyAssetSharedOrDayGroupKeyAssetSharedChangedForHighlightWithLocalIdentifier:", v6))
  {
    v10 |= 0x40uLL;
  }
  v26 = v6;
  if (objc_msgSend(v7, "intersectsSet:", *(_QWORD *)(a1 + 64)))
    v10 |= 0x10uLL;
  if (v10)
  {
    v11 = -[PGGraphHighlightChange initWithHighlightUUID:updateTypes:]([PGGraphHighlightChange alloc], "initWithHighlightUUID:updateTypes:", v8, v10);
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v11);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", v8);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 88), "setObject:forKeyedSubscript:", v19, v8);
          }
          v20 = objc_msgSend(v18, "unsignedIntegerValue");
          objc_msgSend(v19, "addIndex:", v20);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            PGGraphChangeStringFromMomentUpdateType(v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v32 = v8;
            v33 = 2112;
            v34 = v17;
            v35 = 2112;
            v36 = v21;
            _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Highlight %@ updated %@, Need to update moment for updateType %@", buf, 0x20u);

          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v14);
  }

  if (*(_QWORD *)(a1 + 96))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    if (Current - *(double *)(v23 + 24) >= *(double *)(a1 + 120))
    {
      *(double *)(v23 + 24) = Current;
      buf[0] = 0;
      (*(void (**)(double))(*(_QWORD *)(a1 + 96) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) |= buf[0];
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
        *v25 = 1;
    }
  }

}

void __104__PGGraphHighlightTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_255(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        v13[0] = v10;
        v13[1] = 3221225472;
        v13[2] = __104__PGGraphHighlightTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2;
        v13[3] = &unk_1E84348D0;
        v13[4] = v12;
        v14 = *(id *)(a1 + 40);
        objc_msgSend(v5, "enumerateIndexesUsingBlock:", v13);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

void __104__PGGraphHighlightTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  PGGraphMomentChange *v3;

  v3 = -[PGGraphMomentChange initWithMomentUUID:updateTypes:]([PGGraphMomentChange alloc], "initWithMomentUUID:updateTypes:", *(_QWORD *)(a1 + 32), a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

@end
