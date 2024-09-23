@implementation PGMeaningDurationCriteria

+ (id)criteriaKey
{
  return CFSTR("Duration");
}

+ (id)criteriaWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumDuration:", objc_msgSend(v6, "unsignedIntegerValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeRoutineVisitsInDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIncludeRoutineVisitsInDuration:", objc_msgSend(v7, "BOOLValue"));
  return v5;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  double v15;
  BOOL v16;
  double v17;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v7 = a4;
  if (-[PGMeaningDurationCriteria minimumDuration](self, "minimumDuration"))
  {
    if (-[PGMeaningDurationCriteria includeRoutineVisitsInDuration](self, "includeRoutineVisitsInDuration"))
    {
      objc_msgSend(v6, "universalStartDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "universalEndDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v9);
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__12335;
      v33 = __Block_byref_object_dispose__12336;
      v11 = v8;
      v34 = v11;
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__12335;
      v27 = __Block_byref_object_dispose__12336;
      v12 = v9;
      v28 = v12;
      objc_msgSend(v7, "preciseAddressNodes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __65__PGMeaningDurationCriteria_passesForMomentNode_momentNodeCache___block_invoke;
      v19[3] = &unk_1E84292C8;
      v19[4] = self;
      v14 = v10;
      v20 = v14;
      v21 = &v29;
      v22 = &v23;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);
      objc_msgSend((id)v24[5], "timeIntervalSinceDate:", v30[5]);
      v16 = v15 >= (double)-[PGMeaningDurationCriteria minimumDuration](self, "minimumDuration");

      _Block_object_dispose(&v23, 8);
      _Block_object_dispose(&v29, 8);

    }
    else
    {
      objc_msgSend(v6, "universalEndDate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "universalStartDate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v12);
      v16 = v17 >= (double)-[PGMeaningDurationCriteria minimumDuration](self, "minimumDuration");
    }

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)isValid
{
  return 1;
}

- (void)setServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_serviceManager, a3);
}

- (NSString)description
{
  void *v3;
  _BOOL4 v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumDuration: %d\n"), -[PGMeaningDurationCriteria minimumDuration](self, "minimumDuration"));
  v4 = -[PGMeaningDurationCriteria includeRoutineVisitsInDuration](self, "includeRoutineVisitsInDuration");
  v5 = CFSTR("NO");
  if (v4)
    v5 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("includeRoutineVisitsInDuration: %@\n"), v5);
  return (NSString *)v3;
}

- (unint64_t)minimumDuration
{
  return self->_minimumDuration;
}

- (void)setMinimumDuration:(unint64_t)a3
{
  self->_minimumDuration = a3;
}

- (BOOL)includeRoutineVisitsInDuration
{
  return self->_includeRoutineVisitsInDuration;
}

- (void)setIncludeRoutineVisitsInDuration:(BOOL)a3
{
  self->_includeRoutineVisitsInDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
}

void __65__PGMeaningDurationCriteria_passesForMomentNode_momentNodeCache___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "fetchLocationOfInterestVisitsAtLocation:inDateInterval:", v3, a1[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "visitInterval");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "startDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "endDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "earlierDate:", v10);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(a1[6] + 8);
          v14 = *(void **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = v12;

          objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "laterDate:", v11);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = *(_QWORD *)(a1[7] + 8);
          v17 = *(void **)(v16 + 40);
          *(_QWORD *)(v16 + 40) = v15;

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

  }
}

@end
