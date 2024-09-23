@implementation ACAccount(RemoteManagement)

+ (id)rm_createTestAccountWithStore:()RemoteManagement username:description:enrollmentURL:
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v9 = (objc_class *)MEMORY[0x24BDB4380];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [v9 alloc];
  objc_msgSend(v13, "rm_RemoteManagementAccountType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v14, "initWithAccountType:", v15);
  objc_msgSend(v16, "rm_setAccountScheme:", CFSTR("Test"));
  objc_msgSend(v16, "setUsername:", v12);

  objc_msgSend(v16, "setAccountDescription:", v11);
  objc_msgSend(v16, "rm_setEnrollmentURL:", v10);

  objc_msgSend(v16, "setAuthenticated:", 1);
  return v16;
}

+ (id)rm_createBearerAccountWithStore:()RemoteManagement username:description:enrollmentURL:authToken:
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v11 = (objc_class *)MEMORY[0x24BDB4380];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = [v11 alloc];
  objc_msgSend(v16, "rm_RemoteManagementAccountType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(v17, "initWithAccountType:", v18);
  objc_msgSend(v19, "rm_setAccountScheme:", CFSTR("Bearer"));
  objc_msgSend(v19, "setUsername:", v15);

  objc_msgSend(v19, "setAccountDescription:", v14);
  objc_msgSend(v19, "rm_setEnrollmentURL:", v13);

  objc_msgSend(v19, "rm_setBearerToken:", v12);
  objc_msgSend(v19, "setAuthenticated:", 1);
  return v19;
}

+ (id)rm_createMAIDAccountWithStore:()RemoteManagement username:description:dsid:altDSID:personaIdentifier:enrollmentURL:
{
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;

  v15 = (objc_class *)MEMORY[0x24BDB4380];
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = [v15 alloc];
  objc_msgSend(v22, "rm_RemoteManagementAccountType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(v23, "initWithAccountType:", v24);
  objc_msgSend(v25, "rm_setAccountScheme:", CFSTR("MAID"));
  objc_msgSend(v25, "setUsername:", v21);

  objc_msgSend(v25, "setAccountDescription:", v20);
  objc_msgSend(v25, "rm_setDSID:", v19);

  objc_msgSend(v25, "rm_setAltDSID:", v18);
  objc_msgSend(v25, "rm_setPersonaIdentifier:", v17);

  objc_msgSend(v25, "rm_setEnrollmentURL:", v16);
  objc_msgSend(v25, "setAuthenticated:", 1);
  return v25;
}

- (uint64_t)rm_accountScheme
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("RMAccountScheme"));
}

- (uint64_t)rm_setAccountScheme:()RemoteManagement
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("RMAccountScheme"));
}

- (uint64_t)rm_altDSID
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("RMAltDSID"));
}

- (uint64_t)rm_setAltDSID:()RemoteManagement
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("RMAltDSID"));
}

- (uint64_t)rm_DSID
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("RMDSID"));
}

- (uint64_t)rm_setDSID:()RemoteManagement
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("RMDSID"));
}

- (uint64_t)rm_enrollmentToken
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("RMEnrollmentToken"));
}

- (uint64_t)rm_setEnrollmentToken:()RemoteManagement
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("RMEnrollmentToken"));
}

- (uint64_t)rm_enrollmentURL
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("RMEnrollmentURL"));
}

- (uint64_t)rm_setEnrollmentURL:()RemoteManagement
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("RMEnrollmentURL"));
}

- (uint64_t)rm_managementSourceIdentifier
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("RMManagementSourceIdentifier"));
}

- (uint64_t)rm_setManagementSourceIdentifier:()RemoteManagement
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("RMManagementSourceIdentifier"));
}

- (uint64_t)rm_remoteManagingAccountIdentifier
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x24BDB3F70]);
}

- (uint64_t)rm_setRemoteManagingAccountIdentifier:()RemoteManagement
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, *MEMORY[0x24BDB3F70]);
}

- (uint64_t)rm_personaIdentifier
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x24BDB3F60]);
}

- (uint64_t)rm_setPersonaIdentifier:()RemoteManagement
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, *MEMORY[0x24BDB3F60]);
}

- (uint64_t)rm_managedByOlympus
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("additionalInfo"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("managedByMDM"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)rm_bearerToken
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("RMBearerToken"));
}

- (uint64_t)rm_setBearerToken:()RemoteManagement
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("RMBearerToken"));
}

- (uint64_t)rm_isAccountSchemeTest
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "rm_accountScheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("Test"));

  return v2;
}

- (uint64_t)rm_isAccountSchemeBearer
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "rm_accountScheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("Bearer"));

  return v2;
}

- (uint64_t)rm_isAccountSchemeMAID
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "rm_accountScheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("MAID"));

  return v2;
}

@end
