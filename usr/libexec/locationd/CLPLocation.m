@implementation CLPLocation

- (CLPLocation)initWithDaemonLocation:(CLDaemonLocation *)a3 rawMotionActivity:(CLMotionActivity *)a4 motionActivity:(double)a5 dominantMotionActivity:(int)a6 vehicleConnected:(int)a7 vehicleConnectionStateChanged:(id)a8
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CLPLocation *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _OWORD v48[8];
  uint64_t v49;
  _OWORD v50[8];
  uint64_t v51;
  _OWORD v52[8];
  uint64_t v53;
  _OWORD v54[8];
  uint64_t v55;
  _OWORD v56[8];
  _OWORD v57[2];

  v13 = *(_QWORD *)&a9;
  v14 = *(_QWORD *)&a8;
  v15 = *(_QWORD *)&a7;
  v16 = *(_QWORD *)&a6;
  rawCoordinate = a3->rawCoordinate;
  v56[6] = *(_OWORD *)&a3->lifespan;
  v56[7] = rawCoordinate;
  v57[0] = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)((char *)v57 + 12) = *(_OWORD *)&a3->integrity;
  v19 = *(_OWORD *)&a3->speed;
  v56[2] = *(_OWORD *)&a3->altitude;
  v56[3] = v19;
  v20 = *(_OWORD *)&a3->timestamp;
  v56[4] = *(_OWORD *)&a3->course;
  v56[5] = v20;
  v21 = *(_OWORD *)&a3->coordinate.longitude;
  v56[0] = *(_OWORD *)&a3->suitability;
  v56[1] = v21;
  v22 = -[CLPLocation initWithDaemonLocation:](self, "initWithDaemonLocation:", v56);
  if (v22)
  {
    v23 = objc_alloc((Class)CLPMotionActivity);
    v24 = *(_OWORD *)&a4[1].isStanding;
    v54[6] = *(_OWORD *)&a4[1].mountedConfidence;
    v54[7] = v24;
    v55 = *(_QWORD *)&a4[1].isVehicleConnected;
    v25 = *(_OWORD *)&a4->isVehicleConnected;
    v54[2] = *(_OWORD *)&a4->isStanding;
    v54[3] = v25;
    v26 = *(_OWORD *)&a4[1].type;
    v54[4] = *(_OWORD *)&a4->vehicleType;
    v54[5] = v26;
    v27 = *(_OWORD *)&a4->mountedConfidence;
    v54[0] = *(_OWORD *)&a4->type;
    v54[1] = v27;
    v28 = objc_msgSend(v23, "initWithCLMotionActivity:", v54);
    -[CLPLocation setRawMotionActivity:](v22, "setRawMotionActivity:", v28);

    v29 = objc_alloc((Class)CLPMotionActivity);
    v30 = *(_OWORD *)(v16 + 112);
    v52[6] = *(_OWORD *)(v16 + 96);
    v52[7] = v30;
    v53 = *(_QWORD *)(v16 + 128);
    v31 = *(_OWORD *)(v16 + 48);
    v52[2] = *(_OWORD *)(v16 + 32);
    v52[3] = v31;
    v32 = *(_OWORD *)(v16 + 80);
    v52[4] = *(_OWORD *)(v16 + 64);
    v52[5] = v32;
    v33 = *(_OWORD *)(v16 + 16);
    v52[0] = *(_OWORD *)v16;
    v52[1] = v33;
    v34 = objc_msgSend(v29, "initWithCLMotionActivity:", v52);
    -[CLPLocation setMotionActivity:](v22, "setMotionActivity:", v34);

    v35 = objc_alloc((Class)CLPMotionActivity);
    v36 = *(_OWORD *)(v15 + 112);
    v50[6] = *(_OWORD *)(v15 + 96);
    v50[7] = v36;
    v51 = *(_QWORD *)(v15 + 128);
    v37 = *(_OWORD *)(v15 + 48);
    v50[2] = *(_OWORD *)(v15 + 32);
    v50[3] = v37;
    v38 = *(_OWORD *)(v15 + 80);
    v50[4] = *(_OWORD *)(v15 + 64);
    v50[5] = v38;
    v39 = *(_OWORD *)(v15 + 16);
    v50[0] = *(_OWORD *)v15;
    v50[1] = v39;
    v40 = objc_msgSend(v35, "initWithCLMotionActivity:", v50);
    -[CLPLocation setDominantMotionActivity:](v22, "setDominantMotionActivity:", v40);

    -[CLPLocation setMotionVehicleConnected:](v22, "setMotionVehicleConnected:", v14);
    -[CLPLocation setMotionVehicleConnectedStateChanged:](v22, "setMotionVehicleConnectedStateChanged:", v13);
    v41 = objc_alloc((Class)CLPVehicleType);
    v42 = *(_OWORD *)(v16 + 112);
    v48[6] = *(_OWORD *)(v16 + 96);
    v48[7] = v42;
    v49 = *(_QWORD *)(v16 + 128);
    v43 = *(_OWORD *)(v16 + 48);
    v48[2] = *(_OWORD *)(v16 + 32);
    v48[3] = v43;
    v44 = *(_OWORD *)(v16 + 80);
    v48[4] = *(_OWORD *)(v16 + 64);
    v48[5] = v44;
    v45 = *(_OWORD *)(v16 + 16);
    v48[0] = *(_OWORD *)v16;
    v48[1] = v45;
    v46 = objc_msgSend(v41, "initWithCLMotionActivity:", v48);
    -[CLPLocation setVehicleType:](v22, "setVehicleType:", v46);

  }
  return v22;
}

