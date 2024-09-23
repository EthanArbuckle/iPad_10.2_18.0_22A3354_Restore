void start()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  _BYTE v8[128];
  os_log_type_t v9;
  unsigned int v10;

  FigEnableCustomAllocatorsOnDaemonStartup();
  _set_user_dir_suffix("com.apple.mediaparserd");
  FigCommonMediaProcessInitialization(3, 0);
  if (gGMFigKTraceEnabled == 1)
    kdebug_trace(538247193, 0, 0, 0, 0);
  v10 = 0;
  v9 = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, &v10, &v9);
  v1 = v10;
  v2 = v9;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, v9))
    v3 = v1;
  else
    v3 = v1 & 0xFFFFFFFE;
  if ((_DWORD)v3)
  {
    v6 = 136315138;
    v7 = "main";
    v4 = (_BYTE *)_os_log_send_and_compose_impl(v3, 0, v8, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v2, "<<<< mediaparserd >>>> %s: ### ### ### Hello from mediaparserd", (const char *)&v6);
    v1 = v10;
  }
  else
  {
    v4 = 0;
  }
  v5 = fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1, 1, v4, v4 != v8, v1, 0);
  FigInitializeParserProcess(v5);
  if (gGMFigKTraceEnabled == 1)
    kdebug_trace(538247194, 0, 0, 0, 0);
  dispatch_main();
}
