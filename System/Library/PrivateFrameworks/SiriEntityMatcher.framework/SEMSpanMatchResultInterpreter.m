@implementation SEMSpanMatchResultInterpreter

- (SEMSpanMatchResultInterpreter)init
{
  SEMSpanMatchResultInterpreter *v2;
  SEMSpanMatchPolicy *v3;
  const char *v4;
  uint64_t v5;
  SEMSpanMatchPolicy *fuzzyPolicy;
  SEMSpanMatchPolicy *v7;
  const char *v8;
  uint64_t v9;
  SEMSpanMatchPolicy *exactPolicy;
  SEMSpanMatchPolicy *v11;
  const char *v12;
  uint64_t v13;
  SEMSpanMatchPolicy *fuzzyWithAliasPolicy;
  SEMSpanMatchPolicy *v15;
  const char *v16;
  uint64_t v17;
  SEMSpanMatchPolicy *exactWithAliasPolicy;
  const char *v19;
  uint64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SEMSpanMatchResultInterpreter;
  v2 = -[SEMSpanMatchResultInterpreter init](&v22, sel_init);
  if (v2)
  {
    v3 = [SEMSpanMatchPolicy alloc];
    v5 = objc_msgSend_initWithOptions_(v3, v4, 3);
    fuzzyPolicy = v2->_fuzzyPolicy;
    v2->_fuzzyPolicy = (SEMSpanMatchPolicy *)v5;

    v7 = [SEMSpanMatchPolicy alloc];
    v9 = objc_msgSend_initWithOptions_(v7, v8, 0);
    exactPolicy = v2->_exactPolicy;
    v2->_exactPolicy = (SEMSpanMatchPolicy *)v9;

    v11 = [SEMSpanMatchPolicy alloc];
    v13 = objc_msgSend_initWithOptions_(v11, v12, 19);
    fuzzyWithAliasPolicy = v2->_fuzzyWithAliasPolicy;
    v2->_fuzzyWithAliasPolicy = (SEMSpanMatchPolicy *)v13;

    v15 = [SEMSpanMatchPolicy alloc];
    v17 = objc_msgSend_initWithOptions_(v15, v16, 16);
    exactWithAliasPolicy = v2->_exactWithAliasPolicy;
    v2->_exactWithAliasPolicy = (SEMSpanMatchPolicy *)v17;

    v2->_useSensitiveLogging = objc_msgSend_useSensitiveLogging(SEMSettings, v19, v20);
  }
  return v2;
}

- (id)interpretSpanMatchResults:(id)a3 ofQuery:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  void *v35;
  id v36;
  id v37;
  const char *v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  int v43;
  const char *v44;
  uint64_t v45;
  int v46;
  void *v47;
  id v48;
  int v50;
  int v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend__sortCandidates_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)qword_25441F970;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v52 = v8;
    v53 = v7;
    v54 = v6;
    v51 = objc_msgSend_count(v6, v12, v13);
    v50 = objc_msgSend_count(v10, v14, v15);
    v16 = v10;
    v17 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v20 = objc_msgSend_count(v16, v18, v19);
    v22 = (void *)objc_msgSend_initWithCapacity_(v17, v21, v20);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend_allKeys(v16, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v58, buf, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v59;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v59 != v29)
            objc_enumerationMutation(v25);
          sub_2463055B4(*(void **)(*((_QWORD *)&v58 + 1) + 8 * v30));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v22, v32, (uint64_t)v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v33, (uint64_t)&v58, buf, 16);
      }
      while (v28);
    }

    objc_msgSend_componentsJoinedByString_(v22, v34, (uint64_t)CFSTR(", "));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 136315906;
    v63 = "-[SEMSpanMatchResultInterpreter interpretSpanMatchResults:ofQuery:]";
    v64 = 1024;
    v65 = v51;
    v66 = 1024;
    v67 = v50;
    v68 = 2112;
    v69 = v35;
    _os_log_impl(&dword_2462C4000, v11, OS_LOG_TYPE_INFO, "%s Sorted %u matched item candidate(s) into %u group(s): [ %@ ]", buf, 0x22u);

    v7 = v53;
    v6 = v54;
    v8 = v52;
  }

  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = sub_246305318;
  v55[3] = &unk_251783180;
  v55[4] = self;
  v36 = v7;
  v56 = v36;
  v37 = v8;
  v57 = v37;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v38, (uint64_t)v55);
  v39 = (void *)qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v40 = v39;
    v43 = objc_msgSend_count(v37, v41, v42);
    v46 = objc_msgSend_count(v6, v44, v45);
    *(_DWORD *)buf = 136315650;
    v63 = "-[SEMSpanMatchResultInterpreter interpretSpanMatchResults:ofQuery:]";
    v64 = 1024;
    v65 = v43;
    v66 = 1024;
    v67 = v46;
    _os_log_impl(&dword_2462C4000, v40, OS_LOG_TYPE_INFO, "%s Span Matching produced %u final result(s) from %u total candidate(s).", buf, 0x18u);

  }
  v47 = v57;
  v48 = v37;

  return v48;
}

