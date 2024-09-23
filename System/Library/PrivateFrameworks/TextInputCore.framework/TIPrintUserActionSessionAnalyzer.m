@implementation TIPrintUserActionSessionAnalyzer

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return 2;
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  v30 = v6;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v6, "userActionHistory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v32;
LABEL_3:
    v12 = 0;
    while (2)
    {
      if (*(_QWORD *)v32 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
      objc_msgSend(v13, "documentState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contextBeforeInput");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      printf("%s: ", (const char *)objc_msgSend(v15, "UTF8String"));

      switch(objc_msgSend(v13, "actionType"))
      {
        case 0u:
          v16 = v13;

          objc_msgSend(v16, "originalCandidate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v16, "originalCandidate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isContinuousPathConversion");

            objc_msgSend(v16, "originalAcceptedString");
            v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v20, "UTF8String");
            objc_msgSend(v16, "acceptedString");
            v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v21, "UTF8String");
            if (v19)
              printf("{%s}<-PB-%s-\n");
            else
              printf("[%s]<-PB-%s-\n");

          }
          else
          {
            objc_msgSend(v16, "acceptedCandidate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isContinuousPathConversion");

            objc_msgSend(v16, "acceptedString");
            v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v27, "UTF8String");
            if (v26)
              printf("{%s}\n");
            else
              printf("[%s]\n");

          }
          v10 = v16;
          goto LABEL_24;
        case 1u:
          v22 = "<-DEL-";
          goto LABEL_16;
        case 2u:
          puts("CM");
          objc_msgSend(v13, "documentState");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "contextAfterInput");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
            puts("MOVEMENT FOUND");
          goto LABEL_24;
        case 3u:
          v22 = "DOC STATE CHANGE";
          goto LABEL_16;
        case 4u:
          v22 = "PATH";
          goto LABEL_16;
        default:
          v22 = "OTHER";
LABEL_16:
          puts(v22);
LABEL_24:
          if (v9 != ++v12)
            continue;
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (!v9)
            goto LABEL_28;
          goto LABEL_3;
      }
    }
  }
  v10 = 0;
LABEL_28:

  return 1;
}

@end
