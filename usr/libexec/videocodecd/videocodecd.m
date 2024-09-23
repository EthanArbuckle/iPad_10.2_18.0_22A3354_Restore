void start()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t started;
  uint64_t v10;
  int v11;
  const char *v12;
  _BYTE v13[128];
  os_log_type_t v14;
  unsigned int v15;

  v0 = _set_user_dir_suffix("com.apple.videocodecd");
  if (!CelestialIsAudioAccessory(v0))
  {
    v1 = getpid();
    memorystatus_control(14, v1, 1, 0, 0);
  }
  FigCommonMediaProcessInitialization(4, 0);
  if (gGMFigKTraceEnabled == 1)
    kdebug_trace(538247193, 0, 0, 0, 0);
  v15 = 0;
  v14 = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, &v15, &v14);
  v3 = v15;
  v4 = v14;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, v14))
    v5 = v3;
  else
    v5 = v3 & 0xFFFFFFFE;
  if ((_DWORD)v5)
  {
    v11 = 136315138;
    v12 = "main";
    v6 = (_BYTE *)_os_log_send_and_compose_impl(v5, 0, v13, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v4, "<<<< videocodecd >>>> %s: videocodecd main entered", (const char *)&v11);
    v3 = v15;
  }
  else
  {
    v6 = 0;
  }
  v7 = fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1, 1, v6, v6 != v13, v3, 0);
  v8 = FigAudioSessionInitializeVTFigAudioSession(v7);
  started = VTDecompressionSessionServerStartXPC(v8);
  v10 = VTDecompressionSessionServerStart(started);
  if (VTVideoCodecService_ShouldUseSeparateCodecProcessForEncode(v10))
    VTCompressionSessionServerStart();
  if (gGMFigKTraceEnabled == 1)
    kdebug_trace(538247194, 0, 0, 0, 0);
  dispatch_main();
}
