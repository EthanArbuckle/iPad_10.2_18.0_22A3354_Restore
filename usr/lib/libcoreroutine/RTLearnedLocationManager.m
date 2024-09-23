@implementation RTLearnedLocationManager

+ (id)vendedClasses
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)vendedClasses_vendedClasses;
  if (!vendedClasses_vendedClasses)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E60]);
    v4 = objc_opt_class();
    v5 = objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(), 0);
    v6 = (void *)vendedClasses_vendedClasses;
    vendedClasses_vendedClasses = v5;

    v2 = (void *)vendedClasses_vendedClasses;
  }
  return v2;
}

uint64_t __70__RTLearnedLocationManager_fetchLocationOfInterestAtLocation_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationOfInterestAtLocation:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __93__RTLearnedLocationManager__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__RTLearnedLocationManager__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke_2;
  block[3] = &unk_1E9298DC0;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __92__RTLearnedLocationManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationsOfInterestVisitedBetweenStartDate:endDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __74__RTLearnedLocationManager_fetchLocationsOfInterestWithPlaceType_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationsOfInterestWithPlaceType:handler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __93__RTLearnedLocationManager__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __75__RTLearnedLocationManager__fetchLocationsOfInterestWithPlaceType_handler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __87__RTLearnedLocationManager__fetchLocationsOfInterestWithinDistance_ofLocation_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__RTLearnedLocationManager__fetchLocationsOfInterestWithinDistance_ofLocation_handler___block_invoke_2;
  v13[3] = &unk_1E9298DE8;
  v14 = v6;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v18 = v8;
  v15 = v9;
  v19 = *(_QWORD *)(a1 + 56);
  v16 = v10;
  v17 = v5;
  v11 = v5;
  v12 = v6;
  dispatch_async(v7, v13);

}

void __75__RTLearnedLocationManager__fetchLocationsOfInterestWithPlaceType_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__RTLearnedLocationManager__fetchLocationsOfInterestWithPlaceType_handler___block_invoke_2;
  block[3] = &unk_1E9298DC0;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

- (void)fetchLocationOfInterestAtLocation:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__RTLearnedLocationManager_fetchLocationOfInterestAtLocation_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_fetchLocationOfInterestAtLocation:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "horizontalUncertainty");
      if (v8 <= 250.0)
      {
        objc_msgSend(v6, "horizontalUncertainty");
        v20 = v19 + 1000.0;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __71__RTLearnedLocationManager__fetchLocationOfInterestAtLocation_handler___block_invoke;
        v21[3] = &unk_1E9298FC8;
        v23 = v7;
        v21[4] = self;
        v22 = v6;
        -[RTLearnedLocationManager _fetchLocationsOfInterestWithinDistance:ofLocation:handler:](self, "_fetchLocationsOfInterestWithinDistance:ofLocation:handler:", v22, v21, v20);

        v13 = v23;
      }
      else
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v10 = *MEMORY[0x1E0D18598];
        v24 = *MEMORY[0x1E0CB2D50];
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "horizontalUncertainty");
        objc_msgSend(v11, "stringWithFormat:", CFSTR("Horizontal Uncertainity, %.2f, is greater than the Threshold, %.2f"), v12, 0x406F400000000000);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 7, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);

      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D18598];
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = CFSTR("requires a valid location.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 0, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v18);

    }
  }

}

- (void)fetchLocationsOfInterestWithPlaceType:(unint64_t)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  -[RTNotifier queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__RTLearnedLocationManager_fetchLocationsOfInterestWithPlaceType_handler___block_invoke;
  block[3] = &unk_1E9298E88;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_fetchLocationsOfInterestWithPlaceType:(unint64_t)a3 handler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    if (-[RTLearnedLocationManager available](self, "available"))
    {
      -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __75__RTLearnedLocationManager__fetchLocationsOfInterestWithPlaceType_handler___block_invoke;
      v12[3] = &unk_1E9297EE0;
      v12[4] = self;
      v13 = v6;
      objc_msgSend(v7, "fetchLocationsOfInterestWithPlaceType:handler:", a3, v12);

    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0D18598];
      v14 = *MEMORY[0x1E0CB2D50];
      v15[0] = CFSTR("resource temporarily unavailable.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 5, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v11);

    }
  }

}

- (void)_fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        if (-[RTLearnedLocationManager available](self, "available"))
        {
          -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __93__RTLearnedLocationManager__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke;
          v24[3] = &unk_1E9297EE0;
          v24[4] = self;
          v25 = v10;
          objc_msgSend(v11, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:handler:", v8, v9, v24);

          goto LABEL_11;
        }
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0D18598];
        v26 = *MEMORY[0x1E0CB2D50];
        v27 = CFSTR("resource temporarily unavailable.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v21;
        v19 = v22;
        v20 = 5;
LABEL_10:
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, v20, v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v23);

        goto LABEL_11;
      }
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D18598];
      v28 = *MEMORY[0x1E0CB2D50];
      v29 = CFSTR("requires a valid endDate.");
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = &v29;
      v16 = &v28;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D18598];
      v30 = *MEMORY[0x1E0CB2D50];
      v31[0] = CFSTR("requires a valid startDate.");
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = (const __CFString **)v31;
      v16 = &v30;
    }
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v12;
    v19 = v13;
    v20 = 0;
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 handler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  void (**v29)(id, _QWORD, void *);
  double v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (v9)
  {
    if (v8)
    {
      objc_msgSend(v8, "horizontalUncertainty");
      if (v10 > 250.0)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v12 = *MEMORY[0x1E0D18598];
        v33 = *MEMORY[0x1E0CB2D50];
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "horizontalUncertainty");
        objc_msgSend(v13, "stringWithFormat:", CFSTR("Horizontal Uncertainity, %.2f, is greater than the Threshold, %.2f,"), v14, 0x406F400000000000);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 7, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, 0, v17);

LABEL_10:
        goto LABEL_11;
      }
      if (-[RTLearnedLocationManager available](self, "available"))
      {
        -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __87__RTLearnedLocationManager__fetchLocationsOfInterestWithinDistance_ofLocation_handler___block_invoke;
        v27[3] = &unk_1E9298E10;
        v27[4] = self;
        v29 = v9;
        v30 = a3;
        v28 = v8;
        objc_msgSend(v23, "fetchLocationsOfInterestWithinDistance:location:handler:", v28, v27, a3);

        goto LABEL_11;
      }
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0D18598];
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = CFSTR("resource temporarily unavailable.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v24;
      v21 = v25;
      v22 = 5;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0D18598];
      v35 = *MEMORY[0x1E0CB2D50];
      v36[0] = CFSTR("requires a valid location.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v18;
      v21 = v19;
      v22 = 0;
    }
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v26);

    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)available
{
  return self->_available;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

void __87__RTLearnedLocationManager__fetchLocationsOfInterestWithinDistance_ofLocation_handler___block_invoke_2(double *a1)
{
  double v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  if (*((_QWORD *)a1 + 4))
  {
    (*(void (**)(void))(*((_QWORD *)a1 + 8) + 16))();
  }
  else
  {
    v2 = a1[9];
    v3 = (void *)*((_QWORD *)a1 + 5);
    v4 = *((_QWORD *)a1 + 6);
    v5 = *((_QWORD *)a1 + 7);
    v8 = 0;
    objc_msgSend(v3, "_getLocationsOfInterestWithinDistance:ofLocation:fromLocationsOfInterest:error:", v4, v5, &v8, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    (*(void (**)(void))(*((_QWORD *)a1 + 8) + 16))();

  }
}

void __71__RTLearnedLocationManager__fetchLocationOfInterestAtLocation_handler___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  if (a3)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v4 = (void *)a1[4];
    v5 = a1[5];
    v8 = 0;
    objc_msgSend(v4, "_getLocationOfInterestAtLocation:fromLocationsOfInterest:error:", v5, a2, &v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    (*(void (**)(void))(a1[6] + 16))();

  }
}

- (id)_getLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 fromLocationsOfInterest:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  id *v28;
  id v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    v28 = a6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationManager distanceCalculator](self, "distanceCalculator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v29 = v11;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v18, "location");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "location");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 0;
          objc_msgSend(v12, "distanceFromLocation:toLocation:error:", v10, v20, &v31);
          v22 = v21;
          v23 = v31;

          if (v23)
          {
            if (v28)
              *v28 = objc_retainAutorelease(v23);

            v24 = 0;
            goto LABEL_16;
          }
          if (v22 <= a3)
            objc_msgSend(v30, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v15)
          continue;
        break;
      }
    }

    v24 = v30;
LABEL_16:
    v11 = v29;

  }
  else
  {
    if (!a6)
    {
      v24 = 0;
      goto LABEL_20;
    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0D18598];
    v37 = *MEMORY[0x1E0CB2D50];
    v38[0] = CFSTR("requires a valid location.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 0);
    v24 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_20:
  return v24;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (id)_getLocationOfInterestAtLocation:(id)a3 fromLocationsOfInterest:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  RTLearnedLocationManager *v43;
  NSObject *v44;
  uint8_t buf[16];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;
  _QWORD v52[3];

  v43 = self;
  v52[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v10)
    {
      v11 = v10;
      v44 = 0;
      v12 = *(_QWORD *)v47;
      v13 = INFINITY;
      while (1)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v47 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v7, "longitude", v43);
          v17 = v16;
          objc_msgSend(v15, "location");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "location");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "longitude");
          v21 = vabdd_f64(v17, v20);

          if (v21 >= 180.0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_DEBUG, "Cluster aggregation falls into DateLine ", buf, 2u);
            }
            goto LABEL_13;
          }
          v22 = v9;
          v23 = (void *)objc_opt_class();
          objc_msgSend(v7, "horizontalUncertainty");
          v25 = v24;
          objc_msgSend(v15, "location");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "location");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "horizontalUncertainty");
          objc_msgSend(v23, "distanceThresholdFromUncertainty:otherUncertainty:", v25, v28);
          v30 = v29;

          objc_msgSend(v7, "latitude");
          objc_msgSend(v7, "longitude");
          objc_msgSend(v15, "location");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "location");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "latitude");
          objc_msgSend(v15, "location");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "location");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "longitude");
          RTCommonCalculateDistanceHighPrecision();
          v36 = v35;

          if (v36 <= v30 && v36 < v13)
          {
            v37 = v15;
            v38 = v44;
            v13 = v36;
            v44 = v37;
            v9 = v22;
LABEL_13:

            continue;
          }
          v9 = v22;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (!v11)
          goto LABEL_21;
      }
    }
  }
  else if (a5)
  {
    v39 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0D18598];
    v51 = *MEMORY[0x1E0CB2D50];
    v52[0] = CFSTR("requires a valid location.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, 0, v41);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v44 = 0;
LABEL_21:

  return v44;
}

- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__RTLearnedLocationManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

+ (id)modeToString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unknown");
  if (a3 == 1)
    v3 = CFSTR("local");
  if (a3 == 2)
    return CFSTR("tourist");
  else
    return (id)v3;
}

- (RTLearnedLocationManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_contactsManager_distanceCalculator_learnedLocationStore_learnedPlaceTypeInferenceStore_mapServiceManager_);
}

- (RTLearnedLocationManager)initWithQueue:(id)a3 contactsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationStore:(id)a6 learnedPlaceTypeInferenceStore:(id)a7 mapServiceManager:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  RTLearnedLocationManager *v19;
  RTLearnedLocationManager *v20;
  RTLearnedLocationManager *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v26;
  id v27;
  id v28;
  objc_super v29;
  uint8_t buf[16];

  v28 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v14)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: contactsManager";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_18;
  }
  if (!v15)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_17;
  }
  if (!v16)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_17;
  }
  if (!v17)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: learnedPlaceTypeInferenceStore";
      goto LABEL_17;
    }
LABEL_18:

    v21 = 0;
    goto LABEL_19;
  }
  v27 = v18;
  if (v18)
  {
    v29.receiver = self;
    v29.super_class = (Class)RTLearnedLocationManager;
    v19 = -[RTNotifier initWithQueue:](&v29, sel_initWithQueue_, v28);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_contactsManager, a4);
      objc_storeStrong((id *)&v20->_distanceCalculator, a5);
      objc_storeStrong((id *)&v20->_learnedLocationStore, a6);
      objc_storeStrong((id *)&v20->_learnedPlaceTypeInferenceStore, a7);
      objc_storeStrong((id *)&v20->_mapServiceManager, a8);
      v20->_available = 0;
      v20->_migrationComplete = 0;
      -[RTService setup](v20, "setup");
    }
    self = v20;
    v21 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager", buf, 2u);
    }

    v21 = 0;
  }
  v22 = v27;
LABEL_19:

  return v21;
}

- (void)_logLearnedState
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  NSObject *v21;
  uint64_t *v22;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__17;
  v45 = __Block_byref_object_dispose__17;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__17;
  v39 = __Block_byref_object_dispose__17;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__17;
  v33 = __Block_byref_object_dispose__17;
  v34 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __44__RTLearnedLocationManager__logLearnedState__block_invoke;
  v26[3] = &unk_1E9297010;
  v28 = &v41;
  v6 = v3;
  v27 = v6;
  objc_msgSend(v4, "fetchPlacesWithHandler:", v26);

  dispatch_group_enter(v6);
  -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __44__RTLearnedLocationManager__logLearnedState__block_invoke_2;
  v23[3] = &unk_1E9297010;
  v25 = &v35;
  v8 = v6;
  v24 = v8;
  objc_msgSend(v7, "fetchVisitsWithHandler:", v23);

  dispatch_group_enter(v8);
  -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v5;
  v18 = 3221225472;
  v19 = __44__RTLearnedLocationManager__logLearnedState__block_invoke_3;
  v20 = &unk_1E9297010;
  v22 = &v29;
  v10 = v8;
  v21 = v10;
  objc_msgSend(v9, "fetchTransitionsWithHandler:", &v17);

  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend((id)v42[5], "count", v17, v18, v19, v20);
    *(_DWORD *)buf = 134217984;
    v48 = v12;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%lu places", buf, 0xCu);
  }

  objc_msgSend((id)v42[5], "enumerateObjectsUsingBlock:", &__block_literal_global_14);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = objc_msgSend((id)v36[5], "count");
    *(_DWORD *)buf = 134217984;
    v48 = v14;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%lu visits", buf, 0xCu);
  }

  objc_msgSend((id)v36[5], "enumerateObjectsUsingBlock:", &__block_literal_global_60);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend((id)v30[5], "count");
    *(_DWORD *)buf = 134217984;
    v48 = v16;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%lu transitions", buf, 0xCu);
  }

  objc_msgSend((id)v30[5], "enumerateObjectsUsingBlock:", &__block_literal_global_63);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

}

void __44__RTLearnedLocationManager__logLearnedState__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __44__RTLearnedLocationManager__logLearnedState__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __44__RTLearnedLocationManager__logLearnedState__block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __44__RTLearnedLocationManager__logLearnedState__block_invoke_56(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "place %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

void __44__RTLearnedLocationManager__logLearnedState__block_invoke_58(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "visit %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

void __44__RTLearnedLocationManager__logLearnedState__block_invoke_61(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "transition %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)_performLegacyMigrations:(id)a3
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  dispatch_semaphore_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  dispatch_time_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  char v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  dispatch_time_t v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  char v50;
  id v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  dispatch_time_t v58;
  id v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  objc_class *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  RTLearnedLocationManager *v81;
  _QWORD v82[4];
  NSObject *v83;
  uint8_t *v84;
  _QWORD v85[4];
  NSObject *v86;
  uint64_t *v87;
  uint8_t *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[4];
  NSObject *v94;
  uint64_t *v95;
  _BYTE *v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  char v100;
  uint8_t v101[8];
  uint8_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint8_t v107[8];
  uint8_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  _BYTE buf[24];
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  uint64_t v117;
  uint8_t v118[8];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD, _QWORD))v5;
  if (!self->_migrationComplete)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v81 = self;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), v9, v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "UTF8String");
    v80 = (void *)os_transaction_create();

    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v74 = (objc_class *)objc_opt_class();
      NSStringFromClass(v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v75;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v76;
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

    }
    v97 = 0;
    v98 = &v97;
    v99 = 0x2020000000;
    v100 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v114 = __Block_byref_object_copy__17;
    v115 = __Block_byref_object_dispose__17;
    v116 = 0;
    v13 = dispatch_semaphore_create(0);
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __53__RTLearnedLocationManager__performLegacyMigrations___block_invoke;
    v93[3] = &unk_1E9298CF8;
    v95 = &v97;
    v96 = buf;
    v14 = v13;
    v94 = v14;
    -[RTLearnedLocationManager _migrateStateModelLegacy:](v81, "_migrateStateModelLegacy:", v93);
    v15 = v14;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v15, v17))
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v16);
    v20 = v19;
    v21 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "filteredArrayUsingPredicate:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "submitToCoreAnalytics:type:duration:", v25, 1, v20);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v107 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v107, 2u);
    }

    v27 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)v101 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v107 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v101, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = objc_retainAutorelease(v29);

      v31 = 0;
    }
    else
    {
LABEL_10:
      v30 = 0;
      v31 = 1;
    }

    v32 = v30;
    if ((v31 & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v30);
    v89 = 0;
    v90 = &v89;
    v91 = 0x2020000000;
    v92 = 0;
    *(_QWORD *)v107 = 0;
    v108 = v107;
    v109 = 0x3032000000;
    v110 = __Block_byref_object_copy__17;
    v111 = __Block_byref_object_dispose__17;
    v112 = 0;
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __53__RTLearnedLocationManager__performLegacyMigrations___block_invoke_2;
    v85[3] = &unk_1E92971F0;
    v87 = &v89;
    v88 = v107;
    v33 = v15;
    v86 = v33;
    -[RTLearnedLocationManager _migrateLegacyMapItems:](v81, "_migrateLegacyMapItems:", v85);
    v34 = v33;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v34, v36))
      goto LABEL_18;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "timeIntervalSinceDate:", v35);
    v39 = v38;
    v40 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "filteredArrayUsingPredicate:", v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "firstObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "submitToCoreAnalytics:type:duration:", v44, 1, v39);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v101 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v101, 2u);
    }

    v46 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)v118 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v101 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v118, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = objc_retainAutorelease(v48);

      v50 = 0;
    }
    else
    {
LABEL_18:
      v50 = 1;
      v49 = v32;
    }

    v51 = v49;
    if ((v50 & 1) == 0)
      objc_storeStrong((id *)v108 + 5, v49);
    v77 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    _RTSafeArray();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90[3] || (v54 = *((unsigned __int8 *)v98 + 24), *((_BYTE *)v98 + 24)))
      v54 = v53 == 0;
    *(_QWORD *)v101 = 0;
    v102 = v101;
    v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__17;
    v105 = __Block_byref_object_dispose__17;
    v106 = 0;
    if (v54)
    {
      -[RTLearnedLocationManager learnedLocationEngine](v81, "learnedLocationEngine", v77, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __53__RTLearnedLocationManager__performLegacyMigrations___block_invoke_3;
      v82[3] = &unk_1E9297038;
      v84 = v101;
      v56 = v34;
      v83 = v56;
      objc_msgSend(v55, "trainLocationsOfInterestModelWithHandler:", v82);

      v57 = v56;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = dispatch_time(0, 3600000000000);
      v59 = v51;
      if (dispatch_semaphore_wait(v57, v58))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "timeIntervalSinceDate:", v79);
        v61 = v60;
        v62 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "filteredArrayUsingPredicate:", v63);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "firstObject");
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v62, "submitToCoreAnalytics:type:duration:", v66, 1, v61);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v118 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v67, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v118, 2u);
        }

        v68 = (void *)MEMORY[0x1E0CB35C8];
        v117 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)v118 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, &v117, 1);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = v51;
        if (v70)
        {
          v59 = objc_retainAutorelease(v70);

        }
      }

      v71 = v59;
      v51 = v71;
    }
    _RTSafeArray();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      if (!v6)
        goto LABEL_36;
    }
    else
    {
      v81->_migrationComplete = 1;
      if (!v6)
      {
LABEL_36:

        _Block_object_dispose(v101, 8);
        _Block_object_dispose(v107, 8);

        _Block_object_dispose(&v89, 8);
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v97, 8);
        goto LABEL_37;
      }
    }
    ((void (**)(_QWORD, void *))v6)[2](v6, v73);
    goto LABEL_36;
  }
  (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
LABEL_37:

}

void __53__RTLearnedLocationManager__performLegacyMigrations___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __53__RTLearnedLocationManager__performLegacyMigrations___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __53__RTLearnedLocationManager__performLegacyMigrations___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "trained locationsOfInterest model after migration, error, %@", (uint8_t *)&v8, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)migrateLegacyMapItemWithGeoMapItem:(id)a3 geoMapItemHandle:(id)a4 source:(unint64_t)a5 mapServiceManager:(id)a6 error:(id *)a7
{
  unint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  BOOL v24;
  int v25;
  dispatch_semaphore_t v26;
  id v27;
  objc_class *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  dispatch_time_t v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v52[4];
  NSObject *v53;
  _BYTE *v54;
  _QWORD *v55;
  unint64_t v56;
  id v57;
  _QWORD v58[5];
  id v59;
  _BYTE v60[12];
  __int16 v61;
  int v62;
  _BYTE buf[24];
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  const __CFString *v68;
  uint64_t v69;
  const __CFString *v70;
  _QWORD v71[4];

  v71[1] = *MEMORY[0x1E0C80C00];
  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = a6;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[RTLearnedLocationManager migrateLegacyMapItemWithGeoMapItem:geoMapItemHandle:source:mapServ"
                           "iceManager:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 315;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager (in %s:%d)", buf, 0x12u);
    }

    if (v10 | v11)
    {
      if (a7)
      {
        v67 = *MEMORY[0x1E0CB2D50];
        v68 = CFSTR("A valid instance of RTMapSericeManager is required.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v20);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_14;
    }
LABEL_10:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[RTLearnedLocationManager migrateLegacyMapItemWithGeoMapItem:geoMapItemHandle:source:mapServ"
                           "iceManager:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 316;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: geoMapItem || geoMapItemHandle (in %s:%d)", buf, 0x12u);
    }

    if (a7)
    {
      v69 = *MEMORY[0x1E0CB2D50];
      v70 = CFSTR("requires a valid geoMapItem or geoMapItemHandle.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v22);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_14:
    v23 = 0;
    goto LABEL_37;
  }
  if (!(v10 | v11))
    goto LABEL_10;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v64 = __Block_byref_object_copy__17;
  v65 = __Block_byref_object_dispose__17;
  v66 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__17;
  v58[4] = __Block_byref_object_dispose__17;
  v59 = 0;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    objc_msgSend(v12, "mapItemWithIdentifier:geoMapItem:source:creationDate:error:", v13, v10, a5, v14, &v57);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v57;
    v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v15;

    v18 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  }
  else
  {
    v18 = 0;
    v16 = 0;
  }
  if (v18)
    v24 = v16 == 0;
  else
    v24 = 0;
  v25 = !v24;
  if (v11 && v25)
  {
    v26 = dispatch_semaphore_create(0);
    v27 = objc_alloc(MEMORY[0x1E0D183F8]);
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v27, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v29);

    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __111__RTLearnedLocationManager_migrateLegacyMapItemWithGeoMapItem_geoMapItemHandle_source_mapServiceManager_error___block_invoke;
    v52[3] = &unk_1E9298D20;
    v54 = buf;
    v55 = v58;
    v56 = a5;
    v30 = v26;
    v53 = v30;
    objc_msgSend(v12, "fetchMapItemFromHandle:options:handler:", v11, v50, v52);
    v31 = v30;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v31, v32))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "timeIntervalSinceDate:", v49);
      v35 = v34;
      v48 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "filteredArrayUsingPredicate:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v48, "submitToCoreAnalytics:type:duration:", v39, 1, v35);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v60 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v60, 2u);
      }

      v41 = (void *)MEMORY[0x1E0CB35C8];
      v71[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v60 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v71, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
    }

    v18 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v60 = 136315394;
      *(_QWORD *)&v60[4] = "+[RTLearnedLocationManager migrateLegacyMapItemWithGeoMapItem:geoMapItemHandle:source:mapServ"
                           "iceManager:error:]";
      v61 = 1024;
      v62 = 369;
      _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "Attempting to migrate a learned place with a nil map item and nil map item handle. (in %s:%d)", v60, 0x12u);
    }

  }
  v45 = v16;
  if (a7)
  {
    _RTSafeArray();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(v58, 8);

  _Block_object_dispose(buf, 8);
LABEL_37:

  return v23;
}

