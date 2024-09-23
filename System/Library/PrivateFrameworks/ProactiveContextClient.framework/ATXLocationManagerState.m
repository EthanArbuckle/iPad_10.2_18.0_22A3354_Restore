@implementation ATXLocationManagerState

- (ATXLocationManagerState)init
{
  ATXLocationManagerState *v2;
  ATXLocationManagerState *v3;
  ATXLocationOfInterest *previousLOI;
  ATXLocationOfInterest *currentLOI;
  NSArray *predictedNextLOIs;
  NSArray *predictedExitTimes;
  uint64_t v8;
  NSDate *lastUpdateDate;
  uint64_t v10;
  ATXLocationManagerKnownLOIs *locationsOfInterest;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ATXLocationManagerState;
  v2 = -[ATXLocationManagerState init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    previousLOI = v2->_previousLOI;
    v2->_previousLOI = 0;

    currentLOI = v3->_currentLOI;
    v3->_currentLOI = 0;

    predictedNextLOIs = v3->_predictedNextLOIs;
    v3->_predictedNextLOIs = 0;

    predictedExitTimes = v3->_predictedExitTimes;
    v3->_predictedExitTimes = 0;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = objc_claimAutoreleasedReturnValue();
    lastUpdateDate = v3->_lastUpdateDate;
    v3->_lastUpdateDate = (NSDate *)v8;

    v10 = objc_opt_new();
    locationsOfInterest = v3->_locationsOfInterest;
    v3->_locationsOfInterest = (ATXLocationManagerKnownLOIs *)v10;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ATXLocationOfInterest *currentLOI;
  id v5;

  currentLOI = self->_currentLOI;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", currentLOI, CFSTR("currentLOI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previousLOI, CFSTR("previousLOI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdateDate, CFSTR("lastUpdateDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_predictedNextLOIs, CFSTR("predictedNextLOIs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_predictedExitTimes, CFSTR("predictedExitTimes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locationsOfInterest, CFSTR("locationsOfInterest"));

}

- (ATXLocationManagerState)initWithCoder:(id)a3
{
  id v4;
  ATXLocationManagerState *v5;
  uint64_t v6;
  ATXLocationOfInterest *currentLOI;
  uint64_t v8;
  ATXLocationOfInterest *previousLOI;
  uint64_t v10;
  NSDate *lastUpdateDate;
  uint64_t v12;
  ATXLocationManagerKnownLOIs *locationsOfInterest;
  uint64_t v14;
  ATXLocationManagerKnownLOIs *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *predictedNextLOIs;
  uint64_t v24;
  NSArray *predictedExitTimes;
  objc_super v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ATXLocationManagerState;
  v5 = -[ATXLocationManagerState init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentLOI"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentLOI = v5->_currentLOI;
    v5->_currentLOI = (ATXLocationOfInterest *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousLOI"));
    v8 = objc_claimAutoreleasedReturnValue();
    previousLOI = v5->_previousLOI;
    v5->_previousLOI = (ATXLocationOfInterest *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdateDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastUpdateDate = v5->_lastUpdateDate;
    v5->_lastUpdateDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationsOfInterest"));
    v12 = objc_claimAutoreleasedReturnValue();
    locationsOfInterest = v5->_locationsOfInterest;
    v5->_locationsOfInterest = (ATXLocationManagerKnownLOIs *)v12;

    if (!v5->_locationsOfInterest)
    {
      v14 = objc_opt_new();
      v15 = v5->_locationsOfInterest;
      v5->_locationsOfInterest = (ATXLocationManagerKnownLOIs *)v14;

    }
    v16 = (void *)MEMORY[0x1E0C99E60];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("predictedNextLOIs"));
    v22 = objc_claimAutoreleasedReturnValue();
    predictedNextLOIs = v5->_predictedNextLOIs;
    v5->_predictedNextLOIs = (NSArray *)v22;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("predictedExitTimes"));
    v24 = objc_claimAutoreleasedReturnValue();
    predictedExitTimes = v5->_predictedExitTimes;
    v5->_predictedExitTimes = (NSArray *)v24;

  }
  return v5;
}

+ (id)merge:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  id v49;
  void (**v50)(_QWORD, _QWORD);
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  _QWORD *v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[4];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "lastUpdateDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastUpdateDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "earlierDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastUpdateDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToDate:", v10);

  if (v11)
    v12 = v5;
  else
    v12 = v6;
  if (v11)
    v13 = v6;
  else
    v13 = v5;
  v51 = v13;
  v14 = (void *)objc_opt_new();
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy_;
  v59[4] = __Block_byref_object_dispose_;
  v60 = 0;
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __38__ATXLocationManagerState_merge_with___block_invoke;
  v56[3] = &unk_1E942DAC8;
  v58 = v59;
  v49 = v14;
  v57 = v49;
  v50 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8244A3C](v56);
  objc_msgSend(v51, "previousLOI");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v50)[2](v50, v15);

  objc_msgSend(v51, "currentLOI");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v50)[2](v50, v16);

  objc_msgSend(v12, "previousLOI");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v50)[2](v50, v17);

  objc_msgSend(v12, "currentLOI");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v50)[2](v50, v18);

  v19 = (void *)objc_opt_new();
  if (objc_msgSend(v49, "count"))
  {
    objc_msgSend(v12, "currentLOI");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 == 0;

    if (!v21)
    {
      objc_msgSend(v49, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCurrentLOI:", v22);

      objc_msgSend(v49, "removeLastObject");
    }
  }
  if (objc_msgSend(v49, "count"))
  {
    objc_msgSend(v49, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPreviousLOI:", v23);

  }
  objc_msgSend(v12, "predictedNextLOIs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    objc_msgSend(v12, "predictedNextLOIs");
  else
    objc_msgSend(v51, "predictedNextLOIs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPredictedNextLOIs:", v25);

  objc_msgSend(v12, "predictedExitTimes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    objc_msgSend(v12, "predictedExitTimes");
  else
    objc_msgSend(v51, "predictedExitTimes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPredictedExitTimes:", v27);

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v61[0] = CFSTR("Home");
  v61[1] = CFSTR("Work");
  v61[2] = CFSTR("School");
  v61[3] = CFSTR("Gym");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v53 != v30)
          objc_enumerationMutation(v28);
        v32 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v12, "locationsOfInterest");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "valueForKey:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "locationsOfInterest");
        if (v34)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "locationsOfInterest");
        }
        else
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "locationsOfInterest");
        }
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "valueForKey:", v32);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setValue:forKey:", v37, v32);

      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v29);
  }

  objc_msgSend(v19, "currentLOI");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "currentLOI");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 != v39)
    goto LABEL_35;
  objc_msgSend(v19, "previousLOI");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "previousLOI");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40 != v41)
  {
LABEL_34:

    v39 = v38;
LABEL_35:

    goto LABEL_36;
  }
  objc_msgSend(v19, "predictedNextLOIs");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "predictedNextLOIs");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!arraysAreEqual(v42, v43))
  {

    v41 = v40;
    goto LABEL_34;
  }
  objc_msgSend(v19, "predictedExitTimes");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "predictedExitTimes");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = arraysAreEqual(v44, v45);

  if (!v46)
  {
LABEL_36:
    objc_msgSend(v12, "lastUpdateDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLastUpdateDate:", v47);
    goto LABEL_37;
  }
  objc_msgSend(v51, "lastUpdateDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLastUpdateDate:", v47);
