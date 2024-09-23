@implementation PLHighlightItemClusterer

- (PLHighlightItemClusterer)initWithRule:(id)a3
{
  id v5;
  PLHighlightItemClusterer *v6;
  PLHighlightItemClusterer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLHighlightItemClusterer;
  v6 = -[PLHighlightItemClusterer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rule, a3);

  return v7;
}

- (void)restoreExistingHighlightItemListsFromUpdatedHighlightItems:(id)a3 deletedHighlightItems:(id)a4 usingModelReader:(id)a5 progressBlock:(id)a6 restoreBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, void *);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  double v21;
  double v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  PLHighlightItemList *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void (**v46)(id, void *, void *);
  id v47;
  id v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void (**v53)(_QWORD, _QWORD, double);
  char v54;
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
  int buf;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, void *))a7;
  v53 = (void (**)(_QWORD, _QWORD, double))MEMORY[0x19AEC174C](a6);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unionSet:", v12);
  objc_msgSend(v13, "fetchNeighborHighlightItemsForHighlightItems:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v16);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v13;
  objc_msgSend(v13, "fetchParentHighlightItemsForHighlightItems:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    v45 = v16;
    v46 = v14;
    v47 = v12;
    v48 = v11;
    v44 = v18;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = v19;
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v51)
    {
      v21 = 1.0 / (double)v20;
      v50 = *(_QWORD *)v64;
      v22 = 0.0;
      while (2)
      {
        for (i = 0; i != v51; ++i)
        {
          v24 = v17;
          if (*(_QWORD *)v64 != v50)
            objc_enumerationMutation(obj);
          v25 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v52, "fetchChildHighlightItemsForHighlightItem:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v28 = v26;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v60;
            do
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v60 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
                if (objc_msgSend(v15, "containsObject:", v33))
                  objc_msgSend(v27, "addObject:", v33);
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
            }
            while (v30);
          }

          v34 = -[PLHighlightItemList initWithParentHighlightItem:childHighlightItems:]([PLHighlightItemList alloc], "initWithParentHighlightItem:childHighlightItems:", v25, v28);
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v35 = v27;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v56;
            do
            {
              for (k = 0; k != v37; ++k)
              {
                if (*(_QWORD *)v56 != v38)
                  objc_enumerationMutation(v35);
                -[PLHighlightItemList removeHighlightItem:](v34, "removeHighlightItem:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k));
              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
            }
            while (v37);
          }
          v22 = v21 + v22;

          v17 = v24;
          objc_msgSend(v24, "addObject:", v34);
          if (v53)
          {
            v54 = 0;
            ((void (**)(_QWORD, char *, double))v53)[2](v53, &v54, v22);
            if (v54)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                buf = 67109120;
                LODWORD(v68) = 69;
                _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
              }

              v12 = v47;
              v11 = v48;
              v16 = v45;
              v14 = v46;
              v18 = v44;
              goto LABEL_34;
            }
          }

        }
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
        if (v51)
          continue;
        break;
      }
    }

    v12 = v47;
    v11 = v48;
    v16 = v45;
    v14 = v46;
    v18 = v44;
  }
  PLMomentsGetLog();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = v16;
    v42 = objc_msgSend(v17, "count");
    v43 = objc_msgSend(v11, "count");
    buf = 134218240;
    v68 = v42;
    v16 = v41;
    v69 = 2048;
    v70 = v43;
    _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_INFO, "[HighlightCluster] Restored (%lu) highlight item lists for (%lu) highlights", (uint8_t *)&buf, 0x16u);
  }

  objc_msgSend(v15, "minusSet:", v12);
  v14[2](v14, v17, v15);
LABEL_34:

}

