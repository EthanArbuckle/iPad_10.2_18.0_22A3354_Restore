@implementation RTPersistenceMirroringRequest

- (RTPersistenceMirroringRequest)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_requestType_mirroringPolicy_affectedStores_options_completionHandler_);
}

- (RTPersistenceMirroringRequest)initWithQueue:(id)a3 requestType:(int64_t)a4 mirroringPolicy:(id)a5 affectedStores:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  RTPersistenceMirroringRequest *v20;
  uint64_t v21;
  NSUUID *identifier;
  uint64_t v23;
  NSMutableArray *completionHandlers;
  NSObject *v25;
  NSMutableArray *v26;
  void *v27;
  uint64_t v28;
  NSDate *enqueueDate;
  RTPersistenceMirroringRequest *v30;
  NSObject *v31;
  const char *v32;
  objc_super v34;
  uint8_t buf[16];

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      v30 = 0;
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: mirroringPolicy";
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, v32, buf, 2u);
    goto LABEL_12;
  }
  if (!objc_msgSend(v17, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: affectedStores.count >= 1";
    goto LABEL_15;
  }
  v34.receiver = self;
  v34.super_class = (Class)RTPersistenceMirroringRequest;
  v20 = -[RTPersistenceMirroringRequest init](&v34, sel_init);
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = objc_claimAutoreleasedReturnValue();
    identifier = v20->_identifier;
    v20->_identifier = (NSUUID *)v21;

    objc_storeStrong((id *)&v20->_queue, a3);
    v23 = objc_opt_new();
    completionHandlers = v20->_completionHandlers;
    v20->_completionHandlers = (NSMutableArray *)v23;

    v20->_requestType = a4;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v25 = objc_claimAutoreleasedReturnValue();
    v20->_sid = os_signpost_id_generate(v25);

    -[RTPersistenceMirroringRequest _createMirroringRequestWithRequestType:affectedStores:options:](v20, "_createMirroringRequestWithRequestType:affectedStores:options:", a4, v17, v18);
    if (v19 && v20->_request)
    {
      v26 = v20->_completionHandlers;
      v27 = (void *)MEMORY[0x1D8232094](v19);
      -[NSMutableArray addObject:](v26, "addObject:", v27);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = objc_claimAutoreleasedReturnValue();
    enqueueDate = v20->_enqueueDate;
    v20->_enqueueDate = (NSDate *)v28;

    objc_storeStrong((id *)&v20->_mirroringPolicy, a5);
  }
  self = v20;
  v30 = self;
LABEL_13:

  return v30;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_completionHandlers, "count"))
  {
    v6 = *MEMORY[0x1E0CB2D50];
    v7[0] = CFSTR("Pending mirroring operation failed.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), 0, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPersistenceMirroringRequest _dispatchAllHandlersWithError:](self, "_dispatchAllHandlersWithError:", v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)RTPersistenceMirroringRequest;
  -[RTPersistenceMirroringRequest dealloc](&v5, sel_dealloc);
}

- (void)_createMirroringRequestWithRequestType:(int64_t)a3 affectedStores:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSCloudKitMirroringRequest *v12;
  id v13;
  id v14;
  NSObject *request;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id location;
  uint8_t buf[4];
  int64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __95__RTPersistenceMirroringRequest__createMirroringRequestWithRequestType_affectedStores_options___block_invoke;
  v19 = &unk_1E9299DD0;
  objc_copyWeak(&v20, &location);
  v10 = (void *)MEMORY[0x1D8232094](&v16);
  switch(a3)
  {
    case 2:
      v13 = objc_alloc(MEMORY[0x1E0C97B10]);
      v12 = (NSCloudKitMirroringRequest *)objc_msgSend(v13, "initWithOptions:completionBlock:", v9, v10, v16, v17, v18, v19);
      goto LABEL_7;
    case 1:
      v14 = objc_alloc(MEMORY[0x1E0C97AE8]);
      v12 = (NSCloudKitMirroringRequest *)objc_msgSend(v14, "initWithOptions:completionBlock:", v9, v10, v16, v17, v18, v19);
      goto LABEL_7;
    case 0:
      v11 = objc_alloc(MEMORY[0x1E0C97AF8]);
      v12 = (NSCloudKitMirroringRequest *)objc_msgSend(v11, "initWithOptions:completionBlock:", v9, v10, v16, v17, v18, v19);
LABEL_7:
      request = self->_request;
      self->_request = v12;
      goto LABEL_10;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  request = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(request, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    v23 = a3;
    v24 = 2080;
    v25 = "-[RTPersistenceMirroringRequest _createMirroringRequestWithRequestType:affectedStores:options:]";
    v26 = 1024;
    v27 = 113;
    _os_log_error_impl(&dword_1D1A22000, request, OS_LOG_TYPE_ERROR, "unhandled mirroring request type, %ld (in %s:%d)", buf, 0x1Cu);
  }
LABEL_10:

  -[NSCloudKitMirroringRequest setAffectedStores:](self->_request, "setAffectedStores:", v8);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __95__RTPersistenceMirroringRequest__createMirroringRequestWithRequestType_affectedStores_options___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleMirroringRequestResult:", v5);

}

- (void)_prepareMirroringRequestForRetry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "requestType");
  objc_msgSend(v4, "request");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "affectedStores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceMirroringRequest _createMirroringRequestWithRequestType:affectedStores:options:](self, "_createMirroringRequestWithRequestType:affectedStores:options:", v5, v6, v8);

}