void __111__RTLearnedLocationManager_migrateLegacyMapItemWithGeoMapItem_geoMapItemHandle_source_mapServiceManager_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "appendSource:", *(_QWORD *)(a1 + 56));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_migrateLegacyMapItems:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationManager mapServiceManager](self, "mapServiceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__RTLearnedLocationManager__migrateLegacyMapItems___block_invoke;
  v14[3] = &unk_1E9298D48;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v9 = v5;
  v16 = v9;
  v17 = &v18;
  v10 = (id)objc_msgSend(v7, "migrateLegacyMapItemsWithEnumerationBlock:", v14);

  v11 = v19[3];
  _RTSafeArray();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v11, v13);

  _Block_object_dispose(&v18, 8);
}

id __51__RTLearnedLocationManager__migrateLegacyMapItems___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v14;

  v7 = a3;
  v8 = a2;
  v9 = (void *)objc_opt_class();
  v10 = *(_QWORD *)(a1 + 40);
  v14 = 0;
  objc_msgSend(v9, "migrateLegacyMapItemWithGeoMapItem:geoMapItemHandle:source:mapServiceManager:error:", v8, v7, a4, v10, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v12)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  return v11;
}

- (void)_migrateStateModelLegacy:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  const __CFString *v32;
  RTStateModelLegacyController *v33;
  void *v34;
  void *v35;
  RTStateModelLegacyController *v36;
  _BOOL4 v37;
  NSObject *v38;
  NSObject *v39;
  const __CFString *v40;
  NSObject *v41;
  _BOOL4 v42;
  NSObject *v43;
  const __CFString *v44;
  _BOOL4 v45;
  NSObject *v46;
  const __CFString *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  NSObject *v53;
  __int128 *p_buf;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  _BYTE v60[12];
  __int16 v61;
  NSObject *v62;
  __int128 buf;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = +[RTStateModelLegacyController stateModelLegacyExists](RTStateModelLegacyController, "stateModelLegacyExists");
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "stateModel legacy exists, %@", (uint8_t *)&buf, 0xCu);
  }

  if (v5)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__17;
    v66 = __Block_byref_object_dispose__17;
    v67 = 0;
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    v8 = dispatch_semaphore_create(0);
    -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __53__RTLearnedLocationManager__migrateStateModelLegacy___block_invoke;
    v52[3] = &unk_1E9298D70;
    p_buf = &buf;
    v55 = &v56;
    v10 = v8;
    v53 = v10;
    objc_msgSend(v9, "fetchLastVisitWithHandler:", v52);

    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v11, v13))
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    v16 = v15;
    v17 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "submitToCoreAnalytics:type:duration:", v21, 1, v16);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v60 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v60, 2u);
    }

    v23 = (void *)MEMORY[0x1E0CB35C8];
    v68[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v60 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v68, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = objc_retainAutorelease(v25);

      v27 = 0;
    }
    else
    {
LABEL_13:
      v26 = 0;
      v27 = 1;
    }

    v28 = v26;
    if ((v27 & 1) == 0)
      objc_storeStrong((id *)(*((_QWORD *)&buf + 1) + 40), v26);
    v29 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v48 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v60 = 138412290;
        *(_QWORD *)&v60[4] = v48;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "failed to determine if locationsOfInterest model exists, %@", v60, 0xCu);
      }

      if (v4)
        (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
      goto LABEL_48;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      if (*((_BYTE *)v57 + 24))
        v32 = CFSTR("YES");
      else
        v32 = CFSTR("NO");
      *(_DWORD *)v60 = 138412290;
      *(_QWORD *)&v60[4] = v32;
      _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "learned visit exists, %@", v60, 0xCu);
    }

    v33 = [RTStateModelLegacyController alloc];
    -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationManager mapServiceManager](self, "mapServiceManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[RTStateModelLegacyController initWithLearnedLocationStore:mapServiceManager:](v33, "initWithLearnedLocationStore:mapServiceManager:", v34, v35);

    if (*((_BYTE *)v57 + 24))
    {
      if (v4)
        (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
      v51 = 0;
      v37 = -[RTStateModelLegacyController removeStateModelLegacyWithError:](v36, "removeStateModelLegacyWithError:", &v51);
      v38 = v51;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = CFSTR("NO");
        if (v37)
          v40 = CFSTR("YES");
        *(_DWORD *)v60 = 138412546;
        *(_QWORD *)&v60[4] = v40;
        v61 = 2112;
        v62 = v38;
        _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "removed stateModel legacy, %@, error, %@", v60, 0x16u);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v60 = 0;
        _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_INFO, "migrating stateModel legacy", v60, 2u);
      }

      v50 = 0;
      v42 = -[RTStateModelLegacyController migrateStateModelLegacyWithError:](v36, "migrateStateModelLegacyWithError:", &v50);
      v38 = v50;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = CFSTR("NO");
        if (v42)
          v44 = CFSTR("YES");
        *(_DWORD *)v60 = 138412546;
        *(_QWORD *)&v60[4] = v44;
        v61 = 2112;
        v62 = v38;
        _os_log_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_INFO, "migrated stateModel legacy, %@, error, %@", v60, 0x16u);
      }

      -[RTLearnedLocationManager _logLearnedState](self, "_logLearnedState");
      if (!v42)
      {
        if (v4)
          (*((void (**)(id, _QWORD, NSObject *))v4 + 2))(v4, 0, v38);
        goto LABEL_47;
      }
      v49 = 0;
      v45 = -[RTStateModelLegacyController removeStateModelLegacyWithError:](v36, "removeStateModelLegacyWithError:", &v49);
      v39 = v49;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v47 = CFSTR("NO");
        if (v45)
          v47 = CFSTR("YES");
        *(_DWORD *)v60 = 138412546;
        *(_QWORD *)&v60[4] = v47;
        v61 = 2112;
        v62 = v39;
        _os_log_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_INFO, "removed stateModel legacy, %@, error, %@", v60, 0x16u);
      }

      if (v4)
        (*((void (**)(id, uint64_t, NSObject *))v4 + 2))(v4, 1, v39);
    }

LABEL_47:
LABEL_48:

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&buf, 8);

    goto LABEL_49;
  }
  if (v4)
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
LABEL_49:

}

void __53__RTLearnedLocationManager__migrateStateModelLegacy___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;

  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[16];

  -[RTLearnedLocationManager learnedLocationEngine](self, "learnedLocationEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTLearnedLocationManager learnedLocationEngine](self, "learnedLocationEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", self);

    -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:", self, sel_onLearnedLocationStoreNotification_, v5);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.learnedLocationEngine", buf, 2u);
    }

  }
}

- (void)_shutdownWithHandler:(id)a3
{
  RTContactsManager *contactsManager;
  RTDistanceCalculator *distanceCalculator;
  void *v6;
  RTLearnedLocationEngine *learnedLocationEngine;
  void *v8;
  RTLearnedLocationStore *learnedLocationStore;
  RTMapServiceManager *mapServiceManager;
  void *v11;
  id v12;

  v12 = a3;
  contactsManager = self->_contactsManager;
  self->_contactsManager = 0;

  distanceCalculator = self->_distanceCalculator;
  self->_distanceCalculator = 0;

  -[RTLearnedLocationManager learnedLocationEngine](self, "learnedLocationEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shutdown");

  learnedLocationEngine = self->_learnedLocationEngine;
  self->_learnedLocationEngine = 0;

  -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  learnedLocationStore = self->_learnedLocationStore;
  self->_learnedLocationStore = 0;

  mapServiceManager = self->_mapServiceManager;
  self->_mapServiceManager = 0;

  v11 = v12;
  if (v12)
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
    v11 = v12;
  }

}

- (id)createAndStoreNewPlaceWithMapItem:(id)a3 customLabel:(id)a4 mapItemSource:(unint64_t)a5 outError:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  RTLearnedPlace *v29;
  void *v30;
  void *v31;
  RTLearnedPlace *v32;
  dispatch_semaphore_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  dispatch_time_t v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  char v53;
  id v54;
  NSObject *v55;
  uint64_t v56;
  RTLearnedPlace *v57;
  NSObject *v58;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  RTLearnedLocationManager *v65;
  unint64_t v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  id v99;
  void *v100;
  void *v101;
  _QWORD v102[4];
  NSObject *v103;
  uint8_t *v104;
  uint8_t v105[8];
  uint8_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  _BYTE buf[12];
  __int16 v112;
  void *v113;
  __int16 v114;
  uint64_t v115;
  RTLearnedPlace *v116;
  _QWORD v117[3];

  v117[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v99 = a4;
  v101 = v9;
  if (v9)
  {
    v65 = self;
    v66 = a5;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_alloc(MEMORY[0x1E0D18330]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "geoAddressData");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "subPremises");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "subThoroughfare");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "thoroughfare");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "subLocality");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "locality");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "subAdministrativeArea");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "administrativeArea");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "administrativeAreaCode");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "postalCode");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "country");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "countryCode");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inlandWater");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "ocean");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "areasOfInterest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isIsland");
    objc_msgSend(v100, "dateByAddingTimeInterval:", 4838400.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "address");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "iso3166CountryCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "address");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "iso3166SubdivisionCode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v61) = v15;
    v68 = (void *)objc_msgSend(v67, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v84, v83, v81, v80, v78, v77, v76, v75, v74, v73, v71, v64, v63, v62, v12,
                    v13,
                    v61,
                    v100,
                    v16,
                    v17,
                    v19);

    v96 = objc_alloc(MEMORY[0x1E0D183E8]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "name");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "category");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v101, "mapItemPlaceType");
    v23 = objc_msgSend(v101, "muid");
    v24 = objc_msgSend(v101, "resultProviderID");
    objc_msgSend(v101, "geoMapItemHandle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "dateByAddingTimeInterval:", 4838400.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "extendedAttributes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "displayLanguage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v60) = objc_msgSend(v101, "disputed");
    v97 = (void *)objc_msgSend(v96, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v94, v92, v20, v68, v21, v66, v22, v23, v24, v25, v100, v26, v27, v28, v60);

    v29 = [RTLearnedPlace alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "dateByAddingTimeInterval:", 4838400.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v29, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v30, 0, 0, v97, v99, v100, v31);

    *(_QWORD *)v105 = 0;
    v106 = v105;
    v107 = 0x3032000000;
    v108 = __Block_byref_object_copy__17;
    v109 = __Block_byref_object_dispose__17;
    v110 = 0;
    v33 = dispatch_semaphore_create(0);
    -[RTLearnedLocationManager learnedLocationStore](v65, "learnedLocationStore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __97__RTLearnedLocationManager_createAndStoreNewPlaceWithMapItem_customLabel_mapItemSource_outError___block_invoke;
    v102[3] = &unk_1E9297038;
    v104 = v105;
    v36 = v33;
    v103 = v36;
    objc_msgSend(v34, "storePlaces:handler:", v35, v102);

    v37 = v36;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v37, v39))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "timeIntervalSinceDate:", v38);
    v42 = v41;
    v43 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "filteredArrayUsingPredicate:", v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "firstObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "submitToCoreAnalytics:type:duration:", v47, 1, v42);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v49 = (void *)MEMORY[0x1E0CB35C8];
    v117[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v117, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      v52 = objc_retainAutorelease(v51);

      v53 = 0;
    }
    else
    {
LABEL_7:
      v52 = 0;
      v53 = 1;
    }

    v54 = v52;
    if ((v53 & 1) == 0)
      objc_storeStrong((id *)v106 + 5, v52);
    if (*((_QWORD *)v106 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        v56 = *((_QWORD *)v106 + 5);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v32;
        v112 = 2112;
        v113 = v101;
        v114 = 2112;
        v115 = v56;
        _os_log_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_INFO, "failed to store place, %@, on current device for mapItem, %@, error, %@.", buf, 0x20u);
      }

      v57 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(*((id *)v106 + 5));
    }
    else
    {
      v57 = v32;
    }

    _Block_object_dispose(v105, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v105 = 0;
      _os_log_error_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem", v105, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("mapItem"));
      v57 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = 0;
    }
  }

  return v57;
}

void __97__RTLearnedLocationManager_createAndStoreNewPlaceWithMapItem_customLabel_mapItemSource_outError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)validateUpdatedMapItem:(id)a3 locationOfInterest:(id)a4 error:(id *)a5
{
  id v8;
  dispatch_semaphore_t v9;
  id v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  dispatch_time_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  char v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  id v40;
  id v41;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id *v53;
  void *v54;
  id v55;
  id v56;
  _QWORD v57[4];
  NSObject *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  id *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  const __CFString *v78;
  uint64_t v79;
  uint8_t buf[16];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v55 = a4;
  if (v8)
  {
    v53 = a5;
    v67 = 0;
    v68 = (id *)&v67;
    v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__17;
    v71 = __Block_byref_object_dispose__17;
    v72 = 0;
    v61 = 0;
    v62 = &v61;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__17;
    v65 = __Block_byref_object_dispose__17;
    v66 = 0;
    v9 = dispatch_semaphore_create(0);
    v10 = objc_alloc(MEMORY[0x1E0D183F8]);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v10, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v12);

    -[RTLearnedLocationManager mapServiceManager](self, "mapServiceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "geoMapItemHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __76__RTLearnedLocationManager_validateUpdatedMapItem_locationOfInterest_error___block_invoke;
    v57[3] = &unk_1E9298D98;
    v59 = &v67;
    v60 = &v61;
    v15 = v9;
    v58 = v15;
    objc_msgSend(v13, "fetchMapItemFromHandle:options:handler:", v14, v54, v57);

    v16 = v15;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v16, v18))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", v17);
    v21 = v20;
    v22 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "filteredArrayUsingPredicate:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "submitToCoreAnalytics:type:duration:", v26, 1, v21);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v28 = (void *)MEMORY[0x1E0CB35C8];
    v79 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v79, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = objc_retainAutorelease(v30);

      v32 = 0;
    }
    else
    {
LABEL_7:
      v31 = 0;
      v32 = 1;
    }

    v33 = v31;
    if ((v32 & 1) == 0)
      objc_storeStrong(v68 + 5, v31);
    if (!v68[5] && (objc_msgSend(v8, "isEqualToMapItem:", v62[5]) & 1) != 0)
    {
      -[RTLearnedLocationManager distanceCalculator](self, "distanceCalculator");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "location");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "location");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "location");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0;
      objc_msgSend(v34, "distanceFromLocation:toLocation:error:", v35, v37, &v56);
      v39 = v38;
      v40 = v56;

      if (v40)
      {
        if (v53)
        {
          v41 = objc_retainAutorelease(v40);
          v40 = v41;
LABEL_17:
          v43 = 0;
          *v53 = v41;
LABEL_18:

LABEL_23:
          _Block_object_dispose(&v61, 8);

          _Block_object_dispose(&v67, 8);
          goto LABEL_24;
        }
      }
      else
      {
        if (v39 <= 10000.0)
        {
          v40 = 0;
          v43 = 1;
          goto LABEL_18;
        }
        if (v53)
        {
          v47 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v55, "place");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "identifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "stringWithFormat:", CFSTR("The existing location of interest with identifier %@ is too far from the updated mapItem."), v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          v51 = (void *)MEMORY[0x1E0CB35C8];
          v73 = *MEMORY[0x1E0CB2D50];
          v74 = v50;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v52);
          *v53 = (id)objc_claimAutoreleasedReturnValue();

        }
        v40 = 0;
      }
      v43 = 0;
      goto LABEL_18;
    }
    if (!v53)
    {
      v43 = 0;
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("requires a valid geoMapItemHandle; mapItem, %@, fetched mapItem from geoMapItemHandle, %@, error, %@"),
      v8,
      v62[5],
      v68[5]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x1E0CB35C8];
    v75 = *MEMORY[0x1E0CB2D50];
    v76 = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v40);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (a5)
  {
    v44 = (void *)MEMORY[0x1E0CB35C8];
    v77 = *MEMORY[0x1E0CB2D50];
    v78 = CFSTR("requires a valid mapItem.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v45);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v43 = 0;
LABEL_24:

  return v43;
}

void __76__RTLearnedLocationManager_validateUpdatedMapItem_locationOfInterest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_fetchRecentLocationsOfInterestWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (-[RTLearnedLocationManager available](self, "available"))
    {
      -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __71__RTLearnedLocationManager__fetchRecentLocationsOfInterestWithHandler___block_invoke;
      v10[3] = &unk_1E9297EE0;
      v10[4] = self;
      v11 = v4;
      objc_msgSend(v5, "fetchRecentLocationsOfInterestWithHandler:", v10);

    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0D18598];
      v12 = *MEMORY[0x1E0CB2D50];
      v13[0] = CFSTR("resource temporarily unavailable.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 5, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);

    }
  }

}

void __71__RTLearnedLocationManager__fetchRecentLocationsOfInterestWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__RTLearnedLocationManager__fetchRecentLocationsOfInterestWithHandler___block_invoke_2;
  block[3] = &unk_1E9298DC0;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __71__RTLearnedLocationManager__fetchRecentLocationsOfInterestWithHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchRecentLocationsOfInterestWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__RTLearnedLocationManager_fetchRecentLocationsOfInterestWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __70__RTLearnedLocationManager_fetchRecentLocationsOfInterestWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchRecentLocationsOfInterestWithHandler:", *(_QWORD *)(a1 + 40));
}

- (id)_getLocationsOfInterestVisitedBeforeDate:(id)a3 fromLocationsOfInterest:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K.%K <= %@"), CFSTR("visits"), CFSTR("entryDate"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
    a5 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D18598];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = CFSTR("requires a date date.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 0, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

- (id)_getLearnedVisits:(id)a3 dateInterval:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3528];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("entryDate"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v11 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v7, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("entryDate"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "filteredArrayUsingPredicate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  double v16;

  v8 = a4;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__RTLearnedLocationManager_fetchLocationsOfInterestWithinDistance_ofLocation_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __86__RTLearnedLocationManager_fetchLocationsOfInterestWithinDistance_ofLocation_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationsOfInterestWithinDistance:ofLocation:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)fetchFusionCandidatesForVisitIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTNotifier queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__RTLearnedLocationManager_fetchFusionCandidatesForVisitIdentifier_handler___block_invoke;
    block[3] = &unk_1E9296F70;
    block[4] = self;
    v11 = v6;
    v12 = v7;
    dispatch_async(v8, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

uint64_t __76__RTLearnedLocationManager_fetchFusionCandidatesForVisitIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchFusionCandidatesForVisitIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchFusionCandidatesForVisitIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString **v13;
  uint64_t *v14;
  void *v15;
  _QWORD v16[5];
  NSObject *v17;
  uint8_t buf[8];
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (-[RTLearnedLocationManager available](self, "available"))
    {
      if (v6)
      {
        -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __77__RTLearnedLocationManager__fetchFusionCandidatesForVisitIdentifier_handler___block_invoke;
        v16[3] = &unk_1E9298E38;
        v16[4] = self;
        v17 = v7;
        objc_msgSend(v8, "fetchVisitWithIdentifier:handler:", v6, v16);

        v9 = v17;
        goto LABEL_10;
      }
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0D18598];
      v19 = *MEMORY[0x1E0CB2D50];
      v20 = CFSTR("requires a non-nil identifier.");
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = &v20;
      v14 = &v19;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0D18598];
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("resource temporarily unavailable.");
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = (const __CFString **)v22;
      v14 = &v21;
    }
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 5, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);

    goto LABEL_10;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_10:

}

void __77__RTLearnedLocationManager__fetchFusionCandidatesForVisitIdentifier_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__RTLearnedLocationManager__fetchFusionCandidatesForVisitIdentifier_handler___block_invoke_2;
    block[3] = &unk_1E9296F70;
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = *(id *)(a1 + 40);
    dispatch_async(v6, block);

  }
}

void __77__RTLearnedLocationManager__fetchFusionCandidatesForVisitIdentifier_handler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "learnedLocationEngine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchFusionCandidatesForVisit:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)fetchInferredMapItemForVisitIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__RTLearnedLocationManager_fetchInferredMapItemForVisitIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __75__RTLearnedLocationManager_fetchInferredMapItemForVisitIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchInferredMapItemForVisitIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchInferredMapItemForVisitIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  NSObject *v19;
  uint8_t buf[8];
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (-[RTLearnedLocationManager available](self, "available"))
    {
      if (v6)
      {
        -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __76__RTLearnedLocationManager__fetchInferredMapItemForVisitIdentifier_handler___block_invoke;
        v18[3] = &unk_1E9298E60;
        v19 = v7;
        objc_msgSend(v8, "fetchInferredMapItemForVisitIdentifier:handler:", v6, v18);

        v9 = v19;
        goto LABEL_10;
      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v21 = *MEMORY[0x1E0CB2D50];
      v22 = CFSTR("requires a non-nil identifier.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      v12 = v15;
      v13 = v16;
      v14 = 7;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0D18598];
      v23 = *MEMORY[0x1E0CB2D50];
      v24[0] = CFSTR("resource temporarily unavailable.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = v11;
      v14 = 5;
    }
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v17);

    goto LABEL_10;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_10:

}

uint64_t __76__RTLearnedLocationManager__fetchInferredMapItemForVisitIdentifier_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)queryProvider:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__RTLearnedLocationManager_queryProvider_options_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __58__RTLearnedLocationManager_queryProvider_options_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queryProvider:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_queryProvider:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[RTLearnedLocationManager learnedLocationEngine](self, "learnedLocationEngine");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject queryMapItemProvider:options:handler:](v11, "queryMapItemProvider:options:handler:", v8, v9, v10);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v12, 2u);
    }
  }

}

