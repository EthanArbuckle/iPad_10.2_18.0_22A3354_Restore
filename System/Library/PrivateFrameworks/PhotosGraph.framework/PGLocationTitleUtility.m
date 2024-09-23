@implementation PGLocationTitleUtility

+ (void)generateBusinessItemLocationWithOptions:(id)a3 result:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  void *v10;
  PGGraphMomentNodeCollection *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  if (v7)
  {
    objc_msgSend(v6, "momentNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "graph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count") && v10)
    {
      v11 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", v8, v10);
      v12 = (void *)MEMORY[0x1E0D429D8];
      +[PGGraphMomentNode businessOfMoment](PGGraphMomentNode, "businessOfMoment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "adjacencyWithSources:relation:targetsClass:", v11, v13, objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "businessNodeForTitlingFromMomentNodes:businessNodesByMomentNode:", v11, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v6, "lineBreakBehavior");
        v22[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
        v18 = v14;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_titleWithLineBreakBehavior:forTitle:titleComponents:", v21, v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v18;
        v7[2](v7, v20, v16);

      }
      else
      {
        v7[2](v7, 0, 0);
      }

    }
    else
    {
      v7[2](v7, 0, 0);
    }

  }
}

+ (id)businessNodeForTitlingFromMomentNodes:(id)a3 businessNodesByMomentNode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[3];
  char v22;

  v5 = a3;
  objc_msgSend(a4, "intersectingSourcesWith:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v22 = 1;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __90__PGLocationTitleUtility_businessNodeForTitlingFromMomentNodes_businessNodesByMomentNode___block_invoke;
    v18 = &unk_1E84342A8;
    v9 = v6;
    v19 = v9;
    v20 = v21;
    objc_msgSend(v5, "enumerateIdentifiersAsCollectionsWithBlock:", &v15);
    objc_msgSend(v9, "targets", v15, v16, v17, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyNode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v12, "length") <= 0x1E && objc_msgSend(v12, "length"))
      v13 = v11;
    else
      v13 = 0;

    _Block_object_dispose(v21, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (void)generateLocationTitleWithOptions:(id)a3 locationHelper:(id)a4 serviceManager:(id)a5 result:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  PGLocationTripTitleUtility *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  uint64_t v39;
  char v40;
  char v41;
  char v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  PGIncompleteLocationResolver *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void (**v69)(id, _QWORD, void *);
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[6];
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v71 = a4;
  v67 = a5;
  v69 = (void (**)(id, _QWORD, void *))a6;
  v70 = v10;
  objc_msgSend(v10, "momentNodes");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v68, "count"))
  {
    v11 = v10;
    if (objc_msgSend(v10, "useBusinessItems"))
    {
      v94 = 0;
      v95 = &v94;
      v96 = 0x3032000000;
      v97 = __Block_byref_object_copy__62152;
      v98 = __Block_byref_object_dispose__62153;
      v99 = 0;
      v88 = 0;
      v89 = &v88;
      v90 = 0x3032000000;
      v91 = __Block_byref_object_copy__62152;
      v92 = __Block_byref_object_dispose__62153;
      v93 = 0;
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __96__PGLocationTitleUtility_generateLocationTitleWithOptions_locationHelper_serviceManager_result___block_invoke;
      v87[3] = &unk_1E84342D0;
      v87[4] = &v94;
      v87[5] = &v88;
      +[PGLocationTitleUtility generateBusinessItemLocationWithOptions:result:](PGLocationTitleUtility, "generateBusinessItemLocationWithOptions:result:", v10, v87);
      if (v95[5])
      {
        if (v69)
        {
          if (v89[5])
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
          else
            objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v69[2](v69, v95[5], v57);

        }
        _Block_object_dispose(&v88, 8);

        _Block_object_dispose(&v94, 8);
        goto LABEL_88;
      }
      _Block_object_dispose(&v88, 8);

      _Block_object_dispose(&v94, 8);
      v11 = v10;
    }
    objc_msgSend(v11, "keyAssetAddressNode");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "curationAddressNodes");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v10, "lineBreakBehavior");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v13 = v68;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v84;
      v16 = 1.79769313e308;
      v17 = -1.79769313e308;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v84 != v15)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          objc_msgSend(v19, "timestampUTCStart");
          v21 = v20;
          objc_msgSend(v19, "timestampUTCEnd");
          if (v21 < v16)
            v16 = v21;
          if (v22 > v17)
            v17 = v22;
          objc_msgSend(v19, "addressNodes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            objc_msgSend(v12, "unionSet:", v23);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
      }
      while (v14);
    }
    else
    {
      v16 = 1.79769313e308;
      v17 = -1.79769313e308;
    }

    v24 = objc_msgSend(v12, "count");
    if (v69 && !v24)
      v69[2](v69, 0, 0);
    v25 = objc_msgSend(v70, "filterSignificantLocationsType");
    v26 = objc_msgSend(v70, "useTripTitleForLongDuration");
    if (v17 - v16 > 172800.0)
      v27 = v26;
    else
      v27 = 0;
    if (v27 == 1)
    {
      v28 = -[PGLocationTripTitleUtility initWithMomentNodes:filterMomentsAndCities:locationHelper:]([PGLocationTripTitleUtility alloc], "initWithMomentNodes:filterMomentsAndCities:locationHelper:", v13, v25 != 0, v71);
      -[PGLocationTripTitleUtility title](v28, "title");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGLocationTripTitleUtility usedLocationNodes](v28, "usedLocationNodes");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        v73 = v61;
LABEL_82:
        if (v69)
          ((void (**)(id, void *, void *))v69)[2](v69, v66, v73);

        goto LABEL_88;
      }
    }
    else
    {
      v61 = 0;
    }
    v62 = -[PGIncompleteLocationResolver initWithAddressNodes:locationHelper:]([PGIncompleteLocationResolver alloc], "initWithAddressNodes:locationHelper:", v12, v71);
    if (v25)
    {
      objc_msgSend(a1, "_filteredAddressNodesWithAddressNodes:momentNodes:incompleteLocationResolver:filterSignificantLocationsOption:locationHelper:", v12, v13, v62, objc_msgSend(v70, "filterSignificantLocationsType"), v71);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29 != v12 || (v30 = objc_msgSend(v12, "count"), v30 != objc_msgSend(v12, "count")))
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v29);
        v31 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v31;
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v70, "peopleDisplayType"))
    {
      objc_msgSend((id)objc_opt_class(), "peopleLocationTitleComponentsFromAddressNodesSet:peopleDisplayType:serviceManager:", v12, objc_msgSend(v70, "peopleDisplayType"), v67);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "unionSet:", v33);

    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v34 = v32;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v80 != v36)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * j), "addressNodes");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "unionSet:", v38);
          objc_msgSend(v12, "minusSet:", v38);

        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
      }
      while (v35);
    }

    v39 = objc_msgSend(v70, "aoiDisplayType");
    if ((unint64_t)(v39 - 1) > 3)
    {
      v65 = 0;
    }
    else
    {
      objc_msgSend(a1, "commonAOIComponentsForMomentNodes:addressNodes:aoiDisplayType:containsAmusementParkPOI:locationHelper:", v13, v12, v39, objc_msgSend(a1, "containsAmusementParkPOIFromMomentNodes:", v13), v71);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v70, "useCities"))
    {
      objc_msgSend(a1, "_commonCityTitleComponentsFromMomentNodes:remainingAddressNodes:ignoredAddressNodes:incompleteLocationResolver:locationHelper:", v13, v12, v74, v62, v71);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v65, "count"))
      {
        if (v60)
          objc_msgSend(v34, "unionSet:");
        else
          v60 = 0;
        goto LABEL_58;
      }
    }
    else
    {
      v60 = 0;
      if (!objc_msgSend(v65, "count"))
        goto LABEL_58;
    }
    objc_msgSend(v34, "unionSet:", v65);
LABEL_58:
    v40 = objc_msgSend(v70, "showAllCities");
    v41 = objc_msgSend(v70, "useDistrict");
    v42 = objc_msgSend(v70, "allowFamilyHome");
    LOBYTE(v94) = 0;
    BYTE2(v58) = v40;
    BYTE1(v58) = v42;
    LOBYTE(v58) = v41;
    objc_msgSend(a1, "_beautifiedLocationStringWithTitleComponents:momentNodes:lineBreakBehavior:keyAssetAddressNode:curationAddressNodes:isMatchingKeyAsset:useDistrict:allowFamilyHome:showAllCities:locationHelper:serviceManager:", v34, v13, v72, v64, v63, &v94, v58, v71, v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(_BYTE)v94 && objc_msgSend(v65, "count"))
    {
      objc_msgSend(v34, "minusSet:", v65);
      if (objc_msgSend(v60, "count"))
        objc_msgSend(v34, "unionSet:", v60);
      BYTE2(v59) = v40;
      BYTE1(v59) = v42;
      LOBYTE(v59) = v41;
      objc_msgSend(a1, "_beautifiedLocationStringWithTitleComponents:momentNodes:lineBreakBehavior:keyAssetAddressNode:curationAddressNodes:isMatchingKeyAsset:useDistrict:allowFamilyHome:showAllCities:locationHelper:serviceManager:", v34, v13, v72, v64, v63, &v94, v59, v71, v67);
      v43 = objc_claimAutoreleasedReturnValue();

      v66 = (void *)v43;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v44 = v34;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v76;
      do
      {
        v47 = 0;
        do
        {
          if (*(_QWORD *)v76 != v46)
            objc_enumerationMutation(v44);
          v48 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v47);
          objc_msgSend(v48, "node");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v49;
          if (v49)
          {
            if (objc_msgSend(v49, "domain") == 200 || objc_msgSend(v50, "domain") == 201)
            {
              objc_msgSend(v73, "addObject:", v50);
            }
            else if (objc_msgSend(v50, "domain") == 300)
            {
              objc_msgSend(v48, "edge");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v51;
              if (v51)
              {
                objc_msgSend(v51, "sourceNode");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "cityNodeFromAddressNode:", v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "anyNode");
                v55 = (void *)objc_claimAutoreleasedReturnValue();

                if (v55)
                  objc_msgSend(v73, "addObject:", v55);

              }
            }
          }

          ++v47;
        }
        while (v45 != v47);
        v56 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
        v45 = v56;
      }
      while (v56);
    }

    goto LABEL_82;
  }
  if (v69)
    v69[2](v69, 0, 0);
LABEL_88:

}

+ (BOOL)containsAmusementParkPOIFromMomentNodes:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x1E0C809B0];
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __66__PGLocationTitleUtility_containsAmusementParkPOIFromMomentNodes___block_invoke;
      v11[3] = &unk_1E8434300;
      v11[4] = &v16;
      objc_msgSend(v8, "enumeratePOINodesUsingBlock:", v11);
      if (*((_BYTE *)v17 + 24))
        break;
      if (v4 == ++v7)
      {
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

  v9 = *((_BYTE *)v17 + 24) != 0;
  _Block_object_dispose(&v16, 8);

  return v9;
}

+ (void)generateLocationTitleForTripWithMomentNodes:(id)a3 locationHelper:(id)a4 result:(id)a5
{
  id v7;
  id v8;
  PGLocationTripTitleUtility *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *, void *);

  v12 = (void (**)(id, void *, void *))a5;
  v7 = a4;
  v8 = a3;
  v9 = -[PGLocationTripTitleUtility initWithMomentNodes:filterMomentsAndCities:locationHelper:]([PGLocationTripTitleUtility alloc], "initWithMomentNodes:filterMomentsAndCities:locationHelper:", v8, 1, v7);

  if (v12)
  {
    -[PGLocationTripTitleUtility title](v9, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGLocationTripTitleUtility usedLocationNodes](v9, "usedLocationNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v10, v11);

  }
}

