@implementation RTDaemonClient

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *queue;
  id v18;
  id v19;
  objc_class *v20;
  id v21;
  void *v22;
  _QWORD block[4];
  id v24;
  RTDaemonClient *v25;
  id v26;
  _QWORD *v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "retainArguments");
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__9;
  v29[4] = __Block_byref_object_dispose__9;
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@"), v13, v14);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "UTF8String");
  v30 = (id)os_transaction_create();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v21;
    v33 = 2112;
    v34 = v22;
    _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__RTDaemonClient_connection_handleInvocation_isReply___block_invoke;
  block[3] = &unk_1E9297DA8;
  v28 = a5;
  v24 = v10;
  v25 = self;
  v26 = v9;
  v27 = v29;
  v18 = v9;
  v19 = v10;
  dispatch_async(queue, block);

  _Block_object_dispose(v29, 8);
}

- (RTDaemonClientRegistrarVehicleEvent)vehicleEventRegistrar
{
  return self->_vehicleEventRegistrar;
}

void __54__RTDaemonClient_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  const __CFString *v75;
  uint64_t v76;
  const __CFString *v77;
  uint64_t v78;
  void *v79;
  _BYTE buf[12];
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "invoke");
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);

    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      objc_msgSend(*(id *)(a1 + 40), "executableName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "selector"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      v81 = 2112;
      v82 = v9;
      _os_signpost_emit_with_name_impl(&dword_1D1A22000, v7, OS_SIGNPOST_EVENT, v5, "ClientService", "client %@, request %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "executableName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "selector"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      v81 = 2112;
      v82 = v18;
      _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "client, %@, called, %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "target");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "protocol");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "conformsToProtocol:", v13);

    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 48), "exportedInterface");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "replyBlockSignatureForSelector:", objc_msgSend(*(id *)(a1 + 32), "selector"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    v19 = objc_msgSend(*(id *)(a1 + 40), "supported");
    v20 = (void *)_MergedGlobals_93;
    NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "selector"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "containsObject:", v21) & 1) != 0)
      v22 = 1;
    else
      v22 = objc_msgSend(*(id *)(a1 + 40), "enabled");

    v23 = (void *)qword_1ED942930;
    NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "selector"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v25, "count"))
    {
      if (objc_msgSend(v25, "count"))
      {
        objc_msgSend(*(id *)(a1 + 40), "executableName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "containsObject:", v26) & 1) != 0)
        {
          v27 = 1;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "containsObject:", v28);

        }
      }
      else
      {
        v27 = 0;
      }
    }
    else
    {
      v27 = 1;
    }
    v29 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "clientConnection:satisfiesEntitlementRequirementsForInvocation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    if (v16)
    {
      if ((v29 & 1) != 0)
      {
        if ((v19 & 1) != 0)
        {
          if ((v22 & 1) != 0)
          {
            if ((v27 & 1) != 0)
            {
              v30 = objc_msgSend(*(id *)(a1 + 32), "blockArgumentIndex");
              *(_QWORD *)buf = 0;
              objc_msgSend(*(id *)(a1 + 32), "getArgument:atIndex:", buf, v30);
              NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "selector"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = (void *)objc_msgSend(*(id *)buf, "copy");
              objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
              v68 = v31;
              v69 = v10;
              v70 = v32;
              v33 = v32;
              v34 = v31;
              v71 = (id)__NSMakeSpecialForwardingCaptureBlock();
              objc_msgSend(*(id *)(a1 + 32), "setArgument:atIndex:", &v71, v30);
              objc_msgSend(*(id *)(a1 + 32), "invoke");
              v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v36 = *(void **)(v35 + 40);
              *(_QWORD *)(v35 + 40) = 0;

            }
            else
            {
              v72 = *MEMORY[0x1E0CB2D50];
              v56 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(a1 + 40), "executableName");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "stringWithFormat:", CFSTR("This operation is unavailable for %@."), v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = v58;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 2, v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              _rt_log_facility_get_os_log(RTLogFacilityClient);
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "selector"));
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 40), "executableName");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v66;
                v81 = 2112;
                v82 = v67;
                _os_log_error_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_ERROR, "invocation, %@, for client, %@, is unavailable.", buf, 0x16u);

              }
              objc_msgSend(*(id *)(a1 + 48), "rejectInvocation:withError:replyTypes:", *(_QWORD *)(a1 + 32), v60, v16);
              v62 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v63 = *(void **)(v62 + 40);
              *(_QWORD *)(v62 + 40) = 0;

            }
          }
          else
          {
            v74 = *MEMORY[0x1E0CB2D50];
            v75 = CFSTR("This operation is not supported since Significant Locations is not enabled.");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 2, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "rejectInvocation:withError:replyTypes:", *(_QWORD *)(a1 + 32), v53, v16);
            v54 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v55 = *(void **)(v54 + 40);
            *(_QWORD *)(v54 + 40) = 0;

          }
        }
        else
        {
          v76 = *MEMORY[0x1E0CB2D50];
          v77 = CFSTR("This operation is not supported on this platform.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 1, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "rejectInvocation:withError:replyTypes:", *(_QWORD *)(a1 + 32), v49, v16);
          v50 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v51 = *(void **)(v50 + 40);
          *(_QWORD *)(v50 + 40) = 0;

        }
      }
      else
      {
        v78 = *MEMORY[0x1E0CB2D50];
        v39 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 40), "executableName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", CFSTR("%@ is not entitled for this operation."), v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v41;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = (void *)objc_msgSend(v43, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 3, v42);
        _rt_log_facility_get_os_log(RTLogFacilityClient);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 40), "executableName");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "selector"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v64;
          v81 = 2112;
          v82 = v65;
          _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "client, %@, is not entitled for invocation, %@.", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 48), "rejectInvocation:withError:replyTypes:", *(_QWORD *)(a1 + 32), v44, v16);
        v46 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v47 = *(void **)(v46 + 40);
        *(_QWORD *)(v46 + 40) = 0;

      }
    }
    else
    {
      if ((v29 & v19 & v22 & v27) == 1)
        objc_msgSend(*(id *)(a1 + 32), "invoke");
      v37 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v38 = *(void **)(v37 + 40);
      *(_QWORD *)(v37 + 40) = 0;

    }
  }
}

- (NSString)executableName
{
  return self->_executableName;
}

- (BOOL)supported
{
  return self->_supported;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setClientManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_clientManagerDelegate, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (NSString)signingIdentifier
{
  return self->_signingIdentifier;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void)setSigningIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (void)setExecutablePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (void)setExecutableName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void)setBundleIdentifier:(id)a3
{
  BOOL v4;
  void *v5;
  NSString *v6;
  NSString *bundleIdentifier;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = -[NSString isEqualToString:](self->_bundleIdentifier, "isEqualToString:", v11);
  v5 = v11;
  if (!v4)
  {
    v6 = (NSString *)objc_msgSend(v11, "copy");
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v6;

    v8 = self->_bundleIdentifier;
    -[RTDaemonClient restorationData](self, "restorationData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      objc_msgSend(v9, "setObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
    else
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("bundleIdentifier"));

    v5 = v11;
  }

}

- (void)restore
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  RTDaemonClient *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[RTDaemonClient restorationData](self, "restorationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v9 = self;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "restoring client, %@, from existing session", buf, 0xCu);
    }

    -[RTDaemonClient restorationData](self, "restorationData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __25__RTDaemonClient_restore__block_invoke;
    v7[3] = &unk_1E9298370;
    v7[4] = self;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
}

- (NSMutableDictionary)restorationData
{
  return self->_restorationData;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (void)fetchLocationOfInterestAtLocation:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  RTLearnedLocationManager *learnedLocationManager;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v7);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__RTDaemonClient_fetchLocationOfInterestAtLocation_reply___block_invoke;
    v12[3] = &unk_1E9298178;
    v12[4] = self;
    v15 = a2;
    v13 = v7;
    v14 = v8;
    -[RTLearnedLocationManager fetchLocationOfInterestAtLocation:handler:](learnedLocationManager, "fetchLocationOfInterestAtLocation:handler:", v10, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

- (void)fetchLocationsOfInterestOfType:(int64_t)a3 reply:(id)a4
{
  id v7;
  unint64_t v8;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  unint64_t v14;
  uint8_t buf[16];

  v7 = a4;
  if (v7)
  {
    v8 = +[RTLearnedPlace placeTypeFromType:](RTLearnedPlace, "placeTypeFromType:", a3);
    learnedLocationManager = self->_learnedLocationManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__RTDaemonClient_fetchLocationsOfInterestOfType_reply___block_invoke;
    v11[3] = &unk_1E9297E48;
    v11[4] = self;
    v13 = a2;
    v14 = v8;
    v12 = v7;
    -[RTLearnedLocationManager fetchLocationsOfInterestWithPlaceType:handler:](learnedLocationManager, "fetchLocationsOfInterestWithPlaceType:handler:", v8, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __80__RTDaemonClient_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    v12 = v3;
    v13 = 2048;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu locations of interest, to client, %@, error, %@", buf, 0x2Au);

  }
  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__RTDaemonClient_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply___block_invoke_406;
  v10[3] = &__block_descriptor_40_e44_v32__0__RTLearnedLocationOfInterest_8Q16_B24l;
  v10[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0D183C0], "locationsOfInterestFromLearnedLocationsOfInterest:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, *(_QWORD *)(a1 + 48));

}

void __55__RTDaemonClient_fetchLocationsOfInterestOfType_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", *(_QWORD *)(a1 + 72));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v10 = 138413314;
    v11 = v3;
    v12 = 2048;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu locations of interest with type, %@, to client, %@, error, %@", (uint8_t *)&v10, 0x34u);

  }
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0D183C0], "locationsOfInterestFromLearnedLocationsOfInterest:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, *(_QWORD *)(a1 + 48));

}

void __58__RTDaemonClient_fetchLocationOfInterestAtLocation_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "coordinateToString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v10 = 138413314;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, sending location of interest, %@, at location, %@, to client, %@, error, %@", (uint8_t *)&v10, 0x34u);

  }
  v8 = *(_QWORD *)(a1 + 64);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithLearnedLocationOfInterest:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, *(_QWORD *)(a1 + 56));

}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (void)fetchPlaceInferencesWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, NSObject *);
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  void (**v17)(id, _QWORD, NSObject *);
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  RTDaemonClient *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, NSObject *))a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
    goto LABEL_9;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "options is required, %@", buf, 0xCu);
    }

    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D18598];
    v18 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("options is required."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 7, v14);
    v9 = objc_claimAutoreleasedReturnValue();

    v7[2](v7, 0, v9);
LABEL_9:

    goto LABEL_10;
  }
  -[RTDaemonClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__RTDaemonClient_fetchPlaceInferencesWithOptions_reply___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v16 = v6;
  v17 = v7;
  dispatch_async(v8, block);

LABEL_10:
}

void __80__RTDaemonClient_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  __int128 v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__RTDaemonClient_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply___block_invoke_2;
  block[3] = &unk_1E9297910;
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v15 = v8;
  v16 = v6;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = (id)v12;
  v17 = v12;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

void __55__RTDaemonClient_fetchLocationsOfInterestOfType_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__RTDaemonClient_fetchLocationsOfInterestOfType_reply___block_invoke_2;
  block[3] = &unk_1E9297E20;
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v15 = v8;
  v12 = *(_OWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 56);
  v16 = v6;
  v9 = (id)v12;
  v17 = v12;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

void __58__RTDaemonClient_fetchLocationOfInterestAtLocation_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__RTDaemonClient_fetchLocationOfInterestAtLocation_reply___block_invoke_2;
  v12[3] = &unk_1E9298128;
  v18 = *(_QWORD *)(a1 + 56);
  v13 = v5;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v16 = v6;
  v17 = *(id *)(a1 + 48);
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 reply:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  RTLearnedLocationManager *learnedLocationManager;
  _QWORD v21[5];
  id v22;
  SEL v23;
  uint8_t buf[8];
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v9)
    {
      if (v10)
      {
        if (objc_msgSend(v9, "compare:", v10) != 1)
        {
          learnedLocationManager = self->_learnedLocationManager;
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __80__RTDaemonClient_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply___block_invoke;
          v21[3] = &unk_1E9297E70;
          v21[4] = self;
          v23 = a2;
          v22 = v11;
          -[RTLearnedLocationManager fetchLocationsOfInterestVisitedBetweenStartDate:endDate:handler:](learnedLocationManager, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:handler:", v9, v10, v21);

          goto LABEL_12;
        }
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = *MEMORY[0x1E0D18598];
        v25 = *MEMORY[0x1E0CB2D50];
        v26 = CFSTR("endDate must be greater than or equal to startDate");
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = &v26;
        v16 = &v25;
      }
      else
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = *MEMORY[0x1E0D18598];
        v27 = *MEMORY[0x1E0CB2D50];
        v28 = CFSTR("endDate is required");
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = &v28;
        v16 = &v27;
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D18598];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = CFSTR("startDate is required");
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = (const __CFString **)v30;
      v16 = &v29;
    }
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v19);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
LABEL_12:

}

- (void)onAuthorizationNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  RTDaemonClient *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    -[RTDaemonClient setEnabled:](self, "setEnabled:", objc_msgSend(v5, "enabled"));
  }
  else
  {
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTAuthorizationManagerNotificationConsoleUserDidChange, "notificationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (v11)
    {
      v12 = v5;
      _rt_log_facility_get_os_log(RTLogFacilityClient);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[RTDaemonClient targetUserSession](self, "targetUserSession"))
          v15 = CFSTR("YES");
        else
          v15 = CFSTR("NO");
        v20 = 138413058;
        if (objc_msgSend(v12, "activeUser"))
          v16 = CFSTR("YES");
        else
          v16 = CFSTR("NO");
        v21 = v14;
        v22 = 2112;
        v23 = self;
        v24 = 2112;
        v25 = v15;
        v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, client, %@, targetUserSesssion, %@, activeUser, %@", (uint8_t *)&v20, 0x2Au);

      }
      if (-[RTDaemonClient targetUserSession](self, "targetUserSession") && (objc_msgSend(v12, "activeUser") & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityClient);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412546;
          v21 = v18;
          v22 = 2112;
          v23 = self;
          _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, invalidating connection to client, %@", (uint8_t *)&v20, 0x16u);

        }
        -[RTDaemonClient xpcConnection](self, "xpcConnection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "invalidate");

      }
    }
  }

}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

void __56__RTDaemonClient_fetchPlaceInferencesWithOptions_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 304);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__RTDaemonClient_fetchPlaceInferencesWithOptions_reply___block_invoke_2;
  v5[3] = &unk_1E9297F30;
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "fetchPlaceInferencesForOptions:handler:", v6, v5);

}

void __25__RTDaemonClient_restore__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("scenarioTriggerRegistrar")))
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;
    if (v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilityClient);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "error unarchiving scenario trigger registrar, %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "startMonitoringScenarioTriggerOfType:reply:", objc_msgSend(v7, "monitoredScenarioTriggerTypes"), &__block_literal_global_426);
  }
  else
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("vehicleEventRegistrar")))
    {
      objc_msgSend(*(id *)(a1 + 32), "_startMonitoringVehicleEvents");
      goto LABEL_18;
    }
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("peopleDiscoveryRegistrar")))
      goto LABEL_18;
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    if (v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilityClient);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "error unarchiving people discovery registrar, %@", buf, 0xCu);
      }

    }
    objc_msgSend(v7, "clientIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11
      && (v12 = (void *)v11,
          objc_msgSend(v7, "configuration"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v13))
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v7, "clientIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startMonitoringForPeopleDiscovery:configuration:reply:", v15, v16, &__block_literal_global_428);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "stopMonitoringForPeopleDiscoveryWithReply:", &__block_literal_global_432);
    }
  }

LABEL_18:
}

uint64_t __56__RTDaemonClient_fetchPlaceInferencesWithOptions_reply___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 56);
    v9 = 134219010;
    v10 = v3;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "sending %lu placeInferences to client, %@, options, %@, placeInferences[0], %@, error, %@", (uint8_t *)&v9, 0x34u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __56__RTDaemonClient_fetchPlaceInferencesWithOptions_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__RTDaemonClient_fetchPlaceInferencesWithOptions_reply___block_invoke_3;
  block[3] = &unk_1E9297F08;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v15 = v9;
  v16 = v6;
  v17 = *(id *)(a1 + 48);
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

- (RTDaemonClient)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager_);
}

- (RTDaemonClient)initWithQueue:(id)a3 restorationData:(id)a4 accountManager:(id)a5 assetManager:(id)a6 authorizationManager:(id)a7 backgroundInertialOdometryManager:(id)a8 contactsManager:(id)a9 defaultsManager:(id)a10 deviceLocationPredictor:(id)a11 diagnostics:(id)a12 elevationManager:(id)a13 eventAgentManager:(id)a14 eventModelProvider:(id)a15 authorizedLocationManager:(id)a16 fingerprintManager:(id)a17 healthKitManager:(id)a18 hintManager:(id)a19 intermittentGNSSManager:(id)a20 learnedLocationManager:(id)a21 learnedLocationStore:(id)a22 locationManager:(id)a23 locationContextManager:(id)a24 locationStore:(id)a25 mapServiceManager:(id)a26 metricManager:(id)a27 motionActivityManager:(id)a28 peopleDiscoveryProvider:(id)a29 placeInferenceManager:(id)a30 purgeManager:(id)a31 scenarioTriggerManager:(id)a32 timerManager:(id)a33 tripSegmentManager:(id)a34 vehicleLocationProvider:(id)a35 vehicleStore:(id)a36 visitManager:(id)a37 wifiManager:(id)a38
{
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSMutableDictionary *vendedClassesStoreManagerDict;
  RTLocationManager *locationManager;
  RTVisitManager *visitManager;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  objc_class *v71;
  NSMutableDictionary *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  NSMutableDictionary *v76;
  void *v77;
  void *v78;
  objc_class *v79;
  NSString *v80;
  uint64_t v81;
  RTEntitlementProvider *entitlementProvider;
  uint64_t v83;
  NSObject *v84;
  RTDaemonClient *v85;
  NSObject *v86;
  NSObject *v87;
  const char *v88;
  void *v89;
  RTDaemonClient *v90;
  void *v91;
  NSObject *v93;
  const char *v94;
  NSMutableDictionary *restorationData;
  void *v96;
  uint64_t v97;
  RTDaemonClient *v98;
  NSString *restorationIdentifier;
  void *v100;
  uint64_t v101;
  NSString *bundleIdentifier;
  RTDaemonClientRegistrarScenarioTrigger *v103;
  RTDaemonClientRegistrarScenarioTrigger *scenarioTriggerRegistrar;
  RTDaemonClientRegistrarVehicleEvent *v105;
  RTVehicleLocationProvider *vehicleLocationProvider;
  void *v107;
  uint64_t v108;
  RTDaemonClientRegistrarVehicleEvent *vehicleEventRegistrar;
  void *v110;
  NSObject *v111;
  void *v112;
  NSString *v113;
  RTDaemonClientRegistrarPeopleDiscovery *v114;
  RTDaemonClientRegistrarPeopleDiscovery *peopleDiscoveryRegistrar;
  NSObject *v116;
  RTAuthorizationManager *authorizationManager;
  uint64_t v118;
  RTDaemonClient *v119;
  NSObject *v120;
  RTAuthorizationManager *v121;
  void *v122;
  RTAuthorizationManager *v123;
  RTDaemonClient *v124;
  NSObject *v125;
  NSObject *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  char *aSelector;
  char *v140;
  char *v141;
  char *v142;
  char *v143;
  char *v144;
  char *v145;
  char *v146;
  char *v147;
  char *v148;
  char *v149;
  char *v150;
  char *v151;
  char *v152;
  id v153;
  id obja;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  void *v163;
  void *v164;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id i;
  void *v216;
  void *v217;
  RTDaemonClient *v219;
  id v220;
  id v221;
  id v222;
  id v223;
  id v224;
  id v225;
  id v226;
  id v227;
  id v228;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  id v236;
  id v237;
  id v238;
  id v239;
  id v240;
  id v241;
  id v242;
  id v243;
  id v244;
  id v245;
  id v246;
  id v247;
  id v248;
  id v249;
  id v250;
  id v251;
  id v252;
  id v253;
  id v255;
  _QWORD block[4];
  RTDaemonClient *v257;
  _QWORD v258[4];
  RTDaemonClient *v259;
  NSObject *v260;
  _QWORD v261[4];
  RTDaemonClient *v262;
  NSObject *v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  objc_super v272;
  uint8_t buf[4];
  void *v274;
  __int16 v275;
  NSString *v276;
  _BYTE v277[128];
  _QWORD v278[5];
  _BYTE v279[128];
  _QWORD v280[3];
  _QWORD v281[3];
  _QWORD v282[5];
  _QWORD v283[6];
  _QWORD v284[7];
  _QWORD v285[6];
  _QWORD v286[5];
  _QWORD v287[9];
  _QWORD v288[8];
  _QWORD v289[8];
  _QWORD v290[6];
  _QWORD v291[8];
  _QWORD v292[9];
  _QWORD v293[6];
  _QWORD v294[6];
  _QWORD v295[9];
  _QWORD v296[9];
  _QWORD v297[9];
  _QWORD v298[4];
  _QWORD v299[11];
  _QWORD v300[3];
  _QWORD v301[2];
  _QWORD v302[2];
  _QWORD v303[3];
  _QWORD v304[3];
  _QWORD v305[3];
  _QWORD v306[27];
  _QWORD v307[30];

  v307[27] = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v221 = a4;
  v156 = a5;
  v42 = a5;
  v237 = a6;
  v255 = a7;
  v253 = a8;
  v252 = a9;
  v251 = a10;
  v250 = a11;
  v249 = a12;
  v248 = a13;
  v247 = a14;
  v246 = a15;
  v245 = a16;
  v244 = a17;
  v243 = a18;
  v242 = a19;
  v241 = a20;
  v240 = a21;
  v239 = a22;
  v238 = a23;
  v236 = a24;
  v220 = a25;
  v235 = a26;
  v234 = a27;
  v233 = a28;
  v232 = a29;
  v231 = a30;
  v230 = a31;
  v229 = a32;
  v228 = a33;
  v225 = a34;
  v227 = a35;
  v224 = a36;
  v226 = a37;
  v223 = a38;
  v222 = v41;
  if (!v41)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v84, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v85 = 0;
    goto LABEL_62;
  }
  v162 = v42;
  if (!v42)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v86, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: accountManager", buf, 2u);
    }

    v85 = 0;
    v42 = 0;
