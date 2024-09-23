@implementation MBKeychainManager

+ (Class)managerToUse
{
  return (Class)objc_opt_self(MBKeychainManagerForKeychain, a2);
}

+ (id)fetchLocalBackupPasswordAndReturnError:(id *)a3
{
  return objc_msgSend(objc_msgSend(a1, "managerToUse"), "fetchLocalBackupPassword:", a3);
}

+ (id)fetchKeybagSecretForUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(a1, "managerToUse"), "fetchKeybagSecretForUUID:error:", v6, a4));

  return v7;
}

+ (BOOL)addLocalBackupPassword:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = objc_msgSend(objc_msgSend(a1, "managerToUse"), "addLocalBackupPassword:error:", v6, a4);

  return (char)a4;
}

+ (BOOL)addKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a3;
  LOBYTE(a5) = objc_msgSend(objc_msgSend(a1, "managerToUse"), "addKeybagSecret:forUUID:error:", v9, v8, a5);

  return (char)a5;
}

+ (BOOL)updateLocalBackupPassword:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = objc_msgSend(objc_msgSend(a1, "managerToUse"), "updateLocalBackupPassword:error:", v6, a4);

  return (char)a4;
}

+ (BOOL)updateKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a3;
  LOBYTE(a5) = objc_msgSend(objc_msgSend(a1, "managerToUse"), "updateKeybagSecret:forUUID:error:", v9, v8, a5);

  return (char)a5;
}

+ (BOOL)removeLocalBackupPasswordAndReturnError:(id *)a3
{
  return objc_msgSend(objc_msgSend(a1, "managerToUse"), "removeLocalBackupPassword:", a3);
}

+ (BOOL)removeKeybagSecretsWithError:(id *)a3
{
  return objc_msgSend(objc_msgSend(a1, "managerToUse"), "removeKeybagSecretsWithError:", a3);
}

+ (BOOL)removeKeybagSecretForUUID:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = objc_msgSend(objc_msgSend(a1, "managerToUse"), "removeKeybagSecretForUUID:error:", v6, a4);

  return (char)a4;
}

@end
