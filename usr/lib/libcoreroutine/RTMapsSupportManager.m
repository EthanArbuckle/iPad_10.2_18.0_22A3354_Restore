@implementation RTMapsSupportManager

uint64_t __74__RTMapsSupportManager_fetchHistoryEntryPlaceDisplaysWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchHistoryEntryPlaceDisplaysWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __67__RTMapsSupportManager_fetchHistoryEntryRoutesWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchHistoryEntryRoutesWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __63__RTMapsSupportManager_fetchFavoritePlacesWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchFavoritePlacesWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)fetchHistoryEntryRoutesWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTNotifier queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__RTMapsSupportManager_fetchHistoryEntryRoutesWithOptions_handler___block_invoke;
    block[3] = &unk_1E9296F70;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

- (void)fetchHistoryEntryPlaceDisplaysWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTNotifier queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__RTMapsSupportManager_fetchHistoryEntryPlaceDisplaysWithOptions_handler___block_invoke;
    block[3] = &unk_1E9296F70;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

- (void)fetchFavoritePlacesWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTNotifier queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__RTMapsSupportManager_fetchFavoritePlacesWithOptions_handler___block_invoke;
    block[3] = &unk_1E9296F70;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

- (void)_fetchFavoritePlacesWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  NSObject *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__RTMapsSupportManager__fetchFavoritePlacesWithOptions_handler___block_invoke;
    v9[3] = &unk_1E9296F98;
    v9[4] = self;
    v10 = v6;
    -[RTMapsSupportManager _fetchCollectionPlaceItemsWithOptions:handler:](self, "_fetchCollectionPlaceItemsWithOptions:handler:", a3, v9);
    v8 = v10;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[RTMapsSupportManager _fetchFavoritePlacesWithOptions:handler:]";
      v13 = 1024;
      v14 = 317;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

- (void)_fetchHistoryEntryPlaceDisplaysWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  RTMapsSupportManager *v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__RTMapsSupportManager__fetchHistoryEntryPlaceDisplaysWithOptions_handler___block_invoke;
    v10[3] = &unk_1E9298FC8;
    v13 = v7;
    v11 = v6;
    v12 = self;
    -[RTMapsSupportManager _fetchHistoryPlaceItemsWithOptions:handler:](self, "_fetchHistoryPlaceItemsWithOptions:handler:", v11, v10);

    v9 = v13;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[RTMapsSupportManager _fetchHistoryEntryPlaceDisplaysWithOptions:handler:]";
      v16 = 1024;
      v17 = 474;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

- (void)_fetchHistoryEntryRoutesWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  RTMapsSupportManager *v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__RTMapsSupportManager__fetchHistoryEntryRoutesWithOptions_handler___block_invoke;
    v10[3] = &unk_1E9298FC8;
    v13 = v7;
    v11 = v6;
    v12 = self;
    -[RTMapsSupportManager _fetchHistoryDirectionsItemsWithOptions:handler:](self, "_fetchHistoryDirectionsItemsWithOptions:handler:", v11, v10);

    v9 = v13;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[RTMapsSupportManager _fetchHistoryEntryRoutesWithOptions:handler:]";
      v16 = 1024;
      v17 = 553;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

void __64__RTMapsSupportManager__fetchFavoritePlacesWithOptions_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  RTFavoritePlace *v21;
  void *v22;
  RTFavoritePlace *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = v6;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v7)
    {
      v8 = v7;
      v31 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v34 != v31)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v10, "mapItemStorage");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = a1;
            objc_msgSend(*(id *)(a1 + 32), "mapServiceManager");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "mapItemStorage");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 0;
            objc_msgSend(v13, "mapItemWithIdentifier:geoMapItemStorage:source:creationDate:error:", v14, v15, 16, v16, &v32);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v32;

            _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v18)
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v38 = v10;
                v39 = 2112;
                v40 = v18;
                _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "failed to geocode a place item, %@, error, %@", buf, 0x16u);
              }

              objc_msgSend(v29, "addObject:", v18);
              a1 = v12;
            }
            else
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v38 = v10;
                v39 = 2112;
                v40 = v17;
                _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "place item, %@, map item, %@", buf, 0x16u);
              }

              v21 = [RTFavoritePlace alloc];
              objc_msgSend(v10, "customName");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = -[RTFavoritePlace initWithTitle:mapItem:](v21, "initWithTitle:mapItem:", v22, v17);

              if (v23)
              {
                objc_msgSend(v28, "addObject:", v23);
                a1 = v12;
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
                v24 = objc_claimAutoreleasedReturnValue();
                a1 = v12;
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v38 = v10;
                  _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "failed to allocate place item, %@", buf, 0xCu);
                }

              }
            }

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v8);
    }

    _RTSafeArray();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
    v6 = v27;
  }

}