- (id)processHighlightItems:(id)a3 withRestoredHighlightItemLists:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, double);
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  int v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  PLHighlightItemClusterer *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void (**v95)(_QWORD, _QWORD, double);
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  char v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  int buf;
  uint64_t v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  uint64_t v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  void *v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v92 = a5;
  v10 = (void (**)(_QWORD, _QWORD, double))MEMORY[0x19AEC174C]();
  v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimeZone:", v12);

  v98 = v11;
  objc_msgSend(v11, "setDateFormat:", CFSTR("MM/dd/yyyy"));
  PLMomentsGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    buf = 134218240;
    v111 = objc_msgSend(v8, "count");
    v112 = 2048;
    v113 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "[HighlightCluster] Clustering %lu highlight items with existing lists (%lu)", (uint8_t *)&buf, 0x16u);
  }

  v14 = (void *)objc_msgSend(v9, "mutableCopy");
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  +[PLHighlightItemList timeSortDescriptors](PLHighlightItemList, "timeSortDescriptors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sortUsingDescriptors:", v18);

  +[PLHighlightItemList timeSortDescriptors](PLHighlightItemList, "timeSortDescriptors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  if (!objc_msgSend(v21, "count"))
    goto LABEL_60;
  v79 = v8;
  v22 = objc_msgSend(v21, "count");
  objc_msgSend(v17, "firstObject");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v94 = v9;
  v95 = v10;
  v96 = v21;
  v97 = v17;
  if (!objc_msgSend(v21, "count"))
  {
    v25 = 0.0;
LABEL_38:
    +[PLHighlightItemList timeSortDescriptors](PLHighlightItemList, "timeSortDescriptors");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sortUsingDescriptors:", v59);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      v60 = 0;
      v101 = v23;
      v78 = self;
      while (1)
      {
        if (v60 >= objc_msgSend(v17, "count") - 1)
          goto LABEL_59;
        objc_msgSend(v17, "objectAtIndexedSubscript:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v60 + 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLHighlightItemClusterer rule](self, "rule");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "highlightItemList:canBeMergedWithOtherHighlightItemList:", v61, v62);

        if (v64)
          break;
        if (!v10)
        {
          ++v60;
LABEL_57:
          v23 = v101;
          goto LABEL_58;
        }
        v104 = 0;
        ((void (**)(_QWORD, char *, double))v10)[2](v10, &v104, v25);
        v23 = v101;
        if (v104)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            buf = 67109120;
            LODWORD(v111) = 162;
            _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
          }

          v75 = (id)MEMORY[0x1E0C9AA60];
          v8 = v79;
          v9 = v94;
          goto LABEL_61;
        }
        ++v60;
LABEL_58:

        if (!objc_msgSend(v17, "count"))
          goto LABEL_59;
      }
      PLMomentsGetLog();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v61, "startDate");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "stringFromDate:", v103);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "endDate");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "stringFromDate:", v93);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "startDate");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "stringFromDate:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "endDate");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "stringFromDate:", v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        buf = 138413058;
        v111 = (uint64_t)v91;
        v112 = 2112;
        v113 = (uint64_t)v66;
        v114 = 2112;
        v115 = (uint64_t)v68;
        v116 = 2112;
        v117 = v70;
        _os_log_impl(&dword_199541000, v65, OS_LOG_TYPE_DEBUG, "[HighlightCluster] Highlight Item lists should be merged (%@ - %@) - (%@ - %@)", (uint8_t *)&buf, 0x2Au);

        v10 = v95;
        v17 = v97;

        v21 = v96;
        self = v78;

      }
      if (objc_msgSend(v61, "isNewList"))
        v71 = v62;
      else
        v71 = v61;
      v72 = v71;
      if (objc_msgSend(v61, "isNewList"))
        v73 = v61;
      else
        v73 = v62;
      v74 = v73;
      objc_msgSend(v72, "mergeWithHighlightItemList:", v74);
      if ((objc_msgSend(v74, "isNewList") & 1) == 0)
      {
        objc_msgSend(v90, "addObject:", v74);
        objc_msgSend(v74, "reset");
      }
      objc_msgSend(v17, "removeObject:", v74);

      goto LABEL_57;
    }
LABEL_59:
    objc_msgSend(v17, "addObjectsFromArray:", v90);

    v8 = v79;
    v9 = v94;
LABEL_60:
    v75 = v17;
LABEL_61:
    v76 = v92;
    goto LABEL_62;
  }
  v24 = 1.0 / (double)v22;
  v25 = 0.0;
  while (1)
  {
    v26 = MEMORY[0x19AEC1554]();
    v25 = v24 + v25;
    objc_msgSend(v21, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = (void *)v26;
    if (v23)
      break;
LABEL_30:
    v52 = -[PLHighlightItemList initAsNewList]([PLHighlightItemList alloc], "initAsNewList");
    objc_msgSend(v52, "addHighlightItem:", v27);
    objc_msgSend(v17, "addObject:", v52);

    PLMomentsGetLog();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v27, "startDate");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "stringFromDate:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "endDate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "stringFromDate:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138412546;
      v111 = (uint64_t)v55;
      v112 = 2112;
      v113 = (uint64_t)v57;
      _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_DEBUG, "[HighlightCluster] New list for time period (%@ - %@)", (uint8_t *)&buf, 0x16u);

      v17 = v97;
      v21 = v96;

    }
    v23 = v52;
