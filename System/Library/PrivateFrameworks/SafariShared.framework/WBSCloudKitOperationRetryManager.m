@implementation WBSCloudKitOperationRetryManager

- (WBSCloudKitOperationRetryManager)init
{
  WBSCloudKitOperationRetryManager *v2;
  WBSCloudKitOperationRetryManager *v3;
  WBSCloudKitOperationRetryManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSCloudKitOperationRetryManager;
  v2 = -[WBSCloudKitOperationRetryManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_timeout = 3600.0;
    objc_storeStrong((id *)&v2->_scheduleQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
}

- (WBSCloudKitOperationRetryManager)initWithLog:(id)a3
{
  id v5;
  WBSCloudKitOperationRetryManager *v6;
  WBSCloudKitOperationRetryManager *v7;
  WBSCloudKitOperationRetryManager *v8;

  v5 = a3;
  v6 = -[WBSCloudKitOperationRetryManager init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_log, a3);
    v8 = v7;
  }

  return v7;
}

- (OS_os_log)log
{
  if (self->_log)
    return self->_log;
  else
    return (OS_os_log *)MEMORY[0x1E0C81028];
}

- (void)setScheduleQueue:(id)a3
{
  OS_dispatch_queue *v4;
  id v5;
  OS_dispatch_queue **p_scheduleQueue;
  OS_dispatch_queue *scheduleQueue;
  OS_dispatch_queue *v8;

  v4 = (OS_dispatch_queue *)a3;
  if (!v4)
  {
    v5 = MEMORY[0x1E0C80D38];
    v4 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
  }
  scheduleQueue = self->_scheduleQueue;
  p_scheduleQueue = &self->_scheduleQueue;
  if (scheduleQueue != v4)
  {
    v8 = v4;
    objc_storeStrong((id *)p_scheduleQueue, v4);
    v4 = v8;
  }

}

- (BOOL)_shouldRetryOperationWithError:(id)a3 isItemPartialError:(BOOL)a4 getRetryInterval:(double *)a5 underlyingError:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  char v16;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v10 = a3;
  if (objc_msgSend(v10, "safari_isInCloudKitErrorDomain"))
  {
    v11 = objc_retainAutorelease(v10);
    *a6 = v11;
    v12 = objc_msgSend(v11, "code");
    switch(v12)
    {
      case 1:
      case 5:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 35:
      case 36:
        goto LABEL_8;
      case 2:
        v36 = 0;
        v37 = &v36;
        v38 = 0x2020000000;
        v39 = 1;
        v32 = 0;
        v33 = (double *)&v32;
        v34 = 0x2020000000;
        v35 = 0;
        v26 = 0;
        v27 = &v26;
        v28 = 0x3032000000;
        v29 = __Block_byref_object_copy__5;
        v30 = __Block_byref_object_dispose__5;
        v31 = 0;
        objc_msgSend(v11, "userInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0C94948]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __119__WBSCloudKitOperationRetryManager__shouldRetryOperationWithError_isItemPartialError_getRetryInterval_underlyingError___block_invoke;
        v21[3] = &unk_1E4B2BC50;
        v21[4] = self;
        v23 = &v32;
        v24 = &v26;
        v22 = v11;
        v25 = &v36;
        objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v21);

        *a6 = objc_retainAutorelease((id)v27[5]);
        *a5 = v33[3];
        a4 = *((_BYTE *)v37 + 24) != 0;

        _Block_object_dispose(&v26, 8);
        _Block_object_dispose(&v32, 8);
        _Block_object_dispose(&v36, 8);
        break;
      case 3:
      case 4:
      case 6:
      case 7:
      case 23:
      case 34:
        objc_msgSend(v11, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "safari_numberForKey:", *MEMORY[0x1E0C94800]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v14, "doubleValue");
        else
          v15 = 5.0;
        *a5 = v15;

        a4 = 1;
        break;
      case 22:
        break;
      default:
        v16 = v12 - 100;
        if ((unint64_t)(v12 - 100) > 0x3D
          || ((1 << v16) & 0x30040001C1F06001) == 0 && ((1 << v16) & 0x10000009C00) == 0)
        {
          -[WBSCloudKitOperationRetryManager log](self, "log");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            -[WBSCloudKitOperationRetryManager _shouldRetryOperationWithError:isItemPartialError:getRetryInterval:underlyingError:].cold.1(v11, v20);

        }
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    a4 = 0;
  }

  return a4;
}

void __119__WBSCloudKitOperationRetryManager__shouldRetryOperationWithError_isItemPartialError_getRetryInterval_underlyingError___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  int v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BYTE *v18;
  id v19;
  double v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v19 = 0;
  v20 = 0.0;
  v9 = objc_msgSend(*(id *)(a1 + 32), "_shouldRetryOperationWithError:isItemPartialError:getRetryInterval:underlyingError:", v8, 1, &v20, &v19);
  v10 = v19;
  v11 = v19;
  if (v9)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (v20 > *(double *)(v12 + 24))
    {
      *(double *)(v12 + 24) = v20;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v10);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "safari_privacyPreservingError");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ckShortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_logStringForOperationGroup");
      v18 = a4;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v14;
      v23 = 2114;
      v24 = v15;
      v25 = 2114;
      v26 = v16;
      v27 = 2114;
      v28 = v17;
      _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_INFO, "Error %{public}@ for item ID %{public}@ blocks retry of partial error %{public}@%{public}@", buf, 0x2Au);

      a4 = v18;
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (int64_t)scheduleRetryIfNeededForError:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  unint64_t numberOfRetries;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  NSDate *v21;
  NSDate *dateRetryWasFirstRequested;
  int64_t v23;
  dispatch_time_t v24;
  _BOOL4 v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v31;
  double timeout;
  double v33;
  double v34;
  double v35;
  id v36;
  double v37;
  uint8_t buf[4];
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_dateRetryWasFirstRequested)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
    dateRetryWasFirstRequested = self->_dateRetryWasFirstRequested;
    self->_dateRetryWasFirstRequested = v21;

    if (v6)
    {
LABEL_3:
      v36 = 0;
      v37 = 0.0;
      v8 = -[WBSCloudKitOperationRetryManager _shouldRetryOperationWithError:isItemPartialError:getRetryInterval:underlyingError:](self, "_shouldRetryOperationWithError:isItemPartialError:getRetryInterval:underlyingError:", v6, 0, &v37, &v36);
      v9 = v36;
      if (!v8)
      {
        v23 = 3;
LABEL_22:

        goto LABEL_23;
      }
      numberOfRetries = self->_numberOfRetries;
      v11 = exp2((double)numberOfRetries) * 5.0;
      if (v11 <= v37)
        v12 = v37;
      else
        v12 = v11;
      v37 = v12;
      self->_numberOfRetries = numberOfRetries + 1;
      -[NSDate timeIntervalSinceNow](self->_dateRetryWasFirstRequested, "timeIntervalSinceNow");
      if (v12 - v13 > self->_timeout)
      {
        -[WBSCloudKitOperationRetryManager log](self, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        if (v9 == v6)
        {
          if (v15)
          {
            objc_msgSend(v6, "safari_privacyPreservingDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v37;
            timeout = self->_timeout;
            -[WBSCloudKitOperationRetryManager _logStringForOperationGroup](self, "_logStringForOperationGroup");
            v33 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 138544130;
            v39 = *(double *)&v16;
            v40 = 2048;
            v41 = v31;
            v42 = 2048;
            v43 = timeout;
            v44 = 2114;
            v45 = v33;
            _os_log_error_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_ERROR, "Operation failed due to error %{public}@; not retrying because retry interval (%f seconds) exceeds timeout"
              " (%f seconds)%{public}@",
              buf,
              0x2Au);

            goto LABEL_25;
          }
        }
        else if (v15)
        {
          objc_msgSend(v9, "safari_privacyPreservingDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "safari_privacyPreservingDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v37;
          v19 = self->_timeout;
          -[WBSCloudKitOperationRetryManager _logStringForOperationGroup](self, "_logStringForOperationGroup");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v39 = *(double *)&v16;
          v40 = 2114;
          v41 = *(double *)&v17;
          v42 = 2048;
          v43 = v18;
          v44 = 2048;
          v45 = v19;
          v46 = 2114;
          v47 = v20;
          _os_log_error_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_ERROR, "Operation failed due to error %{public}@, underlying error %{public}@; not retrying because retry interval ("
            "%f seconds) exceeds timeout (%f seconds)%{public}@",
            buf,
            0x34u);

LABEL_25:
        }
        v23 = 2;
LABEL_21:

        goto LABEL_22;
      }
      v24 = dispatch_time(0, (uint64_t)(v37 * 1000000000.0));
      dispatch_after(v24, (dispatch_queue_t)self->_scheduleQueue, v7);
      -[WBSCloudKitOperationRetryManager log](self, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (v9 == v6)
      {
        if (v25)
        {
          v34 = v37;
          objc_msgSend(v6, "safari_privacyPreservingDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSCloudKitOperationRetryManager _logStringForOperationGroup](self, "_logStringForOperationGroup");
          v35 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 134218498;
          v39 = v34;
          v40 = 2114;
          v41 = *(double *)&v27;
          v42 = 2114;
          v43 = v35;
          _os_log_error_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_ERROR, "Will retry operation in %f seconds due to error %{public}@%{public}@", buf, 0x20u);

          goto LABEL_27;
        }
      }
      else if (v25)
      {
        v26 = v37;
        objc_msgSend(v9, "safari_privacyPreservingDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "safari_privacyPreservingDescription");
        v28 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        -[WBSCloudKitOperationRetryManager _logStringForOperationGroup](self, "_logStringForOperationGroup");
        v29 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 134218754;
        v39 = v26;
        v40 = 2114;
        v41 = *(double *)&v27;
        v42 = 2114;
        v43 = v28;
        v44 = 2114;
        v45 = v29;
        _os_log_error_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_ERROR, "Will retry operation in %f seconds due to error %{public}@, underlying error %{public}@%{public}@", buf, 0x2Au);

LABEL_27:
      }
      v23 = 1;
      goto LABEL_21;
    }
  }
  v23 = 0;
LABEL_23:

  return v23;
}

- (id)_logStringForOperationGroup
{
  CKOperationGroup *operationGroup;
  void *v3;
  void *v4;
  __CFString *v5;

  operationGroup = self->_operationGroup;
  if (operationGroup)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[CKOperationGroup safari_logDescription](operationGroup, "safari_logDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR(" with %@"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E4B40D18;
  }
  return v5;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (CKOperationGroup)operationGroup
{
  return self->_operationGroup;
}

- (void)setOperationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_operationGroup, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unint64_t)numberOfRetries
{
  return self->_numberOfRetries;
}

- (OS_dispatch_queue)scheduleQueue
{
  return self->_scheduleQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleQueue, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_dateRetryWasFirstRequested, 0);
}

- (void)_shouldRetryOperationWithError:(void *)a1 isItemPartialError:(NSObject *)a2 getRetryInterval:underlyingError:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "safari_privacyPreservingError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_fault_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_FAULT, "CKError %{public}@ is not handled, add the new value to the switch", (uint8_t *)&v4, 0xCu);

}

@end
