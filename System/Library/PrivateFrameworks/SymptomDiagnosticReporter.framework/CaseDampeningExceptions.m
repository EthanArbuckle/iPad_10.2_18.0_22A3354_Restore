@implementation CaseDampeningExceptions

+ (void)setLoggingHandle:(id)a3
{
  objc_storeStrong((id *)&_logHandle, a3);
}

+ (void)setNPIDevice:(BOOL)a3
{
  _isNPIDevice = a3;
}

+ (BOOL)isString:(id)a3 inExceptionList:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v12, "length", (_QWORD)v15) >= 2
            && objc_msgSend(v12, "containsString:", CFSTR("*"))
            && +[CaseDampeningExceptions isException:containedInString:](CaseDampeningExceptions, "isException:containedInString:", v12, v5))
          {
            v13 = 1;
            goto LABEL_16;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_16:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)isException:(id)a3 containedInString:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    if ((unint64_t)objc_msgSend(v5, "length") >= 3
      && objc_msgSend(v5, "hasPrefix:", CFSTR("*"))
      && objc_msgSend(v5, "hasSuffix:", CFSTR("*")))
    {
      v7 = 1;
      objc_msgSend(v5, "substringWithRange:", 1, objc_msgSend(v5, "length") - 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "rangeOfString:", v8) != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_19;
    }
    else if ((unint64_t)objc_msgSend(v5, "length") >= 2
           && objc_msgSend(v5, "hasPrefix:", CFSTR("*")))
    {
      v7 = 1;
      objc_msgSend(v5, "substringWithRange:", 1, objc_msgSend(v5, "length") - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "hasSuffix:", v8) & 1) != 0)
        goto LABEL_19;
    }
    else if ((unint64_t)objc_msgSend(v5, "length") >= 2
           && objc_msgSend(v5, "hasSuffix:", CFSTR("*")))
    {
      objc_msgSend(v5, "substringWithRange:", 0, objc_msgSend(v5, "length") - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "hasPrefix:", v8) & 1) != 0)
      {
        v7 = 1;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      v8 = 0;
    }
    v7 = 0;
    goto LABEL_19;
  }
  v7 = 0;
LABEL_20:

  return v7;
}