LABEL_37:

  _Block_object_dispose(v59, 8);
  return v19;
}

void __38__ATXLocationManagerState_merge_with___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a2)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v4 = a2;
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v3, "isEqual:", v5);

    if ((_DWORD)v3)
      objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    objc_msgSend(v4, "uuid");
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (void)expirePreviousLOIBefore:(id)a3
{
  void *v4;
  int v5;
  ATXLocationOfInterest *previousLOI;

  -[NSDate earlierDate:](self->_lastUpdateDate, "earlierDate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToDate:", self->_lastUpdateDate);

  if (v5)
  {
    previousLOI = self->_previousLOI;
    self->_previousLOI = 0;

  }
}

- (CLLocation)homeLOI
{
  ATXLocationManagerKnownLOIs *locationsOfInterest;

  locationsOfInterest = self->_locationsOfInterest;
  if (locationsOfInterest)
    return locationsOfInterest->Home;
  else
    return (CLLocation *)0;
}

- (CLLocation)workLOI
{
  ATXLocationManagerKnownLOIs *locationsOfInterest;

  locationsOfInterest = self->_locationsOfInterest;
  if (locationsOfInterest)
    return locationsOfInterest->Work;
  else
    return (CLLocation *)0;
}

- (CLLocation)schoolLOI
{
  ATXLocationManagerKnownLOIs *locationsOfInterest;

  locationsOfInterest = self->_locationsOfInterest;
  if (locationsOfInterest)
    return locationsOfInterest->School;
  else
    return (CLLocation *)0;
}

- (CLLocation)gymLOI
{
  ATXLocationManagerKnownLOIs *locationsOfInterest;

  locationsOfInterest = self->_locationsOfInterest;
  if (locationsOfInterest)
    return locationsOfInterest->Gym;
  else
    return (CLLocation *)0;
}

- (ATXLocationOfInterest)currentLOI
{
  return self->_currentLOI;
}

- (void)setCurrentLOI:(id)a3
{
  objc_storeStrong((id *)&self->_currentLOI, a3);
}

- (ATXLocationOfInterest)previousLOI
{
  return self->_previousLOI;
}

- (void)setPreviousLOI:(id)a3
{
  objc_storeStrong((id *)&self->_previousLOI, a3);
}

- (NSArray)predictedNextLOIs
{
  return self->_predictedNextLOIs;
}

- (void)setPredictedNextLOIs:(id)a3
{
  objc_storeStrong((id *)&self->_predictedNextLOIs, a3);
}

- (NSArray)predictedExitTimes
{
  return self->_predictedExitTimes;
}

- (void)setPredictedExitTimes:(id)a3
{
  objc_storeStrong((id *)&self->_predictedExitTimes, a3);
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdateDate, a3);
}

- (ATXLocationManagerKnownLOIs)locationsOfInterest
{
  return self->_locationsOfInterest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationsOfInterest, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_predictedExitTimes, 0);
  objc_storeStrong((id *)&self->_predictedNextLOIs, 0);
  objc_storeStrong((id *)&self->_previousLOI, 0);
  objc_storeStrong((id *)&self->_currentLOI, 0);
}

@end
