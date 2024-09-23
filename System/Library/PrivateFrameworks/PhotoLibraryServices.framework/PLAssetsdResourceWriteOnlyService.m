@implementation PLAssetsdResourceWriteOnlyService

- (PLAssetsdResourceWriteOnlyService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4
{
  id v7;
  PLAssetsdResourceWriteOnlyService *v8;
  PLAssetsdResourceWriteOnlyService *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetsdResourceWriteOnlyService;
  v8 = -[PLAbstractLibraryServicesManagerService initWithLibraryServicesManager:](&v11, sel_initWithLibraryServicesManager_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_connectionAuthorization, a4);

  return v9;
}

- (void)saveAssetWithDataAndPorts:(id)a3 imageSurface:(id)a4 previewImageSurface:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  const char *Name;
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v14 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v23) = v14;
  if (v14)
  {
    *((_QWORD *)&v23 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: saveAssetWithDataAndPorts:imageSurface:previewImageSurface:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v23 + 1), (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D74DB8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D74E00], *MEMORY[0x1E0D74E30], 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "containsObject:", v15))
    {
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAssetsdResourceWriteOnlyService saveAssetWithDataAndPorts:clientConnection:imageSurface:previewImageSurface:reply:](self, "saveAssetWithDataAndPorts:clientConnection:imageSurface:previewImageSurface:reply:", v10, v17, v11, v12, v13);

    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27 = CFSTR("Missing image write job type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, 0, 0, v16);
  }

  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v21, OS_SIGNPOST_INTERVAL_END, v24, "Received saveAssetWithDataAndPorts:clientConnection:imageSurface:previewImageSurface:reply: from %ld with job type %{public}@ uuid %{public}@", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)saveAssetWithDataAndPorts:(id)a3 clientConnection:(id)a4 imageSurface:(id)a5 previewImageSurface:(id)a6 reply:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  int v19;
  PLAssetsdResourceWriteOnlyService *v20;
  id v21;
  const char *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  _BOOL4 v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  id v54;
  _QWORD v55[4];
  id v56;
  uint64_t v57;
  const __CFString *v58;
  uint8_t buf[4];
  _BYTE v60[18];
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  PLGatekeeperXPCGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(v14, "processIdentifier");
    v20 = self;
    v21 = v17;
    v22 = a2;
    v23 = v14;
    v24 = v16;
    v25 = v15;
    v26 = v19;
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
    v54 = v13;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)v60 = v26;
    v15 = v25;
    v16 = v24;
    v14 = v23;
    a2 = v22;
    v17 = v21;
    self = v20;
    *(_WORD *)&v60[8] = 2114;
    *(_QWORD *)&v60[10] = v27;
    v61 = 2114;
    v62 = v28;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Received saveAssetWithDataAndPorts:clientConnection:imageSurface:previewImageSurface:reply: from %ld with job type %{public}@ uuid %{public}@", buf, 0x20u);

    v13 = v54;
  }

  PLGatekeeperXPCGetLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEBUG, "Begin saveAssetWithDataAndPorts", buf, 2u);
  }

  PLConsumeSandboxExtensionsForJobDictionary(v13);
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "imageWriter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && (objc_msgSend(v31, "imageWriterJob:hasValidPathsWithConnection:", v13, v14) & 1) != 0)
  {
    -[PLAssetsdResourceWriteOnlyService connectionAuthorization](self, "connectionAuthorization");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v32, "isCameraClient") & 1) != 0)
    {
      v33 = v13;
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqualToString:", *MEMORY[0x1E0D74E28]);

      if (v35)
      {
        PLGatekeeperXPCGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "Skipping Camera preview image job due to duplicate job from nebulad", buf, 2u);
        }

        (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v17 + 2))(v17, 1, 0, 0, 0, 0);
        v13 = v33;
        goto LABEL_26;
      }
    }
    else
    {
      v33 = v13;

    }
    -[PLAssetsdResourceWriteOnlyService connectionAuthorization](self, "connectionAuthorization", v54);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "isClientInLimitedLibraryMode");

    v13 = v33;
    if (v44)
    {
      objc_msgSend(v33, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("job.private.ClientInLimitedLibraryMode"));
      -[PLAssetsdResourceWriteOnlyService connectionAuthorization](self, "connectionAuthorization");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "trustedCallerBundleID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = objc_msgSend(v46, "length");
      PLGatekeeperXPCGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
      if (v47)
      {
        if (v49)
        {
          -[PLAssetsdResourceWriteOnlyService connectionAuthorization](self, "connectionAuthorization");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "clientProcessIdentifier");
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v60 = v51;
          *(_WORD *)&v60[4] = 2112;
          *(_QWORD *)&v60[6] = v46;
          _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_DEFAULT, "Saving asset for limited library client (%d) %@", buf, 0x12u);

        }
        v13 = v33;
        objc_msgSend(v33, "setObject:forKey:", v46, CFSTR("job.private.LimitedLibraryClientFetchFilterIdentifier"));
        -[PLAssetsdResourceWriteOnlyService connectionAuthorization](self, "connectionAuthorization");
        v48 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKey:", v48, CFSTR("job.private.LimitedLibraryClientAuthorization"));
      }
      else
      {
        if (v49)
        {
          -[PLAssetsdResourceWriteOnlyService connectionAuthorization](self, "connectionAuthorization");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "clientProcessIdentifier");
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v60 = v53;
          _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_DEFAULT, "Saving asset for limited library client %d without client identifier", buf, 8u);

        }
        v13 = v33;
      }

    }
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __119__PLAssetsdResourceWriteOnlyService_saveAssetWithDataAndPorts_clientConnection_imageSurface_previewImageSurface_reply___block_invoke;
    v55[3] = &unk_1E36734D8;
    v56 = v17;
    objc_msgSend(v31, "saveAssetJob:imageSurface:previewImageSurface:completionHandler:", v13, v15, v16, v55);

  }
  else
  {
    PLGatekeeperXPCGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v60 = v38;
      *(_WORD *)&v60[8] = 2112;
      *(_QWORD *)&v60[10] = v13;
      _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "[%@] failed, rejecting invalid job %@", buf, 0x16u);

    }
    v39 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0D74498];
    v57 = *MEMORY[0x1E0CB2D50];
    v58 = CFSTR("Invalid imagewriter job");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, 41001, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, uint64_t, _QWORD, void *))v17 + 2))(v17, 0, 0, 1, 0, v42);
  }
LABEL_26:

}

- (PLAssetsdConnectionAuthorization)connectionAuthorization
{
  return self->_connectionAuthorization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

void __119__PLAssetsdResourceWriteOnlyService_saveAssetWithDataAndPorts_clientConnection_imageSurface_previewImageSurface_reply___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  PLGatekeeperXPCGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v15[0] = 67109378;
    v15[1] = a2;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "End saveAssetWithDataAndPorts: success: %d, error: %@", (uint8_t *)v15, 0x12u);
  }

  v11 = v8;
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
    PLImageWriterRemovePrivateKeysFromJobDictionary(v13);
    v14 = (void *)objc_msgSend(v13, "copy");

  }
  else
  {
    v14 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
