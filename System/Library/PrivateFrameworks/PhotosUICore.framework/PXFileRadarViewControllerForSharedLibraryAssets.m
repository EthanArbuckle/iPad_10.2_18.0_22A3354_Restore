@implementation PXFileRadarViewControllerForSharedLibraryAssets

void __PXFileRadarViewControllerForSharedLibraryAssets_block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  unint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *m;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t n;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t ii;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v76;
  uint64_t v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  id obj;
  id obja;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  id v96;
  id v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  void *v101;
  unsigned int v102;
  uint64_t v103;
  void *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[4];
  id v114;
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
  __int128 v129;
  __int128 v130;
  const __CFString *v131;
  uint64_t v132;
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _QWORD v136[2];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v76 = a4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("Summary:\nExamples:\n* Bad suggestion (wrong person/people, irrelevant to moment, bad location, poor quality/blurry photo, etc.)\n* Missing/wrong assets\n* Don't want to see this asset, etc…?\n\nSteps To Reproduce:\n-\n\nResults:\n-\n\nRegression:\n-\n\nNotes:\n-\n\n"));
  objc_msgSend(v5, "appendString:", CFSTR("--- Goldilocks TTR ---\n"));
  v80 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v78 = a1;
  obj = *(id *)(a1 + 32);
  v104 = v5;
  v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
  if (!v93)
  {
    v88 = 0;
    goto LABEL_37;
  }
  v88 = 0;
  v91 = *(_QWORD *)v128;
  do
  {
    for (i = 0; i != v93; ++i)
    {
      if (*(_QWORD *)v128 != v91)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
      objc_msgSend(v7, "fetchPropertySetsIfNeeded");
      objc_msgSend(v5, "appendFormat:", CFSTR("\nAsset: %@"), v7);
      objc_msgSend(v7, "libraryScopeProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "participatesInLibraryScope");
      v10 = CFSTR("NO");
      if (v9)
        v10 = CFSTR("YES");
      objc_msgSend(v5, "appendFormat:", CFSTR("\nParticipates in library scope: %@"), v10);
      v101 = v8;
      v11 = objc_msgSend(v8, "suggestedByClientType") + 1;
      v12 = CFSTR("Unknown");
      if (v11 <= 5)
        v12 = off_1E513E170[v11];
      objc_msgSend(v5, "appendFormat:", CFSTR("\nSuggested by: %@"), v12);
      objc_msgSend(v7, "importProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "importedBy");
      PHAssetImportSourceDescription();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("\nImported By: %@"), v14);

      objc_msgSend(v7, "sceneAnalysisProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = objc_msgSend(v15, "sceneAnalysisVersion");

      objc_msgSend(v5, "appendFormat:", CFSTR("\nScene Analysis Version: %d"), (unsigned __int16)v14);
      if ((_DWORD)v14)
      {
        v95 = v7;
        v98 = i;
        objc_msgSend(v7, "sceneClassifications");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = 0u;
        v124 = 0u;
        v125 = 0u;
        v126 = 0u;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v123, v138, 16);
        if (!v17)
          goto LABEL_28;
        v18 = v17;
        v19 = *(_QWORD *)v124;
        while (1)
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v124 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * j);
            v22 = objc_msgSend(v21, "sceneIdentifier");
            objc_msgSend(v21, "confidence");
            if (v22 > 2147483643)
            {
              if (v22 == 2147483644)
              {
                v24 = CFSTR("\n  Negative: %.3f");
              }
              else
              {
                if (v22 != 2147483646)
                  continue;
                v24 = CFSTR("\n  Text Document: %.3f");
              }
            }
            else if (v22 == 2147483629)
            {
              v24 = CFSTR("\n  Poor Quality: %.3f");
            }
            else
            {
              if (v22 != 2147483631)
                continue;
              v24 = CFSTR("\n  Tragic Failure: %.3f");
            }
            objc_msgSend(v104, "appendFormat:", v24, v23);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v123, v138, 16);
          if (!v18)
          {
LABEL_28:

            v5 = v104;
            v7 = v95;
            i = v98;
            break;
          }
        }
      }
      objc_msgSend(v5, "appendString:", CFSTR("\n"));
      +[PXFeedbackTapToRadarUtilities detailedDebugDescriptionFileForAsset:](PXFeedbackTapToRadarUtilities, "detailedDebugDescriptionFileForAsset:", v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        objc_msgSend(v80, "addObject:", v25);
      if (!v88)
      {
        objc_msgSend(v7, "photoLibrary");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
  }
  while (v93);
LABEL_37:

  objc_msgSend(v5, "appendString:", CFSTR("\n\n"));
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAssets:withType:options:", *(_QWORD *)(a1 + 32), 3, 0);
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v79 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0x1E0CB3000uLL;
  v84 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
  if (v84)
  {
    v83 = *(_QWORD *)v120;
    v82 = *MEMORY[0x1E0CD19C0];
    v81 = *MEMORY[0x1E0CD19D8];
    do
    {
      for (k = 0; k != v84; ++k)
      {
        if (*(_QWORD *)v120 != v83)
          objc_enumerationMutation(v79);
        v28 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * k);
        objc_msgSend(v5, "appendString:", CFSTR("--- Moment ---\n"));
        objc_msgSend(v28, "uuid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("UUID: %@\n"), v29);

        objc_msgSend(v28, "photoLibrary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "librarySpecificFetchOptions");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v136[0] = v82;
        v136[1] = v81;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setFetchPropertySets:", v32);

        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v28, v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");
        if (v34)
        {
          v85 = v34;
          v87 = k;
          v94 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v115 = 0u;
          v116 = 0u;
          v117 = 0u;
          v118 = 0u;
          obja = v33;
          v96 = (id)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v115, v135, 16);
          v86 = v33;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          if (v96)
          {
            v92 = *(_QWORD *)v116;
            do
            {
              for (m = 0; m != v96; m = (char *)m + 1)
              {
                if (*(_QWORD *)v116 != v92)
                  objc_enumerationMutation(obja);
                v39 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)m);
                objc_msgSend(v39, "libraryScopeProperties");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v102 = objc_msgSend(v39, "participatesInLibraryScope");
                v99 = objc_msgSend(v40, "assetManuallyAddedByUser");
                v41 = objc_msgSend(v40, "assetManuallyRejectedByUser");
                objc_msgSend(*(id *)(v26 + 2024), "numberWithShort:", objc_msgSend(v40, "suggestedByClientType"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "objectForKeyedSubscript:", v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = v43;
                if (v43)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v43, "intValue") + 1);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "setObject:forKeyedSubscript:", v45, v42);

                  v26 = 0x1E0CB3000;
                }
                else
                {
                  objc_msgSend(v94, "setObject:forKeyedSubscript:", &unk_1E53EF1C8, v42);
                }
                v37 += v102;
                v36 = (v36 + v99);
                v35 = (v35 + v41);

              }
              v96 = (id)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v115, v135, 16);
            }
            while (v96);
          }

          objc_msgSend(*(id *)(v26 + 2024), "numberWithInteger:", v37);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v26 + 2024), "numberWithUnsignedInteger:", v85);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v104;
          objc_msgSend(v104, "appendFormat:", CFSTR("Participation %@ / %@ assets\n"), v46, v47);

          objc_msgSend(v104, "appendFormat:", CFSTR("%d added by user\n%d rejected by user\n"), v36, v35);
          v113[0] = MEMORY[0x1E0C809B0];
          v113[1] = 3221225472;
          v113[2] = __PXFileRadarViewControllerForSharedLibraryAssets_block_invoke_417;
          v113[3] = &unk_1E513DFC0;
          v114 = v104;
          objc_msgSend(v94, "enumerateKeysAndObjectsUsingBlock:", v113);

          k = v87;
          v33 = v86;
        }

      }
      v84 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
    }
    while (v84);
  }
  if (v88)
  {
    v48 = (void *)MEMORY[0x1E0CD15E0];
    objc_msgSend(v88, "librarySpecificFetchOptions");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "fetchLibraryScopesWithOptions:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v97 = v50;
    v103 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v109, v134, 16);
    if (v103)
    {
      v100 = *(_QWORD *)v110;
      do
      {
        for (n = 0; n != v103; ++n)
        {
          if (*(_QWORD *)v110 != v100)
            objc_enumerationMutation(v97);
          v52 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * n);
          objc_msgSend(v5, "appendString:", CFSTR("\n--- Library Scope ---\n"));
          objc_msgSend(v52, "title");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("Title: %@\n"), v53);

          objc_msgSend(v52, "uuid");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("UUID: %@\n"), v54);

          v55 = objc_msgSend(v52, "libraryScopeInLocalMode");
          v56 = CFSTR("NO");
          if (v55)
            v56 = CFSTR("YES");
          objc_msgSend(v5, "appendFormat:", CFSTR("Local Mode: %@\n"), v56);
          _PHLibraryScopeAutoSharePolicyDescription(objc_msgSend(v52, "autoSharePolicy"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("Auto Share Policy: %@\n"), v57);

          objc_msgSend(*(id *)(v26 + 2024), "numberWithShort:", objc_msgSend(v52, "previewState"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("Preview State: %@\n"), v58);

          v59 = (void *)MEMORY[0x1E0CD1600];
          objc_msgSend(v88, "librarySpecificFetchOptions");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "fetchLibraryScopeRulesForLibraryScope:options:", v52, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "appendFormat:", CFSTR("Number of rules: %d\n"), objc_msgSend(v61, "count"));
          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          v62 = v61;
          v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v105, v133, 16);
          if (v63)
          {
            v64 = v63;
            v65 = *(_QWORD *)v106;
            do
            {
              for (ii = 0; ii != v64; ++ii)
              {
                if (*(_QWORD *)v106 != v65)
                  objc_enumerationMutation(v62);
                v67 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * ii);
                objc_msgSend(v104, "appendFormat:", CFSTR("\nRule %@\n"), v67);
                objc_msgSend(v67, "dateRangeCondition");
                v68 = objc_claimAutoreleasedReturnValue();
                v69 = (void *)v68;
                if (v68)
                  objc_msgSend(v104, "appendFormat:", CFSTR("%@\n"), v68);
                objc_msgSend(v67, "personCondition");
                v70 = objc_claimAutoreleasedReturnValue();
                v71 = (void *)v70;
                if (v70)
                  objc_msgSend(v104, "appendFormat:", CFSTR("%@\n"), v70);

              }
              v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v105, v133, 16);
            }
            while (v64);
          }

          v5 = v104;
          v26 = 0x1E0CB3000;
        }
        v103 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v109, v134, 16);
      }
      while (v103);
    }

  }
  if (a2 && *(_QWORD *)(v78 + 40))
  {
    v132 = *(_QWORD *)(v78 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v72 = 0;
  }
  if (a3)
  {
    v131 = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v73 = (void *)MEMORY[0x1E0C9AA60];
  }
  LOWORD(v74) = a3;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", CFSTR("[Goldilocks TTR]: <Enter Brief Description>"), v5, CFSTR("Serious Bug"), CFSTR("1393606"), CFSTR("Photos Shared Library Algorithms"), CFSTR("all"), CFSTR("1481932"), v72, v80, v74, v73, *(_QWORD *)(v78 + 48));

}

void __PXFileRadarViewControllerForSharedLibraryAssets_block_invoke_417(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5;
  const __CFString *v6;
  id v7;

  v7 = a3;
  v5 = (__int16)objc_msgSend(a2, "intValue") + 1;
  if (v5 > 5)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E513E170[v5];
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@ suggestions by client: %@\n"), v7, v6);

}

@end
