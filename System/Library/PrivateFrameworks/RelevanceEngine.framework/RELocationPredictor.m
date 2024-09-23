@implementation RELocationPredictor

+ (id)supportedFeatures
{
  REFeatureSet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  REFeatureSet *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = [REFeatureSet alloc];
  +[REFeature locationOfInterestFeature](REFeature, "locationOfInterestFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature knownLocationOfInterestFeature](REFeature, "knownLocationOfInterestFeature", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  +[REFeature travelingFeature](REFeature, "travelingFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REFeatureSet initWithFeatures:](v2, "initWithFeatures:", v6);

  return v7;
}

+ (double)updateInterval
{
  return 3600.0;
}

- (id)_init
{
  _QWORD *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  Class (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)RELocationPredictor;
  v2 = -[REPredictor _init](&v14, sel__init);
  if (v2)
  {
    if (!CoreRoutineLibraryCore_frameworkLibrary)
    {
      v19 = xmmword_24CF91330;
      v20 = 0;
      CoreRoutineLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (CoreRoutineLibraryCore_frameworkLibrary)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x2050000000;
      v3 = (void *)getRTRoutineManagerClass_softClass;
      v18 = getRTRoutineManagerClass_softClass;
      if (!getRTRoutineManagerClass_softClass)
      {
        *(_QWORD *)&v19 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v19 + 1) = 3221225472;
        v20 = __getRTRoutineManagerClass_block_invoke;
        v21 = &unk_24CF8AC38;
        v22 = &v15;
        __getRTRoutineManagerClass_block_invoke((uint64_t)&v19);
        v3 = (void *)v16[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v15, 8);
      objc_msgSend(v4, "defaultManager");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v2[8];
      v2[8] = v5;

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v2[10];
    v2[10] = v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, 2);
    v10 = (void *)v2[9];
    v2[9] = v9;

    v11 = objc_opt_new();
    v12 = (void *)v2[11];
    v2[11] = v11;

  }
  return v2;
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSMutableDictionary *overrideRoutineType;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[NSLock lock](self->_routineDataLock, "lock");
  -[NSMapTable objectForKey:](self->_routineData, "objectForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_routineDataLock, "unlock");
  overrideRoutineType = self->_overrideRoutineType;
  objc_msgSend(v12, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](overrideRoutineType, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature travelingFeature](REFeature, "travelingFeature");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v10, "isEqual:", v18);

  if (v19)
  {
    if (v14)
      v20 = objc_msgSend(v14, "mode");
    else
      v20 = 0;
    goto LABEL_11;
  }
  +[REFeature locationOfInterestFeature](REFeature, "locationOfInterestFeature");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v10, "isEqual:", v21);

  if (v22)
  {
    if (v17)
    {
      +[REFeatureValue featureValueWithString:](REFeatureValue, "featureValueWithString:", &stru_24CF92178);
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v26 = (void *)v23;
      goto LABEL_13;
    }
    objc_msgSend(v14, "locationsOfInterest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = v13;
    v30 = v11;
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "UUIDString");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v33)
      v35 = (const __CFString *)v33;
    else
      v35 = &stru_24CF92178;
    +[REFeatureValue featureValueWithString:](REFeatureValue, "featureValueWithString:", v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v30;
    v13 = v29;
    v17 = 0;
  }
  else
  {
    +[REFeature knownLocationOfInterestFeature](REFeature, "knownLocationOfInterestFeature");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v10, "isEqual:", v24);

    if (!v25)
    {
      v26 = 0;
      goto LABEL_13;
    }
    if (v17)
    {
      v20 = objc_msgSend(v17, "integerValue");
LABEL_11:
      +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", v20);
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v49 = v11;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v14, "locationsOfInterest");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v36;
    v38 = (void *)MEMORY[0x24BDBD1A8];
    if (v36)
      v38 = (void *)v36;
    v39 = v38;

    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v40)
    {
      v41 = v40;
      v48 = v13;
      v42 = 0;
      v43 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v51 != v43)
            objc_enumerationMutation(v39);
          v45 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if (objc_msgSend(v45, "type") != -1)
          {
            v46 = v45;

            v42 = v46;
          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v41);

      v13 = v48;
      if (v42)
        v47 = objc_msgSend(v42, "type");
      else
        v47 = -1;
      v11 = v49;
      v17 = 0;
    }
    else
    {

      v42 = 0;
      v47 = -1;
    }
    +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", v47);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_13:

  return v26;
}

