@implementation RTLearnedLocationStore

uint64_t __82__RTLearnedLocationStore_fetchLocationsOfInterestWithinDistance_location_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationsOfInterestWithinDistance:location:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

void __111__RTLearnedLocationStore__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_includePlaceholders_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _RTMap *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation](RTLearnedLocationOfInterestMO, "fetchRequestSortedByCreation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (v7 == -1)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $v, $v.%K >= %@ and $v.%K <= %@).@count > 0"), CFSTR("visits"), CFSTR("entryDate"), *(_QWORD *)(a1 + 40), CFSTR("exitDate"), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $v, $v.%K >= %@).@count > 0"), CFSTR("visits"), CFSTR("entryDate"), *(_QWORD *)(a1 + 40), v23, v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v8);

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count == 0"), CFSTR("visits"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3528];
    v36[0] = v9;
    objc_msgSend(v4, "predicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "orPredicateWithSubpredicates:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v13);

  }
  v27 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v27;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 138413058;
    v29 = v21;
    v30 = 2112;
    v31 = v4;
    v32 = 2048;
    v33 = v22;
    v34 = 2112;
    v35 = v15;
    _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v15)
  {
    v17 = 0;
  }
  else
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v19 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v14);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __111__RTLearnedLocationStore__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_includePlaceholders_handler___block_invoke_247;
    v25[3] = &unk_1E929DC70;
    v26 = v18;
    v20 = v18;
    -[_RTMap withBlock:](v19, "withBlock:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __72__RTLearnedLocationStore_fetchLocationsOfInterestWithPlaceType_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationsOfInterestWithPlaceType:handler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __90__RTLearnedLocationStore_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationsOfInterestVisitedBetweenStartDate:endDate:includePlaceholders:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
}

void __73__RTLearnedLocationStore__fetchLocationsOfInterestWithPlaceType_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("placeType"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v15 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 138413058;
    v17 = v13;
    v18 = 2112;
    v19 = v4;
    v20 = 2048;
    v21 = v14;
    v22 = 2112;
    v23 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v9)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_learnedLocationsOfInterestFromLearnedLocationsOfInterestMO:context:", v8, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "_sortLocationsOfInterest:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __83__RTLearnedLocationStore__fetchLocationsOfInterestWithinDistance_location_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
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
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  _QWORD v37[6];

  v37[4] = *MEMORY[0x1E0C80C00];
  v26 = a2;
  +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation](RTLearnedLocationOfInterestMO, "fetchRequestSortedByCreation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 32), "latitude");
  objc_msgSend(*(id *)(a1 + 32), "longitude");
  v27 = a1;
  RTCommonCalculateBoundingBox();
  v23 = (void *)MEMORY[0x1E0CB3528];
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%@ <= %K"), v24, CFSTR("locationLongitude"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("locationLongitude"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v7;
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%@ <= %K"), v9, CFSTR("locationLatitude"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v10;
  v11 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("locationLatitude"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPredicate:", v15);

  memset(v28, 0, sizeof(v28));
  objc_msgSend(v26, "executeFetchRequest:error:", v25, v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v28[0];
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(v27 + 64));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 138413058;
    v30 = v21;
    v31 = 2112;
    v32 = v25;
    v33 = 2048;
    v34 = v22;
    v35 = 2112;
    v36 = v17;
    _os_log_debug_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v17)
  {
    v19 = 0;
    v20 = v27;
  }
  else
  {
    v20 = v27;
    objc_msgSend(*(id *)(v27 + 40), "_learnedLocationsOfInterestFromLearnedLocationsOfInterestMO:context:", v16, v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(v20 + 48) + 16))();

}

- (id)_learnedLocationsOfInterestFromLearnedLocationsOfInterestMO:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__69;
  v16 = __Block_byref_object_dispose__69;
  v17 = 0;
  if (objc_msgSend(v5, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __94__RTLearnedLocationStore__learnedLocationsOfInterestFromLearnedLocationsOfInterestMO_context___block_invoke;
    v9[3] = &unk_1E929A690;
    v11 = &v12;
    v10 = v5;
    objc_msgSend(v6, "performBlockAndWait:", v9);
    v7 = (id)v13[5];

  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_sortLocationsOfInterest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_237_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __69__RTLearnedLocationStore_fetchLocationOfInterestWithMapItem_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationOfInterestWithMapItem:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)fetchPlacesWithinDistance:(double)a3 location:(id)a4 handler:(id)a5
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
  v13[2] = __69__RTLearnedLocationStore_fetchPlacesWithinDistance_location_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

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
  block[2] = __72__RTLearnedLocationStore_fetchLocationsOfInterestWithPlaceType_handler___block_invoke;
  block[3] = &unk_1E9298E88;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)fetchLocationsOfInterestWithinDistance:(double)a3 location:(id)a4 handler:(id)a5
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
  v13[2] = __82__RTLearnedLocationStore_fetchLocationsOfInterestWithinDistance_location_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

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
  v15[2] = __90__RTLearnedLocationStore_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke;
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

uint64_t __69__RTLearnedLocationStore_fetchPlacesWithinDistance_location_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlacesWithinDistance:location:predicate:handler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_fetchPlacesWithinDistance:(double)a3 location:(id)a4 predicate:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  RTLearnedLocationStore *v26;
  id v27;
  double v28;
  SEL v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    if (v11)
    {
      v14 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __80__RTLearnedLocationStore__fetchPlacesWithinDistance_location_predicate_handler___block_invoke;
      v23[3] = &unk_1E929DB70;
      v24 = v11;
      v28 = a3;
      v25 = v12;
      v26 = self;
      v29 = a2;
      v15 = v13;
      v27 = v15;
      v16 = (void *)MEMORY[0x1D8232094](v23);
      v21[0] = v14;
      v21[1] = 3221225472;
      v21[2] = __80__RTLearnedLocationStore__fetchPlacesWithinDistance_location_predicate_handler___block_invoke_172;
      v21[3] = &unk_1E9297568;
      v22 = v15;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v16, 1, v21);

      v17 = v24;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0D18598];
      v30 = *MEMORY[0x1E0CB2D50];
      v31[0] = CFSTR("requires a valid location.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 7, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v20);

    }
  }

}

- (void)_fetchLocationOfInterestWithMapItem:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  SEL v21;
  uint8_t buf[8];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v9 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __70__RTLearnedLocationStore__fetchLocationOfInterestWithMapItem_handler___block_invoke;
      v18[3] = &unk_1E9297A08;
      v19 = v7;
      v21 = a2;
      v10 = v8;
      v20 = v10;
      v11 = (void *)MEMORY[0x1D8232094](v18);
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __70__RTLearnedLocationStore__fetchLocationOfInterestWithMapItem_handler___block_invoke_272;
      v16[3] = &unk_1E9297568;
      v17 = v10;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v16);

      v12 = v19;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v23 = *MEMORY[0x1E0CB2D50];
      v24[0] = CFSTR("requires a valid mapItem.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v15);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

- (void)_fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 includePlaceholders:(BOOL)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString **v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  SEL v33;
  BOOL v34;
  uint64_t v35;
  const __CFString *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;
  _QWORD v46[4];

  v46[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v13)
  {
    if (v11 && v12)
    {
      if (objc_msgSend(v11, "compare:", v12) == 1)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "stringFromDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringFromDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v38 = v25;
          v39 = 2112;
          v41 = 2080;
          v40 = v26;
          v42 = "-[RTLearnedLocationStore _fetchLocationsOfInterestVisitedBetweenStartDate:endDate:includePlaceholders:handler:]";
          v43 = 1024;
          v44 = 3377;
          _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "startDate, %@, postdates endDate, %@ (in %s:%d)", buf, 0x26u);

        }
      }
      if (objc_msgSend(v11, "compare:", v12) != 1)
      {
        v22 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __111__RTLearnedLocationStore__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_includePlaceholders_handler___block_invoke;
        v29[3] = &unk_1E929DBB8;
        v30 = v12;
        v34 = a5;
        v31 = v11;
        v33 = a2;
        v23 = v13;
        v32 = v23;
        v24 = (void *)MEMORY[0x1D8232094](v29);
        v27[0] = v22;
        v27[1] = 3221225472;
        v27[2] = __111__RTLearnedLocationStore__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_includePlaceholders_handler___block_invoke_2;
        v27[3] = &unk_1E9297568;
        v28 = v23;
        -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v24, 1, v27);

        v20 = v30;
        goto LABEL_13;
      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v35 = *MEMORY[0x1E0CB2D50];
      v36 = CFSTR("requires well ordered dates.");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = &v36;
      v19 = &v35;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v45 = *MEMORY[0x1E0CB2D50];
      v46[0] = CFSTR("requires valid dates.");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = (const __CFString **)v46;
      v19 = &v45;
    }
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v21);

LABEL_13:
  }

}

- (void)_fetchLocationsOfInterestWithPlaceType:(unint64_t)a3 handler:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  SEL v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__RTLearnedLocationStore__fetchLocationsOfInterestWithPlaceType_handler___block_invoke;
    v14[3] = &unk_1E929DB48;
    v16 = a3;
    v17 = a2;
    v14[4] = self;
    v10 = v7;
    v15 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v14);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __73__RTLearnedLocationStore__fetchLocationsOfInterestWithPlaceType_handler___block_invoke_235;
    v12[3] = &unk_1E9297568;
    v13 = v10;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v12);

  }
}

- (void)_fetchLocationsOfInterestWithinDistance:(double)a3 location:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  RTLearnedLocationStore *v18;
  id v19;
  double v20;
  SEL v21;

  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__RTLearnedLocationStore__fetchLocationsOfInterestWithinDistance_location_handler___block_invoke;
    v16[3] = &unk_1E929A3F8;
    v20 = a3;
    v21 = a2;
    v17 = v9;
    v18 = self;
    v12 = v10;
    v19 = v12;
    v13 = (void *)MEMORY[0x1D8232094](v16);
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __83__RTLearnedLocationStore__fetchLocationsOfInterestWithinDistance_location_handler___block_invoke_232;
    v14[3] = &unk_1E9297568;
    v15 = v12;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v13, 1, v14);

  }
}

void __80__RTLearnedLocationStore__fetchPlacesWithinDistance_location_predicate_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
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
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *contexta;
  void *context;
  id v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  _BYTE v63[128];
  _QWORD v64[7];

  v64[4] = *MEMORY[0x1E0C80C00];
  v42 = a2;
  +[RTLearnedPlaceMO fetchRequestSortedByCreation](RTLearnedPlaceMO, "fetchRequestSortedByCreation");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFetchLimit:", 5);
  v53 = 0.0;
  v54 = 0.0;
  v51 = 0.0;
  v52 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "latitude");
  objc_msgSend(*(id *)(a1 + 32), "longitude");
  RTCommonCalculateBoundingBox();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v3, "addObject:");
  v38 = v4;
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%@ <= %K.%K"), v43, CFSTR("mapItem"), CFSTR("longitude"));
  contexta = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = contexta;
  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v51);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K.%K <= %@"), CFSTR("mapItem"), CFSTR("longitude"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v8;
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v54);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%@ <= %K.%K"), v10, CFSTR("mapItem"), CFSTR("latitude"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v11;
  v12 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K.%K <= %@"), CFSTR("mapItem"), CFSTR("latitude"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObjectsFromArray:", v15);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v38);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v39;
  objc_msgSend(v39, "setPredicate:", v16);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  do
  {
    context = (void *)MEMORY[0x1D8231EA8]();
    v50 = 0;
    objc_msgSend(v42, "executeFetchRequest:error:", v17, &v50);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v50;

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v18 = v19;
    v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v47 != v23)
            objc_enumerationMutation(v18);
          v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v26 = (void *)MEMORY[0x1E0D183B0];
          objc_msgSend(v25, "mapItem");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "createWithManagedObject:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(*(id *)(a1 + 48), "distanceCalculator");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = *(_QWORD *)(a1 + 32);
            v45 = v20;
            objc_msgSend(v29, "distanceFromLocation:toLocation:error:", v30, v28, &v45);
            v32 = v31;
            v33 = v45;

            if (v33)
            {

              v20 = v33;
              goto LABEL_20;
            }
            if (v32 <= *(double *)(a1 + 64))
            {
              +[RTLearnedPlace createWithManagedObject:](RTLearnedPlace, "createWithManagedObject:", v25);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (v34)
                objc_msgSend(v44, "addObject:", v34);

            }
            v20 = 0;
          }

        }
        v22 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
        if (v22)
          continue;
        break;
      }
    }
LABEL_20:

    v17 = v39;
    objc_msgSend(v39, "setFetchOffset:", objc_msgSend(v39, "fetchOffset") + objc_msgSend(v18, "count"));
    objc_msgSend(v42, "reset");
    objc_autoreleasePoolPop(context);
  }
  while (objc_msgSend(v18, "count") && !v20);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v39, "fetchOffset");
    *(_DWORD *)buf = 138413058;
    v56 = v36;
    v57 = 2112;
    v58 = v39;
    v59 = 2048;
    v60 = v37;
    v61 = 2112;
    v62 = v20;
    _os_log_debug_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __70__RTLearnedLocationStore__fetchLocationOfInterestWithMapItem_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
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
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *context;
  void *v53;
  id v54;
  void *v55;
  id obja;
  id obj;
  uint64_t v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65[5];
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  id v76;
  _QWORD v77[7];

  v77[4] = *MEMORY[0x1E0C80C00];
  v59 = a2;
  +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation](RTLearnedLocationOfInterestMO, "fetchRequestSortedByCreation");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setFetchLimit:", 5);
  objc_msgSend(v55, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("placeMapItemIdentifier"), v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v47 = (void *)v5;
  objc_msgSend(v50, "addObject:", v5);
  memset(&v65[1], 0, 32);
  objc_msgSend(*(id *)(a1 + 32), "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latitude");
  v58 = a1;
  objc_msgSend(*(id *)(a1 + 32), "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "longitude");
  RTCommonCalculateBoundingBox();

  v53 = (void *)MEMORY[0x1E0CB3528];
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  obja = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%@ <= %K"), obja, CFSTR("locationLongitude"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v9;
  v10 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("locationLongitude"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v12;
  v13 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("%@ <= %K"), v14, CFSTR("locationLatitude"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v77[2] = v15;
  v16 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v55;
  objc_msgSend(v16, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("locationLatitude"), v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v77[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "andPredicateWithSubpredicates:", v20);
  v21 = objc_claimAutoreleasedReturnValue();

  v49 = (void *)v21;
  objc_msgSend(v50, "addObject:", v21);
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v50);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObject:");
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v51);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setPredicate:", v22);

  v23 = 0;
  do
  {
    context = (void *)MEMORY[0x1D8231EA8]();
    v65[0] = 0;
    objc_msgSend(v59, "executeFetchRequest:error:", v18, v65);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v65[0];

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(v58 + 48));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v18, "fetchOffset");
      v45 = objc_msgSend(v24, "count");
      *(_DWORD *)buf = 138413314;
      v68 = v43;
      v69 = 2112;
      v70 = v18;
      v71 = 2048;
      v72 = v44;
      v73 = 2048;
      v74 = v45;
      v75 = 2112;
      v76 = v25;
      _os_log_debug_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, nearby LOIs, %lu, error, %@", buf, 0x34u);

    }
    v54 = v25;

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v24;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (v27)
    {
      v28 = v27;
      v29 = 0;
      v30 = *(_QWORD *)v62;
      while (2)
      {
        v31 = 0;
        v32 = v29;
        do
        {
          if (*(_QWORD *)v62 != v30)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v31);
          +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setReturnsObjectsAsFaults:", 0);
          v35 = (void *)MEMORY[0x1E0CB3880];
          objc_msgSend(v33, "placeMapItemIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "setPredicate:", v37);
          v60 = v32;
          objc_msgSend(v59, "executeFetchRequest:error:", v34, &v60);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v60;

          v39 = (void *)MEMORY[0x1E0D183E8];
          objc_msgSend(v38, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "createWithManagedObject:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v41, "isEqualToMapItem:", *(_QWORD *)(v58 + 32)) & 1) != 0)
          {
            +[RTLearnedLocationOfInterest createWithManagedObject:](RTLearnedLocationOfInterest, "createWithManagedObject:", v33);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v54;
            (*(void (**)(void))(*(_QWORD *)(v58 + 40) + 16))();

            v23 = obj;
            objc_autoreleasePoolPop(context);
            v18 = v55;
            goto LABEL_19;
          }

          ++v31;
          v32 = v29;
        }
        while (v28 != v31);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
        if (v28)
          continue;
        break;
      }
    }
    else
    {
      v29 = 0;
    }
    v23 = obj;

    v18 = v55;
    objc_msgSend(v55, "setFetchOffset:", objc_msgSend(v55, "fetchOffset") + objc_msgSend(obj, "count"));
    objc_msgSend(v59, "reset");
    objc_autoreleasePoolPop(context);
    v42 = v54;
  }
  while (objc_msgSend(obj, "count") && !v29 && !v54);
  if (!objc_msgSend(obj, "count"))
    (*(void (**)(void))(*(_QWORD *)(v58 + 40) + 16))();
LABEL_19:

}

void __78__RTLearnedLocationStore_placeTypeForMapItem_placeType_placeTypeSource_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)placeTypeForMapItem:(id)a3 placeType:(unint64_t *)a4 placeTypeSource:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
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
  id v25;
  char v26;
  NSObject *v27;
  const char *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  _QWORD v36[4];
  NSObject *v37;
  uint8_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[8];
  uint8_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint8_t v53[16];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: mapItem";
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
    goto LABEL_16;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: placeType";
    goto LABEL_15;
  }
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "Invalid parameter not satisfying: placeTypeSource";
      goto LABEL_15;
    }
LABEL_16:
    v29 = 0;
    goto LABEL_26;
  }
  *a4 = 0;
  *a5 = 0;
  v11 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  v47 = buf;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__69;
  v50 = __Block_byref_object_dispose__69;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__69;
  v44 = __Block_byref_object_dispose__69;
  v45 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __78__RTLearnedLocationStore_placeTypeForMapItem_placeType_placeTypeSource_error___block_invoke;
  v36[3] = &unk_1E9297478;
  v38 = buf;
  v39 = &v40;
  v12 = v11;
  v37 = v12;
  -[RTLearnedLocationStore fetchLocationOfInterestWithMapItem:handler:](self, "fetchLocationOfInterestWithMapItem:handler:", v10, v36);
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v13, v14))
  {
    v25 = 0;
LABEL_18:
    v26 = 1;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "timeIntervalSinceDate:", v35);
  v16 = v15;
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_714);
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
    *(_WORD *)v53 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v53, 2u);
  }

  v23 = (void *)MEMORY[0x1E0CB35C8];
  v52 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v53 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (!v25)
    goto LABEL_18;
  v25 = objc_retainAutorelease(v25);

  v26 = 0;
LABEL_19:

  v27 = v25;
  if ((v26 & 1) == 0)
    objc_storeStrong((id *)v47 + 5, v25);
  v30 = (void *)v41[5];
  if (v30)
  {
    objc_msgSend(v30, "place");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = objc_msgSend(v31, "type");

    objc_msgSend((id)v41[5], "place");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = objc_msgSend(v32, "typeSource");

  }
  if (a6)
    *a6 = objc_retainAutorelease(*((id *)v47 + 5));
  v29 = *((_QWORD *)v47 + 5) == 0;

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(buf, 8);

LABEL_26:
  return v29;
}

- (void)fetchLocationOfInterestWithMapItem:(id)a3 handler:(id)a4
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
  block[2] = __69__RTLearnedLocationStore_fetchLocationOfInterestWithMapItem_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)submitMetricsOnExtendingLifetimeOfObjectsWithIdentifiers:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (objc_msgSend(v5, "count"))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __100__RTLearnedLocationStore_Metrics__submitMetricsOnExtendingLifetimeOfObjectsWithIdentifiers_context___block_invoke;
      v8[3] = &unk_1E92977B8;
      v9 = v6;
      objc_msgSend(v9, "performBlockAndWait:", v8);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

  }
}

void __100__RTLearnedLocationStore_Metrics__submitMetricsOnExtendingLifetimeOfObjectsWithIdentifiers_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  void *v22;
  void *v23;
  unint64_t v24;
  float v25;
  NSObject *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  double v45;
  __int16 v46;
  unint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setResultType:", 2);
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("%K"), CFSTR("creationDate"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35D0];
  v40 = (void *)v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expressionForFunction:arguments:", CFSTR("min:"), v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setName:", CFSTR("oldestCreationDate"));
  v39 = (void *)v6;
  objc_msgSend(v7, "setExpression:", v6);
  objc_msgSend(v7, "setExpressionResultType:", 900);
  v48[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v8);

  v9 = *(void **)(a1 + 32);
  v43 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v2, &v43);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v43;
  v38 = v10;
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("oldestCreationDate"));
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v12;
  objc_msgSend(v13, "timeIntervalSinceDate:", v12);
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -4838400.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K < %@"), CFSTR("creationDate"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPredicate:", v17);
  v19 = *(void **)(a1 + 32);
  v42 = 0;
  v20 = objc_msgSend(v19, "countForFetchRequest:error:", v18, &v42);
  v21 = v42;
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(void **)(a1 + 32);
  v41 = v21;
  v24 = objc_msgSend(v23, "countForFetchRequest:error:", v22, &v41);
  v35 = v41;

  if (v24)
    v25 = (float)((float)v20 / (float)v24) * 100.0;
  else
    v25 = 0.0;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v45 = v25;
    v46 = 2048;
    v47 = v24;
    _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "pinned visits percentage, %.2f, total visits, %lu", buf, 0x16u);
  }

  v27 = (void *)objc_opt_new();
  *(float *)&v28 = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, CFSTR("pinnedVisitsPercentage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, CFSTR("totalVisitCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("ageOfOldestVisit"));

  v32 = objc_alloc(MEMORY[0x1E0CB3940]);
  v33 = (void *)objc_msgSend(v32, "initWithCString:encoding:", RTAnalyticsEventVisitLifetimeExtension, 1);
  log_analytics_submission(v33, v27);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (RTLearnedLocationStore)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_expirationEnforcer_mirroringManager_);
}

- (RTLearnedLocationStore)initWithDistanceCalculator:(id)a3 expirationEnforcer:(id)a4 mirroringManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  RTLearnedLocationStore *v14;
  RTLearnedLocationStore *v15;
  NSObject *v16;
  const char *v17;
  objc_super v19;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_14;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: expirationEnforcer";
    goto LABEL_13;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: mirroringManager";
      goto LABEL_13;
    }
LABEL_14:

    v15 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v11, "persistenceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)RTLearnedLocationStore;
  v14 = -[RTStore initWithPersistenceManager:](&v19, sel_initWithPersistenceManager_, v13);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_distanceCalculator, a3);
    objc_storeStrong((id *)&v14->_expirationEnforcer, a4);
    objc_storeStrong((id *)&v14->_mirroringManager, a5);
  }
  self = v14;
  v15 = self;
LABEL_15:

  return v15;
}

+ (id)filterPlaces:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_54);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __39__RTLearnedLocationStore_filterPlaces___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  int v12;
  id v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412802;
      v13 = v2;
      v14 = 2080;
      v15 = "+[RTLearnedLocationStore filterPlaces:]_block_invoke";
      v16 = 1024;
      v17 = 117;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "mapItem cannot be nil for place, %@. (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }

  }
  objc_msgSend(v2, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "geoMapItemHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412802;
      v13 = v2;
      v14 = 2080;
      v15 = "+[RTLearnedLocationStore filterPlaces:]_block_invoke";
      v16 = 1024;
      v17 = 120;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "geoMapItemHandle cannot be nil for place, %@. (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }

  }
  objc_msgSend(v2, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "geoMapItemHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  return v10;
}

+ (id)filterLocationsOfInterests:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_34_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __53__RTLearnedLocationStore_filterLocationsOfInterests___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "place");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "place");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v15;
      v19 = 2080;
      v20 = "+[RTLearnedLocationStore filterLocationsOfInterests:]_block_invoke";
      v21 = 1024;
      v22 = 136;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "mapItem cannot be nil for locationOfInterest, %@. (in %s:%d)", (uint8_t *)&v17, 0x1Cu);

    }
  }
  objc_msgSend(v2, "place");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "geoMapItemHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "place");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v16;
      v19 = 2080;
      v20 = "+[RTLearnedLocationStore filterLocationsOfInterests:]_block_invoke";
      v21 = 1024;
      v22 = 139;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "geoMapItemHandle cannot be nil for locationOfInterest, %@. (in %s:%d)", (uint8_t *)&v17, 0x1Cu);

    }
  }
  objc_msgSend(v2, "place");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "geoMapItemHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 != 0;

  return v13;
}

- (void)storePlaces:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "filterPlaces:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[RTStore storeWritableObjects:handler:](self, "storeWritableObjects:handler:", v8, v6);
}

- (void)storeLocationsOfInterest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "filterLocationsOfInterests:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[RTStore storeWritableObjects:handler:](self, "storeWritableObjects:handler:", v8, v6);
}

- (void)_storeVisits:(id)a3 finerGranularityInferredMapItems:(id)a4 place:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  SEL v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86__RTLearnedLocationStore__storeVisits_finerGranularityInferredMapItems_place_handler___block_invoke;
  v20[3] = &unk_1E929D938;
  v21 = v11;
  v22 = v12;
  v24 = v14;
  v25 = a2;
  v23 = v13;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = (void *)MEMORY[0x1D8232094](v20);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v19, 2, v15);

}

void __86__RTLearnedLocationStore__storeVisits_finerGranularityInferredMapItems_place_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = +[RTLearnedVisitMO managedObjectWithVisit:finerGranularityInferredMapItem:place:inManagedObjectContext:](RTLearnedVisitMO, "managedObjectWithVisit:finerGranularityInferredMapItem:place:inManagedObjectContext:", v9, v12, *(_QWORD *)(a1 + 48), v3);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v6);
  }

  v19 = 0;
  v14 = objc_msgSend(v3, "save:", &v19);
  v15 = v19;
  if ((v14 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      v26 = 2112;
      v27 = v15;
      _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "%@, error, %@", buf, 0x16u);

    }
  }
  v17 = *(_QWORD *)(a1 + 56);
  if (v17)
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v15);

}

- (void)storeVisits:(id)a3 place:(id)a4 handler:(id)a5
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
  v15[2] = __52__RTLearnedLocationStore_storeVisits_place_handler___block_invoke;
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

uint64_t __52__RTLearnedLocationStore_storeVisits_place_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeVisits:finerGranularityInferredMapItems:place:handler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)storeVisits:(id)a3 finerGranularityInferredMapItems:(id)a4 place:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[RTNotifier queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__RTLearnedLocationStore_storeVisits_finerGranularityInferredMapItems_place_handler___block_invoke;
  block[3] = &unk_1E9297F08;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

uint64_t __85__RTLearnedLocationStore_storeVisits_finerGranularityInferredMapItems_place_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeVisits:finerGranularityInferredMapItems:place:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)associatePlacesToVisits:(id)a3 handler:(id)a4
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
  block[2] = __58__RTLearnedLocationStore_associatePlacesToVisits_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __58__RTLearnedLocationStore_associatePlacesToVisits_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_associatePlacesToVisits:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)migrateLegacyMapItemsWithEnumerationBlock:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  RTLearnedLocationStore *v34;
  NSObject *v35;
  id v36;
  _BYTE *v37;
  _BYTE v38[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  uint8_t buf[8];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    *(_QWORD *)v38 = 0;
    *(_QWORD *)&v38[8] = v38;
    *(_QWORD *)&v38[16] = 0x3032000000;
    v39 = __Block_byref_object_copy__69;
    v40 = __Block_byref_object_dispose__69;
    v41 = 0;
    v5 = dispatch_semaphore_create(0);
    -[RTNotifier queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __68__RTLearnedLocationStore_migrateLegacyMapItemsWithEnumerationBlock___block_invoke;
    v33 = &unk_1E929D960;
    v34 = self;
    v36 = v4;
    v37 = v38;
    v7 = v5;
    v35 = v7;
    dispatch_async(v6, &v30);

    v8 = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now", v30, v31, v32, v33, v34);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v8, v10))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v9);
    v13 = v12;
    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_714);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v20 = (void *)MEMORY[0x1E0CB35C8];
    v44 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v44, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = objc_retainAutorelease(v22);

      v24 = 0;
    }
    else
    {
LABEL_7:
      v23 = 0;
      v24 = 1;
    }

    v25 = v23;
    if ((v24 & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)&v38[8] + 40), v23);
    v26 = *(id *)(*(_QWORD *)&v38[8] + 40);

    _Block_object_dispose(v38, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v38 = 136315394;
      *(_QWORD *)&v38[4] = "-[RTLearnedLocationStore migrateLegacyMapItemsWithEnumerationBlock:]";
      *(_WORD *)&v38[12] = 1024;
      *(_DWORD *)&v38[14] = 258;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock (in %s:%d)", v38, 0x12u);
    }

    v42 = *MEMORY[0x1E0CB2D50];
    v43 = CFSTR("A non-nil enumeration block is required.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v28);
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v26;
}

void __68__RTLearnedLocationStore_migrateLegacyMapItemsWithEnumerationBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__RTLearnedLocationStore_migrateLegacyMapItemsWithEnumerationBlock___block_invoke_2;
  v3[3] = &unk_1E9297038;
  v1 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_migrateLegacyMapItemsWithEnumerationBlock:completionBlock:", v1, v3);

}

void __68__RTLearnedLocationStore_migrateLegacyMapItemsWithEnumerationBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_migrateLegacyMapItemsWithEnumerationBlock:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  SEL v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v8)
  {
    if (v7)
    {
      v10 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __85__RTLearnedLocationStore__migrateLegacyMapItemsWithEnumerationBlock_completionBlock___block_invoke;
      v19[3] = &unk_1E929D988;
      v11 = v8;
      v20 = v11;
      v21 = v7;
      v22 = a2;
      v12 = (void *)MEMORY[0x1D8232094](v19);
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __85__RTLearnedLocationStore__migrateLegacyMapItemsWithEnumerationBlock_completionBlock___block_invoke_52;
      v17[3] = &unk_1E9297568;
      v18 = v11;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v12, 2, v17);

      v13 = v20;
LABEL_11:

      goto LABEL_12;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTLearnedLocationStore _migrateLegacyMapItemsWithEnumerationBlock:completionBlock:]";
      v27 = 1024;
      v28 = 288;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completionBlock (in %s:%d)", buf, 0x12u);
    }

    if (v7)
      goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[RTLearnedLocationStore _migrateLegacyMapItemsWithEnumerationBlock:completionBlock:]";
    v27 = 1024;
    v28 = 289;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock (in %s:%d)", buf, 0x12u);
  }

  if (v9)
  {
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("A non-nil enumeration block is required.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v16);

    goto LABEL_11;
  }
LABEL_12:

}

void __85__RTLearnedLocationStore__migrateLegacyMapItemsWithEnumerationBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  char v20;
  id v21;
  NSObject *v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  char v47;
  id v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchBatchSize:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil || %K != nil"), CFSTR("mapItemGeoMapItem"), CFSTR("mapItemGeoMapItemHandle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v48 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v48);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v48;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v50 = (uint64_t)v7;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "could not fetch a count of legacy map items to migrate, error, %@", buf, 0xCu);
    }
