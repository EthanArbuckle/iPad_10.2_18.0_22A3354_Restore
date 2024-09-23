@implementation RTLearnedPlaceMO

+ (id)fetchRequestSortedByCreation
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("creationDate"), 1);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v4);

  return v2;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("RTLearnedPlaceMO"));
}

+ (id)managedObjectWithPlace:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "managedObjectWithPlace:managedObject:inManagedObjectContext:", a3, 0, a4);
}

+ (id)managedObjectWithPlace:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  NSObject *v13;
  id v14;
  const char *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: place";
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_16;
  }
  objc_msgSend(v7, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: place.mapItem";
    goto LABEL_15;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_15;
  }
  objc_msgSend(v8, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "managedObjectContext");
    v13 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject allowTombstones](v13, "allowTombstones") & 1) != 0 || (objc_msgSend(v8, "flags") & 1) == 0)
    {

      goto LABEL_8;
    }
LABEL_16:

    v14 = 0;
    goto LABEL_17;
  }
LABEL_8:
  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__150;
  v26 = __Block_byref_object_dispose__150;
  v27 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__RTLearnedPlaceMO_managedObjectWithPlace_managedObject_inManagedObjectContext___block_invoke;
  v17[3] = &unk_1E92987D0;
  v21 = buf;
  v18 = v8;
  v19 = v9;
  v20 = v7;
  objc_msgSend(v19, "performBlockAndWait:", v17);
  v14 = *((id *)v23 + 5);

  _Block_object_dispose(buf, 8);
LABEL_17:

  return v14;
}

void __80__RTLearnedPlaceMO_managedObjectWithPlace_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  RTLearnedPlaceMO *v2;
  RTLearnedPlaceMO *v3;
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
  void *v19;
  void *v20;
  id v21;

  v2 = *(RTLearnedPlaceMO **)(a1 + 32);
  v3 = v2;
  if (!v2)
    v3 = -[RTLearnedPlaceMO initWithContext:]([RTLearnedPlaceMO alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
  if (!v2)

  objc_msgSend(*(id *)(a1 + 48), "customLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCustomLabel:", v4);

  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIdentifier:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setType:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "typeSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTypeSource:", v7);

  objc_msgSend(*(id *)(a1 + 48), "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCreationDate:", v8);

  objc_msgSend(*(id *)(a1 + 48), "expirationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setExpirationDate:", v9);

  +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 48), "mapItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v14);

  v15 = *(void **)(a1 + 40);
  v21 = 0;
  objc_msgSend(v15, "executeFetchRequest:error:", v10, &v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v21;
  objc_msgSend(*(id *)(a1 + 48), "mapItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMapItemMO managedObjectWithMapItem:managedObject:inManagedObjectContext:](RTMapItemMO, "managedObjectWithMapItem:managedObject:inManagedObjectContext:", v18, v19, *(_QWORD *)(a1 + 40));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMapItem:", v20);

}

- (void)didSave
{
  void *v4;
  char isKindOfClass;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[RTLearnedPlaceMO managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[RTLearnedPlaceMO managedObjectContext](self, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "options");

    v8 = v7 & 1;
  }
  else
  {
    v8 = 0;
  }
  -[RTLearnedPlaceMO managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transactionAuthor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasPrefix:", CFSTR("NSCloudKitMirroringDelegate")))
    goto LABEL_12;
  -[RTLearnedPlaceMO managedObjectContext](self, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transactionAuthor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "hasPrefix:", CFSTR("RTPersistenceStoreImporter")) & 1) != 0 || v8)
  {

LABEL_12:
LABEL_13:

    goto LABEL_14;
  }
  -[RTLearnedPlaceMO mapItem](self, "mapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[RTCloudManagedObject identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceMO managedObjectContext](self, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transactionAuthor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("map item is nil for place with identifier, %@, transactionAuthor, %@"), v15, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v9;
      _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
    }

    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@.%@.detectedNilMapItem"), v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This device detected an unexpected state in the learned location graph of CoreRoutine. Please file a radar to help diagnose the issue."));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v23, v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringFromDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("issue detected at %@"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    +[RTRadarUtilities promptUserToCreateRadarForAssertionIdentifier:alertMessage:radarTitle:radarDescription:handler:](RTRadarUtilities, "promptUserToCreateRadarForAssertionIdentifier:alertMessage:radarTitle:radarDescription:handler:", v23, v24, v25, v29, 0);
    goto LABEL_13;
  }
LABEL_14:
  v30.receiver = self;
  v30.super_class = (Class)RTLearnedPlaceMO;
  -[RTLearnedPlaceMO didSave](&v30, sel_didSave);
}

@end
