@implementation PGZeroKeywordComputer

- (id)contextualPersonZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  id v7;
  double v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  uint64_t v44;
  double Current;
  char v46;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id obj;
  void *v64;
  id v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  id v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t v72;
  _QWORD v73[4];
  id v74;
  id v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  BOOL v92;
  _QWORD v93[4];
  id v94;
  id v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD aBlock[4];
  id v104;
  id v105;
  char v106;
  uint64_t v107;
  double *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  char v114;
  _BYTE v115[128];
  const __CFString *v116;
  uint64_t v117;
  uint8_t v118[128];
  uint8_t buf[8];
  __int128 v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v65 = a3;
  v7 = a4;
  v57 = a5;
  v111 = 0;
  v112 = &v111;
  v113 = 0x2020000000;
  v114 = 0;
  v107 = 0;
  v108 = (double *)&v107;
  v109 = 0x2020000000;
  v110 = 0;
  v66 = _Block_copy(v57);
  v56 = v7;
  if (v66
    && (v8 = CFAbsoluteTimeGetCurrent(), v8 - v108[3] >= 0.01)
    && (v108[3] = v8,
        v106 = 0,
        (*((void (**)(void *, char *, double))v66 + 2))(v66, &v106, 0.0),
        v9 = *((_BYTE *)v112 + 24) | v106,
        (*((_BYTE *)v112 + 24) = v9) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 49;
      LOWORD(v120) = 2080;
      *(_QWORD *)((char *)&v120 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionPeopleNamesKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionDateKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v58 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
      v58 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke;
    aBlock[3] = &unk_1E842CBC8;
    v54 = v14;
    v104 = v54;
    v62 = v15;
    v105 = v62;
    v64 = _Block_copy(aBlock);
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    obj = v11;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v118, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v100;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v100 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i);
          v116 = CFSTR("name");
          v117 = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v93[0] = MEMORY[0x1E0C809B0];
          v93[1] = 3221225472;
          v93[2] = __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_2;
          v93[3] = &unk_1E842CBF0;
          v94 = v64;
          v95 = v66;
          v96 = &v107;
          v98 = 0x3F847AE147AE147BLL;
          v97 = &v111;
          objc_msgSend(v65, "enumerateNodesWithLabel:domain:properties:usingBlock:", CFSTR("People"), 300, v20, v93);

          if (*((_BYTE *)v112 + 24))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = 82;
              LOWORD(v120) = 2080;
              *(_QWORD *)((char *)&v120 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            v10 = (id)MEMORY[0x1E0C9AA60];
            v27 = v94;
            v55 = obj;
            goto LABEL_55;
          }

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v118, 16);
        if (v16)
          continue;
        break;
      }
    }

    filteredKeywords(v62, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addObjectsFromArray:", v21);

    objc_msgSend(v62, "removeAllObjects");
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingWeeksOfYear:toDate:", -1, v58);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingWeeksOfYear:toDate:", 1, v58);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v22, v23);
    v25 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v22);
    v55 = (void *)v22;
    v51 = (void *)v23;
    v26 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v23);
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_164;
    v83[3] = &unk_1E842CC18;
    v89 = v25;
    v50 = v24;
    v84 = v50;
    v92 = v25 != v26;
    v60 = v64;
    v85 = v60;
    v90 = v26;
    v61 = v66;
    v86 = v61;
    v87 = &v107;
    v91 = 0x3F847AE147AE147BLL;
    v88 = &v111;
    objc_msgSend(v65, "enumerateNodesWithLabel:domain:usingBlock:", 0, 300, v83);
    if (*((_BYTE *)v112 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 120;
        LOWORD(v120) = 2080;
        *(_QWORD *)((char *)&v120 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      filteredKeywords(v62, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addObjectsFromArray:", v28);

      objc_msgSend(v62, "removeAllObjects");
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v22, v58);
      -[PGZeroKeywordComputer momentNodesOverlappingLocalDateInterval:inGraph:](self, "momentNodesOverlappingLocalDateInterval:inGraph:");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "set");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v30;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v120 = v31;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&v120 + 1) = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "sortedArrayUsingDescriptors:", v33);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      objc_msgSend(v53, "reverseObjectEnumerator");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v79, v115, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v80;
        while (2)
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v80 != v36)
              objc_enumerationMutation(v34);
            v38 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
            v73[0] = MEMORY[0x1E0C809B0];
            v73[1] = 3221225472;
            v73[2] = __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_165;
            v73[3] = &unk_1E842CBF0;
            v74 = v60;
            v75 = v61;
            v76 = &v107;
            v77 = &v111;
            v78 = 0x3F847AE147AE147BLL;
            objc_msgSend(v38, "enumeratePersonNodesUsingBlock:", v73);
            if (*((_BYTE *)v112 + 24))
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = 139;
                LOWORD(v120) = 2080;
                *(_QWORD *)((char *)&v120 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_45;
            }

          }
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v79, v115, 16);
          if (v35)
            continue;
          break;
        }
      }

      if (!objc_msgSend(v62, "count"))
      {
        objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingWeeksOfYear:toDate:", -2, v58);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "firstObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "previousMomentNode");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        while (1)
        {
          if (objc_msgSend(v62, "count")
            || !v41
            || (objc_msgSend(v41, "localEndDate"),
                v42 = (void *)objc_claimAutoreleasedReturnValue(),
                v43 = objc_msgSend(v42, "compare:", v39) == -1,
                v42,
                v43))
          {

            break;
          }
          if (objc_msgSend(v41, "isInteresting"))
          {
            v67[0] = MEMORY[0x1E0C809B0];
            v67[1] = 3221225472;
            v67[2] = __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_166;
            v67[3] = &unk_1E842CBF0;
            v68 = v60;
            v69 = v61;
            v70 = &v107;
            v71 = &v111;
            v72 = 0x3F847AE147AE147BLL;
            objc_msgSend(v41, "enumeratePersonNodesUsingBlock:", v67);
            if (*((_BYTE *)v112 + 24))
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = 154;
                LOWORD(v120) = 2080;
                *(_QWORD *)((char *)&v120 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_45;
            }

          }
          objc_msgSend(v41, "previousMomentNode");
          v44 = objc_claimAutoreleasedReturnValue();

          v41 = (void *)v44;
        }
      }
      if (v66
        && (Current = CFAbsoluteTimeGetCurrent(), Current - v108[3] >= 0.01)
        && (v108[3] = Current,
            v106 = 0,
            (*((void (**)(id, char *, double))v61 + 2))(v61, &v106, 1.0),
            v46 = *((_BYTE *)v112 + 24) | v106,
            (*((_BYTE *)v112 + 24) = v46) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 160;
          LOWORD(v120) = 2080;
          *(_QWORD *)((char *)&v120 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
LABEL_45:
        v10 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v10 = v59;
      }

    }
    v27 = v51;
LABEL_55:

  }
  _Block_object_dispose(&v107, 8);
  _Block_object_dispose(&v111, 8);

  return v10;
}

- (id)contextualSocialGroupZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(void *, _BYTE *, double);
  double v12;
  double Current;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  PHPhotoLibrary *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  id v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  double v55;
  void *v56;
  void *v58;
  void *v59;
  void *v60;
  PGZeroKeywordComputer *v61;
  void *v62;
  id v63;
  id v64;
  PHPhotoLibrary *v65;
  id v66;
  id v67;
  uint64_t v68;
  void *v69;
  id v70;
  void (**v71)(void *, void *);
  id obj;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD aBlock[4];
  id v88;
  PHPhotoLibrary *v89;
  id v90;
  id v91;
  char v92;
  _BYTE v93[128];
  const __CFString *v94;
  uint64_t v95;
  uint8_t v96[128];
  uint8_t buf[8];
  __int128 v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(void *, _BYTE *, double))_Block_copy(v10);
  v12 = 0.0;
  if (!v11)
    goto LABEL_8;
  Current = CFAbsoluteTimeGetCurrent();
  if (Current < 0.01)
    goto LABEL_8;
  v92 = 0;
  v11[2](v11, &v92, 0.0);
  if (!v92)
  {
    v12 = Current;
LABEL_8:
    v63 = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionPeopleNamesKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionDateKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v64 = v9;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v69 = v19;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = self;
    v22 = self->_photoLibrary;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke;
    aBlock[3] = &unk_1E842CC40;
    v67 = v8;
    v23 = v8;
    v88 = v23;
    v65 = v22;
    v89 = v65;
    v66 = v20;
    v90 = v66;
    v70 = v15;
    v91 = v70;
    v71 = (void (**)(void *, void *))_Block_copy(aBlock);
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    obj = v16;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v84 != v26)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
          v94 = CFSTR("name");
          v95 = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v81[0] = MEMORY[0x1E0C809B0];
          v81[1] = 3221225472;
          v81[2] = __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke_2;
          v81[3] = &unk_1E8434020;
          v82 = v21;
          objc_msgSend(v23, "enumerateNodesWithLabel:domain:properties:usingBlock:", CFSTR("People"), 300, v29, v81);

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
      }
      while (v25);
    }

    v71[2](v71, v21);
    if (v11)
    {
      v30 = CFAbsoluteTimeGetCurrent();
      v31 = v69;
      v32 = v70;
      if (v30 - v12 >= 0.01)
      {
        v92 = 0;
        v11[2](v11, &v92, 0.5);
        if (v92)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = 206;
            LOWORD(v98) = 2080;
            *(_QWORD *)((char *)&v98 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v14 = (id)MEMORY[0x1E0C9AA60];
          v8 = v67;
          v10 = v63;
          v9 = v64;
LABEL_67:

          goto LABEL_68;
        }
        v12 = v30;
      }
    }
    else
    {
      v31 = v69;
      v32 = v70;
    }
    v68 = objc_msgSend(v32, "count");
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingWeeksOfYear:toDate:", -1, v31);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v31;
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v60, v31);
    -[PGZeroKeywordComputer momentNodesOverlappingLocalDateInterval:inGraph:](v61, "momentNodesOverlappingLocalDateInterval:inGraph:");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "set");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v34;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v98 = v35;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&v98 + 1) = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "sortedArrayUsingDescriptors:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v62 = v38;
    objc_msgSend(v38, "reverseObjectEnumerator");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v78;
      v8 = v67;
      while (2)
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v78 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
          v45 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v21, "removeAllObjects");
          v75[0] = MEMORY[0x1E0C809B0];
          v75[1] = 3221225472;
          v75[2] = __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke_169;
          v75[3] = &unk_1E8434020;
          v46 = v21;
          v76 = v46;
          objc_msgSend(v44, "enumeratePersonNodesUsingBlock:", v75);
          v71[2](v71, v46);
          if (v11)
          {
            v47 = CFAbsoluteTimeGetCurrent();
            if (v47 - v12 >= 0.01)
            {
              v92 = 0;
              v11[2](v11, &v92, 0.5);
              if (v92)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = 226;
                  LOWORD(v98) = 2080;
                  *(_QWORD *)((char *)&v98 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoana"
                                                  "lysis/PhotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                objc_autoreleasePoolPop(v45);
                v14 = (id)MEMORY[0x1E0C9AA60];
                v10 = v63;
                v9 = v64;
LABEL_41:
                v32 = v70;
                goto LABEL_66;
              }
              v12 = v47;
            }
          }

          objc_autoreleasePoolPop(v45);
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
        if (v41)
          continue;
        break;
      }
    }
    else
    {
      v8 = v67;
    }

    v32 = v70;
    if (objc_msgSend(v70, "count") == v68)
    {
      objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingWeeksOfYear:toDate:", -2, v69);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "firstObject");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "previousMomentNode");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v63;
      if (objc_msgSend(v70, "count") == v68 && v50)
      {
        while (1)
        {
          objc_msgSend(v50, "localEndDate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "compare:", v48);

          if (v52 == -1)
            break;
          v53 = (void *)MEMORY[0x1CAA4EB2C]();
          if (objc_msgSend(v50, "isInteresting"))
          {
            objc_msgSend(v21, "removeAllObjects");
            v73[0] = MEMORY[0x1E0C809B0];
            v73[1] = 3221225472;
            v73[2] = __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke_170;
            v73[3] = &unk_1E8434020;
            v54 = v21;
            v74 = v54;
            objc_msgSend(v50, "enumeratePersonNodesUsingBlock:", v73);
            v71[2](v71, v54);
            if (v11)
            {
              v55 = CFAbsoluteTimeGetCurrent();
              if (v55 - v12 >= 0.01)
              {
                v92 = 0;
                v11[2](v11, &v92, 0.5);
                if (v92)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&buf[4] = 245;
                    LOWORD(v98) = 2080;
                    *(_QWORD *)((char *)&v98 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoa"
                                                    "nalysis/PhotosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  objc_autoreleasePoolPop(v53);
                  v14 = (id)MEMORY[0x1E0C9AA60];
                  v9 = v64;
                  goto LABEL_41;
                }
                v12 = v55;
              }
            }

          }
          objc_msgSend(v50, "previousMomentNode");
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v53);
          if (objc_msgSend(v70, "count") == v68)
          {
            v50 = v56;
            if (v56)
              continue;
          }
          goto LABEL_58;
        }
      }
      v56 = v50;
LABEL_58:

      v32 = v70;
    }
    else
    {
      v10 = v63;
    }
    v9 = v64;
    if (v11 && CFAbsoluteTimeGetCurrent() - v12 >= 0.01 && (v92 = 0, v11[2](v11, &v92, 1.0), v92))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 252;
        LOWORD(v98) = 2080;
        *(_QWORD *)((char *)&v98 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v14 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v14 = v32;
    }
LABEL_66:

    goto LABEL_67;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 168;
    LOWORD(v98) = 2080;
    *(_QWORD *)((char *)&v98 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v14 = (id)MEMORY[0x1E0C9AA60];
LABEL_68:

  return v14;
}