- (id)_sortCandidates:(id)a3
{
  id v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  id v18;
  const char *v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v23, v31, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v24;
    *(_QWORD *)&v10 = 136315394;
    v22 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v6);
        v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend__groupKeyForCandidate_(self, v9, v14, v22, (_QWORD)v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend_objectForKey_(v5, v15, (uint64_t)v16);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend_setObject_forKey_(v5, v19, (uint64_t)v18, v16);
          }
          objc_msgSend_addObject_(v18, v17, v14);

        }
        else
        {
          v20 = qword_25441F970;
          if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            v28 = "-[SEMSpanMatchResultInterpreter _sortCandidates:]";
            v29 = 2112;
            v30 = v14;
            _os_log_error_impl(&dword_2462C4000, v20, OS_LOG_TYPE_ERROR, "%s Ignorning unsupported span match result: %@", buf, 0x16u);
          }
        }

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v23, v31, 16);
    }
    while (v11);
  }

  return v5;
}

- (id)_groupKeyForCandidate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  void *v12;
  void *v13;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  unsigned int v21;
  const char *v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_entityInfo(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_entityType(v7, v8, v9);

  if (v10 == 1)
  {
    objc_msgSend__groupKeyForCascadeCandidate_(self, v11, (uint64_t)v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v15 = v13;
      objc_msgSend_entityInfo(v4, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_entityType(v18, v19, v20);
      SEMEntityTypeDescription(v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136315650;
      v25 = "-[SEMSpanMatchResultInterpreter _groupKeyForCandidate:]";
      v26 = 2112;
      v27 = v23;
      v28 = 2112;
      v29 = v4;
      _os_log_error_impl(&dword_2462C4000, v15, OS_LOG_TYPE_ERROR, "%s Unexpected entity type (%@) of candidate: %@", (uint8_t *)&v24, 0x20u);

    }
    v12 = 0;
  }

  return v12;
}

- (id)_groupKeyForCascadeCandidate:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  __int16 v16;
  void *v17;

  v3 = a3;
  objc_msgSend_entityInfo(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2462EAC48(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v10 = objc_msgSend_itemType(v7, v8, v9);
    v13 = v10;
    if (v10 == 7690)
    {
      if (sub_246305EB8(v3, v11, v12) == 7705)
      {
        v15 = 7690;
        v16 = 7705;
        goto LABEL_11;
      }
    }
    else if (v10 == 27122 || v10 == 19668)
    {
      v14 = sub_246305EB8(v3, v11, v12);
      if (!sub_2462DB248(v14))
      {
        v15 = v13;
        v16 = v14;
LABEL_11:
        sub_246305F3C(v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    v16 = *MEMORY[0x24BE15620];
    v15 = v13;
    goto LABEL_11;
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (id)_filterRankAndThresholdCandidates:(id)a3 ofQuery:(id)a4 withPolicy:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  float v49;
  uint64_t j;
  void *v51;
  const char *v52;
  uint64_t v53;
  float v54;
  float v55;
  const char *v56;
  uint64_t v57;
  double v58;
  float v59;
  void *v60;
  void *v61;
  _BOOL4 useSensitiveLogging;
  void *v63;
  _BOOL4 v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  int v78;
  int v79;
  const char *v80;
  uint64_t v81;
  int v82;
  double v83;
  double v84;
  double v85;
  const char *v86;
  id v87;
  void *v88;
  uint64_t v90;
  id v91;
  unsigned int v92;
  id v93;
  id obj;
  id obja;
  unsigned int v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint8_t buf[4];
  const char *v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  double v110;
  __int16 v111;
  double v112;
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v93 = a4;
  v9 = a5;
  v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v13 = objc_msgSend_count(v8, v11, v12);
  v14 = v10;
  v15 = v9;
  v17 = (void *)objc_msgSend_initWithCapacity_(v14, v16, v13);
  v20 = objc_msgSend_allowPartialMatch(v9, v18, v19);
  v96 = objc_msgSend_allowApproxMatch(v9, v21, v22);
  v25 = objc_msgSend_allowAliasMatch(v9, v23, v24);
  if (objc_msgSend_prioritizeExactMatch(v9, v26, v27))
  {
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v28 = v8;
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v101, v114, 16);
    if (v30)
    {
      v33 = v30;
      v91 = v8;
      obj = v9;
      v34 = *(_QWORD *)v102;
      while (2)
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v102 != v34)
            objc_enumerationMutation(v28);
          objc_msgSend_spanInfo(*(void **)(*((_QWORD *)&v101 + 1) + 8 * i), v31, v32);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isPartialMatch(v36, v37, v38) & 1) == 0
            && (objc_msgSend_isApproximateMatch(v36, v39, v40) & 1) == 0)
          {
            v42 = v25;
            v43 = qword_25441F970;
            if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v106 = "-[SEMSpanMatchResultInterpreter _filterRankAndThresholdCandidates:ofQuery:withPolicy:]";
              _os_log_impl(&dword_2462C4000, v43, OS_LOG_TYPE_INFO, "%s Enabling exact match prioritiy, disallow partial and approximate matches", buf, 0xCu);
            }

            v96 = 0;
            v20 = 0;
            v41 = v93;
            v15 = obj;
            v25 = v42;
            goto LABEL_16;
          }

        }
        v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v101, v114, 16);
        if (v33)
          continue;
        break;
      }
      v41 = v93;
      v15 = obj;
LABEL_16:
      v8 = v91;
    }
    else
    {
      v41 = v93;
    }

  }
  else
  {
    v41 = v93;
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  obja = v8;
  v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v44, (uint64_t)&v97, v113, 16);
  if (!v45)
  {
    v49 = 0.0;
    goto LABEL_41;
  }
  v47 = v45;
  v48 = *(_QWORD *)v98;
  v49 = 0.0;
  v90 = 136315906;
  v92 = v25;
  do
  {
    for (j = 0; j != v47; ++j)
    {
      if (*(_QWORD *)v98 != v48)
        objc_enumerationMutation(obja);
      v51 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
      if (objc_msgSend__checkEligibilityOfSpanMatch_allowPartialMatch_allowApproxMatch_allowAliasMatch_query_(self, v46, (uint64_t)v51, v20, v96, v25, v41, v90))
      {
        objc_msgSend__scoreSpanMatch_policy_(self, v46, (uint64_t)v51, v15);
        v55 = v54;
        if (v54 > v49)
          v49 = v54;
        objc_msgSend_absoluteThreshold(v15, v52, v53);
        if (*(float *)&v58 < 0.0 || (v59 = *(float *)&v58, v55 >= *(float *)&v58))
        {
          *(float *)&v58 = v55;
          objc_msgSend_setScore_(v51, v56, v57, v58);
          objc_msgSend__addScoredMatch_toSortedArray_(self, v71, (uint64_t)v51, v17);
          continue;
        }
        v60 = v17;
        v61 = v15;
        useSensitiveLogging = self->_useSensitiveLogging;
        v63 = (void *)qword_25441F970;
        v64 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
        if (useSensitiveLogging)
        {
          if (v64)
          {
            v65 = v63;
            objc_msgSend_spanValue(v51, v66, v67);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315907;
            v106 = "-[SEMSpanMatchResultInterpreter _filterRankAndThresholdCandidates:ofQuery:withPolicy:]";
            v107 = 2117;
            v108 = v68;
            v109 = 2048;
            v110 = v55;
            v111 = 2048;
            v112 = v59;
            v69 = v65;
            v70 = "%s Rejecting candidate with value: \"%{sensitive}@\" - score of %f below absolute threshold value of %f";
            goto LABEL_35;
          }
        }
        else if (v64)
        {
          v65 = v63;
          objc_msgSend_spanValue(v51, v72, v73);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v90;
          v106 = "-[SEMSpanMatchResultInterpreter _filterRankAndThresholdCandidates:ofQuery:withPolicy:]";
          v107 = 2112;
          v108 = v68;
          v109 = 2048;
          v110 = v55;
          v111 = 2048;
          v112 = v59;
          v69 = v65;
          v70 = "%s Rejecting candidate with value: \"%@\" - score of %f below absolute threshold value of %f";
LABEL_35:
          _os_log_impl(&dword_2462C4000, v69, OS_LOG_TYPE_INFO, v70, buf, 0x2Au);

        }
        v41 = v93;
        v15 = v61;
        v17 = v60;
        v25 = v92;
        continue;
      }
    }
    v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v46, (uint64_t)&v97, v113, 16);
  }
  while (v47);