- (void)handleMirroringRequestResult:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__RTPersistenceMirroringRequest_handleMirroringRequestResult___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __62__RTPersistenceMirroringRequest_handleMirroringRequestResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMirroringRequestResult:", *(_QWORD *)(a1 + 40));
}

- (void)_handleMirroringRequestResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[3];
  _QWORD v55[3];
  uint8_t buf[4];
  _BYTE v57[10];
  void *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[NSUUID UUIDString](self->_identifier, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v57 = v6;
    *(_WORD *)&v57[8] = 2112;
    v58 = v9;
    v59 = 1024;
    v60 = objc_msgSend(v4, "madeChanges");
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "request identifier, %@, CD request identifier, %@, made changes, %d", buf, 0x1Cu);

  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    -[NSUUID UUIDString](self->_identifier, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "success");
    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v57 = v11;
    *(_WORD *)&v57[8] = 2112;
    v58 = v13;
    v59 = 1024;
    v60 = v14;
    v61 = 2112;
    v62 = v15;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "request identifier, %@, CD request identifier, %@, success, %d, error, %@", buf, 0x26u);

  }
  objc_msgSend(v4, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = CKCanRetryForError();
    objc_msgSend(v4, "error");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "code");

    if ((v21 & 1) != 0 || v23 == 134409)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v57 = v21;
        *(_WORD *)&v57[4] = 1024;
        *(_DWORD *)&v57[6] = v23 == 134409;
        _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_INFO, "shouldRetryFromCKError, %d, mirroringDelegateRecoveredFromError, %d", buf, 0xEu);
      }

      objc_msgSend(v4, "error");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        v24 = v37;
      }
      else
      {
        objc_msgSend(v4, "error");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "description");
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v40 = CFSTR("no description");
      v41 = *MEMORY[0x1E0CB2D50];
      if (v24)
        v40 = v24;
      v55[0] = v40;
      v54[0] = v41;
      v54[1] = v19;
      objc_msgSend(v4, "error");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v55[1] = v42;
      v54[2] = CFSTR("Retry-After");
      v43 = (void *)MEMORY[0x1E0CB37E8];
      CKRetryAfterSecondsForError();
      objc_msgSend(v43, "numberWithDouble:");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v55[2] = v44;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = (void *)MEMORY[0x1E0CB35C8];
      v46 = 0;
    }
    else
    {
      objc_msgSend(v4, "error");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString domain](v24, "domain");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x1E0CB28A8];
      if (!objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
      {
        v34 = 0;
LABEL_27:

LABEL_28:
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(v4, "error");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "code");

      if (v28 != 134410)
      {
        v34 = 0;
        goto LABEL_29;
      }
      objc_msgSend(v20, "domain");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!-[__CFString isEqualToString:](v24, "isEqualToString:", v26))
      {
        v34 = 0;
        goto LABEL_28;
      }
      v29 = objc_msgSend(v20, "code");

      if (v29 != 134408)
      {
        v34 = 0;
        goto LABEL_29;
      }
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "mirroring request failed to exceeding maximum memory threshold", buf, 2u);
      }

      objc_msgSend(v4, "error");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        v24 = v32;
      }
      else
      {
        objc_msgSend(v4, "error");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "description");
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v49 = CFSTR("no description");
      v50 = *MEMORY[0x1E0CB2D50];
      if (v24)
        v49 = v24;
      v52[1] = v19;
      v53[0] = v49;
      v52[0] = v50;
      objc_msgSend(v4, "error");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = (void *)MEMORY[0x1E0CB35C8];
      v46 = 8;
    }
    objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), v46, v25);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  v34 = 0;
