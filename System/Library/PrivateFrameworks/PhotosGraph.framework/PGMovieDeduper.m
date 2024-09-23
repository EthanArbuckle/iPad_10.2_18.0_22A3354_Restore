@implementation PGMovieDeduper

- (id)deduplicatedItemsWithItems:(id)a3 debugInfo:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  double v10;
  double Current;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unint64_t v25;
  id v26;
  __int128 v27;
  void *v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  BOOL v34;
  char v35;
  double v36;
  unint64_t v37;
  id v38;
  id v39;
  int v40;
  int v41;
  char v42;
  double v43;
  double v44;
  double v45;
  uint64_t i;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  int v63;
  int v64;
  int v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  double v75;
  char v76;
  double v77;
  uint64_t v78;
  void *v79;
  __int128 v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  void *v89;
  void *context;
  id v91;
  BOOL v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  void *v97;
  double v98;
  void *v99;
  id obj;
  void *v101;
  double v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  int v114;
  void (**v115)(void *, _BYTE *, double);
  void *v116;
  void *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  char v131;
  uint8_t v132[128];
  uint8_t buf[4];
  _BYTE v134[18];
  _BYTE v135[128];
  _QWORD v136[2];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v96 = a4;
  v9 = a5;
  v10 = 0.0;
  v115 = (void (**)(void *, _BYTE *, double))_Block_copy(v9);
  if (v115)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v131 = 0;
      v115[2](v115, &v131, 0.0);
      if (v131)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v134 = 30;
          *(_WORD *)&v134[4] = 2080;
          *(_QWORD *)&v134[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGMovieDeduper.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v12 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_116;
      }
      v10 = Current;
    }
  }
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
  if (!v14)
    goto LABEL_16;
  v15 = v14;
  v16 = *(_QWORD *)v128;
