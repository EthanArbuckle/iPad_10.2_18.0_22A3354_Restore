@implementation PLXPCActivityRegister

void __PLXPCActivityRegister_block_invoke(_QWORD *a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    if (state)
      goto LABEL_11;
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[6];
      v10 = 136315138;
      v11 = v6;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "registered xpc activity check in for identifier: %s", (uint8_t *)&v10, 0xCu);
    }

    v7 = a1[4];
    if (!v7)
      goto LABEL_11;
LABEL_10:
    (*(void (**)(uint64_t, _xpc_activity_s *))(v7 + 16))(v7, v3);
    goto LABEL_11;
  }
  PLBackendGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[6];
    v10 = 136315138;
    v11 = v9;
    _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_DEFAULT, "registered xpc activity and pushed to run state for identifier: %s", (uint8_t *)&v10, 0xCu);
  }

  v7 = a1[5];
  if (v7)
    goto LABEL_10;
LABEL_11:

}

@end