LABEL_4:

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_35;
  }
  if (!objc_msgSend(v6, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "no legacy map items exist to migrate, returning.", buf, 2u);
    }
    goto LABEL_4;
  }
  v33 = v4;
  objc_msgSend(v3, "mergePolicy");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  objc_msgSend(v3, "setMirroringQualityOfService:", 3);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134217984;
    v50 = v10;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "migrating %lu legacy map items.", buf, 0xCu);
  }

  v47 = 0;
  v34 = (void *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v32 = v6;
  obj = v6;
  v37 = v3;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v44;
    v36 = a1;
LABEL_10:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v38)
        objc_enumerationMutation(obj);
      if (v47)
        break;
      v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(v12, "mapItemGeoMapItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mapItemGeoMapItemHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mapItemSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v50 = (uint64_t)v14;
        _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "Migrating map item, %@", buf, 0xCu);
      }

      (*(void (**)(_QWORD, void *, void *, uint64_t, _QWORD, char *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v14, v15, objc_msgSend(v16, "unsignedIntegerValue"), 0, &v47);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v40 = v13;
        +[RTMapItemMO managedObjectWithMapItem:inManagedObjectContext:](RTMapItemMO, "managedObjectWithMapItem:inManagedObjectContext:", v18, v3);
        v19 = objc_claimAutoreleasedReturnValue();
        v42 = 0;
        v20 = objc_msgSend(v3, "save:", &v42);
        v21 = v42;
        if ((v20 & 1) == 0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(v36 + 48));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v50 = (uint64_t)v30;
            v51 = 2112;
            v52 = v21;
            _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          }
          if (v21)
            objc_msgSend(v34, "addObject:", v21);
        }
        objc_msgSend(v12, "setMapItemGeoMapItem:", 0);
        objc_msgSend(v12, "setMapItemGeoMapItemHandle:", 0);
        objc_msgSend(v12, "setMapItemSource:", 0);
        objc_msgSend(v12, "setMapItem:", v19);
        v41 = v21;
        v23 = objc_msgSend(v3, "save:", &v41);
        v24 = v41;

        if ((v23 & 1) == 0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(v36 + 48));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v50 = (uint64_t)v26;
            v51 = 2112;
            v52 = v24;
            _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          }
          if (v24)
            objc_msgSend(v34, "addObject:", v24);
        }
        v3 = v37;
        objc_msgSend(v37, "refreshObject:mergeChanges:", v12, 0);

        a1 = v36;
        v13 = v40;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "could not create new map item during migration of legacy map item", buf, 2u);
        }
      }

      objc_autoreleasePoolPop(v13);
      if (v39 == ++v11)
      {
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        if (v39)
          goto LABEL_10;
        break;
      }
    }
  }

  objc_msgSend(v3, "setMergePolicy:", v31);
  _RTSafeArray();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v50 = 0;
    _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "migrated %lu legacy map items.", buf, 0xCu);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  v3 = v37;
  v6 = v32;
  v4 = v33;
  v7 = 0;
LABEL_35:

}

uint64_t __85__RTLearnedLocationStore__migrateLegacyMapItemsWithEnumerationBlock_completionBlock___block_invoke_52(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)refreshMapItemsWithEnumerationBlock:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  RTLearnedLocationStore *v34;
  NSObject *v35;
  id v36;
  _BYTE *v37;
  _BYTE v38[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  uint8_t buf[8];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    *(_QWORD *)v38 = 0;
    *(_QWORD *)&v38[8] = v38;
    *(_QWORD *)&v38[16] = 0x3032000000;
    v39 = __Block_byref_object_copy__69;
    v40 = __Block_byref_object_dispose__69;
    v41 = 0;
    v5 = dispatch_semaphore_create(0);
    -[RTNotifier queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __62__RTLearnedLocationStore_refreshMapItemsWithEnumerationBlock___block_invoke;
    v33 = &unk_1E929D960;
    v34 = self;
    v36 = v4;
    v37 = v38;
    v7 = v5;
    v35 = v7;
    dispatch_async(v6, &v30);

    v8 = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now", v30, v31, v32, v33, v34);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v8, v10))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v9);
    v13 = v12;
    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_714);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v20 = (void *)MEMORY[0x1E0CB35C8];
    v44 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v44, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = objc_retainAutorelease(v22);

      v24 = 0;
    }
    else
    {
LABEL_7:
      v23 = 0;
      v24 = 1;
    }

    v25 = v23;
    if ((v24 & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)&v38[8] + 40), v23);
    v26 = *(id *)(*(_QWORD *)&v38[8] + 40);

    _Block_object_dispose(v38, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v38 = 136315394;
      *(_QWORD *)&v38[4] = "-[RTLearnedLocationStore refreshMapItemsWithEnumerationBlock:]";
      *(_WORD *)&v38[12] = 1024;
      *(_DWORD *)&v38[14] = 422;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock (in %s:%d)", v38, 0x12u);
    }

    v42 = *MEMORY[0x1E0CB2D50];
    v43 = CFSTR("A non-nil enumeration block is required.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v28);
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v26;
}

void __62__RTLearnedLocationStore_refreshMapItemsWithEnumerationBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__RTLearnedLocationStore_refreshMapItemsWithEnumerationBlock___block_invoke_2;
  v3[3] = &unk_1E9297038;
  v1 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_refreshMapItemsWithEnumerationBlock:completionBlock:", v1, v3);

}

void __62__RTLearnedLocationStore_refreshMapItemsWithEnumerationBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_refreshMapItemsWithEnumerationBlock:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  SEL v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v8)
  {
    if (v7)
    {
      v10 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __79__RTLearnedLocationStore__refreshMapItemsWithEnumerationBlock_completionBlock___block_invoke;
      v19[3] = &unk_1E929D9B0;
      v19[4] = self;
      v22 = a2;
      v11 = v8;
      v20 = v11;
      v21 = v7;
      v12 = (void *)MEMORY[0x1D8232094](v19);
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __79__RTLearnedLocationStore__refreshMapItemsWithEnumerationBlock_completionBlock___block_invoke_59;
      v17[3] = &unk_1E9297568;
      v18 = v11;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v12, 1, v17);

      goto LABEL_11;
    }
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[RTLearnedLocationStore _refreshMapItemsWithEnumerationBlock:completionBlock:]";
    v27 = 1024;
    v28 = 452;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completionBlock (in %s:%d)", buf, 0x12u);
  }

  if (!v7)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTLearnedLocationStore _refreshMapItemsWithEnumerationBlock:completionBlock:]";
      v27 = 1024;
      v28 = 453;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
      v23 = *MEMORY[0x1E0CB2D50];
      v24 = CFSTR("A non-nil enumeration block is required.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v9)[2](v9, v16);

    }
  }
LABEL_11:

}

void __79__RTLearnedLocationStore__refreshMapItemsWithEnumerationBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_once_t *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  dispatch_once_t *v21;
  NSObject *v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  char v44;
  id v45;
  const __CFString *v46;
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  id v55;
  _QWORD v56[4];

  v56[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = CFSTR("geoMapItemHandle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v5);

  objc_msgSend(*(id *)(a1 + 32), "predicateForObjectsFromCurrentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v6);

  objc_msgSend(v4, "setFetchBatchSize:", 1);
  v45 = 0;
  v38 = v3;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v45);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v45;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 138413058;
    v49 = v28;
    v50 = 2112;
    v51 = v4;
    v52 = 2048;
    v53 = v29;
    v54 = 2112;
    v55 = v8;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v8;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "could not fetch map items to refresh, error, %@", buf, 0xCu);
    }
LABEL_6:

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_28;
  }
  if (!objc_msgSend(v7, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "no map items exist to refresh, returning.", buf, 2u);
    }
    goto LABEL_6;
  }
  v33 = v4;
  objc_msgSend(v3, "mergePolicy");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  objc_msgSend(v3, "setMirroringQualityOfService:", 3);
  v44 = 0;
  v34 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v32 = v7;
  obj = v7;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v41;
    v11 = RTLogFacilityLearnedLocation;
LABEL_10:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v36)
        objc_enumerationMutation(obj);
      if (v44)
        break;
      v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v12);
      v14 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(MEMORY[0x1E0D183E8], "createWithManagedObject:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(v11);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v15;
        _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "Refreshing map item, %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v46 = CFSTR("identifier");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mergeWithMapItem:preservingProperties:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        +[RTMapItemMO managedObjectWithMapItem:managedObject:inManagedObjectContext:](RTMapItemMO, "managedObjectWithMapItem:managedObject:inManagedObjectContext:", v19, v13, v38);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v11;
        _rt_log_facility_get_os_log(v11);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v17;
          _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "Refreshed map item, %@", buf, 0xCu);
        }

        v39 = 0;
        v23 = objc_msgSend(v38, "save:", &v39);
        v24 = v39;
        if ((v23 & 1) == 0)
        {
          _rt_log_facility_get_os_log(v21);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 56));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v49 = v30;
            v50 = 2112;
            v51 = v24;
            _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          }
          if (v24)
            objc_msgSend(v34, "addObject:", v24);
        }
        objc_msgSend(v38, "refreshObject:mergeChanges:", v20, 0);

        v11 = v21;
      }

      objc_autoreleasePoolPop(v14);
      if (v37 == ++v12)
      {
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
        if (v37)
          goto LABEL_10;
        break;
      }
    }
  }

  objc_msgSend(v38, "setMergePolicy:", v31);
  _RTSafeArray();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
  v7 = v32;
  v4 = v33;
  v8 = 0;
LABEL_28:

}

uint64_t __79__RTLearnedLocationStore__refreshMapItemsWithEnumerationBlock_completionBlock___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updatePlaces:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "filterPlaces:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[RTStore updateWritableObjects:handler:](self, "updateWritableObjects:handler:", v8, v6);
}

- (void)updateLocationsOfInterest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "filterLocationsOfInterests:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[RTStore updateWritableObjects:handler:](self, "updateWritableObjects:handler:", v8, v6);
}

- (void)_updateLocationOfInterestWithIdentifier:(id)a3 place:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  SEL v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__RTLearnedLocationStore__updateLocationOfInterestWithIdentifier_place_handler___block_invoke;
  v20[3] = &unk_1E92979A0;
  v24 = a2;
  v21 = v9;
  v22 = v10;
  v13 = v11;
  v23 = v13;
  v14 = v10;
  v15 = v9;
  v16 = (void *)MEMORY[0x1D8232094](v20);
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __80__RTLearnedLocationStore__updateLocationOfInterestWithIdentifier_place_handler___block_invoke_65;
  v18[3] = &unk_1E9297568;
  v19 = v13;
  v17 = v13;
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v16, 2, v18);

}

void __80__RTLearnedLocationStore__updateLocationOfInterestWithIdentifier_place_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  char v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "mergePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchLimit:", 1);
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  v41 = 0;
  objc_msgSend(v5, "execute:", &v41);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v41;
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 && v9)
  {
    objc_msgSend(v9, "placeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[RTLearnedPlaceMO fetchRequestSortedByCreation](RTLearnedPlaceMO, "fetchRequestSortedByCreation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFetchLimit:", 1);
      objc_msgSend(v11, "setReturnsObjectsAsFaults:", 0);
      v12 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v9, "placeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPredicate:", v14);

      v40 = 0;
      objc_msgSend(v11, "execute:", &v40);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v40;
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 || !v16)
        goto LABEL_15;
      objc_msgSend(v9, "placeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if ((v19 & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "placeIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138413058;
          v43 = v35;
          v44 = 2112;
          v45 = v36;
          v46 = 2112;
          v47 = v37;
          v48 = 2112;
          v49 = v38;
          _os_log_debug_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEBUG, "%@, warning, ignoring change to place identifier, %@, from, %@, for loi, %@", buf, 0x2Au);

        }
      }
      objc_msgSend(*(id *)(a1 + 40), "mapItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "mapItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTMapItemMO managedObjectWithMapItem:managedObject:inManagedObjectContext:](RTMapItemMO, "managedObjectWithMapItem:managedObject:inManagedObjectContext:", v21, v22, v3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMapItem:", v23);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "type"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setType:", v24);
      objc_msgSend(v9, "setPlaceType:", v24);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "typeSource"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTypeSource:", v25);
      objc_msgSend(v9, "setPlaceTypeSource:", v25);

      objc_msgSend(*(id *)(a1 + 40), "customLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCustomLabel:", v26);
      objc_msgSend(v9, "setPlaceCustomLabel:", v26);

      objc_msgSend(v16, "mapItem");
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setMapItem:", v27);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v43 = v32;
        v44 = 2112;
        v45 = v33;
        _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%@, error, loi with identifier, %@, missing place identifier", buf, 0x16u);

      }
      v16 = 0;
    }

    v8 = 0;
LABEL_15:

  }
  objc_msgSend(v3, "setMirroringQualityOfService:", 3);
  if (!v8)
  {
    v39 = 0;
    v28 = objc_msgSend(v3, "save:", &v39);
    v8 = v39;
    if ((v28 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v43 = v34;
        v44 = 2112;
        v45 = v8;
        _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
    }
  }
  objc_msgSend(v3, "setMergePolicy:", v4);
  v30 = *(_QWORD *)(a1 + 48);
  if (v30)
  {
    if (v8)
    {
      v31 = 0;
    }
    else
    {
      +[RTLearnedLocationOfInterest createWithManagedObject:](RTLearnedLocationOfInterest, "createWithManagedObject:", v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(a1 + 48);
    }
    (*(void (**)(uint64_t, void *, id))(v30 + 16))(v30, v31, v8);

  }
}

uint64_t __80__RTLearnedLocationStore__updateLocationOfInterestWithIdentifier_place_handler___block_invoke_65(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 place:(id)a4 handler:(id)a5
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
  v15[2] = __79__RTLearnedLocationStore_updateLocationOfInterestWithIdentifier_place_handler___block_invoke;
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

uint64_t __79__RTLearnedLocationStore_updateLocationOfInterestWithIdentifier_place_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLocationOfInterestWithIdentifier:place:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)expireLifetimeOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5
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
  v15[2] = __87__RTLearnedLocationStore_expireLifetimeOfVisitsWithIdentifiers_expirationDate_handler___block_invoke;
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

uint64_t __87__RTLearnedLocationStore_expireLifetimeOfVisitsWithIdentifiers_expirationDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_expireLifetimeOfVisitsWithIdentifiers:expirationDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_expireLifetimeOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  SEL v19;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __88__RTLearnedLocationStore__expireLifetimeOfVisitsWithIdentifiers_expirationDate_handler___block_invoke;
    v15[3] = &unk_1E929D9D8;
    v15[4] = self;
    v16 = v9;
    v19 = a2;
    v12 = v11;
    v18 = v12;
    v17 = v10;
    v13 = (void *)MEMORY[0x1D8232094](v15);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v13, 2, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __88__RTLearnedLocationStore__expireLifetimeOfVisitsWithIdentifiers_expirationDate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void (*v16)(void);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v24 = 0;
  objc_msgSend(v4, "_unionSetOfVisitIdentifiersOverlappingVisitIdentifiers:allowThresholdBypass:context:error:", v5, 1, v3, &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v24;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v19;
      v27 = 2112;
      v28 = (uint64_t)v7;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, encountered error fetching visits to expire them, error, %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "count");
      objc_msgSend(*(id *)(a1 + 48), "stringFromDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v26 = v10;
      v27 = 2048;
      v28 = v11;
      v29 = 2112;
      v30 = v12;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, expiring %lu visits with expiration date %@, identifiers, %@", buf, 0x2Au);

    }
    v22 = 0;
    v23 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_updateExpirationDateOfVisitsAndTransitionsWithVisitIdentifiers:expirationDate:context:visitsUpdated:error:", v6, *(_QWORD *)(a1 + 48), v3, &v23, &v22);
    v13 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v20;
        v27 = 2112;
        v28 = (uint64_t)v13;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of visits, error, %@", buf, 0x16u);

      }
      v16 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v17;
        v27 = 2048;
        v28 = v23;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, updated expiration date of %lu visits", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "mirroringManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __88__RTLearnedLocationStore__expireLifetimeOfVisitsWithIdentifiers_expirationDate_handler___block_invoke_66;
      v21[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v21[4] = *(_QWORD *)(a1 + 64);
      objc_msgSend(v18, "performExportWithHandler:", v21);

      v16 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    v16();

  }
}

void __88__RTLearnedLocationStore__expireLifetimeOfVisitsWithIdentifiers_expirationDate_handler___block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, successfully finished export with error, %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)extendExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5
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
  v15[2] = __93__RTLearnedLocationStore_extendExpirationDateOfVisitsWithIdentifiers_expirationDate_handler___block_invoke;
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

uint64_t __93__RTLearnedLocationStore_extendExpirationDateOfVisitsWithIdentifiers_expirationDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_extendExpirationDateOfVisitsWithIdentifiers:expirationDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_extendExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  RTLearnedLocationStore *v19;
  id v20;
  SEL v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __94__RTLearnedLocationStore__extendExpirationDateOfVisitsWithIdentifiers_expirationDate_handler___block_invoke;
  v16[3] = &unk_1E929D938;
  v20 = v11;
  v21 = a2;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  v15 = (void *)MEMORY[0x1D8232094](v16);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v15, 2, v12);

}

void __94__RTLearnedLocationStore__extendExpirationDateOfVisitsWithIdentifiers_expirationDate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 40), "stringFromDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138413058;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, extending %lu visits with expiration date %@, identifiers, %@", (uint8_t *)&v9, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 48), "submitMetricsOnExtendingLifetimeOfObjectsWithIdentifiers:context:", *(_QWORD *)(a1 + 32), v3);
  objc_msgSend(*(id *)(a1 + 48), "_moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:expirationDate:allowThresholdBypass:context:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, v3, *(_QWORD *)(a1 + 56));

}

- (void)updateExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5
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
  v15[2] = __93__RTLearnedLocationStore_updateExpirationDateOfVisitsWithIdentifiers_expirationDate_handler___block_invoke;
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

uint64_t __93__RTLearnedLocationStore_updateExpirationDateOfVisitsWithIdentifiers_expirationDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateExpirationDateOfVisitsWithIdentifiers:expirationDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_updateExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5
{
  -[RTLearnedLocationStore _updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:expirationDate:allowThresholdBypass:handler:](self, "_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:expirationDate:allowThresholdBypass:handler:", a3, a4, 0, a5);
}

- (void)updateExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 allowThresholdBypass:(BOOL)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __114__RTLearnedLocationStore_updateExpirationDateOfVisitsWithIdentifiers_expirationDate_allowThresholdBypass_handler___block_invoke;
  v16[3] = &unk_1E9297EB8;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

uint64_t __114__RTLearnedLocationStore_updateExpirationDateOfVisitsWithIdentifiers_expirationDate_allowThresholdBypass_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:expirationDate:allowThresholdBypass:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 56));
}

- (void)_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:(id)a3 expirationDate:(id)a4 allowThresholdBypass:(BOOL)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v12)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __127__RTLearnedLocationStore__updateExpirationDateOfVisitSubgraphWithVisitIdentifiers_expirationDate_allowThresholdBypass_handler___block_invoke;
    v16[3] = &unk_1E929DA00;
    v16[4] = self;
    v17 = v10;
    v18 = v11;
    v20 = a5;
    v13 = v12;
    v19 = v13;
    v14 = (void *)MEMORY[0x1D8232094](v16);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v14, 2, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

uint64_t __127__RTLearnedLocationStore__updateExpirationDateOfVisitSubgraphWithVisitIdentifiers_expirationDate_allowThresholdBypass_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:expirationDate:allowThresholdBypass:context:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), a2, *(_QWORD *)(a1 + 56));
}

- (void)_moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:(id)a3 expirationDate:(id)a4 allowThresholdBypass:(BOOL)a5 context:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  NSObject *v17;
  void *v18;
  const __CFString **v19;
  uint64_t *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  void (**v26)(id, _QWORD);
  SEL v27;
  BOOL v28;
  uint8_t buf[8];
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = (void (**)(id, _QWORD))a7;
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_12;
  }
  if (!objc_msgSend(v13, "count"))
  {
    v16[2](v16, 0);
    goto LABEL_13;
  }
  if (!v14)
  {
    v32 = *MEMORY[0x1E0CB2D50];
    v33[0] = CFSTR("expirationDate is a required parameter.");
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = (const __CFString **)v33;
    v20 = &v32;
LABEL_11:
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v16)[2](v16, v21);

LABEL_12:
    goto LABEL_13;
  }
  if (!v15)
  {
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("expirationDate is a required parameter.");
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = &v31;
    v20 = &v30;
    goto LABEL_11;
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __139__RTLearnedLocationStore__moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers_expirationDate_allowThresholdBypass_context_handler___block_invoke;
  v22[3] = &unk_1E929DA28;
  v22[4] = self;
  v23 = v13;
  v28 = a5;
  v24 = v15;
  v27 = a2;
  v26 = v16;
  v25 = v14;
  objc_msgSend(v24, "performBlock:", v22);

LABEL_13:
}

void __139__RTLearnedLocationStore__moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers_expirationDate_allowThresholdBypass_context_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void (*v9)(void);
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void (*v17)(void);
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void (*v25)(void);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 80);
  v35 = 0;
  objc_msgSend(v2, "_unionSetOfVisitIdentifiersOverlappingVisitIdentifiers:allowThresholdBypass:context:error:", v3, v5, v4, &v35);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v35;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v26;
      v38 = 2112;
      v39 = (uint64_t)v7;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@, encountered error fetching visits, error, %@", buf, 0x16u);

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_5;
  }
  if (objc_msgSend(v6, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "count");
      objc_msgSend(*(id *)(a1 + 56), "stringFromDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v37 = v11;
      v38 = 2048;
      v39 = v12;
      v40 = 2112;
      v41 = v13;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, updating %lu visits and placesw with expiration date, %@, identifiers, %@", buf, 0x2Au);

    }
    v33 = 0;
    v34 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_updateExpirationDateOfVisitsAndTransitionsWithVisitIdentifiers:expirationDate:context:visitsUpdated:error:", v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), &v34, &v33);
    v14 = v33;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 72));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v37 = v29;
        v38 = 2112;
        v39 = (uint64_t)v14;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of visits, error, %@", buf, 0x16u);

      }
      v17 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 72));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v37 = v18;
        v38 = 2048;
        v39 = v34;
        _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@, updated expiration date of %lu visits and transitions", buf, 0x16u);

      }
      if (v34)
      {
        v19 = *(void **)(a1 + 32);
        v21 = *(_QWORD *)(a1 + 48);
        v20 = *(_QWORD *)(a1 + 56);
        v32 = 0;
        objc_msgSend(v19, "_updateExpirationDateOfPlaceSubgraphWithVisitIdentifiers:expirationDate:context:error:", v6, v20, v21, &v32);
        v22 = v32;
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 72));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v37 = v30;
            v38 = 2112;
            v39 = (uint64_t)v22;
            _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of place subgraph, error, %@", buf, 0x16u);

          }
          v25 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
        }
        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(*(SEL *)(a1 + 72));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v37 = v27;
            _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, successfully updated expiration date of place subgraph", buf, 0xCu);

          }
          objc_msgSend(*(id *)(a1 + 32), "mirroringManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __139__RTLearnedLocationStore__moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers_expirationDate_allowThresholdBypass_context_handler___block_invoke_70;
          v31[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
          v31[4] = *(_QWORD *)(a1 + 72);
          objc_msgSend(v28, "performExportWithHandler:", v31);

          v25 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
        }
        v25();

        goto LABEL_27;
      }
      v17 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    v17();
LABEL_27:

    goto LABEL_28;
  }
  v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_5:
  v9();
LABEL_28:

}

void __139__RTLearnedLocationStore__moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers_expirationDate_allowThresholdBypass_context_handler___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, successfully finished export with error, %@", (uint8_t *)&v6, 0x16u);

  }
}

- (BOOL)_updateExpirationDateOfPlaceSubgraphWithVisitIdentifiers:(id)a3 expirationDate:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t *v24;
  SEL v25;
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6)
  {
    if (objc_msgSend(v10, "count"))
    {
      if (v11)
      {
        if (v12)
        {
          *(_QWORD *)buf = 0;
          v27 = buf;
          v28 = 0x3032000000;
          v29 = __Block_byref_object_copy__69;
          v30 = __Block_byref_object_dispose__69;
          v31 = 0;
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __112__RTLearnedLocationStore__updateExpirationDateOfPlaceSubgraphWithVisitIdentifiers_expirationDate_context_error___block_invoke;
          v20[3] = &unk_1E929DA50;
          v21 = v10;
          v22 = v11;
          v24 = buf;
          v25 = a2;
          v23 = v12;
          objc_msgSend(v23, "performBlockAndWait:", v20);
          *a6 = objc_retainAutorelease(*((id *)v27 + 5));
          v13 = *((_QWORD *)v27 + 5) == 0;

          _Block_object_dispose(buf, 8);
          goto LABEL_19;
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
        }

        v16 = CFSTR("context");
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate", buf, 2u);
        }

        v16 = CFSTR("expirationDate");
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifiers.count > 0", buf, 2u);
      }

      v16 = CFSTR("visitIdentifiers.count > 0");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v16);
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v13 = 0;
LABEL_19:

  return v13;
}

void __112__RTLearnedLocationStore__updateExpirationDateOfPlaceSubgraphWithVisitIdentifiers_expirationDate_context_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  NSObject *v83;
  NSObject *v84;
  uint64_t v85;
  void *v86;
  id v87;
  NSObject *v88;
  NSObject *v89;
  NSObject *v90;
  void *v91;
  NSObject *v92;
  NSObject *v93;
  NSObject *log;
  os_log_t loga;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  id v114;
  id v115;
  id v116;
  id v117;
  const __CFString *v118;
  void *v119;
  _BYTE v120[128];
  const __CFString *v121;
  const __CFString *v122;
  const __CFString *v123;
  void *v124;
  const __CFString *v125;
  void *v126;
  uint8_t buf[4];
  os_log_t v128;
  __int16 v129;
  uint64_t v130;
  const __CFString *v131;
  _QWORD v132[4];

  v132[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C97AB0]);
  +[RTLearnedPlaceMO entity](RTLearnedPlaceMO, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEntity:", v3);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $v, $v.%K IN %@).@count > 0"), CFSTR("visits"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v131 = CFSTR("expirationDate");
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v132[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, &v131, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToUpdate:", v7);

  objc_msgSend(v4, "setResultType:", 1);
  v8 = *(void **)(a1 + 48);
  v117 = 0;
  objc_msgSend(v8, "executeRequest:error:", v4, &v117);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v117;
  if (v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v68 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v128 = v68;
      v129 = 2112;
      v130 = (uint64_t)v10;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of places, error, %@", buf, 0x16u);

    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = v10;
    v14 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
  }
  else
  {
    objc_msgSend(v9, "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 138412546;
      v128 = v16;
      v129 = 2048;
      v130 = v17;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, updated expiration date of %lu places", buf, 0x16u);

    }
    v18 = objc_alloc(MEMORY[0x1E0C97AB0]);
    +[RTMapItemMO entity](RTMapItemMO, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithEntity:", v19);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in (%@)"), CFSTR("place"), v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPredicate:", v21);

    v125 = CFSTR("expirationDate");
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", *(_QWORD *)(a1 + 40));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPropertiesToUpdate:", v23);

    objc_msgSend(v20, "setResultType:", 1);
    v24 = *(void **)(a1 + 48);
    v116 = 0;
    objc_msgSend(v24, "executeRequest:error:", v20, &v116);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v116;
    if (v108)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v108;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v89 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v128 = v89;
        v129 = 2112;
        v130 = (uint64_t)v108;
        _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of map items, error, %@", buf, 0x16u);

      }
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v29 = v108;
      v30 = *(void **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = v29;
    }
    else
    {
      v107 = v25;
      objc_msgSend(v25, "result");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v31, "count");
        *(_DWORD *)buf = 138412546;
        v128 = v33;
        v129 = 2048;
        v130 = v34;
        _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%@, updated expiration date of %lu map items", buf, 0x16u);

      }
      v35 = objc_alloc(MEMORY[0x1E0C97AB0]);
      +[RTAddressMO entity](RTAddressMO, "entity");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v35, "initWithEntity:", v36);

      v106 = v31;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in (%@)"), CFSTR("mapItem"), v31);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setPredicate:", v38);

      v123 = CFSTR("expirationDate");
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", *(_QWORD *)(a1 + 40));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setPropertiesToUpdate:", v40);

      objc_msgSend(v37, "setResultType:", 2);
      v41 = *(void **)(a1 + 48);
      v115 = 0;
      v105 = v37;
      objc_msgSend(v41, "executeRequest:error:", v37, &v115);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v115;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v43)
      {
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 64));
          v92 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v128 = v92;
          v129 = 2112;
          v130 = (uint64_t)v43;
          _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of address items, error, %@", buf, 0x16u);

        }
        v46 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v47 = v43;
        v48 = *(void **)(v46 + 40);
        *(_QWORD *)(v46 + 40) = v47;
        v49 = v43;
        v27 = 0;
      }
      else
      {
        v104 = v20;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(*(SEL *)(a1 + 64));
          v50 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "result");
          v51 = v14;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v128 = v50;
          v129 = 2112;
          v130 = (uint64_t)v52;
          _os_log_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_INFO, "%@, updated expiration date of %@ address items", buf, 0x16u);

          v14 = v51;
        }
        v103 = v42;

        v53 = objc_alloc(MEMORY[0x1E0C97B48]);
        +[NSManagedObject entityName](RTLearnedPlaceMO, "entityName");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)objc_msgSend(v53, "initWithEntityName:", v54);

        v122 = CFSTR("device");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setPropertiesToFetch:", v56);

        v121 = CFSTR("device");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setPropertiesToGroupBy:", v57);

        objc_msgSend(v55, "setResultType:", 2);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN (%@)"), v14);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setPredicate:", v58);

        v59 = *(void **)(a1 + 48);
        v114 = 0;
        v102 = v55;
        objc_msgSend(v59, "executeFetchRequest:error:", v55, &v114);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v114;
        v101 = v60;
        if (v61)
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
          v62 = objc_claimAutoreleasedReturnValue();
          v20 = v104;
          v27 = 0;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 64));
            v93 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v128 = v93;
            v129 = 2112;
            v130 = (uint64_t)v61;
            _os_log_error_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_ERROR, "%@, encountered error fetching devices, error, %@", buf, 0x16u);

          }
          v63 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v64 = v61;
          v65 = *(void **)(v63 + 40);
          *(_QWORD *)(v63 + 40) = v64;
          v66 = v61;
          v42 = v103;
          v67 = v101;
        }
        else
        {
          v97 = v14;
          v98 = v9;
          v65 = (void *)objc_opt_new();
          v110 = 0u;
          v111 = 0u;
          v112 = 0u;
          v113 = 0u;
          v69 = v60;
          v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
          if (v70)
          {
            v71 = v70;
            v72 = *(_QWORD *)v111;
            do
            {
              for (i = 0; i != v71; ++i)
              {
                if (*(_QWORD *)v111 != v72)
                  objc_enumerationMutation(v69);
                objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * i), "objectForKey:", CFSTR("device"));
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                if (v74)
                  objc_msgSend(v65, "addObject:", v74);

              }
              v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
            }
            while (v71);
          }

          v75 = objc_alloc(MEMORY[0x1E0C97AB0]);
          +[RTDeviceMO entity](RTDeviceMO, "entity");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = (void *)objc_msgSend(v75, "initWithEntity:", v76);

          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN (%@)"), v65);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setPredicate:", v78);

          v118 = CFSTR("expirationDate");
          objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", *(_QWORD *)(a1 + 40));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = v79;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setPropertiesToUpdate:", v80);

          objc_msgSend(v77, "setResultType:", 2);
          v81 = *(void **)(a1 + 48);
          v109 = 0;
          v96 = v77;
          objc_msgSend(v81, "executeRequest:error:", v77, &v109);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v109;
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
          v83 = objc_claimAutoreleasedReturnValue();
          v27 = 0;
          v99 = v82;
          if (v82)
          {
            v84 = v83;
            v14 = v97;
            v9 = v98;
            v42 = v103;
            v20 = v104;
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(*(SEL *)(a1 + 64));
              loga = (os_log_t)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v128 = loga;
              v129 = 2112;
              v130 = (uint64_t)v99;
              _os_log_error_impl(&dword_1D1A22000, v84, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of devices, error, %@", buf, 0x16u);

            }
            v85 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v86 = v99;
            v87 = v99;
            v88 = *(NSObject **)(v85 + 40);
            *(_QWORD *)(v85 + 40) = v87;
            v67 = v101;
          }
          else
          {
            log = v83;
            v14 = v97;
            v9 = v98;
            v42 = v103;
            v20 = v104;
            if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(*(SEL *)(a1 + 64));
              v90 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "result");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v128 = v90;
              v129 = 2112;
              v130 = (uint64_t)v91;
              _os_log_impl(&dword_1D1A22000, log, OS_LOG_TYPE_INFO, "%@, updated expiration date of %@ devices", buf, 0x16u);

            }
            v67 = v101;
            v86 = 0;
            v88 = log;
          }

          v66 = 0;
        }

        v48 = v102;
        v49 = 0;
      }

      v30 = v106;
      v25 = v107;
    }

  }
}