LABEL_41:

  if (objc_msgSend_count(v17, v74, v75))
  {
    objc_msgSend_regionalRelativeThreshold(v15, v76, v77);
    v79 = v78;
    objc_msgSend_globalRelativeThreshold(v15, v80, v81);
    LODWORD(v83) = v82;
    LODWORD(v84) = v79;
    *(float *)&v85 = v49;
    objc_msgSend__applyRegionalSpanRankingToSortedGroupMatches_regionalThresholdScalar_globalThresholdScalar_maximalScore_(self, v86, (uint64_t)v17, v84, v83, v85);
    v87 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v87 = v17;
  }
  v88 = v87;

  return v88;
}

- (float)_scoreSpanMatch:(id)a3 policy:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  float v9;
  float v10;
  const char *v11;
  uint64_t v12;
  float v13;
  float v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  float v20;
  float v21;

  v5 = a4;
  v6 = a3;
  objc_msgSend_matchScoreWeight(v5, v7, v8);
  v10 = v9;
  objc_msgSend_priorScoreWeight(v5, v11, v12);
  v14 = v13;

  objc_msgSend_spanInfo(v6, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_matchScore(v17, v18, v19);
  v21 = v20;

  return (float)(v14 * 0.0) + (float)(v10 * v21);
}

- (void)_addScoredMatch:(id)a3 toSortedArray:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  float v29;
  float v30;
  const char *v31;
  uint64_t v32;
  float v33;
  const char *v34;
  uint64_t v35;
  id v36;

  v36 = a3;
  v5 = a4;
  if (objc_msgSend_count(v5, v6, v7))
  {
    v9 = 0;
    while (1)
    {
      objc_msgSend_objectAtIndex_(v5, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_spanInfo(v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_spanRange(v13, v14, v15);
      v18 = v17;

      objc_msgSend_spanInfo(v36, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend_spanRange(v21, v22, v23);
      v26 = v25;

      if (v24 < v16)
        break;
      if (v24 <= v16)
      {
        if (v26 < v18)
          break;
        if (v26 <= v18)
        {
          objc_msgSend_score(v36, v27, v28);
          v30 = v29;
          objc_msgSend_score(v10, v31, v32);
          if (v30 >= v33)
            break;
        }
      }

      if (++v9 >= (unint64_t)objc_msgSend_count(v5, v34, v35))
        goto LABEL_9;
    }
    objc_msgSend_insertObject_atIndex_(v5, v27, (uint64_t)v36, v9);

  }
  else
  {
LABEL_9:
    objc_msgSend_addObject_(v5, v8, (uint64_t)v36);
  }

}

- (id)_applyRegionalSpanRankingToSortedGroupMatches:(id)a3 regionalThresholdScalar:(float)a4 globalThresholdScalar:(float)a5 maximalScore:(float)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  float v27;
  float v28;
  uint64_t i;
  void *v30;
  float v31;
  float v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  BOOL v40;
  const char *v41;
  uint64_t v42;
  _BOOL4 useSensitiveLogging;
  void *v45;
  _BOOL4 v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  const char *v52;
  _BOOL4 v53;
  void *v54;
  _BOOL4 v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  id v63;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  double v75;
  __int16 v76;
  double v77;
  __int16 v78;
  double v79;
  __int16 v80;
  double v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v13 = objc_msgSend_count(v9, v11, v12);
  v63 = (id)objc_msgSend_initWithCapacity_(v10, v14, v13);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v9;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v66, v82, 16);
  if (v16)
  {
    v19 = v16;
    v20 = 0;
    v21 = 0;
    v22 = a5 * a6;
    v23 = *(_QWORD *)v67;
    v24 = (float)(a5 * a6);
    v25 = a6;
    v26 = a5;
    v27 = 0.0;
    v28 = 0.0;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v67 != v23)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend_score(v30, v17, v18);
        v32 = v31;
        objc_msgSend_spanInfo(v30, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isApproximateMatch(v35, v36, v37))
          v40 = v32 < v22;
        else
          v40 = 0;
        if (v40)
        {
          useSensitiveLogging = self->_useSensitiveLogging;
          v45 = (void *)qword_25441F970;
          v46 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
          if (useSensitiveLogging)
          {
            if (!v46)
              goto LABEL_28;
            v47 = v45;
            objc_msgSend_spanValue(v30, v48, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316419;
            v71 = "-[SEMSpanMatchResultInterpreter _applyRegionalSpanRankingToSortedGroupMatches:regionalThresholdScalar:"
                  "globalThresholdScalar:maximalScore:]";
            v72 = 2117;
            v73 = v50;
            v74 = 2048;
            v75 = v32;
            v76 = 2048;
            v77 = v24;
            v78 = 2048;
            v79 = v25;
            v80 = 2048;
            v81 = v26;
            v51 = v47;
            v52 = "%s Rejecting candidate with value: \"%{sensitive}@\" - approximate match with score of %f below global"
                  " threshold cutoff of %f calculated from (max score in ranked group: %f) * (configured global threshold scalar: %f)";
          }
          else
          {
            if (!v46)
              goto LABEL_28;
            v47 = v45;
            objc_msgSend_spanValue(v30, v58, v59);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316418;
            v71 = "-[SEMSpanMatchResultInterpreter _applyRegionalSpanRankingToSortedGroupMatches:regionalThresholdScalar:"
                  "globalThresholdScalar:maximalScore:]";
            v72 = 2112;
            v73 = v50;
            v74 = 2048;
            v75 = v32;
            v76 = 2048;
            v77 = v24;
            v78 = 2048;
            v79 = v25;
            v80 = 2048;
            v81 = v26;
            v51 = v47;
            v52 = "%s Rejecting candidate with value: \"%@\" - approximate match with score of %f below global threshold "
                  "cutoff of %f calculated from (max score in ranked group: %f) * (configured global threshold scalar: %f)";
          }
        }
        else
        {
          if (v21 != objc_msgSend_spanRange(v35, v38, v39) || v20 != v41)
          {
            v21 = objc_msgSend_spanRange(v35, v41, v42);
            v20 = v41;
            v27 = v32 * a4;
            v28 = v32;
LABEL_22:
            objc_msgSend_addObject_(v63, v41, (uint64_t)v30);
            goto LABEL_28;
          }
          if (v32 >= v27)
            goto LABEL_22;
          v53 = self->_useSensitiveLogging;
          v54 = (void *)qword_25441F970;
          v55 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
          if (v53)
          {
            if (!v55)
              goto LABEL_28;
            v47 = v54;
            objc_msgSend_spanValue(v30, v56, v57);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316419;
            v71 = "-[SEMSpanMatchResultInterpreter _applyRegionalSpanRankingToSortedGroupMatches:regionalThresholdScalar:"
                  "globalThresholdScalar:maximalScore:]";
            v72 = 2117;
            v73 = v50;
            v74 = 2048;
            v75 = v32;
            v76 = 2048;
            v77 = v27;
            v78 = 2048;
            v79 = v28;
            v80 = 2048;
            v81 = a4;
            v51 = v47;
            v52 = "%s Rejecting candidate with value: \"%{sensitive}@\" - score of %f below regional threshold cutoff of "
                  "%f calculated from (max score in region: %f) * (configured regional threshold scalar: %f)";
          }
          else
          {
            if (!v55)
              goto LABEL_28;
            v47 = v54;
            objc_msgSend_spanValue(v30, v60, v61);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316418;
            v71 = "-[SEMSpanMatchResultInterpreter _applyRegionalSpanRankingToSortedGroupMatches:regionalThresholdScalar:"
                  "globalThresholdScalar:maximalScore:]";
            v72 = 2112;
            v73 = v50;
            v74 = 2048;
            v75 = v32;
            v76 = 2048;
            v77 = v27;
            v78 = 2048;
            v79 = v28;
            v80 = 2048;
            v81 = a4;
            v51 = v47;
            v52 = "%s Rejecting candidate with value: \"%@\" - score of %f below regional threshold cutoff of %f calculat"
                  "ed from (max score in region: %f) * (configured regional threshold scalar: %f)";
          }
        }
        _os_log_impl(&dword_2462C4000, v51, OS_LOG_TYPE_INFO, v52, buf, 0x3Eu);

LABEL_28:
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v66, v82, 16);
    }
    while (v19);
  }

  return v63;
}

