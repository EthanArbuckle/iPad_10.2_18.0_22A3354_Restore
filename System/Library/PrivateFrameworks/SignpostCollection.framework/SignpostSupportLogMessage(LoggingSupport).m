@implementation SignpostSupportLogMessage(LoggingSupport)

- (id)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  void *v26;
  NSObject *v27;

  v6 = a4;
  if (objc_msgSend(v6, "type") == 1024)
  {
    v7 = objc_msgSend(v6, "logType");
    v8 = objc_msgSend(v6, "logType");
    v9 = 0;
    if (v8 <= 0x11 && ((1 << v8) & 0x30007) != 0)
    {
      objc_msgSend(v6, "subsystem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "category");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(a1, "initWithSubsystem:category:timebaseRatio:unixDate:unixTimeZone:", v10, v11, objc_msgSend(v6, "unixDate"), objc_msgSend(v6, "unixTimeZone"), a2);

      if (v12)
      {
        _initOSLogEventProxyFields(v12, v6);
        objc_msgSend(v6, "composedMessage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setMessage:", v13);

        if (v7 == 17)
          v14 = 17;
        else
          v14 = 0;
        if (v7 == 16)
          v15 = 16;
        else
          v15 = v14;
        if (v7 == 2)
          v16 = 2;
        else
          v16 = 0;
        if (v7 == 1)
          v17 = 1;
        else
          v17 = v16;
        if (v7 <= 15)
          v18 = v17;
        else
          v18 = v15;
        objc_msgSend(v12, "setMessageType:", v18);
        objc_msgSend(v6, "decomposedMessage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19 && !objc_msgSend(v19, "state") && (v21 = objc_msgSend(v20, "placeholderCount")) != 0)
        {
          v22 = v21;
          v23 = 0;
          v24 = 1;
          while (1)
          {
            objc_msgSend(v20, "argumentAtIndex:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v25)
            {
              if (objc_msgSend(v25, "category")
                && objc_msgSend(v26, "category") != 1
                && !objc_msgSend(v26, "availability"))
              {
                break;
              }
            }

            v24 = ++v23 < v22;
            if (v22 == v23)
              goto LABEL_29;
          }

        }
        else
        {
LABEL_29:
          v24 = 0;
        }
        objc_msgSend(v12, "setHasNonScalarDynamicData:", v24);

      }
      a1 = v12;
      v9 = a1;
    }
  }
  else
  {
    _signpostcollection_debug_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[SignpostSupportLogMessage(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:].cold.1(v6);

    v9 = 0;
  }

  return v9;
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_212A37000, v1, v2, "Unexpected proxy type when trying to initialize log message: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

@end