- (BOOL)_updateExpirationDateOfVisitsAndTransitionsWithVisitIdentifiers:(id)a3 expirationDate:(id)a4 context:(id)a5 visitsUpdated:(unint64_t *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint8_t *v26;
  SEL v27;
  unint64_t *v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (a7)
  {
    if (objc_msgSend(v12, "count"))
    {
      if (v13)
      {
        if (v14)
        {
          *(_QWORD *)buf = 0;
          v30 = buf;
          v31 = 0x3032000000;
          v32 = __Block_byref_object_copy__69;
          v33 = __Block_byref_object_dispose__69;
          v34 = 0;
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __133__RTLearnedLocationStore__updateExpirationDateOfVisitsAndTransitionsWithVisitIdentifiers_expirationDate_context_visitsUpdated_error___block_invoke;
          v22[3] = &unk_1E929DA78;
          v23 = v12;
          v24 = v13;
          v25 = v14;
          v26 = buf;
          v27 = a2;
          v28 = a6;
          objc_msgSend(v25, "performBlockAndWait:", v22);
          *a7 = objc_retainAutorelease(*((id *)v30 + 5));
          v15 = *((_QWORD *)v30 + 5) == 0;

          _Block_object_dispose(buf, 8);
          goto LABEL_19;
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
        }

        v18 = CFSTR("context");
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate", buf, 2u);
        }

        v18 = CFSTR("expirationDate");
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifiers.count > 0", buf, 2u);
      }

      v18 = CFSTR("visitIdentifiers.count > 0");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v18);
    v15 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v15 = 0;
LABEL_19:

  return v15;
}

void __133__RTLearnedLocationStore__updateExpirationDateOfVisitsAndTransitionsWithVisitIdentifiers_expirationDate_context_visitsUpdated_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  const __CFString *v53;
  void *v54;
  _QWORD v55[2];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  const __CFString *v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C97AB0]);
  +[RTLearnedVisitMO entity](RTLearnedVisitMO, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEntity:", v3);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN (%@)"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v60 = CFSTR("expirationDate");
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToUpdate:", v7);

  objc_msgSend(v4, "setResultType:", 2);
  v8 = *(void **)(a1 + 48);
  v52 = 0;
  objc_msgSend(v8, "executeRequest:error:", v4, &v52);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v52;
  if (v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v57 = v43;
      v58 = 2112;
      v59 = (uint64_t)v10;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of visits, error, %@", buf, 0x16u);

    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = v10;
    v14 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
LABEL_22:

    goto LABEL_23;
  }
  if (*(_QWORD *)(a1 + 72))
  {
    objc_msgSend(v9, "result");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    **(_QWORD **)(a1 + 72) = objc_msgSend(v15, "unsignedIntegerValue");

  }
  objc_msgSend(v9, "result");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  if (v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "result");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v57 = v19;
      v58 = 2112;
      v59 = (uint64_t)v20;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, updated expiration date of %@ visits", buf, 0x16u);

    }
    +[RTLearnedTransitionMO fetchRequest](RTLearnedTransitionMO, "fetchRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K IN (%@)"), CFSTR("origin"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v22;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K IN (%@)"), CFSTR("destination"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "orPredicateWithSubpredicates:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v25);

    objc_msgSend(v14, "setResultType:", 1);
    v26 = *(void **)(a1 + 48);
    v51 = 0;
    objc_msgSend(v26, "executeFetchRequest:error:", v14, &v51);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v51;
    if (v28)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v57 = v46;
        v58 = 2112;
        v59 = (uint64_t)v28;
        _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@, encountered error fetching transitions to update expiration date, error, %@", buf, 0x16u);

      }
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v31 = v28;
      v32 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = v31;
    }
    else
    {
      v33 = objc_alloc(MEMORY[0x1E0C97AB0]);
      +[RTLearnedTransitionMO entity](RTLearnedTransitionMO, "entity");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v33, "initWithEntity:", v34);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN (%@)"), v27);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setPredicate:", v35);

      v53 = CFSTR("expirationDate");
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", *(_QWORD *)(a1 + 40));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setPropertiesToUpdate:", v37);

      objc_msgSend(v32, "setResultType:", 2);
      v38 = *(void **)(a1 + 48);
      v50 = 0;
      objc_msgSend(v38, "executeRequest:error:", v32, &v50);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v50;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v39)
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 64));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v57 = v48;
          v58 = 2112;
          v59 = (uint64_t)v39;
          _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of transitions, error, %@", buf, 0x16u);

        }
        v42 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v41 = *(NSObject **)(v42 + 40);
        *(_QWORD *)(v42 + 40) = 0;
      }
      else if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "result");
        v44 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v57 = v47;
        v58 = 2112;
        v59 = v44;
        v45 = (void *)v44;
        _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_INFO, "%@, updated expiration date of %@ transitions", buf, 0x16u);

      }
    }

    goto LABEL_22;
  }
LABEL_23:

}

- (id)_unionSetOfVisitIdentifiersOverlappingVisitIdentifiers:(id)a3 allowThresholdBypass:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  RTLearnedLocationStore *v22;
  uint64_t *v23;
  uint8_t *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v11 = a5;
  if (a6)
  {
    if (objc_msgSend(v10, "count"))
    {
      if (v11)
      {
        *(_QWORD *)buf = 0;
        v33 = buf;
        v34 = 0x3032000000;
        v35 = __Block_byref_object_copy__69;
        v36 = __Block_byref_object_dispose__69;
        v37 = 0;
        v26 = 0;
        v27 = &v26;
        v28 = 0x3032000000;
        v29 = __Block_byref_object_copy__69;
        v30 = __Block_byref_object_dispose__69;
        v31 = 0;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __116__RTLearnedLocationStore__unionSetOfVisitIdentifiersOverlappingVisitIdentifiers_allowThresholdBypass_context_error___block_invoke;
        v19[3] = &unk_1E929DB20;
        v20 = v10;
        v21 = v11;
        v22 = self;
        v25 = a4;
        v23 = &v26;
        v24 = buf;
        objc_msgSend(v21, "performBlockAndWait:", v19);
        *a6 = objc_retainAutorelease((id)v27[5]);
        if (v27[5])
          v12 = 0;
        else
          v12 = (void *)*((_QWORD *)v33 + 5);
        v14 = v12;

        _Block_object_dispose(&v26, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_18;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      v16 = CFSTR("context");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifiers.count > 0", buf, 2u);
      }

      v16 = CFSTR("visitIdentifiers.count > 0");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v16);
    v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v14 = 0;
LABEL_18:

  return v14;
}

void __116__RTLearnedLocationStore__unionSetOfVisitIdentifiersOverlappingVisitIdentifiers_allowThresholdBypass_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _RTMap *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  _RTMap *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[16];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  id v69;
  id v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8231EA8]();
  +[RTLearnedLocationOfInterestVisitMO fetchRequest](RTLearnedLocationOfInterestVisitMO, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchBatchSize:", 300);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN (%@)"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  v5 = *(void **)(a1 + 40);
  v70 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v3, &v70);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v70;
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = v7;
    v11 = 0;
    v12 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }
  else
  {
    v13 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v6);
    -[_RTMap withBlock:](v13, "withBlock:", &__block_literal_global_109);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(void **)(a1 + 48);
    +[NSManagedObject entityName](RTLearnedVisitMO, "entityName");
    v15 = a1;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(v15 + 40);
    v69 = 0;
    objc_msgSend(v14, "createFetchRequestForOverlappingVisits:entityName:entryDatePropertyName:exitDatePropertyName:context:error:", v12, v16, CFSTR("entryDate"), CFSTR("exitDate"), v17, &v69);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v69;
    v19 = v69;

    a1 = v15;
    if (v19)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v15 + 56) + 8) + 40), v18);

  }
  objc_autoreleasePoolPop(v2);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v68 = v8;
    objc_msgSend(v11, "execute:", &v68);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v68;

    if (v20)
    {
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v23 = v20;
      v24 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v23;
LABEL_34:

      goto LABEL_35;
    }
    v25 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v21);
    -[_RTMap withBlock:](v25, "withBlock:", &__block_literal_global_116_0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v24, "count"));
    if (*(_BYTE *)(a1 + 72))
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "by-passing visit extension expiration threshold.", buf, 2u);
      }

      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v28 = v24;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
      if (!v29)
        goto LABEL_33;
      v30 = v29;
      v58 = v24;
      v31 = v11;
      v32 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v60 != v32)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v34);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
      }
      while (v30);
      v11 = v31;
    }
    else
    {
      v55 = v21;
      v56 = v11;
      v57 = a1;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v58 = v24;
      v35 = v24;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v65;
        do
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(_QWORD *)v65 != v38)
              objc_enumerationMutation(v35);
            v40 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
            objc_msgSend(v40, "expirationDate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "dateByAddingTimeInterval:", -4838400.0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v40, "expirationDate");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "timeIntervalSinceDate:", v43);
            v45 = v44;

            objc_msgSend(v40, "expirationDate");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "timeIntervalSinceDate:", v42);
            v48 = v47;

            if (fabs(v45 / v48) < 0.6)
            {
              objc_msgSend(v40, "expirationDate");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = objc_msgSend(v28, "isBeforeDate:", v49);

              if (v50)
              {
                objc_msgSend(v40, "identifier");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addObject:", v51);

              }
            }

          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
        }
        while (v37);
      }

      v11 = v56;
      a1 = v57;
      v21 = v55;
      v20 = 0;
    }
    v24 = v58;
LABEL_33:

    v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v26);
    v53 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v54 = *(void **)(v53 + 40);
    *(_QWORD *)(v53 + 40) = v52;

    goto LABEL_34;
  }
  v20 = v8;
LABEL_35:

}

id __116__RTLearnedLocationStore__unionSetOfVisitIdentifiersOverlappingVisitIdentifiers_allowThresholdBypass_context_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", a2);
}

id __116__RTLearnedLocationStore__unionSetOfVisitIdentifiersOverlappingVisitIdentifiers_allowThresholdBypass_context_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", a2);
}

- (void)_updateTransitionWithIdentifier:(id)a3 motionActivityType:(unint64_t)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  RTLearnedLocationStore *v16;
  id v17;
  SEL v18;
  unint64_t v19;

  v9 = a3;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__RTLearnedLocationStore__updateTransitionWithIdentifier_motionActivityType_handler___block_invoke;
  v14[3] = &unk_1E929A3F8;
  v18 = a2;
  v19 = a4;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = (void *)MEMORY[0x1D8232094](v14);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v13, 2, v11);

}

void __85__RTLearnedLocationStore__updateTransitionWithIdentifier_motionActivityType_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  id v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D18400], "motionActivityTypeToString:", *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v50 = v5;
    v51 = 2112;
    v52 = v6;
    v53 = 2112;
    v54 = v7;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, updating transition, %@, motionActivityType, %@", buf, 0x20u);

  }
  v8 = objc_alloc(MEMORY[0x1E0C97AB0]);
  +[RTLearnedTransitionMO entity](RTLearnedTransitionMO, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEntity:", v9);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  v47 = CFSTR("predominantMotionActivityType");
  v12 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "expressionForConstantValue:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToUpdate:", v15);

  objc_msgSend(v10, "setResultType:", 1);
  v44 = 0;
  objc_msgSend(v3, "executeRequest:error:", v10, &v44);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v44;
  objc_msgSend(v16, "result");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v50 = v22;
      v51 = 2112;
      v52 = (uint64_t)v17;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%@, encountered error updating predominant motion type of cloud transition, error, %@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v50 = v23;
    v51 = 2048;
    v52 = v19;
    _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@, updated predominant motion type of %lu cloud transitions", buf, 0x16u);

  }
  v24 = objc_alloc(MEMORY[0x1E0C97AB0]);
  +[RTLearnedLocationOfInterestTransitionMO entity](RTLearnedLocationOfInterestTransitionMO, "entity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithEntity:", v25);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPredicate:", v27);

  v45 = CFSTR("predominantMotionActivityType");
  v28 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "expressionForConstantValue:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPropertiesToUpdate:", v31);

  objc_msgSend(v26, "setResultType:", 1);
  v43 = v17;
  objc_msgSend(v3, "executeRequest:error:", v26, &v43);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v43;

  objc_msgSend(v32, "result");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v33)
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v50 = v38;
      v51 = 2112;
      v52 = (uint64_t)v33;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, encountered error updating predominant motion type of local transition, error, %@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v50 = v39;
    v51 = 2048;
    v52 = v35;
    _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "%@, updated predominant motion type of %lu local transitions", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "mirroringManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __85__RTLearnedLocationStore__updateTransitionWithIdentifier_motionActivityType_handler___block_invoke_124;
  v42[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v42[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v40, "performExportWithHandler:", v42);

  v41 = *(_QWORD *)(a1 + 48);
  if (v41)
    (*(void (**)(uint64_t, id))(v41 + 16))(v41, v33);

}

void __85__RTLearnedLocationStore__updateTransitionWithIdentifier_motionActivityType_handler___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, successfully finished export with error, %@", (uint8_t *)&v6, 0x16u);

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
  v13[2] = __84__RTLearnedLocationStore_updateTransitionWithIdentifier_motionActivityType_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __84__RTLearnedLocationStore_updateTransitionWithIdentifier_motionActivityType_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTransitionWithIdentifier:motionActivityType:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_updateVisits:(id)a3 finerGranularityInferredMapItems:(id)a4 place:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[8];
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __87__RTLearnedLocationStore__updateVisits_finerGranularityInferredMapItems_place_handler___block_invoke;
      v24[3] = &unk_1E929A5D0;
      v25 = v10;
      v26 = v14;
      v27 = v11;
      v28 = v12;
      v16 = v13;
      v29 = v16;
      v17 = v14;
      v18 = (void *)MEMORY[0x1D8232094](v24);
      v22[0] = v15;
      v22[1] = 3221225472;
      v22[2] = __87__RTLearnedLocationStore__updateVisits_finerGranularityInferredMapItems_place_handler___block_invoke_129;
      v22[3] = &unk_1E9297568;
      v23 = v16;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v18, 2, v22);

    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0D18598];
      v31 = *MEMORY[0x1E0CB2D50];
      v32[0] = CFSTR("visits cannot be nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 7, v21);
      v17 = objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, NSObject *))v13 + 2))(v13, v17);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __87__RTLearnedLocationStore__updateVisits_finerGranularityInferredMapItems_place_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _UNKNOWN **v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v25 = a1;
  obj = *(id *)(a1 + 32);
  v23 = v3;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v26)
  {
    v4 = *(_QWORD *)v30;
    v5 = &off_1E9294000;
    v6 = 0x1E0CB3000uLL;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v30 != v4)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v7);
        objc_msgSend(v5[367], "fetchRequest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(v6 + 2176);
        objc_msgSend(v8, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPredicate:", v12);

        v28 = 0;
        objc_msgSend(v3, "executeFetchRequest:error:", v9, &v28);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v28;
        objc_msgSend(v13, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(*(id *)(v25 + 40), "addObject:", v14);
        }
        else
        {
          v16 = *(void **)(v25 + 48);
          objc_msgSend(v8, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v3 = v23;
          v6 = 0x1E0CB3000;
          v19 = (id)objc_msgSend(v5[367], "managedObjectWithVisit:finerGranularityInferredMapItem:place:managedObject:inManagedObjectContext:", v8, v18, *(_QWORD *)(v25 + 56), v15, v23);

        }
        ++v7;
        v5 = &off_1E9294000;
      }
      while (v26 != v7);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v26);
  }

  v27 = 0;
  v20 = objc_msgSend(v3, "save:", &v27);
  v21 = v27;
  if ((v20 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v21;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Failed to save update to visits with error, %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(v25 + 40), "addObject:", v21);
  }
  (*(void (**)(void))(*(_QWORD *)(v25 + 64) + 16))();

}

uint64_t __87__RTLearnedLocationStore__updateVisits_finerGranularityInferredMapItems_place_handler___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateVisits:(id)a3 finerGranularityInferredMapItems:(id)a4 place:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[RTNotifier queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__RTLearnedLocationStore_updateVisits_finerGranularityInferredMapItems_place_handler___block_invoke;
  block[3] = &unk_1E9297F08;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

uint64_t __86__RTLearnedLocationStore_updateVisits_finerGranularityInferredMapItems_place_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisits:finerGranularityInferredMapItems:place:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)fetchDevicesNotFromCurrentDeviceWithHandler:(id)a3
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
  v7[2] = __70__RTLearnedLocationStore_fetchDevicesNotFromCurrentDeviceWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __70__RTLearnedLocationStore_fetchDevicesNotFromCurrentDeviceWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDevicesNotFromCurrentDeviceWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchDevicesNotFromCurrentDeviceWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__RTLearnedLocationStore__fetchDevicesNotFromCurrentDeviceWithHandler___block_invoke;
    v12[3] = &unk_1E9299738;
    v7 = v4;
    v13 = v7;
    v8 = (void *)MEMORY[0x1D8232094](v12);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __71__RTLearnedLocationStore__fetchDevicesNotFromCurrentDeviceWithHandler___block_invoke_133;
    v10[3] = &unk_1E9297568;
    v11 = v7;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v8, 1, v10);

    v9 = v13;
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

void __71__RTLearnedLocationStore__fetchDevicesNotFromCurrentDeviceWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTDeviceMO fetchRequest](RTDeviceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v3, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("identifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v8);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "TransitMetrics, request, %@", buf, 0xCu);
  }

  v29 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v29;
  if (v11)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v22 = a1;
    v23 = v4;
    v24 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v21 = v10;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          +[RTDevice createWithManagedObject:](RTDevice, "createWithManagedObject:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v12, "addObject:", v19);
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v18;
              _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "TransitMetrics, invalid deviceMO object, %@", buf, 0xCu);
            }

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v15);
    }

    (*(void (**)(void))(*(_QWORD *)(v22 + 32) + 16))();
    v4 = v23;
    v3 = v24;
    v11 = 0;
    v10 = v21;
  }

}

void __71__RTLearnedLocationStore__fetchDevicesNotFromCurrentDeviceWithHandler___block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "TransitMetrics, fetch block failed, error, %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchFinerGranularityInferredMapItemForVisit:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SEL v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v9 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __80__RTLearnedLocationStore__fetchFinerGranularityInferredMapItemForVisit_handler___block_invoke;
      v18[3] = &unk_1E9297A08;
      v19 = v7;
      v21 = a2;
      v10 = v8;
      v20 = v10;
      v11 = (void *)MEMORY[0x1D8232094](v18);
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __80__RTLearnedLocationStore__fetchFinerGranularityInferredMapItemForVisit_handler___block_invoke_136;
      v16[3] = &unk_1E9297568;
      v17 = v10;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v16);

      v12 = v19;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = CFSTR("requires a valid visit.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v15);

    }
  }

}

void __80__RTLearnedLocationStore__fetchFinerGranularityInferredMapItemForVisit_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v15 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v15;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 138413058;
    v17 = v13;
    v18 = 2112;
    v19 = v4;
    v20 = 2048;
    v21 = v14;
    v22 = 2112;
    v23 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v9 || !objc_msgSend(v8, "count"))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finerGranularityInferredMapItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __80__RTLearnedLocationStore__fetchFinerGranularityInferredMapItemForVisit_handler___block_invoke_136(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchFinerGranularityInferredMapItemForVisit:(id)a3 handler:(id)a4
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
  block[2] = __79__RTLearnedLocationStore_fetchFinerGranularityInferredMapItemForVisit_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __79__RTLearnedLocationStore_fetchFinerGranularityInferredMapItemForVisit_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchFinerGranularityInferredMapItemForVisit:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchPlacesWithPredicate:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__RTLearnedLocationStore__fetchPlacesWithPredicate_handler___block_invoke;
    v14[3] = &unk_1E9297A08;
    v15 = v7;
    v17 = a2;
    v10 = v8;
    v16 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v14);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __60__RTLearnedLocationStore__fetchPlacesWithPredicate_handler___block_invoke_138;
    v12[3] = &unk_1E9297568;
    v13 = v10;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v12);

  }
}

void __60__RTLearnedLocationStore__fetchPlacesWithPredicate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedPlaceMO fetchRequestSortedByCreation](RTLearnedPlaceMO, "fetchRequestSortedByCreation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 32));
  v23 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v23;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 138413058;
    v26 = v15;
    v27 = 2112;
    v28 = v4;
    v29 = 2048;
    v30 = v16;
    v31 = 2112;
    v32 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v6)
  {
    v8 = 0;
  }
  else
  {
    v17 = a1;
    v18 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          +[RTLearnedPlace createWithManagedObject:](RTLearnedPlace, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v11);
    }

    a1 = v17;
    v3 = v18;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __60__RTLearnedLocationStore__fetchPlacesWithPredicate_handler___block_invoke_138(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPlacesWithHandler:(id)a3
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
  v7[2] = __49__RTLearnedLocationStore_fetchPlacesWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __49__RTLearnedLocationStore_fetchPlacesWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlacesWithPredicate:handler:", 0, *(_QWORD *)(a1 + 40));
}

- (void)fetchPlacesWithPredicate:(id)a3 handler:(id)a4
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
  block[2] = __59__RTLearnedLocationStore_fetchPlacesWithPredicate_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __59__RTLearnedLocationStore_fetchPlacesWithPredicate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlacesWithPredicate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchPlacesWithType:(unint64_t)a3 predicate:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  unint64_t v19;
  SEL v20;

  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65__RTLearnedLocationStore__fetchPlacesWithType_predicate_handler___block_invoke;
    v16[3] = &unk_1E929DB48;
    v19 = a3;
    v17 = v9;
    v20 = a2;
    v12 = v10;
    v18 = v12;
    v13 = (void *)MEMORY[0x1D8232094](v16);
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __65__RTLearnedLocationStore__fetchPlacesWithType_predicate_handler___block_invoke_141;
    v14[3] = &unk_1E9297568;
    v15 = v12;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v13, 1, v14);

  }
}

void __65__RTLearnedLocationStore__fetchPlacesWithType_predicate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedPlaceMO fetchRequestSortedByCreation](RTLearnedPlaceMO, "fetchRequestSortedByCreation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("type"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v5, "addObject:", v8);
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v5, "addObject:");
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v9);

  v29 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v29;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 138413058;
    v32 = v20;
    v33 = 2112;
    v34 = v4;
    v35 = 2048;
    v36 = v21;
    v37 = 2112;
    v38 = v11;
    _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v11)
  {
    v13 = 0;
  }
  else
  {
    v24 = v3;
    v23 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = v10;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          +[RTLearnedPlace createWithManagedObject:](RTLearnedPlace, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v16);
    }

    a1 = v23;
    v3 = v24;
    v10 = v22;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __65__RTLearnedLocationStore__fetchPlacesWithType_predicate_handler___block_invoke_141(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPlacesWithType:(unint64_t)a3 handler:(id)a4
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
  block[2] = __54__RTLearnedLocationStore_fetchPlacesWithType_handler___block_invoke;
  block[3] = &unk_1E9298E88;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __54__RTLearnedLocationStore_fetchPlacesWithType_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlacesWithType:predicate:handler:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
}

- (void)fetchPlacesWithType:(unint64_t)a3 predicate:(id)a4 handler:(id)a5
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

  v8 = a4;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__RTLearnedLocationStore_fetchPlacesWithType_predicate_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __64__RTLearnedLocationStore_fetchPlacesWithType_predicate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlacesWithType:predicate:handler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchPlaceOfVisit:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SEL v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v9 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __53__RTLearnedLocationStore__fetchPlaceOfVisit_handler___block_invoke;
      v18[3] = &unk_1E9297A08;
      v19 = v7;
      v21 = a2;
      v10 = v8;
      v20 = v10;
      v11 = (void *)MEMORY[0x1D8232094](v18);
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __53__RTLearnedLocationStore__fetchPlaceOfVisit_handler___block_invoke_142;
      v16[3] = &unk_1E9297568;
      v17 = v10;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v16);

      v12 = v19;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = CFSTR("requires a valid visit.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v15);

    }
  }

}

void __53__RTLearnedLocationStore__fetchPlaceOfVisit_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v16 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v16;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 138413058;
    v18 = v14;
    v19 = 2112;
    v20 = v4;
    v21 = 2048;
    v22 = v15;
    v23 = 2112;
    v24 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v9 || !objc_msgSend(v8, "count"))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "place");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTLearnedPlace createWithManagedObject:](RTLearnedPlace, "createWithManagedObject:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __53__RTLearnedLocationStore__fetchPlaceOfVisit_handler___block_invoke_142(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPlaceOfVisit:(id)a3 handler:(id)a4
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
  block[2] = __52__RTLearnedLocationStore_fetchPlaceOfVisit_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __52__RTLearnedLocationStore_fetchPlaceOfVisit_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlaceOfVisit:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchStoredMapItemsWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  SEL v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v9)
    {
      v12 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __76__RTLearnedLocationStore__fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke;
      v21[3] = &unk_1E92979A0;
      v22 = v10;
      v23 = v9;
      v25 = a2;
      v13 = v11;
      v24 = v13;
      v14 = (void *)MEMORY[0x1D8232094](v21);
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __76__RTLearnedLocationStore__fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke_160;
      v19[3] = &unk_1E9297568;
      v20 = v13;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v14, 1, v19);

      v15 = v22;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D18598];
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = CFSTR("requires a valid mapItem.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 7, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v18);

    }
  }

}

void __76__RTLearnedLocationStore__fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *contexta;
  void *context;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70[5];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  id v78;
  _BYTE v79[128];
  void *v80;
  _QWORD v81[4];
  _QWORD v82[2];
  _QWORD v83[3];

  v83[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchLimit:", 5);
  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 32));
  v61 = v4;
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v5, "addObject:");
  v60 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v58 = (void *)v13;
  objc_msgSend(v7, "addObject:", v13);
  if (objc_msgSend(*(id *)(a1 + 40), "validMUID"))
  {
    v14 = (void *)MEMORY[0x1E0CB3528];
    v15 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "muid"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("muid"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v17;
    v18 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "resultProviderID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("resultProviderID"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v22);
  }
  memset(&v70[1], 0, 32);
  objc_msgSend(*(id *)(a1 + 40), "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "latitude");
  objc_msgSend(*(id *)(a1 + 40), "location");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "longitude");
  RTCommonCalculateBoundingBox();

  v57 = (void *)MEMORY[0x1E0CB3528];
  v25 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v7;
  objc_msgSend(v25, "predicateWithFormat:", CFSTR("%@ <= %K"), v64, CFSTR("longitude"));
  contexta = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = contexta;
  v26 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("longitude"), v55);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v27;
  v28 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "predicateWithFormat:", CFSTR("%@ <= %K"), v29, CFSTR("latitude"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = v30;
  v31 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("latitude"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v81[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "andPredicateWithSubpredicates:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v59, "addObject:", v35);
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v59);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:");
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v60);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v61;
  objc_msgSend(v61, "setPredicate:", v36);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setSortDescriptors:", v39);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  do
  {
    context = (void *)MEMORY[0x1D8231EA8]();
    v70[0] = 0;
    v42 = v3;
    objc_msgSend(v3, "executeFetchRequest:error:", v37, v70);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v70[0];

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v41 = v43;
    v44 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v67 != v46)
            objc_enumerationMutation(v41);
          v48 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
          v49 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0D183E8], "createWithManagedObject:", v48);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if (v50 && objc_msgSend(v50, "isEqualToMapItem:", *(_QWORD *)(a1 + 40)))
            objc_msgSend(v40, "addObject:", v51);

          objc_autoreleasePoolPop(v49);
        }
        v45 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
      }
      while (v45);
    }

    v37 = v61;
    objc_msgSend(v61, "setFetchOffset:", objc_msgSend(v61, "fetchOffset") + objc_msgSend(v41, "count"));
    v3 = v42;
    objc_msgSend(v42, "reset");
    objc_autoreleasePoolPop(context);
  }
  while (objc_msgSend(v41, "count") && !v65);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v61, "fetchOffset");
    *(_DWORD *)buf = 138413058;
    v72 = v53;
    v73 = 2112;
    v74 = v61;
    v75 = 2048;
    v76 = v54;
    v77 = 2112;
    v78 = v65;
    _os_log_debug_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __76__RTLearnedLocationStore__fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke_160(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchStoredMapItemsWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5
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
  v15[2] = __75__RTLearnedLocationStore_fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke;
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

void __75__RTLearnedLocationStore_fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__RTLearnedLocationStore_fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke_2;
  v4[3] = &unk_1E9299760;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "_fetchStoredMapItemsWithMapItem:predicate:handler:", v2, v3, v4);

}

uint64_t __75__RTLearnedLocationStore_fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchPlacesWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  SEL v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v9)
    {
      v12 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __68__RTLearnedLocationStore__fetchPlacesWithMapItem_predicate_handler___block_invoke;
      v21[3] = &unk_1E92979A0;
      v22 = v10;
      v23 = v9;
      v25 = a2;
      v13 = v11;
      v24 = v13;
      v14 = (void *)MEMORY[0x1D8232094](v21);
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __68__RTLearnedLocationStore__fetchPlacesWithMapItem_predicate_handler___block_invoke_168;
      v19[3] = &unk_1E9297568;
      v20 = v13;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v14, 1, v19);

      v15 = v22;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D18598];
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = CFSTR("requires a valid mapItem.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 7, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v18);

    }
  }

}

