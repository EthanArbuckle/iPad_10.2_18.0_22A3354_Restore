@implementation TIUserModelDataStore

void __52__TIUserModelDataStore_Keyboards__singletonInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend((id)TI_KB_USER_DIRECTORY(), "stringByAppendingPathComponent:", CFSTR("user_model_database.sqlite"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)singletonInstance_path;
  singletonInstance_path = v0;

  objc_msgSend(MEMORY[0x1E0DBDDC0], "initializeDataStoreAtPath:", singletonInstance_path);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)singletonInstance_singletonInstance;
  singletonInstance_singletonInstance = v2;

}

@end
