int *libSystem_initializer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  xpc_object_t empty;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *result;
  xpc_object_t object[3];
  _QWORD v27[5];

  if (MEMORY[0xFFFFFC100])
    kdebug_trace(735838225, 0, 0, 0, 0);
  __libkernel_init(&libSystem_initializer_libkernel_funcs, a3, a4, a5);
  if (MEMORY[0xFFFFFC100])
    kdebug_trace(735838224, 1, 0, 0, 0);
  __libplatform_init(0, a3, a4, a5);
  if (MEMORY[0xFFFFFC100])
    kdebug_trace(735838224, 2, 0, 0, 0);
  __pthread_init(&libSystem_initializer_libpthread_funcs, a3, a4, a5);
  if (MEMORY[0xFFFFFC100])
    kdebug_trace(735838224, 3, 0, 0, 0);
  _libc_initializer(&libSystem_initializer_libc_funcs, a3, a4, a5);
  if (MEMORY[0xFFFFFC100])
    kdebug_trace(735838224, 4, 0, 0, 0);
  _sanitizers_init(a3, a4);
  if (MEMORY[0xFFFFFC100])
    kdebug_trace(735838224, 14, 0, 0, 0);
  v8 = __malloc_init(a4);
  if (MEMORY[0xFFFFFC100])
    v8 = kdebug_trace(735838224, 5, 0, 0, 0);
  _dyld_initializer(v8);
  if (MEMORY[0xFFFFFC100])
    kdebug_trace(735838224, 7, 0, 0, 0);
  v9 = __pthread_late_init(a3, a4, a5);
  v10 = libdispatch_init(v9);
  if (MEMORY[0xFFFFFC100])
    v10 = kdebug_trace(735838224, 8, 0, 0, 0);
  _libxpc_initializer(v10);
  if (MEMORY[0xFFFFFC100])
    kdebug_trace(735838224, 9, 0, 0, 0);
  v11 = setenv("DT_BYPASS_LEAKS_CHECK", "1", 1);
  _libtrace_init(v11);
  if (MEMORY[0xFFFFFC100])
    kdebug_trace(735838224, 10, 0, 0, 0);
  v12 = _container_init(a4);
  if (MEMORY[0xFFFFFC100])
    v12 = kdebug_trace(735838224, 12, 0, 0, 0);
  __libdarwin_init(v12);
  if (MEMORY[0xFFFFFC100])
    kdebug_trace(735838224, 13, 0, 0, 0);
  v27[0] = 2;
  v27[1] = &dlopen;
  v27[2] = &dlsym;
  v27[3] = os_variant_has_internal_diagnostics("com.apple.libsystem");
  v27[4] = 0;
  __malloc_late_init(v27);
  if (getpid() != 1
    && os_variant_allows_internal_security_policies("com.apple.libsystem")
    && _os_feature_enabled_impl("Libsystem", "posix_spawn_filtering"))
  {
    *(_OWORD *)object = xmmword_1DC0;
    *(_WORD *)((char *)&object[1] + 1) = 256;
    __libkernel_init_late(object);
  }
  if (_simple_getenv(a3, "ActivePrewarm"))
  {
    v13 = xpc_pipe_create("com.apple.dasd.end-prewarm", 6);
    if (v13)
    {
      v14 = (void *)v13;
      empty = xpc_dictionary_create_empty();
      if (empty)
      {
        v16 = empty;
        object[0] = 0;
        xpc_pipe_routine(v14, empty, object);
        xpc_release(v14);
        xpc_release(v16);
        if (object[0])
          xpc_release(object[0]);
        goto LABEL_40;
      }
      xpc_release(v14);
      v17 = os_log_create("com.apple.libsystem", "duet.prewarm");
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        goto LABEL_40;
    }
    else
    {
      v17 = os_log_create("com.apple.libsystem", "duet.prewarm");
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        goto LABEL_40;
    }
    libSystem_initializer_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
  }