- (id)contextualSeasonZeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  void *v22;
  PHPhotoLibrary *photoLibrary;
  PGCurationManager *curationManager;
  void *v25;
  void *v26;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0C99DE8];
  v11 = a5;
  objc_msgSend(v10, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionDateKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(v8, "seasonNodeForLocalDate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D4B130], "isFirstTenDaysOfSeasonForLocalDate:", v15))
  {
    objc_msgSend(v8, "previousSeasonNodeForSeasonNode:", v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v17, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412290;
      v29 = v20;
      v21 = "Contextual Season ZK : previous season %@";
LABEL_9:
      _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v28, 0xCu);

    }
  }
  else
  {
    v17 = v16;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v17, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412290;
      v29 = v20;
      v21 = "Contextual Season ZK : current season %@";
      goto LABEL_9;
    }
  }

  if (v17)
  {
    photoLibrary = self->_photoLibrary;
    curationManager = self->_curationManager;
    -[PGZeroKeywordComputer searchComputationCache](self, "searchComputationCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    seasonNodeZeroKeyword(v17, photoLibrary, curationManager, v25, v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v12, "addObject:", v26);

    }
  }

  return v12;
}

- (id)contextualSceneZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  double v8;
  double Current;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  int v31;
  int v32;
  uint64_t v33;
  __int128 v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  char v44;
  void (**v45)(void *, _QWORD *, double);
  void *v46;
  void *v47;
  unsigned __int8 v48;
  _QWORD v49[4];
  id v50;
  _QWORD *v51;
  uint64_t *p_buf;
  _QWORD v53[4];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _DWORD v58[2];
  __int16 v59;
  const char *v60;
  uint64_t buf;
  __int128 v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v42 = a4;
  v36 = a5;
  v8 = 0.0;
  v45 = (void (**)(void *, _QWORD *, double))_Block_copy(v36);
  if (v45)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(v53[0]) = 0;
      v45[2](v45, v53, 0.0);
      if (LOBYTE(v53[0]))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          buf = 0x19304000202;
          LOWORD(v62) = 2080;
          *(_QWORD *)((char *)&v62 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        }
        v10 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_46;
      }
      v8 = Current;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionDateKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v43 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
    v43 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingWeeksOfYear:toDate:", -2, v43);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v40, v43);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGZeroKeywordComputer momentNodesOverlappingLocalDateInterval:inGraph:](self, "momentNodesOverlappingLocalDateInterval:inGraph:", v39, v41);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  buf = (uint64_t)v14;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v62 = v15;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v62 + 1) = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sortedArrayUsingDescriptors:", v17);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0u;
  v55 = 0u;
  v56 = 0u;
  v54 = 0u;
  objc_msgSend(v37, "reverseObjectEnumerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (!v19)
  {
    v44 = 0;
    goto LABEL_38;
  }
  v44 = 0;
  v21 = *(_QWORD *)v55;
  *(_QWORD *)&v20 = 67109378;
  v35 = v20;
  while (2)
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v55 != v21)
        objc_enumerationMutation(v18);
      v23 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v22);
      if (!objc_msgSend(v23, "isInteresting", v35, v36))
        goto LABEL_26;
      buf = 0;
      *(_QWORD *)&v62 = &buf;
      *((_QWORD *)&v62 + 1) = 0x3032000000;
      v63 = __Block_byref_object_copy__30763;
      v64 = __Block_byref_object_dispose__30764;
      v65 = 0;
      v53[0] = 0;
      v53[1] = v53;
      v53[2] = 0x2020000000;
      v53[3] = 0;
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __96__PGZeroKeywordComputer_Contextual__contextualSceneZeroKeywordsWithGraph_options_progressBlock___block_invoke;
      v49[3] = &unk_1E842CD08;
      v24 = v46;
      v50 = v24;
      v51 = v53;
      p_buf = &buf;
      objc_msgSend(v23, "enumerateSceneEdgesAndNodesUsingBlock:", v49);
      v25 = *(void **)(v62 + 40);
      if (!v25)
        goto LABEL_49;
      objc_msgSend(v25, "targetNode");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v26, "sceneIdentifier"));
      v28 = objc_claimAutoreleasedReturnValue();
      zeroKeywordWithAttributes(3, 13, v27, 0, 0, (void *)v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "addObject:", v29);
      objc_msgSend(v24, "addObject:", v26);
      LOBYTE(v28) = (unint64_t)objc_msgSend(v47, "count") < 2;

      if ((v28 & 1) == 0)
      {
        v32 = 0;
        v31 = 1;
      }
      else
      {
LABEL_49:
        if (v45)
        {
          v30 = CFAbsoluteTimeGetCurrent();
          if (v30 - v8 >= 0.01)
          {
            v48 = 0;
            ((void (**)(void *, unsigned __int8 *, double))v45)[2](v45, &v48, 0.5);
            if (v48 | v44 & 1)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                v58[0] = v35;
                v58[1] = 452;
                v59 = 2080;
                v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Search/PGZeroKeywordComputer+Contextual.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v58, 0x12u);
              }
              v32 = 0;
              v31 = 0;
              v44 = 1;
            }
            else
            {
              v31 = 0;
              v44 = 0;
              v32 = 1;
            }
            goto LABEL_24;
          }
        }
        v31 = 0;
        v32 = 1;
      }
      v30 = v8;
LABEL_24:

      _Block_object_dispose(v53, 8);
      _Block_object_dispose(&buf, 8);

      if (!v32)
      {

        if (v31)
          goto LABEL_39;
        goto LABEL_36;
      }
      v8 = v30;
LABEL_26:
      ++v22;
    }
    while (v19 != v22);
    v33 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    v19 = v33;
    if (v33)
      continue;
    break;
  }
LABEL_38:

  v30 = v8;
LABEL_39:
  if (v45
    && CFAbsoluteTimeGetCurrent() - v30 >= 0.01
    && (LOBYTE(v53[0]) = 0, v45[2](v45, v53, 1.0), LOBYTE(v53[0]) | v44 & 1))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 0x1C704000202;
      LOWORD(v62) = 2080;
      *(_QWORD *)((char *)&v62 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
LABEL_36:
    v10 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v10 = v47;
  }

LABEL_46:
  return v10;
}

- (id)contextualMeaningAndTripZeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6
{
  id v9;
  double v10;
  double Current;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  double v31;
  uint64_t v32;
  __int128 v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  char v44;
  id v45;
  void *v46;
  void (**v47)(void *, _QWORD *, double);
  unsigned __int8 v49;
  _QWORD v50[7];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _DWORD v61[2];
  __int16 v62;
  const char *v63;
  uint64_t buf;
  __int128 v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v45 = a4;
  v9 = a5;
  v35 = a6;
  v10 = 0.0;
  v47 = (void (**)(void *, _QWORD *, double))_Block_copy(v35);
  v36 = v9;
  if (v47)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(v51) = 0;
      v47[2](v47, &v51, 0.0);
      if ((_BYTE)v51)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          buf = 0x1CF04000202;
          LOWORD(v65) = 2080;
          *(_QWORD *)((char *)&v65 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        }
        v12 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_54;
      }
      v10 = Current;
    }
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionDateKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v41 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
    v41 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingWeeksOfYear:toDate:", -2, v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v40, v41);
  -[PGZeroKeywordComputer momentNodesOverlappingLocalDateInterval:inGraph:](self, "momentNodesOverlappingLocalDateInterval:inGraph:", v39, v42);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  buf = (uint64_t)v16;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v65 = v17;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v65 + 1) = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "sortedArrayUsingDescriptors:", v19);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v37, "reverseObjectEnumerator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (!v21)
  {
    v44 = 0;
    goto LABEL_46;
  }
  v23 = 0;
  v44 = 0;
  v24 = *(_QWORD *)v58;
  *(_QWORD *)&v22 = 67109378;
  v34 = v22;
  while (2)
  {
    v25 = 0;
    do
    {
      if (*(_QWORD *)v58 != v24)
        objc_enumerationMutation(v20);
      v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v25);
      if (!objc_msgSend(v26, "isInteresting", v34, v35))
        goto LABEL_34;
      if ((v23 & 1) == 0)
      {
        if (!objc_msgSend(v26, "isPartOfTrip"))
        {
          v23 = 0;
          goto LABEL_24;
        }
        -[PGZeroKeywordComputer tripZeroKeywordWithGraph:curationContext:](self, "tripZeroKeywordWithGraph:curationContext:", v42, v45);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v43, "addObject:", v27);

      }
      v23 = 1;
LABEL_24:
      buf = 0;
      *(_QWORD *)&v65 = &buf;
      *((_QWORD *)&v65 + 1) = 0x3032000000;
      v66 = __Block_byref_object_copy__30763;
      v67 = __Block_byref_object_dispose__30764;
      v68 = 0;
      v51 = 0;
      v52 = &v51;
      v53 = 0x3032000000;
      v54 = __Block_byref_object_copy__30763;
      v55 = __Block_byref_object_dispose__30764;
      v56 = 0;
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __121__PGZeroKeywordComputer_Contextual__contextualMeaningAndTripZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke;
      v50[3] = &unk_1E842CD30;
      v50[4] = self;
      v50[5] = &buf;
      v50[6] = &v51;
      objc_msgSend(v26, "enumerateMeaningEdgesAndNodesUsingBlock:", v50);
      if (*(_QWORD *)(v65 + 40)
        && (objc_msgSend(v46, "containsObject:", v52[5]) & 1) == 0
        && (-[PGZeroKeywordComputer meaningNodeZeroKeywordForDisplayMeaningNode:collectionUUIDsToAvoid:curationContext:](self, "meaningNodeZeroKeywordForDisplayMeaningNode:collectionUUIDsToAvoid:curationContext:", v52[5], 0, v45), (v28 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(v43, "addObject:", v28);

        v29 = 0;
        v30 = 1;
      }
      else
      {
        if (v47)
        {
          v31 = CFAbsoluteTimeGetCurrent();
          if (v31 - v10 >= 0.01)
          {
            v49 = 0;
            ((void (**)(void *, unsigned __int8 *, double))v47)[2](v47, &v49, 0.5);
            if (v49 | v44 & 1)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                v61[0] = v34;
                v61[1] = 528;
                v62 = 2080;
                v63 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Search/PGZeroKeywordComputer+Contextual.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v61, 0x12u);
              }
              v29 = 0;
              v30 = 0;
              v44 = 1;
            }
            else
            {
              v30 = 0;
              v44 = 0;
              v29 = 1;
            }
            goto LABEL_32;
          }
        }
        v30 = 0;
        v29 = 1;
      }
      v31 = v10;
LABEL_32:
      _Block_object_dispose(&v51, 8);

      _Block_object_dispose(&buf, 8);
      if (!v29)
      {

        if (v30)
          goto LABEL_47;
        goto LABEL_44;
      }
      v10 = v31;
LABEL_34:
      ++v25;
    }
    while (v21 != v25);
    v32 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    v21 = v32;
    if (v32)
      continue;
    break;
  }
LABEL_46:

  v31 = v10;
LABEL_47:
  if (v47
    && CFAbsoluteTimeGetCurrent() - v31 >= 0.01
    && (LOBYTE(v51) = 0, v47[2](v47, &v51, 1.0), v51 | v44 & 1))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 0x21304000202;
      LOWORD(v65) = 2080;
      *(_QWORD *)((char *)&v65 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
LABEL_44:
    v12 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v12 = v43;
  }

LABEL_54:
  return v12;
}

- (id)contextualDateZeroKeywordsWithGraph:(id)a3 options:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionDateKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingYears:toDate:", -1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0D72F68];
  objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -*MEMORY[0x1E0D72F68], v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", v14, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v15, v16);
  -[PGZeroKeywordComputer momentNodesOverlappingLocalDateInterval:inGraph:](self, "momentNodesOverlappingLocalDateInterval:inGraph:", v17, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "count"))
  {
    v28 = v9;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PGZeroKeywordOneYearAgoSearchableText"), CFSTR("PGZeroKeywordOneYearAgoSearchableText"), CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0D71900];
    objc_msgSend(MEMORY[0x1E0D71AC8], "locale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = objc_msgSend(v21, "nlpSearchSupportsLocale:", v22);

    if ((_DWORD)v21)
    {
      objc_msgSend(v18, "set");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      bestEventNodeForEventNodes(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v24, "localIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        zeroKeywordWithAttributes(7, 8, v20, v20, 0, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "addObject:", v26);
      }

    }
    v9 = v28;
  }

  return v9;
}

- (id)_zeroKeywordDisplayMeaningNodeForMeaningNode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__30763;
  v16 = __Block_byref_object_dispose__30764;
  v17 = 0;
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zeroKeywordMappingByMeaningLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__PGZeroKeywordComputer_Contextual___zeroKeywordDisplayMeaningNodeForMeaningNode___block_invoke;
  v9[3] = &unk_1E842CD58;
  v6 = v3;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)momentNodesOverlappingLocalDateInterval:(id)a3 inGraph:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGZeroKeywordComputer shouldFilterMomentNodesWithPresence](self, "shouldFilterMomentNodesWithPresence"))
  {
    -[PGZeroKeywordComputer momentNodesWhereMeIsPresent](self, "momentNodesWhereMeIsPresent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionByIntersecting:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

void __82__PGZeroKeywordComputer_Contextual___zeroKeywordDisplayMeaningNodeForMeaningNode___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "mappedMeaningNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v10, "displayNode");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
  }

}

void __121__PGZeroKeywordComputer_Contextual__contextualMeaningAndTripZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_zeroKeywordDisplayMeaningNodeForMeaningNode:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(v11, "isReliable"))
    {
      if ((unint64_t)objc_msgSend(v6, "countOfEdgesWithLabel:domain:", CFSTR("MEANING"), 700) >= 3)
      {
        objc_msgSend(v11, "confidence");
        v9 = v8;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "confidence");
        if (v9 > v10)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
        }
      }
    }
  }

}

