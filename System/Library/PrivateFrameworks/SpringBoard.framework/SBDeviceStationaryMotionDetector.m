@implementation SBDeviceStationaryMotionDetector

- (SBDeviceStationaryMotionDetector)init
{
  SBDeviceStationaryMotionDetector *v2;
  CMMotionActivityManager *v3;
  CMMotionActivityManager *activityManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDeviceStationaryMotionDetector;
  v2 = -[SBDeviceStationaryMotionDetector init](&v6, sel_init);
  if (v2)
  {
    v3 = (CMMotionActivityManager *)objc_alloc_init(MEMORY[0x1E0CA5660]);
    activityManager = v2->_activityManager;
    v2->_activityManager = v3;

  }
  return v2;
}

- (void)queryWithStationaryThresholdTime:(double)a3 pickUpBufferTime:(double)a4 callbackOnMainQueue:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  CMMotionActivityManager *activityManager;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;

  v9 = a5;
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceStationaryMotionDetector.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stationaryThreshold > 0"));

  }
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceStationaryMotionDetector.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pickUpBufferTime > 0"));

    if (v9)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceStationaryMotionDetector.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("callback != nil"));

    goto LABEL_5;
  }
  if (!v9)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", -(a3 + a4 + 1.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  activityManager = self->_activityManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __106__SBDeviceStationaryMotionDetector_queryWithStationaryThresholdTime_pickUpBufferTime_callbackOnMainQueue___block_invoke;
  v19[3] = &unk_1E8EA74F0;
  v22 = a4;
  v23 = a3 + a4;
  v24 = a3;
  v20 = v10;
  v21 = v9;
  v14 = v9;
  v15 = v10;
  -[CMMotionActivityManager queryActivityStartingFromDate:toDate:toQueue:withHandler:](activityManager, "queryActivityStartingFromDate:toDate:toQueue:withHandler:", v11, v15, v13, v19);

}

void __106__SBDeviceStationaryMotionDetector_queryWithStationaryThresholdTime_pickUpBufferTime_callbackOnMainQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  __CFString *v30;
  __CFString *v31;
  NSObject *v32;
  __CFString *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  double v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSince1970");
  v8 = v7;

  SBLogStationaryMotionDetector();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v40 = v6 - v8;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "CMMotionActivityManager responded in %0.2f seconds.", buf, 0xCu);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v3, "reverseObjectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    v34 = v3;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        SBLogStationaryMotionDetector();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v40 = *(double *)&v15;
          _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Processing Activity %{public}@", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "timeIntervalSince1970");
        v18 = v17;
        objc_msgSend(v15, "startDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSince1970");
        v21 = v18 - v20;

        if ((objc_msgSend(v15, "stationary") & 1) != 0)
        {
          v26 = *(double *)(a1 + 56);
          SBLogStationaryMotionDetector();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = *(_QWORD *)(a1 + 64);
            *(_DWORD *)buf = 134218240;
            v40 = v21;
            v41 = 2048;
            v42 = v28;
            _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "Device was stationary for %0.2f seconds. (Stationary Threshold=%0.2f)", buf, 0x16u);
          }

          if (v21 >= v26)
            v25 = 1;
          else
            v25 = 2;
          SBLogStationaryMotionDetector();
          v29 = objc_claimAutoreleasedReturnValue();
          v3 = v34;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = CFSTR("Non Stationary");
            if (v21 >= v26)
              v30 = CFSTR("Stationary");
            *(double *)&v31 = COERCE_DOUBLE(v30);
            *(_DWORD *)buf = 138543362;
            v40 = *(double *)&v31;
            _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "Detected terminal stationary event: %{public}@. Breaking out.", buf, 0xCu);

          }
          goto LABEL_31;
        }
        v22 = *(double *)(a1 + 48);
        SBLogStationaryMotionDetector();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 134218240;
          v40 = v21;
          v41 = 2048;
          v42 = v24;
          _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "Device became non-stationary %0.2f seconds ago. (Pick up buffer=%0.2f)", buf, 0x16u);
        }

        if (v21 >= v22)
        {
          SBLogStationaryMotionDetector();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v25 = 2;
            _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "Detected out-of-buffer non-stationary event. Breaking out.", buf, 2u);
          }
          else
          {
            v25 = 2;
          }
          v3 = v34;
LABEL_31:

          goto LABEL_32;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      v25 = 0;
      v3 = v34;
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v25 = 0;
  }
LABEL_32:

  SBLogStationaryMotionDetector();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = off_1E8EA7510[v25];
    *(_DWORD *)buf = 138543362;
    v40 = *(double *)&v33;
    _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_DEFAULT, "Resolved state %{public}@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end