- (void)update
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  RTRoutineManager *manager;
  uint64_t v14;
  RELocationPredictor *v15;
  NSObject *v16;
  RTRoutineManager *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[6];
  _QWORD block[6];
  NSObject *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  _QWORD *v35;
  _QWORD v36[4];
  NSObject *v37;
  _QWORD *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[4];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[3];
  char v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v49 = 0;
  v3 = dispatch_group_create();
  -[REPredictor beginFetchingData](self, "beginFetchingData");
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[REPredictor engines](self, "engines");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    v23 = *(_QWORD *)v45;
    obj = v4;
    do
    {
      v7 = 0;
      v22 = v5;
      do
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v7);
        v43[0] = 0;
        v43[1] = v43;
        v43[2] = 0x2020000000;
        v43[3] = 0;
        v41[0] = 0;
        v41[1] = v41;
        v41[2] = 0x3032000000;
        v41[3] = __Block_byref_object_copy__29;
        v41[4] = __Block_byref_object_dispose__29;
        v42 = 0;
        v9 = dispatch_group_create();
        v24 = v8;
        objc_msgSend(v8, "locationManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "currentLocation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v39[0] = v6;
          v39[1] = 3221225472;
          v39[2] = __29__RELocationPredictor_update__block_invoke;
          v39[3] = &unk_24CF91298;
          v11 = v25;
          v40 = v11;
          v12 = (void *)MEMORY[0x2199B2434](v39);
          dispatch_group_enter(v9);
          manager = self->_manager;
          v36[0] = v6;
          v36[1] = 3221225472;
          v36[2] = __29__RELocationPredictor_update__block_invoke_2;
          v36[3] = &unk_24CF912C0;
          v38 = v43;
          v14 = v6;
          v15 = self;
          v16 = v9;
          v37 = v16;
          -[RTRoutineManager fetchRoutineModeFromLocation:withHandler:](manager, "fetchRoutineModeFromLocation:withHandler:", v11, v36);
          dispatch_group_enter(v16);
          v17 = v15->_manager;
          v32[0] = v14;
          v32[1] = 3221225472;
          v32[2] = __29__RELocationPredictor_update__block_invoke_44;
          v32[3] = &unk_24CF912E8;
          v35 = v41;
          v18 = v12;
          v34 = v18;
          v33 = v16;
          -[RTRoutineManager fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:](v17, "fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:", v11, v32, 1000.0);

          self = v15;
          v6 = v14;
          v5 = v22;

        }
        dispatch_group_enter(v3);
        -[REPredictor queue](self, "queue");
        v19 = objc_claimAutoreleasedReturnValue();
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __29__RELocationPredictor_update__block_invoke_2_49;
        block[3] = &unk_24CF91310;
        v29 = v43;
        v30 = v41;
        block[4] = self;
        block[5] = v24;
        v31 = v48;
        v28 = v3;
        dispatch_group_notify(v9, v19, block);

        _Block_object_dispose(v41, 8);
        _Block_object_dispose(v43, 8);
        ++v7;
      }
      while (v5 != v7);
      v4 = obj;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v5);
  }

  -[REPredictor queue](self, "queue");
  v20 = objc_claimAutoreleasedReturnValue();
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __29__RELocationPredictor_update__block_invoke_3;
  v26[3] = &unk_24CF8C1F0;
  v26[4] = self;
  v26[5] = v48;
  dispatch_group_notify(v3, v20, v26);

  _Block_object_dispose(v48, 8);
}

double __29__RELocationPredictor_update__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  v3 = (objc_class *)MEMORY[0x24BDBFA80];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latitude");
  v8 = v7;
  objc_msgSend(v4, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "longitude");
  v11 = (void *)objc_msgSend(v5, "initWithLatitude:longitude:", v8, v10);

  objc_msgSend(*(id *)(a1 + 32), "distanceFromLocation:", v11);
  v13 = v12;

  return v13;
}

