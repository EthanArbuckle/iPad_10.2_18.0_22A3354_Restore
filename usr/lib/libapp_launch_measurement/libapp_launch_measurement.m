void alm_stop_tracking_responsive_launch()
{
  s_bail_responsive_launch = 1;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

uint64_t alm_legacy_app_regular_or_extended_launch_end(uint64_t result)
{
  os_signpost_id_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (!s_launch_task_count)
  {
    v1 = result;
    v2 = alm_FrontBoard_lifecycle_log_s_log;
    if (!alm_FrontBoard_lifecycle_log_s_log)
    {
      v2 = os_log_create("com.apple.FrontBoard", "AppLaunch");
      alm_FrontBoard_lifecycle_log_s_log = (uint64_t)v2;
    }
    if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      *(_WORD *)v3 = 0;
      _os_signpost_emit_with_name_impl(&dword_206582000, v2, OS_SIGNPOST_INTERVAL_END, v1, "AppLaunch", " enableTelemetry=YES ", v3, 2u);
    }
    result = _os_feature_enabled_impl();
    if ((_DWORD)result)
    {
      result = mach_continuous_time();
      qword_253CF9118 = result;
    }
  }
  return result;
}

void alm_app_did_activate(os_signpost_id_t a1, int a2)
{
  alm_app_did_activate_with_responsive_check(a1, a2, 0);
}

void alm_app_extended_launch_end_with_details(uint64_t a1, void *a2, uint64_t a3)
{
  int v6;
  int v7;
  xpc_object_t value;
  xpc_object_t v9;
  NSObject *v10;
  _QWORD v11[7];
  int v12;
  uint8_t buf[16];

  v6 = _os_feature_enabled_impl();
  if (a1 && v6)
  {
    if ((_QWORD)xmmword_253CF9108 != a1)
    {
      qword_253CF90FC = 0;
      word_253CF90F9 = 256;
      byte_253CF9130 = 0;
      *(__int128 *)((char *)&xmmword_253CF9108 + 8) = 0u;
      unk_253CF9120 = 0u;
      qword_253CF9138 = 0;
      byte_253CF9150 = 0;
      *(_OWORD *)&qword_253CF9140 = 0u;
      xmmword_253CF9158 = 0u;
      byte_253CF9168 = 0;
      dword_253CF9180 = 0;
      xmmword_253CF9170 = 0u;
      *(_QWORD *)&xmmword_253CF9108 = a1;
      s_ca_metrics = 1;
    }
    qword_253CF9118 = mach_continuous_time();
  }
  alm_did_reach_launch_milestone(4);
  v7 = _alm_build_launch_info();
  if (a2)
  {
    if (MEMORY[0x20BCF9804](a2) == MEMORY[0x24BDACFA0])
    {
      value = xpc_dictionary_get_value(a2, "extendedAppLaunchActivity");
      v9 = xpc_retain(value);
      a2 = (void *)nw_activity_create_from_xpc_object();
      xpc_release(v9);
    }
    else
    {
      a2 = 0;
    }
  }
  v10 = uikit_app_lifecycle_log_s_log;
  if (!uikit_app_lifecycle_log_s_log)
  {
    v10 = os_log_create("com.apple.UIKit", "AppLifecycle");
    uikit_app_lifecycle_log_s_log = (uint64_t)v10;
  }
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_206582000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtendedAppLaunch", " enableTelemetry=YES ", buf, 2u);
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 0x40000000;
  v11[2] = __alm_app_extended_launch_end_with_details_block_invoke_2;
  v11[3] = &unk_24BF2B838;
  v11[5] = a1;
  v11[6] = a2;
  v12 = v7;
  v11[4] = a3;
  alm_execute_when_main_queue_idle_with_condition((uint64_t)&__block_literal_global_40, (uint64_t)v11);
}

void alm_app_will_activate_with_details(uint64_t a1, int a2, const char *a3, const char *a4, uint64_t a5, os_signpost_id_t *a6)
{
  NSObject *v11;
  os_signpost_id_t v12;

  v11 = alm_application_launch_log_s_log;
  if (!alm_application_launch_log_s_log)
  {
    v11 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v11;
  }
  v12 = os_signpost_id_generate(v11);
  alm_app_will_activate_with_signpost_id(v12, a2, a3, a4, a5, v12);
  *a6 = v12;
}

