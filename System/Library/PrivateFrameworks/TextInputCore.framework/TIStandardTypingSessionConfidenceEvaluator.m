@implementation TIStandardTypingSessionConfidenceEvaluator

+ (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  int v23;
  int v24;
  int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(a3, "userActionHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v27;
    v12 = 2;
    do
    {
      v13 = 0;
      v23 = v8;
      v24 = -v8;
      do
      {
        v14 = v9;
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v5);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        switch(objc_msgSend(v15, "actionType"))
        {
          case 0u:
            v16 = (v10 & 1) == 0;
            v10 = 0;
            goto LABEL_12;
          case 1u:
            v10 = 0;
            v16 = objc_msgSend(v14, "actionType") == 0;
LABEL_12:
            if (!v16)
              v12 = 1;
            break;
          case 2u:
            objc_msgSend(v15, "documentState");
            v25 = v10;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "contextAfterInput");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v4;
            v20 = v5;
            v21 = v18 != 0;

            v10 = v21 | v25;
            v5 = v20;
            v4 = v19;
            break;
          case 3u:
            if (v24 != (_DWORD)v13)
              v12 = 0;
            break;
          case 4u:
          case 7u:
          case 8u:
          case 9u:
          case 0xAu:
          case 0xBu:
            break;
          case 6u:
            v10 = 1;
            break;
          case 0xCu:
            v12 = 1;
            break;
          default:
            v12 = 0;
            break;
        }
        v9 = v15;

        ++v13;
      }
      while (v7 != v13);
      v8 = v23 + v7;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);

  }
  else
  {
    v12 = 2;
  }

  return v12;
}

+ (double)calculateAlignedTypingSessionConfidence:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(v3, "alignedEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__TIStandardTypingSessionConfidenceEvaluator_calculateAlignedTypingSessionConfidence___block_invoke;
  v11[3] = &unk_1EA0FC768;
  v11[4] = &v12;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);

  objc_msgSend(v3, "alignedEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (double)(unint64_t)v13[3];
    objc_msgSend(v3, "alignedEntries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 / ((double)(unint64_t)objc_msgSend(v8, "count") * 3.0);

  }
  else
  {
    v9 = 1.0;
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __86__TIStandardTypingSessionConfidenceEvaluator_calculateAlignedTypingSessionConfidence___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "inSessionAlignmentConfidence");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

@end
