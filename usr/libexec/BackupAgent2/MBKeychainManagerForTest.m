@implementation MBKeychainManagerForTest

+ (id)fetchLocalBackupPassword:(id *)a3
{
  return (id)qword_1000F9EB8;
}

+ (BOOL)addLocalBackupPassword:(id)a3 error:(id *)a4
{
  objc_storeStrong((id *)&qword_1000F9EB8, a3);
  return 1;
}

+ (BOOL)updateLocalBackupPassword:(id)a3 error:(id *)a4
{
  objc_storeStrong((id *)&qword_1000F9EB8, a3);
  return 1;
}

+ (BOOL)removeLocalBackupPassword:(id *)a3
{
  void *v3;

  v3 = (void *)qword_1000F9EB8;
  qword_1000F9EB8 = 0;

  return 1;
}

+ (id)fetchKeybagSecretForUUID:(id)a3 error:(id *)a4
{
  return objc_msgSend((id)qword_1000F9EC0, "objectForKeyedSubscript:", a3, a4);
}

+ (BOOL)addKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)qword_1000F9EC0;
  if (!qword_1000F9EC0)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v10 = (void *)qword_1000F9EC0;
    qword_1000F9EC0 = v9;

    v8 = (void *)qword_1000F9EC0;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

  return 1;
}

+ (BOOL)updateKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)qword_1000F9EC0;
  if (!qword_1000F9EC0)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v10 = (void *)qword_1000F9EC0;
    qword_1000F9EC0 = v9;

    v8 = (void *)qword_1000F9EC0;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

  return 1;
}

+ (BOOL)removeKeybagSecretsWithError:(id *)a3
{
  void *v3;

  v3 = (void *)qword_1000F9EC0;
  qword_1000F9EC0 = 0;

  return 1;
}

+ (BOOL)removeKeybagSecretForUUID:(id)a3 error:(id *)a4
{
  objc_msgSend((id)qword_1000F9EC0, "removeObjectForKey:", a3, a4);
  return 1;
}

@end