void alm_app_will_launch_with_details_and_metrics_payload(const char *a1, int a2, const char *a3, const char *a4, const char *a5, uint64_t a6, os_signpost_id_t *a7, xpc_object_t *a8)
{
  NSObject *v16;
  os_signpost_id_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t value;
  const char *v28;

  v16 = alm_FrontBoard_lifecycle_log_s_log;
  if (!alm_FrontBoard_lifecycle_log_s_log)
  {
    v16 = os_log_create("com.apple.FrontBoard", "AppLaunch");
    alm_FrontBoard_lifecycle_log_s_log = (uint64_t)v16;
  }
  v17 = os_signpost_id_generate(v16);
  value = a6;
  alm_app_will_launch_with_signpost_id((uint64_t)a1, a2, a3, a4, a6, v17);
  *a7 = v17;
  if (a8)
  {
    v28 = a5;
    v18 = (void *)nw_activity_create();
    v19 = (void *)nw_activity_create();
    nw_activity_activate();
    nw_activity_activate();
    *a8 = xpc_dictionary_create(0, 0, 0);
    v20 = (void *)nw_activity_copy_xpc_object();
    v21 = (void *)nw_activity_copy_xpc_object();
    xpc_dictionary_set_value(*a8, "appLaunchActivity", v20);
    xpc_dictionary_set_value(*a8, "extendedAppLaunchActivity", v21);
    nw_release(v18);
    nw_release(v19);
    xpc_release(v20);
    xpc_release(v21);
    v22 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      v22 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v22;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      alm_app_will_launch_with_details_and_metrics_payload_cold_5();
    if (_os_feature_enabled_impl())
    {
      if (!*a8)
        *a8 = xpc_dictionary_create(0, 0, 0);
      if ((os_variant_has_internal_diagnostics() & 1) == 0 && (!v28 || strncmp(v28, "com.apple.", 0xAuLL)))
      {
        if (alm_ca_hit_3rd_party_bundle_capture_limit_per_day())
        {
          v24 = alm_general_log_s_log;
          if (!alm_general_log_s_log)
          {
            v24 = os_log_create("com.apple.app_launch_measurement", "General");
            alm_general_log_s_log = (uint64_t)v24;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            alm_app_will_launch_with_details_and_metrics_payload_cold_2(v24);
LABEL_41:
          xpc_dictionary_set_BOOL(*a8, "should_capture_launch", 0);
          return;
        }
        arc4random_stir();
        if (-1431655765 * arc4random() >= 0x55555556)
        {
          v25 = alm_general_log_s_log;
          if (!alm_general_log_s_log)
          {
            v25 = os_log_create("com.apple.app_launch_measurement", "General");
            alm_general_log_s_log = (uint64_t)v25;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            alm_app_will_launch_with_details_and_metrics_payload_cold_4((uint64_t)v28, v25);
          goto LABEL_41;
        }
        ++_MergedGlobals;
        v26 = alm_general_log_s_log;
        if (!alm_general_log_s_log)
        {
          v26 = os_log_create("com.apple.app_launch_measurement", "General");
          alm_general_log_s_log = (uint64_t)v26;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          alm_app_will_launch_with_details_and_metrics_payload_cold_3((uint64_t)v28, v26);
      }
      xpc_dictionary_set_BOOL(*a8, "should_capture_launch", 1);
      s_ca_metrics = 0;
      qword_253CF90FC = 0;
      word_253CF90F9 = 0;
      xmmword_253CF9108 = 0u;
      *(_OWORD *)&qword_253CF9118 = 0u;
      unk_253CF9121 = 0u;
      qword_253CF9138 = 0;
      *(_OWORD *)&qword_253CF9140 = 0u;
      byte_253CF9150 = 0;
      xmmword_253CF9158 = 0u;
      byte_253CF9168 = 0;
      xmmword_253CF9170 = 0u;
      dword_253CF9180 = 0;
      if (a1)
        xpc_dictionary_set_string(*a8, "transition_source", a1);
      if (a3)
        xpc_dictionary_set_string(*a8, "bundle_version", a3);
      if (a4)
        xpc_dictionary_set_string(*a8, "bundle_short_version_string", a4);
      if (v28)
        xpc_dictionary_set_string(*a8, "bundle_id", v28);
      if (v17)
        xpc_dictionary_set_uint64(*a8, "launch_id", v17);
      xpc_dictionary_set_BOOL(*a8, "is_background", a2);
      xpc_dictionary_set_uint64(*a8, "launch_begin_time", value);
      s_payload_metrics = (uint64_t)*a8;
      *(_QWORD *)&xmmword_253CF9108 = v17;
      xpc_dictionary_set_uint64((xpc_object_t)s_payload_metrics, "shared_cache_cryptex_ext_count", alm_app_will_launch_with_details_and_metrics_payload_shared_cache_cryptex_count);
      if (_os_feature_enabled_impl()
        && alm_app_will_launch_with_details_and_metrics_payload_dispatch_token != -1)
      {
        dispatch_once(&alm_app_will_launch_with_details_and_metrics_payload_dispatch_token, &__block_literal_global_25);
      }
      xpc_dictionary_set_uint64(*a8, "file_system_months", alm_app_will_launch_with_details_and_metrics_payload_num_months_since_last_erase_install);
      v23 = alm_general_log_s_log;
      if (!alm_general_log_s_log)
      {
        v23 = os_log_create("com.apple.app_launch_measurement", "General");
        alm_general_log_s_log = (uint64_t)v23;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        alm_app_will_launch_with_details_and_metrics_payload_cold_1();
    }
  }
}

void alm_app_will_launch_with_signpost_id(uint64_t a1, int a2, const char *a3, const char *a4, uint64_t a5, os_signpost_id_t a6)
{
  NSObject *v10;
  unint64_t v11;
  const char *v12;
  NSObject *v13;
  int v14;
  _BYTE v15[28];
  char __dst[515];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  alm_build_version_string(__dst, a3, a4);
  v10 = alm_FrontBoard_lifecycle_log_s_log;
  if (!alm_FrontBoard_lifecycle_log_s_log)
  {
    v10 = os_log_create("com.apple.FrontBoard", "AppLaunch");
    alm_FrontBoard_lifecycle_log_s_log = (uint64_t)v10;
  }
  v11 = a6 - 1;
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v12 = "YES";
    v14 = 136446722;
    *(_QWORD *)v15 = a1;
    if (a2)
      v12 = "NO";
    *(_WORD *)&v15[8] = 2082;
    *(_QWORD *)&v15[10] = v12;
    *(_WORD *)&v15[18] = 2050;
    *(_QWORD *)&v15[20] = a5;
    _os_signpost_emit_with_name_impl(&dword_206582000, v10, OS_SIGNPOST_INTERVAL_BEGIN, a6, "AppLaunch", "TransitionSource=%{public, signpost.telemetry:string1}s IsForeground=%{public, signpost.telemetry:string2}s %{public, signpost.description:begin_time}llu enableTelemetry=YES ", (uint8_t *)&v14, 0x20u);
  }
  v13 = alm_application_launch_log_s_log;
  if (!alm_application_launch_log_s_log)
  {
    v13 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v13;
  }
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v14 = 67240706;
    *(_DWORD *)v15 = a2 ^ 1;
    *(_WORD *)&v15[4] = 2082;
    *(_QWORD *)&v15[6] = __dst;
    *(_WORD *)&v15[14] = 2050;
    *(_QWORD *)&v15[16] = a5;
    _os_signpost_emit_with_name_impl(&dword_206582000, v13, OS_SIGNPOST_INTERVAL_BEGIN, a6, "ApplicationFirstFramePresentation", "IsForeground=%{public, signpost.telemetry:number1}d AppVersion=%{public, signpost.telemetry:string1}s %{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0x1Cu);
    v13 = alm_application_launch_log_s_log;
  }
  if (!v13)
  {
    v13 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v13;
  }
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v14 = 67240706;
    *(_DWORD *)v15 = a2 ^ 1;
    *(_WORD *)&v15[4] = 2082;
    *(_QWORD *)&v15[6] = __dst;
    *(_WORD *)&v15[14] = 2050;
    *(_QWORD *)&v15[16] = a5;
    _os_signpost_emit_with_name_impl(&dword_206582000, v13, OS_SIGNPOST_INTERVAL_BEGIN, a6, "ApplicationFirstFramePresentationResponsive", "IsForeground=%{public, signpost.telemetry:number1}d AppVersion=%{public, signpost.telemetry:string1}s %{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0x1Cu);
    v13 = alm_application_launch_log_s_log;
  }
  if (!v13)
  {
    v13 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v13;
  }
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v14 = 67240706;
    *(_DWORD *)v15 = a2 ^ 1;
    *(_WORD *)&v15[4] = 2082;
    *(_QWORD *)&v15[6] = __dst;
    *(_WORD *)&v15[14] = 2050;
    *(_QWORD *)&v15[16] = a5;
    _os_signpost_emit_with_name_impl(&dword_206582000, v13, OS_SIGNPOST_INTERVAL_BEGIN, a6, "ApplicationLaunchExtendedResponsive", "IsForeground=%{public, signpost.telemetry:number1}d AppVersion=%{public, signpost.telemetry:string1}s %{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0x1Cu);
  }
}

void alm_app_will_activate_with_signpost_id(uint64_t a1, int a2, const char *a3, const char *a4, uint64_t a5, os_signpost_id_t a6)
{
  int v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  int v14;
  char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  char __dst[515];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  alm_build_version_string(__dst, a3, a4);
  v9 = _os_feature_enabled_impl();
  if (a6 && v9)
  {
    v10 = (_QWORD)xmmword_253CF9108 != a6 || s_payload_metrics == 0;
    if (!v10 && MEMORY[0x20BCF9804]() == MEMORY[0x24BDACFA0])
      xpc_dictionary_set_uint64((xpc_object_t)s_payload_metrics, "activation_time", a5);
  }
  v11 = alm_application_launch_log_s_log;
  if (!alm_application_launch_log_s_log)
  {
    v11 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v11;
  }
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v12 = "YES";
    v15 = __dst;
    v14 = 136446722;
    if (a2)
      v12 = "NO";
    v16 = 2082;
    v17 = v12;
    v18 = 2050;
    v19 = a5;
    _os_signpost_emit_with_name_impl(&dword_206582000, v11, OS_SIGNPOST_INTERVAL_BEGIN, a6, "ApplicationActivationFirstFramePresentation", "AppVersion=%{public, signpost.telemetry:string1}s IsForeground=%{public, signpost.telemetry:string2}s %{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0x20u);
    v11 = alm_application_launch_log_s_log;
  }
  if (!v11)
  {
    v11 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v11;
  }
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = "YES";
    v15 = __dst;
    v14 = 136446722;
    if (a2)
      v13 = "NO";
    v16 = 2082;
    v17 = v13;
    v18 = 2050;
    v19 = a5;
    _os_signpost_emit_with_name_impl(&dword_206582000, v11, OS_SIGNPOST_INTERVAL_BEGIN, a6, "ApplicationActivationFirstFramePresentationResponsive", "AppVersion=%{public, signpost.telemetry:string1}s IsForeground=%{public, signpost.telemetry:string2}s %{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0x20u);
  }
}

size_t alm_build_version_string(char *__dst, const char *a2, const char *a3)
{
  size_t v5;

  if (a2)
    strlcpy(__dst, a2, 0x101uLL);
  else
    *(_QWORD *)__dst = 0x4E574F4E4B4E55;
  strlcat(__dst, "(", 0x203uLL);
  if (a3)
  {
    v5 = strlen(__dst);
    strlcat(__dst, a3, v5 + 257);
  }
  else
  {
    *(_QWORD *)&__dst[strlen(__dst)] = 0x4E574F4E4B4E55;
  }
  return strlcat(__dst, ")", 0x203uLL);
}

void alm_app_did_present_with_metrics_payload(os_signpost_id_t a1, void *a2, int a3, uint64_t a4)
{
  int v8;
  uint64_t v9;
  const char *string;
  int v11;
  dispatch_time_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  xpc_object_t value;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  _QWORD v22[8];
  int v23;
  char v24;
  uint8_t buf[4];
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = _os_feature_enabled_impl();
  v9 = MEMORY[0x24BDACFA0];
  if (a2 && v8 && MEMORY[0x20BCF9804](a2) == v9 && xpc_dictionary_get_BOOL(a2, "should_capture_launch"))
  {
    string = xpc_dictionary_get_string(a2, "bundle_id");
    xpc_dictionary_get_string(a2, "transition_source");
    xpc_dictionary_get_string(a2, "bundle_version");
    xpc_dictionary_get_string(a2, "bundle_short_version_string");
    if (a1 && (_QWORD)xmmword_253CF9108 != a1)
    {
      qword_253CF90FC = 0;
      word_253CF90F9 = 0;
      xmmword_253CF9108 = 0u;
      *(_OWORD *)&qword_253CF9118 = 0u;
      unk_253CF9121 = 0u;
      qword_253CF9138 = 0;
      *(_OWORD *)&qword_253CF9140 = 0u;
      byte_253CF9150 = 0;
      xmmword_253CF9158 = 0u;
      byte_253CF9168 = 0;
      xmmword_253CF9170 = 0u;
      dword_253CF9180 = 0;
    }
    s_ca_metrics = 1;
    HIBYTE(dword_253CF9180) = 1;
    if (string && strnlen(string, 0x80uLL) > 4 || alm_retreive_process_name(byte_253CF8FF9, 0x100uLL))
      __strlcpy_chk();
    __strlcpy_chk();
    __strlcpy_chk();
    __strlcpy_chk();
    LOBYTE(word_253CF90F9) = xpc_dictionary_get_BOOL(a2, "is_background");
    *((_QWORD *)&xmmword_253CF9108 + 1) = xpc_dictionary_get_uint64(a2, "launch_begin_time");
    *(_QWORD *)&xmmword_253CF9108 = xpc_dictionary_get_uint64(a2, "launch_id");
    qword_253CF9138 = xpc_dictionary_get_uint64(a2, "activation_time");
    *(_QWORD *)&xmmword_253CF9170 = xpc_dictionary_get_uint64(a2, "shared_cache_cryptex_ext_count");
    *((_QWORD *)&xmmword_253CF9170 + 1) = xpc_dictionary_get_uint64(a2, "file_system_months");
  }
  s_frontboard_launch_signpost_id = a1;
  s_alm_launch_signpost_id = a1;
  v11 = _alm_build_launch_info();
  if (_os_feature_enabled_impl() && s_ca_metrics)
  {
    LODWORD(qword_253CF90FC) = v11;
    unk_253CF9120 = mach_continuous_time();
    v12 = dispatch_time(0, 20000000000);
    dispatch_after(v12, MEMORY[0x24BDAC9B8], &__block_literal_global_79);
  }
  v13 = alm_application_launch_log_s_log;
  if (!alm_application_launch_log_s_log)
  {
    v13 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v13;
  }
  if (a1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 67240192;
    v26 = v11;
    _os_signpost_emit_with_name_impl(&dword_206582000, v13, OS_SIGNPOST_INTERVAL_END, a1, "ApplicationFirstFramePresentation", "LaunchInfo=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", buf, 8u);
  }
  alm_did_reach_launch_milestone(1);
  if (s_launch_task_count)
    v14 = 1;
  else
    v14 = a3;
  if (_os_feature_enabled_impl())
    HIBYTE(word_253CF90F9) = v14;
  if (a2)
  {
    if (MEMORY[0x20BCF9804](a2) == v9)
    {
      value = xpc_dictionary_get_value(a2, "appLaunchActivity");
      v19 = xpc_retain(value);
      v20 = xpc_dictionary_get_value(a2, "extendedAppLaunchActivity");
      v21 = xpc_retain(v20);
      a2 = (void *)nw_activity_create_from_xpc_object();
      v15 = nw_activity_create_from_xpc_object();
      nw_activity_set_global_parent();
      xpc_release(v19);
      xpc_release(v21);
      if (v14)
        goto LABEL_30;
      goto LABEL_45;
    }
    a2 = 0;
  }
  v15 = 0;
  if (v14)
  {
LABEL_30:
    v16 = uikit_app_lifecycle_log_s_log;
    if (!uikit_app_lifecycle_log_s_log)
    {
      v16 = os_log_create("com.apple.UIKit", "AppLifecycle");
      uikit_app_lifecycle_log_s_log = (uint64_t)v16;
    }
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_206582000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtendedAppLaunch", " enableTelemetry=YES ", buf, 2u);
    }
    if ((s_launch_milestones & 4) != 0)
    {
      if (_os_feature_enabled_impl())
        *(_QWORD *)&xmmword_253CF9158 = mach_continuous_time();
      v17 = alm_application_launch_log_s_log;
      if (!alm_application_launch_log_s_log)
      {
        v17 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
        alm_application_launch_log_s_log = (uint64_t)v17;
      }
      if (a1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_206582000, v17, OS_SIGNPOST_INTERVAL_BEGIN, a1, "ApplicationLaunchExtendedOnlyResponsive", "", buf, 2u);
      }
    }
    if (_os_feature_enabled_impl())
      qword_253CF9118 = mach_continuous_time();
    goto LABEL_48;
  }
LABEL_45:
  if (_os_feature_enabled_impl())
    qword_253CF9118 = mach_continuous_time();
  alm_did_reach_launch_milestone(12);
LABEL_48:
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 0x40000000;
  v22[2] = __alm_app_did_present_with_metrics_payload_block_invoke_2;
  v22[3] = &unk_24BF2B7D0;
  v24 = v14;
  v22[6] = a2;
  v22[7] = v15;
  v23 = v11;
  v22[4] = a4;
  v22[5] = a1;
  alm_execute_when_main_queue_idle_with_condition((uint64_t)&__block_literal_global_36, (uint64_t)v22);
}

void alm_did_reach_launch_milestone(int a1)
{
  int ca_send_event_from_reached_milestone;
  char v3;
  NSObject *global_queue;
  void (**v5)(_QWORD);
  _QWORD block[4];
  char v8;

  s_launch_milestones &= ~(_BYTE)a1;
  if (_os_feature_enabled_impl())
  {
    ca_send_event_from_reached_milestone = alm_get_ca_send_event_from_reached_milestone(a1);
    if (ca_send_event_from_reached_milestone != 2)
    {
      v3 = ca_send_event_from_reached_milestone;
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __alm_did_reach_launch_milestone_block_invoke;
      block[3] = &__block_descriptor_tmp_45;
      v8 = v3;
      dispatch_async(global_queue, block);
    }
  }
  v5 = (void (**)(_QWORD))s_measurement_complete_handler;
  if ((s_launch_milestones & 0xF) == 0 && s_measurement_complete_handler != 0)
  {
    s_measurement_complete_handler = 0;
    v5[2](v5);
    _Block_release(v5);
  }
}

uint64_t _alm_build_launch_info()
{
  int v0;
  float tv_sec;
  unsigned int v2;
  int v3;
  double v4;
  int v5;
  timespec v7;

  v7.tv_sec = 0;
  v7.tv_nsec = 0;
  v0 = clock_gettime(_CLOCK_MONOTONIC_RAW_APPROX, &v7);
  tv_sec = (float)v7.tv_sec;
  v2 = _dyld_launch_mode();
  v3 = v2 & 7 | (8 * ((v2 >> 4) & 1));
  v4 = tv_sec / 10.0;
  if (v0)
    v4 = 0.0;
  v5 = llround(log2(ceil(v4)));
  if (v5 >= 15)
    v5 = 15;
  return v3 | (32 * v5);
}

void alm_execute_when_main_queue_idle_with_condition(uint64_t a1, uint64_t a2)
{
  void *v4;
  dispatch_time_t v5;
  _QWORD aBlock[12];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  _QWORD v13[3];
  __int16 v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  mach_timebase_info info;

  if (!a2)
    alm_execute_when_main_queue_idle_with_condition_cold_1();
  info = 0;
  mach_timebase_info(&info);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2000000000;
  v22 = 0;
  v22 = mach_continuous_time();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2000000000;
  v18 = 0;
  v18 = v20[3];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2000000000;
  v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2000000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3002000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = __alm_execute_when_main_queue_idle_with_condition_block_invoke;
  aBlock[3] = &unk_24BF2B958;
  aBlock[6] = v13;
  aBlock[7] = v15;
  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[8] = v17;
  aBlock[9] = &v7;
  aBlock[10] = &v19;
  aBlock[11] = info;
  v4 = _Block_copy(aBlock);
  v8[5] = (uint64_t)v4;
  v5 = dispatch_time(0, 3000000);
  dispatch_after(v5, MEMORY[0x24BDAC9B8], (dispatch_block_t)v8[5]);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);
}

