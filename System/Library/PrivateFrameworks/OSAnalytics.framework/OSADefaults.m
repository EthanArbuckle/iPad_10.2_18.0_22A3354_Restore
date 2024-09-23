@implementation OSADefaults

+ (BOOL)BOOLForKey:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__OSADefaults_BOOLForKey___block_invoke;
  v6[3] = &unk_1E4DEDB30;
  v6[4] = &v7;
  +[OSADefaults sendOperation:forKey:withBlock:](OSADefaults, "sendOperation:forKey:withBlock:", 0, v3, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

BOOL __26__OSADefaults_BOOLForKey___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  _BOOL8 result;

  result = xpc_dictionary_get_BOOL(xdict, "defaults_value");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__OSADefaults_setBool_forKey___block_invoke;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a3;
  +[OSADefaults sendOperation:forKey:withBlock:](OSADefaults, "sendOperation:forKey:withBlock:", 1, a4, v4);
}

void __30__OSADefaults_setBool_forKey___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "defaults_value", *(_BYTE *)(a1 + 32));
}

+ (id)objectForKey:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__OSADefaults_objectForKey___block_invoke;
  v6[3] = &unk_1E4DEDB30;
  v6[4] = &v7;
  +[OSADefaults sendOperation:forKey:withBlock:](OSADefaults, "sendOperation:forKey:withBlock:", 2, v3, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __28__OSADefaults_objectForKey___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  xpc_dictionary_get_value(xdict, "defaults_value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    xpc2ns(v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = v7;
  }

}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    ns2xpc(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __32__OSADefaults_setObject_forKey___block_invoke;
      v16[3] = &unk_1E4DEDB78;
      v17 = v7;
      +[OSADefaults sendOperation:forKey:withBlock:](OSADefaults, "sendOperation:forKey:withBlock:", 3, v6, v16);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      +[OSADefaults setObject:forKey:].cold.1((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);
    }

  }
  else
  {
    +[OSADefaults sendOperation:forKey:withBlock:](OSADefaults, "sendOperation:forKey:withBlock:", 3, v6, &__block_literal_global_1);
  }

}

void __32__OSADefaults_setObject_forKey___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_value(xdict, "defaults_value", *(xpc_object_t *)(a1 + 32));
}

+ (void)removeObjectForKey:(id)a3
{
  +[OSADefaults setObject:forKey:](OSADefaults, "setObject:forKey:", 0, a3);
}

+ (id)dictionaryRepresentation
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__OSADefaults_dictionaryRepresentation__block_invoke;
  v4[3] = &unk_1E4DEDB30;
  v4[4] = &v5;
  +[OSADefaults sendOperation:forKey:withBlock:](OSADefaults, "sendOperation:forKey:withBlock:", 4, 0, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __39__OSADefaults_dictionaryRepresentation__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  xpc_dictionary_get_value(xdict, "defaults_value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    xpc2ns(v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = v7;
  }

}

+ (void)sendOperation:(unint64_t)a3 forKey:(id)a4 withBlock:(id)a5
{
  id v7;
  void (**v8)(id, xpc_object_t);
  _xpc_connection_s *v9;
  xpc_object_t empty;
  xpc_object_t v11;
  void *v12;
  uint64_t v13;

  v7 = a4;
  v8 = (void (**)(id, xpc_object_t))a5;
  OSAnalyticsHelperServiceConnection();
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_uint64(empty, "operation", 7uLL);
    xpc_dictionary_set_uint64(empty, "defaults_operation", a3);
    if (v7)
      xpc_dictionary_set_string(empty, "defaults_key", (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v8[2](v8, empty);

    }
    else
    {
      v11 = xpc_connection_send_message_with_reply_sync(v9, empty);
      v12 = v11;
      if (v11)
      {
        v13 = MEMORY[0x1A85A8658](v11);
        if (v13 == MEMORY[0x1E0C81310])
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            +[OSADefaults sendOperation:forKey:withBlock:].cold.1(v12);
        }
        else if (v13 == MEMORY[0x1E0C812F8])
        {
          v8[2](v8, v12);
        }
      }

    }
  }

}

+ (void)setObject:(uint64_t)a3 forKey:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "Failed to convert %@ to an XPC object", a5, a6, a7, a8, 2u);
}

+ (void)sendOperation:(void *)a1 forKey:withBlock:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E0C81270]);
  OUTLINED_FUNCTION_0_1(&dword_1A4D21000, MEMORY[0x1E0C81028], v1, "osanalyticshelper replied with an XPC error: %s", v2, v3, v4, v5, 2u);
}

@end
