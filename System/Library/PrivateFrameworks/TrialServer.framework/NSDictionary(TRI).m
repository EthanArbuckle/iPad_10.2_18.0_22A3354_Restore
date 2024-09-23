@implementation NSDictionary(TRI)

- (id)triObjectForExpectedKey:()TRI
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Value missing for key %@", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

+ (void)triKeys:()TRI values:fromDictionary:
{
  id v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v7 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__NSDictionary_TRI__triKeys_values_fromDictionary___block_invoke;
  v8[3] = &unk_1E93302F0;
  v8[4] = &v15;
  v8[5] = &v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);
  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v10[5]);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
}

- (uint64_t)triKeys:()TRI values:
{
  return objc_msgSend(MEMORY[0x1E0C99D80], "triKeys:values:fromDictionary:", a3, a4, a1);
}

@end