void __alm_execute_when_main_queue_idle_with_condition_block_invoke(uint64_t a1)
{
  unsigned int v2;
  char v3;
  char v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  dispatch_time_t v12;
  __int16 v13;
  __int16 v14;
  uint8_t buf[16];

  v2 = *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v2 > 0x1F4)
    v4 = 1;
  else
    v4 = v3;
  if ((v4 & 1) != 0)
  {
    if (v2 >= 0x1F5)
    {
      v5 = alm_general_log_s_log;
      if (!alm_general_log_s_log)
      {
        v5 = os_log_create("com.apple.app_launch_measurement", "General");
        alm_general_log_s_log = (uint64_t)v5;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206582000, v5, OS_LOG_TYPE_DEFAULT, "Bailing responsive launch check as reached maximum count", buf, 2u);
      }
    }
    goto LABEL_12;
  }
  if (*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) > 9u)
  {
LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    _Block_release(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = 0;
    return;
  }
  ++*(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v6 = mach_continuous_time();
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if ((v6 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
     * *(unsigned int *)(a1 + 88)
     / *(unsigned int *)(a1 + 92) > 0x7A11FF)
  {
    *(_BYTE *)(v8 + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v6;
    v9 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      v9 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v9;
    }
    if (!os_signpost_enabled(v9))
      goto LABEL_23;
    v13 = 0;
    v10 = "ResponsiveCheckFailed";
    v11 = (uint8_t *)&v13;
  }
  else
  {
    ++*(_BYTE *)(v8 + 24);
    v9 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      v9 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v9;
    }
    if (!os_signpost_enabled(v9))
      goto LABEL_23;
    v14 = 0;
    v10 = "ResponsiveCheckSucceeded";
    v11 = (uint8_t *)&v14;
  }
  _os_signpost_emit_with_name_impl(&dword_206582000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v10, "", v11, 2u);
LABEL_23:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v7;
  v12 = dispatch_time(0, 3000000);
  dispatch_after(v12, MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
}

uint64_t __alm_app_did_present_with_metrics_payload_block_invoke()
{
  return s_bail_responsive_launch & 1;
}

uint64_t __alm_app_extended_launch_end_with_details_block_invoke()
{
  return s_bail_responsive_launch & 1;
}

void __alm_app_did_present_with_metrics_payload_block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v9;
  int v10;
  NSObject *v11;
  os_signpost_id_t v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = alm_application_launch_log_s_log;
  if (a2)
  {
    if (!alm_application_launch_log_s_log)
    {
      v4 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v4;
    }
    v5 = *(_QWORD *)(a1 + 40);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_206582000, v4, OS_SIGNPOST_INTERVAL_END, v5, "ApplicationFirstFramePresentationResponsive", " BAILED=yes ", (uint8_t *)&v17, 2u);
    }
    if (_os_feature_enabled_impl())
    {
      qword_253CF9128 = mach_continuous_time();
      byte_253CF9130 = 1;
    }
    if (*(_QWORD *)(a1 + 48))
      nw_activity_complete_with_reason();
    if (!*(_BYTE *)(a1 + 68))
    {
      v6 = alm_application_launch_log_s_log;
      if (!alm_application_launch_log_s_log)
      {
        v6 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
        alm_application_launch_log_s_log = (uint64_t)v6;
      }
      v7 = *(_QWORD *)(a1 + 40);
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        LOWORD(v17) = 0;
        _os_signpost_emit_with_name_impl(&dword_206582000, v6, OS_SIGNPOST_INTERVAL_END, v7, "ApplicationLaunchExtendedResponsive", " BAILED=yes ", (uint8_t *)&v17, 2u);
      }
      if (_os_feature_enabled_impl())
      {
        qword_253CF9148 = mach_continuous_time();
        byte_253CF9150 = 1;
      }
      if (*(_QWORD *)(a1 + 56))
LABEL_39:
        nw_activity_complete_with_reason();
    }
  }
  else
  {
    if (!alm_application_launch_log_s_log)
    {
      v4 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v4;
    }
    v9 = *(_QWORD *)(a1 + 40);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      v10 = *(_DWORD *)(a1 + 64);
      v17 = 134218240;
      v18 = a3;
      v19 = 1026;
      v20 = v10;
      _os_signpost_emit_with_name_impl(&dword_206582000, v4, OS_SIGNPOST_INTERVAL_END, v9, "ApplicationFirstFramePresentationResponsive", "%{signpost.description:end_time}llu LaunchInfo=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", (uint8_t *)&v17, 0x12u);
    }
    if (*(_QWORD *)(a1 + 48))
      nw_activity_complete_with_reason();
    if (_os_feature_enabled_impl())
    {
      qword_253CF9128 = a3;
      byte_253CF9130 = 0;
    }
    if (!*(_BYTE *)(a1 + 68))
    {
      v11 = alm_application_launch_log_s_log;
      if (!alm_application_launch_log_s_log)
      {
        v11 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
        alm_application_launch_log_s_log = (uint64_t)v11;
      }
      v12 = *(_QWORD *)(a1 + 40);
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        v13 = *(_DWORD *)(a1 + 64);
        v17 = 134218240;
        v18 = a3;
        v19 = 1026;
        v20 = v13;
        _os_signpost_emit_with_name_impl(&dword_206582000, v11, OS_SIGNPOST_INTERVAL_END, v12, "ApplicationLaunchExtendedResponsive", "%{signpost.description:end_time}llu LaunchInfo=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", (uint8_t *)&v17, 0x12u);
      }
      if (_os_feature_enabled_impl())
      {
        qword_253CF9148 = a3;
        byte_253CF9150 = 0;
      }
      if (*(_QWORD *)(a1 + 56))
        goto LABEL_39;
    }
  }
  if (!*(_BYTE *)(a1 + 68))
    nw_activity_set_global_parent();
  v14 = *(void **)(a1 + 48);
  if (v14)
    nw_release(v14);
  v15 = *(void **)(a1 + 56);
  if (v15)
    nw_release(v15);
  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    (*(void (**)(void))(v16 + 16))();
  alm_did_reach_launch_milestone(2);
}