void __96__PGZeroKeywordComputer_Contextual__contextualSceneZeroKeywordsWithGraph_options_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) == 0)
  {
    if (objc_msgSend(v9, "isReliable"))
    {
      if (objc_msgSend(v9, "numberOfSearchConfidenceAssets"))
      {
        if (objc_msgSend(v6, "isSuitableForSuggestions"))
        {
          if (objc_msgSend(v6, "isIndexed"))
          {
            v7 = (double)(unint64_t)objc_msgSend(v9, "numberOfSearchConfidenceAssets");
            v8 = ((double)(unint64_t)(objc_msgSend(v6, "level") - 1) * 0.1 + 1.0) * v7;
            if (v8 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
            {
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
              *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
            }
          }
        }
      }
    }
  }

}

void __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "maximalSocialGroupsOverlappingMemberLocalIdentifiers:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGPeopleUtilities validateSocialGroups:withPhotoLibrary:graph:](PGPeopleUtilities, "validateSocialGroups:withPhotoLibrary:graph:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v10, "count") == 1;
  v5 = v10;
  if (v4)
  {
    objc_msgSend(v10, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    personUUIDsFromPersonLocalIdentifiers(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLSearchSocialGroupLookupIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", v8) & 1) == 0)
    {
      zeroKeywordWithAttributes(1, 5, 0, 0, v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

    }
    v5 = v10;
  }

}

void __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "localIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke_169(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "localIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __102__PGZeroKeywordComputer_Contextual__contextualSocialGroupZeroKeywordsWithGraph_options_progressBlock___block_invoke_170(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "localIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  PGRankedZeroKeyword *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    objc_msgSend(v12, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    zeroKeywordWithAttributes(0, 1, v5, 0, v4, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "momentNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (double)(unint64_t)objc_msgSend(v8, "count");

    v10 = *(void **)(a1 + 40);
    v11 = -[PGRankedZeroKeyword initWithKeyword:score:]([PGRankedZeroKeyword alloc], "initWithKeyword:score:", v6, v9);
    objc_msgSend(v10, "addObject:", v11);

  }
}

void __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  double Current;
  uint64_t v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_QWORD *)(a1 + 40))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *a3 = 1;
    }
  }
}

void __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_164(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double Current;
  uint64_t v10;

  v5 = a2;
  objc_msgSend(v5, "birthdayDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "dateBySettingYear:ofDate:", *(_QWORD *)(a1 + 72), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "containsDate:", v7) & 1) != 0
      || *(_BYTE *)(a1 + 96)
      && (objc_msgSend(MEMORY[0x1E0D4B130], "dateBySettingYear:ofDate:", *(_QWORD *)(a1 + 80), v6),
          v8 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7 = (void *)v8,
          objc_msgSend(*(id *)(a1 + 32), "containsDate:", v8)))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    if (*(_QWORD *)(a1 + 48))
    {
      Current = CFAbsoluteTimeGetCurrent();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (Current - *(double *)(v10 + 24) >= *(double *)(a1 + 88))
      {
        *(double *)(v10 + 24) = Current;
        (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(0.5);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 24);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          *a3 = 1;
      }
    }

  }
}

void __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_165(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  double Current;
  uint64_t v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_QWORD *)(a1 + 40))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *a3 = 1;
    }
  }
}

void __97__PGZeroKeywordComputer_Contextual__contextualPersonZeroKeywordsWithGraph_options_progressBlock___block_invoke_166(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  double Current;
  uint64_t v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_QWORD *)(a1 + 40))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *a3 = 1;
    }
  }
}

+ (id)contextualHolidayZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  id v7;
  double v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  double Current;
  char v36;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  char v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t *p_buf;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  uint64_t v69;
  double *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char v76;
  int v77;
  int v78;
  __int16 v79;
  const char *v80;
  uint64_t buf;
  __int128 v82;
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v47 = a4;
  v40 = a5;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v76 = 0;
  v69 = 0;
  v70 = (double *)&v69;
  v71 = 0x2020000000;
  v72 = 0;
  v46 = _Block_copy(v40);
  if (!v46
    || (v8 = CFAbsoluteTimeGetCurrent(), v8 - v70[3] < 0.01)
    || (v70[3] = v8,
        LOBYTE(v77) = 0,
        (*((void (**)(void *, int *, double))v46 + 2))(v46, &v77, 0.0),
        v9 = *((_BYTE *)v74 + 24) | v77,
        (*((_BYTE *)v74 + 24) = v9) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionDateKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingWeeksOfYear:toDate:", -1, v15);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B130], "endOfDayForDate:", v15);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 1, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "startOfDayForDate:", v17);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingWeeksOfYear:toDate:", 1, v15);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B180]), "initWithLocale:", v44);
    +[PGGraphNodeCollection nodesInGraph:](PGGraphHolidayNodeCollection, "nodesInGraph:", v7);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0D429D8];
    +[PGGraphHolidayNode datesOfCelebration](PGGraphHolidayNode, "datesOfCelebration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "adjacencyWithSources:relation:targetsClass:", v43, v19, objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "sources");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = MEMORY[0x1E0C809B0];
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke;
    v67[3] = &unk_1E8433B30;
    v23 = v21;
    v68 = v23;
    objc_msgSend(v48, "enumerateNodesUsingBlock:", v67);
    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v20, "targets");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v22;
    v65[1] = 3221225472;
    v65[2] = __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_2;
    v65[3] = &unk_1E8432070;
    v26 = v24;
    v66 = v26;
    objc_msgSend(v25, "enumerateNodesUsingBlock:", v65);

    objc_msgSend(v48, "holidayNames");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v22;
    v60[1] = 3221225472;
    v60[2] = __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_3;
    v60[3] = &unk_1E842CC90;
    v28 = v20;
    v61 = v28;
    v29 = v23;
    v62 = v29;
    v30 = v26;
    v63 = v30;
    v31 = v11;
    v64 = v31;
    objc_msgSend(v45, "enumerateEventRulesWithNames:betweenLocalDate:andLocalDate:usingBlock:", v27, v41, v42, v60);
    if (*((_BYTE *)v74 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 0x13704000202;
        LOWORD(v82) = 2080;
        *(_QWORD *)((char *)&v82 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
      v10 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_28;
    }
    if ((unint64_t)objc_msgSend(v31, "count") >= 3)
      objc_msgSend(v31, "removeObjectsInRange:", 0, objc_msgSend(v31, "count") - 2);
    buf = 0;
    *(_QWORD *)&v82 = &buf;
    *((_QWORD *)&v82 + 1) = 0x2020000000;
    v83 = 2;
    v50[0] = v22;
    v50[1] = 3221225472;
    v50[2] = __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_183;
    v50[3] = &unk_1E842CCE0;
    v51 = v28;
    v52 = v29;
    v53 = v30;
    v32 = v31;
    v54 = v32;
    p_buf = &buf;
    v33 = v46;
    v55 = v33;
    v57 = &v69;
    v58 = &v73;
    v59 = 0x3F847AE147AE147BLL;
    objc_msgSend(v45, "enumerateEventRulesWithNames:betweenLocalDate:andLocalDate:usingBlock:", v27, v39, v38, v50);
    if (*((_BYTE *)v74 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v77 = 67109378;
        v78 = 363;
        v79 = 2080;
        v80 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/P"
              "GZeroKeywordComputer+Contextual.m";
        v34 = MEMORY[0x1E0C81028];
LABEL_19:
        _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v77, 0x12u);
      }
    }
    else
    {
      if (!v46
        || (Current = CFAbsoluteTimeGetCurrent(), Current - v70[3] < 0.01)
        || (v70[3] = Current,
            v49 = 0,
            (*((void (**)(id, char *, double))v33 + 2))(v33, &v49, 1.0),
            v36 = *((_BYTE *)v74 + 24) | v49,
            (*((_BYTE *)v74 + 24) = v36) == 0))
      {
        v10 = v32;
        goto LABEL_27;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v77 = 67109378;
        v78 = 365;
        v79 = 2080;
        v80 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/P"
              "GZeroKeywordComputer+Contextual.m";
        v34 = MEMORY[0x1E0C81028];
        goto LABEL_19;
      }
    }
    v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_27:

    _Block_object_dispose(&buf, 8);
LABEL_28:

    goto LABEL_29;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0x10404000202;
    LOWORD(v82) = 2080;
    *(_QWORD *)((char *)&v82 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Search/PGZeroKeywordComputer+Contextual.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_29:
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);

  return v10;
}

void __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

}

void __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

}

void __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_4;
  v10[3] = &unk_1E842CC68;
  v7 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = *(id *)(a1 + 48);
  v14 = v6;
  v15 = *(id *)(a1 + 56);
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "enumerateTargetsBySourceWithBlock:", v10);

}

void __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_183(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  double Current;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _BYTE *v23;

  v7 = a2;
  v8 = a3;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_2_184;
  v16[3] = &unk_1E842CCB8;
  v9 = *(void **)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v10 = v7;
  v18 = v10;
  v19 = *(id *)(a1 + 48);
  v11 = v8;
  v20 = v11;
  v12 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 72);
  v21 = v12;
  v22 = v13;
  v23 = a4;
  objc_msgSend(v9, "enumerateTargetsBySourceWithBlock:", v16);
  if (*(_QWORD *)(a1 + 64))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    if (Current - *(double *)(v15 + 24) >= *(double *)(a1 + 96))
    {
      *(double *)(v15 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
        *a4 = 1;
    }
  }

}

void __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_2_184(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  BOOL v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id obj;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "elementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "firstElement");

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v10;
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v37 = v5;
    objc_msgSend(v5, "elementIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "indexArray");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v15;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v52;
      v19 = *MEMORY[0x1E0D72AF8];
      v20 = *MEMORY[0x1E0D72AA0];
      v38 = *(_QWORD *)v52;
      v39 = a1;
      do
      {
        v21 = 0;
        v40 = v17;
        do
        {
          if (*(_QWORD *)v52 != v18)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v21));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "localDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v23))
          {
            holidayNodeZeroKeyword(v41);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              v45 = v21;
              v49 = 0u;
              v50 = 0u;
              v47 = 0u;
              v48 = 0u;
              v46 = *(id *)(a1 + 64);
              v25 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v48;
                v43 = v23;
                v44 = v22;
                do
                {
                  for (i = 0; i != v26; ++i)
                  {
                    if (*(_QWORD *)v48 != v27)
                      objc_enumerationMutation(v46);
                    v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                    objc_msgSend(v24, "objectForKeyedSubscript:", v19);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "objectForKeyedSubscript:", v19);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    v32 = objc_msgSend(v30, "isEqualToString:", v31);

                    objc_msgSend(v24, "objectForKeyedSubscript:", v20);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "objectForKeyedSubscript:", v20);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = objc_msgSend(v33, "isEqualToString:", v34);

                    if (v32)
                      v36 = v35 == 0;
                    else
                      v36 = 1;
                    if (!v36)
                    {

                      v18 = v38;
                      a1 = v39;
                      v17 = v40;
                      v22 = v44;
                      v21 = v45;
                      v23 = v43;
                      goto LABEL_23;
                    }
                  }
                  v26 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
                  v23 = v43;
                  v22 = v44;
                }
                while (v26);
              }

              a1 = v39;
              objc_msgSend(*(id *)(v39 + 64), "addObject:", v24);
              --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v39 + 72) + 8) + 24);
              v18 = v38;
              v17 = v40;
              v21 = v45;
              if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v39 + 72) + 8) + 24))
                **(_BYTE **)(v39 + 80) = 1;
            }
LABEL_23:

          }
          ++v21;
        }
        while (v21 != v17);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v17);
    }

    v5 = v37;
  }

}

void __98__PGZeroKeywordComputer_Contextual__contextualHolidayZeroKeywordsWithGraph_options_progressBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "elementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "firstElement");

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v5, "elementIdentifiers", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "indexArray");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v21))
          {
            holidayNodeZeroKeyword(v10);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
              objc_msgSend(*(id *)(a1 + 64), "addObject:", v22);

          }
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v17);
    }

  }
}

- (PGZeroKeywordComputer)initWithPhotoLibrary:(id)a3 curationManager:(id)a4 searchComputationCache:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGZeroKeywordComputer *v12;
  PGZeroKeywordComputer *v13;
  uint64_t v14;
  CLSCurationContext *curationContext;
  uint64_t v16;
  CLSSceneTaxonomyHierarchy *sceneTaxonomy;
  PGGraphMomentNodeCollection *momentNodesWhereMeIsPresent;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PGZeroKeywordComputer;
  v12 = -[PGZeroKeywordComputer init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    objc_storeStrong((id *)&v13->_curationManager, a4);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v13->_photoLibrary);
    curationContext = v13->_curationContext;
    v13->_curationContext = (CLSCurationContext *)v14;

    objc_storeStrong((id *)&v13->_searchComputationCache, a5);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E30]), "initForSceneNetOnly:", 1);
    sceneTaxonomy = v13->_sceneTaxonomy;
    v13->_sceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v16;

    v13->_shouldFilterMomentNodesWithPresence = 0;
    momentNodesWhereMeIsPresent = v13->_momentNodesWhereMeIsPresent;
    v13->_momentNodesWhereMeIsPresent = 0;

  }
  return v13;
}

- (id)zeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint8_t v22[16];
  uint8_t buf[16];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "zeroKeywordLog");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);
  v16 = v14;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "ZeroKeywordComputer-ZeroKeywordComputing", ", buf, 2u);
  }

  -[PGZeroKeywordComputer _zeroKeywordsWithGraph:curationContext:options:progressBlock:](self, "_zeroKeywordsWithGraph:curationContext:options:progressBlock:", v13, v12, v11, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v17;
  v20 = v19;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v20, OS_SIGNPOST_INTERVAL_END, v15, "ZeroKeywordComputer-ZeroKeywordComputing", ", v22, 2u);
  }

  return v18;
}

