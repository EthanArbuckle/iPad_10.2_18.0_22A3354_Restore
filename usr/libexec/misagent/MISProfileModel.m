@implementation MISProfileModel

- (MISProfileModel)initWithDB:(id)a3
{
  id v4;
  MISProfileModel *v5;
  MISProfileModel *v6;
  MISProfileModel *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MISProfileModel;
  v5 = -[MISProfileModel init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weak_db, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)queryCMSBlobForProfile:(id)a3 forcingXML:(BOOL)a4 handler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id WeakRetained;
  unsigned int v11;
  int v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  if (v8)
  {
    if (!v6)
      goto LABEL_4;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100008F38;
    v20[3] = &unk_100010760;
    v21 = v8;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100008F94;
    v17[3] = &unk_100010B08;
    v19 = &v22;
    v18 = v9;
    v11 = objc_msgSend(WeakRetained, "executeQuery:withBind:withResults:", CFSTR("SELECT cms_blob FROM xml_profiles_cache WHERE uuid = @uuid"), v20, v17);
    v12 = *((unsigned __int8 *)v23 + 24);
    v13 = v11 == 0;

    _Block_object_dispose(&v22, 8);
    if (!v12)
    {
LABEL_4:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100008FB0;
      v15[3] = &unk_100010760;
      v16 = v8;
      v13 = objc_msgSend(WeakRetained, "executeQuery:withBind:withResults:", CFSTR("SELECT cms_blob FROM profiles WHERE uuid = @uuid"), v15, v9) == 0;

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)queryProfile:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (v4)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000090D4;
    v7[3] = &unk_1000109C8;
    v7[4] = &v8;
    -[MISProfileModel queryCMSBlobForProfile:forcingXML:handler:](self, "queryCMSBlobForProfile:forcingXML:handler:", v4, 0, v7);
    v5 = (void *)v9[3];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isProfileInstalled:(id)a3
{
  id v4;
  id WeakRetained;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100009290;
    v11[3] = &unk_100010760;
    v12 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000092EC;
    v8[3] = &unk_100010B30;
    v10 = &v13;
    v9 = v12;
    objc_msgSend(WeakRetained, "executeQuery:withBind:withResults:", CFSTR("SELECT uuid FROM profiles WHERE uuid = @uuid"), v11, v8);
    v6 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)insertProfile:(void *)a3
{
  uint64_t UUID;
  uint64_t Name;
  uint64_t DeveloperCertificatesHashes;
  uint64_t TeamIdentifier;
  uint64_t ExpirationDate;
  uint64_t Entitlements;
  uint64_t EmbeddedDER;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *DataRepresentation;
  void *v35;
  void *v36;
  id WeakRetained;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  BOOL v55;
  BOOL v56;
  BOOL v57;
  BOOL v58;
  BOOL v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  unsigned int v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _BYTE v67[128];

  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  UUID = MISProvisioningProfileGetUUID(a3);
  v35 = (void *)objc_claimAutoreleasedReturnValue(UUID);
  Name = MISProvisioningProfileGetName(a3);
  v33 = (void *)objc_claimAutoreleasedReturnValue(Name);
  DeveloperCertificatesHashes = MISProvisioningProfileGetDeveloperCertificatesHashes(a3);
  v30 = (void *)objc_claimAutoreleasedReturnValue(DeveloperCertificatesHashes);
  TeamIdentifier = MISProvisioningProfileGetTeamIdentifier(a3);
  v32 = (void *)objc_claimAutoreleasedReturnValue(TeamIdentifier);
  ExpirationDate = MISProvisioningProfileGetExpirationDate(a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue(ExpirationDate);
  DataRepresentation = (void *)MISProfileCreateDataRepresentation(a3);
  Entitlements = MISProvisioningProfileGetEntitlements(a3);
  v29 = (void *)objc_claimAutoreleasedReturnValue(Entitlements);
  EmbeddedDER = MISProvisioningProfileGetEmbeddedDER(a3);
  v36 = (void *)objc_claimAutoreleasedReturnValue(EmbeddedDER);
  v12 = objc_autoreleasePoolPush();
  if (objc_msgSend(v36, "length"))
  {
    v13 = (void *)MISProfileCreateWithData(kCFAllocatorDefault, v36);
    if (MISProvisioningProfileValidateSignature(v13))
    {
      v14 = 4;
    }
    else
    {
      v14 = -[MISProfileModel insertProfile:](self, "insertProfile:", v13);
      if (!v14)
      {
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_1000098C8;
        v64[3] = &unk_100010878;
        v65 = v35;
        v66 = DataRepresentation;
        v14 = objc_msgSend(WeakRetained, "executeQuery:withBind:withResults:", CFSTR("INSERT INTO xml_profiles_cache VALUES (@uuid, @cms_blob)"), v64, 0);

      }
    }

    objc_autoreleasePoolPop(v12);
  }
  else
  {
    objc_autoreleasePoolPop(v12);
    v15 = MISProvisioningProfileProvisionsAllDevices(a3) != 0;
    v16 = MISProvisioningProfileIsForLocalProvisioning(a3) != 0;
    v17 = MISProvisioningProfileIsAppleInternalProfile(a3) != 0;
    v18 = MISProvisioningProfileIsForBetaDeployment(a3) != 0;
    v19 = MISProfileIsDEREncoded(a3) != 0;
    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 0;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100009968;
    v49[3] = &unk_100010B58;
    v20 = v35;
    v50 = v20;
    v51 = v32;
    v52 = v33;
    v53 = v31;
    v55 = v15;
    v56 = v17;
    v57 = v16;
    v58 = v18;
    v54 = DataRepresentation;
    v59 = v19;
    v63 = objc_msgSend(WeakRetained, "executeQuery:withBind:withResults:", CFSTR("INSERT INTO profiles VALUES (@uuid, @team_id, NULL, @name, @expires, @is_for_all_devices, @is_apple_internal, @is_local, @is_beta, @cms_blob, @is_der)"), v49, 0);
    v14 = *((_DWORD *)v61 + 6);
    if (!v14)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v21 = v30;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v67, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v46;
        while (2)
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v46 != v23)
              objc_enumerationMutation(v21);
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[MISProfileModel getCertPrimaryKey:](self, "getCertPrimaryKey:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i)));
            if (!v25)
            {
              v14 = 1;
LABEL_19:

              goto LABEL_20;
            }
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472;
            v42[2] = sub_100009B44;
            v42[3] = &unk_100010878;
            v43 = v20;
            v26 = v25;
            v44 = v26;
            v14 = objc_msgSend(WeakRetained, "executeQuery:withBind:withResults:", CFSTR("INSERT INTO certificate_provisioning_cache VALUES (NULL, @uuid, @leaf_pk)"), v42, 0);
            *((_DWORD *)v61 + 6) = v14;

            if (v14)
              goto LABEL_19;

          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v67, 16);
          if (v22)
            continue;
          break;
        }
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "Entitlements"));
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100009BCC;
      v38[3] = &unk_100010B80;
      v41 = &v60;
      v39 = WeakRetained;
      v40 = v20;
      objc_msgSend(v27, "emitEntitlementPredicates:predicateHandler:", v29, v38);

      v14 = *((_DWORD *)v61 + 6);
      v21 = v39;
LABEL_20:

    }
    _Block_object_dispose(&v60, 8);

  }
  return v14;
}

- (int)removeProfile:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  int v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009D04;
  v9[3] = &unk_100010760;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(WeakRetained, "executeQuery:withBind:withResults:", CFSTR("DELETE FROM profiles WHERE uuid = @uuid"), v9, 0);

  return v7;
}

- (id)getCertPrimaryKey:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100009EEC;
  v18 = sub_100009EFC;
  v19 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009F04;
  v12[3] = &unk_100010760;
  v6 = v4;
  v13 = v6;
  if (objc_msgSend(WeakRetained, "executeQuery:withBind:withResults:", CFSTR("INSERT OR IGNORE INTO certificates VALUES (NULL, @cert)"), v12, 0))
  {
    v7 = 0;
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100009F6C;
    v10[3] = &unk_100010760;
    v11 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100009FD4;
    v9[3] = &unk_1000109C8;
    v9[4] = &v14;
    if (objc_msgSend(WeakRetained, "executeQuery:withBind:withResults:", CFSTR("SELECT pk FROM certificates WHERE leaf = @cert"), v10, v9))v7 = 0;
    else
      v7 = (id)v15[5];

  }
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weak_db);
}

@end