void __75__RTMapsSupportManager__fetchHistoryEntryPlaceDisplaysWithOptions_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  RTHistoryEntryPlaceDisplay *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v41 = (void *)objc_opt_new();
    v42 = (void *)objc_opt_new();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v40 = v5;
    obj = v5;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v45)
    {
      v44 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v48 != v44)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v7, "mapItemStorage");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            objc_msgSend(*(id *)(a1 + 32), "dateInterval");
            v9 = objc_claimAutoreleasedReturnValue();
            if (!v9)
              goto LABEL_11;
            v10 = (void *)v9;
            objc_msgSend(v7, "createTime");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "dateInterval");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "startDate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "dateInterval");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "endDate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v11, "betweenDate:andDate:", v13, v15);

            if (v16)
            {
LABEL_11:
              v17 = *(void **)(a1 + 40);
              objc_msgSend(v7, "mapItemStorage");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v17, "castReferenceFrame:", objc_msgSend(v18, "referenceFrame"));

              v20 = objc_alloc(MEMORY[0x1E0D183B0]);
              objc_msgSend(v7, "mapItemStorage");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "centerCoordinate");
              v23 = v22;
              objc_msgSend(v7, "mapItemStorage");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "centerCoordinate");
              v25 = (void *)objc_msgSend(v20, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, v19, v23);

              objc_msgSend(*(id *)(a1 + 40), "mapServiceManager");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "mapItemStorage");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = 0;
              objc_msgSend(v26, "mapItemWithIdentifier:geoMapItemStorage:source:creationDate:error:", v27, v28, 128, v29, &v46);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v46;

              _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = v32;
              if (v31)
              {
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v52 = v7;
                  v53 = 2112;
                  v54 = v31;
                  _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "failed to geocode a history place item, %@, error, %@", buf, 0x16u);
                }

                objc_msgSend(v42, "addObject:", v31);
              }
              else
              {
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v52 = v7;
                  v53 = 2112;
                  v54 = v30;
                  _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "history place item, %@, map item, %@", buf, 0x16u);
                }

                if (!v25)
                  goto LABEL_21;
                if (!v30)
                  goto LABEL_21;
                v34 = [RTHistoryEntryPlaceDisplay alloc];
                objc_msgSend(v7, "identifier");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "createTime");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = -[RTHistoryEntryPlaceDisplay initWithIdentifier:usageDate:location:mapItem:](v34, "initWithIdentifier:usageDate:location:mapItem:", v35, v36, v25, v30);

                if (v37)
                {
                  objc_msgSend(v41, "addObject:", v37);
                }
                else
                {
LABEL_21:
                  _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
                  v37 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v52 = v7;
                    _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "failed to allocate history entry place display, %@", buf, 0xCu);
                  }
                }

              }
            }
          }
        }
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v45);
    }

    _RTSafeArray();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
    v5 = v40;
  }

}