- (id)_zeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  char v16;
  id v17;
  uint64_t v18;
  PGGraphMomentNodeCollection *v19;
  PGGraphMomentNodeCollection *momentNodesWhereMeIsPresent;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  double Current;
  char v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  int v32;
  double v33;
  char v34;
  NSObject *v36;
  os_signpost_id_t v37;
  NSObject *v38;
  NSObject *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint32_t denom;
  uint32_t numer;
  NSObject *v47;
  NSObject *v48;
  double v49;
  char v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  int v55;
  double v56;
  char v57;
  void *v58;
  id v59;
  void *v60;
  int v61;
  double v62;
  char v63;
  uint64_t v64;
  os_signpost_id_t spid;
  id v66;
  NSObject *v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  _QWORD v74[4];
  id v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  _QWORD v80[4];
  id v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t v84;
  mach_timebase_info info;
  _QWORD v86[4];
  id v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t v90;
  _QWORD v91[4];
  id v92;
  uint64_t *v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  double *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  char v103;
  uint8_t buf[4];
  _BYTE v105[18];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _Block_copy(v13);
  v100 = 0;
  v101 = &v100;
  v102 = 0x2020000000;
  v103 = 0;
  v96 = 0;
  v97 = (double *)&v96;
  v98 = 0x2020000000;
  v99 = 0;
  if (!v14
    || (v15 = CFAbsoluteTimeGetCurrent(), v15 - v97[3] < 0.01)
    || (v97[3] = v15,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v14 + 2))(v14, &info, 0.0),
        v16 = *((_BYTE *)v101 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v101 + 24) = v16) == 0))
  {
    objc_msgSend(v10, "meNodeCollection");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isSharedLibraryEnabled"))
    {
      v18 = objc_msgSend(v68, "count");
      self->_shouldFilterMomentNodesWithPresence = v18 != 0;
      if (v18)
      {
        objc_msgSend(v68, "momentNodesWithPresence");
        v19 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
        momentNodesWhereMeIsPresent = self->_momentNodesWhereMeIsPresent;
        self->_momentNodesWhereMeIsPresent = v19;

      }
    }
    else
    {
      self->_shouldFilterMomentNodesWithPresence = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1CAA4EB2C]();
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke;
    v91[3] = &unk_1E8434F30;
    v23 = v14;
    v92 = v23;
    v93 = &v96;
    v94 = &v100;
    v95 = 0x3F847AE147AE147BLL;
    -[PGZeroKeywordComputer peopleZeroKeywordsWithGraph:curationContext:options:progressBlock:](self, "peopleZeroKeywordsWithGraph:curationContext:options:progressBlock:", v10, v11, v12, v91);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, &unk_1E84E4CA0);

    v25 = *((unsigned __int8 *)v101 + 24);
    if (*((_BYTE *)v101 + 24) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v105 = 104;
      *(_WORD *)&v105[4] = 2080;
      *(_QWORD *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Search/PGZeroKeywordComputer.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }

    objc_autoreleasePoolPop(v22);
    if (v25)
      goto LABEL_30;
    if (v14)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v97[3] >= 0.01)
      {
        v97[3] = Current;
        LOBYTE(info.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v23 + 2))(v23, &info, 0.2);
        v27 = *((_BYTE *)v101 + 24) | LOBYTE(info.numer);
        *((_BYTE *)v101 + 24) = v27;
        if (v27)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v105 = 107;
            *(_WORD *)&v105[4] = 2080;
            *(_QWORD *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Search/PGZeroKeywordComputer.m";
            v28 = MEMORY[0x1E0C81028];
LABEL_29:
            _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_30;
          }
          goto LABEL_30;
        }
      }
    }
    v29 = (void *)MEMORY[0x1CAA4EB2C]();
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_178;
    v86[3] = &unk_1E8434F30;
    v30 = v23;
    v87 = v30;
    v88 = &v96;
    v89 = &v100;
    v90 = 0x3F847AE147AE147BLL;
    -[PGZeroKeywordComputer socialGroupKeywordsWithGraph:curationContext:options:progressBlock:](self, "socialGroupKeywordsWithGraph:curationContext:options:progressBlock:", v10, v11, v12, v86);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v31, &unk_1E84E4CB8);

    v32 = *((unsigned __int8 *)v101 + 24);
    if (*((_BYTE *)v101 + 24) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v105 = 114;
      *(_WORD *)&v105[4] = 2080;
      *(_QWORD *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Search/PGZeroKeywordComputer.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }

    objc_autoreleasePoolPop(v29);
    if (v32)
      goto LABEL_30;
    if (v14)
    {
      v33 = CFAbsoluteTimeGetCurrent();
      if (v33 - v97[3] >= 0.01)
      {
        v97[3] = v33;
        LOBYTE(info.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v30 + 2))(v30, &info, 0.4);
        v34 = *((_BYTE *)v101 + 24) | LOBYTE(info.numer);
        *((_BYTE *)v101 + 24) = v34;
        if (v34)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v105 = 117;
            *(_WORD *)&v105[4] = 2080;
            *(_QWORD *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Search/PGZeroKeywordComputer.m";
            v28 = MEMORY[0x1E0C81028];
            goto LABEL_29;
          }
LABEL_30:
          v17 = (id)MEMORY[0x1E0C9AA70];
LABEL_31:

          goto LABEL_32;
        }
      }
    }
    objc_msgSend((id)objc_opt_class(), "zeroKeywordLog");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_signpost_id_generate(v36);
    v38 = v36;
    v39 = v38;
    spid = v37;
    v40 = v37 - 1;
    if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v39, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ZeroKeywordComputerPlaceZKW", ", buf, 2u);
    }
    v67 = v39;

    info = 0;
    mach_timebase_info(&info);
    v64 = mach_absolute_time();
    v41 = (void *)MEMORY[0x1CAA4EB2C]();
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_180;
    v80[3] = &unk_1E8434F30;
    v66 = v30;
    v81 = v66;
    v82 = &v96;
    v83 = &v100;
    v84 = 0x3F847AE147AE147BLL;
    -[PGZeroKeywordComputer placeZeroKeywordsWithGraph:options:progressBlock:](self, "placeZeroKeywordsWithGraph:options:progressBlock:", v10, v12, v80);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v42, &unk_1E84E4CD0);

    v43 = *((unsigned __int8 *)v101 + 24);
    if (*((_BYTE *)v101 + 24) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v105 = 126;
      *(_WORD *)&v105[4] = 2080;
      *(_QWORD *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Search/PGZeroKeywordComputer.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }

    objc_autoreleasePoolPop(v41);
    if (v43)
      goto LABEL_69;
    v44 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v47 = v67;
    v48 = v47;
    if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v48, OS_SIGNPOST_INTERVAL_END, spid, "ZeroKeywordComputerPlaceZKW", ", buf, 2u);
    }

    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v105 = "ZeroKeywordComputerPlaceZKW";
      *(_WORD *)&v105[8] = 2048;
      *(double *)&v105[10] = (float)((float)((float)((float)(v44 - v64) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    if (v14
      && (v49 = CFAbsoluteTimeGetCurrent(), v49 - v97[3] >= 0.01)
      && (v97[3] = v49,
          v79 = 0,
          (*((void (**)(id, char *, double))v66 + 2))(v66, &v79, 0.6),
          v50 = *((_BYTE *)v101 + 24) | v79,
          (*((_BYTE *)v101 + 24) = v50) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v105 = 131;
        *(_WORD *)&v105[4] = 2080;
        *(_QWORD *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Search/PGZeroKeywordComputer.m";
        v51 = MEMORY[0x1E0C81028];
LABEL_68:
        _os_log_impl(&dword_1CA237000, v51, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      v52 = (void *)MEMORY[0x1CAA4EB2C]();
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_183;
      v74[3] = &unk_1E8434F30;
      v53 = v66;
      v75 = v53;
      v76 = &v96;
      v77 = &v100;
      v78 = 0x3F847AE147AE147BLL;
      -[PGZeroKeywordComputer eventZeroKeywordsWithGraph:curationContext:options:progressBlock:](self, "eventZeroKeywordsWithGraph:curationContext:options:progressBlock:", v10, v11, v12, v74);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v54, &unk_1E84E4CE8);

      v55 = *((unsigned __int8 *)v101 + 24);
      if (*((_BYTE *)v101 + 24) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v105 = 138;
        *(_WORD *)&v105[4] = 2080;
        *(_QWORD *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Search/PGZeroKeywordComputer.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

      objc_autoreleasePoolPop(v52);
      if (v55)
        goto LABEL_69;
      if (v14
        && (v56 = CFAbsoluteTimeGetCurrent(), v56 - v97[3] >= 0.01)
        && (v97[3] = v56,
            v79 = 0,
            (*((void (**)(id, char *, double))v53 + 2))(v53, &v79, 0.8),
            v57 = *((_BYTE *)v101 + 24) | v79,
            (*((_BYTE *)v101 + 24) = v57) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v105 = 141;
          *(_WORD *)&v105[4] = 2080;
          *(_QWORD *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Search/PGZeroKeywordComputer.m";
          v51 = MEMORY[0x1E0C81028];
          goto LABEL_68;
        }
      }
      else
      {
        v58 = (void *)MEMORY[0x1CAA4EB2C]();
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_185;
        v69[3] = &unk_1E8434F30;
        v59 = v53;
        v70 = v59;
        v71 = &v96;
        v72 = &v100;
        v73 = 0x3F847AE147AE147BLL;
        -[PGZeroKeywordComputer sceneZeroKeywordsWithGraph:options:progressBlock:](self, "sceneZeroKeywordsWithGraph:options:progressBlock:", v10, v12, v69);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v60, &unk_1E84E4D00);

        v61 = *((unsigned __int8 *)v101 + 24);
        if (*((_BYTE *)v101 + 24) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v105 = 148;
          *(_WORD *)&v105[4] = 2080;
          *(_QWORD *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Search/PGZeroKeywordComputer.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        objc_autoreleasePoolPop(v58);
        if (!v61)
        {
          if (!v14
            || (v62 = CFAbsoluteTimeGetCurrent(), v62 - v97[3] < 0.01)
            || (v97[3] = v62,
                v79 = 0,
                (*((void (**)(id, char *, double))v59 + 2))(v59, &v79, 1.0),
                v63 = *((_BYTE *)v101 + 24) | v79,
                (*((_BYTE *)v101 + 24) = v63) == 0))
          {
            v17 = v21;
            goto LABEL_70;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v105 = 151;
            *(_WORD *)&v105[4] = 2080;
            *(_QWORD *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Search/PGZeroKeywordComputer.m";
            v51 = MEMORY[0x1E0C81028];
            goto LABEL_68;
          }
        }
      }
    }
LABEL_69:
    v17 = (id)MEMORY[0x1E0C9AA70];
LABEL_70:

    goto LABEL_31;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v105 = 89;
    *(_WORD *)&v105[4] = 2080;
    *(_QWORD *)&v105[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Search/PGZeroKeywordComputer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v17 = (id)MEMORY[0x1E0C9AA70];
LABEL_32:
  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v100, 8);

  return v17;
}

- (id)peopleZeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6
{
  id v9;
  double Current;
  char v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  double v34;
  uint64_t i;
  void *v36;
  double v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  char v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  unint64_t v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  double v64;
  uint64_t k;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t m;
  void *v74;
  double v75;
  char v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  char v88;
  double v89;
  char v90;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  id obj;
  id v102;
  void *v103;
  id v104;
  void *v106;
  void (**v107)(void *, _BYTE *, double);
  id v108;
  void (**v109)(void *, _BYTE *, double);
  void *v110;
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
  _QWORD v123[4];
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[4];
  id v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t v137;
  char v138;
  uint64_t v139;
  double *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  char v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _QWORD v151[4];
  uint8_t v152[128];
  uint8_t buf[4];
  int v154;
  __int16 v155;
  const char *v156;
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v102 = a3;
  v108 = a4;
  v9 = a5;
  v98 = a6;
  v143 = 0;
  v144 = &v143;
  v145 = 0x2020000000;
  v146 = 0;
  v139 = 0;
  v140 = (double *)&v139;
  v141 = 0x2020000000;
  v142 = 0;
  v109 = (void (**)(void *, _BYTE *, double))_Block_copy(v98);
  v97 = v9;
  if (v109)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v140[3] >= 0.01)
    {
      v140[3] = Current;
      v138 = 0;
      v109[2](v109, &v138, 0.0);
      v11 = *((_BYTE *)v144 + 24) | v138;
      *((_BYTE *)v144 + 24) = v11;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v154 = 159;
          v155 = 2080;
          v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Searc"
                 "h/PGZeroKeywordComputer.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v12 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_108;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = MEMORY[0x1E0C809B0];
  v133[1] = 3221225472;
  v133[2] = __91__PGZeroKeywordComputer_peopleZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke;
  v133[3] = &unk_1E8434F30;
  v107 = v109;
  v134 = v107;
  v135 = &v139;
  v137 = 0x3F847AE147AE147BLL;
  v136 = &v143;
  -[PGZeroKeywordComputer contextualPersonZeroKeywordsWithGraph:options:progressBlock:](self, "contextualPersonZeroKeywordsWithGraph:options:progressBlock:", v102, v9, v133);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v144 + 24))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
LABEL_11:
      v12 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_107;
    }
    *(_DWORD *)buf = 67109378;
    v154 = 169;
    v155 = 2080;
    v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/PGZe"
           "roKeywordComputer.m";
    v14 = MEMORY[0x1E0C81028];
LABEL_10:
    _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_11;
  }
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v15 = v96;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v129, v152, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v130;
    v18 = *MEMORY[0x1E0D72AA0];
LABEL_14:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v130 != v17)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v19);
      objc_msgSend(v110, "addObject:", v20);
      objc_msgSend(v20, "objectForKeyedSubscript:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v21);

      if ((unint64_t)objc_msgSend(v110, "count") > 2)
        break;
      if (v16 == ++v19)
      {
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v129, v152, 16);
        if (v16)
          goto LABEL_14;
        break;
      }
    }
  }

  if (v109)
  {
    v22 = CFAbsoluteTimeGetCurrent();
    if (v22 - v140[3] >= 0.01)
    {
      v140[3] = v22;
      v138 = 0;
      v107[2](v107, &v138, 0.4);
      v23 = *((_BYTE *)v144 + 24) | v138;
      *((_BYTE *)v144 + 24) = v23;
      if (v23)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_11;
        *(_DWORD *)buf = 67109378;
        v154 = 180;
        v155 = 2080;
        v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        v14 = MEMORY[0x1E0C81028];
        goto LABEL_10;
      }
    }
  }
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setPersonContext:", 1);
  objc_msgSend(v95, "setIncludedDetectionTypes:", &unk_1E84EA4F8);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("type"), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = v24;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("manualOrder"), 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v151[1] = v25;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("detectionType"), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v151[2] = v26;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v151[3] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setSortDescriptors:", v28);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v95);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = v29;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
  if (!v31)
    goto LABEL_45;
  v32 = 0.3 / (double)v30;
  v33 = *(_QWORD *)v126;
  v34 = 0.4;
  while (2)
  {
    for (i = 0; i != v31; ++i)
    {
      if (*(_QWORD *)v126 != v33)
        objc_enumerationMutation(obj);
      v36 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
      if (v109)
      {
        v37 = CFAbsoluteTimeGetCurrent();
        if (v37 - v140[3] >= 0.01)
        {
          v140[3] = v37;
          v138 = 0;
          v107[2](v107, &v138, v34);
          v38 = *((_BYTE *)v144 + 24) | v138;
          *((_BYTE *)v144 + 24) = v38;
          if (v38)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v154 = 197;
              v155 = 2080;
              v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/S"
                     "earch/PGZeroKeywordComputer.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_105;
          }
        }
      }
      if ((unint64_t)objc_msgSend(v110, "count") > 0xE)
        goto LABEL_45;
      objc_msgSend(v36, "localIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "containsObject:", v39) & 1) == 0)
      {
        objc_msgSend(v13, "addObject:", v39);
        objc_msgSend(v108, "userFeedbackCalculator");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "uuid");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v40, "userFeedbackTypeForPersonUUID:", v41);

        if ((v42 & 0xFFFFFFFFFFFFFFFELL) != 2)
        {
          v43 = objc_msgSend(v36, "detectionType");
          if ((v43 - 3) >= 2)
          {
            if (v43 != 1)
              goto LABEL_43;
            v44 = 1;
          }
          else
          {
            v44 = 6;
          }
          objc_msgSend(v36, "name");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "uuid");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          zeroKeywordWithAttributes(0, v44, v45, 0, v46, v39);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
            objc_msgSend(v110, "addObject:", v47);

        }
      }
