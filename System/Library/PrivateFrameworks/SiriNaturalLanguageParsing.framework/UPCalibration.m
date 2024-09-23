@implementation UPCalibration

- (id)calibrateParserResults:(id)a3 withCalibrationScores:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v24;
    *(_QWORD *)&v11 = 138412290;
    v22 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v15, v22, (_QWORD)v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "doubleValue");
          +[UPCalibration calibrateResult:withCalibrationScore:](UPCalibration, "calibrateResult:withCalibrationScore:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v19, v15);

        }
        else
        {
          SNLPOSLoggerForCategory(3);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v22;
            v28 = v15;
            _os_log_impl(&dword_1C2196000, v20, OS_LOG_TYPE_DEBUG, "No calibration score found for parser result with bundle modelIdentifier: %@", buf, 0xCu);
          }

          objc_msgSend(v8, "setObject:forKey:", v16, v15);
        }

      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v12);
  }

  return v8;
}

+ (id)calibrateResult:(id)a3 withCalibrationScore:(double)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  UPResult *v12;
  void *v13;
  UPResult *v14;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "candidateCount");
  if (v7 >= 1)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v5, "candidateAtRank:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UPCalibration calibrateCandidate:withCalibrationScore:](UPCalibration, "calibrateCandidate:withCalibrationScore:", v10, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v11);

    }
  }
  v12 = [UPResult alloc];
  objc_msgSend(v5, "queryUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UPResult initWithCandidates:queryUUID:](v12, "initWithCandidates:queryUUID:", v6, v13);

  return v14;
}

+ (id)calibrateCandidate:(id)a3 withCalibrationScore:(double)a4
{
  id v5;
  double v6;
  double v7;
  UPResultCandidate *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UPResultCandidate *v17;

  v5 = a3;
  objc_msgSend(v5, "uncalibratedProbability");
  v7 = v6 * a4;
  v8 = [UPResultCandidate alloc];
  objc_msgSend(v5, "uncalibratedProbability");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "utterance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "task");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[UPResultCandidate initWithUncalibratedProbability:calibratedProbability:utterance:intent:entities:modelIdentifier:task:](v8, "initWithUncalibratedProbability:calibratedProbability:utterance:intent:entities:modelIdentifier:task:", v11, v12, v13, v14, v15, v16, v10);
  return v17;
}

@end