void __68__RTMapsSupportManager__fetchHistoryEntryRoutesWithOptions_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
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
  id v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  RTHistoryEntryRoute *v72;
  NSObject *v73;
  RTHistoryEntryRoute *v74;
  void *v75;
  void *v76;
  RTHistoryEntryRoute *v77;
  NSObject *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  id v83;
  void *v84;
  void *v85;
  id obj;
  uint64_t v87;
  uint64_t v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  uint64_t v109;
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a3)
  {
    v84 = (void *)objc_opt_new();
    v85 = (void *)objc_opt_new();
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v83 = v5;
    obj = v5;
    v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
    if (!v88)
      goto LABEL_35;
    v87 = *(_QWORD *)v101;
    v90 = a1;
    while (1)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v101 != v87)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "dateInterval");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
          goto LABEL_10;
        v9 = (void *)v8;
        objc_msgSend(v7, "createTime");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "dateInterval");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "dateInterval");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "endDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v10, "betweenDate:andDate:", v12, v14);

        if (v15)
        {
LABEL_10:
          v92 = v6;
          v16 = *(void **)(a1 + 40);
          objc_msgSend(v7, "routeRequestStorage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "waypoints");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "mapItemStorage");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v16, "castReferenceFrame:", objc_msgSend(v20, "referenceFrame"));

          v95 = objc_alloc(MEMORY[0x1E0D183B0]);
          objc_msgSend(v7, "routeRequestStorage");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "waypoints");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "latLng");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lat");
          v27 = v26;
          objc_msgSend(v7, "routeRequestStorage");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "waypoints");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "firstObject");
          v30 = v7;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "latLng");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "lng");
          v89 = v21;
          v91 = objc_msgSend(v95, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, v21, v27, v33, 1.0);

          objc_msgSend(v30, "routeRequestStorage");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "waypoints");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "firstObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "mapItemStorage");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v97 = v30;
          if (v37)
          {
            objc_msgSend(*(id *)(v90 + 40), "mapServiceManager");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "routeRequestStorage");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "waypoints");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "firstObject");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "mapItemStorage");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = 0;
            objc_msgSend(v38, "mapItemWithIdentifier:geoMapItemStorage:source:creationDate:error:", v39, v43, 64, v44, &v99);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v99;

            v46 = v45;
            if (v45)
            {
              a1 = v90;
              _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
              v47 = objc_claimAutoreleasedReturnValue();
              v6 = v92;
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v105 = v97;
                v106 = 2112;
                v107 = v46;
                _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "failed to geocode a history direction, %@, error, %@", buf, 0x16u);
              }

              objc_msgSend(v85, "addObject:", v46);
              v48 = (void *)v91;
              goto LABEL_22;
            }
          }
          else
          {
            v96 = 0;
          }
          v6 = v92;
          v93 = objc_alloc(MEMORY[0x1E0D183B0]);
          objc_msgSend(v97, "routeRequestStorage");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "waypoints");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "lastObject");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "latLng");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "lat");
          v54 = v53;
          objc_msgSend(v97, "routeRequestStorage");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "waypoints");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "lastObject");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "latLng");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "lng");
          v94 = objc_msgSend(v93, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, v89, v54, v59, 1.0);

          objc_msgSend(v97, "routeRequestStorage");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "waypoints");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "lastObject");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "mapItemStorage");
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          if (v63)
          {
            objc_msgSend(*(id *)(v90 + 40), "mapServiceManager");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "routeRequestStorage");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "waypoints");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "lastObject");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "mapItemStorage");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = 0;
            objc_msgSend(v64, "mapItemWithIdentifier:geoMapItemStorage:source:creationDate:error:", v65, v69, 64, v70, &v98);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = (RTHistoryEntryRoute *)v98;

            if (v72)
            {
              objc_msgSend(v85, "addObject:", v72);
              a1 = v90;
              v48 = (void *)v91;
              v46 = (void *)v94;
              goto LABEL_19;
            }
            a1 = v90;
            v48 = (void *)v91;
            v46 = (void *)v94;
            if (v94 && v71)
            {
              _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
              v73 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v105 = v97;
                v106 = 2112;
                v107 = v71;
                v108 = 2112;
                v109 = v94;
                _os_log_impl(&dword_1D1A22000, v73, OS_LOG_TYPE_INFO, "history direction, %@, map item, %@, location, %@", buf, 0x20u);
              }

              v74 = [RTHistoryEntryRoute alloc];
              objc_msgSend(v97, "identifier");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "createTime");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v82) = objc_msgSend(v97, "navigationInterrupted");
              v77 = v74;
              v46 = (void *)v94;
              v72 = -[RTHistoryEntryRoute initWithIdentifier:usageDate:originLocation:originMapItem:destinationLocation:destinationMapItem:navigationWasInterrupted:](v77, "initWithIdentifier:usageDate:originLocation:originMapItem:destinationLocation:destinationMapItem:navigationWasInterrupted:", v75, v76, v91, v96, v94, v71, v82);

              if (v72)
              {
                objc_msgSend(v84, "addObject:", v72);
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
                v78 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v105 = v97;
                  _os_log_error_impl(&dword_1D1A22000, v78, OS_LOG_TYPE_ERROR, "failed to allocate history direction, %@", buf, 0xCu);
                }

              }
LABEL_19:

            }
          }
          else
          {
            v71 = 0;
            a1 = v90;
            v48 = (void *)v91;
            v46 = (void *)v94;
          }