- (void)_fetchLocationsOfInterestVisitedSinceDate:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      if (-[RTLearnedLocationManager available](self, "available"))
      {
        -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __78__RTLearnedLocationManager__fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke;
        v18[3] = &unk_1E9297EE0;
        v18[4] = self;
        v19 = v7;
        objc_msgSend(v8, "fetchLocationsOfInterestVisitedSinceDate:handler:", v6, v18);

        goto LABEL_8;
      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v20 = *MEMORY[0x1E0CB2D50];
      v21 = CFSTR("resource temporarily unavailable.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      v13 = v16;
      v14 = 5;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0D18598];
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = CFSTR("requires a valid sinceDate.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      v13 = v10;
      v14 = 7;
    }
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v17);

  }
LABEL_8:

}

void __78__RTLearnedLocationManager__fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__RTLearnedLocationManager__fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke_2;
  block[3] = &unk_1E9298DC0;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __78__RTLearnedLocationManager__fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchLocationsOfInterestVisitedSinceDate:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__RTLearnedLocationManager_fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __77__RTLearnedLocationManager_fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationsOfInterestVisitedSinceDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_visitFromLearnedVisit:(id)a3 learnedLOI:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20[2];
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__RTLearnedLocationManager__visitFromLearnedVisit_learnedLOI_handler___block_invoke;
  v16[3] = &unk_1E9298ED8;
  objc_copyWeak(v20, &location);
  v13 = v11;
  v19 = v13;
  v14 = v9;
  v17 = v14;
  v15 = v10;
  v18 = v15;
  v20[1] = (id)a2;
  objc_msgSend(v12, "fetchFinerGranularityInferredMapItemForVisit:handler:", v14, v16);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

}

void __70__RTLearnedLocationManager__visitFromLearnedVisit_learnedLOI_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23[2];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __70__RTLearnedLocationManager__visitFromLearnedVisit_learnedLOI_handler___block_invoke_2;
    v17[3] = &unk_1E9298EB0;
    objc_copyWeak(v23, (id *)(a1 + 56));
    v22 = *(id *)(a1 + 48);
    v18 = v6;
    v19 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 40);
    v10 = v5;
    v11 = *(void **)(a1 + 64);
    v21 = v10;
    v23[1] = v11;
    dispatch_async(v9, v17);

    objc_destroyWeak(v23);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18598];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("swelf is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v16);

  }
}

void __70__RTLearnedLocationManager__visitFromLearnedVisit_learnedLOI_handler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  objc_class *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v43 = *(void **)(a1 + 32);
        v44 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v50 = v43;
        v51 = 2112;
        v52 = v44;
        _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "An error, %@, has occurred when fetching the fetchFinerGranularityInferredMapItem for visit, %@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 48), "place");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[RTPlaceInferenceManager userSpecificPlaceTypeFromLearnedPlaceType:](RTPlaceInferenceManager, "userSpecificPlaceTypeFromLearnedPlaceType:", objc_msgSend(v4, "type"));

    v6 = (void *)MEMORY[0x1E0D18420];
    objc_msgSend(*(id *)(a1 + 48), "place");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v6, "placeInferencePlaceTypeFromMapItem:userType:source:", v8, v5, objc_msgSend(*(id *)(a1 + 40), "placeSource"));

    objc_msgSend(*(id *)(a1 + 48), "place");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    if (v11)
      objc_msgSend(v11, "setSource:", objc_msgSend(*(id *)(a1 + 40), "placeSource"));
    v48 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 56), "mapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    if (v13)
      objc_msgSend(v13, "setSource:", objc_msgSend(*(id *)(a1 + 56), "source"));
    v14 = objc_alloc(MEMORY[0x1E0D18420]);
    objc_msgSend(*(id *)(a1 + 48), "place");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[RTPlaceInferenceManager userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:](RTPlaceInferenceManager, "userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:", objc_msgSend(v15, "typeSource"));
    objc_msgSend(*(id *)(a1 + 40), "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "placeConfidence");
    v20 = v19;
    objc_msgSend(*(id *)(a1 + 56), "confidence");
    v22 = v21;
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v11;
    v45 = v13;
    v24 = (void *)objc_msgSend(v14, "initWithMapItem:finerGranularityMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:finerGranularityMapItemConfidence:loiIdentifier:", v11, v13, v5, v16, v46, v18, v20, v22, v23);

    v25 = objc_alloc(MEMORY[0x1E0D18578]);
    objc_msgSend(*(id *)(a1 + 40), "creationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "location");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "location");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "entryDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "exitDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "location");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "dataPointCount");
    objc_msgSend(*(id *)(a1 + 40), "placeConfidence");
    v33 = (void *)objc_msgSend(v25, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:source:", v26, 3, v28, v29, v30, v32, v24, 3);

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v34 = objc_claimAutoreleasedReturnValue();
    WeakRetained = v48;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v50 = v41;
      v51 = 2112;
      v52 = v42;
      v53 = 2112;
      v54 = v33;
      _os_log_debug_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_DEBUG, "%@, %@, fetched hindsight visit, %@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    v35 = v47;
    v36 = v45;
  }
  else
  {
    v37 = *(_QWORD *)(a1 + 64);
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0D18598];
    v55 = *MEMORY[0x1E0CB2D50];
    v56[0] = CFSTR("anotherSwelf is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", v39, 0, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v37 + 16))(v37, 0, v36);
  }

}

- (void)_fetchHindsightVisitsBetweenStartDate:(id)a3 endDate:(id)a4 ascending:(BOOL)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29[2];
  BOOL v30;
  id location;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v13)
  {
    if (v11)
    {
      if (v12)
      {
        if (-[RTLearnedLocationManager available](self, "available"))
        {
          objc_initWeak(&location, self);
          -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke;
          v25[3] = &unk_1E9298F78;
          objc_copyWeak(v29, &location);
          v28 = v13;
          v26 = v11;
          v15 = v12;
          v30 = a5;
          v27 = v15;
          v29[1] = (id)a2;
          objc_msgSend(v14, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:handler:", v26, v15, v25);

          objc_destroyWeak(v29);
          objc_destroyWeak(&location);
        }
        else
        {
          v22 = (void *)MEMORY[0x1E0CB35C8];
          v32 = *MEMORY[0x1E0CB2D50];
          v33 = CFSTR("resource temporarily unavailable.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v24);

        }
      }
      else
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0CB2D50];
        v35 = CFSTR("requires a valid endDate.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v21);

      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      v37[0] = CFSTR("requires a valid startDate.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v18);

    }
  }

}

void __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23[2];
  char v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke_2;
    v17[3] = &unk_1E9298F50;
    objc_copyWeak(v23, (id *)(a1 + 56));
    v17[4] = v8;
    v22 = *(id *)(a1 + 48);
    v18 = v5;
    v19 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 40);
    v10 = v6;
    v24 = *(_BYTE *)(a1 + 72);
    v11 = *(void **)(a1 + 64);
    v21 = v10;
    v23[1] = v11;
    dispatch_async(v9, v17);

    objc_destroyWeak(v23);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18598];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("swelf is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v16);

  }
}

void __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id *from;
  id obj;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *context;
  uint64_t v41;
  void *v42;
  void *v43;
  _QWORD block[4];
  id v45;
  id v46;
  id v47[2];
  char v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  NSObject *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _QWORD v64[2];
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[4];

  v74[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v4 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    from = v2;
    v43 = WeakRetained;
    v42 = (void *)objc_opt_new();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(*(id *)(a1 + 40), "count");
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      v9 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 134218754;
      v66 = v6;
      v67 = 2112;
      v68 = v7;
      v69 = 2112;
      v70 = v8;
      v71 = 2112;
      v72 = v9;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "fetched %lu LOIs for visits between start date, %@, end date, %@, error, %@", buf, 0x2Au);
    }

    v10 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("entryDate"), *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v11;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("entryDate"), *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = dispatch_group_create();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v17 = a1;
    obj = *(id *)(a1 + 40);
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (v39)
    {
      v37 = *(_QWORD *)v59;
      v38 = v14;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v59 != v37)
            objc_enumerationMutation(obj);
          v41 = v18;
          v19 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v18);
          context = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v19, "visits");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "filteredArrayUsingPredicate:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v22 = v21;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v55;
            do
            {
              v26 = 0;
              do
              {
                if (*(_QWORD *)v55 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v26);
                v28 = (void *)MEMORY[0x1D8231EA8]();
                dispatch_group_enter(v15);
                v49[0] = MEMORY[0x1E0C809B0];
                v49[1] = 3221225472;
                v49[2] = __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke_135;
                v49[3] = &unk_1E9298F00;
                v50 = *(id *)(v17 + 64);
                v51 = v16;
                v52 = v42;
                v53 = v15;
                objc_msgSend(v43, "_visitFromLearnedVisit:learnedLOI:handler:", v27, v19, v49);

                objc_autoreleasePoolPop(v28);
                ++v26;
              }
              while (v24 != v26);
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
            }
            while (v24);
          }

          objc_autoreleasePoolPop(context);
          v18 = v41 + 1;
          v14 = v38;
        }
        while (v41 + 1 != v39);
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      }
      while (v39);
    }

    v4 = v43;
    objc_msgSend(v43, "queue");
    v29 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke_2_137;
    block[3] = &unk_1E9298F28;
    objc_copyWeak(v47, from);
    v30 = *(id *)(v17 + 72);
    v48 = *(_BYTE *)(v17 + 96);
    v45 = v42;
    v46 = v30;
    v47[1] = *(id *)(v17 + 88);
    v31 = v42;
    dispatch_group_notify(v15, v29, block);

    objc_destroyWeak(v47);
  }
  else
  {
    v32 = *(_QWORD *)(a1 + 72);
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0D18598];
    v73 = *MEMORY[0x1E0CB2D50];
    v74[0] = CFSTR("swelf is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 0, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, NSObject *))(v32 + 16))(v32, 0, v15);
  }

}

void __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke_135(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", a3);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke_2_137(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entry"), *(unsigned __int8 *)(a1 + 64));
    v4 = *(void **)(a1 + 32);
    v20 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      v18 = 2048;
      v19 = objc_msgSend(v6, "count");
      _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, %@, fetched hindsight visits count, %lu", (uint8_t *)&v14, 0x20u);

    }
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6, 0);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D18598];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = CFSTR("yetAnotherSwelf is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 0, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v6);
  }

}

- (void)fetchHindsightVisitsBetweenStartDate:(id)a3 endDate:(id)a4 ascending:(BOOL)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__RTLearnedLocationManager_fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke;
  block[3] = &unk_1E9298FA0;
  block[4] = self;
  v18 = v10;
  v21 = a5;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

uint64_t __91__RTLearnedLocationManager_fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchHindsightVisitsBetweenStartDate:endDate:ascending:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)_fetchAllLocationsOfInterestWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (-[RTLearnedLocationManager available](self, "available"))
    {
      -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __68__RTLearnedLocationManager__fetchAllLocationsOfInterestWithHandler___block_invoke;
      v10[3] = &unk_1E9297EE0;
      v10[4] = self;
      v11 = v4;
      objc_msgSend(v5, "fetchAllLocationsOfInterestWithHandler:", v10);

    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0D18598];
      v12 = *MEMORY[0x1E0CB2D50];
      v13[0] = CFSTR("resource temporarily unavailable.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 5, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);

    }
  }

}

void __68__RTLearnedLocationManager__fetchAllLocationsOfInterestWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__RTLearnedLocationManager__fetchAllLocationsOfInterestWithHandler___block_invoke_2;
  block[3] = &unk_1E9298DC0;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __68__RTLearnedLocationManager__fetchAllLocationsOfInterestWithHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchAllLocationsOfInterestWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__RTLearnedLocationManager_fetchAllLocationsOfInterestWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __67__RTLearnedLocationManager_fetchAllLocationsOfInterestWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchAllLocationsOfInterestWithHandler:", *(_QWORD *)(a1 + 40));
}

+ (double)distanceThresholdFromUncertainty:(double)a3 otherUncertainty:(double)a4
{
  double v4;
  double v5;

  v4 = a3 + a4;
  v5 = 250.0;
  if (v4 <= 250.0)
    v5 = v4;
  if (v4 >= 200.0)
    return v5;
  else
    return 200.0;
}

- (BOOL)_matchLocation:(id)a3 locationOfInterest:(id)a4 minCircleOverlapThreshold:(double)a5 error:(id *)a6
{
  __CFString *v10;
  id v11;
  RTDistanceCalculator *distanceCalculator;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  double v22;
  double v23;
  RTDistanceCalculator *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v29;
  const __CFString *v30;
  const __CFString *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  double v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = a4;
  distanceCalculator = self->_distanceCalculator;
  objc_msgSend(v11, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v10, v14, &v33);
  v16 = v15;
  v17 = v33;

  if (v17)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v17);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_13;
    *(_DWORD *)buf = 138412546;
    v35 = v11;
    v36 = 2112;
    v37 = *(double *)&v17;
    v19 = "Matching candidate, %@, rejected because of a distance computation error, %@";
    v20 = v18;
    v21 = 22;
    goto LABEL_9;
  }
  -[__CFString horizontalUncertainty](v10, "horizontalUncertainty");
  if (v16 > v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
LABEL_13:
      LOBYTE(v27) = 0;
      goto LABEL_14;
    }
    -[__CFString horizontalUncertainty](v10, "horizontalUncertainty");
    *(_DWORD *)buf = 138413058;
    v35 = v11;
    v36 = 2048;
    v37 = v16;
    v38 = 2112;
    v39 = v10;
    v40 = 2048;
    v41 = v23;
    v19 = "Matching candidate, %@, rejected because of the distance %.2f to region, %@, greater than region radius, %.2f";
    v20 = v18;
    v21 = 42;
LABEL_9:
    _os_log_debug_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
    goto LABEL_13;
  }
  v24 = self->_distanceCalculator;
  objc_msgSend(v11, "location");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "location");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v27 = -[RTDistanceCalculator checkFractionAreaOverlapBetweenLocation:otherLocation:largerThanThreshold:error:](v24, "checkFractionAreaOverlapBetweenLocation:otherLocation:largerThanThreshold:error:", v10, v26, &v32, a5);
  v18 = v32;

  if (v18)
  {
    if (!a6)
      goto LABEL_13;
    v18 = objc_retainAutorelease(v18);
    LOBYTE(v27) = 0;
    *a6 = v18;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v30 = CFSTR("NO");
      if (v27)
        v30 = CFSTR("YES");
      *(_DWORD *)buf = 138413058;
      v35 = v11;
      v36 = 2112;
      v37 = *(double *)&v30;
      v31 = CFSTR("larger");
      if (!v27)
        v31 = CFSTR("less");
      v38 = 2112;
      v39 = v31;
      v40 = 2048;
      v41 = a5;
      _os_log_debug_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEBUG, "Matching candidate, %@, selected?, %@, because of the overlap percentage is %@ than threshold, %.2f", buf, 0x2Au);
    }

    v18 = 0;
  }
LABEL_14:

  return v27;
}

- (id)_getMatchingLocationsOfIntrestWithLocation:(id)a3 locationsOfInterest:(id)a4 minCircleOverlapThreshold:(double)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  id v19;
  NSObject *v20;
  __int128 v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v25;
    *(_QWORD *)&v13 = 138412802;
    v22 = v13;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16);
        v23 = 0;
        v18 = -[RTLearnedLocationManager _matchLocation:locationOfInterest:minCircleOverlapThreshold:error:](self, "_matchLocation:locationOfInterest:minCircleOverlapThreshold:error:", v8, v17, &v23, a5, v22);
        v19 = v23;
        if (v18)
          objc_msgSend(v10, "addObject:", v17);
        if (v19)
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v22;
            v29 = v19;
            v30 = 2112;
            v31 = v8;
            v32 = 2112;
            v33 = v17;
            _os_log_debug_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEBUG, "an error, %@, has occurred matching location, %@, with location of interest, %@", buf, 0x20u);
          }

        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v14);
  }

  return v10;
}

- (id)_selectLocationOfInterestWithLargestDwellTimeFromLocationsOfInterest:(id)a3 dwellTimePercentageThreshold:(double)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  double v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t j;
  void *v20;
  double v21;
  double v22;
  double v23;
  id v25;
  NSObject *v26;
  NSObject *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v29 = v5;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v35;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "dwellTime");
          v10 = v10 + v12;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 0.0;
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    if (v15)
    {
      v16 = v15;
      v13 = 0;
      v17 = *(_QWORD *)v31;
      v18 = -1.0;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend(v20, "dwellTime");
          v22 = v21;
          v23 = v21 / v10;
          if (v21 / v10 > a4 && v21 > v18)
          {
            v25 = v20;

            v13 = v25;
            v18 = v22;
          }
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v39 = v20;
            v40 = 2048;
            v41 = v22;
            v42 = 2048;
            v43 = v23;
            _os_log_debug_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEBUG, "Selection candidate, %@, dwell time, %.2f, percentage dwell time, %.2f", buf, 0x20u);
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
      }
      while (v16);
    }
    else
    {
      v13 = 0;
      v18 = -1.0;
    }

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v39 = v13;
      v40 = 2048;
      v41 = v18;
      v42 = 2048;
      v43 = v18 / v10;
      _os_log_debug_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEBUG, "Selection, %@, max dwell time, %.2f, percentage dwell time, %.2f", buf, 0x20u);
    }

    v5 = v29;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_getLocationOfInterestAtLocation:(id)a3 fromLocationsOfInterest:(id)a4 minCircleOverlapThreshold:(double)a5 dwellTimePercentageThreshold:(double)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (v12)
  {
    -[RTLearnedLocationManager _getMatchingLocationsOfIntrestWithLocation:locationsOfInterest:minCircleOverlapThreshold:](self, "_getMatchingLocationsOfIntrestWithLocation:locationsOfInterest:minCircleOverlapThreshold:", v12, v13, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v20 = 134218242;
      v21 = objc_msgSend(v13, "count");
      v22 = 2112;
      v23 = v12;
      _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "Matched, %lu, locations of interest in region, %@", (uint8_t *)&v20, 0x16u);
    }

    -[RTLearnedLocationManager _selectLocationOfInterestWithLargestDwellTimeFromLocationsOfInterest:dwellTimePercentageThreshold:](self, "_selectLocationOfInterestWithLargestDwellTimeFromLocationsOfInterest:dwellTimePercentageThreshold:", v14, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a7)
    {
      v16 = 0;
      goto LABEL_8;
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0D18598];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("requires a valid location.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 0, v14);
    v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
  return v16;
}

- (void)_fetchLocationOfInterestForRegion:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v6;
        _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Fetching location of interest for region, %@", buf, 0xCu);
      }

      objc_msgSend(v6, "horizontalUncertainty");
      if (v9 <= 400.0)
      {
        objc_msgSend(v6, "horizontalUncertainty");
        v21 = v20;
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __70__RTLearnedLocationManager__fetchLocationOfInterestForRegion_handler___block_invoke;
        v22[3] = &unk_1E9298FC8;
        v24 = v7;
        v22[4] = self;
        v23 = v6;
        -[RTLearnedLocationManager _fetchLocationsOfInterestWithinDistance:ofLocation:handler:](self, "_fetchLocationsOfInterestWithinDistance:ofLocation:handler:", v23, v22, v21);

        v14 = v24;
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v11 = *MEMORY[0x1E0D18598];
        v25 = *MEMORY[0x1E0CB2D50];
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "horizontalUncertainty");
        objc_msgSend(v12, "stringWithFormat:", CFSTR("Region radius, %.2f, is greater than the threshold, %.2f"), v13, 0x4079000000000000);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 7, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v16);

      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D18598];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = CFSTR("requires a valid location.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 0, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v19);

    }
  }

}

void __70__RTLearnedLocationManager__fetchLocationOfInterestForRegion_handler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(a1[6] + 16))();
    +[RTRegionToLocationOfInterestMatchingMetrics submitMetricsWithDistanceCalculator:region:locationOfInterest:matchingError:numberOfMatches:](RTRegionToLocationOfInterestMatchingMetrics, "submitMetricsWithDistanceCalculator:region:locationOfInterest:matchingError:numberOfMatches:", *(_QWORD *)(a1[4] + 48), a1[5], 0, v6, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(v5, "count");
      v9 = a1[5];
      *(_DWORD *)buf = 134218242;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Found, %lu, locations of interest in region, %@", buf, 0x16u);
    }

    v10 = (void *)a1[4];
    v11 = a1[5];
    v16 = 0;
    objc_msgSend(v10, "_getLocationOfInterestAtLocation:fromLocationsOfInterest:minCircleOverlapThreshold:dwellTimePercentageThreshold:error:", v11, v5, &v16, 0.9, 0.6667);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = a1[5];
      *(_DWORD *)buf = 138412546;
      v18 = (uint64_t)v12;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "Fetched location of interest, %@, for region, %@", buf, 0x16u);
    }

    (*(void (**)(void))(a1[6] + 16))();
    +[RTRegionToLocationOfInterestMatchingMetrics submitMetricsWithDistanceCalculator:region:locationOfInterest:matchingError:numberOfMatches:](RTRegionToLocationOfInterestMatchingMetrics, "submitMetricsWithDistanceCalculator:region:locationOfInterest:matchingError:numberOfMatches:", *(_QWORD *)(a1[4] + 48), a1[5], v12, v13, objc_msgSend(v5, "count"));

  }
}

- (void)fetchLocationOfInterestForRegion:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__RTLearnedLocationManager_fetchLocationOfInterestForRegion_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __69__RTLearnedLocationManager_fetchLocationOfInterestForRegion_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationOfInterestForRegion:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (double)_weeksInLearnedLocationsOfInterestModel
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  _QWORD v20[4];
  NSObject *v21;
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

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__17;
  v33 = __Block_byref_object_dispose__17;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__17;
  v27 = __Block_byref_object_dispose__17;
  v28 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__RTLearnedLocationManager__weeksInLearnedLocationsOfInterestModel__block_invoke;
  v20[3] = &unk_1E9298FF0;
  v22 = &v29;
  v6 = v3;
  v21 = v6;
  objc_msgSend(v4, "fetchLocationOfInterestVisitedFirstWithHandler:", v20);

  dispatch_group_enter(v6);
  -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  v15 = 3221225472;
  v16 = __67__RTLearnedLocationManager__weeksInLearnedLocationsOfInterestModel__block_invoke_2;
  v17 = &unk_1E9298FF0;
  v19 = &v23;
  v8 = v6;
  v18 = v8;
  objc_msgSend(v7, "fetchLocationOfInterestVisitedLastWithHandler:", &v14);

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)v24[5], "exitDate", v14, v15, v16, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v30[5], "entryDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11 / 604800.0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v12;
}

void __67__RTLearnedLocationManager__weeksInLearnedLocationsOfInterestModel__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "visits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__RTLearnedLocationManager__weeksInLearnedLocationsOfInterestModel__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "visits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (double)maxDistanceFromInterval:(double)a3 velocity:(double)a4
{
  BOOL v4;
  double result;

  v4 = a4 <= 0.0 || a3 <= 0.0;
  result = a3 * a4;
  if (v4)
    return 288000.0;
  return result;
}

- (void)_fetchModeAtLocation:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  void (**v31)(id, _QWORD, void *);
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "horizontalUncertainty");
      if (v8 > 250.0)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v10 = *MEMORY[0x1E0D18598];
        v34 = *MEMORY[0x1E0CB2D50];
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "horizontalUncertainty");
        objc_msgSend(v11, "stringWithFormat:", CFSTR("Horizontal Uncertainity, %.2f, is greater than the Threshold, %.2f,"), v12, 0x406F400000000000);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 7, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, v15);

