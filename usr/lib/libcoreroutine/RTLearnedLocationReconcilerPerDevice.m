@implementation RTLearnedLocationReconcilerPerDevice

- (RTLearnedLocationReconcilerPerDevice)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPersistenceManager_);
}

- (RTLearnedLocationReconcilerPerDevice)initWithPersistenceManager:(id)a3
{
  id v5;
  RTLearnedLocationReconcilerPerDevice *v6;
  RTLearnedLocationReconcilerPerDevice *v7;
  RTLearnedLocationReconcilerPerDevice *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  RTLearnedLocationReconcilerPerDevice *v12;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  objc_super v17;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTLearnedLocationReconcilerPerDevice;
    v6 = -[RTLearnedLocationReconcilerPerDevice init](&v17, sel_init);
    v7 = v6;
    if (v6)
    {
      v8 = v6;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (const char *)-[RTLearnedLocationReconcilerPerDevice UTF8String](objc_retainAutorelease(v8), "UTF8String");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v8);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v10 = (const char *)objc_msgSend(v13, "UTF8String");

      }
      v14 = dispatch_queue_create(v10, v9);

      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v14;

      objc_storeStrong((id *)&v8->_persistenceManager, a3);
    }
    self = v7;
    v12 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", buf, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (id)_sortDescriptorForReconciliation
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("deviceClass"), 1, &__block_literal_global_120);
}

uint64_t __72__RTLearnedLocationReconcilerPerDevice__sortDescriptorForReconciliation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  const __CFString *v7;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("iPhone")))
  {
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("iPhone")) - 1;
    goto LABEL_20;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Watch")))
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Watch")) & 1) == 0)
    {
      v7 = CFSTR("iPhone");
      goto LABEL_17;
    }
LABEL_12:
    v6 = 0;
    goto LABEL_20;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("iPad")))
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("iPad")) & 1) != 0)
      goto LABEL_12;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("iPhone")) & 1) == 0)
    {
      v7 = CFSTR("Watch");
      goto LABEL_17;
    }
LABEL_15:
    v6 = 1;
    goto LABEL_20;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Mac")))
    goto LABEL_15;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Mac")) & 1) != 0)
    goto LABEL_12;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("iPhone")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("Watch")) & 1) != 0)
  {
    goto LABEL_15;
  }
  v7 = CFSTR("iPad");
LABEL_17:
  if (objc_msgSend(v5, "isEqualToString:", v7))
    v6 = 1;
  else
    v6 = -1;
LABEL_20:

  return v6;
}

- (void)performReconciliationWithHandler:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke;
  block[3] = &unk_1E9298E88;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(queue, block);

}

void __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = *(void **)(v2 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_2;
  v7[3] = &unk_1E9297A08;
  v7[4] = v2;
  v5 = v3;
  v6 = a1[6];
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "createManagedObjectContext:", v7);

}

void __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_3;
  v8[3] = &unk_1E9297590;
  v4 = (void *)a1[5];
  v8[4] = a1[4];
  v9 = v3;
  v5 = v4;
  v6 = a1[6];
  v10 = v5;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v7, "performBlock:", v8);

}