+ (void)generateHighlightLocationTitleForTripWithMomentNodes:(id)a3 lineBreakBehavior:(unint64_t)a4 locationHelper:(id)a5 result:(id)a6
{
  void (**v10)(id, void *, void *);
  id v11;
  id v12;
  PGLocationTripTitleUtility *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[16];

  v10 = (void (**)(id, void *, void *))a6;
  v11 = a5;
  v12 = a3;
  v13 = -[PGLocationTripTitleUtility initWithMomentNodes:filterMomentsAndCities:allowLongAOI:locationHelper:]([PGLocationTripTitleUtility alloc], "initWithMomentNodes:filterMomentsAndCities:allowLongAOI:locationHelper:", v12, 1, 0, v11);

  -[PGLocationTripTitleUtility usedTitleComponents](v13, "usedTitleComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[PGLocationTripTitleUtility tripTitleType](v13, "tripTitleType"))
  {
    case 0uLL:
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "loggingConnection");
      v21 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "Trip title type was not set properly, found to be PGTripTitleTypeOther", buf, 2u);
      }

      goto LABEL_12;
    case 1uLL:
    case 2uLL:
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PGTripHighlightTitleFormatOneLocation %@"), CFSTR("PGTripHighlightTitleFormatOneLocation %@"), CFSTR("Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringWithFormat:", v18, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v23;
      v24 = CFSTR("PGTripHighlightTitleFormatToLocation %@ andLocation %@");
      goto LABEL_8;
    case 4uLL:
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v23;
      v24 = CFSTR("PGTripHighlightTitleFormatFromLocation %@ toLocation %@");
LABEL_8:
      objc_msgSend(v23, "localizedStringForKey:value:table:", v24, v24, CFSTR("Localizable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringWithFormat:", v25, v15, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      if (!v19)
        goto LABEL_12;
      objc_msgSend(a1, "_titleWithLineBreakBehavior:forTitle:titleComponents:", a4, v19, v14);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_14;
      goto LABEL_13;
    default:
LABEL_12:
      v26 = 0;
      if (v10)
      {
LABEL_13:
        -[PGLocationTripTitleUtility usedLocationNodes](v13, "usedLocationNodes");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v26, v27);

      }
LABEL_14:

      return;
  }
}

+ (id)_filteredAddressNodesWithAddressNodes:(id)a3 momentNodes:(id)a4 incompleteLocationResolver:(id)a5 filterSignificantLocationsOption:(unint64_t)a6 locationHelper:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  PGLocationsResolver *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PGLocationsFilterer *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  PGGraphLocationNodeCollection *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  PGGraphAddressNodeCollection *v35;
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = -[PGLocationsResolver initWithMomentNodes:incompleteLocationResolver:locationHelper:]([PGLocationsResolver alloc], "initWithMomentNodes:incompleteLocationResolver:locationHelper:", v14, v13, v12);

  LODWORD(v16) = 1051931443;
  -[PGLocationsResolver setMaximumMissingLocationsThreshold:](v15, "setMaximumMissingLocationsThreshold:", v16);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v18;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "sortedArrayUsingDescriptors:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGLocationsResolver resolvedLocationNodes](v15, "resolvedLocationNodes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PGLocationsFilterer initWithSortedMomentNodes:locationNodes:incompleteLocationResolver:]([PGLocationsFilterer alloc], "initWithSortedMomentNodes:locationNodes:incompleteLocationResolver:", v21, v22, v13);

  if (a6 == 3)
    v24 = 2;
  else
    v24 = a6 == 2;
  -[PGLocationsFilterer setFilteringType:](v23, "setFilteringType:", v24);
  -[PGLocationsFilterer filteredLocationNodes](v23, "filteredLocationNodes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");
  if (v26 < objc_msgSend(v22, "count") && objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "anyObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "graph");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = -[MAElementCollection initWithSet:graph:]([PGGraphAddressNodeCollection alloc], "initWithSet:graph:", v11, v28);
    v29 = -[MAElementCollection initWithArray:graph:]([PGGraphLocationNodeCollection alloc], "initWithArray:graph:", v25, v28);
    -[PGGraphLocationNodeCollection addressNodes](v29, "addressNodes");
    v30 = v11;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAElementCollection collectionByIntersecting:](v35, "collectionByIntersecting:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "temporarySet");
    v34 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v34;
  }

  return v11;
}

+ (id)_filteredAOINodesForAddressNodes:(id)a3 aoiTitleMaximumLength:(unint64_t)a4 locationHelper:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  _QWORD v23[4];
  id v24;
  id v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v14, "collection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "areaNodesFromAddressNodes:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "temporarySet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __96__PGLocationTitleUtility__filteredAOINodesForAddressNodes_aoiTitleMaximumLength_locationHelper___block_invoke;
        v23[3] = &unk_1E8434328;
        v25 = a1;
        v24 = v8;
        v26 = a4;
        objc_msgSend(v18, "objectsPassingTest:", v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "unionSet:", v19);

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  return v9;
}

+ (id)commonAOIComponentsForMomentNodes:(id)a3 addressNodes:(id)a4 aoiDisplayType:(unint64_t)a5 containsAmusementParkPOI:(BOOL)a6 locationHelper:(id)a7
{
  _BOOL4 v8;
  id v11;
  double v12;
  BOOL v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  uint64_t v52;
  void *v53;
  PGLocationTitleComponent *v54;
  unint64_t v55;
  unint64_t v56;
  id v57;
  id v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *context;
  void *contexta;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id obj;
  id obja;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  id v90;
  _QWORD *v91;
  uint64_t v92;
  _QWORD v93[4];
  id v94;
  id v95;
  _QWORD *v96;
  _QWORD v97[4];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v8 = a6;
  v106 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v11 = a4;
  v64 = a7;
  v72 = v11;
  if (objc_msgSend(v11, "count") && a5 - 1 < 4)
  {
    if (v8)
      v12 = 0.55;
    else
      v12 = dbl_1CA8ED540[a5 - 1];
    v13 = a5 == 2 || a5 == 4;
    v14 = 24;
    if (v13)
      v14 = 45;
    v61 = v14;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    obj = v57;
    v15 = 0;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v105, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v99;
      v18 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v99 != v17)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x1CAA4EB2C]();
          v22 = objc_msgSend(v20, "numberOfAssets");
          v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v97[0] = 0;
          v97[1] = v97;
          v97[2] = 0x2020000000;
          v97[3] = 0;
          v93[0] = v18;
          v93[1] = 3221225472;
          v93[2] = __128__PGLocationTitleUtility_commonAOIComponentsForMomentNodes_addressNodes_aoiDisplayType_containsAmusementParkPOI_locationHelper___block_invoke;
          v93[3] = &unk_1E8434350;
          v94 = v72;
          v24 = v23;
          v95 = v24;
          v96 = v97;
          objc_msgSend(v20, "enumerateAddressEdgesAndNodesUsingBlock:", v93);
          v89[0] = v18;
          v89[1] = 3221225472;
          v89[2] = __128__PGLocationTitleUtility_commonAOIComponentsForMomentNodes_addressNodes_aoiDisplayType_containsAmusementParkPOI_locationHelper___block_invoke_2;
          v89[3] = &unk_1E8434378;
          v91 = v97;
          v90 = v73;
          v92 = v22;
          objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v89);

          _Block_object_dispose(v97, 8);
          objc_autoreleasePoolPop(v21);
          v15 += v22;
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v105, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    obja = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v58 = v72;
    v65 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
    v25 = vcvtpd_u64_f64(v12 * (double)v15);
    v56 = v25;
    if (v65)
    {
      v55 = v15 - v25;
      v59 = 0;
      v60 = *(_QWORD *)v86;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v86 != v60)
          {
            v27 = v26;
            objc_enumerationMutation(v58);
            v26 = v27;
          }
          v66 = v26;
          v28 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v26);
          context = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_filteredAOINodesForAddressNodes:aoiTitleMaximumLength:locationHelper:", v29, v61, v64);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v62, "setObject:forKey:", v70, v28);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v28, "identifier"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "unsignedIntegerValue");

          if (objc_msgSend(v70, "count"))
          {
            v83 = 0u;
            v84 = 0u;
            v81 = 0u;
            v82 = 0u;
            v33 = v70;
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
            if (v34)
            {
              v35 = *(_QWORD *)v82;
              do
              {
                for (j = 0; j != v34; ++j)
                {
                  if (*(_QWORD *)v82 != v35)
                    objc_enumerationMutation(v33);
                  v37 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v37, "identifier"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(obja, "objectForKeyedSubscript:", v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = objc_msgSend(v39, "unsignedIntegerValue");

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v40 + v32);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(obja, "setObject:forKeyedSubscript:", v41, v38);

                  objc_msgSend(v74, "objectForKey:", v37);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v42)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E20], "set");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "setObject:forKey:", v42, v37);
                  }
                  objc_msgSend(v42, "addObject:", v28);

                }
                v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
              }
              while (v34);
            }

          }
          else
          {
            v59 += v32;
          }

          objc_autoreleasePoolPop(context);
          v26 = v66 + 1;
        }
        while (v66 + 1 != v65);
        v65 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
      }
      while (v65);

      if (v59 > v55)
      {
        v43 = objc_alloc_init(MEMORY[0x1E0C99E60]);
LABEL_50:

        goto LABEL_40;
      }
    }
    else
    {

    }
    objc_msgSend(v74, "keyEnumerator");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "allObjects");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_aoiSubsetsFromAOI:maxSubsetSize:", v71, 2);
    contexta = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_filteredAOINodeCombinationsForCombinations:minSize:maxSize:maxTitleLength:minNumberOfAssets:aoiNodesToAddressNodesMapTable:assetCountByAddressNodeIdentifier:locationHelper:", contexta, 1, 2, v61, v56, v74, v73, v64);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_sortedAOINodeCombinationsForCombinations:aoiNodesToAddressNodesMapTable:assetCountByAddressNodeIdentifier:locationHelper:", v67, v74, v73, v64);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "firstObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v47, "count"));
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v48 = v47;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v77, v102, 16);
    if (v49)
    {
      v50 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v49; ++k)
        {
          if (*(_QWORD *)v78 != v50)
            objc_enumerationMutation(v48);
          v52 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k);
          objc_msgSend(v74, "objectForKey:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_alloc_init(PGLocationTitleComponent);
          -[PGLocationTitleComponent setNode:](v54, "setNode:", v52);
          -[PGLocationTitleComponent setAddressNodes:](v54, "setAddressNodes:", v53);
          objc_msgSend(v43, "addObject:", v54);

        }
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v77, v102, 16);
      }
      while (v49);
    }

    goto LABEL_50;
  }
  v43 = objc_alloc_init(MEMORY[0x1E0C99E60]);
LABEL_40:

  return v43;
}

+ (id)_aoiSubsetsFromAOI:(id)a3 idx:(unint64_t)a4 currentSubset:(id)a5 subsetSize:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") != a4 || objc_msgSend(v11, "count") >= a6)
  {
    if (objc_msgSend(v11, "count") == a6)
    {
      objc_msgSend(v12, "addObject:", v11);
    }
    else
    {
      v13 = a4 + 1;
      objc_msgSend(a1, "_aoiSubsetsFromAOI:idx:currentSubset:subsetSize:", v10, a4 + 1, v11, a6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unionSet:", v14);

      v15 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

      objc_msgSend(a1, "_aoiSubsetsFromAOI:idx:currentSubset:subsetSize:", v10, v13, v15, a6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unionSet:", v17);

    }
  }

  return v12;
}

+ (id)_aoiSubsetsFromAOI:(id)a3 maxSubsetSize:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v8 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_aoiSubsetsFromAOI:idx:currentSubset:subsetSize:", v6, 0, v9, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unionSet:", v10);

      ++v8;
    }
    while (v8 <= a4);
  }

  return v7;
}

