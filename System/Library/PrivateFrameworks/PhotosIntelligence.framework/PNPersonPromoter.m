@implementation PNPersonPromoter

- (BOOL)isInQuiescentState
{
  NSNumber *quiescentState;
  void *v4;
  float v5;
  float v6;
  NSNumber *v7;
  NSNumber *v8;
  _BOOL4 v9;
  const __CFString *v10;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  quiescentState = self->_quiescentState;
  if (!quiescentState)
  {
    -[PNPersonPromoter photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pn_faceProcessingProgress");
    v6 = v5;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6 >= 0.95);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_quiescentState;
    self->_quiescentState = v7;

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[NSNumber BOOLValue](self->_quiescentState, "BOOLValue");
      v10 = CFSTR("NO");
      if (v9)
        v10 = CFSTR("YES");
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[PersonPromoter] Executing promoter with quiescent state = %@", (uint8_t *)&v12, 0xCu);
    }
    quiescentState = self->_quiescentState;
  }
  return -[NSNumber BOOLValue](quiescentState, "BOOLValue");
}

- (PNPersonPromoter)initWithPhotoLibrary:(id)a3 andDelegate:(id)a4
{
  id v6;
  id v7;
  PNPersonPromoter *v8;
  PNPersonPromoter *v9;
  PNPersonClusterManager *v10;
  PNPersonClusterManager *personClusterManager;
  PNPersonPromoterProfile *v12;
  PNPersonPromoterProfile *promoterProfile;
  PNPersonDeduperProfile *v14;
  PNPersonDeduperProfile *deduperProfile;
  NSNumber *quiescentState;
  uint64_t v17;
  NSMutableDictionary *metricsReport;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PNPersonPromoter;
  v8 = -[PNPersonPromoter init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PNPersonPromoter setPhotoLibrary:](v8, "setPhotoLibrary:", v6);
    -[PNPersonPromoter setDelegate:](v9, "setDelegate:", v7);
    v10 = -[PNPersonClusterManager initWithPhotoLibrary:]([PNPersonClusterManager alloc], "initWithPhotoLibrary:", v6);
    personClusterManager = v9->_personClusterManager;
    v9->_personClusterManager = v10;

    v12 = objc_alloc_init(PNPersonPromoterProfile);
    promoterProfile = v9->_promoterProfile;
    v9->_promoterProfile = v12;

    v14 = objc_alloc_init(PNPersonDeduperProfile);
    deduperProfile = v9->_deduperProfile;
    v9->_deduperProfile = v14;

    quiescentState = v9->_quiescentState;
    v9->_quiescentState = 0;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    metricsReport = v9->_metricsReport;
    v9->_metricsReport = (NSMutableDictionary *)v17;

  }
  return v9;
}

- (BOOL)promoteUnverifiedPersonsWithUpdateBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v12[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("PNPersonPromoterDisabled"));

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[PersonPromoter] disabled via defaults", v12, 2u);
    }
    v7 = 1;
  }
  else
  {
    -[PNPersonPromoter _verifiedPersonsToProcess](self, "_verifiedPersonsToProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPersonPromoter _sortedUnverifiedPersonsToDedupForVerifiedPersons:type:updateBlock:](self, "_sortedUnverifiedPersonsToDedupForVerifiedPersons:type:updateBlock:", v8, 3, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPersonPromoter _promoteUnverifiedPersons:withVerifiedPersons:updateBlock:](self, "_promoteUnverifiedPersons:withVerifiedPersons:updateBlock:", v9, v8, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
      v7 = -[PNPersonPromoter _promoteInterestingPersons:updateBlock:](self, "_promoteInterestingPersons:updateBlock:", v10, v4);
    else
      v7 = 1;

  }
  return v7;
}

- (id)evaluatePersonPromoterWithUpdateBlock:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonPromoter _sortedUnverifiedPersonsToDedupForVerifiedPersons:type:updateBlock:](self, "_sortedUnverifiedPersonsToDedupForVerifiedPersons:type:updateBlock:", v6, 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonPromoter _promoteUnverifiedPersons:withVerifiedPersons:updateBlock:](self, "_promoteUnverifiedPersons:withVerifiedPersons:updateBlock:", v7, v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_promoteUnverifiedPersons:(id)a3 withVerifiedPersons:(id)a4 updateBlock:(id)a5
{
  id v8;
  id v9;
  double Current;
  void *v11;
  void *v12;
  __int128 v13;
  unint64_t v14;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  CFAbsoluteTime v27;
  __int128 v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *context;
  unint64_t v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  uint8_t v43[128];
  uint8_t v44[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  _BYTE buf[24];
  BOOL v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v31 = a5;
  Current = CFAbsoluteTimeGetCurrent();
  v11 = (void *)objc_opt_new();
  v30 = v9;
  v12 = (void *)objc_msgSend(v9, "mutableCopy");
  v36 = (void *)objc_opt_new();
  v32 = v8;
  v35 = objc_msgSend(v8, "count");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = objc_msgSend(v9, "count");
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v8, "count");
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[PersonPromoter] Executing promoter with %lu verified person, %lu unverified persons", buf, 0x16u);
  }
  if (v35)
  {
    v14 = 0;
    *(_QWORD *)&v13 = 134218240;
    v29 = v13;
    while (1)
    {
      context = (void *)MEMORY[0x249506444]();
      if (!(v35 - v14 >= 0x180 ? 384 : v35 - v14))
        break;
      objc_msgSend(v32, "subarrayWithRange:", v14);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v37, "count");
      objc_msgSend(v36, "addObjectsFromArray:", v37);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v49 = 0;
      v49 = (unint64_t)objc_msgSend(v12, "count") < 0x64;
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        goto LABEL_11;
      objc_msgSend(v36, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __78__PNPersonPromoter__promoteUnverifiedPersons_withVerifiedPersons_updateBlock___block_invoke;
      v42[3] = &unk_25147F910;
      v42[4] = buf;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v42);

      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
LABEL_11:
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v17 = v36;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v39 != v19)
                objc_enumerationMutation(v17);
              v21 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
              v22 = (void *)MEMORY[0x249506444]();
              if (-[PNPersonPromoter _personClusterShouldBeVerified:](self, "_personClusterShouldBeVerified:", v21))
              {
                objc_msgSend(v11, "addObject:", v21);
                objc_msgSend(v12, "addObject:", v21);
              }
              objc_autoreleasePoolPop(v22);
            }
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          }
          while (v18);
        }

        objc_msgSend(v17, "minusSet:", v11);
      }
      else
      {
        v23 = MEMORY[0x24BDACB70];
        v24 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v25 = objc_msgSend(v12, "count");
          *(_DWORD *)v44 = v29;
          v45 = v25;
          v46 = 2048;
          v47 = 100;
          _os_log_impl(&dword_243C3E000, v23, OS_LOG_TYPE_INFO, "[PersonPromoter] -[PNPersonPromoter promoteUnverifiedPersonsWithUpdateBlock:] cannot promote anyone has it is over budget: %lu verified persons > %lu budget", v44, 0x16u);
        }

      }
      _Block_object_dispose(buf, 8);

      objc_autoreleasePoolPop(context);
      v14 += v33;
      if (v14 >= v35)
        goto LABEL_27;
    }
    objc_autoreleasePoolPop(context);
  }
LABEL_27:
  -[PNPersonPromoter _interestingPersonsFromVerifiedPersons:unverifiedPersons:updateBlock:](self, "_interestingPersonsFromVerifiedPersons:unverifiedPersons:updateBlock:", v12, v36, v31, v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v27 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = v27 - Current;
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[PersonPromoter][Perf] Person Promoter took %fs", buf, 0xCu);
  }

  return v26;
}