LABEL_62:
    v43 = v237;
LABEL_99:
    v89 = v220;
    v90 = self;
    v91 = v221;
    goto LABEL_100;
  }
  v43 = v237;
  if (!v237)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: assetManager";
LABEL_97:
    _os_log_error_impl(&dword_1D1A22000, v87, OS_LOG_TYPE_ERROR, v88, buf, 2u);
    goto LABEL_98;
  }
  if (!v255)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: authorizationManager";
    goto LABEL_97;
  }
  if (!v253)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: backgroundInertialOdometryManager";
    goto LABEL_97;
  }
  if (!v252)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: contactsManager";
    goto LABEL_97;
  }
  if (!v251)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_97;
  }
  if (!v250)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: deviceLocationPredictor";
    goto LABEL_97;
  }
  if (!v249)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: diagnostics";
    goto LABEL_97;
  }
  if (!v248)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: elevationManager";
    goto LABEL_97;
  }
  if (!v247)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: eventAgentManager";
    goto LABEL_97;
  }
  if (!v246)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: eventModelProvider";
    goto LABEL_97;
  }
  if (!v245)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: authorizedLocationManager";
    goto LABEL_97;
  }
  if (!v244)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: fingerprintManager";
    goto LABEL_97;
  }
  if (!v243)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: healthKitManager";
    goto LABEL_97;
  }
  if (!v242)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: hintManager";
    goto LABEL_97;
  }
  if (!v241)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: intermittentGNSSManager";
    goto LABEL_97;
  }
  if (!v240)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_98;
    *(_WORD *)buf = 0;
    v88 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_97;
  }
  if (!v239)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v88 = "Invalid parameter not satisfying: learnedLocationStore";
      goto LABEL_97;
    }
LABEL_98:

    v85 = 0;
    goto LABEL_99;
  }
  if (!v238)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v93, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager", buf, 2u);
    }
    goto LABEL_133;
  }
  if (!v236)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: locationContextManager";
LABEL_132:
    _os_log_error_impl(&dword_1D1A22000, v93, OS_LOG_TYPE_ERROR, v94, buf, 2u);
    goto LABEL_133;
  }
  if (!v235)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_132;
  }
  if (!v234)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: metricManager";
    goto LABEL_132;
  }
  if (!v233)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_132;
  }
  if (!v232)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: peopleDiscoveryProvider";
    goto LABEL_132;
  }
  if (!v231)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: placeInferenceManager";
    goto LABEL_132;
  }
  if (!v230)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: purgeManager";
    goto LABEL_132;
  }
  if (!v229)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: scenarioTriggerManager";
    goto LABEL_132;
  }
  if (!v228)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_132;
  }
  if (!v227)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: vehicleLocationProvider";
    goto LABEL_132;
  }
  if (!v226)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: visitManager";
    goto LABEL_132;
  }
  if (!v225)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: tripSegmentManager";
    goto LABEL_132;
  }
  if (!v224)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    *(_WORD *)buf = 0;
    v94 = "Invalid parameter not satisfying: vehicleStore";
    goto LABEL_132;
  }
  if (!v223)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v94 = "Invalid parameter not satisfying: wifiManager";
      goto LABEL_132;
    }
LABEL_133:

    v85 = 0;
    v91 = v221;
    v43 = v237;
    v89 = v220;
    v90 = self;
    goto LABEL_100;
  }
  v272.receiver = self;
  v272.super_class = (Class)RTDaemonClient;
  v219 = -[RTDaemonClient init](&v272, sel_init);
  if (v219)
  {
    objc_storeStrong((id *)&v219->_queue, a3);
    objc_storeStrong((id *)&v219->_accountManager, v156);
    objc_storeStrong((id *)&v219->_assetManager, a6);
    objc_storeStrong((id *)&v219->_authorizationManager, a7);
    objc_storeStrong((id *)&v219->_backgroundInertialOdometryManager, a8);
    objc_storeStrong((id *)&v219->_contactsManager, a9);
    objc_storeStrong((id *)&v219->_defaultsManager, a10);
    objc_storeStrong((id *)&v219->_deviceLocationPredictor, a11);
    objc_storeStrong((id *)&v219->_diagnostics, a12);
    objc_storeStrong((id *)&v219->_elevationManager, a13);
    objc_storeStrong((id *)&v219->_eventAgentManager, a14);
    objc_storeStrong((id *)&v219->_eventModelProvider, a15);
    objc_storeStrong((id *)&v219->_authorizedLocationManager, a16);
    objc_storeStrong((id *)&v219->_fingerprintManager, a17);
    objc_storeStrong((id *)&v219->_healthKitManager, a18);
    objc_storeStrong((id *)&v219->_hintManager, a19);
    objc_storeStrong((id *)&v219->_intermittentGNSSManager, a20);
    objc_storeStrong((id *)&v219->_learnedLocationManager, a21);
    objc_storeStrong((id *)&v219->_learnedLocationStore, a22);
    objc_storeStrong((id *)&v219->_locationManager, a23);
    objc_storeStrong((id *)&v219->_locationContextManager, a24);
    objc_storeStrong((id *)&v219->_locationStore, a25);
    objc_storeStrong((id *)&v219->_mapServiceManager, a26);
    objc_storeStrong((id *)&v219->_metricManager, a27);
    objc_storeStrong((id *)&v219->_motionActivityManager, a28);
    objc_storeStrong((id *)&v219->_peopleDiscoveryProvider, a29);
    objc_storeStrong((id *)&v219->_placeInferenceManager, a30);
    objc_storeStrong((id *)&v219->_purgeManager, a31);
    objc_storeStrong((id *)&v219->_scenarioTriggerManager, a32);
    objc_storeStrong((id *)&v219->_timerManager, a33);
    objc_storeStrong((id *)&v219->_vehicleLocationProvider, a35);
    objc_storeStrong((id *)&v219->_vehicleStore, a36);
    objc_storeStrong((id *)&v219->_visitManager, a37);
    objc_storeStrong((id *)&v219->_tripSegmentManager, a34);
    objc_storeStrong((id *)&v219->_wifiManager, a38);
    v137 = (void *)MEMORY[0x1E0C99E60];
    NSStringFromSelector(sel_startMonitoringVisitsWithReply_);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_stopMonitoringVisitsWithReply_);
    v213 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_startLeechingVisitsWithReply_);
    v210 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_stopLeechingVisitsWithReply_);
    v207 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_startLeechingLowConfidenceVisitsWithReply_);
    v204 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_stopLeechingLowConfidenceVisitsWithReply_);
    v202 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_startMonitoringPlaceInferencesWithOptions_reply_);
    v200 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_stopMonitoringPlaceInferencesWithReply_);
    v198 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchStoredVisitsWithOptions_reply_);
    v194 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchTripSegmentsWithOptions_reply_);
    v196 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchLocationsCountForTripSegmentWithOptions_reply_);
    v186 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchLocationsForTripSegmentWithOptions_reply_);
    v192 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_deleteTripSegmentWithUUID_reply_);
    v182 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchVehiclesWithOptions_reply_);
    v190 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchTripSegmentMetadataWithOptions_reply_);
    v188 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_startMonitoringScenarioTriggerOfType_reply_);
    v184 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_stopMonitoringScenarioTriggerOfType_reply_);
    v176 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchMonitoredScenarioTriggerTypesWithReply_);
    v180 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_startMonitoringVehicleEventsWithReply_);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_stopMonitoringVehicleEventsWithReply_);
    v178 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_setRoutineEnabled_reply_);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchRoutineEnabledWithReply_);
    v174 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_clearRoutineWithReply_);
    v172 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_setRestorationIdentifier_);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_setTargetUserSession_);
    v170 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchCloudSyncAuthorizationStateWithReply_);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_updateCloudSyncProvisionedForAccount_reply_);
    v168 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchAllLocationsOfInterestForSettingsWithReply_);
    v166 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_addElevations_handler_);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchElevationsWithOptions_reply_);
    v160 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchBackgroundInertialOdometrySamplesWithOptions_reply_);
    v158 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_addBackgroundInertialOdometrySamples_reply_);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_startMonitoringForPeopleDiscovery_configuration_reply_);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_stopMonitoringForPeopleDiscoveryWithReply_);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchProximityHistoryFromStartDate_endDate_completionHandler_);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchProximityHistoryFromEventIDs_completionHandler_);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchPeopleCountEventsHistory_completionHandler_);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler_);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchOngoingPeopleDensity_);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchContactScoresFromContactIDs_completionHandler_);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchAuthorizedLocationStatus_);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "setWithObjects:", v216, v213, v210, v207, v204, v202, v200, v198, v194, v196, v186, v192, v182, v190, v188, v184, v176,
      v180,
      v136,
      v178,
      v135,
      v174,
      v172,
      v133,
      v170,
      v132,
      v168,
      v166,
      v163,
      v160,
      v158,
      v130,
      v129,
      v44,
      v45,
      v128,
      v46,
      v127,
      v47,
      v48,
      v49,
      0);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)_MergedGlobals_93;
    _MergedGlobals_93 = v50;

    v203 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("locationd"), CFSTR("loctool"), CFSTR("RTDiagnosticExtension"), CFSTR("xctest"), CFSTR("wedge"), CFSTR("coreautomationd"), CFSTR("Routine"), CFSTR("routinetool"), CFSTR("RoutineAssistant"), CFSTR("safetyalertsd"), CFSTR("momentsd"), 0);
    NSStringFromSelector(sel_fetchFormattedPostalAddressesFromMeCard_);
    v214 = (id)objc_claimAutoreleasedReturnValue();
    v306[0] = v214;
    v305[0] = CFSTR("locationd");
    v305[1] = CFSTR("wedge");
    v305[2] = CFSTR("xctest");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v305, 3);
    v211 = (id)objc_claimAutoreleasedReturnValue();
    v307[0] = v211;
    NSStringFromSelector(sel_fetchPlaceInferencesWithOptions_reply_);
    v208 = (id)objc_claimAutoreleasedReturnValue();
    v306[1] = v208;
    v304[0] = CFSTR("locationd");
    v304[1] = CFSTR("wedge");
    v304[2] = CFSTR("coreautomationd");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v304, 3);
    v205 = (id)objc_claimAutoreleasedReturnValue();
    v307[1] = v205;
    NSStringFromSelector(sel_startMonitoringVisitsWithReply_);
    v201 = (id)objc_claimAutoreleasedReturnValue();
    v306[2] = v201;
    v303[0] = CFSTR("locationd");
    v303[1] = CFSTR("wedge");
    v303[2] = CFSTR("xctest");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v303, 3);
    v199 = (id)objc_claimAutoreleasedReturnValue();
    v307[2] = v199;
    NSStringFromSelector(sel_startLeechingVisitsWithReply_);
    v197 = (id)objc_claimAutoreleasedReturnValue();
    v306[3] = v197;
    v302[0] = CFSTR("locationd");
    v302[1] = CFSTR("wedge");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v302, 2);
    v195 = (id)objc_claimAutoreleasedReturnValue();
    v307[3] = v195;
    NSStringFromSelector(sel_startLeechingLowConfidenceVisitsWithReply_);
    v193 = (id)objc_claimAutoreleasedReturnValue();
    v306[4] = v193;
    v301[0] = CFSTR("locationd");
    v301[1] = CFSTR("wedge");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v301, 2);
    v191 = (id)objc_claimAutoreleasedReturnValue();
    v307[4] = v191;
    NSStringFromSelector(sel_startMonitoringPlaceInferencesWithOptions_reply_);
    v189 = (id)objc_claimAutoreleasedReturnValue();
    v306[5] = v189;
    v300[0] = CFSTR("locationd");
    v300[1] = CFSTR("wedge");
    v300[2] = CFSTR("xctest");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v300, 3);
    v187 = (id)objc_claimAutoreleasedReturnValue();
    v307[5] = v187;
    NSStringFromSelector(sel_fetchStoredVisitsWithOptions_reply_);
    v185 = (id)objc_claimAutoreleasedReturnValue();
    v306[6] = v185;
    v299[0] = CFSTR("locationd");
    v299[1] = CFSTR("wedge");
    v299[2] = CFSTR("loctool");
    v299[3] = CFSTR("xctest");
    v299[4] = CFSTR("coreautomationd");
    v299[5] = CFSTR("Routine");
    v299[6] = CFSTR("momentsd");
    v299[7] = CFSTR("intelligenceplatformd");
    v299[8] = CFSTR("knowledgeconstructiond");
    v299[9] = CFSTR("destinationd");
    v299[10] = CFSTR("com.apple.Maps");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v299, 11);
    v183 = (id)objc_claimAutoreleasedReturnValue();
    v307[6] = v183;
    NSStringFromSelector(sel_processHindsightVisitsWithReply_);
    v181 = (id)objc_claimAutoreleasedReturnValue();
    v306[7] = v181;
    v298[0] = CFSTR("wedge");
    v298[1] = CFSTR("xctest");
    v298[2] = CFSTR("Routine");
    v298[3] = CFSTR("momentsd");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v298, 4);
    v179 = (id)objc_claimAutoreleasedReturnValue();
    v307[7] = v179;
    NSStringFromSelector(sel_fetchTripSegmentsWithOptions_reply_);
    v177 = (id)objc_claimAutoreleasedReturnValue();
    v306[8] = v177;
    v297[0] = CFSTR("locationd");
    v297[1] = CFSTR("wedge");
    v297[2] = CFSTR("xctest");
    v297[3] = CFSTR("Routine");
    v297[4] = CFSTR("routinetool");
    v297[5] = CFSTR("RoutineAssistant");
    v297[6] = CFSTR("com.apple.momentsd");
    v297[7] = CFSTR("com.apple.MomentsUIService");
    v297[8] = CFSTR("com.apple.appsspecialprojects.PromptValidator");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v297, 9);
    v175 = (id)objc_claimAutoreleasedReturnValue();
    v307[8] = v175;
    NSStringFromSelector(sel_fetchLocationsCountForTripSegmentWithOptions_reply_);
    v173 = (id)objc_claimAutoreleasedReturnValue();
    v306[9] = v173;
    v296[0] = CFSTR("locationd");
    v296[1] = CFSTR("wedge");
    v296[2] = CFSTR("xctest");
    v296[3] = CFSTR("Routine");
    v296[4] = CFSTR("routinetool");
    v296[5] = CFSTR("RoutineAssistant");
    v296[6] = CFSTR("com.apple.momentsd");
    v296[7] = CFSTR("com.apple.MomentsUIService");
    v296[8] = CFSTR("com.apple.appsspecialprojects.PromptValidator");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v296, 9);
    v171 = (id)objc_claimAutoreleasedReturnValue();
    v307[9] = v171;
    NSStringFromSelector(sel_fetchLocationsForTripSegmentWithOptions_reply_);
    v169 = (id)objc_claimAutoreleasedReturnValue();
    v306[10] = v169;
    v295[0] = CFSTR("locationd");
    v295[1] = CFSTR("wedge");
    v295[2] = CFSTR("xctest");
    v295[3] = CFSTR("Routine");
    v295[4] = CFSTR("routinetool");
    v295[5] = CFSTR("RoutineAssistant");
    v295[6] = CFSTR("com.apple.momentsd");
    v295[7] = CFSTR("com.apple.MomentsUIService");
    v295[8] = CFSTR("com.apple.appsspecialprojects.PromptValidator");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v295, 9);
    v167 = (id)objc_claimAutoreleasedReturnValue();
    v307[10] = v167;
    NSStringFromSelector(sel_deleteTripSegmentWithUUID_reply_);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v306[11] = v164;
    v294[0] = CFSTR("locationd");
    v294[1] = CFSTR("wedge");
    v294[2] = CFSTR("xctest");
    v294[3] = CFSTR("Routine");
    v294[4] = CFSTR("routinetool");
    v294[5] = CFSTR("RoutineAssistant");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v294, 6);
    v161 = (id)objc_claimAutoreleasedReturnValue();
    v307[11] = v161;
    NSStringFromSelector(sel_fetchVehiclesWithOptions_reply_);
    v159 = (id)objc_claimAutoreleasedReturnValue();
    v306[12] = v159;
    v293[0] = CFSTR("locationd");
    v293[1] = CFSTR("wedge");
    v293[2] = CFSTR("xctest");
    v293[3] = CFSTR("Routine");
    v293[4] = CFSTR("routinetool");
    v293[5] = CFSTR("RoutineAssistant");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v293, 6);
    v149 = (char *)objc_claimAutoreleasedReturnValue();
    v307[12] = v149;
    NSStringFromSelector(sel_fetchTripSegmentMetadataWithOptions_reply_);
    v150 = (char *)objc_claimAutoreleasedReturnValue();
    v306[13] = v150;
    v292[0] = CFSTR("locationd");
    v292[1] = CFSTR("wedge");
    v292[2] = CFSTR("xctest");
    v292[3] = CFSTR("Routine");
    v292[4] = CFSTR("routinetool");
    v292[5] = CFSTR("RoutineAssistant");
    v292[6] = CFSTR("com.apple.momentsd");
    v292[7] = CFSTR("com.apple.MomentsUIService");
    v292[8] = CFSTR("com.apple.appsspecialprojects.PromptValidator");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v292, 9);
    v148 = (char *)objc_claimAutoreleasedReturnValue();
    v307[13] = v148;
    NSStringFromSelector(sel_fetchAllLocationsOfInterestForSettingsWithReply_);
    v147 = (char *)objc_claimAutoreleasedReturnValue();
    v306[14] = v147;
    v291[0] = CFSTR("com.apple.Preferences");
    v291[1] = CFSTR("SecurityPrivacyExtension");
    v291[2] = CFSTR("com.apple.NanoSettings");
    v291[3] = CFSTR("xctest");
    v291[4] = CFSTR("wedge");
    v291[5] = CFSTR("coreautomationd");
    v291[6] = CFSTR("RTDiagnosticExtension");
    v291[7] = CFSTR("induce");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v291, 8);
    v146 = (char *)objc_claimAutoreleasedReturnValue();
    v307[14] = v146;
    NSStringFromSelector(sel_setRoutineEnabled_reply_);
    v151 = (char *)objc_claimAutoreleasedReturnValue();
    v306[15] = v151;
    v290[0] = CFSTR("com.apple.Preferences");
    v290[1] = CFSTR("SecurityPrivacyExtension");
    v290[2] = CFSTR("com.apple.NanoSettings");
    v290[3] = CFSTR("xctest");
    v290[4] = CFSTR("wedge");
    v290[5] = CFSTR("coreautomationd");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v290, 6);
    v145 = (char *)objc_claimAutoreleasedReturnValue();
    v307[15] = v145;
    NSStringFromSelector(sel_clearRoutineWithReply_);
    v152 = (char *)objc_claimAutoreleasedReturnValue();
    v306[16] = v152;
    v289[0] = CFSTR("com.apple.Preferences");
    v289[1] = CFSTR("SecurityPrivacyExtension");
    v289[2] = CFSTR("com.apple.NanoSettings");
    v289[3] = CFSTR("xctest");
    v289[4] = CFSTR("wedge");
    v289[5] = CFSTR("coreautomationd");
    v289[6] = CFSTR("RTDiagnosticExtension");
    v289[7] = CFSTR("induce");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v289, 8);
    v144 = (char *)objc_claimAutoreleasedReturnValue();
    v307[16] = v144;
    NSStringFromSelector(sel_fetchPathToDiagnosticFilesWithOptions_reply_);
    v143 = (char *)objc_claimAutoreleasedReturnValue();
    v306[17] = v143;
    v288[0] = CFSTR("com.apple.Preferences");
    v288[1] = CFSTR("SecurityPrivacyExtension");
    v288[2] = CFSTR("com.apple.NanoSettings");
    v288[3] = CFSTR("xctest");
    v288[4] = CFSTR("wedge");
    v288[5] = CFSTR("coreautomationd");
    v288[6] = CFSTR("RTDiagnosticExtension");
    v288[7] = CFSTR("induce");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v288, 8);
    v142 = (char *)objc_claimAutoreleasedReturnValue();
    v307[17] = v142;
    NSStringFromSelector(sel_fetchCloudSyncAuthorizationStateWithReply_);
    v153 = (id)objc_claimAutoreleasedReturnValue();
    v306[18] = v153;
    v287[0] = CFSTR("com.apple.Preferences");
    v287[1] = CFSTR("SecurityPrivacyExtension");
    v287[2] = CFSTR("com.apple.NanoSettings");
    v287[3] = CFSTR("accountsd");
    v287[4] = CFSTR("xctest");
    v287[5] = CFSTR("wedge");
    v287[6] = CFSTR("coreautomationd");
    v287[7] = CFSTR("RTDiagnosticExtension");
    v287[8] = CFSTR("Routine");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v287, 9);
    v141 = (char *)objc_claimAutoreleasedReturnValue();
    v307[18] = v141;
    NSStringFromSelector(sel_updateCloudSyncProvisionedForAccount_reply_);
    obja = (id)objc_claimAutoreleasedReturnValue();
    v306[19] = obja;
    v286[0] = CFSTR("accountsd");
    v286[1] = CFSTR("xctest");
    v286[2] = CFSTR("wedge");
    v286[3] = CFSTR("coreautomationd");
    v286[4] = CFSTR("Routine");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v286, 5);
    v140 = (char *)objc_claimAutoreleasedReturnValue();
    v307[19] = v140;
    NSStringFromSelector(sel_fetchEnumerableObjectsWithOptions_offset_reply_);
    aSelector = (char *)objc_claimAutoreleasedReturnValue();
    v306[20] = aSelector;
    v285[0] = CFSTR("locationd");
    v285[1] = CFSTR("RTDiagnosticExtension");
    v285[2] = CFSTR("xctest");
    v285[3] = CFSTR("wedge");
    v285[4] = CFSTR("coreautomationd");
    v285[5] = CFSTR("Routine");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v285, 6);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v307[20] = v134;
    NSStringFromSelector(sel_fetchEstimatedLocationAtDate_options_reply_);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v306[21] = v131;
    v284[0] = CFSTR("locationd");
    v284[1] = CFSTR("loctool");
    v284[2] = CFSTR("RTDiagnosticExtension");
    v284[3] = CFSTR("xctest");
    v284[4] = CFSTR("wedge");
    v284[5] = CFSTR("coreautomationd");
    v284[6] = CFSTR("Routine");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v284, 7);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v307[21] = v138;
    NSStringFromSelector(sel_fetchElevationsWithOptions_reply_);
    v157 = (id)objc_claimAutoreleasedReturnValue();
    v306[22] = v157;
    v283[0] = CFSTR("locationd");
    v283[1] = CFSTR("wedge");
    v283[2] = CFSTR("xctest");
    v283[3] = CFSTR("Routine");
    v283[4] = CFSTR("routinetool");
    v283[5] = CFSTR("RoutineAssistant");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v283, 6);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    v307[22] = v217;
    NSStringFromSelector(sel_fetchAuthorizedLocationStatus_);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v306[23] = v52;
    v282[0] = CFSTR("wedge");
    v282[1] = CFSTR("xctest");
    v282[2] = CFSTR("Routine");
    v282[3] = CFSTR("coreauthd");
    v282[4] = CFSTR("com.apple.coreauthd");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v282, 5);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v307[23] = v53;
    NSStringFromSelector(sel_fetchBackgroundInertialOdometrySamplesWithOptions_reply_);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v306[24] = v54;
    v281[0] = CFSTR("locationd");
    v281[1] = CFSTR("wedge");
    v281[2] = CFSTR("xctest");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v281, 3);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v307[24] = v55;
    NSStringFromSelector(sel_addBackgroundInertialOdometrySamples_reply_);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v306[25] = v56;
    v280[0] = CFSTR("locationd");
    v280[1] = CFSTR("wedge");
    v280[2] = CFSTR("xctest");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v280, 3);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v307[25] = v57;
    NSStringFromSelector(sel_fetchStoredLocationsWithContext_reply_);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v306[26] = v58;
    v307[26] = v203;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v307, v306, 27);
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)qword_1ED942930;
    qword_1ED942930 = v59;

    v61 = objc_opt_new();
    vendedClassesStoreManagerDict = v219->_vendedClassesStoreManagerDict;
    v219->_vendedClassesStoreManagerDict = (NSMutableDictionary *)v61;

    v270 = 0u;
    v271 = 0u;
    v268 = 0u;
    v269 = 0u;
    locationManager = v219->_locationManager;
    v278[0] = v219->_learnedLocationManager;
    v278[1] = locationManager;
    visitManager = v219->_visitManager;
    v278[2] = v219->_fingerprintManager;
    v278[3] = visitManager;
    v278[4] = v219->_hintManager;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v278, 5);
    v206 = (id)objc_claimAutoreleasedReturnValue();
    v212 = (id)objc_msgSend(v206, "countByEnumeratingWithState:objects:count:", &v268, v279, 16);
    if (v212)
    {
      v209 = *(id *)v269;
      do
      {
        for (i = 0; i != v212; i = (char *)i + 1)
        {
          if (*(id *)v269 != v209)
            objc_enumerationMutation(v206);
          v65 = *(_QWORD *)(*((_QWORD *)&v268 + 1) + 8 * (_QWORD)i);
          v264 = 0u;
          v265 = 0u;
          v266 = 0u;
          v267 = 0u;
          objc_msgSend((id)objc_opt_class(), "vendedClasses");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v264, v277, 16);
          if (v67)
          {
            v68 = v67;
            v69 = *(_QWORD *)v265;
            do
            {
              for (j = 0; j != v68; ++j)
              {
                if (*(_QWORD *)v265 != v69)
                  objc_enumerationMutation(v66);
                v71 = *(objc_class **)(*((_QWORD *)&v264 + 1) + 8 * j);
                v72 = v219->_vendedClassesStoreManagerDict;
                NSStringFromClass(v71);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKey:](v72, "objectForKey:", v73);
                v74 = (void *)objc_claimAutoreleasedReturnValue();

                if (v74)
                {
                  _rt_log_facility_get_os_log(RTLogFacilityClient);
                  v75 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
                  {
                    NSStringFromClass(v71);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    v79 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v79);
                    v80 = (NSString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v274 = v78;
                    v275 = 2112;
                    v276 = v80;
                    _os_log_fault_impl(&dword_1D1A22000, v75, OS_LOG_TYPE_FAULT, "duplicate vended class, %@, from manager class, %@", buf, 0x16u);

                  }
                }
                v76 = v219->_vendedClassesStoreManagerDict;
                NSStringFromClass(v71);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKey:](v76, "setObject:forKey:", v65, v77);

              }
              v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v264, v277, 16);
            }
            while (v68);
          }

        }
        v212 = (id)objc_msgSend(v206, "countByEnumeratingWithState:objects:count:", &v268, v279, 16);
      }
      while (v212);
    }

    +[RTEntitlementProvider daemonProtocolEntitlementProvider](RTEntitlementProvider, "daemonProtocolEntitlementProvider");
    v81 = objc_claimAutoreleasedReturnValue();
    entitlementProvider = v219->_entitlementProvider;
    v219->_entitlementProvider = (RTEntitlementProvider *)v81;

    if (v221)
      v83 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", v221, 1);
    else
      v83 = objc_opt_new();
    restorationData = v219->_restorationData;
    v219->_restorationData = (NSMutableDictionary *)v83;

    objc_msgSend(v221, "objectForKey:", CFSTR("restorationIdentifier"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "copy");
    v98 = v219;
    restorationIdentifier = v219->_restorationIdentifier;
    v219->_restorationIdentifier = (NSString *)v97;

    objc_msgSend(v221, "objectForKey:", CFSTR("bundleIdentifier"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v100, "copy");
    bundleIdentifier = v219->_bundleIdentifier;
    v219->_bundleIdentifier = (NSString *)v101;

    v103 = -[RTDaemonClientRegistrarScenarioTrigger initWithScenarioTriggerManager:queue:]([RTDaemonClientRegistrarScenarioTrigger alloc], "initWithScenarioTriggerManager:queue:", v98->_scenarioTriggerManager, v98->_queue);
    scenarioTriggerRegistrar = v219->_scenarioTriggerRegistrar;
    v219->_scenarioTriggerRegistrar = v103;

    -[RTDaemonClientRegistrarScenarioTrigger setDelegate:](v98->_scenarioTriggerRegistrar, "setDelegate:", v98);
    v105 = [RTDaemonClientRegistrarVehicleEvent alloc];
    vehicleLocationProvider = v219->_vehicleLocationProvider;
    -[RTDaemonClient queue](v219, "queue");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = -[RTDaemonClientRegistrarVehicleEvent initWithVehicleLocationProvider:queue:](v105, "initWithVehicleLocationProvider:queue:", vehicleLocationProvider, v107);
    vehicleEventRegistrar = v219->_vehicleEventRegistrar;
    v219->_vehicleEventRegistrar = (RTDaemonClientRegistrarVehicleEvent *)v108;

    -[RTDaemonClient vehicleEventRegistrar](v219, "vehicleEventRegistrar");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setDelegate:", v219);

    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      -[RTDaemonClient executableName](v219, "executableName");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v219->_restorationIdentifier;
      *(_DWORD *)buf = 138412546;
      v274 = v112;
      v275 = 2112;
      v276 = v113;
      _os_log_impl(&dword_1D1A22000, v111, OS_LOG_TYPE_DEFAULT, "client, %@, _restorationIdentifier, %@", buf, 0x16u);

    }
    v114 = -[RTDaemonClientRegistrarPeopleDiscovery initWithPeopleDiscoveryProvider:queue:]([RTDaemonClientRegistrarPeopleDiscovery alloc], "initWithPeopleDiscoveryProvider:queue:", v219->_peopleDiscoveryProvider, v219->_queue);
    peopleDiscoveryRegistrar = v219->_peopleDiscoveryRegistrar;
    v219->_peopleDiscoveryRegistrar = v114;

    -[RTDaemonClientRegistrarPeopleDiscovery setDelegate:](v219->_peopleDiscoveryRegistrar, "setDelegate:", v219);
    v116 = dispatch_group_create();
    dispatch_group_enter(v116);
    authorizationManager = v219->_authorizationManager;
    v118 = MEMORY[0x1E0C809B0];
    v261[0] = MEMORY[0x1E0C809B0];
    v261[1] = 3221225472;
    v261[2] = __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke;
    v261[3] = &unk_1E9297D58;
    v119 = v219;
    v262 = v119;
    v120 = v116;
    v263 = v120;
    -[RTAuthorizationManager fetchRoutineSupportedWithHandler:](authorizationManager, "fetchRoutineSupportedWithHandler:", v261);
    v121 = v219->_authorizationManager;
    +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier addObserver:selector:name:](v121, "addObserver:selector:name:", v119, sel_onAuthorizationNotification_, v122);

    dispatch_group_enter(v120);
    v123 = v219->_authorizationManager;
    v258[0] = v118;
    v258[1] = 3221225472;
    v258[2] = __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_3;
    v258[3] = &unk_1E9297D58;
    v124 = v119;
    v259 = v124;
    v260 = v120;
    v125 = v120;
    -[RTAuthorizationManager fetchRoutineEnabledWithHandler:](v123, "fetchRoutineEnabledWithHandler:", v258);
    -[RTDaemonClient queue](v124, "queue");
    v126 = objc_claimAutoreleasedReturnValue();
    block[0] = v118;
    block[1] = 3221225472;
    block[2] = __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_5;
    block[3] = &unk_1E92977B8;
    v257 = v124;
    dispatch_group_notify(v125, v126, block);

  }
  v90 = v219;
  v85 = v90;
  v41 = v222;
  v91 = v221;
  v42 = v162;
  v43 = v237;
  v89 = v220;