void __alm_app_extended_launch_end_with_details_block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  char v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v10;
  int v11;
  NSObject *v12;
  os_signpost_id_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = s_launch_milestones;
  v5 = alm_application_launch_log_s_log;
  if (a2)
  {
    if (!alm_application_launch_log_s_log)
    {
      v5 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v5;
    }
    v6 = *(_QWORD *)(a1 + 40);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_206582000, v5, OS_SIGNPOST_INTERVAL_END, v6, "ApplicationLaunchExtendedResponsive", " BAILED=yes ", (uint8_t *)&v17, 2u);
    }
    if (_os_feature_enabled_impl())
    {
      qword_253CF9148 = mach_continuous_time();
      byte_253CF9150 = 1;
    }
    if ((v4 & 1) == 0)
    {
      v7 = alm_application_launch_log_s_log;
      if (!alm_application_launch_log_s_log)
      {
        v7 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
        alm_application_launch_log_s_log = (uint64_t)v7;
      }
      v8 = *(_QWORD *)(a1 + 40);
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        LOWORD(v17) = 0;
        _os_signpost_emit_with_name_impl(&dword_206582000, v7, OS_SIGNPOST_INTERVAL_END, v8, "ApplicationLaunchExtendedOnlyResponsive", " BAILED=yes", (uint8_t *)&v17, 2u);
      }
      byte_253CF9168 = 1;
      *((_QWORD *)&xmmword_253CF9158 + 1) = mach_continuous_time();
    }
    if (*(_QWORD *)(a1 + 48))