LABEL_10:
  v17 = 0;
  while (1)
  {
    if (*(_QWORD *)v128 != v16)
      objc_enumerationMutation(v13);
    if ((objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * v17), "isVideo") & 1) != 0)
      break;
    if (v15 == ++v17)
    {
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
      if (!v15)
      {
LABEL_16:

        v12 = v13;
        goto LABEL_116;
      }
      goto LABEL_10;
    }
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = v18;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v136[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sortedArrayUsingDescriptors:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v21, "lastObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D475C8], "sharedMediaAnalyzer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGDeduper identifiersOfRequiredItems](self, "identifiersOfRequiredItems");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v21, "count");
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v26 = v21;
  v93 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v123, v135, 16);
  v28 = 0;
  if (v93)
  {
    v98 = 1.0 / (double)v25;
    v94 = *(_QWORD *)v124;
    v109 = *MEMORY[0x1E0D47540];
    v107 = *MEMORY[0x1E0D474E0];
    v108 = *MEMORY[0x1E0D475A0];
    v103 = *MEMORY[0x1E0D47560];
    v104 = *MEMORY[0x1E0D47548];
    v102 = 0.0;
    *(_QWORD *)&v27 = 134218242;
    v81 = v27;
    v29 = 0.5;
    do
    {
      v30 = 0;
      do
      {
        v97 = v28;
        if (*(_QWORD *)v124 != v94)
          objc_enumerationMutation(v26);
        v95 = v30;
        v99 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v30);
        objc_msgSend(v99, "creationDate", v81);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (!v28)
        {
          v34 = 0;
LABEL_26:
          if (v99 != v23)
            goto LABEL_95;
          goto LABEL_27;
        }
        objc_msgSend(v31, "timeIntervalSinceDate:");
        v34 = v33 >= 180.0;
        if (v33 < 180.0)
          goto LABEL_26;
LABEL_27:
        v92 = v34;
        v35 = v99 != v23 || v34;
        if ((v35 & 1) == 0)
          objc_msgSend(v22, "addObject:", v99);
        if (objc_msgSend(v22, "count") == 1)
        {
          objc_msgSend(v101, "addObjectsFromArray:", v22);
          goto LABEL_91;
        }
        context = (void *)MEMORY[0x1CAA4EB2C]();
        v122 = 0;
        objc_msgSend(v24, "requestAnalysis:forAssets:withOptions:andProgressHandler:andError:", 66560, v22, 0, 0, &v122);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v122;
        if (v115)
        {
          v36 = CFAbsoluteTimeGetCurrent();
          if (v36 - v10 >= 0.01)
          {
            v131 = 0;
            v115[2](v115, &v131, v102 + v98 * v29);
            if (v131)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v134 = 84;
                *(_WORD *)&v134[4] = 2080;
                *(_QWORD *)&v134[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Curation/PGMovieDeduper.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              v39 = v91;
LABEL_111:

              objc_autoreleasePoolPop(context);
              v28 = v97;
              goto LABEL_112;
            }
            v10 = v36;
          }
        }
        if (!v113 || v91)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v81;
            *(_QWORD *)v134 = 66560;
            *(_WORD *)&v134[8] = 2112;
            *(_QWORD *)&v134[10] = v91;
            _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error requesting analysis types 0x%llx from MediaAnalyzer. \"%@\", buf, 0x16u);
          }
          objc_msgSend(v101, "addObjectsFromArray:", v22);
          goto LABEL_90;
        }
        v89 = v32;
        v105 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v37 = objc_msgSend(v22, "count");
        v118 = 0u;
        v119 = 0u;
        v120 = 0u;
        v121 = 0u;
        v38 = v22;
        v111 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v118, v132, 16);
        if (!v111)
        {

          v39 = 0;
          v32 = v89;
          goto LABEL_89;
        }
        obj = v38;
        v83 = v26;
        v84 = v24;
        v85 = v23;
        v86 = v22;
        v82 = v20;
        v87 = v9;
        v88 = v8;
        v39 = 0;
        v112 = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0;
        v43 = v29 / (double)v37;
        v106 = *(_QWORD *)v119;
        v44 = 0.5;
        v45 = -1.79769313e308;
        while (2)
        {
          for (i = 0; i != v111; ++i)
          {
            v114 = v41;
            v47 = v40;
            if (*(_QWORD *)v119 != v106)
              objc_enumerationMutation(obj);
            v48 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
            objc_msgSend(v113, "objectAtIndexedSubscript:", v112 + i);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "objectForKeyedSubscript:", v109);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v50;
            if (v50)
            {
              objc_msgSend(v50, "doubleValue");
              v53 = v52;
            }
            else
            {
              v53 = 0.5;
            }
            v116 = v51;
            v117 = v49;
            objc_msgSend(v49, "objectForKeyedSubscript:", v108);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectForKeyedSubscript:", v107);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            v56 = v39;
            if (v55)
            {
              objc_msgSend(v55, "firstObject");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "objectForKeyedSubscript:", v104);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "objectForKeyedSubscript:", v103);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "doubleValue");
              v61 = v60;

            }
            else
            {
              v61 = 1.79769313e308;
            }
            v40 = objc_msgSend(v48, "isVideo");
            v41 = objc_msgSend(v48, "isFavorite");
            objc_msgSend(v48, "clsIdentifier");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v110, "containsObject:", v62);

            v39 = v56;
            if (v56 && v61 < 0.1 && ((v47 | v40) & 1) != 0)
            {
              v64 = v114 & (v41 ^ 1);
              v65 = v64 ^ 1;
              if ((v64 & 1) != 0)
              {
                v66 = v117;
                if ((v42 & 1) != 0)
                  goto LABEL_60;
              }
              else
              {
                v66 = v117;
                if (((v47 ^ 1) & 1) == 0)
                {
                  if (v53 > v45)
                    v65 = v40;
                  else
                    v65 = 0;
                }
                if ((v42 & 1) != 0)
                {
LABEL_60:
                  if (v63)
                  {
                    if (v65)
                    {
                      objc_msgSend(v101, "addObject:", v39);
                      v67 = v48;
                      v68 = v39;
                      v39 = v67;

                      v42 = 1;
                      v45 = v53;
LABEL_74:
                      v71 = v116;
                      goto LABEL_75;
                    }
                    v74 = v101;
                  }
                  else
                  {
                    v74 = v105;
                  }
                  objc_msgSend(v74, "addObject:", v48);
                  v42 = 1;
                  goto LABEL_74;
                }
              }
              if ((v63 | v65) == 1)
              {
                objc_msgSend(v105, "addObject:", v39);
                v72 = v48;
                v73 = v39;
                v39 = v72;

                v45 = v53;
                v42 = v63;
              }
              else
              {
                objc_msgSend(v105, "addObject:", v48);
                v42 = 0;
              }
              goto LABEL_74;
            }
            if (v56)
            {
              objc_msgSend(v101, "addObject:", v56);
              if (objc_msgSend(v105, "count"))
              {
                objc_msgSend(v96, "dedupItems:toItem:withDedupingType:", v105, v56, 3);
                v39 = v56;
                objc_msgSend(v105, "removeAllObjects");
              }
            }
            v69 = v48;
            v70 = v39;
            v39 = v69;

            v45 = v53;
            v42 = v63;
            v71 = v116;
            v66 = v117;