- (BOOL)_checkEligibilityOfSpanMatch:(id)a3 allowPartialMatch:(BOOL)a4 allowApproxMatch:(BOOL)a5 allowAliasMatch:(BOOL)a6 query:(id)a7
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t i;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  int v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  int isPartialMatch;
  _BOOL4 useSensitiveLogging;
  void *v69;
  _BOOL4 v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  void *v75;
  void *v76;
  const char *v77;
  _BOOL4 v78;
  void *v79;
  _BOOL4 v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  BOOL v94;
  _BOOL4 v96;
  void *v97;
  _BOOL4 v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  _BOOL4 v104;
  void *v105;
  _BOOL4 v106;
  NSObject *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  void *v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  _BOOL4 v120;
  void *v121;
  _BOOL4 v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  int v127;
  const char *v128;
  uint64_t v129;
  int v130;
  _BOOL4 v131;
  void *v132;
  _BOOL4 v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  int v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  int v143;
  const char *v144;
  uint64_t v145;
  int v146;
  NSObject *v147;
  uint32_t v148;
  const char *v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  int v153;
  int v154;
  int v155;
  SEMSpanMatchResultInterpreter *v156;
  void *v157;
  int v158;
  _BOOL4 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  uint8_t buf[4];
  const char *v167;
  __int16 v168;
  uint64_t v169;
  __int16 v170;
  _QWORD v171[3];
  _BYTE v172[128];
  uint64_t v173;

  v161 = a4;
  v173 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a7;
  objc_msgSend_spanInfo(v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_matchedTokenCount(v13, v14, v15);
  v19 = objc_msgSend_maxTokenCount(v13, v17, v18);
  v22 = objc_msgSend_matchedStopWordCount(v13, v20, v21);
  v158 = objc_msgSend_maxStopWordCount(v13, v23, v24);
  objc_msgSend_entityInfo(v9, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2462EAC48(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_itemType(v28, v29, v30);

  if ((objc_msgSend_isCascadeItemTypeIncluded_(v10, v32, v31) & 1) == 0)
  {
    useSensitiveLogging = self->_useSensitiveLogging;
    v69 = (void *)qword_25441F970;
    v70 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
    if (useSensitiveLogging)
    {
      if (!v70)
        goto LABEL_31;
      v61 = v69;
      objc_msgSend_spanValue(v9, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v74, v31);
      v75 = v13;
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315651;
      v167 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
      v168 = 2117;
      v169 = (uint64_t)v73;
      v170 = 2112;
      v171[0] = v76;
      v77 = "%s Rejecting candidate with value: \"%{sensitive}@\" itemType: %@ is excluded from query.";
    }
    else
    {
      if (!v70)
        goto LABEL_31;
      v61 = v69;
      objc_msgSend_spanValue(v9, v88, v89);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v90, v31);
      v75 = v13;
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v167 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
      v168 = 2112;
      v169 = (uint64_t)v73;
      v170 = 2112;
      v171[0] = v76;
      v77 = "%s Rejecting candidate with value: \"%@\" itemType: %@ is excluded from query.";
    }
    _os_log_impl(&dword_2462C4000, v61, OS_LOG_TYPE_INFO, v77, buf, 0x20u);

    v13 = v75;
    goto LABEL_26;
  }
  v156 = self;
  v157 = v9;
  v154 = v16;
  v155 = v19;
  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  objc_msgSend_fieldMatches(v9, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v162, v172, 16);
  if (!v37)
    goto LABEL_10;
  v40 = v37;
  v41 = *(_QWORD *)v163;
  while (2)
  {
    v42 = v13;
    for (i = 0; i != v40; ++i)
    {
      if (*(_QWORD *)v163 != v41)
        objc_enumerationMutation(v35);
      objc_msgSend_entityFieldInfo(*(void **)(*((_QWORD *)&v162 + 1) + 8 * i), v38, v39);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2462EAD88(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_fieldType(v45, v46, v47);

      if ((objc_msgSend_isCascadeFieldTypeIncluded_(v10, v49, v48) & 1) == 0)
      {
        v78 = v156->_useSensitiveLogging;
        v79 = (void *)qword_25441F970;
        v80 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
        if (v78)
        {
          v9 = v157;
          v13 = v42;
          if (v80)
          {
            v81 = v79;
            objc_msgSend_spanValue(v157, v82, v83);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v85, v48);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315651;
            v167 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allow"
                   "AliasMatch:query:]";
            v168 = 2117;
            v169 = (uint64_t)v84;
            v170 = 2112;
            v171[0] = v86;
            v87 = "%s Rejecting candidate with value: \"%{sensitive}@\" fieldType: %@ is excluded from query.";
LABEL_29:
            _os_log_impl(&dword_2462C4000, v81, OS_LOG_TYPE_INFO, v87, buf, 0x20u);

          }
        }
        else
        {
          v9 = v157;
          v13 = v42;
          if (v80)
          {
            v81 = v79;
            objc_msgSend_spanValue(v157, v91, v92);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v93, v48);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v167 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allow"
                   "AliasMatch:query:]";
            v168 = 2112;
            v169 = (uint64_t)v84;
            v170 = 2112;
            v171[0] = v86;
            v87 = "%s Rejecting candidate with value: \"%@\" fieldType: %@ is excluded from query.";
            goto LABEL_29;
          }
        }

        goto LABEL_31;
      }
    }
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v162, v172, 16);
    v13 = v42;
    if (v40)
      continue;
    break;
  }