LABEL_34:
      nw_activity_complete_with_reason();
  }
  else
  {
    if (!alm_application_launch_log_s_log)
    {
      v5 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v5;
    }
    v10 = *(_QWORD *)(a1 + 40);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      v11 = *(_DWORD *)(a1 + 56);
      v17 = 134218240;
      v18 = a3;
      v19 = 1026;
      v20 = v11;
      _os_signpost_emit_with_name_impl(&dword_206582000, v5, OS_SIGNPOST_INTERVAL_END, v10, "ApplicationLaunchExtendedResponsive", "%{signpost.description:end_time}llu LaunchInfo=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", (uint8_t *)&v17, 0x12u);
    }
    if (_os_feature_enabled_impl())
    {
      byte_253CF9150 = 0;
      qword_253CF9148 = a3;
    }
    if ((v4 & 1) == 0)
    {
      v12 = alm_application_launch_log_s_log;
      if (!alm_application_launch_log_s_log)
      {
        v12 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
        alm_application_launch_log_s_log = (uint64_t)v12;
      }
      v13 = *(_QWORD *)(a1 + 40);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        v14 = *(_DWORD *)(a1 + 56);
        v17 = 134218240;
        v18 = a3;
        v19 = 1026;
        v20 = v14;
        _os_signpost_emit_with_name_impl(&dword_206582000, v12, OS_SIGNPOST_INTERVAL_END, v13, "ApplicationLaunchExtendedOnlyResponsive", "%{signpost.description:end_time}llu LaunchInfo=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", (uint8_t *)&v17, 0x12u);
      }
      if (_os_feature_enabled_impl())
      {
        byte_253CF9168 = 0;
        *((_QWORD *)&xmmword_253CF9158 + 1) = a3;
      }
    }
    if (*(_QWORD *)(a1 + 48))
      goto LABEL_34;
  }
  nw_activity_set_global_parent();
  v15 = *(void **)(a1 + 48);
  if (v15)
    nw_release(v15);
  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    (*(void (**)(void))(v16 + 16))();
  alm_did_reach_launch_milestone(8);
}

void alm_execute_when_measurement_complete(const void *a1)
{
  const void *v1;
  _QWORD v2[6];

  if (!a1)
    alm_execute_when_measurement_complete_cold_1();
  v1 = (const void *)s_measurement_complete_handler;
  if (s_measurement_complete_handler)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 0x40000000;
    v2[2] = __alm_execute_when_measurement_complete_block_invoke;
    v2[3] = &unk_24BF2B8C8;
    v2[4] = s_measurement_complete_handler;
    v2[5] = a1;
    s_measurement_complete_handler = (uint64_t)_Block_copy(v2);
    _Block_release(v1);
  }
  else
  {
    s_measurement_complete_handler = (uint64_t)_Block_copy(a1);
  }
}

BOOL alm_app_measurement_ongoing()
{
  if ((s_launch_milestones & 1) != 0)
    return 0;
  if ((s_launch_milestones & 4) == 0)
  {
    if ((s_launch_milestones & 0xF) != 0)
      return (s_bail_responsive_launch & 1) == 0;
    return 0;
  }
  return 1;
}

uint64_t __alm_execute_when_measurement_complete_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

double alm_ca_metric_info_init()
{
  double result;

  s_ca_metrics = 0;
  result = 0.0;
  qword_253CF90FC = 0;
  word_253CF90F9 = 0;
  xmmword_253CF9108 = 0u;
  *(_OWORD *)&qword_253CF9118 = 0u;
  unk_253CF9121 = 0u;
  qword_253CF9138 = 0;
  byte_253CF9150 = 0;
  *(_OWORD *)&qword_253CF9140 = 0u;
  xmmword_253CF9158 = 0u;
  byte_253CF9168 = 0;
  dword_253CF9180 = 0;
  xmmword_253CF9170 = 0u;
  return result;
}

uint64_t alm_get_currrent_ca_metric_info()
{
  return 0;
}

unint64_t alm_mach_time_to_ns(unint64_t a1, double a2, double a3, double a4)
{
  if (alm_mach_time_to_ns_onceToken != -1)
    dispatch_once(&alm_mach_time_to_ns_onceToken, &__block_literal_global);
  LODWORD(a3) = alm_mach_time_to_ns_timebase_info;
  LODWORD(a4) = *(_DWORD *)algn_253CF8E5C;
  return (unint64_t)((double)*(unint64_t *)&a3 / (double)*(unint64_t *)&a4 * (double)a1);
}

uint64_t __alm_mach_time_to_ns_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&alm_mach_time_to_ns_timebase_info);
}

os_log_t uikit_app_lifecycle_log()
{
  os_log_t result;

  result = (os_log_t)uikit_app_lifecycle_log_s_log;
  if (!uikit_app_lifecycle_log_s_log)
  {
    result = os_log_create("com.apple.UIKit", "AppLifecycle");
    uikit_app_lifecycle_log_s_log = (uint64_t)result;
  }
  return result;
}

os_log_t alm_application_launch_log()
{
  os_log_t result;

  result = (os_log_t)alm_application_launch_log_s_log;
  if (!alm_application_launch_log_s_log)
  {
    result = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)result;
  }
  return result;
}

os_log_t alm_FrontBoard_lifecycle_log()
{
  os_log_t result;

  result = (os_log_t)alm_FrontBoard_lifecycle_log_s_log;
  if (!alm_FrontBoard_lifecycle_log_s_log)
  {
    result = os_log_create("com.apple.FrontBoard", "AppLaunch");
    alm_FrontBoard_lifecycle_log_s_log = (uint64_t)result;
  }
  return result;
}

uint64_t alm_build_launch_info(uint64_t (*a1)(void), uint64_t a2)
{
  unsigned int v3;
  int v4;
  int v5;

  v3 = a1();
  v4 = v3 & 7 | (8 * ((v3 >> 4) & 1));
  v5 = llround(log2(ceil((float)a2 / 10.0)));
  if (v5 >= 15)
    v5 = 15;
  return v4 | (32 * v5);
}

void alm_app_will_launch(const char *a1, int a2, uint64_t a3, os_signpost_id_t *a4)
{
  alm_app_will_launch_with_details_and_metrics_payload(a1, a2, "UNKNOWN", "UNKNOWN", 0, a3, a4, 0);
}

void alm_app_will_launch_with_details(const char *a1, int a2, const char *a3, const char *a4, uint64_t a5, os_signpost_id_t *a6)
{
  alm_app_will_launch_with_details_and_metrics_payload(a1, a2, a3, a4, 0, a5, a6, 0);
}

uint64_t alm_is_internal_variant_os()
{
  return os_variant_has_internal_diagnostics();
}

BOOL alm_is_internal_app(char *__s1, uint64_t a2)
{
  _BOOL8 result;

  result = 0;
  if (__s1)
  {
    if (a2)
      return strncmp(__s1, "com.apple.", 0xAuLL) == 0;
  }
  return result;
}

BOOL alm_ca_hit_3rd_party_bundle_capture_limit_per_day()
{
  uint64_t v0;
  double v1;
  double v2;
  double v3;
  uint64_t v4;
  NSObject *v5;

  v0 = mach_continuous_time();
  v4 = v0;
  if (!qword_254512980 || alm_mach_time_to_ns(v0 - qword_254512980, v1, v2, v3) >= 0x4E94914F0001)
  {
    _MergedGlobals = 0;
    qword_254512980 = v4;
    v5 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      v5 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v5;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      alm_ca_hit_3rd_party_bundle_capture_limit_per_day_cold_1();
  }
  return _MergedGlobals > 3u;
}

BOOL alm_ca_should_random_sampling_3rd_party_data()
{
  arc4random_stir();
  return -1431655765 * arc4random() < 0x55555556;
}

uint64_t __alm_app_will_launch_with_details_and_metrics_payload_block_invoke()
{
  NSObject *global_queue;
  uint64_t result;

  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, &__block_literal_global_27);
  result = alm_get_num_months_since_last_erase_install();
  alm_app_will_launch_with_details_and_metrics_payload_num_months_since_last_erase_install = result;
  return result;
}

uint64_t __alm_app_will_launch_with_details_and_metrics_payload_block_invoke_2()
{
  uint64_t result;

  result = alm_count_cryptex_file_extents("/private/preboot/cryptex1/current/os.dmg");
  alm_app_will_launch_with_details_and_metrics_payload_shared_cache_cryptex_count = result;
  return result;
}