LABEL_43:

      v34 = v32 + v34;
    }
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
    if (v31)
      continue;
    break;
  }
LABEL_45:

  if ((unint64_t)objc_msgSend(v110, "count") >= 0x10)
    objc_msgSend(v110, "removeObjectsInRange:", 15, objc_msgSend(v110, "count") - 15);
  if (v109
    && (v48 = CFAbsoluteTimeGetCurrent(), v48 - v140[3] >= 0.01)
    && (v140[3] = v48,
        v138 = 0,
        v107[2](v107, &v138, 0.7),
        v49 = *((_BYTE *)v144 + 24) | v138,
        (*((_BYTE *)v144 + 24) = v49) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v154 = 248;
      v155 = 2080;
      v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/PG"
             "ZeroKeywordComputer.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_105:
    v12 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v102, "bestSocialGroupNodes");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v123[0] = MEMORY[0x1E0C809B0];
    v123[1] = 3221225472;
    v123[2] = __91__PGZeroKeywordComputer_peopleZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_201;
    v123[3] = &unk_1E8432D90;
    v51 = v102;
    v124 = v51;
    objc_msgSend(v50, "indexesOfObjectsPassingTest:", v123);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectsAtIndexes:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v50;

    objc_msgSend(v51, "fetchMemberNodesBySocialGroupNodeForSocialGroupNodes:", v53);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "memberLocalIdentifiersBySocialGroupUUIDWithMemberNodesBySocialGroupNode:shouldIncludeMeNode:simulateMeNodeNotSet:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPeopleUtilities validateKeyedSocialGroups:withPhotoLibrary:graph:](PGPeopleUtilities, "validateKeyedSocialGroups:withPhotoLibrary:graph:", v54, self->_photoLibrary, v51);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    objc_msgSend(v106, "objectEnumerator");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v119, v149, 16);
    if (v57)
    {
      v58 = *(_QWORD *)v120;
      do
      {
        for (j = 0; j != v57; ++j)
        {
          if (*(_QWORD *)v120 != v58)
            objc_enumerationMutation(v56);
          objc_msgSend(v55, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * j));
        }
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v119, v149, 16);
      }
      while (v57);
    }

    +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForLocalIdentifiers:inGraph:", v55, v51);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "personNodeByLocalIdentifier");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v94, "count");
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v100 = v53;
    v61 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v115, v148, 16);
    if (v61)
    {
      v62 = 0.3 / (double)v60;
      v63 = *(_QWORD *)v116;
      v64 = 0.7;
      while (2)
      {
        for (k = 0; k != v61; ++k)
        {
          if (*(_QWORD *)v116 != v63)
            objc_enumerationMutation(v100);
          v66 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * k);
          objc_msgSend(v66, "UUID");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "objectForKey:", v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = v62 + v64;
          if (v68)
          {
            objc_msgSend(v66, "UUID");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "objectForKeyedSubscript:", v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v70, "count"));
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = 0u;
            v114 = 0u;
            v111 = 0u;
            v112 = 0u;
            v104 = v70;
            v71 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v111, v147, 16);
            if (v71)
            {
              v72 = *(_QWORD *)v112;
              while (2)
              {
                for (m = 0; m != v71; ++m)
                {
                  if (*(_QWORD *)v112 != v72)
                    objc_enumerationMutation(v104);
                  v74 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * m);
                  if (v109)
                  {
                    v75 = CFAbsoluteTimeGetCurrent();
                    if (v75 - v140[3] >= 0.01)
                    {
                      v140[3] = v75;
                      v138 = 0;
                      v107[2](v107, &v138, v64);
                      v76 = *((_BYTE *)v144 + 24) | v138;
                      *((_BYTE *)v144 + 24) = v76;
                      if (v76)
                      {
                        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 67109378;
                          v154 = 281;
                          v155 = 2080;
                          v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Search/PGZeroKeywordComputer.m";
                          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                        }

                        goto LABEL_100;
                      }
                    }
                  }
                  if ((objc_msgSend(v13, "containsObject:", v74) & 1) == 0)
                  {
                    objc_msgSend(v103, "objectForKeyedSubscript:", v74);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", v74);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v108, "userFeedbackCalculator");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    v80 = objc_msgSend(v79, "userFeedbackTypeForPersonUUID:", v78);

                    if ((unint64_t)(v80 - 4) <= 0xFFFFFFFFFFFFFFFDLL)
                    {
                      objc_msgSend(v77, "name");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      zeroKeywordWithAttributes(0, 1, v81, 0, v78, v74);
                      v82 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v99, "addObject:", v82);
                    }

                  }
                }
                v71 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v111, v147, 16);
                if (v71)
                  continue;
                break;
              }
            }

            if (objc_msgSend(v99, "count") && objc_msgSend(v110, "count"))
            {
              v83 = objc_msgSend(v110, "count");
              v84 = objc_msgSend(v99, "count");
              v85 = v84 + objc_msgSend(v110, "count") - 15;
              if (v85 >= 1)
              {
                v86 = v83 - 1;
                do
                {
                  objc_msgSend(v110, "objectAtIndexedSubscript:", v86);
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  v88 = objc_msgSend(v99, "containsObject:", v87);

                  if ((v88 & 1) == 0)
                  {
                    objc_msgSend(v110, "removeObjectAtIndex:", v86);
                    --v85;
                  }
                  --v86;
                }
                while (v85 > 0);
              }
              objc_msgSend(v110, "addObjectsFromArray:", v99);
            }

            goto LABEL_91;
          }
        }
        v61 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v115, v148, 16);
        if (v61)
          continue;
        break;
      }
    }
LABEL_91:

    if (v109
      && (v89 = CFAbsoluteTimeGetCurrent(), v89 - v140[3] >= 0.01)
      && (v140[3] = v89,
          v138 = 0,
          v107[2](v107, &v138, 1.0),
          v90 = *((_BYTE *)v144 + 24) | v138,
          (*((_BYTE *)v144 + 24) = v90) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v154 = 317;
        v155 = 2080;
        v156 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
LABEL_100:
      v12 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v12 = v110;
    }

  }
LABEL_107:

LABEL_108:
  _Block_object_dispose(&v139, 8);
  _Block_object_dispose(&v143, 8);

  return v12;
}

- (id)socialGroupKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6
{
  id v9;
  double v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  char v22;
  void *v23;
  double v24;
  char v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  double v31;
  double v32;
  void *i;
  void *v34;
  double Current;
  char v36;
  int v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  uint64_t v46;
  double v48;
  char v49;
  void *v50;
  unint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  uint64_t k;
  void *v56;
  double v57;
  char v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  double v76;
  char v77;
  void *v79;
  void *v80;
  void *v82;
  void *v83;
  id obj;
  id obja;
  id v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  uint64_t v93;
  void *v94;
  void *context;
  void *contexta;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
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
  _QWORD v121[4];
  id v122;
  uint64_t *v123;
  uint64_t *v124;
  uint64_t v125;
  char v126;
  uint64_t v127;
  double *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint8_t v140[128];
  uint8_t buf[4];
  int v142;
  __int16 v143;
  const char *v144;
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v88 = a3;
  v89 = a4;
  v87 = a5;
  v9 = a6;
  v131 = 0;
  v132 = &v131;
  v133 = 0x2020000000;
  v134 = 0;
  v127 = 0;
  v128 = (double *)&v127;
  v129 = 0x2020000000;
  v130 = 0;
  v98 = _Block_copy(v9);
  v83 = v9;
  if (!v98
    || (v10 = CFAbsoluteTimeGetCurrent(), v10 - v128[3] < 0.01)
    || (v128[3] = v10,
        v126 = 0,
        (*((void (**)(void *, char *, double))v98 + 2))(v98, &v126, 0.0),
        v11 = *((_BYTE *)v132 + 24) | v126,
        (*((_BYTE *)v132 + 24) = v11) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = MEMORY[0x1E0C809B0];
    v121[1] = 3221225472;
    v121[2] = __92__PGZeroKeywordComputer_socialGroupKeywordsWithGraph_curationContext_options_progressBlock___block_invoke;
    v121[3] = &unk_1E8434F30;
    v86 = v98;
    v122 = v86;
    v123 = &v127;
    v125 = 0x3F847AE147AE147BLL;
    v124 = &v131;
    -[PGZeroKeywordComputer contextualSocialGroupZeroKeywordsWithGraph:options:progressBlock:](self, "contextualSocialGroupZeroKeywordsWithGraph:options:progressBlock:", v88, v87, v121);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v132 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v142 = 335;
        v143 = 2080;
        v144 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        v13 = MEMORY[0x1E0C81028];
LABEL_10:
        _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v14 = v82;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v117, v140, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v118;
        v17 = *MEMORY[0x1E0D72AA0];
LABEL_14:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v118 != v16)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v18);
          objc_msgSend(v99, "addObject:", v19);
          objc_msgSend(v19, "objectForKeyedSubscript:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "addObject:", v20);

          if ((unint64_t)objc_msgSend(v99, "count") > 2)
            break;
          if (v15 == ++v18)
          {
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v117, v140, 16);
            if (v15)
              goto LABEL_14;
            break;
          }
        }
      }

      if (!v98
        || (v21 = CFAbsoluteTimeGetCurrent(), v21 - v128[3] < 0.01)
        || (v128[3] = v21,
            v126 = 0,
            (*((void (**)(id, char *, double))v86 + 2))(v86, &v126, 0.3),
            v22 = *((_BYTE *)v132 + 24) | v126,
            (*((_BYTE *)v132 + 24) = v22) == 0))
      {
        objc_msgSend(v88, "socialGroupNodesSortedByImportance");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_57391);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v23;
        if (v98
          && (v24 = CFAbsoluteTimeGetCurrent(), v24 - v128[3] >= 0.01)
          && (v128[3] = v24,
              v126 = 0,
              (*((void (**)(id, char *, double))v86 + 2))(v86, &v126, 0.5),
              v25 = *((_BYTE *)v132 + 24) | v126,
              (*((_BYTE *)v132 + 24) = v25) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v142 = 367;
            v143 = 2080;
            v144 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sea"
                   "rch/PGZeroKeywordComputer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v12 = (id)MEMORY[0x1E0C9AA60];
        }
        else
        {
          v100 = (void *)objc_opt_new();
          v90 = (void *)objc_msgSend(v23, "mutableCopy");
          v26 = objc_msgSend(v23, "count");
          v27 = v23;
          v28 = v26;
          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          obj = v27;
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v139, 16);
          if (v29)
          {
            v30 = 0;
            v31 = 0.3 / (double)v28;
            v93 = *(_QWORD *)v114;
            v32 = 0.5;
            while (2)
            {
              v91 = (id)v29;
              for (i = 0; i != v91; i = (char *)i + 1)
              {
                if (*(_QWORD *)v114 != v93)
                  objc_enumerationMutation(obj);
                v34 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)i);
                context = (void *)MEMORY[0x1CAA4EB2C]();
                if (v98
                  && (Current = CFAbsoluteTimeGetCurrent(), Current - v128[3] >= 0.01)
                  && (v128[3] = Current,
                      v126 = 0,
                      (*((void (**)(id, char *, double))v86 + 2))(v86, &v126, v32),
                      v36 = *((_BYTE *)v132 + 24) | v126,
                      (*((_BYTE *)v132 + 24) = v36) != 0))
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    v142 = 378;
                    v143 = 2080;
                    v144 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Search/PGZeroKeywordComputer.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  v37 = 0;
                }
                else
                {
                  objc_msgSend(v34, "personNodes");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = objc_msgSend(v38, "count");
                  if (v39 == 1)
                    ++v30;
                  objc_msgSend(v90, "removeObject:", v34);
                  v111 = 0u;
                  v112 = 0u;
                  v109 = 0u;
                  v110 = 0u;
                  v40 = v90;
                  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v109, v138, 16);
                  if (v41)
                  {
                    v42 = *(_QWORD *)v110;
                    while (2)
                    {
                      for (j = 0; j != v41; ++j)
                      {
                        if (*(_QWORD *)v110 != v42)
                          objc_enumerationMutation(v40);
                        v44 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
                        objc_msgSend(v44, "personNodes");
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        v46 = objc_msgSend(v45, "count");
                        if ((unint64_t)(v39 - v46) >= 2)
                        {

                          goto LABEL_61;
                        }
                        if (v39 == 1 && v46 == 1 && v30 >= 5)
                          objc_msgSend(v100, "addObject:", v44);

                      }
                      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v109, v138, 16);
                      if (v41)
                        continue;
                      break;
                    }
                  }
