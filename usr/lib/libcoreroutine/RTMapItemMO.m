@implementation RTMapItemMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("RTMapItemMO"));
}

- (id)extendedAttributes
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
  -[RTMapItemMO willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("extendedAttributes"));
  -[RTMapItemMO cachedExtendedAttributes](self, "cachedExtendedAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTMapItemMO cachedExtendedAttributes](self, "cachedExtendedAttributes");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[RTMapItemExtendedAttributesMO fetchRequest](RTMapItemExtendedAttributesMO, "fetchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(v5, "setFetchLimit:", 1);
    v6 = (void *)MEMORY[0x1E0CB3880];
    -[RTMapItemMO extendedAttributesIdentifier](self, "extendedAttributesIdentifier");
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
    -[RTMapItemMO didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("extendedAttributes"));
    objc_msgSend(v9, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMapItemMO setCachedExtendedAttributes:](self, "setCachedExtendedAttributes:", v12);

    return v12;
  }
}

- (void)setExtendedAttributes:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[RTCloudManagedObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("extendedAttributes"));
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTMapItemMO setExtendedAttributesIdentifier:](self, "setExtendedAttributesIdentifier:", v5);
  -[RTMapItemMO setCachedExtendedAttributes:](self, "setCachedExtendedAttributes:", 0);
  -[RTMapItemMO didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("extendedAttributes"));
}

+ (id)managedObjectWithMapItem:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "managedObjectWithMapItem:managedObject:inManagedObjectContext:", a3, 0, a4);
}

+ (id)managedObjectWithMapItem:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
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
  v10 = v9;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: mapItem";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_11;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_14;
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

      goto LABEL_7;
    }
LABEL_11:

    v14 = 0;
    goto LABEL_12;
  }
LABEL_7:
  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__98;
  v26 = __Block_byref_object_dispose__98;
  v27 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__RTMapItemMO_managedObjectWithMapItem_managedObject_inManagedObjectContext___block_invoke;
  v17[3] = &unk_1E92987D0;
  v21 = buf;
  v18 = v8;
  v19 = v10;
  v20 = v7;
  objc_msgSend(v19, "performBlockAndWait:", v17);
  v14 = *((id *)v23 + 5);

  _Block_object_dispose(buf, 8);
LABEL_12:

  return v14;
}

void __77__RTMapItemMO_managedObjectWithMapItem_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  RTMapItemMO *v2;
  RTMapItemMO *v3;
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
  id v34;
  NSObject *v35;
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
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = *(RTMapItemMO **)(a1 + 32);
  v3 = v2;
  if (!v2)
    v3 = -[RTMapItemMO initWithContext:]([RTMapItemMO alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
  if (!v2)

  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 48), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setName:", v5);

  objc_msgSend(*(id *)(a1 + 48), "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCategory:", v6);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latitude");
  objc_msgSend(v7, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLatitude:", v9);

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "longitude");
  objc_msgSend(v10, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLongitude:", v12);

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "horizontalUncertainty");
  objc_msgSend(v13, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setUncertainty:", v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithUnsignedInt:", objc_msgSend(v17, "referenceFrame"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setReferenceFrame:", v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "source"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMapItemSource:", v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "mapItemPlaceType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMapItemPlaceType:", v20);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "muid"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMuid:", v21);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "resultProviderID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setResultProviderID:", v22);

  objc_msgSend(*(id *)(a1 + 48), "geoMapItemHandle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setGeoMapItemHandle:", v23);

  objc_msgSend(*(id *)(a1 + 48), "creationDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCreationDate:", v24);

  objc_msgSend(*(id *)(a1 + 48), "displayLanguage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDisplayLanguage:", v25);

  objc_msgSend(*(id *)(a1 + 48), "expirationDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setExpirationDate:", v26);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDisputed:", objc_msgSend(*(id *)(a1 + 48), "disputed"));
  +[RTMapItemExtendedAttributesMO fetchRequest](RTMapItemExtendedAttributesMO, "fetchRequest");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 48), "extendedAttributes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPredicate:", v31);

  v32 = *(void **)(a1 + 40);
  v52 = 0;
  objc_msgSend(v32, "executeFetchRequest:error:", v27, &v52);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v52;
  if (v34)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v34;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "error fetching extended attributes, %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "extendedAttributes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstObject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMapItemExtendedAttributesMO managedObjectWithExtendedAttributes:managedObject:inManagedObjectContext:](RTMapItemExtendedAttributesMO, "managedObjectWithExtendedAttributes:managedObject:inManagedObjectContext:", v36, v37, *(_QWORD *)(a1 + 40));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setExtendedAttributes:", v38);
  +[RTAddressMO fetchRequest](RTAddressMO, "fetchRequest");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 48), "address");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setPredicate:", v43);

  v44 = *(void **)(a1 + 40);
  v51 = 0;
  objc_msgSend(v44, "executeFetchRequest:error:", v39, &v51);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v51;
  if (v46)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v46;
      _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "error fetching address, %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "address");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "firstObject");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTAddressMO managedObjectWithAddress:managedObject:inManagedObjectContext:](RTAddressMO, "managedObjectWithAddress:managedObject:inManagedObjectContext:", v48, v49, *(_QWORD *)(a1 + 40));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAddress:", v50);

}

