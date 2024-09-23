@implementation MCDeclarationsPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  uint8_t *v36;
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t v43[4];
  void *v44;
  __int16 v45;
  uint64_t v46;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));

  if (v13)
  {
    if (a6)
    {
      v32 = kMCDeclarationsPayloadType;
      v14 = MCErrorArray(CFSTR("ERROR_UNACCEPTABLE_PAYLOAD_VIA_MDM_P_TYPE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCInstallationErrorDomain, 4052, v15, MCErrorTypeFatal, v32, 0));
LABEL_15:
      *a6 = v16;

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!objc_opt_class(RMProfileStore) || !objc_opt_class(RMSynchronous))
  {
    if (a6)
    {
      v29 = MCErrorArray(CFSTR("ERROR_MISSING_FRAMEWORK"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCInternalErrorDomain, 4, v15, MCErrorTypeFatal, 0));
      goto LABEL_15;
    }
LABEL_16:
    v24 = 0;
    goto LABEL_17;
  }
  v17 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Beginning installation of MCDeclarationsPayload.", buf, 2u);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "declarations"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[RMProfileStore profileStoreForOwner:](RMProfileStore, "profileStoreForOwner:", CFSTR("MC.DeclarationsInProfile")));
  v20 = (void *)objc_opt_new(RMSynchronous);
  *(_QWORD *)buf = 0;
  v38 = buf;
  v39 = 0x3032000000;
  v40 = sub_100043DC4;
  v41 = sub_100043DD4;
  v42 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100043DDC;
  v34[3] = &unk_1000E35C0;
  v36 = buf;
  v22 = v20;
  v35 = v22;
  objc_msgSend(v19, "installProfile:declarations:completionHandler:", v21, v33, v34);

  objc_msgSend(v22, "waitForCompletion");
  v23 = *((_QWORD *)v38 + 5);
  v24 = v23 == 0;
  v25 = _MCLogObjects[0];
  v26 = v25;
  if (v23)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "friendlyName"));
      v28 = *((_QWORD *)v38 + 5);
      *(_DWORD *)v43 = 138543618;
      v44 = v27;
      v45 = 2114;
      v46 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to install declarations profile %{public}@: %{public}@", v43, 0x16u);

    }
    if (a6)
      *a6 = objc_retainAutorelease(*((id *)v38 + 5));
  }
  else
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "friendlyName"));
      *(_DWORD *)v43 = 138543362;
      v44 = v31;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Successfully installed declarations profile %{public}@", v43, 0xCu);

    }
  }

  _Block_object_dispose(buf, 8);
LABEL_17:

  return v24;
}

- (void)remove
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  __int128 *p_buf;
  uint8_t v26[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "friendlyName"));
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Removing declarations profile %{public}@.", (uint8_t *)&buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RMProfileStore profileStoreForOwner:](RMProfileStore, "profileStoreForOwner:", CFSTR("MC.DeclarationsInProfile")));
  v8 = (void *)objc_opt_new(RMSynchronous);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = sub_100043DC4;
  v33 = sub_100043DD4;
  v34 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_100044124;
  v23 = &unk_1000E35C0;
  p_buf = &buf;
  v11 = v8;
  v24 = v11;
  objc_msgSend(v7, "removeProfile:completionHandler:", v10, &v20);

  objc_msgSend(v11, "waitForCompletion", v20, v21, v22, v23);
  v12 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  v13 = _MCLogObjects[0];
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "friendlyName"));
      v17 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v26 = 138543618;
      v27 = v16;
      v28 = 2114;
      v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to remove declarations profile %{public}@: %{public}@", v26, 0x16u);

    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "friendlyName"));
    *(_DWORD *)v26 = 138543362;
    v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Successfully removed declarations profile %{public}@", v26, 0xCu);

  }
  _Block_object_dispose(&buf, 8);

}

@end