- (id)advancedStatus
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void (**v7)(void *, uint64_t, _QWORD, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  id v33;
  void *v35;
  void *v36;
  id obj;
  unint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD aBlock[4];
  id v55;
  id v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v38 = +[PNUserDefaults promoterStatusMergeCandidateLimit](PNUserDefaults, "promoterStatusMergeCandidateLimit");
  v3 = +[PNUserDefaults promoterStatusVerifiedPersonLimit](PNUserDefaults, "promoterStatusVerifiedPersonLimit");
  v4 = (void *)objc_opt_new();
  -[PNPersonPromoter personClusterManager](self, "personClusterManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__PNPersonPromoter_advancedStatus__block_invoke;
  aBlock[3] = &unk_25147F958;
  v40 = v5;
  v55 = v40;
  v6 = v4;
  v56 = v6;
  v7 = (void (**)(void *, uint64_t, _QWORD, uint64_t))_Block_copy(aBlock);
  -[PNPersonPromoter _verifiedPersonsToProcess](self, "_verifiedPersonsToProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonPromoter _sortedUnverifiedPersonsToDedupForVerifiedPersons:type:updateBlock:](self, "_sortedUnverifiedPersonsToDedupForVerifiedPersons:type:updateBlock:", v8, 3, &__block_literal_global_278);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PNPersonClusterManager personProcessingSortDescriptors](PNPersonClusterManager, "personProcessingSortDescriptors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v8;
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count") > v3)
  {
    objc_msgSend(v11, "subarrayWithRange:", 0, v3);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v13 = objc_msgSend(v11, "count");
    v14 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134218240;
    v61 = (const char *)v13;
    v62 = 2048;
    v63 = v14;
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PersonPromoter] Executing -[PNPersonPromoter advancedStatus] with %tu verified persons, %tu unverified", buf, 0x16u);
  }
  v35 = v9;
  objc_msgSend(v6, "appendFormat:", CFSTR("Results with with %tu verified persons, %tu unverified\n\n"), objc_msgSend(v11, "count"), objc_msgSend(v9, "count"));
  v15 = (void *)objc_msgSend(v11, "mutableCopy");
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v11;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v51 != v39)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v6, "appendFormat:", CFSTR("Status for %@\n"), v17);
        objc_msgSend(v40, "pn_fetchCandidatePersonsForPerson:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          objc_msgSend(v6, "appendFormat:", CFSTR("\tComparing with %lu merge candicates:\n"), objc_msgSend(v18, "count"));
          objc_msgSend(v18, "fetchedObjects");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[PNPersonClusterManager personProcessingSortDescriptors](PNPersonClusterManager, "personProcessingSortDescriptors");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "sortedArrayUsingDescriptors:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v21, "count") > v38)
          {
            objc_msgSend(v21, "subarrayWithRange:", 0);
            v22 = objc_claimAutoreleasedReturnValue();

            v21 = (void *)v22;
          }
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v23 = v21;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v47;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v47 != v26)
                  objc_enumerationMutation(v23);
                v7[2](v7, v17, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j), 1);
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
            }
            while (v25);
          }

          objc_msgSend(v6, "appendFormat:", CFSTR("\n"));
        }
        objc_msgSend(v15, "removeObject:", v17);
        if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(v6, "appendFormat:", CFSTR("\tComparing with %lu other persons:\n"), objc_msgSend(v15, "count"));
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          v28 = v15;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v43;
            do
            {
              for (k = 0; k != v30; ++k)
              {
                if (*(_QWORD *)v43 != v31)
                  objc_enumerationMutation(v28);
                v7[2](v7, v17, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k), 0);
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
            }
            while (v30);
          }

          objc_msgSend(v6, "appendFormat:", CFSTR("\n"));
        }

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v41);
  }

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v61 = "-[PNPersonPromoter advancedStatus]";
    v62 = 2112;
    v63 = (uint64_t)v6;
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %@", buf, 0x16u);
  }
  v33 = v6;

  return v33;
}

- (double)_personTimespan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PNPersonPromoter photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v4;
  objc_msgSend(v4, "backingMomentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_fetchMomentsWithLocalIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v8;
  objc_msgSend(v8, "fetchedObjects");
  v9 = objc_claimAutoreleasedReturnValue();
  -[PNPersonPromoter delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v9;
  objc_msgSend(v10, "densityClusteringForObjects:maximumDistance:minimumNumberOfObjects:withDistanceBlock:", v9, 2, &__block_literal_global_298, 3888000.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v11;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v42;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "universalStartDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v15;
        objc_msgSend(v15, "universalEndDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v18 = v14;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v38;
          do
          {
            v22 = 0;
            v23 = v16;
            v24 = v17;
            do
            {
              if (*(_QWORD *)v38 != v21)
                objc_enumerationMutation(v18);
              v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v22);
              objc_msgSend(v25, "universalStartDate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "earlierDate:", v26);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v25, "universalEndDate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "laterDate:", v27);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              ++v22;
              v23 = v16;
              v24 = v17;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v20);
        }

        objc_msgSend(v17, "timeIntervalSinceDate:", v16);
        v12 = v12 + v28;

      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v35);
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

- (id)interestingPersonsFromPersons:(id)a3 updateBlock:(id)a4
{
  return -[PNPersonPromoter interestingPersonsFromPersons:detectionType:updateBlock:](self, "interestingPersonsFromPersons:detectionType:updateBlock:", a3, 1, a4);
}

- (id)interestingPersonsFromPersons:(id)a3 detectionType:(signed __int16)a4 updateBlock:(id)a5
{
  id v7;
  void *v8;
  PNPersonPromoterProfile *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PNPersonPromoterProfile *v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  PNPersonPromoterProfile *v30;
  PNPersonPromoterProfile *v31;
  id v32;
  id v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  uint64_t (*v37)(_QWORD *, uint64_t);
  id v38;
  PNPersonPromoterProfile *v39;
  PNPersonPromoterProfile *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t j;
  void *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t k;
  void *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  PNPersonPromoterProfile *v64;
  _QWORD *v65;
  PNPersonPromoterProfile *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t (**v72)(id, _BYTE *, float);
  id v73;
  id v74;
  int v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD aBlock[4];
  PNPersonPromoterProfile *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  char v95;
  uint8_t v96[128];
  uint8_t buf[4];
  unint64_t v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  void *v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v75 = a4;
  v105 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v72 = (uint64_t (**)(id, _BYTE *, float))a5;
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonPromoter photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pn_lastAssetDate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = self->_promoterProfile;
  v95 = 0;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v9 = (PNPersonPromoterProfile *)v7;
  v10 = -[PNPersonPromoterProfile countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v92;
    while (2)
    {
      v13 = v9;
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v92 != v12)
          objc_enumerationMutation(v13);
        v15 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
        v16 = v72[2](v72, &v95, 0.0);
        if (v95)
        {
          v39 = 0;
          v9 = v13;
          v40 = v13;
          v30 = v66;
          goto LABEL_46;
        }
        v17 = (void *)MEMORY[0x249506444](v16);
        v18 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v15, "backingMomentIdentifiers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKey:", v20, v15);

        v21 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v15, "backingFaceIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setObject:forKey:", v23, v15);

        -[PNPersonPromoter _personTimespan:](self, "_personTimespan:", v15);
        if (v24 > 0.0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24 / 86400.0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setObject:forKey:", v25, v15);

        }
        v26 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v15, "lastSeenDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceDate:", v68);
        objc_msgSend(v26, "numberWithDouble:", fabs(v28) / 86400.0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setObject:forKey:", v29, v15);

        objc_autoreleasePoolPop(v17);
      }
      v9 = v13;
      v11 = -[PNPersonPromoterProfile countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
      if (v11)
        continue;
      break;
    }
  }

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke;
  aBlock[3] = &unk_25147FA10;
  v30 = v66;
  v31 = v66;
  v86 = v31;
  v74 = v71;
  v87 = v74;
  v73 = v70;
  v88 = v73;
  v32 = v67;
  v89 = v32;
  v33 = v69;
  v90 = v33;
  v34 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  v37 = (uint64_t (*)(_QWORD *, uint64_t))v34[2];
  if (v75 == 2)
  {
    v38 = (id)v37(v34, 0);
    v39 = v9;
  }
  else
  {
    v76 = (void *)v35;
    v64 = v9;
    v65 = v34;
    v37(v34, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v82;
      v45 = MEMORY[0x24BDACB70];
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v82 != v44)
            objc_enumerationMutation(v41);
          v47 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
          v48 = objc_msgSend(v41, "countForObject:", v47);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v47, "interestingScore");
            *(_DWORD *)buf = 134218498;
            v98 = v48;
            v99 = 2048;
            v100 = v49;
            v101 = 2112;
            v102 = v47;
            _os_log_debug_impl(&dword_243C3E000, v45, OS_LOG_TYPE_DEBUG, "Normal Distributions: [Highly interesting] count:%lu score:%.2f person:%@", buf, 0x20u);
          }
          if (v48 >= -[PNPersonPromoterProfile highlyInterestingPersonNormalDistributionsToMatch](v31, "highlyInterestingPersonNormalDistributionsToMatch"))
          {
            objc_msgSend(v47, "setHighlyInteresting:", 1);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v98 = (unint64_t)v47;
              _os_log_impl(&dword_243C3E000, v45, OS_LOG_TYPE_INFO, "Normal Distributions: [Highly interesting] Elected person %@", buf, 0xCu);
            }
            objc_msgSend(v74, "removeObjectForKey:", v47);
            objc_msgSend(v73, "removeObjectForKey:", v47);
            objc_msgSend(v32, "removeObjectForKey:", v47);
            objc_msgSend(v33, "removeObjectForKey:", v47);
            objc_msgSend(v76, "addObject:", v47);
          }
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
      }
      while (v43);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v50 = -[PNPersonPromoterProfile count](v64, "count");
      v51 = objc_msgSend(v76, "count");
      *(_DWORD *)buf = 134218240;
      v98 = v50;
      v99 = 2048;
      v100 = v51;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[PersonPromoter] Ran first pass of interestingPersonsFromPersons with %tu persons, found %tu highly interesting.", buf, 0x16u);
    }
    ((void (*)(_QWORD *, _QWORD))v65[2])(v65, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v78;
      v56 = MEMORY[0x24BDACB70];
      do
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(_QWORD *)v78 != v55)
            objc_enumerationMutation(v52);
          v58 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
          v59 = objc_msgSend(v52, "countForObject:", v58);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v58, "interestingScore");
            *(_DWORD *)buf = 134218498;
            v98 = v59;
            v99 = 2048;
            v100 = v60;
            v101 = 2112;
            v102 = v58;
            _os_log_debug_impl(&dword_243C3E000, v56, OS_LOG_TYPE_DEBUG, "Normal Distributions: count:%lu score:%.2f person:%@", buf, 0x20u);
          }
          if (v59 >= -[PNPersonPromoterProfile interestingPersonNormalDistributionsToMatch](v31, "interestingPersonNormalDistributionsToMatch"))
          {
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v98 = (unint64_t)v58;
              _os_log_impl(&dword_243C3E000, v56, OS_LOG_TYPE_INFO, "Normal Distributions: Elected person %@", buf, 0xCu);
            }
            objc_msgSend(v76, "addObject:", v58);
          }
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
      }
      while (v54);
    }
    v9 = v64;
    v30 = v66;
    v36 = v76;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v61 = -[PNPersonPromoterProfile count](v64, "count");
      v62 = objc_msgSend(v76, "count");
      *(_DWORD *)buf = 134218240;
      v98 = v61;
      v99 = 2048;
      v100 = v62;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[PersonPromoter] Ran second pass of interestingPersonsFromPersons with %tu persons, found %tu interesting.", buf, 0x16u);
    }
    v39 = v76;

    v34 = v65;
  }

  v40 = v86;
