@implementation SignpostEvent(LoggingSupport)

- (void)_handleSignpostTelemetryPlaceholder:()LoggingSupport
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "_nameStringFromSegment:", v24);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v24, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("string1"));

      if (v7)
      {
        objc_msgSend(v24, "argument");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "type");

        if (v9 == 1)
        {
          objc_msgSend(a1, "setString1Name:", v5);
          objc_msgSend(v24, "argument");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "argumentObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setString1Value:", v11);
LABEL_15:

        }
      }
      else
      {
        objc_msgSend(v24, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("string2"));

        if (v13)
        {
          objc_msgSend(v24, "argument");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "type");

          if (v15 == 1)
          {
            objc_msgSend(a1, "setString2Name:", v5);
            objc_msgSend(v24, "argument");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "argumentObject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "setString2Value:", v11);
            goto LABEL_15;
          }
        }
        else
        {
          objc_msgSend(v24, "type");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("number1"));

          if (!v17)
          {
            objc_msgSend(v24, "type");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("number2"));

            if (!v21)
              goto LABEL_16;
            objc_msgSend(v24, "argument");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "type");

            if (v23 != 3)
              goto LABEL_16;
            objc_msgSend(a1, "setNumber2Name:", v5);
            objc_msgSend(v24, "argument");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "argumentObject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "setNumber2Value:", v11);
            goto LABEL_15;
          }
          objc_msgSend(v24, "argument");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "type");

          if (v19 == 3)
          {
            objc_msgSend(a1, "setNumber1Name:", v5);
            objc_msgSend(v24, "argument");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "argumentObject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "setNumber1Value:", v11);
            goto LABEL_15;
          }
        }
      }
    }
LABEL_16:

  }
}

- (void)_handleSignpostDescriptionPlaceholder:()LoggingSupport
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;

  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_27;
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("attribute"));

  if (v7)
  {
    objc_msgSend(a1, "_nameStringFromSegment:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_27;
    v9 = v8;
    objc_msgSend(v4, "argument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "type");

    objc_msgSend(v4, "argument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 == 1)
    {
      objc_msgSend(v12, "argumentObject");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = objc_msgSend(v12, "type");

      if (v20 != 3)
        goto LABEL_26;
      objc_msgSend(v4, "argument");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "argumentObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "stringValue");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v14;

    if (v22)
    {
      objc_msgSend(a1, "attributes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(a1, "setAttributes:", v24);

      }
      objc_msgSend(a1, "attributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v22, v9);

      goto LABEL_15;
    }
LABEL_26:

    goto LABEL_27;
  }
  objc_msgSend(v4, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("begin_time"));

  if (v16)
  {
    objc_msgSend(v4, "argument");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "type");

    if (v18 == 3)
    {
      objc_msgSend(v4, "argument");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "argumentObject");
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "setOverridingBeginMachContinuousTime:", -[NSObject unsignedLongLongValue](v9, "unsignedLongLongValue"));
LABEL_15:

    }
  }
  objc_msgSend(v4, "type");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("end_time"));

  if (v27)
  {
    objc_msgSend(v4, "argument");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "type");

    if (v29 == 3)
    {
      objc_msgSend(v4, "argument");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "argumentObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "setOverridingEndMachContinuousTime:", objc_msgSend(v31, "unsignedLongLongValue"));
LABEL_23:

      goto LABEL_27;
    }
    goto LABEL_27;
  }
  objc_msgSend(v4, "type");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("event_time"));

  if (!v33)
    goto LABEL_27;
  if (objc_msgSend(a1, "eventType") != 2)
  {
    _signpostcollection_debug_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SignpostEvent(LoggingSupport) _handleSignpostDescriptionPlaceholder:].cold.1(a1);
    goto LABEL_26;
  }
  objc_msgSend(v4, "argument");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "type");

  if (v35 == 3)
  {
    objc_msgSend(v4, "argument");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "argumentObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setOverridingEmitMachContinuousTime:", objc_msgSend(v31, "unsignedLongLongValue"));
    goto LABEL_23;
  }
LABEL_27:

}

- (void)_parseMetadataSegments:()LoggingSupport
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "metadataSegments", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(a1, "_checkForFormatStringFlags:shouldCompose:", v10, a3);
        objc_msgSend(v10, "typeNamespace");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("signpost.description"));

        if (v12)
        {
          objc_msgSend(a1, "_handleSignpostDescriptionPlaceholder:", v10);
        }
        else
        {
          objc_msgSend(v10, "typeNamespace");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("signpost.telemetry"));

          if (v14)
            objc_msgSend(a1, "_handleSignpostTelemetryPlaceholder:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)_checkForFormatStringFlags:()LoggingSupport shouldCompose:
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  char *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "stringPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v14;
  if (v6)
  {
    if ((a4 & 1) == 0)
    {
      objc_msgSend(v14, "stringPrefix");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsString:", CFSTR("enableTelemetry=YES"));

      if (v9)
        objc_msgSend(a1, "setTelemetryEnabled:", 1);
    }
    v10 = objc_msgSend(a1, "eventType");
    v7 = v14;
    if (!v10)
    {
      objc_msgSend(v14, "stringPrefix");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = strstr((char *)objc_msgSend(v11, "UTF8String"), "isAnimation=YES");

      v7 = v14;
      if (v12)
      {
        objc_msgSend(a1, "setIsAnimationStart:", 1);
        objc_msgSend(v14, "stringPrefix");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setAnimationTypeFromRawMetadata:", v13);

        v7 = v14;
      }
    }
  }

}