LABEL_100:

  return v85;
}

void __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_2;
  block[3] = &unk_1E9297D30;
  v6 = *(id *)(a1 + 32);
  v8 = a2;
  v7 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

void __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSupported:", *(unsigned __int8 *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_3(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_4;
  block[3] = &unk_1E9297D30;
  v6 = *(id *)(a1 + 32);
  v8 = a2;
  v7 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

void __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", *(unsigned __int8 *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __678__RTDaemonClient_initWithQueue_restorationData_accountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "restore");
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTDaemonClient executablePath](self, "executablePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTDaemonClient processIdentifier](self, "processIdentifier");
  -[RTDaemonClient restorationIdentifier](self, "restorationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[RTDaemonClient restorationIdentifier](self, "restorationIdentifier");
  else
    -[RTDaemonClient signingIdentifier](self, "signingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%d), %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

void __54__RTDaemonClient_connection_handleInvocation_isReply___block_invoke_353(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", a1[5]);
    v8 = 138412546;
    v9 = v5;
    v10 = 2048;
    v11 = v7;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Sending reply for request \"%@\", latency, %.2f", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(v3, "setTarget:", a1[6]);
  objc_msgSend(v3, "invoke");

}

- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 reply:(id)a5
{
  id v9;
  id v10;
  RTLearnedLocationManager *learnedLocationManager;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  SEL v17;
  double v18;
  uint8_t buf[16];

  v9 = a4;
  v10 = a5;
  if (v10)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v9);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__RTDaemonClient_fetchLocationsOfInterestWithinDistance_ofLocation_reply___block_invoke;
    v14[3] = &unk_1E9297DF8;
    v14[4] = self;
    v17 = a2;
    v18 = a3;
    v15 = v9;
    v16 = v10;
    -[RTLearnedLocationManager fetchLocationsOfInterestWithinDistance:ofLocation:handler:](learnedLocationManager, "fetchLocationsOfInterestWithinDistance:ofLocation:handler:", v12, v14, a3);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __74__RTDaemonClient_fetchLocationsOfInterestWithinDistance_ofLocation_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__RTDaemonClient_fetchLocationsOfInterestWithinDistance_ofLocation_reply___block_invoke_2;
  block[3] = &unk_1E9297DD0;
  v19 = *(_QWORD *)(a1 + 56);
  v14 = v5;
  v20 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = v9;
  v10 = *(id *)(a1 + 48);
  v17 = v6;
  v18 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

void __74__RTDaemonClient_fetchLocationsOfInterestWithinDistance_ofLocation_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = *(_QWORD *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 40), "coordinateToString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v10 = 138413314;
    v11 = v3;
    v12 = 2048;
    v13 = v4;
    v14 = 2048;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu locations of interest within %.2fm of %@ to client, %@", (uint8_t *)&v10, 0x34u);

  }
  v8 = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0D183C0], "locationsOfInterestFromLearnedLocationsOfInterest:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, *(_QWORD *)(a1 + 56));

}

- (void)fetchAllLocationsOfInterestForSettingsWithReply:(id)a3
{
  id v5;
  void *v6;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__RTDaemonClient_fetchAllLocationsOfInterestForSettingsWithReply___block_invoke;
    v9[3] = &unk_1E9297E70;
    v9[4] = self;
    v11 = a2;
    v10 = v5;
    -[RTLearnedLocationManager fetchAllLocationsOfInterestWithHandler:](learnedLocationManager, "fetchAllLocationsOfInterestWithHandler:", v9);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __66__RTDaemonClient_fetchAllLocationsOfInterestForSettingsWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  __int128 v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__RTDaemonClient_fetchAllLocationsOfInterestForSettingsWithReply___block_invoke_2;
  block[3] = &unk_1E9297910;
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v15 = v8;
  v16 = v6;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = (id)v12;
  v17 = v12;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

void __66__RTDaemonClient_fetchAllLocationsOfInterestForSettingsWithReply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v9 = 138413058;
    v10 = v3;
    v11 = 2048;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu locations of interest to client, %@, error, %@", (uint8_t *)&v9, 0x2Au);

  }
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0D183C0], "locationsOfInterestFromLearnedLocationsOfInterest:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, *(_QWORD *)(a1 + 48));

}

- (id)_clientIdentifier
{
  void *v3;

  -[RTDaemonClient bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[RTDaemonClient bundleIdentifier](self, "bundleIdentifier");
  else
    -[RTDaemonClient executableName](self, "executableName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  RTDeviceLocationPredictor *deviceLocationPredictor;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v12)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v10);
    deviceLocationPredictor = self->_deviceLocationPredictor;
    -[RTDaemonClient _clientIdentifier](self, "_clientIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __97__RTDaemonClient_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply___block_invoke;
    v16[3] = &unk_1E9297EE0;
    v16[4] = self;
    v17 = v12;
    -[RTDeviceLocationPredictor fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:clientIdentifier:handler:](deviceLocationPredictor, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:clientIdentifier:handler:", v13, v11, v15, v16, a5);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __97__RTDaemonClient_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__RTDaemonClient_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply___block_invoke_2;
  v12[3] = &unk_1E9297EB8;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v15 = v6;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

uint64_t __97__RTDaemonClient_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 134218498;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "sending %lu next PLOIs to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_7);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __97__RTDaemonClient_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply___block_invoke_359(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "PLOI %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)fetchRoutineEnabledWithReply:(id)a3
{
  void (**v4)(id, BOOL);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(id, BOOL))a3;
  if (v4)
  {
    v4[2](v4, -[RTDaemonClient enabled](self, "enabled"));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }

  }
}

- (void)setRoutineEnabled:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  RTDaemonClient *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v4)
        v8 = CFSTR("YES");
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "client, %@, setting CoreRoutine enabled to, %@", (uint8_t *)&v10, 0x16u);
    }

    -[RTAuthorizationManager setRoutineEnabled:withHandler:](self->_authorizationManager, "setRoutineEnabled:withHandler:", v4, v6);
    -[RTDaemonClient setEnabled:](self, "setEnabled:", v4);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", (uint8_t *)&v10, 2u);
    }

  }
}

- (void)clearRoutineWithReply:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[RTPurgeManager clearRoutineWithHandler:](self->_purgeManager, "clearRoutineWithHandler:");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v4, 2u);
    }

  }
}

- (void)fetchCloudSyncAuthorizationStateWithReply:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[RTAccountManager fetchCloudSyncAuthorizationState:](self->_accountManager, "fetchCloudSyncAuthorizationState:");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v4, 2u);
    }

  }
}

- (void)updateCloudSyncProvisionedForAccount:(BOOL)a3 reply:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  if (a4)
  {
    -[RTAccountManager updateCloudSyncProvisionedForAccount:handler:](self->_accountManager, "updateCloudSyncProvisionedForAccount:handler:", a3);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v5, 2u);
    }

  }
}

- (void)fetchRoutineModeFromLocation:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  RTLearnedLocationManager *learnedLocationManager;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v7);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__RTDaemonClient_fetchRoutineModeFromLocation_reply___block_invoke;
    v12[3] = &unk_1E9297F58;
    v12[4] = self;
    v15 = a2;
    v13 = v7;
    v14 = v8;
    -[RTLearnedLocationManager fetchModeAtLocation:handler:](learnedLocationManager, "fetchModeAtLocation:handler:", v10, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __53__RTDaemonClient_fetchRoutineModeFromLocation_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__RTDaemonClient_fetchRoutineModeFromLocation_reply___block_invoke_2;
  v10[3] = &unk_1E9297E20;
  v15 = *(_QWORD *)(a1 + 56);
  v16 = a2;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v13 = v5;
  v14 = *(id *)(a1 + 48);
  v9 = v5;
  dispatch_async(v6, v10);

}

uint64_t __53__RTDaemonClient_fetchRoutineModeFromLocation_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTLearnedLocationManager modeToString:](RTLearnedLocationManager, "modeToString:", *(_QWORD *)(a1 + 72));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "coordinateToString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138413314;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, sending mode, %@, at location, %@, to client, %@, error, %@", (uint8_t *)&v9, 0x34u);

  }
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), objc_msgSend(MEMORY[0x1E0D183C0], "routineModeFromLearnedLocationMode:", *(_QWORD *)(a1 + 72)), *(_QWORD *)(a1 + 48));
}

