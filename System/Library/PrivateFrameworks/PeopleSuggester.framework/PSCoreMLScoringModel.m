@implementation PSCoreMLScoringModel

id __49___PSCoreMLScoringModel_featureOrderFromMetadata__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _WORD *v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;
  void *memptr;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  if (v3 && (v4 = v3, objc_msgSend(v2, "characterAtIndex:", 0) - 97 <= 0x19))
  {
    v5 = (2 * v4) | 1;
    memptr = 0;
    v13 = 0;
    if (v5 > 0x200)
    {
      v9 = malloc_type_posix_memalign(&memptr, 8uLL, 2 * v4, 0x1000040BDFB0063uLL);
      LOBYTE(v13) = 0;
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v10);
      }
      v6 = memptr;
    }
    else
    {
      v6 = (_WORD *)((char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
      bzero(v6, (2 * v4) | 1);
    }
    objc_msgSend(v2, "getCharacters:", v6);
    *v6 -= 32;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v6, v4);

    if (v5 >= 0x201)
      free(v6);
  }
  else
  {
    v7 = v2;
  }
  return v7;
}

void __90___PSCoreMLScoringModel_reformatCandidateDictionaryIntoFeatureTensor_candidateList_error___block_invoke(uint64_t a1, char *a2, size_t a3, void *a4)
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id obj;
  uint64_t v25;
  char *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v26 = a2;
  bzero(a2, a3);
  objc_msgSend(v7, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 80));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  v23 = v7;
  objc_msgSend(v7, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 80) + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = *(id *)(a1 + 32);
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v12)
  {
    v13 = v12;
    v25 = v11;
    v14 = a2;
    v15 = &a2[a3];
    v16 = *(_QWORD *)v38;
    v17 = 4 * v9;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __90___PSCoreMLScoringModel_reformatCandidateDictionaryIntoFeatureTensor_candidateList_error___block_invoke_2;
        v27[3] = &unk_1E4402050;
        v28 = v20;
        v21 = *(void **)(a1 + 48);
        v29 = *(id *)(a1 + 56);
        v33 = v14;
        v34 = v25;
        v35 = v15;
        v36 = v26;
        v30 = *(id *)(a1 + 64);
        v31 = *(id *)(a1 + 72);
        v32 = v19;
        v22 = v20;
        objc_msgSend(v21, "enumerateObjectsUsingBlock:", v27);

        v14 += v17;
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v13);
  }

}

void __90___PSCoreMLScoringModel_reformatCandidateDictionaryIntoFeatureTensor_candidateList_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  const __CFNumber *v6;
  double v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (const __CFNumber *)objc_claimAutoreleasedReturnValue();
  if ((v6
     || (objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5),
         (v6 = (const __CFNumber *)objc_claimAutoreleasedReturnValue()) != 0))
    && (-[__CFNumber doubleValue](v6, "doubleValue"), fabs(v7) != INFINITY))
  {
    v8 = (void *)(*(_QWORD *)(a1 + 72) + 4 * *(_QWORD *)(a1 + 80) * a3);
    if ((unint64_t)v8 > *(_QWORD *)(a1 + 88) - 4)
    {
      v13 = *(_QWORD *)(a1 + 72) + 4 * *(_QWORD *)(a1 + 80) * a3;
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v11 = *(_QWORD *)(a1 + 88);
        v10 = *(_QWORD *)(a1 + 96);
        v12 = *(_QWORD *)(a1 + 80);
        *(_DWORD *)buf = 134219266;
        v15 = v13;
        v16 = 2048;
        v17 = v10;
        v18 = 2048;
        v19 = v11;
        v20 = 2114;
        v21 = v5;
        v22 = 2048;
        v23 = a3;
        v24 = 2048;
        v25 = v12;
        _os_log_fault_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_FAULT, "Pointer %p out of range %p - %p (featureName=%{public}@, featureIdx=%tu, colStride=%tu)", buf, 0x3Eu);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        abort();
    }
    else
    {
      CFNumberGetValue(v6, kCFNumberFloat32Type, v8);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 64));
  }

}

id __56___PSCoreMLScoringModel_scoreCandidatesWithCoreMLModel___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  +[_PSCandidate selfCandidate](_PSCandidate, "selfCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", v3))
    v4 = 0;
  else
    v4 = v2;
  v5 = v4;

  return v5;
}

void __56___PSCoreMLScoringModel_scoreCandidatesWithCoreMLModel___block_invoke_108(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __58___PSCoreMLScoringModel_batchPredictWithFeatureDictArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v8, a3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", &unk_1E442D068, a3);
  }

}

uint64_t __147___PSCoreMLScoringModel_getSuggestionProxiesForCandidateToFeatureVectorDictGetter_predictionContext_messageInteractionCache_shareInteractionCache___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

@end
