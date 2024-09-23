@implementation RTCLLocationMO

uint64_t __211__RTCLLocationMO_managedObjectWithLatitude_longitude_altitude_horizontalAccuracy_verticalAccuracy_course_courseAccuracy_speed_speedAccuracy_timestamp_type_signalEnvironmentType_integrity_inManagedObjectContext___block_invoke(uint64_t a1)
{
  RTCLLocationMO *v2;
  uint64_t v3;
  void *v4;

  v2 = -[RTCLLocationMO initWithContext:]([RTCLLocationMO alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setLatitude:", *(double *)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setLongitude:", *(double *)(a1 + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setAltitude:", *(double *)(a1 + 96));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setHorizontalAccuracy:", *(double *)(a1 + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setVerticalAccuracy:", *(double *)(a1 + 112));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCourse:", *(double *)(a1 + 120));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCourseAccuracy:", *(double *)(a1 + 128));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setSpeed:", *(double *)(a1 + 136));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setSpeedAccuracy:", *(double *)(a1 + 144));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setTimestamp:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setType:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setSignalEnvironmentType:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setIntegrity:", *(_QWORD *)(a1 + 64));
}

+ (id)managedObjectWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 horizontalAccuracy:(double)a6 verticalAccuracy:(double)a7 course:(double)a8 courseAccuracy:(double)a9 speed:(double)a10 speedAccuracy:(double)a11 timestamp:(id)a12 type:(id)a13 signalEnvironmentType:(id)a14 integrity:(id)a15 inManagedObjectContext:(id)a16
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v27 = a12;
  v28 = a13;
  v29 = a14;
  v30 = a15;
  v31 = a16;
  v32 = v31;
  if (v31)
  {
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__45;
    v56 = __Block_byref_object_dispose__45;
    v57 = 0;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __211__RTCLLocationMO_managedObjectWithLatitude_longitude_altitude_horizontalAccuracy_verticalAccuracy_course_courseAccuracy_speed_speedAccuracy_timestamp_type_signalEnvironmentType_integrity_inManagedObjectContext___block_invoke;
    v36[3] = &unk_1E929BA78;
    v42 = &v52;
    v37 = v31;
    v43 = a3;
    v44 = a4;
    v45 = a5;
    v46 = a6;
    v47 = a7;
    v48 = a8;
    v49 = a9;
    v50 = a10;
    v51 = a11;
    v38 = v27;
    v39 = v28;
    v40 = v29;
    v41 = v30;
    objc_msgSend(v37, "performBlockAndWait:", v36);
    v33 = (id)v53[5];

    _Block_object_dispose(&v52, 8);
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTCLLocationMO"));
}

@end