LABEL_11:
        goto LABEL_12;
      }
      if (-[RTLearnedLocationManager available](self, "available"))
      {
        -[RTLearnedLocationManager _weeksInLearnedLocationsOfInterestModel](self, "_weeksInLearnedLocationsOfInterestModel");
        if (v21 >= 2.0)
        {
          objc_msgSend((id)objc_opt_class(), "maxDistanceFromInterval:velocity:", 5400.0, 20.0);
          v26 = v25;
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1209600.0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __57__RTLearnedLocationManager__fetchModeAtLocation_handler___block_invoke;
          v29[3] = &unk_1E9298FC8;
          v30 = v27;
          v31 = v7;
          v29[4] = self;
          v28 = v27;
          -[RTLearnedLocationManager _fetchLocationsOfInterestWithinDistance:ofLocation:handler:](self, "_fetchLocationsOfInterestWithinDistance:ofLocation:handler:", v6, v29, v26);

        }
        else
        {
          v7[2](v7, 0, 0);
        }
        goto LABEL_12;
      }
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0D18598];
      v32 = *MEMORY[0x1E0CB2D50];
      v33 = CFSTR("resource temporarily unavailable.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v22;
      v19 = v23;
      v20 = 5;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D18598];
      v36 = *MEMORY[0x1E0CB2D50];
      v37[0] = CFSTR("requires a valid location.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v16;
      v19 = v17;
      v20 = 0;
    }
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, v20, v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v24);

    goto LABEL_11;
  }
LABEL_12:

}

void __57__RTLearnedLocationManager__fetchModeAtLocation_handler___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a3)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v4 = (void *)a1[4];
    v5 = a1[5];
    v10 = 0;
    objc_msgSend(v4, "_getLocationsOfInterestVisitedBeforeDate:fromLocationsOfInterest:error:", v5, a2, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v8 = a1[6];
    if (objc_msgSend(v6, "count"))
      v9 = 1;
    else
      v9 = 2;
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v9, v7);

  }
}

- (void)fetchModeAtLocation:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__RTLearnedLocationManager_fetchModeAtLocation_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __56__RTLearnedLocationManager_fetchModeAtLocation_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchModeAtLocation:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      if (-[RTLearnedLocationManager available](self, "available"))
      {
        -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __75__RTLearnedLocationManager__fetchLocationOfInterestWithIdentifier_handler___block_invoke;
        v18[3] = &unk_1E9299018;
        v19 = v7;
        objc_msgSend(v8, "fetchLocationOfInterestWithIdentifier:handler:", v6, v18);

        v9 = v19;
LABEL_8:

        goto LABEL_9;
      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v20 = *MEMORY[0x1E0CB2D50];
      v21 = CFSTR("resource temporarily unavailable.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      v13 = v16;
      v14 = 5;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0D18598];
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = CFSTR("requires a valid identifier.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = v11;
      v14 = 0;
    }
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v17);

    goto LABEL_8;
  }
LABEL_9:

}

uint64_t __75__RTLearnedLocationManager__fetchLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__RTLearnedLocationManager_fetchLocationOfInterestWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __74__RTLearnedLocationManager_fetchLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationOfInterestWithIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchVisitIdentifiersIn:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (-[RTLearnedLocationManager available](self, "available"))
    {
      -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __61__RTLearnedLocationManager__fetchVisitIdentifiersIn_handler___block_invoke;
      v13[3] = &unk_1E9297EE0;
      v13[4] = self;
      v14 = v7;
      objc_msgSend(v8, "fetchVisitIdentifiersIn:handler:", v6, v13);

    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0D18598];
      v15 = *MEMORY[0x1E0CB2D50];
      v16[0] = CFSTR("resource temporarily unavailable.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

    }
  }

}

void __61__RTLearnedLocationManager__fetchVisitIdentifiersIn_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__RTLearnedLocationManager__fetchVisitIdentifiersIn_handler___block_invoke_2;
  block[3] = &unk_1E9298DC0;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __61__RTLearnedLocationManager__fetchVisitIdentifiersIn_handler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchVisitIdentifiersIn:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__RTLearnedLocationManager_fetchVisitIdentifiersIn_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __60__RTLearnedLocationManager_fetchVisitIdentifiersIn_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitIdentifiersIn:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (-[RTLearnedLocationManager available](self, "available"))
    {
      -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __78__RTLearnedLocationManager__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke;
      v16[3] = &unk_1E9297EE0;
      v16[4] = self;
      v17 = v10;
      objc_msgSend(v11, "fetchLocationOfInterestTransitionsBetweenStartDate:endDate:handler:", v8, v9, v16);

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D18598];
      v18 = *MEMORY[0x1E0CB2D50];
      v19[0] = CFSTR("resource temporarily unavailable.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 5, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v15);

    }
  }

}

void __78__RTLearnedLocationManager__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__RTLearnedLocationManager__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_2;
  block[3] = &unk_1E9298DC0;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __78__RTLearnedLocationManager__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__RTLearnedLocationManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __77__RTLearnedLocationManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchTransitionsBetweenStartDate:endDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_addLocationOfInterestWithType:(unint64_t)a3 mapItem:(id)a4 customLabel:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  unint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  if (v10)
  {
    -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predicateForObjectsFromCurrentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke;
    v20[3] = &unk_1E9299108;
    v20[4] = self;
    v23 = v13;
    v21 = v10;
    v22 = v11;
    v24 = a3;
    objc_msgSend(v16, "fetchPlaceWithMapItem:predicate:handler:", v21, v15, v20);

LABEL_5:
    goto LABEL_6;
  }
  if (v12)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0D18598];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("requires a valid mapItem.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 0, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v19);

    goto LABEL_5;
  }
LABEL_6:

}

void __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_2;
  block[3] = &unk_1E92990E0;
  v13 = v6;
  v18 = *(id *)(a1 + 56);
  v14 = v5;
  v15 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 32);
  v16 = v8;
  v17 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

void __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  RTLearnedPlace *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  RTLearnedPlace *v38;
  void *v39;
  uint64_t v40;
  RTLearnedPlace *v41;
  RTLearnedPlace *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  RTLearnedPlace *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  RTLearnedPlace *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  RTLearnedPlace *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  uint64_t v107;
  _QWORD v108[5];
  RTLearnedPlace *v109;
  id v110;
  uint64_t v111;
  id v112;
  RTLearnedPlace *v113;
  _QWORD v114[2];
  _QWORD v115[4];

  v115[2] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 72);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
    return;
  }
  v3 = *(void **)(a1 + 40);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_alloc(MEMORY[0x1E0D18330]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "geoAddressData");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "subPremises");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "subThoroughfare");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "thoroughfare");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "subLocality");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "locality");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "subAdministrativeArea");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "administrativeArea");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "administrativeAreaCode");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "postalCode");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "country");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "countryCode");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "inlandWater");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "ocean");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "areasOfInterest");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v69, "isIsland");
    v87 = v16;
    objc_msgSend(v16, "dateByAddingTimeInterval:", 4838400.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "iso3166CountryCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "address");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "iso3166SubdivisionCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v64) = v17;
    v89 = objc_msgSend(v88, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v105, v102, v99, v97, v95, v94, v93, v92, v91, v90, v72, v70, v67, v68, v66,
            v65,
            v64,
            v16,
            v18,
            v20,
            v22);

    v106 = objc_alloc(MEMORY[0x1E0D183E8]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "name");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "category");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "location");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(*(id *)(a1 + 48), "source");
    v24 = objc_msgSend(*(id *)(a1 + 48), "mapItemPlaceType");
    v25 = objc_msgSend(*(id *)(a1 + 48), "muid");
    v26 = objc_msgSend(*(id *)(a1 + 48), "resultProviderID");
    objc_msgSend(*(id *)(a1 + 48), "geoMapItemHandle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v16;
    objc_msgSend(v16, "dateByAddingTimeInterval:", 4838400.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "extendedAttributes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "displayLanguage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v63) = objc_msgSend(*(id *)(a1 + 48), "disputed");
    v107 = objc_msgSend(v106, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v103, v100, v98, v89, v23, v96, v24, v25, v26, v27, v28, v29, v30, v31, v63);

    v32 = v28;
    v33 = (void *)v107;

    v34 = [RTLearnedPlace alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v32, "dateByAddingTimeInterval:", 4838400.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v34, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v35, 0, 0, v107, v36, v32, v37);

    -[RTLearnedPlace mapItem](v38, "mapItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v40 = *(_QWORD *)(a1 + 80);
      if ((unint64_t)(v40 - 1) < 2)
      {

        goto LABEL_11;
      }

      if (v40 == 3)
      {
LABEL_11:
        v41 = v38;
        v42 = [RTLearnedPlace alloc];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = *(_QWORD *)(a1 + 80);
        -[RTLearnedPlace mapItem](v41, "mapItem");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedPlace customLabel](v41, "customLabel");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedPlace creationDate](v41, "creationDate");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedPlace expirationDate](v41, "expirationDate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v42, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v43, v44, 4, v45, v46, v47, v48);

        v50 = *(void **)(a1 + 64);
        v112 = 0;
        objc_msgSend(v50, "_updateContactsWithLearnedPlace:originalLearnedPlace:error:", v49, v41, &v112);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v112;
        v53 = v52;
        v38 = v41;
        if (v51)
        {
          v38 = v41;
          if (!v52)
          {
            v101 = [RTLearnedPlace alloc];
            objc_msgSend(v51, "identifier");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "mapItem");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "customLabel");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "creationDate");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "expirationDate");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v101, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v104, 0, 0, v54, v55, v56, v57);

          }
        }

        v32 = v87;
        v58 = (void *)v89;
        v33 = (void *)v107;
        goto LABEL_16;
      }
    }
    v58 = (void *)v89;
LABEL_16:
    objc_msgSend(*(id *)(a1 + 64), "learnedLocationStore");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = MEMORY[0x1E0C809B0];
    v108[1] = 3221225472;
    v108[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_3;
    v108[3] = &unk_1E92990B8;
    v61 = *(void **)(a1 + 72);
    v108[4] = *(_QWORD *)(a1 + 64);
    v109 = v38;
    v110 = v61;
    v111 = *(_QWORD *)(a1 + 80);
    v62 = v38;
    objc_msgSend(v59, "storePlaces:handler:", v60, v108);

    return;
  }
  if (*(_QWORD *)(a1 + 72))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("locationOfInterest, %@, with this mapItem, %@, already exists,"), v6, *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(a1 + 72);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D18598];
    v11 = *MEMORY[0x1E0CB2D50];
    v115[0] = v7;
    v12 = *MEMORY[0x1E0D18588];
    v114[0] = v11;
    v114[1] = v12;
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v115[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, v114, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v15);

  }
}

void __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_4;
  block[3] = &unk_1E9299090;
  v9 = v3;
  v12 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  RTLearnedPlace *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RTLearnedPlace *v10;
  RTLearnedLocation *v11;
  void *v12;
  void *v13;
  RTLearnedLocation *v14;
  RTLearnedLocationOfInterest *v15;
  void *v16;
  RTLearnedLocationOfInterest *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 56);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    v3 = [RTLearnedPlace alloc];
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "customLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "expirationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v3, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v4, v5, 4, v6, v7, v8, v9);

    v11 = [RTLearnedLocation alloc];
    objc_msgSend(*(id *)(a1 + 40), "mapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[RTLearnedLocation initWithLocation:dataPointCount:type:](v11, "initWithLocation:dataPointCount:type:", v13, 0, 2);

    v15 = [RTLearnedLocationOfInterest alloc];
    -[RTLearnedPlace identifier](v10, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v15, "initWithIdentifier:location:place:visits:transitions:", v16, v14, v10, 0, 0);

    objc_msgSend(*(id *)(a1 + 48), "learnedLocationStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_5;
    v21[3] = &unk_1E9299068;
    v20 = *(void **)(a1 + 56);
    v21[4] = *(_QWORD *)(a1 + 48);
    v23 = v20;
    v22 = *(id *)(a1 + 40);
    objc_msgSend(v18, "storeLocationsOfInterest:handler:", v19, v21);

  }
}

void __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_6;
  v9[3] = &unk_1E9299040;
  v10 = v3;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v13 = v5;
  v11 = v6;
  v12 = v7;
  v8 = v3;
  dispatch_async(v4, v9);

}

void __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 56);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "learnedLocationStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_7;
    v5[3] = &unk_1E9299018;
    v6 = *(id *)(a1 + 56);
    objc_msgSend(v3, "fetchLocationOfInterestWithIdentifier:handler:", v4, v5);

  }
}

uint64_t __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)addLocationOfInterestWithType:(unint64_t)a3 mapItem:(id)a4 customLabel:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__RTLearnedLocationManager_addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke;
  block[3] = &unk_1E9297910;
  v20 = v12;
  v21 = a3;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

uint64_t __86__RTLearnedLocationManager_addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addLocationOfInterestWithType:mapItem:customLabel:handler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)_updateContactsWithLearnedPlace:(id)a3 originalLearnedPlace:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  RTLearnedPlace *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void **v20;
  uint64_t *v21;
  NSObject *v22;
  RTContactsManager *contactsManager;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  RTContactsManager *v35;
  id v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  RTContactsManager *v54;
  id v55;
  NSObject *v56;
  int v57;
  int v58;
  void *v59;
  RTContactsManager *v60;
  NSObject *v61;
  int v62;
  int v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  int v69;
  NSObject *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  RTLearnedPlace *v97;
  void *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  id v107;
  __int16 v108;
  id v109;
  __int16 v110;
  id v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  _QWORD v115[3];

  v115[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      v11 = objc_msgSend(v8, "type");
      v12 = objc_msgSend(v10, "type");
      objc_msgSend(v8, "mapItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mapItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqual:", v14) && v11 == v12)
      {
        v15 = (RTLearnedPlace *)v8;
LABEL_85:

        goto LABEL_86;
      }
      contactsManager = self->_contactsManager;
      v103 = 0;
      -[RTContactsManager addressIdentifierOfMeCardWithAddressFromMapItem:error:](contactsManager, "addressIdentifierOfMeCardWithAddressFromMapItem:error:", v14, &v103);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v103;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v105 = v98;
        v106 = 2112;
        v107 = v24;
        _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "address identifier of meCard with address of mapItem, %@, error, %@", buf, 0x16u);
      }

      if (v24)
      {
        objc_msgSend(v24, "domain");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "isEqualToString:", CFSTR("RTContactsManagerErrorDomain")))
        {
          v27 = objc_msgSend(v24, "code");

          if (v27 == 1)
          {
            v15 = (RTLearnedPlace *)v8;
LABEL_84:

            goto LABEL_85;
          }
        }
        else
        {

        }
        v15 = 0;
        if (a5)
          *a5 = objc_retainAutorelease(v24);
        goto LABEL_84;
      }
      v94 = v12;
      if (v11 == 3)
      {
        v31 = 0;
        v30 = 1;
        v32 = 3;
        v28 = 3;
        v29 = 0;
      }
      else if (v11 == 2)
      {
        v31 = 0;
        v30 = 0;
        v32 = 2;
        v28 = 2;
        v29 = 1;
      }
      else
      {
        v28 = v11;
        if (v11 == 1)
        {
          v29 = 0;
          v30 = 0;
          v31 = 1;
          v32 = 1;
        }
        else
        {
          v31 = 0;
          v29 = 0;
          v30 = 0;
          v32 = 0;
        }
      }
      if (v98)
      {
        v91 = v29;
        if (v13 != v14)
        {
          v86 = v32;
          v88 = v28;
          v33 = v31;
          v34 = v30;
          v35 = self->_contactsManager;
          v102 = 0;
          -[RTContactsManager updateAddressOfMeCardWithAddressIdentifier:toAddressFromMapItem:error:](v35, "updateAddressOfMeCardWithAddressIdentifier:toAddressFromMapItem:error:", v98, v13, &v102);
          v36 = v102;
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v105 = v98;
            v106 = 2112;
            v107 = v13;
            v108 = 2112;
            v109 = v36;
            _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "updated address of meCard with address identifier, %@ to address from mapItem, %@, error, %@", buf, 0x20u);
          }

          v30 = v34;
          v31 = v33;
          v32 = v86;
          v28 = v88;
          if (v36)
          {
LABEL_38:
            objc_msgSend(v36, "domain");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v38, "isEqualToString:", CFSTR("RTContactsManagerErrorDomain")))
            {
              v39 = objc_msgSend(v36, "code");

              v24 = 0;
              if (v39 == 1)
              {
                v15 = (RTLearnedPlace *)v8;
LABEL_73:

                goto LABEL_84;
              }
            }
            else
            {

              v24 = 0;
            }
            v15 = 0;
            if (a5)
              *a5 = objc_retainAutorelease(v36);
            goto LABEL_73;
          }
        }
        if (v28 != v94)
        {
          v60 = self->_contactsManager;
          if ((v31 | v91 | v30) != 1)
          {
            v67 = v28;
            v68 = v31;
            v69 = v30;
            v100 = 0;
            -[RTContactsManager removeAddressOfMeCardWithAddressIdentifier:error:](v60, "removeAddressOfMeCardWithAddressIdentifier:error:", v98, &v100);
            v36 = v100;
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v105 = v98;
              v106 = 2112;
              v107 = v36;
              _os_log_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_INFO, "removed address of meCard with address identifier, %@, error, %@", buf, 0x16u);
            }

            if (v36)
              goto LABEL_38;
            v40 = v91;
            v30 = v69;
            v31 = v68;
            v28 = v67;
            goto LABEL_43;
          }
          v101 = 0;
          -[RTContactsManager updateAddressLabelTypeOfMeCardWithAddressIdentifier:toAddressLabelType:error:](v60, "updateAddressLabelTypeOfMeCardWithAddressIdentifier:toAddressLabelType:error:", v98, v32, &v101);
          v55 = v101;
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", v28);
            v90 = v28;
            v62 = v31;
            v63 = v30;
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v105 = v98;
            v106 = 2112;
            v107 = v64;
            v108 = 2112;
            v109 = v55;
            _os_log_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_INFO, "updated address label type of meCard with address identifier, %@, to, %@, error, %@", buf, 0x20u);

            v30 = v63;
            v31 = v62;
            v28 = v90;
          }

          if (v55)
          {
LABEL_60:
            objc_msgSend(v55, "domain");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v65, "isEqualToString:", CFSTR("RTContactsManagerErrorDomain")))
            {
              v66 = objc_msgSend(v55, "code");

              v24 = 0;
              if (v66 == 1)
              {
                v15 = (RTLearnedPlace *)v8;
LABEL_83:

                goto LABEL_84;
              }
            }
            else
            {

              v24 = 0;
            }
            v15 = 0;
            if (a5)
              *a5 = objc_retainAutorelease(v55);
            goto LABEL_83;
          }
        }
        v40 = v91;
      }
      else
      {
        if ((v31 | v29 | v30) != 1)
          goto LABEL_55;
        v92 = v29;
        v54 = self->_contactsManager;
        v99 = 0;
        v87 = v32;
        -[RTContactsManager addAddressToMeCardWithAddressLabelType:addressFromMapItem:error:](v54, "addAddressToMeCardWithAddressLabelType:addressFromMapItem:error:", v32, v13, &v99);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v99;
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          +[RTContactsManager addressLabelTypeToString:](RTContactsManager, "addressLabelTypeToString:", v87);
          v89 = v28;
          v57 = v31;
          v58 = v30;
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v105 = v59;
          v106 = 2112;
          v107 = v13;
          v108 = 2112;
          v109 = v98;
          v110 = 2112;
          v111 = v55;
          _os_log_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_INFO, "add address to meCard with address label type, %@, address from mapItem, %@, addressIdentifier, %@, error, %@", buf, 0x2Au);

          v30 = v58;
          v31 = v57;
          v28 = v89;
        }

        if (v55)
          goto LABEL_60;
        v40 = v92;
        if (!v98)
        {
LABEL_55:
          v15 = (RTLearnedPlace *)v8;
          v98 = 0;
LABEL_82:
          v24 = 0;
          goto LABEL_84;
        }
      }
LABEL_43:
      v41 = v28;
      v42 = v31;
      v43 = v30;
      objc_msgSend(v8, "mapItem");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "source");

      if (v41 != v94)
      {
        if ((v42 | v40 | v43) == 1)
        {
          v46 = objc_alloc(MEMORY[0x1E0D183F0]);
          objc_msgSend(v13, "extendedAttributes");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "identifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (!v47)
          {
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v13, "extendedAttributes");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "wifiConfidence");
          v51 = v50;
          objc_msgSend(v13, "extendedAttributes");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (void *)objc_msgSend(v46, "initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:", v48, v98, 1, objc_msgSend(v52, "wifiFingerprintLabelType"), v51);
          objc_msgSend(v13, "setExtendedAttributes:", v53);

          if (!v47)
          v45 |= 4uLL;
        }
        else
        {
          objc_msgSend(v13, "setExtendedAttributes:", 0);
          v45 &= ~4uLL;
        }
      }
      if (v13 != v14)
      {
        v71 = objc_alloc(MEMORY[0x1E0D183F0]);
        objc_msgSend(v13, "extendedAttributes");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "identifier");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v73;
        if (!v73)
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "extendedAttributes");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "wifiConfidence");
        v77 = v76;
        objc_msgSend(v13, "extendedAttributes");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = (void *)objc_msgSend(v71, "initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:", v74, v98, 1, objc_msgSend(v78, "wifiFingerprintLabelType"), v77);
        objc_msgSend(v13, "setExtendedAttributes:", v79);

        if (!v73)
        v45 = 4;
      }
      v80 = v13;
      objc_msgSend(v80, "setSource:", v45);
      v97 = [RTLearnedPlace alloc];
      objc_msgSend(v8, "identifier");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend(v8, "type");
      v81 = objc_msgSend(v8, "typeSource");
      objc_msgSend(v8, "customLabel");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "creationDate");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "expirationDate");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v97, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v95, v93, v81, v80, v82, v83, v84);

      goto LABEL_82;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("originalPlace required"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v105 = v13;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D18598];
      v112 = *MEMORY[0x1E0CB2D50];
      v113 = v13;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v113;
      v21 = &v112;
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("place required"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v105 = v13;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D18598];
      v114 = *MEMORY[0x1E0CB2D50];
      v115[0] = v13;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = (void **)v115;
      v21 = &v114;
LABEL_14:
      objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 0, v14);
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_85;
    }
  }
  v15 = 0;
LABEL_86:

  return v15;
}

- (void)_updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 mapItem:(id)a5 mapItemSource:(unint64_t)a6 customLabel:(id)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString **v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))v17;
  if (!v14)
  {
    if (!v17)
      goto LABEL_9;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0D18598];
    v36 = *MEMORY[0x1E0CB2D50];
    v37[0] = CFSTR("requires a valid identifier.");
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = (const __CFString **)v37;
    v24 = &v36;