LABEL_46:

  return v39;
}

- (id)_newPersonDeduperWithVerifiedPersons:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  PNPersonDeduper *v18;
  void *v19;
  PNPersonDeduper *v20;
  void *v21;
  id obj;
  void *v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v24 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v4)
  {
    v5 = v4;
    v25 = *(_QWORD *)v32;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v6);
        -[PNPersonPromoter personClusterManager](self, "personClusterManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "pn_fetchInvalidCandidatePersonsForPerson:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "count"))
        {
          v10 = (void *)objc_opt_new();
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v11 = v9;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v28;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v28 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v15), "localIdentifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "addObject:", v16);

                ++v15;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v13);
          }

          objc_msgSend(v7, "localIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v10, v17);

        }
        ++v6;
      }
      while (v6 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v5);
  }

  v18 = [PNPersonDeduper alloc];
  -[PNPersonPromoter personClusterManager](self, "personClusterManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PNPersonDeduper initWithPersonClusterManager:andInvalidCandidatesMapping:profile:](v18, "initWithPersonClusterManager:andInvalidCandidatesMapping:profile:", v19, v24, self->_deduperProfile);

  -[PNPersonDeduper setPersonPromoter:](v20, "setPersonPromoter:", self);
  -[PNPersonPromoter delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonDeduper setDelegate:](v20, "setDelegate:", v21);

  return v20;
}

- (id)_verifiedPersonsToProcess
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
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[PNPersonPromoter personClusterManager](self, "personClusterManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pn_fetchPersonsWithType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") < 0x81)
  {
    v10 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v3, "fetchedObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v15 = objc_msgSend(v3, "count");
      v16 = 2048;
      v17 = 128;
      _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[PersonPromoter] Too many verified persons to dedup, truncating the verified person array. %lu > %lu", buf, 0x16u);
    }
    objc_msgSend(v3, "fetchedObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("sourcePerson.faceCount"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "subarrayWithRange:", 0, 128);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_sortedUnverifiedPersonsToDedupForVerifiedPersons:(id)a3 type:(unint64_t)a4 updateBlock:(id)a5
{
  id v8;
  void (**v9)(id, _BYTE *, float);
  double Current;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void **v35;
  id v36;
  void *v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  CFAbsoluteTime v46;
  double v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *context;
  void *v55;
  id obj;
  void *v57;
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
  char v70;
  uint8_t buf[4];
  double v72;
  __int16 v73;
  uint64_t v74;
  _BYTE v75[128];
  void *v76;
  void *v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _BYTE *, float))a5;
  Current = CFAbsoluteTimeGetCurrent();
  -[PNPersonPromoter personClusterManager](self, "personClusterManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pn_fetchPersonsWithType:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    v70 = 0;
    v13 = (void *)MEMORY[0x24BDBCEB8];
    v55 = v12;
    objc_msgSend(v12, "fetchedObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_318);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v15;
    objc_msgSend(v15, "filterUsingPredicate:", v16);

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v8;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v67;
      v53 = v8;
      v49 = *(_QWORD *)v67;
      v50 = a4;
      while (2)
      {
        v20 = 0;
        v51 = v18;
        do
        {
          if (*(_QWORD *)v67 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v20);
          v22 = (void *)MEMORY[0x249506444]();
          v9[2](v9, &v70, 0.0);
          if (v70)
          {
LABEL_24:
            objc_autoreleasePoolPop(v22);
            v36 = 0;
            v8 = v53;
            goto LABEL_47;
          }
          context = v22;
          v52 = v20;
          -[PNPersonPromoter personClusterManager](self, "personClusterManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "pn_fetchCandidatePersonsForPerson:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v25 = v24;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v63;
            while (2)
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v63 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                v9[2](v9, &v70, 0.0);
                if (v70)
                {

                  v22 = context;
                  goto LABEL_24;
                }
                if ((objc_msgSend(v30, "isVerified") & 1) == 0)
                {
                  v31 = (void *)MEMORY[0x249506444]();
                  objc_msgSend(v57, "removeObject:", v30);
                  -[PNPersonPromoter personClusterManager](self, "personClusterManager");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v78 = v30;
                  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v78, 1);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "mergePersons:withPerson:", v33, v21);

                  objc_autoreleasePoolPop(v31);
                }
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
              if (v27)
                continue;
              break;
            }
          }

          objc_autoreleasePoolPop(context);
          v20 = v52 + 1;
          v8 = v53;
          v19 = v49;
          a4 = v50;
        }
        while (v52 + 1 != v51);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
        if (v18)
          continue;
        break;
      }
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("sourcePerson.faceCount"), 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v34;
      v35 = &v76;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("sourceFaceGroup.faceCountInFaceGroup"), 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v34;
      v35 = &v77;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "sortUsingDescriptors:", v37);

    obj = (id)objc_opt_new();
    v58 = 0u;
    v59 = 0u;
    if (-[PNPersonPromoter isInQuiescentState](self, "isInQuiescentState"))
      v38 = 7;
    else
      v38 = 25;
    v60 = 0uLL;
    v61 = 0uLL;
    v39 = v57;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v59;
      while (2)
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v59 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          v45 = (void *)MEMORY[0x249506444]();
          v9[2](v9, &v70, 0.0);
          if (v70)
          {
            objc_autoreleasePoolPop(v45);

            v36 = 0;
            goto LABEL_47;
          }
          if ((unint64_t)objc_msgSend(obj, "count") >= 0x180)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
            {
              v48 = COERCE_DOUBLE(objc_msgSend(v39, "count"));
              *(_DWORD *)buf = 134218240;
              v72 = v48;
              v73 = 2048;
              v74 = 384;
              _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[PersonPromoter] Too many unverified persons to dedup, truncating the unverified person array. %lu > %lu", buf, 0x16u);
            }
LABEL_43:
            objc_autoreleasePoolPop(v45);
            goto LABEL_44;
          }
          if (objc_msgSend(v44, "faceCount") < v38)
            goto LABEL_43;
          objc_msgSend(obj, "addObject:", v44);
          objc_autoreleasePoolPop(v45);
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
        if (v41)
          continue;
        break;
      }
    }
LABEL_44:

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v46 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      v72 = v46 - Current;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PersonPromoter][Perf] Sort Unverified Persons took %fs", buf, 0xCu);
    }
    v36 = obj;
    obj = v36;
LABEL_47:
    v12 = v55;

  }
  else
  {
    v36 = (id)MEMORY[0x24BDBD1A8];
  }

  return v36;
}

- (BOOL)_personClusterShouldBeVerified:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  const char *v7;
  uint32_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  double v19;
  double v20;
  int v22;
  double v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "quarantined"))
  {
    v5 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = *(double *)&v4;
      v6 = MEMORY[0x24BDACB70];
      v7 = "[PersonPromoter] Cannot promote quarantined person %@";
      v8 = 12;
LABEL_12:
      _os_log_impl(&dword_243C3E000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v22, v8);
      v5 = 0;
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  objc_msgSend(v4, "sideFaceRatio");
  v10 = v9;
  if (v9 < 0.5)
  {
    objc_msgSend(v4, "backingAssetIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    -[PNPersonPromoter personClusterManager](self, "personClusterManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetsToIgnore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "minusSet:", v14);

    v15 = objc_msgSend(v12, "count");
    LODWORD(v13) = -[PNPersonPromoter isInQuiescentState](self, "isInQuiescentState");
    objc_msgSend(v4, "backingMomentIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    if ((_DWORD)v13)
    {
      if (v17 >= 3)
      {
        objc_msgSend(v4, "backingFaceIdentifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 0;
        if ((unint64_t)objc_msgSend(v18, "count") < 0xF || v15 <= 0xE)
          goto LABEL_18;
        v19 = 604800.0;
LABEL_17:
        objc_msgSend(v4, "libraryTimespan");
        v5 = v20 >= v19;
LABEL_18:

LABEL_20:
        goto LABEL_21;
      }
    }
    else if (v17 >= 6)
    {
      objc_msgSend(v4, "backingFaceIdentifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      if ((unint64_t)objc_msgSend(v18, "count") < 0x64 || v15 < 0x32)
        goto LABEL_18;
      v19 = 7776000.0;
      goto LABEL_17;
    }
    v5 = 0;
    goto LABEL_20;
  }
  v5 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v22 = 134218242;
    v23 = v10;
    v24 = 2112;
    v25 = v4;
    v6 = MEMORY[0x24BDACB70];
    v7 = "[PersonPromoter] Cannot promote person with too many side faces, %.3f%% - %@";
    v8 = 22;
    goto LABEL_12;
  }
LABEL_21:

  return v5;
}

- (id)_interestingPersonsFromVerifiedPersons:(id)a3 unverifiedPersons:(id)a4 updateBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  void *v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PNPersonPromoter isInQuiescentState](self, "isInQuiescentState") && !objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_322);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredSetUsingPredicate:", v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v38 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PersonPromoter] No verified persons, result with lower thresholds: %lu", buf, 0xCu);
    }
  }
  else
  {
    v11 = v8;
  }
  if (objc_msgSend(v11, "count"))
  {
    -[PNPersonPromoter interestingPersonsFromPersons:updateBlock:](self, "interestingPersonsFromPersons:updateBlock:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_324);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "filteredSetUsingPredicate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "unionSet:", v15);
      if ((unint64_t)objc_msgSend(v13, "count") <= 9)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          v16 = objc_msgSend(v13, "count");
          *(_DWORD *)buf = 134218240;
          v38 = v16;
          v39 = 2048;
          v40 = 10;
          _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PersonPromoter] No enough interesting persons %lu < %lu, including more persons.", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("interestingScore"), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sortedArrayUsingDescriptors:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v32;