LABEL_61:

                  v32 = v31 + v32;
                  v37 = 1;
                }
                objc_autoreleasePoolPop(context);
                if (!v37)
                {

                  goto LABEL_71;
                }
              }
              v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v139, 16);
              if (v29)
                continue;
              break;
            }
          }

          if (v98
            && (v48 = CFAbsoluteTimeGetCurrent(), v48 - v128[3] >= 0.01)
            && (v128[3] = v48,
                v126 = 0,
                (*((void (**)(id, char *, double))v86 + 2))(v86, &v126, 0.8),
                v49 = *((_BYTE *)v132 + 24) | v126,
                (*((_BYTE *)v132 + 24) = v49) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v142 = 409;
              v143 = 2080;
              v144 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/S"
                     "earch/PGZeroKeywordComputer.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
LABEL_71:
            v12 = (id)MEMORY[0x1E0C9AA60];
          }
          else
          {
            objc_msgSend(v88, "fetchMemberNodesBySocialGroupNodeForSocialGroupNodes:", v80);
            obja = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "memberLocalIdentifiersBySocialGroupUUIDWithMemberNodesBySocialGroupNode:shouldIncludeMeNode:simulateMeNodeNotSet:");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGPeopleUtilities validateKeyedSocialGroups:withPhotoLibrary:graph:](PGPeopleUtilities, "validateKeyedSocialGroups:withPhotoLibrary:graph:", v50, self->_photoLibrary, v88);
            v94 = (void *)objc_claimAutoreleasedReturnValue();

            v51 = objc_msgSend(v80, "count");
            v107 = 0u;
            v108 = 0u;
            v105 = 0u;
            v106 = 0u;
            v92 = v80;
            v52 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v105, v137, 16);
            if (v52)
            {
              v53 = 0.2 / (double)v51;
              contexta = *(void **)v106;
              v54 = 0.8;
              while (2)
              {
                for (k = 0; k != v52; ++k)
                {
                  if (*(void **)v106 != contexta)
                    objc_enumerationMutation(v92);
                  v56 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * k);
                  if (v98)
                  {
                    v57 = CFAbsoluteTimeGetCurrent();
                    if (v57 - v128[3] >= 0.01)
                    {
                      v128[3] = v57;
                      v126 = 0;
                      (*((void (**)(id, char *, double))v86 + 2))(v86, &v126, v54);
                      v58 = *((_BYTE *)v132 + 24) | v126;
                      *((_BYTE *)v132 + 24) = v58;
                      if (v58)
                      {
                        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 67109378;
                          v142 = 419;
                          v143 = 2080;
                          v144 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Search/PGZeroKeywordComputer.m";
                          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                        }

                        goto LABEL_117;
                      }
                    }
                  }
                  if ((unint64_t)objc_msgSend(v99, "count") > 0xE)
                    goto LABEL_106;
                  if ((objc_msgSend(v100, "containsObject:", v56) & 1) == 0)
                  {
                    objc_msgSend(v56, "UUID");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v94, "objectForKey:", v59);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v60)
                    {
                      objc_msgSend(v56, "UUID");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v94, "objectForKeyedSubscript:", v61);
                      v62 = (void *)objc_claimAutoreleasedReturnValue();

                      if ((unint64_t)objc_msgSend(v62, "count") >= 2
                        && (objc_msgSend(v97, "containsObject:", v62) & 1) == 0)
                      {
                        v103 = 0u;
                        v104 = 0u;
                        v101 = 0u;
                        v102 = 0u;
                        v63 = v62;
                        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v101, v136, 16);
                        if (v64)
                        {
                          v65 = *(_QWORD *)v102;
                          while (2)
                          {
                            for (m = 0; m != v64; ++m)
                            {
                              if (*(_QWORD *)v102 != v65)
                                objc_enumerationMutation(v63);
                              objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * m));
                              v67 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v89, "userFeedbackCalculator");
                              v68 = (void *)objc_claimAutoreleasedReturnValue();
                              v69 = objc_msgSend(v68, "userFeedbackTypeForPersonUUID:", v67);

                              if (v69 == 2)
                              {
                                if ((unint64_t)objc_msgSend(v63, "count") < 3)
                                {
LABEL_101:
                                  v71 = v63;
                                  goto LABEL_102;
                                }
                              }
                              else if (v69 == 3)
                              {
                                goto LABEL_101;
                              }

                            }
                            v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v101, v136, 16);
                            if (v64)
                              continue;
                            break;
                          }
                        }

                        objc_msgSend(v97, "addObject:", v63);
                        personUUIDsFromPersonLocalIdentifiers(v63);
                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                        PLSearchSocialGroupLookupIdentifier();
                        v71 = (void *)objc_claimAutoreleasedReturnValue();

                        v72 = _os_feature_enabled_impl();
                        v67 = (void *)MEMORY[0x1E0C9AA60];
                        if (v72)
                        {
                          -[PGZeroKeywordComputer socialGroupKeyAssetLocalIdentifierWithPersonLocalIdentifiers:](self, "socialGroupKeyAssetLocalIdentifierWithPersonLocalIdentifiers:", v63);
                          v73 = objc_claimAutoreleasedReturnValue();
                          v74 = (void *)v73;
                          if (v73)
                          {
                            v135 = v73;
                            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v135, 1);
                            v67 = (void *)objc_claimAutoreleasedReturnValue();
                          }

                        }
                        zeroKeywordForSocialGroupWithIdentifier(v71, v63, v67);
                        v75 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v99, "addObject:", v75);

LABEL_102:
                      }

                    }
                  }
                  v54 = v53 + v54;
                }
                v52 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v105, v137, 16);
                if (v52)
                  continue;
                break;
              }
            }
LABEL_106:

            if ((unint64_t)objc_msgSend(v99, "count") >= 0x10)
              objc_msgSend(v99, "removeObjectsInRange:", 15, objc_msgSend(v99, "count") - 15);
            if (v98
              && (v76 = CFAbsoluteTimeGetCurrent(), v76 - v128[3] >= 0.01)
              && (v128[3] = v76,
                  v126 = 0,
                  (*((void (**)(id, char *, double))v86 + 2))(v86, &v126, 1.0),
                  v77 = *((_BYTE *)v132 + 24) | v126,
                  (*((_BYTE *)v132 + 24) = v77) != 0))
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v142 = 475;
                v143 = 2080;
                v144 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework"
                       "/Search/PGZeroKeywordComputer.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
LABEL_117:
              v12 = (id)MEMORY[0x1E0C9AA60];
            }
            else
            {
              v12 = v99;
            }

          }
        }

        goto LABEL_121;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v142 = 346;
        v143 = 2080;
        v144 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        v13 = MEMORY[0x1E0C81028];
        goto LABEL_10;
      }
    }
    v12 = (id)MEMORY[0x1E0C9AA60];
LABEL_121:

    goto LABEL_122;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v142 = 325;
    v143 = 2080;
    v144 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/PGZe"
           "roKeywordComputer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v12 = (id)MEMORY[0x1E0C9AA60];
LABEL_122:
  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v131, 8);

  return v12;
}

- (id)socialGroupKeyAssetLocalIdentifierWithPersonLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PGKeyAssetCurationOptions *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("type"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("manualOrder"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v9);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v10, "fetchedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSortDescriptors:", v17);

  objc_msgSend(v14, "setFetchLimit:", 100);
  v18 = 0;
  do
  {
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsContainingAllPersons:options:", v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "count"))
      break;
    objc_msgSend(v13, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v20);

  }
  while (objc_msgSend(v13, "count"));
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:subtitle:titleFontName:", v18, &stru_1E8436F28, &stru_1E8436F28, &stru_1E8436F28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(PGKeyAssetCurationOptions);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGKeyAssetCurationOptions setReferencePersonLocalIdentifiers:](v22, "setReferencePersonLocalIdentifiers:", v23);

  -[PGKeyAssetCurationOptions setFocusOnPeople:](v22, "setFocusOnPeople:", 1);
  -[PGKeyAssetCurationOptions setComplete:](v22, "setComplete:", 1);
  -[PGCurationManager curatedKeyAssetForAssetCollection:curatedAssetCollection:options:criteria:curationContext:](self->_curationManager, "curatedKeyAssetForAssetCollection:curatedAssetCollection:options:criteria:curationContext:", v21, 0, v22, 0, self->_curationContext);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)placeZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(void *, _BYTE *, double);
  void *v11;
  PGPlaceZeroKeywordGenerator *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  uint8_t v26[128];
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(void *, _BYTE *, double))_Block_copy(a5);
  if (v10 && CFAbsoluteTimeGetCurrent() >= 0.01 && (v25 = 0, v10[2](v10, &v25, 0.0), v25))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v28 = 521;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/PGZ"
            "eroKeywordComputer.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v12 = -[PGPlaceZeroKeywordGenerator initWithGraph:photoLibrary:searchComputationCache:options:]([PGPlaceZeroKeywordGenerator alloc], "initWithGraph:photoLibrary:searchComputationCache:options:", v8, self->_photoLibrary, self->_searchComputationCache, v9);
    -[PGPlaceZeroKeywordGenerator generatePlaceZeroKeywords](v12, "generatePlaceZeroKeywords");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "getZeroKeywordDict", (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v16);
    }

  }
  return v11;
}

- (id)eventZeroKeywordsWithGraph:(id)a3 curationContext:(id)a4 options:(id)a5 progressBlock:(id)a6
{
  double v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double Current;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t i;
  void *v31;
  double v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  double v46;
  char v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  NSObject *v54;
  double v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  char v63;
  void *v65;
  id v66;
  id obj;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  unint64_t v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  _QWORD v83[5];
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  uint8_t *v90;
  uint64_t *v91;
  uint64_t *v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  char v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[4];
  id v104;
  uint64_t *v105;
  uint64_t *v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[4];
  id v113;
  uint64_t *v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  double *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  char v124;
  _BYTE v125[128];
  void *v126;
  uint8_t v127[4];
  int v128;
  __int16 v129;
  const char *v130;
  uint8_t v131[128];
  uint8_t buf[8];
  __int128 v133;
  uint64_t v134;
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v80 = a3;
  v74 = a4;
  v79 = a5;
  v73 = a6;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v124 = 0;
  v117 = 0;
  v118 = (double *)&v117;
  v119 = 0x2020000000;
  v120 = 0;
  v82 = _Block_copy(v73);
  if (!v82
    || (v9 = CFAbsoluteTimeGetCurrent(), v9 - v118[3] < 0.01)
    || (v118[3] = v9,
        v127[0] = 0,
        (*((void (**)(void *, uint8_t *, double))v82 + 2))(v82, v127, 0.0),
        v10 = *((_BYTE *)v122 + 24) | v127[0],
        (*((_BYTE *)v122 + 24) = v10) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_class();
    v112[0] = MEMORY[0x1E0C809B0];
    v112[1] = 3221225472;
    v112[2] = __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke;
    v112[3] = &unk_1E8434F30;
    v14 = v82;
    v113 = v14;
    v114 = &v117;
    v116 = 0x3F847AE147AE147BLL;
    v115 = &v121;
    objc_msgSend(v13, "contextualHolidayZeroKeywordsWithGraph:options:progressBlock:", v80, v79, v112);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v12;
    if (*((_BYTE *)v122 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_11:
        v11 = (id)MEMORY[0x1E0C9AA60];
LABEL_89:

        goto LABEL_90;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 550;
      LOWORD(v133) = 2080;
      *(_QWORD *)((char *)&v133 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Search/PGZeroKeywordComputer.m";
      v15 = MEMORY[0x1E0C81028];
LABEL_10:
      _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_11;
    }
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v16 = v72;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v108, v135, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v109;
LABEL_14:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v109 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * v19));
        if ((unint64_t)objc_msgSend(v12, "count") > 2)
          break;
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v108, v135, 16);
          if (v17)
            goto LABEL_14;
          break;
        }
      }
    }

    if (v82)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v118[3] >= 0.01)
      {
        v118[3] = Current;
        v127[0] = 0;
        (*((void (**)(id, uint8_t *, double))v14 + 2))(v14, v127, 0.3);
        v21 = *((_BYTE *)v122 + 24) | v127[0];
        *((_BYTE *)v122 + 24) = v21;
        if (v21)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_11;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 559;
          LOWORD(v133) = 2080;
          *(_QWORD *)((char *)&v133 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Search/PGZeroKeywordComputer.m";
          v15 = MEMORY[0x1E0C81028];
          goto LABEL_10;
        }
      }
    }
    -[PGZeroKeywordComputer contextualDateZeroKeywordsWithGraph:options:](self, "contextualDateZeroKeywordsWithGraph:options:", v80, v79);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v22);

    -[PGZeroKeywordComputer contextualSeasonZeroKeywordsWithGraph:curationContext:options:](self, "contextualSeasonZeroKeywordsWithGraph:curationContext:options:", v80, v74, v79);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v23);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = MEMORY[0x1E0C809B0];
    v103[1] = 3221225472;
    v103[2] = __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_216;
    v103[3] = &unk_1E8434F30;
    v66 = v14;
    v104 = v66;
    v105 = &v117;
    v106 = &v121;
    v107 = 0x3F847AE147AE147BLL;
    -[PGZeroKeywordComputer contextualMeaningAndTripZeroKeywordsWithGraph:curationContext:options:progressBlock:](self, "contextualMeaningAndTripZeroKeywordsWithGraph:curationContext:options:progressBlock:", v80, v74, v79, v103);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v25;
    if (*((_BYTE *)v122 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 577;
        LOWORD(v133) = 2080;
        *(_QWORD *)((char *)&v133 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Search/PGZeroKeywordComputer.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_88;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v133 = buf;
    *((_QWORD *)&v133 + 1) = 0x2020000000;
    v134 = 0x3FE0000000000000;
    v26 = v25;
    v27 = objc_msgSend(v25, "count");
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    obj = v26;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v131, 16);
    if (v28)
    {
      v76 = 0;
      v29 = 0.1 / (double)v27;
      v71 = *(_QWORD *)v100;
      v69 = *MEMORY[0x1E0D72AF8];
      v68 = *MEMORY[0x1E0D72AA0];
      while (2)
      {
        v70 = v28;
        for (i = 0; i != v70; ++i)
        {
          if (*(_QWORD *)v100 != v71)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
          if (v82)
          {
            v32 = CFAbsoluteTimeGetCurrent();
            if (v32 - v118[3] >= 0.01)
            {
              v118[3] = v32;
              v98 = 0;
              (*((void (**)(id, char *, double))v66 + 2))(v66, &v98, *(double *)(v133 + 24));
              v33 = *((_BYTE *)v122 + 24) | v98;
              *((_BYTE *)v122 + 24) = v33;
              if (v33)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v127 = 67109378;
                  v128 = 583;
                  v129 = 2080;
                  v130 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Search/PGZeroKeywordComputer.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v127, 0x12u);
                }

                goto LABEL_71;
              }
            }
          }
          *(double *)(v133 + 24) = v29 + *(double *)(v133 + 24);
          objc_msgSend(v81, "addObject:", v31);
          objc_msgSend(v31, "objectForKeyedSubscript:", v69);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "addObject:", v34);

          objc_msgSend(v31, "objectForKeyedSubscript:", v68);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v35, "count"))
          {
            objc_msgSend(v35, "firstObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)MEMORY[0x1E0CD1390];
            v126 = v36;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v126, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "fetchAssetsWithLocalIdentifiers:options:", v38, v78);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v39, "count"))
            {
              objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAssets:withType:options:", v39, 3, v78);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = 0u;
              v97 = 0u;
              v95 = 0u;
              v94 = 0u;
              v41 = v40;
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v94, v125, 16);
              if (v42)
              {
                v43 = *(_QWORD *)v95;
                do
                {
                  for (j = 0; j != v42; ++j)
                  {
                    if (*(_QWORD *)v95 != v43)
                      objc_enumerationMutation(v41);
                    objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * j), "uuid");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "addObject:", v45);

                  }
                  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v94, v125, 16);
                }
                while (v42);
              }

            }
            if (v76 >= 2)
            {

              goto LABEL_53;
            }
            ++v76;
          }

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v131, 16);
        if (v28)
          continue;
        break;
      }
    }
