@implementation APOdmlVectorBuilder

- (APOdmlVectorBuilder)initWithVersion:(id)a3 lookbackPeriod:(id)a4 maxQueryElements:(id)a5 task:(id)a6 exponentialDecayConstant:(id)a7 weightByDuration:(id)a8 isCounterfactual:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  APOdmlVectorBuilder *v22;
  APOdmlVectorBuilder *v23;
  APOdmlVector *v24;
  const char *v25;
  uint64_t v26;
  APOdmlVector *vector;
  APOdmlUnfairLock *v28;
  const char *v29;
  uint64_t v30;
  APOdmlUnfairLock *setVectorAndWeightLock;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableDictionary *adamIDtoBundleID;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  char v41;
  uint64_t v42;
  NSArray *events;
  APOdmlVectorBuilder *v44;
  objc_super v46;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v46.receiver = self;
  v46.super_class = (Class)APOdmlVectorBuilder;
  v22 = -[APOdmlVectorBuilder init](&v46, sel_init);
  v23 = v22;
  if (!v22)
    goto LABEL_15;
  objc_storeStrong((id *)&v22->_version, a3);
  v24 = [APOdmlVector alloc];
  v26 = objc_msgSend_initWithVersion_andArray_(v24, v25, (uint64_t)v16, 0);
  vector = v23->_vector;
  v23->_vector = (APOdmlVector *)v26;

  v23->_vectorWeightTotal = 0.0;
  v28 = [APOdmlUnfairLock alloc];
  v30 = objc_msgSend_initWithOptions_(v28, v29, 1);
  setVectorAndWeightLock = v23->_setVectorAndWeightLock;
  v23->_setVectorAndWeightLock = (APOdmlUnfairLock *)v30;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v32, v33);
  v34 = objc_claimAutoreleasedReturnValue();
  adamIDtoBundleID = v23->_adamIDtoBundleID;
  v23->_adamIDtoBundleID = (NSMutableDictionary *)v34;

  objc_storeStrong((id *)&v23->_task, a6);
  if (v17)
    objc_msgSend_doubleValue(v17, v36, v37);
  else
    v38 = 0x4122750000000000;
  *(_QWORD *)&v23->_lookbackPeriod = v38;
  v39 = v18 ? objc_msgSend_longValue(v18, v36, v37) : 1000;
  v23->_maxQueryElements = v39;
  if (v20)
    objc_msgSend_doubleValue(v20, v36, v37);
  else
    v40 = 0.0;
  v23->_exponentialDecayConstant = v40;
  v41 = v21 ? objc_msgSend_BOOLValue(v21, v36, v37) : 0;
  v23->_weightByDuration = v41;
  v23->_assetManagerIsCounterfactual = a9;
  objc_msgSend_pullEvents(v23, v36, v37);
  v42 = objc_claimAutoreleasedReturnValue();
  events = v23->_events;
  v23->_events = (NSArray *)v42;

  if (!v23->_events)
    v44 = 0;
  else
LABEL_15:
    v44 = v23;

  return v44;
}

- (void)addAppVector:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  NSObject *v17;
  id v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  double v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = objc_msgSend_adamID(v4, v5, v6);
    objc_msgSend_numberWithUnsignedLongLong_(v8, v10, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_adamIDtoBundleID(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v14, v15, (uint64_t)v11);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      OdmlLogForCategory(2uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v56 = 138412290;
        v57 = (id)objc_opt_class();
        v18 = v57;
        _os_log_impl(&dword_1B69D6000, v17, OS_LOG_TYPE_DEFAULT, "[%@]: App vector found; updating.",
          (uint8_t *)&v56,
          0xCu);

      }
      objc_msgSend_retrieveFilteredEvents_(self, v19, (uint64_t)v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v20, v21, v22))
      {
        objc_msgSend_weightForEvents_(self, v23, (uint64_t)v20);
        v25 = v24;
        objc_msgSend_vector(self, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_updateVector_withVector_usingWeight_(self, v29, (uint64_t)v28, v7, v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setVectorAndWeightLock(self, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lock(v33, v34, v35);

        objc_msgSend_setVector_(self, v36, (uint64_t)v30);
        objc_msgSend_vectorWeightTotal(self, v37, v38);
        objc_msgSend_setVectorWeightTotal_(self, v40, v41, v25 + v39);
        objc_msgSend_setVectorAndWeightLock(self, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unlock(v44, v45, v46);

        OdmlLogForCategory(2uLL);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = (void *)objc_opt_class();
          v49 = v48;
          v52 = objc_msgSend_count(v20, v50, v51);
          objc_msgSend_vectorWeightTotal(self, v53, v54);
          v56 = 138413314;
          v57 = v48;
          v58 = 2112;
          v59 = v16;
          v60 = 2048;
          v61 = v52;
          v62 = 2048;
          v63 = v25;
          v64 = 2048;
          v65 = v55;
          _os_log_impl(&dword_1B69D6000, v47, OS_LOG_TYPE_DEFAULT, "[%@]: Vector updated for bundleID %@ with %lu events for a weight of %f. Vector weight total: %f", (uint8_t *)&v56, 0x34u);

        }
      }

    }
    goto LABEL_12;
  }
  OdmlLogForCategory(2uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v56 = 138412290;
    v57 = (id)objc_opt_class();
    v16 = v57;
    _os_log_impl(&dword_1B69D6000, v11, OS_LOG_TYPE_ERROR, "[%@] ERROR: We cannot update the vector with a nil vector.", (uint8_t *)&v56, 0xCu);
LABEL_12:

  }
}

