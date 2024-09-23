@implementation RTConnectionsLocation

- (RTConnectionsLocation)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocation_name_originatingBundleID_fullFormattedAddress_mapItemURL_createdAt_);
}

- (RTConnectionsLocation)initWithLocation:(id)a3 name:(id)a4 originatingBundleID:(id)a5 fullFormattedAddress:(id)a6 mapItemURL:(id)a7 createdAt:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  RTConnectionsLocation *v20;
  uint64_t v21;
  RTLocation *location;
  uint64_t v23;
  NSString *name;
  uint64_t v25;
  NSString *originatingBundleID;
  uint64_t v27;
  NSString *fullFormattedAddress;
  uint64_t v29;
  NSURL *mapItemURL;
  uint64_t v31;
  NSDate *createdAt;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)RTConnectionsLocation;
  v20 = -[RTConnectionsLocation init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    location = v20->_location;
    v20->_location = (RTLocation *)v21;

    v23 = objc_msgSend(v15, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    originatingBundleID = v20->_originatingBundleID;
    v20->_originatingBundleID = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    fullFormattedAddress = v20->_fullFormattedAddress;
    v20->_fullFormattedAddress = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    mapItemURL = v20->_mapItemURL;
    v20->_mapItemURL = (NSURL *)v29;

    v31 = objc_msgSend(v19, "copy");
    createdAt = v20->_createdAt;
    v20->_createdAt = (NSDate *)v31;

  }
  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTConnectionsLocation location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTConnectionsLocation name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTConnectionsLocation originatingBundleID](self, "originatingBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTConnectionsLocation fullFormattedAddress](self, "fullFormattedAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTConnectionsLocation mapItemURL](self, "mapItemURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTConnectionsLocation createdAt](self, "createdAt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("location, %@, name, %@, originatingBundleID, %@, fullFormattedAddress, %@, mapItemURL, %@, createdAt, %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (RTLocation)location
{
  return self->_location;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (NSString)fullFormattedAddress
{
  return self->_fullFormattedAddress;
}

- (NSURL)mapItemURL
{
  return self->_mapItemURL;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_mapItemURL, 0);
  objc_storeStrong((id *)&self->_fullFormattedAddress, 0);
  objc_storeStrong((id *)&self->_originatingBundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (id)mapItemUsingMapServiceManager:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[RTConnectionsLocation _mapItemFromLocalSearch:options:](self, "_mapItemFromLocalSearch:options:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[RTConnectionsLocation _mapItemFromForwardGeocode:options:](self, "_mapItemFromForwardGeocode:options:", v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)_mapItemFromLocalSearch:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  dispatch_semaphore_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  dispatch_time_t v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v32;
  _QWORD v33[4];
  NSObject *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint8_t buf[8];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__99;
  v40 = __Block_byref_object_dispose__99;
  v41 = 0;
  -[RTConnectionsLocation name](self, "name");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    -[RTConnectionsLocation location](self, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
    {
      v30 = 0;
      goto LABEL_13;
    }
    v11 = dispatch_semaphore_create(0);
    -[RTConnectionsLocation name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTConnectionsLocation location](self, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __68__RTConnectionsLocation_RTMapItem___mapItemFromLocalSearch_options___block_invoke;
    v33[3] = &unk_1E9297010;
    v35 = &v36;
    v14 = v11;
    v34 = v14;
    objc_msgSend(v6, "fetchMapItemsFromNaturalLanguageQuery:location:options:handler:", v12, v13, v7, v33);

    v15 = v14;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v15, v17))
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "timeIntervalSinceDate:", v16);
    v19 = v18;
    v20 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_79);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v26 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v42, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = objc_retainAutorelease(v28);

    }
    else
    {
LABEL_9:
      v29 = 0;
    }

    v8 = v29;
    -[RTConnectionsLocation _addProactiveExpertSourceTo:](self, "_addProactiveExpertSourceTo:", v37[5]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = 0;
  }

LABEL_13:
  _Block_object_dispose(&v36, 8);

  return v30;
}

void __68__RTConnectionsLocation_RTMapItem___mapItemFromLocalSearch_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch map items with error %@", (uint8_t *)&v11, 0xCu);
    }

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_mapItemFromForwardGeocode:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  dispatch_semaphore_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
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
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v31;
  _QWORD v32[5];
  NSObject *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint8_t buf[16];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__99;
  v39 = __Block_byref_object_dispose__99;
  v40 = 0;
  -[RTConnectionsLocation fullFormattedAddress](self, "fullFormattedAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") == 0;

  if (v9)
  {
    v29 = 0;
  }
  else
  {
    v10 = dispatch_semaphore_create(0);
    -[RTConnectionsLocation fullFormattedAddress](self, "fullFormattedAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __71__RTConnectionsLocation_RTMapItem___mapItemFromForwardGeocode_options___block_invoke;
    v32[3] = &unk_1E9297C38;
    v32[4] = self;
    v34 = &v35;
    v12 = v10;
    v33 = v12;
    objc_msgSend(v6, "fetchMapItemsFromAddressString:options:handler:", v11, v7, v32);

    v13 = v12;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v13, v15))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "timeIntervalSinceDate:", v14);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_79);
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
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v24 = (void *)MEMORY[0x1E0CB35C8];
    v41 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v41, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = objc_retainAutorelease(v26);

    }
    else
    {
LABEL_7:
      v27 = 0;
    }

    v28 = v27;
    -[RTConnectionsLocation _addProactiveExpertSourceTo:](self, "_addProactiveExpertSourceTo:", v36[5]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v35, 8);

  return v29;
}

void __71__RTConnectionsLocation_RTMapItem___mapItemFromForwardGeocode_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "fullFormattedAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Failed to forward geocode address: %@, with error : %@", (uint8_t *)&v12, 0x16u);

    }
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_addProactiveExpertSourceTo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  RTConnectionsLocation *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v24;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v5 = 0;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = v4;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  v8 = self;
  if (!v7)
    goto LABEL_18;
  v9 = v7;
  v10 = *(_QWORD *)v28;
  do
  {
    v11 = 0;
    v26 = v9;
    do
    {
      if (*(_QWORD *)v28 != v10)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v11), "appendSource:", 2048);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[RTConnectionsLocation name](v8, "name");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!-[NSObject length](v13, "length"))
          goto LABEL_14;
        objc_msgSend(v12, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length"))
        {
          -[RTConnectionsLocation name](v8, "name");
          v15 = v10;
          v16 = v6;
          v17 = v5;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          v8 = self;
          v5 = v17;
          v6 = v16;
          v10 = v15;
          v9 = v26;

          if ((v20 & 1) == 0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              -[RTConnectionsLocation name](self, "name");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "name");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v32 = v21;
              v33 = 2112;
              v34 = v22;
              _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "Proactive expert location name (%@) doesn't match resolved name (%@)", buf, 0x16u);

              v8 = self;
            }
LABEL_14:

          }
          objc_msgSend(v5, "addObject:", v12);
          goto LABEL_16;
        }

        goto LABEL_14;
      }
LABEL_16:

      ++v11;
    }
    while (v9 != v11);
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  }
  while (v9);
LABEL_18:

  v4 = v24;
LABEL_20:

  return v5;
}

@end
