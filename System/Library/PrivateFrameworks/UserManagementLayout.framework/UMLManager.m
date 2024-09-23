@implementation UMLManager

+ (id)sharedManager
{
  if (qword_2578B0DE8 != -1)
    dispatch_once(&qword_2578B0DE8, &unk_251AD4878);
  return (id)qword_2578B0DE0;
}

- (id)createPrimaryUserOnSharedDataVolumePath:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  UMLUserManifest *manifest;
  NSObject *v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  id v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  uint64_t v49;
  void *v50;
  __int16 *v52;
  uint64_t v53;
  __int16 v55;
  uint64_t v56;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 501);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("MKBUserSessionID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 501);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("MKBUserSessionGroupID"));

  objc_msgSend(v6, "setValue:forKey:", CFSTR("UserSessionOther"), CFSTR("MKBUserTypeKey"));
  objc_msgSend(v6, "setValue:forKey:", CFSTR("mobile"), CFSTR("MKBUserSessionShortName"));
  objc_msgSend(v6, "setValue:forKey:", CFSTR("mobile"), CFSTR("MKBUserSessionFirstName"));
  objc_msgSend(v6, "setValue:forKey:", CFSTR("mobile"), CFSTR("MKBUserSessionLastName"));
  objc_msgSend(v6, "setValue:forKey:", CFSTR("mobile"), CFSTR("MKBUserSessionName"));
  objc_msgSend(v6, "setValue:forKey:", CFSTR("mobile"), CFSTR("MKBUserSessionDisplayName"));
  objc_msgSend(v6, "setValue:forKey:", CFSTR("en_US"), CFSTR("MKBUserSessionLanguage"));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v10, CFSTR("MKBUserSessionUUID"));

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v12, CFSTR("MKBUserSessionAlternateUUID"));

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v14, CFSTR("MKBUserSessionCreateTimeStamp"));

  objc_msgSend(v13, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v15, CFSTR("MKBUserSessionLoginTimeStamp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v16, CFSTR("MKBUserSessionLoginUser"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v17, CFSTR("MKBUserSessionDirty"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v18, CFSTR("MKBUserSessionForeground"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v19, CFSTR("MKBUserSessionisPrimary"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v20, CFSTR("MKBUserSessionisAdminKey"));

  objc_msgSend(v6, "setValue:forKey:", CFSTR("/var/mobile"), CFSTR("MKBUserSessionLibinfoHomeDir"));
  +[UMLUser userFromManifestDictionary:](UMLUser, "userFromManifestDictionary:", v6);
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = v21;
    if (qword_2578B0DF8 != -1)
      dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
    v23 = (id)qword_2578B0DF0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = v13;
      v25 = v11;
      v26 = v5;
      v56 = 0;
      v27 = sub_249998C68();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        v28 = v27;
      else
        v28 = v27 & 0xFFFFFFFE;
      if (v28)
      {
        v55 = 0;
        LODWORD(v53) = 2;
        v52 = &v55;
        v29 = _os_log_send_and_compose_impl();
        v30 = (void *)v29;
        if (v29)
          sub_249998C90(v29);
      }
      else
      {
        v30 = 0;
      }
      free(v30);
      v5 = v26;
      v11 = v25;
      v13 = v24;
    }

    -[NSObject userManifestDictionary](v22, "userManifestDictionary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      if (self)
        manifest = self->_manifest;
      else
        manifest = 0;
      if (-[UMLManager addNewUser:toUserManifest:saveToPath:](self, "addNewUser:toUserManifest:saveToPath:", v6, manifest, v5, v52, v53))
      {
        if (qword_2578B0DF8 != -1)
          dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
        v38 = (id)qword_2578B0DF0;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v56 = 0;
          v39 = sub_249998C68();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            v40 = v39;
          else
            v40 = v39 & 0xFFFFFFFE;
          if (v40)
          {
            v55 = 0;
            v41 = _os_log_send_and_compose_impl();
            v42 = (void *)v41;
            if (v41)
              sub_249998C90(v41);
          }
          else
          {
            v42 = 0;
          }
          free(v42);
        }
LABEL_58:

        goto LABEL_62;
      }
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v43 = (id)qword_2578B0DF0;
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
LABEL_55:

        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 5, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        v38 = v22;
        v22 = 0;
        goto LABEL_58;
      }
      v44 = v5;
      v56 = 0;
      v47 = sub_249998C68();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        v48 = v47;
      else
        v48 = v47 & 0xFFFFFFFE;
      if (v48)
      {
        v55 = 0;
LABEL_51:
        v49 = _os_log_send_and_compose_impl();
        v50 = (void *)v49;
        if (v49)
          sub_249998C90(v49);
        goto LABEL_54;
      }
    }
    else
    {
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v43 = (id)qword_2578B0DF0;
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        goto LABEL_55;
      v44 = v5;
      v56 = 0;
      v45 = sub_249998C68();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        v46 = v45;
      else
        v46 = v45 & 0xFFFFFFFE;
      if (v46)
      {
        v55 = 0;
        goto LABEL_51;
      }
    }
    v50 = 0;