- (void)fetchLocationsOfInterestAssociatedToIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  RTEventModelProvider *eventModelProvider;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    eventModelProvider = self->_eventModelProvider;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__RTDaemonClient_fetchLocationsOfInterestAssociatedToIdentifier_reply___block_invoke;
    v10[3] = &unk_1E9297EE0;
    v10[4] = self;
    v11 = v6;
    -[RTEventModelProvider fetchLocationsOfInterestAssociatedToIdentifier:withHandler:](eventModelProvider, "fetchLocationsOfInterestAssociatedToIdentifier:withHandler:", a3, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __71__RTDaemonClient_fetchLocationsOfInterestAssociatedToIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__RTDaemonClient_fetchLocationsOfInterestAssociatedToIdentifier_reply___block_invoke_2;
  v12[3] = &unk_1E9297EB8;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v15 = v6;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

uint64_t __71__RTDaemonClient_fetchLocationsOfInterestAssociatedToIdentifier_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 134218498;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "sending %lu locations of interest to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchPredictedLocationsOfInterestAssociatedToTitle:(id)a3 location:(id)a4 calendarIdentifier:(id)a5 reply:(id)a6
{
  id v10;
  void *v11;
  RTEventModelProvider *eventModelProvider;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v10 = a6;
  v11 = v10;
  if (v10)
  {
    eventModelProvider = self->_eventModelProvider;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __103__RTDaemonClient_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_reply___block_invoke;
    v14[3] = &unk_1E9297EE0;
    v14[4] = self;
    v15 = v10;
    -[RTEventModelProvider fetchPredictedLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:withHandler:](eventModelProvider, "fetchPredictedLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:withHandler:", a3, a4, a5, v14);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __103__RTDaemonClient_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103__RTDaemonClient_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_reply___block_invoke_2;
  v12[3] = &unk_1E9297EB8;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v15 = v6;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

uint64_t __103__RTDaemonClient_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 134218498;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "sending %lu predicted locations of interest to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  RTDeviceLocationPredictor *deviceLocationPredictor;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    deviceLocationPredictor = self->_deviceLocationPredictor;
    -[RTDaemonClient _clientIdentifier](self, "_clientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__RTDaemonClient_fetchPredictedLocationsOfInterestOnDate_reply___block_invoke;
    v11[3] = &unk_1E9297F30;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    -[RTDeviceLocationPredictor fetchPredictedLocationsOfInterestOnDate:clientIdentifier:withHandler:](deviceLocationPredictor, "fetchPredictedLocationsOfInterestOnDate:clientIdentifier:withHandler:", v12, v9, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __64__RTDaemonClient_fetchPredictedLocationsOfInterestOnDate_reply___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__RTDaemonClient_fetchPredictedLocationsOfInterestOnDate_reply___block_invoke_2;
  block[3] = &unk_1E9297F08;
  v13 = v5;
  v8 = a1[5];
  v9 = a1[4];
  v14 = v8;
  v15 = v9;
  v16 = v6;
  v17 = a1[6];
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

uint64_t __64__RTDaemonClient_fetchPredictedLocationsOfInterestOnDate_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 40), "stringFromDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v8 = 134218754;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "sending %lu predicted locations the device may be at on %@ to client, %@, error, %@", (uint8_t *)&v8, 0x2Au);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_370);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __64__RTDaemonClient_fetchPredictedLocationsOfInterestOnDate_reply___block_invoke_369(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "PLOI %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)fetchCurrentPredictedLocationsOfInterestLookingBack:(double)a3 lookingAhead:(double)a4 reply:(id)a5
{
  id v9;
  RTCurrentMapItemProvider *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  double v14;
  double v15;
  uint8_t buf[16];

  v9 = a5;
  if (v9)
  {
    v10 = -[RTCurrentMapItemProvider initWithFingerprintManager:locationManager:mapServiceManager:wifiManager:]([RTCurrentMapItemProvider alloc], "initWithFingerprintManager:locationManager:mapServiceManager:wifiManager:", self->_fingerprintManager, self->_locationManager, self->_mapServiceManager, self->_wifiManager);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__RTDaemonClient_fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_reply___block_invoke;
    v11[3] = &unk_1E9297FC8;
    v11[4] = self;
    v13 = a2;
    v14 = a3;
    v15 = a4;
    v12 = v9;
    -[RTCurrentMapItemProvider fetchCurrentMapItemsLookingBack:lookingAhead:handler:](v10, "fetchCurrentMapItemsLookingBack:lookingAhead:handler:", v11, a3, a4);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = (RTCurrentMapItemProvider *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, &v10->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __89__RTDaemonClient_fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__RTDaemonClient_fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_reply___block_invoke_2;
  block[3] = &unk_1E9297FA0;
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v15 = v8;
  v18 = *(_OWORD *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 40);
  v16 = v6;
  v9 = (id)v12;
  v17 = v12;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

void __89__RTDaemonClient_fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 80);
    v11 = 138413570;
    v12 = v3;
    v13 = 2048;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2048;
    v20 = v7;
    v21 = 2048;
    v22 = v8;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu predicted locations of interest to client, %@, error, %@, looking back, %.2fs, seconds, looking ahead, %.2fs", (uint8_t *)&v11, 0x3Eu);

  }
  +[RTCurrentMapItemProvider logMapItems:prestring:](RTCurrentMapItemProvider, "logMapItems:prestring:", *(_QWORD *)(a1 + 32), CFSTR("Outputted MapItems"));
  v9 = *(_QWORD *)(a1 + 56);
  +[RTCurrentMapItemProvider convertMapItemsToPredictedLocationsOfInterest:](RTCurrentMapItemProvider, "convertMapItemsToPredictedLocationsOfInterest:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, *(_QWORD *)(a1 + 48));

}

- (void)performBluePOIQueryLookingBack:(double)a3 lookingAhead:(double)a4 reply:(id)a5
{
  id v9;
  RTCurrentMapItemProvider *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  double v14;
  double v15;
  uint8_t buf[16];

  v9 = a5;
  if (v9)
  {
    v10 = -[RTCurrentMapItemProvider initWithFingerprintManager:locationManager:mapServiceManager:wifiManager:]([RTCurrentMapItemProvider alloc], "initWithFingerprintManager:locationManager:mapServiceManager:wifiManager:", self->_fingerprintManager, self->_locationManager, self->_mapServiceManager, self->_wifiManager);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__RTDaemonClient_performBluePOIQueryLookingBack_lookingAhead_reply___block_invoke;
    v11[3] = &unk_1E9298018;
    v11[4] = self;
    v13 = a2;
    v14 = a3;
    v15 = a4;
    v12 = v9;
    -[RTCurrentMapItemProvider performBluePOIQueryLookingBack:lookingAhead:handler:](v10, "performBluePOIQueryLookingBack:lookingAhead:handler:", v11, a3, a4);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = (RTCurrentMapItemProvider *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, &v10->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __68__RTDaemonClient_performBluePOIQueryLookingBack_lookingAhead_reply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  _QWORD block[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__RTDaemonClient_performBluePOIQueryLookingBack_lookingAhead_reply___block_invoke_2;
  block[3] = &unk_1E9297FF0;
  v14 = *(_QWORD *)(a1 + 32);
  v22 = v11;
  v23 = v14;
  v28 = *(_OWORD *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 40);
  v24 = v12;
  v15 = (id)v20;
  v27 = v20;
  v25 = v9;
  v26 = v10;
  v16 = v10;
  v17 = v9;
  v18 = v12;
  v19 = v11;
  dispatch_async(v13, block);

}

void __68__RTDaemonClient_performBluePOIQueryLookingBack_lookingAhead_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 88);
    v8 = *(_QWORD *)(a1 + 96);
    v13 = 138413570;
    v14 = v3;
    v15 = 2048;
    v16 = v4;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    v21 = 2048;
    v22 = v7;
    v23 = 2048;
    v24 = v8;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu predicted locations of interest to client, %@, error, %@, looking back, %.2fs, seconds, looking ahead, %.2fs", (uint8_t *)&v13, 0x3Eu);

  }
  +[RTCurrentMapItemProvider logMapItems:prestring:](RTCurrentMapItemProvider, "logMapItems:prestring:", *(_QWORD *)(a1 + 32), CFSTR("Outputted MapItems"));
  v10 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 56);
  +[RTCurrentMapItemProvider convertMapItemsToPredictedLocationsOfInterest:](RTCurrentMapItemProvider, "convertMapItemsToPredictedLocationsOfInterest:", *(_QWORD *)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, _QWORD))(v9 + 16))(v9, v11, v10, v12, *(_QWORD *)(a1 + 48));

}

- (void)setMonitorVisits:(BOOL)a3
{
  RTVisitManager *visitManager;
  id v5;

  if (self->_monitorVisits != a3)
  {
    self->_monitorVisits = a3;
    visitManager = self->_visitManager;
    if (a3)
    {
      +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[RTNotifier addObserver:selector:name:](visitManager, "addObserver:selector:name:", self, sel_onVisitManagerNotification_);
    }
    else
    {
      +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[RTNotifier removeObserver:fromNotification:](visitManager, "removeObserver:fromNotification:", self);
    }

  }
}

- (void)startMonitoringVisitsWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[RTDaemonClient setMonitorVisits:](self, "setMonitorVisits:", 1);
    v4[2](v4, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }

  }
}

- (void)stopMonitoringVisitsWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[RTDaemonClient setMonitorVisits:](self, "setMonitorVisits:", 0);
    v4[2](v4, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }

  }
}

- (void)startLeechingVisitsWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[RTDaemonClient setLeechVisits:](self, "setLeechVisits:", 1);
    v4[2](v4, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }

  }
}

- (void)stopLeechingVisitsWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[RTDaemonClient setLeechVisits:](self, "setLeechVisits:", 0);
    v4[2](v4, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }

  }
}

- (void)setLeechVisits:(BOOL)a3
{
  RTVisitManager *visitManager;
  id v5;

  if (self->_leechVisits != a3)
  {
    self->_leechVisits = a3;
    visitManager = self->_visitManager;
    if (a3)
    {
      +[RTNotification notificationName](RTVisitManagerLeechedVisitIncidentNotification, "notificationName");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[RTNotifier addObserver:selector:name:](visitManager, "addObserver:selector:name:", self, sel_onVisitManagerNotification_);
    }
    else
    {
      +[RTNotification notificationName](RTVisitManagerLeechedVisitIncidentNotification, "notificationName");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[RTNotifier removeObserver:fromNotification:](visitManager, "removeObserver:fromNotification:", self);
    }

  }
}

- (void)startLeechingLowConfidenceVisitsWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[RTDaemonClient setLeechLowConfidenceVisits:](self, "setLeechLowConfidenceVisits:", 1);
    v4[2](v4, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }

  }
}

- (void)stopLeechingLowConfidenceVisitsWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[RTDaemonClient setLeechLowConfidenceVisits:](self, "setLeechLowConfidenceVisits:", 0);
    v4[2](v4, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }

  }
}

- (void)setLeechLowConfidenceVisits:(BOOL)a3
{
  RTVisitManager *visitManager;
  id v5;

  if (self->_leechLowConfidenceVisits != a3)
  {
    self->_leechLowConfidenceVisits = a3;
    visitManager = self->_visitManager;
    if (a3)
    {
      +[RTNotification notificationName](RTVisitManagerLowConfidenceVisitIncidentNotification, "notificationName");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[RTNotifier addObserver:selector:name:](visitManager, "addObserver:selector:name:", self, sel_onVisitManagerNotification_);
    }
    else
    {
      +[RTNotification notificationName](RTVisitManagerLowConfidenceVisitIncidentNotification, "notificationName");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[RTNotifier removeObserver:fromNotification:](visitManager, "removeObserver:fromNotification:", self);
    }

  }
}

- (void)_onVisitManagerNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  int v20;
  void *v21;
  __int16 v22;
  RTDaemonClient *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if (-[RTDaemonClient monitorVisits](self, "monitorVisits"))
    {
      objc_msgSend(v4, "visitIncident");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityClient);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v20 = 138412546;
        v21 = v8;
        v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "sending visit, %@, to client, %@", (uint8_t *)&v20, 0x16u);
      }

      -[RTDaemonClient xpcConnection](self, "xpcConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "remoteObjectProxy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "onVisit:withError:", v8, 0);
LABEL_16:

    }
  }
  else
  {
    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTVisitManagerLeechedVisitIncidentNotification, "notificationName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v14)
    {
      if (-[RTDaemonClient leechVisits](self, "leechVisits"))
      {
        objc_msgSend(v4, "visitIncident");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityClient);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v20 = 138412546;
          v21 = v8;
          v22 = 2112;
          v23 = self;
          _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "sending leeched visit, %@, to client, %@", (uint8_t *)&v20, 0x16u);
        }

        -[RTDaemonClient xpcConnection](self, "xpcConnection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "remoteObjectProxy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "onLeechedVisit:withError:", v8, 0);
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(v4, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTVisitManagerLowConfidenceVisitIncidentNotification, "notificationName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if (v18 && -[RTDaemonClient leechLowConfidenceVisits](self, "leechLowConfidenceVisits"))
      {
        objc_msgSend(v4, "visitIncident");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityClient);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = 138412546;
          v21 = v8;
          v22 = 2112;
          v23 = self;
          _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "sending leeched low conf visit, %@, to client, %@", (uint8_t *)&v20, 0x16u);
        }

        -[RTDaemonClient xpcConnection](self, "xpcConnection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "remoteObjectProxy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "onLeechedLowConfidenceVisit:withError:", v8, 0);
        goto LABEL_16;
      }
    }
  }

}

- (void)onVisitManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTDaemonClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__RTDaemonClient_onVisitManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __45__RTDaemonClient_onVisitManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onVisitManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (void)startMonitoringPlaceInferencesWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __int16 v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if (objc_msgSend(v6, "fidelityPolicy"))
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0D18598];
      v14 = *MEMORY[0x1E0CB2D50];
      v15[0] = CFSTR("invalid fidelity policy passed. Only Local is accepted");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v11);

    }
    else
    {
      -[RTDaemonClient setMonitorPlaceInferences:](self, "setMonitorPlaceInferences:", 1);
      v7[2](v7, 0);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", (uint8_t *)&v13, 2u);
    }

  }
}

- (void)stopMonitoringPlaceInferencesWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[RTDaemonClient setMonitorPlaceInferences:](self, "setMonitorPlaceInferences:", 0);
    v4[2](v4, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }

  }
}

- (void)setMonitorPlaceInferences:(BOOL)a3
{
  RTLocationContextManager *locationContextManager;
  id v5;

  if (self->_monitorPlaceInferences != a3)
  {
    self->_monitorPlaceInferences = a3;
    locationContextManager = self->_locationContextManager;
    if (a3)
    {
      +[RTNotification notificationName](RTLocationContextManagerPlaceInferencesNotification, "notificationName");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[RTNotifier addObserver:selector:name:](locationContextManager, "addObserver:selector:name:", self, sel_onLocationContextManagerNotification_);
    }
    else
    {
      +[RTNotification notificationName](RTLocationContextManagerPlaceInferencesNotification, "notificationName");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[RTNotifier removeObserver:fromNotification:](locationContextManager, "removeObserver:fromNotification:", self);
    }

  }
}

- (void)onLocationContextManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTDaemonClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__RTDaemonClient_onLocationContextManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__RTDaemonClient_onLocationContextManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLocationContextManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onLocationContextManagerNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  RTDaemonClient *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationContextManagerPlaceInferencesNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8 && -[RTDaemonClient monitorPlaceInferences](self, "monitorPlaceInferences"))
  {
    objc_msgSend(v5, "placeInferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138413058;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = self;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, sending place inferences, %@, to client, %@", (uint8_t *)&v16, 0x2Au);

    }
    -[RTDaemonClient xpcConnection](self, "xpcConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteObjectProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "onPlaceInferences:error:", v9, 0);

  }
}

+ (id)filterVisits:(id)a3 executable:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = CFSTR("locationd");
  v15 = CFSTR("wedge");
  v16 = CFSTR("loctool");
  v17 = CFSTR("xctest");
  v18 = CFSTR("coreautomationd");
  v19 = CFSTR("Routine");
  v20 = CFSTR("momentsd");
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  objc_msgSend(v6, "arrayWithObjects:count:", &v14, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "containsObject:", v7, v14, v15, v16, v17, v18, v19, v20, v21);

  if ((_DWORD)v6
    || (objc_msgSend(v5, "lastObject"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "type"),
        v9,
        v10 != 1))
  {
    v12 = v5;
  }
  else
  {
    v11 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v11, "removeLastObject");
    v12 = (id)objc_msgSend(v11, "copy");

  }
  return v12;
}