void __68__RTLearnedLocationStore__fetchPlacesWithMapItem_predicate_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *contexta;
  void *context;
  void *v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68[5];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  id v76;
  _BYTE v77[128];
  void *v78;
  _QWORD v79[4];
  _QWORD v80[2];
  _QWORD v81[3];

  v81[1] = *MEMORY[0x1E0C80C00];
  v63 = a2;
  +[RTLearnedPlaceMO fetchRequestSortedByCreation](RTLearnedPlaceMO, "fetchRequestSortedByCreation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchLimit:", 5);
  objc_msgSend(v3, "setPredicate:", *(_QWORD *)(a1 + 32));
  v58 = v3;
  objc_msgSend(v3, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v4, "addObject:");
  v57 = v5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K.%K = %@"), CFSTR("mapItem"), CFSTR("identifier"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v12);
  if (objc_msgSend(*(id *)(a1 + 40), "validMUID"))
  {
    v13 = (void *)MEMORY[0x1E0CB3528];
    v14 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "muid"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predicateWithFormat:", CFSTR("%K.%K = %@"), CFSTR("mapItem"), CFSTR("muid"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v16;
    v17 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "resultProviderID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predicateWithFormat:", CFSTR("%K.%K = %@"), CFSTR("mapItem"), CFSTR("resultProviderID"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v21);
  }
  memset(&v68[1], 0, 32);
  objc_msgSend(*(id *)(a1 + 40), "location");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "latitude");
  objc_msgSend(*(id *)(a1 + 40), "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "longitude");
  RTCommonCalculateBoundingBox();

  v55 = (void *)MEMORY[0x1E0CB3528];
  v24 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v6;
  objc_msgSend(v24, "predicateWithFormat:", CFSTR("%@ <= %K.%K"), v61, CFSTR("mapItem"), CFSTR("longitude"));
  contexta = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = contexta;
  v25 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "predicateWithFormat:", CFSTR("%K.%K <= %@"), CFSTR("mapItem"), CFSTR("longitude"), v53);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v26;
  v27 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "predicateWithFormat:", CFSTR("%@ <= %K.%K"), v28, CFSTR("mapItem"), CFSTR("latitude"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v79[2] = v29;
  v30 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "predicateWithFormat:", CFSTR("%K.%K <= %@"), CFSTR("mapItem"), CFSTR("latitude"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v79[3] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "andPredicateWithSubpredicates:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v56, "addObject:", v34);
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v56);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addObject:");
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v57);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v58;
  objc_msgSend(v58, "setPredicate:", v35);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setSortDescriptors:", v38);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  do
  {
    context = (void *)MEMORY[0x1D8231EA8]();
    v68[0] = 0;
    objc_msgSend(v63, "executeFetchRequest:error:", v36, v68);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v68[0];

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v40 = v41;
    v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v65 != v44)
            objc_enumerationMutation(v40);
          v46 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D183E8], "createWithManagedObject:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v47 && objc_msgSend(v47, "isEqualToMapItem:", *(_QWORD *)(a1 + 40)))
          {
            +[RTLearnedPlace createWithManagedObject:](RTLearnedPlace, "createWithManagedObject:", v46);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)
              objc_msgSend(v39, "addObject:", v49);

          }
        }
        v43 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
      }
      while (v43);
    }

    v36 = v58;
    objc_msgSend(v58, "setFetchOffset:", objc_msgSend(v58, "fetchOffset") + objc_msgSend(v40, "count"));
    objc_msgSend(v63, "reset");
    objc_autoreleasePoolPop(context);
  }
  while (objc_msgSend(v40, "count") && !v62);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v58, "fetchOffset");
    *(_DWORD *)buf = 138413058;
    v70 = v51;
    v71 = 2112;
    v72 = v58;
    v73 = 2048;
    v74 = v52;
    v75 = 2112;
    v76 = v62;
    _os_log_debug_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __68__RTLearnedLocationStore__fetchPlacesWithMapItem_predicate_handler___block_invoke_168(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPlaceWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5
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
  v15[2] = __66__RTLearnedLocationStore_fetchPlaceWithMapItem_predicate_handler___block_invoke;
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

void __66__RTLearnedLocationStore_fetchPlaceWithMapItem_predicate_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__RTLearnedLocationStore_fetchPlaceWithMapItem_predicate_handler___block_invoke_2;
  v4[3] = &unk_1E9299760;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "_fetchPlacesWithMapItem:predicate:handler:", v2, v3, v4);

}

void __66__RTLearnedLocationStore_fetchPlaceWithMapItem_predicate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

}

- (void)fetchPlacesWithMapItem:(id)a3 handler:(id)a4
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
  block[2] = __57__RTLearnedLocationStore_fetchPlacesWithMapItem_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __57__RTLearnedLocationStore_fetchPlacesWithMapItem_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlacesWithMapItem:predicate:handler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void)fetchPlacesWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5
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
  v15[2] = __67__RTLearnedLocationStore_fetchPlacesWithMapItem_predicate_handler___block_invoke;
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

uint64_t __67__RTLearnedLocationStore_fetchPlacesWithMapItem_predicate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlacesWithMapItem:predicate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __80__RTLearnedLocationStore__fetchPlacesWithinDistance_location_predicate_handler___block_invoke_172(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPlacesWithinDistance:(double)a3 location:(id)a4 predicate:(id)a5 handler:(id)a6
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
  double v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__RTLearnedLocationStore_fetchPlacesWithinDistance_location_predicate_handler___block_invoke;
  block[3] = &unk_1E9297910;
  v21 = a3;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

uint64_t __79__RTLearnedLocationStore_fetchPlacesWithinDistance_location_predicate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlacesWithinDistance:location:predicate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_fetchPlaceWithMapItemIdentifier:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SEL v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v9 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __67__RTLearnedLocationStore__fetchPlaceWithMapItemIdentifier_handler___block_invoke;
      v18[3] = &unk_1E9297A08;
      v19 = v7;
      v21 = a2;
      v10 = v8;
      v20 = v10;
      v11 = (void *)MEMORY[0x1D8232094](v18);
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __67__RTLearnedLocationStore__fetchPlaceWithMapItemIdentifier_handler___block_invoke_177;
      v16[3] = &unk_1E9297568;
      v17 = v10;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v16);

      v12 = v19;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = CFSTR("requires a valid mapItem identifier.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 7, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v15);

    }
  }

}

void __67__RTLearnedLocationStore__fetchPlaceWithMapItemIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K == %@"), CFSTR("mapItem"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v13 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v13;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138413058;
    v15 = v11;
    v16 = 2112;
    v17 = v4;
    v18 = 2048;
    v19 = v12;
    v20 = 2112;
    v21 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v7 || !objc_msgSend(v6, "count"))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTLearnedPlace createWithManagedObject:](RTLearnedPlace, "createWithManagedObject:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __67__RTLearnedLocationStore__fetchPlaceWithMapItemIdentifier_handler___block_invoke_177(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPlaceWithMapItemIdentifier:(id)a3 handler:(id)a4
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
  block[2] = __66__RTLearnedLocationStore_fetchPlaceWithMapItemIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __66__RTLearnedLocationStore_fetchPlaceWithMapItemIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlaceWithMapItemIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchVisitWithIdentifier:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD, _QWORD, _QWORD);
  _QWORD v18[4];
  NSObject *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  SEL v21;
  uint64_t v22;
  const __CFString *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
    {
      v10 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __60__RTLearnedLocationStore__fetchVisitWithIdentifier_handler___block_invoke;
      v18[3] = &unk_1E9297A08;
      v19 = v7;
      v21 = a2;
      v20 = v9;
      v16[0] = v10;
      v16[1] = 3221225472;
      v16[2] = __60__RTLearnedLocationStore__fetchVisitWithIdentifier_handler___block_invoke_180;
      v16[3] = &unk_1E9297568;
      v17 = v20;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v18, 1, v16);

      v11 = v19;
      goto LABEL_10;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTLearnedLocationStore _fetchVisitWithIdentifier:handler:]";
      v26 = 1024;
      v27 = 2281;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v22 = *MEMORY[0x1E0CB2D50];
      v23 = CFSTR("identifier is required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 7, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v15);

      goto LABEL_10;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[RTLearnedLocationStore _fetchVisitWithIdentifier:handler:]";
    v26 = 1024;
    v27 = 2282;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_10:

}

void __60__RTLearnedLocationStore__fetchVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v2, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  v10 = 0;
  objc_msgSend(v2, "execute:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v12 = v9;
    v13 = 2112;
    v14 = v2;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, result, %@, error, %@", buf, 0x2Au);

  }
  v8 = 0;
  if (!v5 && v6)
  {
    +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __60__RTLearnedLocationStore__fetchVisitWithIdentifier_handler___block_invoke_180(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPlacesWithIdentifiers:(id)a3 handler:(id)a4
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
  block[2] = __61__RTLearnedLocationStore_fetchPlacesWithIdentifiers_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __61__RTLearnedLocationStore_fetchPlacesWithIdentifiers_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlacesWithIdentifiers:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchPlacesWithIdentifiers:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__RTLearnedLocationStore__fetchPlacesWithIdentifiers_handler___block_invoke;
    v14[3] = &unk_1E9297A08;
    v15 = v7;
    v17 = a2;
    v10 = v8;
    v16 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v14);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __62__RTLearnedLocationStore__fetchPlacesWithIdentifiers_handler___block_invoke_185;
    v12[3] = &unk_1E9297568;
    v13 = v10;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v12);

  }
}

void __62__RTLearnedLocationStore__fetchPlacesWithIdentifiers_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN (%@)"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v25 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v25;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138413058;
    v28 = v16;
    v29 = 2112;
    v30 = v4;
    v31 = 2048;
    v32 = v17;
    v33 = 2112;
    v34 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v7)
  {
    v9 = 0;
  }
  else
  {
    v19 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          +[RTLearnedPlace createWithManagedObject:](RTLearnedPlace, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    v6 = v18;
    v3 = v19;
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__RTLearnedLocationStore__fetchPlacesWithIdentifiers_handler___block_invoke_182;
  v20[3] = &__block_descriptor_40_e31_v32__0__RTLearnedPlace_8Q16_B24l;
  v20[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v20);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__RTLearnedLocationStore__fetchPlacesWithIdentifiers_handler___block_invoke_182(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    v12 = 2112;
    v13 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%@, idx, %lu, place, %@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __62__RTLearnedLocationStore__fetchPlacesWithIdentifiers_handler___block_invoke_185(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchVisitWithIdentifier:(id)a3 handler:(id)a4
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
  block[2] = __59__RTLearnedLocationStore_fetchVisitWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __59__RTLearnedLocationStore_fetchVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitWithIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchVisitsPredating:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K < %@"), CFSTR("exitDate"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedLocationStore _fetchVisitsWithPredicate:ascending:limit:handler:](self, "_fetchVisitsWithPredicate:ascending:limit:handler:", v8, 1, 0, v7);

    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0D18598];
      v13 = *MEMORY[0x1E0CB2D50];
      v14[0] = CFSTR("requires a valid date.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v12);

    }
  }

}

- (void)fetchVisitsPredating:(id)a3 handler:(id)a4
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
  block[2] = __55__RTLearnedLocationStore_fetchVisitsPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __55__RTLearnedLocationStore_fetchVisitsPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitsPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchVisitsWithPredicate:(id)a3 ascending:(BOOL)a4 limit:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  SEL v23;
  BOOL v24;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __76__RTLearnedLocationStore__fetchVisitsWithPredicate_ascending_limit_handler___block_invoke;
    v19[3] = &unk_1E929DBB8;
    v20 = v11;
    v24 = a4;
    v21 = v12;
    v23 = a2;
    v15 = v13;
    v22 = v15;
    v16 = (void *)MEMORY[0x1D8232094](v19);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __76__RTLearnedLocationStore__fetchVisitsWithPredicate_ascending_limit_handler___block_invoke_190;
    v17[3] = &unk_1E9297568;
    v18 = v15;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v16, 1, v17);

  }
}

void __76__RTLearnedLocationStore__fetchVisitsWithPredicate_ascending_limit_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  _QWORD v36[4];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entryDate"), *(unsigned __int8 *)(a1 + 64));
  v36[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  v7 = *(void **)(a1 + 40);
  if (v7)
    objc_msgSend(v4, "setFetchLimit:", objc_msgSend(v7, "unsignedIntegerValue"));
  v26 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 138413058;
    v29 = v18;
    v30 = 2112;
    v31 = v4;
    v32 = 2048;
    v33 = v19;
    v34 = 2112;
    v35 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v9)
  {
    v11 = 0;
  }
  else
  {
    v21 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v20 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16), v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v14);
    }

    v8 = v20;
    v3 = v21;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __76__RTLearnedLocationStore__fetchVisitsWithPredicate_ascending_limit_handler___block_invoke_190(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchVisitsWithHandler:(id)a3
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
  v7[2] = __49__RTLearnedLocationStore_fetchVisitsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __49__RTLearnedLocationStore_fetchVisitsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitsWithPredicate:ascending:limit:handler:", 0, 1, 0, *(_QWORD *)(a1 + 40));
}

- (void)fetchVisitsWithDevice:(id)a3 dateInterval:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: device";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_14;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: dateInterval";
    goto LABEL_13;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: handler";
    goto LABEL_13;
  }
  objc_msgSend(v9, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationStore predicateForVisitsFromEntryDate:exitDate:](self, "predicateForVisitsFromEntryDate:exitDate:", v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v8, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K.%K == %@"), CFSTR("device"), CFSTR("identifier"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc(MEMORY[0x1E0CB3528]);
  v28[0] = v14;
  v28[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithType:subpredicates:", 1, v19);

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v20;
    v26 = 2112;
    v27 = v23;
    _os_log_debug_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEBUG, "TransitMetrics, visit predicate, %@, device, %@", buf, 0x16u);

  }
  -[RTLearnedLocationStore fetchVisitsWithPredicate:handler:](self, "fetchVisitsWithPredicate:handler:", v20, v11);

LABEL_14:
}

- (void)fetchVisitsWithPredicate:(id)a3 handler:(id)a4
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
  block[2] = __59__RTLearnedLocationStore_fetchVisitsWithPredicate_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __59__RTLearnedLocationStore_fetchVisitsWithPredicate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitsWithPredicate:ascending:limit:handler:", *(_QWORD *)(a1 + 40), 1, 0, *(_QWORD *)(a1 + 48));
}

- (void)fetchVisitsWithPredicate:(id)a3 ascending:(BOOL)a4 dateInterval:(id)a5 limit:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  RTLearnedLocationStore *v24;
  id v25;
  id v26;
  BOOL v27;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[RTNotifier queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__RTLearnedLocationStore_fetchVisitsWithPredicate_ascending_dateInterval_limit_handler___block_invoke;
  v21[3] = &unk_1E929DBE0;
  v22 = v12;
  v23 = v13;
  v27 = a4;
  v24 = self;
  v25 = v14;
  v26 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(v16, v21);

}

void __88__RTLearnedLocationStore_fetchVisitsWithPredicate_ascending_dateInterval_limit_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v10 = v2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v2, "addObject:");
    v3 = v10;
  }
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K >= %@ && %K <= %@"), CFSTR("entryDate"), v6, CFSTR("exitDate"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v10, "addObject:", v8);

    v3 = v10;
  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "_fetchVisitsWithPredicate:ascending:limit:handler:", v9, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)_fetchVisitsToPlace:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SEL v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v9 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __54__RTLearnedLocationStore__fetchVisitsToPlace_handler___block_invoke;
      v18[3] = &unk_1E9297A08;
      v19 = v7;
      v21 = a2;
      v10 = v8;
      v20 = v10;
      v11 = (void *)MEMORY[0x1D8232094](v18);
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __54__RTLearnedLocationStore__fetchVisitsToPlace_handler___block_invoke_195;
      v16[3] = &unk_1E9297568;
      v17 = v10;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v16);

      v12 = v19;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = CFSTR("requires a valid place.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v15);

    }
  }

}

void __54__RTLearnedLocationStore__fetchVisitsToPlace_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  _QWORD v38[4];

  v38[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K.%K == %@"), CFSTR("place"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entryDate"), 1);
  v38[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v9);

  v28 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v28;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 138413058;
    v31 = v20;
    v32 = 2112;
    v33 = v4;
    v34 = 2048;
    v35 = v21;
    v36 = 2112;
    v37 = v11;
    _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v11)
  {
    v13 = 0;
  }
  else
  {
    v22 = a1;
    v23 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v16);
    }

    a1 = v22;
    v3 = v23;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __54__RTLearnedLocationStore__fetchVisitsToPlace_handler___block_invoke_195(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchVisitsToPlace:(id)a3 handler:(id)a4
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
  block[2] = __53__RTLearnedLocationStore_fetchVisitsToPlace_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __53__RTLearnedLocationStore_fetchVisitsToPlace_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitsToPlace:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchLastVisitWithHandler:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__RTLearnedLocationStore__fetchLastVisitWithHandler___block_invoke;
    v12[3] = &unk_1E929DC08;
    v14 = a2;
    v8 = v5;
    v13 = v8;
    v9 = (void *)MEMORY[0x1D8232094](v12);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __53__RTLearnedLocationStore__fetchLastVisitWithHandler___block_invoke_196;
    v10[3] = &unk_1E9297568;
    v11 = v8;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v9, 1, v10);

  }
}

void __53__RTLearnedLocationStore__fetchLastVisitWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v3, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K.%K == %@"), CFSTR("device"), CFSTR("identifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entryDate"), 0);
  v27[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v10);

  objc_msgSend(v4, "setFetchLimit:", 1);
  v18 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v18;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 138413058;
    v20 = v16;
    v21 = 2112;
    v22 = v4;
    v23 = 2048;
    v24 = v17;
    v25 = 2112;
    v26 = v12;
    _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  v14 = 0;
  if (objc_msgSend(v11, "count") && !v12)
  {
    objc_msgSend(v11, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __53__RTLearnedLocationStore__fetchLastVisitWithHandler___block_invoke_196(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLastVisitWithHandler:(id)a3
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
  v7[2] = __52__RTLearnedLocationStore_fetchLastVisitWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __52__RTLearnedLocationStore_fetchLastVisitWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLastVisitWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchLastVisitToPlaceWithIdentifier:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__RTLearnedLocationStore__fetchLastVisitToPlaceWithIdentifier_handler___block_invoke;
    v14[3] = &unk_1E9297A08;
    v15 = v7;
    v17 = a2;
    v10 = v8;
    v16 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v14);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __71__RTLearnedLocationStore__fetchLastVisitToPlaceWithIdentifier_handler___block_invoke_199;
    v12[3] = &unk_1E9297568;
    v13 = v10;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v12);

  }
}

void __71__RTLearnedLocationStore__fetchLastVisitToPlaceWithIdentifier_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("place.identifier"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v5);

  objc_msgSend(v2, "setFetchLimit:", 1);
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  v12 = 0;
  objc_msgSend(v2, "execute:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v14 = v11;
    v15 = 2112;
    v16 = v2;
    v17 = 2112;
    v18 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, error, %@", buf, 0x20u);

  }
  v10 = 0;
  if (v8 && !v7)
  {
    +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __71__RTLearnedLocationStore__fetchLastVisitToPlaceWithIdentifier_handler___block_invoke_199(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLastVisitToPlaceWithIdentifier:(id)a3 handler:(id)a4
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
  block[2] = __70__RTLearnedLocationStore_fetchLastVisitToPlaceWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __70__RTLearnedLocationStore_fetchLastVisitToPlaceWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLastVisitToPlaceWithIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchCountOfVisitsToPlaceWithIdentifier:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_handler___block_invoke;
    v14[3] = &unk_1E9297A08;
    v15 = v7;
    v17 = a2;
    v10 = v8;
    v16 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v14);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __75__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_handler___block_invoke_200;
    v12[3] = &unk_1E9297568;
    v13 = v10;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v12);

  }
}

void __75__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("place.identifier"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v9 = 0;
  objc_msgSend(v3, "countForFetchRequest:error:", v4, &v9);

  v6 = v9;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, error, %@", buf, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __75__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_handler___block_invoke_200(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCountOfVisitsToPlaceWithIdentifier:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  RTLearnedLocationStore *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__RTLearnedLocationStore_fetchCountOfVisitsToPlaceWithIdentifier_endDate_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

uint64_t __82__RTLearnedLocationStore_fetchCountOfVisitsToPlaceWithIdentifier_endDate_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = a1[4];
  v2 = (void *)a1[5];
  v4 = a1[6];
  if (v3)
    return objc_msgSend(v2, "_fetchCountOfVisitsToPlaceWithIdentifier:endDate:handler:", v4, v3, a1[7]);
  else
    return objc_msgSend(v2, "_fetchCountOfVisitsToPlaceWithIdentifier:handler:", v4, a1[7]);
}

- (void)fetchCountOfVisitsToLocationOfInterestWithIdentifier:(id)a3 dateInterval:(id)a4 handler:(id)a5
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
  v15[2] = __100__RTLearnedLocationStore_fetchCountOfVisitsToLocationOfInterestWithIdentifier_dateInterval_handler___block_invoke;
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

uint64_t __100__RTLearnedLocationStore_fetchCountOfVisitsToLocationOfInterestWithIdentifier_dateInterval_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCountOfVisitsToLocationOfInterestWithIdentifier:dateInterval:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_fetchCountOfVisitsToLocationOfInterestWithIdentifier:(id)a3 dateInterval:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  SEL v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[RTLearnedLocationStore _fetchCountOfVisitsToLocationOfInterestWithIdentifier:dateInterval:handler:]";
      v30 = 1024;
      v31 = 2852;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
    }

  }
  if (v11)
  {
    objc_msgSend(v10, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __101__RTLearnedLocationStore__fetchCountOfVisitsToLocationOfInterestWithIdentifier_dateInterval_handler___block_invoke;
    v22[3] = &unk_1E929D938;
    v23 = v9;
    v24 = v13;
    v25 = v14;
    v27 = a2;
    v16 = v11;
    v26 = v16;
    v17 = v14;
    v18 = v13;
    v19 = (void *)MEMORY[0x1D8232094](v22);
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __101__RTLearnedLocationStore__fetchCountOfVisitsToLocationOfInterestWithIdentifier_dateInterval_handler___block_invoke_205;
    v20[3] = &unk_1E9297568;
    v21 = v16;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v19, 1, v20);

  }
}

void __101__RTLearnedLocationStore__fetchCountOfVisitsToLocationOfInterestWithIdentifier_dateInterval_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedLocationOfInterestVisitMO fetchRequest](RTLearnedLocationOfInterestVisitMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ && %K >= %@  && %K <= %@ "), CFSTR("locationOfInterest.identifier"), *(_QWORD *)(a1 + 32), CFSTR("exitDate"), *(_QWORD *)(a1 + 40), CFSTR("exitDate"), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v9 = 0;
  objc_msgSend(v3, "countForFetchRequest:error:", v4, &v9);

  v6 = v9;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, error, %@", buf, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __101__RTLearnedLocationStore__fetchCountOfVisitsToLocationOfInterestWithIdentifier_dateInterval_handler___block_invoke_205(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchCountOfVisitsToPlaceWithIdentifier:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  SEL v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __83__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_endDate_handler___block_invoke;
    v17[3] = &unk_1E92979A0;
    v18 = v9;
    v19 = v10;
    v21 = a2;
    v13 = v11;
    v20 = v13;
    v14 = (void *)MEMORY[0x1D8232094](v17);
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __83__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_endDate_handler___block_invoke_208;
    v15[3] = &unk_1E9297568;
    v16 = v13;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v14, 1, v15);

  }
}

void __83__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_endDate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ && %K <= %@ "), CFSTR("place.identifier"), *(_QWORD *)(a1 + 32), CFSTR("exitDate"), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v9 = 0;
  objc_msgSend(v3, "countForFetchRequest:error:", v4, &v9);

  v6 = v9;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, error, %@", buf, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __83__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_endDate_handler___block_invoke_208(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCountOfVisitsToPlaceWithIdentifier:(id)a3 handler:(id)a4
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
  block[2] = __74__RTLearnedLocationStore_fetchCountOfVisitsToPlaceWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __74__RTLearnedLocationStore_fetchCountOfVisitsToPlaceWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCountOfVisitsToPlaceWithIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchVisitIdentifiersIn:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  SEL v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__RTLearnedLocationStore__fetchVisitIdentifiersIn_handler___block_invoke;
    v15[3] = &unk_1E9297A08;
    v16 = v7;
    v18 = a2;
    v10 = v8;
    v17 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v15);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __59__RTLearnedLocationStore__fetchVisitIdentifiersIn_handler___block_invoke_211;
    v13[3] = &unk_1E9297568;
    v14 = v10;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v13);

    v12 = v16;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTLearnedLocationStore _fetchVisitIdentifiersIn:handler:]";
      v21 = 1024;
      v22 = 2937;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

void __59__RTLearnedLocationStore__fetchVisitIdentifiersIn_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v19[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v6);

  v12 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v14 = v11;
    v15 = 2112;
    v16 = v4;
    v17 = 2112;
    v18 = v8;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, error, %@", buf, 0x20u);

  }
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "valueForKeyPath:", CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __59__RTLearnedLocationStore__fetchVisitIdentifiersIn_handler___block_invoke_211(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  block[2] = __58__RTLearnedLocationStore_fetchVisitIdentifiersIn_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __58__RTLearnedLocationStore_fetchVisitIdentifiersIn_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitIdentifiersIn:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  SEL v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v9 && v10)
    {
      if (objc_msgSend(v9, "compare:", v10) != 1)
      {
        v19 = MEMORY[0x1E0C809B0];
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __76__RTLearnedLocationStore__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke;
        v24[3] = &unk_1E92979A0;
        v25 = v9;
        v26 = v10;
        v28 = a2;
        v20 = v11;
        v27 = v20;
        v21 = (void *)MEMORY[0x1D8232094](v24);
        v22[0] = v19;
        v22[1] = 3221225472;
        v22[2] = __76__RTLearnedLocationStore__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_221;
        v22[3] = &unk_1E9297568;
        v23 = v20;
        -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v21, 1, v22);

        v17 = v25;
        goto LABEL_9;
      }
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D18598];
      v29 = *MEMORY[0x1E0CB2D50];
      v30 = CFSTR("requires well ordered dates.");
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = &v30;
      v16 = &v29;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D18598];
      v31 = *MEMORY[0x1E0CB2D50];
      v32[0] = CFSTR("requires valid dates.");
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = (const __CFString **)v32;
      v16 = &v31;
    }
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v18);

LABEL_9:
  }

}

void __76__RTLearnedLocationStore__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  _QWORD v36[4];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedTransitionMO fetchRequest](RTLearnedTransitionMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@ && %K <= %@"), CFSTR("startDate"), *(_QWORD *)(a1 + 32), CFSTR("stopDate"), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v36[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v7);

  v26 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 138413058;
    v29 = v18;
    v30 = 2112;
    v31 = v4;
    v32 = 2048;
    v33 = v19;
    v34 = 2112;
    v35 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v9)
  {
    v11 = 0;
  }
  else
  {
    v21 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v20 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          +[RTLearnedTransition createWithManagedObject:](RTLearnedTransition, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v14);
    }

    v8 = v20;
    v3 = v21;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __76__RTLearnedLocationStore__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_221(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchTransitionsWithHandler:(id)a3
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
  v7[2] = __54__RTLearnedLocationStore_fetchTransitionsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __54__RTLearnedLocationStore_fetchTransitionsWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fetchTransitionsBetweenStartDate:endDate:handler:", v4, v3, *(_QWORD *)(a1 + 40));

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
  v15[2] = __75__RTLearnedLocationStore_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke;
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

uint64_t __75__RTLearnedLocationStore_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchTransitionsBetweenStartDate:endDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_fetchTransitionWithDestinationIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  uint8_t buf[8];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v8 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __76__RTLearnedLocationStore__fetchTransitionWithDestinationIdentifier_handler___block_invoke;
      v17[3] = &unk_1E9297A80;
      v18 = v6;
      v9 = v7;
      v19 = v9;
      v10 = (void *)MEMORY[0x1D8232094](v17);
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = __76__RTLearnedLocationStore__fetchTransitionWithDestinationIdentifier_handler___block_invoke_2;
      v15[3] = &unk_1E9297568;
      v16 = v9;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v10, 1, v15);

      v11 = v18;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D18598];
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("destination identifier cannot be nil.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v14);
      v11 = objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, NSObject *))v7 + 2))(v7, 0, v11);
    }
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

void __76__RTLearnedLocationStore__fetchTransitionWithDestinationIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  +[RTLearnedTransitionMO fetchRequest](RTLearnedTransitionMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K == %@"), CFSTR("destination"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v10 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[RTLearnedTransition createWithManagedObject:](RTLearnedTransition, "createWithManagedObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __76__RTLearnedLocationStore__fetchTransitionWithDestinationIdentifier_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchTransitionWithDestinationIdentifier:(id)a3 handler:(id)a4
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
  block[2] = __75__RTLearnedLocationStore_fetchTransitionWithDestinationIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __75__RTLearnedLocationStore_fetchTransitionWithDestinationIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchTransitionWithDestinationIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchTransitionWithOriginIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  uint8_t buf[8];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v8 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __71__RTLearnedLocationStore__fetchTransitionWithOriginIdentifier_handler___block_invoke;
      v17[3] = &unk_1E9297A80;
      v18 = v6;
      v9 = v7;
      v19 = v9;
      v10 = (void *)MEMORY[0x1D8232094](v17);
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = __71__RTLearnedLocationStore__fetchTransitionWithOriginIdentifier_handler___block_invoke_2;
      v15[3] = &unk_1E9297568;
      v16 = v9;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v10, 1, v15);

      v11 = v18;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D18598];
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("origin identifier cannot be nil.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v14);
      v11 = objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, NSObject *))v7 + 2))(v7, 0, v11);
    }
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

void __71__RTLearnedLocationStore__fetchTransitionWithOriginIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  +[RTLearnedTransitionMO fetchRequest](RTLearnedTransitionMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K == %@"), CFSTR("origin"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v10 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[RTLearnedTransition createWithManagedObject:](RTLearnedTransition, "createWithManagedObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __71__RTLearnedLocationStore__fetchTransitionWithOriginIdentifier_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchTransitionWithOriginIdentifier:(id)a3 handler:(id)a4
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
  block[2] = __70__RTLearnedLocationStore_fetchTransitionWithOriginIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __70__RTLearnedLocationStore_fetchTransitionWithOriginIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchTransitionWithOriginIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __94__RTLearnedLocationStore__learnedLocationsOfInterestFromLearnedLocationsOfInterestMO_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("visits.@count"), 0, 0);
  v18 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        +[RTLearnedLocationOfInterest createWithManagedObject:](RTLearnedLocationOfInterest, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

}

uint64_t __83__RTLearnedLocationStore__fetchLocationsOfInterestWithinDistance_location_handler___block_invoke_232(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__RTLearnedLocationStore__fetchLocationsOfInterestWithPlaceType_handler___block_invoke_235(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__RTLearnedLocationStore__sortLocationsOfInterest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "place");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "typeSource") & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(v5, "place");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "typeSource");

    if ((v8 & 1) != 0)
    {
      v9 = -1;
      goto LABEL_13;
    }
  }
  objc_msgSend(v4, "place");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "typeSource") & 1) != 0)
  {
    objc_msgSend(v5, "place");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "typeSource");

    if ((v12 & 1) == 0)
    {
      v9 = 1;
      goto LABEL_13;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "visits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  objc_msgSend(v5, "visits");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v14 == v16)
  {
    objc_msgSend(v4, "visits");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKeyPath:", CFSTR("@max.creationDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visits");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "valueForKeyPath:", CFSTR("@max.creationDate"));
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "visits");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "visits");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v18, "compare:", v22);

LABEL_13:
  return v9;
}

id __111__RTLearnedLocationStore__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_includePlaceholders_handler___block_invoke_247(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  +[RTLearnedLocationOfInterest createWithManagedObject:](RTLearnedLocationOfInterest, "createWithManagedObject:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filterWithDateInterval:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __111__RTLearnedLocationStore__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_includePlaceholders_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchCloudStorePersistentHistorySinceDate:(id)a3 earlyStop:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  BOOL v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryAfterDate:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setResultType:", 5);
      objc_msgSend(v10, "setFetchLimit:", 5);
      -[RTStore persistenceManager](self, "persistenceManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "persistenceStoreForType:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "state") == 5)
      {
        -[RTStore persistenceManager](self, "persistenceManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __87__RTLearnedLocationStore__fetchCloudStorePersistentHistorySinceDate_earlyStop_handler___block_invoke;
        v20[3] = &unk_1E929DC98;
        v21 = v12;
        v23 = v9;
        v22 = v10;
        v24 = a4;
        objc_msgSend(v13, "createManagedObjectContext:", v20);

        v14 = v21;
      }
      else
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0D18598];
        v25 = *MEMORY[0x1E0CB2D50];
        v26 = CFSTR("cloud store is not ready.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 0, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v19);

      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v27 = *MEMORY[0x1E0CB2D50];
      v28[0] = CFSTR("requires valid dates.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 0, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v12);
    }

  }
}

