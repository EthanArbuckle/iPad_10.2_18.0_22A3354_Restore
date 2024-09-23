@implementation PGMemoryQualityQuestionFactory

- (unsigned)questionType
{
  return 11;
}

- (int64_t)questionOptions
{
  return 1024;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  double Current;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  unint64_t v38;
  void *v39;
  void *v40;
  unint64_t v41;
  double v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  double v49;
  void *v50;
  PGMemoryQualityQuestion *v51;
  unint64_t v52;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  PGMemoryQualityQuestionFactory *v58;
  void *v59;
  void (**v60)(void *, _BYTE *, double);
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  char v65;
  _QWORD v66[2];
  _QWORD v67[4];
  uint8_t v68[128];
  uint8_t buf[4];
  int v70;
  __int16 v71;
  const char *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v60 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  if (v60)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = 0.0;
    if (Current >= 0.01)
    {
      v8 = Current;
      v65 = 0;
      v60[2](v60, &v65, 0.0);
      if (v65)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
LABEL_28:
          v20 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_58;
        }
        *(_DWORD *)buf = 67109378;
        v70 = 38;
        v71 = 2080;
        v72 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/MemoryQuality/PGMemoryQualityQuestionFactory.m";
        v9 = MEMORY[0x1E0C81028];
LABEL_27:
        _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_28;
      }
      v7 = v8;
    }
    if (!a3)
    {
      if (CFAbsoluteTimeGetCurrent() - v7 < 0.01)
        goto LABEL_28;
      v65 = 0;
      v60[2](v60, &v65, 1.0);
      if (!v65 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_28;
      *(_DWORD *)buf = 67109378;
      v70 = 42;
      v71 = 2080;
      v72 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/MemoryQuality/PGMemoryQualityQuestionFactory.m";
      v9 = MEMORY[0x1E0C81028];
      goto LABEL_27;
    }
  }
  else
  {
    v7 = 0.0;
    if (!a3)
      goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyQuestionFactory fetchExistingQuestions](self, "fetchExistingQuestions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v62 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "entityIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    }
    while (v15);
  }

  if (v60)
  {
    v19 = CFAbsoluteTimeGetCurrent();
    if (v19 - v7 >= 0.01)
    {
      v65 = 0;
      v60[2](v60, &v65, 0.25);
      if (v65)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v70 = 55;
          v71 = 2080;
          v72 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questi"
                "ons/Survey/MemoryQuality/PGMemoryQualityQuestionFactory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v20 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_57;
      }
      v7 = v19;
    }
  }
  v57 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dateByAddingTimeInterval:", -31557600.0);
  v22 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (uuid IN %@)"), v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v23;
  v56 = (void *)v22;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate >= %@"), v22);
  v58 = self;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v24;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curatedAssets.@count >= %d"), 13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v25;
  v26 = (void *)MEMORY[0x1E0CD1630];
  objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithFormat:", CFSTR("userCreated == NO"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "fetchPredicateFromUserCreatedComparisonPredicate:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v67[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 4);
  v29 = objc_claimAutoreleasedReturnValue();

  -[PGSurveyQuestionFactory workingContext](v58, "workingContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "photoLibrary");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "librarySpecificFetchOptions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = (void *)v29;
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v29);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setInternalPredicate:", v33);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v34;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setSortDescriptors:", v36);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v32);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v37 = CFAbsoluteTimeGetCurrent();
    v38 = v57;
    if (v37 - v7 >= 0.01)
    {
      v65 = 0;
      v60[2](v60, &v65, 0.5);
      if (v65)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v70 = 67;
          v71 = 2080;
          v72 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questi"
                "ons/Survey/MemoryQuality/PGMemoryQualityQuestionFactory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v20 = (void *)MEMORY[0x1E0C9AA60];
        v40 = v55;
        v39 = v56;
        goto LABEL_56;
      }
      v7 = v37;
    }
  }
  else
  {
    v38 = v57;
  }
  v54 = v32;
  v41 = objc_msgSend(v59, "count");
  v42 = (double)v38;
  v43 = vcvtmd_u64_f64((double)v41 / (double)v38);
  if (v43 <= 1)
    v44 = 1;
  else
    v44 = v43;
  if (!v41)
  {
LABEL_49:
    v40 = v55;
    v39 = v56;
    v32 = v54;
    if (v60 && CFAbsoluteTimeGetCurrent() - v7 >= 0.01 && (v65 = 0, v60[2](v60, &v65, 1.0), v65))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v70 = 86;
        v71 = 2080;
        v72 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/MemoryQuality/PGMemoryQualityQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v20 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(v10, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_56;
  }
  v45 = v41;
  v46 = 0;
  while (1)
  {
    v47 = objc_msgSend(v10, "count");
    if (!v60)
      goto LABEL_47;
    v48 = v47;
    v49 = CFAbsoluteTimeGetCurrent();
    if (v49 - v7 < 0.01)
      goto LABEL_47;
    v65 = 0;
    v60[2](v60, &v65, (double)v48 * 0.5 / v42 + 0.5);
    if (v65)
      break;
    v7 = v49;
LABEL_47:
    objc_msgSend(v59, "objectAtIndexedSubscript:", v46);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[PGMemoryQualityQuestion initWithMemory:localFactoryScore:]([PGMemoryQualityQuestion alloc], "initWithMemory:localFactoryScore:", v50, 1.0);
    objc_msgSend(v10, "addObject:", v51);
    v52 = objc_msgSend(v10, "count");

    if (v52 < v57)
    {
      v46 += v44;
      if (v46 < v45)
        continue;
    }
    goto LABEL_49;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v70 = 75;
    v71 = 2080;
    v72 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/MemoryQuality/PGMemoryQualityQuestionFactory.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v20 = (void *)MEMORY[0x1E0C9AA60];
  v40 = v55;
  v39 = v56;
  v32 = v54;
LABEL_56:

LABEL_57:
LABEL_58:

  return v20;
}

@end
