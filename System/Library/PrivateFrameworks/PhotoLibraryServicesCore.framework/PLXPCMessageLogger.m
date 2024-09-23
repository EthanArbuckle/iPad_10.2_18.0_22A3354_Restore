@implementation PLXPCMessageLogger

void __29__PLXPCMessageLogger_enabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  enabled_enabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("PLXPCMessageLogger"));

}

+ (BOOL)enabled
{
  if (enabled_onceToken != -1)
    dispatch_once(&enabled_onceToken, &__block_literal_global_9515);
  return enabled_enabled;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  _BOOL4 v5;
  id v6;
  void *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  int v16;
  const char *ClassName;
  __int16 v18;
  const char *Name;
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "userInfo");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3C70]);
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3C78]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SignpostId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      PLRequestGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "unsignedLongLongValue");
      if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v14 = v13;
        if (os_signpost_enabled(v12))
        {
          v16 = 138543362;
          ClassName = v9;
          _os_signpost_emit_with_name_impl(&dword_199DF7000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Async", "%{public}@", (uint8_t *)&v16, 0xCu);
        }
      }

    }
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      ClassName = v9;
      _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_DEFAULT, "PLXPC ->reply: %@", (uint8_t *)&v16, 0xCu);
    }

    goto LABEL_12;
  }
  PLBackendGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "target");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    v16 = 136315394;
    ClassName = object_getClassName(v9);
    v18 = 2080;
    Name = sel_getName((SEL)objc_msgSend(v7, "selector"));
    _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_DEFAULT, "PLXPC request: -[%s %s]", (uint8_t *)&v16, 0x16u);
LABEL_12:

  }
  objc_msgSend(v7, "invoke");

}

@end
