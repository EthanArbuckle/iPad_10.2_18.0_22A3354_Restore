@implementation LivefsDomainManager

+ (void)addDomain:(id)a3 displayName:(id)a4 storage:(id)a5 provider:(id)a6 domainError:(id)a7 how:(int)a8 reply:(id)a9
{
  __int16 v9;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, _QWORD);
  dispatch_semaphore_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  void (**v29)(id, _QWORD);
  _QWORD v30[4];
  NSObject *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  int v46;

  v9 = a8;
  v26 = a3;
  v27 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void (**)(id, _QWORD))a9;
  v18 = dispatch_semaphore_create(0);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_100029F40;
  v37 = sub_100029F50;
  v38 = 0;
  v19 = objc_msgSend(objc_alloc((Class)NSFileProviderDomain), "initWithIdentifier:displayName:pathRelativeToDocumentStorage:hidden:", v26, v27, v14, (v9 & 0x80) != 0);
  v20 = livefs_std_log(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v40 = v26;
    v41 = 2112;
    v42 = v27;
    v43 = 2112;
    v44 = v15;
    v45 = 1024;
    v46 = (v9 & 0x80) >> 7;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "LivefsDomainManager: Domain name %@ displayName %@ provider %@ isHidden %d", buf, 0x26u);
  }

  v22 = objc_msgSend(objc_alloc((Class)NSFileProviderManager), "_initWithProviderIdentifier:", v15);
  if ((v9 & 0x20) != 0)
    objc_msgSend(v19, "setContainsPhotos:", 1);
  if ((v9 & 0x1000) != 0)
    objc_msgSend(v19, "setErasable:", 1);
  objc_msgSend(v19, "setError:", v16);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100029F58;
  v30[3] = &unk_100055568;
  v32 = &v33;
  v23 = v18;
  v31 = v23;
  objc_msgSend(v22, "addDomain:completionHandler:", v19, v30);
  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  v24 = v34[5];
  if ((v9 & 1) == 0 || v24)
  {
    v17[2](v17, v24);
  }
  else
  {
    v25 = objc_msgSend(objc_alloc((Class)NSFileProviderManager), "_initWithProviderIdentifier:domain:", v15, v19);

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100029FD8;
    v28[3] = &unk_1000551E8;
    v29 = v17;
    objc_msgSend(v25, "setConnected:completionHandler:", 1, v28);

    v22 = v25;
  }

  _Block_object_dispose(&v33, 8);
}

+ (void)updateDomain:(id)a3 reply:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;

  v20 = a4;
  v5 = LiveFSMounterVolumeNameKey;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", LiveFSMounterDisplayNameKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", LiveFSMounterDomainStorageKey));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", LiveFSMounterVolumeProviderNameKey));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", LiveFSMounterDomainContainsPhotos));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", LiveFSMounterDomainErrorKey));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", LiveFSMounterDomainErasable));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", LiveFSMounterDomainHidden));

  if (v11 && (v15 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v11, v15) & 1) != 0))
  {
    if (objc_msgSend(v11, "BOOLValue"))
      v16 = 32;
    else
      v16 = 0;
    if (!v13)
      goto LABEL_13;
  }
  else
  {
    v16 = 0;
    if (!v13)
      goto LABEL_13;
  }
  v17 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v13, v17) & 1) != 0)
  {
    if (objc_msgSend(v13, "BOOLValue"))
      v16 = v16 | 0x1000;
    else
      v16 = v16;
  }
LABEL_13:
  if (v14)
  {
    v18 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v14, v18) & 1) != 0)
    {
      if (objc_msgSend(v14, "BOOLValue"))
        v16 = v16 | 0x80;
      else
        v16 = v16;
    }
  }
  objc_msgSend(a1, "addDomain:displayName:storage:provider:domainError:how:reply:", v7, v8, v9, v10, v12, v16, v20);

}

+ (void)removeDomain:(id)a3 provider:(id)a4 how:(int)a5 reply:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)NSFileProviderDomain), "initWithIdentifier:displayName:pathRelativeToDocumentStorage:", v10, v10, v10);

  v12 = objc_msgSend(objc_alloc((Class)NSFileProviderManager), "_initWithProviderIdentifier:", v9);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002A3D4;
  v14[3] = &unk_1000551E8;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "removeDomain:completionHandler:", v11, v14);

}

@end