LABEL_11:
          v24 = 0;
          while (1)
          {
            if (*(_QWORD *)v32 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(v13, "addObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v24), (_QWORD)v31);
            if ((unint64_t)objc_msgSend(v13, "count") > 9)
              break;
            if (v22 == ++v24)
            {
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
              if (v22)
                goto LABEL_11;
              break;
            }
          }
        }

      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v28 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 134218242;
        v38 = v28;
        v39 = 2112;
        v40 = (uint64_t)v15;
        _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[PersonPromoter] previouslyVerifiedPersons (%lu): %@", buf, 0x16u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v29 = objc_msgSend(v11, "count");
        *(_DWORD *)buf = 134218242;
        v38 = v29;
        v39 = 2112;
        v40 = (uint64_t)v11;
        _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[PersonPromoter] verifiedPersons (%lu): %@", buf, 0x16u);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v30 = objc_msgSend(v13, "count");
        *(_DWORD *)buf = 134218242;
        v38 = v30;
        v39 = 2112;
        v40 = (uint64_t)v13;
        _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[PersonPromoter] interestingPersons (%lu): %@", buf, 0x16u);
      }
      v25 = v13;

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PersonPromoter] People Home Graph will be empty: Still having no interesting persons", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)_promoteInterestingPersons:(id)a3 updateBlock:(id)a4
{
  id v6;
  double Current;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  char v43;
  id v44;
  uint64_t v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  id v52;
  CFAbsoluteTime v53;
  void *v54;
  PNPersonPromoter *v55;
  void *v56;
  id obj;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *context;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void (**v68)(id, uint64_t, float);
  id v69;
  _QWORD v70[4];
  id v71;
  PNPersonPromoter *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint64_t *v78;
  _BYTE *v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD v96[4];
  void (**v97)(id, uint64_t, float);
  uint64_t *v98;
  _QWORD v99[5];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  char v115;
  uint8_t v116[4];
  CFAbsoluteTime v117;
  __int16 v118;
  id v119;
  _BYTE buf[24];
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _QWORD v126[4];

  v126[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v68 = (void (**)(id, uint64_t, float))a4;
  Current = CFAbsoluteTimeGetCurrent();
  v112 = 0;
  v113 = &v112;
  v114 = 0x2020000000;
  v115 = 0;
  -[PNPersonPromoter photoLibrary](self, "photoLibrary");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_opt_new();
  v66 = (void *)objc_opt_new();
  v67 = (void *)objc_opt_new();
  v55 = self;
  -[PNPersonPromoter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = 0;
  v109 = &v108;
  v110 = 0x2020000000;
  v111 = 0;
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("manualOrder"), 1);
  v126[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v126, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v11);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v59 = *MEMORY[0x24BDE3838];
  v13 = *MEMORY[0x24BDE3850];
  while (v12 < objc_msgSend(v62, "count", v54) - 1)
  {
    objc_msgSend(v62, "objectAtIndexedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "manualOrder");

    objc_msgSend(v62, "objectAtIndexedSubscript:", v12 + 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "manualOrder");

    if (v15 == v59 || v17 == v59)
      break;
    if (v17 - v15 < v13)
      v109[3] = v17;
    ++v12;
  }
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  obj = v6;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
  if (v18)
  {
    v60 = *(_QWORD *)v105;
    do
    {
      v65 = 0;
      v61 = v18;
      do
      {
        if (*(_QWORD *)v105 != v60)
          objc_enumerationMutation(obj);
        v64 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v65);
        context = (void *)MEMORY[0x249506444]();
        v68[2](v68, (uint64_t)(v113 + 3), 0.9);
        if (*((_BYTE *)v113 + 24))
        {
          v19 = 1;
        }
        else if ((objc_msgSend(v64, "hidden") & 1) != 0)
        {
          v19 = 6;
        }
        else
        {
          v20 = objc_msgSend(v64, "manualOrder");
          objc_msgSend(v64, "mergedPersonIdentifiers");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v64, "isVerified") & 1) != 0)
          {
            if (objc_msgSend(v64, "verifiedType") == 1 && v20 == v59 || objc_msgSend(v64, "verifiedType") == 2)
            {
              objc_msgSend(v56, "addObject:", v64);
            }
            else if (objc_msgSend(v64, "verifiedType") == 1 && v20 > v109[3])
            {
              v109[3] = v20;
            }
          }
          else
          {
            v21 = (void *)MEMORY[0x249506444]();
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v64;
              _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[PersonPromoter] Upgrading person %@", buf, 0xCu);
            }
            objc_msgSend(v64, "sourcePerson");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "mergedPersonIdentifiers");
            v23 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "keyFaceForPerson:qualityMeasureByFace:updateBlock:", v22, v9, v68);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              objc_msgSend(v22, "localIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setObject:forKeyedSubscript:", v24, v25);

            }
            else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v64;
              _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "-[PNPersonPromoterDelegate keyFaceForPerson:] Returned nil key face on %@", buf, 0xCu);
            }
            objc_msgSend(v56, "addObject:", v64);

            objc_autoreleasePoolPop(v21);
            v58 = (void *)v23;
          }
          -[PNPersonPromoter photoLibrary](v55, "photoLibrary");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "allObjects");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "pn_fetchPersonsWithLocalIdentifiers:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v29 = v28;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
          if (v30)
          {
            v31 = *(_QWORD *)v101;
            do
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v101 != v31)
                  objc_enumerationMutation(v29);
                v33 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
                objc_msgSend(v33, "keyFace");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v34 == 0;

                if (v35)
                {
                  v36 = (void *)MEMORY[0x249506444]();
                  objc_msgSend(v8, "keyFaceForPerson:qualityMeasureByFace:updateBlock:", v33, v9, v68);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v37)
                  {
                    objc_msgSend(v33, "localIdentifier");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "setObject:forKeyedSubscript:", v37, v38);

                    objc_msgSend(v66, "addObject:", v33);
                  }
                  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v64;
                    _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "-[PNPersonPromoterDelegate keyFaceForPerson:] Returned nil key face on %@", buf, 0xCu);
                  }

                  objc_autoreleasePoolPop(v36);
                }
              }
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
            }
            while (v30);
          }

          v19 = 0;
        }
        objc_autoreleasePoolPop(context);
        if (v19 != 6 && v19)
        {
          v42 = 0;
          v43 = 0;
          v44 = obj;
          goto LABEL_54;
        }
        ++v65;
      }
      while (v65 != v61);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
    }
    while (v18);
  }

  v39 = MEMORY[0x24BDAC760];
  v99[0] = MEMORY[0x24BDAC760];
  v99[1] = 3221225472;
  v99[2] = __59__PNPersonPromoter__promoteInterestingPersons_updateBlock___block_invoke;
  v99[3] = &unk_25147FAB8;
  v99[4] = &v108;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v99);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "filterUsingPredicate:", v40);

  v41 = objc_msgSend(v56, "count");
  if (!*((_BYTE *)v113 + 24))
  {
    v46 = v41;
    if (v41)
    {
      v47 = MEMORY[0x24BDACB70];
      v48 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v49 = objc_msgSend(obj, "count");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v49;
        _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PersonPromoter] Sorting %lu persons, with a total of %lu persons.", buf, 0x16u);
      }

      v96[0] = v39;
      v96[1] = 3221225472;
      v96[2] = __59__PNPersonPromoter__promoteInterestingPersons_updateBlock___block_invoke_329;
      v96[3] = &unk_25147FAE0;
      v97 = v68;
      v98 = &v112;
      -[PNPersonPromoter _graphOrderedPersonsWithPersons:withAllPersons:updateBlock:](v55, "_graphOrderedPersonsWithPersons:withAllPersons:updateBlock:", v56, obj, v96);
      v44 = (id)objc_claimAutoreleasedReturnValue();

      if (*((_BYTE *)v113 + 24))
      {
        v42 = 0;
        v43 = 0;
LABEL_54:

        goto LABEL_55;
      }
    }
    else
    {
      v44 = 0;
    }
    v92 = 0;
    v93 = &v92;
    v94 = 0x2020000000;
    v95 = 0;
    v88 = 0;
    v89 = &v88;
    v90 = 0x2020000000;
    v91 = 0;
    v84 = 0;
    v85 = &v84;
    v86 = 0x2020000000;
    v87 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v121 = __Block_byref_object_copy__285;
    v122 = __Block_byref_object_dispose__286;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v123 = (id)objc_claimAutoreleasedReturnValue();
    v70[0] = v39;
    v70[1] = 3221225472;
    v70[2] = __59__PNPersonPromoter__promoteInterestingPersons_updateBlock___block_invoke_330;
    v70[3] = &unk_25147FB08;
    v71 = v9;
    v72 = v55;
    v73 = obj;
    v74 = v67;
    v78 = &v84;
    v79 = buf;
    v80 = &v92;
    v50 = v54;
    v75 = v50;
    v81 = &v88;
    v76 = v66;
    v82 = &v108;
    v83 = v46;
    v44 = v44;
    v77 = v44;
    v69 = 0;
    v43 = objc_msgSend(v50, "pn_performChangesAndWait:error:", v70, &v69);
    v42 = v69;
    if ((v43 & 1) != 0)
    {
      -[PNPersonPromoter incrementMetricForKey:withValue:](v55, "incrementMetricForKey:withValue:", CFSTR("numberOfPersonsPromotedToGraphVerified"), v93[3]);
      -[PNPersonPromoter incrementMetricForKey:withValue:](v55, "incrementMetricForKey:withValue:", CFSTR("numberOfGraphMergeCandidatesAdded"), v89[3]);
      -[PNPersonPromoter incrementMetricForKey:withValue:](v55, "incrementMetricForKey:withValue:", CFSTR("numberOfFacesAvailableInPeopleHome"), v85[3]);
      -[PNPersonPromoter incrementMetricForKey:withValue:](v55, "incrementMetricForKey:withValue:", CFSTR("numberOfAssetsAvailableInPeopleHome"), objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"));
      -[PNPersonPromoter reportMetrics](v55, "reportMetrics");
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v116 = 138412546;
      v117 = *(double *)&v50;
      v118 = 2112;
      v119 = v42;
      _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[PersonPromoter] Failed to perform changes on library %@: %@", v116, 0x16u);
    }
    v51 = MEMORY[0x24BDACB70];
    v52 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      v53 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)v116 = 134217984;
      v117 = v53 - Current;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PersonPromoter][Perf] Promote Interesting Persons took %fs", v116, 0xCu);
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v84, 8);
    _Block_object_dispose(&v88, 8);
    _Block_object_dispose(&v92, 8);
    goto LABEL_54;
  }
  v42 = 0;
  v43 = 0;