LABEL_40:
  if (MEMORY[0xFFFFFC100])
    kdebug_trace(735838226, 0, 0, 0, 0);
  result = __error();
  *result = 0;
  return result;
}

uint64_t libSystem_atfork_prepare(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = _dyld_dlopen_atfork_prepare();
  if ((a1 & 1) == 0)
    v2 = _pthread_atfork_prepare_handlers(v2);
  v3 = _libSC_info_fork_prepare(v2);
  v4 = xpc_atfork_prepare(v3);
  v5 = dispatch_atfork_prepare(v4);
  v6 = _dyld_atfork_prepare(v5);
  v7 = _malloc_fork_prepare(v6);
  v8 = cc_atfork_prepare(v7);
  v9 = _libc_fork_prepare(v8);
  return _pthread_atfork_prepare(v9);
}

uint64_t libSystem_atfork_parent(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v2 = _pthread_atfork_parent();
  v3 = cc_atfork_parent(v2);
  v4 = _malloc_fork_parent(v3);
  v5 = _libc_fork_parent(v4);
  v6 = _dyld_atfork_parent(v5);
  v7 = dispatch_atfork_parent(v6);
  v8 = xpc_atfork_parent(v7);
  v9 = _libSC_info_fork_parent(v8);
  result = _dyld_dlopen_atfork_parent(v9);
  if ((a1 & 1) == 0)
    return _pthread_atfork_parent_handlers(result);
  return result;
}

uint64_t libSystem_atfork_child(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;

  v2 = _mach_fork_child();
  v3 = _pthread_atfork_child(v2);
  v4 = cc_atfork_child(v3);
  v5 = _malloc_fork_child(v4);
  v6 = _libc_fork_child(v5);
  v7 = _dyld_fork_child(v6);
  v8 = dispatch_atfork_child(v7);
  v9 = _libcoreservices_fork_child(v8);
  v10 = _asl_fork_child(v9);
  v11 = _notify_fork_child(v10);
  v12 = xpc_atfork_child(v11);
  v13 = _libtrace_fork_child(v12);
  v14 = _libSC_info_fork_child(v13);
  result = _dyld_dlopen_atfork_child(v14);
  if ((a1 & 1) == 0)
    return _pthread_atfork_child_handlers(result);
  return result;
}

uint64_t libSystem_init_after_boot_tasks_4launchd()
{
  uint64_t result;
  __int128 v1;

  result = os_variant_allows_internal_security_policies("com.apple.libsystem");
  if ((_DWORD)result)
  {
    result = _os_feature_enabled_impl("Libsystem", "posix_spawn_filtering");
    if ((_DWORD)result)
    {
      v1 = xmmword_1DD0;
      return __libkernel_init_after_boot_tasks(&v1);
    }
  }
  return result;
}

const char *__asan_default_options()
{
  int v0;
  int v1;
  size_t v2;
  char *v3;
  ssize_t v4;

  v0 = open("/System/Library/Preferences/com.apple.asan.options", 0);
  if (v0 == -1)
    return "color=never:handle_segv=0:handle_sigbus=0:handle_sigill=0:handle_sigfpe=0:external_symbolizer_path=:log_path="
           "stderr:log_exe_name=0:print_module_map=2:detect_odr_violation=0:halt_on_error=1";
  v1 = v0;
  v2 = 1023;
  v3 = &dynamic_asan_opts;
  do
  {
    v4 = read(v1, &dynamic_asan_opts, v2);
    v2 -= v4;
  }
  while (v4 > 0);
  close(v1);
  if (!dynamic_asan_opts)
    return "color=never:handle_segv=0:handle_sigbus=0:handle_sigill=0:handle_sigfpe=0:external_symbolizer_path=:log_path="
           "stderr:log_exe_name=0:print_module_map=2:detect_odr_violation=0:halt_on_error=1";
  return v3;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void libSystem_initializer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_0, a1, a3, "Libsystem end prewarm failed to look up mach service", a5, a6, a7, a8, 0);
}
