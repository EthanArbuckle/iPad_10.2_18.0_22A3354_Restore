@implementation MCEDUClassroomPayloadHandler

- (id)configurationWithError:(id *)a3
{
  dispatch_semaphore_t v4;
  NSObject *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  if (objc_opt_class(CRKClassroomConfiguration))
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_100021094;
    v25 = sub_1000210A4;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_100021094;
    v19 = sub_1000210A4;
    v20 = 0;
    v4 = dispatch_semaphore_create(0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000210AC;
    v11[3] = &unk_1000E3850;
    v13 = &v21;
    v14 = &v15;
    v5 = v4;
    v12 = v5;
    +[CRKClassroomConfiguration fetchConfiguration:](CRKClassroomConfiguration, "fetchConfiguration:", v11);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    if (a3)
      *a3 = objc_retainAutorelease((id)v16[5]);
    v6 = (id)v22[5];

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

    return v6;
  }
  else
  {
    if (a3)
    {
      v8 = MCInternalErrorDomain;
      v9 = MCErrorArray(CFSTR("ERROR_MISSING_FRAMEWORK"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v8, 4, v10, MCErrorTypeFatal, 0));

      a3 = 0;
    }
    return a3;
  }
}

- (BOOL)setConfiguration:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  if (objc_opt_class(CRKClassroomConfiguration))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = sub_100021094;
    v18 = sub_1000210A4;
    v19 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000212DC;
    v11[3] = &unk_1000E35C0;
    v13 = &v14;
    v6 = dispatch_semaphore_create(0);
    v12 = v6;
    +[CRKClassroomConfiguration setConfiguration:completion:](CRKClassroomConfiguration, "setConfiguration:completion:", v5, v11);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
      *a4 = objc_retainAutorelease((id)v15[5]);
    LOBYTE(a4) = v15[5] == 0;

    _Block_object_dispose(&v14, 8);
  }
  else if (a4)
  {
    v7 = MCInternalErrorDomain;
    v8 = MCErrorArray(CFSTR("ERROR_MISSING_FRAMEWORK"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v7, 4, v9, MCErrorTypeFatal, 0));

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (id)_persistentIDForPayloadUUID:(id)a3 requireIdentity:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v6 = a4;
  v8 = a3;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "persistentIDForCertificateUUID:", v8));

    if (v10)
    {
      if (!v6)
      {
LABEL_6:
        a5 = v10;
LABEL_13:

        goto LABEL_14;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
      v13 = +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:", v10, objc_msgSend(v12, "isInstalledForSystem"));

      if (v13)
      {
        CFRelease(v13);
        goto LABEL_6;
      }
      if (!a5)
        goto LABEL_13;
      v17 = MCEDUClassroomErrorDomain;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "friendlyName"));
      v20 = MCErrorArray(CFSTR("EDU_CERTIFICATE_NOT_IDENTITY_P_PAYLOAD"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v17, 45003, v21, MCErrorTypeFatal, v19, 0));

    }
    else
    {
      if (!a5)
        goto LABEL_13;
      v14 = MCEDUClassroomErrorDomain;
      v15 = MCErrorArray(CFSTR("EDU_CERTIFICATE_NOT_FOUND_P_UUID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v14, 45002, v16, MCErrorTypeFatal, v8, 0));

    }
    a5 = 0;
    goto LABEL_13;
  }
  a5 = 0;
LABEL_14:

  return a5;
}

- (BOOL)_installWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v53 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCEDUClassroomPayloadHandler configurationWithError:](self, "configurationWithError:", &v53));
  v7 = v53;

  if (!v6)
  {
    if (v7)
    {
      if (a3)
      {
        v12 = MCEDUClassroomErrorDomain;
        v13 = MCErrorArray(CFSTR("EDU_COULD_NOT_INSTALL"));
        v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v12, 45000, v10, v7, MCErrorTypeFatal, 0));
        goto LABEL_7;
      }