LABEL_55:

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v112, 8);

  return v43;
}

- (id)_graphOrderedPersonsWithPersons:(id)a3 withAllPersons:(id)a4 updateBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
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
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v42;
  void *v43;
  id v44;
  id obj;
  void *v46;
  void *v47;
  uint64_t v48;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  __int128 v52;
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
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _QWORD v67[3];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v60 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v15, "localIdentifier", v42);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v16);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    }
    while (v12);
  }

  -[PNPersonPromoter delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonPromoter personClusterManager](self, "personClusterManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v9;
  objc_msgSend(v17, "performSocialGroupsIdentifiersWithPersonClusterManager:forPersons:overTheYearsComputation:updateBlock:", v18, obj, 0, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[PNPersonPromoter _sortedSocialGroups:withPersonsByLocalIdentifier:](self, "_sortedSocialGroups:withPersonsByLocalIdentifier:", v19, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("highlyInteresting"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v21;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("interestingScore"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v22;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("localIdentifier"), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (void *)objc_opt_new();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v44 = v20;
  v24 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  if (v24)
  {
    v25 = v24;
    v48 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v56 != v48)
          objc_enumerationMutation(v44);
        v27 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
        v28 = (void *)objc_opt_new();
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v29 = v27;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v52;
          do
          {
            for (k = 0; k != v31; ++k)
            {
              if (*(_QWORD *)v52 != v32)
                objc_enumerationMutation(v29);
              v34 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k);
              objc_msgSend(v10, "objectForKeyedSubscript:", v34, v42);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (v35)
              {
                objc_msgSend(v28, "addObject:", v35);
                objc_msgSend(v10, "removeObjectForKey:", v34);
              }

            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
          }
          while (v31);
        }

        if (v28)
        {
          objc_msgSend(v28, "sortUsingDescriptors:", v47);
          objc_msgSend(v46, "addObjectsFromArray:", v28);
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v28;
            _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PersonPromoter][Order] Add from social group: %@", buf, 0xCu);
          }
        }

      }
      v25 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    }
    while (v25);
  }

  objc_msgSend(v10, "allValues");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "count"))
  {
    objc_msgSend(v36, "sortedArrayUsingDescriptors:", v47);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObjectsFromArray:", v37);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v37;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PersonPromoter][Order] Rest of people %@", buf, 0xCu);
    }

  }
  v38 = (void *)MEMORY[0x24BDD1758];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __79__PNPersonPromoter__graphOrderedPersonsWithPersons_withAllPersons_updateBlock___block_invoke;
  v49[3] = &unk_25147FB30;
  v50 = v42;
  v39 = v42;
  objc_msgSend(v38, "predicateWithBlock:", v49);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "filterUsingPredicate:", v40);

  return v46;
}

- (id)_sortedSocialGroups:(id)a3 withPersonsByLocalIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t j;
  void *v17;
  double v18;
  double v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, objc_msgSend(v5, "count"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v40;
          v15 = 0.0;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v40 != v14)
                objc_enumerationMutation(v12);
              objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "interestingScore");
              v19 = v18;

              v15 = v15 + v19;
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v13);
        }
        else
        {
          v15 = 0.0;
        }

        v20 = objc_msgSend(v12, "count");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15 / (double)v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v21, v12);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v8);
  }

  v22 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __69__PNPersonPromoter__sortedSocialGroups_withPersonsByLocalIdentifier___block_invoke;
  v37[3] = &unk_25147FB58;
  v23 = v7;
  v38 = v23;
  objc_msgSend(obj, "sortedArrayUsingComparator:", v37);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__285;
  v35 = __Block_byref_object_dispose__286;
  objc_msgSend(v24, "firstObject");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend((id)v32[5], "count") >= 3)
  {
    v25 = (void *)v32[5];
    v32[5] = 0;

  }
  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __69__PNPersonPromoter__sortedSocialGroups_withPersonsByLocalIdentifier___block_invoke_2;
  v30[3] = &unk_25147FB80;
  v30[4] = &v31;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "filteredArrayUsingPredicate:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v31, 8);
  return v27;
}

- (PNPersonClusterManager)personClusterManager
{
  return self->_personClusterManager;
}

- (void)setPersonClusterManager:(id)a3
{
  objc_storeStrong((id *)&self->_personClusterManager, a3);
}

- (PNPersonPromoterDelegate)delegate
{
  return (PNPersonPromoterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PNPhotoLibraryProtocol)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (NSMutableDictionary)metricsReport
{
  return self->_metricsReport;
}

- (NSNumber)quiescentState
{
  return self->_quiescentState;
}

- (void)setQuiescentState:(id)a3
{
  objc_storeStrong((id *)&self->_quiescentState, a3);
}

- (float)faceProcessingProgress
{
  return self->_faceProcessingProgress;
}

- (void)setFaceProcessingProgress:(float)a3
{
  self->_faceProcessingProgress = a3;
}

- (PNPersonPromoterProfile)promoterProfile
{
  return self->_promoterProfile;
}

- (void)setPromoterProfile:(id)a3
{
  objc_storeStrong((id *)&self->_promoterProfile, a3);
}

- (PNPersonDeduperProfile)deduperProfile
{
  return self->_deduperProfile;
}

- (void)setDeduperProfile:(id)a3
{
  objc_storeStrong((id *)&self->_deduperProfile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deduperProfile, 0);
  objc_storeStrong((id *)&self->_promoterProfile, 0);
  objc_storeStrong((id *)&self->_quiescentState, 0);
  objc_storeStrong((id *)&self->_metricsReport, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_personClusterManager, 0);
}

uint64_t __69__PNPersonPromoter__sortedSocialGroups_withPersonsByLocalIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "compare:", v7);
  return v9;
}

BOOL __69__PNPersonPromoter__sortedSocialGroups_withPersonsByLocalIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = (unint64_t)objc_msgSend(v3, "count") > 2
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) == (_QWORD)v3;

  return v4;
}

uint64_t __79__PNPersonPromoter__graphOrderedPersonsWithPersons_withAllPersons_updateBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

BOOL __59__PNPersonPromoter__promoteInterestingPersons_updateBlock___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;

  v3 = objc_msgSend(a2, "manualOrder");
  return !v3 || v3 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