LABEL_53:

    if (v82)
    {
      v46 = CFAbsoluteTimeGetCurrent();
      if (v46 - v118[3] >= 0.01)
      {
        v118[3] = v46;
        v98 = 0;
        (*((void (**)(id, char *, double))v66 + 2))(v66, &v98, 0.6);
        v47 = *((_BYTE *)v122 + 24) | v98;
        *((_BYTE *)v122 + 24) = v47;
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v127 = 67109378;
            v128 = 609;
            v129 = 2080;
            v130 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sea"
                   "rch/PGZeroKeywordComputer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v127, 0x12u);
          }
LABEL_71:
          v11 = (id)MEMORY[0x1E0C9AA60];
          goto LABEL_87;
        }
      }
    }
    objc_msgSend(v80, "zeroKeywordMappingByMeaningLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v133 + 24) = 0x3FE3333333333333;
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_217;
    v83[3] = &unk_1E8432E20;
    v90 = buf;
    v50 = v66;
    v93 = 0x3F847AE147AE147BLL;
    v91 = &v117;
    v92 = &v121;
    v89 = v50;
    v83[4] = self;
    v84 = v24;
    v51 = v74;
    v85 = v51;
    v86 = v78;
    v52 = v77;
    v87 = v52;
    v53 = v49;
    v88 = v53;
    objc_msgSend(v48, "enumerateKeysAndObjectsUsingBlock:", v83);
    if (*((_BYTE *)v122 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v127 = 67109378;
        v128 = 661;
        v129 = 2080;
        v130 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        v54 = MEMORY[0x1E0C81028];
LABEL_61:
        _os_log_impl(&dword_1CA237000, v54, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v127, 0x12u);
      }
    }
    else
    {
      if (!v82
        || (v55 = CFAbsoluteTimeGetCurrent(), v55 - v118[3] < 0.01)
        || (v118[3] = v55,
            v98 = 0,
            (*((void (**)(id, char *, double))v50 + 2))(v50, &v98, 0.9),
            v56 = *((_BYTE *)v122 + 24) | v98,
            (*((_BYTE *)v122 + 24) = v56) == 0))
      {
        -[PGZeroKeywordComputer tripRankedKeywordWithGraph:curationContext:](self, "tripRankedKeywordWithGraph:curationContext:", v80, v51);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v57;
        if (v57)
        {
          objc_msgSend(v57, "zeroKeyword");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AF8]);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v52, "containsObject:", v60) & 1) == 0)
            objc_msgSend(v53, "addObject:", v58);

        }
        filteredKeywords(v53, 7uLL, 0xFuLL, 0.35);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "addObjectsFromArray:", v61);

        if ((unint64_t)objc_msgSend(v81, "count") >= 0x10)
          objc_msgSend(v81, "removeObjectsInRange:", 15, objc_msgSend(v81, "count") - 15);
        if (v82
          && (v62 = CFAbsoluteTimeGetCurrent(), v62 - v118[3] >= 0.01)
          && (v118[3] = v62,
              v98 = 0,
              (*((void (**)(id, char *, double))v50 + 2))(v50, &v98, 1.0),
              v63 = *((_BYTE *)v122 + 24) | v98,
              (*((_BYTE *)v122 + 24) = v63) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v127 = 67109378;
            v128 = 684;
            v129 = 2080;
            v130 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sea"
                   "rch/PGZeroKeywordComputer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v127, 0x12u);
          }
          v11 = (id)MEMORY[0x1E0C9AA60];
        }
        else
        {
          v11 = v81;
        }

        goto LABEL_86;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v127 = 67109378;
        v128 = 663;
        v129 = 2080;
        v130 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        v54 = MEMORY[0x1E0C81028];
        goto LABEL_61;
      }
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
LABEL_86:

LABEL_87:
    _Block_object_dispose(buf, 8);
LABEL_88:

    goto LABEL_89;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 536;
    LOWORD(v133) = 2080;
    *(_QWORD *)((char *)&v133 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Search/PGZeroKeywordComputer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v11 = (id)MEMORY[0x1E0C9AA60];
LABEL_90:
  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v121, 8);

  return v11;
}

- (id)sceneZeroKeywordsWithGraph:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  void *v7;
  double v8;
  char v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double Current;
  char v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  double v28;
  char v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  double v39;
  char v40;
  void *v41;
  void *v42;
  double v43;
  char v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  _QWORD v57[4];
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  char v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  PGZeroKeywordComputer *v73;
  id v74;
  uint64_t *v75;
  uint8_t *v76;
  uint64_t *v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  id v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  double *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  char v95;
  uint8_t v96[128];
  uint8_t v97[4];
  int v98;
  __int16 v99;
  const char *v100;
  uint8_t buf[8];
  __int128 v102;
  uint64_t v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v50 = a4;
  v48 = a5;
  v7 = _Block_copy(v48);
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v95 = 0;
  v88 = 0;
  v89 = (double *)&v88;
  v90 = 0x2020000000;
  v91 = 0;
  if (!v7
    || (v8 = CFAbsoluteTimeGetCurrent(), v8 - v89[3] < 0.01)
    || (v89[3] = v8,
        v97[0] = 0,
        (*((void (**)(void *, uint8_t *, double))v7 + 2))(v7, v97, 0.0),
        v9 = *((_BYTE *)v93 + 24) | v97[0],
        (*((_BYTE *)v93 + 24) = v9) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke;
    v83[3] = &unk_1E8434F30;
    v49 = v7;
    v11 = v7;
    v84 = v11;
    v85 = &v88;
    v86 = &v92;
    v87 = 0x3F847AE147AE147BLL;
    -[PGZeroKeywordComputer contextualSceneZeroKeywordsWithGraph:options:progressBlock:](self, "contextualSceneZeroKeywordsWithGraph:options:progressBlock:", v51, v50, v83);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v93 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_11:
        v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_31:

        v7 = v49;
        goto LABEL_32;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 701;
      LOWORD(v102) = 2080;
      *(_QWORD *)((char *)&v102 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Search/PGZeroKeywordComputer.m";
      v12 = MEMORY[0x1E0C81028];
LABEL_10:
      _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_11;
    }
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v13 = v47;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v104, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v80;
      v16 = *MEMORY[0x1E0D72AA0];
LABEL_14:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v80 != v15)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v17);
        objc_msgSend(v52, "addObject:", v18);
        objc_msgSend(v18, "objectForKeyedSubscript:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addObject:", v19);

        if ((unint64_t)objc_msgSend(v18, "count") > 2)
          break;
        if (v14 == ++v17)
        {
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v104, 16);
          if (v14)
            goto LABEL_14;
          break;
        }
      }
    }

    if (v49)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v89[3] >= 0.01)
      {
        v89[3] = Current;
        v97[0] = 0;
        (*((void (**)(id, uint8_t *, double))v11 + 2))(v11, v97, 0.1);
        v21 = *((_BYTE *)v93 + 24) | v97[0];
        *((_BYTE *)v93 + 24) = v21;
        if (v21)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_11;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 712;
          LOWORD(v102) = 2080;
          *(_QWORD *)((char *)&v102 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Search/PGZeroKeywordComputer.m";
          v12 = MEMORY[0x1E0C81028];
          goto LABEL_10;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v102 = buf;
    *((_QWORD *)&v102 + 1) = 0x2020000000;
    v103 = 0x3FB999999999999ALL;
    +[PGGraphNodeCollection nodesInGraph:](PGGraphSceneNodeCollection, "nodesInGraph:", v51);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke_222;
    v68[3] = &unk_1E8432E70;
    v45 = v11;
    v74 = v45;
    v75 = &v88;
    v78 = 0x3F847AE147AE147BLL;
    v76 = buf;
    v77 = &v92;
    v54 = v24;
    v69 = v54;
    v70 = v53;
    v55 = v22;
    v71 = v55;
    v46 = v23;
    v72 = v46;
    v73 = self;
    objc_msgSend(v25, "enumerateNodesUsingBlock:", v68);

    if (*((_BYTE *)v93 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v97 = 67109378;
        v98 = 768;
        v99 = 2080;
        v100 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        v26 = MEMORY[0x1E0C81028];
LABEL_28:
        _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v97, 0x12u);
      }
    }
    else
    {
      if (v49)
      {
        v28 = CFAbsoluteTimeGetCurrent();
        if (v28 - v89[3] >= 0.01)
        {
          v89[3] = v28;
          v67 = 0;
          (*((void (**)(id, char *, double))v45 + 2))(v45, &v67, 0.8);
          v29 = *((_BYTE *)v93 + 24) | v67;
          *((_BYTE *)v93 + 24) = v29;
          if (v29)
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              goto LABEL_29;
            *(_DWORD *)v97 = 67109378;
            v98 = 770;
            v99 = 2080;
            v100 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sea"
                   "rch/PGZeroKeywordComputer.m";
            v26 = MEMORY[0x1E0C81028];
            goto LABEL_28;
          }
        }
      }
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v30 = v46;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v63, v96, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v64 != v32)
              objc_enumerationMutation(v30);
            v34 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
            v35 = (void *)MEMORY[0x1CAA4EB2C]();
            -[CLSSceneTaxonomyHierarchy nodeForIdentifier:](self->_sceneTaxonomy, "nodeForIdentifier:", objc_msgSend(v34, "unsignedLongLongValue"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke_230;
            v57[3] = &unk_1E8432E98;
            v37 = v30;
            v58 = v37;
            v59 = v54;
            v60 = v34;
            v38 = v36;
            v61 = v38;
            v62 = v55;
            objc_msgSend(v38, "visitParentsUsingNameBlock:", v57);

            objc_autoreleasePoolPop(v35);
          }
          v31 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v63, v96, 16);
        }
        while (v31);
      }

      if (v49)
      {
        v39 = CFAbsoluteTimeGetCurrent();
        if (v39 - v89[3] >= 0.01)
        {
          v89[3] = v39;
          v67 = 0;
          (*((void (**)(id, char *, double))v45 + 2))(v45, &v67, 0.9);
          v40 = *((_BYTE *)v93 + 24) | v67;
          *((_BYTE *)v93 + 24) = v40;
          if (v40)
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              goto LABEL_29;
            *(_DWORD *)v97 = 67109378;
            v98 = 797;
            v99 = 2080;
            v100 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sea"
                   "rch/PGZeroKeywordComputer.m";
            v26 = MEMORY[0x1E0C81028];
            goto LABEL_28;
          }
        }
      }
      objc_msgSend(v55, "allObjects");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      filteredKeywords(v41, 0xAuLL, 0xFuLL, 0.9);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "addObjectsFromArray:", v42);

      if ((unint64_t)objc_msgSend(v52, "count") >= 0x10)
        objc_msgSend(v52, "removeObjectsInRange:", 15, objc_msgSend(v52, "count") - 15);
      if (!v49
        || (v43 = CFAbsoluteTimeGetCurrent(), v43 - v89[3] < 0.01)
        || (v89[3] = v43,
            v67 = 0,
            (*((void (**)(id, char *, double))v45 + 2))(v45, &v67, 1.0),
            v44 = *((_BYTE *)v93 + 24) | v67,
            (*((_BYTE *)v93 + 24) = v44) == 0))
      {
        v10 = v52;
        goto LABEL_30;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v97 = 67109378;
        v98 = 808;
        v99 = 2080;
        v100 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/"
               "PGZeroKeywordComputer.m";
        v26 = MEMORY[0x1E0C81028];
        goto LABEL_28;
      }
    }