void __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t k;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id obj;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  _QWORD v94[5];
  id v95;
  _QWORD v96[4];
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[4];
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[4];
  id v113;
  id v114;
  _QWORD v115[3];
  void *v116;
  void *v117;
  _QWORD v118[2];
  _BYTE v119[128];
  _BYTE v120[128];
  void *v121;
  _BYTE buf[24];
  uint64_t (*v123)(uint64_t, uint64_t);
  _BYTE v124[20];
  _QWORD v125[2];
  _BYTE v126[128];
  _QWORD v127[2];
  _QWORD v128[6];

  v128[3] = *MEMORY[0x1E0C80C00];
  v83 = (void *)objc_opt_new();
  +[RTDeviceMO fetchRequest](RTDeviceMO, "fetchRequest");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sortDescriptorForReconciliation");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB3928];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.@count"), CFSTR("visits"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sortDescriptorWithKey:ascending:", v2, 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v78, "setFetchBatchSize:", 1);
  v3 = *(void **)(a1 + 40);
  v114 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v78, &v114);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v114;
  if (v77)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v77);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceClass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v6, "isEqualToString:", CFSTR("iPhone"));

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v73)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      objc_msgSend(*(id *)(a1 + 40), "currentDevice");
      v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v123 = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, prioritizeCurrentDevice, %@, current device, %@", buf, 0x20u);

    }
    if (v73)
    {
      v11 = (void *)MEMORY[0x1E0CB3928];
      v112[0] = MEMORY[0x1E0C809B0];
      v112[1] = 3221225472;
      v112[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_25;
      v112[3] = &unk_1E92A5540;
      v113 = *(id *)(a1 + 40);
      objc_msgSend(v11, "sortDescriptorWithKey:ascending:comparator:", CFSTR("identifier"), 1, v112);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v128[0] = v76;
      v128[1] = v12;
      v128[2] = v74;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "sortedArrayUsingDescriptors:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v113;
    }
    else
    {
      v127[0] = v76;
      v127[1] = v74;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "sortedArrayUsingDescriptors:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    obj = v14;
    v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
    if (v82)
    {
      v84 = 0;
      v81 = *(_QWORD *)v109;
      do
      {
        for (i = 0; i != v82; ++i)
        {
          if (*(_QWORD *)v109 != v81)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("place.mapItem"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTCloudManagedObject notTombstonedPredicate](RTCloudManagedObject, "notTombstonedPredicate");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x1E0CB3528];
          v125[0] = v92;
          v125[1] = v90;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "visits");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "allObjects");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "filteredArrayUsingPredicate:", v88);
          v86 = (id)objc_claimAutoreleasedReturnValue();

          v22 = (void *)MEMORY[0x1E0CB3880];
          v106[0] = MEMORY[0x1E0C809B0];
          v106[1] = 3221225472;
          v106[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_2_35;
          v106[3] = &unk_1E929B8A8;
          v23 = v83;
          v107 = v23;
          objc_msgSend(v22, "predicateWithBlock:", v106);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "filteredArrayUsingPredicate:", v85);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(*(SEL *)(a1 + 56));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v24, "count");
            objc_msgSend(v23, "firstObject");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "entryDate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringFromDate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v84;
            *(_WORD *)&buf[22] = 2112;
            v123 = (uint64_t (*)(uint64_t, uint64_t))v17;
            *(_WORD *)v124 = 2048;
            *(_QWORD *)&v124[2] = v27;
            *(_WORD *)&v124[10] = 2112;
            *(_QWORD *)&v124[12] = v30;
            _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, idx, %lu, device, %@, filtered visit count, %lu, filter date, %@", buf, 0x34u);

          }
          if (objc_msgSend(v24, "count"))
          {
            objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = v31;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "sortedArrayUsingDescriptors:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            v104 = 0u;
            v105 = 0u;
            v102 = 0u;
            v103 = 0u;
            objc_msgSend(v33, "reverseObjectEnumerator");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
            if (v35)
            {
              v36 = *(_QWORD *)v103;
              do
              {
                for (j = 0; j != v35; ++j)
                {
                  if (*(_QWORD *)v103 != v36)
                    objc_enumerationMutation(v34);
                  objc_msgSend(v23, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * j), 0);
                }
                v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
              }
              while (v35);
            }

          }
          ++v84;
        }
        v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
      }
      while (v82);
    }

    if ((v73 & 1) != 0)
      goto LABEL_48;
    v101 = 0u;
    v99 = 0u;
    v100 = 0u;
    v98 = 0u;
    v87 = obj;
    v91 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
    if (v91)
    {
      v89 = *(_QWORD *)v99;
      do
      {
        for (k = 0; k != v91; ++k)
        {
          if (*(_QWORD *)v99 != v89)
            objc_enumerationMutation(v87);
          v39 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("place.mapItem"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTCloudManagedObject notTombstonedPredicate](RTCloudManagedObject, "notTombstonedPredicate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)MEMORY[0x1E0CB3528];
          v118[0] = v93;
          v118[1] = v40;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 2);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "andPredicateWithSubpredicates:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "visits");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "allObjects");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "filteredArrayUsingPredicate:", v43);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v47 = (void *)MEMORY[0x1E0CB3880];
          v96[0] = MEMORY[0x1E0C809B0];
          v96[1] = 3221225472;
          v96[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_39;
          v96[3] = &unk_1E929B8A8;
          v48 = v83;
          v97 = v48;
          objc_msgSend(v47, "predicateWithBlock:", v96);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "filteredArrayUsingPredicate:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v50, "count"))
          {
            objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = v51;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "sortedArrayUsingDescriptors:", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v48, "addObjectsFromArray:", v53);
          }

        }
        v91 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
      }
      while (v91);
    }

    +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setSortDescriptors:", v56);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != $RT_CURRENT_DEVICE"), CFSTR("device"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v83, "lastObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "exitDate");
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = (void *)v60;
    if (v60)
    {
      objc_msgSend(v58, "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("entryDate"), v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("entryDate"), v63);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("place.mapItem"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)MEMORY[0x1E0CB3528];
    v115[0] = v57;
    v115[1] = v62;
    v115[2] = v64;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 3);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "andPredicateWithSubpredicates:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setPredicate:", v67);

    v68 = *(void **)(a1 + 40);
    v95 = 0;
    objc_msgSend(v68, "executeFetchRequest:error:", v54, &v95);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v95;
    if (v70)
    {
      v71 = *(_QWORD *)(a1 + 48);
      if (v71)
        (*(void (**)(uint64_t, _QWORD, id))(v71 + 16))(v71, 0, v70);
    }
    else
    {
      objc_msgSend(v83, "addObjectsFromArray:", v69);
    }

    if (!v70)
    {
LABEL_48:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v123 = __Block_byref_object_copy__165;
      *(_QWORD *)v124 = __Block_byref_object_dispose__165;
      *(_QWORD *)&v124[8] = 0;
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_48;
      v94[3] = &unk_1E929B858;
      v94[4] = buf;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v94);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "filterUsingPredicate:", v72);
      objc_msgSend(*(id *)(a1 + 32), "collapseReconciledVisitsToLocationsOfInterest:context:handler:", v83, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

      _Block_object_dispose(buf, 8);
    }

  }
}

