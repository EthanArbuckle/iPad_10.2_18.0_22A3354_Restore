@implementation RTLearnedVisitMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("RTLearnedVisitMO"));
}

- (NSNumber)locationHorizontalUncertainty
{
  void *v3;

  -[RTLearnedVisitMO willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("locationUncertainty"));
  -[RTLearnedVisitMO primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("locationUncertainty"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedVisitMO didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("locationUncertainty"));
  return (NSNumber *)v3;
}

- (void)setLocationHorizontalUncertainty:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[RTLearnedVisitMO locationUncertainty](self, "locationUncertainty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[RTCloudManagedObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("locationUncertainty"));
    -[RTLearnedVisitMO setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("locationUncertainty"));
    -[RTLearnedVisitMO didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("locationUncertainty"));
  }

}

- (id)finerGranularityMapItem
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[RTLearnedVisitMO willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("finerGranularityMapItem"));
  -[RTLearnedVisitMO finerGranularityMapItemIdentifier](self, "finerGranularityMapItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTLearnedVisitMO cachedFinerGranularityMapItem](self, "cachedFinerGranularityMapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[RTLearnedVisitMO finerGranularityMapItemIdentifier](self, "finerGranularityMapItemIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      +[RTMapItemMO mapItemForIdentifier:error:](RTMapItemMO, "mapItemForIdentifier:error:", v6, &v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v13;
      -[RTLearnedVisitMO setCachedFinerGranularityMapItem:](self, "setCachedFinerGranularityMapItem:", v7);

      if (v8)
      {
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedVisitMO finerGranularityMapItemIdentifier](self, "finerGranularityMapItemIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v15 = v11;
          v16 = 2112;
          v17 = v8;
          v18 = 2112;
          v19 = v12;
          _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, Error fulfilling transient property finerGranularityMapItemIdentifier, %@, map item identifier, %@", buf, 0x20u);

        }
      }
    }
  }
  else
  {
    -[RTLearnedVisitMO setCachedFinerGranularityMapItem:](self, "setCachedFinerGranularityMapItem:", 0);
  }
  -[RTLearnedVisitMO didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("finerGranularityMapItem"));
  -[RTLearnedVisitMO cachedFinerGranularityMapItem](self, "cachedFinerGranularityMapItem");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setFinerGranularityMapItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[RTCloudManagedObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("finerGranularityMapItem"));
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedVisitMO setFinerGranularityMapItemIdentifier:](self, "setFinerGranularityMapItemIdentifier:", v5);

  -[RTLearnedVisitMO setCachedFinerGranularityMapItem:](self, "setCachedFinerGranularityMapItem:", v4);
  -[RTLearnedVisitMO didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("finerGranularityMapItem"));
}

- (BOOL)intersectsWithVisit:(id)a3 distanceCalculator:(id)a4
{
  RTLearnedVisitMO *v6;
  id v7;
  RTLearnedVisitMO *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  uint64_t v43;
  void *v44;
  void *v45;
  double v46;
  BOOL v47;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;

  v6 = (RTLearnedVisitMO *)a3;
  v7 = a4;
  if (v6 == self)
  {
    v47 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      v54 = objc_alloc(MEMORY[0x1E0D183B0]);
      -[RTLearnedVisitMO locationLatitude](self, "locationLatitude");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "doubleValue");
      v10 = v9;
      -[RTLearnedVisitMO locationLongitude](self, "locationLongitude");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "doubleValue");
      v12 = v11;
      -[RTLearnedVisitMO locationHorizontalUncertainty](self, "locationHorizontalUncertainty");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;
      -[RTLearnedVisitMO locationAltitude](self, "locationAltitude");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v18 = v17;
      -[RTLearnedVisitMO locationVerticalUncertainty](self, "locationVerticalUncertainty");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;
      -[RTLearnedVisitMO entryDate](self, "entryDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedVisitMO locationReferenceFrame](self, "locationReferenceFrame");
      v56 = v7;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v25 = v24;
      -[RTLearnedVisitMO locationSourceAccuracy](self, "locationSourceAccuracy");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)objc_msgSend(v54, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v22, v25, (int)objc_msgSend(v26, "intValue"), v10, v12, v15, v18, v21, 0.0);

      v49 = objc_alloc(MEMORY[0x1E0D183B0]);
      -[RTLearnedVisitMO locationLatitude](v8, "locationLatitude");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "doubleValue");
      v28 = v27;
      -[RTLearnedVisitMO locationLongitude](v8, "locationLongitude");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "doubleValue");
      v30 = v29;
      -[RTLearnedVisitMO locationHorizontalUncertainty](v8, "locationHorizontalUncertainty");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32;
      -[RTLearnedVisitMO locationAltitude](v8, "locationAltitude");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      v36 = v35;
      -[RTLearnedVisitMO locationVerticalUncertainty](v8, "locationVerticalUncertainty");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      v39 = v38;
      -[RTLearnedVisitMO entryDate](v8, "entryDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedVisitMO locationReferenceFrame](v8, "locationReferenceFrame");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "doubleValue");
      v43 = v42;
      -[RTLearnedVisitMO locationSourceAccuracy](v8, "locationSourceAccuracy");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v49, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v40, v43, (int)objc_msgSend(v44, "intValue"), v28, v30, v33, v36, v39, 0.0);

      v7 = v56;
      v57 = 0;
      objc_msgSend(v56, "distanceFromLocation:toLocation:error:", v55, v45, &v57);
      v47 = 0;
      if (!v57 && v46 <= 200.0)
        v47 = -[RTLearnedVisitMO overlapsWithVisit:](self, "overlapsWithVisit:", v8);

    }
    else
    {
      v47 = 0;
    }
  }

  return v47;
}

