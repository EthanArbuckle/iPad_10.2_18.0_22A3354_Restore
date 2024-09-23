@implementation SMSessionConfiguration

void __86__SMSessionConfiguration_RTCoreDataTransformable__createWithSMSessionConfigurationMO___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  CLLocationDegrees v32;
  CLLocationDegrees v33;
  CLLocationCoordinate2D v34;
  id v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  double v40;
  id v41;
  double v42;
  double v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  uint64_t v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D8B918];
    objc_msgSend(*(id *)(a1 + 32), "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createWithManagedObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "primaryHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_9;
    objc_msgSend(*(id *)(a1 + 32), "primaryHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "secondaryHandles");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    if (v7)
      v9 = (void *)v7;
    v10 = v9;

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B960]), "initWithPrimaryHandle:secondaryHandles:", v4, v10);
    v12 = objc_alloc(MEMORY[0x1E0D8B918]);
    v64[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v12, "initWithReceiverHandles:identifier:displayName:", v13, 0, 0);

  }
  if (v5)
  {
    v14 = 0;
    goto LABEL_12;
  }
LABEL_9:
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v58 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v61 = "+[SMSessionConfiguration(RTCoreDataTransformable) createWithSMSessionConfigurationMO:]_block_invoke";
    v62 = 2112;
    v63 = v58;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%s, no conversation from SMSessionConfigurationMO, %@", buf, 0x16u);
  }

  v5 = 0;
  v14 = 1;
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "sosReceivers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0D8B918];
    objc_msgSend(*(id *)(a1 + 32), "sosReceivers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createWithManagedObject:", v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19)
      goto LABEL_20;
  }
  else if ((v14 & 1) == 0)
  {
    v19 = v5;
    if (v19)
      goto LABEL_20;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v57 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v61 = "+[SMSessionConfiguration(RTCoreDataTransformable) createWithSMSessionConfigurationMO:]_block_invoke";
    v62 = 2112;
    v63 = v57;
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "%s, no sosReceivers from SMSessionConfigurationMO, %@", buf, 0x16u);
  }

  v19 = 0;
LABEL_20:
  v21 = objc_msgSend(*(id *)(a1 + 32), "sessionType");
  if ((v21 - 2) < 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "destinationLatitude");
    v32 = v31;
    objc_msgSend(*(id *)(a1 + 32), "destinationLongitude");
    v34 = CLLocationCoordinate2DMake(v32, v33);
    v35 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v35, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v36, objc_msgSend(*(id *)(a1 + 32), "destinationReferenceFrame"), v34.latitude, v34.longitude, 0.0, 0.0, -1.0);

    v37 = objc_alloc(MEMORY[0x1E0D8BA08]);
    objc_msgSend(*(id *)(a1 + 32), "expectedTravelTime");
    v39 = v38;
    objc_msgSend(*(id *)(a1 + 32), "additionalTravelTime");
    v26 = (void *)objc_msgSend(v37, "initWithExpectedTravelTime:additionalTravelTime:transportType:", (int)objc_msgSend(*(id *)(a1 + 32), "transportType"), v39, v40);
    v41 = objc_alloc(MEMORY[0x1E0D8BA00]);
    objc_msgSend(*(id *)(a1 + 32), "destinationRadius");
    v43 = v42;
    v44 = (int)objc_msgSend(*(id *)(a1 + 32), "destinationType");
    objc_msgSend(*(id *)(a1 + 32), "destinationMapItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v41, "initWithCLLocation:eta:radius:destinationType:destinationMapItem:", v24, v26, v44, v45, v43);

    v46 = objc_alloc(MEMORY[0x1E0D8B9F0]);
    objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionStartDate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userResponseSafeDate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v46, "initDestinationBoundSessionConfigurationWithConversation:sessionID:destination:sessionStartDate:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:", v5, v47, v27, v48, v49, objc_msgSend(*(id *)(a1 + 32), "sessionSupportsHandoff"), v19);
    v51 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v52 = *(void **)(v51 + 40);
    *(_QWORD *)(v51 + 40) = v50;

    goto LABEL_28;
  }
  if (v21 == 4)
  {
    v53 = objc_alloc(MEMORY[0x1E0D8B9F0]);
    objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionStartDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "initWorkoutBoundSessionConfigurationWithConversation:sessionID:sessionStartDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", v5, v24, v26, objc_msgSend(*(id *)(a1 + 32), "sessionSupportsHandoff"), v19, (int)objc_msgSend(*(id *)(a1 + 32), "sessionWorkoutType"));
LABEL_27:
    v56 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v27 = *(void **)(v56 + 40);
    *(_QWORD *)(v56 + 40) = v54;
    goto LABEL_28;
  }
  if (v21 != 1)
  {
    v55 = objc_alloc(MEMORY[0x1E0D8B9F0]);
    objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionStartDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v59) = objc_msgSend(*(id *)(a1 + 32), "sessionSupportsHandoff");
    v54 = objc_msgSend(v55, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", v5, v24, v26, 0, 0, 0, 0, v59, v19, 0);
    goto LABEL_27;
  }
  v22 = objc_alloc(MEMORY[0x1E0D8BA88]);
  objc_msgSend(*(id *)(a1 + 32), "sessionTimeBound");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithTimeBound:", v23);

  v25 = objc_alloc(MEMORY[0x1E0D8B9F0]);
  objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionStartDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v25, "initTimeBoundSessionConfigurationWithConversation:sessionID:time:sessionStartDate:sessionSupportsHandoff:sosReceivers:", v5, v26, v24, v27, objc_msgSend(*(id *)(a1 + 32), "sessionSupportsHandoff"), v19);
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v30 = *(void **)(v29 + 40);
  *(_QWORD *)(v29 + 40) = v28;

LABEL_28:
}

@end