LABEL_30:
  objc_msgSend(v4, "error");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47 && !v34)
  {
    objc_msgSend(v4, "error");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[RTPersistenceMirroringRequest _completeRequestWithError:](self, "_completeRequestWithError:", v34);

}

- (BOOL)isEqualToMirroringRequest:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = objc_opt_class();
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == objc_opt_class())
  {
    -[NSCloudKitMirroringRequest affectedStores](self->_request, "affectedStores");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      || (objc_msgSend(v6, "request"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "affectedStores"),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[NSCloudKitMirroringRequest affectedStores](self->_request, "affectedStores");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "affectedStores");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "isEqual:", v13);

      if (v10)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v9 = 1;
    }

    goto LABEL_9;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  RTPersistenceMirroringRequest *v4;
  RTPersistenceMirroringRequest *v5;
  BOOL v6;

  v4 = (RTPersistenceMirroringRequest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTPersistenceMirroringRequest isEqualToMirroringRequest:](self, "isEqualToMirroringRequest:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  -[NSCloudKitMirroringRequest affectedStores](self->_request, "affectedStores");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (void)mergeRequest:(id)a3
{
  void *v3;
  void *v4;
  RTPersistenceMirroringRequest *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *completionHandlers;
  void *v17;
  void *v18;
  int64_t requestType;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSDate *enqueueDate;
  void *v27;
  NSDate *v28;
  NSDate *v29;
  RTPersistenceMirroringRequest *v30;

  v6 = (RTPersistenceMirroringRequest *)a3;
  if (v6)
  {
    v30 = v6;
    v7 = -[RTPersistenceMirroringRequest isEqual:](self, "isEqual:", v6);
    v6 = v30;
    if (self != v30 && v7)
    {
      -[NSCloudKitMirroringRequest options](self->_request, "options");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");

      -[RTPersistenceMirroringRequest request](v30, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "options");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "operationConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "allowsCellularAccess");
      if ((v13 & 1) != 0)
      {
        v14 = 1;
      }
      else
      {
        -[NSCloudKitMirroringRequest options](self->_request, "options");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "operationConfiguration");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v4, "allowsCellularAccess");
      }
      objc_msgSend(v9, "operationConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAllowsCellularAccess:", v14);

      if ((v13 & 1) == 0)
      {

      }
      completionHandlers = self->_completionHandlers;
      -[RTPersistenceMirroringRequest completionHandlers](v30, "completionHandlers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](completionHandlers, "addObjectsFromArray:", v17);

      -[RTPersistenceMirroringRequest completionHandlers](v30, "completionHandlers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeAllObjects");

      requestType = self->_requestType;
      -[NSCloudKitMirroringRequest affectedStores](self->_request, "affectedStores");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPersistenceMirroringRequest _createMirroringRequestWithRequestType:affectedStores:options:](self, "_createMirroringRequestWithRequestType:affectedStores:options:", requestType, v20, v9);

      -[RTPersistenceMirroringRequest mirroringPolicy](v30, "mirroringPolicy");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "qualityOfService");
      -[RTPersistenceMirroringRequest mirroringPolicy](self, "mirroringPolicy");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "qualityOfService");

      if (v22 > v24)
      {
        -[RTPersistenceMirroringRequest mirroringPolicy](v30, "mirroringPolicy");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTPersistenceMirroringRequest setMirroringPolicy:](self, "setMirroringPolicy:", v25);

      }
      enqueueDate = self->_enqueueDate;
      -[RTPersistenceMirroringRequest enqueueDate](v30, "enqueueDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate earlierDate:](enqueueDate, "earlierDate:", v27);
      v28 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v29 = self->_enqueueDate;
      self->_enqueueDate = v28;

      v6 = v30;
    }
  }

}