void __87__RTLearnedLocationStore__fetchCloudStorePersistentHistorySinceDate_earlyStop_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint64_t v30;
  const __CFString *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v3, "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
      objc_msgSend(v10, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if ((v13 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v10;

    if (!v14)
      goto LABEL_12;
    v29 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setAffectedStores:", v15);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __87__RTLearnedLocationStore__fetchCloudStorePersistentHistorySinceDate_earlyStop_handler___block_invoke_2;
    v20[3] = &unk_1E92970B0;
    v21 = v3;
    v22 = *(id *)(a1 + 40);
    v23 = *(id *)(a1 + 48);
    v24 = *(_BYTE *)(a1 + 56);
    objc_msgSend(v21, "performBlock:", v20);

    v16 = v21;
  }
  else
  {
LABEL_9:

LABEL_12:
    v17 = *(_QWORD *)(a1 + 48);
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D18598];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("cloud store is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 0, v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v17 + 16))(v17, 0, v16);
  }

}

void __87__RTLearnedLocationStore__fetchCloudStorePersistentHistorySinceDate_earlyStop_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *context;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  while (1)
  {
    v3 = (void *)MEMORY[0x1D8231EA8]();
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v32 = 0;
    objc_msgSend(v4, "executeRequest:error:", v5, &v32);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v32;
    if (v7)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v22;
        _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "error while fetching history; unexpected result class, %@",
          buf,
          0xCu);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_18;
    }
    context = v3;
    v24 = v6;
    v8 = v6;
    objc_msgSend(v8, "result");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v25, "count");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = v8;
    objc_msgSend(v8, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            objc_msgSend(v15, "changes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "count");

            if (v17)
            {
              objc_msgSend(v2, "addObject:", v15);
              if (*(_BYTE *)(a1 + 56))
              {
                (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

                v3 = context;
                v6 = v24;
                goto LABEL_18;
              }
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v11)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(a1 + 40), "setFetchOffset:", objc_msgSend(*(id *)(a1 + 40), "fetchOffset") + v23);
    objc_msgSend(*(id *)(a1 + 32), "reset");

    objc_autoreleasePoolPop(context);
    if (!v23)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_19;
    }
  }
  v18 = v7;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v18;
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "error while fetching history, %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_18:

  objc_autoreleasePoolPop(v3);
LABEL_19:

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
  block[2] = __75__RTLearnedLocationStore_fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __75__RTLearnedLocationStore_fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)a1[4];
  v3 = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fetchLocationsOfInterestVisitedBetweenStartDate:endDate:includePlaceholders:handler:", v3, v4, 0, a1[6]);

}

- (void)fetchCloudStorePersistentHistorySinceDate:(id)a3 earlyStop:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__RTLearnedLocationStore_fetchCloudStorePersistentHistorySinceDate_earlyStop_handler___block_invoke;
  v13[3] = &unk_1E92970B0;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __86__RTLearnedLocationStore_fetchCloudStorePersistentHistorySinceDate_earlyStop_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCloudStorePersistentHistorySinceDate:earlyStop:handler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (BOOL)cloudStoreChangedSinceDate:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  BOOL v26;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint8_t buf[8];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39 = 0;
  v40 = (id *)&v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__69;
  v43 = __Block_byref_object_dispose__69;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__69;
  v37 = __Block_byref_object_dispose__69;
  v38 = 0;
  v5 = dispatch_semaphore_create(0);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __53__RTLearnedLocationStore_cloudStoreChangedSinceDate___block_invoke;
  v28[3] = &unk_1E92995B0;
  v6 = v4;
  v29 = v6;
  v31 = &v39;
  v32 = &v33;
  v7 = v5;
  v30 = v7;
  -[RTLearnedLocationStore fetchCloudStorePersistentHistorySinceDate:earlyStop:handler:](self, "fetchCloudStorePersistentHistorySinceDate:earlyStop:handler:", v6, 1, v28);
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_714);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E0CB35C8];
  v45 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v45, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_retainAutorelease(v22);

    v24 = 0;
  }
  else
  {
LABEL_6:
    v23 = 0;
    v24 = 1;
  }

  v25 = v23;
  if ((v24 & 1) == 0)
    objc_storeStrong(v40 + 5, v23);
  if (v40[5])
    v26 = 1;
  else
    v26 = objc_msgSend((id)v34[5], "count") != 0;

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v26;
}

void __53__RTLearnedLocationStore_cloudStoreChangedSinceDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(v5, "count");
    v9 = *(_QWORD *)(a1 + 32);
    v16 = 134218754;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = CFSTR("YES");
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "fetched %lu persistent history transaction, since date, %@, early stop, %@, error, %@", (uint8_t *)&v16, 0x2Au);
  }

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v5;
  v15 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)fetchRecentLocationsOfInterestWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -4838400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__RTLearnedLocationStore_fetchRecentLocationsOfInterestWithHandler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __68__RTLearnedLocationStore_fetchRecentLocationsOfInterestWithHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)a1[4];
  v3 = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fetchLocationsOfInterestVisitedBetweenStartDate:endDate:includePlaceholders:handler:", v3, v4, 1, a1[6]);

}

- (void)fetchAllLocationsOfInterestWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__RTLearnedLocationStore_fetchAllLocationsOfInterestWithHandler___block_invoke;
    v7[3] = &unk_1E9297650;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __65__RTLearnedLocationStore_fetchAllLocationsOfInterestWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fetchLocationsOfInterestVisitedBetweenStartDate:endDate:includePlaceholders:handler:", v4, v3, 1, *(_QWORD *)(a1 + 40));

}

- (void)fetchInferredMapItemForVisitIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, NSObject *);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[5];
  id v14;
  void (**v15)(id, _QWORD, NSObject *);
  uint8_t buf[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, NSObject *))a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_7;
  }
  if (!v6)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D18598];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("requires a non-nil identifier.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 7, v12);
    v9 = objc_claimAutoreleasedReturnValue();

    v7[2](v7, 0, v9);
LABEL_7:

    goto LABEL_8;
  }
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__RTLearnedLocationStore_fetchInferredMapItemForVisitIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  dispatch_async(v8, block);

LABEL_8:
}

uint64_t __73__RTLearnedLocationStore_fetchInferredMapItemForVisitIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchInferredMapItemForVisitIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchInferredMapItemForVisitIdentifier:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  SEL v19;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__RTLearnedLocationStore__fetchInferredMapItemForVisitIdentifier_handler___block_invoke;
  v16[3] = &unk_1E9297A08;
  v17 = v7;
  v19 = a2;
  v10 = v8;
  v18 = v10;
  v11 = v7;
  v12 = (void *)MEMORY[0x1D8232094](v16);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __74__RTLearnedLocationStore__fetchInferredMapItemForVisitIdentifier_handler___block_invoke_264;
  v14[3] = &unk_1E9297568;
  v15 = v10;
  v13 = v10;
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v12, 1, v14);

}

void __74__RTLearnedLocationStore__fetchInferredMapItemForVisitIdentifier_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v2, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  v16 = 0;
  objc_msgSend(v2, "execute:", &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v20 = v15;
    v21 = 2112;
    v22 = v2;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, result, %@, error, %@", buf, 0x2Au);

  }
  if (!v5)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D183A8], "createWithManagedObject:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not initialize inferredMapItem for learnedVisitMO, %@"), v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v11 = *MEMORY[0x1E0D18598];
        v17 = *MEMORY[0x1E0CB2D50];
        v18 = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 0, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v13;
          _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "error, %@", buf, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_14;
      }
    }
    else
    {
      v9 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_14:

    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "error, %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_15:

}

uint64_t __74__RTLearnedLocationStore__fetchInferredMapItemForVisitIdentifier_handler___block_invoke_264(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchLocationOfInterestVisitedFirstWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__RTLearnedLocationStore__fetchLocationOfInterestVisitedFirstWithHandler___block_invoke;
  v12[3] = &unk_1E929DC08;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  v8 = (void *)MEMORY[0x1D8232094](v12);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __74__RTLearnedLocationStore__fetchLocationOfInterestVisitedFirstWithHandler___block_invoke_265;
  v10[3] = &unk_1E9297568;
  v11 = v7;
  v9 = v7;
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v8, 1, v10);

}

void __74__RTLearnedLocationStore__fetchLocationOfInterestVisitedFirstWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedLocationOfInterestVisitMO fetchRequest](RTLearnedLocationOfInterestVisitMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setFetchLimit:", 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("exitDate"), 1);
  v24[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  v15 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v15;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 138413058;
    v17 = v13;
    v18 = 2112;
    v19 = v4;
    v20 = 2048;
    v21 = v14;
    v22 = 2112;
    v23 = v8;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v8 || !objc_msgSend(v7, "count"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationOfInterest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTLearnedLocationOfInterest createWithManagedObject:](RTLearnedLocationOfInterest, "createWithManagedObject:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __74__RTLearnedLocationStore__fetchLocationOfInterestVisitedFirstWithHandler___block_invoke_265(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLocationOfInterestVisitedFirstWithHandler:(id)a3
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
  v7[2] = __73__RTLearnedLocationStore_fetchLocationOfInterestVisitedFirstWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __73__RTLearnedLocationStore_fetchLocationOfInterestVisitedFirstWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationOfInterestVisitedFirstWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchLocationOfInterestVisitedLastWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__RTLearnedLocationStore__fetchLocationOfInterestVisitedLastWithHandler___block_invoke;
  v12[3] = &unk_1E929DC08;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  v8 = (void *)MEMORY[0x1D8232094](v12);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __73__RTLearnedLocationStore__fetchLocationOfInterestVisitedLastWithHandler___block_invoke_266;
  v10[3] = &unk_1E9297568;
  v11 = v7;
  v9 = v7;
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v8, 1, v10);

}

void __73__RTLearnedLocationStore__fetchLocationOfInterestVisitedLastWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedLocationOfInterestVisitMO fetchRequest](RTLearnedLocationOfInterestVisitMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setFetchLimit:", 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entryDate"), 0);
  v24[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  v15 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v15;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 138413058;
    v17 = v13;
    v18 = 2112;
    v19 = v4;
    v20 = 2048;
    v21 = v14;
    v22 = 2112;
    v23 = v8;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v8 || !objc_msgSend(v7, "count"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationOfInterest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTLearnedLocationOfInterest createWithManagedObject:](RTLearnedLocationOfInterest, "createWithManagedObject:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __73__RTLearnedLocationStore__fetchLocationOfInterestVisitedLastWithHandler___block_invoke_266(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLocationOfInterestVisitedLastWithHandler:(id)a3
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
  v7[2] = __72__RTLearnedLocationStore_fetchLocationOfInterestVisitedLastWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __72__RTLearnedLocationStore_fetchLocationOfInterestVisitedLastWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationOfInterestVisitedLastWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SEL v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v9 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __73__RTLearnedLocationStore__fetchLocationOfInterestWithIdentifier_handler___block_invoke;
      v18[3] = &unk_1E9297A08;
      v19 = v7;
      v21 = a2;
      v10 = v8;
      v20 = v10;
      v11 = (void *)MEMORY[0x1D8232094](v18);
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __73__RTLearnedLocationStore__fetchLocationOfInterestWithIdentifier_handler___block_invoke_269;
      v16[3] = &unk_1E9297568;
      v17 = v10;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v16);

      v12 = v19;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = CFSTR("requires a valid identifier.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v15);

    }
  }

}

void __73__RTLearnedLocationStore__fetchLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v13 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v13;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138413058;
    v15 = v11;
    v16 = 2112;
    v17 = v4;
    v18 = 2048;
    v19 = v12;
    v20 = 2112;
    v21 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v7 || !objc_msgSend(v6, "count"))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTLearnedLocationOfInterest createWithManagedObject:](RTLearnedLocationOfInterest, "createWithManagedObject:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __73__RTLearnedLocationStore__fetchLocationOfInterestWithIdentifier_handler___block_invoke_269(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  block[2] = __72__RTLearnedLocationStore_fetchLocationOfInterestWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __72__RTLearnedLocationStore_fetchLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationOfInterestWithIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __70__RTLearnedLocationStore__fetchLocationOfInterestWithMapItem_handler___block_invoke_272(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchLocationOfInterestWithPlace:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SEL v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v9 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __68__RTLearnedLocationStore__fetchLocationOfInterestWithPlace_handler___block_invoke;
      v18[3] = &unk_1E9297A08;
      v19 = v7;
      v21 = a2;
      v10 = v8;
      v20 = v10;
      v11 = (void *)MEMORY[0x1D8232094](v18);
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __68__RTLearnedLocationStore__fetchLocationOfInterestWithPlace_handler___block_invoke_275;
      v16[3] = &unk_1E9297568;
      v17 = v10;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v16);

      v12 = v19;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = CFSTR("requires a valid place.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 7, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v15);

    }
  }

}

void __68__RTLearnedLocationStore__fetchLocationOfInterestWithPlace_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setFetchLimit:", 1);
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("placeIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v15 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v15;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 138413058;
    v17 = v13;
    v18 = 2112;
    v19 = v4;
    v20 = 2048;
    v21 = v14;
    v22 = 2112;
    v23 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v9 || !objc_msgSend(v8, "count"))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTLearnedLocationOfInterest createWithManagedObject:](RTLearnedLocationOfInterest, "createWithManagedObject:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __68__RTLearnedLocationStore__fetchLocationOfInterestWithPlace_handler___block_invoke_275(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLocationOfInterestWithPlace:(id)a3 handler:(id)a4
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
  block[2] = __67__RTLearnedLocationStore_fetchLocationOfInterestWithPlace_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __67__RTLearnedLocationStore_fetchLocationOfInterestWithPlace_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationOfInterestWithPlace:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchLocationsOfInterestWithVisitsWithinDistance:(double)a3 location:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25[2];
  id location;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    if (a3 >= 0.0)
    {
      if (v8)
      {
        objc_initWeak(&location, self);
        v14 = MEMORY[0x1E0C809B0];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __93__RTLearnedLocationStore__fetchLocationsOfInterestWithVisitsWithinDistance_location_handler___block_invoke;
        v22[3] = &unk_1E929DCC0;
        objc_copyWeak(v25, &location);
        v15 = v9;
        v24 = v15;
        v23 = v8;
        v25[1] = *(id *)&a3;
        v16 = (void *)MEMORY[0x1D8232094](v22);
        v20[0] = v14;
        v20[1] = 3221225472;
        v20[2] = __93__RTLearnedLocationStore__fetchLocationsOfInterestWithVisitsWithinDistance_location_handler___block_invoke_2;
        v20[3] = &unk_1E9297568;
        v21 = v15;
        -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v16, 1, v20);

        objc_destroyWeak(v25);
        objc_destroyWeak(&location);
      }
      else
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v27 = *MEMORY[0x1E0CB2D50];
        v28 = CFSTR("location cannot be nil");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v19);
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = CFSTR("distance cannot be less than zero");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v12);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location) = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&location, 2u);
    }

  }
}

void __93__RTLearnedLocationStore__fetchLocationsOfInterestWithVisitsWithinDistance_location_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  double v53;
  double v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id WeakRetained;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85[5];
  uint64_t v86;
  id v87;
  _BYTE v88[128];
  _QWORD v89[4];
  uint64_t v90;
  _QWORD v91[3];

  v91[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    +[RTLearnedLocationOfInterestVisitMO fetchRequest](RTLearnedLocationOfInterestVisitMO, "fetchRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(*(id *)(a1 + 32), "latitude");
    objc_msgSend(*(id *)(a1 + 32), "longitude");
    RTCommonCalculateBoundingBox();
    v74 = (void *)MEMORY[0x1E0CB3528];
    v3 = (void *)MEMORY[0x1E0CB3880];
    v72 = a1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predicateWithFormat:", CFSTR("%@ <= %K"), v78, CFSTR("locationLongitude"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v76;
    v4 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("locationLongitude"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v89[1] = v6;
    v7 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("%@ <= %K"), v8, CFSTR("locationLatitude"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v89[2] = v9;
    v10 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("locationLatitude"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v89[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "andPredicateWithSubpredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setPredicate:", v14);

    v15 = v2;
    memset(v85, 0, sizeof(v85));
    objc_msgSend(v2, "execute:", v85);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v85[0];
    if (v17)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v67 = v2;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v68 = v16;
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v21 = v16;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
      v23 = a1;
      if (v22)
      {
        v24 = v22;
        v25 = *(_QWORD *)v82;
        v70 = *(_QWORD *)v82;
        v71 = v21;
LABEL_7:
        v26 = 0;
        while (1)
        {
          if (*(_QWORD *)v82 != v25)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v26);
          objc_msgSend(v27, "locationOfInterest");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(v27, "locationOfInterest");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "identifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "member:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v32)
            {
              v75 = objc_alloc(MEMORY[0x1E0D183B0]);
              objc_msgSend(v27, "locationLatitude");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "doubleValue");
              v34 = v33;
              objc_msgSend(v27, "locationLongitude");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "doubleValue");
              v37 = v36;
              objc_msgSend(v27, "locationHorizontalUncertainty");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "doubleValue");
              v40 = v39;
              objc_msgSend(v27, "locationAltitude");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "doubleValue");
              v43 = v42;
              objc_msgSend(v27, "locationVerticalUncertainty");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "doubleValue");
              v46 = v45;
              objc_msgSend(v27, "locationReferenceFrame");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v47, "intValue");
              objc_msgSend(v27, "locationSourceAccuracy");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = (void *)objc_msgSend(v75, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v48, (int)objc_msgSend(v49, "intValue"), v34, v37, v40, v43, v46, 0.0);

              v23 = v72;
              objc_msgSend(WeakRetained, "distanceCalculator");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = *(_QWORD *)(v72 + 32);
              v80 = 0;
              objc_msgSend(v51, "distanceFromLocation:toLocation:error:", v50, v52, &v80);
              v54 = v53;
              v55 = v80;

              if (v55)
              {
                (*(void (**)(void))(*(_QWORD *)(v72 + 40) + 16))();
LABEL_22:
                v17 = 0;
                v15 = v67;

                v16 = v68;
                v59 = v69;
                goto LABEL_23;
              }
              if (v54 <= *(double *)(v72 + 56))
              {
                objc_msgSend(v27, "locationOfInterest");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                +[RTLearnedLocationOfInterest createWithManagedObject:](RTLearnedLocationOfInterest, "createWithManagedObject:", v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v57)
                {
                  v60 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v27, "locationOfInterest");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "identifier");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "stringWithFormat:", CFSTR("reading loiMO with identifier, %@, resulted in nil object"), v62);
                  v55 = (id)objc_claimAutoreleasedReturnValue();

                  v63 = (void *)MEMORY[0x1E0CB35C8];
                  v64 = *MEMORY[0x1E0D18598];
                  v86 = *MEMORY[0x1E0CB2D50];
                  v87 = v55;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "errorWithDomain:code:userInfo:", v64, 0, v65);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();

                  (*(void (**)(void))(*(_QWORD *)(v72 + 40) + 16))();
                  goto LABEL_22;
                }
                objc_msgSend(v69, "addObject:", v57);
                objc_msgSend(v57, "identifier");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "addObject:", v58);

              }
              v25 = v70;
              v21 = v71;
            }
          }
          if (v24 == ++v26)
          {
            v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
            if (v24)
              goto LABEL_7;
            break;
          }
        }
      }

      v59 = v69;
      (*(void (**)(void))(*(_QWORD *)(v23 + 40) + 16))();
      v15 = v67;
      v16 = v68;
      v17 = 0;
LABEL_23:

    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D18598];
    v90 = *MEMORY[0x1E0CB2D50];
    v91[0] = CFSTR("swelf is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 0, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __93__RTLearnedLocationStore__fetchLocationsOfInterestWithVisitsWithinDistance_location_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLocationsOfInterestWithVisitsWithinDistance:(double)a3 location:(id)a4 handler:(id)a5
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
  v13[2] = __92__RTLearnedLocationStore_fetchLocationsOfInterestWithVisitsWithinDistance_location_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __92__RTLearnedLocationStore_fetchLocationsOfInterestWithVisitsWithinDistance_location_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationsOfInterestWithVisitsWithinDistance:location:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_fetchLocationOfInterestTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  SEL v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v9 && v10)
    {
      if (objc_msgSend(v9, "compare:", v10) != 1)
      {
        v19 = MEMORY[0x1E0C809B0];
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __94__RTLearnedLocationStore__fetchLocationOfInterestTransitionsBetweenStartDate_endDate_handler___block_invoke;
        v24[3] = &unk_1E92979A0;
        v25 = v9;
        v26 = v10;
        v28 = a2;
        v20 = v11;
        v27 = v20;
        v21 = (void *)MEMORY[0x1D8232094](v24);
        v22[0] = v19;
        v22[1] = 3221225472;
        v22[2] = __94__RTLearnedLocationStore__fetchLocationOfInterestTransitionsBetweenStartDate_endDate_handler___block_invoke_284;
        v22[3] = &unk_1E9297568;
        v23 = v20;
        -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v21, 1, v22);

        v17 = v25;
        goto LABEL_9;
      }
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D18598];
      v29 = *MEMORY[0x1E0CB2D50];
      v30 = CFSTR("requires well ordered dates.");
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = &v30;
      v16 = &v29;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D18598];
      v31 = *MEMORY[0x1E0CB2D50];
      v32[0] = CFSTR("requires valid dates.");
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = (const __CFString **)v32;
      v16 = &v31;
    }
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v18);

LABEL_9:
  }

}

void __94__RTLearnedLocationStore__fetchLocationOfInterestTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  _QWORD v36[4];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedLocationOfInterestTransitionMO fetchRequest](RTLearnedLocationOfInterestTransitionMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@ && %K <= %@"), CFSTR("startDate"), *(_QWORD *)(a1 + 32), CFSTR("stopDate"), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v36[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v7);

  v26 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 138413058;
    v29 = v18;
    v30 = 2112;
    v31 = v4;
    v32 = 2048;
    v33 = v19;
    v34 = 2112;
    v35 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v9)
  {
    v11 = 0;
  }
  else
  {
    v21 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v20 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          +[RTLearnedTransition createWithManagedObject:](RTLearnedTransition, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v14);
    }

    v8 = v20;
    v3 = v21;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __94__RTLearnedLocationStore__fetchLocationOfInterestTransitionsBetweenStartDate_endDate_handler___block_invoke_284(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLocationOfInterestTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
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
  v15[2] = __93__RTLearnedLocationStore_fetchLocationOfInterestTransitionsBetweenStartDate_endDate_handler___block_invoke;
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

uint64_t __93__RTLearnedLocationStore_fetchLocationOfInterestTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationOfInterestTransitionsBetweenStartDate:endDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_fetchMetricsWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__RTLearnedLocationStore__fetchMetricsWithHandler___block_invoke;
    v11[3] = &unk_1E9299738;
    v7 = v4;
    v12 = v7;
    v8 = (void *)MEMORY[0x1D8232094](v11);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __51__RTLearnedLocationStore__fetchMetricsWithHandler___block_invoke_2;
    v9[3] = &unk_1E9297568;
    v10 = v7;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v8, 1, v9);

  }
}

void __51__RTLearnedLocationStore__fetchMetricsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  id v33[2];
  id v34;

  v2 = a2;
  objc_msgSend(v2, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  v31 = v3;
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K.%K == %@"), CFSTR("device"), CFSTR("identifier"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v9);

  v34 = 0;
  v30 = v6;
  v10 = objc_msgSend(v2, "countForFetchRequest:error:", v6, &v34);
  v11 = v34;
  objc_msgSend(v4, "setVisitCountDevice:", v10);
  if (v11)
    objc_msgSend(v5, "addObject:", v11);
  v28 = v11;
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v33[1] = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v2, "countForFetchRequest:error:");
  v13 = 0;
  objc_msgSend(v4, "setVisitCountTotal:", v12);
  if (v13)
    objc_msgSend(v5, "addObject:", v13);
  v26 = v13;
  +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v31, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K.%K == %@"), CFSTR("device"), CFSTR("identifier"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v17);

  v33[0] = 0;
  v18 = objc_msgSend(v2, "countForFetchRequest:error:", v14, v33);
  v19 = v33[0];
  objc_msgSend(v4, "setPlaceCountDevice:", v18);
  if (v19)
    objc_msgSend(v5, "addObject:", v19);
  +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v21 = objc_msgSend(v2, "countForFetchRequest:error:", v20, &v32);
  v22 = v32;
  objc_msgSend(v4, "setPlaceCountTotal:", v21);
  if (v22)
    objc_msgSend(v5, "addObject:", v22);
  v23 = *(_QWORD *)(a1 + 32);
  _RTSafeArray();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v23 + 16))(v23, v4, v25);

}

uint64_t __51__RTLearnedLocationStore__fetchMetricsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchMetricsWithHandler:(id)a3
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
  v7[2] = __50__RTLearnedLocationStore_fetchMetricsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __50__RTLearnedLocationStore_fetchMetricsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchMetricsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:(id)a3 limit:(id)a4
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
  block[2] = __84__RTLearnedLocationStore_fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke;
  block[3] = &unk_1E9299330;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __84__RTLearnedLocationStore_fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:limit:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:(id)a3 limit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__RTLearnedLocationStore__fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke;
    v15[3] = &unk_1E9297A80;
    v16 = v7;
    v10 = v6;
    v17 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v15);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __85__RTLearnedLocationStore__fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke_3;
    v13[3] = &unk_1E9297568;
    v14 = v10;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v13);

    v12 = v16;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTLearnedLocationStore _fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:limit:]";
      v20 = 1024;
      v21 = 4363;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

void __85__RTLearnedLocationStore__fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _RTMap *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v3, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K.%K == %@ && place == nil"), CFSTR("device"), CFSTR("identifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entryDate"), 1);
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v10);

  v11 = *(void **)(a1 + 32);
  if (v11)
    objc_msgSend(v4, "setFetchLimit:", objc_msgSend(v11, "integerValue"));
  v16 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  v14 = 0;
  if (!v13)
  {
    v15 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v12);
    -[_RTMap withBlock:](v15, "withBlock:", &__block_literal_global_288);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __85__RTLearnedLocationStore__fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", a2);
}

uint64_t __85__RTLearnedLocationStore__fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler:(id)a3
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
  v7[2] = __85__RTLearnedLocationStore_fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __85__RTLearnedLocationStore_fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __86__RTLearnedLocationStore__fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler___block_invoke;
    v13[3] = &unk_1E9297A08;
    v13[4] = self;
    v15 = a2;
    v8 = v5;
    v14 = v8;
    v9 = (void *)MEMORY[0x1D8232094](v13);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __86__RTLearnedLocationStore__fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler___block_invoke_293;
    v11[3] = &unk_1E9297568;
    v12 = v8;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v9, 1, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[RTLearnedLocationStore _fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler:]";
      v18 = 1024;
      v19 = 4412;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

void __86__RTLearnedLocationStore__fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  void *v45;
  _QWORD v46[6];

  v46[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "predicateForObjectsFromCurrentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("place"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K == nil"), CFSTR("place"), CFSTR("mapItem"));
  v6 = objc_claimAutoreleasedReturnValue();
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReturnsObjectsAsFaults:", 0);
  v8 = (void *)MEMORY[0x1E0CB3528];
  v46[0] = v4;
  v46[1] = v5;
  v30 = (void *)v6;
  v46[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entryDate"), 1);
  v45 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v12);

  v35 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v7, &v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v35;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v24 = v13;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "count");
    *(_DWORD *)buf = 138413058;
    v38 = v25;
    v39 = 2112;
    v40 = v7;
    v41 = 2048;
    v42 = v26;
    v43 = 2112;
    v44 = v14;
    _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

    v13 = v24;
  }
  v16 = a1;

  if (v14)
  {
    v17 = 0;
  }
  else
  {
    v28 = v5;
    v29 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v27 = v13;
    v18 = v13;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            objc_msgSend(v17, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v20);
    }

    v4 = v29;
    v13 = v27;
    v5 = v28;
  }
  (*(void (**)(void))(*(_QWORD *)(v16 + 40) + 16))();

}

uint64_t __86__RTLearnedLocationStore__fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler___block_invoke_293(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)groupCloudManagedObjectsByDeviceIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    v30 = *(_QWORD *)v36;
    v31 = v4;
    do
    {
      v8 = 0;
      v32 = v6;
      do
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v8);
        v34 = MEMORY[0x1D8231EA8]();
        objc_msgSend(v9, "device");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v4, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "addObject:", v9);
          }
          else
          {
            v24 = (void *)objc_opt_new();
            objc_msgSend(v24, "addObject:", v9);
            if (v24)
              objc_msgSend(v4, "setObject:forKey:", v24, v11);
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v11, "UUIDString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v40 = v27;
              _os_log_debug_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEBUG, "New grouping of cloud managed objects for device with identifier, %@", buf, 0xCu);

            }
          }
          v23 = (void *)v34;
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v11, "UUIDString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v40 = v9;
            v41 = 2112;
            v42 = v26;
            _os_log_debug_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEBUG, "Added cloud managed object %@ to group for device with identifier, %@", buf, 0x16u);

          }
        }
        else
        {
          v14 = (void *)MEMORY[0x1E0CB3940];
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "device");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "device");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("Device identifier was nil while grouping RTCloudManagedObject (type: %@, identifier, %@), by device. Device, %@, Device identifier, %@"), v16, v18, v19, v21);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v13;
            _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }
          v7 = v30;
          v4 = v31;
          v6 = v32;
          v23 = (void *)v34;
        }

        objc_autoreleasePoolPop(v23);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (BOOL)_processDeletionRequestWithFetchRequest:(id)a3 context:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  RTLearnedLocationStore *v21;
  uint8_t *v22;
  SEL v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fetchRequest", buf, 2u);
    }

    if (a5)
    {
      v14 = CFSTR("fetchRequest");
LABEL_16:
      _RTErrorInvalidParameterCreate((uint64_t)v14);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a5)
    {
      v14 = CFSTR("context");
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v11, "options") & 2) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This operation requires a context with RTPersistenceContextOptionsAllowTombstones."), 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  *(_QWORD *)buf = 0;
  v25 = buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__69;
  v28 = __Block_byref_object_dispose__69;
  v29 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__RTLearnedLocationStore__processDeletionRequestWithFetchRequest_context_error___block_invoke;
  v18[3] = &unk_1E929DD08;
  v19 = v11;
  v20 = v9;
  v21 = self;
  v22 = buf;
  v23 = a2;
  objc_msgSend(v19, "performBlockAndWait:", v18);
  if (a5)
    *a5 = objc_retainAutorelease(*((id *)v25 + 5));
  v12 = *((_QWORD *)v25 + 5) == 0;

  _Block_object_dispose(buf, 8);
LABEL_18:

  return v12;
}

