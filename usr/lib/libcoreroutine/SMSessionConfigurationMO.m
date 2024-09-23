@implementation SMSessionConfigurationMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("SMSessionConfigurationMO"));
}

+ (SMSessionConfigurationMO)initWithSessionConfiguration:(id)a3 inManagedObjectContext:(id)a4
{
  return (SMSessionConfigurationMO *)objc_msgSend(a1, "initWithSessionConfiguration:managedObject:inManagedObjectContext:", a3, 0, a4);
}

+ (SMSessionConfigurationMO)initWithSessionConfiguration:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  uint8_t *v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint8_t buf[2];
  __int16 v57;
  __int16 v58;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v58 = 0;
    v31 = "Invalid parameter not satisfying: sessionConfiguration";
    v32 = (uint8_t *)&v58;
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, v31, v32, 2u);
    goto LABEL_13;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v57 = 0;
    v31 = "Invalid parameter not satisfying: managedObjectContext";
    v32 = (uint8_t *)&v57;
    goto LABEL_12;
  }
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v31 = "Invalid parameter not satisfying: [managedObject isKindOfClass:[SMSessionConfigurationMO class]]";
        v32 = buf;
        goto LABEL_12;
      }
LABEL_13:

      v29 = 0;
      goto LABEL_14;
    }
  }
  objc_msgSend(v8, "sessionID");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v8, "sessionType");
  objc_msgSend(v8, "sessionStartDate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "location");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "latitude");
  v13 = v12;
  objc_msgSend(v8, "destination");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "location");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "longitude");
  v15 = v14;
  objc_msgSend(v8, "destination");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "location");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v48, "referenceFrame");
  objc_msgSend(v8, "destination");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "radius");
  v17 = v16;
  objc_msgSend(v8, "destination");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v45, "destinationType");
  objc_msgSend(v8, "destination");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "eta");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "expectedTravelTime");
  v19 = v18;
  objc_msgSend(v8, "destination");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "eta");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "additionalTravelTime");
  v21 = v20;
  objc_msgSend(v8, "destination");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "eta");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v37, "transportType");
  objc_msgSend(v8, "time");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "timeBound");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conversation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "destinationMapItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v8, "sessionSupportsHandoff");
  objc_msgSend(v8, "sosReceivers");
  v27 = v9;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v34) = v26;
  objc_msgSend(a1, "managedObjectWithSessionIdentifier:sessionType:sessionStartDate:destinationLatitude:destinationLongitude:destinationReferenceFrame:destinationRadius:destinationType:expectedTravelTime:additionalTravelTime:transportType:sessionTimeBound:conversation:destinationMapItem:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:managedObject:managedObjectContext:", v55, v46, v54, v42, v39, v35, v13, v15, v17, v19, v21, v22, v23, v25, v34,
    v28,
    objc_msgSend(v8, "sessionWorkoutType"),
    v27,
    v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v27;
LABEL_14:

  return (SMSessionConfigurationMO *)v29;
}

+ (id)managedObjectWithSessionIdentifier:(id)a3 sessionType:(unint64_t)a4 sessionStartDate:(id)a5 destinationLatitude:(double)a6 destinationLongitude:(double)a7 destinationReferenceFrame:(int)a8 destinationRadius:(double)a9 destinationType:(unint64_t)a10 expectedTravelTime:(double)a11 additionalTravelTime:(double)a12 transportType:(unint64_t)a13 sessionTimeBound:(id)a14 conversation:(id)a15 destinationMapItem:(id)a16 sessionSupportsHandoff:(BOOL)a17 sosReceivers:(id)a18 sessionWorkoutType:(unint64_t)a19 managedObject:(id)a20 managedObjectContext:(id)a21
{
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t *v50;
  unint64_t v51;
  double v52;
  double v53;
  double v54;
  unint64_t v55;
  double v56;
  double v57;
  unint64_t v58;
  unint64_t v59;
  int v60;
  BOOL v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;

  v28 = a3;
  v29 = a5;
  v30 = a14;
  v31 = a15;
  v32 = a16;
  v33 = a18;
  v34 = a20;
  v35 = a21;
  if (v35)
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__173;
    v66 = __Block_byref_object_dispose__173;
    v67 = 0;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __386__SMSessionConfigurationMO_managedObjectWithSessionIdentifier_sessionType_sessionStartDate_destinationLatitude_destinationLongitude_destinationReferenceFrame_destinationRadius_destinationType_expectedTravelTime_additionalTravelTime_transportType_sessionTimeBound_conversation_destinationMapItem_sessionSupportsHandoff_sosReceivers_sessionWorkoutType_managedObject_managedObjectContext___block_invoke;
    v41[3] = &unk_1E92A6268;
    v50 = &v62;
    v42 = v34;
    v43 = v35;
    v44 = v28;
    v51 = a4;
    v45 = v29;
    v52 = a6;
    v53 = a7;
    v60 = a8;
    v54 = a9;
    v55 = a10;
    v56 = a11;
    v57 = a12;
    v58 = a13;
    v46 = v30;
    v47 = v31;
    v48 = v32;
    v61 = a17;
    v49 = v33;
    v59 = a19;
    objc_msgSend(v43, "performBlockAndWait:", v41);
    v36 = (id)v63[5];

    _Block_object_dispose(&v62, 8);
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

uint64_t __386__SMSessionConfigurationMO_managedObjectWithSessionIdentifier_sessionType_sessionStartDate_destinationLatitude_destinationLongitude_destinationReferenceFrame_destinationRadius_destinationType_expectedTravelTime_additionalTravelTime_transportType_sessionTimeBound_conversation_destinationMapItem_sessionSupportsHandoff_sosReceivers_sessionWorkoutType_managedObject_managedObjectContext___block_invoke(uint64_t a1)
{
  SMSessionConfigurationMO *v2;
  SMSessionConfigurationMO *v3;
  void *v4;
  void *v5;

  v2 = *(SMSessionConfigurationMO **)(a1 + 32);
  v3 = v2;
  if (!v2)
    v3 = -[SMSessionConfigurationMO initWithContext:]([SMSessionConfigurationMO alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v3);
  if (!v2)

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setSessionIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setSessionType:", *(__int16 *)(a1 + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setSessionStartDate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setDestinationLatitude:", *(double *)(a1 + 112));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setDestinationLongitude:", *(double *)(a1 + 120));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setDestinationReferenceFrame:", *(__int16 *)(a1 + 176));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setDestinationRadius:", *(double *)(a1 + 128));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setDestinationType:", *(__int16 *)(a1 + 136));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setExpectedTravelTime:", *(double *)(a1 + 144));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setAdditionalTravelTime:", *(double *)(a1 + 152));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setTransportType:", *(__int16 *)(a1 + 160));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setSessionTimeBound:", *(_QWORD *)(a1 + 64));
  +[SMConversationMO managedObjectWithSMConversation:inManagedObjectContext:](SMConversationMO, "managedObjectWithSMConversation:inManagedObjectContext:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setConversation:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setDestinationMapItem:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setSessionSupportsHandoff:", *(unsigned __int8 *)(a1 + 180));
  +[SMConversationMO managedObjectWithSMConversation:inManagedObjectContext:](SMConversationMO, "managedObjectWithSMConversation:inManagedObjectContext:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setSosReceivers:", v5);

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setSessionWorkoutType:", *(unsigned int *)(a1 + 168));
}

@end