- (id)initWithDaemonLocation:(CLDaemonLocation *)a3
{
  CLPLocation *v4;
  CLPLocation *v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLPLocation;
  v4 = -[CLPLocation init](&v15, "init");
  v5 = v4;
  if (!v4)
    return v5;
  if (HIDWORD(a3->rawCourse) == 1)
  {
    -[CLPLocation setLatitude:](v4, "setLatitude:", *(double *)(&a3->suitability + 1));
    v6 = (double *)((char *)&a3->coordinate.latitude + 4);
LABEL_6:
    -[CLPLocation setLongitude:](v5, "setLongitude:", *v6);
    goto LABEL_7;
  }
  if (a3->floor == 1)
  {
    -[CLPLocation setLatitude:](v4, "setLatitude:", *(double *)((char *)&a3->lifespan + 4));
    v6 = (double *)(&a3->type + 1);
    goto LABEL_6;
  }
LABEL_7:
  v7 = *(double *)((char *)&a3->coordinate.longitude + 4);
  *(float *)&v7 = v7;
  -[CLPLocation setHorizontalAccuracy:](v5, "setHorizontalAccuracy:", v7);
  -[CLPLocation setTimestamp:](v5, "setTimestamp:", *(double *)((char *)&a3->courseAccuracy + 4));
  -[CLPLocation setProvider:](v5, "setProvider:", LODWORD(a3->lifespan));
  if (*(double *)((char *)&a3->speedAccuracy + 4) >= 0.0)
  {
    v8 = *(double *)((char *)&a3->verticalAccuracy + 4);
    *(float *)&v8 = v8;
    -[CLPLocation setSpeed:](v5, "setSpeed:", v8);
    v9 = *(double *)((char *)&a3->speed + 4);
    *(float *)&v9 = v9;
    -[CLPLocation setSpeedAccuracy:](v5, "setSpeedAccuracy:", v9);
    v10 = *(double *)((char *)&a3->speedAccuracy + 4);
    *(float *)&v10 = v10;
    -[CLPLocation setCourse:](v5, "setCourse:", v10);
    v11 = *(double *)((char *)&a3->course + 4);
    *(float *)&v11 = v11;
    -[CLPLocation setCourseAccuracy:](v5, "setCourseAccuracy:", v11);
  }
  if (*(double *)((char *)&a3->altitude + 4) > 0.0)
  {
    v12 = *(double *)((char *)&a3->horizontalAccuracy + 4);
    *(float *)&v12 = v12;
    -[CLPLocation setAltitude:](v5, "setAltitude:", v12);
    v13 = *(double *)((char *)&a3->altitude + 4);
    *(float *)&v13 = v13;
    -[CLPLocation setVerticalAccuracy:](v5, "setVerticalAccuracy:", v13);
  }
  return v5;
}

@end
