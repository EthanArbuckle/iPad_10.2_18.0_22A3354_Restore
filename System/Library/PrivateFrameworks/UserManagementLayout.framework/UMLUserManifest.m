@implementation UMLUserManifest

- (UMLUserManifest)init
{
  UMLUserManifest *v2;
  UMLUserManifest *v3;
  NSString *fsVolumeType;
  uint64_t v5;
  NSMutableArray *users;
  uint64_t v7;
  NSMutableArray *syncUserList;
  uint64_t v9;
  NSMutableArray *lruList;
  UMLUserManifest *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UMLUserManifest;
  v2 = -[UMLUserManifest init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v2->_networkBG = 0;
    *(_OWORD *)&v2->_deviceConfig = xmmword_24999FC80;
    fsVolumeType = v2->_fsVolumeType;
    v2->_apnsIDStart = 1;
    v2->_fsVolumeType = (NSString *)CFSTR("UserVolumeAPFSNative");
    v2->_maxUserSize = 0;

    v5 = objc_opt_new();
    users = v3->_users;
    v3->_users = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    syncUserList = v3->_syncUserList;
    v3->_syncUserList = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    lruList = v3->_lruList;
    v3->_lruList = (NSMutableArray *)v9;

    v11 = v3;
  }

  return v3;
}