+ (id)mapItemForIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  v5 = a3;
  +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v6, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v7);
  v13 = 0;
  objc_msgSend(v6, "execute:", &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = v9;
  if (a4)
    *a4 = objc_retainAutorelease(v9);
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)updateDatabaseWithMapItem:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t *v29;
  uint64_t *v30;
  SEL v31;
  _QWORD v32[4];
  id v33;
  uint8_t *v34;
  uint64_t *v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t v43[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    *(_QWORD *)v43 = 0;
    v44 = v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__98;
    v47 = __Block_byref_object_dispose__98;
    v48 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__98;
    v41 = __Block_byref_object_dispose__98;
    v42 = 0;
    v10 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __68__RTMapItemMO_updateDatabaseWithMapItem_managedObjectContext_error___block_invoke;
    v32[3] = &unk_1E92A1338;
    v34 = v43;
    v36 = a1;
    v11 = v8;
    v33 = v11;
    v35 = &v37;
    objc_msgSend(v9, "performBlockAndWait:", v32);
    if (v38[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v38[5];
        *(_DWORD *)buf = 138412802;
        v50 = v21;
        v51 = 2112;
        v52 = v11;
        v53 = 2112;
        v54 = v22;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@, error fetching map item MO for mapItem, %@, error, %@", buf, 0x20u);

      }
    }
    else
    {
      v14 = (void *)*((_QWORD *)v44 + 5);
      if (!v14)
        goto LABEL_11;
      objc_msgSend(v14, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "isEqual:", v18);

      if (v19)
      {
LABEL_11:
        v26[0] = v10;
        v26[1] = 3221225472;
        v26[2] = __68__RTMapItemMO_updateDatabaseWithMapItem_managedObjectContext_error___block_invoke_9;
        v26[3] = &unk_1E92A1360;
        v27 = v11;
        v29 = v43;
        v28 = v9;
        v30 = &v37;
        v31 = a2;
        objc_msgSend(v28, "performBlockAndWait:", v26);

      }
      if (!v38[5])
        goto LABEL_18;
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v38[5];
        *(_DWORD *)buf = 138412802;
        v50 = v23;
        v51 = 2112;
        v52 = v11;
        v53 = 2112;
        v54 = v24;
        _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "%@, error persisting mapItem, %@, error, %@", buf, 0x20u);

      }
    }
    if (a5)
      *a5 = objc_retainAutorelease((id)v38[5]);
LABEL_18:

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(v43, 8);

    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v43 = 0;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem != nil", v43, 2u);
  }

LABEL_19:
}

void __68__RTMapItemMO_updateDatabaseWithMapItem_managedObjectContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "mapItemForIdentifier:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __68__RTMapItemMO_updateDatabaseWithMapItem_managedObjectContext_error___block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  +[RTMapItemMO managedObjectWithMapItem:managedObject:inManagedObjectContext:](RTMapItemMO, "managedObjectWithMapItem:managedObject:inManagedObjectContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(id *)(v4 + 40);
    objc_msgSend(v3, "save:", &v16);
    v5 = v16;
    v6 = *(NSObject **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D18598];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("The updatedMapItemMO was nil indicating an error has occurred while updating the database.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 0, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "debugDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@, error persisting mapItem, %@, with existing mapItemMO, %@, the updatedMapItemMO is nil.", buf, 0x20u);

    }
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
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

  v24 = (void *)MEMORY[0x1E0CB3940];
  -[RTCloudManagedObject identifier](self, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO name](self, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO category](self, "category");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO latitude](self, "latitude");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO longitude](self, "longitude");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO uncertainty](self, "uncertainty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO referenceFrame](self, "referenceFrame");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO mapItemSource](self, "mapItemSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO mapItemPlaceType](self, "mapItemPlaceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO muid](self, "muid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO resultProviderID](self, "resultProviderID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO geoMapItemHandle](self, "geoMapItemHandle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v15 = v6;
  -[RTMapItemMO creationDate](self, "creationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO expirationDate](self, "expirationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringFromDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO displayLanguage](self, "displayLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RTMapItemMO disputed](self, "disputed"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  -[RTMapItemMO address](self, "address");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemMO extendedAttributesIdentifier](self, "extendedAttributesIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("identifier, %@, name, %@, category, %@, latitude, %@, longitude, %@, uncertainty, %@, referenceFrame, %@, mapItemSource, %@, mapItemPlaceType, %@, muid, %@, resultProviderID, %@, geoMapItemHandle, %@, creationDate, %@, expirationDate, %@, displayLanguage, %@, disputed, %@, address, %@, extendedAttributesIdentifier, %@"), v28, v26, v23, v27, v21, v3, v19, v18, v4, v5, v16, v15, v7, v8, v9, v10,
    v12,
    v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)didSave
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[RTMapItemMO geoMapItemHandle](self, "geoMapItemHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v7 = "-[RTMapItemMO didSave]";
      v8 = 1024;
      v9 = 208;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "map item handle should not be nil (in %s:%d)", buf, 0x12u);
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)RTMapItemMO;
  -[RTMapItemMO didSave](&v5, sel_didSave);
}

- (RTMapItemExtendedAttributesMO)cachedExtendedAttributes
{
  return self->cachedExtendedAttributes;
}

- (void)setCachedExtendedAttributes:(id)a3
{
  objc_storeStrong((id *)&self->cachedExtendedAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedExtendedAttributes, 0);
}

@end