uint64_t alm_count_cryptex_file_extents(const char *a1)
{
  int v1;
  int v2;
  uint64_t v3;
  off_t st_size;
  off_t v6;
  int v7;
  off_t v8;
  off_t v9;
  stat v10;

  if (!a1)
    return 0;
  v1 = open(a1, 0, 0);
  if (v1 < 0)
    return 0;
  v2 = v1;
  memset(&v10, 0, sizeof(v10));
  if (fstat(v1, &v10) || (st_size = v10.st_size, v10.st_size < 1))
  {
    v3 = 0;
  }
  else
  {
    v6 = 0;
    v3 = 0;
    do
    {
      v7 = 0;
      v8 = st_size - v6;
      v9 = v6;
      if (fcntl(v2, 65, &v7))
        break;
      if (!v8)
        break;
      v6 += v8;
      ++v3;
    }
    while (v6 < st_size);
  }
  close(v2);
  return v3;
}

uint64_t alm_get_num_months_since_last_erase_install()
{
  uint64_t result;
  unsigned int v1;
  unint64_t v2;
  timespec __tp;

  v2 = 0;
  fsctl("/var/mobile", 0x40086804uLL, &v2, 0);
  if (!v2)
    return 0;
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  result = 0;
  if (__tp.tv_sec >= v2)
  {
    v1 = ((double)(__tp.tv_sec - v2) / 2629743.83);
    if (v1 <= 1)
      return 1;
    else
      return v1;
  }
  return result;
}

void alm_app_did_present(os_signpost_id_t a1, int a2, uint64_t a3)
{
  alm_app_did_present_with_metrics_payload(a1, 0, a2, a3);
}

uint64_t alm_retreive_process_name(char *a1, size_t a2)
{
  pid_t v4;
  _OWORD buffer[16];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a1 && (memset(buffer, 0, sizeof(buffer)), v4 = getpid(), proc_name(v4, buffer, 0x100u)))
    return (snprintf(a1, a2, "(P)%s", (const char *)buffer) >> 31);
  else
    return 0xFFFFFFFFLL;
}

BOOL alm_has_running_launch_task()
{
  return s_launch_task_count != 0;
}

BOOL alm_has_reached_launch_milestone(char a1)
{
  return (s_launch_milestones & a1) == 0;
}

uint64_t alm_is_responsive_launch_bailed()
{
  return s_bail_responsive_launch & 1;
}

void alm_app_extended_launch_end(uint64_t a1, uint64_t a2)
{
  alm_app_extended_launch_end_with_details(a1, 0, a2);
}

void alm_app_did_activate_with_responsive_check(os_signpost_id_t a1, int a2, uint64_t a3)
{
  NSObject *v6;
  int v7;
  NSObject *v8;
  _QWORD v9[6];
  int v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    qword_253CF9140 = mach_continuous_time();
    HIDWORD(qword_253CF90FC) = a2;
  }
  if ((a2 & 2) != 0)
  {
    v7 = _alm_build_launch_info();
    v8 = alm_application_launch_log_s_log;
    if (!alm_application_launch_log_s_log)
    {
      v8 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v8;
    }
    if (a1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 67240448;
      v12 = a2;
      v13 = 1026;
      v14 = v7;
      _os_signpost_emit_with_name_impl(&dword_206582000, v8, OS_SIGNPOST_INTERVAL_END, a1, "ApplicationActivationFirstFramePresentation", "ActivationFlag=%{public, signpost.telemetry:number1}d LaunchInfo=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", buf, 0xEu);
    }
    if (_os_feature_enabled_impl())
      LODWORD(qword_253CF90FC) = v7;
  }
  else
  {
    v6 = alm_application_launch_log_s_log;
    if (!alm_application_launch_log_s_log)
    {
      v6 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v6;
    }
    if (a1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 67240192;
      v12 = a2;
      _os_signpost_emit_with_name_impl(&dword_206582000, v6, OS_SIGNPOST_INTERVAL_END, a1, "ApplicationActivationFirstFramePresentation", "ActivationFlag=%{public, signpost.telemetry:number1}d enableTelemetry=YES ", buf, 8u);
    }
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = __alm_app_did_activate_with_responsive_check_block_invoke_2;
  v9[3] = &unk_24BF2B880;
  v10 = a2;
  v9[4] = a3;
  v9[5] = a1;
  alm_execute_when_main_queue_idle_with_condition((uint64_t)&__block_literal_global_43, (uint64_t)v9);
}

uint64_t __alm_app_did_activate_with_responsive_check_block_invoke()
{
  return s_bail_responsive_launch & 1;
}

void __alm_app_did_activate_with_responsive_check_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v5;
  os_signpost_id_t v6;
  const char *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint32_t v10;
  os_signpost_id_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = alm_application_launch_log_s_log;
  if ((_DWORD)a2)
  {
    if (!alm_application_launch_log_s_log)
    {
      v5 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v5;
    }
    v6 = *(_QWORD *)(a1 + 40);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v15) = 0;
      v7 = " BAILED=yes ";
      v8 = v5;
      v9 = v6;
      v10 = 2;
LABEL_12:
      _os_signpost_emit_with_name_impl(&dword_206582000, v8, OS_SIGNPOST_INTERVAL_END, v9, "ApplicationActivationFirstFramePresentationResponsive", v7, (uint8_t *)&v15, v10);
    }
  }
  else
  {
    if (!alm_application_launch_log_s_log)
    {
      v5 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v5;
    }
    v12 = *(_QWORD *)(a1 + 40);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      v13 = *(_DWORD *)(a1 + 48);
      v15 = 134218240;
      v16 = a3;
      v17 = 1026;
      v18 = v13;
      v7 = "%{signpost.description:end_time}llu ActivationFlag=%{public, signpost.telemetry:number1}d enableTelemetry=YES ";
      v8 = v5;
      v9 = v12;
      v10 = 18;
      goto LABEL_12;
    }
  }
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 16))(v14, a2, a3, a4);
  alm_did_reach_launch_milestone(16);
}

void alm_clear_responsive_launch_bailed()
{
  s_bail_responsive_launch = 0;
}

void alm_reset_launch_milestone()
{
  s_launch_milestones = 15;
}

uint64_t alm_get_ca_send_event_from_reached_milestone(int a1)
{
  BOOL v2;
  uint64_t result;

  if (_os_feature_enabled_impl())
    v2 = s_ca_metrics == 0;
  else
    v2 = 1;
  result = 2;
  if (!v2 && HIBYTE(dword_253CF9180) != 0)
  {
    switch(a1)
    {
      case 1:
        if (!(_BYTE)dword_253CF9180)
        {
          result = 0;
          LOBYTE(dword_253CF9180) = 1;
        }
        break;
      case 2:
      case 8:
      case 10:
        if ((s_launch_milestones & 0xA) == 0 && !BYTE1(dword_253CF9180))
        {
          result = 1;
          BYTE1(dword_253CF9180) = 1;
        }
        break;
      default:
        return result;
    }
  }
  return result;
}

void alm_aggregate_and_send_ca_measurement_event(uint64_t a1, unsigned int a2)
{
  char *v3;
  NSObject *v4;

  if (a1 && a2 <= 1 && *(_BYTE *)(a1 + 779) && strnlen((const char *)(a1 + 385), 0x80uLL) >= 5)
  {
    v3 = a2
       ? "com.apple.app_launch_measurement.ExtendedLaunchMetrics"
       : "com.apple.app_launch_measurement.FirstFramePresentationMetric";
    if ((analytics_send_event_lazy() & 1) == 0)
    {
      v4 = alm_general_log_s_log;
      if (!alm_general_log_s_log)
      {
        v4 = os_log_create("com.apple.app_launch_measurement", "General");
        alm_general_log_s_log = (uint64_t)v4;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        alm_aggregate_and_send_ca_measurement_event_cold_1((uint64_t)v3, a2, v4);
    }
  }
}

void __alm_did_reach_launch_milestone_block_invoke(uint64_t a1)
{
  alm_aggregate_and_send_ca_measurement_event((uint64_t)&s_ca_metrics, *(unsigned __int8 *)(a1 + 32));
}

void alm_execute_when_main_queue_idle(uint64_t a1)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 0x40000000;
  v1[2] = __alm_execute_when_main_queue_idle_block_invoke_2;
  v1[3] = &unk_24BF2B930;
  v1[4] = a1;
  alm_execute_when_main_queue_idle_with_condition((uint64_t)&__block_literal_global_50, (uint64_t)v1);
}

uint64_t __alm_execute_when_main_queue_idle_block_invoke()
{
  return s_bail_responsive_launch & 1;
}