- (void)completeRequestWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__RTPersistenceMirroringRequest_completeRequestWithError___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __58__RTPersistenceMirroringRequest_completeRequestWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_dispatchAllHandlersWithError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_completionHandlers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_completionHandlers, "removeAllObjects", (_QWORD)v10);
}

- (void)_completeRequestWithError:(id)a3
{
  id v4;
  OS_os_transaction *mirroringTransaction;
  RTPowerAssertion *mirroringAssertion;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t sid;
  void *v11;
  double v12;
  uint8_t v13[16];

  v4 = a3;
  mirroringTransaction = self->_mirroringTransaction;
  self->_mirroringTransaction = 0;

  mirroringAssertion = self->_mirroringAssertion;
  self->_mirroringAssertion = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(WeakRetained, "mirroringRequest:didFailWithError:", self, v4) & 1) != 0)
    {
      goto LABEL_11;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "mirroringRequestDidSucceed:", self);
  }
  -[RTPersistenceMirroringRequest _dispatchAllHandlersWithError:](self, "_dispatchAllHandlersWithError:", v4);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  sid = self->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v9, OS_SIGNPOST_INTERVAL_END, sid, "MirroringRequest", (const char *)&unk_1D1F37336, v13, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", self->_startDate);
  self->_duration = v12;

LABEL_11:
}

