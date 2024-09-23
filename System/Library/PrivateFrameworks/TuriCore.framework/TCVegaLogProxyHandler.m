@implementation TCVegaLogProxyHandler

- (id)getPropertyOnObject:(id)a3 named:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[TCVegaLogger instance](TCVegaLogger, "instance");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    objc_msgSend(v5, "debugDescription");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315394;
    v26 = v8;
    v27 = 2080;
    v28 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_217E69000, v7, OS_LOG_TYPE_INFO, "Getting property \"%s\" on LogProxy wrapped object %s", buf, 0x16u);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "isUndefined") & 1) == 0)
  {
    objc_msgSend(v5, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("__tmp_propertyAccess"));
    objc_msgSend(v14, "evaluateScript:", CFSTR("typeof __tmp_propertyAccess"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "toString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("function"));

    if (v18)
    {
      v24 = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invokeMethod:withArguments:", CFSTR("bind"), v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v20;
    }
    if (objc_msgSend(v11, "isObject")
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("__LogProxy_wrapped")) & 1) == 0)
    {
      +[TCVegaLogProxy wrap:](TCVegaLogProxy, "wrap:", v11);
      v21 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v21;
    }
    v15 = v11;
    v11 = v15;
  }
  else
  {
    +[TCVegaLogger instance](TCVegaLogger, "instance");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[TCVegaLogProxyHandler getPropertyOnObject:named:].cold.1(v6, v5, v12);

    v13 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend(v5, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueWithUndefinedInContext:", v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v15;

  return v22;
}

- (BOOL)setPropertyOnObject:(id)a3 named:(id)a4 toValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  int v15;
  NSObject *v16;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[TCVegaLogger instance](TCVegaLogger, "instance");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    objc_msgSend(v7, "debugDescription");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "UTF8String");
    objc_msgSend(v9, "debugDescription");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = 136315650;
    v24 = v11;
    v25 = 2080;
    v26 = v13;
    v27 = 2080;
    v28 = objc_msgSend(v14, "UTF8String");
    _os_log_impl(&dword_217E69000, v10, OS_LOG_TYPE_INFO, "Setting property \"%s\" on LogProxy wrapped object %s to value \"%s\", (uint8_t *)&v23, 0x20u);

  }
  v15 = objc_msgSend(v7, "hasProperty:", v8);
  if (v15)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);
  }
  else
  {
    +[TCVegaLogger instance](TCVegaLogger, "instance");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      objc_msgSend(v7, "debugDescription");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = objc_msgSend(v19, "UTF8String");
      objc_msgSend(v9, "debugDescription");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = objc_msgSend(v21, "UTF8String");
      v23 = 136315650;
      v24 = v18;
      v25 = 2080;
      v26 = v20;
      v27 = 2080;
      v28 = v22;
      _os_log_error_impl(&dword_217E69000, v16, OS_LOG_TYPE_ERROR, "Set for missing property \"%s\" on LogProxy wrapped object %s to value %s", (uint8_t *)&v23, 0x20u);

    }
  }

  return v15;
}

- (void)getPropertyOnObject:(NSObject *)a3 named:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  id v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  objc_msgSend(a2, "debugDescription");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = 136315394;
  v8 = v5;
  v9 = 2080;
  v10 = objc_msgSend(v6, "UTF8String");
  _os_log_error_impl(&dword_217E69000, a3, OS_LOG_TYPE_ERROR, "Get for missing property \"%s\" on LogProxy wrapped object %s", (uint8_t *)&v7, 0x16u);

}

@end