- (id)retrieveVector:(id *)a3
{
  NSObject *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  double v15;
  NSObject *v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  const char *v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint8_t v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  OdmlLogForCategory(2uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v35 = 138412290;
    *(_QWORD *)&v35[4] = objc_opt_class();
    v6 = *(id *)&v35[4];
    _os_log_impl(&dword_1B69D6000, v5, OS_LOG_TYPE_DEFAULT, "[%@]: Retrieving normalized app vectors.", v35, 0xCu);

  }
  objc_msgSend_vector(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v12 = 0;
  }
  else
  {
    OdmlLogForCategory(2uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)objc_opt_class();
      *(_DWORD *)v35 = 138412290;
      *(_QWORD *)&v35[4] = v23;
      v24 = v23;
      _os_log_impl(&dword_1B69D6000, v22, OS_LOG_TYPE_ERROR, "[%@]: Vector is not found.", v35, 0xCu);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v25, (uint64_t)CFSTR("APOdmlFeatureCalculatorErrorDomain"), 1006, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    if (a3 && v21)
      goto LABEL_15;
  }
  objc_msgSend_vectorWeightTotal(self, v10, v11, *(_OWORD *)v35);
  if (v15 > 0.0)
  {
LABEL_17:
    objc_msgSend_vector(self, v13, v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWeightTotal(self, v28, v29);
    v31 = 1.0 / v30;
    *(float *)&v31 = v31;
    objc_msgSend_scalarMultiply_(v27, v32, v33, v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  OdmlLogForCategory(2uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_opt_class();
    *(_DWORD *)v35 = 138412290;
    *(_QWORD *)&v35[4] = v17;
    v18 = v17;
    _os_log_impl(&dword_1B69D6000, v16, OS_LOG_TYPE_ERROR, "[%@]: Vector weight total not greater than 0.", v35, 0xCu);

  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v19, (uint64_t)CFSTR("APOdmlFeatureCalculatorErrorDomain"), 1005, 0);
  v20 = objc_claimAutoreleasedReturnValue();

  if (!a3 || !v20)
  {
    v12 = (id)v20;
    goto LABEL_17;
  }
  v21 = (void *)v20;
LABEL_15:
  v12 = objc_retainAutorelease(v21);
  v26 = 0;
  *a3 = v12;
LABEL_18:

  return v26;
}

- (id)eventsBetween:(id)a3 and:(id)a4
{
  return 0;
}

- (id)eventName
{
  return CFSTR("Unknown vector builder.");
}

- (id)retrieveFilteredEvents:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const char *v19;
  int isEqualToString;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend_events(self, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v22, v26, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend_objectForKey_(v17, v13, (uint64_t)CFSTR("bundleID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v18, v19, (uint64_t)v4);

        if (isEqualToString)
          objc_msgSend_addObject_(v7, v13, (uint64_t)v17);
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v22, v26, 16);
    }
    while (v14);
  }

  return v7;
}

- (id)pullEvents
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t IsCounterfactual;
  const char *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_shouldDefer(self, a2, v2) & 1) != 0)
    return 0;
  objc_msgSend_lookbackPeriod(self, v4, v5);
  objc_msgSend_eventsForLookbackPeriod_(self, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_buildBundleIDtoAdamIDCache_(self, v9, (uint64_t)v10);
    v11 = v10;
  }
  else
  {
    OdmlLogForCategory(2uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v26 = 138412290;
      v27 = (id)objc_opt_class();
      v13 = v27;
      _os_log_impl(&dword_1B69D6000, v12, OS_LOG_TYPE_ERROR, "[%@] ERROR: No usage events found.", (uint8_t *)&v26, 0xCu);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, (uint64_t)CFSTR("APOdmlFeatureCalculatorErrorDomain"), 1004, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend_eventName(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObject_forKey_(v16, v20, (uint64_t)v19, CFSTR("featureName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    IsCounterfactual = objc_msgSend_assetManagerIsCounterfactual(self, v22, v23);
    objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v25, (uint64_t)v15, v21, IsCounterfactual);

  }
  return v10;
}

- (id)eventsForLookbackPeriod:(double)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  __int128 v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(MEMORY[0x1E0C99D68], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSince1970(v9, v10, v11);
  v13 = v12;

  v17 = v13 - a3;
  if (v13 >= v13 - a3)
  {
    v18 = 0;
    *(_QWORD *)&v16 = 138412290;
    v35 = v16;
    do
    {
      if (v18 > objc_msgSend_maxQueryElements(self, v14, v15, v35))
        break;
      v20 = v13 + -43200.0;
      objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v14, v19, v13 + -43200.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v22, v23, v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_eventsBetween_and_(self, v25, (uint64_t)v21, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend_addObjectsFromArray_(v6, v27, (uint64_t)v26);
        v18 += objc_msgSend_count(v26, v28, v29);
      }
      else
      {
        OdmlLogForCategory(2uLL);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = (void *)objc_opt_class();
          *(_DWORD *)buf = v35;
          v37 = v31;
          v32 = v31;
          _os_log_impl(&dword_1B69D6000, v30, OS_LOG_TYPE_DEFAULT, "[%@] No events found in date range.", buf, 0xCu);

        }
      }

      v13 = v13 + -43200.0;
    }
    while (v20 >= v17);
  }
  objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v14, (uint64_t)v6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (double)weightForEvents:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_date(MEMORY[0x1E0C99D68], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = v4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v39, v43, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v40;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v8);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v19 = 1.0;
        if (objc_msgSend_weightByDuration(self, v11, v12, (_QWORD)v39))
        {
          objc_msgSend_objectForKey_(v17, v18, (uint64_t)CFSTR("duration"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v20;
          if (v20)
          {
            objc_msgSend_doubleValue(v20, v21, v22);
            v19 = v24;
          }

        }
        objc_msgSend_objectForKey_(v17, v18, (uint64_t)CFSTR("absoluteTimestamp"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend_doubleValue(v25, v27, v28);
        objc_msgSend_dateWithTimeIntervalSince1970_(v26, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceDate_(v7, v32, (uint64_t)v31);
        v34 = v33;

        objc_msgSend_exponentialDecayConstant(self, v35, v36);
        v15 = v15 + v19 * exp(v34 / -86400.0 * v37);

      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v39, v43, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 0.0;
  }

  return v15;
}

- (id)updateVector:(id)a3 withVector:(id)a4 usingWeight:(double)a5
{
  id v7;
  double v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;

  v7 = a3;
  *(float *)&v8 = a5;
  objc_msgSend_scalarMultiply_(a4, v9, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v7, v12, v13))
  {
    objc_msgSend_vectorAdd_(v7, v14, (uint64_t)v11);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_version(v7, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend_version(v7, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setVersion_(v11, v21, (uint64_t)v20);

    }
    v16 = v11;
  }
  v22 = v16;

  return v22;
}

- (void)buildBundleIDtoAdamIDCache:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1BCC9B1A4]();
        if ((objc_msgSend_shouldDefer(self, v16, v17) & 1) != 0)
        {
          objc_autoreleasePoolPop(v15);

          goto LABEL_16;
        }
        objc_msgSend_objectForKey_(v14, v18, (uint64_t)CFSTR("bundleID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v7, v20, (uint64_t)v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          objc_msgSend_adamIDForBundleID_(self, v22, (uint64_t)v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v23;
          if (v23 && objc_msgSend_intValue(v23, v24, v25))
            objc_msgSend_setObject_forKey_(v7, v27, (uint64_t)v26, v19);

        }
        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v28, (uint64_t)&v31, v35, 16);
      if (v11)
        continue;
      break;
    }
  }

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1B69EA918;
  v30[3] = &unk_1E6A29688;
  v30[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v7, v29, (uint64_t)v30);
LABEL_16:

}

- (id)adamIDForBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  uint64_t v19;

  v3 = a3;
  v4 = (void *)MEMORY[0x1BCC9B1A4]();
  v5 = objc_alloc(MEMORY[0x1E0CA5870]);
  v19 = 0;
  v7 = (void *)objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v5, v6, (uint64_t)v3, 0, &v19);
  v10 = v7;
  if (v7)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_iTunesMetadata(v7, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_storeItemIdentifier(v12, v13, v14);
    objc_msgSend_numberWithUnsignedLongLong_(v11, v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v17;
}

- (BOOL)shouldDefer
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int shouldDefer;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t IsCounterfactual;
  const char *v30;
  int v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend_task(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_task(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    shouldDefer = objc_msgSend_shouldDefer(v7, v8, v9);

    if (shouldDefer)
    {
      objc_msgSend_task(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = objc_msgSend_deferTask(v13, v14, v15);

      OdmlLogForCategory(2uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if ((_DWORD)v6)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v32 = 138412290;
          v33 = (id)objc_opt_class();
          v18 = v33;
          _os_log_impl(&dword_1B69D6000, v17, OS_LOG_TYPE_DEFAULT, "[%@] We are no longer in an acceptable state to continue processing. Bailing out...", (uint8_t *)&v32, 0xCu);

        }
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v32 = 138412290;
          v33 = (id)objc_opt_class();
          v19 = v33;
          _os_log_impl(&dword_1B69D6000, v17, OS_LOG_TYPE_ERROR, "[%@] Unable to successfully defer task.", (uint8_t *)&v32, 0xCu);

        }
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v20, (uint64_t)CFSTR("APOdmlFeatureCalculatorErrorDomain"), 1003, 0);
        v17 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend_eventName(self, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dictionaryWithObject_forKey_(v21, v25, (uint64_t)v24, CFSTR("featureName"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        IsCounterfactual = objc_msgSend_assetManagerIsCounterfactual(self, v27, v28);
        objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v30, (uint64_t)v17, v26, IsCounterfactual);

      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return (char)v6;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (APOdmlVector)vector
{
  return self->_vector;
}

- (void)setVector:(id)a3
{
  objc_storeStrong((id *)&self->_vector, a3);
}

- (double)vectorWeightTotal
{
  return self->_vectorWeightTotal;
}

- (void)setVectorWeightTotal:(double)a3
{
  self->_vectorWeightTotal = a3;
}

- (APOdmlUnfairLock)setVectorAndWeightLock
{
  return self->_setVectorAndWeightLock;
}

- (void)setSetVectorAndWeightLock:(id)a3
{
  objc_storeStrong((id *)&self->_setVectorAndWeightLock, a3);
}

- (NSMutableDictionary)adamIDtoBundleID
{
  return self->_adamIDtoBundleID;
}

- (void)setAdamIDtoBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_adamIDtoBundleID, a3);
}

- (APOdmlXpcLifecycleHandler)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (double)lookbackPeriod
{
  return self->_lookbackPeriod;
}

- (void)setLookbackPeriod:(double)a3
{
  self->_lookbackPeriod = a3;
}

- (int64_t)maxQueryElements
{
  return self->_maxQueryElements;
}

- (void)setMaxQueryElements:(int64_t)a3
{
  self->_maxQueryElements = a3;
}

- (double)exponentialDecayConstant
{
  return self->_exponentialDecayConstant;
}

- (void)setExponentialDecayConstant:(double)a3
{
  self->_exponentialDecayConstant = a3;
}

- (BOOL)weightByDuration
{
  return self->_weightByDuration;
}

- (void)setWeightByDuration:(BOOL)a3
{
  self->_weightByDuration = a3;
}

- (BOOL)assetManagerIsCounterfactual
{
  return self->_assetManagerIsCounterfactual;
}

- (void)setAssetManagerIsCounterfactual:(BOOL)a3
{
  self->_assetManagerIsCounterfactual = a3;
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_adamIDtoBundleID, 0);
  objc_storeStrong((id *)&self->_setVectorAndWeightLock, 0);
  objc_storeStrong((id *)&self->_vector, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