LABEL_22:
        }
        ++v6;
      }
      while (v88 != v6);
      v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
      v88 = v79;
      if (!v79)
      {
LABEL_35:

        _RTSafeArray();
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        _RTMultiErrorCreate();
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
        v5 = v83;
        goto LABEL_36;
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_36:

}

- (RTMapsSupportManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMapServiceManager_);
}

- (RTMapsSupportManager)initWithMapServiceManager:(id)a3
{
  id v5;
  RTMapsSupportManager *v6;
  RTMapsSupportManager *v7;
  RTMapsSupportManager *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTMapsSupportManager;
    v6 = -[RTNotifier init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_mapServiceManager, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)fetchFavoritePlacesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__RTMapsSupportManager_fetchFavoritePlacesWithHandler___block_invoke;
    v6[3] = &unk_1E9297650;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __55__RTMapsSupportManager_fetchFavoritePlacesWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchFavoritePlacesWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)fetchPinnedPlacesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__RTMapsSupportManager_fetchPinnedPlacesWithHandler___block_invoke;
    v6[3] = &unk_1E9297650;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __53__RTMapsSupportManager_fetchPinnedPlacesWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPinnedPlacesWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)fetchReviewedPlacesWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTNotifier queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__RTMapsSupportManager_fetchReviewedPlacesWithOptions_handler___block_invoke;
    block[3] = &unk_1E9296F70;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

uint64_t __63__RTMapsSupportManager_fetchReviewedPlacesWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchReviewedPlacesWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_showParkedCarBulletinForEvent:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Posting parked car bulletin %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = objc_alloc_init((Class)getMSPMapsPushDaemonRemoteProxyClass());
  objc_msgSend(v5, "showParkedCarBulletinForEvent:", v3);

}

- (void)_showParkedCarReplacementBulletinForEvent:(id)a3 replacingEvent:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Posting replacement bulletin, newEvent, %@, oldEvent, %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = objc_alloc_init((Class)getMSPMapsPushDaemonRemoteProxyClass());
  objc_msgSend(v8, "showParkedCarReplacementBulletinForEvent:replacingEvent:", v5, v6);

}

- (void)_clearParkedCarBulletin
{
  NSObject *v2;
  id v3;
  uint8_t v4[16];

  _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "Clearing parked car bulletin", v4, 2u);
  }

  v3 = objc_alloc_init((Class)getMSPMapsPushDaemonRemoteProxyClass());
  objc_msgSend(v3, "clearParkedCarBulletin");

}

- (void)_fetchFavoritePlacesWithHandler:(id)a3
{
  -[RTMapsSupportManager _fetchFavoritePlacesWithOptions:handler:](self, "_fetchFavoritePlacesWithOptions:handler:", 0, a3);
}

- (void)_fetchCollectionPlaceItemsWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTMapsSupportManager _fetchCollectionPlaceItemsWithOptions:handler:]";
      v27 = 1024;
      v28 = 217;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(v7, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0D473F0]);
    objc_msgSend(v7, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "latitude");
    v14 = v13;
    objc_msgSend(v7, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "longitude");
    v17 = v16;
    objc_msgSend(v7, "distance");
    v19 = (void *)objc_msgSend(v11, "initWithCenterLatitude:centerLongitude:squareSideLengthMeters:", v14, v17, v18);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D473E8]), "initWithPredicate:sortDescriptors:range:", v19, 0, 0);
  }
  v20 = objc_alloc_init(MEMORY[0x1E0D47350]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __70__RTMapsSupportManager__fetchCollectionPlaceItemsWithOptions_handler___block_invoke;
  v22[3] = &unk_1E9297E70;
  v23 = v8;
  v24 = a2;
  v22[4] = self;
  v21 = v8;
  objc_msgSend(v20, "fetchWithOptions:completionHandler:", v10, v22);

}

void __70__RTMapsSupportManager__fetchCollectionPlaceItemsWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__RTMapsSupportManager__fetchCollectionPlaceItemsWithOptions_handler___block_invoke_2;
  block[3] = &unk_1E9297590;
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __70__RTMapsSupportManager__fetchCollectionPlaceItemsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v4;
    v9 = 2048;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "%@, %lu items from query, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_fetchFavoriteItemsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTMapsSupportManager _fetchFavoriteItemsWithHandler:]";
      v14 = 1024;
      v15 = 244;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = objc_alloc_init(MEMORY[0x1E0D47370]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__RTMapsSupportManager__fetchFavoriteItemsWithHandler___block_invoke;
  v9[3] = &unk_1E9297E70;
  v10 = v5;
  v11 = a2;
  v9[4] = self;
  v8 = v5;
  objc_msgSend(v7, "fetchWithCompletionHandler:", v9);

}