- (id)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (objc_msgSend(v8, "type") != 1536)
  {
    _signpostcollection_debug_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SignpostEvent(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:shouldCompose:].cold.6(v8);
    goto LABEL_7;
  }
  if ((unint64_t)objc_msgSend(v8, "signpostType") < 3)
  {
    v12 = objc_msgSend(v8, "signpostScope");
    if (v12 != 64 && v12 != 128 && v12 != 192)
    {
      _signpostcollection_debug_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[SignpostEvent(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:shouldCompose:].cold.2(v8);
      goto LABEL_7;
    }
    objc_msgSend(v8, "backtrace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v38 = a1;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v9 = objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v37 = v13;
      objc_msgSend(v13, "frames");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v40 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            v20 = objc_alloc(MEMORY[0x24BE90668]);
            objc_msgSend(v19, "imageUUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v20, "initWithUUID:offset:", v21, objc_msgSend(v19, "imageOffset"));

            -[NSObject addObject:](v9, "addObject:", v22);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v16);
      }

      a1 = v38;
      a5 = a5;
      v13 = v37;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v8, "subsystem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "category");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = (void *)objc_msgSend(a1, "initWithSubsystem:category:timebaseRatio:unixDate:unixTimeZone:stackFrames:", v23, v24, objc_msgSend(v8, "unixDate"), objc_msgSend(v8, "unixTimeZone"), v9, a2);

    if (a1)
    {
      objc_msgSend(v8, "signpostName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        _signpostcollection_debug_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[SignpostEvent(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:shouldCompose:].cold.3(v35);

        v10 = 0;
        goto LABEL_44;
      }
      objc_msgSend(v8, "signpostName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setName:", v26);

      if ((_DWORD)a5)
      {
        objc_msgSend(v8, "composedMessage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setMetadata:", v27);

        objc_msgSend(a1, "metadata");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "containsString:", CFSTR("enableTelemetry=YES"));

        if (v29)
          objc_msgSend(a1, "setTelemetryEnabled:", 1);
        if (!objc_msgSend(a1, "eventType"))
        {
          objc_msgSend(a1, "metadata");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "containsString:", CFSTR("isAnimation=YES"));

          if (v31)
            objc_msgSend(a1, "setIsAnimationStart:", 1);
        }
      }
      _initOSLogEventProxyFields(a1, v8);
      objc_msgSend(a1, "setSignpostId:", objc_msgSend(v8, "signpostIdentifier"));
      v32 = objc_msgSend(v8, "signpostType");
      if (v32 >= 3)
        -[SignpostEvent(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:shouldCompose:].cold.5();
      objc_msgSend(a1, "setEventType:", qword_212A3F0E0[v32]);
      v33 = objc_msgSend(v8, "signpostScope");
      switch(v33)
      {
        case 64:
          v34 = 2;
          break;
        case 192:
          v34 = 0;
          break;
        case 128:
          v34 = 1;
          break;
        default:
          -[SignpostEvent(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:shouldCompose:].cold.4();
      }
      objc_msgSend(a1, "setScope:", v34);
      objc_msgSend(MEMORY[0x24BE90688], "placeholderArrayWithOSLogEventProxy:", v8);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setMetadataSegments:", v36);

      objc_msgSend(a1, "_populateMetrics");
      objc_msgSend(a1, "_parseMetadataSegments:", a5);
    }
    v10 = a1;
LABEL_44:

    goto LABEL_8;
  }
  _signpostcollection_debug_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SignpostEvent(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:shouldCompose:].cold.1(v8);
LABEL_7:
  v10 = 0;
LABEL_8:

  return v10;
}

- (void)_handleSignpostDescriptionPlaceholder:()LoggingSupport .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "_key");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_212A37000, v2, v3, "Attempted to override event timestamp on interval (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "signpostType");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_212A37000, v1, v2, "Unexpected signpost type when trying to initialize signpost event: %#llx", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "signpostScope");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_212A37000, v1, v2, "Unexpected signpost scope when trying to initialize signpost event: %#llx", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_212A37000, log, OS_LOG_TYPE_DEBUG, "No signpostName for raw event proxy", v1, 2u);
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:.cold.4()
{
  __assert_rtn("_signpostMatchingScopeForOSLogEventSignpostScope", "SignpostSupportObject_LoggingSupport.m", 116, "false");
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:.cold.5()
{
  __assert_rtn("_signpostEventTypeForOSLogEventSignpostType", "SignpostSupportObject_LoggingSupport.m", 131, "false");
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:.cold.6(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "type");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_212A37000, v1, v2, "Unexpected proxy type when trying to initialize signpost event: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

@end