- (void)fetchStoredVisitsWithOptions:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  SEL v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  SEL v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v22;
      v33 = 2112;
      v34 = v7;
      _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@, options, %@", buf, 0x16u);

    }
    objc_msgSend(v7, "sources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", &unk_1E9326948);

    if (v11)
    {
      objc_msgSend(v7, "dateInterval");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        v17 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (id)objc_msgSend(v17, "initWithStartDate:endDate:", v18, v19);

      }
      v20 = objc_msgSend(v7, "ascending");
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke;
      v26[3] = &unk_1E92980D8;
      v26[4] = self;
      v27 = v14;
      v28 = v7;
      v29 = v8;
      v30 = a2;
      v21 = v14;
      -[RTDaemonClient _fetchHindsightVisitsWithDateInterval:ascending:handler:](self, "_fetchHindsightVisitsWithDateInterval:ascending:handler:", v21, v20, v26);

    }
    else
    {
      -[RTDaemonClient visitManager](self, "visitManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_392;
      v23[3] = &unk_1E9297E70;
      v23[4] = self;
      v25 = a2;
      v24 = v8;
      objc_msgSend(v16, "fetchStoredVisitsWithOptions:handler:", v7, v23);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_2;
  block[3] = &unk_1E92980B0;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = v5;
  v8 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 32);
  v17 = v6;
  v18 = v9;
  v10 = *(_QWORD *)(a1 + 64);
  v19 = v8;
  v20 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;

  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 40), "ascending");
  v4 = *(void **)(a1 + 48);
  if (v3)
    objc_msgSend(v4, "lastObject");
  else
    objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isAfterDate:", v7);

  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    if (v6)
    {
      v9 = v6;

      v2 = v9;
    }
    v10 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:", v2, v11);

    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__9;
    v24[4] = __Block_byref_object_dispose__9;
    v25 = *(id *)(a1 + 56);
    v13 = *(void **)(a1 + 64);
    v14 = *(void **)(a1 + 40);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_3;
    v18[3] = &unk_1E9298088;
    v18[4] = v13;
    v22 = v24;
    v19 = v14;
    v15 = *(id *)(a1 + 48);
    v17 = *(void **)(a1 + 72);
    v16 = *(_QWORD *)(a1 + 80);
    v20 = v15;
    v23 = v16;
    v21 = v17;
    objc_msgSend(v13, "_fetchRealtimeVisitsWithDateInterval:options:handler:", v12, v19, v18);

    _Block_object_dispose(v24, 8);
  }

}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_4;
  v12[3] = &unk_1E9298060;
  v8 = *(_QWORD *)(a1 + 64);
  v13 = v6;
  v19 = v8;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = v5;
  v9 = *(_QWORD *)(a1 + 32);
  v20 = *(_QWORD *)(a1 + 72);
  v17 = v9;
  v18 = *(id *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entry"), objc_msgSend(*(id *)(a1 + 40), "ascending"));
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
    v35[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortUsingDescriptors:", v6);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(a1 + 56));
    v34 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortUsingDescriptors:", v7);

    if (objc_msgSend(*(id *)(a1 + 40), "ascending"))
    {
      v8 = 0;
      v9 = (int)(objc_msgSend(v4, "count") - 1);
    }
    else
    {
      v9 = 0;
      v8 = (int)(objc_msgSend(v5, "count") - 1);
    }
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        if (v10)
        {
          objc_msgSend(v11, "entry");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "exit");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isBeforeDate:", v14);

          if (v15)
            objc_msgSend(v5, "removeObjectAtIndex:", v8);
        }
      }
    }
    else
    {
      v12 = 0;
    }

  }
  v16 = (void *)objc_opt_new();
  v17 = objc_msgSend(*(id *)(a1 + 40), "ascending");
  if (v17)
    v18 = v4;
  else
    v18 = v5;
  if (v17)
    v19 = v5;
  else
    v19 = v4;
  objc_msgSend(v16, "addObjectsFromArray:", v18);
  objc_msgSend(v16, "addObjectsFromArray:", v19);
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 88));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v16, "count");
    v23 = *(_QWORD *)(a1 + 64);
    v24 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v27 = v21;
    v28 = 2048;
    v29 = v22;
    v30 = 2112;
    v31 = v23;
    v32 = 2112;
    v33 = v24;
    _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, sending %lu stored visits to client, %@, error, %@", buf, 0x2Au);

  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_390;
  v25[3] = &__block_descriptor_40_e24_v32__0__RTVisit_8Q16_B24l;
  v25[4] = *(_QWORD *)(a1 + 88);
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v25);
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_390(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, idx, %lu, visit, %@", (uint8_t *)&v8, 0x20u);

  }
}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_392(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_2_393;
  block[3] = &unk_1E9297910;
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_2_393(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "executableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterVisits:executable:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "count");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    v13 = v7;
    v14 = 2048;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, sending %lu stored visits to client, %@, error, %@", buf, 0x2Au);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_394;
  v11[3] = &__block_descriptor_40_e24_v32__0__RTVisit_8Q16_B24l;
  v11[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __53__RTDaemonClient_fetchStoredVisitsWithOptions_reply___block_invoke_394(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, idx, %lu, visit, %@", (uint8_t *)&v8, 0x20u);

  }
}

- (void)processHindsightVisitsWithReply:(id)a3
{
  id v5;
  void *v6;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__RTDaemonClient_processHindsightVisitsWithReply___block_invoke;
    v9[3] = &unk_1E9298100;
    v9[4] = self;
    v11 = a2;
    v10 = v5;
    -[RTLearnedLocationManager trainForReason:mode:handler:](learnedLocationManager, "trainForReason:mode:handler:", 2, 2, v9);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __50__RTDaemonClient_processHindsightVisitsWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RTDaemonClient_processHindsightVisitsWithReply___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __50__RTDaemonClient_processHindsightVisitsWithReply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_fetchHindsightVisitsWithDateInterval:(id)a3 ascending:(BOOL)a4 handler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  RTLearnedLocationManager *learnedLocationManager;
  const char *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: handler";
LABEL_9:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: dateInterval";
    goto LABEL_9;
  }
  objc_msgSend(v8, "startDate");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  learnedLocationManager = self->_learnedLocationManager;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__RTDaemonClient__fetchHindsightVisitsWithDateInterval_ascending_handler___block_invoke;
  v14[3] = &unk_1E9297F30;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  -[RTLearnedLocationManager fetchHindsightVisitsBetweenStartDate:endDate:ascending:handler:](learnedLocationManager, "fetchHindsightVisitsBetweenStartDate:endDate:ascending:handler:", v10, v11, v6, v14);

LABEL_7:
}

void __74__RTDaemonClient__fetchHindsightVisitsWithDateInterval_ascending_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__RTDaemonClient__fetchHindsightVisitsWithDateInterval_ascending_handler___block_invoke_2;
  block[3] = &unk_1E9297F08;
  v13 = v5;
  v8 = a1[5];
  v9 = a1[4];
  v14 = v8;
  v15 = v9;
  v16 = v6;
  v17 = a1[6];
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

uint64_t __74__RTDaemonClient__fetchHindsightVisitsWithDateInterval_ascending_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v8 = 134218754;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "fetched %lu hindsight visits in date interval, %@, for client, %@, error, %@", (uint8_t *)&v8, 0x2Au);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_fetchRealtimeVisitsWithDateInterval:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: handler";
LABEL_9:
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_7;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: dateInterval";
    goto LABEL_9;
  }
  v11 = objc_alloc(MEMORY[0x1E0D18508]);
  v12 = objc_msgSend(v9, "ascending");
  objc_msgSend(v9, "confidence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "labelVisit");
  objc_msgSend(v9, "limit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sources");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v11, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", v12, v13, v8, v14, v15, v16);

  -[RTDaemonClient visitManager](self, "visitManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__RTDaemonClient__fetchRealtimeVisitsWithDateInterval_options_handler___block_invoke;
  v21[3] = &unk_1E9297F30;
  v21[4] = self;
  v22 = v17;
  v23 = v10;
  v19 = v17;
  objc_msgSend(v18, "fetchStoredVisitsWithOptions:handler:", v19, v21);

LABEL_7:
}

void __71__RTDaemonClient__fetchRealtimeVisitsWithDateInterval_options_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__RTDaemonClient__fetchRealtimeVisitsWithDateInterval_options_handler___block_invoke_2;
  block[3] = &unk_1E9297F08;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v15 = v9;
  v16 = v6;
  v17 = *(id *)(a1 + 48);
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

void __71__RTDaemonClient__fetchRealtimeVisitsWithDateInterval_options_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)objc_opt_class();
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "executableName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "filterVisits:executable:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entry"), objc_msgSend(*(id *)(a1 + 48), "ascending"));
    v19[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(v8, "count");
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 56);
      v13 = 134218498;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "fetched %lu realtimevisits visits for client, %@, error, %@", (uint8_t *)&v13, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 56));
  }
}

- (void)fetchPathToDiagnosticFilesWithOptions:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  RTDiagnostics *diagnostics;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    diagnostics = self->_diagnostics;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__RTDaemonClient_fetchPathToDiagnosticFilesWithOptions_reply___block_invoke;
    v11[3] = &unk_1E9298150;
    v11[4] = self;
    v14 = a2;
    v12 = v7;
    v13 = v8;
    -[RTDiagnostics fetchPathToDiagnosticFilesWithOptions:handler:](diagnostics, "fetchPathToDiagnosticFilesWithOptions:handler:", v12, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __62__RTDaemonClient_fetchPathToDiagnosticFilesWithOptions_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __62__RTDaemonClient_fetchPathToDiagnosticFilesWithOptions_reply___block_invoke_2;
  v12[3] = &unk_1E9298128;
  v18 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v12[1] = 3221225472;
  v15 = v9;
  v16 = v6;
  v17 = *(id *)(a1 + 48);
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

uint64_t __62__RTDaemonClient_fetchPathToDiagnosticFilesWithOptions_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v9 = 138413314;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, sending path to diagnostic files, %@, to client, %@, options, %@, error, %@", (uint8_t *)&v9, 0x34u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)shutdown
{
  NSObject *v4;
  _QWORD v5[6];

  -[RTDaemonClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__RTDaemonClient_shutdown__block_invoke;
  v5[3] = &unk_1E9297BF0;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __26__RTDaemonClient_shutdown__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "deviceLocationPredictor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "authorizationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "scenarioTriggerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "vehicleEventRegistrar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopMonitoringVehicleEvents");

  objc_msgSend(*(id *)(a1 + 32), "visitManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", *(_QWORD *)(a1 + 32));

}

- (void)fetchLocationOfInterestForRegion:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  RTLearnedLocationManager *learnedLocationManager;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLCircularRegion:", v7);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__RTDaemonClient_fetchLocationOfInterestForRegion_reply___block_invoke;
    v12[3] = &unk_1E9298178;
    v12[4] = self;
    v15 = a2;
    v13 = v7;
    v14 = v8;
    -[RTLearnedLocationManager fetchLocationOfInterestForRegion:handler:](learnedLocationManager, "fetchLocationOfInterestForRegion:handler:", v10, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __57__RTDaemonClient_fetchLocationOfInterestForRegion_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__RTDaemonClient_fetchLocationOfInterestForRegion_reply___block_invoke_2;
  v12[3] = &unk_1E9298128;
  v18 = *(_QWORD *)(a1 + 56);
  v13 = v5;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v16 = v6;
  v17 = *(id *)(a1 + 48);
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

void __57__RTDaemonClient_fetchLocationOfInterestForRegion_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v10 = 138413314;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, sending location of interest, %@, matching region, %@, to client, %@, error, %@", (uint8_t *)&v10, 0x34u);

  }
  v8 = *(_QWORD *)(a1 + 64);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithLearnedLocationOfInterest:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, *(_QWORD *)(a1 + 56));

}

- (void)fetchLocationOfInterestWithIdentifier:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__RTDaemonClient_fetchLocationOfInterestWithIdentifier_reply___block_invoke;
    v11[3] = &unk_1E9298178;
    v11[4] = self;
    v14 = a2;
    v12 = v7;
    v13 = v8;
    -[RTLearnedLocationManager fetchLocationOfInterestWithIdentifier:handler:](learnedLocationManager, "fetchLocationOfInterestWithIdentifier:handler:", v12, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __62__RTDaemonClient_fetchLocationOfInterestWithIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__RTDaemonClient_fetchLocationOfInterestWithIdentifier_reply___block_invoke_2;
  v12[3] = &unk_1E9298128;
  v18 = *(_QWORD *)(a1 + 56);
  v13 = v5;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v16 = v6;
  v17 = *(id *)(a1 + 48);
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

void __62__RTDaemonClient_fetchLocationOfInterestWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v10 = 138413314;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, sending location of interest, %@, with identifier, %@, to client, %@, error, %@", (uint8_t *)&v10, 0x34u);

  }
  v8 = *(_QWORD *)(a1 + 64);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithLearnedLocationOfInterest:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, *(_QWORD *)(a1 + 56));

}

void __80__RTDaemonClient_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply___block_invoke_406(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, idx, %lu, location of interest, %@", (uint8_t *)&v8, 0x20u);

  }
}

- (void)fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 reply:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  uint8_t *v20;
  SEL v21;
  _QWORD v22[4];
  NSObject *v23;
  uint8_t *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    v12 = dispatch_group_create();
    v13 = v12;
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__9;
    v32 = __Block_byref_object_dispose__9;
    v33 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__9;
    v26[4] = __Block_byref_object_dispose__9;
    v27 = 0;
    v14 = MEMORY[0x1E0C809B0];
    if (self->_learnedLocationManager)
    {
      dispatch_group_enter(v12);
      learnedLocationManager = self->_learnedLocationManager;
      v22[0] = v14;
      v22[1] = 3221225472;
      v22[2] = __65__RTDaemonClient_fetchTransitionsBetweenStartDate_endDate_reply___block_invoke;
      v22[3] = &unk_1E9296EE0;
      v24 = buf;
      v25 = v26;
      v23 = v13;
      -[RTLearnedLocationManager fetchTransitionsBetweenStartDate:endDate:handler:](learnedLocationManager, "fetchTransitionsBetweenStartDate:endDate:handler:", v9, v10, v22);

    }
    -[RTDaemonClient queue](self, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __65__RTDaemonClient_fetchTransitionsBetweenStartDate_endDate_reply___block_invoke_2;
    v17[3] = &unk_1E92981C0;
    v20 = buf;
    v21 = a2;
    v19 = v26;
    v17[4] = self;
    v18 = v11;
    dispatch_group_notify(v13, v16, v17);

    _Block_object_dispose(v26, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __65__RTDaemonClient_fetchTransitionsBetweenStartDate_endDate_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __65__RTDaemonClient_fetchTransitionsBetweenStartDate_endDate_reply___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id obj;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
    *(_DWORD *)buf = 134218242;
    v31 = v4;
    v32 = 2112;
    v33 = (uint64_t)v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "Fetched %lu transitions, error, %@", buf, 0x16u);
  }
  v22 = v2;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = a1;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
  if (v5)
  {
    v6 = v5;
    v25 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v25)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v9 = objc_msgSend(MEMORY[0x1E0D183D0], "modeOfTransportationFromMotionActivityType:", objc_msgSend(v8, "predominantMotionActivityType"));
        v10 = objc_alloc(MEMORY[0x1E0D183D0]);
        objc_msgSend(v8, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stopDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "visitIdentifierOrigin");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "visitIdentifierDestination");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v10, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:modeOfTransportation:", v11, v12, v13, v14, v15, v9);

        if (v16)
          objc_msgSend(v24, "addObject:", v16);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    }
    while (v6);
  }

  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(v21 + 64));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v24, "count");
    v20 = *(_QWORD *)(v21 + 32);
    *(_DWORD *)buf = 138413314;
    v31 = (uint64_t)v18;
    v32 = 2048;
    v33 = v19;
    v34 = 2112;
    v35 = v24;
    v36 = 2112;
    v37 = v20;
    v38 = 2112;
    v39 = v22;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, sending %lu transitions, %@, to client, %@, error, %@", buf, 0x34u);

  }
  (*(void (**)(void))(*(_QWORD *)(v21 + 40) + 16))();

}

- (void)setHintForRegionState:(int64_t)a3 significantRegion:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  RTHintManager *v10;
  void *v11;
  RTHintManager *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  RTHintManager *hintManager;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (!a3)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    v17 = *MEMORY[0x1E0CB2D50];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("Region State Unknown. Unable to determine what type of hint we need to inject");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v19);

LABEL_9:
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v24 = v17;
    v25 = CFSTR("Region State unsuported yet");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v16, 0, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v23);

    goto LABEL_10;
  }
  if (a3 == 1)
  {
    hintManager = self->_hintManager;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLCircularRegion:", v8);
    v12 = hintManager;
    v13 = v11;
    v14 = 9;
    goto LABEL_7;
  }
  if (a3 != 2)
  {
    v16 = *MEMORY[0x1E0D18598];
    v17 = *MEMORY[0x1E0CB2D50];
    goto LABEL_9;
  }
  v10 = self->_hintManager;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLCircularRegion:", v8);
  v12 = v10;
  v13 = v11;
  v14 = 10;
LABEL_7:
  -[RTHintManager storeHintSignificantRegion:hintSource:handler:](v12, "storeHintSignificantRegion:hintSource:handler:", v13, v14, v9);

LABEL_10:
}

- (void)startMonitoringScenarioTriggerOfType:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    -[RTDaemonClientRegistrarScenarioTrigger startMonitoringForScenarioTriggerType:](self->_scenarioTriggerRegistrar, "startMonitoringForScenarioTriggerType:", a3);
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_scenarioTriggerRegistrar, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDaemonClient restorationData](self, "restorationData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("scenarioTriggerRegistrar"));

    -[RTDaemonClient clientManagerDelegate](self, "clientManagerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "saveDaemonClient:", self);

    v6[2](v6, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v11, 2u);
    }

  }
}

- (void)stopMonitoringScenarioTriggerOfType:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    -[RTDaemonClientRegistrarScenarioTrigger stopMonitoringForScenarioTriggerType:](self->_scenarioTriggerRegistrar, "stopMonitoringForScenarioTriggerType:", a3);
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_scenarioTriggerRegistrar, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDaemonClient restorationData](self, "restorationData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("scenarioTriggerRegistrar"));

    -[RTDaemonClient clientManagerDelegate](self, "clientManagerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "saveDaemonClient:", self);

    v6[2](v6, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v11, 2u);
    }

  }
}

- (void)fetchMonitoredScenarioTriggerTypesWithReply:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  RTDaemonClientRegistrarScenarioTrigger *scenarioTriggerRegistrar;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  if (v4)
  {
    scenarioTriggerRegistrar = self->_scenarioTriggerRegistrar;
    if (scenarioTriggerRegistrar)
      v6 = -[RTDaemonClientRegistrarScenarioTrigger monitoredScenarioTriggerTypes](scenarioTriggerRegistrar, "monitoredScenarioTriggerTypes");
    else
      v6 = 0;
    v4[2](v4, v6, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v8, 2u);
    }

  }
}

- (void)scenarioTriggerRegistrar:(id)a3 didReceiveScenarioTriggers:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  uint8_t buf[4];
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (-[RTDaemonClient enabled](self, "enabled") && -[RTDaemonClient supported](self, "supported"))
  {
    if (objc_msgSend(v8, "count"))
    {
      -[RTDaemonClient queue](self, "queue");
      v10 = objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __76__RTDaemonClient_scenarioTriggerRegistrar_didReceiveScenarioTriggers_error___block_invoke;
      v13[3] = &unk_1E9298238;
      v13[4] = self;
      v14 = v8;
      v15 = v9;
      v16 = a2;
      dispatch_async(v10, v13);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityClient);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "Dropping callback to scenario trigger monitor handler because there are no triggers.", buf, 2u);
      }

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v18 = -[RTDaemonClient enabled](self, "enabled");
      v19 = 1024;
      v20 = -[RTDaemonClient supported](self, "supported");
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "Dropping callback to scenario trigger monitor handler because routine is either not enabled %d or supported %d.", buf, 0xEu);
    }

  }
}

void __76__RTDaemonClient_scenarioTriggerRegistrar_didReceiveScenarioTriggers_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "launchClient");
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v32 = v5;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "sending scenario triggers, %@, to client, %@", buf, 0x16u);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = *(id *)(a1 + 40);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v27;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v10);
          objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "remoteObjectProxy");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "onScenarioTrigger:withError:", v11, 0);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v8);
    }

  }
  else
  {
    if (v4)
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v32 = v14;
      v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "client, %@, not connected. buffering scenario triggers, %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    v17 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __76__RTDaemonClient_scenarioTriggerRegistrar_didReceiveScenarioTriggers_error___block_invoke_415;
    v22[3] = &unk_1E92981E8;
    objc_copyWeak(&v25, (id *)buf);
    v23 = *(id *)(a1 + 40);
    v24 = *(id *)(a1 + 48);
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __76__RTDaemonClient_scenarioTriggerRegistrar_didReceiveScenarioTriggers_error___block_invoke_416;
    v19[3] = &unk_1E9298210;
    objc_copyWeak(&v21, (id *)buf);
    v20 = *(id *)(a1 + 48);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addPendingScenarioTriggerBlock:failBlock:description:", v22, v19, v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

void __76__RTDaemonClient_scenarioTriggerRegistrar_didReceiveScenarioTriggers_error___block_invoke_415(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "scenarioTriggerRegistrar:didReceiveScenarioTriggers:error:", WeakRetained[11], *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "nil reference to self, returning from scenario trigger block", v5, 2u);
    }

  }
}

void __76__RTDaemonClient_scenarioTriggerRegistrar_didReceiveScenarioTriggers_error___block_invoke_416(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0D18598];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = CFSTR("Buffered scenario trigger failed.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 0, v5);
    v6 = objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[NSObject localizedDescription](v6, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(WeakRetained, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "onScenarioTrigger:withError:", 0, *(_QWORD *)(a1 + 32));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "nil reference to self, returning from scenario trigger block", (uint8_t *)&v11, 2u);
    }
  }

}

- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  RTDeviceLocationPredictor *deviceLocationPredictor;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v8);
    deviceLocationPredictor = self->_deviceLocationPredictor;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__RTDaemonClient_fetchPredictedExitDatesFromLocation_onDate_reply___block_invoke;
    v13[3] = &unk_1E92982A8;
    v13[4] = self;
    v14 = v8;
    v15 = v9;
    v16 = v10;
    -[RTDeviceLocationPredictor fetchPredictedExitDatesFromLocation:onDate:withHandler:](deviceLocationPredictor, "fetchPredictedExitDatesFromLocation:onDate:withHandler:", v11, v15, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __67__RTDaemonClient_fetchPredictedExitDatesFromLocation_onDate_reply___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__RTDaemonClient_fetchPredictedExitDatesFromLocation_onDate_reply___block_invoke_2;
  v12[3] = &unk_1E9298280;
  v13 = v5;
  v14 = a1[5];
  v8 = a1[6];
  v9 = a1[4];
  v15 = v8;
  v16 = v9;
  v17 = v6;
  v18 = a1[7];
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

uint64_t __67__RTDaemonClient_fetchPredictedExitDatesFromLocation_onDate_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 40), "coordinateToString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "stringFromDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v9 = 134219010;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "sending %lu predicted exit dates from location, %@, on date, %@, to client, %@, error, %@", (uint8_t *)&v9, 0x34u);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_420);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

void __67__RTDaemonClient_fetchPredictedExitDatesFromLocation_onDate_reply___block_invoke_419(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "PD %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  RTDeviceLocationPredictor *deviceLocationPredictor;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    deviceLocationPredictor = self->_deviceLocationPredictor;
    -[RTDaemonClient _clientIdentifier](self, "_clientIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__RTDaemonClient_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply___block_invoke;
    v14[3] = &unk_1E92982A8;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    v17 = v10;
    -[RTDeviceLocationPredictor fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:withHandler:](deviceLocationPredictor, "fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:withHandler:", v15, v16, v12, v14);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __82__RTDaemonClient_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__RTDaemonClient_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply___block_invoke_2;
  v12[3] = &unk_1E9298280;
  v13 = v5;
  v14 = a1[5];
  v8 = a1[6];
  v9 = a1[4];
  v15 = v8;
  v16 = v9;
  v17 = v6;
  v18 = a1[7];
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

uint64_t __82__RTDaemonClient_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 40), "stringFromDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "stringFromDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v9 = 134219010;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "sending %lu PLOIs between startDate, %@, endDate, %@, to client, %@, error, %@", (uint8_t *)&v9, 0x34u);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_422);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