uint64_t __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = -1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "isEqual:", v13);

    v11 = v14;
  }

  return v11;
}

uint64_t __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_2_35(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "exitDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isOnOrBefore:", v5);

  return v6;
}

uint64_t __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_39(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "entryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exitDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isOnOrAfter:", v5);

  return v6;
}

uint64_t __73__RTLearnedLocationReconcilerPerDevice_performReconciliationWithHandler___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;

  v6 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_QWORD *)(v8 + 40))
  {
    objc_msgSend(v6, "entryDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "exitDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isAfterDate:", v10);

    if (!v11)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v8 + 40), a2);
  v12 = 1;
LABEL_6:

  return v12;
}

- (void)collapseReconciledVisitsToLocationsOfInterest:(id)a3 context:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  RTLearnedLocation *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  RTLearnedPlace *v60;
  RTLearnedLocationOfInterest *v61;
  void *v62;
  RTLearnedLocationOfInterest *v63;
  NSObject *v64;
  _BOOL4 v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v78;
  uint64_t v79;
  void *v80;
  id v81;
  uint64_t v82;
  id obj;
  uint64_t v84;
  void *v85;
  RTLearnedPlace *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  RTLearnedLocation *v92;
  void *context;
  _QWORD v94[4];
  id v95;
  id v96;
  RTLearnedLocationReconcilerPerDevice *v97;
  id v98;
  id v99;
  _QWORD v100[5];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _QWORD v106[5];
  uint8_t buf[4];
  const char *v108;
  __int16 v109;
  int v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v74 = a5;
  v75 = v8;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v108 = "-[RTLearnedLocationReconcilerPerDevice collapseReconciledVisitsToLocationsOfInterest:context:handler:]";
      v109 = 1024;
      v110 = 308;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("place"), 1, &__block_literal_global_54_1);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("place"), 1, &__block_literal_global_55_0);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("place"), 1, &__block_literal_global_56);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("place"), 1, &__block_literal_global_57);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("place"), 1, &__block_literal_global_58);
  v76 = (void *)v10;
  v106[0] = v10;
  v106[1] = v11;
  v72 = (void *)v12;
  v73 = (void *)v11;
  v106[2] = v12;
  v106[3] = v13;
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)v13;
  v106[4] = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = v15;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v105, 16);
  v18 = MEMORY[0x1E0C809B0];
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v102;
    v80 = v16;
    v81 = v7;
    v79 = *(_QWORD *)v102;
    do
    {
      v21 = 0;
      v82 = v19;
      do
      {
        if (*(_QWORD *)v102 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v21);
        context = (void *)MEMORY[0x1D8231EA8]();
        v100[0] = v18;
        v100[1] = 3221225472;
        v100[2] = __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_6;
        v100[3] = &unk_1E929B880;
        v100[4] = v22;
        if (objc_msgSend(v16, "indexOfObjectPassingTest:", v100) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v90 = v21;
          v23 = objc_alloc(MEMORY[0x1E0D183B0]);
          objc_msgSend(v22, "locationLatitude");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "doubleValue");
          v26 = v25;
          objc_msgSend(v22, "locationLongitude");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "doubleValue");
          v29 = v28;
          objc_msgSend(v22, "locationHorizontalUncertainty");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          v32 = v31;
          objc_msgSend(v22, "locationAltitude");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          v35 = v34;
          objc_msgSend(v22, "locationVerticalUncertainty");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "doubleValue");
          v38 = v37;
          objc_msgSend(v22, "locationReferenceFrame");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "intValue");
          objc_msgSend(v22, "locationSourceAccuracy");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v23, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v40, (int)objc_msgSend(v41, "intValue"), v26, v29, v32, v35, v38, 0.0);

          v43 = [RTLearnedLocation alloc];
          objc_msgSend(v22, "locationSourceAccuracy");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = (void *)v42;
          v92 = -[RTLearnedLocation initWithLocation:dataPointCount:type:](v43, "initWithLocation:dataPointCount:type:", v42, objc_msgSend(v44, "intValue") == 2, 2);

          objc_msgSend(v22, "place");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "mapItem");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            v47 = (void *)MEMORY[0x1E0D183E8];
            objc_msgSend(v22, "place");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "mapItem");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "createWithManagedObject:", v49);
            v91 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v91 = 0;
          }
          v86 = [RTLearnedPlace alloc];
          objc_msgSend(v22, "place");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "identifier");
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = (void *)v50;
          if (!v50)
          {
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v50 = objc_claimAutoreleasedReturnValue();
            v78 = (void *)v50;
          }
          v84 = v50;
          objc_msgSend(v22, "place");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "type");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v85, "unsignedIntegerValue");
          objc_msgSend(v22, "place");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "typeSource");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "unsignedIntegerValue");
          objc_msgSend(v22, "place");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "customLabel");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "expirationDate");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v86, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v84, v52, v55, v91, v57, v58, v59);

          if (!v51)
          v61 = [RTLearnedLocationOfInterest alloc];
          -[RTLearnedPlace identifier](v60, "identifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v61, "initWithIdentifier:location:place:visits:transitions:", v62, v92, v60, 0, 0);

          if (v63)
          {
            v16 = v80;
            objc_msgSend(v80, "addObject:", v63);
            v7 = v81;
            v19 = v82;
            v18 = MEMORY[0x1E0C809B0];
            v20 = v79;
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v64 = objc_claimAutoreleasedReturnValue();
            v65 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
            v16 = v80;
            v7 = v81;
            v18 = MEMORY[0x1E0C809B0];
            v20 = v79;
            v19 = v82;
            if (v65)
            {
              *(_DWORD *)buf = 138412290;
              v108 = (const char *)v22;
              _os_log_error_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_ERROR, "the learned location of interest was nil, visit, %@", buf, 0xCu);
            }

          }
          v21 = v90;
        }
        objc_autoreleasePoolPop(context);
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v105, 16);
    }
    while (v19);
  }

  v94[0] = v18;
  v94[1] = 3221225472;
  v94[2] = __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_66;
  v94[3] = &unk_1E9297F08;
  v95 = v7;
  v96 = v16;
  v97 = self;
  v98 = v75;
  v99 = v74;
  v66 = v74;
  v67 = v75;
  v68 = v16;
  v69 = v7;
  objc_msgSend(v67, "performBlock:", v94);

}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;
  BOOL v21;

  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iso3166SubdivisionCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "mapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iso3166SubdivisionCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

      v12 = 0;