uint64_t __59__PNPersonPromoter__promoteInterestingPersons_updateBlock___block_invoke_329(uint64_t a1, _BYTE *a2, float a3)
{
  float v5;
  uint64_t result;

  v5 = a3 * 0.1 + 0.9;
  result = (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 32) + 16))(v5);
  *a2 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void __59__PNPersonPromoter__promoteInterestingPersons_updateBlock___block_invoke_330(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char *v26;
  Class v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  PNPersonCluster *v34;
  char *v35;
  float v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  Class v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  char *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  NSObject *v82;
  uint64_t m;
  void *v84;
  char *v85;
  char *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  id obj;
  char *v92;
  char *v93;
  uint64_t v94;
  void *context;
  char *v96;
  void *v97;
  id v98;
  void *v99;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint8_t buf[4];
  char *v126;
  __int16 v127;
  char *v128;
  __int16 v129;
  void *v130;
  _BYTE v131[128];
  _BYTE v132[128];
  void *v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "keyEnumerator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v122;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v122 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setQualityMeasure:", objc_msgSend(v7, "integerValue"));

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 40), "personClusterManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  obj = *(id *)(a1 + 48);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v136, 16);
  v87 = v8;
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v118;
    v89 = *(_QWORD *)v118;
    do
    {
      v12 = 0;
      v90 = v10;
      do
      {
        if (*(_QWORD *)v118 != v11)
          objc_enumerationMutation(obj);
        v13 = *(char **)(*((_QWORD *)&v117 + 1) + 8 * v12);
        context = (void *)MEMORY[0x249506444]();
        if ((objc_msgSend(v13, "isVerified") & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v126 = v13;
            _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[PersonPromoter] Upgrading person %@", buf, 0xCu);
          }
          objc_msgSend(v13, "sourcePerson", v87);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(void **)(a1 + 56);
          objc_msgSend(v14, "localIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            objc_msgSend(v14, "setKeyFace:", v17);
          objc_msgSend(v13, "setIsVerified:", 1);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) += objc_msgSend(v14, "faceCount");
          v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
          objc_msgSend(v13, "sourcePersonBackingAssetIdentifiers");
          v19 = v13;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "unionSet:", v20);

          v13 = v19;
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);

        }
        objc_msgSend(v13, "mergedPersonIdentifiers", v87);
        v21 = (char *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count"))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v126 = v21;
            v127 = 2112;
            v128 = v13;
            _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[PersonPromoter] Adding %@ to person %@", buf, 0x16u);
          }
          v22 = *(void **)(a1 + 64);
          objc_msgSend(v21, "allObjects");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "pn_fetchPersonsWithLocalIdentifiers:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v24;
          objc_msgSend(v13, "pn_addMergeCandidatePersons:", v24);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) += objc_msgSend(v24, "count");
          v26 = v13;
          v27 = NSClassFromString(CFSTR("PHPersonChangeRequest"));
          v98 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          if (v27)
          {
            v94 = v12;
            v92 = v26;
            objc_msgSend(v26, "localIdentifier");
            v93 = v21;
            v96 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setByAddingObject:");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = 0u;
            v114 = 0u;
            v115 = 0u;
            v116 = 0u;
            v28 = v25;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v113, v135, 16);
            v97 = v25;
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v114;
              do
              {
                v32 = 0;
                do
                {
                  if (*(_QWORD *)v114 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v32);
                  if ((objc_msgSend(v33, "isVerified") & 1) == 0)
                  {
                    v34 = -[PNPersonCluster initWithPerson:inPhotoLibrary:]([PNPersonCluster alloc], "initWithPerson:inPhotoLibrary:", v33, *(_QWORD *)(a1 + 64));
                    -[PNPersonCluster localIdentifier](v34, "localIdentifier");
                    v35 = (char *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v8, "mergeConfidenceBetweenPersonLocalIdentifier:andCandidateLocalIdentifiers:", v35, v99);
                    if (v36 >= 0.0)
                    {
                      v38 = v36;
                      -[objc_class changeRequestForPerson:](v27, "changeRequestForPerson:", v33);
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "setMergeCandidateConfidence:", v38);
                      objc_msgSend(v98, "addObject:", v33);

                      v25 = v97;
                    }
                    else
                    {
                      objc_msgSend(v33, "mergeCandidateConfidence");
                      if (v37 == 0.0)
                      {
                        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          v126 = v35;
                          v127 = 2112;
                          v128 = v96;
                          _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[PersonPromoter] no confidence between %@ and %@, skip", buf, 0x16u);
                        }
                      }
                      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412546;
                        v126 = v35;
                        v127 = 2112;
                        v128 = v96;
                        _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PersonPromoter] no confidence between %@ and %@, skip", buf, 0x16u);
                      }
                    }

                  }
                  ++v32;
                }
                while (v30 != v32);
                v40 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v113, v135, 16);
                v30 = v40;
              }
              while (v40);
            }

            if (objc_msgSend(v98, "count"))
            {
              v41 = NSClassFromString(CFSTR("PHPerson"));
              v109 = 0u;
              v110 = 0u;
              v111 = 0u;
              v112 = 0u;
              v42 = v98;
              v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v109, v134, 16);
              if (v43)
              {
                v44 = v43;
                v45 = *(_QWORD *)v110;
                do
                {
                  for (j = 0; j != v44; ++j)
                  {
                    if (*(_QWORD *)v110 != v45)
                      objc_enumerationMutation(v42);
                    v47 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
                    v48 = (void *)MEMORY[0x249506444]();
                    -[objc_class fetchMergeCandidateWithConfidencePersonsForPerson:options:](v41, "fetchMergeCandidateWithConfidencePersonsForPerson:options:", v47, 0);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v49, "count"))
                    {
                      -[objc_class changeRequestForPerson:](v27, "changeRequestForPerson:", v47);
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "removeMergeCandidateWithConfidencePersons:", v49);
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v47, "localIdentifier");
                        v51 = (char *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        v126 = v51;
                        _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[PersonPromoter] removing existing merge candidates with confidence for %@", buf, 0xCu);

                      }
                    }

                    objc_autoreleasePoolPop(v48);
                  }
                  v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v109, v134, 16);
                }
                while (v44);
              }

              objc_msgSend(v92, "sourcePerson");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = v87;
              if (!v52)
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v92, "localIdentifier");
                  v59 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v126 = v59;
                  _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[PersonPromoter] verifiedPHPerson is nil for %@", buf, 0xCu);

                }
                v53 = *(void **)(a1 + 64);
                objc_msgSend(v92, "localIdentifier");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v133 = v54;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v133, 1);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "pn_fetchPersonsWithLocalIdentifiers:", v55);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "fetchedObjects");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "firstObject");
                v52 = (void *)objc_claimAutoreleasedReturnValue();

              }
              -[objc_class changeRequestForPerson:](v27, "changeRequestForPerson:", v52);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "addMergeCandidateWithConfidencePersons:", v42);

              v25 = v97;
            }

            v11 = v89;
            v10 = v90;
            v21 = v93;
            v12 = v94;
          }

        }
        objc_autoreleasePoolPop(context);
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v136, 16);
    }
    while (v10);
  }

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v60 = *(id *)(a1 + 72);
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v105, v132, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v106;
    do
    {
      for (k = 0; k != v62; ++k)
      {
        if (*(_QWORD *)v106 != v63)
          objc_enumerationMutation(v60);
        v65 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * k);
        v66 = *(void **)(a1 + 56);
        objc_msgSend(v65, "localIdentifier", v87);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectForKeyedSubscript:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
          objc_msgSend(v65, "setKeyFace:", v68);

      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v105, v132, 16);
    }
    while (v62);
  }

  v69 = *(_QWORD *)(a1 + 128);
  if (v69)
  {
    v70 = *MEMORY[0x24BDE3850];
    v71 = (*MEMORY[0x24BDE3838] - v70) / v69;
    if (v71 <= 1)
      v71 = 1;
    do
    {
      v72 = v70;
      v70 >>= 1;
    }
    while (v72 > v71);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v86 = *(char **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      v126 = v86;
      _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[PersonPromoter] highestUserManualOrder %lu", buf, 0xCu);
    }
    v73 = *(char **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
    v74 = objc_msgSend(*(id *)(a1 + 48), "count", v87);
    v75 = *(_QWORD *)(a1 + 128);
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v76 = *(id *)(a1 + 80);
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v101, v131, 16);
    if (v77)
    {
      v78 = v77;
      v79 = (char *)(v74 - v75);
      v80 = *(_QWORD *)v102;
      v81 = *MEMORY[0x24BDE3840];
      v82 = MEMORY[0x24BDACB70];
      do
      {
        for (m = 0; m != v78; ++m)
        {
          if (*(_QWORD *)v102 != v80)
            objc_enumerationMutation(v76);
          v84 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * m);
          if ((unint64_t)&v73[v72] >= v81)
            v73 = (char *)v81;
          else
            v73 += v72;
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
          {
            v85 = v79++;
            *(_DWORD *)buf = 134218498;
            v126 = v85;
            v127 = 2048;
            v128 = v73;
            v129 = 2112;
            v130 = v84;
            _os_log_debug_impl(&dword_243C3E000, v82, OS_LOG_TYPE_DEBUG, "[PersonPromoter] Setting index %lu (manual order %lu) to person %@.", buf, 0x20u);
          }
          objc_msgSend(v84, "setManualOrder:", v73);
        }
        v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v101, v131, 16);
      }
      while (v78);
    }

    v8 = v88;
  }

}