LABEL_33:
    objc_msgSend(v21, "removeObject:", v27);
    v58 = v102;
    if (v10)
    {
      v104 = 0;
      ((void (**)(_QWORD, char *, double))v10)[2](v10, &v104, v25);
      if (v104)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          buf = 67109120;
          LODWORD(v111) = 136;
          _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
        }
        v76 = v92;
        goto LABEL_69;
      }
    }

    objc_autoreleasePoolPop(v102);
    if (!objc_msgSend(v21, "count"))
      goto LABEL_38;
  }
  -[PLHighlightItemClusterer rule](self, "rule");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "highlightItem:belongsToHighlightItemList:", v27, v23);

  if (v29)
  {
    PLMomentsGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v27, "startDate");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "stringFromDate:", v88);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "endDate");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "stringFromDate:", v86);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "startDate");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "stringFromDate:", v84);
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "endDate");
      v99 = v23;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "stringFromDate:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLHighlightItemClusterer rule](self, "rule");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138413314;
      v111 = (uint64_t)v82;
      v112 = 2112;
      v113 = (uint64_t)v80;
      v114 = 2112;
      v115 = v31;
      v37 = (void *)v31;
      v116 = 2112;
      v117 = v33;
      v118 = 2112;
      v119 = v36;
      _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEBUG, "[HighlightCluster] Highlight item (%@ - %@) matches cluster (%@ - %@) for rules %@", (uint8_t *)&buf, 0x34u);

      v9 = v94;
      v23 = v99;

      v17 = v97;
      v21 = v96;

      v10 = v95;
    }

    objc_msgSend(v23, "addHighlightItem:", v27);
    LODWORD(v38) = 1;
    if (!v10)
      goto LABEL_29;
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v39 = v17;
    v38 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v105, v109, 16);
    if (v38)
    {
      v100 = v23;
      v40 = *(_QWORD *)v106;
      while (2)
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v106 != v40)
            objc_enumerationMutation(v39);
          v42 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
          -[PLHighlightItemClusterer rule](self, "rule");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "highlightItem:belongsToHighlightItemList:", v27, v42);

          if (v44)
          {
            PLMomentsGetLog();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v27, "startDate");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "stringFromDate:", v85);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "endDate");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "stringFromDate:", v83);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "startDate");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "stringFromDate:", v81);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "endDate");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "stringFromDate:", v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLHighlightItemClusterer rule](self, "rule");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = (objc_class *)objc_opt_class();
              NSStringFromClass(v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              buf = 138413314;
              v111 = (uint64_t)v89;
              v112 = 2112;
              v113 = (uint64_t)v87;
              v114 = 2112;
              v115 = (uint64_t)v46;
              v116 = 2112;
              v117 = v48;
              v118 = 2112;
              v119 = v51;
              _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_DEBUG, "[HighlightCluster] Highlight item (%@ - %@) matches cluster (%@ - %@) for rules %@", (uint8_t *)&buf, 0x34u);

              v9 = v94;
            }

            objc_msgSend(v42, "addHighlightItem:", v27);
            v23 = v42;

            LODWORD(v38) = 1;
            v10 = v95;
            v21 = v96;
            v17 = v97;
            goto LABEL_27;
          }
        }
        v38 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v105, v109, 16);
        if (v38)
          continue;
        break;
      }
      v10 = v95;
      v21 = v96;
      v17 = v97;
      v23 = v100;
    }
LABEL_27:

    if (!v10)
    {
LABEL_29:
      if ((_DWORD)v38)
        goto LABEL_33;
      goto LABEL_30;
    }
  }
  v104 = 0;
  ((void (**)(_QWORD, char *, double))v10)[2](v10, &v104, v25);
  if (!v104)
    goto LABEL_29;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 67109120;
    LODWORD(v111) = 124;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
  }
  v76 = v92;
  v58 = v102;
LABEL_69:

  objc_autoreleasePoolPop(v58);
  v75 = (id)MEMORY[0x1E0C9AA60];
  v8 = v79;
LABEL_62:

  return v75;
}

- (PLHighlightItemClustererRule)rule
{
  return self->_rule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rule, 0);
}

@end