LABEL_54:
    free(v50);
    v5 = v44;
    goto LABEL_55;
  }
  if (qword_2578B0DF8 != -1)
    dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
  v31 = (id)qword_2578B0DF0;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v56 = 0;
    v32 = sub_249998C68();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      v33 = v32;
    else
      v33 = v32 & 0xFFFFFFFE;
    if (v33)
    {
      v55 = 0;
      v34 = _os_log_send_and_compose_impl();
      v35 = (void *)v34;
      if (v34)
        sub_249998C90(v34);
    }
    else
    {
      v35 = 0;
    }
    free(v35);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
  v22 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_62:

  return v22;
}

- (BOOL)updatePrimaryUser:(id)a3 onSharedDataVolumePath:(id)a4 withDiskNode:(id)a5 withVolumeuuid:(id)a6 withVolumeName:(id)a7 withError:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  UMLUserManifest *manifest;
  uint64_t v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v14 && v16 && v17)
  {
    if (qword_2578B0DF8 != -1)
      dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
    v19 = (id)qword_2578B0DF0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = sub_249998C68();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        v21 = v20;
      else
        v21 = v20 & 0xFFFFFFFE;
      if (v21)
      {
        LODWORD(v31) = 2;
        v22 = _os_log_send_and_compose_impl();
        v23 = (void *)v22;
        if (v22)
          sub_249998C90(v22);
      }
      else
      {
        v23 = 0;
      }
      free(v23);
    }

    if (self)
      manifest = self->_manifest;
    else
      manifest = 0;
    LOBYTE(a8) = -[UMLManager updateUser:inManifest:withDiskNode:volumeUUID:volumeName:withSharedDataVolumePath:withError:](self, "updateUser:inManifest:withDiskNode:volumeUUID:volumeName:withSharedDataVolumePath:withError:", v14, manifest, v16, v17, v18, v15, a8, v31);
  }
  else
  {
    if (qword_2578B0DF8 != -1)
      dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
    v24 = (id)qword_2578B0DF0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = sub_249998C68();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        v26 = v25;
      else
        v26 = v25 & 0xFFFFFFFE;
      if (v26)
      {
        v27 = _os_log_send_and_compose_impl();
        v28 = (void *)v27;
        if (v27)
          sub_249998C90(v27);
      }
      else
      {
        v28 = 0;
      }
      free(v28);
    }

    if (a8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a8) = 0;
      v14 = 0;
    }
  }

  return (char)a8;
}

- (BOOL)createPrimaryUserLayoutWithOnUserVolumePath:(id)a3 fromSystemVolumePath:(id)a4 withError:(id *)a5
{
  return -[UMLManager createUserLayoutForUserwithUserID:withAKSSetup:onUserVolumePath:fromSystemVolumePath:withError:](self, "createUserLayoutForUserwithUserID:withAKSSetup:onUserVolumePath:fromSystemVolumePath:withError:", 501, 1, a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_se, 0);
}