void __80__RTLearnedLocationStore__processDeletionRequestWithFetchRequest_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  id v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  id v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v78 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v78);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v78;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v57 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v80 = v57;
      v81 = 2112;
      v82 = v5;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Received error while fetching cloud managed objects to delete, fetchRequest, %@, error, %@", buf, 0x16u);
    }

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = v5;
    v9 = *(NSObject **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setMirroringQualityOfService:", 3);
    v61 = v4;
    objc_msgSend(*(id *)(a1 + 48), "groupCloudManagedObjectsByDeviceIdentifier:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "transactionAuthor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = a1;
    objc_msgSend(*(id *)(a1 + 32), "setTransactionAuthor:", CFSTR("CloudDeletion"));
    v62 = (void *)objc_opt_new();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v75 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v16, "UUIDString");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v80 = v19;
            v81 = 2112;
            v82 = v17;
            _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "Building delete request for device with identifier, %@, for cloud objects, %@", buf, 0x16u);

          }
          +[RTEntityDeletionRequestMO managedObjectWithCloudManagedObjects:context:](RTEntityDeletionRequestMO, "managedObjectWithCloudManagedObjects:context:", v17, *(_QWORD *)(v66 + 32));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v80 = v20;
            _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "Created deletion request, %@", buf, 0xCu);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
      }
      while (v13);
    }

    v22 = v66;
    v23 = *(void **)(v66 + 32);
    v73 = 0;
    v24 = objc_msgSend(v23, "save:", &v73);
    v25 = v73;
    v26 = v25;
    if (!v24 || v25)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(v66 + 64));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v80 = v58;
        v81 = 2112;
        v82 = v26;
        _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      if (v26)
        objc_msgSend(v62, "addObject:", v26);
    }
    v59 = v26;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v9 = v11;
    v28 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v70;
      v64 = *(_QWORD *)v70;
      do
      {
        v31 = 0;
        v65 = v29;
        do
        {
          if (*(_QWORD *)v70 != v30)
            objc_enumerationMutation(v9);
          v32 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v31);
          -[NSObject objectForKey:](v9, "objectForKey:", v32);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v22 + 32), "currentDevice");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v32, "isEqual:", v34);

          if (v35)
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v32, "UUIDString");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v80 = v37;
              _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "Batch deleting objects from current device with identifier, %@", buf, 0xCu);

            }
            v38 = objc_alloc(MEMORY[0x1E0C97B48]);
            objc_msgSend(*(id *)(v22 + 40), "entityName");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)objc_msgSend(v38, "initWithEntityName:", v39);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@distinctUnionOfObjects.%@"), CFSTR("identifier"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "valueForKeyPath:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in (%@)"), CFSTR("identifier"), v42, v59);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setPredicate:", v43);

            v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v40);
            objc_msgSend(v44, "setResultType:", 2);
            v45 = *(void **)(v22 + 32);
            v68 = 0;
            objc_msgSend(v45, "executeRequest:error:", v44, &v68);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v68;
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(*(SEL *)(v22 + 64));
              v63 = v41;
              v49 = v9;
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "result");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v80 = v50;
              v81 = 2112;
              v82 = v44;
              v83 = 2112;
              v84 = v51;
              v85 = 2112;
              v86 = v47;
              _os_log_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

              v9 = v49;
              v41 = v63;
              v22 = v66;
            }

            if (v47)
              objc_msgSend(v62, "addObject:", v47);

            v30 = v64;
            v29 = v65;
          }

          ++v31;
        }
        while (v29 != v31);
        v29 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
      }
      while (v29);
    }

    _RTSafeArray();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = *(_QWORD *)(*(_QWORD *)(v22 + 56) + 8);
    v55 = *(void **)(v54 + 40);
    *(_QWORD *)(v54 + 40) = v53;

    objc_msgSend(*(id *)(v22 + 32), "setTransactionAuthor:", v60, 1);
    v5 = 0;
    v4 = v61;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v56 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v80 = v56;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "No such objects exist satisfying fetch request %@", buf, 0xCu);
    }
  }

}

- (void)_removePlace:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  RTLearnedLocationStore *v18;
  id v19;
  SEL v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __47__RTLearnedLocationStore__removePlace_handler___block_invoke;
    v16[3] = &unk_1E92979A0;
    v17 = v7;
    v18 = self;
    v20 = a2;
    v10 = v9;
    v19 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v16);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 0, v10);

    v12 = v17;
LABEL_5:

    goto LABEL_6;
  }
  if (v8)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18598];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = CFSTR("requires a valid place.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 7, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v15);

    goto LABEL_5;
  }
LABEL_6:

}

void __47__RTLearnedLocationStore__removePlace_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  objc_msgSend(v4, "setFetchBatchSize:", 300);
  objc_msgSend(*(id *)(a1 + 40), "persistenceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistenceContextWithOptions:", 2);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 40);
  v32 = 0;
  v26 = (void *)v9;
  objc_msgSend(v10, "_processDeletionRequestWithFetchRequest:context:error:", v4, v9, &v32);
  v11 = v32;
  +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v15);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v12);
  objc_msgSend(v16, "setResultType:", 2);
  v31 = 0;
  objc_msgSend(v3, "executeRequest:error:", v16, &v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v31;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "result");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v34 = v20;
    v35 = 2112;
    v36 = v16;
    v37 = 2112;
    v38 = v21;
    v39 = 2112;
    v40 = v18;
    _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__RTLearnedLocationStore__removePlace_handler___block_invoke_309;
  block[3] = &unk_1E9299040;
  v23 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v29 = v18;
  v30 = v23;
  v28 = v11;
  v24 = v18;
  v25 = v11;
  dispatch_async(v22, block);

}

void __47__RTLearnedLocationStore__removePlace_handler___block_invoke_309(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__RTLearnedLocationStore__removePlace_handler___block_invoke_2;
  v3[3] = &unk_1E929DD30;
  v6 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_removeUnreferencedMapItems:", v3);

}

void __47__RTLearnedLocationStore__removePlace_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (*(_QWORD *)(a1 + 48))
  {
    _RTSafeArray();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v4 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v4, v3);
  }
}

- (void)removePlace:(id)a3 handler:(id)a4
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
  block[2] = __46__RTLearnedLocationStore_removePlace_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __46__RTLearnedLocationStore_removePlace_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removePlace:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removePlacesWithHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  RTLearnedLocationStore *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __51__RTLearnedLocationStore__removePlacesWithHandler___block_invoke;
  v10 = &unk_1E9297A80;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v7);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v6, 0, v5, v7, v8, v9, v10, v11);

}

void __51__RTLearnedLocationStore__removePlacesWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "persistenceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistenceContextWithOptions:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  v8 = 0;
  objc_msgSend(v5, "_processDeletionRequestWithFetchRequest:context:error:", v2, v4, &v8);
  v6 = v8;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);

}

- (void)removePlacesWithHandler:(id)a3
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
  v7[2] = __50__RTLearnedLocationStore_removePlacesWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __50__RTLearnedLocationStore_removePlacesWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removePlacesWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_removeUnreferencedPlacesWithHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  RTLearnedLocationStore *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __63__RTLearnedLocationStore__removeUnreferencedPlacesWithHandler___block_invoke;
  v10 = &unk_1E929B808;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v7);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v6, 0, v5, v7, v8, v9, v10, v11);

}

void __63__RTLearnedLocationStore__removeUnreferencedPlacesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K.%K & %lu) == 0"), CFSTR("mapItem"), CFSTR("mapItemSource"), *MEMORY[0x1E0D185F0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v6);

  v51[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v7);

  objc_msgSend(v4, "setResultType:", 2);
  v47 = 0;
  v40 = v3;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v47);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v47;
  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v9);
    goto LABEL_28;
  }
  v36 = a1;
  v37 = v4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v35 = v8;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (!v12)
    goto LABEL_21;
  v13 = v12;
  v14 = *(_QWORD *)v44;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v44 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v15);
      v17 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(v16, "objectForKey:", CFSTR("identifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v5;
        objc_msgSend(*(id *)(v5 + 2176), "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("placeIdentifier"), v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setPredicate:](v19, "setPredicate:", v21);

        v42 = 0;
        v22 = objc_msgSend(v40, "countForFetchRequest:error:", v19, &v42);
        v23 = v42;
        if (v23)
        {
          v24 = v39;
          v25 = v23;
          goto LABEL_12;
        }
        if (!v22)
        {
          v24 = v38;
          v25 = v18;
LABEL_12:
          objc_msgSend(v24, "addObject:", v25);
        }

        v5 = v20;
        goto LABEL_17;
      }
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v16;
        _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "fetched learned place has nil identifier, %@", buf, 0xCu);
      }
LABEL_17:

      objc_autoreleasePoolPop(v17);
      ++v15;
    }
    while (v13 != v15);
    v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    v13 = v26;
  }
  while (v26);
LABEL_21:

  _RTSafeArray();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v8 = v35;
    v29 = *(_QWORD *)(v36 + 40);
    if (v29)
      (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v28);
  }
  else
  {
    objc_msgSend(*(id *)(v36 + 32), "persistenceManager", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "persistenceContextWithOptions:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = *(void **)(v36 + 32);
    v41 = 0;
    objc_msgSend(v32, "deletePlacesWithinIdentifierSetWithZeroVisits:context:tombstoneContext:error:", v38, v40, v31, &v41);
    v33 = v41;
    v34 = *(_QWORD *)(v36 + 40);
    if (v34)
      (*(void (**)(uint64_t, id))(v34 + 16))(v34, v33);

    v8 = v35;
  }

  v4 = v37;
  v9 = 0;
LABEL_28:

}

- (void)removeUnreferencedPlacesWithHandler:(id)a3
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
  v7[2] = __62__RTLearnedLocationStore_removeUnreferencedPlacesWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __62__RTLearnedLocationStore_removeUnreferencedPlacesWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeUnreferencedPlacesWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_removeVisits:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  RTLearnedLocationStore *v17;
  id v18;
  SEL v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __48__RTLearnedLocationStore__removeVisits_handler___block_invoke;
    v15[3] = &unk_1E92979A0;
    v16 = v7;
    v17 = self;
    v19 = a2;
    v9 = v8;
    v18 = v9;
    v10 = (void *)MEMORY[0x1D8232094](v15);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v10, 0, v9);

    v11 = v16;
LABEL_5:

    goto LABEL_6;
  }
  if (v8)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D18598];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("requires valid visits.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v14);

    goto LABEL_5;
  }
LABEL_6:

}

void __48__RTLearnedLocationStore__removeVisits_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v7);
  }

  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("identifier"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(*(id *)(a1 + 40), "persistenceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "persistenceContextWithOptions:", 2);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = *(void **)(a1 + 40);
  v32 = 0;
  v29 = (void *)v14;
  objc_msgSend(v15, "_processDeletionRequestWithFetchRequest:context:error:", v11, v14, &v32);
  v16 = v32;
  +[RTLearnedLocationOfInterestVisitMO fetchRequest](RTLearnedLocationOfInterestVisitMO, "fetchRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("identifier"), v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPredicate:", v18);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v17);
  objc_msgSend(v19, "setResultType:", 2);
  v30 = v3;
  v31 = 0;
  objc_msgSend(v3, "executeRequest:error:", v19, &v31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v31;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v28 = v11;
    v23 = v16;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "result");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v38 = v24;
    v39 = 2112;
    v40 = v19;
    v41 = 2112;
    v42 = v25;
    v43 = 2112;
    v44 = v21;
    _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

    v16 = v23;
    v11 = v28;
  }

  if (*(_QWORD *)(a1 + 48))
  {
    _RTSafeArray();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v27);
  }

}

- (void)removeVisits:(id)a3 handler:(id)a4
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
  block[2] = __47__RTLearnedLocationStore_removeVisits_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __47__RTLearnedLocationStore_removeVisits_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeVisits:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removeVisitsWithHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  RTLearnedLocationStore *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __51__RTLearnedLocationStore__removeVisitsWithHandler___block_invoke;
  v10 = &unk_1E9297A80;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v7);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v6, 0, v5, v7, v8, v9, v10, v11);

}

void __51__RTLearnedLocationStore__removeVisitsWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "persistenceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistenceContextWithOptions:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  v8 = 0;
  objc_msgSend(v5, "_processDeletionRequestWithFetchRequest:context:error:", v2, v4, &v8);
  v6 = v8;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);

}

- (void)removeVisitsWithHandler:(id)a3
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
  v7[2] = __50__RTLearnedLocationStore_removeVisitsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __50__RTLearnedLocationStore_removeVisitsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeVisitsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_removeTransitionsWithHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  RTLearnedLocationStore *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __56__RTLearnedLocationStore__removeTransitionsWithHandler___block_invoke;
  v10 = &unk_1E9297A80;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v7);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v6, 0, v5, v7, v8, v9, v10, v11);

}

void __56__RTLearnedLocationStore__removeTransitionsWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  +[RTLearnedTransitionMO fetchRequest](RTLearnedTransitionMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "persistenceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistenceContextWithOptions:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  v8 = 0;
  objc_msgSend(v5, "_processDeletionRequestWithFetchRequest:context:error:", v2, v4, &v8);
  v6 = v8;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);

}

- (void)removeTransitionsWithHandler:(id)a3
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
  v7[2] = __55__RTLearnedLocationStore_removeTransitionsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__RTLearnedLocationStore_removeTransitionsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeTransitionsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_removeTransitionsReferencingVisits:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  RTLearnedLocationStore *v17;
  id v18;
  SEL v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__RTLearnedLocationStore__removeTransitionsReferencingVisits_handler___block_invoke;
    v15[3] = &unk_1E92979A0;
    v16 = v7;
    v17 = self;
    v19 = a2;
    v9 = v8;
    v18 = v9;
    v10 = (void *)MEMORY[0x1D8232094](v15);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v10, 0, v9);

    v11 = v16;
LABEL_5:

    goto LABEL_6;
  }
  if (v8)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D18598];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("requires valid visits.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 0, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v14);

    goto LABEL_5;
  }
LABEL_6:

}

void __70__RTLearnedLocationStore__removeTransitionsReferencingVisits_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v41 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v45 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    }
    while (v6);
  }

  +[RTLearnedTransitionMO fetchRequest](RTLearnedTransitionMO, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("origin.identifier"), v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("destination.identifier"), v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "orPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v15);

  objc_msgSend(*(id *)(a1 + 40), "persistenceManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "persistenceContextWithOptions:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(void **)(a1 + 40);
  v43 = 0;
  v40 = v10;
  objc_msgSend(v18, "_processDeletionRequestWithFetchRequest:context:error:", v10, v17, &v43);
  v19 = v43;
  +[RTLearnedLocationOfInterestTransitionMO fetchRequest](RTLearnedLocationOfInterestTransitionMO, "fetchRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("visitIdentifierOrigin"), v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v22;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("visitIdentifierDestination"), v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "orPredicateWithSubpredicates:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPredicate:", v25);

  v39 = v20;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v20);
  objc_msgSend(v26, "setResultType:", 2);
  v42 = 0;
  objc_msgSend(v41, "executeRequest:error:", v26, &v42);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v42;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v38 = v17;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "result");
    v31 = a1;
    v32 = v19;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v49 = v30;
    v50 = 2112;
    v51 = v26;
    v52 = 2112;
    v53 = v33;
    v54 = 2112;
    v55 = v28;
    _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

    v19 = v32;
    a1 = v31;

    v17 = v38;
  }

  if (*(_QWORD *)(a1 + 48))
  {
    _RTSafeArray();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v35 = a1;
    v36 = v19;
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, void *))(*(_QWORD *)(v35 + 48) + 16))(*(_QWORD *)(v35 + 48), v37);
    v19 = v36;
  }

}

- (void)removeTransitionsReferencingVisits:(id)a3 handler:(id)a4
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
  block[2] = __69__RTLearnedLocationStore_removeTransitionsReferencingVisits_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __69__RTLearnedLocationStore_removeTransitionsReferencingVisits_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeTransitionsReferencingVisits:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)createFetchRequestForOverlappingVisits:(id)a3 entityName:(id)a4 entryDatePropertyName:(id)a5 exitDatePropertyName:(id)a6 context:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  const __CFString *v45;
  NSObject *v46;
  NSObject *v47;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  id *v68;
  id obj;
  void *v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[16];
  uint64_t v78;
  const __CFString *v79;
  _QWORD v80[2];
  uint64_t v81;
  const __CFString *v82;
  _BYTE v83[128];
  uint64_t v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = v17;
  if (!a8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_20;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedVisits", buf, 2u);
    }

    v45 = CFSTR("learnedVisits");
    goto LABEL_30;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityName", buf, 2u);
    }

    v45 = CFSTR("entityName");
    goto LABEL_30;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    v45 = CFSTR("context");
LABEL_30:
    _RTErrorInvalidParameterCreate((uint64_t)v45);
    v42 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  objc_msgSend(v17, "persistentStoreCoordinator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "managedObjectModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "entitiesByName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entity, %@, not found in model"), v14);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0D18598];
    v84 = *MEMORY[0x1E0CB2D50];
    v85[0] = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "errorWithDomain:code:userInfo:", v51, 7, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = objc_retainAutorelease(v53);
    *a8 = v54;

LABEL_20:
    v42 = 0;
    goto LABEL_31;
  }
  v68 = a8;
  v71 = v16;
  v72 = v15;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v13;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v74;
    v63 = *MEMORY[0x1E0CB2D50];
    v64 = *MEMORY[0x1E0D18598];
    v66 = v14;
    v67 = v13;
    v65 = v23;
    v70 = v24;
LABEL_8:
    v28 = 0;
    while (1)
    {
      if (*(_QWORD *)v74 != v27)
        objc_enumerationMutation(obj);
      v29 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v28);
      v30 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v29, "entryDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "exitDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "predicateWithFormat:", CFSTR("%K between { %@, %@ }"), v72, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v29, "entryDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "exitDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "predicateWithFormat:", CFSTR("%K between { %@, %@ }"), v71, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33 || !v37)
        break;
      v38 = (void *)MEMORY[0x1E0CB3528];
      v80[0] = v33;
      v80[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "orPredicateWithSubpredicates:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
      {
        v59 = (void *)MEMORY[0x1E0CB35C8];
        v78 = v63;
        v79 = CFSTR("could not construct compound predicate");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "errorWithDomain:code:userInfo:", v64, 0, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = objc_retainAutorelease(v61);
        *v68 = v62;

        v58 = 0;
        goto LABEL_35;
      }
      objc_msgSend(v70, "addObject:", v40);

      if (v26 == ++v28)
      {
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
        v14 = v66;
        v13 = v67;
        v23 = v65;
        v24 = v70;
        if (v26)
          goto LABEL_8;
        goto LABEL_16;
      }
    }
    v55 = (void *)MEMORY[0x1E0CB35C8];
    v81 = v63;
    v82 = CFSTR("could not construct both entry and exit date predicates");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "errorWithDomain:code:userInfo:", v64, 0, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = objc_retainAutorelease(v57);
    *v68 = v58;
LABEL_35:

    v42 = 0;
    v14 = v66;
    v13 = v67;
    v16 = v71;
    v15 = v72;
    v23 = v65;
    v24 = v70;
    goto LABEL_36;
  }
LABEL_16:

  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v24);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPredicate:", v41);

  v42 = v23;
  v16 = v71;
  v15 = v72;
LABEL_36:

LABEL_31:
  return v42;
}

- (id)identifiersForPlacesThatOwnVisitIdentifiers:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  const __CFString *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t buf[8];
  _BYTE v38[128];
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a5)
  {
    if (v7)
    {
      if (v8)
      {
        +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $v, $v.%K IN %@).@count > 0"), CFSTR("visits"), CFSTR("identifier"), v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPredicate:", v11);
        objc_msgSend(v10, "setFetchBatchSize:", 10);
        objc_msgSend(v10, "setReturnsObjectsAsFaults:", 1);
        v39[0] = CFSTR("identifier");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPropertiesToFetch:", v12);

        v36 = 0;
        objc_msgSend(v9, "executeFetchRequest:error:", v10, &v36);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v36;
        v15 = v14;
        if (v14)
        {
          v16 = 0;
          *a5 = objc_retainAutorelease(v14);
        }
        else
        {
          v31 = v11;
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v13, "count"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v30 = v13;
          v21 = v13;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v33 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                objc_msgSend(v26, "identifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                if (v27)
                {
                  objc_msgSend(v26, "identifier");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "addObject:", v28);

                }
                objc_msgSend(v9, "refreshObject:mergeChanges:", v26, 0);
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
            }
            while (v23);
          }

          objc_msgSend(v9, "reset");
          v13 = v30;
          v11 = v31;
          v15 = 0;
        }

        goto LABEL_27;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      v19 = CFSTR("context");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifiers", buf, 2u);
      }

      v19 = CFSTR("visitIdentifiers");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v19);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v16 = 0;
LABEL_27:

  return v16;
}

- (id)fetchVisitIdentifiersUsingFetchRequest:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  _RTMap *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  id v36;
  uint8_t buf[16];
  const __CFString *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_18;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fetchRequest", buf, 2u);
    }

    v21 = CFSTR("fetchRequest");
    goto LABEL_16;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    v21 = CFSTR("context");
LABEL_16:
    _RTErrorInvalidParameterCreate((uint64_t)v21);
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_msgSend(v7, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSManagedObject entityName](RTLearnedVisitMO, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D18598];
    v39 = *MEMORY[0x1E0CB2D50];
    v40[0] = CFSTR("fetchRequest is not for learnedVisitMOs");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 7, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_retainAutorelease(v26);
    *a5 = v27;

LABEL_18:
    v18 = 0;
    goto LABEL_19;
  }
  v13 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v13, "setFetchBatchSize:", 10);
  objc_msgSend(v13, "setReturnsObjectsAsFaults:", 1);
  v38 = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPropertiesToFetch:", v14);

  v36 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v13, &v36);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v36;
  v17 = v16;
  if (v16)
  {
    v18 = 0;
    *a5 = objc_retainAutorelease(v16);
  }
  else
  {
    v29 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v15);
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __79__RTLearnedLocationStore_fetchVisitIdentifiersUsingFetchRequest_context_error___block_invoke;
    v34 = &unk_1E929DD58;
    v30 = v9;
    v35 = v30;
    -[_RTMap withBlock:](v29, "withBlock:", &v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "reset", v31, v32, v33, v34);
  }

LABEL_19:
  return v18;
}

id __79__RTLearnedLocationStore_fetchVisitIdentifiersUsingFetchRequest_context_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "refreshObject:mergeChanges:", v3, 0);

  return v4;
}

- (BOOL)deleteTransitionsReferencingVisitIdentifiers:(id)a3 context:(id)a4 tombstoneContext:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  NSObject *v35;
  NSObject *v36;
  const __CFString *v37;
  NSObject *v38;
  const char *aSelector;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a6)
  {
    if (v11)
    {
      if (v12)
      {
        aSelector = a2;
        +[RTLearnedTransitionMO fetchRequest](RTLearnedTransitionMO, "fetchRequest");
        v41 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTLearnedLocationOfInterestTransitionMO fetchRequest](RTLearnedLocationOfInterestTransitionMO, "fetchRequest");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0CB3528];
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("origin.identifier"), v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v16;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("destination.identifier"), v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "orPredicateWithSubpredicates:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPredicate:", v19);

        v20 = (void *)MEMORY[0x1E0CB3528];
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("visitIdentifierOrigin"), v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v21;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("visitIdentifierDestination"), v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v54[1] = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "orPredicateWithSubpredicates:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setPredicate:", v24);

        v45 = 0;
        v42 = v14;
        v25 = v14;
        v12 = v41;
        -[RTLearnedLocationStore _processDeletionRequestWithFetchRequest:context:error:](self, "_processDeletionRequestWithFetchRequest:context:error:", v25, v13, &v45);
        v26 = v45;
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v43);
        objc_msgSend(v27, "setResultType:", 2);
        v44 = 0;
        objc_msgSend(v41, "executeRequest:error:", v27, &v44);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v44;
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(aSelector);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v47 = v31;
          v48 = 2112;
          v49 = v28;
          v50 = 2112;
          v51 = v26;
          v52 = 2112;
          v53 = v29;
          _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%@, deleted %@ transitions, cloudError, %@, localError, %@", buf, 0x2Au);

        }
        _RTSafeArray();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        _RTMultiErrorCreate();
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = v33 == 0;
        if (v33)
          *a6 = objc_retainAutorelease(v33);

        goto LABEL_19;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      v37 = CFSTR("context");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifiers", buf, 2u);
      }

      v37 = CFSTR("visitIdentifiers");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v37);
    v34 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v34 = 0;
LABEL_19:

  return v34;
}

- (BOOL)deleteVisitsUsingCloudFetchRequest:(id)a3 localFetchRequest:(id)a4 context:(id)a5 tombstoneContext:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  NSObject *v33;
  const __CFString *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v39;
  uint64_t v40;
  void *v41;
  const __CFString **v42;
  uint64_t *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v16;
  if (!a7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_16;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cloudFetchRequest", buf, 2u);
    }

    v34 = CFSTR("cloudFetchRequest");
    goto LABEL_29;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: localFetchRequest", buf, 2u);
    }

    v34 = CFSTR("localFetchRequest");
    goto LABEL_29;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    v34 = CFSTR("context");
    goto LABEL_29;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: tombstoneContext", buf, 2u);
    }

    v34 = CFSTR("tombstoneContext");
LABEL_29:
    _RTErrorInvalidParameterCreate((uint64_t)v34);
    v31 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  objc_msgSend(v13, "entityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSManagedObject entityName](RTLearnedVisitMO, "entityName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19);

  if ((v20 & 1) == 0)
  {
    v39 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0D18598];
    v60 = *MEMORY[0x1E0CB2D50];
    v61[0] = CFSTR("cloud fetch request is not for RTLearnedVisitMOs");
    v41 = (void *)MEMORY[0x1E0C99D80];
    v42 = (const __CFString **)v61;
    v43 = &v60;
LABEL_33:
    objc_msgSend(v41, "dictionaryWithObjects:forKeys:count:", v42, v43, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, 7, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_retainAutorelease(v45);
    *a7 = v46;

LABEL_16:
    v31 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v14, "entityName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSManagedObject entityName](RTLearnedLocationOfInterestVisitMO, "entityName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "isEqual:", v22);

  if ((v23 & 1) == 0)
  {
    v39 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0D18598];
    v58 = *MEMORY[0x1E0CB2D50];
    v59 = CFSTR("local fetch request is not for RTLearnedLocationOfInterestVisitMO");
    v41 = (void *)MEMORY[0x1E0C99D80];
    v42 = &v59;
    v43 = &v58;
    goto LABEL_33;
  }
  v49 = 0;
  -[RTLearnedLocationStore _processDeletionRequestWithFetchRequest:context:error:](self, "_processDeletionRequestWithFetchRequest:context:error:", v13, v17, &v49);
  v24 = v49;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v14);
  objc_msgSend(v25, "setResultType:", 2);
  v48 = 0;
  objc_msgSend(v15, "executeRequest:error:", v25, &v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v48;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v51 = v28;
    v52 = 2112;
    v53 = v47;
    v54 = 2112;
    v55 = v24;
    v56 = 2112;
    v57 = v26;
    _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%@, deleted %@ visits, cloudError, %@, localError, %@", buf, 0x2Au);

  }
  _RTSafeArray();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v30 == 0;
  if (v30)
    *a7 = objc_retainAutorelease(v30);

LABEL_30:
  return v31;
}

- (BOOL)deletePlacesWithinIdentifierSet:(id)a3 tombstoneContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  const __CFString *v22;
  NSObject *v23;
  void *v25;
  id v26;
  uint8_t buf[16];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5)
  {
    if (v8)
    {
      if (v9)
      {
        +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0CB3528];
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("identifier"), v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v12;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %lu"), CFSTR("mapItem.mapItemSource"), 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v28[1] = v13;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %lu"), CFSTR("mapItem.mapItemSource"), 0x20000);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v28[2] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "andPredicateWithSubpredicates:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setPredicate:", v16);

        v26 = 0;
        -[RTLearnedLocationStore _processDeletionRequestWithFetchRequest:context:error:](self, "_processDeletionRequestWithFetchRequest:context:error:", v11, v10, &v26);
        v17 = v26;
        v18 = v17;
        v19 = v17 == 0;
        if (v17)
          *a5 = objc_retainAutorelease(v17);

        goto LABEL_17;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: tombstoneContext", buf, 2u);
      }

      v22 = CFSTR("tombstoneContext");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeIdentifierSet", buf, 2u);
      }

      v22 = CFSTR("placeIdentifierSet");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v22);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v19 = 0;
LABEL_17:

  return v19;
}

- (BOOL)deletePlacesWithinIdentifierSetWithZeroVisits:(id)a3 context:(id)a4 tombstoneContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  const __CFString *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char v34;
  void *v35;
  void *v37;
  void *v38;
  RTLearnedLocationStore *v39;
  void *v40;
  id *v41;
  void *v42;
  id v43;
  void *v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  uint8_t buf[16];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!a6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    v19 = 0;
    goto LABEL_40;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeIdentifierSet", buf, 2u);
    }

    v22 = CFSTR("placeIdentifierSet");
    goto LABEL_19;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    v22 = CFSTR("context");
    goto LABEL_19;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: tombstoneContext", buf, 2u);
    }

    v22 = CFSTR("tombstoneContext");
LABEL_19:
    _RTErrorInvalidParameterCreate((uint64_t)v22);
    v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("identifier"), v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v15);
  objc_msgSend(v14, "setReturnsObjectsAsFaults:", 0);
  v56 = 0;
  objc_msgSend(v14, "execute:", &v56);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v56;
  v18 = v17;
  if (v17)
  {
    v19 = 0;
    *a6 = objc_retainAutorelease(v17);
    goto LABEL_39;
  }
  v38 = v15;
  v39 = self;
  v40 = v14;
  v41 = a6;
  v42 = v13;
  v43 = v10;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v37 = v16;
  obj = v16;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (!v47)
    goto LABEL_38;
  v46 = *(_QWORD *)v53;
  do
  {
    for (i = 0; i != v47; ++i)
    {
      if (*(_QWORD *)v53 != v46)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      v27 = (void *)MEMORY[0x1D8231EA8]();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v26, "visits");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v49;
LABEL_27:
        v32 = 0;
        while (1)
        {
          if (*(_QWORD *)v49 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v32);
          v34 = objc_msgSend(v33, "flags");
          objc_msgSend(v11, "refreshObject:mergeChanges:", v33, 0);
          if ((v34 & 1) == 0)
            break;
          if (v30 == ++v32)
          {
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
            if (v30)
              goto LABEL_27;
            goto LABEL_33;
          }
        }
      }
      else
      {
LABEL_33:

        objc_msgSend(v26, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v35)
          goto LABEL_36;
        objc_msgSend(v26, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v28);
      }

LABEL_36:
      objc_msgSend(v11, "refreshObject:mergeChanges:", v26, 0);
      objc_autoreleasePoolPop(v27);
    }
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  }
  while (v47);
LABEL_38:

  objc_msgSend(v11, "reset");
  v13 = v42;
  v19 = -[RTLearnedLocationStore deletePlacesWithinIdentifierSet:tombstoneContext:error:](v39, "deletePlacesWithinIdentifierSet:tombstoneContext:error:", v44, v42, v41);

  v10 = v43;
  v14 = v40;
  v16 = v37;
  v15 = v38;
  v18 = 0;
LABEL_39:

LABEL_40:
  return v19;
}

- (void)_removeOverlappingVisitsAndTransitionsForVisits:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    if (objc_msgSend(v7, "count"))
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __82__RTLearnedLocationStore__removeOverlappingVisitsAndTransitionsForVisits_handler___block_invoke;
      v16[3] = &unk_1E92979A0;
      v16[4] = self;
      v17 = v7;
      v10 = v9;
      v18 = v10;
      v19 = a2;
      v11 = (void *)MEMORY[0x1D8232094](v16);
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 0, v10);

    }
    else if (v9)
    {
      v9[2](v9, 0);
    }
  }
  else if (v8)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D18598];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("learnedVisits cannot be nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *))v9)[2](v9, v15);
  }

}