LABEL_8:
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 0, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v18)[2](v18, 0, v26);

    goto LABEL_9;
  }
  if (!v15)
  {
    if (!v17)
      goto LABEL_9;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0D18598];
    v34 = *MEMORY[0x1E0CB2D50];
    v35 = CFSTR("requires a valid mapItem.");
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = &v35;
    v24 = &v34;
    goto LABEL_8;
  }
  -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke;
  v27[3] = &unk_1E9299180;
  v27[4] = self;
  v31 = v18;
  v28 = v14;
  v29 = v15;
  v30 = v16;
  v32 = a6;
  v33 = a4;
  objc_msgSend(v19, "fetchLocationOfInterestWithIdentifier:handler:", v28, v27);

LABEL_9:
}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_2;
  block[3] = &unk_1E9299158;
  v13 = v6;
  v14 = v5;
  v19 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = v9;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 72);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  id v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || (v5 = *(_QWORD *)(a1 + 40)) == 0)
  {
    if (!*(_QWORD *)(a1 + 80))
      return;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No location of interest exists with identifier %@."), *(_QWORD *)(a1 + 48));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Unable to update location of interest. %@", buf, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 80);
    if (*(_QWORD *)(a1 + 32))
    {
      (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 80), 0);
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0D18598];
      v26 = *MEMORY[0x1E0CB2D50];
      v27 = v2;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v17);

    }
  }
  else
  {
    v6 = *(void **)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v25 = 0;
    v8 = objc_msgSend(v6, "validateUpdatedMapItem:locationOfInterest:error:", v7, v5, &v25);
    v2 = v25;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "learnedLocationStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicateForObjectsFromCurrentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 56), "learnedLocationStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "place");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mapItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_168;
      v19[3] = &unk_1E9299130;
      v19[4] = *(_QWORD *)(a1 + 56);
      v23 = *(id *)(a1 + 80);
      v20 = *(id *)(a1 + 40);
      v21 = *(id *)(a1 + 64);
      v22 = *(id *)(a1 + 72);
      v24 = *(_OWORD *)(a1 + 88);
      objc_msgSend(v11, "fetchPlaceWithMapItem:predicate:handler:", v13, v10, v19);

    }
    else
    {
      v18 = *(_QWORD *)(a1 + 80);
      if (v18)
        (*(void (**)(uint64_t, _QWORD))(v18 + 16))(v18, 0);
    }
  }

}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_168(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_2_169;
  block[3] = &unk_1E9299158;
  v11 = v6;
  v17 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v18 = *(_OWORD *)(a1 + 72);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_2_169(uint64_t a1)
{
  NSObject *v2;
  RTLearnedPlace *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  RTLearnedPlace *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  RTLearnedLocationOfInterest *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  RTLearnedLocationOfInterest *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  RTLearnedPlace *v68;
  RTLearnedPlace *v69;
  _QWORD v70[5];
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  NSObject *v75;
  __int128 *p_buf;
  id v77;
  RTLearnedLocationOfInterest *v78;
  RTLearnedPlace *v79;
  __int128 buf;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;
  uint8_t v86[16];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v3 = [RTLearnedPlace alloc];
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 64);
      v6 = *(_QWORD *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 48), "creationDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "expirationDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v3, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v4, 0, 0, v5, v6, v7, v8);

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v81 = 0x3032000000;
      v82 = __Block_byref_object_copy__17;
      v83 = __Block_byref_object_dispose__17;
      v84 = 0;
      v9 = dispatch_semaphore_create(0);
      objc_msgSend(*(id *)(a1 + 56), "learnedLocationStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v69;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_170;
      v74[3] = &unk_1E9297038;
      p_buf = &buf;
      v12 = v9;
      v75 = v12;
      objc_msgSend(v10, "updatePlaces:handler:", v11, v74);

      v13 = v12;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v13, v15))
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", v14);
      v18 = v17;
      v19 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "submitToCoreAnalytics:type:duration:", v23, 1, v18);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v86 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v86, 2u);
      }

      v25 = (void *)MEMORY[0x1E0CB35C8];
      v85 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v86 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = objc_retainAutorelease(v27);

        v29 = 0;
      }
      else
      {
LABEL_12:
        v28 = 0;
        v29 = 1;
      }

      v30 = v28;
      if ((v29 & 1) == 0)
        objc_storeStrong((id *)(*((_QWORD *)&buf + 1) + 40), v28);
      v31 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      if (v31)
      {
        v32 = *(_QWORD *)(a1 + 80);
        if (v32)
          (*(void (**)(uint64_t, _QWORD, _QWORD))(v32 + 16))(v32, 0, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      }
      else
      {
        v68 = [RTLearnedPlace alloc];
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = *(_QWORD *)(a1 + 96);
        v49 = *(_QWORD *)(a1 + 64);
        v48 = *(_QWORD *)(a1 + 72);
        objc_msgSend(*(id *)(a1 + 48), "creationDate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "expirationDate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v68, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v46, v47, 4, v49, v48, v50, v51);

        v69 = (RTLearnedPlace *)v52;
      }

      _Block_object_dispose(&buf, 8);
      if (v31)
        goto LABEL_30;
    }
    else
    {
      v33 = *(void **)(a1 + 56);
      v34 = *(_QWORD *)(a1 + 64);
      v35 = *(_QWORD *)(a1 + 72);
      v36 = *(_QWORD *)(a1 + 88);
      v77 = 0;
      objc_msgSend(v33, "createAndStoreNewPlaceWithMapItem:customLabel:mapItemSource:outError:", v34, v35, v36, &v77);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v77;
      if (!v37)
      {
        v65 = *(_QWORD *)(a1 + 80);
        if (v65)
          (*(void (**)(uint64_t, _QWORD, id))(v65 + 16))(v65, 0, v38);
        v69 = 0;
        goto LABEL_29;
      }
      v39 = [RTLearnedPlace alloc];
      objc_msgSend(v37, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = *(_QWORD *)(a1 + 96);
      objc_msgSend(v37, "mapItem");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = *(_QWORD *)(a1 + 72);
      objc_msgSend(v37, "creationDate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "expirationDate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v39, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v40, v41, 4, v42, v43, v44, v45);

    }
    v53 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "place");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0;
    v55 = (id)objc_msgSend(v53, "_updateContactsWithLearnedPlace:originalLearnedPlace:error:", v69, v54, &v73);
    v38 = v73;

    if (v38)
    {
      v56 = *(_QWORD *)(a1 + 80);
      if (v56)
        (*(void (**)(uint64_t, _QWORD, id))(v56 + 16))(v56, 0, v38);
    }
    else
    {
      v57 = [RTLearnedLocationOfInterest alloc];
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "location");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "visits");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "transitions");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v57, "initWithIdentifier:location:place:visits:transitions:", v58, v59, v69, v60, v61);

      objc_msgSend(*(id *)(a1 + 56), "learnedLocationStore");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v62;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_2_171;
      v70[3] = &unk_1E9299068;
      v70[4] = *(_QWORD *)(a1 + 56);
      v72 = *(id *)(a1 + 80);
      v71 = *(id *)(a1 + 64);
      objc_msgSend(v63, "updateLocationsOfInterest:handler:", v64, v70);

      v38 = 0;
    }
LABEL_29:

LABEL_30:
    return;
  }
  if (*(_QWORD *)(a1 + 80))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "place");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "mapItem");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v67;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "Unable to fetch place from current device with mapItem. %@", (uint8_t *)&buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_170(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_2_171(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_3;
  v9[3] = &unk_1E9299040;
  v10 = v3;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v13 = v5;
  v11 = v6;
  v12 = v7;
  v8 = v3;
  dispatch_async(v4, v9);

}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 56);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "learnedLocationStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_4;
    v5[3] = &unk_1E9299018;
    v4 = *(_QWORD *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    objc_msgSend(v3, "fetchLocationOfInterestWithMapItem:handler:", v4, v5);

  }
}

uint64_t __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 mapItem:(id)a5 mapItemSource:(unint64_t)a6 customLabel:(id)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  unint64_t v29;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  -[RTNotifier queue](self, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke;
  block[3] = &unk_1E9298438;
  block[4] = self;
  v24 = v14;
  v28 = a4;
  v29 = a6;
  v25 = v15;
  v26 = v16;
  v27 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  dispatch_async(v18, block);

}

uint64_t __114__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLocationOfInterestWithIdentifier:type:mapItem:mapItemSource:customLabel:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_updateLocationOfInterestWithIdentifier:(id)a3 mapItem:(id)a4 mapItemSource:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString **v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  unint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  if (!v10)
  {
    if (!v12)
      goto LABEL_9;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("requires a valid identifier.");
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = (const __CFString **)v30;
    v19 = &v29;
LABEL_8:
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v21);

    goto LABEL_9;
  }
  if (!v11)
  {
    if (!v12)
      goto LABEL_9;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("requires a valid mapItem.");
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v28;
    v19 = &v27;
    goto LABEL_8;
  }
  -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __98__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_mapItem_mapItemSource_handler___block_invoke;
  v22[3] = &unk_1E92991D0;
  v22[4] = self;
  v25 = v13;
  v23 = v10;
  v24 = v11;
  v26 = a5;
  objc_msgSend(v14, "fetchLocationOfInterestWithIdentifier:handler:", v23, v22);

LABEL_9:
}

void __98__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_mapItem_mapItemSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_mapItem_mapItemSource_handler___block_invoke_2;
  block[3] = &unk_1E92991A8;
  v15 = v6;
  v16 = v5;
  v20 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v17 = v8;
  v18 = v9;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 64);
  v19 = v10;
  v21 = v11;
  v12 = v5;
  v13 = v6;
  dispatch_async(v7, block);

}

void __98__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_mapItem_mapItemSource_handler___block_invoke_2(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1[4])
  {
    v5 = a1[5];
    if (v5)
    {
      v6 = (void *)a1[7];
      v7 = a1[8];
      v21 = 0;
      v8 = objc_msgSend(v6, "validateUpdatedMapItem:locationOfInterest:error:", v7, v5, &v21);
      v2 = v21;
      if ((v8 & 1) == 0)
      {
        v20 = a1[9];
        if (v20)
          (*(void (**)(uint64_t, _QWORD))(v20 + 16))(v20, 0);
        goto LABEL_12;
      }
      v10 = a1[6];
      v9 = (void *)a1[7];
      objc_msgSend((id)a1[5], "place");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "type");
      v13 = a1[8];
      v14 = a1[10];
      objc_msgSend((id)a1[5], "place");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "customLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_updateLocationOfInterestWithIdentifier:type:mapItem:mapItemSource:customLabel:handler:", v10, v12, v13, v14, v16, a1[9]);

      goto LABEL_11;
    }
  }
  if (!a1[9])
    return;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No location of interest exists with identifier %@."), a1[6]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v2;
    _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Unable to update location of interest. %@", buf, 0xCu);
  }

  v4 = a1[9];
  if (!a1[4])
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0D18598];
    v22 = *MEMORY[0x1E0CB2D50];
    v23 = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 7, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v19);

LABEL_11:
    goto LABEL_12;
  }
  (*(void (**)(_QWORD, _QWORD))(v4 + 16))(a1[9], 0);
LABEL_12:

}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 mapItem:(id)a4 mapItemSource:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_mapItem_mapItemSource_handler___block_invoke;
  block[3] = &unk_1E9297910;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

uint64_t __97__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_mapItem_mapItemSource_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLocationOfInterestWithIdentifier:mapItem:mapItemSource:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)_updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if (v8)
  {
    -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_handler___block_invoke;
    v16[3] = &unk_1E92991F8;
    v16[4] = self;
    v18 = v10;
    v17 = v8;
    v19 = a4;
    objc_msgSend(v11, "fetchLocationOfInterestWithIdentifier:handler:", v17, v16);

  }
  else if (v9)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D18598];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("requires a valid identifier.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v15);

  }
}

void __81__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_handler___block_invoke_2;
  v12[3] = &unk_1E92975D8;
  v13 = v6;
  v14 = v5;
  v17 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = v9;
  v18 = *(_QWORD *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __81__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || (v5 = *(void **)(a1 + 40)) == 0)
  {
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No location of interest exists with identifier %@."), *(_QWORD *)(a1 + 48));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v2;
        _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Unable to update location of interest. %@", buf, 0xCu);
      }

      v4 = *(_QWORD *)(a1 + 64);
      if (*(_QWORD *)(a1 + 32))
      {
        (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 64), 0);
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = *MEMORY[0x1E0D18598];
        v20 = *MEMORY[0x1E0CB2D50];
        v21 = v2;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v18);

      }
    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 72);
    objc_msgSend(v5, "place");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "place");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mapItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "source");
    objc_msgSend(*(id *)(a1 + 40), "place");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "customLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateLocationOfInterestWithIdentifier:type:mapItem:mapItemSource:customLabel:handler:", v7, v8, v9, v12, v14, *(_QWORD *)(a1 + 64));

  }
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __80__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLocationOfInterestWithIdentifier:type:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_updateLocationOfInterestWithIdentifier:(id)a3 customLabel:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (v8)
  {
    -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __88__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke;
    v17[3] = &unk_1E9299270;
    v17[4] = self;
    v20 = v11;
    v18 = v8;
    v19 = v9;
    objc_msgSend(v12, "fetchLocationOfInterestWithIdentifier:handler:", v18, v17);

  }
  else if (v10)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18598];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = CFSTR("requires a valid identifier.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v16);

  }
}

void __88__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_2;
  v12[3] = &unk_1E9299220;
  v13 = v6;
  v14 = v5;
  v18 = a1[7];
  v15 = a1[5];
  v8 = a1[6];
  v9 = a1[4];
  v16 = v8;
  v17 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __88__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  RTLearnedPlace *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  RTLearnedPlace *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    if (!*(_QWORD *)(a1 + 72))
      return;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No location of interest exists with identifier %@."), *(_QWORD *)(a1 + 48));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Unable to update location of interest. %@", buf, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 72);
    if (*(_QWORD *)(a1 + 32))
    {
      (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 72), 0);
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0D18598];
      v33 = *MEMORY[0x1E0CB2D50];
      v34 = v2;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 7, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v22);

    }
  }
  else
  {
    v5 = [RTLearnedPlace alloc];
    objc_msgSend(*(id *)(a1 + 40), "place");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "place");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v28, "type");
    objc_msgSend(*(id *)(a1 + 40), "place");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v27, "typeSource");
    objc_msgSend(*(id *)(a1 + 40), "place");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "place");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "creationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "place");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "expirationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v5, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v26, v25, v6, v8, v9, v11, v13);

    v15 = *(void **)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "place");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v15, "_updateContactsWithLearnedPlace:originalLearnedPlace:error:", v14, v16, &v32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v32;

    if (v2)
    {
      v18 = *(_QWORD *)(a1 + 72);
      if (v18)
        (*(void (**)(uint64_t, _QWORD, id))(v18 + 16))(v18, 0, v2);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "learnedLocationStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 48);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __88__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_172;
      v30[3] = &unk_1E9299018;
      v31 = *(id *)(a1 + 72);
      objc_msgSend(v23, "updateLocationOfInterestWithIdentifier:place:handler:", v24, v17, v30);

    }
  }

}

uint64_t __88__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_172(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 customLabel:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __87__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLocationOfInterestWithIdentifier:customLabel:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 customLabel:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  if (v10)
  {
    -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __93__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke;
    v19[3] = &unk_1E92991D0;
    v19[4] = self;
    v22 = v13;
    v20 = v10;
    v23 = a4;
    v21 = v11;
    objc_msgSend(v14, "fetchLocationOfInterestWithIdentifier:handler:", v20, v19);

  }
  else if (v12)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("requires a valid identifier.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v18);

  }
}

void __93__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke_2;
  block[3] = &unk_1E92991A8;
  v13 = v6;
  v14 = v5;
  v18 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = v9;
  v19 = *(_QWORD *)(a1 + 64);
  v17 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

void __93__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || (v5 = *(void **)(a1 + 40)) == 0)
  {
    if (*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No location of interest exists with identifier %@."), *(_QWORD *)(a1 + 48));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v2;
        _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Unable to update location of interest. %@", buf, 0xCu);
      }

      v4 = *(_QWORD *)(a1 + 72);
      if (*(_QWORD *)(a1 + 32))
      {
        (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 72), 0);
      }
      else
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = *MEMORY[0x1E0D18598];
        v17 = *MEMORY[0x1E0CB2D50];
        v18 = v2;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v15);

      }
    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 80);
    objc_msgSend(v5, "place");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "place");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mapItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateLocationOfInterestWithIdentifier:type:mapItem:mapItemSource:customLabel:handler:", v7, v8, v9, objc_msgSend(v11, "source"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

  }
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 customLabel:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke;
  block[3] = &unk_1E9297910;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a4;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

uint64_t __92__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLocationOfInterestWithIdentifier:type:customLabel:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_trainForReason:(unint64_t)a3 mode:(unint64_t)a4 handler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  -[RTLearnedLocationManager learnedLocationEngine](self, "learnedLocationEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__RTLearnedLocationManager__trainForReason_mode_handler___block_invoke;
  v11[3] = &unk_1E9297568;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "trainForReason:mode:handler:", a3, a4, v11);

}

uint64_t __57__RTLearnedLocationManager__trainForReason_mode_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)trainForReason:(unint64_t)a3 mode:(unint64_t)a4 handler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a5;
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__RTLearnedLocationManager_trainForReason_mode_handler___block_invoke;
  v11[3] = &unk_1E9299248;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, v11);

}

uint64_t __56__RTLearnedLocationManager_trainForReason_mode_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trainForReason:mode:handler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)_forceRelabeling:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RTLearnedLocationManager learnedLocationEngine](self, "learnedLocationEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relabelWithHandler:", v4);

}

- (void)forceRelabeling:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__RTLearnedLocationManager_forceRelabeling___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __44__RTLearnedLocationManager_forceRelabeling___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_forceRelabeling:", *(_QWORD *)(a1 + 40));
}

- (void)_trainLocationsOfInterestModelWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RTLearnedLocationManager learnedLocationEngine](self, "learnedLocationEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trainLocationsOfInterestModelWithHandler:", v4);

}

- (void)trainLocationsOfInterestModelWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__RTLearnedLocationManager_trainLocationsOfInterestModelWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __69__RTLearnedLocationManager_trainLocationsOfInterestModelWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trainLocationsOfInterestModelWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_reconcileLearnedLocationsWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RTLearnedLocationManager learnedLocationEngine](self, "learnedLocationEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reconcileLearnedLocationsWithHandler:", v4);

}

- (void)reconcileLearnedLocationsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__RTLearnedLocationManager_reconcileLearnedLocationsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __65__RTLearnedLocationManager_reconcileLearnedLocationsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconcileLearnedLocationsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_classifyPlaceTypesWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RTLearnedLocationManager learnedLocationEngine](self, "learnedLocationEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classifyPlaceTypesWithHandler:", v4);

}

- (void)classifyPlaceTypesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__RTLearnedLocationManager_classifyPlaceTypesWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __58__RTLearnedLocationManager_classifyPlaceTypesWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_classifyPlaceTypesWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_addLocationOfInterest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[8];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "predicateForObjectsFromCurrentDevice");
      v9 = objc_claimAutoreleasedReturnValue();

      -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "place");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mapItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke;
      v16[3] = &unk_1E92992C0;
      v18 = v7;
      v16[4] = self;
      v17 = v6;
      objc_msgSend(v10, "fetchPlaceWithMapItem:predicate:handler:", v12, v9, v16);

    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v20 = *MEMORY[0x1E0CB2D50];
      v21[0] = CFSTR("requires a non-nil location of interest.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v15);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  if (a3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_msgSend(a1[4], "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_2;
    v9[3] = &unk_1E9297EB8;
    v10 = v5;
    v7 = a1[5];
    v8 = a1[4];
    v11 = v7;
    v12 = v8;
    v13 = a1[6];
    dispatch_async(v6, v9);

  }
}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_2(id *a1)
{
  RTLearnedPlace *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  RTLearnedPlace *v19;
  uint64_t v20;
  RTLearnedPlace *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD block[5];
  RTLearnedPlace *v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[4];
  NSObject *v35;
  _QWORD *v36;
  _QWORD v37[4];
  NSObject *v38;
  _QWORD *v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v2 = (RTLearnedPlace *)a1[4];
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__17;
  v44[4] = __Block_byref_object_dispose__17;
  v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__17;
  v42[4] = __Block_byref_object_dispose__17;
  v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__17;
  v40[4] = __Block_byref_object_dispose__17;
  v41 = 0;
  v3 = dispatch_group_create();
  if (!v2)
  {
    v21 = [RTLearnedPlace alloc];
    objc_msgSend(a1[5], "place");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "place");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v25, "type");
    objc_msgSend(a1[5], "place");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v24, "typeSource");
    objc_msgSend(a1[5], "place");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "place");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "place");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "place");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "expirationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v21, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v22, v20, v4, v5, v7, v9, v11);

    dispatch_group_enter(v3);
    objc_msgSend(a1[6], "learnedLocationStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_3;
    v37[3] = &unk_1E9297038;
    v39 = v40;
    v38 = v3;
    objc_msgSend(v12, "storePlaces:handler:", v13, v37);

  }
  dispatch_group_enter(v3);
  objc_msgSend(a1[6], "learnedLocationStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "visits");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_4;
  v34[3] = &unk_1E9297038;
  v36 = v42;
  v16 = v3;
  v35 = v16;
  objc_msgSend(v14, "storeVisits:place:handler:", v15, v2, v34);

  objc_msgSend(a1[6], "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_5;
  block[3] = &unk_1E9299298;
  v31 = v44;
  v32 = v40;
  v33 = v42;
  v30 = a1[7];
  v18 = a1[5];
  block[4] = a1[6];
  v28 = v2;
  v29 = v18;
  v19 = v2;
  dispatch_group_notify(v16, v17, block);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(v44, 8);
}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  _RTSafeArray();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v3, v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "learnedLocationStore", v9, v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_6;
    v11[3] = &unk_1E9299270;
    v15 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v13 = v7;
    v14 = v8;
    objc_msgSend(v5, "fetchLocationOfInterestWithPlace:handler:", v6, v11);

  }
}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  RTLearnedLocationOfInterest *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  RTLearnedLocationOfInterest *v13;
  NSObject *v14;
  id *v15;
  RTLearnedLocationOfInterest *v16;
  id *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  RTLearnedLocationOfInterest *v24;
  _QWORD v25[5];
  RTLearnedLocationOfInterest *v26;
  id v27;
  _QWORD v28[5];
  RTLearnedLocationOfInterest *v29;
  id v30;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v7 = [RTLearnedLocationOfInterest alloc];
    if (v5)
    {
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "visits");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "transitions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v7, "initWithIdentifier:location:place:visits:transitions:", v8, v9, v10, v11, v12);

      objc_msgSend(*(id *)(a1 + 48), "queue");
      v14 = objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_7;
      v28[3] = &unk_1E9296F70;
      v28[4] = *(_QWORD *)(a1 + 48);
      v15 = (id *)&v29;
      v16 = v13;
      v29 = v16;
      v17 = &v30;
      v30 = *(id *)(a1 + 56);
      v18 = v28;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "location");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "visits");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "transitions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v7, "initWithIdentifier:location:place:visits:transitions:", v19, v20, v21, v22, v23);

      objc_msgSend(*(id *)(a1 + 48), "queue");
      v14 = objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_8;
      v25[3] = &unk_1E9296F70;
      v25[4] = *(_QWORD *)(a1 + 48);
      v15 = (id *)&v26;
      v16 = v24;
      v26 = v16;
      v17 = &v27;
      v27 = *(id *)(a1 + 56);
      v18 = v25;
    }
    dispatch_async(v14, v18);

  }
}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "learnedLocationStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateLocationsOfInterest:handler:", v3, *(_QWORD *)(a1 + 48));

}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "learnedLocationStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeLocationsOfInterest:handler:", v3, *(_QWORD *)(a1 + 48));

}