- (BOOL)createUserLayoutForUserwithUserID:(int)a3 withAKSSetup:(BOOL)a4 onUserVolumePath:(id)a5 fromSystemVolumePath:(id)a6 withError:(id *)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  UMLSideEffects *se;
  UMLSideEffects *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  NSObject *v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  void *v46;
  unsigned int v47;
  unsigned int v48;
  UMLSideEffects *v49;
  UMLSideEffects *v50;
  void *v51;
  char v52;
  unsigned int v53;
  unsigned int v54;
  uint64_t v55;
  void *v56;
  unsigned int v57;
  unsigned int v58;
  _QWORD v61[5];
  int v62;
  _BYTE v63[12];
  __int16 v64;
  id v65;
  uint64_t v66;
  uint64_t v67;

  v9 = a4;
  v67 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v11 && v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/System/Library/Templates/User/"), v12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (qword_2578B0DF8 != -1)
      dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
    v15 = (id)qword_2578B0DF0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v66 = 0;
      v16 = sub_249998C68();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if (v17)
      {
        *(_DWORD *)v63 = 138412546;
        *(_QWORD *)&v63[4] = v14;
        v64 = 2112;
        v65 = v11;
        v18 = _os_log_send_and_compose_impl();
        v19 = (void *)v18;
        if (v18)
          sub_249998C90(v18);
      }
      else
      {
        v19 = 0;
      }
      free(v19);
    }

    if (self)
      se = self->_se;
    else
      se = 0;
    v27 = se;
    sub_249994DB8((uint64_t)v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = sub_24999A134;
    v61[3] = &unk_251AD48A0;
    v62 = a3;
    v61[4] = self;
    v29 = (void *)v14;
    v30 = objc_msgSend(v28, "clonePath:toPath:error:handler:", v14, v11, a7, v61);

    if ((v30 & 1) != 0)
    {
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v31 = v29;
      v32 = (id)qword_2578B0DF0;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v66 = 0;
        v33 = sub_249998C68();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          v34 = v33;
        else
          v34 = v33 & 0xFFFFFFFE;
        if (v34)
        {
          *(_DWORD *)v63 = 138543618;
          *(_QWORD *)&v63[4] = v29;
          v64 = 2114;
          v65 = v11;
          v35 = _os_log_send_and_compose_impl();
          v36 = (void *)v35;
          if (v35)
            sub_249998C90(v35);
        }
        else
        {
          v36 = 0;
        }
        free(v36);
      }

      if (!v9)
      {
        if (qword_2578B0DF8 != -1)
          dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
        v37 = (id)qword_2578B0DF0;
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          goto LABEL_99;
        *(_QWORD *)v63 = 0;
        v47 = sub_249998C68();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          v48 = v47;
        else
          v48 = v47 & 0xFFFFFFFE;
        if (v48)
        {
          LOWORD(v66) = 0;
          goto LABEL_86;
        }
LABEL_97:
        v56 = 0;
LABEL_98:
        free(v56);
LABEL_99:
        v25 = 1;
        goto LABEL_100;
      }
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v42 = (id)qword_2578B0DF0;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_QWORD *)v63 = 0;
        v43 = sub_249998C68();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          v44 = v43;
        else
          v44 = v43 & 0xFFFFFFFE;
        if (v44)
        {
          LODWORD(v66) = 67109120;
          HIDWORD(v66) = a3;
          v45 = _os_log_send_and_compose_impl();
          v46 = (void *)v45;
          if (v45)
            sub_249998C90(v45);
        }
        else
        {
          v46 = 0;
        }
        free(v46);
      }

      if (self)
        v49 = self->_se;
      else
        v49 = 0;
      v50 = v49;
      sub_249994D9C((uint64_t)v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "bootstrapVolumeWithMountPoint:user:error:", v11, a3, a7);

      if ((v52 & 1) != 0)
      {
        if (qword_2578B0DF8 != -1)
          dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
        v37 = (id)qword_2578B0DF0;
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          goto LABEL_99;
        *(_QWORD *)v63 = 0;
        v53 = sub_249998C68();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          v54 = v53;
        else
          v54 = v53 & 0xFFFFFFFE;
        if (v54)
        {
          LOWORD(v66) = 0;
LABEL_86:
          v55 = _os_log_send_and_compose_impl();
          v56 = (void *)v55;
          if (v55)
            sub_249998C90(v55);
          goto LABEL_98;
        }
        goto LABEL_97;
      }
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v37 = (id)qword_2578B0DF0;
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        goto LABEL_72;
      *(_QWORD *)v63 = 0;
      v57 = sub_249998C68();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        v58 = v57;
      else
        v58 = v57 & 0xFFFFFFFE;
      if (!v58)
      {
        v41 = 0;
        goto LABEL_71;
      }
      LOWORD(v66) = 0;
      v40 = _os_log_send_and_compose_impl();
      v41 = (void *)v40;
      if (v40)
        goto LABEL_96;
    }
    else
    {
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v31 = v29;
      v37 = (id)qword_2578B0DF0;
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v25 = 0;
LABEL_100:

        goto LABEL_101;
      }
      v66 = 0;
      v38 = sub_249998C68();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        v39 = v38;
      else
        v39 = v38 & 0xFFFFFFFE;
      if (v39)
      {
        *(_DWORD *)v63 = 138543618;
        *(_QWORD *)&v63[4] = v29;
        v64 = 2114;
        v65 = v11;
        v40 = _os_log_send_and_compose_impl();
        v41 = (void *)v40;
        if (v40)
LABEL_96:
          sub_249998C90(v40);
      }
      else
      {
        v41 = 0;
      }
    }