LABEL_10:

  if (!v161)
  {
    v9 = v157;
    if (!objc_msgSend_isPartialMatch(v13, v50, v51))
      goto LABEL_47;
    v96 = v156->_useSensitiveLogging;
    v97 = (void *)qword_25441F970;
    v98 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
    if (v96)
    {
      if (v98)
      {
        v99 = v97;
        objc_msgSend_spanValue(v157, v100, v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315907;
        v167 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
        v168 = 2117;
        v169 = (uint64_t)v102;
        v170 = 1024;
        LODWORD(v171[0]) = v154;
        WORD2(v171[0]) = 1024;
        *(_DWORD *)((char *)v171 + 6) = v155;
        v103 = "%s Rejecting candidate with value: \"%{sensitive}@\" - partial match with %u / %u tokens matched.";
        goto LABEL_60;
      }
    }
    else if (v98)
    {
      v99 = v97;
      objc_msgSend_spanValue(v157, v114, v115);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v167 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
      v168 = 2112;
      v169 = (uint64_t)v102;
      v170 = 1024;
      LODWORD(v171[0]) = v154;
      WORD2(v171[0]) = 1024;
      *(_DWORD *)((char *)v171 + 6) = v155;
      v103 = "%s Rejecting candidate with value: \"%@\" - partial match with %u / %u tokens matched.";
      goto LABEL_60;
    }
    goto LABEL_31;
  }
  v52 = v154;
  v9 = v157;
  if (v154 != v22 || v155 - v154 < (v158 - v22))
    goto LABEL_47;
  objc_msgSend_fieldMatches(v157, v50, v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v53, v54, v55) != 1)
  {

    v61 = 0;
LABEL_38:
    v104 = v156->_useSensitiveLogging;
    v105 = (void *)qword_25441F970;
    v106 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
    if (v104)
    {
      if (v106)
      {
        v107 = v105;
        objc_msgSend_spanValue(v157, v108, v109);
        v110 = objc_claimAutoreleasedReturnValue();
        v111 = v52;
        v112 = (void *)v110;
        *(_DWORD *)buf = 136315907;
        v167 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
        v168 = 2117;
        v169 = v110;
        v170 = 1024;
        LODWORD(v171[0]) = v111;
        WORD2(v171[0]) = 1024;
        *(_DWORD *)((char *)v171 + 6) = v155;
        v113 = "%s Rejecting candidate with value: \"%{sensitive}@\" - partial match with %u / %u tokens matched, and all"
               " matching stop words.";
LABEL_45:
        _os_log_impl(&dword_2462C4000, v107, OS_LOG_TYPE_INFO, v113, buf, 0x22u);

      }
    }
    else if (v106)
    {
      v107 = v105;
      objc_msgSend_spanValue(v157, v116, v117);
      v118 = objc_claimAutoreleasedReturnValue();
      v119 = v52;
      v112 = (void *)v118;
      *(_DWORD *)buf = 136315906;
      v167 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
      v168 = 2112;
      v169 = v118;
      v170 = 1024;
      LODWORD(v171[0]) = v119;
      WORD2(v171[0]) = 1024;
      *(_DWORD *)((char *)v171 + 6) = v155;
      v113 = "%s Rejecting candidate with value: \"%@\" - partial match with %u / %u tokens matched, and all matching stop words.";
      goto LABEL_45;
    }
LABEL_26:

    goto LABEL_31;
  }
  objc_msgSend_fieldMatches(v157, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v58, v59, v60);
  v61 = objc_claimAutoreleasedReturnValue();

  if (!v61)
    goto LABEL_38;
  objc_msgSend_fieldSpanInfo(v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  isPartialMatch = objc_msgSend_isPartialMatch(v64, v65, v66);

  if (isPartialMatch)
  {
    v52 = v154;
    goto LABEL_38;
  }

LABEL_47:
  if (a6 || !objc_msgSend_isAliasMatch(v13, v50, v51))
  {
    if (a5 || !objc_msgSend_isApproximateMatch(v13, v50, v51))
    {
      v94 = 1;
      goto LABEL_32;
    }
    v131 = v156->_useSensitiveLogging;
    v132 = (void *)qword_25441F970;
    v133 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
    if (v131)
    {
      if (!v133)
        goto LABEL_31;
      v99 = v132;
      objc_msgSend_spanValue(v9, v134, v135);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = objc_msgSend_editDistance(v13, v136, v137);
      *(_DWORD *)buf = 136315651;
      v167 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
      v168 = 2117;
      v169 = (uint64_t)v102;
      v170 = 1024;
      LODWORD(v171[0]) = v138;
      v103 = "%s Rejecting candidate with value: \"%{sensitive}@\" - approximate match with edit distance: %u.";
    }
    else
    {
      if (!v133)
        goto LABEL_31;
      v99 = v132;
      objc_msgSend_spanValue(v9, v149, v150);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = objc_msgSend_editDistance(v13, v151, v152);
      *(_DWORD *)buf = 136315650;
      v167 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
      v168 = 2112;
      v169 = (uint64_t)v102;
      v170 = 1024;
      LODWORD(v171[0]) = v153;
      v103 = "%s Rejecting candidate with value: \"%@\" - approximate match with edit distance: %u.";
    }
    v147 = v99;
    v148 = 28;
LABEL_64:
    _os_log_impl(&dword_2462C4000, v147, OS_LOG_TYPE_INFO, v103, buf, v148);

    goto LABEL_31;
  }
  v120 = v156->_useSensitiveLogging;
  v121 = (void *)qword_25441F970;
  v122 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
  if (!v120)
  {
    if (!v122)
      goto LABEL_31;
    v99 = v121;
    objc_msgSend_spanValue(v9, v139, v140);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = objc_msgSend_matchedAliasCount(v13, v141, v142);
    v146 = objc_msgSend_maxAliasCount(v13, v144, v145);
    *(_DWORD *)buf = 136315906;
    v167 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
    v168 = 2112;
    v169 = (uint64_t)v102;
    v170 = 1024;
    LODWORD(v171[0]) = v143;
    WORD2(v171[0]) = 1024;
    *(_DWORD *)((char *)v171 + 6) = v146;
    v103 = "%s Rejecting candidate with value: \"%@\" - alias match with %u / %u tokens matched.";
LABEL_60:
    v147 = v99;
    v148 = 34;
    goto LABEL_64;
  }
  if (v122)
  {
    v99 = v121;
    objc_msgSend_spanValue(v9, v123, v124);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend_matchedAliasCount(v13, v125, v126);
    v130 = objc_msgSend_maxAliasCount(v13, v128, v129);
    *(_DWORD *)buf = 136315907;
    v167 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
    v168 = 2117;
    v169 = (uint64_t)v102;
    v170 = 1024;
    LODWORD(v171[0]) = v127;
    WORD2(v171[0]) = 1024;
    *(_DWORD *)((char *)v171 + 6) = v130;
    v103 = "%s Rejecting candidate with value: \"%{sensitive}@\" - alias match with %u / %u tokens matched.";
    goto LABEL_60;
  }
LABEL_31:
  v94 = 0;
LABEL_32:

  return v94;
}