uint64_t __alm_execute_when_main_queue_idle_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL alm_is_running_launch_task(CFTypeRef cf1)
{
  unint64_t v2;
  BOOL v3;
  const void *v4;

  v2 = 0;
  v3 = 1;
  do
  {
    v4 = (const void *)s_launch_tasks[v2];
    if (v4 && CFEqual(cf1, v4))
      break;
    v3 = v2++ < 0xF;
  }
  while (v2 != 16);
  return v3;
}

uint64_t alm_will_start_extended_launch_task(const __CFString *a1)
{
  uint64_t result;
  uint64_t v3;

  if (!a1)
    return 1;
  if (CFStringGetLength(a1) > 256)
    return 1;
  if (s_launch_task_count > 0xFu)
    return 2;
  if ((s_launch_milestones & 4) == 0)
    return 3;
  if (alm_is_running_launch_task(a1))
    return 4;
  v3 = 0;
  while (s_launch_tasks[v3])
  {
    result = 0;
    if (++v3 == 16)
      return result;
  }
  s_launch_tasks[v3] = (uint64_t)a1;
  CFRetain(a1);
  result = 0;
  ++s_launch_task_count;
  return result;
}

uint64_t alm_did_finish_extended_launch_task(const __CFString *a1)
{
  BOOL v3;
  NSObject *v4;
  uint64_t v5;
  const void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!a1 || CFStringGetLength(a1) > 256)
    return 1;
  if (s_alm_launch_signpost_id)
    v3 = s_frontboard_launch_signpost_id == 0;
  else
    v3 = 1;
  if (v3)
  {
    v4 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      v4 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v4;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      alm_did_finish_extended_launch_task_cold_1();
    return 6;
  }
  else
  {
    v5 = 0;
    while (1)
    {
      v6 = (const void *)s_launch_tasks[v5];
      if (v6)
      {
        if (CFEqual(a1, v6))
          break;
      }
      if (++v5 == 16)
        return 5;
    }
    CFRelease((CFTypeRef)s_launch_tasks[v5]);
    s_launch_tasks[v5] = 0;
    if (!--s_launch_task_count)
    {
      v7 = alm_FrontBoard_lifecycle_log_s_log;
      if (!alm_FrontBoard_lifecycle_log_s_log)
      {
        v7 = os_log_create("com.apple.FrontBoard", "AppLaunch");
        alm_FrontBoard_lifecycle_log_s_log = (uint64_t)v7;
      }
      v8 = s_frontboard_launch_signpost_id;
      if ((unint64_t)(s_frontboard_launch_signpost_id - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        v9[0] = 67240192;
        v9[1] = 1;
        _os_signpost_emit_with_name_impl(&dword_206582000, v7, OS_SIGNPOST_INTERVAL_END, v8, "AppLaunch", "IsExtendedLaunch=%{public, signpost.telemetry:number1}u enableTelemetry=YES ", (uint8_t *)v9, 8u);
      }
      if (_os_feature_enabled_impl())
      {
        qword_253CF9118 = mach_continuous_time();
        HIBYTE(word_253CF90F9) = 1;
      }
      alm_app_extended_launch_end_with_details(s_alm_launch_signpost_id, 0, 0);
    }
    return 0;
  }
}

void alm_generate_ca_payload_from_metrics_data(uint64_t a1, int a2, void **a3)
{
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t ru_majflt;
  float disk_fullness_percentage;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  unint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  unint64_t v45;
  double v46;
  double v47;
  double v48;
  unint64_t v49;
  double v50;
  double v51;
  rusage v52;
  char __str[16];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  char string[515];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v14 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      v14 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v14;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      alm_generate_ca_payload_from_metrics_data_cold_1();
    return;
  }
  *a3 = xpc_dictionary_create(0, 0, 0);
  bzero(string, 0x203uLL);
  v55 = 0u;
  v56 = 0u;
  *(_OWORD *)__str = 0u;
  v54 = 0u;
  alm_build_version_string(string, (const char *)(a1 + 1), (const char *)(a1 + 129));
  snprintf(__str, 0x40uLL, "%llu", *(_QWORD *)(a1 + 656));
  alm_decode_dyld_launch_info_into_dict(*(_DWORD *)(a1 + 644), *a3);
  xpc_dictionary_set_string(*a3, "transition_source", (const char *)(a1 + 257));
  xpc_dictionary_set_string(*a3, "bundle_id", (const char *)(a1 + 385));
  xpc_dictionary_set_string(*a3, "version_string", string);
  xpc_dictionary_set_uint64(*a3, "is_background", *(unsigned __int8 *)(a1 + 641));
  xpc_dictionary_set_string(*a3, "launch_id", __str);
  xpc_dictionary_set_uint64(*a3, "launch_info", *(unsigned int *)(a1 + 644));
  if (_os_feature_enabled_impl())
  {
    v9 = *(_QWORD *)(a1 + 760);
    memset(&v52, 0, sizeof(v52));
    if (getrusage(0, &v52) >= 0)
      ru_majflt = v52.ru_majflt;
    else
      ru_majflt = 0;
    disk_fullness_percentage = alm_get_disk_fullness_percentage();
    xpc_dictionary_set_uint64(*a3, "shared_cache_cryptex_ext_count", v9);
    xpc_dictionary_set_uint64(*a3, "num_pagein_during_launch", ru_majflt);
    v12 = *(_QWORD *)(a1 + 768);
    if (v12 >= 7)
    {
      if (v12 >= 0xD)
      {
        if (v12 >= 0x13)
        {
          if (v12 >= 0x19)
          {
            if (v12 < 0x31)
              v13 = 48;
            else
              v13 = 49;
          }
          else
          {
            v13 = 24;
          }
        }
        else
        {
          v13 = 18;
        }
      }
      else
      {
        v13 = 12;
      }
    }
    else
    {
      v13 = 6;
    }
    xpc_dictionary_set_uint64(*a3, "file_system_months", v13);
    if (disk_fullness_percentage <= 50.0)
    {
      *(double *)&v16 = 50.0;
    }
    else
    {
      if (disk_fullness_percentage > 80.0)
      {
        if (disk_fullness_percentage <= 90.0)
        {
          v15 = 90.0;
        }
        else
        {
          v15 = 95.0;
          if (disk_fullness_percentage > 95.0)
            v15 = 96.0;
        }
        goto LABEL_30;
      }
      *(double *)&v16 = 80.0;
    }
    v15 = *(double *)&v16;
LABEL_30:
    xpc_dictionary_set_double(*a3, "disk_fullness_percentage", v15);
  }
  if (a2 == 1)
  {
    v22 = alm_mach_time_to_ns(*(_QWORD *)(a1 + 680), v6, v7, v8);
    v21 = v22 - alm_mach_time_to_ns(*(_QWORD *)(a1 + 664), v23, v24, v25);
    v29 = alm_mach_time_to_ns(*(_QWORD *)(a1 + 688), v26, v27, v28);
    v33 = (double)(v29 - alm_mach_time_to_ns(*(_QWORD *)(a1 + 664), v30, v31, v32));
    v34 = v33 / 1000000.0;
    v37 = alm_mach_time_to_ns(*(_QWORD *)(a1 + 672), v33, v35, v36);
    v41 = (double)(v37 - alm_mach_time_to_ns(*(_QWORD *)(a1 + 664), v38, v39, v40));
    v42 = v41 / 1000000.0;
    v45 = alm_mach_time_to_ns(*(_QWORD *)(a1 + 720), v41, v43, v44);
    v49 = alm_mach_time_to_ns(*(_QWORD *)(a1 + 664), v46, v47, v48);
    if (*(_BYTE *)(a1 + 728))
      v50 = 0.0;
    else
      v50 = (double)(v45 - v49) / 1000000.0;
    if (*(_BYTE *)(a1 + 696))
      v51 = 0.0;
    else
      v51 = v34;
    if (*(_BYTE *)(a1 + 778))
    {
      if (!*(_QWORD *)(a1 + 688))
        v51 = 20.0;
      if (!*(_QWORD *)(a1 + 720))
        v50 = 20.0;
      if (!*(_QWORD *)(a1 + 672))
        v42 = 20.0;
    }
    xpc_dictionary_set_uint64(*a3, "activation_flags", *(unsigned int *)(a1 + 648));
    xpc_dictionary_set_double(*a3, "extended_responsive_time", v50);
    xpc_dictionary_set_double(*a3, "legacy_frontboard_launch_time", v42);
    xpc_dictionary_set_double(*a3, "first_frame_presentation_responsive_time", v51);
  }
  else
  {
    if (a2)
      return;
    v17 = alm_mach_time_to_ns(*(_QWORD *)(a1 + 680), v6, v7, v8);
    v21 = v17 - alm_mach_time_to_ns(*(_QWORD *)(a1 + 664), v18, v19, v20);
  }
  xpc_dictionary_set_double(*a3, "first_frame_presentation_time", (double)v21 / 1000000.0);
}