uint64_t __89__PNPersonPromoter__interestingPersonsFromVerifiedPersons_unverifiedPersons_updateBlock___block_invoke_323(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isVerified");
}

BOOL __89__PNPersonPromoter__interestingPersonsFromVerifiedPersons_unverifiedPersons_updateBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  _BOOL8 v7;

  v2 = a2;
  objc_msgSend(v2, "backingMomentIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v2, "backingFaceIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "count") < 0xA)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v2, "sourcePerson");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v5, "faceCount") < 7)
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(v2, "libraryTimespan");
        v7 = v6 >= 86400.0;
      }

    }
  }

  return v7;
}

uint64_t __87__PNPersonPromoter__sortedUnverifiedPersonsToDedupForVerifiedPersons_type_updateBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isVerified") ^ 1;
}

id __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  id v38;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t v49;
  char v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint64_t v54;
  char v55;
  _QWORD v56[4];
  id v57;
  id v58;
  uint64_t v59;
  char v60;

  objc_msgSend(MEMORY[0x24BDD14E0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (a2)
    objc_msgSend(v5, "highlyInterestingPersonMomentsCumulativeNormalDistributionUpperTail");
  else
    objc_msgSend(v5, "interestingPersonMomentsCumulativeNormalDistributionUpperTail");
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "interestingPersonMomentsNormalDistributionSigmaFactor");
  v10 = v9;
  v11 = MEMORY[0x24BDAC760];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_2;
  v56[3] = &unk_25147F9C0;
  v57 = *(id *)(a1 + 32);
  v59 = v7;
  v60 = a2;
  v12 = v4;
  v58 = v12;
  +[PNPersonPromoter cumulativeNormalDistributionWithData:sigmaFactor:usingBlock:](PNPersonPromoter, "cumulativeNormalDistributionWithData:sigmaFactor:usingBlock:", v8, v56, v10);
  v13 = *(void **)(a1 + 32);
  if (a2)
    objc_msgSend(v13, "highlyInterestingPersonFacesCumulativeNormalDistributionUpperTail");
  else
    objc_msgSend(v13, "interestingPersonFacesCumulativeNormalDistributionUpperTail");
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "interestingPersonFacesNormalDistributionSigmaFactor");
  v18 = v17;
  v51[0] = v11;
  v51[1] = 3221225472;
  v51[2] = __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_307;
  v51[3] = &unk_25147F9C0;
  v52 = *(id *)(a1 + 32);
  v54 = v15;
  v55 = a2;
  v19 = v12;
  v53 = v19;
  +[PNPersonPromoter cumulativeNormalDistributionWithData:sigmaFactor:usingBlock:](PNPersonPromoter, "cumulativeNormalDistributionWithData:sigmaFactor:usingBlock:", v16, v51, v18);
  v20 = *(void **)(a1 + 32);
  if (a2)
    objc_msgSend(v20, "highlyInterestingPersonTimeCumulativeNormalDistributionUpperTail");
  else
    objc_msgSend(v20, "interestingPersonTimeCumulativeNormalDistributionUpperTail");
  v22 = v21;
  v23 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "interestingPersonTimeNormalDistributionSigmaFactor");
  v25 = v24;
  v46[0] = v11;
  v46[1] = 3221225472;
  v46[2] = __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_308;
  v46[3] = &unk_25147F9C0;
  v47 = *(id *)(a1 + 32);
  v49 = v22;
  v50 = a2;
  v26 = v19;
  v48 = v26;
  +[PNPersonPromoter cumulativeNormalDistributionWithData:sigmaFactor:usingBlock:](PNPersonPromoter, "cumulativeNormalDistributionWithData:sigmaFactor:usingBlock:", v23, v46, v25);
  v27 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v27, "highlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail");
    v29 = v28;
    objc_msgSend(*(id *)(a1 + 32), "highlyInterestingPersonLastSeenCumulativeNormalDistributionUpperTail");
  }
  else
  {
    objc_msgSend(v27, "interestingPersonLastSeenCumulativeNormalDistributionLowerTail");
    v29 = v31;
    objc_msgSend(*(id *)(a1 + 32), "interestingPersonLastSeenCumulativeNormalDistributionUpperTail");
  }
  v32 = v30;
  v33 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "interestingPersonLastSeenNormalDistributionSigmaFactor");
  v35 = v34;
  v40[0] = v11;
  v40[1] = 3221225472;
  v40[2] = __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_309;
  v40[3] = &unk_25147F9E8;
  v41 = *(id *)(a1 + 32);
  v43 = v29;
  v44 = v32;
  v45 = a2;
  v36 = v26;
  v42 = v36;
  +[PNPersonPromoter cumulativeNormalDistributionWithData:sigmaFactor:usingBlock:](PNPersonPromoter, "cumulativeNormalDistributionWithData:sigmaFactor:usingBlock:", v33, v40, v35);
  v37 = v42;
  v38 = v36;

  return v38;
}