- (NSData)dataValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[UMLUserManifest deviceConfig](self, "deviceConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DEVICECONFIG"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[UMLUserManifest lastBootedUser](self, "lastBootedUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("BOOTEDUSER"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[UMLUserManifest apnsIDStart](self, "apnsIDStart"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("APNSID"));

  -[UMLUserManifest fsVolumeType](self, "fsVolumeType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("MKBUserSessionVolumeFSType"));

  if ((-[UMLUserManifest maxUsers](self, "maxUsers") & 0x80000000) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[UMLUserManifest maxUsers](self, "maxUsers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("MAXUSER"));

  }
  if (-[UMLUserManifest maxUserSize](self, "maxUserSize") >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[UMLUserManifest maxUserSize](self, "maxUserSize"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("MAXUSERSIZE"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[UMLUserManifest userSessionType](self, "userSessionType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("USESSTYPE"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[UMLUserManifest loginuiCheck](self, "loginuiCheck"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("LOGINCHECKIN"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[UMLUserManifest networkBG](self, "networkBG"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("DEVICENETWORKBG"));

  -[UMLUserManifest syncUserList](self, "syncUserList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDD16E0];
    -[UMLUserManifest syncUserList](self, "syncUserList");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("SYNCENT"));

    -[UMLUserManifest syncUserList](self, "syncUserList");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    sub_249991B14((uint64_t)v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("SYNCBLOB"));

  }
  -[UMLUserManifest lruList](self, "lruList");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    v22 = (void *)MEMORY[0x24BDD16E0];
    -[UMLUserManifest lruList](self, "lruList");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("LRUENT"));

    -[UMLUserManifest lruList](self, "lruList");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    sub_249991B14((uint64_t)v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("LRUBLOB"));

  }
  -[UMLUserManifest users](self, "users");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v28)
  {
    v29 = (void *)MEMORY[0x24BDD16E0];
    -[UMLUserManifest users](self, "users");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("NUMENT"));

    -[UMLUserManifest users](self, "users");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    sub_249991B14((uint64_t)v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("BLOB"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[UMLUserManifest version](self, "version"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("UserManifestVersion"));

  sub_249991998((uint64_t)v3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v35;
}

+ (id)manifestFromData:(id)a3
{
  void *v3;
  UMLUserManifest *v4;
  NSObject *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  sub_249991C90((uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (qword_2578B0DD0 != -1)
      dispatch_once(&qword_2578B0DD0, &unk_251AD4858);
    v10 = (id)qword_2578B0DC8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = sub_249998C68();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        v12 = v11;
      else
        v12 = v11 & 0xFFFFFFFE;
      if (v12)
      {
        v13 = _os_log_send_and_compose_impl();
        v14 = (void *)v13;
        if (v13)
          sub_249998C90(v13);
      }
      else
      {
        v14 = 0;
      }
      free(v14);
    }
    v4 = 0;
    goto LABEL_54;
  }
  v4 = objc_alloc_init(UMLUserManifest);
  -[UMLUserManifest setVersion:](v4, "setVersion:", sub_2499913E4(v3, (uint64_t)CFSTR("UserManifestVersion"), 1));
  if (*__error() == 2)
  {
    if (qword_2578B0DD0 != -1)
      dispatch_once(&qword_2578B0DD0, &unk_251AD4858);
    v5 = (id)qword_2578B0DC8;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = sub_249998C68();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        v7 = v6;
      else
        v7 = v6 & 0xFFFFFFFE;
      if (v7)
      {
        v8 = _os_log_send_and_compose_impl();
        v9 = (void *)v8;
        if (v8)
          sub_249998C90(v8);
      }
      else
      {
        v9 = 0;
      }
      free(v9);
    }

  }
  -[UMLUserManifest setDeviceConfig:](v4, "setDeviceConfig:", sub_2499913E4(v3, (uint64_t)CFSTR("DEVICECONFIG"), 0));
  if (*__error() == 2)
  {
    if (qword_2578B0DD0 != -1)
      dispatch_once(&qword_2578B0DD0, &unk_251AD4858);
    v15 = (id)qword_2578B0DC8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = sub_249998C68();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if (v17)
      {
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

  }
  -[UMLUserManifest setLastBootedUser:](v4, "setLastBootedUser:", sub_2499913E4(v3, (uint64_t)CFSTR("BOOTEDUSER"), 0));
  -[UMLUserManifest setApnsIDStart:](v4, "setApnsIDStart:", sub_2499914EC(v3, (uint64_t)CFSTR("APNSID"), 1));
  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserSessionVolumeFSType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUserManifest setFsVolumeType:](v4, "setFsVolumeType:", v20);

  -[UMLUserManifest fsVolumeType](v4, "fsVolumeType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    -[UMLUserManifest setFsVolumeType:](v4, "setFsVolumeType:", CFSTR("UserVolumeAPFSNative"));
  -[UMLUserManifest setMaxUsers:](v4, "setMaxUsers:", sub_2499913E4(v3, (uint64_t)CFSTR("MAXUSER"), 0xFFFFFFFFLL));
  -[UMLUserManifest setMaxUserSize:](v4, "setMaxUserSize:", sub_2499914EC(v3, (uint64_t)CFSTR("MAXUSERSIZE"), 0));
  -[UMLUserManifest setUserSessionType:](v4, "setUserSessionType:", sub_2499913E4(v3, (uint64_t)CFSTR("USESSTYPE"), 0));
  -[UMLUserManifest setLoginuiCheck:](v4, "setLoginuiCheck:", sub_2499913E4(v3, (uint64_t)CFSTR("LOGINCHECKIN"), 0));
  -[UMLUserManifest setNetworkBG:](v4, "setNetworkBG:", sub_2499913E4(v3, (uint64_t)CFSTR("DEVICENETWORKBG"), 0));
  if ((int)sub_2499913E4(v3, (uint64_t)CFSTR("NUMENT"), 0) >= 1)
  {
    sub_24999191C(v3, (uint64_t)CFSTR("BLOB"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    sub_249991F0C((uint64_t)v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = (void *)objc_msgSend(v23, "mutableCopy");
      -[UMLUserManifest setUsers:](v4, "setUsers:", v25);

    }
  }
  if ((int)sub_2499913E4(v3, (uint64_t)CFSTR("SYNCENT"), 0) >= 1)
  {
    sub_24999191C(v3, (uint64_t)CFSTR("SYNCBLOB"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    sub_249991F0C((uint64_t)v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = (void *)objc_msgSend(v27, "mutableCopy");
      -[UMLUserManifest setSyncUserList:](v4, "setSyncUserList:", v29);

    }
  }
  if ((int)sub_2499913E4(v3, (uint64_t)CFSTR("LRUENT"), 0) >= 1)
  {
    sub_24999191C(v3, (uint64_t)CFSTR("LRUBLOB"));
    v10 = objc_claimAutoreleasedReturnValue();
    sub_249991F0C((uint64_t)v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      v32 = (void *)objc_msgSend(v30, "mutableCopy");
      -[UMLUserManifest setLruList:](v4, "setLruList:", v32);

    }
LABEL_54:

  }
  return v4;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
}

- (int)lastBootedUser
{
  return self->_lastBootedUser;
}

- (void)setLastBootedUser:(int)a3
{
  self->_lastBootedUser = a3;
}

- (int)deviceConfig
{
  return self->_deviceConfig;
}

- (void)setDeviceConfig:(int)a3
{
  self->_deviceConfig = a3;
}

- (int64_t)apnsIDStart
{
  return self->_apnsIDStart;
}

- (void)setApnsIDStart:(int64_t)a3
{
  self->_apnsIDStart = a3;
}

- (NSString)fsVolumeType
{
  return self->_fsVolumeType;
}

- (void)setFsVolumeType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)maxUsers
{
  return self->_maxUsers;
}

- (void)setMaxUsers:(int)a3
{
  self->_maxUsers = a3;
}

- (int64_t)maxUserSize
{
  return self->_maxUserSize;
}

- (void)setMaxUserSize:(int64_t)a3
{
  self->_maxUserSize = a3;
}

- (int)userSessionType
{
  return self->_userSessionType;
}

- (void)setUserSessionType:(int)a3
{
  self->_userSessionType = a3;
}

- (int)loginuiCheck
{
  return self->_loginuiCheck;
}

- (void)setLoginuiCheck:(int)a3
{
  self->_loginuiCheck = a3;
}

- (int)networkBG
{
  return self->_networkBG;
}

- (void)setNetworkBG:(int)a3
{
  self->_networkBG = a3;
}

- (NSMutableArray)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSMutableArray)syncUserList
{
  return self->_syncUserList;
}

- (void)setSyncUserList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSMutableArray)lruList
{
  return self->_lruList;
}

- (void)setLruList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lruList, 0);
  objc_storeStrong((id *)&self->_syncUserList, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_fsVolumeType, 0);
}

@end
