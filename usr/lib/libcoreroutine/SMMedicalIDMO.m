@implementation SMMedicalIDMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("SMMedicalIDMO"));
}

+ (id)managedObjectWithMedicalID:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "managedObjectWithMedicalID:managedObject:inManagedObjectContext:", a3, 0, a4);
}

+ (id)managedObjectWithMedicalID:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v11 = 0;
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: medicalID";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_10;
  }
  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__157;
  v24 = __Block_byref_object_dispose__157;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__SMMedicalIDMO_managedObjectWithMedicalID_managedObject_inManagedObjectContext___block_invoke;
  v15[3] = &unk_1E92987D0;
  v19 = buf;
  v16 = v8;
  v17 = v10;
  v18 = v7;
  objc_msgSend(v17, "performBlockAndWait:", v15);
  v11 = *((id *)v21 + 5);

  _Block_object_dispose(buf, 8);
LABEL_8:

  return v11;
}

void __81__SMMedicalIDMO_managedObjectWithMedicalID_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  SMMedicalIDMO *v2;
  SMMedicalIDMO *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id obj;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = *(SMMedicalIDMO **)(a1 + 32);
  v3 = v2;
  if (!v2)
    v3 = -[SMMedicalIDMO initWithContext:]([SMMedicalIDMO alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
  if (!v2)

  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIdentifier:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAge:", (__int16)objc_msgSend(*(id *)(a1 + 48), "age"));
  objc_msgSend(*(id *)(a1 + 48), "allergiesAndRestrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAllergiesAndRestrictions:", v5);

  objc_msgSend(*(id *)(a1 + 48), "bloodType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setBloodType:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setHeight:", (__int16)objc_msgSend(*(id *)(a1 + 48), "height"));
  objc_msgSend(*(id *)(a1 + 48), "medicalConditions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMedicalConditions:", v7);

  objc_msgSend(*(id *)(a1 + 48), "medicalNotes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMedicalNotes:", v8);

  objc_msgSend(*(id *)(a1 + 48), "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setName:", v9);

  objc_msgSend(*(id *)(a1 + 48), "primaryLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPrimaryLanguage:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setWeight:", (__int16)objc_msgSend(*(id *)(a1 + 48), "weight"));
  v11 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "emergencyContacts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = a1;
  objc_msgSend(*(id *)(a1 + 48), "emergencyContacts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v13)
  {
    v14 = v13;
    v28 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        +[SMEmergencyContactMO fetchRequest](SMEmergencyContactMO, "fetchRequest");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v16, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPredicate:", v20);

        v21 = *(void **)(v29 + 40);
        v30 = 0;
        objc_msgSend(v21, "executeFetchRequest:error:", v17, &v30);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v30;
        objc_msgSend(v22, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[SMEmergencyContactMO managedObjectWithEmergencyContact:managedObject:inManagedObjectContext:](SMEmergencyContactMO, "managedObjectWithEmergencyContact:managedObject:inManagedObjectContext:", v16, v24, *(_QWORD *)(v29 + 40));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
          objc_msgSend(v27, "addObject:", v25);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v14);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v29 + 56) + 8) + 40), "setEmergencyContacts:", v27);
}

@end