void __55__RTMapsSupportManager__fetchFavoriteItemsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__RTMapsSupportManager__fetchFavoriteItemsWithHandler___block_invoke_2;
  block[3] = &unk_1E9297590;
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __55__RTMapsSupportManager__fetchFavoriteItemsWithHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v4;
    v9 = 2048;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "%@, %lu items from query, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_fetchHistoryPlaceItemsWithOptions:(id)a3 handler:(id)a4
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
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  SEL v22;
  _QWORD v23[2];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTMapsSupportManager _fetchHistoryPlaceItemsWithOptions:handler:]";
      v26 = 1024;
      v27 = 261;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(v7, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0D473F0];
    objc_msgSend(v7, "dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    objc_msgSend(v7, "dateInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queryPredicateWithFormat:argumentArray:", CFSTR("createTime >= %@ && createTime <= %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D473E8]), "initWithPredicate:sortDescriptors:range:", v17, 0, 0);
  }
  v18 = objc_alloc_init(MEMORY[0x1E0D473A8]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__RTMapsSupportManager__fetchHistoryPlaceItemsWithOptions_handler___block_invoke;
  v20[3] = &unk_1E9297E70;
  v21 = v8;
  v22 = a2;
  v20[4] = self;
  v19 = v8;
  objc_msgSend(v18, "fetchWithOptions:completionHandler:", v10, v20);

}

void __67__RTMapsSupportManager__fetchHistoryPlaceItemsWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__RTMapsSupportManager__fetchHistoryPlaceItemsWithOptions_handler___block_invoke_2;
  block[3] = &unk_1E9297590;
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __67__RTMapsSupportManager__fetchHistoryPlaceItemsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v4;
    v9 = 2048;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "%@, %lu items from query, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_fetchHistoryDirectionsItemsWithOptions:(id)a3 handler:(id)a4
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
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  SEL v22;
  _QWORD v23[2];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTMapsSupportManager _fetchHistoryDirectionsItemsWithOptions:handler:]";
      v26 = 1024;
      v27 = 288;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(v7, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0D473F0];
    objc_msgSend(v7, "dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    objc_msgSend(v7, "dateInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queryPredicateWithFormat:argumentArray:", CFSTR("createTime >= %@ && createTime <= %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D473E8]), "initWithPredicate:sortDescriptors:range:", v17, 0, 0);
  }
  v18 = objc_alloc_init(MEMORY[0x1E0D47380]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__RTMapsSupportManager__fetchHistoryDirectionsItemsWithOptions_handler___block_invoke;
  v20[3] = &unk_1E9297E70;
  v21 = v8;
  v22 = a2;
  v20[4] = self;
  v19 = v8;
  objc_msgSend(v18, "fetchWithOptions:completionHandler:", v10, v20);

}

void __72__RTMapsSupportManager__fetchHistoryDirectionsItemsWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__RTMapsSupportManager__fetchHistoryDirectionsItemsWithOptions_handler___block_invoke_2;
  block[3] = &unk_1E9297590;
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __72__RTMapsSupportManager__fetchHistoryDirectionsItemsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v4;
    v9 = 2048;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "%@, %lu items from query, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_fetchPinnedPlacesWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__RTMapsSupportManager__fetchPinnedPlacesWithHandler___block_invoke;
    v7[3] = &unk_1E9296F98;
    v7[4] = self;
    v8 = v4;
    -[RTMapsSupportManager _fetchFavoriteItemsWithHandler:](self, "_fetchFavoriteItemsWithHandler:", v7);
    v6 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[RTMapsSupportManager _fetchPinnedPlacesWithHandler:]";
      v11 = 1024;
      v12 = 378;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