- (void)addLocationOfInterest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__RTLearnedLocationManager_addLocationOfInterest_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __58__RTLearnedLocationManager_addLocationOfInterest_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addLocationOfInterest:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__RTLearnedLocationManager_removeLocationOfInterestWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __75__RTLearnedLocationManager_removeLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeLocationOfInterestWithIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__RTLearnedLocationManager__removeLocationOfInterestWithIdentifier_handler___block_invoke;
    v9[3] = &unk_1E9297AA8;
    v9[4] = self;
    v10 = v6;
    objc_msgSend(v8, "removeLocationOfInterestWithIdentifier:handler:", v7, v9);

  }
}

void __76__RTLearnedLocationManager__removeLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "learnedLocationEngine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestTrainLocationsOfInterestModelWithHandler:", &__block_literal_global_175);

}

void __76__RTLearnedLocationManager__removeLocationOfInterestWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "error during requested re-train, %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)_removeAllLocationsOfInterestWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  v5 = dispatch_group_create();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__17;
  v20[4] = __Block_byref_object_dispose__17;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__17;
  v18[4] = __Block_byref_object_dispose__17;
  v19 = 0;
  dispatch_group_enter(v5);
  -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__RTLearnedLocationManager__removeAllLocationsOfInterestWithHandler___block_invoke;
  v15[3] = &unk_1E9297038;
  v17 = v20;
  v8 = v5;
  v16 = v8;
  objc_msgSend(v6, "clearWithHandler:", v15);

  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __69__RTLearnedLocationManager__removeAllLocationsOfInterestWithHandler___block_invoke_2;
  v11[3] = &unk_1E9299308;
  v13 = v20;
  v14 = v18;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_group_notify(v8, v9, v11);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

}

void __69__RTLearnedLocationManager__removeAllLocationsOfInterestWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __69__RTLearnedLocationManager__removeAllLocationsOfInterestWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  _RTSafeArray();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "learnedLocationEngine", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__RTLearnedLocationManager__removeAllLocationsOfInterestWithHandler___block_invoke_3;
    v7[3] = &unk_1E9297568;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "trainLocationsOfInterestModelWithHandler:", v7);

  }
}

uint64_t __69__RTLearnedLocationManager__removeAllLocationsOfInterestWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeAllLocationsOfInterestWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__RTLearnedLocationManager_removeAllLocationsOfInterestWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __68__RTLearnedLocationManager_removeAllLocationsOfInterestWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAllLocationsOfInterestWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_addVisit:(id)a3 locationOfInterest:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString **v16;
  uint64_t *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke;
        v20[3] = &unk_1E92993A8;
        v20[4] = self;
        v22 = v10;
        v21 = v8;
        objc_msgSend(v11, "fetchLocationOfInterestWithIdentifier:handler:", v12, v20);

        goto LABEL_8;
      }
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v23 = *MEMORY[0x1E0CB2D50];
      v24 = CFSTR("requires a valid location of interest.");
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = &v24;
      v17 = &v23;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v25 = *MEMORY[0x1E0CB2D50];
      v26[0] = CFSTR("requires a valid visit.");
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = (const __CFString **)v26;
      v17 = &v25;
    }
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v19);

  }
LABEL_8:

}

void __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_2;
  block[3] = &unk_1E9299380;
  v14 = v6;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v18 = v8;
  v15 = v9;
  v16 = v10;
  v17 = v5;
  v11 = v5;
  v12 = v6;
  dispatch_async(v7, block);

}

void __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 64);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "learnedLocationStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "place");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_3;
    v6[3] = &unk_1E9299358;
    v6[4] = *(_QWORD *)(a1 + 40);
    v7 = *(id *)(a1 + 64);
    objc_msgSend(v3, "storeVisits:place:handler:", v4, v5, v6);

  }
}

void __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_4;
  block[3] = &unk_1E9299330;
  v8 = v3;
  v5 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v6 = v3;
  dispatch_async(v4, block);

}

void __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "learnedLocationEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_5;
    v4[3] = &unk_1E9297568;
    v5 = *(id *)(a1 + 48);
    objc_msgSend(v3, "trainLocationsOfInterestModelWithHandler:", v4);

  }
}

uint64_t __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)addVisit:(id)a3 locationOfInterest:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__RTLearnedLocationManager_addVisit_locationOfInterest_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __64__RTLearnedLocationManager_addVisit_locationOfInterest_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addVisit:locationOfInterest:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)removeVisitWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__RTLearnedLocationManager_removeVisitWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __62__RTLearnedLocationManager_removeVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeVisitWithIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removeVisitWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__RTLearnedLocationManager__removeVisitWithIdentifier_handler___block_invoke;
  v10[3] = &unk_1E9297AA8;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "removeVisitWithIdentifier:handler:", v7, v10);

}

void __63__RTLearnedLocationManager__removeVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "learnedLocationEngine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestTrainLocationsOfInterestModelWithHandler:", &__block_literal_global_180);

}

void __63__RTLearnedLocationManager__removeVisitWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "error during requested re-train, %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)_extendLifetimeOfVisitsWithIdentifiers:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint8_t v15[8];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (v7)
  {
    if (v6)
    {
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 4838400.0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "extendExpirationDateOfVisitsWithIdentifiers:expirationDate:handler:", v6, v8, v7);

      }
      else
      {
        v7[2](v7, 0);
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D18598];
      v16 = *MEMORY[0x1E0CB2D50];
      v17[0] = CFSTR("visitIdentifiers is required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 7, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v7)[2](v7, v14);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v15, 2u);
    }

  }
}

- (void)extendLifetimeOfVisitsWithIdentifiers:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__RTLearnedLocationManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __74__RTLearnedLocationManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_extendLifetimeOfVisitsWithIdentifiers:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  dispatch_semaphore_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  dispatch_time_t v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  char v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  id v61;
  NSObject *log;
  void *v64;
  _QWORD v65[4];
  NSObject *v66;
  _BYTE *v67;
  uint64_t *v68;
  _QWORD v69[4];
  NSObject *v70;
  _BYTE *v71;
  uint64_t *v72;
  uint64_t v73;
  id *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  _BYTE v79[12];
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  id v85;
  uint64_t v86;
  id *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  _BYTE v92[24];
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  _BYTE buf[24];
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  _QWORD v100[4];

  v100[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v64 = v6;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTLearnedLocationManager _fetchDedupedLocationOfInterestIdentifiersWithIdentifier:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3033;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

  }
  if (v7)
  {
    v9 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v97 = __Block_byref_object_copy__17;
    v98 = __Block_byref_object_dispose__17;
    v99 = 0;
    v73 = 0;
    v74 = (id *)&v73;
    v75 = 0x3032000000;
    v76 = __Block_byref_object_copy__17;
    v77 = __Block_byref_object_dispose__17;
    v78 = 0;
    -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __93__RTLearnedLocationManager__fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke;
    v69[3] = &unk_1E9297478;
    v71 = buf;
    v72 = &v73;
    v11 = v9;
    v70 = v11;
    objc_msgSend(v10, "fetchLocationOfInterestWithIdentifier:handler:", v64, v69);

    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v12, v14))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v13);
      v17 = v16;
      v18 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v92 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v92, 2u);
      }

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v86 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v92 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, &v86, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v26 = objc_retainAutorelease(v26);

        v27 = 0;
LABEL_15:

        log = v26;
        if ((v27 & 1) == 0)
          objc_storeStrong(v74 + 5, v26);
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          v31 = (uint64_t (*)(uint64_t, uint64_t))v74[5];
          *(_DWORD *)v92 = 138412802;
          *(_QWORD *)&v92[4] = v29;
          *(_WORD *)&v92[12] = 2112;
          *(_QWORD *)&v92[14] = v30;
          *(_WORD *)&v92[22] = 2112;
          v93 = v31;
          _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, locationOfInterest, %@, error, %@", v92, 0x20u);

        }
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          v32 = dispatch_semaphore_create(0);
          *(_QWORD *)v92 = 0;
          *(_QWORD *)&v92[8] = v92;
          *(_QWORD *)&v92[16] = 0x3032000000;
          v93 = __Block_byref_object_copy__17;
          v94 = __Block_byref_object_dispose__17;
          v95 = 0;
          v86 = 0;
          v87 = (id *)&v86;
          v88 = 0x3032000000;
          v89 = __Block_byref_object_copy__17;
          v90 = __Block_byref_object_dispose__17;
          v91 = 0;
          -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "place");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "mapItem");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v65[2] = __93__RTLearnedLocationManager__fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke_183;
          v65[3] = &unk_1E9296EE0;
          v67 = v92;
          v68 = &v86;
          v36 = v32;
          v66 = v36;
          objc_msgSend(v33, "fetchPlacesWithMapItem:handler:", v35, v65);

          v37 = v36;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v37, v39))
            goto LABEL_25;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "timeIntervalSinceDate:", v38);
          v42 = v41;
          v43 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "filteredArrayUsingPredicate:", v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "firstObject");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "submitToCoreAnalytics:type:duration:", v47, 1, v42);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v79 = 0;
            _os_log_fault_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v79, 2u);
          }

          v49 = (void *)MEMORY[0x1E0CB35C8];
          v100[0] = *MEMORY[0x1E0CB2D50];
          *(_QWORD *)v79 = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v100, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
          {
            v52 = objc_retainAutorelease(v51);

            v53 = 0;
          }
          else
          {
LABEL_25:
            v52 = 0;
            v53 = 1;
          }

          v54 = v52;
          if ((v53 & 1) == 0)
            objc_storeStrong(v87 + 5, v52);
          objc_msgSend(*(id *)(*(_QWORD *)&v92[8] + 40), "valueForKey:", CFSTR("identifier"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != %@"), v64);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "filteredArrayUsingPredicate:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v59 = (id)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v57, "count");
            v61 = v87[5];
            *(_DWORD *)v79 = 138413058;
            *(_QWORD *)&v79[4] = v59;
            v80 = 2048;
            v81 = v60;
            v82 = 2112;
            v83 = v64;
            v84 = 2112;
            v85 = v61;
            _os_log_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_INFO, "%@, %lu deduped places to LOI with identifier, %@, error, %@", v79, 0x2Au);

          }
          ((void (**)(id, void *, id))v7)[2](v7, v57, v87[5]);

          _Block_object_dispose(&v86, 8);
          _Block_object_dispose(v92, 8);

        }
        else
        {
          ((void (**)(id, void *, id))v7)[2](v7, 0, v74[5]);
        }

        _Block_object_dispose(&v73, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_33;
      }
    }
    else
    {
      v26 = 0;
    }
    v27 = 1;
    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  log = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_33:

}

void __93__RTLearnedLocationManager__fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __93__RTLearnedLocationManager__fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke_183(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__RTLearnedLocationManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __92__RTLearnedLocationManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDedupedLocationOfInterestIdentifiersWithIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)learnedLocationEngineDidUpdate:(id)a3 intervalSinceLastUpdate:(double)a4
{
  NSObject *v6;
  _QWORD v7[6];

  -[RTNotifier queue](self, "queue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__RTLearnedLocationManager_learnedLocationEngineDidUpdate_intervalSinceLastUpdate___block_invoke;
  v7[3] = &unk_1E9297BF0;
  v7[4] = self;
  *(double *)&v7[5] = a4;
  dispatch_async(v6, v7);

}

uint64_t __83__RTLearnedLocationManager_learnedLocationEngineDidUpdate_intervalSinceLastUpdate___block_invoke(uint64_t a1)
{
  void *v1;
  RTLearnedLocationManagerNotificationDidUpdate *v2;

  v1 = *(void **)(a1 + 32);
  v2 = -[RTLearnedLocationManagerNotificationDidUpdate initWithIntervalSinceLastUpdate:]([RTLearnedLocationManagerNotificationDidUpdate alloc], "initWithIntervalSinceLastUpdate:", *(double *)(a1 + 40));
  objc_msgSend(v1, "postNotification:", v2);

  return notify_post((const char *)objc_msgSend((id)*MEMORY[0x1E0D185B0], "UTF8String"));
}

- (void)learnedLocationEngineDidClear:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__RTLearnedLocationManager_learnedLocationEngineDidClear___block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __58__RTLearnedLocationManager_learnedLocationEngineDidClear___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  v2 = (void *)objc_opt_new();
  objc_msgSend(v1, "postNotification:", v2);

  return notify_post((const char *)objc_msgSend((id)*MEMORY[0x1E0D185B8], "UTF8String"));
}

- (void)learnedLocationEngineWillBeginTraining:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__RTLearnedLocationManager_learnedLocationEngineWillBeginTraining___block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __67__RTLearnedLocationManager_learnedLocationEngineWillBeginTraining___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAvailable:", 0);
}

- (void)learnedLocationEngineDidFinishTraining:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__RTLearnedLocationManager_learnedLocationEngineDidFinishTraining___block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __67__RTLearnedLocationManager_learnedLocationEngineDidFinishTraining___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAvailable:", 1);
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  RTLearnedLocationManagerNotificationAvailabilityDidChange *v10;
  void *v11;
  char v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationAvailabilityDidChange, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    v10 = -[RTLearnedLocationManagerNotificationAvailabilityDidChange initWithAvailability:]([RTLearnedLocationManagerNotificationAvailabilityDidChange alloc], "initWithAvailability:", -[RTLearnedLocationManager available](self, "available"));
    -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v10, v6);

  }
  else
  {
    +[RTNotification notificationName](RTLearnedLocationManagerNotificationDidUpdate, "notificationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412290;
        v15 = v7;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v14, 0xCu);
      }

    }
  }

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationAvailabilityDidChange, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    +[RTNotification notificationName](RTLearnedLocationManagerNotificationDidUpdate, "notificationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v10, 0xCu);
      }

    }
  }

}

- (void)_onLearnedLocationStoreNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD v8[5];

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if (objc_msgSend(v4, "availability") == 2)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __64__RTLearnedLocationManager__onLearnedLocationStoreNotification___block_invoke;
      v8[3] = &unk_1E9297150;
      v8[4] = self;
      -[RTLearnedLocationManager _performLegacyMigrations:](self, "_performLegacyMigrations:", v8);
    }
    else
    {
      -[RTLearnedLocationManager setAvailable:](self, "setAvailable:", 0);
    }
  }

}

void __64__RTLearnedLocationManager__onLearnedLocationStoreNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__RTLearnedLocationManager__onLearnedLocationStoreNotification___block_invoke_2;
  v7[3] = &unk_1E9297540;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __64__RTLearnedLocationManager__onLearnedLocationStoreNotification___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "setAvailable:", 1);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "failed migrating legacy data, error, %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "setAvailable:", 0);
}

- (void)onLearnedLocationStoreNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__RTLearnedLocationManager_onLearnedLocationStoreNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __63__RTLearnedLocationManager_onLearnedLocationStoreNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLearnedLocationStoreNotification:", *(_QWORD *)(a1 + 40));
}

- (void)setAvailable:(BOOL)a3
{
  NSObject *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  RTLearnedLocationManagerNotificationAvailabilityDidChange *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_available != a3)
  {
    self->_available = a3;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (self->_available)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, available, %@", (uint8_t *)&v10, 0x16u);

    }
    v9 = -[RTLearnedLocationManagerNotificationAvailabilityDidChange initWithAvailability:]([RTLearnedLocationManagerNotificationAvailabilityDidChange alloc], "initWithAvailability:", self->_available);
    -[RTNotifier postNotification:](self, "postNotification:", v9);

  }
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__RTLearnedLocationManager_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __72__RTLearnedLocationManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "learnedLocationEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "learnedLocationEngine");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performPurgeOfType:referenceDate:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)logDatabasesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;

  v2 = dispatch_group_create();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__17;
  v29[4] = __Block_byref_object_dispose__17;
  v30 = 0;
  dispatch_group_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "learnedLocationStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_2;
  v26[3] = &unk_1E9297038;
  v28 = v29;
  v5 = v2;
  v27 = v5;
  objc_msgSend(v3, "logCloudStoreWithReason:handler:", 0, v26);

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__17;
  v24[4] = __Block_byref_object_dispose__17;
  v25 = 0;
  dispatch_group_enter(v5);
  objc_msgSend(*(id *)(a1 + 32), "learnedLocationStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_3;
  v21[3] = &unk_1E9297038;
  v23 = v24;
  v7 = v5;
  v22 = v7;
  objc_msgSend(v6, "logLocalStoreWithReason:handler:", 0, v21);

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__17;
  v19[4] = __Block_byref_object_dispose__17;
  v20 = 0;
  dispatch_group_enter(v7);
  objc_msgSend(*(id *)(a1 + 32), "learnedPlaceTypeInferenceStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_4;
  v16[3] = &unk_1E9297038;
  v18 = v19;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v8, "logCacheStoreWithReason:handler:", 0, v16);

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_5;
  v11[3] = &unk_1E92993F0;
  v12 = *(id *)(a1 + 40);
  v13 = v29;
  v14 = v24;
  v15 = v19;
  dispatch_group_notify(v9, v10, v11);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v29, 8);
}

void __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    _RTSafeArray();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  }
}

- (void)updateTransitionWithIdentifier:(id)a3 motionActivityType:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__RTLearnedLocationManager_updateTransitionWithIdentifier_motionActivityType_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __86__RTLearnedLocationManager_updateTransitionWithIdentifier_motionActivityType_handler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "learnedLocationStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTransitionWithIdentifier:motionActivityType:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)_reconstructTransitionsWithHandler:(id)a3
{
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  id v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  dispatch_time_t v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  char v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void *v56;
  NSObject *v57;
  RTLearnedTransition *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  RTLearnedTransition *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  dispatch_time_t v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  char v85;
  id v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  NSObject *v92;
  RTLearnedLocationManager *v93;
  void *v94;
  void (**v95)(void);
  NSObject *dsema;
  void *v98;
  id obj;
  uint64_t v100;
  uint64_t v101;
  id v102;
  _QWORD v103[4];
  void (**v104)(void);
  _QWORD v105[4];
  NSObject *v106;
  _BYTE *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[4];
  NSObject *v113;
  _BYTE *v114;
  _QWORD v115[4];
  NSObject *v116;
  uint64_t *v117;
  uint64_t *v118;
  uint64_t v119;
  id *v120;
  uint64_t v121;
  uint64_t (*v122)(uint64_t, uint64_t);
  void (*v123)(uint64_t);
  id v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t (*v128)(uint64_t, uint64_t);
  void (*v129)(uint64_t);
  id v130;
  _BYTE v131[12];
  __int16 v132;
  uint64_t v133;
  _BYTE v134[24];
  uint64_t (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  id v137;
  uint8_t v138[128];
  _BYTE buf[24];
  uint64_t (*v140)(uint64_t, uint64_t);
  void (*v141)(uint64_t);
  id v142;
  _QWORD v143[4];

  v143[1] = *MEMORY[0x1E0C80C00];
  v95 = (void (**)(void))a3;
  v125 = 0;
  v126 = &v125;
  v127 = 0x3032000000;
  v128 = __Block_byref_object_copy__17;
  v129 = __Block_byref_object_dispose__17;
  v130 = 0;
  v119 = 0;
  v120 = (id *)&v119;
  v121 = 0x3032000000;
  v122 = __Block_byref_object_copy__17;
  v123 = __Block_byref_object_dispose__17;
  v124 = 0;
  v4 = dispatch_semaphore_create(0);
  v93 = self;
  -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForObjectsFromCurrentDevice");
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTLearnedLocationManager learnedLocationStore](v93, "learnedLocationStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = MEMORY[0x1E0C809B0];
  v115[1] = 3221225472;
  v115[2] = __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke;
  v115[3] = &unk_1E9296EE0;
  v117 = &v125;
  v118 = &v119;
  v7 = v4;
  v116 = v7;
  objc_msgSend(v6, "fetchVisitsWithPredicate:handler:", v94, v115);

  dsema = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v9))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v8);
  v12 = v11;
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredArrayUsingPredicate:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "submitToCoreAnalytics:type:duration:", v17, 1, v12);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v19 = (void *)MEMORY[0x1E0CB35C8];
  *(_QWORD *)v134 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v134, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_retainAutorelease(v21);

    v23 = 0;
  }
  else
  {
LABEL_6:
    v22 = 0;
    v23 = 1;
  }

  v24 = v22;
  if ((v23 & 1) == 0)
    objc_storeStrong(v120 + 5, v22);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend((id)v126[5], "count");
    v28 = (uint64_t (*)(uint64_t, uint64_t))v120[5];
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v26;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2112;
    v140 = v28;
    _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, %lu visits on current device, error, %@", buf, 0x20u);

  }
  if (!v120[5])
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v140 = __Block_byref_object_copy__17;
    v141 = __Block_byref_object_dispose__17;
    v142 = 0;
    -[RTLearnedLocationManager learnedLocationStore](v93, "learnedLocationStore");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v126[5];
    v112[0] = MEMORY[0x1E0C809B0];
    v112[1] = 3221225472;
    v112[2] = __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke_191;
    v112[3] = &unk_1E9297038;
    v114 = buf;
    v31 = dsema;
    v113 = v31;
    objc_msgSend(v29, "removeTransitionsReferencingVisits:handler:", v30, v112);

    v92 = v31;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v92, v33))
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "timeIntervalSinceDate:", v32);
    v36 = v35;
    v37 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "filteredArrayUsingPredicate:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "submitToCoreAnalytics:type:duration:", v41, 1, v36);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v134 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v134, 2u);
    }

    v43 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)v131 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v134 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v134, v131, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      v46 = objc_retainAutorelease(v45);

      v47 = 0;
    }
    else
    {
LABEL_19:
      v47 = 1;
      v46 = v24;
    }

    v91 = v46;
    if ((v47 & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v46);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v134 = 138412546;
      *(_QWORD *)&v134[4] = v49;
      *(_WORD *)&v134[12] = 2112;
      *(_QWORD *)&v134[14] = v50;
      _os_log_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_INFO, "%@, removed existing transitions, error, %@", v134, 0x16u);

    }
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      if (v95)
        v95[2]();