LABEL_71:
    free(v41);
LABEL_72:
    v25 = 0;
    goto LABEL_100;
  }
  if (qword_2578B0DF8 != -1)
    dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
  v20 = (id)qword_2578B0DF0;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_QWORD *)v63 = 0;
    v21 = sub_249998C68();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      v22 = v21;
    else
      v22 = v21 & 0xFFFFFFFE;
    if (v22)
    {
      LOWORD(v66) = 0;
      v23 = _os_log_send_and_compose_impl();
      v24 = (void *)v23;
      if (v23)
        sub_249998C90(v23);
    }
    else
    {
      v24 = 0;
    }
    free(v24);
  }

  if (a7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    v25 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
LABEL_101:

  return v25;
}

- (id)readUserManifestOnSharedDataVolumePath:(id)a3 withError:(id *)a4
{
  uint64_t v5;
  void *v6;

  -[UMLManager loadManifestFromSharedDataVolumePath:](self, "loadManifestFromSharedDataVolumePath:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4 && !v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 5, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)loadManifestFromSharedDataVolumePath:(id)a3
{
  void *v4;
  UMLSideEffects *se;
  UMLSideEffects *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  UMLUserManifest *v11;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  id v20;

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", CFSTR("/keybags/usersession.kb"));
  if (self)
    se = self->_se;
  else
    se = 0;
  v6 = se;
  sub_249994DB8((uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v7, "dataWithContentsOfFile:error:", v4, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;

  if (!v8)
  {
    if (qword_2578B0DF8 != -1)
      dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
    v13 = (id)qword_2578B0DF0;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v14 = sub_249998C68();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v15 = v14;
    else
      v15 = v14 & 0xFFFFFFFE;
    if (v15)
    {
LABEL_25:
      v18 = _os_log_send_and_compose_impl();
      v19 = (void *)v18;
      if (v18)
        sub_249998C90(v18);
      goto LABEL_28;
    }
LABEL_27:
    v19 = 0;
LABEL_28:
    free(v19);
LABEL_29:

    v11 = 0;
    goto LABEL_30;
  }
  +[UMLUserManifest manifestFromData:](UMLUserManifest, "manifestFromData:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_249994DC4((uint64_t)self, v10);

  if (!self || !self->_manifest)
  {
    if (qword_2578B0DF8 != -1)
      dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
    v13 = (id)qword_2578B0DF0;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v16 = sub_249998C68();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v17 = v16;
    else
      v17 = v16 & 0xFFFFFFFE;
    if (v17)
      goto LABEL_25;
    goto LABEL_27;
  }
  v11 = self->_manifest;
LABEL_30:

  return v11;
}

- (BOOL)addNewUser:(id)a3 toUserManifest:(id)a4 saveToPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __int16 *v35;
  uint64_t v36;
  id v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v9, "users");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v12)
    {
      v13 = v12;
      v37 = v10;
      v38 = v9;
      v14 = 0;
      v15 = 0;
      v16 = *(_QWORD *)v42;
      do
      {
        v17 = 0;
        v18 = v14;
        do
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v17), "objectForKeyedSubscript:", CFSTR("MKBUserSessionID"), v35, v36);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MKBUserSessionID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19 == v20)
          {
            if (qword_2578B0DF8 != -1)
              dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
            v21 = (id)qword_2578B0DF0;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v40 = 0;
              v22 = sub_249998C68();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                v23 = v22;
              else
                v23 = v22 & 0xFFFFFFFE;
              if (v23)
              {
                v39 = 0;
                LODWORD(v36) = 2;
                v35 = &v39;
                v24 = _os_log_send_and_compose_impl();
                v25 = (void *)v24;
                if (v24)
                  sub_249998C90(v24);
              }
              else
              {
                v25 = 0;
              }
              free(v25);
            }

            objc_msgSend(v38, "users");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "replaceObjectAtIndex:withObject:", v18 + v17, v8);

            v15 = 1;
          }
          ++v17;
        }
        while (v13 != v17);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        v14 = v18 + v17;
      }
      while (v13);

      v9 = v38;
      v10 = v37;
      if ((v15 & 1) != 0)
        goto LABEL_38;
    }
    else
    {

    }
    if (qword_2578B0DF8 != -1)
      dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
    v28 = (id)qword_2578B0DF0;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v40 = 0;
      v29 = sub_249998C68();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        v30 = v29;
      else
        v30 = v29 & 0xFFFFFFFE;
      if (v30)
      {
        v39 = 0;
        LODWORD(v36) = 2;
        v35 = &v39;
        v31 = _os_log_send_and_compose_impl();
        v32 = (void *)v31;
        if (v31)
          sub_249998C90(v31);
      }
      else
      {
        v32 = 0;
      }
      free(v32);
    }

    objc_msgSend(v9, "users");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v8);

