uint64_t entr_act_set(unsigned int a1, int a2, void *a3, int a4, uint64_t a5)
{
  return entr_act_modify(a1, a2, a3, a4 | 0x20000000u, a5);
}

os_log_t ___get_signpost_params_block_invoke()
{
  os_log_t result;

  qword_1ECD82EB0 = (uint64_t)os_log_create("com.apple.EnergyTracing", "EnTr_AppState");
  qword_1ECD82EB8 = (uint64_t)os_log_create("com.apple.EnergyTracing", "EnTr_SysPower");
  qword_1ECD82EC0 = (uint64_t)os_log_create("com.apple.EnergyTracing", "EnTr_Networking");
  result = os_log_create("com.apple.EnergyTracing", "EnTr_Spatial");
  qword_1ECD82EC8 = (uint64_t)result;
  return result;
}

uint64_t entr_act_end(unsigned int a1, void *ptr, uint64_t a3, int a4, uint64_t a5)
{
  int v7;
  NSObject *signpost_params;
  os_signpost_id_t v9;
  NSObject *v10;
  os_signpost_id_t v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v7 = (int)ptr;
  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  signpost_params = _get_signpost_params(a1, (void *)ptr, &v12);
  v9 = v12;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = signpost_params;
    if (os_signpost_enabled(signpost_params))
    {
      *(_DWORD *)buf = 67240704;
      v14 = v7;
      v15 = 1026;
      v16 = a4;
      v17 = 2050;
      v18 = a5;
      _os_signpost_emit_with_name_impl(&dword_1DF243000, v10, OS_SIGNPOST_INTERVAL_END, v9, "EnTr_Activation_End", "act_opcode = %{public, signpost.description:attribute}u act_quality = %{public}u act_value = %{public}lld ", buf, 0x18u);
    }
  }
  return kdebug_trace();
}

uint64_t entr_act_begin(unsigned int a1, int a2, void *ptr, int a4, uint64_t a5)
{
  NSObject *signpost_params;
  os_signpost_id_t v9;
  NSObject *v10;
  os_signpost_id_t v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  signpost_params = _get_signpost_params(a1, ptr, &v12);
  v9 = v12;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = signpost_params;
    if (os_signpost_enabled(signpost_params))
    {
      *(_DWORD *)buf = 67240704;
      v14 = a2;
      v15 = 1026;
      v16 = a4;
      v17 = 2050;
      v18 = a5;
      _os_signpost_emit_with_name_impl(&dword_1DF243000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EnTr_Activation_Begin", "act_opcode = %{public, signpost.description:attribute}u act_quality = %{public}u act_value = %{public}lld ", buf, 0x18u);
    }
  }
  return kdebug_trace();
}

uint64_t entr_act_modify(unsigned int a1, int a2, void *ptr, int a4, uint64_t a5)
{
  NSObject *signpost_params;
  os_signpost_id_t v9;
  NSObject *v10;
  os_signpost_id_t v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  signpost_params = _get_signpost_params(a1, ptr, &v12);
  v9 = v12;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = signpost_params;
    if (os_signpost_enabled(signpost_params))
    {
      *(_DWORD *)buf = 67240704;
      v14 = a2;
      v15 = 1026;
      v16 = a4;
      v17 = 2050;
      v18 = a5;
      _os_signpost_emit_with_name_impl(&dword_1DF243000, v10, OS_SIGNPOST_EVENT, v9, "EnTr_Activation_Modify", "act_opcode = %{public, signpost.description:attribute}u act_quality = %{public}u act_value = %{public}lld ", buf, 0x18u);
    }
  }
  return kdebug_trace();
}

uint64_t _get_signpost_params(unsigned int a1, void *ptr, os_signpost_id_t *a3)
{
  os_signpost_id_t v4;
  NSObject *v7;

  if (a1 >= 7)
  {
    v4 = 0;
    _get_signpost_params_handle = 0;
    if (!a3)
      return _get_signpost_params_handle;
    goto LABEL_13;
  }
  if (_get_signpost_params_initGate != -1)
    dispatch_once(&_get_signpost_params_initGate, &__block_literal_global);
  v7 = _get_signpost_params_handles[a1];
  _get_signpost_params_handle = (uint64_t)v7;
  if (a1 == 3)
  {
    v4 = os_signpost_id_make_with_pointer(v7, ptr);
    if (!a3)
      return _get_signpost_params_handle;
    goto LABEL_13;
  }
  if (ptr)
    v4 = (os_signpost_id_t)ptr;
  else
    v4 = -1;
  if (a3)
LABEL_13:
    *a3 = v4;
  return _get_signpost_params_handle;
}

uint64_t entr_shouldtrace()
{
  _BOOL8 v0;
  int v1;
  int v2;
  NSObject *signpost_params;
  _BOOL4 v4;

  if (MEMORY[0xFFFFFC100])
    return 1;
  v1 = 6;
  do
  {
    v2 = v1 - 1;
    v0 = v1 != 0;
    if (!v1)
      break;
    signpost_params = _get_signpost_params(v1, 0, 0);
    v4 = os_signpost_enabled(signpost_params);
    v1 = v2;
  }
  while (!v4);
  return v0;
}

uint64_t entr_event()
{
  return kdebug_trace();
}

uint64_t entr_act_associate(unsigned int a1, int a2, void *ptr, int a4, int a5, uint64_t a6)
{
  NSObject *signpost_params;
  os_signpost_id_t v12;
  NSObject *v13;
  os_signpost_id_t v15;
  uint8_t buf[4];
  unsigned int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  signpost_params = _get_signpost_params(a1, ptr, &v15);
  v12 = v15;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = signpost_params;
    if (os_signpost_enabled(signpost_params))
    {
      *(_DWORD *)buf = 67241216;
      v17 = a1;
      v18 = 1026;
      v19 = a2;
      v20 = 1026;
      v21 = a4;
      v22 = 1026;
      v23 = a5;
      v24 = 2050;
      v25 = a6;
      _os_signpost_emit_with_name_impl(&dword_1DF243000, v13, OS_SIGNPOST_EVENT, v12, "EnTr_Activation_Associate", "parent_component = %{public}u                                              parent_opcode = %{public, signpost.description:attribute}u sub_component = %{public}u sub_opcode = %{public}u sub_activation_id = %{public}lu", buf, 0x24u);
    }
  }
  return kdebug_trace();
}

uint64_t entr_act_setd(unsigned int a1, int a2, void *a3, int a4, double a5)
{
  return entr_act_modify(a1, a2, a3, a4 | 0x30000000u, vcvtd_n_s64_f64(a5, 9uLL));
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

