@implementation RegisterXPCActivity

void ___RegisterXPCActivity_block_invoke(_QWORD *a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  _QWORD v12[4];
  _xpc_activity_s *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state)
  {
    if (state == 2)
    {
      if (!a1[5])
        goto LABEL_14;
      if (!xpc_activity_set_state(v3, 4))
      {
        UAFGetLogCategory((id *)&UAFLogContextXPCActivity);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v15 = "_RegisterXPCActivity_block_invoke";
          _os_log_error_impl(&dword_229282000, v5, OS_LOG_TYPE_ERROR, "%s Failed setting activity state to continue", buf, 0xCu);
        }

      }
      v6 = a1[5];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = ___RegisterXPCActivity_block_invoke_189;
      v12[3] = &unk_24F1F6F88;
      v13 = v3;
      (*(void (**)(uint64_t, _xpc_activity_s *, _QWORD *))(v6 + 16))(v6, v13, v12);

    }
  }
  else
  {
    v7 = a1[6];
    if (v7)
      (*(void (**)(uint64_t, _xpc_activity_s *))(v7 + 16))(v7, v3);
  }
  if (xpc_activity_should_defer(v3))
  {
    v8 = xpc_activity_set_state(v3, 3);
    UAFGetLogCategory((id *)&UAFLogContextXPCActivity);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = CFSTR("No");
      v11 = a1[4];
      v15 = "_RegisterXPCActivity_block_invoke";
      *(_DWORD *)buf = 136315650;
      v16 = 2112;
      if (v8)
        v10 = CFSTR("Yes");
      v17 = v11;
      v18 = 2112;
      v19 = v10;
      _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s Deferring activity:%@ deferred:%@", buf, 0x20u);
    }

  }
LABEL_14:

}

void ___RegisterXPCActivity_block_invoke_189(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    UAFGetLogCategory((id *)&UAFLogContextXPCActivity);
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v2 = 136315138;
      v3 = "_RegisterXPCActivity_block_invoke";
      _os_log_error_impl(&dword_229282000, v1, OS_LOG_TYPE_ERROR, "%s Failed setting activity state to done", (uint8_t *)&v2, 0xCu);
    }

  }
}

@end