LABEL_38:
    v27 = -[UMLManager saveManifest:toPath:](self, "saveManifest:toPath:", v9, v10, v35, v36);
    goto LABEL_39;
  }
  v27 = 0;
LABEL_39:

  return v27;
}

- (BOOL)removeAnUser:(id)a3 fromUserManifest:(id)a4 saveToPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  UMLManager *v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && (objc_msgSend(v8, "userManifestDictionary"), (v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = (void *)v11;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v9, "users");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v24 = self;
      v25 = v10;
      v26 = v9;
      v16 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("MKBUserSessionID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MKBUserSessionID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19 == v20)
          {
            v9 = v26;
            objc_msgSend(v26, "users");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "removeObject:", v18);

            v10 = v25;
            v21 = -[UMLManager saveManifest:toPath:](v24, "saveManifest:toPath:", v26, v25);
            goto LABEL_15;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v15)
          continue;
        break;
      }
      v21 = 0;
      v10 = v25;
      v9 = v26;
    }
    else
    {
      v21 = 0;
    }
LABEL_15:

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)updateUser:(id)a3 inManifest:(id)a4 withDiskNode:(id)a5 volumeUUID:(id)a6 volumeName:(id)a7 withSharedDataVolumePath:(id)a8 withError:(id *)a9
{
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  void *v41;
  id *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  __int16 *v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  -[NSObject userManifestDictionary](v14, "userManifestDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "setValue:forKey:", v16, CFSTR("MKBUserSessionVolumeDeviceNode"));
    objc_msgSend(v20, "setValue:forKey:", v17, CFSTR("MKBUserSessionVolumeUUID"));
    if (qword_2578B0DF8 != -1)
      dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
    v21 = (id)qword_2578B0DF0;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = v18;
      v51 = 0;
      v23 = sub_249998C68();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        v24 = v23;
      else
        v24 = v23 & 0xFFFFFFFE;
      if (v24)
      {
        v50 = 0;
        LODWORD(v49) = 2;
        v48 = &v50;
        v25 = _os_log_send_and_compose_impl();
        v26 = (void *)v25;
        if (v25)
          sub_249998C90(v25);
      }
      else
      {
        v26 = 0;
      }
      free(v26);
      v18 = v22;
    }

    if (-[UMLManager addNewUser:toUserManifest:saveToPath:](self, "addNewUser:toUserManifest:saveToPath:", v20, v15, v18))
    {
      -[NSObject setDiskNode:](v14, "setDiskNode:", v16);
      -[NSObject setVolumeUUID:](v14, "setVolumeUUID:", v17);
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v32 = (id)qword_2578B0DF0;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v51 = 0;
        v33 = sub_249998C68();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          v34 = v33;
        else
          v34 = v33 & 0xFFFFFFFE;
        if (v34)
        {
          v50 = 0;
          v35 = _os_log_send_and_compose_impl();
          v36 = (void *)v35;
          if (v35)
            sub_249998C90(v35);
        }
        else
        {
          v36 = 0;
        }
        free(v36);
      }
      v46 = 1;
      goto LABEL_53;
    }
    if (qword_2578B0DF8 != -1)
      dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
    v37 = (id)qword_2578B0DF0;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v51 = 0;
      v38 = sub_249998C68();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        v39 = v38;
      else
        v39 = v38 & 0xFFFFFFFE;
      if (v39)
      {
        v50 = 0;
        LODWORD(v49) = 2;
        v48 = &v50;
        v40 = _os_log_send_and_compose_impl();
        v41 = (void *)v40;
        if (v40)
          sub_249998C90(v40);
      }
      else
      {
        v41 = 0;
      }
      free(v41);
    }

    v42 = a9;
    if (a9)
    {
      v43 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BDD1128];
      v45 = 5;
      goto LABEL_52;
    }