LABEL_58:

      _Block_object_dispose(buf, 8);
      v24 = v91;
      goto LABEL_59;
    }
    v98 = (void *)objc_opt_new();
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    obj = (id)v126[5];
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v138, 16);
    v52 = 0;
    if (!v51)
    {
LABEL_43:
      v66 = v52;

      *(_QWORD *)v134 = 0;
      *(_QWORD *)&v134[8] = v134;
      *(_QWORD *)&v134[16] = 0x3032000000;
      v135 = __Block_byref_object_copy__17;
      v136 = __Block_byref_object_dispose__17;
      v137 = 0;
      -[RTLearnedLocationManager learnedLocationStore](v93, "learnedLocationStore");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v105[0] = MEMORY[0x1E0C809B0];
      v105[1] = 3221225472;
      v105[2] = __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke_193;
      v105[3] = &unk_1E9297038;
      v107 = v134;
      v68 = v92;
      v106 = v68;
      objc_msgSend(v67, "storeTransitions:handler:", v98, v105);

      v69 = v68;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v69, v71))
        goto LABEL_48;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "timeIntervalSinceDate:", v70);
      v74 = v73;
      v75 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "filteredArrayUsingPredicate:", v76);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "firstObject");
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v75, "submitToCoreAnalytics:type:duration:", v79, 1, v74);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v131 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v80, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v131, 2u);
      }

      v81 = (void *)MEMORY[0x1E0CB35C8];
      v143[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v131 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v131, v143, 1);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      if (v83)
      {
        v84 = objc_retainAutorelease(v83);

        v85 = 0;
      }
      else
      {
LABEL_48:
        v85 = 1;
        v84 = v91;
      }

      v86 = v84;
      if ((v85 & 1) == 0)
        objc_storeStrong((id *)(*(_QWORD *)&v134[8] + 40), v84);
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        v88 = objc_msgSend(v98, "count");
        v89 = *(_QWORD *)(*(_QWORD *)&v134[8] + 40);
        *(_DWORD *)v131 = 134218242;
        *(_QWORD *)&v131[4] = v88;
        v132 = 2112;
        v133 = v89;
        _os_log_impl(&dword_1D1A22000, v87, OS_LOG_TYPE_INFO, "stored %lu transitions, error, %@", v131, 0x16u);
      }

      if (*(_QWORD *)(*(_QWORD *)&v134[8] + 40))
      {
        if (v95)
          v95[2]();
      }
      else
      {
        -[RTLearnedLocationManager learnedLocationEngine](v93, "learnedLocationEngine");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v103[0] = MEMORY[0x1E0C809B0];
        v103[1] = 3221225472;
        v103[2] = __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke_194;
        v103[3] = &unk_1E9297568;
        v104 = v95;
        objc_msgSend(v90, "trainLocationsOfInterestModelWithHandler:", v103);

      }
      _Block_object_dispose(v134, 8);

      v91 = v86;
      goto LABEL_58;
    }
    v100 = *(_QWORD *)v109;
LABEL_29:
    v101 = v51;
    v53 = 0;
    while (1)
    {
      if (*(_QWORD *)v109 != v100)
        objc_enumerationMutation(obj);
      v54 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v53);
      if (v52)
      {
        objc_msgSend(v52, "exitDate");
        v55 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "entryDate");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = v52;
        if (objc_msgSend(v56, "isBeforeDate:", v55))
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v134 = 138412802;
            *(_QWORD *)&v134[4] = v65;
            *(_WORD *)&v134[12] = 2112;
            *(_QWORD *)&v134[14] = v56;
            *(_WORD *)&v134[22] = 2112;
            v135 = v55;
            _os_log_error_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_ERROR, "%@, next entry date, %@, predates previous exit date, %@", v134, 0x20u);

          }
          goto LABEL_41;
        }
        v58 = [RTLearnedTransition alloc];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "identifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "identifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "expirationDate");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v58, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v59, v55, v56, v60, v61, v62, v63, 0);

        if (v64)
          objc_msgSend(v98, "addObject:", v64);

        v52 = v102;
      }
      v55 = (uint64_t (*)(uint64_t, uint64_t))v52;
      v102 = v54;
LABEL_41:

      ++v53;
      v52 = v102;
      if (v101 == v53)
      {
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v138, 16);
        if (!v51)
          goto LABEL_43;
        goto LABEL_29;
      }
    }
  }
  if (v95)
    v95[2]();
LABEL_59:

  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v125, 8);

}

void __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke_191(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke_193(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke_194(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)reconstructTransitionsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__RTLearnedLocationManager_reconstructTransitionsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __62__RTLearnedLocationManager_reconstructTransitionsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconstructTransitionsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)fetchFamiliarityIndexResultsWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v11 = "Invalid parameter not satisfying: options";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
    goto LABEL_7;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v11 = "Invalid parameter not satisfying: handler";
    goto LABEL_10;
  }
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__RTLearnedLocationManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  dispatch_async(v9, block);

LABEL_8:
}

uint64_t __76__RTLearnedLocationManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchFamiliarityIndexResultsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchFamiliarityIndexResultsWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, id);
  NSObject *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  _QWORD *v31;
  NSObject *v32;
  objc_class *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[8];
  _QWORD v41[8];
  id v42;
  uint64_t v43;
  const __CFString *v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  const __CFString *v52;
  _BYTE v53[24];
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v53 = 136315394;
      *(_QWORD *)&v53[4] = "-[RTLearnedLocationManager _fetchFamiliarityIndexResultsWithOptions:handler:]";
      *(_WORD *)&v53[12] = 1024;
      *(_DWORD *)&v53[14] = 3424;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", v53, 0x12u);
    }

  }
  *(_QWORD *)v53 = 0;
  *(_QWORD *)&v53[8] = v53;
  *(_QWORD *)&v53[16] = 0x3032000000;
  v54 = __Block_byref_object_copy__17;
  v55 = __Block_byref_object_dispose__17;
  v56 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lookbackInterval");
  objc_msgSend(v10, "dateByAddingTimeInterval:", -v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isAfterDate:", v14);

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    v52 = CFSTR("options.lookbackWindow can not be set after the dateInterval.startDate");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v8[2](v8, 0, v18);
  }
  else if (objc_msgSend(v7, "referenceLocationSummary")
         && (objc_msgSend(v7, "referenceLocation"),
             v19 = (void *)objc_claimAutoreleasedReturnValue(),
             v20 = v19 == 0,
             v19,
             v20))
  {
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    v50 = CFSTR("options.referenceLocationSummary can be set to YES only with a valid options.referencelocation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v39);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v8[2](v8, 0, v18);
  }
  else if ((objc_msgSend(v7, "spatialGranularity") | 2) == 3)
  {
    v42 = 0;
    -[RTLearnedLocationManager _getAreasGeohashesFamiliarPlacesWithGranularity:outError:](self, "_getAreasGeohashesFamiliarPlacesWithGranularity:outError:", objc_msgSend(v7, "spatialGranularity"), &v42);
    v21 = objc_claimAutoreleasedReturnValue();
    v18 = v42;
    v22 = *(void **)(*(_QWORD *)&v53[8] + 40);
    *(_QWORD *)(*(_QWORD *)&v53[8] + 40) = v21;

    objc_msgSend(v7, "dateInterval");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "dateInterval");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "endDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "referenceLocation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = v27 == 0;

    if ((_DWORD)v25)
    {
      -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __77__RTLearnedLocationManager__fetchFamiliarityIndexResultsWithOptions_handler___block_invoke;
      v41[3] = &unk_1E9299440;
      v31 = v41;
      v41[4] = self;
      v41[5] = v7;
      v41[7] = v53;
      v41[6] = v8;
      objc_msgSend(v30, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:handler:", v24, v26, v41);
    }
    else
    {
      objc_msgSend(v7, "distance");
      v29 = v28;
      objc_msgSend(v7, "referenceLocation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __77__RTLearnedLocationManager__fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_3;
      v40[3] = &unk_1E9299440;
      v31 = v40;
      v40[4] = self;
      v40[5] = v7;
      v40[7] = v53;
      v40[6] = v8;
      -[RTLearnedLocationManager _fetchLocationsOfInterestWithinDistance:ofLocation:handler:](self, "_fetchLocationsOfInterestWithinDistance:ofLocation:handler:", v30, v40, v29);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v46 = v34;
      v47 = 2112;
      v48 = v35;
      _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%@, %@, requires a valid spatial granularity", buf, 0x16u);

    }
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    v44 = CFSTR("requires a valid spatial granularity;");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v37);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v8[2](v8, 0, v18);
  }

  _Block_object_dispose(v53, 8);
}

void __77__RTLearnedLocationManager__fetchFamiliarityIndexResultsWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  __int128 v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__RTLearnedLocationManager__fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_2;
  block[3] = &unk_1E9299418;
  v8 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v15 = v8;
  v16 = v6;
  v12 = *(_OWORD *)(a1 + 48);
  v9 = (id)v12;
  v17 = v12;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

uint64_t __77__RTLearnedLocationManager__fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_computeFamiliarityIndexResultsForLearnedLocationsWithVisits:options:familiarPlaces:error:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __77__RTLearnedLocationManager__fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_computeFamiliarityIndexResultsForLearnedLocationsWithVisits:options:familiarPlaces:error:handler:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3, *(_QWORD *)(a1 + 48));
}

- (void)_computeFamiliarityIndexResultsForLearnedLocationsWithVisits:(id)a3 options:(id)a4 familiarPlaces:(id)a5 error:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, _QWORD, void *);
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  RTLearnedLocationManager *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, _QWORD, void *))a7;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = objc_msgSend(v13, "count");
    objc_msgSend(v14, "dateInterval");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v47 = v19;
    v48 = 2112;
    v49 = v20;
    v50 = 2112;
    v51 = self;
    v52 = 2112;
    v53 = v16;
    _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "fetched %lu LOIs for visits in date interval, %@, for client, %@, error, %@", buf, 0x2Au);

  }
  if (!v16)
  {
    if (!v13)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0D18598];
      v44 = *MEMORY[0x1E0CB2D50];
      v45 = CFSTR("LOIs are nil; not able to estimate familiarityIndex.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 0, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v17[2](v17, 0, v27);
      goto LABEL_19;
    }
    v21 = objc_msgSend(v14, "spatialGranularity");
    if (v21 == 3)
    {
      v40 = 0;
      v22 = (id *)&v40;
      -[RTLearnedLocationManager _getFamiliarityIndexResultsAreaLevelForLearnedLOIs:options:familiarPlaces:outError:](self, "_getFamiliarityIndexResultsAreaLevelForLearnedLOIs:options:familiarPlaces:outError:", v13, v14, v15, &v40);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v21 != 1)
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v47 = (uint64_t)v38;
          v48 = 2112;
          v49 = v39;
          _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, %@, we should never reach this code path", buf, 0x16u);

        }
        v34 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0D185A0];
        v42 = *MEMORY[0x1E0CB2D50];
        v43 = CFSTR("requires a valid spatial granularity;");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, 1, v36);
        v29 = (id)objc_claimAutoreleasedReturnValue();

        v17[2](v17, 0, v29);
        goto LABEL_18;
      }
      v41 = 0;
      v22 = (id *)&v41;
      -[RTLearnedLocationManager _getFamiliarityIndexResultsLOILevelForLOIs:options:outError:](self, "_getFamiliarityIndexResultsLOILevelForLOIs:options:outError:", v13, v14, &v41);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)v23;
    v29 = *v22;
    -[RTLearnedLocationManager _checkFamiliarityIndexResultsForErrors:](self, "_checkFamiliarityIndexResultsForErrors:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationManager _combineFamiliarityIndexRetrieveError:resultsError:](self, "_combineFamiliarityIndexRetrieveError:resultsError:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      v32 = v31;
    else
      v32 = 0;
    ((void (**)(id, void *, void *))v17)[2](v17, v28, v32);

LABEL_18:
    goto LABEL_19;
  }
  v17[2](v17, 0, v16);
LABEL_19:

}

- (id)_getFamiliarityIndexResultsLOILevelForLOIs:(id)a3 options:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  double v31;
  uint64_t i;
  RTLearnedLocationManager *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  id obj;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[16];
  void *v79;
  _BYTE v80[128];
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v64 = (void *)objc_opt_new();
    v67 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v55 = (void *)objc_opt_new();
    v9 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lookbackInterval");
    objc_msgSend(v10, "dateByAddingTimeInterval:", -v11);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "dateInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDate");
    v14 = v7;
    v15 = objc_claimAutoreleasedReturnValue();

    v51 = (void *)v15;
    v52 = (void *)v12;
    v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v12, v15);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v53 = v14;
    obj = v14;
    v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
    if (v59)
    {
      v57 = v9;
      v58 = *(_QWORD *)v75;
      v66 = v8;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v75 != v58)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v16);
        v73 = 0;
        v18 = -[RTLearnedLocationManager _getTotalVisitsCountForLOI:dateInterval:outError:](self, "_getTotalVisitsCountForLOI:dateInterval:outError:", v17, v60, &v73);
        v19 = v73;
        if (v19)
        {
          v42 = objc_retainAutorelease(v19);
          *a5 = v42;
          goto LABEL_28;
        }
        v68 = v17;
        objc_msgSend(v17, "visits");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entryDate"), 1);
        v81 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sortedArrayUsingDescriptors:", v22);
        v23 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "dateInterval");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (void *)v23;
        -[RTLearnedLocationManager _getLearnedVisits:dateInterval:](self, "_getLearnedVisits:dateInterval:", v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
        if (!v27)
          break;
        v28 = v27;
        v65 = v26;
        v61 = v21;
        v62 = v16;
        v29 = 0;
        v30 = *(_QWORD *)v70;
        v31 = 0.0;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            v33 = self;
            v34 = v29;
            if (*(_QWORD *)v70 != v30)
              objc_enumerationMutation(v65);
            v35 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
            objc_msgSend(v35, "exitDate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "entryDate");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "timeIntervalSinceDate:", v37);
            v39 = v38;

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18 + i + 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "setObject:forKeyedSubscript:", v40, CFSTR("loiVisitCount"));

            self = v33;
            -[RTLearnedLocationManager _getFamiliarityIndexResultForLearnedVisit:learnedLOI:statsLOIVisits:](v33, "_getFamiliarityIndexResultForLearnedVisit:learnedLOI:statsLOIVisits:", v35, v68, v67);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29 && (objc_msgSend(v66, "referenceLocationSummary") & 1) == 0)
              objc_msgSend(v64, "addObject:", v29);
            v31 = v31 + v39;
          }
          v28 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
          v18 += i;
        }
        while (v28);
        v26 = v65;

        v9 = v57;
        if (!v29)
        {
          v8 = v66;
          v16 = v62;
          v21 = v61;
          goto LABEL_24;
        }
        v8 = v66;
        v16 = v62;
        v21 = v61;
        if (objc_msgSend(v66, "referenceLocationSummary"))
        {
          objc_msgSend(v57, "addObject:", v29);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addObject:", v41);
LABEL_22:

        }
LABEL_24:

        if (++v16 == v59)
        {
          v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
          if (v59)
            goto LABEL_4;
          goto LABEL_26;
        }
      }
      v29 = 0;
      v41 = v26;
      v9 = v57;
      goto LABEL_22;
    }
LABEL_26:
    v42 = 0;
LABEL_28:

    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v8, "referenceLocationSummary"))
    {
      if (!objc_msgSend(v9, "count"))
      {
LABEL_38:
        if (a5)
          *a5 = objc_retainAutorelease(v42);

        v7 = v53;
        goto LABEL_41;
      }
      v44 = objc_alloc(MEMORY[0x1E0D18390]);
      objc_msgSend(v8, "dateInterval");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationManager _estimateFamiliarityIndexReferenceLocationSummary:dwellTimePerAreas:](self, "_estimateFamiliarityIndexReferenceLocationSummary:dwellTimePerAreas:", v9, v55);
      v46 = (void *)objc_msgSend(v44, "initWithDateInterval:familiarityIndex:", v45);

      objc_msgSend(v43, "addObject:", v46);
    }
    else
    {
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("dateInterval"), 1);
      v79 = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "sortedArrayUsingDescriptors:", v48);
      v49 = objc_claimAutoreleasedReturnValue();

      v43 = (id)v49;
    }

    goto LABEL_38;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lois", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("lois"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v43 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

  return v43;
}

- (double)_estimateFamiliarityIndexReferenceLocationSummary:(id)a3 dwellTimePerAreas:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t j;
  double v31;
  double v32;
  void *v33;
  double v34;
  const char *v35;
  const char *v36;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = -1.0;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: familiarityIndexResultsPerAreas";
LABEL_25:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v35, buf, 2u);
    goto LABEL_34;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = -1.0;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: areasDwellTimes";
    goto LABEL_25;
  }
  v9 = objc_msgSend(v6, "count");
  if (v9 == objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForKeyPath:", CFSTR("@sum.self"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v12 = -1.0;
      if (v13 != 0.0)
      {
        v38 = v8;
        v39 = v6;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v14 = v8;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (v15)
        {
          v16 = v15;
          v17 = 0;
          v18 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v45 != v18)
                objc_enumerationMutation(v14);
              v20 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "doubleValue", v38);
              v22 = v21;
              objc_msgSend(v11, "doubleValue");
              objc_msgSend(v20, "numberWithDouble:", v22 / v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject insertObject:atIndex:](v10, "insertObject:atIndex:", v24, v17 + i);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
            v17 += i;
          }
          while (v16);
        }

        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v6 = v39;
        v25 = v39;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v41;
          v29 = 0.0;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v41 != v28)
                objc_enumerationMutation(v25);
              objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "familiarityIndex", v38);
              v32 = v31;
              -[NSObject objectAtIndex:](v10, "objectAtIndex:", 0);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "doubleValue");
              v29 = v29 + v32 * v34;

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          }
          while (v27);
        }
        else
        {
          v29 = 0.0;
        }

        v12 = v29 / (double)(unint64_t)objc_msgSend(v25, "count");
        v8 = v38;
      }
      goto LABEL_33;
    }
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = -1.0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v51 = v11;
      v36 = "%@, length of familiarityIndexResultsPerAreas cannot be 0 ";
      goto LABEL_30;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = -1.0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v51 = v11;
      v36 = "%@, length of familiarityIndexResultsPerAreas should be equal to areasDwellTimes ";
LABEL_30:
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v36, buf, 0xCu);
LABEL_33:

    }
  }
LABEL_34:

  return v12;
}

- (id)_getFamiliarityIndexResultsAreaLevelForLearnedLOIs:(id)a3 options:(id)a4 familiarPlaces:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  double v64;
  uint64_t k;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  RTLearnedLocationManager *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  RTLearnedLocationManager *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  id v114;
  id v115;
  id v116;
  uint64_t v117;
  void *v118;
  void *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  id *v124;
  void *v125;
  id obj;
  id obja;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  void *v141;
  _BYTE v142[128];
  void *v143;
  _BYTE v144[128];
  uint8_t v145[128];
  uint8_t buf[4];
  const char *v147;
  __int16 v148;
  int v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v10;
  v115 = v11;
  v116 = a5;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lois", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("lois"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v41 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_59;
  }
  if (!a6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v147 = "-[RTLearnedLocationManager _getFamiliarityIndexResultsAreaLevelForLearnedLOIs:options:familiarPlaces:outError:]";
      v148 = 1024;
      v149 = 3680;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError (in %s:%d)", buf, 0x12u);
    }

  }
  v124 = a6;
  v113 = (void *)objc_opt_new();
  v120 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "lookbackInterval");
  objc_msgSend(v15, "dateByAddingTimeInterval:", -v16);
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v115, "dateInterval");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startDate");
  v19 = objc_claimAutoreleasedReturnValue();

  v98 = (void *)v19;
  v99 = (void *)v17;
  v100 = v12;
  v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v17, v19);
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  obj = v12;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v145, 16);
  v21 = 0x1E0CB3000uLL;
  v105 = v14;
  v108 = self;
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v138;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v138 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
        objc_msgSend(v25, "location");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "location");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "latitude");
        v29 = v28;
        objc_msgSend(v25, "location");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "location");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "longitude");
        -[RTLearnedLocationManager _latitudeLongitudeToGeohashHelperForLatitude:longitude:hashLength:](v108, "_latitudeLongitudeToGeohashHelperForLatitude:longitude:hashLength:", -[RTLearnedLocationManager _getGeohashLengthForSpatialGranularity:](v108, "_getGeohashLengthForSpatialGranularity:", objc_msgSend(v115, "spatialGranularity")), v29, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v136 = 0;
        v34 = -[RTLearnedLocationManager _getTotalVisitsCountForLOI:dateInterval:outError:](v108, "_getTotalVisitsCountForLOI:dateInterval:outError:", v25, v101, &v136);
        v35 = v136;
        if (v35)
        {
          v97 = objc_retainAutorelease(v35);
          *v124 = v97;

          v14 = v105;
          self = v108;
          v21 = 0x1E0CB3000;
          goto LABEL_25;
        }
        objc_msgSend(v105, "objectForKey:", v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = (void *)MEMORY[0x1E0CB37E8];
        if (v36)
        {
          objc_msgSend(v105, "objectForKeyedSubscript:", v33);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "numberWithUnsignedInteger:", v34 + objc_msgSend(v38, "unsignedIntValue"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "setObject:forKeyedSubscript:", v39, v33);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "setObject:forKeyedSubscript:", v38, v33);
        }

        v21 = 0x1E0CB3000;
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v145, 16);
      if (v22)
        continue;
      break;
    }
    v97 = 0;
    v14 = v105;
    self = v108;
  }
  else
  {
    v97 = 0;
  }