- (void)executeMirroringRequestWithContext:(id)a3
{
  id v5;
  NSDate *v6;
  NSDate *startDate;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t sid;
  void *v11;
  RTPersistenceMirroringRequest *v12;
  int64_t requestType;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  OS_os_transaction *v19;
  OS_os_transaction *mirroringTransaction;
  NSObject *v21;
  RTPowerAssertion *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  RTPowerAssertion *v27;
  RTPowerAssertion *mirroringAssertion;
  NSObject *v29;
  void *WeakRetained;
  RTPersistenceMirroringRequest *v31;
  NSObject *v32;
  objc_class *v33;
  RTPersistenceMirroringRequest *v34;
  void *v35;
  _QWORD v36[4];
  RTPersistenceMirroringRequest *v37;
  RTPersistenceMirroringRequest *v38;
  uint64_t v39;
  const __CFString *v40;
  uint8_t buf[4];
  RTPersistenceMirroringRequest *v42;
  __int16 v43;
  int64_t v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_attemptCount >= RTPersistenceMirroringRequestRetryCountMax)
  {
    v45 = *MEMORY[0x1E0CB2D50];
    v46[0] = CFSTR("The maximum number of retry attempts for this request have been exceeded.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), 4, WeakRetained);
    v31 = (RTPersistenceMirroringRequest *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
LABEL_18:

      -[RTPersistenceMirroringRequest completeRequestWithError:](self, "completeRequestWithError:", v31);
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138412290;
    v42 = v31;
LABEL_21:
    _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "error executing request, %@", buf, 0xCu);
    goto LABEL_18;
  }
  if (!self->_startDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startDate = self->_startDate;
    self->_startDate = v6;

  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  sid = self->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    -[NSCloudKitMirroringRequest requestIdentifier](self->_request, "requestIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (RTPersistenceMirroringRequest *)objc_claimAutoreleasedReturnValue();
    requestType = self->_requestType;
    *(_DWORD *)buf = 138412546;
    v42 = v12;
    v43 = 2048;
    v44 = requestType;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v9, OS_SIGNPOST_INTERVAL_BEGIN, sid, "MirroringRequest", "id: %@, type:, %ld", buf, 0x16u);

  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@-%@"), v16, v17);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v18, "UTF8String");
  v19 = (OS_os_transaction *)os_transaction_create();
  mirroringTransaction = self->_mirroringTransaction;
  self->_mirroringTransaction = v19;

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (RTPersistenceMirroringRequest *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v34;
    v43 = 2112;
    v44 = (int64_t)v35;
    _os_log_debug_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  v22 = [RTPowerAssertion alloc];
  v23 = (void *)MEMORY[0x1E0CB3940];
  -[NSCloudKitMirroringRequest requestIdentifier](self->_request, "requestIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("MirroringRequest-%@"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[RTPowerAssertion initWithIdentifier:timeout:](v22, "initWithIdentifier:timeout:", v26, 300.0);
  mirroringAssertion = self->_mirroringAssertion;
  self->_mirroringAssertion = v27;

  if (!v5)
  {
    v39 = *MEMORY[0x1E0CB2D50];
    v40 = CFSTR("Request requires managed object context.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), 1, WeakRetained);
    v31 = (RTPersistenceMirroringRequest *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 138412290;
    v42 = v31;
    goto LABEL_21;
  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v42 = self;
    _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "starting mirroring request, %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "mirroringRequestDidBegin:", self);
  ++self->_attemptCount;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __68__RTPersistenceMirroringRequest_executeMirroringRequestWithContext___block_invoke;
  v36[3] = &unk_1E9297540;
  v37 = (RTPersistenceMirroringRequest *)v5;
  v38 = self;
  -[RTPersistenceMirroringRequest performBlockAndWait:](v37, "performBlockAndWait:", v36);
  v31 = v37;
LABEL_19:

}

void __68__RTPersistenceMirroringRequest_executeMirroringRequestWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  v7 = 0;
  v4 = (id)objc_msgSend(v2, "executeRequest:error:", v3, &v7);
  v5 = v7;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "error executing request, %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "completeRequestWithError:", v5);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t attemptCount;
  double duration;
  void *v16;
  RTPersistenceMirroringPolicy *mirroringPolicy;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSCloudKitMirroringRequest affectedStores](self->_request, "affectedStores");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v8), "URL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceMirroringRequest requestTypeToString:](self, "requestTypeToString:", self->_requestType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  attemptCount = self->_attemptCount;
  duration = self->_duration;
  -[NSDate stringFromDate](self->_enqueueDate, "stringFromDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  mirroringPolicy = self->_mirroringPolicy;
  -[NSDate stringFromDate](self->_startDate, "stringFromDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("request id, %@, type, %@, affected stores, %@ attempt count, %lu, duration, %f, enqueue date, %@, mirroring policy, %@, state date, %@, handler count, %lu"), v12, v13, v3, attemptCount, *(_QWORD *)&duration, v16, mirroringPolicy, v18, -[NSMutableArray count](self->_completionHandlers, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)requestTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E9299DF0[a3];
}

- (BOOL)isReady
{
  RTPersistenceMirroringPolicy *mirroringPolicy;

  mirroringPolicy = self->_mirroringPolicy;
  if (mirroringPolicy)
    LOBYTE(mirroringPolicy) = -[RTPersistenceMirroringPolicy mirroringOperationAllowed](mirroringPolicy, "mirroringOperationAllowed");
  return (char)mirroringPolicy;
}

- (NSCloudKitMirroringRequest)request
{
  return self->_request;
}

- (RTPersistenceMirroringRequestDelegate)delegate
{
  return (RTPersistenceMirroringRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)enqueueDate
{
  return self->_enqueueDate;
}

- (void)setEnqueueDate:(id)a3
{
  objc_storeStrong((id *)&self->_enqueueDate, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(unint64_t)a3
{
  self->_attemptCount = a3;
}

- (unint64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setMaxRetryCount:(unint64_t)a3
{
  self->_maxRetryCount = a3;
}

- (RTPersistenceMirroringPolicy)mirroringPolicy
{
  return self->_mirroringPolicy;
}

- (void)setMirroringPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mirroringPolicy, a3);
}

- (OS_os_transaction)mirroringTransaction
{
  return self->_mirroringTransaction;
}

- (void)setMirroringTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_mirroringTransaction, a3);
}

- (RTPowerAssertion)mirroringAssertion
{
  return self->_mirroringAssertion;
}

- (void)setMirroringAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_mirroringAssertion, a3);
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroringAssertion, 0);
  objc_storeStrong((id *)&self->_mirroringTransaction, 0);
  objc_storeStrong((id *)&self->_mirroringPolicy, 0);
  objc_storeStrong((id *)&self->_enqueueDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