+ (double)_weightForAreaNode:(id)a3 withAddressNodes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "anyEdgeFromNode:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "relevance");
        v14 = 1.0 - v13;

        v10 = v10 + v14;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

+ (id)_sortedAOINodeCombinationsForCombinations:(id)a3 aoiNodesToAddressNodesMapTable:(id)a4 assetCountByAddressNodeIdentifier:(id)a5 locationHelper:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __148__PGLocationTitleUtility__sortedAOINodeCombinationsForCombinations_aoiNodesToAddressNodesMapTable_assetCountByAddressNodeIdentifier_locationHelper___block_invoke;
  v19[3] = &unk_1E84343C8;
  v20 = v12;
  v21 = v10;
  v22 = v11;
  v23 = a1;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  objc_msgSend(v13, "sortedArrayUsingComparator:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_filteredAOINodeCombinationsForCombinations:(id)a3 minSize:(unint64_t)a4 maxSize:(unint64_t)a5 maxTitleLength:(unint64_t)a6 minNumberOfAssets:(unint64_t)a7 aoiNodesToAddressNodesMapTable:(id)a8 assetCountByAddressNodeIdentifier:(id)a9 locationHelper:(id)a10
{
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  id v43;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  id obj;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v54 = a8;
  v53 = a9;
  v15 = a10;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v14;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v64;
    v47 = a4;
    v48 = a5;
    v46 = *(_QWORD *)v64;
    do
    {
      v19 = 0;
      v49 = v17;
      do
      {
        if (*(_QWORD *)v64 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v19);
        v21 = objc_msgSend(v20, "count", v43);
        if (v21 >= a4 && v21 <= a5)
        {
          v51 = v19;
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v24 = v20;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
          v52 = v24;
          if (v25)
          {
            v26 = v25;
            v27 = 0;
            v28 = *(_QWORD *)v60;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v60 != v28)
                  objc_enumerationMutation(v52);
                v30 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
                objc_msgSend(a1, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v30, v15);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v27 += objc_msgSend(v31, "length");
                objc_msgSend(v54, "objectForKey:", v30);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "allObjects");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "addObjectsFromArray:", v33);

              }
              v26 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
            }
            while (v26);

            if (v27 > a6)
              goto LABEL_31;
          }
          else
          {

          }
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v34 = v23;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
          if (v35)
          {
            v36 = v35;
            v37 = 0;
            v38 = *(_QWORD *)v56;
            do
            {
              for (j = 0; j != v36; ++j)
              {
                if (*(_QWORD *)v56 != v38)
                  objc_enumerationMutation(v34);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "identifier"));
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:", v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v37 += objc_msgSend(v41, "unsignedIntegerValue");

              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
            }
            while (v36);
          }
          else
          {
            v37 = 0;
          }

          if (v37 >= a7)
            objc_msgSend(v43, "addObject:", v52);
LABEL_31:

          a4 = v47;
          a5 = v48;
          v18 = v46;
          v17 = v49;
          v19 = v51;
        }
        ++v19;
      }
      while (v19 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    }
    while (v17);
  }

  return v43;
}

+ (id)commonCityTitleComponentsFromMomentNodes:(id)a3 addressNodes:(id)a4 incompleteLocationResolver:(id)a5 locationHelper:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v10 = (objc_class *)MEMORY[0x1E0C99E60];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(v10);
  objc_msgSend(a1, "_commonCityTitleComponentsFromMomentNodes:remainingAddressNodes:ignoredAddressNodes:incompleteLocationResolver:locationHelper:", v14, v13, v15, v12, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_commonCityTitleComponentsFromMomentNodes:(id)a3 remainingAddressNodes:(id)a4 ignoredAddressNodes:(id)a5 incompleteLocationResolver:(id)a6 locationHelper:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  PGLocationsResolver *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  void *v50;
  int v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t m;
  uint64_t v68;
  PGLocationTitleComponent *v69;
  void *v70;
  PGLocationsResolver *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v76 = v11;
  v73 = v14;
  v16 = -[PGLocationsResolver initWithMomentNodes:incompleteLocationResolver:locationHelper:]([PGLocationsResolver alloc], "initWithMomentNodes:incompleteLocationResolver:locationHelper:", v11, v14, v15);
  -[PGLocationsResolver setShouldCreateLocationToAddressMapTable:](v16, "setShouldCreateLocationToAddressMapTable:", 1);
  v74 = v13;
  -[PGLocationsResolver setIgnoredAddressNodes:](v16, "setIgnoredAddressNodes:", v13);
  LODWORD(v17) = 1051931443;
  -[PGLocationsResolver setMaximumMissingLocationsThreshold:](v16, "setMaximumMissingLocationsThreshold:", v17);
  v72 = v16;
  -[PGLocationsResolver resolvedLocationNodesToAddressNodesMapTable](v16, "resolvedLocationNodesToAddressNodesMapTable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  objc_msgSend(v18, "keyEnumerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v103 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v26, "intersectsSet:", v12) & 1) == 0)
          objc_msgSend(v18, "removeObjectForKey:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
    }
    while (v22);
  }
  v75 = v12;

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  objc_msgSend(v18, "keyEnumerator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v99;
    v78 = v28;
    v79 = v15;
    v77 = *(_QWORD *)v99;
    do
    {
      v32 = 0;
      v80 = v30;
      do
      {
        if (*(_QWORD *)v99 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v32);
        objc_msgSend(v33, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "lowercaseString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v82 = v35;
          if (objc_msgSend(v35, "length"))
          {
            v81 = v32;
            objc_msgSend(v33, "label");
            v36 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v36, "isEqualToString:", CFSTR("City")))
            {
              objc_msgSend(v18, "objectForKey:", v33);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              v32 = v81;
              if (!v37)
                goto LABEL_45;
              v36 = v33;
              objc_msgSend(v15, "countyNodeFromCityNode:", v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "anyNode");
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (v39)
              {
                objc_msgSend(v39, "name");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "lowercaseString");
                v85 = v39;
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v41, "containsString:", v35);

                v39 = v85;
                if (v42)
                {
                  objc_msgSend(v18, "objectForKey:", v36);
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  v94 = 0u;
                  v95 = 0u;
                  v96 = 0u;
                  v97 = 0u;
                  objc_msgSend(v18, "keyEnumerator");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "allObjects");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();

                  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
                  if (v45)
                  {
                    v46 = v45;
                    v47 = *(_QWORD *)v95;
                    do
                    {
                      for (j = 0; j != v46; ++j)
                      {
                        if (*(_QWORD *)v95 != v47)
                          objc_enumerationMutation(v44);
                        v49 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
                        if ((objc_msgSend(v36, "isSameNodeAsNode:", v49) & 1) == 0)
                        {
                          objc_msgSend(v49, "label");
                          v50 = (void *)objc_claimAutoreleasedReturnValue();
                          v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("City"));

                          if (v51)
                          {
                            v52 = v49;
                            objc_msgSend(v52, "collection");
                            v53 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v53, "countyNodes");
                            v54 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v54, "anyNode");
                            v55 = (void *)objc_claimAutoreleasedReturnValue();

                            if (objc_msgSend(v85, "isSameNodeAsNode:", v55))
                            {
                              objc_msgSend(v18, "objectForKey:", v52);
                              v56 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v84, "unionSet:", v56);
                              objc_msgSend(v83, "addObject:", v52);

                            }
                          }
                        }
                      }
                      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
                    }
                    while (v46);
                  }

                  v15 = v79;
                  v31 = v77;
                  if (objc_msgSend(v83, "count"))
                  {
                    objc_msgSend(v18, "setObject:forKey:", v84, v85);
                    v92 = 0u;
                    v93 = 0u;
                    v90 = 0u;
                    v91 = 0u;
                    v57 = v83;
                    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
                    if (v58)
                    {
                      v59 = v58;
                      v60 = *(_QWORD *)v91;
                      do
                      {
                        for (k = 0; k != v59; ++k)
                        {
                          if (*(_QWORD *)v91 != v60)
                            objc_enumerationMutation(v57);
                          objc_msgSend(v18, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * k));
                        }
                        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
                      }
                      while (v59);
                    }

                    objc_msgSend(v18, "removeObjectForKey:", v36);
                  }

                  v28 = v78;
                  v30 = v80;
                  v39 = v85;
                }
              }

            }
            v32 = v81;
            v35 = v82;
          }
        }
LABEL_45:

        ++v32;
      }
      while (v32 != v30);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
    }
    while (v30);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  objc_msgSend(v18, "keyEnumerator");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v86, v106, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v87;
    do
    {
      for (m = 0; m != v65; ++m)
      {
        if (*(_QWORD *)v87 != v66)
          objc_enumerationMutation(v63);
        v68 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * m);
        v69 = objc_alloc_init(PGLocationTitleComponent);
        -[PGLocationTitleComponent setNode:](v69, "setNode:", v68);
        objc_msgSend(v18, "objectForKey:", v68);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGLocationTitleComponent setAddressNodes:](v69, "setAddressNodes:", v70);

        objc_msgSend(v62, "addObject:", v69);
      }
      v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v86, v106, 16);
    }
    while (v65);
  }

  return v62;
}

+ (id)_beautifiedLocationStringWithTitleComponents:(id)a3 momentNodes:(id)a4 lineBreakBehavior:(unint64_t)a5 keyAssetAddressNode:(id)a6 curationAddressNodes:(id)a7 isMatchingKeyAsset:(BOOL *)a8 useDistrict:(BOOL)a9 allowFamilyHome:(BOOL)a10 showAllCities:(BOOL)a11 locationHelper:(id)a12 serviceManager:(id)a13
{
  _BOOL8 v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  void *v25;
  void (**v26)(void *, void *);
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  unint64_t v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  int v68;
  void *v69;
  uint64_t v70;
  char v71;
  id v72;
  void (**v73)(void *, void *, void *, uint64_t);
  void *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  BOOL v89;
  _BOOL4 v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  id v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  unint64_t v104;
  unint64_t v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  void *v112;
  uint64_t v113;
  int v114;
  id obj;
  char v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  _QWORD v125[4];
  id v126;
  id v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _QWORD aBlock[4];
  id v138;
  id v139;
  id v140;
  char v141;
  BOOL v142;
  _BYTE v143[128];
  _BYTE v144[128];
  uint64_t v145;

  v18 = a10;
  v145 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v109 = a4;
  v20 = a6;
  v21 = a7;
  v22 = a12;
  v23 = a13;
  v106 = a5;
  v24 = a5 & 1;
  v25 = v19;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __233__PGLocationTitleUtility__beautifiedLocationStringWithTitleComponents_momentNodes_lineBreakBehavior_keyAssetAddressNode_curationAddressNodes_isMatchingKeyAsset_useDistrict_allowFamilyHome_showAllCities_locationHelper_serviceManager___block_invoke;
  aBlock[3] = &unk_1E84343F0;
  v104 = v24;
  v141 = v24;
  v142 = a10;
  v108 = v23;
  v138 = v108;
  v110 = a1;
  v140 = a1;
  v107 = v22;
  v139 = v107;
  v26 = (void (**)(void *, void *))_Block_copy(aBlock);
  v118 = v20;
  if (a9)
  {
    objc_msgSend(v109, "anyObject");
    v111 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "graph");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "_titleComponentsAreInSameSupersetCity:graph:locationHelper:", v19))
    {
      objc_msgSend(a1, "_locationStringWithDistrictsFromTitleComponents:momentNodes:lineBreakBehavior:allowFamilyHome:locationHelper:serviceManager:", v19, v109, v106, a10, v107, v108);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = v27;
        v29 = v28;
        goto LABEL_106;
      }
    }

  }
  if (a11)
  {
    objc_msgSend(a1, "_firstComponentInTimeFromComponents:momentNodes:curationAddressNodes:allowFamilyHome:serviceManager:", v19, v109, 0, a10, v108);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v98 = v21;
      v111 = v30;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v19, "count") >= 2)
      {
        v32 = (void *)objc_msgSend(v19, "mutableCopy");
        objc_msgSend(v32, "removeObject:", v111);
        objc_msgSend(a1, "_sortedComponentsFromComponents:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObjectsFromArray:", v33);

      }
      v101 = v19;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = 0u;
      v134 = 0u;
      v135 = 0u;
      v136 = 0u;
      v35 = v31;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v133, v144, 16);
      v123 = v35;
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v134;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v134 != v38)
              objc_enumerationMutation(v35);
            v40 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * i);
            objc_msgSend(v40, "node");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v41, "domain") == 200)
            {
              objc_msgSend(v41, "label");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v42, "isEqualToString:", CFSTR("City")))
              {

              }
              else
              {
                v43 = objc_msgSend(v41, "domain");

                v89 = v43 == 300;
                v35 = v123;
                if (!v89)
                  goto LABEL_26;
              }
            }
            else if (objc_msgSend(v41, "domain") != 300)
            {
              goto LABEL_26;
            }
            v26[2](v26, v40);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (v44 && (objc_msgSend(v34, "containsObject:", v44) & 1) == 0)
              objc_msgSend(v34, "addObject:", v44);

