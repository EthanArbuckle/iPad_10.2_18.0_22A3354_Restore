@implementation MDUserOverrideHeuristic

- (MDUserOverrideHeuristic)init
{
  void *v3;
  MDUserOverrideHeuristic *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.internal"));
  v4 = -[MDUserOverrideHeuristic initWithInternalDefaults:](self, "initWithInternalDefaults:", v3);

  return v4;
}

- (MDUserOverrideHeuristic)initWithInternalDefaults:(id)a3
{
  id v5;
  MDUserOverrideHeuristic *v6;
  MDUserOverrideHeuristic *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MDUserOverrideHeuristic;
  v6 = -[MDUserOverrideHeuristic init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internalDefaults, a3);

  return v7;
}

- (id)determineCurrentMode
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = -[MDUserOverrideHeuristic internalModeOverride](self, "internalModeOverride");
  if (v2 == -1)
    return 0;
  v3 = v2;
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    MDModeGetName(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[MDUserOverrideHeuristic determineCurrentMode]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_215D0F000, v5, OS_LOG_TYPE_DEFAULT, "%s #modes: Override value being used: %@", (uint8_t *)&v8, 0x16u);

  }
  return -[MDModeDecision initWithMode:]([MDModeDecision alloc], "initWithMode:", v3);
}

- (unint64_t)internalModeOverride
{
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v7;

  if (!AFIsInternalInstall())
    return -1;
  -[NSUserDefaults stringForKey:](self->_internalDefaults, "stringForKey:", CFSTR("ModeOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("silent")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("displayonly")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("mixed")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("displayforward")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("voice")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("voiceonly")) & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("voiceforward")) & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    if (v4)
    {
      v7 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        -[MDUserOverrideHeuristic internalModeOverride].cold.1((uint64_t)v4, v7);
    }
    v5 = -1;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDefaults, 0);
}

- (void)internalModeOverride
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[MDUserOverrideHeuristic internalModeOverride]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_215D0F000, a2, OS_LOG_TYPE_ERROR, "%s #modes Invalid mode override value: %@", (uint8_t *)&v2, 0x16u);
}

@end