LABEL_29:
    v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_30:

    _Block_object_dispose(buf, 8);
    goto LABEL_31;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 692;
    LOWORD(v102) = 2080;
    *(_QWORD *)((char *)&v102 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Search/PGZeroKeywordComputer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_32:
  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v92, 8);

  return v10;
}

- (id)tripZeroKeywordWithGraph:(id)a3 curationContext:(id)a4
{
  return -[PGZeroKeywordComputer _tripZeroKeywordWithGraph:curationContext:score:](self, "_tripZeroKeywordWithGraph:curationContext:score:", a3, a4, 0);
}

- (id)tripRankedKeywordWithGraph:(id)a3 curationContext:(id)a4
{
  void *v4;
  PGRankedZeroKeyword *v5;
  PGRankedZeroKeyword *v6;
  double v8;

  v8 = 0.0;
  -[PGZeroKeywordComputer _tripZeroKeywordWithGraph:curationContext:score:](self, "_tripZeroKeywordWithGraph:curationContext:score:", a3, a4, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PGRankedZeroKeyword alloc];
  v6 = -[PGRankedZeroKeyword initWithKeyword:score:](v5, "initWithKeyword:score:", v4, v8);

  return v6;
}

- (id)_tripZeroKeywordWithGraph:(id)a3 curationContext:(id)a4 score:(double *)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "longTripNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(v6, "shortTripNodes");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  if (-[PGZeroKeywordComputer shouldFilterMomentNodesWithPresence](self, "shouldFilterMomentNodesWithPresence"))
  {
    v50 = v6;
    v52 = v7;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v61 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v16, "collection");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "momentNodes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGZeroKeywordComputer momentNodesWhereMeIsPresent](self, "momentNodesWhereMeIsPresent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "intersectsCollection:", v19);

          if (v20)
            objc_msgSend(v10, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v13);
    }

    v6 = v50;
    v7 = v52;
    v8 = v10;
  }
  if (objc_msgSend(v8, "count"))
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v21 = v8;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v22)
    {
      v48 = v8;
      v51 = v6;
      v53 = v7;
      v23 = 0;
      v24 = 0;
      v25 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v57 != v25)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          objc_msgSend(v27, "localStartDate", v48);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23 || objc_msgSend(MEMORY[0x1E0D4B130], "compareDate:toDate:toUnitGranularity:", v28, v23, 16) == 1)
          {
            v29 = v28;

            v30 = v27;
            v23 = v29;
            v24 = v30;
          }

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v22);

      if (!v24)
      {
        v46 = 0;
        v6 = v51;
        v7 = v53;
        v8 = v48;
        goto LABEL_36;
      }
      objc_msgSend(v24, "eventEnrichmentMomentNodes");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "uuids");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGZeroKeywordComputer searchComputationCache](self, "searchComputationCache");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "allObjects");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "keyAssetLocalIdentifierForNodeIdentifier:withAssociatedMomentUUIDs:", v34, v35);
      v22 = objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        objc_msgSend(v31, "temporaryArray");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0;
        bestAssetIdentifierForMomentNodes(v36, &v55, v53);
        v22 = objc_claimAutoreleasedReturnValue();
        v37 = v55;

        -[PGZeroKeywordComputer searchComputationCache](self, "searchComputationCache");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "UUID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setKeyAssetLocalIdentifier:forNodeIdentifier:withAssociatedMomentUUID:", v22, v39, v37);

      }
      if (!v22)
      {
        v46 = 0;
        v6 = v51;
        v7 = v53;
        v8 = v48;
        goto LABEL_37;
      }
      v6 = v51;
      v8 = v48;
      if (a5)
      {
        objc_msgSend(v51, "allTripNodes");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "count");

        *a5 = (double)v41;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("PGMeaningTripZeroKeywordText"), CFSTR("PGMeaningTripZeroKeywordText"), CFSTR("Localizable"));
      v21 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("PGHighlightTripSearchableText"), CFSTR("PGHighlightTripSearchableText"), CFSTR("Localizable"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      zeroKeywordWithAttributes(5, 13, v21, v44, 0, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v53;
    }
    else
    {
      v46 = 0;
    }

    v23 = (void *)v22;
LABEL_36:

    goto LABEL_37;
  }
  v46 = 0;
LABEL_37:

  return v46;
}

- (id)meaningNodeZeroKeywordForDisplayMeaningNode:(id)a3 collectionUUIDsToAvoid:(id)a4 curationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PGCurationManager *curationManager;
  PHPhotoLibrary *photoLibrary;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "graph");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "zeroKeywordMappingByMeaningLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mappedMeaningNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {
    v34 = v13;
    v27 = v10;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "loggingConnection");
    v29 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "label");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v31;
      _os_log_error_impl(&dword_1CA237000, v29, OS_LOG_TYPE_ERROR, "Cannot find root applicable meaning nodes for display meaning %@", buf, 0xCu);

    }
    v26 = 0;
    v10 = v27;
    goto LABEL_11;
  }
  if (isSuitableForZeroKeywordWithMeanings(v15))
  {
    v34 = v13;
    photoLibrary = self->_photoLibrary;
    curationManager = self->_curationManager;
    -[PGZeroKeywordComputer searchComputationCache](self, "searchComputationCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v9;
    v20 = v18;
    v32 = v10;
    v33 = v19;
    bestAssetIdentifiersForMeaningNodes(v15, v19, photoLibrary, curationManager, v18, v12, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    zeroKeywordLocalizationKeyForMeaningLabel(v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", v22, v22, CFSTR("Localizable"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "localizedName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      zeroKeywordWithAttributes(5, 13, v24, v25, 0, v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }

    v10 = v32;
    v9 = v33;
LABEL_11:
    v13 = v34;
    goto LABEL_12;
  }
  v26 = 0;
LABEL_12:

  return v26;
}

- (PGSearchComputationCache)searchComputationCache
{
  return self->_searchComputationCache;
}

- (PGGraphMomentNodeCollection)momentNodesWhereMeIsPresent
{
  return self->_momentNodesWhereMeIsPresent;
}

- (BOOL)shouldFilterMomentNodesWithPresence
{
  return self->_shouldFilterMomentNodesWithPresence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesWhereMeIsPresent, 0);
  objc_storeStrong((id *)&self->_searchComputationCache, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke_222(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  double Current;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  void *v12;
  PGRankedZeroKeyword *v13;
  PGRankedZeroKeyword *v14;
  void *v15;
  void *v16;
  PGRankedZeroKeyword *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  PGRankedZeroKeyword *v23;
  PGRankedZeroKeyword *v24;
  _QWORD v25[5];
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1CAA4EB2C]();
  if (*(_QWORD *)(a1 + 72)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
        Current - *(double *)(v8 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v8 + 24) = Current,
        LOBYTE(v26) = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 72) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                             + 24)
                                                                 + 0.8)
                                                                * 0.5;
    v26 = 0;
    v27 = (double *)&v26;
    v28 = 0x2020000000;
    v29 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke_2;
    v25[3] = &unk_1E8432E48;
    v25[4] = &v26;
    objc_msgSend(v5, "enumerateMomentEdgesAndNodesUsingBlock:", v25);
    v9 = objc_msgSend(v5, "level");
    v10 = v9 - 1;
    if (!v9)
      v10 = 0;
    v11 = ((double)v10 * 0.1 + 1.0) * v27[3];
    v27[3] = v11;
    if (v11 != 0.0
      && objc_msgSend(v5, "isSuitableForSuggestions")
      && objc_msgSend(v5, "isIndexed"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "sceneIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v12);
      if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v12))
      {
        v13 = [PGRankedZeroKeyword alloc];
        v14 = -[PGRankedZeroKeyword initWithKeyword:score:](v13, "initWithKeyword:score:", 0, v27[3]);
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v14, v12);
      }
      else
      {
        objc_msgSend(v5, "label");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGScene%@ZeroKeywordText"), v15);
        v14 = (PGRankedZeroKeyword *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", v14, v14, CFSTR("Localizable"));
        v17 = (PGRankedZeroKeyword *)objc_claimAutoreleasedReturnValue();

        if (v17 == v14)
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "loggingConnection");
          v19 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v5, "label");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v31 = v20;
            _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "No ZK title key for scene with label %@", buf, 0xCu);

          }
          objc_msgSend(v5, "localizedName");
          v17 = (PGRankedZeroKeyword *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v5, "localizedName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        zeroKeywordWithAttributes(3, 13, v17, v21, 0, v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = [PGRankedZeroKeyword alloc];
        v24 = -[PGRankedZeroKeyword initWithKeyword:score:](v23, "initWithKeyword:score:", v22, v27[3]);
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v24);
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v24, v12);

      }
    }
    _Block_object_dispose(&v26, 8);
  }
  objc_autoreleasePoolPop(v6);

}

uint64_t __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke_230(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (double)(unint64_t)objc_msgSend(v8, "numberOfAssets");
    v11 = v10 / (double)(unint64_t)objc_msgSend(v9, "numberOfAssets");
    if (v11 >= 0.75)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "loggingConnection");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 56), "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412802;
        v17 = v5;
        v18 = 2112;
        v19 = v14;
        v20 = 2048;
        v21 = v11;
        _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "Filtering out scene ZK %@ because child scene %@ covers %f of the assets", (uint8_t *)&v16, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 64), "removeObject:", v7);
    }

  }
  return 0;
}

void __74__PGZeroKeywordComputer_sceneZeroKeywordsWithGraph_options_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  double v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "isReliable");
  v4 = 0.0;
  if (v3)
    v4 = (double)(unint64_t)objc_msgSend(v5, "numberOfSearchConfidenceAssets", 0.0);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);

}

void __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_216(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2 + 0.3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_217(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  double Current;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  unint64_t v29;
  void *v30;
  PGRankedZeroKeyword *v31;
  id v32;
  void *context;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v32 = a2;
  v7 = a3;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                           + 24)
                                                               + 0.9)
                                                              * 0.5;
  v38 = (_QWORD *)a1;
  v34 = v7;
  if (*(_QWORD *)(a1 + 80)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8),
        Current - *(double *)(v9 + 24) >= *(double *)(a1 + 112))
    && (*(double *)(v9 + 24) = Current,
        LOBYTE(v46) = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8)
                                                                                + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v7, "displayNode");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "meaningNodeZeroKeywordForDisplayMeaningNode:collectionUUIDsToAvoid:curationContext:", v35, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AA0]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "count"))
    {
      objc_msgSend(v36, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CD1390];
      v56[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fetchAssetsWithLocalIdentifiers:options:", v12, *(_QWORD *)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAssets:withType:options:", v13, 3, *(_QWORD *)(a1 + 56));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v51 != v16)
                objc_enumerationMutation(v14);
              v18 = (void *)v38[5];
              objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "uuid");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v19);

            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
          }
          while (v15);
        }

      }
    }
    if (v37)
    {
      v20 = (void *)v38[8];
      objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AF8]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = objc_msgSend(v20, "containsObject:", v21);

      if ((v20 & 1) == 0)
      {
        v46 = 0;
        v47 = &v46;
        v48 = 0x2020000000;
        v49 = 0;
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v34, "mappedMeaningNodes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v43;
          v26 = MEMORY[0x1E0C809B0];
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v43 != v25)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
              v39[0] = v26;
              v39[1] = 3221225472;
              v39[2] = __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_2;
              v39[3] = &unk_1E8432DF8;
              v40 = v22;
              v41 = &v46;
              objc_msgSend(v28, "enumerateMeaningfulEventsUsingBlock:", v39);

            }
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
          }
          while (v24);
        }

        v29 = objc_msgSend(v22, "count");
        v30 = (void *)v38[9];
        v31 = -[PGRankedZeroKeyword initWithKeyword:score:]([PGRankedZeroKeyword alloc], "initWithKeyword:score:", v37, (double)v29 + (double)(unint64_t)v47[3] * 2.22044605e-16);
        objc_msgSend(v30, "addObject:", v31);

        _Block_object_dispose(&v46, 8);
      }
    }

  }
  objc_autoreleasePoolPop(context);

}

void __90__PGZeroKeywordComputer_eventZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    objc_msgSend(v5, "eventCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eventMomentNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v4, "numberOfAssets");

  }
}

void __92__PGZeroKeywordComputer_socialGroupKeywordsWithGraph_curationContext_options_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __92__PGZeroKeywordComputer_socialGroupKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_205(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "personNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(v4, "personNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v6 <= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v6 < v8)
    return 1;
  else
    return v9;
}

void __91__PGZeroKeywordComputer_peopleZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.4);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __91__PGZeroKeywordComputer_peopleZeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_201(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isPairSocialGroup:", a2);
}

void __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_178(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2 + 0.2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_180(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2 + 0.4);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_183(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2 + 0.6);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __86__PGZeroKeywordComputer__zeroKeywordsWithGraph_curationContext_options_progressBlock___block_invoke_185(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2 + 0.8);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

+ (id)zeroKeywordLog
{
  if (zeroKeywordLog_onceToken != -1)
    dispatch_once(&zeroKeywordLog_onceToken, &__block_literal_global_238_57449);
  return (id)zeroKeywordLog_zeroKeywordLog;
}

void __39__PGZeroKeywordComputer_zeroKeywordLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PhotosGraph", "ZeroKeywordComputer");
  v1 = (void *)zeroKeywordLog_zeroKeywordLog;
  zeroKeywordLog_zeroKeywordLog = (uint64_t)v0;

}

@end
