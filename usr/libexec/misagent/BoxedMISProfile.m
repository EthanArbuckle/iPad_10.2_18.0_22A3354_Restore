@implementation BoxedMISProfile

- (BoxedMISProfile)initWithUUID:(id)a3 withTeamID:(id)a4 withName:(id)a5 withExpiry:(id)a6 isUniversal:(unsigned __int8)a7 isAppleInternal:(unsigned __int8)a8 isLocal:(unsigned __int8)a9 isBeta:(unsigned __int8)a10
{
  id v17;
  id v18;
  id v19;
  BoxedMISProfile *v20;
  BoxedMISProfile *v21;
  BoxedMISProfile *v22;
  id v24;
  objc_super v25;

  v17 = a3;
  v18 = a4;
  v24 = a5;
  v19 = a6;
  v25.receiver = self;
  v25.super_class = (Class)BoxedMISProfile;
  v20 = -[BoxedMISProfile init](&v25, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->UUID, a3);
    objc_storeStrong((id *)&v21->TeamID, a4);
    objc_storeStrong((id *)&v21->Name, a5);
    objc_storeStrong((id *)&v21->Expires, a6);
    v21->ProvisionsAllDevices = a7;
    v21->AppleInternal = a8;
    v21->Local = a9;
    v21->Beta = a10;
    v22 = v21;
  }

  return v21;
}

+ (id)fromSQLStatement:(sqlite3_stmt *)a3 withMap:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 *v7;
  void *v8;
  void *v9;
  unsigned __int8 *v10;
  void *v11;
  void *v12;
  unsigned __int8 *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  BOOL v23;
  void *v24;
  BoxedMISProfile *v25;
  uint64_t v27;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("profile_uuid")));
  v7 = sub_10000A930(a3, (int)objc_msgSend(v6, "intValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("profile_team_id")));
  v10 = sub_10000A930(a3, (int)objc_msgSend(v9, "intValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("profile_name")));
  v13 = sub_10000A930(a3, (int)objc_msgSend(v12, "intValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("profile_expires")));
  v16 = sub_10000A95C(a3, (int)objc_msgSend(v15, "intValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("profile_is_for_all_devices")));
  v19 = sqlite3_column_int(a3, (int)objc_msgSend(v18, "intValue")) != 0;

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("profile_is_apple_internal")));
  v21 = sqlite3_column_int(a3, (int)objc_msgSend(v20, "intValue")) != 0;

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("profile_is_local")));
  v23 = sqlite3_column_int(a3, (int)objc_msgSend(v22, "intValue")) != 0;

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("profile_is_beta")));
  LOBYTE(a3) = sqlite3_column_int(a3, (int)objc_msgSend(v24, "intValue")) != 0;

  BYTE1(v27) = (_BYTE)a3;
  LOBYTE(v27) = v23;
  v25 = -[BoxedMISProfile initWithUUID:withTeamID:withName:withExpiry:isUniversal:isAppleInternal:isLocal:isBeta:]([BoxedMISProfile alloc], "initWithUUID:withTeamID:withName:withExpiry:isUniversal:isAppleInternal:isLocal:isBeta:", v8, v11, v14, v17, v19, v21, v27);

  return v25;
}

- (NSString)UUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)TeamID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTeamID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)Name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)Expires
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExpires:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unsigned)ProvisionsAllDevices
{
  return self->ProvisionsAllDevices;
}

- (void)setProvisionsAllDevices:(unsigned __int8)a3
{
  self->ProvisionsAllDevices = a3;
}

- (unsigned)AppleInternal
{
  return self->AppleInternal;
}

- (void)setAppleInternal:(unsigned __int8)a3
{
  self->AppleInternal = a3;
}

- (unsigned)Local
{
  return self->Local;
}

- (void)setLocal:(unsigned __int8)a3
{
  self->Local = a3;
}

- (unsigned)Beta
{
  return self->Beta;
}

- (void)setBeta:(unsigned __int8)a3
{
  self->Beta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->Expires, 0);
  objc_storeStrong((id *)&self->Name, 0);
  objc_storeStrong((id *)&self->TeamID, 0);
  objc_storeStrong((id *)&self->UUID, 0);
}

@end