- (BOOL)overlapsWithVisit:(id)a3
{
  RTLearnedVisitMO *v4;
  RTLearnedVisitMO *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (RTLearnedVisitMO *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTLearnedVisitMO interval](self, "interval");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedVisitMO interval](v5, "interval");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "intersectsDateInterval:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (id)managedObjectWithVisit:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "managedObjectWithVisit:finerGranularityInferredMapItem:place:managedObject:inManagedObjectContext:", a3, 0, 0, 0, a4);
}

+ (id)managedObjectWithVisit:(id)a3 place:(id)a4 inManagedObjectContext:(id)a5
{
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  if (a4)
  {
    objc_msgSend(a1, "managedObjectWithVisit:finerGranularityInferredMapItem:place:managedObject:inManagedObjectContext:", a3, 0, a4, 0, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v8, 2u);
    }

    v5 = 0;
  }
  return v5;
}

+ (id)managedObjectWithVisit:(id)a3 finerGranularityInferredMapItem:(id)a4 place:(id)a5 inManagedObjectContext:(id)a6
{
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  if (a5)
  {
    objc_msgSend(a1, "managedObjectWithVisit:finerGranularityInferredMapItem:place:managedObject:inManagedObjectContext:", a3, a4, a5, 0, a6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v9, 2u);
    }

    v6 = 0;
  }
  return v6;
}

+ (id)managedObjectWithVisit:(id)a3 finerGranularityInferredMapItem:(id)a4 place:(id)a5 managedObject:(id)a6 inManagedObjectContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _BYTE *v31;
  id v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
    }
    goto LABEL_19;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext", buf, 2u);
    }
    goto LABEL_19;
  }
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [managedObject isKindOfClass:[RTLearnedVisitMO class]]", buf, 2u);
      }
LABEL_19:

LABEL_20:
      v22 = 0;
      goto LABEL_21;
    }
  }
  if (v13)
  {
    objc_msgSend(v13, "mapItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    +[RTMapItemMO updateDatabaseWithMapItem:managedObjectContext:error:](RTMapItemMO, "updateDatabaseWithMapItem:managedObjectContext:error:", v18, v17, &v32);
    v19 = (uint64_t (*)(uint64_t, uint64_t))v32;

    if (v19)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        v34 = v19;
        _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "%@, error persisting visit, %@, error, %@", buf, 0x20u);

      }
      goto LABEL_20;
    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__168;
  v35 = __Block_byref_object_dispose__168;
  v36 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __118__RTLearnedVisitMO_managedObjectWithVisit_finerGranularityInferredMapItem_place_managedObject_inManagedObjectContext___block_invoke;
  v25[3] = &unk_1E92A60C8;
  v31 = buf;
  v26 = v15;
  v27 = v17;
  v28 = v12;
  v29 = v14;
  v30 = v13;
  objc_msgSend(v27, "performBlockAndWait:", v25);
  v22 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
LABEL_21:

  return v22;
}