LABEL_25:

  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v103 = (void *)objc_opt_new();
  v102 = (void *)objc_opt_new();
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v104 = obj;
  v107 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v132, v144, 16);
  if (!v107)
    goto LABEL_53;
  v106 = *(_QWORD *)v133;
  v119 = v42;
  do
  {
    for (j = 0; j != v107; j = v89 + 1)
    {
      if (*(_QWORD *)v133 != v106)
        objc_enumerationMutation(v104);
      v112 = j;
      v44 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * j);
      objc_msgSend(v44, "visits");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entryDate"), 1);
      v143 = v110;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v143, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v45;
      objc_msgSend(v45, "sortedArrayUsingDescriptors:", v46);
      v47 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v115, "dateInterval");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = (void *)v47;
      -[RTLearnedLocationManager _getLearnedVisits:dateInterval:](v108, "_getLearnedVisits:dateInterval:", v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "location");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "location");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "latitude");
      v53 = v52;
      v118 = v44;
      objc_msgSend(v44, "location");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "location");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "longitude");
      self = v108;
      -[RTLearnedLocationManager _latitudeLongitudeToGeohashHelperForLatitude:longitude:hashLength:](v108, "_latitudeLongitudeToGeohashHelperForLatitude:longitude:hashLength:", -[RTLearnedLocationManager _getGeohashLengthForSpatialGranularity:](v108, "_getGeohashLengthForSpatialGranularity:", objc_msgSend(v115, "spatialGranularity")), v53, v56);
      v57 = objc_claimAutoreleasedReturnValue();

      v58 = (void *)v57;
      v42 = v119;
      objc_msgSend(v119, "objectForKey:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v59)
      {
        v60 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v119, "setObject:forKeyedSubscript:", v60, v58);

      }
      objc_msgSend(v14, "objectForKeyedSubscript:", v58);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "setObject:forKeyedSubscript:", v61, CFSTR("totalVisitsAreaLevelBeforeStartDate"));

      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      v62 = v49;
      v121 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v128, v142, 16);
      v114 = v62;
      if (!v121)
      {
        v63 = 0;
        v89 = v112;
LABEL_49:

        goto LABEL_51;
      }
      v122 = 0;
      v63 = 0;
      v117 = *(_QWORD *)v129;
      v64 = 0.0;
      do
      {
        for (k = 0; k != v121; ++k)
        {
          v125 = v63;
          if (*(_QWORD *)v129 != v117)
            objc_enumerationMutation(v114);
          v66 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * k);
          objc_msgSend(v66, "exitDate");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "entryDate");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "timeIntervalSinceDate:", v68);
          v70 = v69;

          objc_msgSend(v66, "entryDate");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedLocationManager _getDateOnlyFromLearnedVisitDate:](self, "_getDateOnlyFromLearnedVisitDate:", v71);
          v72 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v42, "objectForKeyedSubscript:", v58);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          obja = (id)v72;
          objc_msgSend(v73, "objectForKey:", v72);
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          v75 = *(void **)(v21 + 2024);
          objc_msgSend(v42, "objectForKeyedSubscript:", v58);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v76;
          v123 = v66;
          if (v74)
          {
            objc_msgSend(v76, "objectForKeyedSubscript:", obja);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "numberWithUnsignedInteger:", v122 + k + objc_msgSend(v78, "integerValue") + 1);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectForKeyedSubscript:", v58);
            v80 = v58;
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "setObject:forKeyedSubscript:", v79, obja);
            v82 = self;
            v21 = 0x1E0CB3000;
          }
          else
          {
            objc_msgSend(v66, "entryDate");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "numberWithUnsignedInteger:", v122+ k+ -[RTLearnedLocationManager _getTotalVisitCountForPreviousDatesFromDictGeohashToDates:referenceDate:](self, "_getTotalVisitCountForPreviousDatesFromDictGeohashToDates:referenceDate:", v77, v78)+ 1);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectForKeyedSubscript:", v58);
            v80 = v58;
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "setObject:forKeyedSubscript:", v79, obja);
            v82 = self;
          }

          v83 = *(void **)(v21 + 2024);
          objc_msgSend(v42, "objectForKeyedSubscript:", v80);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectForKeyedSubscript:", obja);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "integerValue");
          objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("totalVisitsAreaLevelBeforeStartDate"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "numberWithInteger:", objc_msgSend(v87, "integerValue") + v86);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "setObject:forKeyedSubscript:", v88, CFSTR("areaLevelVisitCount"));

          -[RTLearnedLocationManager _getFamiliarityIndexResultAreaLevelForLearnedVisit:learnedLOI:geohash:familiarPlaces:statsVisits:](v82, "_getFamiliarityIndexResultAreaLevelForLearnedVisit:learnedLOI:geohash:familiarPlaces:statsVisits:", v123, v118, v80, v116, v120);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          self = v82;
          v58 = v80;
          if (v63 && (objc_msgSend(v115, "referenceLocationSummary") & 1) == 0)
            objc_msgSend(v113, "addObject:", v63);
          v64 = v64 + v70;

          v21 = 0x1E0CB3000uLL;
          v42 = v119;
        }
        v121 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v128, v142, 16);
        v122 += k;
      }
      while (v121);

      if (v63)
      {
        v14 = v105;
        v89 = v112;
        if (!objc_msgSend(v115, "referenceLocationSummary"))
          goto LABEL_51;
        objc_msgSend(v102, "addObject:", v63);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v64);
        v62 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "addObject:", v62);
        goto LABEL_49;
      }
      v14 = v105;
      v89 = v112;
LABEL_51:

    }
    v107 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v132, v144, 16);
  }
  while (v107);
LABEL_53:

  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v115, "referenceLocationSummary"))
  {
    v90 = v102;
    if (objc_msgSend(v102, "count"))
    {
      v91 = objc_alloc(MEMORY[0x1E0D18390]);
      objc_msgSend(v115, "dateInterval");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationManager _estimateFamiliarityIndexReferenceLocationSummary:dwellTimePerAreas:](self, "_estimateFamiliarityIndexReferenceLocationSummary:dwellTimePerAreas:", v102, v103);
      v93 = (void *)objc_msgSend(v91, "initWithDateInterval:familiarityIndex:", v92);

      objc_msgSend(v41, "addObject:", v93);
      goto LABEL_57;
    }
  }
  else
  {
    v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("dateInterval"), 1);
    v141 = v93;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v141, 1);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "sortedArrayUsingDescriptors:", v94);
    v95 = objc_claimAutoreleasedReturnValue();

    v41 = (id)v95;
    v90 = v102;
LABEL_57:

  }
  v12 = v100;

LABEL_59:
  return v41;
}

- (id)_getFamiliarityIndexResultAreaLevelForLearnedVisit:(id)a3 learnedLOI:(id)a4 geohash:(id)a5 familiarPlaces:(id)a6 statsVisits:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  int v28;
  id v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v19 = 0;
LABEL_12:

      goto LABEL_13;
    }
    LOWORD(v28) = 0;
    v26 = "Invalid parameter not satisfying: learnedLOI";
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v28, 2u);
    goto LABEL_11;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    LOWORD(v28) = 0;
    v26 = "Invalid parameter not satisfying: statsVisits";
    goto LABEL_15;
  }
  -[RTLearnedLocationManager _estimateFamiliarityIndexForAreaWithGeohash:familiarPlaces:visitedLearnedLOI:statsVisits:](self, "_estimateFamiliarityIndexForAreaWithGeohash:familiarPlaces:visitedLearnedLOI:statsVisits:", v14, v15, v13, v16);
  v19 = 0;
  if (v18 >= 0.0)
  {
    v20 = v18;
    if (v18 <= 1.0)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v12, "entryDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "exitDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v21, "initWithStartDate:endDate:", v22, v23);

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18390]), "initWithDateInterval:familiarityIndex:", v24, v20);
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v28 = 138412802;
        v29 = v14;
        v30 = 2112;
        v31 = v24;
        v32 = 2048;
        v33 = v20;
        _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "Area with geohash %@, for dateInterval %@, familiarityIndex %f", (uint8_t *)&v28, 0x20u);
      }

      goto LABEL_12;
    }
  }
LABEL_13:

  return v19;
}

- (double)_estimateFamiliarityIndexForAreaWithGeohash:(id)a3 familiarPlaces:(id)a4 visitedLearnedLOI:(id)a5 statsVisits:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  objc_class *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

LABEL_14:
      v18 = -1.0;
      goto LABEL_15;
    }
    LOWORD(v34) = 0;
    v28 = "Invalid parameter not satisfying: visitedLearnedLOI";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v34, 2u);
    goto LABEL_10;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    LOWORD(v34) = 0;
    v28 = "Invalid parameter not satisfying: statsVisits";
    goto LABEL_17;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("areaLevelVisitCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  if (v17 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138412546;
      v35 = v32;
      v36 = 2112;
      v37 = v33;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@, %@, Invalid data in the statsVisits dictionary", (uint8_t *)&v34, 0x16u);

    }
    goto LABEL_14;
  }
  v18 = 1.0;
  if ((objc_msgSend(v11, "containsObject:", v10) & 1) == 0)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("areaLevelVisitCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    v18 = 0.0;
    if (v21 != 1.0)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("areaLevelVisitCount"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("areaLevelVisitCount"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v18 = v24 / (v26 + 10.0);

    }
  }
LABEL_15:

  return v18;
}

- (id)_getFamiliarityIndexResultForLearnedVisit:(id)a3 learnedLOI:(id)a4 statsLOIVisits:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v15;
  NSObject *v16;
  const char *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v15 = 0;
LABEL_15:

      goto LABEL_16;
    }
    LOWORD(v25) = 0;
    v17 = "Invalid parameter not satisfying: learnedLOI";
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v25, 2u);
    goto LABEL_11;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    LOWORD(v25) = 0;
    v17 = "Invalid parameter not satisfying: statsLOIVisits";
    goto LABEL_18;
  }
  -[RTLearnedLocationManager _estimateFamiliarityIndexForLearnedLOI:statsLOIVisits:](self, "_estimateFamiliarityIndexForLearnedLOI:statsLOIVisits:", v9, v10);
  v13 = v12;
  if (v12 >= 0.0 && v12 <= 1.0)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v8, "entryDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exitDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v18, "initWithStartDate:endDate:", v19, v20);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18390]), "initWithDateInterval:familiarityIndex:", v16, v13);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "place");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v23;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "LOI %@ familiarityIndex %@", (uint8_t *)&v25, 0x16u);

    }
    goto LABEL_15;
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (double)_estimateFamiliarityIndexForLearnedLOI:(id)a3 statsLOIVisits:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  __int16 v29;
  __int16 v30;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      v11 = -1.0;
      goto LABEL_14;
    }
    v30 = 0;
    v16 = "Invalid parameter not satisfying: learnedLOI";
    v17 = (uint8_t *)&v30;
LABEL_19:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, v17, 2u);
    goto LABEL_13;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v29 = 0;
    v16 = "Invalid parameter not satisfying: statsLOIVisits";
    v17 = (uint8_t *)&v29;
    goto LABEL_19;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("loiVisitCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = -1.0;
  if (v10 > 0.0)
  {
    objc_msgSend(v5, "place");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "type") == 1)
    {
LABEL_9:

      v11 = 1.0;
      goto LABEL_14;
    }
    objc_msgSend(v5, "place");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "type") == 2)
    {
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v5, "place");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "type") == 4)
    {

      goto LABEL_8;
    }
    objc_msgSend(v5, "place");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "type");

    v11 = 1.0;
    if (v20 != 3)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("loiVisitCount"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      v23 = v22;

      v11 = 0.0;
      if (v23 != 1.0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("loiVisitCount"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("loiVisitCount"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "doubleValue");
        v11 = v26 / (v28 + 1.0);

      }
    }
  }
LABEL_14:

  return v11;
}

- (unint64_t)_getTotalVisitsCountForLOI:(id)a3 dateInterval:(id)a4 outError:(id *)a5
{
  id v6;
  id v7;
  NSObject *v8;
  dispatch_semaphore_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  id v30;
  NSObject *v31;
  unint64_t v32;
  NSObject *v33;
  objc_class *v35;
  id v36;
  void *v37;
  uint64_t v38;
  const char *aSelector;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t *v44;
  _BYTE *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE buf[12];
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD v59[3];

  aSelector = a2;
  v59[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v55 = 136315394;
      *(_QWORD *)&v55[4] = "-[RTLearnedLocationManager _getTotalVisitsCountForLOI:dateInterval:outError:]";
      *(_WORD *)&v55[12] = 1024;
      *(_DWORD *)&v55[14] = 3897;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loi (in %s:%d)", v55, 0x12u);
    }

  }
  if (v7)
  {
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    *(_QWORD *)v55 = 0;
    *(_QWORD *)&v55[8] = v55;
    *(_QWORD *)&v55[16] = 0x3032000000;
    v56 = __Block_byref_object_copy__17;
    v57 = __Block_byref_object_dispose__17;
    v58 = 0;
    v9 = dispatch_semaphore_create(0);
    -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __77__RTLearnedLocationManager__getTotalVisitsCountForLOI_dateInterval_outError___block_invoke;
    v42[3] = &unk_1E92971F0;
    v44 = &v46;
    v45 = v55;
    v12 = v9;
    v43 = v12;
    objc_msgSend(v10, "fetchCountOfVisitsToLocationOfInterestWithIdentifier:dateInterval:handler:", v11, v7, v42);

    v13 = v12;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v13, v15))
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now", aSelector);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v14);
    v18 = v17;
    v19 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "submitToCoreAnalytics:type:duration:", v23, 1, v18);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v25 = (void *)MEMORY[0x1E0CB35C8];
    v59[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v59, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = objc_retainAutorelease(v27);

      v29 = 0;
    }
    else
    {
LABEL_11:
      v28 = 0;
      v29 = 1;
    }

    v30 = v28;
    if ((v29 & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)&v55[8] + 40), v28);
    if (a5 && *(_QWORD *)(*(_QWORD *)&v55[8] + 40))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *(_QWORD *)(*(_QWORD *)&v55[8] + 40);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v36;
        v51 = 2112;
        v52 = v37;
        v53 = 2112;
        v54 = v38;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v32 = 0;
      *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&v55[8] + 40));
    }
    else
    {
      v32 = v47[3];
    }

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(&v46, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v55 = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", v55, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("dateInterval"));
      v32 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
  }

  return v32;
}

void __77__RTLearnedLocationManager__getTotalVisitsCountForLOI_dateInterval_outError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (unint64_t)_getGeohashLengthForSpatialGranularity:(unint64_t)a3
{
  NSObject *v4;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 == 3)
    return 4;
  if (a3 != 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, %@,currently only LargeArea is supported, this code path shouldn't be reached", (uint8_t *)&v9, 0x16u);

    }
  }
  return 3;
}

- (id)_getAreasGeohashesFamiliarPlacesWithGranularity:(unint64_t)a3 outError:(id *)a4
{
  uint64_t v5;
  void *v6;
  dispatch_semaphore_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  RTLearnedLocationManager *v44;
  unint64_t v45;
  _QWORD v46[5];
  NSObject *v47;
  uint64_t *v48;
  uint64_t *v49;
  SEL v50;
  uint64_t v51;
  id *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;
  uint8_t buf[16];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v34 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v41 = objc_msgSend(&unk_1E932C0D0, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (v41)
  {
    v36 = *MEMORY[0x1E0D18598];
    v37 = *MEMORY[0x1E0CB2D50];
    v38 = *(_QWORD *)v64;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v64 != v38)
          objc_enumerationMutation(&unk_1E932C0D0);
        v6 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v5);
        v7 = dispatch_semaphore_create(0);
        v57 = 0;
        v58 = &v57;
        v59 = 0x3032000000;
        v60 = __Block_byref_object_copy__17;
        v61 = __Block_byref_object_dispose__17;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v62 = (id)objc_claimAutoreleasedReturnValue();
        v51 = 0;
        v52 = (id *)&v51;
        v53 = 0x3032000000;
        v54 = __Block_byref_object_copy__17;
        v55 = __Block_byref_object_dispose__17;
        v56 = 0;
        -[RTLearnedLocationManager learnedLocationStore](self, "learnedLocationStore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v6, "unsignedIntegerValue");
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __85__RTLearnedLocationManager__getAreasGeohashesFamiliarPlacesWithGranularity_outError___block_invoke;
        v46[3] = &unk_1E9299490;
        v46[4] = self;
        v48 = &v57;
        v49 = &v51;
        v50 = a2;
        v10 = v7;
        v47 = v10;
        objc_msgSend(v8, "fetchLocationsOfInterestWithPlaceType:handler:", v9, v46);

        v11 = v10;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v11, v13))
          goto LABEL_11;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", v12);
        v16 = v15;
        v17 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "submitToCoreAnalytics:type:duration:", v21, 1, v16);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v23 = (void *)MEMORY[0x1E0CB35C8];
        v68 = v37;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v68, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", v36, 15, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = objc_retainAutorelease(v25);

          v27 = 0;
        }
        else
        {
LABEL_11:
          v26 = 0;
          v27 = 1;
        }

        v28 = v26;
        if ((v27 & 1) == 0)
          objc_storeStrong(v52 + 5, v26);
        v29 = v52[5];
        if (v29)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v29);
        }
        else if (v58[5])
        {
          objc_msgSend(v35, "addObjectsFromArray:");
        }

        _Block_object_dispose(&v51, 8);
        _Block_object_dispose(&v57, 8);

        if (v29)
        {
          v31 = 0;
          goto LABEL_24;
        }
        ++v5;
      }
      while (v41 != v5);
      v41 = objc_msgSend(&unk_1E932C0D0, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      if (v41)
        continue;
      break;
    }
  }
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __85__RTLearnedLocationManager__getAreasGeohashesFamiliarPlacesWithGranularity_outError___block_invoke_219;
  v42[3] = &unk_1E92994B8;
  v30 = v34;
  v43 = v30;
  v44 = self;
  v45 = a3;
  objc_msgSend(v35, "enumerateObjectsUsingBlock:", v42);
  v31 = v30;

LABEL_24:
  return v31;
}

void __85__RTLearnedLocationManager__getAreasGeohashesFamiliarPlacesWithGranularity_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[7];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2048;
    v22 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, fetched %lu learned location of interest from learned location store", buf, 0x20u);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__RTLearnedLocationManager__getAreasGeohashesFamiliarPlacesWithGranularity_outError___block_invoke_217;
  v16[3] = &unk_1E9299468;
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 48);
  v16[4] = *(_QWORD *)(a1 + 32);
  v16[5] = v12;
  v16[6] = v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v16);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;
  v15 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __85__RTLearnedLocationManager__getAreasGeohashesFamiliarPlacesWithGranularity_outError___block_invoke_217(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2048;
    v17 = a3 + 1;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, learned location of interest %lu, %@", (uint8_t *)&v12, 0x2Au);

  }
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v5, "place");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

}

void __85__RTLearnedLocationManager__getAreasGeohashesFamiliarPlacesWithGranularity_outError___block_invoke_219(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "mapItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latitude");
  v8 = v7;
  objc_msgSend(v5, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "longitude");
  objc_msgSend(v4, "_latitudeLongitudeToGeohashHelperForLatitude:longitude:hashLength:", objc_msgSend(*(id *)(a1 + 40), "_getGeohashLengthForSpatialGranularity:", *(_QWORD *)(a1 + 48)), v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

}

- (id)_getDateOnlyFromLearnedVisitDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", 28, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v6, "setDay:", objc_msgSend(v5, "day"));
    objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "month"));
    objc_msgSend(v6, "setYear:", objc_msgSend(v5, "year"));
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromComponents:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedVisitDate", v11, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)_checkFamiliarityIndexResultsForErrors:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
    goto LABEL_19;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "familiarityIndex", (_QWORD)v21);
        if (v10 == -1.0)
          ++v7;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  if (v7 != objc_msgSend(v4, "count"))
  {
    if (v7 && v7 < objc_msgSend(v4, "count"))
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D185A0];
      v25 = *MEMORY[0x1E0CB2D50];
      v26 = CFSTR("Some familiarity index results are invalid and equal to -1; others are valid");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v17;
      v15 = v18;
      v16 = 3;
      goto LABEL_18;
    }
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0D185A0];
  v27 = *MEMORY[0x1E0CB2D50];
  v28 = CFSTR("All familiarity index results are invalid and equal to -1;");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  v15 = v12;
  v16 = 2;
LABEL_18:
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, v13, (_QWORD)v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v19;
}

- (id)_combineFamiliarityIndexRetrieveError:(id)a3 resultsError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D18598];
    v10 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("Multiple errors occurred.");
    v11 = *MEMORY[0x1E0D18590];
    v18[0] = v10;
    v18[1] = v11;
    v17[0] = v5;
    v17[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v6)
    {
      v15 = v6;
    }
    else
    {
      if (!v5)
      {
        v14 = 0;
        goto LABEL_9;
      }
      v15 = v5;
    }
    v14 = v15;
  }
LABEL_9:

  return v14;
}

- (unint64_t)_getTotalVisitCountForPreviousDatesFromDictGeohashToDates:(id)a3 referenceDate:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    v11 = INFINITY;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "isOnOrBefore:", v6))
        {
          objc_msgSend(v13, "timeIntervalSinceDate:", v6);
          if (v14 >= 0.0)
            v15 = v14;
          else
            v15 = -v14;
          if (v15 < v11)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v16, "integerValue");

            v11 = v15;
          }
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_latitudeLongitudeToGeohashHelperForLatitude:(double)a3 longitude:(double)a4 hashLength:(unint64_t)a5
{
  unint64_t v5;
  NSObject *v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE *v21;
  void *v22;
  NSObject *v24;
  int v25;
  unint64_t v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  if (a5 > 0xC)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v25 = 134217984;
      v26 = v5;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Geohash length is too big (%lu), maximum is 12", (uint8_t *)&v25, 0xCu);
    }

    return 0;
  }
  v7 = 0;
  v8 = 1 << (5 * a5 - 1);
  v9 = -90.0;
  v10 = 90.0;
  v11 = -180.0;
  v12 = 180.0;
  do
  {
    v13 = v11 + (v12 - v11) * 0.5;
    if (v13 <= a4)
      v14 = v8;
    else
      v14 = 0;
    v7 |= v14;
    if (v8 == 1)
      break;
    if (v13 <= a4)
      v11 = v11 + (v12 - v11) * 0.5;
    else
      v12 = v11 + (v12 - v11) * 0.5;
    v15 = v8 >> 1;
    if (v9 + (v10 - v9) * 0.5 > a3)
    {
      v10 = v9 + (v10 - v9) * 0.5;
      v15 = 0;
    }
    else
    {
      v9 = v9 + (v10 - v9) * 0.5;
    }
    v7 |= v15;
    v16 = v8 > 3;
    v8 >>= 2;
  }
  while (v16);
  v17 = a5 + 1;
  v18 = malloc_type_malloc(a5 + 1, 0x529AE8D2uLL);
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = 134217984;
      v26 = v17;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Failed to allocate %lu bytes for the geohash", (uint8_t *)&v25, 0xCu);
    }

    return 0;
  }
  v19 = v18;
  bzero(v18, v5 + 1);
  if (v5)
  {
    v20 = 5 * v5 - 5;
    v21 = v19;
    do
    {
      *v21++ = a0123456789bcde[(v7 >> v20) & 0x1F];
      v20 -= 5;
      --v5;
    }
    while (v5);
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v19, 4);
  free(v19);
  return v22;
}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  RTLearnedLocationManager *v14;
  id v15;
  unint64_t v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__RTLearnedLocationManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
    v12[3] = &unk_1E92994E0;
    v13 = v8;
    v14 = self;
    v15 = v9;
    v16 = a4;
    dispatch_async(v10, v12);

    v11 = v13;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __77__RTLearnedLocationManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString **v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("options cannot be nil");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = (const __CFString **)v24;
    v10 = &v23;
LABEL_7:
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    v13 = v7;
    v14 = 7;
    goto LABEL_9;
  }
  v3 = objc_msgSend(v2, "enumeratedType");
  objc_msgSend((id)objc_opt_class(), "vendedClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "member:", v3);

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR("the type specified by options is not vended by this manager");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v22;
    v10 = &v21;
    goto LABEL_7;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "available") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "learnedLocationStore");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fetchEnumerableObjectsWithOptions:offset:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

    return;
  }
  v15 = (void *)MEMORY[0x1E0CB35C8];
  v16 = *MEMORY[0x1E0D18598];
  v19 = *MEMORY[0x1E0CB2D50];
  v20 = CFSTR("store is not available");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  v13 = v16;
  v14 = 5;
LABEL_9:
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)flushToCacheWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, options, %@", buf, 0x20u);

  }
  if ((objc_msgSend(v7, "hasMask:", 4) & 1) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__RTLearnedLocationManager_flushToCacheWithOptions_handler___block_invoke;
    v13[3] = &unk_1E9297568;
    v14 = v8;
    -[RTLearnedLocationManager trainForReason:mode:handler:](self, "trainForReason:mode:handler:", 3, 1, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

uint64_t __60__RTLearnedLocationManager_flushToCacheWithOptions_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (RTLearnedLocationEngine)learnedLocationEngine
{
  return self->_learnedLocationEngine;
}

- (void)setLearnedLocationEngine:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationEngine, a3);
}

- (RTLearnedPlaceTypeInferenceStore)learnedPlaceTypeInferenceStore
{
  return self->_learnedPlaceTypeInferenceStore;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (BOOL)migrationComplete
{
  return self->_migrationComplete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_learnedPlaceTypeInferenceStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationEngine, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
}

@end