+ (BOOL)allowDampeningExceptionFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  const char *v19;
  BOOL v20;
  void *v21;
  id v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint8_t buf[16];
  _QWORD v36[13];
  _QWORD v37[13];
  _QWORD v38[3];
  _QWORD v39[5];

  v39[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("domain"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtype"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("additional"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "length") || !objc_msgSend(v5, "length") || !objc_msgSend(v6, "length"))
    {
      v20 = 0;
LABEL_68:

      goto LABEL_69;
    }
    v38[0] = CFSTR("Functional");
    v38[1] = CFSTR("Operational");
    v39[0] = &unk_24BFD7350;
    v39[1] = &unk_24BFD7368;
    v38[2] = CFSTR("Performance");
    v39[2] = &unk_24BFD7380;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", &unk_24BFD7910);
    if (_isNPIDevice)
    {
      v10 = _logHandle;
      if (_logHandle && os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20675A000, v10, OS_LOG_TYPE_INFO, "Modifying Cellular exceptions list for NPI devices", buf, 2u);
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24BFD7578, CFSTR("Baseband Stability"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24BFD7590, CFSTR("IMS Call KPI"));
    }
    v36[0] = CFSTR("Networking");
    v36[1] = CFSTR("Cellular");
    v36[2] = CFSTR("Bluetooth");
    v36[3] = CFSTR("ReminderKit");
    v37[2] = &unk_24BFD7780;
    v37[3] = &unk_24BFD77A8;
    v36[4] = CFSTR("Location");
    v36[5] = CFSTR("PrivacyTransparency");
    v37[4] = &unk_24BFD7848;
    v37[5] = &unk_24BFD77F8;
    v36[6] = CFSTR("MediaPlayer");
    v36[7] = CFSTR("iCloudDrive");
    v37[6] = &unk_24BFD7960;
    v37[7] = &unk_24BFD79B0;
    v36[8] = CFSTR("AVConference");
    v36[9] = CFSTR("SiriAssistant");
    v37[8] = &unk_24BFD7A28;
    v37[9] = &unk_24BFD7A78;
    v36[10] = CFSTR("FaceTime");
    v36[11] = CFSTR("CoreSpeech");
    v37[10] = &unk_24BFD7AC8;
    v37[11] = &unk_24BFD7B18;
    v34 = (void *)v8;
    v37[0] = v8;
    v37[1] = v9;
    v36[12] = CFSTR("SpotlightIndex");
    v37[12] = &unk_24BFD7B68;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _logHandle;
    if (_logHandle && os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEBUG))
      +[CaseDampeningExceptions allowDampeningExceptionFor:].cold.4((uint64_t)v3, v12);
    objc_msgSend(v11, "objectForKeyedSubscript:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = 0;
      if (v13)
      {
        v21 = (void *)_logHandle;
        if (_logHandle)
        {
          if (os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEBUG))
            +[CaseDampeningExceptions allowDampeningExceptionFor:].cold.3((uint64_t)v13, v21);
          v20 = 0;
        }
      }
      goto LABEL_67;
    }
    v33 = v13;
    objc_msgSend(v33, "objectForKeyedSubscript:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = v11;
      v15 = v14;
      objc_msgSend(v15, "objectForKeyedSubscript:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v31 = v15;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = 0;
        if (v16)
        {
          v25 = (void *)_logHandle;
          if (_logHandle)
          {
            if (os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEBUG))
              +[CaseDampeningExceptions allowDampeningExceptionFor:].cold.1((uint64_t)v33, v25);
            v20 = 0;
          }
        }
        goto LABEL_65;
      }
      v29 = v16;
      v17 = v16;
      if (objc_msgSend(v7, "length") && objc_msgSend(v17, "containsObject:", v7))
      {
        v18 = _logHandle;
        if (!_logHandle || !os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEFAULT))
          goto LABEL_55;
        *(_WORD *)buf = 0;
        v19 = "Case signature matches allowed exception.";
      }
      else if (objc_msgSend(v17, "containsObject:", CFSTR("*"), v29) && objc_msgSend(v17, "count") == 1)
      {
        v18 = _logHandle;
        if (!_logHandle || !os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEFAULT))
          goto LABEL_55;
        *(_WORD *)buf = 0;
        v19 = "Case signature matches allowed exception (subtypeContext allowed as a wildcard).";
      }
      else
      {
        if (!+[CaseDampeningExceptions isString:inExceptionList:](CaseDampeningExceptions, "isString:inExceptionList:", v7, v17))
        {
          v20 = 0;
          goto LABEL_64;
        }
        v18 = _logHandle;
        if (!_logHandle || !os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEFAULT))
        {
LABEL_55:
          v20 = 1;
LABEL_64:

          v16 = v29;
LABEL_65:

          v11 = v30;
          goto LABEL_66;
        }
        *(_WORD *)buf = 0;
        v19 = "Case signature contains allowed exception.";
      }
      _os_log_impl(&dword_20675A000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
      goto LABEL_55;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = v14;
      v20 = 0;
      if (v26)
      {
        v27 = (void *)_logHandle;
        if (_logHandle)
        {
          if (os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEBUG))
            +[CaseDampeningExceptions allowDampeningExceptionFor:].cold.2((uint64_t)v32, v27);
          v20 = 0;
        }
      }
      goto LABEL_66;
    }
    v22 = v14;
    if (objc_msgSend(v22, "containsObject:", v6))
    {
      v23 = _logHandle;
      if (!_logHandle || !os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v24 = "Case signature matches allowed exception.";
    }
    else
    {
      if (!objc_msgSend(v22, "containsObject:", CFSTR("*")) || objc_msgSend(v22, "count") != 1)
      {
        v20 = 0;
        goto LABEL_62;
      }
      v23 = _logHandle;
      if (!_logHandle || !os_log_type_enabled((os_log_t)_logHandle, OS_LOG_TYPE_DEFAULT))
      {
LABEL_34:
        v20 = 1;
LABEL_62:

LABEL_66:
LABEL_67:

        goto LABEL_68;
      }
      *(_WORD *)buf = 0;
      v24 = "Case signature matches allowed exception (subtype allowed as a wildcard).";
    }
    _os_log_impl(&dword_20675A000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
    goto LABEL_34;
  }
  v20 = 0;
LABEL_69:

  return v20;
}

+ (void)allowDampeningExceptionFor:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20675A000, v5, v6, "Found unexpected object %@ of class %@ as exception for subtype %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

+ (void)allowDampeningExceptionFor:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20675A000, v5, v6, "Found unexpected object %@ of class %@ as exception for type %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

+ (void)allowDampeningExceptionFor:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20675A000, v5, v6, "Found unexpected object %@ of class %@ as exception for domain %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

+ (void)allowDampeningExceptionFor:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_20675A000, a2, OS_LOG_TYPE_DEBUG, "Comparing case signature %@ against allowed exceptions list.", (uint8_t *)&v2, 0xCu);
}

@end
