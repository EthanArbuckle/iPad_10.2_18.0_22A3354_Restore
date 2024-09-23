@implementation PGGraphPersonTranslator

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  id v4;
  PGGraphPersonsDeletion *v5;
  void *v6;
  PGGraphPersonsDeletion *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v10 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Delete %ld persons", buf, 0xCu);
  }
  v5 = -[PGGraphPersonsDeletion initWithPersonLocalIdentifiers:]([PGGraphPersonsDeletion alloc], "initWithPersonLocalIdentifiers:", v4);
  v8 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5
{
  double v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  PGGraphPersonsDeletion *v43;
  void *v44;
  PGGraphPersonsDeletion *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  double Current;
  char v53;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  PGGraphPersonTranslator *v63;
  id v64;
  id v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  PGGraphPersonTranslator *v83;
  id v84;
  id v85;
  id v86;
  id v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  double *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  char v98;
  _BYTE v99[128];
  uint8_t v100[128];
  uint8_t buf[8];
  __int128 v102;
  void *v103;
  id v104;
  _QWORD v105[4];

  v105[1] = *MEMORY[0x1E0C80C00];
  v65 = a3;
  v60 = a4;
  v61 = a5;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v98 = 0;
  v91 = 0;
  v92 = (double *)&v91;
  v93 = 0x2020000000;
  v94 = 0;
  v66 = _Block_copy(v61);
  if (!v66
    || (v8 = CFAbsoluteTimeGetCurrent(), v8 - v92[3] < 0.01)
    || (v92[3] = v8,
        LOBYTE(v105[0]) = 0,
        (*((void (**)(void *, _QWORD *, double))v66 + 2))(v66, v105, 0.0),
        v9 = *((_BYTE *)v96 + 24) | LOBYTE(v105[0]),
        (*((_BYTE *)v96 + 24) = v9) == 0))
  {
    -[PGGraphPersonTranslator verifiedTypeProperties](self, "verifiedTypeProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphPersonTranslator stateUpdateProperties](self, "stateUpdateProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphPersonTranslator personTypeProperties](self, "personTypeProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = self;
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __101__PGGraphPersonTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke;
    v79[3] = &unk_1E8432690;
    v57 = v11;
    v80 = v57;
    v62 = v14;
    v81 = v62;
    v59 = v13;
    v82 = v59;
    v83 = v63;
    v64 = v16;
    v84 = v64;
    v58 = v12;
    v85 = v58;
    v19 = v17;
    v86 = v19;
    v55 = v66;
    v87 = v55;
    v88 = &v91;
    v89 = &v95;
    v90 = 0x3F847AE147AE147BLL;
    objc_msgSend(v65, "enumerateKeysAndObjectsUsingBlock:", v79);
    if (*((_BYTE *)v96 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 623;
        LOWORD(v102) = 2080;
        *(_QWORD *)((char *)&v102 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Core/PGGraphEntityTranslator.m";
        v20 = MEMORY[0x1E0C81028];
LABEL_10:
        _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (objc_msgSend(v64, "count"))
      {
        v21 = (void *)MEMORY[0x1E0C99E20];
        objc_msgSend(v64, "allKeys");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setWithArray:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[PGGraphEntityTranslator photoLibrary](v63, "photoLibrary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v23;
        objc_msgSend(v24, "librarySpecificFetchOptions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("localIdentifier"), v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "setPredicate:", v27);
        objc_msgSend(v26, "setIncludedDetectionTypes:", &unk_1E84EA4B0);
        v28 = *MEMORY[0x1E0CD1D50];
        *(_QWORD *)buf = *MEMORY[0x1E0CD1D58];
        *(_QWORD *)&v102 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setFetchPropertySets:", v29);

        objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v75[0] = v18;
        v75[1] = 3221225472;
        v75[2] = __101__PGGraphPersonTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_281;
        v75[3] = &unk_1E84326B8;
        v76 = v19;
        v77 = v15;
        v78 = v64;
        objc_msgSend(v30, "enumerateObjectsUsingBlock:", v75);

      }
      if (objc_msgSend(v62, "count"))
      {
        -[PGGraphEntityTranslator photoLibrary](v63, "photoLibrary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v62;
        objc_msgSend(v31, "librarySpecificFetchOptions");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier IN %@ AND verifiedType = %d"), v56, -2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "setPredicate:", v33);
        objc_msgSend(v32, "setIncludedDetectionTypes:", &unk_1E84EA4C8);
        v105[0] = *MEMORY[0x1E0CD1D58];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setFetchPropertySets:", v34);

        objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v18;
        *(_QWORD *)&v102 = 3221225472;
        *((_QWORD *)&v102 + 1) = __tombstonedLocalIdentifiersFrom_block_invoke;
        v103 = &unk_1E8432768;
        v37 = v36;
        v104 = v37;
        objc_msgSend(v35, "enumerateObjectsUsingBlock:", buf);

        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v38 = v37;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v100, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v72;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v72 != v40)
                objc_enumerationMutation(v38);
              v42 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
              v43 = [PGGraphPersonsDeletion alloc];
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v42);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = -[PGGraphPersonsDeletion initWithPersonLocalIdentifiers:](v43, "initWithPersonLocalIdentifiers:", v44);

              objc_msgSend(v19, "addObject:", v45);
            }
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v100, 16);
          }
          while (v39);
        }

        objc_msgSend(v56, "minusSet:", v38);
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v46 = v56;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v67, v99, 16);
        if (v47)
        {
          v48 = *(_QWORD *)v68;
          do
          {
            for (j = 0; j != v47; ++j)
            {
              if (*(_QWORD *)v68 != v48)
                objc_enumerationMutation(v46);
              objc_msgSend(v15, "addObject:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j));
            }
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v67, v99, 16);
          }
          while (v47);
        }

      }
      if (objc_msgSend(v15, "count"))
      {
        -[PGGraphEntityTranslator photoLibrary](v63, "photoLibrary");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        momentChangesForLocalIdentifiers(v15, v50, &__block_literal_global_55575);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "addObjectsFromArray:", v51);
      }
      if (!v66
        || (Current = CFAbsoluteTimeGetCurrent(), Current - v92[3] < 0.01)
        || (v92[3] = Current,
            LOBYTE(v105[0]) = 0,
            (*((void (**)(id, _QWORD *, double))v55 + 2))(v55, v105, 1.0),
            v53 = *((_BYTE *)v96 + 24) | LOBYTE(v105[0]),
            (*((_BYTE *)v96 + 24) = v53) == 0))
      {
        v10 = v19;
        goto LABEL_38;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 693;
        LOWORD(v102) = 2080;
        *(_QWORD *)((char *)&v102 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Core/PGGraphEntityTranslator.m";
        v20 = MEMORY[0x1E0C81028];
        goto LABEL_10;
      }
    }
    v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_38:

    goto LABEL_39;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 574;
    LOWORD(v102) = 2080;
    *(_QWORD *)((char *)&v102 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Core/PGGraphEntityTranslator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_39:
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v95, 8);

  return v10;
}

