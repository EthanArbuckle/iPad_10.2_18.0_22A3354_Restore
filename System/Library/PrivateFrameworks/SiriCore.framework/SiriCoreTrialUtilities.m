@implementation SiriCoreTrialUtilities

+ (id)trialClientForProject:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x24BEBA9A0], "projectIdFromName:", v3);
  if ((_DWORD)v4 && (v5 = v4, (TRIProject_ProjectId_IsValidValue() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v10 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v12 = 136315394;
        v13 = "+[SiriCoreTrialUtilities trialClientForProject:]";
        v14 = 2112;
        v15 = v3;
        _os_log_impl(&dword_211AB2000, v10, OS_LOG_TYPE_INFO, "%s Could not create trial client for project %@", (uint8_t *)&v12, 0x16u);
      }
    }

  }
  else
  {
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v12 = 136315394;
      v13 = "+[SiriCoreTrialUtilities trialClientForProject:]";
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_211AB2000, v9, OS_LOG_TYPE_INFO, "%s Could not find TRIProject for %@", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

+ (id)getTriLevelForTrialProject:(id)a3 trialNamespace:(id)a4 trialFactor:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[SiriCoreTrialUtilities trialClientForProject:](SiriCoreTrialUtilities, "trialClientForProject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "levelForFactor:withNamespaceName:", v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      v16 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v18 = 136315394;
        v19 = "+[SiriCoreTrialUtilities getTriLevelForTrialProject:trialNamespace:trialFactor:]";
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_211AB2000, v16, OS_LOG_TYPE_INFO, "%s No level for factor %@", (uint8_t *)&v18, 0x16u);
      }
    }

  }
  else
  {
    v15 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v18 = 136315394;
      v19 = "+[SiriCoreTrialUtilities getTriLevelForTrialProject:trialNamespace:trialFactor:]";
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_211AB2000, v15, OS_LOG_TYPE_INFO, "%s Could not create trial client for project %@", (uint8_t *)&v18, 0x16u);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)getDirectoryPathForTrialProject:(id)a3 trialNamespace:(id)a4 trialFactor:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  +[SiriCoreTrialUtilities getTriLevelForTrialProject:trialNamespace:trialFactor:](SiriCoreTrialUtilities, "getTriLevelForTrialProject:trialNamespace:trialFactor:", a3, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "levelOneOfCase") != 101)
  {
    v15 = (void *)*MEMORY[0x24BE08FB0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      goto LABEL_8;
    v9 = v15;
    v17 = 136315650;
    v18 = "+[SiriCoreTrialUtilities getDirectoryPathForTrialProject:trialNamespace:trialFactor:]";
    v19 = 2112;
    v20 = v7;
    v21 = 1024;
    v22 = objc_msgSend(v8, "levelOneOfCase");
    _os_log_impl(&dword_211AB2000, v9, OS_LOG_TYPE_INFO, "%s TRILevel is not a directory type: %@ %d", (uint8_t *)&v17, 0x1Cu);
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v8, "directoryValue");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject hasPath](v9, "hasPath") & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v8, "directoryValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (!v12)
  {
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "directoryValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v14;
}

+ (BOOL)getBooleanForTrialProject:(id)a3 trialNamespace:(id)a4 trialFactor:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  +[SiriCoreTrialUtilities getTriLevelForTrialProject:trialNamespace:trialFactor:](SiriCoreTrialUtilities, "getTriLevelForTrialProject:trialNamespace:trialFactor:", a3, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "levelOneOfCase") == 10)
  {
    v9 = objc_msgSend(v8, "BOOLeanValue");
  }
  else
  {
    v10 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      v13 = 136315650;
      v14 = "+[SiriCoreTrialUtilities getBooleanForTrialProject:trialNamespace:trialFactor:]";
      v15 = 2112;
      v16 = v7;
      v17 = 1024;
      v18 = objc_msgSend(v8, "levelOneOfCase");
      _os_log_impl(&dword_211AB2000, v11, OS_LOG_TYPE_INFO, "%s TRILevel is not a BOOLean type: %@ %d", (uint8_t *)&v13, 0x1Cu);

    }
    v9 = 0;
  }

  return v9;
}

+ (id)experimentIdentifiersForTrialProject:(id)a3 trialNamespace:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[SiriCoreTrialUtilities trialClientForProject:](SiriCoreTrialUtilities, "trialClientForProject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "experimentIdentifiersWithNamespaceName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