void alm_decode_dyld_launch_info_into_dict(unsigned int a1, void *a2)
{
  int v4;

  if (a2 && MEMORY[0x20BCF9804](a2) == MEMORY[0x24BDACFA0])
  {
    v4 = 10 << (a1 >> 5);
    if (((a1 >> 5) & 0x1F) == 0)
      v4 = 0;
    xpc_dictionary_set_uint64(a2, "uptime", v4);
    xpc_dictionary_set_uint64(a2, "uptime_log", (a1 >> 5) & 0x1F);
    xpc_dictionary_set_uint64(a2, "using_closure", a1 & 1);
    xpc_dictionary_set_uint64(a2, "built_closure_at_launch", (a1 >> 1) & 1);
    xpc_dictionary_set_uint64(a2, "closure_saved_to_file", (a1 >> 2) & 1);
    xpc_dictionary_set_uint64(a2, "minimal_closure", (a1 >> 3) & 1);
  }
}

uint64_t alm_get_process_num_page_in()
{
  rusage v1;

  memset(&v1, 0, sizeof(v1));
  if (getrusage(0, &v1) >= 0)
    return v1.ru_majflt;
  else
    return 0;
}

float alm_get_disk_fullness_percentage()
{
  int v0;
  float result;
  uint64_t v2;
  statfs v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  bzero(&v3, 0x878uLL);
  v0 = statfs("/", &v3);
  result = 0.0;
  if (!v0)
  {
    v2 = v3.f_blocks * v3.f_bsize;
    if (v2)
      return 100.0 - (double)(v3.f_bavail * v3.f_bsize) * 100.0 / (double)v2;
  }
  return result;
}

uint64_t alm_bucketize_file_system_months(unint64_t a1)
{
  char v1;
  char v2;
  char v3;
  unsigned __int8 v4;

  if (a1 < 0x31)
    v1 = 48;
  else
    v1 = 49;
  if (a1 >= 0x19)
    v2 = v1;
  else
    v2 = 24;
  if (a1 >= 0x13)
    v3 = v2;
  else
    v3 = 18;
  if (a1 >= 0xD)
    v4 = v3;
  else
    v4 = 12;
  if (a1 >= 7)
    return v4;
  else
    return 6;
}

uint64_t alm_bucketize_disk_fullness_percentage(double a1)
{
  if (a1 <= 50.0)
    return 50;
  if (a1 <= 80.0)
    return 80;
  if (a1 <= 90.0)
    return 90;
  if (a1 <= 95.0)
    return 95;
  return 96;
}

void *__alm_aggregate_and_send_ca_measurement_event_block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v3;

  v3 = 0;
  alm_generate_ca_payload_from_metrics_data(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), &v3);
  if (!v3)
  {
    v1 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      v1 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v1;
    }
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __alm_aggregate_and_send_ca_measurement_event_block_invoke_cold_1();
  }
  return v3;
}

uint64_t alm_get_3rd_party_app_sampling_info()
{
  return 0;
}

void s_telemetry_timeout_handler_block_invoke()
{
  NSObject *v0;

  if (!BYTE1(dword_253CF9180) && (s_launch_milestones & 1) == 0)
  {
    BYTE2(dword_253CF9180) = 1;
    v0 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      v0 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v0;
    }
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      s_telemetry_timeout_handler_block_invoke_cold_1(v0);
    alm_did_reach_launch_milestone(10);
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void alm_app_will_launch_with_details_and_metrics_payload_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_206582000, v0, v1, "CA telemetry data is added to metric payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void alm_app_will_launch_with_details_and_metrics_payload_cold_2(NSObject *a1)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  _DWORD v6[2];
  __int16 v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = mach_continuous_time();
  v6[0] = 67109376;
  v6[1] = 4;
  v7 = 2048;
  v8 = alm_mach_time_to_ns(v2 - qword_254512980, v3, v4, v5) / 0x34630B8A000;
  _os_log_debug_impl(&dword_206582000, a1, OS_LOG_TYPE_DEBUG, "Reached per-day limit of %d for capturing 3rd party data ! Wont collect data. Num hours: %llu", (uint8_t *)v6, 0x12u);
}

void alm_app_will_launch_with_details_and_metrics_payload_cold_3(uint64_t a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = _MergedGlobals;
  v5 = mach_continuous_time();
  v9 = 136315650;
  v10 = a1;
  v11 = 1024;
  v12 = v4;
  v13 = 2048;
  v14 = alm_mach_time_to_ns(v5 - qword_254512980, v6, v7, v8) / 0x34630B8A000;
  _os_log_debug_impl(&dword_206582000, a2, OS_LOG_TYPE_DEBUG, "Capture 3rd party %s data. Num Collected(24hr): %d Num hours: %llu", (uint8_t *)&v9, 0x1Cu);
}

void alm_app_will_launch_with_details_and_metrics_payload_cold_4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_debug_impl(&dword_206582000, a2, OS_LOG_TYPE_DEBUG, "Random sampling decided not to capture 3rd party %s data", (uint8_t *)&v2, 0xCu);
}

void alm_app_will_launch_with_details_and_metrics_payload_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_206582000, v0, v1, "network activtity data is added to metric payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void alm_ca_hit_3rd_party_bundle_capture_limit_per_day_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_206582000, v0, v1, "Reset the 3rd party bundle sampling limit after 24 hours pass", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void alm_execute_when_main_queue_idle_with_condition_cold_1()
{
  __assert_rtn("alm_execute_when_main_queue_idle_with_condition", "app_launch_measurement.c", 971, "handler != NULL");
}

void alm_aggregate_and_send_ca_measurement_event_cold_1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2080;
  v5 = a1;
  _os_log_error_impl(&dword_206582000, log, OS_LOG_TYPE_ERROR, "Failed to send CA Event for app launch measurements for ca_event_type: %d event_name: %s", (uint8_t *)v3, 0x12u);
}

void alm_execute_when_measurement_complete_cold_1()
{
  __assert_rtn("alm_execute_when_measurement_complete", "app_launch_measurement.c", 948, "handler != NULL");
}

void alm_did_finish_extended_launch_task_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_206582000, v0, v1, "Couldn't find persisted ALM/FrontBoard launch signpost id when finishing an ext launch task.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void alm_generate_ca_payload_from_metrics_data_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_206582000, v0, v1, "Payload pointer cannot be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __alm_aggregate_and_send_ca_measurement_event_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_206582000, v0, v1, "CA Event payload is not created properly !", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void s_telemetry_timeout_handler_block_invoke_cold_1(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = 20;
  _os_log_error_impl(&dword_206582000, log, OS_LOG_TYPE_ERROR, "CA Telemetry timedout after %d seconds due to app launch has not reached all responsive milestones", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_0();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t _dyld_launch_mode()
{
  return MEMORY[0x24BDACA88]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x24BE1A1F8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void arc4random_stir(void)
{
  MEMORY[0x24BDAD168]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x24BDAD9B8](*(_QWORD *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE4D0](a1, a2, a3, *(_QWORD *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int getrusage(int a1, rusage *a2)
{
  return MEMORY[0x24BDAE738](*(_QWORD *)&a1, a2);
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x24BDE0950]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x24BDE0960]();
}

uint64_t nw_activity_copy_xpc_object()
{
  return MEMORY[0x24BDE0978]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x24BDE0990]();
}

uint64_t nw_activity_create_from_xpc_object()
{
  return MEMORY[0x24BDE09A0]();
}

uint64_t nw_activity_set_global_parent()
{
  return MEMORY[0x24BDE09E0]();
}

void nw_release(void *obj)
{
  MEMORY[0x24BDE2380](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF6E0](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

