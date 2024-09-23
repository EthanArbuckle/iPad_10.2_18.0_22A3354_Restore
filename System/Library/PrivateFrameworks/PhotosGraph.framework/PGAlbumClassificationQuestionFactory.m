@implementation PGAlbumClassificationQuestionFactory

- (unsigned)questionType
{
  return 24;
}

- (int64_t)questionOptions
{
  return 0x400000;
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
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  PGAlbumClassificationQuestion *v20;
  void *v21;
  PGAlbumClassificationQuestion *v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  void *v26;
  id obj;
  void (**v29)(void *, _BYTE *, double);
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  char v34;
  uint8_t v35[128];
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v29 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  if (v29)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = 0.0;
    if (Current >= 0.01)
    {
      v8 = Current;
      v34 = 0;
      v29[2](v29, &v34, 0.0);
      if (v34)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
LABEL_38:
          v26 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_39;
        }
        *(_DWORD *)buf = 67109378;
        v37 = 33;
        v38 = 2080;
        v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/AlbumClassification/PGAlbumClassificationQuestionFactory.m";
        v9 = MEMORY[0x1E0C81028];
LABEL_37:
        _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_38;
      }
      v7 = v8;
    }
    if (!a3)
    {
      if (CFAbsoluteTimeGetCurrent() - v7 < 0.01)
        goto LABEL_38;
      v34 = 0;
      v29[2](v29, &v34, 1.0);
      if (!v34 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_38;
      *(_DWORD *)buf = 67109378;
      v37 = 36;
      v38 = 2080;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/AlbumClassification/PGAlbumClassificationQuestionFactory.m";
      v9 = MEMORY[0x1E0C81028];
      goto LABEL_37;
    }
  }
  else
  {
    v7 = 0.0;
    if (!a3)
      goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("estimatedAssetCount > 0"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v14);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 1, 2, v13);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v20 = [PGAlbumClassificationQuestion alloc];
        objc_msgSend(v19, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[PGAlbumClassificationQuestion initWithAlbumUUID:localFactoryScore:](v20, "initWithAlbumUUID:localFactoryScore:", v21, 1.0);

        if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](self, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v22, v10))
        {
          objc_msgSend(v10, "addObject:", v22);
          v23 = objc_msgSend(v10, "count");
          if (v29)
          {
            v24 = v23;
            v25 = CFAbsoluteTimeGetCurrent();
            if (v25 - v7 >= 0.01)
            {
              v34 = 0;
              v29[2](v29, &v34, (double)(v24 / a3));
              if (v34)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  v37 = 50;
                  v38 = 2080;
                  v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Questions/Survey/AlbumClassification/PGAlbumClassificationQuestionFactory.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                v26 = (void *)MEMORY[0x1E0C9AA60];
                goto LABEL_32;
              }
              v7 = v25;
            }
          }
          if (objc_msgSend(v10, "count") >= a3)
          {

            goto LABEL_25;
          }
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_25:

  if (v29 && CFAbsoluteTimeGetCurrent() - v7 >= 0.01 && (v34 = 0, v29[2](v29, &v34, 1.0), v34))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v37 = 57;
      v38 = 2080;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/AlbumClassification/PGAlbumClassificationQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v26 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v10, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_32:

LABEL_39:
  return v26;
}

@end