- (id)_rankerPolicyForGroupKey:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = sub_24630758C(v4);
  if (v5 > 36433)
  {
    if (v5 <= 61351)
    {
      if (v5 != 36434)
      {
        v6 = 49066;
        goto LABEL_18;
      }
    }
    else if (v5 != 61352)
    {
      if (v5 != 61509)
      {
        v6 = 63369;
        goto LABEL_18;
      }
      goto LABEL_21;
    }
LABEL_19:
    v8 = 16;
    goto LABEL_23;
  }
  if (v5 > 18539)
  {
    if (v5 != 18540)
    {
      if (v5 != 19668)
      {
        if (v5 != 27122)
          goto LABEL_22;
        v5 = sub_2463075DC(v4);
        v6 = (unsigned __int16)*MEMORY[0x24BE15620];
LABEL_18:
        if (v5 == v6)
          goto LABEL_19;
LABEL_22:
        v8 = 24;
        goto LABEL_23;
      }
      if (sub_2463075DC(v4) != (unsigned __int16)*MEMORY[0x24BE15620])
        goto LABEL_22;
LABEL_21:
      v8 = 32;
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  if (v5 == 800)
    goto LABEL_19;
  if (v5 != 7690)
    goto LABEL_22;
  v7 = sub_2463075DC(v4);
  v8 = 32;
  if (v7 == 7705)
    v8 = 40;
LABEL_23:
  v9 = *(id *)((char *)&self->super.isa + v8);

  return v9;
}

- (SEMSpanMatchPolicy)fuzzyPolicy
{
  return self->_fuzzyPolicy;
}

- (SEMSpanMatchPolicy)exactPolicy
{
  return self->_exactPolicy;
}

- (SEMSpanMatchPolicy)fuzzyWithAliasPolicy
{
  return self->_fuzzyWithAliasPolicy;
}

- (SEMSpanMatchPolicy)exactWithAliasPolicy
{
  return self->_exactWithAliasPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exactWithAliasPolicy, 0);
  objc_storeStrong((id *)&self->_fuzzyWithAliasPolicy, 0);
  objc_storeStrong((id *)&self->_exactPolicy, 0);
  objc_storeStrong((id *)&self->_fuzzyPolicy, 0);
}

@end
