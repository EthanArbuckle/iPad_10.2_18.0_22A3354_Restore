@implementation NSDictionary(IMJSONSerializableValueProviding)

- (id)im_jsonSerializableValue
{
  void *v1;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  unint64_t v14;
  id v15;
  void *v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v1 = a1;
  v34 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", a1))
    return v1;
  objc_msgSend(v1, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    v8 = 0x1E0CB3000uLL;
    v21 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v1, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          jsonSerializableValueForValue(v11);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v22, "setObject:forKey:", v12, v10);
          }
          else
          {
            v14 = v8;
            v15 = v4;
            v16 = v1;
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            _IMStoreLogCategoryDefault();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v28 = v11;
              v29 = 2112;
              v30 = v18;
              v31 = 2112;
              v32 = v10;
              _os_log_impl(&dword_1A904E000, v19, OS_LOG_TYPE_ERROR, "Object %@ of class %@ for key \"%@\" isn't JSON serializable", buf, 0x20u);
            }

            v1 = v16;
            v4 = v15;
            v8 = v14;
            v7 = v21;
          }
        }
        else
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          _IMStoreLogCategoryDefault();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v28 = v10;
            v29 = 2112;
            v30 = v11;
            _os_log_impl(&dword_1A904E000, v12, OS_LOG_TYPE_ERROR, "Non-string key %@ class %@ isn't JSON serializable", buf, 0x16u);
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v6);
  }

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v22);
  return v20;
}

@end