LABEL_26:
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v133, v144, 16);
        }
        while (v37);
      }

      if ((unint64_t)objc_msgSend(v34, "count") > 2)
      {
        objc_msgSend(v34, "lastObject");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "subarrayWithRange:", 0, objc_msgSend(v34, "count") - 1);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatMultipleLocationsWithConcatenatedLocations %@ lastLocation %@"), CFSTR("PGLocationTitleFormatMultipleLocationsWithConcatenatedLocations %@ lastLocation %@"), CFSTR("Localizable"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatMultipleLocationsConcatenator"), CFSTR("PGLocationTitleFormatMultipleLocationsConcatenator"), CFSTR("Localizable"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "componentsJoinedByString:", v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "localizedStringWithFormat:", v81, v84, v79);
        v28 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v110, "_titleWithLineBreakBehavior:forTitle:titleComponents:", v106, v28, v34);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = v101;
        v21 = v98;
        goto LABEL_106;
      }

      v25 = v101;
      v20 = v118;
      v21 = v98;
      v30 = v111;
      v18 = a10;
    }

  }
  objc_msgSend(v110, "_firstComponentInTimeFromComponents:momentNodes:curationAddressNodes:allowFamilyHome:serviceManager:", v25, v109, v21, v18, v108);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2](v26, v45);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v45;
  if (v20)
  {
    objc_msgSend(v45, "addressNodes");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v46, "containsObject:", v20);

    v45 = v111;
  }
  else
  {
    v114 = 1;
  }
  v47 = objc_msgSend(v25, "count") == 1;
  v48 = objc_msgSend(v25, "count");
  v49 = objc_msgSend(v25, "count");
  v50 = 0;
  v51 = v110;
  if (!v45 || v49 < 2)
  {
    v69 = 0;
    goto LABEL_66;
  }
  v52 = (void *)objc_msgSend(v25, "mutableCopy");
  objc_msgSend(v52, "removeObject:", v45);
  v100 = v52;
  objc_msgSend(v110, "_sortedComponentsFromComponents:", v52);
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = v45;
  v55 = (void *)v53;
  objc_msgSend(v54, "node");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  obj = v55;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v143, 16);
  if (!v56)
  {
    v50 = 0;
    v69 = 0;
    goto LABEL_65;
  }
  v57 = v56;
  v112 = 0;
  v113 = v48;
  v116 = v47;
  v102 = v25;
  v58 = *(_QWORD *)v130;
  do
  {
    v59 = 0;
    do
    {
      if (*(_QWORD *)v130 != v58)
        objc_enumerationMutation(obj);
      v60 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v59);
      objc_msgSend(v60, "node");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count"))
      {
        objc_msgSend(v60, "addressNodes");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "intersectsSet:", v21);

        if (!v63)
          goto LABEL_55;
      }
      if (objc_msgSend(v119, "domain") == 200 && objc_msgSend(v61, "domain") == 200)
      {
        objc_msgSend(v119, "label");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "label");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v64, "isEqualToString:", v65);

        if (!v66)
          goto LABEL_55;
      }
      if (v118)
      {
        objc_msgSend(v60, "addressNodes");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "containsObject:", v118);

        v116 = v68;
        if ((v114 | v68) != 1)
          goto LABEL_55;
      }
      else
      {
        v116 = 1;
      }
      v26[2](v26, v60);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v69, "length") || !objc_msgSend(v124, "length"))
        goto LABEL_54;
      if (objc_msgSend(v124, "isEqualToString:", v69))
      {
        --v113;
LABEL_54:

LABEL_55:
        goto LABEL_56;
      }
      v50 = v60;

      if (v50)
        goto LABEL_62;
      v112 = v69;
LABEL_56:
      ++v59;
    }
    while (v57 != v59);
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v143, 16);
    v57 = v70;
  }
  while (v70);
  v50 = 0;
  v69 = v112;
LABEL_62:
  v25 = v102;
  LOBYTE(v47) = v116;
  v48 = v113;
LABEL_65:

  v47 &= 1u;
  v51 = v110;
  v45 = v111;
LABEL_66:
  if (a8)
  {
    v71 = v114 | v47;
    if (!v45)
      v71 = 0;
    *a8 = v71;
  }
  if (!v50 || !objc_msgSend(v69, "length"))
  {
    v72 = v124;
    v74 = v72;
    goto LABEL_89;
  }
  v72 = v124;
  if (!objc_msgSend(v124, "length"))
  {
    v74 = 0;
    goto LABEL_89;
  }
  v125[0] = MEMORY[0x1E0C809B0];
  v125[1] = 3221225472;
  v125[2] = __233__PGLocationTitleUtility__beautifiedLocationStringWithTitleComponents_momentNodes_lineBreakBehavior_keyAssetAddressNode_curationAddressNodes_isMatchingKeyAsset_useDistrict_allowFamilyHome_showAllCities_locationHelper_serviceManager___block_invoke_2;
  v125[3] = &unk_1E8434418;
  v128 = v51;
  v111 = v45;
  v126 = v111;
  v50 = v50;
  v127 = v50;
  v73 = (void (**)(void *, void *, void *, uint64_t))_Block_copy(v125);
  v73[2](v73, v124, v69, v48);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v74, "length") < 0x17
    || (objc_msgSend(v124, "containsString:", v69) & 1) == 0
    && !objc_msgSend(v69, "containsString:", v124))
  {
    goto LABEL_88;
  }
  v103 = v25;
  v99 = v21;
  if (!v118)
  {
LABEL_85:
    v77 = 0;
    v75 = v111;
    goto LABEL_86;
  }
  if ((v114 & 1) == 0)
  {
    if (v47)
    {
      v76 = v50;
      v78 = v69;
      v75 = v111;
      goto LABEL_87;
    }
    goto LABEL_85;
  }
  v75 = v111;
  v76 = v111;
  v77 = v124;
  v78 = v77;
  if (!v76)
  {
LABEL_86:
    v121 = v77;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v75, v50, 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "_sortedComponentsFromComponents:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "firstObject");
    v76 = (id)objc_claimAutoreleasedReturnValue();
    v26[2](v26, v76);
    v78 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_87:
  v87 = v76;

  v88 = v78;
  v50 = 0;
  v69 = 0;
  v124 = v88;
  v111 = v87;
  v74 = v88;
  v25 = v103;
  v21 = v99;
LABEL_88:

  v72 = v124;
LABEL_89:
  v123 = v72;
  if (v72)
  {
    v89 = !v104 || v69 == 0;
    v90 = !v89;
    if ((v106 & 2) != 0 || v90)
    {
      v122 = v50;
      objc_msgSend(v74, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "addObject:", v93);
      if (v69)
      {
        objc_msgSend(v69, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "addObject:", v94);
        if (v104)
        {
          +[PGCommonTitleUtility titleWithLineBreakForTitle:andUsedNames:](PGCommonTitleUtility, "titleWithLineBreakForTitle:andUsedNames:", v91, v92);
          v95 = objc_claimAutoreleasedReturnValue();

          v91 = (void *)v95;
        }

      }
      if ((v106 & 2) != 0)
      {
        +[PGCommonTitleUtility titleWithNoLineBreakSpaceForTitle:andUsedNames:](PGCommonTitleUtility, "titleWithNoLineBreakSpaceForTitle:andUsedNames:", v91, v92);
        v96 = objc_claimAutoreleasedReturnValue();

        v91 = (void *)v96;
      }

      v74 = v91;
      v50 = v122;
    }
  }
  v28 = v74;

  v29 = v28;
LABEL_106:

  return v29;
}

+ (id)_localizedStringForTwoLocationsWithFirstComponentForTitle:(id)a3 secondComponentForTitle:(id)a4 firstLocation:(id)a5 otherLocation:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  uint8_t *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  uint8_t buf[2];
  __int16 v49;
  __int16 v50;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v9, "type");
  v14 = objc_msgSend(v10, "type");
  switch(v13)
  {
    case 0:
      switch(v14)
      {
        case 0:
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatTwoLocationsWithLocation %@ otherLocation %@"), CFSTR("PGLocationTitleFormatTwoLocationsWithLocation %@ otherLocation %@"), CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v12;
          goto LABEL_18;
        case 1:
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v24;
          v25 = CFSTR("PGLocationTitleFormatTwoLocationsWithLocation %@ andHome");
          goto LABEL_17;
        case 2:
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v24;
          v25 = CFSTR("PGLocationTitleFormatTwoLocationsWithLocation %@ andWork");
          goto LABEL_17;
        case 3:
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatTwoLocationsWithLocation %@ andSomeonesHome %@"), CFSTR("PGLocationTitleFormatTwoLocationsWithLocation %@ andSomeonesHome %@"), CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "personName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "localizedStringWithFormat:", v17, v11, v23);
          goto LABEL_42;
        case 4:
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v24;
          v25 = CFSTR("PGLocationTitleFormatTwoLocationsWithLocation %@ andFamilyHome");
LABEL_17:
          objc_msgSend(v24, "localizedStringForKey:value:table:", v25, v25, CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
          objc_msgSend(v15, "localizedStringWithFormat:", v17, v11, v47);
          break;
        default:
          goto LABEL_49;
      }
LABEL_19:
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    case 1:
      switch(v14)
      {
        case 0:
          v18 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v19;
          v20 = CFSTR("PGLocationTitleFormatTwoLocationsWithHomeAndLocation %@");
          goto LABEL_12;
        case 1:
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "loggingConnection");
          v29 = objc_claimAutoreleasedReturnValue();

          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            goto LABEL_48;
          v50 = 0;
          v30 = "Attempted to create location string with two title components both of type Home";
          v31 = (uint8_t *)&v50;
          break;
        case 2:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v32;
          v33 = CFSTR("PGLocationTitleFormatTwoLocationsWithHomeAndWork");
          goto LABEL_37;
        case 3:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v34;
          v35 = CFSTR("PGLocationTitleFormatTwoLocationsWithHomeAndSomeonesHome %@");
          goto LABEL_39;
        case 4:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v32;
          v33 = CFSTR("PGLocationTitleFormatTwoLocationsWithHomeAndFamilyHome");
          goto LABEL_37;
        default:
          goto LABEL_49;
      }
      goto LABEL_52;
    case 2:
      switch(v14)
      {
        case 0:
          v18 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v19;
          v20 = CFSTR("PGLocationTitleFormatTwoLocationsWithWorkAndLocation %@");
          goto LABEL_12;
        case 1:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v32;
          v33 = CFSTR("PGLocationTitleFormatTwoLocationsWithWorkAndHome");
          goto LABEL_37;
        case 2:
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "loggingConnection");
          v29 = objc_claimAutoreleasedReturnValue();

          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            goto LABEL_48;
          v49 = 0;
          v30 = "Attempted to create location string with two title components both of type Work";
          v31 = (uint8_t *)&v49;
          break;
        case 3:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v34;
          v35 = CFSTR("PGLocationTitleFormatTwoLocationsWithWorkAndSomeonesHome %@");
          goto LABEL_39;
        case 4:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v32;
          v33 = CFSTR("PGLocationTitleFormatTwoLocationsWithWorkAndFamilyHome");
          goto LABEL_37;
        default:
          goto LABEL_49;
      }