void __29__RELocationPredictor_update__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  if (v5)
  {
    RELogForDomain(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __29__RELocationPredictor_update__block_invoke_2_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __29__RELocationPredictor_update__block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    RELogForDomain(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __29__RELocationPredictor_update__block_invoke_44_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __29__RELocationPredictor_update__block_invoke_45;
  v17[3] = &unk_24CF8BF30;
  v18 = *(id *)(a1 + 40);
  objc_msgSend(v5, "sortedArrayUsingComparator:", v17);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __29__RELocationPredictor_update__block_invoke_45(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void (**)(uint64_t, uint64_t))(v6 + 16);
  v8 = a3;
  v7(v6, a2);
  objc_msgSend(v5, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = (*(double (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  objc_msgSend(v10, "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "compare:", v12);

  return v13;
}

void __29__RELocationPredictor_update__block_invoke_2_49(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  id v5;

  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setMode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  objc_msgSend(v5, "setLocationsOfInterest:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "lock");
  if (v5 && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqual:", v5) ^ 1;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (*(_BYTE *)(v4 + 24))
      LOBYTE(v3) = 1;
    *(_BYTE *)(v4 + 24) = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __29__RELocationPredictor_update__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "finishFetchingData");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "updateObservers");
  return result;
}

- (void)addRelevanceEngine:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RELocationPredictor;
  v4 = a3;
  -[REPredictor addRelevanceEngine:](&v6, sel_addRelevanceEngine_, v4);
  objc_msgSend(v4, "locationManager", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObserver:", self);
  -[REPredictor invalidate](self, "invalidate");
}

- (void)removeRelevanceEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  RELocationPredictor *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RELocationPredictor;
  -[REPredictor removeRelevanceEngine:](&v13, sel_removeRelevanceEngine_, v4);
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __45__RELocationPredictor_removeRelevanceEngine___block_invoke;
    v10 = &unk_24CF8AB18;
    v11 = v4;
    v12 = self;
    -[REPredictor onQueue:](self, "onQueue:", &v7);

  }
  objc_msgSend(v4, "locationManager", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

}

uint64_t __45__RELocationPredictor_removeRelevanceEngine___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 88), "lock");
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 72), "removeObjectForKey:", *(_QWORD *)(v1 + 32));
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 88), "lock");
  }
  return result;
}

- (id)locationForEngine:(id)a3 userLocation:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NSLock lock](self->_routineDataLock, "lock");
  -[NSMapTable objectForKey:](self->_routineData, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_routineDataLock, "unlock");
  v23 = 0u;
  v24 = 0u;
  if ((unint64_t)(a4 + 1) >= 5)
    v8 = 0;
  else
    v8 = a4;
  *((_QWORD *)&v21 + 1) = 0;
  v22 = 0uLL;
  objc_msgSend(v7, "locationsOfInterest", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "type") == v8)
        {
          v14 = objc_alloc(MEMORY[0x24BDBFA80]);
          objc_msgSend(v13, "location");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "latitude");
          v17 = v16;
          objc_msgSend(v13, "location");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "longitude");
          v10 = (void *)objc_msgSend(v14, "initWithLatitude:longitude:", v17, v19);

          goto LABEL_14;
        }
      }
      v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_14:

  return v10;
}

- (id)_routineDataForEngine:(id)a3
{
  NSLock *routineDataLock;
  id v5;
  void *v6;

  routineDataLock = self->_routineDataLock;
  v5 = a3;
  -[NSLock lock](routineDataLock, "lock");
  -[NSMapTable objectForKey:](self->_routineData, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_routineDataLock, "unlock");
  return v6;
}

- (id)predictedLocationIdentifierForEngine:(id)a3
{
  NSLock *routineDataLock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  routineDataLock = self->_routineDataLock;
  v5 = a3;
  -[NSLock lock](routineDataLock, "lock");
  -[NSMapTable objectForKey:](self->_routineData, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_routineDataLock, "unlock");
  objc_msgSend(v6, "locationsOfInterest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)predictedLocationNameForEngine:(id)a3
{
  NSLock *routineDataLock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  routineDataLock = self->_routineDataLock;
  v5 = a3;
  -[NSLock lock](routineDataLock, "lock");
  -[NSMapTable objectForKey:](self->_routineData, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_routineDataLock, "unlock");
  objc_msgSend(v6, "locationsOfInterest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setOverrideLocation:(int64_t)a3 forEngine:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[REPredictor queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__RELocationPredictor__setOverrideLocation_forEngine___block_invoke;
  block[3] = &unk_24CF8F720;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __54__RELocationPredictor__setOverrideLocation_forEngine___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 48) == -1)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (id)v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateObservers");

}

- (NSDictionary)routineDataByEngine
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_routineDataLock, "lock");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMapTable count](self->_routineData, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable keyEnumerator](self->_routineData, "keyEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_routineData, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[NSLock unlock](self->_routineDataLock, "unlock");
  v12 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineDataLock, 0);
  objc_storeStrong((id *)&self->_overrideRoutineType, 0);
  objc_storeStrong((id *)&self->_routineData, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

void __29__RELocationPredictor_update__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, a2, a3, "Encountered CR error getting routine mode: %@", a5, a6, a7, a8, 2u);
}

void __29__RELocationPredictor_update__block_invoke_44_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, a2, a3, "Encountered CR error getting LOIs: %@", a5, a6, a7, a8, 2u);
}

@end