void __82__RTDaemonClient_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply___block_invoke_421(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "PLOI %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)setRestorationIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSString *v7;
  NSString *restorationIdentifier;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = a3;
    -[RTDaemonClient signingIdentifier](self, "signingIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v6, v5);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

    restorationIdentifier = self->_restorationIdentifier;
    self->_restorationIdentifier = v7;

    -[RTDaemonClient restorationData](self, "restorationData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", self->_restorationIdentifier, CFSTR("restorationIdentifier"));

    -[RTDaemonClient clientManagerDelegate](self, "clientManagerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleRestorationForDaemonClient:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "scenarioTriggerRegistrar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "invocationsPending"))
    {

    }
    else
    {
      objc_msgSend(v11, "vehicleEventRegistrar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "invocationsPending");

      if (!v14)
      {
LABEL_8:

        return;
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "taking process asssertion for client, %@", buf, 0xCu);
    }

    objc_msgSend(v11, "xpcConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "processIdentifier");
    -[RTDaemonClient queue](self, "queue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __43__RTDaemonClient_setRestorationIdentifier___block_invoke;
    v19[3] = &unk_1E92977B8;
    v20 = v11;
    +[RTLaunchServices createProcessAssertionForPid:timeout:queue:timeoutHandler:](RTLaunchServices, "createProcessAssertionForPid:timeout:queue:timeoutHandler:", v17, v18, v19, 10.0);

    goto LABEL_8;
  }
}

void __43__RTDaemonClient_setRestorationIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "release process assertion for client, %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)setTargetUserSession:(BOOL)a3
{
  void *v4;
  id v5;

  self->_targetUserSession = a3;
  if (a3)
  {
    -[RTDaemonClient authorizationManager](self, "authorizationManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTAuthorizationManagerNotificationConsoleUserDidChange, "notificationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:", self, sel_onAuthorizationNotification_, v4);

  }
}

- (BOOL)hasReasonToOutliveClientConnection
{
  void *v3;
  void *v4;
  BOOL v5;

  -[RTDaemonClient restorationIdentifier](self, "restorationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[RTDaemonClient restorationData](self, "restorationData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __25__RTDaemonClient_restore__block_invoke_425(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "error restoring scenario trigger monitoring, %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __25__RTDaemonClient_restore__block_invoke_427(uint64_t a1, void *a2)
{
  __CFString *v2;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("OK");
    if (v2)
      v4 = v2;
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEFAULT, "restoring people discovery monitoring %@", (uint8_t *)&v5, 0xCu);
  }

}

void __25__RTDaemonClient_restore__block_invoke_431(uint64_t a1, void *a2)
{
  __CFString *v2;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("OK");
    if (v2)
      v4 = v2;
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEFAULT, "clearing people discovery monitoring %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)launchClient
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  RTEventAgentManager *eventAgentManager;
  _QWORD v9[5];

  -[RTDaemonClient bundleIdentifier](self, "bundleIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[RTDaemonClient restorationIdentifier](self, "restorationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[RTDaemonClient bundleIdentifier](self, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDaemonClient restorationIdentifier](self, "restorationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      eventAgentManager = self->_eventAgentManager;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __30__RTDaemonClient_launchClient__block_invoke;
      v9[3] = &unk_1E9297150;
      v9[4] = self;
      +[RTLaunchServices launchClientWithBundleIdentifier:restorationIdentifier:eventAgentManager:handler:](RTLaunchServices, "launchClientWithBundleIdentifier:restorationIdentifier:eventAgentManager:handler:", v6, v7, eventAgentManager, v9);

    }
  }
}

void __30__RTDaemonClient_launchClient__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__RTDaemonClient_launchClient__block_invoke_2;
  v6[3] = &unk_1E9297540;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __30__RTDaemonClient_launchClient__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "launched client, %@, error, %@", (uint8_t *)&v5, 0x16u);
  }

}

- (void)fetchLastVehicleEventsWithReply:(id)a3
{
  id v4;
  void *v5;
  RTVehicleLocationProvider *vehicleLocationProvider;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    vehicleLocationProvider = self->_vehicleLocationProvider;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__RTDaemonClient_fetchLastVehicleEventsWithReply___block_invoke;
    v8[3] = &unk_1E9297EE0;
    v8[4] = self;
    v9 = v4;
    -[RTVehicleLocationProvider fetchLastVehicleEventsWithHandler:](vehicleLocationProvider, "fetchLastVehicleEventsWithHandler:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __50__RTDaemonClient_fetchLastVehicleEventsWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__RTDaemonClient_fetchLastVehicleEventsWithReply___block_invoke_2;
  v12[3] = &unk_1E9297EB8;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v15 = v6;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

uint64_t __50__RTDaemonClient_fetchLastVehicleEventsWithReply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 134218498;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "sending %lu vehicle parked events to client, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)vehicleEventAtLocation:(id)a3 notes:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  RTVehicleLocationProvider *vehicleLocationProvider;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  uint8_t buf[16];

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    vehicleLocationProvider = self->_vehicleLocationProvider;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__RTDaemonClient_vehicleEventAtLocation_notes_reply___block_invoke;
    v12[3] = &unk_1E9297568;
    v13 = v8;
    -[RTVehicleLocationProvider vehicleEventAtLocation:notes:handler:](vehicleLocationProvider, "vehicleEventAtLocation:notes:handler:", a3, a4, v12);
    v11 = v13;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

uint64_t __53__RTDaemonClient_vehicleEventAtLocation_notes_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)clearAllVehicleEventsWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[RTVehicleLocationProvider clearAllVehicleEvents](self->_vehicleLocationProvider, "clearAllVehicleEvents");
    v4[2](v4, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }

  }
}

- (void)updateVehicleEventWithIdentifier:(id)a3 notes:(id)a4 reply:(id)a5
{
  void (**v8)(id, _QWORD);
  NSObject *v9;
  uint8_t v10[16];

  v8 = (void (**)(id, _QWORD))a5;
  if (v8)
  {
    -[RTVehicleLocationProvider updateVehicleEventWithIdentifier:notes:](self->_vehicleLocationProvider, "updateVehicleEventWithIdentifier:notes:", a3, a4);
    v8[2](v8, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v10, 2u);
    }

  }
}

- (void)updateVehicleEventWithIdentifier:(id)a3 photo:(id)a4 reply:(id)a5
{
  void (**v8)(id, _QWORD);
  NSObject *v9;
  uint8_t v10[16];

  v8 = (void (**)(id, _QWORD))a5;
  if (v8)
  {
    -[RTVehicleLocationProvider updateVehicleEventWithIdentifier:photo:](self->_vehicleLocationProvider, "updateVehicleEventWithIdentifier:photo:", a3, a4);
    v8[2](v8, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v10, 2u);
    }

  }
}

- (void)updateVehicleEventWithIdentifier:(id)a3 geoMapItem:(id)a4 reply:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, id);
  RTMapServiceManager *mapServiceManager;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, id))a5;
  if (v11)
  {
    if (v9)
    {
      if (v10)
      {
        mapServiceManager = self->_mapServiceManager;
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        -[RTMapServiceManager mapItemWithIdentifier:geoMapItem:source:creationDate:error:](mapServiceManager, "mapItemWithIdentifier:geoMapItem:source:creationDate:error:", v13, v10, 8, v14, &v24);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v24;

        if (v16)
        {
          _rt_log_facility_get_os_log(RTLogFacilityClient);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v16;
            _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

          v11[2](v11, v16);
LABEL_8:

          goto LABEL_17;
        }
        if (!v15)
        {
          _rt_log_facility_get_os_log(RTLogFacilityClient);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "map item was nil, invalid parameter", buf, 2u);
          }

          v25 = *MEMORY[0x1E0CB2D50];
          v26 = CFSTR("Map item must be non-nil.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v11[2](v11, v22);

          goto LABEL_8;
        }
      }
      else
      {
        v15 = 0;
      }
      -[RTVehicleLocationProvider updateVehicleEventWithIdentifier:mapItem:](self->_vehicleLocationProvider, "updateVehicleEventWithIdentifier:mapItem:", v9, v15);
      v11[2](v11, 0);
      goto LABEL_17;
    }
    v31 = *MEMORY[0x1E0CB2D50];
    v32[0] = CFSTR("Invalid parameter identifier, must be non-nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v23;
      v29 = 2112;
      v30 = v18;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "error while calling %@, %@", buf, 0x16u);

    }
    v11[2](v11, v18);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
LABEL_17:

}

- (void)updateVehicleEventWithIdentifier:(id)a3 location:(id)a4 reply:(id)a5
{
  void (**v8)(id, _QWORD);
  NSObject *v9;
  uint8_t v10[16];

  v8 = (void (**)(id, _QWORD))a5;
  if (v8)
  {
    -[RTVehicleLocationProvider updateVehicleEventWithIdentifier:location:](self->_vehicleLocationProvider, "updateVehicleEventWithIdentifier:location:", a3, a4);
    v8[2](v8, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v10, 2u);
    }

  }
}

- (void)engageInVehicleEventWithIdentifier:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  NSObject *v7;
  uint8_t v8[16];

  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    -[RTVehicleLocationProvider engageInVehicleEventWithIdentifier:](self->_vehicleLocationProvider, "engageInVehicleEventWithIdentifier:", a3);
    v6[2](v6, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v8, 2u);
    }

  }
}

- (void)_startMonitoringVehicleEvents
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  RTDaemonClient *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v12;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "client, %@, called, %@", (uint8_t *)&v13, 0x16u);

  }
  if (!-[RTDaemonClient enabled](self, "enabled"))
  {
    -[RTDaemonClient xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "onVehicleEvents:error:", 0, v7);

  }
  -[RTDaemonClient vehicleEventRegistrar](self, "vehicleEventRegistrar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startMonitoringVehicleEvents");

  -[RTDaemonClient restorationData](self, "restorationData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("vehicleEventRegistrar"));

  -[RTDaemonClient clientManagerDelegate](self, "clientManagerDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveDaemonClient:", self);

}

- (void)startMonitoringVehicleEventsWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[RTDaemonClient _startMonitoringVehicleEvents](self, "_startMonitoringVehicleEvents");
    v4[2](v4, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }

  }
}

- (void)stopMonitoringVehicleEventsWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[RTDaemonClient vehicleEventRegistrar](self, "vehicleEventRegistrar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopMonitoringVehicleEvents");

    -[RTDaemonClient restorationData](self, "restorationData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("vehicleEventRegistrar"));

    -[RTDaemonClient clientManagerDelegate](self, "clientManagerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "saveDaemonClient:", self);

    v4[2](v4, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v9, 2u);
    }

  }
}

- (void)fetchAutomaticVehicleEventDetectionSupportedWithReply:(id)a3
{
  id v4;
  void *v5;
  RTVehicleLocationProvider *vehicleLocationProvider;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    vehicleLocationProvider = self->_vehicleLocationProvider;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__RTDaemonClient_fetchAutomaticVehicleEventDetectionSupportedWithReply___block_invoke;
    v8[3] = &unk_1E9298398;
    v8[4] = self;
    v9 = v4;
    -[RTVehicleLocationProvider fetchAutomaticVehicleEventDetectionSupportedWithHandler:](vehicleLocationProvider, "fetchAutomaticVehicleEventDetectionSupportedWithHandler:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __72__RTDaemonClient_fetchAutomaticVehicleEventDetectionSupportedWithReply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__RTDaemonClient_fetchAutomaticVehicleEventDetectionSupportedWithReply___block_invoke_2;
  v9[3] = &unk_1E92970B0;
  v12 = a2;
  v7 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, v9);

}

uint64_t __72__RTDaemonClient_fetchAutomaticVehicleEventDetectionSupportedWithReply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7[0] = 67109634;
    v7[1] = v3;
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "sending automatic vehicle event detection supported, %d, to client, %@, error, %@", (uint8_t *)v7, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)vehicleEventRegistrar:(id)a3 didReceiveVehicleEvents:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[RTDaemonClient queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__RTDaemonClient_vehicleEventRegistrar_didReceiveVehicleEvents_error___block_invoke;
  block[3] = &unk_1E92978E8;
  block[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v9;
  v20 = a2;
  v13 = v9;
  v14 = v11;
  v15 = v10;
  dispatch_async(v12, block);

}

void __70__RTDaemonClient_vehicleEventRegistrar_didReceiveVehicleEvents_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "launchClient");
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "sending vehicle events, %@, to client, %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "onVehicleEvents:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    if (v4)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "client, %@, not connected. buffering vehicle events, %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "vehicleEventRegistrar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__RTDaemonClient_vehicleEventRegistrar_didReceiveVehicleEvents_error___block_invoke_441;
    v16[3] = &unk_1E92983C0;
    objc_copyWeak(&v20, (id *)buf);
    v17 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 40);
    v19 = *(id *)(a1 + 48);
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __70__RTDaemonClient_vehicleEventRegistrar_didReceiveVehicleEvents_error___block_invoke_2;
    v14[3] = &unk_1E92983E8;
    objc_copyWeak(&v15, (id *)buf);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addPendingVehicleEventBlock:failBlock:description:", v16, v14, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

void __70__RTDaemonClient_vehicleEventRegistrar_didReceiveVehicleEvents_error___block_invoke_441(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "vehicleEventRegistrar:didReceiveVehicleEvents:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __70__RTDaemonClient_vehicleEventRegistrar_didReceiveVehicleEvents_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D18598];
  v13 = *MEMORY[0x1E0CB2D50];
  v14[0] = CFSTR("Buffered vehicle events failed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "onVehicleEvents:error:", 0, v5);

}

- (void)addLocationOfInterestOfType:(int64_t)a3 mapItemStorage:(id)a4 customLabel:(id)a5 reply:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD, id);
  RTMapServiceManager *mapServiceManager;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(id, _QWORD, id);
  id v26[3];
  id v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, id))a6;
  if (v13)
  {
    if (v11)
    {
      mapServiceManager = self->_mapServiceManager;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      -[RTMapServiceManager mapItemWithIdentifier:geoMapItem:source:creationDate:error:](mapServiceManager, "mapItemWithIdentifier:geoMapItem:source:creationDate:error:", v15, v11, 8, v16, &v27);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v27;

      if (v18)
      {
        _rt_log_facility_get_os_log(RTLogFacilityClient);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v18;
          _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        v13[2](v13, 0, v18);
        goto LABEL_14;
      }
      if (v17)
      {
        objc_initWeak((id *)buf, self);
        v20 = +[RTLearnedPlace placeTypeFromType:](RTLearnedPlace, "placeTypeFromType:", a3);
        -[RTDaemonClient learnedLocationManager](self, "learnedLocationManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __79__RTDaemonClient_addLocationOfInterestOfType_mapItemStorage_customLabel_reply___block_invoke;
        v24[3] = &unk_1E9298410;
        objc_copyWeak(v26, (id *)buf);
        v26[1] = (id)a2;
        v26[2] = v20;
        v25 = v13;
        objc_msgSend(v21, "addLocationOfInterestWithType:mapItem:customLabel:handler:", v20, v17, v12, v24);

        objc_destroyWeak(v26);
        objc_destroyWeak((id *)buf);
        goto LABEL_14;
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "map item was nil, invalid parameter", buf, 2u);
    }

    v28 = *MEMORY[0x1E0CB2D50];
    v29 = CFSTR("Map item must be non-nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v23);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
LABEL_14:

}

void __79__RTDaemonClient_addLocationOfInterestOfType_mapItemStorage_customLabel_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __79__RTDaemonClient_addLocationOfInterestOfType_mapItemStorage_customLabel_reply___block_invoke_444;
    v16[3] = &unk_1E9297E20;
    v21 = *(_QWORD *)(a1 + 48);
    v10 = v5;
    v22 = *(_QWORD *)(a1 + 56);
    v17 = v10;
    v18 = v8;
    v19 = v6;
    v20 = *(id *)(a1 + 32);
    dispatch_async(v9, v16);

    v11 = v17;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", *(_QWORD *)(a1 + 56));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v24 = v13;
      v25 = 2112;
      v26 = v5;
      v27 = 2112;
      v28 = v14;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, added location of interest, %@, type, %@, error, %@", buf, 0x2Au);

    }
    v15 = *(_QWORD *)(a1 + 32);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithLearnedLocationOfInterest:", v5);
    (*(void (**)(uint64_t, void *, id))(v15 + 16))(v15, v11, v6);
  }

}

void __79__RTDaemonClient_addLocationOfInterestOfType_mapItemStorage_customLabel_reply___block_invoke_444(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", *(_QWORD *)(a1 + 72));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v10 = 138413314;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, added location of interest, %@, type, %@, reply to client, %@, error, %@", (uint8_t *)&v10, 0x34u);

  }
  v8 = *(_QWORD *)(a1 + 56);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithLearnedLocationOfInterest:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, *(_QWORD *)(a1 + 48));

}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 mapItemStorage:(id)a5 customLabel:(id)a6 reply:(id)a7
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, id);
  RTMapServiceManager *mapServiceManager;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  void (**v33)(id, _QWORD, id);
  SEL v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  const __CFString *v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, id))a7;
  if (v16)
  {
    if (v14)
    {
      v30 = v13;
      mapServiceManager = self->_mapServiceManager;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      -[RTMapServiceManager mapItemWithIdentifier:geoMapItem:source:creationDate:error:](mapServiceManager, "mapItemWithIdentifier:geoMapItem:source:creationDate:error:", v18, v14, 8, v19, &v36);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v36;

      if (v21)
      {
        _rt_log_facility_get_os_log(RTLogFacilityClient);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v21;
          _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        v16[2](v16, 0, v21);
        v13 = v30;
      }
      else if (v20)
      {
        v26 = +[RTLearnedPlace placeTypeFromType:](RTLearnedPlace, "placeTypeFromType:", a4);
        learnedLocationManager = self->_learnedLocationManager;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __95__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_mapItemStorage_customLabel_reply___block_invoke;
        v31[3] = &unk_1E9298460;
        v31[4] = self;
        v34 = a2;
        v35 = v26;
        v32 = v15;
        v33 = v16;
        v13 = v30;
        -[RTLearnedLocationManager updateLocationOfInterestWithIdentifier:type:mapItem:mapItemSource:customLabel:handler:](learnedLocationManager, "updateLocationOfInterestWithIdentifier:type:mapItem:mapItemSource:customLabel:handler:", v30, v26, v20, 8, v32, v31);

      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityClient);
        v28 = objc_claimAutoreleasedReturnValue();
        v13 = v30;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "map item was nil, invalid parameter", buf, 2u);
        }

        v37 = *MEMORY[0x1E0CB2D50];
        v38 = CFSTR("Map item must be non-nil.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, 0, v29);

      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0D18598];
      v41 = *MEMORY[0x1E0CB2D50];
      v42[0] = CFSTR("requires a valid mapItem.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 0, v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, 0, v25);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __95__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_mapItemStorage_customLabel_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_mapItemStorage_customLabel_reply___block_invoke_2;
  block[3] = &unk_1E9298438;
  v8 = *(_QWORD *)(a1 + 64);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = v8;
  v14 = v5;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v16 = v10;
  v17 = v6;
  v18 = *(id *)(a1 + 48);
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

void __95__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_mapItemStorage_customLabel_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", *(_QWORD *)(a1 + 80));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v11 = 138413570;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, updated location of interest, %@, type, %@, customLabel, %@, reply to client, %@, error, %@", (uint8_t *)&v11, 0x3Eu);

  }
  v9 = *(_QWORD *)(a1 + 64);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithLearnedLocationOfInterest:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, *(_QWORD *)(a1 + 56));

}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 mapItemStorage:(id)a4 reply:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, id);
  RTMapServiceManager *mapServiceManager;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  void (**v23)(id, id);
  SEL v24;
  id v25;
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, id))a5;
  if (v11)
  {
    if (v10)
    {
      mapServiceManager = self->_mapServiceManager;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      -[RTMapServiceManager mapItemWithIdentifier:geoMapItem:source:creationDate:error:](mapServiceManager, "mapItemWithIdentifier:geoMapItem:source:creationDate:error:", v13, v10, 8, v14, &v25);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v25;

      if (v16)
      {
        _rt_log_facility_get_os_log(RTLogFacilityClient);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v16;
          _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        v11[2](v11, v16);
        goto LABEL_14;
      }
      if (v15)
      {
        learnedLocationManager = self->_learnedLocationManager;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __78__RTDaemonClient_updateLocationOfInterestWithIdentifier_mapItemStorage_reply___block_invoke;
        v21[3] = &unk_1E9298178;
        v21[4] = self;
        v24 = a2;
        v22 = v9;
        v23 = v11;
        -[RTLearnedLocationManager updateLocationOfInterestWithIdentifier:mapItem:mapItemSource:handler:](learnedLocationManager, "updateLocationOfInterestWithIdentifier:mapItem:mapItemSource:handler:", v22, v15, 8, v21);

        goto LABEL_14;
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "map item was nil, invalid parameter", buf, 2u);
    }

    v26 = *MEMORY[0x1E0CB2D50];
    v27 = CFSTR("Map item must be non-nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v20);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
LABEL_14:

}

void __78__RTDaemonClient_updateLocationOfInterestWithIdentifier_mapItemStorage_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__RTDaemonClient_updateLocationOfInterestWithIdentifier_mapItemStorage_reply___block_invoke_2;
  block[3] = &unk_1E9297910;
  v14 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v12 = v4;
  v13 = *(id *)(a1 + 48);
  v8 = v4;
  dispatch_async(v5, block);

}