LABEL_52:
      _os_log_error_impl(&dword_1CA237000, v29, OS_LOG_TYPE_ERROR, v30, v31, 2u);
LABEL_48:

      goto LABEL_49;
    case 3:
      switch(v14)
      {
        case 0:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andLocation %@"), CFSTR("PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andLocation %@"), CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "personName");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          v47 = v12;
          goto LABEL_41;
        case 1:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v37;
          v38 = CFSTR("PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andHome");
          break;
        case 2:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v37;
          v38 = CFSTR("PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andWork");
          break;
        case 3:
          v39 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andAnothersHome %@"), CFSTR("PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andAnothersHome %@"), CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "personName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "personName");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedStringWithFormat:", v17, v23, v40);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_43;
        case 4:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v37;
          v38 = CFSTR("PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andFamilyHome");
          break;
        default:
          goto LABEL_49;
      }
      objc_msgSend(v37, "localizedStringForKey:value:table:", v38, v38, CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v9;
LABEL_40:
      objc_msgSend(v41, "personName");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
LABEL_41:
      objc_msgSend(v21, "localizedStringWithFormat:", v17, v22, v47);
LABEL_42:
      v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:

LABEL_44:
LABEL_45:

      if (!v27)
        goto LABEL_49;
      goto LABEL_50;
    case 4:
      switch(v14)
      {
        case 0:
          v18 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v19;
          v20 = CFSTR("PGLocationTitleFormatTwoLocationsWithFamilyHomeAndLocation %@");
LABEL_12:
          objc_msgSend(v19, "localizedStringForKey:value:table:", v20, v20, CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringWithFormat:", v17, v12, v47);
          goto LABEL_19;
        case 1:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v32;
          v33 = CFSTR("PGLocationTitleFormatTwoLocationsWithFamilyHomeAndHome");
          goto LABEL_37;
        case 2:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v32;
          v33 = CFSTR("PGLocationTitleFormatTwoLocationsWithFamilyHomeAndWork");
LABEL_37:
          objc_msgSend(v32, "localizedStringForKey:value:table:", v33, v33, CFSTR("Localizable"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_45;
        case 3:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v34;
          v35 = CFSTR("PGLocationTitleFormatTwoLocationsWithFamilyHomeAndSomeonesHome %@");
LABEL_39:
          objc_msgSend(v34, "localizedStringForKey:value:table:", v35, v35, CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v10;
          goto LABEL_40;
        case 4:
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "loggingConnection");
          v29 = objc_claimAutoreleasedReturnValue();

          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            goto LABEL_48;
          *(_WORD *)buf = 0;
          v30 = "Attempted to create location string with two title components both of type Family Home";
          v31 = buf;
          goto LABEL_52;
        default:
          goto LABEL_49;
      }
    default:
LABEL_49:
      v43 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatTwoLocationsWithLocation %@ otherLocation %@"), CFSTR("PGLocationTitleFormatTwoLocationsWithLocation %@ otherLocation %@"), CFSTR("Localizable"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringWithFormat:", v45, v11, v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_50:
      return v27;
  }
}

+ (id)_localizedStringForMultipleLocationsWithFirstComponentForTitle:(id)a3 secondComponentForTitle:(id)a4 firstLocation:(id)a5 otherLocation:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  uint8_t *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  uint8_t buf[2];
  __int16 v49;
  __int16 v50;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v9, "type");
  v14 = objc_msgSend(v10, "type");
  switch(v13)
  {
    case 0:
      switch(v14)
      {
        case 0:
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatMultipleLocationsWithLocation %@ otherLocation %@"), CFSTR("PGLocationTitleFormatMultipleLocationsWithLocation %@ otherLocation %@"), CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v12;
          goto LABEL_18;
        case 1:
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v24;
          v25 = CFSTR("PGLocationTitleFormatMultipleLocationsWithLocation %@ andHome");
          goto LABEL_17;
        case 2:
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v24;
          v25 = CFSTR("PGLocationTitleFormatMultipleLocationsWithLocation %@ andWork");
          goto LABEL_17;
        case 3:
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatMultipleLocationsWithLocation %@ andSomeonesHome %@"), CFSTR("PGLocationTitleFormatMultipleLocationsWithLocation %@ andSomeonesHome %@"), CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "personName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "localizedStringWithFormat:", v17, v11, v23);
          goto LABEL_42;
        case 4:
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v24;
          v25 = CFSTR("PGLocationTitleFormatMultipleLocationsWithLocation %@ andFamilyHome");
LABEL_17:
          objc_msgSend(v24, "localizedStringForKey:value:table:", v25, v25, CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
          objc_msgSend(v15, "localizedStringWithFormat:", v17, v11, v47);
          break;
        default:
          goto LABEL_49;
      }
LABEL_19:
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    case 1:
      switch(v14)
      {
        case 0:
          v18 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v19;
          v20 = CFSTR("PGLocationTitleFormatMultipleLocationsWithHomeAndLocation %@");
          goto LABEL_12;
        case 1:
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "loggingConnection");
          v29 = objc_claimAutoreleasedReturnValue();

          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            goto LABEL_48;
          v50 = 0;
          v30 = "Attempted to create location string with two title components both of type Home";
          v31 = (uint8_t *)&v50;
          break;
        case 2:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v32;
          v33 = CFSTR("PGLocationTitleFormatMultipleLocationsWithHomeAndWork");
          goto LABEL_37;
        case 3:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v34;
          v35 = CFSTR("PGLocationTitleFormatMultipleLocationsWithHomeAndSomeonesHome %@");
          goto LABEL_39;
        case 4:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v32;
          v33 = CFSTR("PGLocationTitleFormatMultipleLocationsWithHomeAndFamilyHome");
          goto LABEL_37;
        default:
          goto LABEL_49;
      }
      goto LABEL_52;
    case 2:
      switch(v14)
      {
        case 0:
          v18 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v19;
          v20 = CFSTR("PGLocationTitleFormatMultipleLocationsWithWorkAndLocation %@");
          goto LABEL_12;
        case 1:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v32;
          v33 = CFSTR("PGLocationTitleFormatMultipleLocationsWithWorkAndHome");
          goto LABEL_37;
        case 2:
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "loggingConnection");
          v29 = objc_claimAutoreleasedReturnValue();

          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            goto LABEL_48;
          v49 = 0;
          v30 = "Attempted to create location string with two title components both of type Work";
          v31 = (uint8_t *)&v49;
          break;
        case 3:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v34;
          v35 = CFSTR("PGLocationTitleFormatMultipleLocationsWithWorkAndSomeonesHome %@");
          goto LABEL_39;
        case 4:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v32;
          v33 = CFSTR("PGLocationTitleFormatMultipleLocationsWithWorkAndFamilyHome");
          goto LABEL_37;
        default:
          goto LABEL_49;
      }
LABEL_52:
      _os_log_error_impl(&dword_1CA237000, v29, OS_LOG_TYPE_ERROR, v30, v31, 2u);