LABEL_75:
            v44 = v43 + v44;
            if (v115)
            {
              v75 = CFAbsoluteTimeGetCurrent();
              if (v75 - v10 >= 0.01)
              {
                v131 = 0;
                v115[2](v115, &v131, v102 + v98 * v44);
                if (v131)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v134 = 171;
                    *(_WORD *)&v134[4] = 2080;
                    *(_QWORD *)&v134[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Curation/PGMovieDeduper.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  v9 = v87;
                  v8 = v88;
                  v20 = v82;
                  v26 = v83;
                  v23 = v85;
                  v22 = v86;
                  v24 = v84;
                  v32 = v89;
                  goto LABEL_111;
                }
                v10 = v75;
              }
            }

          }
          v112 += i;
          v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v132, 16);
          if (v111)
            continue;
          break;
        }

        v32 = v89;
        if (v39)
        {
          objc_msgSend(v101, "addObject:", v39);
          v9 = v87;
          v8 = v88;
          v23 = v85;
          v22 = v86;
          v26 = v83;
          v24 = v84;
          v29 = 0.5;
          if (objc_msgSend(v105, "count"))
          {
            objc_msgSend(v96, "dedupItems:toItem:withDedupingType:", v105, v39, 3);
            objc_msgSend(v105, "removeAllObjects");
          }
          v20 = v82;
        }
        else
        {
          v9 = v87;
          v8 = v88;
          v20 = v82;
          v26 = v83;
          v23 = v85;
          v22 = v86;
          v24 = v84;
          v29 = 0.5;
        }
LABEL_89:

LABEL_90:
        objc_autoreleasePoolPop(context);
LABEL_91:
        objc_msgSend(v22, "removeAllObjects");
        v76 = !v92;
        if (v99 != v23)
          v76 = 1;
        if ((v76 & 1) == 0)
          objc_msgSend(v101, "addObject:", v23);
LABEL_95:
        objc_msgSend(v22, "addObject:", v99);
        objc_msgSend(v99, "duration");
        objc_msgSend(v32, "dateByAddingTimeInterval:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v102 = v98 + v102;
        if (v115)
        {
          v77 = CFAbsoluteTimeGetCurrent();
          if (v77 - v10 >= 0.01)
          {
            v131 = 0;
            v115[2](v115, &v131, v102);
            if (!v131)
            {
              v10 = v77;
              goto LABEL_99;
            }
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v134 = 199;
              *(_WORD *)&v134[4] = 2080;
              *(_QWORD *)&v134[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGMovieDeduper.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
LABEL_112:

            v79 = v26;
LABEL_113:
            v12 = (id)MEMORY[0x1E0C9AA60];
            goto LABEL_115;
          }
        }
LABEL_99:

        v30 = v95 + 1;
      }
      while (v95 + 1 != v93);
      v78 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v123, v135, 16);
      v93 = v78;
    }
    while (v78);
  }

  if (v115)
  {
    if (CFAbsoluteTimeGetCurrent() - v10 >= 0.01)
    {
      v131 = 0;
      v115[2](v115, &v131, 1.0);
      if (v131)
      {
        v79 = v26;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v134 = 205;
          *(_WORD *)&v134[4] = 2080;
          *(_QWORD *)&v134[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGMovieDeduper.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_113;
      }
    }
  }
  v79 = v26;
  v12 = v101;
LABEL_115:

LABEL_116:
  return v12;
}

@end
