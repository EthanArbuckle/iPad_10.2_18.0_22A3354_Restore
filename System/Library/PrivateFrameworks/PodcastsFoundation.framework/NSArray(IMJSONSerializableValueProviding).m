@implementation NSArray(IMJSONSerializableValueProviding)

- (id)im_jsonSerializableValue
{
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", a1))
    return a1;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = a1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v18;
    *(_QWORD *)&v6 = 138412546;
    v16 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        jsonSerializableValueForValue(v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v11 = v10;
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          _IMStoreLogCategoryDefault();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            v23 = 2112;
            v24 = v13;
            _os_log_impl(&dword_1A904E000, v14, OS_LOG_TYPE_ERROR, "Object %@ of class %@ isn't JSON serializable", buf, 0x16u);
          }

        }
        objc_msgSend(v3, "addObject:", v11, v16, (_QWORD)v17);

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