void __82__RTLearnedLocationStore__removeOverlappingVisitsAndTransitionsForVisits_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  +[RTLearnedVisitMO entity](RTLearnedVisitMO, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  objc_msgSend(v4, "createFetchRequestForOverlappingVisits:entityName:entryDatePropertyName:exitDatePropertyName:context:error:", v5, v7, CFSTR("entryDate"), CFSTR("exitDate"), v3, &v59);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v59;

  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  +[RTLearnedLocationOfInterestVisitMO entity](RTLearnedLocationOfInterestVisitMO, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  objc_msgSend(v10, "createFetchRequestForOverlappingVisits:entityName:entryDatePropertyName:exitDatePropertyName:context:error:", v11, v13, CFSTR("entryDate"), CFSTR("exitDate"), v3, &v58);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v58;

  _RTSafeArray();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = *(_QWORD *)(a1 + 48);
    if (v18)
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v17);
  }
  else
  {
    v19 = *(void **)(a1 + 32);
    v57 = 0;
    objc_msgSend(v19, "fetchVisitIdentifiersUsingFetchRequest:context:error:", v8, v3, &v57, v15, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v57;
    if (v21)
    {
      v22 = *(_QWORD *)(a1 + 48);
      if (v22)
        (*(void (**)(uint64_t, id))(v22 + 16))(v22, v21);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v23 = objc_claimAutoreleasedReturnValue();
      v50 = v20;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");
        *(_DWORD *)buf = 138412546;
        v61 = v24;
        v62 = 2048;
        v63 = v26;
        _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "%@, overlapping visits count, %lu", buf, 0x16u);

        v20 = v50;
      }

      v27 = *(void **)(a1 + 32);
      v56 = 0;
      objc_msgSend(v27, "identifiersForPlacesThatOwnVisitIdentifiers:context:error:", v20, v3, &v56);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v56;
      if (v28)
      {
        v29 = *(_QWORD *)(a1 + 48);
        if (v29)
          (*(void (**)(uint64_t, id))(v29 + 16))(v29, v28);
      }
      v49 = v28;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v51, "count");
        *(_DWORD *)buf = 138412546;
        v61 = v31;
        v62 = 2048;
        v63 = v32;
        _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%@, places count, %lu", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "persistenceManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "persistenceContextWithOptions:", 2);
      v34 = objc_claimAutoreleasedReturnValue();

      v35 = *(void **)(a1 + 32);
      v55 = 0;
      objc_msgSend(v35, "deleteTransitionsReferencingVisitIdentifiers:context:tombstoneContext:error:", v20, v3, v34, &v55);
      v36 = v55;
      v37 = *(void **)(a1 + 32);
      v54 = 0;
      objc_msgSend(v37, "deleteVisitsUsingCloudFetchRequest:localFetchRequest:context:tombstoneContext:error:", v8, v14, v3, v34, &v54);
      v38 = v54;
      v39 = *(void **)(a1 + 32);
      v53 = 0;
      v48 = (void *)v34;
      objc_msgSend(v39, "deletePlacesWithinIdentifierSetWithZeroVisits:context:tombstoneContext:error:", v51, v3, v34, &v53);
      v40 = v53;
      v52 = 0;
      objc_msgSend(v3, "save:", &v52);
      v45 = v52;
      v46 = v38;
      v47 = v36;
      _RTSafeArray();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = *(_QWORD *)(a1 + 48);
      if (v42)
      {
        if (v44)
          (*(void (**)(uint64_t, void *, uint64_t))(v44 + 16))(v44, v42, v43);
      }
      else if (v44)
      {
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v44 + 16))(v44, 0, v43);
      }

      v21 = 0;
      v20 = v50;
    }

  }
}

- (void)removeOverlappingVisitsAndTransitionsForVisits:(id)a3 handler:(id)a4
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
  block[2] = __81__RTLearnedLocationStore_removeOverlappingVisitsAndTransitionsForVisits_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __81__RTLearnedLocationStore_removeOverlappingVisitsAndTransitionsForVisits_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeOverlappingVisitsAndTransitionsForVisits:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removeVisitWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD, _QWORD);
  _QWORD v18[4];
  id v19;
  RTLearnedLocationStore *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __61__RTLearnedLocationStore__removeVisitWithIdentifier_handler___block_invoke;
    v18[3] = &unk_1E929DD80;
    v19 = v6;
    v10 = v8;
    v20 = self;
    v21 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v18);
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __61__RTLearnedLocationStore__removeVisitWithIdentifier_handler___block_invoke_3;
    v16[3] = &unk_1E9297568;
    v17 = v10;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v16);

    v12 = v19;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18598];
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("identifier cannot be nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 7, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v15);

    goto LABEL_5;
  }
LABEL_6:

}

void __61__RTLearnedLocationStore__removeVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  +[RTLearnedLocationOfInterestVisitMO fetchRequest](RTLearnedLocationOfInterestVisitMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setFetchLimit:", 1);
  v24 = 0;
  objc_msgSend(v2, "execute:", &v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (v6)
    {
      +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
      {
        v10 = *(void **)(a1 + 40);
        v25 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __61__RTLearnedLocationStore__removeVisitWithIdentifier_handler___block_invoke_2;
        v22[3] = &unk_1E9297568;
        v23 = *(id *)(a1 + 48);
        objc_msgSend(v10, "removeOverlappingVisitsAndTransitionsForVisits:handler:", v11, v22);

        v12 = v23;
LABEL_11:

        goto LABEL_12;
      }
      v18 = *(_QWORD *)(a1 + 48);
      if (v18)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v20 = *MEMORY[0x1E0D18598];
        v26 = *MEMORY[0x1E0CB2D50];
        v27 = CFSTR("visit could not be created from managed object");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 0, v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v21);

        goto LABEL_11;
      }
    }
    else
    {
      if (!*(_QWORD *)(a1 + 48))
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("visit with identifier, %@, not found"), *(_QWORD *)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0D18598];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v17);

    }
LABEL_12:

    goto LABEL_13;
  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
LABEL_13:

}

uint64_t __61__RTLearnedLocationStore__removeVisitWithIdentifier_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__RTLearnedLocationStore__removeVisitWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  block[2] = __60__RTLearnedLocationStore_removeVisitWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __60__RTLearnedLocationStore_removeVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeVisitWithIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)identifiersForPlacesThatDedupeToPlace:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  const __CFString *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id obja;
  id obj;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63[4];
  _BYTE v64[128];
  _QWORD v65[4];
  _BYTE buf[12];
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v58 = a4;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_10;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", buf, 2u);
    }

    v32 = CFSTR("place");
    goto LABEL_17;
  }
  if (!v58)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    v32 = CFSTR("context");
LABEL_17:
    _RTErrorInvalidParameterCreate((uint64_t)v32);
    v55 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  objc_msgSend(v8, "mapItem");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v34 = objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v35;
      v67 = 2112;
      v68 = v9;
      _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "%@, found place with nil mapItem, %@", buf, 0x16u);

    }
LABEL_10:
    v55 = 0;
    goto LABEL_35;
  }
  +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  objc_msgSend(v9, "mapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "latitude");
  v53 = v9;
  objc_msgSend(v9, "mapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "longitude");
  RTCommonCalculateBoundingBox();

  v50 = (void *)MEMORY[0x1E0CB3528];
  v15 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  obja = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateWithFormat:", CFSTR("%@ <= %K"), obja, CFSTR("longitude"));
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v65[0] = v54;
  v16 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("longitude"), v51);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v17;
  v18 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "predicateWithFormat:", CFSTR("%@ <= %K"), v19, CFSTR("latitude"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v20;
  v21 = (void *)MEMORY[0x1E0CB3880];
  v22 = v52;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("latitude"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v65[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "andPredicateWithSubpredicates:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setPredicate:", v26);

  memset(v63, 0, sizeof(v63));
  objc_msgSend(v52, "execute:", v63);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v63[0];
  v29 = v28;
  if (v28)
  {
    v55 = 0;
    *a5 = objc_retainAutorelease(v28);
    v8 = v53;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v27;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    v8 = v53;
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v60 != v38)
            objc_enumerationMutation(obj);
          v40 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          v41 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0D183E8], "createWithManagedObject:", v40);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            objc_msgSend(v8, "mapItem");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v42, "isEqualToMapItem:", v43);

            if (v44)
            {
              objc_msgSend(v40, "place");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "identifier");
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (v46)
              {
                objc_msgSend(v40, "place");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "identifier");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "addObject:", v48);

                v8 = v53;
              }

            }
          }
          objc_msgSend(v58, "refreshObject:mergeChanges:", v40, 0);

          objc_autoreleasePoolPop(v41);
        }
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v37);
    }

    objc_msgSend(v58, "reset");
    v22 = v52;
    v29 = 0;
  }

LABEL_35:
  return v55;
}

- (void)_removePlacesForLocationOfInterest:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__RTLearnedLocationStore__removePlacesForLocationOfInterest_handler___block_invoke;
    v16[3] = &unk_1E92979A0;
    v16[4] = self;
    v17 = v7;
    v10 = v9;
    v18 = v10;
    v19 = a2;
    v11 = (void *)MEMORY[0x1D8232094](v16);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 0, v10);

  }
  else if (v8)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D18598];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("locationOfInterest cannot be nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v15);

  }
}

void __69__RTLearnedLocationStore__removePlacesForLocationOfInterest_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "place");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend(v4, "identifiersForPlacesThatDedupeToPlace:context:error:", v5, v3, &v56);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v56;

  if (v7 || !objc_msgSend(v6, "count"))
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v7);
  }
  else
  {
    +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("place.identifier"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v10);

    v11 = *(void **)(a1 + 32);
    v55 = 0;
    objc_msgSend(v11, "fetchVisitIdentifiersUsingFetchRequest:context:error:", v9, v3, &v55);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v55;
    if (v13)
    {
      v14 = *(_QWORD *)(a1 + 48);
      if (v14)
        (*(void (**)(uint64_t, id))(v14 + 16))(v14, v13);
    }
    else
    {
      +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("identifier"), v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPredicate:", v16);

      +[RTLearnedLocationOfInterestVisitMO fetchRequest](RTLearnedLocationOfInterestVisitMO, "fetchRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("identifier"), v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPredicate:", v18);

      objc_msgSend(*(id *)(a1 + 32), "persistenceManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "persistenceContextWithOptions:", 2);
      v20 = objc_claimAutoreleasedReturnValue();

      v21 = *(void **)(a1 + 32);
      v54 = 0;
      v47 = v12;
      objc_msgSend(v21, "deleteTransitionsReferencingVisitIdentifiers:context:tombstoneContext:error:", v12, v3, v20, &v54);
      v49 = v54;
      v22 = *(void **)(a1 + 32);
      v53 = 0;
      v45 = v17;
      v46 = v15;
      objc_msgSend(v22, "deleteVisitsUsingCloudFetchRequest:localFetchRequest:context:tombstoneContext:error:", v15, v17, v3, v20, &v53);
      v48 = v53;
      v23 = *(void **)(a1 + 32);
      v52 = 0;
      v44 = (void *)v20;
      objc_msgSend(v23, "deletePlacesWithinIdentifierSet:tombstoneContext:error:", v6, v20, &v52);
      v24 = v52;
      +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPredicate:", v28);

      v51 = 0;
      v43 = v25;
      objc_msgSend(v25, "execute:", &v51);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v51;
      objc_msgSend(v29, "firstObject");
      v31 = objc_claimAutoreleasedReturnValue();

      if (v31)
        objc_msgSend(v3, "deleteObject:", v31);
      v41 = (void *)v31;
      v42 = v9;
      v50 = 0;
      objc_msgSend(v3, "save:", &v50);
      v32 = v50;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v58 = v34;
        v59 = 2112;
        v60 = v24;
        v61 = 2112;
        v62 = v30;
        v63 = 2112;
        v64 = v32;
        _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "%@, deleted places error, %@, loi fetch error, %@, save error, %@", buf, 0x2Au);

      }
      v35 = v30;
      v36 = v24;
      _RTSafeArray();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = *(_QWORD *)(a1 + 48);
      v13 = 0;
      if (v38)
      {
        v40 = v41;
        if (v39)
          (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v38);
      }
      else
      {
        (*(void (**)(uint64_t, _QWORD))(v39 + 16))(v39, 0);
        v40 = v41;
      }

      v12 = v47;
      v9 = v42;
    }

  }
}

- (void)removePlacesForLocationOfInterest:(id)a3 handler:(id)a4
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
  block[2] = __68__RTLearnedLocationStore_removePlacesForLocationOfInterest_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __68__RTLearnedLocationStore_removePlacesForLocationOfInterest_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removePlacesForLocationOfInterest:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  RTLearnedLocationStore *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__RTLearnedLocationStore__removeLocationOfInterestWithIdentifier_handler___block_invoke;
    v13[3] = &unk_1E929DDA8;
    v16 = v7;
    v14 = v6;
    v15 = self;
    -[RTLearnedLocationStore fetchLocationOfInterestWithIdentifier:handler:](self, "fetchLocationOfInterestWithIdentifier:handler:", v14, v13);

    v9 = v16;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D18598];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("identiifer cannot be nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 7, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *))v8)[2](v8, v9);
    goto LABEL_5;
  }
LABEL_6:

}

void __74__RTLearnedLocationStore__removeLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
  else if (v5)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v5, "visits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__RTLearnedLocationStore__removeLocationOfInterestWithIdentifier_handler___block_invoke_2;
    v18[3] = &unk_1E929B2D0;
    v18[4] = *(_QWORD *)(a1 + 40);
    v19 = v5;
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v8, "removeOverlappingVisitsAndTransitionsForVisits:handler:", v9, v18);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 48);
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D18598];
    v21 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("cannot find a location of interest with identifier, %@."), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v17);

  }
}

void __74__RTLearnedLocationStore__removeLocationOfInterestWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__RTLearnedLocationStore__removeLocationOfInterestWithIdentifier_handler___block_invoke_3;
  v7[3] = &unk_1E9299358;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v4, "removePlacesForLocationOfInterest:handler:", v5, v7);

}

void __74__RTLearnedLocationStore__removeLocationOfInterestWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  _RTSafeArray();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);
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
  block[2] = __73__RTLearnedLocationStore_removeLocationOfInterestWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __73__RTLearnedLocationStore_removeLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeLocationOfInterestWithIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removeLocationsOfInterestWithHandler:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  SEL v13;

  v5 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __64__RTLearnedLocationStore__removeLocationsOfInterestWithHandler___block_invoke;
  v11 = &unk_1E929DC08;
  v12 = v5;
  v13 = a2;
  v6 = v5;
  v7 = (void *)MEMORY[0x1D8232094](&v8);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v7, 0, v6, v8, v9, v10, v11);

}

void __64__RTLearnedLocationStore__removeLocationsOfInterestWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v4);
  objc_msgSend(v5, "setResultType:", 2);
  v17 = 0;
  objc_msgSend(v3, "executeRequest:error:", v5, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v19 = v9;
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

  }
  v16 = 0;
  v11 = objc_msgSend(v3, "save:", &v16);
  v12 = v16;
  if ((v11 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v15;
      v20 = 2112;
      v21 = v12;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
  }
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v7);

}

- (void)_removeRecordsExpiredBeforeDate:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  RTLearnedLocationStore *v17;
  id v18;
  SEL v19;

  v7 = a3;
  v8 = a4;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __66__RTLearnedLocationStore__removeRecordsExpiredBeforeDate_handler___block_invoke;
  v15 = &unk_1E92979A0;
  v16 = v7;
  v17 = self;
  v18 = v8;
  v19 = a2;
  v9 = v8;
  v10 = v7;
  v11 = (void *)MEMORY[0x1D8232094](&v12);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 0, v9, v12, v13, v14, v15);

}

void __66__RTLearnedLocationStore__removeRecordsExpiredBeforeDate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, removing expired records with respect to date, %@", buf, 0x16u);

  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
  v13 = 0;
  objc_msgSend(v8, "removeExpiredRecordsBeforeDate:context:error:", v7, v3, &v13);

  v9 = v13;
  objc_msgSend(*(id *)(a1 + 40), "mirroringManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__RTLearnedLocationStore__removeRecordsExpiredBeforeDate_handler___block_invoke_371;
  v12[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v12[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v10, "performExportWithHandler:", v12);

  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);

}

void __66__RTLearnedLocationStore__removeRecordsExpiredBeforeDate_handler___block_invoke_371(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, successfully finished export with error, %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)removeRecordsExpiredBeforeDate:(id)a3 handler:(id)a4
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
  block[2] = __65__RTLearnedLocationStore_removeRecordsExpiredBeforeDate_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __65__RTLearnedLocationStore_removeRecordsExpiredBeforeDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeRecordsExpiredBeforeDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_clearWithHandler:(id)a3
{
  id v4;
  dispatch_group_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  dispatch_group_t v19;

  v4 = a3;
  v5 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__RTLearnedLocationStore__clearWithHandler___block_invoke;
  v17[3] = &unk_1E929DDD0;
  v17[4] = self;
  v8 = v6;
  v18 = v8;
  v19 = v5;
  v9 = v5;
  v10 = (void *)MEMORY[0x1D8232094](v17);
  dispatch_group_enter(v9);
  -[RTLearnedLocationStore _removePlacesWithHandler:](self, "_removePlacesWithHandler:", v10);
  dispatch_group_enter(v9);
  -[RTLearnedLocationStore _removeVisitsWithHandler:](self, "_removeVisitsWithHandler:", v10);
  dispatch_group_enter(v9);
  -[RTLearnedLocationStore _removeTransitionsWithHandler:](self, "_removeTransitionsWithHandler:", v10);
  dispatch_group_enter(v9);
  -[RTLearnedLocationStore _removeLocationsOfInterestWithHandler:](self, "_removeLocationsOfInterestWithHandler:", v10);
  dispatch_group_enter(v9);
  -[RTLearnedLocationStore _removeAllMapItems:](self, "_removeAllMapItems:", v10);
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __44__RTLearnedLocationStore__clearWithHandler___block_invoke_3;
  block[3] = &unk_1E9297650;
  v15 = v8;
  v16 = v4;
  v12 = v4;
  v13 = v8;
  dispatch_group_notify(v9, v11, block);

}

void __44__RTLearnedLocationStore__clearWithHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(a1[4], "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__RTLearnedLocationStore__clearWithHandler___block_invoke_2;
    block[3] = &unk_1E9299D78;
    v6 = a1[5];
    v7 = v3;
    v8 = a1[6];
    dispatch_async(v4, block);

  }
  else
  {
    dispatch_group_leave((dispatch_group_t)a1[6]);
  }

}

void __44__RTLearnedLocationStore__clearWithHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __44__RTLearnedLocationStore__clearWithHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "setObject:forKey:", CFSTR("failed clearing learned locations"), *MEMORY[0x1E0CB2D50]);
    v7 = 1;
    _RTSafeArray();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x1E0CB3388], 1);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v2, v7);
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)v8;
  if (v5)
  {
    (*(void (**)(void))(v5 + 16))();
    v6 = (void *)v8;
  }

}

- (void)clearWithHandler:(id)a3
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
  v7[2] = __43__RTLearnedLocationStore_clearWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __43__RTLearnedLocationStore_clearWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)removeUnreferencedMapItems:(id)a3
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
  v7[2] = __53__RTLearnedLocationStore_removeUnreferencedMapItems___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__RTLearnedLocationStore_removeUnreferencedMapItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeUnreferencedMapItems:", *(_QWORD *)(a1 + 40));
}

- (void)_removeUnreferencedMapItems:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke;
  v6[3] = &unk_1E9297AA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[RTLearnedLocationStore __removeUnreferencedMapItems:](self, "__removeUnreferencedMapItems:", v6);

}

void __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_2;
    block[3] = &unk_1E9296F70;
    v6 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = 0;
    v9 = v6;
    dispatch_async(v5, block);

  }
}

void __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_2(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__69;
  v23[4] = __Block_byref_object_dispose__69;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__69;
  v21[4] = __Block_byref_object_dispose__69;
  v22 = 0;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_3;
  v17[3] = &unk_1E92970D8;
  v20 = v23;
  v4 = a1[4];
  v18 = a1[5];
  v5 = v2;
  v19 = v5;
  objc_msgSend(v4, "__removeUnreferencedExtendedAttributes:", v17);
  dispatch_group_enter(v5);
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_4;
  v13[3] = &unk_1E92970D8;
  v16 = v21;
  v6 = a1[4];
  v14 = a1[5];
  v7 = v5;
  v15 = v7;
  objc_msgSend(v6, "__removeUnreferencedAddresses:", v13);
  objc_msgSend(a1[4], "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_5;
  block[3] = &unk_1E929DDF8;
  v10 = a1[6];
  v11 = v23;
  v12 = v21;
  dispatch_group_notify(v7, v8, block);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

}

void __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    _RTSafeArray();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v3 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3);
  }
}

- (void)__removeUnreferencedAddresses:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__RTLearnedLocationStore___removeUnreferencedAddresses___block_invoke;
  v8[3] = &unk_1E9297A08;
  v9 = v5;
  v10 = a2;
  v8[4] = self;
  v6 = v5;
  v7 = (void *)MEMORY[0x1D8232094](v8);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v7, 0, v6);

}

void __56__RTLearnedLocationStore___removeUnreferencedAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void (*v17)(void);
  uint64_t v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTAddressMO fetchRequest](RTAddressMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("mapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  v29[0] = v5;
  objc_msgSend(*(id *)(a1 + 32), "predicateForObjectsFromCurrentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v4);
  objc_msgSend(v10, "setResultType:", 2);
  v20 = 0;
  objc_msgSend(v3, "executeRequest:error:", v10, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v20;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = v14;
    v23 = 2112;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

  }
  if (v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v19;
      v23 = 2112;
      v24 = v12;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
    {
      v17 = *(void (**)(void))(v16 + 16);
LABEL_10:
      v17();
    }
  }
  else
  {
    v18 = *(_QWORD *)(a1 + 40);
    if (v18)
    {
      v17 = *(void (**)(void))(v18 + 16);
      goto LABEL_10;
    }
  }

}

- (void)__removeUnreferencedExtendedAttributes:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  SEL v13;

  v5 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __65__RTLearnedLocationStore___removeUnreferencedExtendedAttributes___block_invoke;
  v11 = &unk_1E929DC08;
  v12 = v5;
  v13 = a2;
  v6 = v5;
  v7 = (void *)MEMORY[0x1D8232094](&v8);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v7, 0, v6, v8, v9, v10, v11);

}

void __65__RTLearnedLocationStore___removeUnreferencedExtendedAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  id v76;
  uint64_t v77;
  _BYTE v78[128];
  const __CFString *v79;
  _BYTE v80[128];
  _QWORD v81[4];

  v81[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResultType:", 2);
  v81[0] = CFSTR("extendedAttributesIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPropertiesToFetch:", v6);

  v68 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v5, &v68);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v68;
  if (!v8)
  {
    v57 = a1;
    objc_msgSend(v4, "removeAllObjects");
    v67 = 0u;
    v65 = 0u;
    v66 = 0u;
    v64 = 0u;
    v56 = v7;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v65 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "allValues");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
      }
      while (v14);
    }

    +[RTMapItemExtendedAttributesMO fetchRequest](RTMapItemExtendedAttributesMO, "fetchRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setResultType:", 2);
    v79 = CFSTR("identifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPropertiesToFetch:", v19);

    v63 = 0;
    objc_msgSend(v3, "executeFetchRequest:error:", v18, &v63);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v63;
    if (v9)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(v57 + 40));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v70 = v46;
        v71 = 2112;
        v72 = v9;
        _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v22 = *(_QWORD *)(v57 + 32);
      if (v22)
        (*(void (**)(uint64_t, id))(v22 + 16))(v22, v9);
      v7 = v56;
      goto LABEL_40;
    }
    v55 = v3;
    v23 = (void *)objc_opt_new();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v54 = v20;
    v24 = v20;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v60 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "allValues");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObjectsFromArray:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
      }
      while (v26);
    }

    objc_msgSend(v23, "minusSet:", v4);
    if (objc_msgSend(v23, "count"))
    {
      +[RTMapItemExtendedAttributesMO fetchRequest](RTMapItemExtendedAttributesMO, "fetchRequest");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K IN (%@))"), CFSTR("identifier"), v23);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0CB3528];
      v52 = (void *)v31;
      v77 = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "andPredicateWithSubpredicates:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setPredicate:", v34);

      v53 = v30;
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v30);
      objc_msgSend(v35, "setResultType:", 2);
      v58 = 0;
      v3 = v55;
      objc_msgSend(v55, "executeRequest:error:", v35, &v58);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v58;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v38 = objc_claimAutoreleasedReturnValue();
      v7 = v56;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(v57 + 40));
        v50 = v35;
        v39 = v37;
        v40 = v36;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v70 = v41;
        v71 = 2112;
        v72 = v50;
        v73 = 2112;
        v74 = v40;
        v75 = 2112;
        v76 = v39;
        _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

        v36 = v40;
        v37 = v39;
        v35 = v50;
      }

      if (v37)
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(v57 + 40));
          v51 = v35;
          v47 = v37;
          v48 = v36;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v70 = v49;
          v71 = 2112;
          v72 = v47;
          _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          v36 = v48;
          v37 = v47;
          v35 = v51;
        }

        v43 = *(_QWORD *)(v57 + 32);
        if (v43)
          (*(void (**)(uint64_t, id))(v43 + 16))(v43, v37);

        v18 = v53;
        v20 = v54;
LABEL_39:

LABEL_40:
        goto LABEL_41;
      }

      v18 = v53;
    }
    else
    {
      v3 = v55;
      v7 = v56;
    }
    v45 = *(_QWORD *)(v57 + 32);
    v20 = v54;
    if (v45)
      (*(void (**)(uint64_t, _QWORD))(v45 + 16))(v45, 0);
    goto LABEL_39;
  }
  v9 = v8;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v70 = v44;
    v71 = 2112;
    v72 = v9;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
LABEL_41:

}

- (void)__removeUnreferencedMapItems:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  SEL v41;
  _QWORD v42[5];
  id v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  SEL v49;
  _QWORD v50[4];
  NSObject *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD v54[4];
  NSObject *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD v58[4];
  NSObject *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD v62[4];
  NSObject *v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD v66[4];
  NSObject *v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD v70[5];
  id v71;
  _QWORD v72[5];
  id v73;
  _QWORD v74[5];
  id v75;
  _QWORD v76[5];
  id v77;
  _QWORD v78[5];
  id v79;
  _QWORD v80[5];
  id v81;
  _QWORD v82[5];
  id v83;
  _QWORD v84[5];
  id v85;
  _QWORD v86[5];
  id v87;
  _QWORD v88[5];
  id v89;
  const __CFString *v90;
  const __CFString *v91;
  _QWORD v92[2];
  const __CFString *v93;
  _QWORD v94[3];

  v94[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = dispatch_group_create();
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x3032000000;
  v88[3] = __Block_byref_object_copy__69;
  v88[4] = __Block_byref_object_dispose__69;
  v89 = 0;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x3032000000;
  v86[3] = __Block_byref_object_copy__69;
  v86[4] = __Block_byref_object_dispose__69;
  v87 = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x3032000000;
  v84[3] = __Block_byref_object_copy__69;
  v84[4] = __Block_byref_object_dispose__69;
  v85 = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x3032000000;
  v82[3] = __Block_byref_object_copy__69;
  v82[4] = __Block_byref_object_dispose__69;
  v83 = 0;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x3032000000;
  v80[3] = __Block_byref_object_copy__69;
  v80[4] = __Block_byref_object_dispose__69;
  v81 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = __Block_byref_object_copy__69;
  v78[4] = __Block_byref_object_dispose__69;
  v79 = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = __Block_byref_object_copy__69;
  v76[4] = __Block_byref_object_dispose__69;
  v77 = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__69;
  v74[4] = __Block_byref_object_dispose__69;
  v75 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__69;
  v72[4] = __Block_byref_object_dispose__69;
  v73 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = __Block_byref_object_copy__69;
  v70[4] = __Block_byref_object_dispose__69;
  v71 = 0;
  dispatch_group_enter(v6);
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = CFSTR("placeMapItemIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke;
  v66[3] = &unk_1E9296EE0;
  v68 = v78;
  v69 = v88;
  v11 = v6;
  v67 = v11;
  -[RTLearnedLocationStore _fetchEntityAsDictionaryWithEntityName:propertiesToFetch:handler:](self, "_fetchEntityAsDictionaryWithEntityName:propertiesToFetch:handler:", v8, v9, v66);

  dispatch_group_enter(v11);
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = CFSTR("mapItemIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v10;
  v62[1] = 3221225472;
  v62[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_2;
  v62[3] = &unk_1E9296EE0;
  v64 = v76;
  v65 = v86;
  v15 = v11;
  v63 = v15;
  -[RTLearnedLocationStore _fetchEntityAsDictionaryWithEntityName:propertiesToFetch:handler:](self, "_fetchEntityAsDictionaryWithEntityName:propertiesToFetch:handler:", v13, v14, v62);

  dispatch_group_enter(v15);
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = CFSTR("placeInferenceMapItemIdentifier");
  v92[1] = CFSTR("placeInferenceFinerGranularityMapItemIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v10;
  v58[1] = 3221225472;
  v58[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_3;
  v58[3] = &unk_1E9296EE0;
  v60 = v74;
  v61 = v84;
  v19 = v15;
  v59 = v19;
  -[RTLearnedLocationStore _fetchEntityAsDictionaryWithEntityName:propertiesToFetch:handler:](self, "_fetchEntityAsDictionaryWithEntityName:propertiesToFetch:handler:", v17, v18, v58);

  dispatch_group_enter(v19);
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = CFSTR("mapItemIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v10;
  v54[1] = 3221225472;
  v54[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_4;
  v54[3] = &unk_1E9296EE0;
  v56 = v72;
  v57 = v82;
  v23 = v19;
  v55 = v23;
  -[RTLearnedLocationStore _fetchEntityAsDictionaryWithEntityName:propertiesToFetch:handler:](self, "_fetchEntityAsDictionaryWithEntityName:propertiesToFetch:handler:", v21, v22, v54);

  dispatch_group_enter(v23);
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = CFSTR("finerGranularityMapItemIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v10;
  v50[1] = 3221225472;
  v50[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_5;
  v50[3] = &unk_1E9296EE0;
  v52 = v70;
  v53 = v80;
  v27 = v23;
  v51 = v27;
  -[RTLearnedLocationStore _fetchEntityAsDictionaryWithEntityName:propertiesToFetch:handler:](self, "_fetchEntityAsDictionaryWithEntityName:propertiesToFetch:handler:", v25, v26, v50);

  v42[0] = v10;
  v42[1] = 3221225472;
  v42[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_6;
  v42[3] = &unk_1E929DE20;
  v45 = v76;
  v46 = v74;
  v47 = v72;
  v48 = v70;
  v44 = v78;
  v42[4] = self;
  v49 = a2;
  v28 = v5;
  v43 = v28;
  v29 = (void *)MEMORY[0x1D8232094](v42);
  -[RTNotifier queue](self, "queue");
  v30 = objc_claimAutoreleasedReturnValue();
  v33[0] = v10;
  v33[1] = 3221225472;
  v33[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_396;
  v33[3] = &unk_1E929DE48;
  v37 = v86;
  v38 = v84;
  v39 = v82;
  v40 = v80;
  v41 = a2;
  v33[4] = self;
  v34 = v28;
  v35 = v29;
  v36 = v88;
  v31 = v29;
  v32 = v28;
  dispatch_group_notify(v27, v30, v33);

  _Block_object_dispose(v70, 8);
  _Block_object_dispose(v72, 8);

  _Block_object_dispose(v74, 8);
  _Block_object_dispose(v76, 8);

  _Block_object_dispose(v78, 8);
  _Block_object_dispose(v80, 8);

  _Block_object_dispose(v82, 8);
  _Block_object_dispose(v84, 8);

  _Block_object_dispose(v86, 8);
  _Block_object_dispose(v88, 8);

}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke(uint64_t a1, void *a2, void *a3)
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

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_3(uint64_t a1, void *a2, void *a3)
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

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_4(uint64_t a1, void *a2, void *a3)
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

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_5(uint64_t a1, void *a2, void *a3)
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

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void (*v46)(void);
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  id v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  uint64_t v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v50 = a2;
  +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL"), CFSTR("place"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v70 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "allValues");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
    }
    while (v8);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v12 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v66 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "allValues");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
    }
    while (v14);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v18 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v83, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v62 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * k), "allValues");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v83, 16);
    }
    while (v20);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v24 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v57, v82, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v58;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v58 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * m), "allValues");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v57, v82, 16);
    }
    while (v26);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v30 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v81, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v54;
    do
    {
      for (n = 0; n != v32; ++n)
      {
        if (*(_QWORD *)v54 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * n), "allValues");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v35);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v81, 16);
    }
    while (v32);
  }

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("!(%K IN (%@))"), CFSTR("identifier"), v4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v36);

  }
  objc_msgSend(*(id *)(a1 + 32), "predicateForObjectsFromCurrentDevice");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v37);

  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 1, v3);
  objc_msgSend(v51, "setPredicate:", v38);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v51);
  objc_msgSend(v39, "setResultType:", 2);
  v52 = 0;
  v40 = v50;
  objc_msgSend(v50, "executeRequest:error:", v39, &v52);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v52;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v42)
  {
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v74 = v49;
      v75 = 2112;
      v76 = v42;
      _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    v45 = *(_QWORD *)(a1 + 40);
    if (v45)
    {
      v46 = *(void (**)(void))(v45 + 16);
LABEL_47:
      v46();
    }
  }
  else
  {
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v74 = v47;
      v75 = 2112;
      v76 = v39;
      v77 = 2112;
      v78 = v41;
      v79 = 2112;
      v80 = 0;
      _os_log_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

      v40 = v50;
    }

    v48 = *(_QWORD *)(a1 + 40);
    if (v48)
    {
      v46 = *(void (**)(void))(v48 + 16);
      goto LABEL_47;
    }
  }

}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_396(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) | *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                               + 40)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
  {
    _RTSafeArray();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_performBlock:contextType:errorHandler:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
  }
}

