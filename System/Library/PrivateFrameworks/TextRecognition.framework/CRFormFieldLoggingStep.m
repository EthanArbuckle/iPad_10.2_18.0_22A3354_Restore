@implementation CRFormFieldLoggingStep

- (void)_logField:(id)a3 index:(unint64_t)a4 subIndex:(unint64_t)a5
{
  id v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  __CFString *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "fieldType") == 1)
  {
    +[CRFormContentTypeUtilities shortStringFromContentType:](CRFormContentTypeUtilities, "shortStringFromContentType:", objc_msgSend(v7, "textContentType"));
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestedLineHeight");
    v10 = v9;
    v11 = objc_msgSend(v7, "maxCharacterCount");
  }
  else
  {
    v11 = 0;
    v8 = &stru_1E98DC948;
    v10 = 0;
  }
  v38 = (__CFString *)v8;
  CRCastAsClass<CRFormFieldOutputRegion>(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = &stru_1E98DC948;
  if (v12)
  {
    v15 = objc_msgSend(v12, "indexInGlobalOrder");
    objc_msgSend(v13, "labelRegion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v17, "length");

    objc_msgSend(v13, "labelRegion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "text");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (__CFString *)v19;
    else
      v21 = &stru_1E98DC948;
    v14 = v21;

  }
  else
  {
    v37 = 0;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v22 = v15;
  if (a5)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu-%lu"), a4, a5);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v11;
  CROSLogForCategory(6);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "boundingQuad");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "topLeft");
    v27 = v26;
    objc_msgSend(v7, "boundingQuad");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topLeft");
    v29 = v28;
    objc_msgSend(v7, "boundingQuad");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "size");
    v32 = v31;
    objc_msgSend(v7, "boundingQuad");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "size");
    *(_DWORD *)buf = 138415363;
    v40 = v23;
    v41 = 2048;
    v42 = v27;
    v43 = 2048;
    v44 = v29;
    v45 = 2048;
    v46 = v32;
    v47 = 2048;
    v48 = v34;
    v49 = 2048;
    v50 = objc_msgSend(v7, "fieldType");
    v51 = 2048;
    v52 = objc_msgSend(v7, "fieldSource");
    v53 = 2113;
    v54 = v38;
    v55 = 2117;
    v56 = v14;
    v57 = 2048;
    v58 = v37;
    v59 = 2048;
    v60 = v22;
    v61 = 2048;
    v62 = v10;
    v63 = 2048;
    v64 = v24;
    _os_log_impl(&dword_1D4FB8000, v25, OS_LOG_TYPE_DEBUG, "Final result #%@ x:%5.3f y:%5.3f w:%5.3f h:%5.3f type:%lu source:%lu contentType:%{private}@ label:'%{sensitive}@' labelLength:%lu globalOrder:%ld lineHeight:%5.3f charCount:%lu.", buf, 0x84u);

  }
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  id v39;
  id v40;
  uint64_t v41;
  id obj;
  id obja;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  void *v58;
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v8 = a4;
  CROSLogForCategory(6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

  if (v10)
  {
    v39 = v8;
    CROSLogForCategory(6);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v61 = objc_msgSend(v40, "count");
      _os_log_impl(&dword_1D4FB8000, v11, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldLoggingStep is running (#input:%lu).", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v8);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v40;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v54 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          CROSLogForCategory(6);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = objc_msgSend(v15, "indexInGlobalOrder");
            v18 = objc_msgSend(v44, "count");
            v19 = objc_msgSend(v15, "fieldSource");
            objc_msgSend(v15, "debugDescription");
            v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v21 = objc_msgSend(v20, "UTF8String");
            *(_DWORD *)buf = 134218754;
            v61 = v17;
            v62 = 2048;
            v63 = v18;
            v64 = 2048;
            v65 = v19;
            v66 = 2080;
            v67 = v21;
            _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_DEBUG, "Inserting field with index %ld in array with size %ld: source %ld, %s", buf, 0x2Au);

          }
          objc_msgSend(v44, "insertObject:atIndex:", v15, objc_msgSend(v15, "indexInGlobalOrder"));
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
      }
      while (v12);
    }

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obja = v44;
    v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v22)
    {
      v23 = 0;
      v41 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v50 != v41)
            objc_enumerationMutation(obja);
          v58 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          v25 = v58;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1, v39);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          CRCastAsClass<CRFormFieldOutputRegion>(v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            objc_msgSend(v27, "formFieldRegions");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "count") == 0;

            if (!v30)
            {
              objc_msgSend(v28, "formFieldRegions");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "arrayByAddingObjectsFromArray:", v31);
              v32 = objc_claimAutoreleasedReturnValue();

              v26 = (void *)v32;
            }
          }
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v33 = v26;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          if (v34)
          {
            v35 = 0;
            v36 = *(_QWORD *)v46;
            do
            {
              for (k = 0; k != v34; ++k)
              {
                if (*(_QWORD *)v46 != v36)
                  objc_enumerationMutation(v33);
                -[CRFormFieldLoggingStep _logField:index:subIndex:](self, "_logField:index:subIndex:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k), v23, v35 + k);
              }
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
              v35 += k;
            }
            while (v34);
          }

          ++v23;
        }
        v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      }
      while (v22);
    }

    v8 = v39;
  }

  return v40;
}

@end