LABEL_48:

      goto LABEL_49;
    case 3:
      switch(v14)
      {
        case 0:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andLocation %@"), CFSTR("PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andLocation %@"), CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "personName");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          v47 = v12;
          goto LABEL_41;
        case 1:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v37;
          v38 = CFSTR("PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andHome");
          break;
        case 2:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v37;
          v38 = CFSTR("PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andWork");
          break;
        case 3:
          v39 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andAnothersHome %@"), CFSTR("PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andAnothersHome %@"), CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "personName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "personName");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedStringWithFormat:", v17, v23, v40);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_43;
        case 4:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v37;
          v38 = CFSTR("PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andFamilyHome");
          break;
        default:
          goto LABEL_49;
      }
      objc_msgSend(v37, "localizedStringForKey:value:table:", v38, v38, CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v9;
LABEL_40:
      objc_msgSend(v41, "personName");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
LABEL_41:
      objc_msgSend(v21, "localizedStringWithFormat:", v17, v22, v47);
LABEL_42:
      v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:

LABEL_44:
LABEL_45:

      if (!v27)
        goto LABEL_49;
      goto LABEL_50;
    case 4:
      switch(v14)
      {
        case 0:
          v18 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v19;
          v20 = CFSTR("PGLocationTitleFormatMultipleLocationsWithFamilyHomeAndLocation %@");
LABEL_12:
          objc_msgSend(v19, "localizedStringForKey:value:table:", v20, v20, CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringWithFormat:", v17, v12, v47);
          goto LABEL_19;
        case 1:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v32;
          v33 = CFSTR("PGLocationTitleFormatMultipleLocationsWithFamilyHomeAndHome");
          goto LABEL_37;
        case 2:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v32;
          v33 = CFSTR("PGLocationTitleFormatMultipleLocationsWithFamilyHomeAndWork");
LABEL_37:
          objc_msgSend(v32, "localizedStringForKey:value:table:", v33, v33, CFSTR("Localizable"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_45;
        case 3:
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v34;
          v35 = CFSTR("PGLocationTitleFormatMultipleLocationsWithFamilyHomeAndSomeonesHome %@");
LABEL_39:
          objc_msgSend(v34, "localizedStringForKey:value:table:", v35, v35, CFSTR("Localizable"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v10;
          goto LABEL_40;
        case 4:
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "loggingConnection");
          v29 = objc_claimAutoreleasedReturnValue();

          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            goto LABEL_48;
          *(_WORD *)buf = 0;
          v30 = "Attempted to create location string with Multiple title components both of type Family Home";
          v31 = buf;
          goto LABEL_52;
        default:
          goto LABEL_49;
      }
    default:
LABEL_49:
      v43 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatMultipleLocationsWithLocation %@ otherLocation %@"), CFSTR("PGLocationTitleFormatMultipleLocationsWithLocation %@ otherLocation %@"), CFSTR("Localizable"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringWithFormat:", v45, v11, v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_50:
      return v27;
  }
}

+ (id)_locationStringWithDistrictsFromTitleComponents:(id)a3 momentNodes:(id)a4 lineBreakBehavior:(unint64_t)a5 allowFamilyHome:(BOOL)a6 locationHelper:(id)a7 serviceManager:(id)a8
{
  id v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  PGLocationTitleComponent *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  BOOL v34;
  uint64_t *v35;
  char v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  void *v69;
  char v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _BOOL4 v92;
  id v93;
  id v94;
  void *v95;
  id obj;
  id v97;
  id v98;
  uint64_t v99;
  void *v100;
  void (**v101)(void *, void *);
  id v102;
  void *v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD aBlock[6];
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  char v137;
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  uint64_t v144;

  v92 = a6;
  v144 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v102 = a4;
  v104 = a7;
  v94 = a8;
  v134 = 0;
  v135 = &v134;
  v136 = 0x2020000000;
  v137 = 0;
  v130 = 0;
  v131 = &v130;
  v132 = 0x2020000000;
  v133 = 0x7FFFFFFFFFFFFFFFLL;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __150__PGLocationTitleUtility__locationStringWithDistrictsFromTitleComponents_momentNodes_lineBreakBehavior_allowFamilyHome_locationHelper_serviceManager___block_invoke;
  aBlock[3] = &unk_1E8434440;
  aBlock[4] = &v134;
  aBlock[5] = &v130;
  v101 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
  v13 = 0;
  if (v12)
  {
    v99 = *(_QWORD *)v126;
LABEL_3:
    v97 = (id)v12;
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v126 != v99)
        objc_enumerationMutation(obj);
      if (*((_BYTE *)v135 + 24))
        break;
      v15 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v14);
      objc_msgSend(v15, "node");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "label");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("City"));

      if (v18)
      {
        objc_msgSend(v16, "collection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v101[2](v101, v19);

        if (*((_BYTE *)v135 + 24))
          goto LABEL_36;
        objc_msgSend(v15, "addressNodes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v122;
          while (2)
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v122 != v23)
                objc_enumerationMutation(v21);
              v25 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * i);
              objc_msgSend(v104, "districtNodeFromAddressNode:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "anyNode");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v27)
              {
                *((_BYTE *)v135 + 24) = 1;
                goto LABEL_31;
              }
              objc_msgSend(v103, "objectForKeyedSubscript:", v27);
              v28 = (PGLocationTitleComponent *)objc_claimAutoreleasedReturnValue();
              if (!v28)
              {
                v28 = objc_alloc_init(PGLocationTitleComponent);
                -[PGLocationTitleComponent setNode:](v28, "setNode:", v27);
                objc_msgSend(v103, "setObject:forKeyedSubscript:", v28, v27);
              }
              -[PGLocationTitleComponent addAddressNode:](v28, "addAddressNode:", v25);

              v13 = 1;
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
            if (v22)
              continue;
            break;
          }
        }
LABEL_31:

      }
      else
      {
        objc_msgSend(v15, "addressNodes");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v21 = v29;
        v30 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v117, v141, 16);
        if (v30)
        {
          v31 = *(_QWORD *)v118;
LABEL_22:
          v32 = 0;
          while (1)
          {
            if (*(_QWORD *)v118 != v31)
              objc_enumerationMutation(v21);
            objc_msgSend(v104, "cityNodeFromAddressNode:", *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * v32));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v101[2](v101, v33);
            v34 = *((_BYTE *)v135 + 24) == 0;

            if (!v34)
              break;
            if (v30 == ++v32)
            {
              v30 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v117, v141, 16);
              if (v30)
                goto LABEL_22;
              break;
            }
          }
        }

        if (*((_BYTE *)v135 + 24))
        {

LABEL_36:
          break;
        }
        objc_msgSend(v95, "addObject:", v15);
      }

      if ((id)++v14 == v97)
      {
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

  v35 = v135;
  v36 = (*((_BYTE *)v135 + 24) != 0) | ~v13;
  *((_BYTE *)v135 + 24) = *((_BYTE *)v135 + 24) != 0 || (v13 & 1) == 0;
  if ((v36 & 1) != 0)
  {
    v37 = 0;
    *((_BYTE *)v35 + 24) = 1;
    goto LABEL_106;
  }
  v38 = v131[3] == 0x7FFFFFFFFFFFFFFFLL;
  *((_BYTE *)v35 + 24) = v38;
  if (v38)
  {
    v37 = 0;
    goto LABEL_106;
  }
  objc_msgSend(v102, "anyObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "graph");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "nodeForIdentifier:", v131[3]);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v87, v104);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v88, "length"))
  {
    v37 = 0;
    goto LABEL_105;
  }
  objc_msgSend(v103, "allValues");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObjectsFromArray:", v41);

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v42 = v95;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v113, v140, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v114;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v114 != v44)
          objc_enumerationMutation(v42);
        objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * j), "updateWithMomentNodes:", v102);
      }
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v113, v140, 16);
    }
    while (v43);
  }

  objc_msgSend(a1, "_firstComponentInTimeFromComponents:momentNodes:curationAddressNodes:allowFamilyHome:serviceManager:", v42, v102, 0, v92, v94);
  v46 = objc_claimAutoreleasedReturnValue();
  v86 = (void *)v46;
  if (!v46)
  {
    v37 = 0;
    goto LABEL_104;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v42, "count") >= 2)
  {
    v48 = (void *)objc_msgSend(v42, "mutableCopy");
    objc_msgSend(v48, "removeObject:", v86);
    objc_msgSend(a1, "_sortedComponentsFromComponents:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObjectsFromArray:", v49);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v98 = v47;
  v50 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v109, v139, 16);
  if (!v50)
    goto LABEL_73;
  v51 = *(_QWORD *)v110;
  while (2)
  {
    for (k = 0; k != v50; ++k)
    {
      if (*(_QWORD *)v110 != v51)
        objc_enumerationMutation(v98);
      v53 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * k);
      objc_msgSend(v53, "node");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v54, "domain") == 300)
      {
        objc_msgSend(v53, "edge");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGPeopleTitleUtility beautifiedLocationStringWithPersonNode:peopleAddressEdge:titleComponent:insertLineBreak:allowFamilyHome:serviceManager:](PGPeopleTitleUtility, "beautifiedLocationStringWithPersonNode:peopleAddressEdge:titleComponent:insertLineBreak:allowFamilyHome:serviceManager:", v54, v55, v53, a5 & 1, v92, v94);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v56 || (objc_msgSend(v100, "containsObject:", v56) & 1) != 0)
          goto LABEL_66;
LABEL_65:
        objc_msgSend(v100, "addObject:", v56);
        objc_msgSend(v89, "addObject:", v53);
        goto LABEL_66;
      }
      objc_msgSend(v54, "label");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("District"));

      if (!v58)
        goto LABEL_67;
      objc_msgSend(a1, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v54, v104);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v56, "length"))
      {
        *((_BYTE *)v135 + 24) = 1;

        goto LABEL_73;
      }
      if ((objc_msgSend(v100, "containsObject:", v56) & 1) == 0)
        goto LABEL_65;
LABEL_66:

LABEL_67:
    }
    v50 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v109, v139, 16);
    if (v50)
      continue;
    break;
  }
LABEL_73:

  if (*((_BYTE *)v135 + 24))
  {
    v37 = 0;
    goto LABEL_103;
  }
  objc_msgSend(v88, "componentsSeparatedByString:", CFSTR(" "));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v93 = v100;
  v60 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v105, v138, 16);
  if (v60)
  {
    v61 = *(_QWORD *)v106;
    while (2)
    {
      v62 = v60;
      for (m = 0; m != v62; ++m)
      {
        if (*(_QWORD *)v106 != v61)
          objc_enumerationMutation(v93);
        objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * m), "componentsSeparatedByString:", CFSTR(" "));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "count");
        v66 = objc_msgSend(v59, "count");
        v67 = v65 - v66;
        if (v65 >= v66)
        {
          v68 = 0;
          while (1)
          {
            objc_msgSend(v64, "subarrayWithRange:", v68, v66);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = objc_msgSend(v69, "isEqualToArray:", v59);

            if ((v70 & 1) != 0)
              break;
            if (++v68 > v67)
              goto LABEL_84;
          }

          v37 = 0;
          goto LABEL_100;
        }
LABEL_84:

      }
      v60 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v105, v138, 16);
      if (v60)
        continue;
      break;
    }
  }

  v71 = objc_msgSend(v93, "count");
  if (v71 != 2)
  {
    if (v71 == 1)
    {
      v72 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatOneDistrict %@ city %@"), CFSTR("PGLocationTitleFormatOneDistrict %@ city %@"), CFSTR("Localizable"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "firstObject");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "localizedStringWithFormat:", v74, v75, v88);
      v76 = objc_claimAutoreleasedReturnValue();
      goto LABEL_98;
    }
    goto LABEL_101;
  }
  objc_msgSend(v93, "firstObject");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "lastObject");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "firstObject");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "type");

  objc_msgSend(v89, "lastObject");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "type");

  if (v78 || v80 != 1)
  {
    v84 = (void *)MEMORY[0x1E0CB3940];
    if (v78 != 1 || v80)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatDistrict %@ otherDistrict %@ inCity %@"), CFSTR("PGLocationTitleFormatDistrict %@ otherDistrict %@ inCity %@"), CFSTR("Localizable"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "localizedStringWithFormat:", v82, v73, v74, v88);
      v83 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatHomeAndDistrict %@ inCity %@"), CFSTR("PGLocationTitleFormatHomeAndDistrict %@ inCity %@"), CFSTR("Localizable"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "localizedStringWithFormat:", v82, v74, v88);
      v83 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v81 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatDistrict %@ andHomeInCity %@"), CFSTR("PGLocationTitleFormatDistrict %@ andHomeInCity %@"), CFSTR("Localizable"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "localizedStringWithFormat:", v82, v73, v88);
    v83 = objc_claimAutoreleasedReturnValue();
  }
  v76 = v83;

LABEL_98:
  if (v76)
  {
    objc_msgSend(v93, "addObject:", v88);
    objc_msgSend(a1, "_titleWithLineBreakBehavior:forTitle:titleComponents:", a5, v76, v93);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = (id)v76;
LABEL_100:

  }
  else
  {
LABEL_101:
    v37 = 0;
  }

LABEL_103:
LABEL_104:

LABEL_105:
LABEL_106:

  _Block_object_dispose(&v130, 8);
  _Block_object_dispose(&v134, 8);

  return v37;
}

+ (BOOL)_titleComponentsAreInSameSupersetCity:(id)a3 graph:(id)a4 locationHelper:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v28 = a5;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supersetCityNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      v26 = v8;
      v27 = v7;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v16, "node");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "label");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("City"));

          if (v19)
          {
            v20 = v17;
          }
          else
          {
            if (objc_msgSend(v17, "domain") != 300)
            {
              v20 = 0;
LABEL_17:

              v24 = 0;
              v8 = v26;
              v7 = v27;
              goto LABEL_18;
            }
            objc_msgSend(v16, "edge");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "sourceNode");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "cityNodeFromAddressNode:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "anyNode");
            v20 = (id)objc_claimAutoreleasedReturnValue();

            if (!v20)
              goto LABEL_17;
          }
          objc_msgSend(v9, "addObject:", v20);
          if (!objc_msgSend(v10, "containsNode:", v20))
            goto LABEL_17;

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        v8 = v26;
        v7 = v27;
        if (v13)
          continue;
        break;
      }
    }

    v24 = objc_msgSend(v9, "count") == 1;
LABEL_18:

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)_firstComponentInTimeFromComponents:(id)a3 momentNodes:(id)a4 curationAddressNodes:(id)a5 allowFamilyHome:(BOOL)a6 serviceManager:(id)a7
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  _BOOL4 v24;
  void (**v25)(_QWORD);
  void (**v26)(_QWORD);
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  _BOOL4 v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id obj;
  uint64_t v57;
  id v58;
  uint64_t v59;
  _QWORD aBlock[10];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  double *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  double *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  _BYTE v79[128];
  uint64_t v80;

  v51 = a6;
  v80 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v58 = a4;
  v11 = a5;
  v54 = a7;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__62152;
  v77 = __Block_byref_object_dispose__62153;
  v78 = 0;
  v69 = 0;
  v70 = (double *)&v69;
  v71 = 0x2020000000;
  v72 = 0x7FEFFFFFFFFFFFFFLL;
  v65 = 0;
  v66 = (double *)&v65;
  v67 = 0x2020000000;
  v68 = 0xFFEFFFFFFFFFFFFFLL;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
  if (v12)
  {
    v57 = *(_QWORD *)v62;
    do
    {
      v59 = v12;
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v62 != v57)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v14, "updateWithMomentNodes:", v58);
        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(v14, "addressNodes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "intersectsSet:", v11);

          if ((v16 & 1) == 0)
            continue;
        }
        objc_msgSend(v14, "timestampStart");
        v18 = v17;
        objc_msgSend(v14, "weight");
        v20 = v19;
        objc_msgSend(v14, "node");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v22, "length"))
          goto LABEL_14;
        if (!v74[5] || (v23 = v70[3], v23 > v18))
        {
          v24 = 1;
          goto LABEL_15;
        }
        if (v23 == v18)
          v24 = v66[3] < v20;
        else
LABEL_14:
          v24 = 0;