- (void)removeAllMapItems:(id)a3
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
  v7[2] = __44__RTLearnedLocationStore_removeAllMapItems___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __44__RTLearnedLocationStore_removeAllMapItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAllMapItems:", *(_QWORD *)(a1 + 40));
}

- (void)_removeAllMapItems:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__RTLearnedLocationStore__removeAllMapItems___block_invoke;
  v8[3] = &unk_1E9297A08;
  v9 = v5;
  v10 = a2;
  v8[4] = self;
  v6 = v5;
  v7 = (void *)MEMORY[0x1D8232094](v8);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v7, 0, v6);

}

void __45__RTLearnedLocationStore__removeAllMapItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 1);
  objc_msgSend(v4, "setIncludesPropertyValues:", 0);
  objc_msgSend(*(id *)(a1 + 32), "persistenceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistenceContextWithOptions:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  v29 = 0;
  objc_msgSend(v7, "_processDeletionRequestWithFetchRequest:context:error:", v4, v6, &v29);
  v8 = v29;
  +[RTMapItemExtendedAttributesMO fetchRequest](RTMapItemExtendedAttributesMO, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 1);
  objc_msgSend(v4, "setIncludesPropertyValues:", 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v9);
  objc_msgSend(v9, "setResultType:", 4);
  v28 = 0;
  objc_msgSend(v3, "executeRequest:error:", v10, &v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v28;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v14;
    v32 = 2112;
    v33 = v11;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
  }
  else
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v31 = v14;
    v32 = 2112;
    v33 = v10;
    v34 = 2112;
    v35 = v26;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@", buf, 0x20u);
  }

LABEL_7:
  +[RTAddressMO fetchRequest](RTAddressMO, "fetchRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setReturnsObjectsAsFaults:", 1);
  objc_msgSend(v15, "setIncludesPropertyValues:", 0);
  v16 = *(void **)(a1 + 32);
  v27 = 0;
  objc_msgSend(v16, "_processDeletionRequestWithFetchRequest:context:error:", v15, v6, &v27);
  v17 = v27;
  if (*(_QWORD *)(a1 + 40))
  {
    _RTSafeArray();
    v18 = v9;
    v19 = v6;
    v20 = v10;
    v21 = v8;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v25 = v4;
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v21;
    v10 = v20;
    v6 = v19;
    v9 = v18;
    (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v23, v24);

    v4 = v25;
  }

}

- (void)_replaceWithLocationsOfInterest:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__RTLearnedLocationStore__replaceWithLocationsOfInterest_handler___block_invoke;
  v12[3] = &unk_1E9297938;
  v14 = v8;
  v15 = a2;
  v13 = v7;
  v9 = v7;
  v10 = v8;
  v11 = (void *)MEMORY[0x1D8232094](v12);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 2, v10);

}

void __66__RTLearnedLocationStore__replaceWithLocationsOfInterest_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  id v34;
  char v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v40;
  id obj;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  _BYTE v63[128];
  _QWORD v64[6];

  v64[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[RTLearnedLocationOfInterestMO entity](RTLearnedLocationOfInterestMO, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v3;
  +[RTLearnedLocationOfInterestVisitMO entity](RTLearnedLocationOfInterestVisitMO, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v4;
  +[RTLearnedLocationOfInterestTransitionMO entity](RTLearnedLocationOfInterestTransitionMO, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v51;
    v10 = 0x1E0C97000uLL;
    v11 = 0x1E0C97000uLL;
    v38 = v2;
    do
    {
      v12 = 0;
      v40 = v8;
      do
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v12);
        v14 = objc_alloc(*(Class *)(v10 + 2888));
        objc_msgSend(v13, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "initWithEntityName:", v15);

        v43 = (void *)v16;
        v17 = (void *)objc_msgSend(objc_alloc(*(Class *)(v11 + 2704)), "initWithFetchRequest:", v16);
        objc_msgSend(v17, "setResultType:", 2);
        v49 = 0;
        objc_msgSend(v2, "executeRequest:error:", v17, &v49);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v49;
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(*(SEL *)(a1 + 48));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "result");
          v22 = v11;
          v23 = v10;
          v24 = v9;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v56 = v21;
          v57 = 2112;
          v58 = v17;
          v59 = 2112;
          v60 = v25;
          v61 = 2112;
          v62 = v19;
          _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

          v9 = v24;
          v10 = v23;
          v11 = v22;
          v8 = v40;

          v2 = v38;
        }

        if (v19)
          objc_msgSend(v42, "addObject:", v19);

        ++v12;
      }
      while (v8 != v12);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v42, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "skipping persisting of new locations of interest due to errors during deletion.", buf, 2u);
    }

    _RTSafeArray();
    v27 = objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

    goto LABEL_27;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v29 = *(id *)(a1 + 32);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(v29);
        v34 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "managedObjectWithContext:", v2);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v31);
  }

  v44 = 0;
  v35 = objc_msgSend(v2, "save:", &v44);
  v28 = v44;
  if ((v35 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v56 = v37;
      v57 = 2112;
      v58 = v28;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    goto LABEL_26;
  }
LABEL_27:
  v36 = *(_QWORD *)(a1 + 40);
  if (v36)
    (*(void (**)(uint64_t, id))(v36 + 16))(v36, v28);

}

- (void)replaceWithLocationsOfInterest:(id)a3 handler:(id)a4
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
  block[2] = __65__RTLearnedLocationStore_replaceWithLocationsOfInterest_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __65__RTLearnedLocationStore_replaceWithLocationsOfInterest_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_replaceWithLocationsOfInterest:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchEntityAsDictionaryWithEntityName:(id)a3 propertiesToFetch:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  SEL v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __91__RTLearnedLocationStore__fetchEntityAsDictionaryWithEntityName_propertiesToFetch_handler___block_invoke;
    v18[3] = &unk_1E92979A0;
    v19 = v9;
    v20 = v10;
    v22 = a2;
    v13 = v11;
    v21 = v13;
    v14 = (void *)MEMORY[0x1D8232094](v18);
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __91__RTLearnedLocationStore__fetchEntityAsDictionaryWithEntityName_propertiesToFetch_handler___block_invoke_397;
    v16[3] = &unk_1E9297568;
    v17 = v13;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v14, 1, v16);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTLearnedLocationStore _fetchEntityAsDictionaryWithEntityName:propertiesToFetch:handler:]";
      v25 = 1024;
      v26 = 6410;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityName (in %s:%d)", buf, 0x12u);
    }

    if (v11)
      (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
  }

}

void __91__RTLearnedLocationStore__fetchEntityAsDictionaryWithEntityName_propertiesToFetch_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C97B48];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithEntityName:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setResultType:", 2);
  objc_msgSend(v5, "setPropertiesToFetch:", *(_QWORD *)(a1 + 40));
  v13 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v13;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v7;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_8:
      v10();
    }
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
    {
      v10 = *(void (**)(void))(v11 + 16);
      goto LABEL_8;
    }
  }

}

uint64_t __91__RTLearnedLocationStore__fetchEntityAsDictionaryWithEntityName_propertiesToFetch_handler___block_invoke_397(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)enumerateStoredLocationsOfInterestWithOptions:(id)a3 enumerationBlock:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  RTLearnedLocationStore *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  char v41;
  _QWORD v42[2];
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  NSObject *v47;
  uint64_t v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v41 = 1;
    if (v7)
    {
      if (objc_msgSend(v7, "singleVisit"))
      {
        +[RTLearnedLocationOfInterestVisitMO fetchRequest](RTLearnedLocationOfInterestVisitMO, "fetchRequest");
        v9 = objc_claimAutoreleasedReturnValue();
        -[NSObject setReturnsObjectsAsFaults:](v9, "setReturnsObjectsAsFaults:", 1);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entryDate"), objc_msgSend(v7, "ascendingVisitEntryDate"));
        v43 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setSortDescriptors:](v9, "setSortDescriptors:", v11);

        -[NSObject setReturnsObjectsAsFaults:](v9, "setReturnsObjectsAsFaults:", 1);
        v12 = (void *)MEMORY[0x1E0CB3528];
        v37 = self;
        v13 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v7, "dateInterval");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("entryDate"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = v15;
        v16 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v7, "dateInterval");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "endDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("exitDate"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v42[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "andPredicateWithSubpredicates:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setPredicate:](v9, "setPredicate:", v21);

        self = v37;
      }
      else
      {
        +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation](RTLearnedLocationOfInterestMO, "fetchRequestSortedByCreation");
        v9 = objc_claimAutoreleasedReturnValue();
        -[NSObject setReturnsObjectsAsFaults:](v9, "setReturnsObjectsAsFaults:", 0);
        v26 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v7, "dateInterval");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "startDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "dateInterval");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "endDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "predicateWithFormat:", CFSTR("SUBQUERY(%K, $v, $v.%K >= %@ and $v.%K <= %@).@count > 0"), CFSTR("visits"), CFSTR("entryDate"), v28, CFSTR("exitDate"), v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setPredicate:](v9, "setPredicate:", v31);

      }
      if (objc_msgSend(v7, "batchSize"))
      {
        v32 = objc_msgSend(v7, "batchSize");
        if (v32 >= 0x12C)
          v33 = 300;
        else
          v33 = v32;
      }
      else
      {
        v33 = 300;
      }
      -[NSObject setFetchBatchSize:](v9, "setFetchBatchSize:", 300);
      -[NSObject setFetchLimit:](v9, "setFetchLimit:", v33);
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __89__RTLearnedLocationStore_enumerateStoredLocationsOfInterestWithOptions_enumerationBlock___block_invoke;
      v38[3] = &unk_1E929DE98;
      v39 = v7;
      v40 = v8;
      v34 = (void *)MEMORY[0x1D8232094](v38);
      -[RTStore enumerateType:fetchRequest:enumerationBlock:](self, "enumerateType:fetchRequest:enumerationBlock:", objc_opt_class(), v9, v34);

    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0D18598];
      v48 = *MEMORY[0x1E0CB2D50];
      v49[0] = CFSTR("requires non-nil options.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 7, v24);
      v9 = objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v45 = v35;
        v46 = 2112;
        v47 = v9;
        _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      (*((void (**)(id, _QWORD, NSObject *, char *))v8 + 2))(v8, 0, v9, &v41);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock", buf, 2u);
    }
  }

}

void __89__RTLearnedLocationStore_enumerateStoredLocationsOfInterestWithOptions_enumerationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _RTMap *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a2;
  v7 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v6);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__RTLearnedLocationStore_enumerateStoredLocationsOfInterestWithOptions_enumerationBlock___block_invoke_2;
  v9[3] = &unk_1E929DE70;
  v10 = *(id *)(a1 + 32);
  -[_RTMap withBlock:](v7, "withBlock:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __89__RTLearnedLocationStore_enumerateStoredLocationsOfInterestWithOptions_enumerationBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filterWithDateInterval:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint8_t buf[8];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

LABEL_8:
    v21 = 0;
    goto LABEL_13;
  }
  if (v8)
  {
    v10 = objc_opt_class();
    if (v10 == objc_opt_class())
    {
      -[RTLearnedLocationStore fetchRequestFromLocationOfInterestOptions:](self, "fetchRequestFromLocationOfInterestOptions:", v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFetchOffset:", a4);
      goto LABEL_13;
    }
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("error of type, %@, is not supported"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_retainAutorelease(v18);
    *a5 = v19;

    goto LABEL_8;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
  }

  _RTErrorInvalidParameterCreate((uint64_t)CFSTR("options"));
  v21 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v21;
}

- (id)fetchRequestFromLocationOfInterestOptions:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  void *v41;
  uint8_t buf[8];
  void *v43;
  _QWORD v44[2];
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "wrappedVisit");
    v6 = (void *)MEMORY[0x1E0C97B48];
    if (v5)
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setReturnsObjectsAsFaults:", 1);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entryDate"), objc_msgSend(v4, "ascending"));
      v45[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSortDescriptors:", v11);

      objc_msgSend(v9, "setReturnsObjectsAsFaults:", 1);
      v12 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v4, "dateInterval");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dateInterval");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("entryDate"), v14, CFSTR("entryDate"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v4, "dateInterval");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "startDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dateInterval");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "endDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("exitDate"), v20, CFSTR("exitDate"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0CB3528];
      v44[0] = v17;
      v44[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "orPredicateWithSubpredicates:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPredicate:", v26);
    }
    else
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fetchRequestWithEntityName:", v29);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("placeCreationDate"), objc_msgSend(v4, "ascending"));
      v43 = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSortDescriptors:", v31);

      v32 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v4, "dateInterval");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dateInterval");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "endDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dateInterval");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "startDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dateInterval");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "endDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "predicateWithFormat:", CFSTR("SUBQUERY(%K, $v, ($v.%K >= %@ and $v.%K <= %@) or ($v.%K >= %@ and $v.%K <= %@)).@count > 0"), CFSTR("visits"), CFSTR("entryDate"), v23, CFSTR("entryDate"), v26, CFSTR("exitDate"), v34, CFSTR("exitDate"), v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPredicate:", v37);

      v17 = v41;
    }

    if (objc_msgSend(v4, "batchSize"))
    {
      v38 = objc_msgSend(v4, "batchSize");
      if (v38 >= 0x12C)
        v39 = 300;
      else
        v39 = v38;
    }
    else
    {
      v39 = 300;
    }
    objc_msgSend(v9, "setFetchBatchSize:", 300);
    objc_msgSend(v9, "setFetchLimit:", v39);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (void)_logLocalStoreWithReason:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__RTLearnedLocationStore__logLocalStoreWithReason_handler___block_invoke;
  v14[3] = &unk_1E9297A08;
  v15 = v7;
  v17 = a2;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __59__RTLearnedLocationStore__logLocalStoreWithReason_handler___block_invoke_415;
  v12[3] = &unk_1E9297568;
  v13 = v16;
  v10 = v16;
  v11 = v7;
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v14, 1, v12);

}

void __59__RTLearnedLocationStore__logLocalStoreWithReason_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *context;
  id v37;
  void *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
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
  id v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _QWORD v69[4];

  v69[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v59 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "start logging local store with reason, %@", buf, 0xCu);
    }

  }
  v34 = a1;
  +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation](RTLearnedLocationOfInterestMO, "fetchRequestSortedByCreation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
  v69[0] = CFSTR("visits");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelationshipKeyPathsForPrefetching:", v7);

  v38 = v6;
  v8 = objc_msgSend(v6, "setFetchLimit:", 5);
  obj = 0;
  v40 = 0;
  v35 = v3;
  do
  {
    context = (void *)MEMORY[0x1D8231EA8](v8);
    v57 = 0;
    objc_msgSend(v3, "executeFetchRequest:error:", v38, &v57);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v57;

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v9;
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
    if (v42)
    {
      v41 = *(_QWORD *)v54;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v54 != v41)
            objc_enumerationMutation(obj);
          +[RTLearnedLocationOfInterest createWithManagedObject:](RTLearnedLocationOfInterest, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v12 = objc_claimAutoreleasedReturnValue();
          v43 = v10;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v59 = ++v40;
            v60 = 2112;
            v61 = v11;
            _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "locationOfInterest %lu, %@", buf, 0x16u);
          }

          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v44 = v11;
          objc_msgSend(v11, "visits");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
          if (v14)
          {
            v15 = v14;
            v16 = 0;
            v17 = *(_QWORD *)v50;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v50 != v17)
                  objc_enumerationMutation(v13);
                v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  ++v16;
                  *(_DWORD *)buf = 134218242;
                  v59 = (uint64_t)v16;
                  v60 = 2112;
                  v61 = v19;
                  _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEFAULT, "visit %lu, %@", buf, 0x16u);
                }

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
            }
            while (v15);
          }

          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          objc_msgSend(v44, "transitions");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v66, 16);
          if (v22)
          {
            v23 = v22;
            v24 = 0;
            v25 = *(_QWORD *)v46;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v46 != v25)
                  objc_enumerationMutation(v21);
                v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
                _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  ++v24;
                  *(_DWORD *)buf = 134218242;
                  v59 = (uint64_t)v24;
                  v60 = 2112;
                  v61 = v27;
                  _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_DEFAULT, "transition %lu, %@", buf, 0x16u);
                }

              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v66, 16);
            }
            while (v23);
          }

          v10 = v43 + 1;
        }
        while (v43 + 1 != v42);
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
      }
      while (v42);
    }

    objc_msgSend(v38, "setFetchOffset:", objc_msgSend(v38, "fetchOffset") + objc_msgSend(obj, "count"));
    v3 = v35;
    objc_msgSend(v35, "reset");
    objc_autoreleasePoolPop(context);
    v8 = objc_msgSend(obj, "count");
  }
  while (v8 && !v37);
  if (*(_QWORD *)(v34 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(_QWORD *)(v34 + 32);
      *(_DWORD *)buf = 138412290;
      v59 = v30;
      _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEFAULT, "end logging local store with reason, %@", buf, 0xCu);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(v34 + 48));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v59 = (uint64_t)v33;
    v60 = 2112;
    v61 = v38;
    v62 = 2048;
    v63 = v40;
    v64 = 2112;
    v65 = v37;
    _os_log_debug_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

    v3 = v35;
  }

  v32 = *(_QWORD *)(v34 + 40);
  if (v32)
    (*(void (**)(uint64_t, id))(v32 + 16))(v32, v37);

}

uint64_t __59__RTLearnedLocationStore__logLocalStoreWithReason_handler___block_invoke_415(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)logLocalStoreWithReason:(id)a3 handler:(id)a4
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
  block[2] = __58__RTLearnedLocationStore_logLocalStoreWithReason_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __58__RTLearnedLocationStore_logLocalStoreWithReason_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logLocalStoreWithReason:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_logCloudStoreWithReason:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__RTLearnedLocationStore__logCloudStoreWithReason_handler___block_invoke;
  v14[3] = &unk_1E9297A08;
  v15 = v7;
  v17 = a2;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __59__RTLearnedLocationStore__logCloudStoreWithReason_handler___block_invoke_418;
  v12[3] = &unk_1E9297568;
  v13 = v16;
  v10 = v16;
  v11 = v7;
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v14, 1, v12);

}

void __59__RTLearnedLocationStore__logCloudStoreWithReason_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  char *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  char *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  char *v71;
  id v72;
  void *v73;
  uint64_t v74;
  void *v75;
  NSObject *v76;
  char *v77;
  NSObject *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  char *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  id obj;
  void *context;
  char *contexta;
  char *contextb;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  id v116;
  _BYTE v117[128];
  void *v118;
  _BYTE v119[128];
  void *v120;
  uint8_t buf[4];
  char *v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  char *v126;
  __int16 v127;
  uint64_t v128;
  _BYTE v129[128];
  _QWORD v130[4];

  v130[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(char **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v122 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "start logging cloud store with reason, %@", buf, 0xCu);
    }

  }
  v85 = a1;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    +[RTDeviceMO fetchRequest](RTDeviceMO, "fetchRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "countForFetchRequest:error:", v8, 0);
    objc_msgSend(v3, "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTDevice createWithManagedObject:](RTDevice, "createWithManagedObject:", v10);
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v122 = v7;
    v123 = 2048;
    v124 = v9;
    v125 = 2112;
    v126 = v11;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%@, %lu devices, currentDevice, %@", buf, 0x20u);

  }
  +[RTDeviceMO fetchRequest](RTDeviceMO, "fetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v12, "setFetchLimit:", 5);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("ckRecordID"), 1);
  v130[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v12;
  objc_msgSend(v12, "setSortDescriptors:", v14);

  v15 = 0;
  obj = 0;
  v92 = v3;
  do
  {
    context = (void *)MEMORY[0x1D8231EA8]();
    v116 = 0;
    objc_msgSend(v3, "executeFetchRequest:error:", v12, &v116);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v116;

    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    obj = v16;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v129, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v113 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
          +[RTDevice createWithManagedObject:](RTDevice, "createWithManagedObject:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            ++v15;
            objc_msgSend(v21, "places");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "count");
            objc_msgSend(v21, "visits");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "count");
            *(_DWORD *)buf = 134218754;
            v122 = v15;
            v123 = 2112;
            v124 = (uint64_t)v22;
            v125 = 2048;
            v126 = (char *)v25;
            v127 = 2048;
            v128 = v27;
            _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_DEFAULT, "device %lu, %@, placesCount, %lu, visitsCount, %lu", buf, 0x2Au);

          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v129, 16);
      }
      while (v18);
    }

    objc_msgSend(v12, "setFetchOffset:", objc_msgSend(v12, "fetchOffset") + objc_msgSend(obj, "count"));
    v3 = v92;
    objc_msgSend(v92, "reset");
    objc_autoreleasePoolPop(context);
  }
  while (objc_msgSend(obj, "count") && !v90);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(v85 + 48));
    v82 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v122 = v82;
    v123 = 2112;
    v124 = (uint64_t)v12;
    v125 = 2048;
    v126 = v15;
    v127 = 2112;
    v128 = (uint64_t)v90;
    _os_log_debug_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(v85 + 48));
    v30 = (char *)objc_claimAutoreleasedReturnValue();
    +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v92, "countForFetchRequest:error:", v31, 0);
    *(_DWORD *)buf = 138412546;
    v122 = v30;
    v123 = 2048;
    v124 = v32;
    _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEFAULT, "%@, %lu places", buf, 0x16u);

  }
  +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v33, "setFetchLimit:", 5);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("creationDate"), 1);
  v120 = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setSortDescriptors:", v35);

  contexta = 0;
  v97 = 0;
  v87 = v33;
  do
  {
    v88 = (void *)MEMORY[0x1D8231EA8]();
    v111 = 0;
    objc_msgSend(v3, "executeFetchRequest:error:", v33, &v111);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v111;

    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v97 = v36;
    v37 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v108;
      v95 = *(_QWORD *)v108;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v108 != v39)
            objc_enumerationMutation(v97);
          v41 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * j);
          objc_msgSend(v41, "device");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTDevice createWithManagedObject:](RTDevice, "createWithManagedObject:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          +[RTLearnedPlace createWithManagedObject:](RTLearnedPlace, "createWithManagedObject:", v41);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v41, "visits");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "count");
            objc_msgSend(v43, "identifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218754;
            v122 = ++contexta;
            v123 = 2112;
            v124 = (uint64_t)v44;
            v125 = 2048;
            v126 = (char *)v47;
            v127 = 2112;
            v128 = (uint64_t)v48;
            _os_log_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_DEFAULT, "place, %lu, %@, visits, %lu, deviceIdentifier, %@", buf, 0x2Au);

            v39 = v95;
          }

        }
        v38 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
      }
      while (v38);
    }

    v33 = v87;
    objc_msgSend(v87, "setFetchOffset:", objc_msgSend(v87, "fetchOffset") + objc_msgSend(v97, "count"));
    v3 = v92;
    objc_msgSend(v92, "reset");
    objc_autoreleasePoolPop(v88);
    v49 = v93;
  }
  while (objc_msgSend(v97, "count") && !v93);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(v85 + 48));
    v83 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v122 = v83;
    v123 = 2112;
    v124 = (uint64_t)v87;
    v125 = 2048;
    v126 = contexta;
    v127 = 2112;
    v128 = (uint64_t)v93;
    _os_log_debug_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(v85 + 48));
    v52 = (char *)objc_claimAutoreleasedReturnValue();
    +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v92, "countForFetchRequest:error:", v53, 0);
    *(_DWORD *)buf = 138412546;
    v122 = v52;
    v123 = 2048;
    v124 = v54;
    _os_log_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_DEFAULT, "%@, %lu visits", buf, 0x16u);

  }
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v55, "setFetchLimit:", 5);
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entryDate"), 1);
  v118 = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setSortDescriptors:", v57);

  v58 = 0;
  contextb = 0;
  v86 = v55;
  do
  {
    v89 = (void *)MEMORY[0x1D8231EA8]();
    v106 = v49;
    objc_msgSend(v3, "executeFetchRequest:error:", v55, &v106);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v106;

    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v60 = v59;
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v103;
      v96 = *(_QWORD *)v103;
      do
      {
        for (k = 0; k != v62; ++k)
        {
          if (*(_QWORD *)v103 != v63)
            objc_enumerationMutation(v60);
          v65 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * k);
          objc_msgSend(v65, "device");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTDevice createWithManagedObject:](RTDevice, "createWithManagedObject:", v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", v65);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v65, "place");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "identifier");
            v71 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "identifier");
            v72 = v60;
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218754;
            v122 = ++contextb;
            v123 = 2112;
            v124 = (uint64_t)v68;
            v125 = 2112;
            v126 = v71;
            v127 = 2112;
            v128 = (uint64_t)v73;
            _os_log_impl(&dword_1D1A22000, v69, OS_LOG_TYPE_DEFAULT, "visit, %lu, %@, placeIdentifier, %@, deviceIdentifier, %@", buf, 0x2Au);

            v60 = v72;
            v63 = v96;

          }
        }
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
      }
      while (v62);
    }

    v74 = objc_msgSend(v60, "count");
    v58 = v60;
    v55 = v86;
    objc_msgSend(v86, "setFetchOffset:", objc_msgSend(v86, "fetchOffset") + v74);
    v3 = v92;
    objc_msgSend(v92, "reset");
    objc_autoreleasePoolPop(v89);
    v49 = v94;
  }
  while (objc_msgSend(v58, "count"));
  v75 = v58;
  if (*(_QWORD *)(v85 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      v77 = *(char **)(v85 + 32);
      *(_DWORD *)buf = 138412290;
      v122 = v77;
      _os_log_impl(&dword_1D1A22000, v76, OS_LOG_TYPE_DEFAULT, "end logging cloud store with reason, %@", buf, 0xCu);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v78 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(v85 + 48));
    v84 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v122 = v84;
    v123 = 2112;
    v124 = (uint64_t)v86;
    v125 = 2048;
    v126 = contextb;
    v127 = 2112;
    v128 = 0;
    _os_log_debug_impl(&dword_1D1A22000, v78, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  v79 = *(_QWORD *)(v85 + 40);
  if (v79)
  {
    _RTSafeArray();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v79 + 16))(v79, v81);

  }
}

uint64_t __59__RTLearnedLocationStore__logCloudStoreWithReason_handler___block_invoke_418(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)logCloudStoreWithReason:(id)a3 handler:(id)a4
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
  block[2] = __58__RTLearnedLocationStore_logCloudStoreWithReason_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __58__RTLearnedLocationStore_logCloudStoreWithReason_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logCloudStoreWithReason:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_associatePlacesToVisits:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__RTLearnedLocationStore__associatePlacesToVisits_handler___block_invoke;
  v12[3] = &unk_1E9297A08;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v9 = v8;
  v10 = v7;
  v11 = (void *)MEMORY[0x1D8232094](v12);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 2, v9);

}

void __59__RTLearnedLocationStore__associatePlacesToVisits_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  char v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v39 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v39);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v39;
  if (v9 || !objc_msgSend(v8, "count"))
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v9);
  }
  else
  {
    v30 = v8;
    v31 = v4;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0CB3880];
          v18 = *(void **)(a1 + 32);
          objc_msgSend(v15, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("identifier"), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setPredicate:", v21);

          v34 = 0;
          objc_msgSend(v3, "executeFetchRequest:error:", v16, &v34);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v34;
          if (v23)
          {
            v9 = v23;
            v28 = *(_QWORD *)(a1 + 40);
            v4 = v31;
            if (v28)
              (*(void (**)(uint64_t, id))(v28 + 16))(v28, v9);

            goto LABEL_24;
          }
          if (objc_msgSend(v22, "count"))
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addVisits:", v24);

          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        if (v12)
          continue;
        break;
      }
    }

    v33 = 0;
    v25 = objc_msgSend(v3, "save:", &v33);
    v9 = v33;
    if ((v25 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v29;
        v42 = 2112;
        v43 = v9;
        _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "%@, associatePlacesToVisits error, %@", buf, 0x16u);

      }
    }
    v27 = *(_QWORD *)(a1 + 40);
    v4 = v31;
    if (v27)
      (*(void (**)(uint64_t, id))(v27 + 16))(v27, v9);
LABEL_24:
    v8 = v30;
  }

}

- (id)predicateForObjectsFromCurrentDevice
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == $RT_CURRENT_DEVICE"), CFSTR("device"));
}

- (id)predicateForObjectsNotFromCurrentDevice
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != $RT_CURRENT_DEVICE"), CFSTR("device"));
}

- (id)predicateForVisitsFromEntryDate:(id)a3 exitDate:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %@ and %K < %@"), CFSTR("entryDate"), a3, CFSTR("exitDate"), a4);
}

- (id)predicateForCompleteVisits
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil and %K != nil"), CFSTR("entryDate"), CFSTR("exitDate"));
}

- (id)predicateForVisitsWithinDistance:(double)a3 location:(id)a4
{
  id v4;
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
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(v4, "latitude");
  objc_msgSend(v4, "longitude");

  RTCommonCalculateBoundingBox();
  v19 = (void *)MEMORY[0x1E0CB3528];
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%@ <= %K"), v20, CFSTR("locationLongitude"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("locationLongitude"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  v10 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("%@ <= %K"), v11, CFSTR("locationLatitude"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v12;
  v13 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("locationLatitude"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (RTPersistenceExpirationEnforcer)expirationEnforcer
{
  return self->_expirationEnforcer;
}

- (void)setExpirationEnforcer:(id)a3
{
  objc_storeStrong((id *)&self->_expirationEnforcer, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTPersistenceMirroringManager)mirroringManager
{
  return self->_mirroringManager;
}

- (void)setMirroringManager:(id)a3
{
  objc_storeStrong((id *)&self->_mirroringManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroringManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_expirationEnforcer, 0);
}

@end
