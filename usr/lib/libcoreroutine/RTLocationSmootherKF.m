@implementation RTLocationSmootherKF

- (RTLocationSmootherKF)init
{
  RTLocationSmootherKF *v2;
  RTFixedSizeQueue *v3;
  RTFixedSizeQueue *states;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTLocationSmootherKF;
  v2 = -[RTLocationSmootherKF init](&v6, sel_init);
  if (v2)
  {
    v3 = -[RTFixedSizeQueue initWithCapacity:]([RTFixedSizeQueue alloc], "initWithCapacity:", 20);
    states = v2->states;
    v2->states = v3;

  }
  return v2;
}

- (id)smoothLocations:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  RTFixedSizeQueue *states;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  void *v19;
  NSObject *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  NSObject *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __int128 v62;
  uint8_t buf[4];
  unint64_t v64;
  __int16 v65;
  unint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  double v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  double v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "count"))
  {
    if (-[RTFixedSizeQueue count](self->states, "count"))
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "coordinate");
      self->refLat = v8;

      objc_msgSend(v4, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "coordinate");
      self->refLon = v10;

      objc_msgSend(v4, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationSmootherKF getRefAlt:](self, "getRefAlt:", v11);
      self->refAlt = v12;

      states = self->states;
      v14 = (void *)objc_opt_new();
      v15 = -[RTFixedSizeQueue enqueueObject:](states, "enqueueObject:", v14);

      objc_msgSend(v4, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");
      objc_msgSend(v5, "addObject:", v17);

      v6 = 1;
    }
    if (v6 < objc_msgSend(v4, "count"))
    {
      *(_QWORD *)&v18 = 138412546;
      v62 = v18;
      do
      {
        -[RTFixedSizeQueue lastObject](self->states, "lastObject", v62);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityLocation);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v62;
          v64 = (unint64_t)v19;
          v65 = 2048;
          v66 = v6;
          _os_log_debug_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEBUG, "RTLocationSmootherKF, state, %@, i, %lu", buf, 0x16u);
        }

        objc_msgSend(v19, "estimateWithIndex:", 0);
        v22 = v21;
        objc_msgSend(v19, "estimateWithIndex:", 1);
        v24 = v23;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "coordinate");
        objc_msgSend(v25, "coordinate");
        RTCommonConvertGeodeticToLocalFrame();
        objc_msgSend(v25, "timestamp");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timeIntervalSinceReferenceDate");
        v28 = v27;
        objc_msgSend(v19, "timestamp");
        v30 = v28 - v29;

        objc_msgSend(v25, "timestamp");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "timeIntervalSinceReferenceDate");
        objc_msgSend(v19, "setTimestamp:");

        if (v30 * 0.565685425 * (v30 * 0.565685425) >= 10.0)
          v32 = v30 * 0.565685425 * (v30 * 0.565685425);
        else
          v32 = 10.0;
        if ((unint64_t)((uint64_t)(v6 - 1) % 100 - 91) <= 0xFFFFFFFFFFFFFFAELL)
        {
          _rt_log_facility_get_os_log(RTLogFacilityLocation);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v25, "coordinate");
            v53 = v52;
            objc_msgSend(v25, "coordinate");
            v55 = v54;
            objc_msgSend(v25, "horizontalAccuracy");
            *(_DWORD *)buf = 134219776;
            v64 = v6 - 1;
            v65 = 2048;
            v66 = v53;
            v67 = 2048;
            v68 = v55;
            v69 = 2048;
            v70 = v56;
            v71 = 2048;
            v72 = v30;
            v73 = 2048;
            v74 = 0;
            v75 = 2048;
            v76 = 0;
            v77 = 2048;
            v78 = v32;
            _os_log_debug_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_DEBUG, "RTLocationSmootherKF, input, %lu, lat, %f, lng, %f, hacc, %f, timeInterval, %f, obsX, %f, obsY, %f, qk, %f", buf, 0x52u);
          }

        }
        objc_msgSend(v19, "updateMotionX:motionY:dt:error:", 0.0, 0.0, v30, v32);
        objc_msgSend(v19, "errorProWithIndex:", 0);
        v35 = v34;
        objc_msgSend(v19, "errorProWithIndex:", 1);
        v37 = v36;
        objc_msgSend(v25, "horizontalAccuracy");
        v39 = v38;
        objc_msgSend(v25, "horizontalAccuracy");
        objc_msgSend(v19, "updateObservationX:observationY:sigmaX:sigmaY:", 0.0, 0.0, v39, v40);
        v41 = -[RTFixedSizeQueue count](self->states, "count");
        if ((uint64_t)(v41 - 2) >= 0)
        {
          v42 = v41 - 1;
          do
          {
            -[RTFixedSizeQueue objectAtIndex:](self->states, "objectAtIndex:", --v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              objc_msgSend(v25, "horizontalAccuracy");
              v45 = v44;
              objc_msgSend(v25, "horizontalAccuracy");
              objc_msgSend(v43, "updatePostObservationDeltaX:observationDeltaY:errProX:errProY:sigmaX:sigmaY:", 0.0 - v22, 0.0 - v24, v35, v37, v45, v46);
            }

          }
          while (v42 > 0);
        }
        v47 = (void *)objc_msgSend(v19, "copy");
        objc_msgSend(v47, "increaseIndex");
        -[RTFixedSizeQueue enqueueObject:](self->states, "enqueueObject:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (v48)
        {
          objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v48, "i"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLocationSmootherKF buildLocationWithEstimationState:originalLocation:](self, "buildLocationWithEstimationState:originalLocation:", v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v51);

        }
        ++v6;
      }
      while (v6 < objc_msgSend(v4, "count"));
    }
    if (-[RTFixedSizeQueue count](self->states, "count") >= 2)
    {
      do
      {
        -[RTFixedSizeQueue dequeueObject](self->states, "dequeueObject");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v57, "i"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLocationSmootherKF buildLocationWithEstimationState:originalLocation:](self, "buildLocationWithEstimationState:originalLocation:", v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v59);

      }
      while (-[RTFixedSizeQueue count](self->states, "count") > 1);
    }
    -[RTFixedSizeQueue lastObject](self->states, "lastObject");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "resetIndex");

  }
  return v5;
}

