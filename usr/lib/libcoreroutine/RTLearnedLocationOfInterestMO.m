@implementation RTLearnedLocationOfInterestMO

+ (id)fetchRequestSortedByCreation
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("placeCreationDate"), 1);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v4);

  return v2;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("RTLearnedLocationOfInterestMO"));
}

- (id)mapItem
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[RTLearnedLocationOfInterestMO willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("mapItem"));
  -[RTLearnedLocationOfInterestMO cachedMapItem](self, "cachedMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTLearnedLocationOfInterestMO cachedMapItem](self, "cachedMapItem");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(v5, "setFetchLimit:", 1);
    v6 = (void *)MEMORY[0x1E0CB3880];
    -[RTLearnedLocationOfInterestMO placeMapItemIdentifier](self, "placeMapItemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPredicate:", v8);

    v13 = 0;
    objc_msgSend(v5, "execute:", &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v10)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Error fulfilling transient property mapItem, %@", buf, 0xCu);
      }

    }
    -[RTLearnedLocationOfInterestMO didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("mapItem"));
    objc_msgSend(v9, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setCachedMapItem:](self, "setCachedMapItem:", v12);

    return v12;
  }
}

- (void)setMapItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[RTLearnedLocationOfInterestMO willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mapItem"));
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTLearnedLocationOfInterestMO setPlaceMapItemIdentifier:](self, "setPlaceMapItemIdentifier:", v5);
  -[RTLearnedLocationOfInterestMO setCachedMapItem:](self, "setCachedMapItem:", 0);
  -[RTLearnedLocationOfInterestMO didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mapItem"));
}

+ (id)managedObjectWithLocationOfInterest:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "managedObjectWithLocationOfInterest:managedObject:inManagedObjectContext:", a3, 0, a4);
}

+ (id)managedObjectWithLocationOfInterest:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id obj;
  id obja;
  RTLearnedLocationOfInterestMO *v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  uint8_t *v80;
  uint8_t buf[8];
  uint8_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v60 = a4;
  v8 = a5;
  v58 = v8;
  v59 = v7;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationOfInterest", buf, 2u);
    }
    goto LABEL_11;
  }
  v9 = v8;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext", buf, 2u);
    }
