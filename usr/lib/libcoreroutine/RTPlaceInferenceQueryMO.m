@implementation RTPlaceInferenceQueryMO

+ (id)managedObjectWithPlaceInferenceQuery:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  RTPlaceInferenceQueryMO *v18;
  NSObject *v19;
  const char *v20;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v52[4];
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  uint8_t *v65;
  uint8_t v66[8];
  uint8_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      v18 = 0;
      goto LABEL_17;
    }
    *(_WORD *)v66 = 0;
    v20 = "Invalid parameter not satisfying: placeInferenceQuery";
LABEL_20:
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, v20, v66, 2u);
    goto LABEL_16;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)v66 = 0;
    v20 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_20;
  }
  objc_msgSend(v6, "placeInference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_14;
  *(_QWORD *)v66 = 0;
  v67 = v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__33;
  v70 = __Block_byref_object_dispose__33;
  v71 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __87__RTPlaceInferenceQueryMO_managedObjectWithPlaceInferenceQuery_inManagedObjectContext___block_invoke;
  v62[3] = &unk_1E929ABF8;
  v12 = v6;
  v63 = v12;
  v65 = v66;
  v13 = v8;
  v64 = v13;
  objc_msgSend(v13, "performBlockAndWait:", v62);
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__33;
  v60 = __Block_byref_object_dispose__33;
  v61 = 0;
  if (!objc_msgSend(*((id *)v67 + 5), "count"))
  {
    v52[0] = v11;
    v52[1] = 3221225472;
    v52[2] = __87__RTPlaceInferenceQueryMO_managedObjectWithPlaceInferenceQuery_inManagedObjectContext___block_invoke_2;
    v52[3] = &unk_1E9297AD0;
    v53 = v12;
    v54 = v13;
    v55 = &v56;
    objc_msgSend(v54, "performBlockAndWait:", v52);

  }
  v14 = v57[5];
  if (v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v57[5];
      *(_DWORD *)buf = 138412802;
      v73 = v16;
      v74 = 2112;
      v75 = v12;
      v76 = 2112;
      v77 = v17;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, error persisting visit, %@, error, %@", buf, 0x20u);

    }
  }
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(v66, 8);
  if (!v14)
  {
LABEL_14:
    v18 = -[RTPlaceInferenceQueryMO initWithContext:]([RTPlaceInferenceQueryMO alloc], "initWithContext:", v8);
    objc_msgSend(v6, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceQueryMO setIdentifier:](v18, "setIdentifier:", v21);

    objc_msgSend(v6, "placeInference");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "confidence");
    -[RTPlaceInferenceQueryMO setConfidence:](v18, "setConfidence:");

    objc_msgSend(v6, "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceQueryMO setDate:](v18, "setDate:", v23);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "errorCode"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceQueryMO setErrorCode:](v18, "setErrorCode:", v24);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "fidelityPolicyMask"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceQueryMO setFidelityPolicyMask:](v18, "setFidelityPolicyMask:", v25);

    objc_msgSend(v6, "placeInference");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "referenceLocation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceQueryMO setLocationDate:](v18, "setLocationDate:", v28);

    objc_msgSend(v6, "placeInference");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "referenceLocation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "latitude");
    -[RTPlaceInferenceQueryMO setLocationLatitude:](v18, "setLocationLatitude:");

    objc_msgSend(v6, "placeInference");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "referenceLocation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "longitude");
    -[RTPlaceInferenceQueryMO setLocationLongitude:](v18, "setLocationLongitude:");

    objc_msgSend(v6, "placeInference");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "referenceLocation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "horizontalUncertainty");
    -[RTPlaceInferenceQueryMO setLocationUncertainty:](v18, "setLocationUncertainty:");

    v35 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "placeInference");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "referenceLocation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "numberWithUnsignedInt:", objc_msgSend(v37, "referenceFrame"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceQueryMO setLocationReferenceFrame:](v18, "setLocationReferenceFrame:", v38);

    objc_msgSend(v6, "placeInference");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "mapItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceQueryMO setMapItemIdentifier:](v18, "setMapItemIdentifier:", v41);

    v42 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "placeInference");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "numberWithUnsignedInteger:", objc_msgSend(v43, "placeType"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceQueryMO setPlaceType:](v18, "setPlaceType:", v44);

    objc_msgSend(v6, "sourceIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceQueryMO setSourceIdentifier:](v18, "setSourceIdentifier:", v45);

    v46 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "placeInference");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "numberWithUnsignedInteger:", objc_msgSend(v47, "userType"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceQueryMO setUserType:](v18, "setUserType:", v48);

    v49 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "placeInference");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "numberWithUnsignedInteger:", -[NSObject userTypeSource](v19, "userTypeSource"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceQueryMO setUserTypeSource:](v18, "setUserTypeSource:", v50);

LABEL_17:
    goto LABEL_18;
  }
  v18 = 0;
LABEL_18:

  return v18;
}

void __87__RTPlaceInferenceQueryMO_managedObjectWithPlaceInferenceQuery_inManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "placeInference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v7);

  v8 = *(void **)(a1 + 40);
  v13 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v2, &v13);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v13;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;

}

void __87__RTPlaceInferenceQueryMO_managedObjectWithPlaceInferenceQuery_inManagedObjectContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "placeInference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[RTMapItemMO managedObjectWithMapItem:inManagedObjectContext:](RTMapItemMO, "managedObjectWithMapItem:inManagedObjectContext:", v3, *(_QWORD *)(a1 + 40));

  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v5, "save:", &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
}

- (RTMapItemMO)cachedMapItem
{
  return self->cachedMapItem;
}

- (void)setCachedMapItem:(id)a3
{
  objc_storeStrong((id *)&self->cachedMapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedMapItem, 0);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTPlaceInferenceQueryMO"));
}

- (id)mapItem
{
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[RTPlaceInferenceQueryMO willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("mapItem"));
  -[RTPlaceInferenceQueryMO cachedMapItem](self, "cachedMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTPlaceInferenceQueryMO cachedMapItem](self, "cachedMapItem");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(v6, "setFetchLimit:", 1);
    v7 = (void *)MEMORY[0x1E0CB3880];
    -[RTPlaceInferenceQueryMO mapItemIdentifier](self, "mapItemIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v9);

    v15 = 0;
    objc_msgSend(v6, "execute:", &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v11)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v14;
        v18 = 2112;
        v19 = v11;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@, Error fulfilling transient property mapItem, %@", buf, 0x16u);

      }
    }
    -[RTPlaceInferenceQueryMO didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("mapItem"));
    objc_msgSend(v10, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceQueryMO setCachedMapItem:](self, "setCachedMapItem:", v13);

    return v13;
  }
}

- (void)setMapItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[RTPlaceInferenceQueryMO willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mapItem"));
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceQueryMO setMapItemIdentifier:](self, "setMapItemIdentifier:", v5);

  -[RTPlaceInferenceQueryMO setCachedMapItem:](self, "setCachedMapItem:", v4);
  -[RTPlaceInferenceQueryMO didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mapItem"));
}

@end