- (double)getRefAlt:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;

  v3 = a3;
  objc_msgSend(v3, "verticalAccuracy");
  v4 = 0.0;
  if (v5 > 0.0)
  {
    objc_msgSend(v3, "altitude");
    v4 = v6;
  }

  return v4;
}

- (id)buildLocationWithEstimationState:(id)a3 originalLocation:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[48];
  __int128 v25;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;
  _OWORD v29[2];
  _BYTE buf[32];
  _BYTE v31[32];
  _BYTE v32[32];
  __int128 v33;
  __int128 v34;
  _OWORD v35[2];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "estimateWithIndex:", 0);
  v8 = v7;
  objc_msgSend(v5, "estimateWithIndex:", 1);
  v10 = v9;
  objc_msgSend(v5, "estimatedAccuracy");
  v12 = v11;
  RTCommonConvertLocalFrameToGeodetic();
  v28 = 0u;
  memset(v29, 0, 28);
  v27 = 0u;
  v25 = 0u;
  memset(v26, 0, sizeof(v26));
  *(_OWORD *)&v24[32] = 0u;
  *(_DWORD *)v24 = 0;
  v13 = (void *)objc_opt_new();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "clientLocation");
  }
  else
  {
    v28 = 0u;
    memset(v29, 0, 28);
    v27 = 0u;
    v25 = 0u;
    memset(v26, 0, sizeof(v26));
    *(_OWORD *)&v24[32] = 0u;
    *(_DWORD *)v24 = 0;
  }

  objc_msgSend(v6, "timestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  *(_QWORD *)((char *)v26 + 12) = v16;

  LODWORD(v27) = objc_msgSend(v6, "type");
  *(_QWORD *)&v24[20] = v12;
  *(_QWORD *)&v24[4] = 0;
  *(_QWORD *)&v24[12] = 0;
  objc_msgSend(v6, "altitude");
  *(_QWORD *)&v24[28] = v17;
  if (__ROR8__(0x8F5C28F5C28F5C29 * objc_msgSend(v5, "i") + 0x51EB851EB851EB8, 2) <= 0x28F5C28F5C28F5CuLL)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v22 = objc_msgSend(v5, "i");
      objc_msgSend(v6, "altitude");
      *(_DWORD *)buf = 134219778;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v8;
      *(_WORD *)v31 = 2048;
      *(_QWORD *)&v31[2] = v10;
      *(_WORD *)&v31[10] = 2048;
      *(_QWORD *)&v31[12] = v12;
      *(_WORD *)&v31[20] = 2048;
      *(_QWORD *)&v31[22] = 0;
      *(_WORD *)&v31[30] = 2048;
      *(_QWORD *)v32 = 0;
      *(_WORD *)&v32[8] = 2048;
      *(_QWORD *)&v32[10] = v23;
      _os_log_debug_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEBUG, "RTLocationSmootherKF, %lu, estimated location, %@, xEst, %f, yEst, %f, errPro, %f, latEst, %f, lngEst, %f, alt, %f", buf, 0x52u);
    }

  }
  v19 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  v33 = v27;
  v34 = v28;
  v35[0] = v29[0];
  *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)((char *)v29 + 12);
  *(_OWORD *)v31 = *(_OWORD *)&v24[32];
  *(_OWORD *)&v31[16] = v25;
  *(_OWORD *)v32 = v26[0];
  *(_OWORD *)&v32[16] = v26[1];
  *(_OWORD *)buf = *(_OWORD *)v24;
  *(_OWORD *)&buf[16] = *(_OWORD *)&v24[16];
  v20 = (void *)objc_msgSend(v19, "initWithClientLocation:", buf);

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->states, 0);
}

@end