LABEL_54:
    v46 = 0;
    goto LABEL_55;
  }
  if (qword_2578B0DF8 != -1)
    dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
  v27 = (id)qword_2578B0DF0;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v51 = 0;
    v28 = sub_249998C68();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      v29 = v28;
    else
      v29 = v28 & 0xFFFFFFFE;
    if (v29)
    {
      v50 = 0;
      LODWORD(v49) = 2;
      v48 = &v50;
      v30 = _os_log_send_and_compose_impl();
      v31 = (void *)v30;
      if (v30)
        sub_249998C90(v30);
    }
    else
    {
      v31 = 0;
    }
    free(v31);
  }

  v42 = a9;
  if (!a9)
    goto LABEL_54;
  v43 = (void *)MEMORY[0x24BDD1540];
  v44 = *MEMORY[0x24BDD1128];
  v45 = 22;
LABEL_52:
  objc_msgSend(v43, "errorWithDomain:code:userInfo:", v44, v45, 0, v48, v49);
  v46 = 0;
  *v42 = (id)objc_claimAutoreleasedReturnValue();
  v32 = v14;
  v14 = 0;
LABEL_53:

LABEL_55:
  return v46;
}

- (BOOL)saveManifest:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  UMLSideEffects *se;
  void *v11;
  char v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  UMLSideEffects *v19;
  void *v20;
  char v21;
  NSObject *v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  void *v41;
  UMLSideEffects *v42;
  UMLSideEffects *v43;
  void *v44;
  int v45;
  NSObject *v46;
  unsigned int v47;
  unsigned int v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  unsigned int v52;
  unsigned int v53;
  uint64_t v54;
  void *v55;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  _QWORD v61[4];

  v61[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", CFSTR("/keybags/usersession.kb"));
    objc_msgSend(v9, "appendString:", CFSTR("/keybags"));
    if (self)
      se = self->_se;
    else
      se = 0;
    sub_249994DB8((uint64_t)se);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v9, 0);

    if ((v12 & 1) == 0)
    {
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v13 = (id)qword_2578B0DF0;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v61[0] = 0;
        v14 = sub_249998C68();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          v15 = v14;
        else
          v15 = v14 & 0xFFFFFFFE;
        if (v15)
        {
          LOWORD(v59) = 0;
          LODWORD(v58) = 2;
          v57 = &v59;
          v16 = _os_log_send_and_compose_impl();
          v17 = (void *)v16;
          if (v16)
            sub_249998C90(v16);
        }
        else
        {
          v17 = 0;
        }
        free(v17);
      }

      if (self)
        v19 = self->_se;
      else
        v19 = 0;
      sub_249994DB8((uint64_t)v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "makePath:mode:error:", v9, 448, 0);

      if ((v21 & 1) == 0)
      {
        if (qword_2578B0DF8 != -1)
          dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
        v27 = (id)qword_2578B0DF0;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v61[0] = 0;
          v28 = sub_249998C68();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            v29 = v28;
          else
            v29 = v28 & 0xFFFFFFFE;
          if (v29)
          {
            LOWORD(v59) = 0;
            v30 = _os_log_send_and_compose_impl();
            v31 = (void *)v30;
            if (v30)
              sub_249998C90(v30);
          }
          else
          {
            v31 = 0;
          }
          free(v31);
        }
        v18 = 0;
        goto LABEL_96;
      }
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v22 = (id)qword_2578B0DF0;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v61[0] = 0;
        v23 = sub_249998C68();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          v24 = v23;
        else
          v24 = v23 & 0xFFFFFFFE;
        if (v24)
        {
          LOWORD(v59) = 0;
          LODWORD(v58) = 2;
          v57 = &v59;
          v25 = _os_log_send_and_compose_impl();
          v26 = (void *)v25;
          if (v25)
            sub_249998C90(v25);
        }
        else
        {
          v26 = 0;
        }
        free(v26);
      }

    }
    objc_msgSend(v6, "dataValue", v57, v58);
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v32 = (id)qword_2578B0DF0;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v61[0] = 0;
        v33 = sub_249998C68();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          v34 = v33;
        else
          v34 = v33 & 0xFFFFFFFE;
        if (v34)
        {
          LOWORD(v59) = 0;
          v35 = _os_log_send_and_compose_impl();
          v36 = (void *)v35;
          if (v35)
            sub_249998C90(v35);
        }
        else
        {
          v36 = 0;
        }
        free(v36);
      }

      if (self)
        v42 = self->_se;
      else
        v42 = 0;
      v43 = v42;
      sub_249994DB8((uint64_t)v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0;
      v45 = objc_msgSend(v44, "atomicallyWriteData:toPath:error:", v27, v8, &v60);
      v37 = v60;

      if (v45)
      {
        if (qword_2578B0DF8 != -1)
          dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
        v46 = (id)qword_2578B0DF0;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v61[0] = 0;
          v47 = sub_249998C68();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            v48 = v47;
          else
            v48 = v47 & 0xFFFFFFFE;
          if (v48)
          {
            LOWORD(v59) = 0;
            v49 = _os_log_send_and_compose_impl();
            v50 = (void *)v49;
            if (v49)
              sub_249998C90(v49);
          }
          else
          {
            v50 = 0;
          }
          free(v50);
        }

        v18 = 1;
        goto LABEL_95;
      }
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v51 = (id)qword_2578B0DF0;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        v59 = 0;
        v52 = sub_249998C68();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          v53 = v52;
        else
          v53 = v52 & 0xFFFFFFFE;
        if (v53)
        {
          LODWORD(v61[0]) = 138412290;
          *(_QWORD *)((char *)v61 + 4) = v37;
          v54 = _os_log_send_and_compose_impl();
          v55 = (void *)v54;
          if (v54)
            sub_249998C90(v54);
        }
        else
        {
          v55 = 0;
        }
        free(v55);
      }

    }
    else
    {
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v37 = (id)qword_2578B0DF0;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v61[0] = 0;
        v38 = sub_249998C68();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          v39 = v38;
        else
          v39 = v38 & 0xFFFFFFFE;
        if (v39)
        {
          LOWORD(v59) = 0;
          v40 = _os_log_send_and_compose_impl();
          v41 = (void *)v40;
          if (v40)
            sub_249998C90(v40);
        }
        else
        {
          v41 = 0;
        }
        free(v41);
      }
    }
    v18 = 0;
LABEL_95:

LABEL_96:
    goto LABEL_97;
  }
  v18 = 0;
LABEL_97:

  return v18;
}

@end