void __118__RTLearnedVisitMO_managedObjectWithVisit_finerGranularityInferredMapItem_place_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  RTLearnedVisitMO *v2;
  RTLearnedVisitMO *v3;
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
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;

  v2 = *(RTLearnedVisitMO **)(a1 + 32);
  v3 = v2;
  if (!v2)
    v3 = -[RTLearnedVisitMO initWithContext:]([RTLearnedVisitMO alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v3);
  if (!v2)

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "confidence");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setConfidence:", v6);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "dataPointCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setDataPointCount:", v9);

  objc_msgSend(*(id *)(a1 + 48), "entryDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setEntryDate:", v10);

  objc_msgSend(*(id *)(a1 + 48), "exitDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setExitDate:", v11);

  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setIdentifier:", v12);

  objc_msgSend(*(id *)(a1 + 48), "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCreationDate:", v13);

  objc_msgSend(*(id *)(a1 + 48), "expirationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setExpirationDate:", v14);

  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "latitude");
  objc_msgSend(v15, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setLocationLatitude:", v18);

  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "location");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "longitude");
  objc_msgSend(v19, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setLocationLongitude:", v22);

  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "location");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "horizontalUncertainty");
  objc_msgSend(v23, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setLocationHorizontalUncertainty:", v26);

  v27 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "location");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "altitude");
  objc_msgSend(v27, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setLocationAltitude:", v30);

  v31 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "location");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "verticalUncertainty");
  objc_msgSend(v31, "numberWithDouble:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setLocationVerticalUncertainty:", v34);

  v35 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "location");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v37, "sourceAccuracy"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setLocationSourceAccuracy:", v38);

  v39 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "location");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "numberWithUnsignedInt:", objc_msgSend(v41, "referenceFrame"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setLocationReferenceFrame:", v42);

  v43 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "placeConfidence");
  objc_msgSend(v43, "numberWithDouble:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPlaceConfidence:", v44);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "placeSource"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPlaceSource:", v45);

  if (*(_QWORD *)(a1 + 56))
  {
    +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setPredicate:", v49);

    v50 = *(void **)(a1 + 40);
    v62 = 0;
    objc_msgSend(v50, "executeFetchRequest:error:", v46, &v62);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v62;
    v53 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v51, "firstObject");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTLearnedPlaceMO managedObjectWithPlace:managedObject:inManagedObjectContext:](RTLearnedPlaceMO, "managedObjectWithPlace:managedObject:inManagedObjectContext:", v53, v54, *(_QWORD *)(a1 + 40));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPlace:", v55);

  }
  v56 = *(void **)(a1 + 64);
  if (v56)
  {
    objc_msgSend(v56, "mapItem");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "identifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setFinerGranularityMapItemIdentifier:", v58);

    v59 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 64), "confidence");
    objc_msgSend(v59, "numberWithDouble:");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setFinerGranularityMapItemConfidence:", v60);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 64), "source"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setFinerGranularityMapItemSource:", v61);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setFinerGranularityMapItemIdentifier:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setFinerGranularityMapItemConfidence:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setFinerGranularityMapItemSource:", 0);
  }
}

- (id)finerGranularityInferredMapItem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  -[RTLearnedVisitMO finerGranularityMapItem](self, "finerGranularityMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D183A8]);
    v5 = (void *)MEMORY[0x1E0D183E8];
    -[RTLearnedVisitMO finerGranularityMapItem](self, "finerGranularityMapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createWithManagedObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedVisitMO finerGranularityMapItemConfidence](self, "finerGranularityMapItemConfidence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    -[RTLearnedVisitMO finerGranularityMapItemSource](self, "finerGranularityMapItemSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v4, "initWithMapItem:confidence:source:", v7, objc_msgSend(v11, "unsignedIntegerValue"), v10);

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (NSDateInterval)interval
{
  NSDateInterval *interval;
  id v4;
  void *v5;
  void *v6;
  NSDateInterval *v7;
  NSDateInterval *v8;

  interval = self->_interval;
  if (!interval)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3588]);
    -[RTLearnedVisitMO entryDate](self, "entryDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedVisitMO exitDate](self, "exitDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSDateInterval *)objc_msgSend(v4, "initWithStartDate:endDate:", v5, v6);
    v8 = self->_interval;
    self->_interval = v7;

    interval = self->_interval;
  }
  return interval;
}

- (RTMapItemMO)cachedFinerGranularityMapItem
{
  return self->cachedFinerGranularityMapItem;
}

- (void)setCachedFinerGranularityMapItem:(id)a3
{
  objc_storeStrong((id *)&self->cachedFinerGranularityMapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedFinerGranularityMapItem, 0);
  objc_storeStrong((id *)&self->_interval, 0);
}

@end