LABEL_15:
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __126__PGLocationTitleUtility__firstComponentInTimeFromComponents_momentNodes_curationAddressNodes_allowFamilyHome_serviceManager___block_invoke;
        aBlock[3] = &unk_1E8434468;
        *(double *)&aBlock[8] = v18;
        *(double *)&aBlock[9] = v20;
        aBlock[6] = &v65;
        aBlock[7] = &v73;
        aBlock[4] = v14;
        aBlock[5] = &v69;
        v25 = (void (**)(_QWORD))_Block_copy(aBlock);
        v26 = v25;
        if (v24)
        {
          v25[2](v25);
LABEL_39:

          continue;
        }
        v27 = (void *)v74[5];
        if (!v27 || v70[3] != v18 || v66[3] != v20)
          goto LABEL_39;
        objc_msgSend(v27, "node");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "domain");

        objc_msgSend(v14, "node");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "domain");

        if (v29 != 300 && v31 == 300)
        {
          v26[2](v26);
          goto LABEL_39;
        }
        if (v29 == 300 && v31 == 300)
        {
          objc_msgSend(v14, "node");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "graph");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "node");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v34, "containsNode:", v35);

          if (v36)
            goto LABEL_24;
          objc_msgSend((id)v74[5], "edge");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "targetNode");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "edge");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "targetNode");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "label");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("Home"));

          objc_msgSend(v55, "label");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("Home"));

          if (((v42 | v44 ^ 1) & 1) != 0)
          {
            if (v42 == v44)
            {
              objc_msgSend((id)v74[5], "node");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v74[5], "edge");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              +[PGPeopleTitleUtility beautifiedLocationStringWithPersonNode:peopleAddressEdge:titleComponent:insertLineBreak:allowFamilyHome:serviceManager:](PGPeopleTitleUtility, "beautifiedLocationStringWithPersonNode:peopleAddressEdge:titleComponent:insertLineBreak:allowFamilyHome:serviceManager:", v52, v45, v74[5], 0, v51, v54);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "node");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "edge");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              +[PGPeopleTitleUtility beautifiedLocationStringWithPersonNode:peopleAddressEdge:titleComponent:insertLineBreak:allowFamilyHome:serviceManager:](PGPeopleTitleUtility, "beautifiedLocationStringWithPersonNode:peopleAddressEdge:titleComponent:insertLineBreak:allowFamilyHome:serviceManager:", v53, v47, v14, 0, v51, v54);
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v48, "length")
                && (!objc_msgSend(v46, "length") || objc_msgSend(v46, "localizedCompare:", v48) == 1))
              {
                v26[2](v26);
              }

            }
          }
          else
          {
            v26[2](v26);
          }

        }
        else
        {
          if (v29 == 300)
            goto LABEL_39;
          objc_msgSend((id)v74[5], "node");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "name");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v34, "localizedCompare:", v22) == 1)
LABEL_24:
            v26[2](v26);
        }

        goto LABEL_39;
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
    }
    while (v12);
  }

  v49 = (id)v74[5];
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);

  return v49;
}

+ (id)_sortedComponentsFromComponents:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_62183);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_titleWithLineBreakBehavior:(unint64_t)a3 forTitle:(id)a4 titleComponents:(id)a5
{
  char v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  if ((v6 & 2) != 0)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
    v10 = objc_claimAutoreleasedReturnValue();

    +[PGCommonTitleUtility titleWithNoLineBreakSpaceForTitle:andUsedNames:](PGCommonTitleUtility, "titleWithNoLineBreakSpaceForTitle:andUsedNames:", v10, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v7 = (id)v10;
    goto LABEL_5;
  }
  if ((v6 & 1) != 0)
  {
    +[PGCommonTitleUtility titleWithLineBreakForTitle:andUsedNames:](PGCommonTitleUtility, "titleWithLineBreakForTitle:andUsedNames:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:

    v7 = (id)v9;
  }

  return v7;
}

+ (id)_twoPartLocationTitleWithFirstPartTitle:(id)a3 withDimension:(unint64_t)a4 usedFirstPartLocationNode:(id)a5 addressNode:(id)a6 locationHelper:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (a4 - 10 >= 0xFFFFFFFFFFFFFFF7)
  {
    v17 = 0;
    v18 = 0;
    do
    {
      v19 = v18;
      objc_msgSend(v15, "closestLocationNodeFromLocationNode:withDimension:remapMatchingDimensionBlock:", v14, a4, &__block_literal_global_305);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(a1, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v18, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqualToString:", v21);

        v17 = v20;
        if (!v22)
          break;
      }
      ++a4;
    }
    while (a4 != 10);
    if (objc_msgSend(v17, "length"))
    {
      v16 = 0;
      if (objc_msgSend(v12, "rangeOfString:options:", v17, 0) != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_14:

        goto LABEL_15;
      }
      if (objc_msgSend(v12, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatTwoPartWithFirstLocation %@ secondLocation %@ invisibleSeparator %@"), CFSTR("PGLocationTitleFormatTwoPartWithFirstLocation %@ secondLocation %@ invisibleSeparator %@"), CFSTR("Localizable"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v24, v12, v17, CFSTR("\n"));
        v16 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
      v25 = v17;
    }
    else
    {
      v25 = v12;
    }
    v16 = v25;
    goto LABEL_14;
  }
  v16 = v12;
LABEL_15:

  return v16;
}

+ (id)beautifiedLocationNodeStringWithPlaceNode:(id)a3 locationHelper:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v5, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Country"));

      if (!v10)
      {
        if ((objc_msgSend(v5, "supportsNameShortening") & 1) == 0
          || (+[PGAOINameShortener shortenedAOIForLocationOrAreaNode:locationHelper:](PGAOINameShortener, "shortenedAOIForLocationOrAreaNode:locationHelper:", v5, v6), (v16 = (id)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v16 = v8;
        }
        goto LABEL_17;
      }
      v11 = v8;
      v12 = shouldLocationRemoveParenthesesForCountryCode(v11);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForCountryCode:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14 && objc_msgSend(v14, "length"))
      {
        v16 = v15;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v20 = 138412290;
          v21 = v11;
          _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not find name for country code %@", (uint8_t *)&v20, 0xCu);
        }
        v16 = 0;
      }

      if (!v16)
      {
        v16 = v11;
        v17 = v16;
        if ((v12 & 1) == 0)
          goto LABEL_18;
        goto LABEL_17;
      }
      v17 = v16;
      if ((v12 & 1) != 0)
      {
LABEL_17:
        objc_msgSend(v16, "pg_stringByRemovingParentheses");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v17;
      }
    }
    else
    {
      v17 = 0;
      v16 = v8;
    }
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
LABEL_18:
  v18 = v16;

  return v18;
}

+ (id)peopleLocationTitleComponentsFromAddressNodes:(id)a3 peopleDisplayType:(unint64_t)a4 serviceManager:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  objc_msgSend(a3, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGLocationTitleUtility peopleLocationTitleComponentsFromAddressNodesSet:peopleDisplayType:serviceManager:](PGLocationTitleUtility, "peopleLocationTitleComponentsFromAddressNodesSet:peopleDisplayType:serviceManager:", v8, a4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)peopleLocationTitleComponentsFromAddressNodesSet:(id)a3 peopleDisplayType:(unint64_t)a4 serviceManager:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  unint64_t v21;
  id obj;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v21 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = a5;
  v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v30;
    obj = v8;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(obj);
        objc_msgSend(a1, "_peopleLocationFromAddressNode:serviceManager:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v24, v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          ++v11;
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v15 = v23;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v26;
            while (2)
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v26 != v18)
                  objc_enumerationMutation(v15);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "canMergeWithTitleComponent:", v14) & 1) != 0)
                {

                  goto LABEL_17;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v17)
                continue;
              break;
            }
          }

          objc_msgSend(v15, "addObject:", v14);
        }
LABEL_17:

      }
      v8 = obj;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  if (v21 == 2 && objc_msgSend(v8, "count") && v11 != objc_msgSend(v8, "count"))
    objc_msgSend(v23, "removeAllObjects");

  return v23;
}

+ (id)_peopleLocationFromAddressNode:(id)a3 serviceManager:(id)a4
{
  id v5;
  id v6;
  id v7;
  PGLocationTitleComponent *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *, uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a3;
  v6 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__62152;
  v30 = __Block_byref_object_dispose__62153;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__62152;
  v24 = __Block_byref_object_dispose__62153;
  v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __72__PGLocationTitleUtility__peopleLocationFromAddressNode_serviceManager___block_invoke;
  v13 = &unk_1E8434560;
  v7 = v6;
  v14 = v7;
  v15 = &v26;
  v16 = &v20;
  v17 = v18;
  objc_msgSend(v5, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("IS_HOME_WORK"), 202, &v10);
  if (v21[5] && v27[5])
  {
    v8 = objc_alloc_init(PGLocationTitleComponent);
    -[PGLocationTitleComponent setNode:](v8, "setNode:", v21[5], v10, v11, v12, v13);
    -[PGLocationTitleComponent setEdge:](v8, "setEdge:", v27[5]);
    -[PGLocationTitleComponent addAddressNode:](v8, "addAddressNode:", v5);
  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v8;
}

void __72__PGLocationTitleUtility__peopleLocationFromAddressNode_serviceManager___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v7 = a2;
  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__PGLocationTitleUtility__peopleLocationFromAddressNode_serviceManager___block_invoke_2;
  v12[3] = &unk_1E8434538;
  v13 = *(id *)(a1 + 32);
  v14 = v8;
  v16 = *(_OWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 56);
  v15 = v7;
  v17 = v9;
  v18 = a4;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v11, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("IS_OWNED_BY"), 202, v12);

}

void __72__PGLocationTitleUtility__peopleLocationFromAddressNode_serviceManager___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  int v16;
  id v17;

  v17 = a2;
  +[PGPeopleTitleUtility nameFromPersonNode:serviceManager:](PGPeopleTitleUtility, "nameFromPersonNode:serviceManager:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_msgSend(v17, "isMeNode");
    objc_msgSend(*(id *)(a1 + 40), "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Home"));

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "targetNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Home"));

    if (v7)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(_QWORD *)(v13 + 40);
      v14 = (id *)(v13 + 40);
      if (!v15 || ((v12 | v9 ^ 1) & 1) == 0)
      {
        objc_storeStrong(v14, *(id *)(a1 + 48));
        if (v9)
        {
          **(_BYTE **)(a1 + 80) = 1;
          *a3 = 1;
        }
      }
    }
    else
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        v16 = 0;
      else
        v16 = v9;
      if (v16 == 1 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 48));
      }
    }
  }

}

uint64_t __133__PGLocationTitleUtility__twoPartLocationTitleWithFirstPartTitle_withDimension_usedFirstPartLocationNode_addressNode_locationHelper___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;

  result = a2;
  v3 = a2 - 2;
  if ((unint64_t)(a2 - 2) <= 5 && ((0x2Bu >> v3) & 1) != 0)
    return qword_1CA8ED560[v3];
  return result;
}