- (id)stateUpdateProperties
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("name");
  v6[1] = CFSTR("displayName");
  v6[2] = CFSTR("personUri");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)verifiedTypeProperties
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("verifiedType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)personTypeProperties
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)personNodePropertyKeysFromPHPersonPropertyKeys:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("name"), (_QWORD)v12) & 1) != 0
          || objc_msgSend(v10, "isEqualToString:", CFSTR("displayName")))
        {
          objc_msgSend(v4, "addObject:", CFSTR("name"));
        }
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("type")))
          objc_msgSend(v4, "addObject:", CFSTR("fav"));
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("personUri")))
          objc_msgSend(v4, "addObject:", CFSTR("cnid"));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

void __101__PGGraphPersonTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  PGGraphPersonChange *v10;
  double Current;
  uint64_t v12;

  v7 = a2;
  v8 = a3;
  if (objc_msgSend(v8, "intersectsSet:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  if (objc_msgSend(v8, "intersectsSet:", *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 56), "personNodePropertyKeysFromPHPersonPropertyKeys:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v9, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "intersectsSet:", *(_QWORD *)(a1 + 72)))
  {
    objc_msgSend(*(id *)(a1 + 56), "personNodePropertyKeysFromPHPersonPropertyKeys:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PGGraphPersonChange initWithPersonLocalIdentifier:propertyNames:]([PGGraphPersonChange alloc], "initWithPersonLocalIdentifier:propertyNames:", v7, v9);
    objc_msgSend(*(id *)(a1 + 80), "addObject:", v10);

    goto LABEL_7;
  }
LABEL_8:
  if (*(_QWORD *)(a1 + 88))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    if (Current - *(double *)(v12 + 24) >= *(double *)(a1 + 112))
    {
      *(double *)(v12 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 88) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8)
                                                                             + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
        *a4 = 1;
    }
  }

}

void __101__PGGraphPersonTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_281(id *a1, void *a2)
{
  id v3;
  unint64_t v4;
  PGGraphPersonsDeletion *v5;
  PGGraphPersonChange *v6;
  PGGraphPersonsDeletion *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 < 2)
  {
    objc_msgSend(a1[5], "addObject:", v9);
    objc_msgSend(a1[6], "objectForKeyedSubscript:", v9);
    v5 = (PGGraphPersonsDeletion *)objc_claimAutoreleasedReturnValue();
    v6 = -[PGGraphPersonChange initWithPersonLocalIdentifier:propertyNames:]([PGGraphPersonChange alloc], "initWithPersonLocalIdentifier:propertyNames:", v9, v5);
    objc_msgSend(a1[4], "addObject:", v6);

LABEL_5:
    goto LABEL_6;
  }
  if (v4 == -1)
  {
    v7 = [PGGraphPersonsDeletion alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PGGraphPersonsDeletion initWithPersonLocalIdentifiers:](v7, "initWithPersonLocalIdentifiers:", v8);

    objc_msgSend(a1[4], "addObject:", v5);
    goto LABEL_5;
  }
LABEL_6:

}

id __101__PGGraphPersonTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CD1670];
  v5 = a3;
  objc_msgSend(a2, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchMomentsForPersonsWithLocalIdentifiers:options:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