LABEL_40:
      v14 = 0;
      goto LABEL_41;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payloadCertificatePersistentID"));

    if (!v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payloadCertificateUUID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCEDUClassroomPayloadHandler _persistentIDForPayloadUUID:requireIdentity:error:](self, "_persistentIDForPayloadUUID:requireIdentity:error:", v16, 1, a3));
      objc_msgSend(v5, "setPayloadCertificatePersistentID:", v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leaderPayloadCertificateAnchorPersistentID"));

    if (!v18)
    {
      v10 = objc_opt_new(NSMutableArray);
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leaderPayloadCertificateAnchorUUID"));
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v50;
LABEL_20:
        v28 = 0;
        while (1)
        {
          if (*(_QWORD *)v50 != v27)
            objc_enumerationMutation(v24);
          v29 = objc_claimAutoreleasedReturnValue(-[MCEDUClassroomPayloadHandler _persistentIDForPayloadUUID:requireIdentity:error:](self, "_persistentIDForPayloadUUID:requireIdentity:error:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v28), 0, a3));
          if (!v29)
            goto LABEL_36;
          v30 = (void *)v29;
          -[NSMutableArray addObject:](v10, "addObject:", v29);

          if (v26 == (id)++v28)
          {
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
            if (v26)
              goto LABEL_20;
            break;
          }
        }
      }

      v31 = -[NSMutableArray copy](v10, "copy");
      objc_msgSend(v5, "setLeaderPayloadCertificateAnchorPersistentID:", v31);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "memberPayloadCertificateAnchorPersistentID"));

    if (v19)
      goto LABEL_13;
    v10 = objc_opt_new(NSMutableArray);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "memberPayloadCertificateAnchorUUID"));
    v32 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (!v32)
    {
LABEL_35:

      v38 = -[NSMutableArray copy](v10, "copy");
      objc_msgSend(v5, "setMemberPayloadCertificateAnchorPersistentID:", v38);

LABEL_13:
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resourcePayloadCertificatePersistentID"));
      if (v20)
      {

      }
      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resourcePayloadCertificateUUID"));

        if (v39)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resourcePayloadCertificateUUID"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[MCEDUClassroomPayloadHandler _persistentIDForPayloadUUID:requireIdentity:error:](self, "_persistentIDForPayloadUUID:requireIdentity:error:", v40, 1, a3));
          objc_msgSend(v5, "setResourcePayloadCertificatePersistentID:", v41);

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resourcePayloadCertificatePersistentID"));
          if (!v42)
          {
            v7 = 0;
            goto LABEL_40;
          }
        }
      }
      v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
      v44 = 0;
      v14 = -[MCEDUClassroomPayloadHandler setConfiguration:error:](self, "setConfiguration:error:", v10, &v44);
      v7 = v44;
      if (a3 && !v14)
      {
        v21 = MCEDUClassroomErrorDomain;
        v22 = MCErrorArray(CFSTR("EDU_COULD_NOT_INSTALL"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v21, 45000, v23, v7, MCErrorTypeFatal, 0));

      }
      goto LABEL_8;
    }
    v33 = v32;
    v34 = *(_QWORD *)v46;
LABEL_29:
    v35 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v34)
        objc_enumerationMutation(v24);
      v36 = objc_claimAutoreleasedReturnValue(-[MCEDUClassroomPayloadHandler _persistentIDForPayloadUUID:requireIdentity:error:](self, "_persistentIDForPayloadUUID:requireIdentity:error:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v35), 0, a3));
      if (!v36)
        break;
      v37 = (void *)v36;
      -[NSMutableArray addObject:](v10, "addObject:", v36);

      if (v33 == (id)++v35)
      {
        v33 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v33)
          goto LABEL_29;
        goto LABEL_35;
      }
    }
LABEL_36:

    v7 = 0;
    v14 = 0;
    goto LABEL_8;
  }
  if (!a3)
    goto LABEL_40;
  v8 = MCEDUClassroomErrorDomain;
  v9 = MCErrorArray(CFSTR("EDU_ALREADY_INSTALLED"));
  v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v8, 45001, v10, MCErrorTypeFatal, 0));
LABEL_7:
  v14 = 0;
  *a3 = v11;
LABEL_8:

LABEL_41:
  return v14;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  return -[MCEDUClassroomPayloadHandler _installWithError:](self, "_installWithError:", a6, a4, a5);
}

- (void)_remove
{
  -[MCEDUClassroomPayloadHandler setConfiguration:error:](self, "setConfiguration:error:", 0, 0);
}

- (void)remove
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if ((v4 & 1) == 0)
    -[MCEDUClassroomPayloadHandler _remove](self, "_remove");
}

- (BOOL)isInstalled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCEDUClassroomPayloadHandler configurationWithError:](self, "configurationWithError:", 0));
  v3 = v2 != 0;

  return v3;
}

- (void)unsetAside
{
  -[MCEDUClassroomPayloadHandler _installWithError:](self, "_installWithError:", 0);
}

@end