uint64_t __78__RTDaemonClient_updateLocationOfInterestWithIdentifier_mapItemStorage_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 138413058;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, updated mapItem of location of interest, %@, reply to client, %@, error, %@", (uint8_t *)&v8, 0x2Au);

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 reply:(id)a5
{
  id v9;
  id v10;
  unint64_t v11;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  SEL v17;
  unint64_t v18;
  uint8_t buf[16];

  v9 = a3;
  v10 = a5;
  if (v10)
  {
    v11 = +[RTLearnedPlace placeTypeFromType:](RTLearnedPlace, "placeTypeFromType:", a4);
    learnedLocationManager = self->_learnedLocationManager;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_reply___block_invoke;
    v14[3] = &unk_1E9298460;
    v14[4] = self;
    v17 = a2;
    v15 = v9;
    v18 = v11;
    v16 = v10;
    -[RTLearnedLocationManager updateLocationOfInterestWithIdentifier:type:handler:](learnedLocationManager, "updateLocationOfInterestWithIdentifier:type:handler:", v15, v11, v14);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __68__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_reply___block_invoke_2;
  v10[3] = &unk_1E9297E20;
  v15 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v8;
  v16 = v7;
  v13 = v4;
  v14 = *(id *)(a1 + 48);
  v9 = v4;
  dispatch_async(v5, v10);

}

uint64_t __68__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", *(_QWORD *)(a1 + 72));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138413314;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, updated location of interest, %@, type, %@, reply to client, %@, error, %@", (uint8_t *)&v9, 0x34u);

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(int64_t)a4 customLabel:(id)a5 reply:(id)a6
{
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  SEL v21;
  unint64_t v22;
  uint8_t buf[16];

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    v14 = +[RTLearnedPlace placeTypeFromType:](RTLearnedPlace, "placeTypeFromType:", a4);
    learnedLocationManager = self->_learnedLocationManager;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __80__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_customLabel_reply___block_invoke;
    v17[3] = &unk_1E9298488;
    v17[4] = self;
    v21 = a2;
    v18 = v11;
    v22 = v14;
    v19 = v12;
    v20 = v13;
    -[RTLearnedLocationManager updateLocationOfInterestWithIdentifier:type:customLabel:handler:](learnedLocationManager, "updateLocationOfInterestWithIdentifier:type:customLabel:handler:", v18, v14, v19, v17);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __80__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_customLabel_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_customLabel_reply___block_invoke_2;
  block[3] = &unk_1E9298438;
  v17 = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 72);
  v12 = v6;
  v18 = v7;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v8;
  v14 = v9;
  v15 = v4;
  v16 = *(id *)(a1 + 56);
  v10 = v4;
  dispatch_async(v5, block);

}

uint64_t __80__RTDaemonClient_updateLocationOfInterestWithIdentifier_type_customLabel_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", *(_QWORD *)(a1 + 80));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v10 = 138413570;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, updated location of interest, %@, type, %@, customLabel, %@, reply to client, %@, error, %@", (uint8_t *)&v10, 0x3Eu);

  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 56));
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 customLabel:(id)a4 reply:(id)a5
{
  id v9;
  id v10;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  uint8_t buf[16];

  v9 = a3;
  v10 = a5;
  if (v10)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __75__RTDaemonClient_updateLocationOfInterestWithIdentifier_customLabel_reply___block_invoke;
    v13[3] = &unk_1E9298178;
    v13[4] = self;
    v16 = a2;
    v14 = v9;
    v15 = v10;
    -[RTLearnedLocationManager updateLocationOfInterestWithIdentifier:customLabel:handler:](learnedLocationManager, "updateLocationOfInterestWithIdentifier:customLabel:handler:", v14, a4, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __75__RTDaemonClient_updateLocationOfInterestWithIdentifier_customLabel_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__RTDaemonClient_updateLocationOfInterestWithIdentifier_customLabel_reply___block_invoke_2;
  block[3] = &unk_1E9297910;
  v14 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v12 = v4;
  v13 = *(id *)(a1 + 48);
  v8 = v4;
  dispatch_async(v5, block);

}

uint64_t __75__RTDaemonClient_updateLocationOfInterestWithIdentifier_customLabel_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 138413058;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, updated customLabel of location of interest, %@, reply to client, %@, error, %@", (uint8_t *)&v8, 0x2Au);

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)removeLocationOfInterestWithIdentifier:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__RTDaemonClient_removeLocationOfInterestWithIdentifier_reply___block_invoke;
    v11[3] = &unk_1E92984B0;
    v11[4] = self;
    v14 = a2;
    v12 = v7;
    v13 = v8;
    -[RTLearnedLocationManager removeLocationOfInterestWithIdentifier:handler:](learnedLocationManager, "removeLocationOfInterestWithIdentifier:handler:", v12, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __63__RTDaemonClient_removeLocationOfInterestWithIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__RTDaemonClient_removeLocationOfInterestWithIdentifier_reply___block_invoke_2;
  block[3] = &unk_1E9297910;
  v13 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v11 = v3;
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v4, block);

}

uint64_t __63__RTDaemonClient_removeLocationOfInterestWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 138413058;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, remove location of interest, %@, reply to client, %@, error, %@", (uint8_t *)&v8, 0x2Au);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)removeVisitWithIdentifier:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  RTDaemonClient *v16;
  id v17;
  uint8_t *v18;
  SEL v19;
  _QWORD v20[5];
  id v21;
  NSObject *v22;
  uint8_t *v23;
  SEL v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = dispatch_group_create();
    v10 = v9;
    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__9;
    v29 = __Block_byref_object_dispose__9;
    v30 = 0;
    v11 = MEMORY[0x1E0C809B0];
    if (self->_learnedLocationManager)
    {
      dispatch_group_enter(v9);
      learnedLocationManager = self->_learnedLocationManager;
      v20[0] = v11;
      v20[1] = 3221225472;
      v20[2] = __50__RTDaemonClient_removeVisitWithIdentifier_reply___block_invoke;
      v20[3] = &unk_1E9298500;
      v20[4] = self;
      v24 = a2;
      v21 = v7;
      v23 = buf;
      v22 = v10;
      -[RTLearnedLocationManager removeVisitWithIdentifier:handler:](learnedLocationManager, "removeVisitWithIdentifier:handler:", v21, v20);

    }
    -[RTDaemonClient queue](self, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __50__RTDaemonClient_removeVisitWithIdentifier_reply___block_invoke_447;
    v14[3] = &unk_1E9298528;
    v18 = buf;
    v19 = a2;
    v15 = v7;
    v16 = self;
    v17 = v8;
    dispatch_group_notify(v10, v13, v14);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __50__RTDaemonClient_removeVisitWithIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  id v10;
  __int128 v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RTDaemonClient_removeVisitWithIdentifier_reply___block_invoke_2;
  block[3] = &unk_1E92984D8;
  v12 = *(_QWORD *)(a1 + 64);
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v7 = *(_OWORD *)(a1 + 48);
  v5 = (id)v7;
  v11 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

void __50__RTDaemonClient_removeVisitWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v6 = 138412802;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, remove location of interest visit, %@, error, %@", (uint8_t *)&v6, 0x20u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __50__RTDaemonClient_removeVisitWithIdentifier_reply___block_invoke_447(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138413058;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, remove location of interest visit, %@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)extendLifetimeOfVisitsWithIdentifiers:(id)a3 reply:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  if (a4)
  {
    -[RTLearnedLocationManager extendLifetimeOfVisitsWithIdentifiers:handler:](self->_learnedLocationManager, "extendLifetimeOfVisitsWithIdentifiers:handler:", a3);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v5, 2u);
    }

  }
}

- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  RTDaemonClient *v13;
  id v14;
  SEL v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__RTDaemonClient_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_reply___block_invoke;
    v11[3] = &unk_1E9298550;
    v15 = a2;
    v12 = v7;
    v13 = self;
    v14 = v8;
    -[RTLearnedLocationManager fetchDedupedLocationOfInterestIdentifiersWithIdentifier:handler:](learnedLocationManager, "fetchDedupedLocationOfInterestIdentifiersWithIdentifier:handler:", v12, v11);

    v10 = v12;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __80__RTDaemonClient_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138413314;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, loi identifier, %@, deduped from other loi identifiers, %@, reply to client, %@, error, %@", (uint8_t *)&v11, 0x34u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4 feedback:(id)a5 geoMapItem:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, id);
  RTMapServiceManager *mapServiceManager;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, id))a7;
  if (v15)
  {
    if (v14)
    {
      mapServiceManager = self->_mapServiceManager;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      -[RTMapServiceManager mapItemWithIdentifier:geoMapItem:source:creationDate:error:](mapServiceManager, "mapItemWithIdentifier:geoMapItem:source:creationDate:error:", v17, v14, 8, v18, &v24);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v24;

      if (v20)
      {
        _rt_log_facility_get_os_log(RTLogFacilityClient);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v20;
          _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        v15[2](v15, v20);
        goto LABEL_14;
      }
      if (v19)
      {
        -[RTEventModelProvider userInteractionWithPredictedLocationOfInterest:interaction:feedback:mapItem:handler:](self->_eventModelProvider, "userInteractionWithPredictedLocationOfInterest:interaction:feedback:mapItem:handler:", v12, a4, v13, v19, v15);
        goto LABEL_14;
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "map item was nil, invalid parameter", buf, 2u);
    }

    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("Map item must be non-nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v23);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
LABEL_14:

}

- (void)fetchRemoteStatusWithReply:(id)a3
{
  id v5;
  void *v6;
  RTIntermittentGNSSManager *intermittentGNSSManager;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    intermittentGNSSManager = self->_intermittentGNSSManager;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__RTDaemonClient_fetchRemoteStatusWithReply___block_invoke;
    v9[3] = &unk_1E9298578;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    -[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:](intermittentGNSSManager, "fetchRemoteStatusWithHandler:", v9);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __45__RTDaemonClient_fetchRemoteStatusWithReply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138413058;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2048;
    v14 = a2;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, reply to client, %@, remote status, %ld, error, %@", (uint8_t *)&v9, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchLookbackWindowStartDateWithLocation:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  RTSensitiveDateClassifier *v19;
  void *v20;
  SEL v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v19 = [RTSensitiveDateClassifier alloc];
    -[RTDaemonClient defaultsManager](self, "defaultsManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDaemonClient healthKitManager](self, "healthKitManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDaemonClient learnedLocationStore](self, "learnedLocationStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDaemonClient locationManager](self, "locationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDaemonClient motionActivityManager](self, "motionActivityManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDaemonClient timerManager](self, "timerManager");
    v21 = a2;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDaemonClient vehicleLocationProvider](self, "vehicleLocationProvider");
    v20 = v8;
    v14 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDaemonClient wifiManager](self, "wifiManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[RTSensitiveDateClassifier initWithDefaultsManager:healthKitManager:learnedLocationStore:locationManager:motionActivityManager:timerManager:vehicleLocationProvider:wifiManager:](v19, "initWithDefaultsManager:healthKitManager:learnedLocationStore:locationManager:motionActivityManager:timerManager:vehicleLocationProvider:wifiManager:", v18, v9, v10, v11, v12, v13, v15, v16);

    v7 = v14;
    v8 = v20;

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __65__RTDaemonClient_fetchLookbackWindowStartDateWithLocation_reply___block_invoke;
    v22[3] = &unk_1E92985A0;
    v22[4] = self;
    v24 = v21;
    v23 = v20;
    -[NSObject fetchLookbackWindowStartDateWithLocation:handler:](v17, "fetchLookbackWindowStartDateWithLocation:handler:", v7, v22);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __65__RTDaemonClient_fetchLookbackWindowStartDateWithLocation_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__RTDaemonClient_fetchLookbackWindowStartDateWithLocation_reply___block_invoke_2;
  block[3] = &unk_1E9297910;
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __65__RTDaemonClient_fetchLookbackWindowStartDateWithLocation_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 138413058;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, lookback window start date %@, error, %@", (uint8_t *)&v8, 0x2Au);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchStoredLocationsWithContext:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  RTLocationManager *locationManager;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    locationManager = self->_locationManager;
    if (locationManager)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __56__RTDaemonClient_fetchStoredLocationsWithContext_reply___block_invoke;
      v12[3] = &unk_1E9298550;
      v12[4] = self;
      v15 = a2;
      v13 = v7;
      v14 = v8;
      -[RTLocationManager fetchStoredLocationsWithContext:handler:](locationManager, "fetchStoredLocationsWithContext:handler:", v13, v12);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityClient);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "LocationManager is nil, returning", buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], 0);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __56__RTDaemonClient_fetchStoredLocationsWithContext_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__RTDaemonClient_fetchStoredLocationsWithContext_reply___block_invoke_2;
  v11[3] = &unk_1E9298128;
  v16 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v8;
  v14 = v6;
  v15 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __56__RTDaemonClient_fetchStoredLocationsWithContext_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = objc_msgSend(*(id *)(a1 + 40), "count");
    objc_msgSend(*(id *)(a1 + 48), "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 56);
    v9 = 138413314;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2048;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, %lu location options %@, error, %@", (uint8_t *)&v9, 0x34u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 reply:(id)a5
{
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  RTLocationManager *locationManager;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  SEL v19;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: date";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_8;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: reply";
    goto LABEL_14;
  }
  locationManager = self->_locationManager;
  if (locationManager)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__RTDaemonClient_fetchEstimatedLocationAtDate_options_reply___block_invoke;
    v17[3] = &unk_1E92985C8;
    v17[4] = self;
    v19 = a2;
    v18 = v11;
    -[RTLocationManager fetchEstimatedLocationAtDate:options:handler:](locationManager, "fetchEstimatedLocationAtDate:options:handler:", v9, v10, v17);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "LocationManager is nil, returning", buf, 2u);
    }

    v12[2](v12, 0, 0);
  }
LABEL_9:

}

void __61__RTDaemonClient_fetchEstimatedLocationAtDate_options_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__RTDaemonClient_fetchEstimatedLocationAtDate_options_reply___block_invoke_2;
  block[3] = &unk_1E9297910;
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __61__RTDaemonClient_fetchEstimatedLocationAtDate_options_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 138413058;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, location, %@, error, %@", (uint8_t *)&v8, 0x2Au);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchTripSegmentsWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTDaemonClient tripSegmentManager](self, "tripSegmentManager");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject fetchTripSegmentsWithOptions:handler:](v8, "fetchTripSegmentsWithOptions:handler:", v6, v7);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v9, 2u);
    }
  }

}

- (void)fetchLocationsCountForTripSegmentWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTDaemonClient tripSegmentManager](self, "tripSegmentManager");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject fetchLocationsCountForTripSegmentWithOptions:handler:](v8, "fetchLocationsCountForTripSegmentWithOptions:handler:", v6, v7);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v9, 2u);
    }
  }

}

- (void)fetchLocationsForTripSegmentWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTDaemonClient tripSegmentManager](self, "tripSegmentManager");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject fetchLocationsForTripSegmentWithOptions:handler:](v8, "fetchLocationsForTripSegmentWithOptions:handler:", v6, v7);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v9, 2u);
    }
  }

}

- (void)deleteTripSegmentWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTDaemonClient tripSegmentManager](self, "tripSegmentManager");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject deleteTripSegmentWithUUID:handler:](v8, "deleteTripSegmentWithUUID:handler:", v6, v7);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v9, 2u);
    }
  }

}

- (void)fetchVehiclesWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTDaemonClient vehicleStore](self, "vehicleStore");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject fetchVehiclesWithOptions:handler:](v8, "fetchVehiclesWithOptions:handler:", v6, v7);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v9, 2u);
    }
  }

}

- (void)fetchTripSegmentMetadataWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[RTDaemonClient tripSegmentManager](self, "tripSegmentManager");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject fetchTripSegmentMetadataWithOptions:handler:](v8, "fetchTripSegmentMetadataWithOptions:handler:", v6, v7);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v9, 2u);
    }
  }

}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  objc_class *v12;
  NSMutableDictionary *vendedClassesStoreManagerDict;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString **v21;
  uint64_t *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint8_t buf[8];
  uint64_t v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        v11 = objc_msgSend(v9, "unsignedIntegerValue");
        v12 = (objc_class *)objc_msgSend(v8, "enumeratedType");
        vendedClassesStoreManagerDict = self->_vendedClassesStoreManagerDict;
        NSStringFromClass(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](vendedClassesStoreManagerDict, "objectForKey:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "vendedClasses");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "member:", v12);

        if (v17)
        {
          -[NSObject fetchEnumerableObjectsWithOptions:offset:handler:](v15, "fetchEnumerableObjectsWithOptions:offset:handler:", v8, v11, v10);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no store supports the type expected by options, %@"), v8);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v26 = *MEMORY[0x1E0D18598];
          v30 = *MEMORY[0x1E0CB2D50];
          v31 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 7, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v28);
        }
        goto LABEL_11;
      }
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0D18598];
      v32 = *MEMORY[0x1E0CB2D50];
      v33 = CFSTR("offset cannot be nil");
      v20 = (void *)MEMORY[0x1E0C99D80];
      v21 = &v33;
      v22 = &v32;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0D18598];
      v34 = *MEMORY[0x1E0CB2D50];
      v35[0] = CFSTR("options cannot be nil");
      v20 = (void *)MEMORY[0x1E0C99D80];
      v21 = (const __CFString **)v35;
      v22 = &v34;
    }
    objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 7, v23);
    v15 = objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, NSObject *))v10 + 2))(v10, 0, 0, v15);
    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
  }
LABEL_11:

}

- (void)fetchFamiliarityIndexResultsWithOptions:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  SEL v18;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: options";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_8;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: reply";
    goto LABEL_14;
  }
  if (self->_learnedLocationManager)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    learnedLocationManager = self->_learnedLocationManager;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__RTDaemonClient_fetchFamiliarityIndexResultsWithOptions_reply___block_invoke;
    v15[3] = &unk_1E9298550;
    v18 = a2;
    v15[4] = self;
    v16 = v10;
    v17 = v9;
    v12 = v10;
    -[RTLearnedLocationManager fetchFamiliarityIndexResultsWithOptions:handler:](learnedLocationManager, "fetchFamiliarityIndexResultsWithOptions:handler:", v7, v15);

LABEL_8:
    goto LABEL_9;
  }
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "LearnedLocationManager is nil, returning", buf, 2u);
  }

  v9[2](v9, 0, 0);
LABEL_9:

}

void __64__RTDaemonClient_fetchFamiliarityIndexResultsWithOptions_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__RTDaemonClient_fetchFamiliarityIndexResultsWithOptions_reply___block_invoke_2;
  v12[3] = &unk_1E9298128;
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v17 = v8;
  v14 = v6;
  v15 = v9;
  v16 = *(id *)(a1 + 48);
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

uint64_t __64__RTDaemonClient_fetchFamiliarityIndexResultsWithOptions_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v10 = 138413314;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2048;
    v19 = v8;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, familiarityIndexResults, %@, error, %@, latency, %.2f", (uint8_t *)&v10, 0x34u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)fetchAuthorizedLocationStatus:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  RTAuthorizedLocationManager *authorizedLocationManager;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTDaemonClient fetchAuthorizedLocationStatus:]";
      v17 = 1024;
      v18 = 2960;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply (in %s:%d)", buf, 0x12u);
    }

  }
  if (self->_authorizedLocationManager)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    authorizedLocationManager = self->_authorizedLocationManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__RTDaemonClient_fetchAuthorizedLocationStatus___block_invoke;
    v11[3] = &unk_1E92985F0;
    v14 = a2;
    v11[4] = self;
    v12 = v7;
    v13 = v5;
    v9 = v7;
    -[RTAuthorizedLocationManager fetchAuthorizedLocationExtendedStatus:](authorizedLocationManager, "fetchAuthorizedLocationExtendedStatus:", v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "AuthorizedLocationManager is nil, returning", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
  }

}

void __48__RTDaemonClient_fetchAuthorizedLocationStatus___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__RTDaemonClient_fetchAuthorizedLocationStatus___block_invoke_2;
  v13[3] = &unk_1E9298128;
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v6;
  v18 = v9;
  v15 = v7;
  v16 = v10;
  v17 = *(id *)(a1 + 48);
  v11 = v7;
  v12 = v6;
  dispatch_async(v8, v13);

}

uint64_t __48__RTDaemonClient_fetchAuthorizedLocationStatus___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v10 = 138413314;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2048;
    v19 = v8;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, fetchAuthorizedLocationStatus, %@, error, %@, latency, %.2f", (uint8_t *)&v10, 0x34u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)peopleDiscoveryRegistrar:(id)a3 didReceivePeopleDensityUpdate:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[RTDaemonClient queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__RTDaemonClient_peopleDiscoveryRegistrar_didReceivePeopleDensityUpdate_error___block_invoke;
  block[3] = &unk_1E92978E8;
  block[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v9;
  v20 = a2;
  v13 = v9;
  v14 = v11;
  v15 = v10;
  dispatch_async(v12, block);

}

