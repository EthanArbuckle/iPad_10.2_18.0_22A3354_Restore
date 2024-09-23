@implementation SMReceiverContactMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("SMReceiverContactMO"));
}

+ (id)managedObjectWithReceiverContact:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "managedObjectWithReceiverContact:managedObject:inManagedObjectContext:", a3, 0, a4);
}

+ (id)managedObjectWithReceiverContact:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
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
    v13 = "Invalid parameter not satisfying: receiverContact";
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
  v23 = __Block_byref_object_copy__73;
  v24 = __Block_byref_object_dispose__73;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__SMReceiverContactMO_managedObjectWithReceiverContact_managedObject_inManagedObjectContext___block_invoke;
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

void __93__SMReceiverContactMO_managedObjectWithReceiverContact_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  SMReceiverContactMO *v2;
  SMReceiverContactMO *v3;
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
  id v18;
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
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;

  v2 = *(SMReceiverContactMO **)(a1 + 32);
  v3 = v2;
  if (!v2)
    v3 = -[SMReceiverContactMO initWithContext:]([SMReceiverContactMO alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
  if (!v2)

  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 48), "syncDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSyncDate:", v5);

  objc_msgSend(*(id *)(a1 + 48), "allowReadToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAllowReadToken:", v6);

  objc_msgSend(*(id *)(a1 + 48), "safetyCacheKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSafetyCacheKey:", v7);

  objc_msgSend(*(id *)(a1 + 48), "shareURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setShareURL:", v8);

  objc_msgSend(*(id *)(a1 + 48), "participantID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setParticipantID:", v9);

  objc_msgSend(*(id *)(a1 + 48), "sharingInvitationData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSharingInvitationData:", v10);

  objc_msgSend(*(id *)(a1 + 48), "sessionUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSessionUUID:", v11);

  +[SMCacheMO fetchRequest](SMCacheMO, "fetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 48), "phoneCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v12;
  objc_msgSend(v12, "setPredicate:", v16);

  v17 = *(void **)(a1 + 40);
  v48 = 0;
  objc_msgSend(v17, "executeFetchRequest:error:", v12, &v48);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v48;
  objc_msgSend(*(id *)(a1 + 48), "phoneCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMCacheMO managedObjectWithCache:managedObject:inManagedObjectContext:](SMCacheMO, "managedObjectWithCache:managedObject:inManagedObjectContext:", v19, v20, *(_QWORD *)(a1 + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPhoneCache:", v21);

  +[SMCacheMO fetchRequest](SMCacheMO, "fetchRequest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 48), "watchCache");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPredicate:", v26);

  v27 = *(void **)(a1 + 40);
  v47 = v18;
  objc_msgSend(v27, "executeFetchRequest:error:", v22, &v47);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v47;

  objc_msgSend(*(id *)(a1 + 48), "watchCache");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMCacheMO managedObjectWithCache:managedObject:inManagedObjectContext:](SMCacheMO, "managedObjectWithCache:managedObject:inManagedObjectContext:", v29, v30, *(_QWORD *)(a1 + 40));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setWatchCache:", v31);

  +[SMReceiverSessionStatusMO fetchRequest](SMReceiverSessionStatusMO, "fetchRequest");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 48), "sessionStatus");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPredicate:", v36);

  v37 = *(void **)(a1 + 40);
  v46 = v28;
  objc_msgSend(v37, "executeFetchRequest:error:", v32, &v46);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v46;

  objc_msgSend(*(id *)(a1 + 48), "sessionStatus");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "firstObject");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMReceiverSessionStatusMO managedObjectWithReceiverSessionStatus:managedObject:inManagedObjectContext:](SMReceiverSessionStatusMO, "managedObjectWithReceiverSessionStatus:managedObject:inManagedObjectContext:", v40, v41, *(_QWORD *)(a1 + 40));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSessionStatus:", v42);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMaxPhoneCacheSize:", objc_msgSend(*(id *)(a1 + 48), "maxPhoneCacheSize"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMaxWatchCacheSize:", objc_msgSend(*(id *)(a1 + 48), "maxWatchCacheSize"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMaxLocationsInPhoneCacheTrace:", objc_msgSend(*(id *)(a1 + 48), "maxLocationsInPhoneCacheTrace"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMaxLocationsInWatchCacheTrace:", objc_msgSend(*(id *)(a1 + 48), "maxLocationsInWatchCacheTrace"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setNumCacheDownloads:", objc_msgSend(*(id *)(a1 + 48), "numCacheDownloads"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setNumSuccessfulCacheDownloads:", objc_msgSend(*(id *)(a1 + 48), "numSuccessfulCacheDownloads"));
  objc_msgSend(*(id *)(a1 + 48), "timeTillCacheRelease");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTimeTillCacheRelease:");
  objc_msgSend(*(id *)(a1 + 48), "timeTillFirstSuccessfulCacheDownload");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTimeTillFirstSuccessfulCacheDownload:");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setFirstDetailViewSessionState:", objc_msgSend(*(id *)(a1 + 48), "firstDetailViewSessionState"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLastDetailViewSessionState:", objc_msgSend(*(id *)(a1 + 48), "lastDetailViewSessionState"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPhoneMaxWorkoutEvents:", objc_msgSend(*(id *)(a1 + 48), "phoneMaxWorkoutEvents"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setWatchMaxWorkoutEvents:", objc_msgSend(*(id *)(a1 + 48), "watchMaxWorkoutEvents"));

}

@end