LABEL_14:

      goto LABEL_15;
    }
  }
  objc_msgSend(v6, "mapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "iso3166SubdivisionCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(v7, "mapItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "address");
    v20 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "iso3166SubdivisionCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v17 == 0;

    v7 = v20;
  }

  if (v10)
  {

  }
  if (!v21)
  {
    objc_msgSend(v6, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iso3166SubdivisionCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v12 = -1;
    else
      v12 = 1;
    goto LABEL_14;
  }
  v12 = 0;
LABEL_15:

  return v12;
}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;
  BOOL v21;

  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iso3166CountryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "mapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iso3166CountryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

      v12 = 0;
LABEL_14:

      goto LABEL_15;
    }
  }
  objc_msgSend(v6, "mapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "iso3166CountryCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(v7, "mapItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "address");
    v20 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "iso3166CountryCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v17 == 0;

    v7 = v20;
  }

  if (v10)
  {

  }
  if (!v21)
  {
    objc_msgSend(v6, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iso3166CountryCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v12 = -1;
    else
      v12 = 1;
    goto LABEL_14;
  }
  v12 = 0;
LABEL_15:

  return v12;
}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D185C0];
  v9 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D185C0]);
  objc_msgSend(v5, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v8);

  if (v9 == v12)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v4, "mapItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "category");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", v8))
      v15 = 1;
    else
      v15 = -1;

  }
  return v15;
}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "geoAddressData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "geoAddressData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (v8 != 0) ^ (v11 == 0);

  if ((v12 & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v4, "mapItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "address");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "geoAddressData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v13 = -1;
    else
      v13 = 1;

  }
  return v13;
}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mapItemPlaceType") != 1000;
  objc_msgSend(v5, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = v7 ^ (objc_msgSend(v8, "mapItemPlaceType") == 1000);
  if ((v5 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "mapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "mapItemPlaceType") == 1000)
      v9 = 1;
    else
      v9 = -1;

  }
  return v9;
}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x1E0D183E8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "place");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createWithManagedObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "place");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToMapItem:", v7);

  return v10;
}

