@implementation NSArray(VMUAnalyzerSummary)

- (unint64_t)longestKeyLength
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = a1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v2);
        v8 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v8, "key", (_QWORD)v16);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 == kVMUAnalysisSummaryKey[0])
        {

        }
        else
        {
          objc_msgSend(v8, "key");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v12 = kVMUAnalysisDataKey[0];

          if (v11 != v12)
          {
            objc_msgSend(v8, "key");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "length");

            if (v14 > v5)
              v5 = v14;
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