void __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_2(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  int v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "interestingPersonMomentsCumulativeNormalDistributionUpperTail");
    v13 = v12;
    objc_msgSend(v11, "localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 134219266;
    v18 = a3;
    v19 = 2048;
    v20 = a4;
    v21 = 2048;
    v22 = a5;
    v23 = 2048;
    v24 = a6;
    v25 = 2048;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Moments Cumulative Normal Distribution: x:%lf mu:%lf sigma:%lf result:%lf upperTail:%lf person:%@", (uint8_t *)&v17, 0x3Eu);

  }
  objc_msgSend(v11, "setInterestingScore:", a6);
  if (*(double *)(a1 + 48) <= a6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      if (*(_BYTE *)(a1 + 56))
        v15 = CFSTR("[Highly interesting] ");
      else
        v15 = &stru_251481610;
      objc_msgSend(v11, "localIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = *(double *)&v15;
      v19 = 2112;
      v20 = *(double *)&v16;
      _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Moments Cumulative Normal Distribution: %@Elected person %@", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  }

}

void __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_307(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "interestingPersonFacesCumulativeNormalDistributionUpperTail");
    v14 = v13;
    objc_msgSend(v11, "localIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134219266;
    v19 = a3;
    v20 = 2048;
    v21 = a4;
    v22 = 2048;
    v23 = a5;
    v24 = 2048;
    v25 = a6;
    v26 = 2048;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Faces Cumulative Normal Distribution: x:%lf mu:%lf sigma:%lf result:%lf upperTail:%lf person:%@", (uint8_t *)&v18, 0x3Eu);

  }
  objc_msgSend(v11, "interestingScore");
  objc_msgSend(v11, "setInterestingScore:", v12 + a6);
  if (*(double *)(a1 + 48) <= a6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      if (*(_BYTE *)(a1 + 56))
        v16 = CFSTR("[Highly interesting] ");
      else
        v16 = &stru_251481610;
      objc_msgSend(v11, "localIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = *(double *)&v16;
      v20 = 2112;
      v21 = *(double *)&v17;
      _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Faces Cumulative Normal Distribution: %@Elected person %@", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  }

}

void __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_308(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  int v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "interestingPersonTimeCumulativeNormalDistributionUpperTail");
    v13 = v12;
    objc_msgSend(v11, "localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 134219266;
    v18 = a3;
    v19 = 2048;
    v20 = a4;
    v21 = 2048;
    v22 = a5;
    v23 = 2048;
    v24 = a6;
    v25 = 2048;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Time Cumulative Normal Distribution: x:%lf mu:%lf sigma:%lf result:%lf upperTail:%lf person:%@", (uint8_t *)&v17, 0x3Eu);

  }
  if (*(double *)(a1 + 48) <= a6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      if (*(_BYTE *)(a1 + 56))
        v15 = CFSTR("[Highly interesting] ");
      else
        v15 = &stru_251481610;
      objc_msgSend(v11, "localIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = *(double *)&v15;
      v19 = 2112;
      v20 = *(double *)&v16;
      _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Time Cumulative Normal Distribution: %@Elected person %@", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  }

}

void __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_309(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  int v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "interestingPersonLastSeenCumulativeNormalDistributionLowerTail");
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 32), "interestingPersonLastSeenCumulativeNormalDistributionUpperTail");
    v16 = v15;
    objc_msgSend(v11, "localIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 134219522;
    v21 = a3;
    v22 = 2048;
    v23 = a4;
    v24 = 2048;
    v25 = a5;
    v26 = 2048;
    v27 = a6;
    v28 = 2048;
    v29 = v14;
    v30 = 2048;
    v31 = v16;
    v32 = 2112;
    v33 = v17;
    _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Last Seen Cumulative Normal Distribution: x:%lf mu:%lf sigma:%lf result:%lf lowerTail:%lf upperTail:%lf person:%@", (uint8_t *)&v20, 0x48u);

  }
  objc_msgSend(v11, "interestingScore");
  objc_msgSend(v11, "setInterestingScore:", (1.0 - a6 + v12) / 3.0);
  if (*(double *)(a1 + 48) >= a6 || *(double *)(a1 + 56) <= a6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      if (*(_BYTE *)(a1 + 64))
        v18 = CFSTR("[Highly interesting] ");
      else
        v18 = &stru_251481610;
      objc_msgSend(v11, "localIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = *(double *)&v18;
      v22 = 2112;
      v23 = *(double *)&v19;
      _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Last Seen Cumulative Normal Distribution: %@Elected person %@", (uint8_t *)&v20, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  }

}

double __36__PNPersonPromoter__personTimespan___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  double v12;
  void *v13;
  void *v14;
  double v15;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "universalStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "universalEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "universalStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "compare:", v8) != 1 && objc_msgSend(v8, "compare:", v7) != 1;
  v11 = objc_msgSend(v6, "compare:", v9) != 1 && objc_msgSend(v9, "compare:", v7) != 1;
  v12 = 0.0;
  if (!v11 && !v10)
  {
    objc_msgSend(v7, "earlierDate:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "laterDate:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v14);
    v12 = fabs(v15);

  }
  return v12;
}

void __34__PNPersonPromoter_advancedStatus__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  float v13;
  float v14;
  id v15;
  void *v16;
  float v17;
  float v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  unsigned __int16 v42;
  id v43;
  unsigned __int16 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x249506444]();
  v10 = objc_msgSend(*(id *)(a1 + 32), "numberOfAssetsInCommonBetweenPerson:andPerson:", v7, v8);
  v11 = objc_msgSend(*(id *)(a1 + 32), "numberOfMomentsInCommonBetweenPerson:andPerson:", v7, v8);
  v44 = 0;
  v12 = *(void **)(a1 + 32);
  v43 = 0;
  objc_msgSend(v12, "distanceBetweenPerson:andPerson:useCommonMoments:minAgeType:updateBlock:error:", v7, v8, 0, &v44, &__block_literal_global, &v43);
  v14 = v13;
  v15 = v43;
  if (v15)
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("Error: Got an error while getting distances: %@\n"), v15);

  v42 = 0;
  v16 = *(void **)(a1 + 32);
  v41 = 0;
  objc_msgSend(v16, "distanceBetweenPerson:andPerson:useCommonMoments:minAgeType:updateBlock:error:", v7, v8, 1, &v42, &__block_literal_global_268, &v41);
  v18 = v17;
  v19 = v41;
  if (v19)
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("Error: Got an error while getting distances with common moments: %@\n"), v19);
  v20 = objc_msgSend(*(id *)(a1 + 32), "assetsOverlapBetweenPerson:andPerson:", v7, v8);
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\t\tDistance: %.3f (ageType:%hu), Distance with common moments %.3f (ageType:%hu), common assets: %tu (asset overlap: %zd), common moments: %tu. for %@\n"), v14, v44, v18, v42, v10, v20, v11, v8);
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "pn_fetchFaceGroupsForPerson:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isVerified") & 1) != 0 || objc_msgSend(v21, "count") == 1)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v23)
      {
        v24 = v23;
        v33 = v21;
        v34 = v19;
        v25 = a1;
        v35 = v9;
        v36 = v7;
        v26 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v38 != v26)
              objc_enumerationMutation(v22);
            v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            if (objc_msgSend(v28, "isDirty"))
            {
              v29 = *(void **)(v25 + 40);
              objc_msgSend(v8, "localIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "localIdentifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "appendFormat:", CFSTR("\t\t\tOther person %@ has a dirty cluster %@. Face count in face group: %lu, person face count: %lu\n"), v30, v31, objc_msgSend(v28, "faceCountInFaceGroup"), objc_msgSend(v8, "faceCount"));

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v24);
        v9 = v35;
        v7 = v36;
        v21 = v33;
        v19 = v34;
      }
    }
    else
    {
      v32 = *(void **)(a1 + 40);
      objc_msgSend(v8, "localIdentifier");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "appendFormat:", CFSTR("Error: Other person %@ should have one face group: %@\n"), v22, v21);
    }

  }
  objc_autoreleasePoolPop(v9);

}

unint64_t __78__PNPersonPromoter__promoteUnverifiedPersons_withVerifiedPersons_updateBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t result;

  result = objc_msgSend(a2, "faceCount");
  if (result >= 0x64)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (BOOL)isEnabled
{
  return 1;
}

+ (id)_personPromoterInformationAtURL:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDD1580];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("PersonPromoter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "fileExistsAtPath:", v7)
    || (v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v7)) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (BOOL)_writePersonPromoterInformation:(id)a3 atURL:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  objc_msgSend(a4, "URLByAppendingPathComponent:", CFSTR("PersonPromoter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "writeToURL:atomically:", v6, 0);

  return v7;
}

+ (BOOL)hasProcessedForLibrary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(a3, "pn_persistentStorageDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_personPromoterInformationAtURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "unsignedIntegerValue") == 15)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ProcessedInQuiescentState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)setProcessed:(BOOL)a3 forLibrary:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(v6, "pn_persistentStorageDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_personPromoterInformationAtURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v4)
  {
    objc_msgSend(v9, "setObject:forKey:", &unk_25149A270, CFSTR("Version"));
    objc_msgSend(v10, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("ProcessedInQuiescentState"));
    v11 = objc_msgSend(v6, "pn_numberOfFacesWithFaceprints");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("NumberOfFacesProcessedOnLastRun"));

  }
  else
  {
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("Version"));
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("ProcessedInQuiescentState"));
  }
  if ((objc_msgSend(a1, "_writePersonPromoterInformation:atURL:", v10, v7) & 1) == 0
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v13 = 138412290;
    v14 = v10;
    _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error setting the People Promoter hasProcessed: %@", (uint8_t *)&v13, 0xCu);
  }

}

+ (id)requestSuggestedMePersonIdentifierAtURL:(id)a3 withError:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pn_errorWithCode:localizedDescription:", 1, CFSTR("Me inference is handled by VU."));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (unint64_t)numberOfFacesProcessedOnLastRunAtURL:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a1, "_personPromoterInformationAtURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NumberOfFacesProcessedOnLastRun"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

+ (void)probabilityDensityNormalDistributionWithData:(id)a3 sigmaFactor:(double)a4 usingBlock:(id)a5
{
  NSMapTable *v7;
  void (**v8)(id, _QWORD, double, double, double, double, double);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  long double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  void *v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v7 = (NSMapTable *)a3;
  v8 = (void (**)(id, _QWORD, double, double, double, double, double))a5;
  NSAllMapTableValues(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD1548];
  v44[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "expressionForFunction:arguments:", CFSTR("average:"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "expressionValueWithObject:context:", 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v17 = (void *)MEMORY[0x24BDD1548];
  v43 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "expressionForFunction:arguments:", CFSTR("stddev:"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "expressionValueWithObject:context:", 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  v23 = v22 * a4;
  v24 = v23 * (v23 + v23);
  v25 = exp(-((v16 - v16) * (v16 - v16)) / v24);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[NSMapTable keyEnumerator](v7, "keyEnumerator", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v27)
  {
    v28 = v27;
    v29 = 1.0 / sqrt(v24 * 3.14159265);
    v30 = v25 * v29;
    v31 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(v26);
        v33 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[NSMapTable objectForKey:](v7, "objectForKey:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "doubleValue");
        v36 = v35;
        v37 = exp(-((v35 - v16) * (v35 - v16)) / v24);
        v8[2](v8, v33, v36, v16, v23, v29 * v37, v30);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v28);
  }

}

+ (void)cumulativeNormalDistributionWithData:(id)a3 sigmaFactor:(double)a4 usingBlock:(id)a5
{
  NSMapTable *v7;
  void (**v8)(id, _QWORD, double, double, double, double);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  long double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  void *v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v7 = (NSMapTable *)a3;
  v8 = (void (**)(id, _QWORD, double, double, double, double))a5;
  if (-[NSMapTable count](v7, "count"))
  {
    NSAllMapTableValues(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1548];
    v40[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "expressionForFunction:arguments:", CFSTR("average:"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "expressionValueWithObject:context:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    v17 = (void *)MEMORY[0x24BDD1548];
    v39 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "expressionForFunction:arguments:", CFSTR("median:"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "expressionValueWithObject:context:", 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[NSMapTable keyEnumerator](v7, "keyEnumerator", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = v22 * a4;
      v27 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(v23);
          v29 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[NSMapTable objectForKey:](v7, "objectForKey:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          v32 = v31;
          v33 = erfc((v16 - v31) / v26 * 0.707106781);
          v8[2](v8, v29, v32, v16, v26, fmin(v33 * 0.5, 1.0));

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v25);
    }

  }
}

- (void)incrementMetricForKey:(id)a3 withValue:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (a4)
  {
    v6 = a3;
    -[PNPersonPromoter metricsReport](self, "metricsReport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9 + a4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[PNPersonPromoter metricsReport](self, "metricsReport");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v6);

  }
}

- (void)reportMetrics
{
  id v2;

  -[PNPersonPromoter metricsReport](self, "metricsReport");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    objc_msgSend(MEMORY[0x24BE121D0], "sendEvent:withPayload:", CFSTR("com.apple.Photos.People.personPromoter"), v2);

}

@end