uint64_t __58__PGLocationTitleUtility__sortedComponentsFromComponents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "weight");
  v7 = v6;
  objc_msgSend(v5, "weight");
  if (v7 <= v8)
  {
    if (v7 < v8)
    {
      v9 = 1;
      goto LABEL_39;
    }
    objc_msgSend(v4, "node");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "node");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "domain");
    v13 = objc_msgSend(v11, "domain");
    if (v12 == 300 && v13 != 300)
      goto LABEL_8;
    if (v13 != 300 && v12 == 300)
      goto LABEL_11;
    if (v12 == 300 && v13 == 300)
    {
      objc_msgSend(v10, "graph");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "containsNode:", v10);
      v17 = objc_msgSend(v15, "containsNode:", v11);
      if (v16 && !v17)
      {
        v9 = -1;
LABEL_37:

        goto LABEL_38;
      }
      v18 = v17 ^ 1;
      if ((v16 | v17 ^ 1) != 1)
        goto LABEL_31;
      if (!v16)
        v18 = v17;
      if ((v18 & 1) == 0)
      {
        objc_msgSend(v4, "edge");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "targetNode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "edge");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "targetNode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "label");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("Home"));

        objc_msgSend(v22, "label");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("Home"));

        if (v24 && (v26 & 1) == 0)
        {

          goto LABEL_34;
        }

        if ((v24 | v26 ^ 1) != 1)
        {
LABEL_31:
          v9 = 1;
          goto LABEL_37;
        }
      }

    }
    objc_msgSend(v4, "timestampStart");
    v28 = v27;
    objc_msgSend(v5, "timestampStart");
    if (v28 < v29)
    {
LABEL_8:
      v9 = -1;
LABEL_38:

      goto LABEL_39;
    }
    if (v28 > v29)
    {
LABEL_11:
      v9 = 1;
      goto LABEL_38;
    }
    objc_msgSend(v10, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v30 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v30;
    if (!v15 && v30)
    {
      v15 = 0;
      v9 = 1;
LABEL_36:

      goto LABEL_37;
    }
    if (!v15 || v30)
    {
      v9 = objc_msgSend(v15, "localizedCompare:", v30);
      goto LABEL_36;
    }
LABEL_34:
    v9 = -1;
    goto LABEL_36;
  }
  v9 = -1;
LABEL_39:

  return v9;
}

void __126__PGLocationTitleUtility__firstComponentInTimeFromComponents_momentNodes_curationAddressNodes_allowFamilyHome_serviceManager___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(a1 + 72);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
}

void __150__PGLocationTitleUtility__locationStringWithDistrictsFromTitleComponents_momentNodes_lineBreakBehavior_allowFamilyHome_locationHelper_serviceManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "elementIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "firstElement");

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v5 + 24);
    v7 = v8;
    if (v4 != v6)
    {
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        *(_QWORD *)(v5 + 24) = v4;
      else
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    v7 = v8;
  }

}

id __233__PGLocationTitleUtility__beautifiedLocationStringWithTitleComponents_momentNodes_lineBreakBehavior_keyAssetAddressNode_curationAddressNodes_isMatchingKeyAsset_useDistrict_allowFamilyHome_showAllCities_locationHelper_serviceManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "node");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "domain") == 300)
    {
      objc_msgSend(v3, "edge");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGPeopleTitleUtility beautifiedLocationStringWithPersonNode:peopleAddressEdge:titleComponent:insertLineBreak:allowFamilyHome:serviceManager:](PGPeopleTitleUtility, "beautifiedLocationStringWithPersonNode:peopleAddressEdge:titleComponent:insertLineBreak:allowFamilyHome:serviceManager:", v5, v6, v3, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v5, *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __233__PGLocationTitleUtility__beautifiedLocationStringWithTitleComponents_momentNodes_lineBreakBehavior_keyAssetAddressNode_curationAddressNodes_isMatchingKeyAsset_useDistrict_allowFamilyHome_showAllCities_locationHelper_serviceManager___block_invoke_2(_QWORD *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;

  v7 = a2;
  v8 = a3;
  if (!v8 || a4 == 1)
  {
    v12 = v7;
  }
  else
  {
    v10 = a1[5];
    v9 = (void *)a1[6];
    v11 = a1[4];
    if (a4 == 2)
      objc_msgSend(v9, "_localizedStringForTwoLocationsWithFirstComponentForTitle:secondComponentForTitle:firstLocation:otherLocation:", v11, v10, v7, v8);
    else
      objc_msgSend(v9, "_localizedStringForMultipleLocationsWithFirstComponentForTitle:secondComponentForTitle:firstLocation:otherLocation:", v11, v10, v7, v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

uint64_t __148__PGLocationTitleUtility__sortedAOINodeCombinationsForCombinations_aoiNodesToAddressNodesMapTable_assetCountByAddressNodeIdentifier_locationHelper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  int v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  _BOOL4 v33;
  unint64_t v34;
  double v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  unint64_t v56;
  id v57;
  uint64_t v58;
  double (**v59)(void *, id);
  double v60;
  double v61;
  void *v62;
  unint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t n;
  unint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *context;
  id v76;
  id obj;
  id v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD aBlock[4];
  id v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v78 = a3;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
  v8 = 0.0;
  obj = v6;
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v107;
    v12 = 0.0;
    LOBYTE(v13) = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v107 != v11)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 56), "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v15, *(_QWORD *)(a1 + 32));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 += objc_msgSend(v16, "length");
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "allObjects");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "addObjectsFromArray:", v18);

        objc_msgSend(v15, "popularityScore");
        v13 = (v19 != -1.0) & v13;
        if (v19 == -1.0)
          v19 = -0.0;
        v12 = v12 + v19;

      }
      v6 = obj;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v13 = 1;
    v12 = 0.0;
  }

  v20 = objc_msgSend(v6, "count");
  v21 = v12 / (double)v20;
  if (!v20)
    v21 = 0.0;
  if (v13)
    v22 = v21;
  else
    v22 = 0.0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set", v21);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v23 = v78;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
  v76 = v23;
  if (v24)
  {
    v25 = v24;
    v26 = 0;
    v79 = *(id *)v103;
    v8 = 0.0;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(id *)v103 != v79)
          objc_enumerationMutation(v76);
        v28 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 56), "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v28, *(_QWORD *)(a1 + 32));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v26 += objc_msgSend(v29, "length");
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "allObjects");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "addObjectsFromArray:", v31);

        objc_msgSend(v28, "popularityScore");
        v33 = v32 != -1.0;
        if (v32 == -1.0)
          v32 = -0.0;
        v8 = v8 + v32;
        v13 &= v33;

      }
      v23 = v76;
      v25 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
    }
    while (v25);
  }
  else
  {
    v26 = 0;
  }

  v34 = objc_msgSend(v23, "count");
  v35 = 0.0;
  if (v13 && v34)
    v35 = v8 / (double)v34;
  if (!_os_feature_enabled_impl())
    goto LABEL_35;
  if (v22 <= v35)
  {
    if (v35 > v22)
      goto LABEL_59;
LABEL_35:
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v37 = v82;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
    if (v38)
    {
      v39 = v38;
      v40 = 0;
      v41 = *(_QWORD *)v99;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v99 != v41)
            objc_enumerationMutation(v37);
          v43 = *(void **)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * k), "identifier"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectForKeyedSubscript:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v40 += objc_msgSend(v45, "unsignedIntegerValue");

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
      }
      while (v39);
    }
    else
    {
      v40 = 0;
    }

    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v80 = v81;
    v46 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v94, v112, 16);
    if (v46)
    {
      v47 = v46;
      v48 = 0;
      v49 = *(_QWORD *)v95;
      do
      {
        for (m = 0; m != v47; ++m)
        {
          if (*(_QWORD *)v95 != v49)
            objc_enumerationMutation(v80);
          v51 = *(void **)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * m), "identifier"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectForKeyedSubscript:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v48 += objc_msgSend(v53, "unsignedIntegerValue");

        }
        v47 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v94, v112, 16);
      }
      while (v47);
    }
    else
    {
      v48 = 0;
    }

    if (v40 > v48)
    {
      v36 = -1;
LABEL_57:
      v23 = v76;
      goto LABEL_60;
    }
    if (v48 > v40)
    {
      v36 = 1;
      goto LABEL_57;
    }
    v54 = objc_msgSend(obj, "count");
    v23 = v76;
    if (v54 > objc_msgSend(v76, "count"))
    {
LABEL_59:
      v36 = 1;
      goto LABEL_60;
    }
    v56 = objc_msgSend(v76, "count");
    if (v56 > objc_msgSend(obj, "count"))
      goto LABEL_33;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __148__PGLocationTitleUtility__sortedAOINodeCombinationsForCombinations_aoiNodesToAddressNodesMapTable_assetCountByAddressNodeIdentifier_locationHelper___block_invoke_2;
    aBlock[3] = &unk_1E84343A0;
    v57 = *(id *)(a1 + 40);
    v58 = *(_QWORD *)(a1 + 56);
    v92 = v57;
    v93 = v58;
    v59 = (double (**)(void *, id))_Block_copy(aBlock);
    v60 = v59[2](v59, obj);
    v61 = v59[2](v59, v76);
    if (v60 <= v61)
    {
      v36 = 1;
      if (v61 > v60 || v10 > v26)
        goto LABEL_64;
      if (v26 <= v10)
      {
        objc_msgSend(obj, "anyObject");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "identifier");

        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v64 = obj;
        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v87, v111, 16);
        if (v65)
        {
          v66 = v65;
          v67 = *(_QWORD *)v88;
          do
          {
            for (n = 0; n != v66; ++n)
            {
              if (*(_QWORD *)v88 != v67)
                objc_enumerationMutation(v64);
              v69 = objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * n), "identifier");
              if (v63 >= v69)
                v63 = v69;
            }
            v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v87, v111, 16);
          }
          while (v66);
        }

        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v70 = v76;
        v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v83, v110, 16);
        if (v71)
        {
          v72 = v71;
          v73 = *(_QWORD *)v84;
          v36 = 1;
LABEL_79:
          v74 = 0;
          while (1)
          {
            if (*(_QWORD *)v84 != v73)
              objc_enumerationMutation(v70);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v74), "identifier") < v63)
              break;
            if (v72 == ++v74)
            {
              v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v83, v110, 16);
              if (v72)
                goto LABEL_79;
              goto LABEL_85;
            }
          }
        }
        else
        {
LABEL_85:
          v36 = -1;
        }

        goto LABEL_64;
      }
    }
    v36 = -1;
LABEL_64:

    goto LABEL_60;
  }
LABEL_33:
  v36 = -1;
LABEL_60:

  objc_autoreleasePoolPop(context);
  return v36;
}

double __148__PGLocationTitleUtility__sortedAOINodeCombinationsForCombinations_aoiNodesToAddressNodesMapTable_assetCountByAddressNodeIdentifier_locationHelper___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_weightForAreaNode:withAddressNodes:", v9, v10);
        v7 = v7 + v11;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

void __128__PGLocationTitleUtility_commonAOIComponentsForMomentNodes_addressNodes_aoiDisplayType_containsAmusementParkPOI_locationHelper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    objc_msgSend(v11, "relevance");
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
  }

}

void __128__PGLocationTitleUtility_commonAOIComponentsForMomentNodes_addressNodes_aoiDisplayType_containsAmusementParkPOI_locationHelper___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  unint64_t v9;
  id v10;

  v5 = a2;
  objc_msgSend(a3, "doubleValue");
  v7 = v6 / *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ceil(v7 * (double)*(unint64_t *)(a1 + 48)) + (double)v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v5);

}

BOOL __96__PGLocationTitleUtility__filteredAOINodesForAddressNodes_aoiTitleMaximumLength_locationHelper___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v3 = a2;
  if ((objc_msgSend(v3, "isBlocked") & 1) == 0
    && ((objc_msgSend(v3, "popularityScore"), v4 >= 500.0) || (objc_msgSend(v3, "popularityScore"), v5 == -1.0)))
  {
    objc_msgSend(*(id *)(a1 + 40), "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v3, *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v6 = (unint64_t)objc_msgSend(v7, "length") <= *(_QWORD *)(a1 + 48);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __66__PGLocationTitleUtility_containsAmusementParkPOIFromMomentNodes___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;

  objc_msgSend(a2, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v5, "isEqualToString:", CFSTR("AmusementPark"));

  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __96__PGLocationTitleUtility_generateLocationTitleWithOptions_locationHelper_serviceManager_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __90__PGLocationTitleUtility_businessNodeForTitlingFromMomentNodes_businessNodesByMomentNode___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "targetsForSources:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

@end
