@implementation TCVegaJSConsole

+ (id)arguments
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(MEMORY[0x24BDDA720], "currentArguments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(__CFString **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        objc_msgSend(v2, "appendString:", CFSTR(" "));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v2;
          v10 = v8;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[__CFString debugDescription](v8, "debugDescription");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendString:", v11);

            goto LABEL_12;
          }
          v9 = v2;
          v10 = CFSTR("Unknown argument type given to console.log");
        }
        objc_msgSend(v9, "appendString:", v10);
LABEL_12:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v2;
}

+ (void)attachToJavaScriptContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = (id)objc_msgSend(v7, "evaluateScript:", CFSTR("var console = {};"));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("console"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__block_literal_global, CFSTR("log"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("console"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__block_literal_global_16, CFSTR("warn"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("console"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &__block_literal_global_20, CFSTR("error"));

  objc_msgSend(v7, "setExceptionHandler:", &__block_literal_global_25);
}

void __45__TCVegaJSConsole_attachToJavaScriptContext___block_invoke()
{
  NSObject *v0;
  id v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  +[TCVegaLogger instance](TCVegaLogger, "instance");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    +[TCVegaJSConsole arguments](TCVegaJSConsole, "arguments");
    v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v2 = 136315138;
    v3 = objc_msgSend(v1, "UTF8String");
    _os_log_impl(&dword_217E69000, v0, OS_LOG_TYPE_INFO, "JS console log: %s", (uint8_t *)&v2, 0xCu);

  }
}

void __45__TCVegaJSConsole_attachToJavaScriptContext___block_invoke_15()
{
  NSObject *v0;
  id v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  +[TCVegaLogger instance](TCVegaLogger, "instance");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    +[TCVegaJSConsole arguments](TCVegaJSConsole, "arguments");
    v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v2 = 136315138;
    v3 = objc_msgSend(v1, "UTF8String");
    _os_log_impl(&dword_217E69000, v0, OS_LOG_TYPE_INFO, "JS console warning: %s", (uint8_t *)&v2, 0xCu);

  }
}

void __45__TCVegaJSConsole_attachToJavaScriptContext___block_invoke_19()
{
  NSObject *v0;
  id v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  +[TCVegaLogger instance](TCVegaLogger, "instance");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    +[TCVegaJSConsole arguments](TCVegaJSConsole, "arguments");
    v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v2 = 136315138;
    v3 = objc_msgSend(v1, "UTF8String");
    _os_log_impl(&dword_217E69000, v0, OS_LOG_TYPE_INFO, "JS console error: %s", (uint8_t *)&v2, 0xCu);

  }
}

void __45__TCVegaJSConsole_attachToJavaScriptContext___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  +[TCVegaLogger instance](TCVegaLogger, "instance");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "toString");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = 136315138;
    v23 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_217E69000, v6, OS_LOG_TYPE_INFO, "Unhandled exception: %s", (uint8_t *)&v22, 0xCu);

  }
  +[TCVegaLogger instance](TCVegaLogger, "instance");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "debugDescription");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "UTF8String");
    v22 = 136315138;
    v23 = v10;
    _os_log_impl(&dword_217E69000, v8, OS_LOG_TYPE_INFO, "In context: %s", (uint8_t *)&v22, 0xCu);

  }
  +[TCVegaLogger instance](TCVegaLogger, "instance");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("line"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "toString");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "UTF8String");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("column"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "toString");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    v22 = 136315394;
    v23 = v14;
    v24 = 2080;
    v25 = v17;
    _os_log_impl(&dword_217E69000, v11, OS_LOG_TYPE_INFO, "Line %s, column %s", (uint8_t *)&v22, 0x16u);

  }
  +[TCVegaLogger instance](TCVegaLogger, "instance");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stack"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "toString");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "UTF8String");
    v22 = 136315138;
    v23 = v21;
    _os_log_impl(&dword_217E69000, v18, OS_LOG_TYPE_INFO, "Stacktrace: %s", (uint8_t *)&v22, 0xCu);

  }
}

@end