void __54__RTMapsSupportManager__fetchPinnedPlacesWithHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  RTPinnedPlace *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = v6;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v7)
    {
      v8 = v7;
      v31 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v34 != v31)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v10, "mapItemStorage");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = a1;
            objc_msgSend(*(id *)(a1 + 32), "mapServiceManager");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "mapItemStorage");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 0;
            objc_msgSend(v13, "mapItemWithIdentifier:geoMapItemStorage:source:creationDate:error:", v14, v15, 8, v16, &v32);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v32;

            _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v18)
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v38 = v10;
                v39 = 2112;
                v40 = v18;
                _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "failed to geocode a favorite item, %@, error, %@", buf, 0x16u);
              }

              objc_msgSend(v29, "addObject:", v18);
              a1 = v12;
            }
            else
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v38 = v10;
                v39 = 2112;
                v40 = v17;
                _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "favorite item, %@, map item, %@", buf, 0x16u);
              }

              v21 = (int)objc_msgSend(v10, "type") - 2;
              a1 = v12;
              if (v21 > 3)
                v22 = 0;
              else
                v22 = qword_1D1EED3D0[v21];
              v23 = -[RTPinnedPlace initWithType:mapItem:]([RTPinnedPlace alloc], "initWithType:mapItem:", v22, v17);
              if (v23)
              {
                objc_msgSend(v28, "addObject:", v23);
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v38 = v10;
                  _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "failed to allocate favorite item, %@", buf, 0xCu);
                }

              }
            }

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v8);
    }

    _RTSafeArray();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
    v6 = v27;
  }

}

- (int)castReferenceFrame:(int)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (void)_fetchReviewedPlacesWrapperWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  SEL v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0D473F0];
    objc_msgSend(a3, "dateInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queryPredicateWithFormat:argumentArray:", CFSTR("modificationTime >= &@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x1E0D473E8]);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("modificationTime"), 0);
    v21 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithPredicate:sortDescriptors:range:", v12, v15, 0);

    v17 = objc_alloc_init(MEMORY[0x1E0D473B8]);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __71__RTMapsSupportManager__fetchReviewedPlacesWrapperWithOptions_handler___block_invoke;
    v18[3] = &unk_1E9297E70;
    v18[4] = self;
    v20 = a2;
    v19 = v7;
    objc_msgSend(v17, "fetchWithOptions:completionHandler:", v16, v18);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTMapsSupportManager _fetchReviewedPlacesWrapperWithOptions:handler:]";
      v25 = 1024;
      v26 = 659;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

void __71__RTMapsSupportManager__fetchReviewedPlacesWrapperWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__RTMapsSupportManager__fetchReviewedPlacesWrapperWithOptions_handler___block_invoke_2;
  block[3] = &unk_1E9297590;
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __71__RTMapsSupportManager__fetchReviewedPlacesWrapperWithOptions_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v4;
    v9 = 2048;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "%@, %lu places from query, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_fetchReviewedPlacesWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__RTMapsSupportManager__fetchReviewedPlacesWithOptions_handler___block_invoke;
    v9[3] = &unk_1E9297EE0;
    v10 = v6;
    v11 = v7;
    -[RTMapsSupportManager _fetchReviewedPlacesWrapperWithOptions:handler:](self, "_fetchReviewedPlacesWrapperWithOptions:handler:", v10, v9);

    v8 = v10;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTMapsSupportManager _fetchReviewedPlacesWithOptions:handler:]";
      v14 = 1024;
      v15 = 681;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

void __64__RTMapsSupportManager__fetchReviewedPlacesWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  RTReviewedPlace *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  RTReviewedPlace *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v33 = objc_msgSend(v5, "count");
    v34 = 2112;
    v35 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, " fetched, %lu, reviewedPlaces, error, %@", buf, 0x16u);
  }
  v24 = v6;

  v25 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "modificationTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "dateInterval");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "compare:", v15);

        if (v16 == 1)
        {
          v17 = [RTReviewedPlace alloc];
          v18 = objc_msgSend(v12, "muid");
          objc_msgSend(v12, "lastSuggestedReviewDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v12, "hasUserReviewed");
          objc_msgSend(v12, "modificationTime");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[RTReviewedPlace initWithMuid:lastSuggestedReviewDate:hasUserReviewed:modifiedDate:](v17, "initWithMuid:lastSuggestedReviewDate:hasUserReviewed:modifiedDate:", v18, v19, v20, v21);

          objc_msgSend(v25, "addObject:", v22);
          _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v33 = (uint64_t)v22;
            _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "reviewed place fetched, %@", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
}

@end