void __79__RTDaemonClient_peopleDiscoveryRegistrar_didReceivePeopleDensityUpdate_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "launchClient");
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(a1 + 40), "count");
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "sending people density events, count %lu, to client, %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "onDensityUpdate:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    if (v4)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = objc_msgSend(*(id *)(a1 + 40), "count");
      *(_DWORD *)buf = 138412546;
      v22 = v9;
      v23 = 2048;
      v24 = v10;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "client, %@, not connected. buffering people density events, count %lu", buf, 0x16u);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "peopleDiscoveryRegistrar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __79__RTDaemonClient_peopleDiscoveryRegistrar_didReceivePeopleDensityUpdate_error___block_invoke_458;
    v16[3] = &unk_1E92983C0;
    objc_copyWeak(&v20, (id *)buf);
    v17 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 40);
    v19 = *(id *)(a1 + 48);
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __79__RTDaemonClient_peopleDiscoveryRegistrar_didReceivePeopleDensityUpdate_error___block_invoke_2;
    v14[3] = &unk_1E92983E8;
    objc_copyWeak(&v15, (id *)buf);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addPendingPeopleDensityUpdateBlock:failBlock:description:", v16, v14, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

void __79__RTDaemonClient_peopleDiscoveryRegistrar_didReceivePeopleDensityUpdate_error___block_invoke_458(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "peopleDiscoveryRegistrar:didReceivePeopleDensityUpdate:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __79__RTDaemonClient_peopleDiscoveryRegistrar_didReceivePeopleDensityUpdate_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D18598];
  v13 = *MEMORY[0x1E0CB2D50];
  v14[0] = CFSTR("Buffered people density events failed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "onDensityUpdate:error:", 0, v5);

}

- (void)startMonitoringForPeopleDiscovery:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "rdar122420473 identifier %@, configuration %@", (uint8_t *)&v15, 0x16u);
    }

    -[RTDaemonClientRegistrarPeopleDiscovery startMonitoringForPeopleDiscoveryWithIdentifier:configuration:](self->_peopleDiscoveryRegistrar, "startMonitoringForPeopleDiscoveryWithIdentifier:configuration:", v8, v9);
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_peopleDiscoveryRegistrar, 1, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    -[RTDaemonClient restorationData](self, "restorationData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("peopleDiscoveryRegistrar"));

    -[RTDaemonClient clientManagerDelegate](self, "clientManagerDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "saveDaemonClient:", self);

    v10[2](v10, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", (uint8_t *)&v15, 2u);
    }
  }

}

- (void)stopMonitoringForPeopleDiscoveryWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[RTDaemonClientRegistrarPeopleDiscovery stopMonitoringForPeopleDiscovery](self->_peopleDiscoveryRegistrar, "stopMonitoringForPeopleDiscovery");
    -[RTDaemonClient restorationData](self, "restorationData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("peopleDiscoveryRegistrar"));

    -[RTDaemonClient clientManagerDelegate](self, "clientManagerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "saveDaemonClient:", self);

    v4[2](v4, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v8, 2u);
    }

  }
}

- (void)fetchProximityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, NSObject *);
  BOOL v12;
  NSObject *v13;
  _BOOL4 v14;
  RTPeopleDiscoveryProvider *peopleDiscoveryProvider;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  void (**v22)(id, _QWORD, NSObject *);
  SEL v23;
  uint8_t buf[8];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, NSObject *))a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: startDate";
LABEL_11:
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: endDate";
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  v12 = -[RTPeopleDiscoveryProvider isProximityEventsEnabled](self->_peopleDiscoveryProvider, "isProximityEventsEnabled");
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "people discovery feature is not enabled", buf, 2u);
    }

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D18598];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("feature disabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 13, v20);
    v16 = objc_claimAutoreleasedReturnValue();

    v11[2](v11, MEMORY[0x1E0C9AA60], v16);
    goto LABEL_15;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "fetchProximityHistoryFromStartDate:endDate:completionHandler:", buf, 2u);
  }

  peopleDiscoveryProvider = self->_peopleDiscoveryProvider;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __79__RTDaemonClient_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke;
  v21[3] = &unk_1E9297E70;
  v21[4] = self;
  v23 = a2;
  v22 = v11;
  -[RTPeopleDiscoveryProvider fetchProximityHistoryFromStartDate:endDate:completionHandler:](peopleDiscoveryProvider, "fetchProximityHistoryFromStartDate:endDate:completionHandler:", v9, v10, v21);

LABEL_16:
}

void __79__RTDaemonClient_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__RTDaemonClient_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke_2;
  block[3] = &unk_1E9297910;
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __79__RTDaemonClient_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = objc_msgSend(*(id *)(a1 + 40), "count");
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 138413058;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2048;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, fetchProximityHistoryFromStartDate, %lu, error, %@", (uint8_t *)&v8, 0x2Au);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchProximityHistoryFromEventIDs:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, NSObject *);
  BOOL v9;
  NSObject *v10;
  _BOOL4 v11;
  RTPeopleDiscoveryProvider *peopleDiscoveryProvider;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(id, _QWORD, NSObject *);
  SEL v19;
  uint8_t buf[8];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, NSObject *))a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventIDs", buf, 2u);
    }
    goto LABEL_11;
  }
  v9 = -[RTPeopleDiscoveryProvider isProximityEventsEnabled](self->_peopleDiscoveryProvider, "isProximityEventsEnabled");
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "people discovery feature is not enabled", buf, 2u);
    }

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D18598];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = CFSTR("feature disabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 13, v16);
    v13 = objc_claimAutoreleasedReturnValue();

    v8[2](v8, MEMORY[0x1E0C9AA60], v13);
LABEL_11:

    goto LABEL_12;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "fetchProximityHistoryFromEventIDs:completionHandler:", buf, 2u);
  }

  peopleDiscoveryProvider = self->_peopleDiscoveryProvider;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__RTDaemonClient_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke;
  v17[3] = &unk_1E9297E70;
  v17[4] = self;
  v19 = a2;
  v18 = v8;
  -[RTPeopleDiscoveryProvider fetchProximityHistoryFromEventIDs:completionHandler:](peopleDiscoveryProvider, "fetchProximityHistoryFromEventIDs:completionHandler:", v7, v17);

LABEL_12:
}

void __70__RTDaemonClient_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__RTDaemonClient_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke_2;
  block[3] = &unk_1E9297910;
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __70__RTDaemonClient_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = objc_msgSend(*(id *)(a1 + 40), "count");
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 138413058;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2048;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, fetchProximityHistoryFromEventIDs, %lu, error, %@", (uint8_t *)&v8, 0x2Au);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchPeopleCountEventsHistory:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD, NSObject *);
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[8];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, NSObject *))a4;
  if (a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "fetchPeopleCountEventsHistory SPI deprecated", v11, 2u);
    }

    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D18598];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("SPI deprecated");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 10, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v5[2](v5, MEMORY[0x1E0C9AA60], v10);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: proximityEvents", v11, 2u);
    }
  }

}

- (void)fetchOngoingPeopleDensity:(id)a3
{
  id v5;
  BOOL v6;
  NSObject *v7;
  _BOOL4 v8;
  RTPeopleDiscoveryProvider *peopleDiscoveryProvider;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  uint8_t buf[8];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[RTPeopleDiscoveryProvider isPeopleDensityEventsEnabled](self->_peopleDiscoveryProvider, "isPeopleDensityEventsEnabled");
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "RTDaemonClient fetchOngoingPeopleDensity", buf, 2u);
    }

    peopleDiscoveryProvider = self->_peopleDiscoveryProvider;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__RTDaemonClient_fetchOngoingPeopleDensity___block_invoke;
    v14[3] = &unk_1E9298618;
    v14[4] = self;
    v16 = a2;
    v15 = v5;
    -[RTPeopleDiscoveryProvider fetchMostRecentPeopleDensity:](peopleDiscoveryProvider, "fetchMostRecentPeopleDensity:", v14);

  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "people discovery feature is not enabled", buf, 2u);
    }

    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D18598];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("feature disabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 13, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v13);
  }

}

void __44__RTDaemonClient_fetchOngoingPeopleDensity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__RTDaemonClient_fetchOngoingPeopleDensity___block_invoke_2;
  block[3] = &unk_1E9297910;
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __44__RTDaemonClient_fetchOngoingPeopleDensity___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 138413058;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, fetchMostRecentPeopleDensity, %@, error, %@", (uint8_t *)&v8, 0x2Au);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchPeopleDensityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, NSObject *);
  BOOL v12;
  NSObject *v13;
  _BOOL4 v14;
  RTPeopleDiscoveryProvider *peopleDiscoveryProvider;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  void (**v22)(id, _QWORD, NSObject *);
  SEL v23;
  uint8_t buf[8];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, NSObject *))a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: startDate";
LABEL_11:
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: endDate";
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  v12 = -[RTPeopleDiscoveryProvider isPeopleDensityEventsEnabled](self->_peopleDiscoveryProvider, "isPeopleDensityEventsEnabled");
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "people discovery feature is not enabled", buf, 2u);
    }

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D18598];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("feature disabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 13, v20);
    v16 = objc_claimAutoreleasedReturnValue();

    v11[2](v11, MEMORY[0x1E0C9AA60], v16);
    goto LABEL_15;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:", buf, 2u);
  }

  peopleDiscoveryProvider = self->_peopleDiscoveryProvider;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __83__RTDaemonClient_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke;
  v21[3] = &unk_1E9297E70;
  v21[4] = self;
  v23 = a2;
  v22 = v11;
  -[RTPeopleDiscoveryProvider fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:](peopleDiscoveryProvider, "fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:", v9, v10, v21);

LABEL_16:
}

void __83__RTDaemonClient_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__RTDaemonClient_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke_2;
  block[3] = &unk_1E9297910;
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __83__RTDaemonClient_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = objc_msgSend(*(id *)(a1 + 40), "count");
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 138413058;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2048;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, fetchPeopleDensityHistoryFromStartDate, %lu, error, %@", (uint8_t *)&v8, 0x2Au);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchContactScoresFromContactIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, NSObject *);
  BOOL v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString **v14;
  uint64_t *v15;
  NSObject *v16;
  void *v17;
  uint8_t v18[8];
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, NSObject *))a4;
  if (v6)
  {
    v8 = -[RTPeopleDiscoveryProvider isProximityEventsEnabled](self->_peopleDiscoveryProvider, "isProximityEventsEnabled");
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "per-contact score feature is not enabled", v18, 2u);
      }

      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D18598];
      v19 = *MEMORY[0x1E0CB2D50];
      v20 = CFSTR("feature disabled");
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v20;
      v15 = &v19;
    }
    else
    {
      if (v10)
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "people discovery feature is not enabled", v18, 2u);
      }

      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D18598];
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("feature disabled");
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = (const __CFString **)v22;
      v15 = &v21;
    }
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 13, v17);
    v16 = objc_claimAutoreleasedReturnValue();

    v7[2](v7, MEMORY[0x1E0C9AA60], v16);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactIDs", v18, 2u);
    }
  }

}

- (void)fetchFormattedPostalAddressesFromMeCard:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[RTContactsManager fetchFormattedPostalAddressesFromMeCard:](self->_contactsManager, "fetchFormattedPostalAddressesFromMeCard:");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v4, 2u);
    }

  }
}

- (void)addElevations:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v13 = 0;
    v10 = "Invalid parameter not satisfying: elevations";
    v11 = (uint8_t *)&v13;
LABEL_9:
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    goto LABEL_7;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v12 = 0;
    v10 = "Invalid parameter not satisfying: handler";
    v11 = (uint8_t *)&v12;
    goto LABEL_9;
  }
  -[RTDaemonClient elevationManager](self, "elevationManager");
  v9 = objc_claimAutoreleasedReturnValue();
  -[NSObject addElevations:handler:](v9, "addElevations:handler:", v6, v8);
LABEL_7:

}

- (void)fetchElevationsWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v13 = 0;
    v10 = "Invalid parameter not satisfying: options";
    v11 = (uint8_t *)&v13;
LABEL_9:
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    goto LABEL_7;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v12 = 0;
    v10 = "Invalid parameter not satisfying: reply";
    v11 = (uint8_t *)&v12;
    goto LABEL_9;
  }
  -[RTDaemonClient elevationManager](self, "elevationManager");
  v9 = objc_claimAutoreleasedReturnValue();
  -[NSObject fetchElevationsWithOptions:handler:](v9, "fetchElevationsWithOptions:handler:", v6, v8);
LABEL_7:

}

- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(v16) = 0;
    v15 = "Invalid parameter not satisfying: options";
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(v16) = 0;
    v15 = "Invalid parameter not satisfying: reply";
    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@,%@ invoked", (uint8_t *)&v16, 0x16u);

  }
  -[RTDaemonClient backgroundInertialOdometryManager](self, "backgroundInertialOdometryManager");
  v14 = objc_claimAutoreleasedReturnValue();
  -[NSObject fetchBackgroundInertialOdometrySamplesWithOptions:handler:](v14, "fetchBackgroundInertialOdometrySamplesWithOptions:handler:", v7, v9);
LABEL_9:

}

- (void)addBackgroundInertialOdometrySamples:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(v16) = 0;
    v15 = "Invalid parameter not satisfying: samples";
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(v16) = 0;
    v15 = "Invalid parameter not satisfying: reply";
    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412803;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    v20 = 1025;
    v21 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@,%@ invoked with %{private}d samples", (uint8_t *)&v16, 0x1Cu);

  }
  -[RTDaemonClient backgroundInertialOdometryManager](self, "backgroundInertialOdometryManager");
  v14 = objc_claimAutoreleasedReturnValue();
  -[NSObject addBackgroundInertialOdometrySamples:handler:](v14, "addBackgroundInertialOdometrySamples:handler:", v7, v9);
LABEL_9:

}

- (NSString)restorationIdentifier
{
  return self->_restorationIdentifier;
}

- (RTClientListenerProtocol)clientManagerDelegate
{
  return (RTClientListenerProtocol *)objc_loadWeakRetained((id *)&self->_clientManagerDelegate);
}

- (void)setRestorationData:(id)a3
{
  objc_storeStrong((id *)&self->_restorationData, a3);
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (BOOL)monitorVisits
{
  return self->_monitorVisits;
}

- (BOOL)leechVisits
{
  return self->_leechVisits;
}

- (BOOL)leechLowConfidenceVisits
{
  return self->_leechLowConfidenceVisits;
}

- (BOOL)monitorPlaceInferences
{
  return self->_monitorPlaceInferences;
}

- (RTPlaceInferenceOptions)placeInferenceOptions
{
  return self->_placeInferenceOptions;
}

- (void)setPlaceInferenceOptions:(id)a3
{
  objc_storeStrong((id *)&self->_placeInferenceOptions, a3);
}

- (RTEntitlementProvider)entitlementProvider
{
  return self->_entitlementProvider;
}

- (void)setEntitlementProvider:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementProvider, a3);
}

- (NSMutableDictionary)vendedClassesStoreManagerDict
{
  return self->_vendedClassesStoreManagerDict;
}

- (void)setVendedClassesStoreManagerDict:(id)a3
{
  objc_storeStrong((id *)&self->_vendedClassesStoreManagerDict, a3);
}

- (void)setVehicleEventRegistrar:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleEventRegistrar, a3);
}

- (RTDaemonClientRegistrarScenarioTrigger)scenarioTriggerRegistrar
{
  return self->_scenarioTriggerRegistrar;
}

- (void)setScenarioTriggerRegistrar:(id)a3
{
  objc_storeStrong((id *)&self->_scenarioTriggerRegistrar, a3);
}

- (RTDaemonClientRegistrarPeopleDiscovery)peopleDiscoveryRegistrar
{
  return self->_peopleDiscoveryRegistrar;
}

- (void)setPeopleDiscoveryRegistrar:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDiscoveryRegistrar, a3);
}

- (RTAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (RTAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationManager, a3);
}

- (RTBackgroundInertialOdometryManager)backgroundInertialOdometryManager
{
  return self->_backgroundInertialOdometryManager;
}

- (void)setBackgroundInertialOdometryManager:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundInertialOdometryManager, a3);
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactsManager, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (void)setDeviceLocationPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLocationPredictor, a3);
}

- (RTDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
  objc_storeStrong((id *)&self->_diagnostics, a3);
}

- (RTElevationManager)elevationManager
{
  return self->_elevationManager;
}

- (void)setElevationManager:(id)a3
{
  objc_storeStrong((id *)&self->_elevationManager, a3);
}

- (RTEventAgentManager)eventAgentManager
{
  return self->_eventAgentManager;
}

- (void)setEventAgentManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventAgentManager, a3);
}

- (RTEventModelProvider)eventModelProvider
{
  return self->_eventModelProvider;
}

- (void)setEventModelProvider:(id)a3
{
  objc_storeStrong((id *)&self->_eventModelProvider, a3);
}

- (RTFingerprintManager)fingerprintManager
{
  return self->_fingerprintManager;
}

- (void)setFingerprintManager:(id)a3
{
  objc_storeStrong((id *)&self->_fingerprintManager, a3);
}

- (RTAuthorizedLocationManager)authorizedLocationManager
{
  return self->_authorizedLocationManager;
}

- (void)setAuthorizedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_authorizedLocationManager, a3);
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (void)setHealthKitManager:(id)a3
{
  objc_storeStrong((id *)&self->_healthKitManager, a3);
}

- (RTHintManager)hintManager
{
  return self->_hintManager;
}

- (void)setHintManager:(id)a3
{
  objc_storeStrong((id *)&self->_hintManager, a3);
}

- (RTIntermittentGNSSManager)intermittentGNSSManager
{
  return self->_intermittentGNSSManager;
}

- (void)setIntermittentGNSSManager:(id)a3
{
  objc_storeStrong((id *)&self->_intermittentGNSSManager, a3);
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationStore, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTLocationContextManager)locationContextManager
{
  return self->_locationContextManager;
}

- (void)setLocationContextManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationContextManager, a3);
}

- (RTLocationStore)locationStore
{
  return self->_locationStore;
}

- (void)setLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_locationStore, a3);
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
  objc_storeStrong((id *)&self->_metricManager, a3);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (RTPeopleDiscoveryProvider)peopleDiscoveryProvider
{
  return self->_peopleDiscoveryProvider;
}

- (void)setPeopleDiscoveryProvider:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, a3);
}

- (RTPlaceInferenceManager)placeInferenceManager
{
  return self->_placeInferenceManager;
}

- (void)setPlaceInferenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_placeInferenceManager, a3);
}

- (RTPurgeManager)purgeManager
{
  return self->_purgeManager;
}

- (void)setPurgeManager:(id)a3
{
  objc_storeStrong((id *)&self->_purgeManager, a3);
}

- (RTScenarioTriggerManager)scenarioTriggerManager
{
  return self->_scenarioTriggerManager;
}

- (void)setScenarioTriggerManager:(id)a3
{
  objc_storeStrong((id *)&self->_scenarioTriggerManager, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (void)setVehicleLocationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleLocationProvider, a3);
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (void)setVisitManager:(id)a3
{
  objc_storeStrong((id *)&self->_visitManager, a3);
}

- (RTTripSegmentManager)tripSegmentManager
{
  return self->_tripSegmentManager;
}

- (void)setTripSegmentManager:(id)a3
{
  objc_storeStrong((id *)&self->_tripSegmentManager, a3);
}

- (RTVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void)setVehicleStore:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleStore, a3);
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
  objc_storeStrong((id *)&self->_wifiManager, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
  objc_storeStrong((id *)&self->_executableName, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_tripSegmentManager, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_purgeManager, 0);
  objc_storeStrong((id *)&self->_placeInferenceManager, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_locationContextManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_intermittentGNSSManager, 0);
  objc_storeStrong((id *)&self->_hintManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_authorizedLocationManager, 0);
  objc_storeStrong((id *)&self->_fingerprintManager, 0);
  objc_storeStrong((id *)&self->_eventModelProvider, 0);
  objc_storeStrong((id *)&self->_eventAgentManager, 0);
  objc_storeStrong((id *)&self->_elevationManager, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_backgroundInertialOdometryManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryRegistrar, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerRegistrar, 0);
  objc_storeStrong((id *)&self->_vehicleEventRegistrar, 0);
  objc_storeStrong((id *)&self->_vendedClassesStoreManagerDict, 0);
  objc_storeStrong((id *)&self->_entitlementProvider, 0);
  objc_storeStrong((id *)&self->_placeInferenceOptions, 0);
  objc_storeStrong((id *)&self->_restorationData, 0);
  objc_destroyWeak((id *)&self->_clientManagerDelegate);
  objc_storeStrong((id *)&self->_restorationIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