void __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_66(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  RTLearnedLocation *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  RTLearnedVisit *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  int v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  RTLearnedLocationOfInterest *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  RTLearnedLocationOfInterest *v83;
  void *v84;
  NSObject *v85;
  _BOOL4 v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  id obj;
  void *v96;
  void *v97;
  RTLearnedTransition *v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  RTLearnedTransition *v105;
  RTLearnedVisit *v106;
  RTLearnedVisit *v107;
  void *v108;
  void *context;
  _QWORD v110[5];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  RTLearnedVisit *v118;
  __int16 v119;
  RTLearnedTransition *v120;
  _BYTE v121[128];
  uint64_t v122;

  v1 = a1;
  v122 = *MEMORY[0x1E0C80C00];
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = MEMORY[0x1E0C809B0];
    v6 = *(_QWORD *)v112;
    v101 = v1;
    v93 = *(_QWORD *)v112;
    do
    {
      v7 = 0;
      v94 = v3;
      do
      {
        if (*(_QWORD *)v112 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v7);
        context = (void *)MEMORY[0x1D8231EA8]();
        v110[0] = v5;
        v9 = *(void **)(v1 + 40);
        v110[1] = 3221225472;
        v110[2] = __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_2_67;
        v110[3] = &unk_1E929B880;
        v110[4] = v8;
        v10 = objc_msgSend(v9, "indexOfObjectPassingTest:", v110);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v11 = v8;
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v116 = v11;
            _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "the learned location of interest was not found, visit, %@", buf, 0xCu);
          }
        }
        else
        {
          v102 = v10;
          v103 = v4;
          v100 = v7;
          v13 = objc_alloc(MEMORY[0x1E0D183B0]);
          objc_msgSend(v8, "locationLatitude");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = v15;
          objc_msgSend(v8, "locationLongitude");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          v19 = v18;
          objc_msgSend(v8, "locationHorizontalUncertainty");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValue");
          v22 = v21;
          objc_msgSend(v8, "locationAltitude");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          v25 = v24;
          objc_msgSend(v8, "locationVerticalUncertainty");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "doubleValue");
          v28 = v27;
          objc_msgSend(v8, "locationReferenceFrame");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "intValue");
          objc_msgSend(v8, "locationSourceAccuracy");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v13, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v30, (int)objc_msgSend(v31, "intValue"), v16, v19, v22, v25, v28, 0.0);

          v33 = [RTLearnedLocation alloc];
          objc_msgSend(v8, "dataPointCount");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "unsignedIntegerValue");
          objc_msgSend(v8, "confidence");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "doubleValue");
          v99 = v32;
          v37 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](v33, "initWithLocation:dataPointCount:confidence:", v32, v35);

          v107 = [RTLearnedVisit alloc];
          objc_msgSend(v8, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "entryDate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "exitDate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "creationDate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (uint64_t)v41;
          if (!v41)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v42 = objc_claimAutoreleasedReturnValue();
            v90 = (void *)v42;
          }
          objc_msgSend(v8, "expirationDate");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "placeConfidence");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "doubleValue");
          v46 = v45;
          objc_msgSend(v8, "placeSource");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = objc_msgSend(v47, "unsignedIntegerValue");
          v48 = v107;
          v108 = (void *)v37;
          v106 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](v48, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v38, v37, v39, v40, v42, v43, v46, v89);

          if (!v41)
          objc_msgSend(v103, "device");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "identifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "device");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "identifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "outbound");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "predominantMotionActivityType");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "unsignedIntegerValue");
          objc_msgSend(v8, "inbound");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "predominantMotionActivityType");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "unsignedIntegerValue");
          v57 = objc_msgSend(v49, "isEqual:", v50);
          if (v53 == v56)
            v58 = 1;
          else
            v58 = v57;
          if (v58)
            v59 = v56;
          else
            v59 = 0;
          v104 = v59;

          v98 = [RTLearnedTransition alloc];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "exitDate");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = (uint64_t)v61;
          if (!v61)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v62 = objc_claimAutoreleasedReturnValue();
            v92 = (void *)v62;
          }
          objc_msgSend(v8, "entryDate");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "identifier");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (uint64_t)v64;
          if (!v64)
          {
            objc_msgSend(MEMORY[0x1E0CB3A28], "nilUUID");
            v65 = objc_claimAutoreleasedReturnValue();
            v91 = (void *)v65;
          }
          objc_msgSend(v8, "identifier");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "expirationDate");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v98, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v60, v62, v63, v65, v66, v67, v68, v104);

          if (!v64)
          if (!v61)

          objc_msgSend(*(id *)(v101 + 40), "objectAtIndex:", v102);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v69, "visits");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "arrayWithArray:", v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          if (v106)
          {
            objc_msgSend(v72, "addObject:", v106);
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v73 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v116 = v108;
              v117 = 2112;
              v118 = 0;
              v119 = 2112;
              v120 = v105;
              _os_log_error_impl(&dword_1D1A22000, v73, OS_LOG_TYPE_ERROR, "dropping reconciled visit because the learned visit was nil, location, %@, visit, %@, transition, %@", buf, 0x20u);
            }

          }
          v74 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v69, "transitions");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "arrayWithArray:", v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          if (v105)
          {
            objc_msgSend(v76, "addObject:", v105);
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v77 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v116 = v108;
              v117 = 2112;
              v118 = v106;
              v119 = 2112;
              v120 = 0;
              _os_log_error_impl(&dword_1D1A22000, v77, OS_LOG_TYPE_ERROR, "dropping reconciled transition because the learned visit was nil, location, %@, visit, %@, transition, %@", buf, 0x20u);
            }

          }
          v78 = [RTLearnedLocationOfInterest alloc];
          objc_msgSend(v69, "place");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "identifier");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "location");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "place");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v78, "initWithIdentifier:location:place:visits:transitions:", v80, v81, v82, v72, v76);

          if (v83)
          {
            v1 = v101;
            objc_msgSend(*(id *)(v101 + 40), "setObject:atIndexedSubscript:", v83, v102);
            v84 = v103;
            v5 = MEMORY[0x1E0C809B0];
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v85 = objc_claimAutoreleasedReturnValue();
            v86 = os_log_type_enabled(v85, OS_LOG_TYPE_ERROR);
            v1 = v101;
            v84 = v103;
            v5 = MEMORY[0x1E0C809B0];
            if (v86)
            {
              *(_DWORD *)buf = 138412802;
              v116 = v108;
              v117 = 2112;
              v118 = v106;
              v119 = 2112;
              v120 = v105;
              _os_log_error_impl(&dword_1D1A22000, v85, OS_LOG_TYPE_ERROR, "dropping reconciled visit because the updated learned location of interest was nil, location, %@, visit, %@, transition, %@", buf, 0x20u);
            }

          }
          v4 = v8;

          v6 = v93;
          v3 = v94;
          v12 = v99;
          v7 = v100;
        }

        objc_autoreleasePoolPop(context);
        ++v7;
      }
      while (v3 != v7);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  logReconciledGraph(*(void **)(v1 + 40), 1);
  +[RTLearnedLocationReconcilerPerVisit submitMetricsOnReconciledGraphDensity:algorithm:persistenceManager:managedObjectContext:](RTLearnedLocationReconcilerPerVisit, "submitMetricsOnReconciledGraphDensity:algorithm:persistenceManager:managedObjectContext:", *(_QWORD *)(v1 + 32), 1, *(_QWORD *)(*(_QWORD *)(v1 + 48) + 16), *(_QWORD *)(v1 + 56));
  v87 = *(_QWORD *)(v1 + 64);
  if (v87)
  {
    v88 = (void *)objc_msgSend(*(id *)(v1 + 40), "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v87 + 16))(v87, v88, 0);

  }
}

uint64_t __102__RTLearnedLocationReconcilerPerDevice_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_2_67(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x1E0D183E8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "place");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createWithManagedObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "place");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToMapItem:", v7);

  return v10;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