LABEL_11:

    v64 = 0;
    goto LABEL_34;
  }
  *(_QWORD *)buf = 0;
  v82 = buf;
  v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__78;
  v85 = __Block_byref_object_dispose__78;
  v86 = 0;
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __106__RTLearnedLocationOfInterestMO_managedObjectWithLocationOfInterest_managedObject_inManagedObjectContext___block_invoke;
  v76[3] = &unk_1E929EE78;
  v61 = v7;
  v77 = v61;
  v80 = buf;
  v78 = v9;
  v10 = v60;
  v79 = v10;
  v65 = v78;
  objc_msgSend(v78, "performBlockAndWait:", v76);
  if (objc_msgSend(*((id *)v82 + 5), "count"))
  {
    if (v10)
      v64 = (RTLearnedLocationOfInterestMO *)v10;
    else
      v64 = -[RTLearnedLocationOfInterestMO initWithContext:]([RTLearnedLocationOfInterestMO alloc], "initWithContext:", v65);
    objc_msgSend(v61, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO updateWithLearnedLocation:](v64, "updateWithLearnedLocation:", v12);

    objc_msgSend(v61, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setIdentifier:](v64, "setIdentifier:", v13);

    objc_msgSend(v61, "place");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "customLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setPlaceCustomLabel:](v64, "setPlaceCustomLabel:", v15);

    objc_msgSend(v61, "place");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setPlaceIdentifier:](v64, "setPlaceIdentifier:", v17);

    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v61, "place");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "type"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setPlaceType:](v64, "setPlaceType:", v20);

    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v61, "place");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "typeSource"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setPlaceTypeSource:](v64, "setPlaceTypeSource:", v23);

    objc_msgSend(v61, "place");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "mapItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setPlaceMapItemIdentifier:](v64, "setPlaceMapItemIdentifier:", v26);

    objc_msgSend(v61, "place");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "creationDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setPlaceCreationDate:](v64, "setPlaceCreationDate:", v28);

    objc_msgSend(v61, "place");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "expirationDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setPlaceExpirationDate:](v64, "setPlaceExpirationDate:", v30);

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    objc_msgSend(v61, "visits");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v73;
      obj = v31;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v73 != v33)
            objc_enumerationMutation(obj);
          v35 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          +[RTLearnedLocationOfInterestVisitMO fetchRequest](RTLearnedLocationOfInterestVisitMO, "fetchRequest");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)MEMORY[0x1E0CB3880];
          objc_msgSend(v35, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v38, v58);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setPredicate:", v39);

          v71 = 0;
          objc_msgSend(v65, "executeFetchRequest:error:", v36, &v71);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v71;
          objc_msgSend(v40, "firstObject");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTLearnedLocationOfInterestVisitMO managedObjectWithVisit:managedObject:inManagedObjectContext:](RTLearnedLocationOfInterestVisitMO, "managedObjectWithVisit:managedObject:inManagedObjectContext:", v35, v42, v65);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
            -[RTLearnedLocationOfInterestMO addVisitsObject:](v64, "addVisitsObject:", v43);

        }
        v31 = obj;
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
      }
      while (v32);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v61, "transitions");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v68;
      obja = v44;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v68 != v46)
            objc_enumerationMutation(obja);
          v48 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
          +[RTLearnedLocationOfInterestTransitionMO fetchRequest](RTLearnedLocationOfInterestTransitionMO, "fetchRequest");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)MEMORY[0x1E0CB3880];
          objc_msgSend(v48, "identifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setPredicate:", v52);

          v66 = 0;
          objc_msgSend(v65, "executeFetchRequest:error:", v49, &v66);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v66;
          objc_msgSend(v53, "firstObject");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTLearnedLocationOfInterestTransitionMO managedObjectWithTransition:managedObject:inManagedObjectContext:](RTLearnedLocationOfInterestTransitionMO, "managedObjectWithTransition:managedObject:inManagedObjectContext:", v48, v55, v65);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56)
            -[RTLearnedLocationOfInterestMO addTransitionsObject:](v64, "addTransitionsObject:", v56);

        }
        v44 = obja;
        v45 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
      }
      while (v45);
    }

  }
  else
  {
    v64 = 0;
  }

  _Block_object_dispose(buf, 8);
LABEL_34:

  return v64;
}

void __106__RTLearnedLocationOfInterestMO_managedObjectWithLocationOfInterest_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
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
  NSObject *v13;
  const __CFString *v14;
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "place");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v7);

  v8 = *(void **)(a1 + 40);
  v15 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v2, &v15);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v15;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = CFSTR("update");
      if (!*(_QWORD *)(a1 + 48))
        v14 = CFSTR("create");
      *(_DWORD *)buf = 138412802;
      v17 = v14;
      v18 = 2080;
      v19 = "+[RTLearnedLocationOfInterestMO managedObjectWithLocationOfInterest:managedObject:inManagedObjectContext:]_block_invoke";
      v20 = 1024;
      v21 = 56;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "attempting to %@ a learnedLocationOfInterest without a backing mapItem (in %s:%d)", buf, 0x1Cu);
    }

  }
}

- (void)updateWithLearnedLocation:(id)a3
{
  void *v4;
  id v5;
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
  id v28;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = a3;
    objc_msgSend(v5, "confidence");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setConfidence:](self, "setConfidence:", v6);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "dataPointCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setDataPointCount:](self, "setDataPointCount:", v7);

    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "latitude");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setLocationLatitude:](self, "setLocationLatitude:", v10);

    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "longitude");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setLocationLongitude:](self, "setLocationLongitude:", v13);

    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "horizontalUncertainty");
    objc_msgSend(v14, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setLocationHorizontalUncertainty:](self, "setLocationHorizontalUncertainty:", v16);

    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "altitude");
    objc_msgSend(v17, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setLocationAltitude:](self, "setLocationAltitude:", v19);

    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "verticalUncertainty");
    objc_msgSend(v20, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setLocationVerticalUncertainty:](self, "setLocationVerticalUncertainty:", v22);

    v23 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "location");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "sourceAccuracy"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setLocationSourceAccuracy:](self, "setLocationSourceAccuracy:", v25);

    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "location");
    v28 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "numberWithUnsignedInt:", objc_msgSend(v28, "referenceFrame"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocationOfInterestMO setLocationReferenceFrame:](self, "setLocationReferenceFrame:", v27);

  }
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

@end
