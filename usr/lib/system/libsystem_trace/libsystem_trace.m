void ___os_log_watch_for_prefchanges_block_invoke()
{
  unsigned int v0;

  do
    v0 = __ldxr((unsigned int *)&dword_1ECCEBAD8);
  while (__stxr(v0 + 1, (unsigned int *)&dword_1ECCEBAD8));
}

void _os_trace_image_was_loaded(_DWORD *a1)
{
  if (off_1ECCEBAB8
    && (_os_trace_dsc_load_addr > (unint64_t)a1
     || _os_trace_dsc_size + _os_trace_dsc_load_addr <= (unint64_t)a1))
  {
    _os_trace_dylib_or_main_executable_was_loaded(a1);
  }
}

void _os_activity_initiate_impl(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v5;
  void *v8;

  _os_activity_create_addr(a1, a2, -3, a3, v5);
  voucher_adopt();
  a5(a4);
  v8 = (void *)voucher_adopt();
  os_release(v8);
}

uint64_t _os_activity_create_addr(uint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  BOOL v26;
  _OWORD *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  unsigned int v37;
  void *v38;
  void *v39;
  unsigned int v40;
  uint64_t v41;
  _OWORD *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  _DWORD v47[12];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  _OWORD *v65;
  unint64_t v66;
  uint64_t v67;

  v7 = result;
  v67 = *MEMORY[0x1E0C874D8];
  if ((a4 & 1) != 0)
    v8 = 0;
  else
    v8 = a3;
  if ((a4 & 2) == 0)
    goto LABEL_9;
  if ((a4 & 1) != 0)
  {
    qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Invalid flags passed";
    __break(1u);
    goto LABEL_85;
  }
  if (a3 != -3)
  {
LABEL_85:
    qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Parent must be OS_ACTIVITY_CURRENT when OS_ACTIVITY_FLAG_NONE_PRESENT is used";
    __break(1u);
    return result;
  }
  if (voucher_get_activity_id())
    return voucher_copy();
LABEL_9:
  v46 = v7;
  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  v65 = 0;
  v66 = 0;
  v63 = 0;
  v64 = 0;
  if (dword_1ECCEBAD4 != -1)
    _os_trace_prefs_and_mode_refresh_slow(dword_1ECCEBAD4);
  v9 = dword_1ECCEBAD8;
  v10 = dword_1ECCEBADC;
  if (dword_1ECCEBADC != dword_1ECCEBAD8)
  {
    while (1)
    {
      v37 = __ldxr((unsigned int *)&dword_1ECCEBADC);
      if (v37 != v10)
        break;
      if (!__stxr(v9, (unsigned int *)&dword_1ECCEBADC))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_14;
      }
    }
    __clrex();
  }
LABEL_14:
  v44 = v8;
  v45 = a2;
  if (off_1ECCEBAB8)
    v11 = (unint64_t *)((char *)off_1ECCEBAB8 + 8);
  else
    v11 = 0;
  v12 = 0x1ECCEB000uLL;
  v13 = v46;
  if (_os_trace_dsc_load_addr <= v46 && _os_trace_dsc_size + _os_trace_dsc_load_addr > v46)
  {
    v14 = a5 - _os_trace_dsc_load_addr;
    LODWORD(v64) = a5 - _os_trace_dsc_load_addr;
    WORD2(v64) = (unint64_t)(a5 - _os_trace_dsc_load_addr) >> 32;
    v65 = 0;
    if (WORD2(v64))
    {
      v42 = 0;
      v43 = 0;
      v15 = 6;
      HIWORD(v64) = 6;
      v16 = 12;
      v17 = 1;
    }
    else
    {
      HIDWORD(v64) = 0x40000;
      v42 = 0;
      v17 = 0;
      v15 = 4;
      v43 = 1;
      v16 = 4;
    }
    goto LABEL_51;
  }
  if (*(_DWORD *)(v46 + 12) != 2)
  {
    if (off_1ECCEBAB8)
    {
      do
      {
        while (1)
        {
          v18 = __ldxr(v11);
          if (!(_DWORD)v18)
            break;
          __clrex();
          v19 = v12;
          v20 = v11;
          _os_trace_rwptr_rdlock_wait((uint64_t)v11);
          v11 = v20;
          v12 = v19;
          v13 = v46;
        }
      }
      while (__stxr(v18 + 0x200000000, v11));
      v21 = v11[1];
      v22 = *(unsigned __int16 *)(v21 + 10);
      v23 = (v13 >> *MEMORY[0x1E0C88818]) % v22;
      while (1)
      {
        v24 = v21 + 16 * v23;
        v25 = *(_QWORD *)(v24 + 16);
        if (v25 == v13)
          break;
        if (v23 + 1 == v22)
          v23 = 0;
        else
          ++v23;
        if (v25)
          v26 = v23 == (v13 >> *MEMORY[0x1E0C88818]) % v22;
        else
          v26 = 1;
        if (v26)
        {
          v27 = 0;
          goto LABEL_40;
        }
      }
      v27 = *(_OWORD **)(v24 + 24);
LABEL_40:
      v28 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      do
      {
        v29 = __ldxr(v11);
        v30 = v29 - 0x200000000;
        if (v30 == 0x100000000)
          v30 = v28;
      }
      while (__stxr(v30, v11));
      if (v30 == v28)
      {
        __dmb(9u);
        _os_trace_rwptr_cleanup((uint64_t)v11);
      }
      v65 = v27;
      if (v27)
      {
        v42 = v27;
        v17 = 0;
        v43 = 0;
        v14 = a5 - v13;
        LODWORD(v64) = a5 - v13;
        WORD2(v64) = (a5 - v13) >> 32;
        v15 = 20;
        HIWORD(v64) = 20;
        v16 = 10;
        goto LABEL_51;
      }
    }
    else
    {
      v65 = 0;
    }
    v42 = 0;
    v43 = 0;
    LODWORD(v64) = a5;
    WORD2(v64) = WORD2(a5);
    v15 = 6;
    HIWORD(v64) = 6;
    v16 = 8;
    v17 = 1;
    v14 = a5;
    goto LABEL_51;
  }
  v42 = 0;
  v17 = 0;
  v14 = a5 - v46;
  LODWORD(v64) = a5 - v46;
  WORD2(v64) = (a5 - v46) >> 32;
  v15 = 4;
  HIWORD(v64) = 4;
  v65 = 0;
  v16 = 2;
  v43 = 1;
LABEL_51:
  if (v45)
  {
    v31 = *(_QWORD *)(v12 + 3080);
    if (v31 <= v13)
    {
      if (_os_trace_dsc_size + v31 <= v13)
        v31 = v13;
      v32 = v45 - v31;
    }
    else
    {
      v32 = v45 - v13;
    }
    v33 = v32 & 0x7FFFFFFF | ((unint64_t)(unsigned __int16)(v32 >> 31) << 32);
  }
  else
  {
    v33 = 0;
  }
  v63 = v33;
  MEMORY[0x1E0C86820](v11);
  v35 = (char *)&v41 - v34;
  bzero((char *)&v41 - v34, v15 + 2 * ((v33 & 0xFFFF00000000) != 0));
  if (v17)
  {
    *(_DWORD *)v35 = v64;
    *((_WORD *)v35 + 2) = WORD2(v64);
  }
  else
  {
    *(_DWORD *)v35 = v14;
    if ((v43 & 1) == 0)
      *(_OWORD *)(v35 + 4) = *v42;
  }
  if ((v33 & 0xFFFF00000000) != 0)
  {
    v16 |= 0x20u;
    *(_WORD *)&v35[v15] = WORD2(v33);
  }
  v66 = ((unint64_t)v16 << 16) | (v33 << 32) | 0x102;
  _os_get_logging_unreliable_for_current_thread();
  v36 = voucher_activity_create_with_data_2();
  if ((dword_1ECCEBAC8 & 0x500) == 0
    && (MEMORY[0xFFFFFC104] & 0x500) == 0
    && ((dword_1ECCEBAC8 & 8) != 0
     || (MEMORY[0xFFFFFC104] & 8) != 0
     || (voucher_get_activity_id() & 0x800000000000000) != 0)
    && (byte_1ECCEBB38 & 1) != 0)
  {
    v38 = _os_trace_diagnosticd_pipe(0);
    if (v38)
    {
      v39 = v38;
      v61 = 0;
      v62 = 0;
      v60 = 0;
      if (mach_get_times())
        _os_assumes_log();
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      memset(v47, 0, sizeof(v47));
      if (v66 <= 6u && ((1 << v66) & 0x58) != 0)
        v40 = v66 << 8;
      else
        v40 = bswap32(v66) >> 16;
      v47[0] = v40;
      *((_QWORD *)&v48 + 1) = v66;
      *(_QWORD *)&v49 = v62;
      *(_QWORD *)&v51 = v60;
      *((_QWORD *)&v51 + 1) = (v61 / 0x3E8);
      *(_QWORD *)&v54 = v45;
      _os_activity_stream_reflect((uint64_t)v39, (uint64_t)v47, v46, v36, (unsigned int *)&v64, (uint64_t)&v63);
      xpc_release(v39);
    }
  }
  return v36;
}

void *_os_trace_diagnosticd_pipe(void *a1)
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&qword_1ECCEBB30);
  v2 = (void *)qword_1ECCEBB28;
  if ((void *)qword_1ECCEBB28 != a1 || qword_1ECCEBB28 == 0)
  {
    if (qword_1ECCEBB28)
    {
LABEL_8:
      xpc_retain(v2);
      goto LABEL_9;
    }
  }
  else
  {
    xpc_release(a1);
    qword_1ECCEBB28 = 0;
  }
  v2 = (void *)xpc_pipe_create();
  qword_1ECCEBB28 = (uint64_t)v2;
  if (v2)
    goto LABEL_8;
LABEL_9:
  os_unfair_lock_unlock((os_unfair_lock_t)&qword_1ECCEBB30);
  return v2;
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  os_signpost_id_t result;

  if (!os_signpost_enabled(log))
    return 0;
  if ((~HIDWORD(log[7].isa) & 0x18000) == 0)
    return voucher_activity_id_allocate();
  do
    result = __ldxr(&os_signpost_id_generate__os_signpost_id_next);
  while (__stxr(result + 1, &os_signpost_id_generate__os_signpost_id_next));
  return result;
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t __buf;

  if (!os_signpost_enabled(log))
    return 0;
  if ((~HIDWORD(log[7].isa) & 0x18000) == 0)
    return -1;
  v5 = os_signpost_id_make_with_pointer__os_signpost_slide;
  __buf = os_signpost_id_make_with_pointer__os_signpost_slide;
  if (os_signpost_id_make_with_pointer__os_signpost_slide == -1)
  {
    _NSGetMachExecuteHeader();
    if (_dyld_get_image_slide())
    {
      arc4random_buf(&__buf, 8uLL);
      v5 = __buf & ~*MEMORY[0x1E0C887F8];
      while (1)
      {
        v6 = __ldxr((unint64_t *)&os_signpost_id_make_with_pointer__os_signpost_slide);
        if (v6 != -1)
          break;
        if (!__stxr(v5, (unint64_t *)&os_signpost_id_make_with_pointer__os_signpost_slide))
        {
          v7 = 1;
          goto LABEL_15;
        }
      }
      v7 = 0;
      __clrex();
LABEL_15:
      if (!v7)
        v5 = v6;
    }
    else
    {
      v5 = 0;
      os_signpost_id_make_with_pointer__os_signpost_slide = 0;
    }
  }
  return (os_signpost_id_t)ptr + v5;
}

BOOL os_signpost_enabled(os_log_t log)
{
  unsigned int v2;
  int v3;
  _BOOL4 v4;
  unsigned int v5;
  int isa;
  unsigned int v7;
  unsigned int *v8;
  unsigned int v9;

  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  if (dword_1ECCEBAD4 != -1)
    _os_trace_prefs_and_mode_refresh_slow(dword_1ECCEBAD4);
  v2 = dword_1ECCEBAD8;
  v3 = dword_1ECCEBADC;
  if (dword_1ECCEBADC != dword_1ECCEBAD8)
  {
    while (1)
    {
      v7 = __ldxr((unsigned int *)&dword_1ECCEBADC);
      if (v7 != v3)
        break;
      if (!__stxr(v2, (unsigned int *)&dword_1ECCEBADC))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }
    __clrex();
  }
LABEL_6:
  if ((dword_1ECCEBAC8 & 0x500) != 0 || (MEMORY[0xFFFFFC104] & 0x500) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    LOBYTE(v4) = 0;
    if (log && log != (os_log_t)&_os_log_disabled)
    {
      if (log[3].isa)
      {
        v5 = dword_1ECCEBAD8;
        isa = (int)log[6].isa;
        if (isa != dword_1ECCEBAD8)
        {
          v8 = (unsigned int *)&log[6];
          while (1)
          {
            v9 = __ldxr(v8);
            if (v9 != isa)
              break;
            if (!__stxr(v5, v8))
            {
              _os_log_preferences_refresh((uint64_t)log);
              return (BYTE6(log[7].isa) >> 2) & 1;
            }
          }
          __clrex();
        }
      }
      return (BYTE6(log[7].isa) >> 2) & 1;
    }
  }
  return v4;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  unsigned int v4;
  int v5;
  unsigned __int8 v6;
  size_t v7;
  char v8;
  size_t v9;
  size_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  os_log_t result;
  uint64_t metadata_buffer;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unsigned __int16 *v19;
  char v20;
  unsigned __int16 *v21;
  unsigned __int16 v22;
  unint64_t *v23;
  unsigned int v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C874D8];
  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  if (dword_1ECCEBAD4 != -1)
    _os_trace_prefs_and_mode_refresh_slow(dword_1ECCEBAD4);
  v4 = dword_1ECCEBAD8;
  v5 = dword_1ECCEBADC;
  if (dword_1ECCEBADC != dword_1ECCEBAD8)
  {
    while (1)
    {
      v24 = __ldxr((unsigned int *)&dword_1ECCEBADC);
      if (v24 != v5)
        break;
      if (!__stxr(v4, (unsigned int *)&dword_1ECCEBADC))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }
    __clrex();
  }
LABEL_6:
  if ((dword_1ECCEBAC8 & 0x100) != 0 || (MEMORY[0xFFFFFC104] & 0x100) != 0)
    return (os_log_t)&_os_log_disabled;
  v6 = strlen(subsystem) + 1;
  v7 = strlen(category);
  v8 = v7 + 1;
  v9 = (v7 + 1);
  v10 = v6 + v9 + 4;
  MEMORY[0x1E0C86820](v7);
  v12 = (char *)v25 - v11;
  bzero((char *)v25 - v11, v10);
  v25[0] = 0;
  v12[2] = v6;
  v12[3] = v8;
  strlcpy(v12 + 4, subsystem, v6);
  strlcpy(&v12[v6 + 4], category, v9);
  v13 = _os_log_find((uint64_t)v12);
  if (v13)
    return (os_log_t)v13;
  os_unfair_lock_lock_with_options();
  result = (os_log_t)_os_log_find((uint64_t)v12);
  if (result)
  {
    v13 = (unint64_t)result;
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_1ECCEBE20);
    return (os_log_t)v13;
  }
  if ((MEMORY[0xFFFFFC104] & 0x80000000) != 0
    || (MEMORY[0xFFFFFC104] & 0x10000000) == 0
    || (unsigned __int16)os_log_create_subsystem_id < 0xFA0u)
  {
    v13 = _os_object_alloc_realized();
    *(_DWORD *)(v13 + 8) = 0x7FFFFFFF;
    *(_DWORD *)(v13 + 12) = 0x7FFFFFFF;
    *(_QWORD *)(v13 + 56) = 0x45000000000000;
    _os_log_set_default_signpost_opts(category, v13 + 56);
    metadata_buffer = voucher_activity_get_metadata_buffer();
    if (!metadata_buffer
      || (v16 = v25[0] - 568,
          v25[0] -= 568,
          v17 = *(unsigned __int16 *)(metadata_buffer + 4),
          v18 = (v10 & 1) + (_DWORD)v10 + (_DWORD)v17,
          WORD1(v18))
      || v16 <= v18)
    {
      *(_DWORD *)(v13 + 60) |= 0x4000000u;
      while (1)
      {
        v21 = (unsigned __int16 *)malloc_type_malloc(v10, 0x91D685AAuLL);
        if (v21)
          break;
        _os_trace_temporary_resource_shortage();
      }
      v19 = v21;
      v20 = 0;
    }
    else
    {
      v19 = (unsigned __int16 *)(metadata_buffer + v17 + 568);
      *(_WORD *)(metadata_buffer + 4) = (v10 & 1) + v10 + v17;
      v20 = 1;
    }
    memcpy(v19, v12, v10);
    do
      v22 = __ldxr((unsigned __int16 *)&os_log_create_subsystem_id);
    while (__stxr(v22 + 1, (unsigned __int16 *)&os_log_create_subsystem_id));
    *v19 = v22;
    *(_QWORD *)(v13 + 24) = v19;
    *(_DWORD *)(v13 + 48) = dword_1ECCEBAD8;
    v23 = &_os_log_globals[os_simple_hash() & 0x3F];
    os_unfair_lock_assert_owner((const os_unfair_lock *)&dword_1ECCEBE20);
    ++dword_1ECCEBE24;
    *(_QWORD *)(v13 + 16) = *v23;
    atomic_store(v13, v23);
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_1ECCEBE20);
    if ((v20 & 1) == 0)
    {
      mach_continuous_time();
      voucher_activity_trace();
    }
    _os_log_preferences_refresh(v13);
    return (os_log_t)v13;
  }
  qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Too many os_log_t objects";
  qword_1EE40C120 = (unsigned __int16)os_log_create_subsystem_id;
  __break(1u);
  return result;
}

int *_os_log_preferences_refresh(uint64_t a1)
{
  int v2;
  uint64_t v3;
  char *v4;
  char *v5;
  xpc_object_t dictionary;
  unsigned int *record_by_name;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int *result;
  uint64_t v15;

  v2 = *__error();
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 24);
    if (v3)
    {
      v4 = (char *)(v3 + 4);
      v5 = (char *)(v3 + *(unsigned __int8 *)(v3 + 2) + 4);
      v15 = 0;
      if (qword_1ECCEBB48)
      {
        dictionary = xpc_dictionary_get_dictionary((xpc_object_t)qword_1ECCEBB48, v4);
        os_unfair_lock_lock_with_options();
        if (dictionary)
        {
LABEL_17:
          _os_log_stream_filter_refresh(a1);
          os_unfair_lock_unlock((os_unfair_lock_t)&dword_1ECCEBAE8);
          v12 = _os_log_preferences_load(v4, v5);
          _os_log_preferences_compute(v12, v5, (uint64_t)&v15);
          if (v12)
            xpc_release(v12);
          goto LABEL_23;
        }
      }
      else
      {
        os_unfair_lock_lock_with_options();
      }
      if (byte_1ECCEBB43)
        goto LABEL_17;
      if (dword_1ECCEBAEC != dword_1ECCEBAD8)
        _os_log_preference_load_cache();
      if (!*((_QWORD *)&xmmword_1ECCEBAF0 + 1))
        goto LABEL_17;
      record_by_name = (unsigned int *)_os_log_preferences_cache_find_record_by_name((unsigned int *)(*((_QWORD *)&xmmword_1ECCEBAF0 + 1) + 4), xmmword_1ECCEBAF0 - 4, v4);
      if (record_by_name)
      {
        v8 = record_by_name;
        v9 = record_by_name[1];
        if ((((_BYTE)v9 + 1) & 3) != 0)
          v10 = v9 - (((_BYTE)v9 + 1) & 3) + 5;
        else
          v10 = v9 + 1;
        v11 = _os_log_preferences_cache_find_record_by_name((unsigned int *)((char *)record_by_name + v10 + 20), *record_by_name - v10 - 20, v5);
        if (v11)
        {
          v15 = *(_QWORD *)(v11 + 12);
LABEL_22:
          _os_log_stream_filter_refresh(a1);
          os_unfair_lock_unlock((os_unfair_lock_t)&dword_1ECCEBAE8);
LABEL_23:
          HIDWORD(v15) = HIDWORD(v15) & 0x83FFFFFF | (((*(_DWORD *)(a1 + 60) >> 26) & 0x1F) << 26);
          *(_QWORD *)(a1 + 56) = v15;
          goto LABEL_24;
        }
        v13 = *(_QWORD *)(v8 + 3);
      }
      else
      {
        v13 = 0x45000000000000;
      }
      v15 = v13;
      _os_log_set_default_signpost_opts(v5, (uint64_t)&v15);
      goto LABEL_22;
    }
  }
LABEL_24:
  result = __error();
  *result = v2;
  return result;
}

uint64_t _os_log_preferences_cache_find_record_by_name(unsigned int *a1, unint64_t a2, char *__s)
{
  int v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];
  BOOL (*v14)(uint64_t, unsigned int *);
  void *v15;
  uint64_t *v16;
  char *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = strlen(__s);
  v7 = os_simple_hash();
  v8 = 0;
  v22 = 0x2000000000;
  v13[0] = MEMORY[0x1E0C87450];
  v14 = ___os_log_preferences_cache_find_record_by_name_block_invoke;
  v15 = &unk_1E3C93270;
  v20 = 0;
  v21 = &v20;
  v23 = 0;
  v13[1] = 0x40000000;
  v18 = v7;
  v19 = v6;
  v16 = &v20;
  v17 = __s;
  if (a2 >= 0x14)
  {
    do
    {
      v9 = *a1;
      if (a2 < v9)
        break;
      v10 = a1[1];
      if (v10 + 21 > v9)
        break;
      if (*((_BYTE *)a1 + v10 + 20))
        break;
      if (!((unsigned int (*)(_QWORD *, unsigned int *))v14)(v13, a1))
        break;
      v11 = *a1;
      a1 = (unsigned int *)((char *)a1 + v11);
      a2 -= v11;
    }
    while (a2 > 0x13);
    v8 = v21[3];
  }
  _Block_object_dispose(&v20, 8);
  return v8;
}

BOOL ___os_log_preferences_cache_find_record_by_name_block_invoke(uint64_t a1, unsigned int *a2)
{
  size_t v4;

  if (a2[2] == *(_DWORD *)(a1 + 48))
  {
    v4 = a2[1];
    if ((_DWORD)v4 == *(_DWORD *)(a1 + 52) && !memcmp(a2 + 5, *(const void **)(a1 + 40), v4))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

BOOL _os_log_stream_filter_refresh(_BOOL8 result)
{
  uint64_t v1;
  void *v2;
  uint64_t proc_path;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8[2];
  _QWORD v9[4];
  pid_t v10;
  uid_t v11;

  v1 = result;
  v2 = (void *)qword_1ECCEBAE0;
  if (!qword_1ECCEBAE0)
    goto LABEL_9;
  proc_path = _os_log_get_proc_path();
  v5 = *(_QWORD *)(v1 + 24);
  v6 = v5 + 4;
  if (!v5)
    v6 = 0;
  v9[0] = v6;
  if (v5)
    v5 += *(unsigned __int8 *)(v5 + 2) + 4;
  v9[1] = v5;
  v9[2] = proc_path;
  v9[3] = v4;
  v10 = getpid();
  v11 = geteuid();
  v8[0] = 0;
  v8[1] = 0;
  result = _os_log_matches_filter(v2, (uint64_t)v9, v8);
  if (result)
  {
    if ((v8[0] & 0x40000) != 0)
    {
      if ((v8[0] & 0x200000000) != 0)
      {
        v7 = *(_DWORD *)(v1 + 60) & 0xC7FFFFFF | 0x18000000;
      }
      else if ((v8[0] & 0x100000000) != 0)
      {
        v7 = *(_DWORD *)(v1 + 60) & 0xC7FFFFFF | 0x10000000;
      }
      else if ((v8[0] & 0x800000000) != 0)
      {
        v7 = *(_DWORD *)(v1 + 60) & 0xC7FFFFFF | 0x8000000;
      }
      else
      {
        v7 = *(_DWORD *)(v1 + 60);
      }
    }
    else
    {
      v7 = *(_DWORD *)(v1 + 60) & 0xC7FFFFFF | 0x20000000;
    }
    *(_DWORD *)(v1 + 60) = v7 & 0xBFFFFFFF | (((LODWORD(v8[0]) >> 19) & 1) << 30);
  }
  else
  {
LABEL_9:
    *(_DWORD *)(v1 + 60) &= 0x87FFFFFF;
  }
  return result;
}

uint64_t _os_log_set_default_signpost_opts(const char *a1, uint64_t a2)
{
  uint64_t result;
  unsigned int v5;

  result = strcmp(a1, "DynamicTracing");
  if ((_DWORD)result)
  {
    result = strcmp(a1, "DynamicStackTracing");
    if ((_DWORD)result)
      return result;
    v5 = *(_DWORD *)(a2 + 4) & 0xFFCBFFFF | 0x100000;
  }
  else
  {
    v5 = *(_DWORD *)(a2 + 4) & 0xFFFBFFFF;
  }
  *(_DWORD *)(a2 + 4) = v5;
  return result;
}

uint64_t _os_log_find(uint64_t a1)
{
  const void *v2;
  uint64_t i;
  uint64_t v4;
  unsigned int v5;

  v2 = (const void *)(a1 + 4);
  for (i = _os_log_globals[os_simple_hash() & 0x3F]; i; i = *(_QWORD *)(i + 16))
  {
    v4 = *(_QWORD *)(i + 24);
    v5 = *(unsigned __int16 *)(v4 + 2);
    if (v5 == *(unsigned __int16 *)(a1 + 2) && !memcmp((const void *)(v4 + 4), v2, (v5 >> 8) + v5))
      break;
  }
  return i;
}

void _os_log_preferences_refresh_process()
{
  int v0;
  uint64_t plist_at;
  void *v2;
  uint64_t v3;
  int64_t int64;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9[2];
  xpc_object_t dictionary;
  xpc_object_t v11;
  uint64_t proc_path;
  uint64_t v13;
  pid_t v14;
  uid_t v15;
  char __str[1024];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  if ((dword_1ECCEBAC8 & 0x100) == 0 && (MEMORY[0xFFFFFC104] & 0x100) == 0)
  {
    v0 = *__error();
    if (_os_trace_paths_init_once != -1)
      dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
    snprintf(__str, 0x400uLL, "%s/%s.plist", (const char *)_os_trace_preferences_path, "com.apple.diagnosticd.filter");
    plist_at = _os_trace_read_plist_at(4294967294, __str);
    if (plist_at)
    {
      v2 = (void *)plist_at;
      dictionary = 0;
      v11 = 0;
      proc_path = _os_log_get_proc_path();
      v13 = v3;
      v14 = getpid();
      v15 = geteuid();
      v9[0] = 0;
      v9[1] = 0;
      if (!_os_log_matches_filter(v2, (uint64_t)&dictionary, v9))
        v9[0] = 0;
      int64 = xpc_dictionary_get_int64(v2, "global");
      v9[0] |= int64;
      HIDWORD(qword_1ECCEBB30) = HIDWORD(v9[0]);
      *(_DWORD *)&byte_1ECCEBB38 = WORD1(v9[0]);
      xpc_release(v2);
    }
    else
    {
      *(uint64_t *)((char *)&qword_1ECCEBB30 + 4) = 0x70000000BLL;
    }
    if (qword_1ECCEBB50)
    {
      dictionary = 0;
      v11 = 0;
      if (_os_trace_paths_init_once != -1)
        dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
      snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_system_preferences_path, "Processes", (const char *)qword_1ECCEBB50);
      v5 = (void *)_os_trace_read_plist_at(4294967294, __str);
      v6 = v5;
      if (v5)
        dictionary = xpc_dictionary_get_dictionary(v5, "Level");
      if (_os_trace_paths_init_once != -1)
        dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
      snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_preferences_path, "Processes", (const char *)qword_1ECCEBB50);
      v7 = (void *)_os_trace_read_plist_at(4294967294, __str);
      v8 = v7;
      if (v7)
        v11 = xpc_dictionary_get_dictionary(v7, "Level");
      process_prefs_0 = process_prefs_0 & 0xFC | _os_log_preference_option(&dictionary, "Enable") & 3;
      process_prefs_0 = process_prefs_0 & 0xE3 | (4 * _os_log_preference_option(&dictionary, "Persist"));
      if (v8)
        xpc_release(v8);
      if (v6)
        xpc_release(v6);
    }
    *__error() = v0;
  }
}

void *_os_log_preference_load_cache()
{
  vm_map_t *v0;
  _DWORD *logging_preferences;
  void *result;
  char __str[1024];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C874D8];
  dword_1ECCEBAEC = dword_1ECCEBAD8;
  v0 = (vm_map_t *)MEMORY[0x1E0C883F0];
  if (*((_QWORD *)&xmmword_1ECCEBAF0 + 1))
    mach_vm_deallocate(*MEMORY[0x1E0C883F0], *((mach_vm_address_t *)&xmmword_1ECCEBAF0 + 1), xmmword_1ECCEBAF0);
  logging_preferences = (_DWORD *)voucher_activity_get_logging_preferences();
  *((_QWORD *)&xmmword_1ECCEBAF0 + 1) = logging_preferences;
  if (logging_preferences && ((unint64_t)xmmword_1ECCEBAF0 < 4 || *logging_preferences != 6))
  {
    mach_vm_deallocate(*v0, (mach_vm_address_t)logging_preferences, xmmword_1ECCEBAF0);
    xmmword_1ECCEBAF0 = 0uLL;
  }
  if (_os_trace_paths_init_once != -1)
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
  snprintf(__str, 0x400uLL, "%s/%s.plist", (const char *)_os_trace_preferences_path, "com.apple.diagnosticd.filter");
  if (qword_1ECCEBAE0)
  {
    xpc_release((xpc_object_t)qword_1ECCEBAE0);
    qword_1ECCEBAE0 = 0;
  }
  result = _os_trace_read_plist_at(-2, __str);
  qword_1ECCEBAE0 = (uint64_t)result;
  return result;
}

void *_os_log_preferences_load_base_sysprefs_file(char *__str, const char *a2, int a3)
{
  void *result;

  if (!a3)
    goto LABEL_9;
  if (_os_trace_paths_init_once != -1)
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
  snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_app_cryptex_system_preferences_path, "Subsystems", a2);
  result = _os_trace_read_plist_at(-2, __str);
  if (!result)
  {
    if (_os_trace_paths_init_once != -1)
      dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
    snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_os_cryptex_system_preferences_path, "Subsystems", a2);
    result = _os_trace_read_plist_at(-2, __str);
    if (!result)
    {
LABEL_9:
      if (_os_trace_paths_init_once != -1)
        dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
      snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_system_preferences_path, "Subsystems", a2);
      return _os_trace_read_plist_at(-2, __str);
    }
  }
  return result;
}

void *_os_trace_read_plist_at(int a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint32_t v7;
  int v8;
  int64_t v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  v10 = 0;
  v3 = _os_trace_read_file_at(a1, a2, 0x10000, &v10);
  if (!v3)
  {
    v8 = *__error();
    if (v8 == 2 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136446466;
    v12 = a2;
    v13 = 1024;
    v14 = v8;
    v6 = "failed to read %{public}s: %{darwin.errno}d";
    v7 = 18;
    goto LABEL_12;
  }
  v4 = (void *)v3;
  v5 = (void *)xpc_create_from_plist();
  free(v4);
  if (!v5)
  {
LABEL_5:
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136446210;
    v12 = a2;
    v6 = "invalid property list at %{public}s";
    v7 = 12;
LABEL_12:
    _os_log_error_impl(&dword_19BBEC000, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v6, buf, v7);
    return 0;
  }
  if (object_getClass(v5) != (Class)MEMORY[0x1E0C88FE8])
  {
    xpc_release(v5);
    goto LABEL_5;
  }
  return v5;
}

uint64_t _os_trace_read_file_at(int a1, const char *a2, off_t a3, int64_t *a4)
{
  int v6;
  int v7;
  off_t v8;
  int64_t v9;
  int v10;
  char *v11;
  char *v12;
  off_t v13;
  ssize_t v14;
  uint64_t result;
  int v16;
  int v17;

  v6 = openat(a1, a2, 16777476);
  if (v6 < 0)
  {
    v10 = *__error();
    goto LABEL_21;
  }
  v7 = v6;
  v8 = lseek(v6, 0, 2);
  if (v8 < 0)
  {
    v10 = *__error();
    goto LABEL_20;
  }
  v9 = v8;
  if (v8 > a3)
  {
    v10 = 34;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = (char *)malloc_type_malloc(v9, 0x91D685AAuLL);
    if (v11)
      break;
    _os_trace_temporary_resource_shortage();
  }
  v12 = v11;
  if (v9 < 1)
  {
LABEL_16:
    if (close(v7) == -1)
    {
      v17 = *__error();
      result = *__error();
      if (v17 == 9)
      {
LABEL_28:
        qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1EE40C120 = result;
        __break(1u);
        return result;
      }
      _os_assumes_log();
    }
    *a4 = v9;
    return (uint64_t)v12;
  }
  v13 = 0;
  while (1)
  {
    v14 = pread(v7, &v12[v13], v9 - v13, v13);
    if ((v14 & 0x8000000000000000) == 0)
      break;
    v10 = *__error();
    if (v10 != 4)
      goto LABEL_19;
LABEL_15:
    if (v13 >= v9)
      goto LABEL_16;
  }
  if (v14)
  {
    v13 += v14;
    goto LABEL_15;
  }
  v10 = 70;
LABEL_19:
  free(v12);
LABEL_20:
  if (close(v7) == -1)
  {
    v16 = *__error();
    result = *__error();
    if (v16 != 9)
    {
      _os_assumes_log();
      goto LABEL_21;
    }
    qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1EE40C120 = result;
    __break(1u);
    goto LABEL_28;
  }
LABEL_21:
  *a4 = 0;
  v12 = 0;
  *__error() = v10;
  return (uint64_t)v12;
}

void *_os_log_preferences_load(const char *a1, char *a2)
{
  void *base_sysprefs_file;
  void *plist_at;
  void *v6;
  xpc_object_t dictionary;
  xpc_object_t v8;
  void *v9;
  char __str[1024];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C874D8];
  base_sysprefs_file = _os_log_preferences_load_base_sysprefs_file(__str, a1, 1);
  if ((MEMORY[0xFFFFFC104] & 0x80000000) == 0 && (MEMORY[0xFFFFFC104] & 0x10000000) != 0)
  {
    if (_os_trace_paths_init_once != -1)
      dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
    snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_internal_preferences_path, "Subsystems", a1);
    plist_at = _os_trace_read_plist_at(-2, __str);
  }
  else
  {
    plist_at = 0;
  }
  if (_os_trace_paths_init_once != -1)
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
  snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_preferences_path, "Subsystems", a1);
  v6 = _os_trace_read_plist_at(-2, __str);
  if (qword_1ECCEBB48)
  {
    dictionary = xpc_dictionary_get_dictionary((xpc_object_t)qword_1ECCEBB48, a1);
    if (dictionary)
    {
      v8 = xpc_copy(dictionary);
      if (!v6)
        goto LABEL_12;
LABEL_16:
      if (v8)
      {
        _os_log_preferences_merge(v8, v6, a2);
        if (plist_at)
        {
LABEL_23:
          _os_log_preferences_merge(plist_at, v8, a2);
          v9 = v8;
          goto LABEL_24;
        }
LABEL_18:
        v9 = 0;
        if (base_sysprefs_file)
          goto LABEL_25;
        goto LABEL_19;
      }
      v8 = v6;
LABEL_22:
      v6 = 0;
      if (plist_at)
        goto LABEL_23;
      goto LABEL_18;
    }
  }
  v8 = 0;
  if (v6)
    goto LABEL_16;
LABEL_12:
  if (v8)
    goto LABEL_22;
  if (!plist_at)
    return base_sysprefs_file;
  v9 = 0;
  v6 = 0;
LABEL_24:
  v8 = plist_at;
  if (base_sysprefs_file)
  {
LABEL_25:
    _os_log_preferences_merge(base_sysprefs_file, v8, a2);
    xpc_release(v8);
    if (!v6)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_19:
  base_sysprefs_file = v8;
  if (v6)
LABEL_26:
    xpc_release(v6);
LABEL_27:
  if (v9)
    xpc_release(v9);
  return base_sysprefs_file;
}

void _os_log_preferences_merge(void *a1, xpc_object_t xdict, char *a3)
{
  _QWORD v6[6];

  if (a3)
  {
    _os_log_preferences_merge_category(a1, xdict, "DEFAULT-OPTIONS");
    _os_log_preferences_merge_category(a1, xdict, a3);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C87450];
    v6[1] = 0x40000000;
    v6[2] = ___os_log_preferences_merge_block_invoke;
    v6[3] = &__block_descriptor_tmp_209;
    v6[4] = a1;
    v6[5] = xdict;
    xpc_dictionary_apply(xdict, v6);
  }
}

int *_os_trace_prefs_and_mode_refresh_slow(int a1)
{
  int v1;
  int v2;
  __uint64_t v3;
  unint64_t v4;
  mach_port_name_t v5;
  int v6;
  unsigned int v7;
  unsigned __int8 v8;
  int *result;
  int check;
  int out_token;
  mach_msg_header_t msg[5];
  uint64_t v13;

  v1 = a1;
  v13 = *MEMORY[0x1E0C874D8];
  check = 0;
  out_token = a1;
  v2 = *__error();
  v3 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX);
  do
  {
    v4 = __ldxr(&qword_1ECCEBAC0);
    if (v3 < v4)
    {
      __clrex();
      goto LABEL_20;
    }
  }
  while (__stxr(v3 + 1000000000, &qword_1ECCEBAC0));
  v5 = dword_1ECCEBAD0;
  memset(msg, 0, 108);
  while (!mach_msg(msg, 67109122, 0, 0x6Cu, v5, 0, 0))
    _os_trace_mig_server(108, msg);
  if (v1 == -2)
  {
    if (!notify_register_check("com.apple.system.logging.prefschanged", &out_token))
    {
      v6 = out_token;
      while (1)
      {
        v1 = __ldxr((unsigned int *)&dword_1ECCEBAD4);
        if (v1 != -2)
          break;
        if (!__stxr(v6, (unsigned int *)&dword_1ECCEBAD4))
        {
          v1 = v6;
          if (v6 < 0)
            goto LABEL_20;
          goto LABEL_17;
        }
      }
      __clrex();
      notify_cancel(v6);
      out_token = v1;
      if ((v1 & 0x80000000) == 0)
        goto LABEL_17;
    }
  }
  else
  {
LABEL_17:
    if (!notify_check(v1, &check) && check)
    {
      do
        v7 = __ldxr((unsigned int *)&dword_1ECCEBAD8);
      while (__stxr(v7 + 1, (unsigned int *)&dword_1ECCEBAD8));
    }
  }
LABEL_20:
  if ((byte_1ECCEBB3C & 1) == 0 && _dispatch_is_multithreaded())
  {
    do
      v8 = __ldxr((unsigned __int8 *)&byte_1ECCEBB3C);
    while (__stxr(1u, (unsigned __int8 *)&byte_1ECCEBB3C));
    if ((v8 & 1) == 0)
      _os_log_watch_for_prefchanges();
  }
  result = __error();
  *result = v2;
  return result;
}

void _os_log_watch_for_prefchanges()
{
  NSObject *v0;
  uint32_t v1;
  int v2;
  BOOL v3;
  unsigned int v4;
  int check;
  int out_token;

  out_token = 0;
  v0 = dispatch_queue_create_with_target_V2("com.apple.os.log.notify", 0, 0);
  v1 = notify_register_dispatch("com.apple.system.logging.prefschanged", &out_token, v0, &__block_literal_global_273);
  dispatch_release(v0);
  if (!v1)
  {
    do
      v2 = __ldxr((unsigned int *)&dword_1ECCEBAD4);
    while (__stxr(0xFFFFFFFF, (unsigned int *)&dword_1ECCEBAD4));
    out_token = v2;
    if ((v2 & 0x80000000) == 0)
    {
      check = 0;
      if (notify_check(v2, &check))
        v3 = 1;
      else
        v3 = check == 0;
      if (!v3)
      {
        do
          v4 = __ldxr((unsigned int *)&dword_1ECCEBAD8);
        while (__stxr(v4 + 1, (unsigned int *)&dword_1ECCEBAD8));
      }
      notify_cancel(out_token);
    }
  }
}

void *_os_trace_calloc(size_t count, size_t size)
{
  void *result;

  while (1)
  {
    result = malloc_type_calloc(count, size, 0x478C0A82uLL);
    if (result)
      break;
    _os_trace_temporary_resource_shortage();
  }
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  uint64_t v6;

  _os_log((uint64_t)dso, (uint64_t)log, type, (uint64_t)format, (uint64_t)buf, *(uint64_t *)&size, v6);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  uint64_t v6;

  _os_log(dso, log, type, format, buf, *(_QWORD *)&size, v6, 0);
}

void _os_log(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v13 = 0;
  v7 = 0u;
  v8 = 0;
  v9 = a1;
  v10 = a7;
  v11 = a4;
  v12 = 0uLL;
  __error();
  _os_log_impl_flatten_and_send((uint64_t)&v7);
}

xpc_object_t _os_log_preferences_compute(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t dictionary;
  void *v7;
  xpc_object_t v8;
  void *v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  objc_class *v13;
  xpc_object_t v14;
  const char *string_ptr;
  int v16;
  xpc_object_t v17;
  xpc_object_t v18;
  const char *v19;
  int v20;
  xpc_object_t v21;
  const char *v22;
  int v23;
  objc_class *v24;
  xpc_object_t v25;
  xpc_object_t v26;
  int v27;
  objc_class *v28;
  xpc_object_t v29;
  xpc_object_t v30;
  int v31;
  xpc_object_t v32;
  xpc_object_t v33;
  xpc_object_t v34;
  const char *v35;
  int v36;
  int v38;
  xpc_object_t result;
  int v40;
  int v41;
  xpc_object_t v42;
  xpc_object_t v43;
  char v44;
  char v45;
  unsigned __int8 v46;
  unsigned __int8 v47;
  xpc_object_t v48;
  xpc_object_t v49;
  xpc_object_t v50;
  xpc_object_t v51;
  xpc_object_t v52;
  xpc_object_t v53;

  v52 = 0;
  v53 = 0;
  v50 = 0;
  v51 = 0;
  v48 = 0;
  v49 = 0;
  if (a1)
  {
    dictionary = xpc_dictionary_get_dictionary(a1, "DEFAULT-OPTIONS");
    v52 = dictionary;
    if (dictionary)
    {
      v7 = dictionary;
      v48 = xpc_dictionary_get_dictionary(dictionary, "Level");
      v50 = xpc_dictionary_get_dictionary(v7, "TTL");
    }
    if (a2)
    {
      v8 = xpc_dictionary_get_dictionary(a1, a2);
      v53 = v8;
      if (v8)
      {
        v9 = v8;
        v49 = xpc_dictionary_get_dictionary(v8, "Level");
        v51 = xpc_dictionary_get_dictionary(v9, "TTL");
      }
    }
  }
  v10 = _os_log_preference_option_ttl((uint64_t)&v50, "Default");
  v11 = _os_log_preference_option_ttl((uint64_t)&v50, "Info");
  v12 = _os_log_preference_option_ttl((uint64_t)&v50, "Debug");
  v45 = _os_log_preference_option(&v48, "Enable");
  v44 = _os_log_preference_option(&v48, "Persist");
  v13 = (objc_class *)MEMORY[0x1E0C88FC8];
  v43 = _os_log_preference_value((uint64_t)&v52, "Symptoms", MEMORY[0x1E0C88FC8]);
  v42 = _os_log_preference_value((uint64_t)&v52, "Enable-Oversize-Messages", v13);
  v14 = _os_log_preference_value((uint64_t)&v52, "Default-Privacy-Setting", MEMORY[0x1E0C89020]);
  v46 = v12;
  if (!v14)
    goto LABEL_11;
  string_ptr = xpc_string_get_string_ptr(v14);
  if (!strcasecmp(string_ptr, "Sensitive"))
  {
    v16 = 6144;
  }
  else if (!strcasecmp(string_ptr, "Private"))
  {
    v16 = 4096;
  }
  else
  {
    if (strcasecmp(string_ptr, "Public"))
    {
LABEL_11:
      v41 = 0;
      goto LABEL_16;
    }
    v16 = 2048;
  }
  v41 = v16;
LABEL_16:
  v17 = _os_log_preference_value((uint64_t)&v52, "Privacy-Enable-Level", MEMORY[0x1E0C89020]);
  v18 = (xpc_object_t)MEMORY[0x1E0C88F90];
  if (!v17)
  {
LABEL_20:
    v20 = (_os_log_preference_value((uint64_t)&v52, "Enable-Private-Data", MEMORY[0x1E0C88FC8]) == v18) << 14;
    goto LABEL_24;
  }
  v19 = xpc_string_get_string_ptr(v17);
  if (!strcasecmp(v19, "Sensitive"))
  {
    v20 = 24576;
  }
  else if (!strcasecmp(v19, "Private"))
  {
    v20 = 0x4000;
  }
  else
  {
    if (strcasecmp(v19, "Public"))
      goto LABEL_20;
    v20 = 0x2000;
  }
LABEL_24:
  v40 = v20;
  v21 = _os_log_preference_value((uint64_t)&v52, "Signpost-Scope", MEMORY[0x1E0C89020]);
  if (!v21)
  {
LABEL_28:
    v23 = 0x10000;
    goto LABEL_31;
  }
  v22 = xpc_string_get_string_ptr(v21);
  if (!strcasecmp(v22, "Thread"))
  {
    v23 = 0x8000;
  }
  else
  {
    if (!strcasecmp(v22, "Process") || strcasecmp(v22, "System"))
      goto LABEL_28;
    v23 = 98304;
  }
LABEL_31:
  v24 = (objc_class *)MEMORY[0x1E0C88FC8];
  v25 = _os_log_preference_value((uint64_t)&v52, "Supports-Signpost-Introspection", MEMORY[0x1E0C88FC8]);
  v26 = _os_log_preference_value((uint64_t)&v52, "Signpost-Enabled", v24);
  v47 = v10;
  if (v26)
  {
    if (v26 == v18)
    {
LABEL_36:
      v27 = 0x40000;
      goto LABEL_38;
    }
  }
  else if (strcmp(a2, "DynamicTracing") && strcmp(a2, "DynamicStackTracing"))
  {
    goto LABEL_36;
  }
  v27 = 0;
LABEL_38:
  v28 = (objc_class *)MEMORY[0x1E0C88FC8];
  v29 = _os_log_preference_value((uint64_t)&v52, "Signpost-Persisted", MEMORY[0x1E0C88FC8]);
  v30 = _os_log_preference_value((uint64_t)&v52, "Signpost-Backtraces-Enabled", v28);
  if (v30)
  {
    if (v30 == v18)
      v31 = 1;
    else
      v31 = 2;
  }
  else
  {
    v31 = strcmp(a2, "DynamicStackTracing") == 0;
  }
  v32 = _os_log_preference_value((uint64_t)&v52, "Signpost-Allow-Streaming", v28);
  v33 = _os_log_preference_value((uint64_t)&v52, "Enable-Fault-Crashlogs", v28);
  if (v33 == v18)
  {
LABEL_50:
    v36 = 0x1000000;
    goto LABEL_51;
  }
  if (v33 == (xpc_object_t)MEMORY[0x1E0C88F88])
    goto LABEL_49;
  v34 = _os_log_preference_value((uint64_t)&v52, "Enable-Fault-Crashlogs", MEMORY[0x1E0C89020]);
  if (!v34)
    goto LABEL_49;
  v35 = xpc_string_get_string_ptr(v34);
  if (strcasecmp(v35, "Once"))
  {
    if (!strcasecmp(v35, "None") || strcasecmp(v35, "Always"))
    {
LABEL_49:
      v36 = 0;
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  v36 = 0x800000;
LABEL_51:
  if (v32 == v18 || v32 == 0)
    v38 = 0x400000;
  else
    v38 = 0;
  result = _os_log_preference_value((uint64_t)&v52, "Enable-Fault-Crashlog-Excerpts", MEMORY[0x1E0C88FC8]);
  *(_BYTE *)a3 = 0;
  *(_BYTE *)(a3 + 1) = v47;
  *(_BYTE *)(a3 + 2) = v11;
  *(_BYTE *)(a3 + 3) = v46;
  *(_DWORD *)(a3 + 4) = (v45 | (8 * v44)) | ((v43 == v18) << 9) | ((v42 == v18) << 10) | v41 | v40 | v23 | ((v25 == v18) << 17) | v27 | ((v29 == v18) << 19) | (v31 << 20) | v38 | v36 | ((result == v18) << 25);
  return result;
}

xpc_object_t _os_log_preference_value(uint64_t a1, char *key, objc_class *a3)
{
  void *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t value;
  xpc_object_t v10;

  v6 = *(void **)(a1 + 8);
  if (!v6 || (v7 = xpc_dictionary_get_value(v6, key)) == 0 || (v8 = v7, object_getClass(v7) != a3))
  {
    if (*(_QWORD *)a1 && (value = xpc_dictionary_get_value(*(xpc_object_t *)a1, key)) != 0)
    {
      v10 = value;
      if (object_getClass(value) == a3)
        return v10;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

uint64_t _os_log_fmt_flatten_to_blob(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, size_t a5, uint64_t a6, uint64_t a7, size_t a8, unint64_t a9, unint64_t a10)
{
  int v15;
  char *v16;
  unsigned __int16 v17;
  uint64_t v18;
  __int16 v19;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C874D8];
  v24 = 0;
  if (privacy_flags2opt[*(_BYTE *)a1 & 7] <= a2 || (*(_BYTE *)a1 & 0xF0) == 0x80)
  {
    if ((*(_BYTE *)a1 & 1) != 0)
      v18 = a7;
    else
      v18 = a6;
    v15 = *(_DWORD *)(v18 + 8);
    v17 = _os_log_fmt_flatten_data_into_blob(v18, a9, a10, a4, a5, a8, &v24);
  }
  else
  {
    if (!a3)
      return 0;
    v23 = 0x1000000010000;
    v21 = &v25;
    v22 = 0x36200000000;
    _os_log_fmt_flatten_data_into_blob((uint64_t)&v21, a9, a10, a4, a5, 0x10000uLL, &v24);
    v15 = *(_DWORD *)(a6 + 8);
    v16 = v21;
    v17 = _os_log_fmt_flatten_masked_data((_BYTE *)a1, a2, a3, a6, v21, v22, a8, &v24);
    if ((v23 & 0x100000000) != 0)
      free(v16);
  }
  v19 = v17 & 0x7FFF | (v24 << 15);
  *(_WORD *)(a1 + 2) = v15;
  *(_WORD *)(a1 + 4) = v19;
  return v17;
}

size_t _os_log_fmt_flatten_data_into_blob(uint64_t a1, unint64_t __src, unint64_t a3, void *a4, size_t __n, size_t a6, BOOL *a7)
{
  size_t v8;
  _DWORD *v9;
  uint64_t v11;
  size_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  size_t v17;
  int v18;
  int v19;
  size_t v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  size_t v26;
  char v27;
  size_t v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  __int16 v32;
  uint64_t v33;
  char *v35;
  size_t v36;
  _BYTE *v37;
  char v38;
  char v39;
  _BYTE __srca[4];

  v8 = __n;
  v9 = (_DWORD *)a3;
  v11 = a1;
  *a7 = 0;
  if (__src && a6)
  {
    v37 = 0;
    if (__n + 1 < a6)
      v12 = __n + 1;
    else
      v12 = a6;
    if (!__n)
      v12 = a6;
    v13 = os_trace_blob_addns(a1, (_BYTE *)__src, v12 - 1, &v37);
    v39 = 0;
    if ((*(_WORD *)(v11 + 20) & 2) == 0)
    {
      v14 = *(unsigned int *)(v11 + 8);
      if (*(char *)(v11 + 22) + *(_DWORD *)(v11 + 12) - 1 == (_DWORD)v14)
      {
        os_trace_blob_add_slow(v11, &v39, 1uLL);
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)v11 + v14) = 0;
        v15 = *(_DWORD *)(v11 + 8) + 1;
        *(_DWORD *)(v11 + 8) = v15;
        if (!*(_BYTE *)(v11 + 22))
          *(_BYTE *)(*(_QWORD *)v11 + v15) = 0;
      }
    }
    v16 = (!v8 || (unint64_t)v37 < __src + v8) && *v37 != 0;
    *a7 = v16;
    return (v13 + 1);
  }
  if (a3 && a6)
  {
    v17 = a6 - 1;
    v18 = *(_DWORD *)(a1 + 8);
    if (!*(_BYTE *)(a1 + 22))
      ++v18;
    v19 = *(_DWORD *)(a1 + 16);
    if (v19)
    {
      v20 = (v19 - v18);
    }
    else
    {
      v23 = *(_DWORD *)(a1 + 12);
      LODWORD(v20) = v23 - v18;
      if (v23)
        v20 = v20;
      else
        v20 = 0;
    }
    if (v17 > v20)
      v17 = v20;
    v24 = *(_DWORD *)a3;
    if (*(_DWORD *)a3)
    {
      v25 = 0;
      do
      {
        if (v24 >= 0x80)
        {
          if (v24 >= 0x800)
          {
            if (HIWORD(v24))
            {
              if (HIWORD(v24) > 0x10u)
                break;
              v27 = -16;
              v26 = 4;
            }
            else
            {
              if (v24 >> 11 == 27)
                break;
              v27 = -32;
              v26 = 3;
            }
          }
          else
          {
            v27 = -64;
            v26 = 2;
          }
          v28 = v26 - 1;
          do
          {
            __srca[v28] = v24 & 0x3F | 0x80;
            v24 = (int)v24 >> 6;
            --v28;
          }
          while (v28);
          LOBYTE(v24) = v24 | v27;
        }
        else
        {
          v26 = 1;
        }
        __srca[0] = v24;
        if (v26 + v25 > v17 || (*(_WORD *)(v11 + 20) & 2) != 0)
          break;
        v29 = *(unsigned int *)(v11 + 8);
        if (v26 > (*(char *)(v11 + 22) + *(_DWORD *)(v11 + 12) - v29 - 1))
        {
          LODWORD(v26) = os_trace_blob_add_slow(v11, __srca, v26);
          if (!(_DWORD)v26)
            break;
        }
        else
        {
          memcpy((void *)(*(_QWORD *)v11 + v29), __srca, v26);
          v30 = *(_DWORD *)(v11 + 8) + v26;
          *(_DWORD *)(v11 + 8) = v30;
          if (!*(_BYTE *)(v11 + 22))
            *(_BYTE *)(*(_QWORD *)v11 + v30) = 0;
        }
        v25 += v26;
        v31 = v9[1];
        ++v9;
        v24 = v31;
      }
      while (v31);
    }
    else
    {
      LODWORD(v25) = 0;
    }
    v8 = (v25 + 1);
    v32 = *(_WORD *)(v11 + 20);
    *a7 = *v9 != 0;
    v38 = 0;
    if ((v32 & 2) == 0)
    {
      v33 = *(unsigned int *)(v11 + 8);
      if (*(char *)(v11 + 22) + *(_DWORD *)(v11 + 12) - 1 != (_DWORD)v33)
      {
        *(_BYTE *)(*(_QWORD *)v11 + v33) = 0;
        v22 = *(_DWORD *)(v11 + 8) + 1;
LABEL_62:
        *(_DWORD *)(v11 + 8) = v22;
        if (!*(_BYTE *)(v11 + 22))
          *(_BYTE *)(*(_QWORD *)v11 + v22) = 0;
        return v8;
      }
      v35 = &v38;
      a1 = v11;
      v36 = 1;
      goto LABEL_68;
    }
  }
  else
  {
    if (__src | a3)
    {
      v8 = 0;
      *a7 = 1;
      return v8;
    }
    if (__n > a6)
    {
      *a7 = 1;
      v8 = a6;
    }
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      v21 = *(unsigned int *)(a1 + 8);
      if (v8 <= (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v21 - 1))
      {
        memcpy((void *)(*(_QWORD *)a1 + v21), a4, v8);
        v22 = *(_DWORD *)(v11 + 8) + v8;
        goto LABEL_62;
      }
      v35 = (char *)a4;
      v36 = v8;
LABEL_68:
      os_trace_blob_add_slow(a1, v35, v36);
    }
  }
  return v8;
}

unint64_t os_trace_blob_addns(uint64_t a1, _BYTE *__src, unint64_t a3, _QWORD *a4)
{
  unint64_t v5;
  _BYTE *v6;
  int v8;
  int v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  size_t v14;
  size_t v15;
  size_t v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  int v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  size_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  char v33;
  __int16 *p_srca;
  uint64_t v35;
  size_t v36;
  int v38;
  int __srca;
  __int16 v40;
  char v41;

  if ((*(_WORD *)(a1 + 20) & 2) != 0)
    return 0;
  v5 = a3;
  v6 = __src;
  v8 = *(_DWORD *)(a1 + 8);
  if (!*(_BYTE *)(a1 + 22))
    ++v8;
  v9 = *(_DWORD *)(a1 + 16);
  if (v9)
  {
    v10 = (v9 - v8);
  }
  else
  {
    v11 = *(_DWORD *)(a1 + 12);
    LODWORD(v10) = v11 - v8;
    if (v11)
      v10 = v10;
    else
      v10 = 0;
  }
  if (v10 < a3)
    v5 = v10;
  if (!*__src)
  {
    v19 = 0;
LABEL_76:
    if (a4)
      goto LABEL_77;
    return v19;
  }
  v12 = 0;
  v13 = MEMORY[0x1E0C87458];
  while (1)
  {
    v14 = 0;
    v15 = v5 - v12;
    if (v5 != v12)
    {
      while ((char)v6[v14] >= 1 && (*(_DWORD *)(v13 + 4 * v6[v14] + 60) & 0x4200) != 0x200)
      {
        if (v15 == ++v14)
        {
          v14 = v5 - v12;
          break;
        }
      }
    }
    if (v14 >= v15)
      v16 = v5 - v12;
    else
      v16 = v14;
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      v17 = *(unsigned int *)(a1 + 8);
      if (v16 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v17 - 1))
      {
        os_trace_blob_add_slow(a1, v6, v16);
      }
      else
      {
        memcpy((void *)(*(_QWORD *)a1 + v17), v6, v16);
        v18 = *(_DWORD *)(a1 + 8) + v16;
        *(_DWORD *)(a1 + 8) = v18;
        if (!*(_BYTE *)(a1 + 22))
          *(_BYTE *)(*(_QWORD *)a1 + v18) = 0;
      }
    }
    v6 += v16;
    v19 = v16 + v12;
    if (v5 == v19)
      break;
    v20 = *v6;
    if (!*v6)
      goto LABEL_76;
    if ((v20 & 0x80) == 0)
    {
      v12 = v19 + 3;
      if (v19 + 3 > v5)
        goto LABEL_76;
      if (v20 == 127)
        v21 = 63;
      else
        v21 = v20 + 64;
      v40 = 24156;
      v41 = v21;
      if ((*(_BYTE *)(a1 + 20) & 2) != 0)
        goto LABEL_65;
      v22 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v22 - 1) <= 2)
      {
        p_srca = &v40;
        v35 = a1;
        v36 = 3;
        goto LABEL_74;
      }
      v23 = *(_QWORD *)a1 + v22;
      *(_WORD *)v23 = v40;
      *(_BYTE *)(v23 + 2) = v41;
      v24 = *(_DWORD *)(a1 + 8) + 3;
      goto LABEL_63;
    }
    if ((v20 & 0xF8) == 0xF0)
    {
      v25 = 4;
    }
    else if ((v20 & 0xF0) == 0xE0)
    {
      v25 = 3;
    }
    else
    {
      if ((v20 & 0xE0) != 0xC0)
        goto LABEL_51;
      v25 = 2;
    }
    if (v25 > v5 - v19)
      goto LABEL_76;
    v26 = 1;
    while ((v6[v26] & 0xC0) == 0x80)
    {
      if (v25 == ++v26)
      {
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          v27 = *(unsigned int *)(a1 + 8);
          if (v25 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
          {
            os_trace_blob_add_slow(a1, v6, v25);
          }
          else
          {
            memcpy((void *)(*(_QWORD *)a1 + v27), v6, v25);
            v28 = *(_DWORD *)(a1 + 8) + v25;
            *(_DWORD *)(a1 + 8) = v28;
            if (!*(_BYTE *)(a1 + 22))
              *(_BYTE *)(*(_QWORD *)a1 + v28) = 0;
          }
        }
        v6 += v25;
        v12 = v25 + v19;
        if (v12 != v5)
          goto LABEL_66;
        goto LABEL_79;
      }
    }
LABEL_51:
    v12 = v19 + 4;
    if (v19 + 4 > v5)
      goto LABEL_76;
    v29 = v20 & 0x7F;
    if ((*(_DWORD *)(v13 + 4 * v29 + 60) & 0x200) == 0)
    {
      qmemcpy(&v38, "\\M-", 3);
      HIBYTE(v38) = v29;
      if ((*(_BYTE *)(a1 + 20) & 2) != 0)
        goto LABEL_65;
      v30 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 3)
      {
        p_srca = (__int16 *)&v38;
        goto LABEL_73;
      }
      v31 = *(_QWORD *)a1;
      v32 = v38;
      goto LABEL_62;
    }
    if ((_DWORD)v29 == 127)
      v33 = 63;
    else
      v33 = v29 + 64;
    qmemcpy(&__srca, "\\M^", 3);
    HIBYTE(__srca) = v33;
    if ((*(_BYTE *)(a1 + 20) & 2) == 0)
    {
      v30 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 3)
      {
        p_srca = (__int16 *)&__srca;
LABEL_73:
        v35 = a1;
        v36 = 4;
LABEL_74:
        os_trace_blob_add_slow(v35, p_srca, v36);
        goto LABEL_65;
      }
      v31 = *(_QWORD *)a1;
      v32 = __srca;
LABEL_62:
      *(_DWORD *)(v31 + v30) = v32;
      v24 = *(_DWORD *)(a1 + 8) + 4;
LABEL_63:
      *(_DWORD *)(a1 + 8) = v24;
      if (!*(_BYTE *)(a1 + 22))
        *(_BYTE *)(*(_QWORD *)a1 + v24) = 0;
    }
LABEL_65:
    ++v6;
LABEL_66:
    v19 = v12;
    if (!*v6)
      goto LABEL_76;
  }
LABEL_79:
  v19 = v5;
  if (!a4)
    return v19;
LABEL_77:
  *a4 = v6;
  return v19;
}

void _os_log_impl_flatten_and_send(uint64_t a1)
{
  uint64_t v1;
  size_t v2;
  unsigned int v3;
  unint64_t v4;
  size_t v5;
  uint64_t v6;
  int *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  unsigned int v12;
  int v13;
  char *v14;
  unsigned int v15;
  size_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  int v21;
  int v22;
  int v23;
  char v24;
  char v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  BOOL v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  size_t v46;
  unsigned int v47;
  unsigned __int8 *v48;
  unsigned int v49;
  unsigned int v50;
  char v51;
  size_t v52;
  unsigned int v53;
  unint64_t v54;
  unint64_t v55;
  char v56;
  unsigned int v57;
  unint64_t v58;
  char v59;
  unint64_t v60;
  char is_memory_immutable;
  int v62;
  int v63;
  unsigned int v64;
  int v65;
  unsigned int v66;
  char v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t *v71;
  unsigned int v72;
  int v73;
  uint64_t v74;
  unint64_t *v75;
  int v76;
  unsigned int v77;
  _OWORD *v78;
  unsigned int v79;
  unsigned int v80;
  unint64_t v81;
  uint64_t v82;
  size_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  BOOL v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  BOOL v96;
  __int128 *v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  _WORD *v110;
  unsigned int *v111;
  unsigned int v112;
  int v113;
  int v114;
  char v115;
  unsigned int v116;
  _BOOL4 v117;
  uint64_t v118;
  char v119;
  char v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  int v129;
  _WORD *v130;
  int v131;
  unsigned int v132;
  uint64_t v133;
  int v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t *v137;
  int v138;
  uint64_t *v139;
  unint64_t v140;
  unsigned int tm_hour;
  size_t v142;
  int tm_mday;
  int v144;
  int v145;
  void *v146;
  unsigned int v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  uint64_t v154;
  int v155;
  unsigned int v156;
  _BOOL4 v157;
  _BOOL4 v159;
  char v160;
  double v161;
  unint64_t v162;
  uint64_t v163;
  void *v164;
  size_t v165;
  int v166;
  void *v167;
  size_t v168;
  uint64_t v169;
  char *v170;
  uint64_t v171;
  time_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  size_t v177;
  unint64_t v178;
  unsigned int v179;
  uint64_t activity_id;
  int image_uuid;
  uint64_t v182;
  unint64_t v183;
  int v184;
  int v185;
  char v186;
  int v188;
  unsigned int v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  size_t v196;
  void *v197;
  unsigned int v198;
  void **v199;
  unsigned int v200;
  int v201;
  uint64_t v202;
  unsigned int v203;
  unint64_t v204;
  unint64_t v205;
  unint64_t v206;
  uint64_t v207;
  uint64_t v208;
  int v209;
  int v210;
  int v211;
  time_t v212;
  size_t v213;
  unint64_t v214;
  unsigned int v215;
  uint64_t v216;
  unsigned int v217;
  size_t v218;
  unint64_t v219;
  uint64_t v220;
  unsigned int v221;
  uint64_t v222;
  int v223;
  unsigned int v224;
  unsigned int v225;
  char *v226;
  void *v227;
  _OWORD *v228;
  unsigned int v229;
  size_t v230;
  char *v231;
  unsigned int v232;
  _BOOL4 v233;
  unsigned int v234;
  unsigned int v235;
  uint64_t v236;
  uint64_t v237;
  unsigned int v238;
  void **v239;
  void **v240;
  void **v241;
  size_t v242;
  __int128 v243;
  __int128 v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  __int16 v248[4];
  uint64_t v249;
  void *v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  uint64_t v254;
  uint64_t v255;
  unint64_t v256;
  uint64_t v257;
  _OWORD *v258;
  tm v259;
  time_t v260;
  unint64_t __src;
  uint64_t v262;
  uint64_t v263;
  __int128 v264;
  __int128 v265;
  _QWORD v266[5];
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  char v276;
  char v277;
  char v278;
  int v279;
  __int128 v280;
  _QWORD v281[2];
  __int128 v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  uint64_t v286;
  void *v287;
  uint64_t v288;
  uint64_t v289;

  v10 = MEMORY[0x1E0C86820](a1);
  v289 = *MEMORY[0x1E0C874D8];
  v255 = 0x1000000000000;
  v252 = 0x1000000000000;
  v253 = &v278;
  v254 = 0x40000000000;
  v249 = 0x1000000000000;
  v250 = &v277;
  v251 = 0x40000000000;
  v247 = &v276;
  *(_QWORD *)v248 = 0x40000000000;
  if (!v14)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_508:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_509:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_510;
  }
  LODWORD(v17) = v15;
  if (v15 <= 1)
    goto LABEL_508;
  v5 = v16;
  v8 = v14;
  LODWORD(v7) = v13;
  v3 = v12;
  v2 = v11;
  v6 = v10;
  v220 = v9;
  if ((v13 & 0x200000) != 0 || _os_get_logging_unreliable_for_current_thread() == 1)
  {
    *v8 |= 0x10u;
    LODWORD(v4) = 1;
  }
  else
  {
    LODWORD(v4) = 0;
  }
  v18 = *(unsigned int *)(v2 + 60);
  if ((v4 & 1) != 0
    || !(*(_DWORD *)(v2 + 60) & 0x400 | byte_1ECCEBB3F | byte_1ECCEBB41))
  {
    if ((v7 & 0x100000) != 0)
      v20 = v4;
    else
      v20 = 1;
    if ((v20 & 1) != 0)
    {
      LOWORD(v19) = 1024;
      goto LABEL_16;
    }
    LODWORD(v19) = 2048;
  }
  else
  {
    LODWORD(v19) = 0x8000;
  }
  LODWORD(v249) = v19;
  LODWORD(v252) = v19;
  LODWORD(v255) = v19;
LABEL_16:
  v21 = 0;
  v234 = 3;
  v22 = 1;
  if ((v18 & 0x6000) != 0x6000 && !byte_1ECCEBB3F && !byte_1ECCEBB40)
  {
    if ((dword_1ECCEBAC8 & 0x2000000) != 0)
    {
      v21 = 0;
      v23 = 3;
LABEL_27:
      v234 = v23;
      goto LABEL_29;
    }
    if ((MEMORY[0xFFFFFC104] & 0x2000000) != 0)
    {
      v21 = 0;
      v234 = 3;
      v22 = 1;
      goto LABEL_29;
    }
    v21 = 0;
    v234 = 2;
    v22 = 1;
    if ((v7 & 0x40000000) == 0 && (v18 & 0x6000) != 0x4000)
    {
      if ((dword_1ECCEBAC8 & 0x1000000) != 0 || (MEMORY[0xFFFFFC104] & 0x1000000) != 0)
      {
        v21 = 0;
        v23 = 2;
      }
      else
      {
        v22 = 0;
        v21 = 1;
        v23 = 1;
      }
      goto LABEL_27;
    }
  }
LABEL_29:
  if ((v7 & 0x100000) != 0)
    v24 = v4;
  else
    v24 = 1;
  v229 = v22;
  v221 = v21;
  if ((v24 & 1) == 0)
    goto LABEL_517;
  while (2)
  {
    v25 = *v8;
    v1 = (unsigned __int16)v19;
    if ((*v8 & 3) == 0 && (unsigned __int16)v19 >= v17 && (v18 & 0x1000) == 0)
    {
      v1 = v229;
      if ((v255 & 0x200000000) == 0)
      {
        if (SBYTE6(v255) + HIDWORD(v254) - (int)v254 - 1 < v17)
        {
          os_trace_blob_add_slow((uint64_t)&v253, v8, v17);
        }
        else
        {
          memcpy((char *)v253 + v254, v8, v17);
          v26 = v254 + v17;
          LODWORD(v254) = v254 + v17;
          if (!BYTE6(v255))
            *((_BYTE *)v253 + v26) = 0;
        }
      }
      goto LABEL_170;
    }
    LODWORD(v282) = (unsigned __int16)v7;
    v17 = v254;
    if (BYTE6(v255))
      v27 = v254;
    else
      v27 = v254 + 1;
    if ((_DWORD)v255)
    {
      v28 = v255 - v27;
    }
    else
    {
      v28 = HIDWORD(v254) - v27;
      if (!HIDWORD(v254))
        v28 = 0;
    }
    if (v28 < (unsigned __int16)v19)
      goto LABEL_509;
    v29 = v251;
    if (!BYTE6(v252))
      v29 = v251 + 1;
    if ((_DWORD)v252)
    {
      v30 = v252 - v29;
    }
    else
    {
      v30 = HIDWORD(v251) - v29;
      if (!HIDWORD(v251))
        v30 = 0;
    }
    if (v30 < (unsigned __int16)v19)
      goto LABEL_509;
    v31 = *(_DWORD *)v248;
    if (!BYTE6(v249))
      v31 = *(_DWORD *)v248 + 1;
    if ((_DWORD)v249)
    {
      v32 = v249 - v31;
    }
    else
    {
      v32 = *(_DWORD *)&v248[2] - v31;
      if (!*(_DWORD *)&v248[2])
        v32 = 0;
    }
    if (v32 < (unsigned __int16)v19)
      goto LABEL_509;
    LOWORD(v19) = privacy_opt2flags[(v18 >> 11) & 3];
    LOWORD(v279) = (32 * v234);
    if ((v25 & 0x10) != 0)
      LOBYTE(v279) = (32 * v234) | 0x10;
    v217 = v7;
    v218 = v5;
    v223 = v4;
    v224 = v3;
    v222 = v6;
    if ((v255 & 0x200000000) == 0)
    {
      if ((~(_DWORD)v254 + SBYTE6(v255) + HIDWORD(v254)) <= 1)
      {
        os_trace_blob_add_slow((uint64_t)&v253, &v279, 2uLL);
      }
      else
      {
        *(_WORD *)((char *)v253 + v254) = v279;
        v33 = v254 + 2;
        LODWORD(v254) = v254 + 2;
        if (!BYTE6(v255))
          *((_BYTE *)v253 + v33) = 0;
      }
    }
    if (!v8[1])
      goto LABEL_169;
    v4 = 0;
    v236 = 0;
    v3 = 0;
    v5 = v1 - v17 - 2;
    v6 = (uint64_t)(v8 + 2);
    LODWORD(v226) = v19 & 0xF;
    v231 = v8;
    v216 = v17;
LABEL_70:
    v7 = (int *)(v6 + 2);
    LOWORD(v239) = *(_WORD *)v6;
    v34 = (unsigned __int16)v239;
    v35 = v239;
    if ((v239 & 7) == 0)
    {
      v35 = v226 | v239;
      LOBYTE(v239) = v226 | v239;
    }
    v36 = v34 >> 8;
    v37 = v35 >> 4;
    switch((int)v37)
    {
      case 0:
        v38 = v6 + 2;
        v4 = v36;
        if ((v35 & 1) != 0)
          goto LABEL_99;
        goto LABEL_85;
      case 1:
        if ((_DWORD)v36 != 4)
        {
          _os_assert_log();
          _os_crash();
          __break(1u);
LABEL_514:
          _os_assert_log();
          _os_crash();
          __break(1u);
LABEL_515:
          _os_assert_log();
          _os_crash();
          __break(1u);
LABEL_516:
          _os_assert_log();
          _os_crash();
          __break(1u);
LABEL_517:
          LOWORD(v282) = 0;
          if ((_DWORD)v251)
          {
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_577:
            os_trace_blob_add_slow((uint64_t)&v250, &v282, 2uLL);
            goto LABEL_522;
          }
          LODWORD(v7) = v7 | 0x80000;
          if ((v252 & 0x200000000) != 0)
            goto LABEL_522;
          if ((SBYTE6(v252) + HIDWORD(v251) - 1) <= 1)
            goto LABEL_577;
          *(_WORD *)v250 = 0;
          v198 = v251 + 2;
          LODWORD(v251) = v251 + 2;
          if (!BYTE6(v252))
            *((_BYTE *)v250 + v198) = 0;
LABEL_522:
          v199 = (void **)os_log_backtrace_create_from_return_address(64, *(_QWORD *)(v6 + 32));
          os_log_backtrace_serialize_to_blob((uint64_t)v199);
          free(*v199);
          free(v199);
          os_trace_blob_pwrite(v250, v251, 1);
          LOWORD(v19) = v19 - v251;
          v18 = *(unsigned int *)(v2 + 60);
          continue;
        }
        v4 = *v7 & ~(*v7 >> 31);
        v35 = v35 & 0xF0 | 2;
        LOBYTE(v239) = v35;
        v38 = v6 + 2;
        if ((v35 & 1) != 0)
          goto LABEL_99;
LABEL_85:
        if ((unint64_t)(v35 >> 4) - 6 <= 0xFFFFFFFFFFFFFFFBLL)
        {
          v39 = v36 + 2;
          v40 = v5 >= v39;
          v5 -= v39;
          if (!v40)
            goto LABEL_167;
          ++BYTE1(v279);
          if ((v255 & 0x200000000) == 0)
          {
            if ((SBYTE6(v255) + HIDWORD(v254) - v254 - 1) <= 1)
            {
              os_trace_blob_add_slow((uint64_t)&v253, &v239, 2uLL);
            }
            else
            {
              v41 = (unsigned __int16)v239;
              *(_WORD *)((char *)v253 + v254) = (_WORD)v239;
              v42 = v254 + 2;
              LODWORD(v254) = v254 + 2;
              LODWORD(v36) = v41 >> 8;
              if (!BYTE6(v255))
                *((_BYTE *)v253 + v42) = 0;
            }
          }
          if ((v255 & 0x200000000) == 0)
          {
            if (SBYTE6(v255) + HIDWORD(v254) - (int)v254 - 1 < v36)
            {
              os_trace_blob_add_slow((uint64_t)&v253, (void *)v38, v36);
            }
            else
            {
              memcpy((char *)v253 + v254, (const void *)v38, v36);
              v43 = v254 + v36;
              LODWORD(v254) = v254 + v36;
              if (!BYTE6(v255))
                *((_BYTE *)v253 + v43) = 0;
            }
          }
          if (!v253)
            goto LABEL_168;
          v8 = v231;
          if ((v239 & 0xF0) != 0x10)
            goto LABEL_159;
LABEL_160:
          ++v3;
          v6 = (uint64_t)v7 + *(unsigned __int8 *)(v6 + 1);
          if (v3 >= v8[1])
            goto LABEL_169;
          goto LABEL_70;
        }
LABEL_99:
        BYTE1(v239) = 4;
        LODWORD(__src) = 0;
        v40 = v5 >= 6;
        v5 -= 6;
        if (!v40)
        {
LABEL_167:
          LOBYTE(v279) = v279 | 0x80;
LABEL_168:
          v8 = v231;
LABEL_169:
          *(_WORD *)((char *)v253 + v17) = v279;
          LODWORD(v4) = v223;
          v3 = v224;
          v6 = v222;
          v5 = v218;
          LODWORD(v7) = v217;
          v1 = v229;
LABEL_170:
          v62 = v251;
          v63 = *(_DWORD *)v248;
          if ((v7 & 0x8000000) == 0)
          {
LABEL_171:
            v64 = v62 + v63 + v254;
            if ((v7 & 0x100000) != 0)
              v65 = v4;
            else
              v65 = 1;
            if (v65)
              v66 = 1024;
            else
              v66 = 2048;
            if (v64 > v66)
              LODWORD(v7) = v7 | 0x2000000;
            if (v63)
              v67 = v1;
            else
              v67 = 1;
            if ((v67 & 1) != 0 || (v249 & 0x400000000) != 0)
            {
              v1 = 3954044928;
              v239 = &v253;
              v240 = &v250;
              v241 = &v247;
              v242 = v5;
              v245 = 0;
              v243 = 0u;
              v244 = 0u;
              v246 = v7;
              if ((dword_1ECCEBAC8 & 0x800) != 0 || MEMORY[0xFFFFFC104] & 0x800 | v7 & 0x1000000)
                goto LABEL_495;
              v223 = v4;
              if ((v7 & 0x800000) != 0)
              {
                *(_QWORD *)&v243 = os_log_fmt_extract_symptom((uint64_t)v8);
                *((_QWORD *)&v243 + 1) = v202;
              }
              v4 = *(_QWORD *)(v6 + 24);
              v68 = *(_QWORD *)(v6 + 32);
              v69 = 0x1ECCEB000uLL;
              v70 = *(_QWORD *)(v6 + 40);
              if ((v7 & 0x400000) == 0)
              {
                v257 = 0;
                v258 = 0;
                v256 = 0;
                if (off_1ECCEBAB8)
                  v71 = (unint64_t *)((char *)off_1ECCEBAB8 + 8);
                else
                  v71 = 0;
                if (_os_trace_dsc_load_addr > v4 || _os_trace_dsc_size + _os_trace_dsc_load_addr <= v4)
                {
                  if (*(_DWORD *)(v4 + 12) != 2)
                  {
                    if (off_1ECCEBAB8)
                    {
                      do
                      {
                        while (1)
                        {
                          v81 = __ldxr(v71);
                          if (!(_DWORD)v81)
                            break;
                          __clrex();
                          _os_trace_rwptr_rdlock_wait((uint64_t)v71);
                          v69 = 0x1ECCEB000;
                        }
                      }
                      while (__stxr(v81 + 0x200000000, v71));
                      v85 = v71[1];
                      v86 = *(unsigned __int16 *)(v85 + 10);
                      v87 = (v4 >> *MEMORY[0x1E0C88818]) % v86;
                      while (1)
                      {
                        v88 = v85 + 16 * v87;
                        v89 = *(_QWORD *)(v88 + 16);
                        if (v4 == v89)
                          break;
                        if (v87 + 1 == v86)
                          v87 = 0;
                        else
                          ++v87;
                        if (v89)
                          v90 = v87 == (v4 >> *MEMORY[0x1E0C88818]) % v86;
                        else
                          v90 = 1;
                        if (v90)
                        {
                          v78 = 0;
                          goto LABEL_243;
                        }
                      }
                      v78 = *(_OWORD **)(v88 + 24);
LABEL_243:
                      v98 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
                      do
                      {
                        v99 = __ldxr(v71);
                        v100 = v99 - 0x200000000;
                        if (v100 == 0x100000000)
                          v100 = v98;
                      }
                      while (__stxr(v100, v71));
                      if (v100 == v98)
                      {
                        __dmb(9u);
                        v206 = v69;
                        v228 = v78;
                        _os_trace_rwptr_cleanup((uint64_t)v71);
                        v78 = v228;
                        v69 = v206;
                      }
                      v258 = v78;
                      if (v78)
                      {
                        LODWORD(v257) = v68 - v4;
                        v218 = (v68 - v4) >> 32;
                        WORD2(v257) = (v68 - v4) >> 32;
                        v79 = 20;
                        HIWORD(v257) = 20;
                        v279 = v68 - v4;
                        v280 = *v78;
                        v73 = 10;
                        v72 = v68 - v4;
                        goto LABEL_263;
                      }
                    }
                    else
                    {
                      v258 = 0;
                    }
                    LODWORD(v257) = v68;
                    v218 = HIDWORD(v68);
                    WORD2(v257) = WORD2(v68);
                    v73 = 8;
                    v72 = v68;
LABEL_262:
                    v78 = 0;
                    v79 = 6;
                    HIWORD(v257) = 6;
                    v279 = v257;
                    LOWORD(v280) = WORD2(v257);
LABEL_263:
                    v104 = v246 & 0x20000000;
                    if ((_DWORD)v104)
                      v105 = v68;
                    else
                      v105 = v70;
                    v217 = v72;
                    if (v105)
                    {
                      v106 = 4 * v104;
                      v107 = *(_QWORD *)(v69 + 3080);
                      if (v107 <= v4)
                      {
                        if (_os_trace_dsc_size + v107 <= v4)
                          v107 = v4;
                        v108 = v105 - v107;
                      }
                      else
                      {
                        v108 = v105 - v4;
                      }
                      v109 = v108 & 0x7FFFFFFF;
                      v105 = v108 >> 31;
                      v52 = v109 | v106;
                    }
                    else
                    {
                      v52 = 0;
                    }
                    v38 = v52 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)v105 << 32);
                    v256 = v38;
                    if ((((unint64_t)(unsigned __int16)v105 << 32) & 0xFFFF00000000) != 0)
                    {
                      v73 |= 0x20u;
                      *(_WORD *)((char *)&v279 + v79) = WORD2(v38);
                      v79 += 2;
                    }
                    v110 = *(_WORD **)(v2 + 24);
                    v222 = v6;
                    if (v110)
                    {
                      v73 |= 0x200u;
                      *(_WORD *)((char *)&v279 + v79) = *v110;
                      v79 += 2;
                    }
                    v6 = v3 & 0x7F;
                    LOBYTE(v224) = v3;
                    if ((_DWORD)v6 == 17)
                    {
                      v111 = (unsigned int *)(v2 + 44);
                    }
                    else
                    {
                      if ((_DWORD)v6 != 16)
                      {
                        v3 = 0;
                        goto LABEL_285;
                      }
                      v111 = (unsigned int *)(v2 + 40);
                    }
                    do
                      v3 = __ldxr(v111);
                    while (__stxr(v3 + 1, v111));
LABEL_285:
                    v112 = *(_DWORD *)(v2 + 60);
                    v113 = process_prefs_0 & 3;
                    if ((v112 & 7) != 0)
                      v113 = *(_DWORD *)(v2 + 60) & 7;
                    v226 = (char *)v78;
                    if (v113 == 4)
                    {
                      LOBYTE(v216) = 0;
LABEL_289:
                      LODWORD(v48) = 255;
LABEL_388:
                      v155 = v246;
                      if ((v246 & 0x2000000) == 0)
                      {
                        v156 = 0;
LABEL_390:
                        v221 = v79;
                        if ((v155 & 0x80000) != 0)
                          v73 |= 0x1000u;
                        v234 = v73;
                        v215 = v156;
                        if ((dword_1ECCEBAC8 & 8) == 0
                          && (MEMORY[0xFFFFFC104] & 8) == 0
                          && (voucher_get_activity_id() & 0x800000000000000) == 0)
                        {
                          goto LABEL_395;
                        }
                        v200 = *(_DWORD *)(v2 + 60);
                        if ((v200 & 7) == 4)
                          goto LABEL_395;
                        if ((byte_1ECCEBB38 & 4) != 0)
                          goto LABEL_545;
                        goto LABEL_527;
                      }
                      if ((v223 & 1) == 0)
                      {
                        do
                          v156 = __ldxr((unsigned int *)&_oversize_message_id);
                        while (__stxr(v156 + 1, (unsigned int *)&_oversize_message_id));
                        v73 |= 0x800u;
                        *(int *)((char *)&v279 + v79) = v156;
                        v79 += 4;
                        goto LABEL_390;
                      }
LABEL_579:
                      qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: Using oversized messages with unreliable interfaces sh"
                                                 "ouldn't be possible";
                      __break(1u);
LABEL_580:
                      qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: Using oversized messages with unreliable interfaces sh"
                                                 "ouldn't be possible";
                      __break(1u);
                      return;
                    }
                    v114 = (v112 >> 3) & 7;
                    if (v114)
                      v115 = v114;
                    else
                      v115 = (process_prefs_0 >> 2) & 7;
                    if ((int)v6 > 15)
                    {
                      if ((v6 - 16) >= 2)
                        goto LABEL_382;
                    }
                    else if ((_DWORD)v6)
                    {
                      if ((_DWORD)v6 == 1)
                      {
                        if ((v113 & 6) != 2)
                        {
                          if ((_BYTE)v113
                            || (dword_1ECCEBAC8 & 3) == 0
                            && (MEMORY[0xFFFFFC104] & 3) == 0
                            && (v179 = v79,
                                activity_id = voucher_get_activity_id(),
                                v79 = v179,
                                (activity_id & 0x300000000000000) == 0))
                          {
                            LOBYTE(v216) = *(_BYTE *)(v2 + 58);
                            goto LABEL_289;
                          }
                        }
                        v117 = (v115 & 6) == 2;
                        v118 = 58;
                        goto LABEL_305;
                      }
                      if ((_DWORD)v6 == 2)
                      {
                        v116 = v79;
                        if (v113 != 3
                          && ((_BYTE)v113
                           || (dword_1ECCEBAC8 & 2) == 0
                           && (MEMORY[0xFFFFFC104] & 2) == 0
                           && (voucher_get_activity_id() & 0x200000000000000) == 0))
                        {
                          LOBYTE(v216) = *(_BYTE *)(v2 + 59);
                          LODWORD(v48) = 255;
                          v79 = v116;
                          goto LABEL_388;
                        }
                        v117 = v115 == 3;
                        v118 = 59;
                        v79 = v116;
                        goto LABEL_305;
                      }
LABEL_382:
                      if ((v224 & 0x80) != 0)
                      {
LABEL_385:
                        v120 = 14;
LABEL_386:
                        v73 |= 0x400u;
                        LOBYTE(v216) = v120;
                        *((_BYTE *)&v279 + v79++) = v120;
                        LODWORD(v48) = 1;
                        goto LABEL_387;
                      }
                      LOBYTE(v216) = 0;
                      goto LABEL_384;
                    }
                    v117 = v115 != 4;
                    v118 = 57;
LABEL_305:
                    v119 = *(_BYTE *)(v2 + v118);
                    if ((v224 & 0x80) == 0 && v117)
                    {
                      if ((_DWORD)v6 != 17 && !*(_BYTE *)(v2 + v118))
                      {
                        LOBYTE(v216) = 0;
                        LODWORD(v48) = 0;
LABEL_387:
                        LODWORD(v246) = v246 | 0x10000000;
                        goto LABEL_388;
                      }
LABEL_312:
                      if (*(unsigned __int8 *)(v2 + v118) >= 0x1Eu)
                        v120 = 30;
                      else
                        v120 = *(_BYTE *)(v2 + v118);
                      if (v119)
                        goto LABEL_386;
                      goto LABEL_385;
                    }
                    if ((v224 & 0x80) != 0)
                      goto LABEL_312;
                    LOBYTE(v216) = *(_BYTE *)(v2 + v118);
LABEL_384:
                    LODWORD(v48) = 2;
                    goto LABEL_388;
                  }
                  LODWORD(v257) = v68 - v4;
                  v218 = (v68 - v4) >> 32;
                  WORD2(v257) = (v68 - v4) >> 32;
                  HIWORD(v257) = 4;
                  v258 = 0;
                  v73 = 2;
                  v72 = v68 - v4;
                }
                else
                {
                  v72 = v68 - _os_trace_dsc_load_addr;
                  LODWORD(v257) = v68 - _os_trace_dsc_load_addr;
                  WORD2(v257) = (v68 - _os_trace_dsc_load_addr) >> 32;
                  v258 = 0;
                  if (WORD2(v257))
                  {
                    v218 = (v68 - _os_trace_dsc_load_addr) >> 32;
                    v73 = 12;
                    goto LABEL_262;
                  }
                  HIDWORD(v257) = 0x40000;
                  LOWORD(v218) = 0;
                  v73 = 4;
                }
                v78 = 0;
                v279 = v72;
                v79 = 4;
                goto LABEL_263;
              }
              v274 = 0;
              v273 = 0;
              v281[0] = 0;
              v74 = *(_QWORD *)(v6 + 56);
              if (off_1ECCEBAB8)
                v75 = (unint64_t *)((char *)off_1ECCEBAB8 + 8);
              else
                v75 = 0;
              v237 = *(_QWORD *)(v6 + 56);
              if (_os_trace_dsc_load_addr > v4 || _os_trace_dsc_size + _os_trace_dsc_load_addr <= v4)
              {
                if (*(_DWORD *)(v4 + 12) != 2)
                {
                  v82 = v6;
                  v83 = v2;
                  if (off_1ECCEBAB8)
                  {
                    do
                    {
                      while (1)
                      {
                        v84 = __ldxr(v75);
                        if (!(_DWORD)v84)
                          break;
                        __clrex();
                        _os_trace_rwptr_rdlock_wait((uint64_t)v75);
                        v74 = v237;
                        v69 = 0x1ECCEB000;
                      }
                    }
                    while (__stxr(v84 + 0x200000000, v75));
                    v91 = v75[1];
                    v92 = *(unsigned __int16 *)(v91 + 10);
                    v93 = (v4 >> *MEMORY[0x1E0C88818]) % v92;
                    while (1)
                    {
                      v94 = v91 + 16 * v93;
                      v95 = *(_QWORD *)(v94 + 16);
                      if (v4 == v95)
                        break;
                      if (v93 + 1 == v92)
                        v93 = 0;
                      else
                        ++v93;
                      if (v95)
                        v96 = v93 == (v4 >> *MEMORY[0x1E0C88818]) % v92;
                      else
                        v96 = 1;
                      if (v96)
                      {
                        v97 = 0;
                        goto LABEL_252;
                      }
                    }
                    v97 = *(__int128 **)(v94 + 24);
LABEL_252:
                    v101 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
                    do
                    {
                      v102 = __ldxr(v75);
                      v103 = v102 - 0x200000000;
                      if (v103 == 0x100000000)
                        v103 = v101;
                    }
                    while (__stxr(v103, v75));
                    if (v103 == v101)
                    {
                      __dmb(9u);
                      v207 = (uint64_t)v75;
                      v208 = v74;
                      _os_trace_rwptr_cleanup(v207);
                      v74 = v208;
                      v69 = 0x1ECCEB000;
                    }
                    v274 = (uint64_t)v97;
                    if (v97)
                    {
                      LODWORD(v273) = v68 - v4;
                      WORD2(v273) = (v68 - v4) >> 32;
                      v80 = 20;
                      HIWORD(v273) = 20;
                      v279 = v68 - v4;
                      v280 = *v97;
                      v77 = 10;
                      v2 = v83;
                      v6 = v82;
                      goto LABEL_320;
                    }
                  }
                  else
                  {
                    v274 = 0;
                  }
                  LODWORD(v273) = v68;
                  WORD2(v273) = WORD2(v68);
                  v77 = 8;
                  v2 = v83;
                  v6 = v82;
LABEL_319:
                  v80 = 6;
                  HIWORD(v273) = 6;
                  v279 = v273;
                  LOWORD(v280) = WORD2(v273);
LABEL_320:
                  if (v70)
                  {
                    v121 = *(_QWORD *)(v69 + 3080);
                    if (v121 <= v4)
                    {
                      if (_os_trace_dsc_size + v121 <= v4)
                        v121 = v4;
                      v122 = v70 - v121;
                    }
                    else
                    {
                      v122 = v70 - v4;
                    }
                    v124 = v122 & 0x7FFFFFFF;
                    v123 = v122 >> 31;
                  }
                  else
                  {
                    LOWORD(v123) = 0;
                    v124 = 0;
                  }
                  v281[0] = v124 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)v123 << 32);
                  v125 = *(_QWORD *)(v6 + 48);
                  if (v125)
                  {
                    v126 = *(_QWORD *)(v69 + 3080);
                    if (v126 <= v4)
                    {
                      if (_os_trace_dsc_size + v126 <= v4)
                        v126 = v4;
                      v127 = v125 - v126;
                    }
                    else
                    {
                      v127 = v125 - v4;
                    }
                    v129 = v127 & 0x7FFFFFFF;
                    v128 = v127 >> 31;
                  }
                  else
                  {
                    LOWORD(v128) = 0;
                    v129 = 0;
                  }
                  if ((unsigned __int16)v128 | (unsigned __int16)v123)
                  {
                    v77 |= 0x20u;
                    *(_WORD *)((char *)&v279 + v80) = v123;
                    v80 += 2;
                  }
                  v130 = *(_WORD **)(v2 + 24);
                  if (v130)
                  {
                    v77 |= 0x200u;
                    *(_WORD *)((char *)&v279 + v80) = *v130;
                    v80 += 2;
                  }
                  v131 = *(_DWORD *)(v2 + 60);
                  if ((v131 & 0x80000) != 0)
                  {
                    LODWORD(v246) = v246 | 0x10000000;
                    v132 = 4;
                  }
                  else
                  {
                    v132 = 2;
                  }
                  *(_QWORD *)((char *)&v279 + v80) = v74;
                  v133 = v80 + 8;
                  if (v125)
                  {
                    *(int *)((char *)&v279 + v133) = v129;
                    v133 = v80 + 12;
                    if ((v77 & 0x20) != 0)
                    {
                      *(_WORD *)((char *)&v279 + v133) = v128;
                      LODWORD(v133) = v80 + 14;
                    }
                    v77 |= 0x8000u;
                  }
                  v134 = v246;
                  if ((v246 & 0x2000000) != 0)
                  {
                    do
                      v203 = __ldxr((unsigned int *)&_oversize_message_id);
                    while (__stxr(v203 + 1, (unsigned int *)&_oversize_message_id));
                    v77 |= 0x800u;
                    v235 = v203;
                    *(int *)((char *)&v279 + v133) = v203;
                    LODWORD(v133) = v133 + 4;
                  }
                  else
                  {
                    v235 = 0;
                  }
                  if ((v134 & 0x80000) != 0)
                    v135 = v77 | 0x1000;
                  else
                    v135 = v77;
                  if ((v131 & 0x400000) != 0
                    && ((dword_1ECCEBAC8 & 8) != 0
                     || (MEMORY[0xFFFFFC104] & 8) != 0
                     || (voucher_get_activity_id() & 0x800000000000000) != 0)
                    && ((byte_1ECCEBB38 & 8) != 0 || (*(_BYTE *)(v2 + 63) & 0x40) != 0))
                  {
                    v139 = (uint64_t *)v6;
                    if (mach_get_times())
                      _os_assumes_log();
                    v138 = 1;
                  }
                  else
                  {
                    v136 = mach_continuous_time();
                    v137 = (uint64_t *)v6;
                    v138 = 0;
                    v139 = v137;
                    *v137 = v136;
                  }
                  v140 = (v124 << 32) | (v135 << 16) | ((unint64_t)v3 << 8) | 6;
                  if ((*(_BYTE *)(v2 + 62) & 2) == 0 || !_signpost_hook)
                  {
LABEL_375:
                    if ((v246 & 0x2000000) != 0)
                    {
                      _os_log_impl_send_oversize(v2, v132, 0, *v139, v235, (const void ***)&v239);
                      voucher_activity_trace();
                      if (!v138)
                        goto LABEL_377;
                    }
                    else
                    {
                      *(_QWORD *)&v282 = &v279;
                      *((_QWORD *)&v282 + 1) = v133;
                      v283 = (uint64_t)*v239;
                      v284 = *((unsigned int *)v239 + 2);
                      v285 = *v240;
                      v286 = *((unsigned int *)v240 + 2);
                      v287 = *v241;
                      v288 = *((unsigned int *)v241 + 2);
                      voucher_activity_trace_v_2();
                      if (!v138)
                      {
LABEL_377:
                        v6 = (uint64_t)v139;
                        goto LABEL_494;
                      }
                    }
                    _os_log_impl_stream(v139, v2, (unsigned int *)&v273, (uint64_t)v281, (uint64_t *)&v239, v140);
                    goto LABEL_377;
                  }
                  *(_QWORD *)&v259.tm_mon = 0x1000000000000;
                  *(_QWORD *)&v259.tm_sec = &v282;
                  *(_QWORD *)&v259.tm_hour = 0x40000000000;
                  if ((v246 & 0x2000000) != 0)
                    v259.tm_mon = 0x8000;
                  v232 = v132;
                  v225 = v3;
                  tm_hour = *((_DWORD *)v239 + 2);
                  v142 = v2;
                  if (tm_hour > 0x400)
                  {
                    os_trace_blob_add_slow((uint64_t)&v259, *v239, *((unsigned int *)v239 + 2));
                    tm_hour = v259.tm_hour;
                    if ((v259.tm_year & 2) != 0)
                    {
LABEL_368:
                      v270 = 0u;
                      v271 = 0u;
                      v268 = 0u;
                      v269 = 0u;
                      v267 = 0u;
                      v149 = *v139;
                      __src = v140;
                      v262 = v149;
                      v150 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
                      v264 = 0u;
                      v265 = 0u;
                      memset(v266, 0, sizeof(v266));
                      v151 = v139[5];
                      v263 = v150;
                      v152 = *(void **)&v259.tm_sec;
                      v266[4] = v151;
                      *(_QWORD *)&v267 = *(_QWORD *)&v259.tm_sec;
                      *((_QWORD *)&v267 + 1) = (unsigned __int16)tm_hour;
                      *(_QWORD *)&v268 = *v241;
                      v153 = *(_QWORD *)(v142 + 24);
                      v154 = v153 + 4;
                      if (!v153)
                        v154 = 0;
                      *((_QWORD *)&v268 + 1) = *((unsigned __int16 *)v241 + 4);
                      *(_QWORD *)&v269 = v154;
                      LOBYTE(v3) = v225;
                      if (v153)
                        v153 += *(unsigned __int8 *)(v153 + 2) + 4;
                      *((_QWORD *)&v269 + 1) = v153;
                      *((_QWORD *)&v270 + 1) = v237;
                      v272 = 0;
                      _signpost_hook(v225 >> 6, v225 & 3, &__src);
                      if ((v259.tm_year & 1) != 0)
                        free(v152);
                      v2 = v142;
                      v132 = v232;
                      goto LABEL_375;
                    }
                    tm_mday = v259.tm_mday;
                    v145 = BYTE2(v259.tm_year);
                    v144 = SBYTE2(v259.tm_year) - 1;
                  }
                  else
                  {
                    tm_mday = 1024;
                    __memcpy_chk();
                    v144 = 0;
                    v259.tm_hour = tm_hour;
                    v145 = 1;
                  }
                  v146 = *v240;
                  v147 = *((_DWORD *)v240 + 2);
                  if (tm_mday - tm_hour + v144 < v147)
                  {
                    os_trace_blob_add_slow((uint64_t)&v259, v146, *((unsigned int *)v240 + 2));
                    LOWORD(tm_hour) = v259.tm_hour;
                  }
                  else
                  {
                    v148 = *(_QWORD *)&v259.tm_sec;
                    memcpy((void *)(*(_QWORD *)&v259.tm_sec + tm_hour), v146, *((unsigned int *)v240 + 2));
                    tm_hour += v147;
                    if (!v145)
                      *(_BYTE *)(v148 + tm_hour) = 0;
                  }
                  goto LABEL_368;
                }
                v76 = v68 - v4;
                LODWORD(v273) = v68 - v4;
                WORD2(v273) = (v68 - v4) >> 32;
                HIWORD(v273) = 4;
                v274 = 0;
                v77 = 2;
              }
              else
              {
                v76 = v68 - _os_trace_dsc_load_addr;
                LODWORD(v273) = v68 - _os_trace_dsc_load_addr;
                WORD2(v273) = (v68 - _os_trace_dsc_load_addr) >> 32;
                v274 = 0;
                if (WORD2(v273))
                {
                  v77 = 12;
                  goto LABEL_319;
                }
                HIDWORD(v273) = 0x40000;
                v77 = 4;
              }
              v279 = v76;
              v80 = 4;
              goto LABEL_320;
            }
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_512:
            _os_log_invoke_callback(v6, v2, v3, (uint64_t)&v239, (uint64_t (**)(_QWORD *))&_os_log_current_fault_callback);
            goto LABEL_496;
          }
LABEL_510:
          os_log_fmt_compose(v5, *(char **)(v6 + 40), 2, 3u, 8, (unsigned __int8 *)v253, (uint64_t)v250, (unsigned __int16)v62, (uint64_t)v247, v63);
          v62 = v251;
          v63 = *(_DWORD *)v248;
          goto LABEL_171;
        }
        v19 = v254;
        ++BYTE1(v279);
        if ((v255 & 0x200000000) != 0)
          goto LABEL_163;
        if ((SBYTE6(v255) + HIDWORD(v254) - v254 - 1) <= 1)
        {
          os_trace_blob_add_slow((uint64_t)&v253, &v239, 2uLL);
LABEL_163:
          v46 = 4;
          goto LABEL_105;
        }
        v44 = (unsigned __int16)v239;
        *(_WORD *)((char *)v253 + v254) = (_WORD)v239;
        v45 = v254 + 2;
        LODWORD(v254) = v254 + 2;
        v46 = v44 >> 8;
        if (!BYTE6(v255))
          *((_BYTE *)v253 + v45) = 0;
LABEL_105:
        if ((v255 & 0x200000000) == 0)
        {
          if (SBYTE6(v255) + HIDWORD(v254) - (int)v254 - 1 < v46)
          {
            os_trace_blob_add_slow((uint64_t)&v253, &__src, v46);
          }
          else
          {
            memcpy((char *)v253 + v254, &__src, v46);
            v47 = v254 + v46;
            LODWORD(v254) = v254 + v46;
            if (!BYTE6(v255))
              *((_BYTE *)v253 + v47) = 0;
          }
        }
        if (!v253)
          goto LABEL_168;
        v48 = (unsigned __int8 *)v253 + v19;
        v49 = privacy_flags2opt[v239 & 7];
        if (!v38)
        {
          v50 = *v48;
          if (v49 <= v234 || !v236)
            goto LABEL_153;
          LOBYTE(v50) = v50 & 8 | 0xF2;
          *v48 = v50;
          goto LABEL_156;
        }
        if (v49 > v234 && !v236)
        {
          v50 = *v48;
          if ((v50 & 0xF0) == 0x40)
          {
            sel_registerName("redactedDescription");
            v51 = objc_opt_respondsToSelector();
            v50 = *v48;
            if ((v51 & 1) != 0)
            {
              v236 = 0;
              *v48 = v50 & 0xF | 0x80;
              WORD2(v249) |= 4u;
              goto LABEL_116;
            }
          }
LABEL_153:
          if (v50 <= 0xF)
          {
            v8 = v231;
            if ((*((_WORD *)v48 + 2) & 0x7FFF) == 0)
              *((_WORD *)v48 + 2) |= 0x8000u;
            goto LABEL_157;
          }
LABEL_156:
          v8 = v231;
LABEL_157:
          if ((v50 & 1) != 0)
            LOBYTE(v279) = v279 | 1;
LABEL_159:
          v236 = 0;
          v4 = 0;
          goto LABEL_160;
        }
LABEL_116:
        v52 = v2;
        if (v5 >= 0x7FFF)
          v2 = 0x7FFFLL;
        else
          v2 = v5;
        v53 = *v48;
        LOWORD(v19) = v4;
        switch(v53 >> 4)
        {
          case 0u:
            if ((_DWORD)v4)
            {
              v54 = 0;
              v55 = 0;
LABEL_150:
              v57 = _os_log_fmt_flatten_to_blob((uint64_t)v48, v234, v236, (void *)v38, v4, (uint64_t)&v250, (uint64_t)&v247, v2, v55, v54);
LABEL_151:
              v54 = v57;
LABEL_152:
              v5 -= v54;
              v50 = *v48;
              v2 = v52;
              v17 = v216;
              goto LABEL_153;
            }
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_543:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_544:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_545:
            if ((int)v6 > 15)
            {
              if ((v6 - 16) >= 2)
                goto LABEL_527;
LABEL_555:
              if ((qword_1ECCEBB30 & 0x800000000) != 0)
                goto LABEL_562;
              goto LABEL_527;
            }
            if (!(_DWORD)v6)
              goto LABEL_555;
            if ((_DWORD)v6 == 1)
            {
              if ((qword_1ECCEBB30 & 0x100000000) != 0)
                goto LABEL_562;
              goto LABEL_527;
            }
            if ((_DWORD)v6 != 2 || (qword_1ECCEBB30 & 0x200000000) == 0)
            {
LABEL_527:
              v201 = (v200 >> 27) & 7;
              switch(v201)
              {
                case 3:
                  goto LABEL_562;
                case 2:
                  v157 = v6 != 2;
                  goto LABEL_396;
                case 1:
                  v157 = (v6 - 3) < 0xFEu;
                  goto LABEL_396;
              }
LABEL_395:
              v157 = 0;
              goto LABEL_396;
            }
LABEL_562:
            v157 = 1;
LABEL_396:
            v238 = v48;
            v159 = (_DWORD)v48 != 255 && (byte_1ECCEBB3E | byte_1ECCEBB3F) != 0;
            v160 = _os_log_hook;
            v233 = v157;
            if (_os_log_hook)
            {
              if (_os_log_hook_level != 2)
              {
                if (_os_log_hook_level == 1)
                  v160 = (_DWORD)v6 != 2;
                else
                  v160 = (v6 - 3) < 0xFEu;
                goto LABEL_407;
              }
LABEL_416:
              if (mach_get_times())
                _os_assumes_log();
            }
            else
            {
LABEL_407:
              if (v157 || v159 || (v160 & 1) != 0 || (v246 & 0x4000000) != 0)
                goto LABEL_416;
              *(_QWORD *)v222 = mach_continuous_time();
            }
            v230 = v52;
            v162 = ((_DWORD)v6 << 8) | (v234 << 16) | ((unint64_t)v52 << 32) | 4;
            v163 = _os_log_hook;
            if (_os_log_hook)
            {
              if (_os_log_hook_level != 2)
              {
                if (_os_log_hook_level == 1)
                {
                  if ((_DWORD)v6 == 2)
                    goto LABEL_458;
                }
                else if ((v6 - 3) > 0xFDu)
                {
                  goto LABEL_458;
                }
              }
              v214 = v162;
              v164 = pthread_getspecific(_os_log_hook_thread_key);
              v162 = v214;
              if (v164)
                goto LABEL_458;
              v275 = 0x1000000000000;
              v273 = (uint64_t)&v282;
              v274 = 0x40000000000;
              if ((v246 & 0x2000000) != 0)
                LODWORD(v275) = 0x8000;
              v165 = *((unsigned int *)v239 + 2);
              v213 = v2;
              if (v165 > 0x400)
              {
                os_trace_blob_add_slow((uint64_t)&v273, *v239, v165);
                LODWORD(v165) = v274;
                if ((v275 & 0x200000000) == 0)
                {
                  v211 = HIDWORD(v274);
                  v166 = BYTE6(v275);
                  goto LABEL_424;
                }
              }
              else
              {
                v211 = 1024;
                __memcpy_chk();
                LODWORD(v274) = v165;
                v166 = 1;
LABEL_424:
                v167 = *v240;
                v168 = *((unsigned int *)v240 + 2);
                v210 = v166;
                if (v211 - (int)v165 + (char)(v166 - 1) < v168)
                {
                  os_trace_blob_add_slow((uint64_t)&v273, v167, v168);
                  LOWORD(v165) = v274;
                }
                else
                {
                  v169 = v273;
                  memcpy((void *)(v273 + v165), v167, v168);
                  LODWORD(v165) = v165 + v168;
                  LODWORD(v274) = v165;
                  if (!v210)
                    *(_BYTE *)(v169 + v165) = 0;
                }
              }
              v170 = v226;
              v270 = 0u;
              v271 = 0u;
              v268 = 0u;
              v269 = 0u;
              v267 = 0u;
              v171 = *(_QWORD *)v222;
              v172 = *(_QWORD *)(v222 + 8);
              __src = v214;
              v262 = v171;
              v263 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
              v264 = 0uLL;
              v173 = (*(_QWORD *)(v222 + 16) / 0x3E8uLL);
              *(_QWORD *)&v265 = v172;
              *((_QWORD *)&v265 + 1) = v173;
              memset(v266, 0, sizeof(v266));
              v266[4] = *(_QWORD *)(v222 + 40);
              *(_QWORD *)&v267 = v273;
              *((_QWORD *)&v267 + 1) = (unsigned __int16)v165;
              *(_QWORD *)&v268 = *v241;
              v2 = v213;
              v174 = *(_QWORD *)(v213 + 24);
              v175 = v174 + 4;
              if (!v174)
                v175 = 0;
              *((_QWORD *)&v268 + 1) = *((unsigned __int16 *)v241 + 4);
              *(_QWORD *)&v269 = v175;
              v227 = (void *)v273;
              if (v174)
                v174 += *(unsigned __int8 *)(v174 + 2) + 4;
              *((_QWORD *)&v269 + 1) = v174;
              BYTE4(v270) = 0;
              v272 = 0;
              *(_QWORD *)&v271 = 0;
              *((_QWORD *)&v270 + 1) = 0;
              WORD4(v271) = 0;
              v281[1] = 0;
              v281[0] = 0;
              v176 = _os_log_hook_params;
              if ((_os_log_hook_params & 0x8000000000000002) != 0)
              {
                v177 = v230 << 32;
                v178 = v217 | ((unint64_t)(unsigned __int16)v218 << 32);
                v212 = v172;
                if (*(_DWORD *)(*(_QWORD *)(v222 + 24) + 12) == 2)
                {
                  LODWORD(v266[1]) = v217;
                  WORD2(v266[1]) = v218;
                  if (off_1ECCEBAB8)
                    v170 = (char *)off_1ECCEBAB8 + 24;
                  else
                    v170 = 0;
                  goto LABEL_451;
                }
                if (v170)
                {
                  LODWORD(v266[1]) = v217;
                  WORD2(v266[1]) = v218;
                  goto LABEL_451;
                }
                v219 = *(_QWORD *)(v222 + 24);
                image_uuid = _dyld_get_image_uuid();
                v177 = v230 << 32;
                if (image_uuid)
                {
                  v182 = _os_trace_dsc_load_addr;
                  if (_os_trace_dsc_load_addr <= v219)
                  {
                    if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= v219)
                      v182 = 0;
                    v178 += v182;
                  }
                  v266[1] = v178 - v219;
                  v170 = (char *)v281;
LABEL_451:
                  *(_QWORD *)&v264 = v170;
                }
                v266[2] = v177 & 0x8000000000000000 | v230 & 0x7FFFFFFF | (v38 >> 1) & 0x7FFF80000000;
                *((_QWORD *)&v264 + 1) = dyld_image_path_containing_address();
                v172 = v212;
              }
              if ((v176 & 0x8000000000000001) != 0)
              {
                v260 = v172;
                memset(&v259, 0, sizeof(v259));
                localtime_r(&v260, &v259);
                v183 = ((unsigned __int128)(v259.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v259.tm_gmtoff;
                HIDWORD(v266[0]) = v259.tm_isdst;
                LODWORD(v266[0]) = (v183 >> 5) + (v183 >> 63) + 60 * v259.tm_isdst;
              }
              pthread_setspecific(_os_log_hook_thread_key, (const void *)1);
              (*(void (**)(uint64_t, uint64_t, unint64_t *))(v163 + 16))(v163, v6, &__src);
              pthread_setspecific(_os_log_hook_thread_key, 0);
              if ((v275 & 0x100000000) != 0)
              {
                v273 = 3954044928;
                free(v227);
              }
              v162 = v214;
            }
LABEL_458:
            if (v159)
            {
              v204 = v162;
              _os_log_impl_mirror_to_stderr((char *)v222, v2, v6, (uint64_t)&v239, v234);
              v162 = v204;
            }
            if ((dword_1ECCEBAC8 & 0x400) != 0 || (MEMORY[0xFFFFFC104] & 0x400) != 0)
              goto LABEL_493;
            if ((dword_1ECCEBAC8 & 0x40000000) != 0)
            {
              v184 = v223;
              if (v238 == 255)
              {
                v185 = 0;
                goto LABEL_490;
              }
LABEL_560:
              v205 = v162;
              _os_log_mirror_syslog(v222, v2, v161, v6, (uint64_t)&v239);
              v162 = v205;
              goto LABEL_465;
            }
            v184 = v223;
            if (v238 != 255 && (MEMORY[0xFFFFFC104] & 0x40000000) != 0)
              goto LABEL_560;
LABEL_465:
            v185 = 0;
            if (v238 == 255 || !off_1ECCEBAB8)
              goto LABEL_490;
            if ((_QWORD)v243)
              _os_log_impl_mirror_symptom(v222, v2, (uint64_t)&v239);
            if ((_DWORD)v6 == 17)
              v186 = v184;
            else
              v186 = 1;
            if ((v186 & 1) == 0)
            {
              v209 = (*(_DWORD *)(v2 + 60) >> 23) & 3;
              if (v209 == 2
                || v209 == 1
                && (byte_1ECCEBB44 == 2
                 || byte_1ECCEBB44 != 3
                 && (MEMORY[0xFFFFFC104] & 0x80000000) == 0
                 && (MEMORY[0xFFFFFC104] & 0x10000000) != 0
                 && !v3))
              {
                _os_log_impl_generate_crashlog(v2, v222, (uint64_t)&v239);
              }
            }
            if ((v224 & 0x80u) != 0 || (_DWORD)v6 == 17)
              v188 = v184;
            else
              v188 = 1;
            if ((v188 & 1) == 0)
            {
              v282 = 1uLL;
              if ((_DWORD)v6 == 17)
                v189 = 2;
              else
                v189 = 1;
              v283 = v189 | 0x100000000;
              _os_activity_create_addr((uint64_t)&dword_19BBEC000, (uint64_t)"Activity for state dumps", -3, 0, v220);
              v190 = voucher_get_activity_id();
              voucher_adopt();
              _os_state_request_for_self(v190, &v282, v216, v4);
            }
            v185 = v188 ^ 1;
            if ((v246 & 0x2000000) == 0)
            {
              *(_QWORD *)&v282 = &v279;
              *((_QWORD *)&v282 + 1) = v221;
              v283 = (uint64_t)*v239;
              v284 = *((unsigned int *)v239 + 2);
              v285 = *v240;
              v286 = *((unsigned int *)v240 + 2);
              v287 = *v241;
              v288 = *((unsigned int *)v241 + 2);
              v191 = voucher_activity_trace_v_2();
              goto LABEL_489;
            }
            if (v184)
              goto LABEL_580;
            _os_log_impl_send_oversize(v2, v238, v216, *(_QWORD *)v222, v215, (const void ***)&v239);
            v191 = voucher_activity_trace();
LABEL_489:
            v162 = v191;
LABEL_490:
            if (v233)
            {
              _os_log_impl_stream((unint64_t *)v222, v2, (unsigned int *)&v257, (uint64_t)&v256, (uint64_t *)&v239, v162);
              if (v185)
              {
LABEL_492:
                v192 = (void *)voucher_adopt();
                os_release(v192);
              }
            }
            else if (v185)
            {
              goto LABEL_492;
            }
LABEL_493:
            LOBYTE(v3) = v224;
            v6 = v222;
LABEL_494:
            v1 = 3954044928;
LABEL_495:
            if ((v3 & 0x7F) == 0x11)
              goto LABEL_512;
LABEL_496:
            _os_log_invoke_callback(v6, v2, v3, (uint64_t)&v239, (uint64_t (**)(_QWORD *))&_os_log_current_test_callback);
            if ((v255 & 0x100000000) != 0)
            {
              v193 = v253;
              v253 = (void *)v1;
              WORD2(v255) = 0;
              free(v193);
            }
            if ((v252 & 0x100000000) != 0)
            {
              v194 = v250;
              v250 = (void *)v1;
              WORD2(v252) = 0;
              free(v194);
            }
            if ((v249 & 0x100000000) != 0)
            {
              v195 = v247;
              v247 = (void *)v1;
              WORD2(v249) = 0;
              free(v195);
            }
            if ((v7 & 0x8000000) == 0)
            {
              v196 = v242;
              if (v242)
              {
                if ((*(_WORD *)(v242 + 20) & 1) != 0)
                {
                  v197 = *(void **)v242;
                  *(_QWORD *)v242 = v1;
                  *(_WORD *)(v196 + 20) = 0;
                  free(v197);
                }
              }
            }
            return;
          case 2u:
            if ((v53 & 7) != 0)
            {
              v54 = 0;
              v55 = v38;
              goto LABEL_150;
            }
            if ((_DWORD)v4)
              strnlen((const char *)v38, v4);
            else
              strlen((const char *)v38);
            is_memory_immutable = _dyld_is_memory_immutable();
            v60 = 0;
            v54 = 0;
            v58 = v38;
            v55 = v38;
            if ((is_memory_immutable & 1) == 0)
              goto LABEL_148;
            goto LABEL_150;
          case 3u:
            v54 = 0;
            if (!(_DWORD)v4)
              goto LABEL_152;
            if ((v53 & 7) != 0)
            {
              v55 = 0;
              goto LABEL_150;
            }
            v58 = 0;
            goto LABEL_149;
          case 4u:
            if ((v53 & 0xF0) != 0x40)
              goto LABEL_544;
            v56 = v221;
            if ((v53 & 2) != 0)
              v56 = 0;
            goto LABEL_137;
          case 5u:
            if ((v53 & 7) != 0)
            {
              v55 = 0;
              v54 = v38;
            }
            else
            {
              if ((_DWORD)v4)
                wcsnlen((const __int32 *)v38, v4);
              else
                wcslen((const __int32 *)v38);
              v59 = _dyld_is_memory_immutable();
              v58 = 0;
              v55 = 0;
              v60 = v38;
              v54 = v38;
              if ((v59 & 1) == 0)
              {
LABEL_148:
                LOBYTE(v53) = *v48;
                v54 = v60;
LABEL_149:
                *v48 = v53 | 1;
                v55 = v58;
              }
            }
            goto LABEL_150;
          case 8u:
            if ((v53 & 0xF0) != 0x80)
              goto LABEL_543;
            v56 = 1;
LABEL_137:
            v57 = _os_log_fmt_flatten_object_impl(v48, v234, v236, (void *)v38, v4, (uint64_t)&v250, (uint64_t)&v247, v2, v56);
            goto LABEL_151;
          default:
            _os_crash();
            __break(1u);
            goto LABEL_579;
        }
      case 6:
        v35 &= 0xFu;
        LOBYTE(v239) = v35;
        LODWORD(v36) = 4;
        BYTE1(v239) = 4;
        v38 = (unint64_t)&v282;
        v4 = 4;
        if ((v35 & 1) != 0)
          goto LABEL_99;
        goto LABEL_85;
      case 7:
        if ((_DWORD)v36 != 8)
          goto LABEL_514;
        v236 = *(_QWORD *)v7;
        goto LABEL_160;
      default:
        if ((unint64_t)(v37 - 2) >= 4)
          goto LABEL_515;
        if ((_DWORD)v36 != 8)
          goto LABEL_516;
        v38 = *(_QWORD *)v7;
        LOBYTE(v279) = v279 | 2;
        if ((v35 & 1) == 0)
          goto LABEL_85;
        goto LABEL_99;
    }
  }
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  int v2;
  unsigned int v4;
  int v5;
  char v6;
  _BOOL8 v7;
  unsigned int v8;
  int isa;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int *v15;
  unsigned int v16;

  v2 = type;
  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  if (dword_1ECCEBAD4 != -1)
    _os_trace_prefs_and_mode_refresh_slow(dword_1ECCEBAD4);
  v4 = dword_1ECCEBAD8;
  v5 = dword_1ECCEBADC;
  if (dword_1ECCEBADC != dword_1ECCEBAD8)
  {
    while (1)
    {
      v13 = __ldxr((unsigned int *)&dword_1ECCEBADC);
      if (v13 != v5)
        break;
      if (!__stxr(v4, (unsigned int *)&dword_1ECCEBADC))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }
    __clrex();
  }
LABEL_6:
  v6 = dword_1ECCEBAC8;
  if ((dword_1ECCEBAC8 & 0x100) != 0
    || (MEMORY[0xFFFFFC104] & 0x100) != 0
    || !byte_1ECCEBB3F && ((dword_1ECCEBAC8 & 0x400) != 0 || (MEMORY[0xFFFFFC104] & 0x400) != 0) && !_os_log_hook)
  {
    goto LABEL_28;
  }
  LOBYTE(v7) = 0;
  if (oslog && oslog != (os_log_t)&_os_log_disabled)
  {
    if (oslog[3].isa)
    {
      v8 = dword_1ECCEBAD8;
      isa = (int)oslog[6].isa;
      if (isa != dword_1ECCEBAD8)
      {
        v15 = (unsigned int *)&oslog[6];
        while (1)
        {
          v16 = __ldxr(v15);
          if (v16 != isa)
            break;
          if (!__stxr(v8, v15))
          {
            _os_log_preferences_refresh(oslog);
            v6 = dword_1ECCEBAC8;
            goto LABEL_16;
          }
        }
        __clrex();
      }
    }
LABEL_16:
    if ((v6 & 8) == 0 && (MEMORY[0xFFFFFC104] & 8) == 0 && (voucher_get_activity_id() & 0x800000000000000) == 0
      || (HIDWORD(oslog[7].isa) & 7) == 4)
    {
      goto LABEL_19;
    }
    if ((byte_1ECCEBB38 & 4) == 0)
    {
LABEL_48:
      v14 = (HIDWORD(oslog[7].isa) >> 27) & 7;
      if (v14 == 1)
      {
        if ((v2 - 3) < 0xFFFFFFFE)
          goto LABEL_70;
      }
      else if (v14 == 3 || v14 == 2 && v2 != 2)
      {
        goto LABEL_70;
      }
LABEL_19:
      if (_os_log_hook)
      {
        if (_os_log_hook_level == 2)
          goto LABEL_70;
        if (_os_log_hook_level == 1)
        {
          if (v2 != 2)
            goto LABEL_70;
        }
        else if ((v2 - 3) < 0xFFFFFFFE)
        {
          goto LABEL_70;
        }
      }
      v10 = HIDWORD(oslog[7].isa) & 7;
      if (!v10)
        v10 = process_prefs_0 & 3;
      if (v10 == 4)
      {
LABEL_28:
        LOBYTE(v7) = 0;
        return v7;
      }
      if (v2 == 2)
      {
        v12 = v10 - 1;
        if (v12 >= 3)
        {
          if ((dword_1ECCEBAC8 & 2) != 0 || (MEMORY[0xFFFFFC104] & 2) != 0)
            goto LABEL_70;
          return ((unint64_t)voucher_get_activity_id() >> 57) & 1;
        }
        else
        {
          LOBYTE(v7) = (v12 & 7) == 2;
        }
        return v7;
      }
      if (v2 == 1)
      {
        v11 = v10 - 1;
        if (v11 >= 3)
        {
          if ((dword_1ECCEBAC8 & 3) != 0 || (MEMORY[0xFFFFFC104] & 3) != 0)
            goto LABEL_70;
          LOBYTE(v7) = (voucher_get_activity_id() & 0x300000000000000) != 0;
        }
        else
        {
          LODWORD(v7) = (6u >> (v11 & 7)) & 1;
        }
        return v7;
      }
LABEL_70:
      LOBYTE(v7) = 1;
      return v7;
    }
    if (v2 > 15)
    {
      if ((v2 - 16) >= 2)
        goto LABEL_48;
    }
    else if (v2)
    {
      if (v2 == 1)
      {
        if ((qword_1ECCEBB30 & 0x100000000) != 0)
          goto LABEL_70;
      }
      else if (v2 == 2 && (qword_1ECCEBB30 & 0x200000000) != 0)
      {
        goto LABEL_70;
      }
      goto LABEL_48;
    }
    if ((qword_1ECCEBB30 & 0x800000000) != 0)
      goto LABEL_70;
    goto LABEL_48;
  }
  return v7;
}

uint64_t _os_log_invoke_callback(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t (**a5)(_QWORD *))
{
  uint64_t (*v5)(_QWORD *);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v5 = *a5;
  if (*a5)
  {
    v9 = result;
    if (!*(_QWORD *)(a4 + 24))
      _os_log_impl_compose(*(char **)(result + 40), a4);
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
    v14[0] = 1;
    v14[1] = a2;
    if (a2)
    {
      v10 = *(_QWORD *)(a2 + 24);
      v11 = v10 + 4;
      if (!v10)
        v11 = 0;
      *(_QWORD *)&v15 = v11;
      if (v10)
        v10 += *(unsigned __int8 *)(v10 + 2) + 4;
    }
    else
    {
      v10 = 0;
    }
    v13 = *(_QWORD *)(v9 + 32);
    v12 = *(_QWORD *)(v9 + 40);
    *((_QWORD *)&v15 + 1) = v10;
    *(_QWORD *)&v16 = v12;
    *((_QWORD *)&v16 + 1) = **(_QWORD **)(a4 + 24);
    *(_QWORD *)&v17 = v13;
    BYTE8(v17) = a3 & 0x7F;
    return v5(v14);
  }
  return result;
}

xpc_object_t _os_log_preference_option_ttl(uint64_t a1, char *a2)
{
  xpc_object_t result;

  result = _os_log_preference_value(a1, a2, MEMORY[0x1E0C89010]);
  if (result)
    LOBYTE(result) = xpc_int64_get_value(result);
  return (xpc_object_t)result;
}

const char *_os_log_fmt_flatten_NSCF(void *a1, char *a2, size_t a3, _BYTE *a4)
{
  char *v6;
  objc_class *Class;
  const char *Name;

  v6 = a2;
  if (_NSCF_function)
  {
    if ((_NSCF_function(a1, a2, a3, a4) & 1) == 0)
    {
      *a4 = 0;
      return "<invalid NS/CF object>";
    }
  }
  else
  {
    Class = object_getClass(a1);
    *a4 = 0;
    if (!Class)
      return "<invalid NS/CF object>";
    Name = class_getName(Class);
    snprintf(v6, a3, "<%s instance>", Name);
  }
  return v6;
}

uint64_t _os_log_preference_option(void **a1, const char *a2)
{
  uint64_t result;

  result = _os_log_option_for_key(a1[1], a2);
  if (!(_DWORD)result)
    return _os_log_option_for_key(*a1, a2);
  return result;
}

uint64_t _os_log_option_for_key(void *a1, const char *a2)
{
  xpc_object_t value;
  void *v3;
  const char *string_ptr;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;

  if (!a1)
    return 0;
  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
    return 0;
  v3 = value;
  if (object_getClass(value) != (Class)MEMORY[0x1E0C89020])
    return 0;
  string_ptr = xpc_string_get_string_ptr(v3);
  if (!strcasecmp(string_ptr, "default"))
    return 1;
  v6 = xpc_string_get_string_ptr(v3);
  if (!strcasecmp(v6, "info"))
    return 2;
  v7 = xpc_string_get_string_ptr(v3);
  if (!strcasecmp(v7, "debug"))
    return 3;
  v8 = xpc_string_get_string_ptr(v3);
  if (strcasecmp(v8, "off"))
  {
    v9 = xpc_string_get_string_ptr(v3);
    if (strcasecmp(v9, "none"))
      return 0;
  }
  return 4;
}

size_t os_trace_blob_add_slow(uint64_t a1, void *__src, size_t __n)
{
  size_t v3;
  unsigned int v6;
  size_t v7;
  unsigned int v8;

  if ((*(_WORD *)(a1 + 20) & 2) != 0)
    return 0;
  v3 = __n;
  v6 = *(_DWORD *)(a1 + 12);
  v7 = *(char *)(a1 + 22) + v6 - *(_DWORD *)(a1 + 8) - 1;
  if (v7 < __n)
  {
    if (v6 < *(_DWORD *)(a1 + 16))
      v7 = os_trace_blob_grow(a1, __n);
    if (v7 < v3)
    {
      *(_WORD *)(a1 + 20) |= 2u;
      v3 = v7;
    }
  }
  memcpy((void *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)), __src, v3);
  v8 = *(_DWORD *)(a1 + 8) + v3;
  *(_DWORD *)(a1 + 8) = v8;
  if (!*(_BYTE *)(a1 + 22))
    *(_BYTE *)(*(_QWORD *)a1 + v8) = 0;
  return v3;
}

uint64_t os_trace_blob_grow(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  size_t v4;
  size_t v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(_DWORD *)(a1 + 8);
  if (*(_BYTE *)(a1 + 22))
    v4 = v3;
  else
    v4 = v3 + 1;
  v5 = v4 + a2;
  if (__CFADD__(v4, a2) || HIDWORD(v5))
  {
    v6 = *(_DWORD *)(a1 + 12);
    v7 = *(_DWORD *)(a1 + 16);
  }
  else
  {
    v6 = *(_DWORD *)(a1 + 12);
    if ((v6 & 0x80000000) != 0)
    {
      v7 = *(_DWORD *)(a1 + 16);
    }
    else
    {
      if (2 * v6 > v5)
        LODWORD(v5) = 2 * v6;
      if (*(_DWORD *)(a1 + 16) >= v5)
        v7 = v5;
      else
        v7 = *(_DWORD *)(a1 + 16);
    }
  }
  if (v7 > v6)
  {
    v8 = *(void **)a1;
    if ((*(_WORD *)(a1 + 20) & 1) != 0)
    {
      while (1)
      {
        v10 = malloc_type_realloc(v8, v7, 0x543E7918uLL);
        if (v10)
          break;
        _os_trace_temporary_resource_shortage();
      }
      *(_QWORD *)a1 = v10;
    }
    else
    {
      while (1)
      {
        v9 = malloc_type_malloc(v7, 0x91D685AAuLL);
        if (v9)
          break;
        _os_trace_temporary_resource_shortage();
      }
      *(_QWORD *)a1 = v9;
      memcpy(v9, v8, v4);
      *(_WORD *)(a1 + 20) |= 1u;
    }
    *(_DWORD *)(a1 + 12) = v7;
  }
  return v7 - v4;
}

_WORD *os_trace_blob_pwrite(_WORD *result, unsigned int a2, __int16 a3)
{
  if (a2 <= 1)
  {
    _os_assert_log();
    result = (_WORD *)_os_crash();
    __break(1u);
  }
  else
  {
    *result = a3;
  }
  return result;
}

void os_log_backtrace_serialize_to_blob(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  const unsigned __int8 *v11;
  uint64_t v12;
  unsigned int v13;
  _DWORD *v14;
  size_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t i;
  char *v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  int v29;
  size_t v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  int v34;
  _DWORD v35[1021];
  uint64_t v36;

  v1 = MEMORY[0x1E0C86820](a1);
  v3 = v2;
  v4 = v1;
  v36 = *MEMORY[0x1E0C874D8];
  v5 = MEMORY[0x1E0C86820](v1);
  v6 = (char *)&v33 - ((v7 + 15) & 0x1FFFFFFF0);
  LODWORD(v7) = *(_DWORD *)(v5 + 8);
  if ((int)v7 < 1)
  {
    v9 = 255;
  }
  else
  {
    v33 = (uint64_t)&v33;
    v8 = 0;
    v9 = 255;
    do
    {
      if (uuid_is_null((const unsigned __int8 *)(*(_QWORD *)v4 + 20 * v8)))
        goto LABEL_4;
      if (v9 > 254)
        goto LABEL_12;
      v10 = v9;
      v11 = (const unsigned __int8 *)&v35[4 * v9 + 1];
      while (uuid_compare(v11, (const unsigned __int8 *)(*(_QWORD *)v4 + 20 * v8)))
      {
        ++v10;
        v11 += 16;
        if (v10 == 255)
          goto LABEL_11;
      }
      if (v10 != -1)
        goto LABEL_13;
LABEL_11:
      if (v9 < 1)
      {
LABEL_4:
        LOBYTE(v10) = -1;
      }
      else
      {
LABEL_12:
        uuid_copy((unsigned __int8 *)&v35[4 * --v9 + 1], (const unsigned __int8 *)(*(_QWORD *)v4 + 20 * v8));
        LOBYTE(v10) = v9;
      }
LABEL_13:
      v6[v8++] = v10;
      v7 = *(int *)(v4 + 8);
    }
    while (v8 < v7);
  }
  LOBYTE(v35[0]) = 18;
  BYTE1(v35[0]) = -1 - v9;
  HIWORD(v35[0]) = v7;
  if ((*(_BYTE *)(v3 + 20) & 2) == 0)
  {
    v12 = *(unsigned int *)(v3 + 8);
    if ((*(char *)(v3 + 22) + *(_DWORD *)(v3 + 12) - v12 - 1) <= 3)
    {
      os_trace_blob_add_slow(v3, v35, 4uLL);
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)v3 + v12) = v35[0];
      v13 = *(_DWORD *)(v3 + 8) + 4;
      *(_DWORD *)(v3 + 8) = v13;
      if (!*(_BYTE *)(v3 + 22))
        *(_BYTE *)(*(_QWORD *)v3 + v13) = 0;
    }
  }
  if ((*(_WORD *)(v3 + 20) & 2) == 0)
  {
    v14 = &v35[4 * v9 + 1];
    v15 = 16 * (255 - v9);
    v16 = *(unsigned int *)(v3 + 8);
    if (v15 > (*(char *)(v3 + 22) + *(_DWORD *)(v3 + 12) - v16 - 1))
    {
      os_trace_blob_add_slow(v3, v14, v15);
    }
    else
    {
      memcpy((void *)(*(_QWORD *)v3 + v16), v14, v15);
      v17 = *(_DWORD *)(v3 + 8) + v15;
      *(_DWORD *)(v3 + 8) = v17;
      if (!*(_BYTE *)(v3 + 22))
        *(_BYTE *)(*(_QWORD *)v3 + v17) = 0;
    }
  }
  LODWORD(v18) = *(_DWORD *)(v4 + 8);
  if ((int)v18 >= 1)
  {
    v19 = 0;
    v20 = 16;
    do
    {
      if ((*(_WORD *)(v3 + 20) & 2) == 0)
      {
        v21 = (_DWORD *)(*(_QWORD *)v4 + v20);
        v22 = *(unsigned int *)(v3 + 8);
        if ((*(char *)(v3 + 22) + *(_DWORD *)(v3 + 12) - v22 - 1) <= 3)
        {
          os_trace_blob_add_slow(v3, v21, 4uLL);
        }
        else
        {
          *(_DWORD *)(*(_QWORD *)v3 + v22) = *v21;
          v23 = *(_DWORD *)(v3 + 8) + 4;
          *(_DWORD *)(v3 + 8) = v23;
          if (!*(_BYTE *)(v3 + 22))
            *(_BYTE *)(*(_QWORD *)v3 + v23) = 0;
        }
      }
      ++v19;
      v18 = *(int *)(v4 + 8);
      v20 += 20;
    }
    while (v19 < v18);
    if ((int)v18 >= 1)
    {
      for (i = 0; i < v18; ++i)
      {
        v25 = &v6[i];
        v26 = v6[i];
        if (v26 != 255)
        {
          LOBYTE(v26) = v26 - v9;
          *v25 = v26;
        }
        if ((*(_WORD *)(v3 + 20) & 2) == 0)
        {
          v27 = *(unsigned int *)(v3 + 8);
          if (*(char *)(v3 + 22) + *(_DWORD *)(v3 + 12) - 1 == (_DWORD)v27)
          {
            os_trace_blob_add_slow(v3, v25, 1uLL);
          }
          else
          {
            *(_BYTE *)(*(_QWORD *)v3 + v27) = v26;
            v28 = *(_DWORD *)(v3 + 8) + 1;
            *(_DWORD *)(v3 + 8) = v28;
            if (!*(_BYTE *)(v3 + 22))
              *(_BYTE *)(*(_QWORD *)v3 + v28) = 0;
          }
        }
        v18 = *(int *)(v4 + 8);
      }
    }
  }
  v29 = v18 & 3;
  if (v29)
  {
    v34 = 0;
    if ((*(_WORD *)(v3 + 20) & 2) == 0)
    {
      v30 = (4 - v29);
      v31 = *(unsigned int *)(v3 + 8);
      if (*(char *)(v3 + 22) + *(_DWORD *)(v3 + 12) - (int)v31 - 1 < v30)
      {
        os_trace_blob_add_slow(v3, &v34, v30);
      }
      else
      {
        memcpy((void *)(*(_QWORD *)v3 + v31), &v34, v30);
        v32 = *(_DWORD *)(v3 + 8) + v30;
        *(_DWORD *)(v3 + 8) = v32;
        if (!*(_BYTE *)(v3 + 22))
          *(_BYTE *)(*(_QWORD *)v3 + v32) = 0;
      }
    }
  }
}

image_offset **os_log_backtrace_create_from_return_address(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  size_t v6;
  uint64_t v7;
  unsigned int v8;
  _BOOL4 v9;
  uint64_t v11;
  _BYTE v12[4];
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  MEMORY[0x1E0C86820](a1);
  v5 = &v12[-v4];
  if (v3 >= 0x200)
    v6 = 512;
  else
    v6 = v3;
  bzero(&v12[-v4], v6);
  v13 = 0;
  thread_stack_async_pcs();
  v7 = v13;
  if (v13)
  {
    v8 = v13 - 1;
    while (!*(_QWORD *)&v5[8 * (v7 - 1)])
    {
      v13 = v8--;
      --v7;
      if (v8 == -1)
      {
        LODWORD(v7) = 0;
        goto LABEL_9;
      }
    }
    v9 = v7 != 0;
    if ((_DWORD)v7)
    {
      v11 = 0;
      while (*(_QWORD *)&v5[8 * v11] != a2)
      {
        if (v7 == ++v11)
          return os_log_backtrace_create_from_pcs((void *const *)&v5[8 * v9], (int)v7 - v9);
      }
      v9 = v11;
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  return os_log_backtrace_create_from_pcs((void *const *)&v5[8 * v9], (int)v7 - v9);
}

image_offset **os_log_backtrace_create_from_pcs(void *const *a1, int a2)
{
  image_offset **v4;
  image_offset **v5;
  image_offset *v6;

  while (1)
  {
    v4 = (image_offset **)malloc_type_calloc(1uLL, 0x10uLL, 0x478C0A82uLL);
    if (v4)
      break;
    _os_trace_temporary_resource_shortage();
  }
  v5 = v4;
  *((_DWORD *)v4 + 2) = a2;
  while (1)
  {
    v6 = (image_offset *)malloc_type_malloc(20 * a2, 0x91D685AAuLL);
    if (v6)
      break;
    _os_trace_temporary_resource_shortage();
  }
  *v5 = v6;
  backtrace_image_offsets(a1, v6, a2);
  return v5;
}

void _os_state_request_for_self(uint64_t a1, __int128 *a2, char a3, uint64_t a4)
{
  unsigned int v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  unsigned int v12;
  _QWORD v13[5];
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  if (dword_1ECCEBAD4 != -1)
    _os_trace_prefs_and_mode_refresh_slow(dword_1ECCEBAD4);
  v8 = dword_1ECCEBAD8;
  v9 = dword_1ECCEBADC;
  if (dword_1ECCEBADC != dword_1ECCEBAD8)
  {
    while (1)
    {
      v12 = __ldxr((unsigned int *)&dword_1ECCEBADC);
      if (v12 != v9)
        break;
      if (!__stxr(v8, (unsigned int *)&dword_1ECCEBADC))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }
    __clrex();
  }
LABEL_6:
  if ((dword_1ECCEBAC8 & 0x500) == 0)
  {
    v10 = (MEMORY[0xFFFFFC104] & 0x500) != 0 || off_1ECCEBAB8 == 0;
    if (!v10 && dword_1ECCEBAD4 == -1 && dword_1ECCEBAAC)
    {
      os_unfair_lock_lock_with_options();
      if (byte_1ECCEBAA8)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECCEBA98);
      }
      else
      {
        byte_1ECCEBAA8 = 1;
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECCEBA98);
        v14 = *a2;
        v13[0] = MEMORY[0x1E0C87450];
        v13[2] = ___os_state_request_for_self_block_invoke;
        v13[3] = &__block_descriptor_tmp_364;
        v11 = *((_QWORD *)a2 + 2);
        v13[1] = 0x40000000;
        v13[4] = a1;
        v17 = a3;
        v15 = v11;
        v16 = a4;
        dispatch_async((dispatch_queue_t)qword_1ECCEBAA0, v13);
      }
    }
  }
}

unint64_t _os_log_impl_compose(char *__s, uint64_t a2)
{
  *(_QWORD *)(a2 + 48) = a2 + 76;
  *(_QWORD *)(a2 + 56) = 0x100000000;
  *(_WORD *)(a2 + 68) = 0;
  *(_BYTE *)(a2 + 70) = 0;
  *(_DWORD *)(a2 + 64) = 0x10000;
  *(_QWORD *)(a2 + 24) = a2 + 48;
  return os_log_fmt_compose(a2 + 48, __s, 2, 3u, 8, **(unsigned __int8 ***)a2, **(_QWORD **)(a2 + 8), *(unsigned __int16 *)(*(_QWORD *)(a2 + 8) + 8), **(_QWORD **)(a2 + 16), *(_DWORD *)(*(_QWORD *)(a2 + 16) + 8));
}

uint64_t _os_log_pack_size(uint64_t a1)
{
  return a1 + 72;
}

BOOL _os_trace_lazy_init_completed_4libxpc()
{
  return _os_trace != 0;
}

void _os_signpost_emit_unreliably_with_name_impl(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  __os_signpost_emit_impl(a1, a2, a3, a4, a5, a6, a7, a8, v8);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  uint64_t v8;

  __os_signpost_emit_impl((uint64_t)dso, (uint64_t)log, type, spid, (uint64_t)name, (uint64_t)format, (uint64_t)buf, *(uint64_t *)&size, v8);
}

void __os_signpost_emit_impl(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v16 = a4;
  v17 = 0;
  v10 = 0u;
  v11 = 0;
  v12 = a1;
  v13 = a9;
  v14 = a6;
  v15 = a5;
  __error();
  if (((*(_DWORD *)(a2 + 60) >> 20) & 3) == 0 && (dword_1ECCEBAC8 & 4) == 0 && (MEMORY[0xFFFFFC104] & 4) == 0)
    voucher_get_activity_id();
  _os_log_impl_flatten_and_send((uint64_t)&v10);
}

void *_os_trace_malloc(size_t size)
{
  void *result;

  while (1)
  {
    result = malloc_type_malloc(size, 0x91D685AAuLL);
    if (result)
      break;
    _os_trace_temporary_resource_shortage();
  }
  return result;
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = -3;
  if (activity != (os_activity_t)&_os_activity_current)
    v5 = (uint64_t)activity;
  if (activity == (os_activity_t)&_os_activity_none)
    v6 = 0;
  else
    v6 = v5;
  return (os_activity_t)_os_activity_create_addr((uint64_t)dso, (uint64_t)description, v6, flags, v4);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  _os_activity_initiate_impl((uint64_t)dso, (uint64_t)description, flags, (uint64_t)activity_block, *((void (**)(uint64_t))activity_block + 2));
}

void os_log_with_args(NSObject *a1, char a2, char *a3, _DWORD *a4, void (*a5)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6))
{
  _os_log_with_args_impl(a1, a2, a3, a4, a5, 0);
}

void *_os_trace_memdup(const void *a1, size_t size)
{
  void *v4;

  while (1)
  {
    v4 = malloc_type_malloc(size, 0x91D685AAuLL);
    if (v4)
      break;
    _os_trace_temporary_resource_shortage();
  }
  return memcpy(v4, a1, size);
}

void os_log_pack_send(uint64_t a1)
{
  _os_log_impl_flatten_and_send(a1);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  uint64_t activity_id;
  void *v3;

  activity_id = voucher_get_activity_id();
  if (activity_id && activity_id != state->opaque[0])
  {
    _os_assumes_log_ctx();
    v3 = (void *)state->opaque[1];
  }
  else
  {
    v3 = (void *)voucher_adopt();
  }
  os_release(v3);
  state->opaque[0] = 0;
  state->opaque[1] = 0;
}

uint64_t _os_trace_prefsdir_path()
{
  if (_os_trace_paths_init_once != -1)
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
  return _os_trace_preferences_path;
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  if (activity == (os_activity_t)&_os_activity_current)
  {
    qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OS_ACTIVITY_CURRENT passed";
    __break(1u);
  }
  else
  {
    if (activity != (os_activity_t)&_os_activity_none)
      os_retain(activity);
    state->opaque[0] = voucher_get_activity_id();
    state->opaque[1] = voucher_adopt();
  }
}

uint64_t _os_log_pack_fill(uint64_t result, unint64_t a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a4;
  *(_QWORD *)(result + 32) = v5;
  *(_QWORD *)(result + 40) = a5;
  if (a2 >= 0x10000)
  {
    qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Absurdly large size";
    qword_1EE40C120 = a2;
    __break(1u);
  }
  else
  {
    *(_QWORD *)(result + 48) = 0;
    *(_QWORD *)(result + 56) = 0;
    *(_WORD *)(result + 64) = a3;
    *(_WORD *)(result + 66) = a2 - 72;
    result += 68;
  }
  return result;
}

void _os_signpost_pack_send(uint64_t a1)
{
  _os_log_impl_flatten_and_send(a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  os_activity_apply_f(activity, block, *((os_function_t *)block + 2));
}

uint64_t ___os_log_preferences_merge_block_invoke(uint64_t a1, char *key)
{
  _os_log_preferences_merge_category(*(void **)(a1 + 32), *(xpc_object_t *)(a1 + 40), key);
  return 1;
}

void _os_log_preferences_merge_category(void *a1, xpc_object_t xdict, char *key)
{
  xpc_object_t dictionary;
  void *v6;
  xpc_object_t v7;

  dictionary = xpc_dictionary_get_dictionary(xdict, key);
  if (dictionary)
  {
    v6 = dictionary;
    v7 = xpc_dictionary_get_dictionary(a1, key);
    if (v7)
      _os_log_preferences_apply_overrides(v7, v6);
    else
      xpc_dictionary_set_value(a1, key, v6);
  }
}

uint64_t _os_log_preferences_apply_overrides(void *a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD applier[5];

  if (a1 == a2)
  {
    _os_assert_log();
    result = _os_crash();
    __break(1u);
  }
  else
  {
    result = (uint64_t)object_getClass(a1);
    if (a2)
    {
      v5 = MEMORY[0x1E0C88FE8];
      if (result == MEMORY[0x1E0C88FE8])
      {
        result = (uint64_t)object_getClass(a2);
        if (result == v5)
        {
          applier[0] = MEMORY[0x1E0C87450];
          applier[1] = 0x40000000;
          applier[2] = ___os_log_preferences_apply_overrides_block_invoke;
          applier[3] = &__block_descriptor_tmp_32_211;
          applier[4] = a1;
          return xpc_dictionary_apply(a2, applier);
        }
      }
    }
  }
  return result;
}

os_activity_id_t os_activity_get_identifier(os_activity_t activity, os_activity_id_t *parent_id)
{
  return voucher_get_activity_id();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  uint64_t v6;

  _os_log((uint64_t)dso, (uint64_t)log, type, (uint64_t)format, (uint64_t)buf, *(uint64_t *)&size, v6);
}

void _os_trace_formatters_list()
{
  char *v0;
  uint64_t v1;
  char v2;
  char v3;
  DIR *v4;
  DIR *v5;
  dirent *i;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C874D8];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v0 = getenv("OS_ACTIVITY_FORMATTER");
  if (!v0 || strcmp(v0, "disable"))
  {
    v1 = 0;
    v2 = 1;
    do
    {
      v3 = v2;
      v4 = opendir((&plugin_dirs)[2 * v1]);
      v5 = v4;
      if (v4)
      {
        for (i = readdir(v4); i; i = readdir(v5))
        {
          if (i->d_type == 8)
          {
            v7 = _os_trace_formatter_record((char *)v18[3], i->d_name, v1, v14 + 3, v10 + 3);
            v18[3] = (uint64_t)v7;
          }
        }
        closedir(v5);
      }
      v2 = 0;
      v1 = 1;
    }
    while ((v3 & 1) != 0);
    v21 = 0;
    v22 = 0;
    if (_dyld_get_shared_cache_uuid())
      dyld_shared_cache_iterate_text();
    qsort_b((void *)v18[3], v14[3], 0x28uLL, &__block_literal_global_58);
    v8 = v14[3];
    _formatters = v18[3];
    qword_1ECCEBB98 = v8;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void sub_19BBF49B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 88), 8);
  _Unwind_Resume(a1);
}

char *___os_trace_formatters_list_block_invoke(char *result, uint64_t a2)
{
  char *v3;
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  size_t v8;
  const char *v9;

  v3 = result;
  v4 = 0;
  v5 = 0;
  v6 = 1;
  do
  {
    v7 = v6;
    if ((v4 & 1) != 0 || !v3[56])
    {
      v8 = strlen((&plugin_dirs)[2 * v5]);
      v9 = *(const char **)(a2 + 40);
      result = (char *)strncmp(v9, (&plugin_dirs)[2 * v5], v8);
      if (!(_DWORD)result)
      {
        result = _os_trace_formatter_record(*(char **)(*(_QWORD *)(*((_QWORD *)v3 + 4) + 8) + 24), (char *)&v9[v8], v5, (uint64_t *)(*(_QWORD *)(*((_QWORD *)v3 + 5) + 8) + 24), (_QWORD *)(*(_QWORD *)(*((_QWORD *)v3 + 6) + 8) + 24));
        *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v3 + 4) + 8) + 24) = result;
      }
    }
    v6 = 0;
    v4 = 1;
    v5 = 1;
  }
  while ((v7 & 1) != 0);
  return result;
}

char *_os_trace_formatter_record(char *a1, char *__s1, uint64_t a3, uint64_t *a4, _QWORD *a5)
{
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;

  if (!strncmp(__s1, "liblog_", 7uLL) && !strchr(__s1, 47))
  {
    v11 = strrchr(__s1, 46);
    if (v11)
    {
      v12 = v11;
      if (!strcmp(v11, ".dylib"))
      {
        v13 = strndup(__s1 + 7, v12 - (__s1 + 7));
        v14 = *a4;
        if (*a4)
        {
          v15 = 8;
          v16 = *a4;
          while (strcasecmp(*(const char **)&a1[v15], v13))
          {
            v15 += 40;
            if (!--v16)
              goto LABEL_10;
          }
          free(v13);
        }
        else
        {
LABEL_10:
          if (v14 == *a5)
          {
            *a5 = v14 + 8;
            a1 = (char *)_os_trace_realloc(a1, 40 * (v14 + 8));
            v14 = *a4;
          }
          *a4 = v14 + 1;
          v17 = &a1[40 * v14];
          *(_QWORD *)v17 = 0;
          *((_QWORD *)v17 + 1) = v13;
          *((_QWORD *)v17 + 3) = 0;
          *((_QWORD *)v17 + 4) = 0;
          *((_QWORD *)v17 + 2) = a3;
        }
      }
    }
  }
  return a1;
}

void *_os_trace_realloc(void *ptr, size_t size)
{
  void *result;

  while (1)
  {
    result = malloc_type_realloc(ptr, size, 0x543E7918uLL);
    if (result)
      break;
    _os_trace_temporary_resource_shortage();
  }
  return result;
}

uint64_t ___os_trace_formatters_list_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return strcasecmp(*(const char **)(a2 + 8), *(const char **)(a3 + 8));
}

void _os_trace_scandir_free_namelist(int a1, void **a2)
{
  unint64_t v3;

  if (a1 >= 1)
  {
    v3 = a1 + 1;
    do
      free(a2[(v3-- - 2)]);
    while (v3 > 1);
  }
  free(a2);
}

void *_os_trace_get_boot_uuid()
{
  if (_os_trace_get_boot_uuid_once != -1)
    dispatch_once_f(&_os_trace_get_boot_uuid_once, &_os_trace_get_boot_uuid_uuid_str, (dispatch_function_t)_os_trace_get_boot_uuid_slow);
  return &_os_trace_get_boot_uuid_uuid_str;
}

uint64_t os_log_shim_enabled(uint64_t a1)
{
  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  if ((dword_1ECCEBAC8 & 0x60000000) != 0 || (MEMORY[0xFFFFFC104] & 0x60000000) != 0)
    return 0;
  if (a1 && dyld_image_header_containing_address())
    return dyld_sdk_at_least();
  return 1;
}

uint64_t ___os_log_preferences_apply_overrides_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_object_t value;
  xpc_object_t v7;
  const char *string_ptr;

  value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), a2);
  if (!value)
    goto LABEL_5;
  v7 = value;
  if (object_getClass(value) == (Class)MEMORY[0x1E0C88FE8])
  {
    _os_log_preferences_apply_overrides(v7, a3);
    return 1;
  }
  if (object_getClass(a3) != (Class)MEMORY[0x1E0C89020]
    || (string_ptr = xpc_string_get_string_ptr(a3), strcasecmp(string_ptr, "inherit")))
  {
LABEL_5:
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  }
  return 1;
}

void os_activity_apply_f(os_activity_t activity, void *context, os_function_t function)
{
  void *v5;

  if (activity == (os_activity_t)&_os_activity_current)
  {
    qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OS_ACTIVITY_CURRENT passed";
    __break(1u);
  }
  else
  {
    if (activity != (os_activity_t)&_os_activity_none)
      os_retain(activity);
    voucher_adopt();
    ((void (*)(void *))function)(context);
    v5 = (void *)voucher_adopt();
    os_release(v5);
  }
}

char *_os_log_send_and_compose_impl(char a1, _QWORD *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v10;
  char *result;
  char *v12;
  char v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  if (a2)
    *a2 = a8;
  v17 = 0;
  v20 = 0;
  v14 = 0u;
  v15 = 0;
  v16 = a5;
  v18 = a8;
  v19 = 0uLL;
  __error();
  v13 = 0;
  if (a3)
    v10 = a3;
  else
    v10 = &v13;
  v12 = v10;
  _os_log_impl_flatten_and_send((uint64_t)&v14);
  result = 0;
  if ((a1 & 2) != 0)
  {
    result = v12;
    if (v12 == &v13)
    {
      while (1)
      {
        result = strdup((const char *)&unk_19BC05A6E);
        if (result)
          break;
        _os_trace_temporary_resource_shortage();
      }
    }
  }
  return result;
}

uint64_t _os_trace_write(int __fd, uint64_t a2, size_t __nbyte)
{
  size_t v3;
  uint64_t v6;
  ssize_t v7;
  int v8;

  if (__nbyte)
  {
    v3 = __nbyte;
    v6 = 0;
    while (1)
    {
      v7 = write(__fd, (const void *)(a2 + v6), v3);
      if (v7 < 0)
      {
        v8 = *__error();
        if (v8 != 4)
        {
          _os_trace_undo_write(__fd, v6, v8);
          return -1;
        }
      }
      else
      {
        v6 += v7;
        v3 -= v7;
      }
      if (!v3)
        return v6;
    }
  }
  return 0;
}

size_t _os_signpost_pack_fill(size_t result, unint64_t a2, __int16 a3, uint64_t a4, char *a5, char *__s, uint64_t a7)
{
  uint64_t v7;
  uint64_t v13;

  v13 = result;
  if (!a5)
  {
    result = strlen(__s);
    a5 = &__s[result];
  }
  *(_QWORD *)v13 = 0;
  *(_QWORD *)(v13 + 8) = 0;
  *(_QWORD *)(v13 + 16) = 0;
  *(_QWORD *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v7;
  *(_QWORD *)(v13 + 40) = a5;
  if (a2 >= 0x10000)
  {
    qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Absurdly large size";
    qword_1EE40C120 = a2;
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v13 + 48) = __s;
    *(_QWORD *)(v13 + 56) = a7;
    *(_WORD *)(v13 + 64) = a3;
    *(_WORD *)(v13 + 66) = a2 - 72;
    return v13 + 68;
  }
  return result;
}

uint64_t _os_trace_is_development_build()
{
  if ((MEMORY[0xFFFFFC104] & 0x80000000) != 0)
    return 0;
  else
    return (MEMORY[0xFFFFFC104] >> 28) & 1;
}

void os_log_shim_with_CFString(void (*a1)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6), NSObject *a2, int a3, void *a4, _DWORD *a5)
{
  void (*v5)(uint64_t, uint64_t, uint64_t, void *, int, va_list);
  char *v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, void *, int, va_list);
  char v13;

  v11 = (char *)objc_msgSend(a4, "_fastCStringContents:", 1);
  if (a1)
    v12 = a1;
  else
    v12 = v5;
  if (a3 == 4)
    v13 = 1;
  else
    v13 = 2 * (a3 == 2);
  _os_log_with_args_impl(a2, v13, v11, a5, v12, a4);
}

uint64_t _os_trace_mmap_at(int a1, const char *a2, int a3, size_t *a4)
{
  int v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t result;
  int v11;
  int v12;

  v5 = openat(a1, a2, a3 | 0x1000004);
  if (v5 < 0)
    goto LABEL_8;
  v6 = v5;
  v7 = _os_trace_mmap(v5, a4);
  if (!v7)
  {
    v11 = *__error();
    if (close(v6) == -1)
    {
      v12 = *__error();
      result = *__error();
      if (v12 == 9)
        goto LABEL_13;
      _os_assumes_log();
    }
    *__error() = v11;
LABEL_8:
    v8 = 0;
    *a4 = 0;
    return (uint64_t)v8;
  }
  v8 = v7;
  if (close(v6) != -1)
    return (uint64_t)v8;
  v9 = *__error();
  result = *__error();
  if (v9 != 9)
  {
    _os_assumes_log();
    return (uint64_t)v8;
  }
  qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE40C120 = result;
  __break(1u);
LABEL_13:
  qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE40C120 = result;
  __break(1u);
  return result;
}

void *_os_trace_mmap(int a1, size_t *a2)
{
  size_t v4;
  size_t v5;
  void *result;
  int v7;
  int *v8;

  v4 = lseek(a1, 0, 2);
  if ((v4 & 0x8000000000000000) != 0)
    goto LABEL_4;
  v5 = v4;
  if (!v4)
  {
    v7 = 34;
    goto LABEL_6;
  }
  result = mmap(0, v4, 1, 8194, a1, 0);
  if ((unint64_t)result + 1 <= 1)
  {
LABEL_4:
    v7 = *__error();
LABEL_6:
    v8 = __error();
    v5 = 0;
    result = 0;
    *v8 = v7;
  }
  *a2 = v5;
  return result;
}

void *_os_trace_zalloc(size_t size)
{
  void *result;

  while (1)
  {
    result = malloc_type_calloc(1uLL, size, 0x86D6D554uLL);
    if (result)
      break;
    _os_trace_temporary_resource_shortage();
  }
  return result;
}

void *_os_log_set_nscf_formatter(void *result)
{
  _NSCF_function = result;
  return result;
}

uint64_t _os_trace_sysprefsdir_path()
{
  if (_os_trace_paths_init_once != -1)
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
  return _os_trace_system_preferences_path;
}

uint64_t _os_trace_os_cryptex_sysprefsdir_path()
{
  if (_os_trace_paths_init_once != -1)
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
  return _os_trace_os_cryptex_system_preferences_path;
}

uint64_t _os_trace_app_cryptex_sysprefsdir_path()
{
  if (_os_trace_paths_init_once != -1)
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
  return _os_trace_app_cryptex_system_preferences_path;
}

uint64_t _os_trace_writev(int a1, iovec *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  iovec *v8;
  int v9;
  uint64_t v10;
  ssize_t v11;
  unint64_t v12;
  size_t *p_iov_len;
  size_t v14;
  unint64_t v15;
  uint64_t v16;
  iovec *v17;
  iovec *v18;
  unint64_t v19;
  int *v20;

  v6 = 0;
  v7 = 0;
  v8 = a2;
  while (2)
  {
    if ((int)a3 - v7 >= 1024)
      v9 = 1024;
    else
      v9 = a3 - v7;
    v10 = v7;
    while (1)
    {
      v11 = writev(a1, &v8[v7], v9);
      if ((v11 & 0x8000000000000000) == 0)
        break;
      if (*__error() != 4)
      {
        if (v8 != a2)
          free(v8);
        if (v6)
        {
          v20 = __error();
          _os_trace_undo_write(a1, v6, *v20);
        }
        return -1;
      }
    }
    v12 = v11;
    v6 += v11;
    if ((int)a3 > v7)
    {
      p_iov_len = &v8[v7].iov_len;
      while (1)
      {
        v14 = *p_iov_len;
        p_iov_len += 2;
        v15 = v12 - v14;
        if (v12 < v14)
          break;
        ++v10;
        v12 = v15;
        if ((int)a3 == v10)
          goto LABEL_29;
      }
      v7 = v10;
    }
    v16 = (a3 - v7);
    if ((_DWORD)a3 != v7)
    {
      if (v8 == a2 && v12)
      {
        while (1)
        {
          v17 = (iovec *)malloc_type_malloc(16 * (int)v16, 0x91D685AAuLL);
          if (v17)
            break;
          _os_trace_temporary_resource_shortage();
        }
        v8 = v17;
        memcpy(v17, &a2[v7], 16 * (int)v16);
        v7 = 0;
      }
      else
      {
        v16 = a3;
      }
      v18 = &v8[v7];
      v19 = v18->iov_len - v12;
      v18->iov_base = (char *)v18->iov_base + v12;
      v18->iov_len = v19;
      a3 = v16;
      continue;
    }
    break;
  }
LABEL_29:
  if (v8 != a2)
    free(v8);
  return v6;
}

void _os_trace_dylib_or_main_executable_was_loaded(_DWORD *a1)
{
  char *v2;
  const char *v3;
  const char *v4;
  size_t v5;
  _QWORD *v6;
  uint64_t image_info;
  __int16 v8;
  __int16 v9;
  unsigned int *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  _WORD *v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t *v21;
  unint64_t v22;
  BOOL v23;
  _OWORD v24[3];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C874D8];
  v2 = (char *)off_1ECCEBAB8;
  v3 = (const char *)dyld_image_path_containing_address();
  if (v3)
  {
    v4 = v3;
    v25 = 0;
    memset(v24, 0, sizeof(v24));
    v5 = strlen(v3);
    v6 = (_QWORD *)((char *)v24 - ((MEMORY[0x1E0C86820]() + 48) & 0xFFFFFFFFFFFFFFF0));
    bzero(v6, v5 + 33);
    v6[2] = a1;
    image_info = _os_trace_get_image_info(a1, 0, (unsigned __int8 *)v6, (uint64_t)v24, 1);
    v6[3] = image_info;
    if (image_info)
    {
      memcpy(v6 + 4, v4, v5 + 1);
      if (LOBYTE(v24[0]))
      {
        v8 = *(_WORD *)v2;
        if ((*(_WORD *)v2 & 4) == 0)
        {
          if ((v8 & 2) == 0)
          {
            if (voucher_activity_should_send_strings())
              v9 = 2;
            else
              v9 = 4;
            v8 = *(_WORD *)v2 | v9;
            *(_WORD *)v2 = v8;
          }
          if ((v8 & 2) != 0)
            _os_trace_send_sections_to_logd((uint64_t)v6, (uint64_t)a1, (uint64_t)v24);
        }
      }
      if (a1[3] != 2)
      {
        if (BYTE1(v24[0]))
        {
          v10 = (unsigned int *)(v2 + 8);
          v11 = *((_QWORD *)&v24[0] + 1);
          v12 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
          while (!__ldaxr(v10))
          {
            if (!__stxr(v12, v10))
              goto LABEL_21;
          }
          __clrex();
          os_unfair_lock_lock_with_options();
LABEL_21:
          v14 = *((_QWORD *)v2 + 2);
          v15 = *(unsigned __int16 *)(v14 + 10);
          v16 = v14;
          if (3 * (int)v15 < 4 * *(unsigned __int16 *)(v14 + 8))
          {
            v17 = (32 * v15) | 0x10;
            while (1)
            {
              v18 = malloc_type_calloc(1uLL, v17, 0x478C0A82uLL);
              if (v18)
                break;
              _os_trace_temporary_resource_shortage();
            }
            v16 = (uint64_t)v18;
            v18[5] = 2 * *(_WORD *)(v14 + 10);
            *((_BYTE *)v18 + 12) = 1;
            v19 = *(unsigned __int16 *)(v14 + 10);
            if (*(_WORD *)(v14 + 10))
            {
              v20 = 0;
              v21 = (uint64_t *)(v14 + 24);
              do
              {
                v22 = *(v21 - 1);
                if (v22)
                  v23 = v22 == -1;
                else
                  v23 = 1;
                if (!v23)
                {
                  _os_trace_mh_map_insert_impl(0, v22, *v21, v16);
                  v19 = *(unsigned __int16 *)(v14 + 10);
                }
                ++v20;
                v21 += 2;
              }
              while (v20 < v19);
            }
          }
          _os_trace_mh_map_insert_impl((uint64_t)v10, (unint64_t)a1, v11, v16);
        }
        mach_continuous_time();
        voucher_activity_trace();
      }
    }
  }
  else
  {
    _os_trace_log_simple("no path for address %p", a1);
  }
}

uint64_t _os_trace_get_image_info(_DWORD *a1, unint64_t a2, uuid_t uu, uint64_t a4, char a5)
{
  _DWORD *v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  int v17;
  unsigned int v18;
  _BOOL4 v19;
  unint64_t v20;
  unsigned int v21;
  unint64_t v22;
  int v23;
  BOOL v24;
  char v25;
  char v26;
  char v27;
  BOOL v28;
  uint64_t v29;
  char v31;
  _QWORD v32[2];
  uint64_t (*v33)(_QWORD *, uint64_t);
  void *v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v39;
  uint64_t v40;
  _QWORD v41[6];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;

  v54 = 0;
  v55 = &v54;
  v56 = 0x2000000000;
  v57 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2000000000;
  v53 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2000000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2000000000;
  v45 = 0;
  if (a4)
  {
    *(_QWORD *)(a4 + 48) = 0;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)a4 = 0u;
    *(_BYTE *)(a4 + 1) = _dyld_is_memory_immutable() ^ 1;
  }
  v41[0] = MEMORY[0x1E0C87450];
  v41[1] = 0x40000000;
  v41[2] = ___os_trace_get_image_info_block_invoke;
  v41[3] = &unk_1E3C92E58;
  v41[4] = &v42;
  v41[5] = a4;
  v32[0] = MEMORY[0x1E0C87450];
  v32[1] = 0x40000000;
  v33 = ___os_trace_get_image_info_block_invoke_2;
  v34 = &unk_1E3C92E80;
  v39 = uu;
  v40 = a4;
  v35 = v41;
  v36 = &v54;
  v37 = &v46;
  v38 = &v50;
  if (a2 <= 3 && (a5 & 1) == 0)
    goto LABEL_14;
  if (*a1 == -17958194)
  {
    if ((a5 & 1) != 0 || a2 >= 0x1C && a2 - 28 >= a1[5])
    {
      v31 = 0;
      v10 = a1 + 7;
      goto LABEL_30;
    }
LABEL_14:
    v11 = 88;
    if (!a4)
      goto LABEL_73;
LABEL_15:
    if (*((_BYTE *)v51 + 24) && !*(_DWORD *)(a4 + 32))
    {
      *(_QWORD *)(a4 + 32) = v43[3];
      if ((a5 & 1) != 0)
        goto LABEL_73;
    }
    else if ((a5 & 1) != 0)
    {
      goto LABEL_73;
    }
    v12 = 0;
    while (1)
    {
      v13 = *(unsigned int *)(a4 + v12 + 20);
      if ((_DWORD)v13)
      {
        v14 = *(unsigned int *)(a4 + v12 + 16);
        v16 = a2 >= v14;
        v15 = a2 - v14;
        v16 = v16 && v15 >= v13;
        if (!v16)
          goto LABEL_78;
      }
      v12 += 8;
      if (v12 == 40)
        goto LABEL_73;
    }
  }
  if (*a1 != -17958193 || (a5 & 1) == 0 && (a2 < 0x20 || a2 - 32 < a1[5]))
    goto LABEL_14;
  v10 = a1 + 8;
  v31 = 1;
LABEL_30:
  v17 = 0;
  v18 = a1[4];
  v19 = v18 == 0;
  if (v18)
  {
    v20 = a1[5];
    if (v20 >= 8)
    {
      v21 = 1;
      while (1)
      {
        v22 = v10[1];
        v16 = v20 >= v22;
        v20 -= v22;
        if (!v16)
          goto LABEL_14;
        v17 = 0;
        v23 = *v10;
        if ((int)*v10 > 26)
        {
          switch(v23)
          {
            case 44:
              v26 = v31;
              if (v22 <= 0x17)
                v26 = 0;
              if ((v26 & 1) == 0)
                goto LABEL_14;
              goto LABEL_60;
            case 33:
              v27 = v31;
              if (v22 < 0x14)
                v27 = 1;
              if ((v27 & 1) != 0)
                goto LABEL_14;
              goto LABEL_60;
            case 27:
LABEL_43:
              if (v22 < 0x18)
                goto LABEL_14;
LABEL_60:
              v17 = v33(v32, (uint64_t)v10);
              break;
          }
        }
        else
        {
          switch(v23)
          {
            case 1:
              v24 = v22 >= 0x38;
              v25 = v31;
              break;
            case 12:
              goto LABEL_43;
            case 25:
              v24 = v22 >= 0x48;
              v25 = v31 ^ 1;
              break;
            default:
              goto LABEL_61;
          }
          if (!v24)
            v25 = 1;
          if ((v25 & 1) != 0)
            goto LABEL_14;
          if (!strcmp((const char *)v10 + 8, "__TEXT")
            || !strcmp((const char *)v10 + 8, "__CTF")
            || !strcmp((const char *)v10 + 8, "__OS_LOG"))
          {
            goto LABEL_60;
          }
          v17 = 0;
        }
LABEL_61:
        if (v17)
          v28 = 1;
        else
          v28 = v21 >= v18;
        v19 = v28;
        if (v20 >= 8)
        {
          v10 = (_DWORD *)((char *)v10 + v22);
          ++v21;
          if (!v19)
            continue;
        }
        break;
      }
    }
  }
  if (v19)
    v11 = v17;
  else
    v11 = 88;
  if (a4)
    goto LABEL_15;
LABEL_73:
  if (v11 != 89 && v11 || !*((_BYTE *)v55 + 24) || (v29 = v47[3]) == 0)
  {
    uuid_clear(uu);
LABEL_78:
    v29 = 0;
  }
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  return v29;
}

uint64_t ___os_trace_get_image_info_block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  int v4;
  _BYTE *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  _OWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _BYTE *v14;
  _BYTE *v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  BOOL v29;

  result = 0;
  v4 = *(_DWORD *)a2;
  if (*(int *)a2 > 26)
  {
    if (v4 == 44 || v4 == 33)
    {
      v14 = (_BYTE *)a1[9];
      if (!v14 || !*(_DWORD *)(a2 + 16))
        goto LABEL_58;
      goto LABEL_29;
    }
    if (v4 != 27)
      goto LABEL_59;
    v11 = (_OWORD *)a1[8];
    if (v11)
      *v11 = *(_OWORD *)(a2 + 8);
    v12 = a1[9];
    if (v12)
      *(_QWORD *)(v12 + 8) = a2 + 8;
    v13 = a1 + 5;
LABEL_26:
    v14 = (_BYTE *)(*(_QWORD *)(*v13 + 8) + 24);
LABEL_29:
    result = 0;
    *v14 = 1;
    goto LABEL_59;
  }
  switch(v4)
  {
    case 1:
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(unsigned int *)(a2 + 36);
      v15 = (_BYTE *)a1[9];
      if (v15)
      {
        if ((*(_BYTE *)(a2 + 52) & 8) != 0)
          *v15 = 1;
        v16 = *(unsigned int *)(a2 + 48);
        if (68 * (unint64_t)v16 + 56 <= *(unsigned int *)(a2 + 4))
        {
          if ((_DWORD)v16)
          {
            v26 = a1[4];
            v27 = a2 + 56;
            v28 = 1;
            do
            {
              result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v26 + 16))(v26, v27, *(unsigned int *)(v27 + 40), *(unsigned int *)(v27 + 36));
              if ((_DWORD)result)
                v29 = 1;
              else
                v29 = v28 >= v16;
              ++v28;
              v27 += 68;
            }
            while (!v29);
            break;
          }
          goto LABEL_58;
        }
LABEL_34:
        result = 88;
        break;
      }
LABEL_58:
      result = 0;
      break;
    case 12:
      v18 = *(_DWORD *)(a2 + 4);
      v17 = *(unsigned int *)(a2 + 8);
      if (v18 <= v17)
        return 88;
      if (v18 - v17 < 0x18 || a1[9] == 0)
        goto LABEL_58;
      v20 = (uint64_t *)(a2 + v17);
      v21 = *v20;
      v22 = v20[1];
      v23 = *(uint64_t *)((char *)v20 + 15);
      v24 = v21 == 0x6C2F687461707240 && v22 == 0x5F676E616C636269;
      if (!v24 || v23 != 0x6E6173612E74725FLL)
        goto LABEL_58;
      v13 = a1 + 7;
      goto LABEL_26;
    case 25:
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a2 + 48);
      v5 = (_BYTE *)a1[9];
      if (v5)
      {
        if ((*(_BYTE *)(a2 + 68) & 8) != 0)
          *v5 = 1;
        v6 = *(unsigned int *)(a2 + 64);
        if (80 * (unint64_t)v6 + 72 <= *(unsigned int *)(a2 + 4))
        {
          if ((_DWORD)v6)
          {
            v7 = a1[4];
            v8 = a2 + 72;
            v9 = 1;
            while (!HIDWORD(*(_QWORD *)(v8 + 40)))
            {
              result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, v8, *(unsigned int *)(v8 + 48));
              if ((_DWORD)result)
                v10 = 1;
              else
                v10 = v9 >= v6;
              ++v9;
              v8 += 80;
              if (v10)
                goto LABEL_59;
            }
            result = 34;
            break;
          }
          goto LABEL_58;
        }
        goto LABEL_34;
      }
      goto LABEL_58;
  }
LABEL_59:
  if (!a1[9] && *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
      return 89;
  }
  return result;
}

uint64_t ___os_trace_get_image_info_block_invoke(uint64_t a1, _QWORD *a2, int a3, int a4)
{
  uint64_t v4;
  const char *v5;
  _DWORD *v7;
  uint64_t v8;

  v4 = 0;
  v5 = "__cstring";
  do
  {
    if (*a2 == *(_QWORD *)v5 && a2[1] == *((_QWORD *)v5 + 1))
    {
      v8 = *(_QWORD *)(a1 + 40) + 8 * v4;
      *(_DWORD *)(v8 + 16) = a3;
      v7 = (_DWORD *)(v8 + 20);
      goto LABEL_10;
    }
    ++v4;
    v5 += 16;
  }
  while (v4 != 5);
  if (*a2 ^ 0x74736E6F635F5FLL | a2[1])
    return 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  v7 = (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 28);
LABEL_10:
  *v7 = a4;
  return 0;
}

void _os_trace_mh_map_insert_impl(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(unsigned __int16 *)(a4 + 10);
  v5 = (a2 >> *MEMORY[0x1E0C88818]) % v4;
  while (1)
  {
    v6 = a4 + 16 * v5;
    v7 = *(_QWORD *)(v6 + 16);
    if (!v7 || v7 == -1)
      break;
    if (v7 == a2)
      goto LABEL_11;
    if (v5 + 1 == v4)
      v5 = 0;
    else
      ++v5;
  }
  *(_QWORD *)(a4 + 16 * v5 + 24) = a3;
  atomic_store(a2, (unint64_t *)(v6 + 16));
  ++*(_WORD *)(a4 + 8);
LABEL_11:
  if (a1)
    _os_trace_rwptr_wrunlock(a1, (_QWORD *)a4);
}

void _os_trace_rwptr_wrunlock(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;

  v2 = *(_QWORD **)(a1 + 8);
  if (v2 != a2)
    *a2 = v2;
  atomic_store((unint64_t)a2, (unint64_t *)(a1 + 8));
  do
  {
    v3 = __ldxr((unint64_t *)a1);
    v4 = v3 | 0x100000000;
    if (v2 == a2)
      v4 = v3;
    v5 = v4 >> 33;
    v6 = v4 & ((int)(v4 >> 1) >> 31);
    v7 = v4 & 0xFFFFFFFF00000000;
    if (!v5)
      v7 = v6;
  }
  while (__stlxr(v7, (unint64_t *)a1));
  if ((_DWORD)v7)
  {
    _os_trace_rwptr_cleanup(a1);
  }
  else
  {
    v8 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    if (v8 != (_DWORD)v3)
      _os_trace_rwptr_wrunlock_slow(a1, v8, v3);
  }
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  if ((dword_1ECCEBAC8 & 0x20000000) != 0)
    return 1;
  else
    return (MEMORY[0xFFFFFC104] >> 29) & 1;
}

char *os_log_copy_message_string(uint64_t a1)
{
  char *v1;
  unsigned __int8 *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v9;
  _QWORD v10[3];
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C874D8];
  v1 = *(char **)(a1 + 88);
  v2 = *(unsigned __int8 **)(a1 + 96);
  if (!v2)
  {
    if (v1)
      return strdup(*(const char **)(a1 + 88));
LABEL_21:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_22;
  }
  v3 = *(_QWORD *)(a1 + 104);
  if (v3 >= 0x10000)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_20;
  }
  v4 = *(_QWORD *)(a1 + 120);
  if (v4 >= 0x10000)
  {
LABEL_20:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_21;
  }
  if ((unsigned __int16)*(_QWORD *)(a1 + 104))
  {
    if ((unsigned __int16)*(_QWORD *)(a1 + 104) == 1)
      goto LABEL_22;
    v5 = (uint64_t)(v2 + 2);
    LOWORD(v3) = v3 - 2;
    if (v2[1])
    {
      v6 = 0;
      while ((unsigned __int16)v3 >= 2u)
      {
        v7 = *(unsigned __int8 *)(v5 + 1) + 2;
        if (v7 > (unsigned __int16)v3)
          break;
        v5 += v7;
        LOWORD(v3) = v3 - v7;
        if (v2[1] <= (unsigned __int16)++v6)
          goto LABEL_15;
      }
LABEL_22:
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
  }
  else
  {
    v5 = 0;
    v2 = (unsigned __int8 *)&os_log_fmt_extract_pubdata_empty_hdr;
  }
LABEL_15:
  v10[2] = 0x10000;
  v10[0] = &v11;
  v10[1] = 0x40000000000;
  if ((*(_DWORD *)(a1 + 80) & 1) != 0)
    v9 = 4;
  else
    v9 = 8;
  os_log_fmt_compose((size_t)v10, v1, 2, 3u, v9, v2, v5, (unsigned __int16)v3, *(_QWORD *)(a1 + 112), v4);
  return (char *)os_trace_blob_detach((uint64_t)v10, 0);
}

void *os_trace_blob_detach(uint64_t a1, _QWORD *a2)
{
  __int16 v2;
  const void *v3;
  unsigned int v4;
  size_t v5;
  void *v6;
  void *v7;

  v2 = *(_WORD *)(a1 + 20);
  v3 = *(const void **)a1;
  *(_QWORD *)a1 = 3954044928;
  *(_WORD *)(a1 + 20) = 0;
  if (a2)
    *a2 = *(unsigned int *)(a1 + 8);
  if ((v2 & 1) == 0)
  {
    v4 = *(_DWORD *)(a1 + 8);
    if (*(_BYTE *)(a1 + 22))
      v5 = v4;
    else
      v5 = v4 + 1;
    while (1)
    {
      v6 = malloc_type_malloc(v5, 0x91D685AAuLL);
      if (v6)
        break;
      _os_trace_temporary_resource_shortage();
    }
    v7 = v6;
    memcpy(v6, v3, v5);
    return v7;
  }
  return (void *)v3;
}

void _os_log_with_args_impl(NSObject *a1, char a2, char *a3, _DWORD *a4, void (*a5)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6), void *a6)
{
  void (*v7)(uint64_t, uint64_t, uint64_t, void *, int, va_list);
  va_list v8;
  int v12;
  uint64_t v13;
  uint64_t v14;
  const mach_header_64 *first_non_jit_frame;
  uint64_t v16;
  uint8_t *v17;
  __int16 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  unint64_t size;
  void (*v25)(uint64_t, uint64_t, uint64_t, void *, int, va_list);
  _DWORD *v26;
  _WORD v27[433];
  uint64_t v28;

  v7 = a5;
  v8 = (va_list)a4;
  v28 = *MEMORY[0x1E0C874D8];
  v25 = a5;
  v26 = a4;
  v12 = *(unsigned __int16 *)__error();
  v13 = a2 & 0x7F;
  if (os_log_type_enabled(a1, (os_log_type_t)v13))
  {
    v14 = dyld_image_header_containing_address();
    if (v14)
    {
      first_non_jit_frame = (const mach_header_64 *)v14;
      if (a3 || !a6)
      {
        v16 = dyld_image_header_containing_address();
        if (v16)
        {
          if (first_non_jit_frame == (const mach_header_64 *)v16)
          {
            size = 0;
            v17 = getsegmentdata(first_non_jit_frame, "__TEXT", &size);
            if (v17)
            {
              if (v17 <= (uint8_t *)a3 && &a3[strlen(a3)] < (char *)&v17[size])
              {
                v23 = 0;
                v21 = 0u;
                v22 = 0u;
                v19 = 0u;
                v20 = 0u;
                v18 = 0;
                if (os_log_fmt_encode(a3, 3, v27, &v18, v26))
                {
                  *((_QWORD *)&v20 + 1) = first_non_jit_frame;
                  *(_QWORD *)&v21 = v7;
                  *((_QWORD *)&v21 + 1) = a3;
                  _os_log_impl_flatten_and_send((uint64_t)&v19);
                  return;
                }
                v8 = (va_list)v26;
              }
            }
          }
        }
      }
    }
    else
    {
      first_non_jit_frame = (const mach_header_64 *)os_log_with_args_find_first_non_jit_frame(&v25);
      v7 = v25;
    }
    *((_QWORD *)&v20 + 1) = first_non_jit_frame;
    *(_QWORD *)&v21 = v7;
    *((_QWORD *)&v21 + 1) = a3;
    _os_log_impl_dynamic((uint64_t)&v19, (uint64_t)a1, v13, a6, v12, v8);
  }
}

size_t os_log_fmt_encode(char *a1, uint64_t a2, _WORD *a3, _WORD *a4, _DWORD *a5)
{
  _WORD *v6;
  size_t result;
  char *v10;
  __int16 v11;
  int v12;
  int v13;
  unsigned int v14;
  size_t v15;
  unsigned int v16;
  unsigned int v17;
  size_t v18;
  unsigned int v19;
  _DWORD *v20;
  unsigned int v21;
  unsigned int v22;
  size_t v23;
  unsigned int v24;
  char *v25;
  _DWORD *v26;
  int v27;
  char v28;
  unsigned int v29;
  unsigned int v30;
  size_t v31;
  unsigned int v32;
  int v33;
  unsigned __int8 v34;
  int *v35;
  int v36;
  uint64_t *v37;
  char *v38;
  unsigned __int8 *v39;
  __int16 *v40;
  unsigned __int16 *v41;
  uint64_t v42;
  size_t v43;
  unsigned int v44;
  unsigned int v45;
  char *v46;
  uint64_t *v47;
  char v48;
  uint64_t *v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  uint64_t *p_src;
  __int16 v54;
  uint64_t __src;
  _WORD *v56;
  uint64_t v57;
  uint64_t v58;
  unsigned __int16 v59;
  _OWORD v60[3];
  __int128 v61;
  _DWORD *v62;

  v6 = a3;
  v62 = a5;
  v58 = 0x1000000000000;
  v56 = a3;
  v57 = 0x36200000000;
  memset(v60, 0, sizeof(v60));
  v61 = 0u;
  result = strnlen(a1, 0x801uLL);
  if (result >= 0x801)
  {
LABEL_2:
    if (a4)
      *a4 = 0;
    if ((v58 & 0x100000000) == 0)
      return 0;
    qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: Buffer needs free";
    __break(1u);
    goto LABEL_131;
  }
  *v6 = 0;
  LODWORD(v57) = 2;
  result = (size_t)strchr(a1, 37);
  if (!result)
  {
    v54 = 0;
    goto LABEL_126;
  }
  v10 = (char *)result;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v59 = 0;
  while (1)
  {
    result = (size_t)os_log_fmt_delimit(v10, a2, (uint64_t)v60);
    if (!result)
    {
      if (!v10[1])
        goto LABEL_125;
      v25 = v10 + 2;
      goto LABEL_105;
    }
    v14 = WORD4(v60[0]);
    if ((BYTE8(v60[0]) & 1) != 0)
      goto LABEL_2;
    if (v13 == 48)
      goto LABEL_125;
    v15 = result;
    if ((WORD4(v60[0]) & 0x800) != 0)
      break;
LABEL_22:
    if ((v14 & 2) == 0)
      goto LABEL_33;
    v59 = 1024;
    v20 = v62;
    v62 += 2;
    LODWORD(__src) = *v20;
    if ((v58 & 0x200000000) == 0)
    {
      if ((SBYTE6(v58) + HIDWORD(v57) - v57 - 1) > 1)
      {
        v21 = v59;
        *(_WORD *)((char *)v56 + v57) = v59;
        v22 = v57 + 2;
        LODWORD(v57) = v57 + 2;
        v23 = v21 >> 8;
        if (!BYTE6(v58))
          *((_BYTE *)v56 + v22) = 0;
        goto LABEL_27;
      }
      result = os_trace_blob_add_slow((uint64_t)&v56, &v59, 2uLL);
    }
    v23 = 4;
LABEL_27:
    if ((v58 & 0x200000000) == 0)
    {
      if (SBYTE6(v58) + HIDWORD(v57) - (int)v57 - 1 < v23)
      {
        result = os_trace_blob_add_slow((uint64_t)&v56, &__src, v23);
      }
      else
      {
        result = (size_t)memcpy((char *)v56 + v57, &__src, v23);
        v24 = v57 + v23;
        LODWORD(v57) = v57 + v23;
        if (!BYTE6(v58))
          *((_BYTE *)v56 + v24) = 0;
      }
    }
    if (++v13 == 48)
      goto LABEL_124;
    v14 = WORD4(v60[0]);
LABEL_33:
    if ((v14 & 4) != 0)
    {
      v26 = v62;
      v62 += 2;
      DWORD2(v60[1]) = *v26;
      if ((v14 & 8) == 0)
        goto LABEL_38;
    }
    else
    {
      if ((v14 & 0x10) != 0 || BYTE10(v60[0]) == 18)
      {
        v14 &= ~8u;
        WORD4(v60[0]) = v14;
      }
      if ((v14 & 8) == 0)
      {
LABEL_38:
        if ((v14 & 0x10) != 0)
          goto LABEL_65;
        goto LABEL_39;
      }
    }
    if ((v14 & 0x10) != 0 || BYTE10(v60[0]) == 18)
    {
      LOBYTE(v59) = 0;
    }
    else
    {
      if ((v14 & 4) != 0)
      {
        v28 = 16;
      }
      else
      {
        if ((v14 & 0x400) != 0)
        {
          LOBYTE(v27) = 5;
        }
        else if ((v14 & 0x200) != 0)
        {
          LOBYTE(v27) = 1;
        }
        else
        {
          v27 = (v14 >> 7) & 2;
        }
        v28 = v27 | 0x10;
      }
      LOBYTE(v59) = v28;
    }
    HIBYTE(v59) = 4;
    if ((v58 & 0x200000000) != 0)
      goto LABEL_118;
    if ((SBYTE6(v58) + HIDWORD(v57) - v57 - 1) <= 1)
    {
      result = os_trace_blob_add_slow((uint64_t)&v56, &v59, 2uLL);
LABEL_118:
      v31 = 4;
      goto LABEL_59;
    }
    v29 = v59;
    *(_WORD *)((char *)v56 + v57) = v59;
    v30 = v57 + 2;
    LODWORD(v57) = v57 + 2;
    v31 = v29 >> 8;
    if (!BYTE6(v58))
      *((_BYTE *)v56 + v30) = 0;
LABEL_59:
    if ((v58 & 0x200000000) == 0)
    {
      if (SBYTE6(v58) + HIDWORD(v57) - (int)v57 - 1 < v31)
      {
        result = os_trace_blob_add_slow((uint64_t)&v56, (char *)&v60[1] + 8, v31);
      }
      else
      {
        result = (size_t)memcpy((char *)v56 + v57, (char *)&v60[1] + 8, v31);
        v32 = v57 + v31;
        LODWORD(v57) = v57 + v31;
        if (!BYTE6(v58))
          *((_BYTE *)v56 + v32) = 0;
      }
    }
    if (++v13 == 48)
      goto LABEL_124;
    v14 = WORD4(v60[0]);
    if ((BYTE8(v60[0]) & 0x10) != 0)
    {
LABEL_65:
      LOBYTE(v59) = v59 & 0xF;
      goto LABEL_66;
    }
LABEL_39:
    v12 |= 2u;
LABEL_66:
    v12 |= (v14 & 0x600) != 0;
    v33 = (v14 >> 7) & 2;
    if ((v14 & 0x200) != 0)
      LOBYTE(v33) = 1;
    if ((v14 & 0x400) != 0)
      v34 = 5;
    else
      v34 = v33;
    LOBYTE(v59) = v59 & 0xF0 | v34;
    switch(BYTE10(v60[0]))
    {
      case 0:
        goto LABEL_132;
      case 1:
        v38 = (char *)v62;
        v62 += 2;
        v36 = *v38;
        goto LABEL_78;
      case 2:
        v39 = (unsigned __int8 *)v62;
        v62 += 2;
        v36 = *v39;
        goto LABEL_78;
      case 3:
        v40 = (__int16 *)v62;
        v62 += 2;
        v36 = *v40;
        goto LABEL_78;
      case 4:
        v41 = (unsigned __int16 *)v62;
        v62 += 2;
        v36 = *v41;
        goto LABEL_78;
      case 5:
      case 6:
      case 7:
        v35 = v62;
        v62 += 2;
        v36 = *v35;
LABEL_78:
        LODWORD(__src) = v36;
        HIBYTE(v59) = 4;
        if ((v58 & 0x200000000) != 0)
          goto LABEL_81;
        v42 = v57;
        if ((SBYTE6(v58) + HIDWORD(v57) - v57 - 1) > 1)
          goto LABEL_97;
        os_trace_blob_add_slow((uint64_t)&v56, &v59, 2uLL);
LABEL_81:
        v43 = 4;
        goto LABEL_99;
      case 8:
        v59 = v34 | 0x60;
        if ((v58 & 0x200000000) != 0)
          goto LABEL_121;
        if ((SBYTE6(v58) + HIDWORD(v57) - v57 - 1) <= 1)
        {
          os_trace_blob_add_slow((uint64_t)&v56, &v59, 2uLL);
LABEL_121:
          v43 = 0;
        }
        else
        {
          v44 = v59;
          *(_WORD *)((char *)v56 + v57) = v59;
          v45 = v57 + 2;
          LODWORD(v57) = v57 + 2;
          v43 = v44 >> 8;
          if (!BYTE6(v58))
            *((_BYTE *)v56 + v45) = 0;
        }
        v12 |= 2u;
        if ((v58 & 0x200000000) != 0)
          goto LABEL_104;
        if (SBYTE6(v58) + HIDWORD(v57) - (int)v57 - 1 >= v43)
        {
          v46 = (char *)v56 + v57;
          v47 = 0;
          goto LABEL_102;
        }
        p_src = 0;
        goto LABEL_108;
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
      case 0xD:
        goto LABEL_94;
      case 0xE:
      case 0xF:
        v37 = (uint64_t *)v62;
        v62 += 2;
        __src = *v37;
        goto LABEL_95;
      case 0x10:
        v48 = v34 | 0x20;
        goto LABEL_93;
      case 0x11:
        v48 = v34 | 0x50;
        goto LABEL_93;
      case 0x12:
        v48 = v34 | 0x40;
        goto LABEL_93;
      case 0x13:
        v48 = v34 | 0x30;
LABEL_93:
        LOBYTE(v59) = v48;
LABEL_94:
        v49 = (uint64_t *)v62;
        v62 += 2;
        __src = *v49;
LABEL_95:
        HIBYTE(v59) = 8;
        if ((v58 & 0x200000000) != 0)
          goto LABEL_110;
        v42 = v57;
        if ((SBYTE6(v58) + HIDWORD(v57) - v57 - 1) <= 1)
        {
          os_trace_blob_add_slow((uint64_t)&v56, &v59, 2uLL);
LABEL_110:
          v43 = 8;
        }
        else
        {
LABEL_97:
          v50 = v59;
          *(_WORD *)((char *)v56 + v42) = v59;
          v51 = v57 + 2;
          LODWORD(v57) = v57 + 2;
          v43 = v50 >> 8;
          if (!BYTE6(v58))
            *((_BYTE *)v56 + v51) = 0;
        }
LABEL_99:
        if ((v58 & 0x200000000) != 0)
          goto LABEL_104;
        if (SBYTE6(v58) + HIDWORD(v57) - (int)v57 - 1 < v43)
        {
          p_src = &__src;
LABEL_108:
          os_trace_blob_add_slow((uint64_t)&v56, p_src, v43);
        }
        else
        {
          v46 = (char *)v56 + v57;
          v47 = &__src;
LABEL_102:
          memcpy(v46, v47, v43);
          v52 = v57 + v43;
          LODWORD(v57) = v57 + v43;
          if (!BYTE6(v58))
            *((_BYTE *)v56 + v52) = 0;
        }
LABEL_104:
        v25 = &v10[v15];
        v11 = ++v13;
        break;
      default:
        goto LABEL_104;
    }
LABEL_105:
    result = (size_t)strchr(v25, 37);
    v10 = (char *)result;
    if (!result)
      goto LABEL_125;
  }
  v59 = 2160;
  if ((v58 & 0x200000000) != 0)
    goto LABEL_112;
  if ((SBYTE6(v58) + HIDWORD(v57) - v57 - 1) <= 1)
  {
    result = os_trace_blob_add_slow((uint64_t)&v56, &v59, 2uLL);
LABEL_112:
    v18 = 8;
    goto LABEL_16;
  }
  v16 = v59;
  *(_WORD *)((char *)v56 + v57) = v59;
  v17 = v57 + 2;
  LODWORD(v57) = v57 + 2;
  v18 = v16 >> 8;
  if (!BYTE6(v58))
    *((_BYTE *)v56 + v17) = 0;
LABEL_16:
  if ((v58 & 0x200000000) == 0)
  {
    if (SBYTE6(v58) + HIDWORD(v57) - (int)v57 - 1 < v18)
    {
      result = os_trace_blob_add_slow((uint64_t)&v56, (char *)&v61 + 8, v18);
    }
    else
    {
      result = (size_t)memcpy((char *)v56 + v57, (char *)&v61 + 8, v18);
      v19 = v57 + v18;
      LODWORD(v57) = v57 + v18;
      if (!BYTE6(v58))
        *((_BYTE *)v56 + v19) = 0;
    }
  }
  v12 |= 2u;
  if (++v13 != 48)
  {
    v14 = WORD4(v60[0]);
    goto LABEL_22;
  }
LABEL_124:
  v11 = 48;
LABEL_125:
  v54 = v12 | (unsigned __int16)(v11 << 8);
LABEL_126:
  *v6 = v54;
  if (a4)
    *a4 = v57;
  if ((v58 & 0x100000000) == 0)
    return (size_t)v6;
LABEL_131:
  qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: Buffer needs free";
  __break(1u);
LABEL_132:
  qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
  qword_1EE40C120 = 0;
  __break(1u);
  return result;
}

unint64_t os_log_fmt_compose(size_t a1, char *__s, uint64_t a3, unsigned int a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned __int16 a10)
{
  unsigned __int8 *v13;
  int v14;
  unint64_t result;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int8x8_t v26;
  char v27;
  uint64_t v28;
  unsigned __int8 *v29;
  unsigned int v30;
  int v31;
  char v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unsigned __int8 *v36;
  unsigned int v37;
  unsigned __int8 *v38;
  uint64_t v39;
  unsigned __int8 v40;
  uint64_t v41;
  unsigned int v42;
  _BOOL4 v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  unint64_t v48;
  uint64_t v49;
  int v50;
  __int16 v51;
  unsigned __int16 v52;
  unsigned __int8 *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned __int16 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  char __src[9];

  v13 = a6 + 2;
  v14 = a6[1];
  v69 = (unsigned __int16)a5;
  v70 = (*a6 >> 5) & 3;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  while (1)
  {
    result = strcspn(__s, "%");
    v16 = result;
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      v17 = *(unsigned int *)(a1 + 8);
      if (result > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v17 - 1))
      {
        result = os_trace_blob_add_slow(a1, __s, result);
      }
      else
      {
        result = (unint64_t)memcpy((void *)(*(_QWORD *)a1 + v17), __s, result);
        v18 = *(_DWORD *)(a1 + 8) + v16;
        *(_DWORD *)(a1 + 8) = v18;
        if (!*(_BYTE *)(a1 + 22))
          *(_BYTE *)(*(_QWORD *)a1 + v18) = 0;
      }
    }
    v19 = &__s[v16];
    if (!*v19)
      break;
    result = (unint64_t)os_log_fmt_delimit(v19, a3, (uint64_t)&v75);
    if (result)
    {
      v27 = BYTE8(v75);
      if ((BYTE8(v75) & 1) != 0)
        return _os_log_fmt_decode_give_up(a1, v75, WORD6(v75), v21, v22, v23, v24, v25);
      if ((BYTE8(v75) & 2) != 0)
      {
        if ((_WORD)v14)
        {
          --v14;
          v28 = v13[1];
          v29 = &v13[v28 + 2];
          if (v28 == 4 && ((v30 = *v13, v30 < 0x10) || (v30 & 0xF0) == 0x10))
            v31 = *(_DWORD *)(v13 + 2);
          else
            v31 = 0;
        }
        else
        {
          v31 = 0;
          v14 = 0;
          v29 = v13;
        }
        DWORD1(v76) = v31;
        v13 = v29;
      }
      if ((BYTE8(v75) & 8) == 0)
        goto LABEL_41;
      if ((BYTE8(v75) & 4) == 0 && ((BYTE8(v75) & 0x10) != 0 || BYTE10(v75) == 18))
      {
        if ((_WORD)v14)
        {
          if ((*v13 & 0xF0) == 0x10)
          {
            --v14;
            v13 += v13[1] + 2;
          }
        }
        else
        {
          v14 = 0;
        }
        v27 = BYTE8(v75) & 0xF7;
        WORD4(v75) &= ~8u;
        goto LABEL_41;
      }
      if (!(_WORD)v14)
      {
        v14 = 0;
        goto LABEL_34;
      }
      --v14;
      v35 = v13[1];
      v36 = &v13[v35 + 2];
      if (v35 != 4 || (v37 = *v13, v37 >= 0x10) && (v37 & 0xF0) != 0x10)
      {
        v13 = v36;
LABEL_34:
        DWORD2(v76) = -1;
LABEL_41:
        v36 = v13;
        goto LABEL_42;
      }
      DWORD2(v76) = *(_DWORD *)(v13 + 2);
LABEL_42:
      __s = &v19[result];
      if (!(_WORD)v14)
      {
        v14 = 0;
        v13 = v36;
        goto LABEL_106;
      }
      --v14;
      v38 = v36 + 2;
      v39 = v36[1];
      v13 = &v36[v39 + 2];
      v40 = *v36;
      if ((*v36 & 0xF0) == 0xE0)
      {
        v56 = 10;
        if (*((uint64_t *)&v78 + 1) > 0x656D616E6C69616CLL)
        {
          if (*((uint64_t *)&v78 + 1) > 0x6F6363616C69616CLL)
          {
            if (*((_QWORD *)&v78 + 1) != 0x6F6363616C69616DLL && *((_QWORD *)&v78 + 1) != 0x7075626D6C69616DLL)
            {
              v59 = 0x726464616C69616DLL;
              goto LABEL_145;
            }
          }
          else if (*((_QWORD *)&v78 + 1) != 0x656D616E6C69616DLL && *((_QWORD *)&v78 + 1) != 0x6A6275736C69616DLL)
          {
            v59 = 0x6D6D75736C69616DLL;
            goto LABEL_145;
          }
LABEL_146:
          v56 = 8;
          goto LABEL_147;
        }
        if (*((uint64_t *)&v78 + 1) > 0x786F626C69616CLL)
        {
          if (*((_QWORD *)&v78 + 1) != 0x786F626C69616DLL && *((_QWORD *)&v78 + 1) != 0x35646D6E69616C70)
          {
            v59 = 0x617474616C69616DLL;
            goto LABEL_145;
          }
          goto LABEL_146;
        }
        if (*((_QWORD *)&v78 + 1))
        {
          if (*((_QWORD *)&v78 + 1) != 1752392040)
          {
            v59 = 0x68736168766564;
LABEL_145:
            if (*((_QWORD *)&v78 + 1) != v59)
              goto LABEL_147;
          }
          goto LABEL_146;
        }
LABEL_159:
        v48 = 0;
        goto LABEL_160;
      }
      v41 = a7;
      v42 = a8;
      if ((*v36 & 1) == 0)
        goto LABEL_45;
      if (((0xD8uLL >> (v40 & 7)) & 1) != 0)
        goto LABEL_159;
      v44 = privacy_flags2opt[v40 & 7];
      if (v44 <= a4)
      {
        if (v70 - 1 > 2)
        {
          if (a9)
          {
            v43 = 0;
            v42 = a10;
            v41 = a9;
            goto LABEL_61;
          }
          goto LABEL_50;
        }
        v41 = a9;
        v42 = a10;
        if ((v40 & 0xF0) != 0x80)
        {
          v41 = a9;
          v42 = a10;
          if (v44 > v70)
            goto LABEL_50;
        }
LABEL_45:
        v43 = v41 == 0;
        if (v41 || !v42)
        {
LABEL_61:
          if ((*v36 & 0xF1) == 0)
          {
            LODWORD(v55) = v39 == 0;
            v48 = v36[1];
            goto LABEL_84;
          }
          v48 = 0;
          if ((*v36 & 0xE1) != 0 && (_DWORD)v39 == 4)
          {
            v49 = *(unsigned __int16 *)v38;
            if (v49 > v42)
              goto LABEL_96;
            v50 = v42 - v49;
            v51 = *((_WORD *)v36 + 2);
            v52 = v51 & 0x7FFF;
            if (v50 < (v51 & 0x7FFF))
              goto LABEL_96;
            if (*v36 <= 0xFu && v51 < 0)
            {
LABEL_106:
              _os_log_fmt_decode_error(a1);
            }
            else
            {
              result = v51 < 0;
              v53 = (unsigned __int8 *)(v41 + v49);
              if (v43)
                v38 = 0;
              else
                v38 = v53;
              v54 = v50 >= 0x8000;
              if (((((unsigned __int16)v14 | v52) == 0) & result) != 0)
                v48 = (v54 << 15);
              else
                v48 = v51 & 0x7FFF;
              if (((((unsigned __int16)v14 | v52) == 0) & result & v54) != 0)
                v55 = 0;
              else
                v55 = (v51 >> 15) & 1;
              if (*v36 < 0xF0u)
              {
LABEL_84:
                if ((_DWORD)v55 && *v36 < 0x10u)
                  goto LABEL_106;
                if ((v40 & 0xF0) == 0x10)
                  goto LABEL_160;
                if (*v36 < 0x10u != (v27 & 0x10) >> 4)
                  goto LABEL_160;
                if ((v27 & 0x10) != 0)
                {
                  v26.i32[0] = v48;
                  if (vaddlv_u8((uint8x8_t)vcnt_s8(v26)) != 1)
                    goto LABEL_160;
                }
                switch(BYTE10(v75))
                {
                  case 1:
                  case 2:
                  case 3:
                  case 4:
                  case 5:
                  case 6:
                  case 7:
                  case 8:
                    v58 = v48;
                    if (v48 >= 5)
                      goto LABEL_160;
                    goto LABEL_92;
                  case 9:
                  case 0xA:
                    v58 = v48;
                    if (v69 < v48)
                      goto LABEL_160;
                    goto LABEL_92;
                  case 0xB:
                  case 0xC:
                    v58 = v48;
                    if (v48 >= 9)
                      goto LABEL_160;
                    goto LABEL_92;
                  case 0xD:
                    v58 = a5;
                    if ((_DWORD)v48 != (unsigned __int16)a5)
                      goto LABEL_160;
                    goto LABEL_92;
                  case 0xE:
                  case 0xF:
                    if ((_DWORD)v48 != 8)
                      goto LABEL_160;
                    v58 = 8;
                    goto LABEL_92;
                  case 0x10:
                    v58 = v48;
                    if ((v40 & 0xF0) != 0x20)
                      goto LABEL_160;
                    goto LABEL_92;
                  case 0x11:
                    v58 = v48;
                    if ((v40 & 0xF0) != 0x50)
                      goto LABEL_160;
                    goto LABEL_92;
                  case 0x12:
                    v64 = (v40 >> 4) - 2;
                    if (v64 < 7)
                      __asm { BR              X10 }
                    goto LABEL_160;
                  case 0x13:
                    v58 = v48;
                    if ((v40 & 0xF0) != 0x30)
                      goto LABEL_160;
LABEL_92:
                    if ((v27 & 0x40) == 0)
                      goto LABEL_102;
                    if (v27 < 0)
                    {
                      if ((_os_log_fmt_builtin_annotated(a1, a5, (uint64_t)&v75, (uint64_t)v36, (uint64_t)v38, v58, v55) & 1) != 0)
                        continue;
                    }
                    else if ((_os_log_fmt_plugin_annotated(a1, a5, (uint64_t)&v75, (char *)v36, v38, v58, v55) & 1) != 0)
                    {
                      continue;
                    }
LABEL_102:
                    if ((BYTE8(v75) & 0x10) != 0)
                      _os_log_fmt_compose_scalar(a1, (uint64_t)&v75, a5, v38, v58);
                    else
                      _os_log_fmt_compose_data(a1, (uint64_t)&v75, v36, (const char *)v38, v58, v55);
                    break;
                  default:
                    qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
                    qword_1EE40C120 = BYTE10(v75);
                    __break(1u);
                    return result;
                }
              }
              else
              {
                v56 = 9;
                if (*((uint64_t *)&v78 + 1) <= 0x656D616E6C69616CLL)
                {
                  if (*((uint64_t *)&v78 + 1) > 0x786F626C69616CLL)
                  {
                    if (*((_QWORD *)&v78 + 1) == 0x786F626C69616DLL)
                      goto LABEL_116;
                    if (*((_QWORD *)&v78 + 1) != 0x35646D6E69616C70)
                    {
                      v57 = 0x617474616C69616DLL;
                      goto LABEL_115;
                    }
                    goto LABEL_129;
                  }
                  if (*((_QWORD *)&v78 + 1) != 1752392040 && *((_QWORD *)&v78 + 1) != 0x68736168766564)
                  {
                    if (*((_QWORD *)&v78 + 1))
                      goto LABEL_147;
                    goto LABEL_159;
                  }
LABEL_129:
                  os_trace_blob_addf(a1, "<mask.%.*s: ", v20, 9, v22, v23, v24, v25, SBYTE2(v76));
                  if ((_DWORD)v48 || (_DWORD)v55)
                  {
                    os_trace_blob_add_hexdump(a1, (uint64_t)v38, v48, v55);
                  }
                  else if ((*(_WORD *)(a1 + 20) & 2) == 0)
                  {
                    v60 = *(unsigned int *)(a1 + 8);
                    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v60 - 1) <= 5)
                    {
                      os_trace_blob_add_slow(a1, "(null)", 6uLL);
                    }
                    else
                    {
                      v61 = *(_QWORD *)a1 + v60;
                      *(_WORD *)(v61 + 4) = 10604;
                      *(_DWORD *)v61 = 1819635240;
                      v62 = *(_DWORD *)(a1 + 8) + 6;
                      *(_DWORD *)(a1 + 8) = v62;
                      if (!*(_BYTE *)(a1 + 22))
                        *(_BYTE *)(*(_QWORD *)a1 + v62) = 0;
                    }
                  }
                  if ((*(_WORD *)(a1 + 20) & 2) == 0)
                  {
                    v63 = *(unsigned int *)(a1 + 8);
                    if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 != (_DWORD)v63)
                    {
                      *(_BYTE *)(*(_QWORD *)a1 + v63) = 62;
                      v47 = *(_DWORD *)(a1 + 8) + 1;
                      goto LABEL_53;
                    }
                    os_trace_blob_add_slow(a1, ">", 1uLL);
                  }
                }
                else if (*((uint64_t *)&v78 + 1) > 0x6F6363616C69616CLL)
                {
                  if (*((_QWORD *)&v78 + 1) == 0x6F6363616C69616DLL)
                    goto LABEL_116;
                  if (*((_QWORD *)&v78 + 1) == 0x7075626D6C69616DLL)
                    goto LABEL_129;
                  v57 = 0x726464616C69616DLL;
LABEL_115:
                  if (*((_QWORD *)&v78 + 1) == v57)
                    goto LABEL_116;
LABEL_147:
                  _os_log_fmt_decode_masked_unknown(a1, SBYTE2(v76), v78, v56, v22, v23, v24, v25);
                }
                else
                {
                  if (*((_QWORD *)&v78 + 1) != 0x656D616E6C69616DLL && *((_QWORD *)&v78 + 1) != 0x6A6275736C69616DLL)
                  {
                    v57 = 0x6D6D75736C69616DLL;
                    goto LABEL_115;
                  }
LABEL_116:
                  _os_log_fmt_compose_masked_partial_redacted(a1, v38, v48, v55, v22, v23, v24, v25);
                }
              }
            }
          }
          else
          {
LABEL_160:
            _os_log_fmt_decode_cmd_mismatch(a1, v75, WORD6(v75), v36, v48, v23, v24, v25);
          }
        }
        else
        {
LABEL_96:
          _os_log_fmt_decode_bad_range(a1, v75, WORD6(v75), *((unsigned __int16 *)v36 + 1), *((unsigned __int16 *)v36 + 2), 0, v24, v25);
        }
      }
      else
      {
LABEL_50:
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          v45 = *(unsigned int *)(a1 + 8);
          if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v45 - 1) <= 8)
          {
            os_trace_blob_add_slow(a1, "<private>", 9uLL);
          }
          else
          {
            v46 = *(_QWORD *)a1 + v45;
            *(_QWORD *)v46 = *(_QWORD *)"<private>";
            *(_BYTE *)(v46 + 8) = 62;
            v47 = *(_DWORD *)(a1 + 8) + 9;
LABEL_53:
            *(_DWORD *)(a1 + 8) = v47;
            if (!*(_BYTE *)(a1 + 22))
              *(_BYTE *)(*(_QWORD *)a1 + v47) = 0;
          }
        }
      }
    }
    else
    {
      v32 = v19[1];
      if (!v32)
        break;
      __src[0] = v19[1];
      if ((*(_BYTE *)(a1 + 20) & 2) == 0)
      {
        v33 = *(unsigned int *)(a1 + 8);
        if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v33)
        {
          os_trace_blob_add_slow(a1, __src, 1uLL);
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)a1 + v33) = v32;
          v34 = *(_DWORD *)(a1 + 8) + 1;
          *(_DWORD *)(a1 + 8) = v34;
          if (!*(_BYTE *)(a1 + 22))
            *(_BYTE *)(*(_QWORD *)a1 + v34) = 0;
        }
      }
      __s = v19 + 2;
    }
  }
  v65 = *(unsigned int *)(a1 + 8) - 1;
  v66 = MEMORY[0x1E0C87458];
  while (v65 != -1)
  {
    v67 = *(char *)(*(_QWORD *)a1 + v65);
    if ((v67 & 0x80000000) != 0)
      result = __maskrune(v67, 0x4000uLL);
    else
      result = *(_DWORD *)(v66 + 4 * v67 + 60) & 0x4000;
    --v65;
    if (!(_DWORD)result)
    {
      v68 = v65 + 2;
      goto LABEL_174;
    }
  }
  v68 = 0;
LABEL_174:
  *(_DWORD *)(a1 + 8) = v68;
  if (!*(_BYTE *)(a1 + 22))
    *(_BYTE *)(*(_QWORD *)a1 + v68) = 0;
  return result;
}

char *os_log_fmt_delimit(char *a1, uint64_t a2, uint64_t a3)
{
  char *result;
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  unsigned int v10;
  char *v11;
  size_t v12;
  int v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  char *v32;
  char v33;
  int v34;
  char *v35;
  char v36;
  int v37;
  int v38;
  char v39;
  char v40;
  char v41;
  __int16 v42;
  char *v43;

  v6 = *a1;
  result = a1 + 1;
  v5 = v6;
  if (v6 == 37)
  {
    *(_QWORD *)(a3 + 56) = 0;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_QWORD *)a3 = a1;
    if (a1[1] != 123)
    {
      v10 = 0;
LABEL_50:
      v23 = 0;
      while (1)
      {
        while (1)
        {
          v25 = *result++;
          v24 = v25;
LABEL_52:
          if ((v24 - 49) >= 9)
            break;
          do
          {
            v26 = *result++;
            v24 = v26;
          }
          while ((v26 - 48) < 0xA);
          if (v24 != 36)
            goto LABEL_52;
          v10 |= 1u;
          *(_WORD *)(a3 + 8) = v10;
        }
        switch(v24)
        {
          case ' ':
          case '#':
          case '\'':
          case '+':
          case '-':
          case '0':
            continue;
          case '*':
            if ((v10 & 8) != 0)
            {
              v10 |= 1u;
              *(_WORD *)(a3 + 8) = v10;
            }
            v32 = result;
            do
            {
              v34 = *v32++;
              v33 = v34;
            }
            while ((v34 - 48) < 0xA);
            if (v33 == 36)
              v10 |= 1u;
            else
              v10 |= (v10 >> 1) & 1 | 2;
            if (v33 == 36)
              result = v32;
            *(_WORD *)(a3 + 8) = v10;
            continue;
          case '.':
            v27 = *result++;
            v24 = v27;
            if (v27 != 42)
            {
              *(_DWORD *)(a3 + 24) = 0;
              v28 = v24 - 48;
              if ((v24 - 48) <= 9)
              {
                v29 = 0;
                do
                {
                  v29 = v28 + 10 * v29;
                  *(_DWORD *)(a3 + 24) = v29;
                  v30 = *result++;
                  v24 = v30;
                  v28 = v30 - 48;
                }
                while ((v30 - 48) < 0xA);
              }
              v31 = (v10 >> 3) & 1 | v10;
              v10 = v31 | 8;
              *(_WORD *)(a3 + 8) = v31 | 8;
              goto LABEL_52;
            }
            v35 = result;
            do
            {
              v37 = *v35++;
              v36 = v37;
            }
            while ((v37 - 48) < 0xA);
            if (v36 == 36)
            {
              v10 |= 1u;
              *(_WORD *)(a3 + 8) = v10;
              result = v35;
            }
            else
            {
              v38 = v10 | ((v10 & 0xC) != 0);
              v10 = v38 | 0xC;
              *(_WORD *)(a3 + 8) = v38 | 0xC;
            }
            break;
          case '@':
            v40 = 18;
            goto LABEL_130;
          case 'A':
          case 'E':
          case 'F':
          case 'G':
          case 'a':
          case 'e':
          case 'f':
          case 'g':
            if ((v23 & 8) != 0)
              v39 = 15;
            else
              v39 = 14;
            goto LABEL_132;
          case 'C':
            LOBYTE(v23) = 16;
            goto LABEL_107;
          case 'D':
            LOWORD(v23) = v23 | 0x10;
            goto LABEL_111;
          case 'L':
            v23 |= 8u;
            continue;
          case 'O':
          case 'U':
            LOWORD(v23) = v23 | 0x10;
            goto LABEL_92;
          case 'P':
            if (a2 != 2)
              return 0;
            if ((v10 & 8) == 0)
              *(_WORD *)(a3 + 8) = v10 | 1;
            v40 = 19;
            goto LABEL_130;
          case 'S':
            LOBYTE(v23) = 16;
            goto LABEL_127;
          case 'X':
          case 'o':
          case 'u':
          case 'x':
LABEL_92:
            if ((v23 & 0x1000) != 0)
              goto LABEL_103;
            if ((v23 & 0xC00) != 0)
              goto LABEL_94;
            if ((v23 & 0x20) != 0)
            {
LABEL_103:
              v40 = 12;
            }
            else if ((v23 & 0x10) != 0)
            {
LABEL_94:
              v40 = 10;
            }
            else
            {
              if ((v23 & 0x2000) != 0)
                v41 = 2;
              else
                v41 = 6;
              if ((v23 & 0x40) != 0)
                v40 = 4;
              else
                v40 = v41;
            }
            *(_WORD *)(a3 + 8) = v10 | 0x30;
LABEL_130:
            *(_BYTE *)(a3 + 10) = v40;
            goto LABEL_134;
          case 'c':
LABEL_107:
            if ((v23 & 0x10) != 0)
              v39 = 7;
            else
              v39 = 5;
            goto LABEL_132;
          case 'd':
          case 'i':
LABEL_111:
            if ((v23 & 0x1000) != 0)
              goto LABEL_119;
            if ((v23 & 0x400) != 0 || (v23 & 0x800) != 0)
              goto LABEL_120;
            if ((v23 & 0x20) != 0)
            {
LABEL_119:
              v39 = 11;
            }
            else if ((v23 & 0x10) != 0)
            {
LABEL_120:
              v39 = 9;
            }
            else if ((v23 & 0x40) != 0)
            {
              v39 = 3;
            }
            else if ((v23 & 0x2000) != 0)
            {
              v39 = 1;
            }
            else
            {
              v39 = 5;
            }
LABEL_132:
            *(_BYTE *)(a3 + 10) = v39;
            v42 = v10 | 0x10;
LABEL_133:
            *(_WORD *)(a3 + 8) = v42;
LABEL_134:
            *(_WORD *)(a3 + 12) = (_WORD)result - (_WORD)a1;
            return (char *)(unsigned __int16)((_WORD)result - (_WORD)a1);
          case 'h':
            if ((v23 & 0x40) != 0)
              v23 = v23 & 0xFFFFDFBF | 0x2000;
            else
              v23 |= 0x40u;
            continue;
          case 'j':
            v23 |= 0x1000u;
            continue;
          case 'l':
            if ((v23 & 0x10) != 0)
              v23 = v23 & 0xFFFFFFCF | 0x20;
            else
              v23 |= 0x10u;
            continue;
          case 'm':
            v39 = 8;
            goto LABEL_132;
          case 'n':
            v42 = v10 | 1;
            goto LABEL_133;
          case 'p':
            *(_BYTE *)(a3 + 10) = 13;
            v42 = v10 | 0x30;
            goto LABEL_133;
          case 'q':
            v23 |= 0x20u;
            continue;
          case 's':
LABEL_127:
            if ((v23 & 0x10) != 0)
              v40 = 17;
            else
              v40 = 16;
            goto LABEL_130;
          case 't':
            v23 |= 0x800u;
            continue;
          case 'z':
            v23 |= 0x400u;
            continue;
          default:
            return 0;
        }
      }
    }
    if (a2 == 2)
    {
      result = strchr(result, 125);
      if (result)
      {
        v9 = a1 + 2;
        if (a1[2] == 125)
        {
          v10 = 0;
LABEL_49:
          ++result;
          goto LABEL_50;
        }
        v43 = result;
        v10 = 0;
        do
        {
          v11 = (char *)&v9[strspn(v9, ", ")];
          v12 = strcspn(v11, ",}");
          switch(v12)
          {
            case 0uLL:
              result = v43;
              goto LABEL_49;
            case 6uLL:
              if (*(_DWORD *)v11 != 1818391920 || *((_WORD *)v11 + 2) != 25449)
                goto LABEL_26;
              v10 |= 0x100u;
              goto LABEL_38;
            case 7uLL:
              if (*(_DWORD *)v11 != 1986622064 || *(_DWORD *)(v11 + 3) != 1702125942)
                goto LABEL_26;
              v10 |= 0x200u;
              goto LABEL_38;
            case 9uLL:
              if (*(_QWORD *)v11 != 0x76697469736E6573 || v11[8] != 101)
                goto LABEL_26;
              v10 |= 0x400u;
LABEL_38:
              *(_WORD *)(a3 + 8) = v10;
              break;
            default:
LABEL_26:
              if (!memchr(v11, 61, v12))
              {
                if (!strncmp(v11, "mask.", 5uLL))
                {
                  if (v12 - 6 <= 7)
                  {
                    v18 = 0;
                    v19 = 0;
                    v10 |= 0x800u;
                    *(_WORD *)(a3 + 8) = v10;
                    v20 = v11 + 5;
                    *(_QWORD *)(a3 + 48) = v11 + 5;
                    *(_WORD *)(a3 + 18) = v12 - 5;
                    do
                    {
                      v21 = *v20++;
                      v19 |= v21 << v18;
                      v18 += 8;
                    }
                    while (8 * (unsigned __int16)(v12 - 5) != v18);
                    *(_QWORD *)(a3 + 56) = v19;
                  }
                }
                else
                {
                  v16 = v10 | 0x40;
                  *(_WORD *)(a3 + 8) = v10 | 0x40;
                  if (!strncmp(v11, "builtin:", 8uLL))
                  {
                    v10 |= 0xC0u;
                    *(_WORD *)(a3 + 8) = v10;
                    *(_WORD *)(a3 + 14) = 7;
                    *(_QWORD *)(a3 + 32) = "builtin";
                    *(_QWORD *)(a3 + 40) = v11 + 8;
                    *(_WORD *)(a3 + 16) = v12 - 8;
                  }
                  else
                  {
                    v17 = (char *)memchr(v11, 58, v12);
                    if (v17)
                    {
                      if ((v10 & 0x80) != 0)
                      {
                        v16 ^= 0x80u;
                        *(_WORD *)(a3 + 8) = v16;
                      }
                      *(_WORD *)(a3 + 14) = (_WORD)v17 - (_WORD)v11;
                      *(_QWORD *)(a3 + 32) = v11;
                      *(_QWORD *)(a3 + 40) = v17 + 1;
                      *(_WORD *)(a3 + 16) = (_WORD)v11 + v12 - ((_WORD)v17 + 1);
                      v10 = v16;
                    }
                    else
                    {
                      v10 |= 0xC0u;
                      *(_WORD *)(a3 + 8) = v10;
                      *(_WORD *)(a3 + 14) = 7;
                      *(_QWORD *)(a3 + 32) = "builtin";
                      *(_QWORD *)(a3 + 40) = v11;
                      *(_WORD *)(a3 + 16) = v12;
                    }
                  }
                }
              }
              break;
          }
          v9 = &v11[v12];
        }
        while (*v9 != 125);
        if ((v10 & 0x400) != 0)
        {
          v22 = 64767;
          result = v43;
        }
        else
        {
          result = v43;
          if ((v10 & 0x200) == 0)
            goto LABEL_49;
          v22 = 65279;
        }
        v10 &= v22;
        *(_WORD *)(a3 + 8) = v10;
        goto LABEL_49;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: Should start with '%'";
    qword_1EE40C120 = v5;
    __break(1u);
  }
  return result;
}

_DWORD *_os_log_fmt_compose_data(unint64_t a1, uint64_t a2, _BYTE *a3, const char *a4, unsigned int a5, int a6)
{
  uint64_t v12;
  char *v13;
  void **v14;
  _DWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int16 v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C874D8];
  MEMORY[0x1E0C86820](a1);
  v13 = (char *)&v28 - v12;
  result = (_DWORD *)_os_log_fmt_compose_format_copy((_BYTE *)&v28 - v12, *v14, *(_WORD *)(a2 + 12));
  if ((*a3 & 0xF0) == 0x30)
    return (_DWORD *)os_trace_blob_add_hexdump(a1, (uint64_t)a4, a5, a6);
  if (*(_BYTE *)(a2 + 10) == 18)
    v13[result - 1] = 115;
  v22 = *(_WORD *)(a2 + 8);
  if ((v22 & 2) == 0)
  {
    v23 = 0;
    if (a5)
      goto LABEL_7;
LABEL_10:
    if (a6)
      a4 = (const char *)&unk_19BC05A6E;
    else
      a4 = "(null)";
    if ((v22 & 4) != 0)
    {
      v24 = v23 + 1;
      *(&v28 + v23) = 0x7FFFFFFF;
    }
    else
    {
      v24 = v23;
    }
    goto LABEL_21;
  }
  v28 = *(_DWORD *)(a2 + 20);
  v23 = 1;
  if (!a5)
    goto LABEL_10;
LABEL_7:
  if ((v22 & 8) != 0)
  {
    v24 = v23 + 1;
    v25 = v23;
    if ((v22 & 4) != 0)
    {
      v26 = *(_DWORD *)(a2 + 24);
      if (v26 <= a5)
      {
        *(&v28 + v25) = v26;
        goto LABEL_21;
      }
    }
    else
    {
      result = strrchr(v13, 46);
      *result = 7547438;
    }
    *(&v28 + v25) = a5;
  }
  else
  {
    *(_DWORD *)&v13[result - 1] = 7547438;
    v24 = v23 + 1;
    *(&v28 + v23) = a5;
  }
LABEL_21:
  switch(v24)
  {
    case 2u:
      result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, v28);
      break;
    case 1u:
      HIBYTE(v27) = HIBYTE(a4);
      result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, v28);
      break;
    case 0u:
      result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, (char)a4);
      break;
  }
  if (a6)
    return (_DWORD *)os_trace_blob_addns(a1, "<…>", 0xFFFFFFFFFFFFFFFFLL, 0);
  return result;
}

unint64_t _os_log_fmt_compose_scalar(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, int a5)
{
  uint64_t scalar;
  uint64_t v9;
  __int16 v10;
  unsigned int v11;
  uint64_t v12;
  const char *v13;
  unint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  char *v26;
  int v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C874D8];
  scalar = os_log_fmt_read_scalar(a2, a4, a5);
  v9 = scalar;
  v10 = *(_WORD *)(a2 + 8);
  if ((v10 & 2) == 0)
  {
    v11 = 0;
    if ((v10 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v32 = *(_DWORD *)(a2 + 20);
  v11 = 1;
  if ((v10 & 4) != 0)
LABEL_5:
    *(&v32 + v11++) = *(_DWORD *)(a2 + 24);
LABEL_6:
  MEMORY[0x1E0C86820](scalar);
  v13 = (char *)&v32 - v12;
  result = _os_log_fmt_compose_format_copy((_BYTE *)&v32 - v12, *(void **)a2, *(_WORD *)(a2 + 12));
  v21 = *(unsigned __int8 *)(a2 + 10);
  switch(*(_BYTE *)(a2 + 10))
  {
    case 0:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
      qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
      qword_1EE40C120 = v21;
      __break(1u);
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      goto LABEL_7;
    case 8:
      v26 = strerror(v9);
      result = strlen(v26);
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        v27 = result;
        v28 = *(unsigned int *)(a1 + 8);
        if (result > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v28 - 1))
        {
          return os_trace_blob_add_slow(a1, v26, result);
        }
        else
        {
          result = (unint64_t)memcpy((void *)(*(_QWORD *)a1 + v28), v26, result);
          v29 = *(_DWORD *)(a1 + 8) + v27;
          *(_DWORD *)(a1 + 8) = v29;
          if (!*(_BYTE *)(a1 + 22))
            *(_BYTE *)(*(_QWORD *)a1 + v29) = 0;
        }
      }
      return result;
    case 9:
    case 0xA:
    case 0xD:
      if (a3 == 8 || (_DWORD)v21 == 13)
        goto LABEL_34;
      v22 = result;
      v23 = result;
      v24 = result - 1;
      v25 = v13[v24];
      if (a3 == 4)
      {
        if ((v25 & 0x80000000) != 0)
          result = __maskrune(v13[v24], 0x8000uLL);
        else
          result = *(_DWORD *)(MEMORY[0x1E0C87458] + 4 * v25 + 60) & 0x8000;
        if ((_DWORD)result)
          result = __tolower(v25);
        else
          v13[v22 - 2] = v25;
        v13[v24] = result;
LABEL_7:
        if (v11 != 2)
        {
          if (v11 != 1)
          {
            if (v11)
              return result;
            return os_trace_blob_addf(a1, v13, v15, v16, v17, v18, v19, v20, v9);
          }
LABEL_38:
          HIWORD(v31) = HIWORD(v9);
          return os_trace_blob_addf(a1, v13, v15, v16, v17, v18, v19, v20, v32);
        }
      }
      else
      {
        if ((v25 & 0x80000000) != 0)
          result = __maskrune(v13[v24], 0x8000uLL);
        else
          result = *(_DWORD *)(MEMORY[0x1E0C87458] + 4 * v25 + 60) & 0x8000;
        if ((_DWORD)result)
        {
          v13[v22] = 108;
          result = __tolower(v25);
          LOBYTE(v25) = result;
          v23 = v22 + 1;
          v30 = 2;
        }
        else
        {
          v13[v22 - 2] = 108;
          v30 = 1;
        }
        v13[v24] = 108;
        v13[v23] = v25;
        v13[v30 + (unint64_t)v22] = 0;
LABEL_34:
        if (v11 != 2)
        {
          if (v11 != 1)
          {
            if (v11)
              return result;
            return os_trace_blob_addf(a1, v13, v15, v16, v17, v18, v19, v20, v9);
          }
          goto LABEL_38;
        }
      }
      return os_trace_blob_addf(a1, v13, v15, v16, v17, v18, v19, v20, v32);
    case 0xB:
    case 0xC:
    case 0xE:
    case 0xF:
      goto LABEL_34;
    default:
      return result;
  }
}

uint64_t os_trace_blob_addf(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return os_trace_blob_vaddf(a1, a2, 0, &a9);
}

uint64_t os_trace_blob_vaddf(uint64_t a1, const char *a2, int a3, va_list a4)
{
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (*(_BYTE *)(a1 + 22))
  {
    qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
    return 0;
  }
  if ((*(_WORD *)(a1 + 20) & 2) != 0)
    return 0;
  v8 = *(_DWORD *)(a1 + 8);
  v7 = *(_DWORD *)(a1 + 12);
  *__error() = a3;
  v9 = vsnprintf((char *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)), (v7 - v8), a2, a4);
  if ((v9 & 0x80000000) != 0)
  {
    v10 = 0;
    *(_BYTE *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)) = 0;
  }
  else
  {
    v10 = v9;
    v11 = (v7 + ~v8);
    if (v9 > v11)
    {
      if (*(_DWORD *)(a1 + 12) < *(_DWORD *)(a1 + 16))
      {
        v11 = os_trace_blob_grow(a1, v9);
        *__error() = a3;
        vsnprintf((char *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)), (v11 + 1), a2, a4);
      }
      if (v10 > v11)
      {
        *(_WORD *)(a1 + 20) |= 2u;
        v10 = v11;
      }
    }
    *(_DWORD *)(a1 + 8) += v10;
  }
  return v10;
}

uint64_t _os_log_fmt_compose_format_copy(_BYTE *a1, void *__s, unsigned __int16 a3)
{
  unsigned __int16 v3;
  size_t v6;
  void *v7;

  v3 = a3;
  v6 = a3;
  v7 = memchr(__s, 125, a3);
  if (v7)
  {
    v3 += (_WORD)__s - (_WORD)v7;
    v6 = v3;
    memcpy(a1, v7, v3);
    *a1 = 37;
  }
  else
  {
    memcpy(a1, __s, v6);
  }
  a1[v6] = 0;
  return v3;
}

uint64_t os_log_fmt_read_scalar(uint64_t a1, unsigned __int8 *a2, int a3)
{
  int v3;
  uint64_t result;

  v3 = *(unsigned __int8 *)(a1 + 10);
  if (v3 == 15 || v3 == 14)
    return *(_QWORD *)a2;
  if ((*(_WORD *)(a1 + 8) & 0x20) != 0)
  {
    switch(a3)
    {
      case 1:
        result = *a2;
        break;
      case 2:
        result = *(unsigned __int16 *)a2;
        break;
      case 4:
        result = *(unsigned int *)a2;
        break;
      case 8:
        return *(_QWORD *)a2;
      default:
LABEL_14:
        result = _os_crash();
        __break(1u);
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
        result = (char)*a2;
        break;
      case 2:
        result = *(__int16 *)a2;
        break;
      case 4:
        result = *(int *)a2;
        break;
      case 8:
        return *(_QWORD *)a2;
      default:
        goto LABEL_14;
    }
  }
  return result;
}

unint64_t _os_log_fmt_plugin_annotated(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, unsigned __int8 *a5, unsigned int a6, char a7)
{
  _QWORD *plugin;
  unint64_t v15;
  char v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  char v24[2048];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C874D8];
  plugin = os_log_fmt_get_plugin(*(const char **)(a3 + 32), *(unsigned __int16 *)(a3 + 14));
  v15 = (unint64_t)plugin;
  if (plugin)
  {
    if (!plugin[3])
      return 0;
    v16 = *a4;
    if (os_log_fmt_object_for_data_onceToken != -1)
      dispatch_once(&os_log_fmt_object_for_data_onceToken, &__block_literal_global);
    v17 = (*(_WORD *)(a3 + 8) & 0x10) != 0 ? COERCE_DOUBLE(os_log_fmt_read_scalar(a3, a5, a6)) : 0.0;
    switch(*(_BYTE *)(a3 + 10))
    {
      case 1:
        v18 = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithChar:", SLOBYTE(v17));
        break;
      case 2:
        v18 = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithUnsignedChar:", LOBYTE(v17));
        break;
      case 3:
        v18 = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithShort:", SLOWORD(v17));
        break;
      case 4:
        v18 = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithUnsignedShort:", LOWORD(v17));
        break;
      case 5:
      case 7:
      case 8:
        goto LABEL_21;
      case 6:
        goto LABEL_17;
      case 9:
        if (a2 == 4)
        {
LABEL_21:
          v18 = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithInt:", *(_QWORD *)&v17);
        }
        else
        {
          if (a2 == 8)
            goto LABEL_20;
LABEL_22:
          v18 = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithLongLong:", *(_QWORD *)&v17);
        }
        break;
      case 0xA:
      case 0xD:
        if (a2 == 4)
        {
LABEL_17:
          v18 = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithUnsignedInt:", *(_QWORD *)&v17);
        }
        else if (a2 == 8)
        {
LABEL_20:
          v18 = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithLong:", *(_QWORD *)&v17);
        }
        else
        {
LABEL_15:
          v18 = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithUnsignedLongLong:", *(_QWORD *)&v17);
        }
        break;
      case 0xB:
        goto LABEL_22;
      case 0xC:
        goto LABEL_15;
      case 0xE:
      case 0xF:
        v18 = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithDouble:", v17);
        break;
      case 0x10:
      case 0x11:
      case 0x12:
      case 0x13:
        if ((v16 & 0xF0) == 0x30)
        {
          v18 = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSData), "initWithBytes:length:", a5, a6);
        }
        else if (a6)
        {
          v18 = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSString), "initWithBytes:length:encoding:", a5, a6 - 1, 4);
        }
        else
        {
          v18 = objc_alloc_init((Class)os_log_fmt_object_for_data__NSString);
        }
        break;
      default:
        return 0;
    }
    v19 = v18;
    if (v18)
    {
      v23 = 1;
      BYTE4(v23) = a7;
      __strlcpy_chk();
      v20 = (void *)(*(uint64_t (**)(char *, void *, uint64_t *))(v15 + 24))(v24, v19, &v23);
      v21 = (void *)objc_msgSend(v20, "string");
      v15 = v21 != 0;
      if (v21)
        os_trace_blob_adds_CF(a1, v21);

    }
    else
    {
      return 0;
    }
  }
  return v15;
}

#error "19BBF88D4: call analysis failed (funcsize=18)"

unint64_t os_trace_blob_adds_CF(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  unint64_t v12;

  v3 = objc_retainAutorelease(a2);
  v4 = (_BYTE *)objc_msgSend(v3, "_fastCStringContents:", 1);
  if (v4)
  {
    v5 = os_trace_blob_addns(a1, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    v6 = objc_msgSend(v3, "lengthOfBytesUsingEncoding:", 4);
    v12 = v6;
    v7 = *(_DWORD *)(a1 + 8);
    v8 = *(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v7 - 1;
    if (v6 > v8)
    {
      v9 = v6;
      os_trace_blob_grow(a1, v6);
      v7 = *(_DWORD *)(a1 + 8);
      v8 = *(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v7 - 1;
      if (v9 > v8)
        *(_WORD *)(a1 + 20) |= 2u;
    }
    objc_msgSend(v3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", *(_QWORD *)a1 + v7, v8, &v12, 4, 1, 0, objc_msgSend(v3, "length"), 0);
    v5 = v12;
    v10 = *(_DWORD *)(a1 + 8) + v12;
    *(_DWORD *)(a1 + 8) = v10;
    if (!*(_BYTE *)(a1 + 22))
      *(_BYTE *)(*(_QWORD *)a1 + v10) = 0;
  }

  return v5;
}

_QWORD *os_log_fmt_get_plugin(const char *a1, size_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  int v9;
  _QWORD *v10;

  if ((_dyld_dlsym_blocked() & 1) != 0)
    return 0;
  if (qword_1ECCEBBA0 != -1)
    dispatch_once_f(&qword_1ECCEBBA0, 0, (dispatch_function_t)_os_trace_formatters_list);
  v4 = qword_1ECCEBB98;
  if (!qword_1ECCEBB98)
    return 0;
  v5 = 0;
  v6 = _formatters;
  while (1)
  {
    v7 = (v4 + v5) >> 1;
    v8 = *(const char **)(v6 + 40 * v7 + 8);
    v9 = strncasecmp(a1, v8, a2);
    if (!v9)
      break;
LABEL_9:
    if (v9 < 0)
      v4 = (v4 + v5) >> 1;
    else
      v5 = v7 + 1;
    if (v5 >= v4)
      return 0;
  }
  if (v8[a2])
  {
    v9 = -v8[a2];
    goto LABEL_9;
  }
  v10 = (_QWORD *)(v6 + 40 * v7);
  if (*v10 != -1)
    dispatch_once_f((dispatch_once_t *)(v6 + 40 * v7), (void *)(v6 + 40 * v7), (dispatch_function_t)_os_trace_load_formatter);
  return v10;
}

void _os_log_impl_dynamic(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6)
{
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  _QWORD v14[3];
  int v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C874D8];
  v14[2] = 0;
  v14[0] = &v17;
  v14[1] = 0x40000000000;
  if (a4)
  {
    if (os_trace_blob_vaddf_CF_once != -1)
      dispatch_once(&os_trace_blob_vaddf_CF_once, &__block_literal_global_335);
    *__error() = a5;
    v10 = (void *)MEMORY[0x1A1AC9A28]();
    v11 = (objc_class *)os_trace_blob_vaddf_CF__NSString;
    v12 = a4;
    v13 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, a6);

    os_trace_blob_adds_CF((uint64_t)v14, v13);
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    os_trace_blob_vaddf((uint64_t)v14, *(const char **)(a1 + 40), a5, a6);
  }
  v15 = 136380675;
  v16 = v14[0];
  *(_QWORD *)(a1 + 40) = "%s";
  _os_log_impl_flatten_and_send(a1);
}

uint64_t _os_log_fmt_builtin_annotated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7)
{
  unint64_t v10;
  const char *v11;
  size_t v12;
  unint64_t v13;
  unint64_t v14;
  const char *v15;
  int v16;

  v10 = 0;
  v11 = *(const char **)(a3 + 40);
  v12 = *(unsigned __int16 *)(a3 + 16);
  v13 = 17;
  while (1)
  {
    v14 = (v13 + v10) >> 1;
    v15 = (&_os_log_fmt_builtin_annotated_functions)[2 * v14];
    v16 = strncmp(v11, v15, v12);
    if (!v16)
      break;
LABEL_5:
    if (v16 < 0)
      v13 = (v13 + v10) >> 1;
    else
      v10 = v14 + 1;
    if (v10 >= v13)
      return 0;
  }
  if (v15[v12])
  {
    v16 = -v15[v12];
    goto LABEL_5;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(&_os_log_fmt_builtin_annotated_functions)[2 * v14 + 1])(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t _os_log_fmt_builtin_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t scalar;
  __int16 v15;
  char *v16;
  size_t v17;
  uint64_t v18;
  unsigned int v19;

  if (!_os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 1))
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v11, v12, v13);
    return 1;
  }
  scalar = os_log_fmt_read_scalar(a3, a5, a6);
  v15 = *(_WORD *)(a1 + 20);
  if (**(_BYTE **)(a3 + 40) == 66)
  {
    if (scalar)
      v16 = "YES";
    else
      v16 = "NO";
    if (scalar)
      v17 = 3;
    else
      v17 = 2;
    if ((v15 & 2) != 0)
      return 1;
LABEL_18:
    v18 = *(unsigned int *)(a1 + 8);
    if (v17 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v18 - 1))
    {
      os_trace_blob_add_slow(a1, v16, v17);
    }
    else
    {
      memcpy((void *)(*(_QWORD *)a1 + v18), v16, v17);
      v19 = *(_DWORD *)(a1 + 8) + v17;
      *(_DWORD *)(a1 + 8) = v19;
      if (!*(_BYTE *)(a1 + 22))
        *(_BYTE *)(*(_QWORD *)a1 + v19) = 0;
    }
    return 1;
  }
  if (scalar)
    v16 = "true";
  else
    v16 = "false";
  if (scalar)
    v17 = 4;
  else
    v17 = 5;
  if ((v15 & 2) == 0)
    goto LABEL_18;
  return 1;
}

BOOL _os_log_fmt_spec_is_integer(unsigned __int8 a1, int a2)
{
  int v2;

  v2 = a2 ^ 1;
  if (a1 - 1 < 0xC)
    v2 = 1;
  if (v2)
    return a1 - 1 < 0xC;
  else
    return a1 == 13;
}

uint64_t _os_log_fmt_builtin_darwin_errno(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, int *a5, uint64_t a6)
{
  BOOL is_integer;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    v18 = *a5;
    if (*a5)
    {
      strerror(*a5);
      os_trace_blob_addf(a1, "[%d: %s]", v19, v20, v21, v22, v23, v24, v18);
    }
    else
    {
      os_trace_blob_addf(a1, "[%d: %s]", v12, v13, v14, v15, v16, v17, 0);
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
  }
  return 1;
}

uint64_t _os_trace_fdscandir_b(int a1, _QWORD *a2, uint64_t a3, void *a4)
{
  int v7;
  int v8;
  DIR *v9;
  DIR *v10;
  void *v11;
  void *v12;
  size_t v13;
  unint64_t v14;
  dirent *v15;
  unsigned __int16 *v16;
  size_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t result;
  int v23;

  v7 = dup(a1);
  if (v7 == -1)
  {
    __error();
    _os_assumes_log();
    goto LABEL_25;
  }
  v8 = v7;
  if (lseek(v7, 0, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }
  v9 = fdopendir(v8);
  if (v9)
  {
    v10 = v9;
    while (1)
    {
      v11 = malloc_type_malloc(0x100uLL, 0x91D685AAuLL);
      if (v11)
        break;
      _os_trace_temporary_resource_shortage();
    }
    v12 = v11;
    rewinddir(v10);
    v13 = 0;
    v14 = 32;
    while (1)
    {
      v15 = readdir(v10);
      if (!v15)
        break;
      v16 = (unsigned __int16 *)v15;
      if (!a3 || (*(unsigned int (**)(uint64_t, dirent *))(a3 + 16))(a3, v15))
      {
        v17 = v16[9] + 22;
        while (1)
        {
          v18 = malloc_type_malloc(v17, 0x91D685AAuLL);
          if (v18)
            break;
          _os_trace_temporary_resource_shortage();
        }
        v19 = v18;
        memcpy(v18, v16, v17);
        if (v13 >= v14)
        {
          v20 = malloc_type_realloc(v12, 16 * v14, 0x2004093837F09uLL);
          if (!v20)
          {
            free(v19);
            closedir(v10);
            _os_trace_scandir_free_namelist(v13, (void **)v12);
            goto LABEL_25;
          }
          v14 *= 2;
          v12 = v20;
        }
        *((_QWORD *)v12 + v13++) = v19;
      }
    }
    closedir(v10);
    if (a4 && v13)
      qsort_b(v12, v13, 8uLL, a4);
    *a2 = v12;
    return v13;
  }
  v21 = *__error();
  if (close(v8) != -1)
  {
LABEL_24:
    *__error() = v21;
LABEL_25:
    *a2 = 0;
    return 0xFFFFFFFFLL;
  }
  v23 = *__error();
  result = *__error();
  if (v23 != 9)
  {
    _os_assumes_log();
    goto LABEL_24;
  }
  qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE40C120 = result;
  __break(1u);
  return result;
}

uint64_t _os_log_fmt_flatten_masked_data(_BYTE *a1, int a2, uint64_t a3, uint64_t a4, _BYTE *a5, unint64_t a6, size_t a7, _BYTE *a8)
{
  size_t v8;
  _BYTE *v9;
  uint64_t v10;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v17;
  unsigned int v18;
  _BYTE __src[16];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C874D8];
  if (!a3)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_47;
  }
  v8 = a7;
  v10 = a4;
  v9 = a1;
  v12 = *a1;
  *a1 = v12 & 0xF8 | 2;
  if (a3 <= 0x656D616E6C69616CLL)
  {
    if (a3 <= 0x786F626C69616CLL)
    {
      if (a3 == 1752392040)
        goto LABEL_17;
      v13 = 0x68736168766564;
      goto LABEL_16;
    }
    if (a3 == 0x786F626C69616DLL)
      goto LABEL_17;
    if (a3 != 0x35646D6E69616C70)
    {
      v13 = 0x617474616C69616DLL;
      goto LABEL_16;
    }
    if (*a8)
    {
      LOWORD(v8) = 0;
      goto LABEL_34;
    }
    ccmd5_di();
    ccdigest();
    if (v8 > 0xF)
      v8 = 16;
    else
      *a8 = 1;
    if ((*(_WORD *)(v10 + 20) & 2) != 0)
      goto LABEL_34;
    v17 = *(unsigned int *)(v10 + 8);
    if (v8 <= (*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v17 - 1))
    {
      memcpy((void *)(*(_QWORD *)v10 + v17), __src, v8);
      v18 = *(_DWORD *)(v10 + 8) + v8;
      *(_DWORD *)(v10 + 8) = v18;
      if (!*(_BYTE *)(v10 + 22))
        *(_BYTE *)(*(_QWORD *)v10 + v18) = 0;
      goto LABEL_34;
    }
LABEL_47:
    os_trace_blob_add_slow(v10, __src, v8);
    goto LABEL_34;
  }
  if (a3 > 0x6F6363616C69616CLL)
  {
    if (a3 == 0x6F6363616C69616DLL || a3 == 0x7075626D6C69616DLL)
      goto LABEL_17;
    v13 = 0x726464616C69616DLL;
  }
  else
  {
    if (a3 == 0x656D616E6C69616DLL || a3 == 0x6A6275736C69616DLL)
      goto LABEL_17;
    v13 = 0x6D6D75736C69616DLL;
  }
LABEL_16:
  if (a3 != v13)
  {
    LOWORD(v8) = 0;
    *a1 = v12 & 8 | 0xE2;
    *a8 = 0;
    return (unsigned __int16)v8;
  }
LABEL_17:
  if (!_os_log_mask_callback)
    goto LABEL_33;
  if (a3 > 0x6D6D75736C69616CLL)
  {
    if (a3 > 0x7075626D6C69616CLL)
    {
      if (a3 == 0x726464616C69616DLL)
        goto LABEL_30;
      v14 = 0x7075626D6C69616DLL;
    }
    else
    {
      if (a3 == 0x6D6D75736C69616DLL)
        goto LABEL_30;
      v14 = 0x6F6363616C69616DLL;
    }
  }
  else
  {
    if (a3 <= 0x656D616E6C69616CLL)
    {
      if (a3 != 0x786F626C69616DLL)
      {
        v14 = 0x617474616C69616DLL;
        goto LABEL_29;
      }
LABEL_30:
      v15 = v12 >> 4;
      if (v15 == 4 || v15 == 2)
        goto LABEL_32;
LABEL_33:
      LOWORD(v8) = 0;
      *a8 = 0;
      goto LABEL_34;
    }
    if (a3 == 0x656D616E6C69616DLL)
      goto LABEL_30;
    v14 = 0x6A6275736C69616DLL;
  }
LABEL_29:
  if (a3 == v14)
    goto LABEL_30;
LABEL_32:
  __src[0] = 2;
  LOWORD(v8) = _os_log_mask_callback_impl(a2, __src, a3, a4, a5, a6, a7, a8);
  *v9 = __src[0] & 0xF | *v9 & 0xF8;
LABEL_34:
  *v9 |= 0xF0u;
  return (unsigned __int16)v8;
}

uint64_t _os_log_mask_callback_impl(int a1, _BYTE *a2, uint64_t a3, uint64_t a4, _BYTE *a5, unint64_t a6, size_t a7, _BYTE *a8)
{
  _BYTE *v8;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  _BYTE *v18;
  unint64_t v19;
  size_t v20;
  char *v21;
  char *v22;
  size_t v23;
  size_t v24;
  size_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unsigned int v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  int v37;
  char v38;
  unsigned int v39;
  size_t v40;
  uint64_t v41;
  unsigned int v42;
  size_t v43;
  uint64_t v44;
  unsigned int v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int8 v50;
  size_t v51;
  uint64_t v52;
  unsigned int v53;
  uint64_t result;
  size_t v55;
  _BYTE *v56;
  size_t v57;
  _BYTE *v58;
  uint64_t v59;
  unsigned int v60;
  _BYTE *v61;
  char v62;
  size_t v63;
  char v64;
  size_t v65;
  uint64_t v66;
  unsigned int v67;
  uint64_t v68;
  unsigned int v69;
  size_t v70;
  uint64_t v71;
  unsigned int v72;
  uint64_t v73;
  unsigned int v74;
  size_t v75;
  uint64_t v76;
  unsigned int v77;
  uint64_t v78;
  unsigned int v79;
  uint64_t v80;
  unsigned int v81;
  size_t v82;
  uint64_t v83;
  unsigned int v84;
  uint64_t v85;
  unsigned int v86;
  _BYTE *v87;
  int v88;
  unint64_t v89;
  unint64_t __src[5];

  v8 = a8;
  __src[4] = *MEMORY[0x1E0C874D8];
  if (a1 == 1)
  {
    if (a3 <= 0x6A6275736C69616CLL)
    {
      if (a3 > 0x786F626C69616CLL)
      {
        if (a3 == 0x786F626C69616DLL || a3 == 0x617474616C69616DLL)
          goto LABEL_38;
        v13 = 0x656D616E6C69616DLL;
LABEL_37:
        if (a3 == v13)
          goto LABEL_38;
        goto LABEL_213;
      }
LABEL_31:
      if (a3 == 1752392040)
      {
        if (*a8)
        {
          LOWORD(a7) = 0;
        }
        else
        {
          _os_log_mask_create_digest((uint64_t)a5, a6, (uint64_t)&xmmword_1ECCEBB10, (uint64_t)__src);
          if (a7 > 0xF)
            a7 = 16;
          else
            *v8 = 1;
          if ((*(_WORD *)(a4 + 20) & 2) == 0)
          {
            v59 = *(unsigned int *)(a4 + 8);
            if (a7 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v59 - 1))
            {
              os_trace_blob_add_slow(a4, __src, a7);
            }
            else
            {
              memcpy((void *)(*(_QWORD *)a4 + v59), __src, a7);
              v60 = *(_DWORD *)(a4 + 8) + a7;
              *(_DWORD *)(a4 + 8) = v60;
              if (!*(_BYTE *)(a4 + 22))
                *(_BYTE *)(*(_QWORD *)a4 + v60) = 0;
            }
          }
        }
        return (unsigned __int16)a7;
      }
      if (a3 == 0x68736168766564)
        goto LABEL_33;
LABEL_213:
      _os_crash();
      __break(1u);
      goto LABEL_214;
    }
    if (a3 <= 0x6F6363616C69616CLL)
    {
      if (a3 != 0x6A6275736C69616DLL)
      {
        v13 = 0x6D6D75736C69616DLL;
        goto LABEL_37;
      }
    }
    else if (a3 != 0x726464616C69616DLL)
    {
      if (a3 != 0x7075626D6C69616DLL)
      {
        v13 = 0x6F6363616C69616DLL;
        goto LABEL_37;
      }
      goto LABEL_33;
    }
LABEL_38:
    LOWORD(a7) = 0;
    *a2 = 1;
    return (unsigned __int16)a7;
  }
  if (a3 > 0x6A6275736C69616CLL)
  {
    if (a3 <= 0x6F6363616C69616CLL)
    {
      if (a3 == 0x6A6275736C69616DLL)
        goto LABEL_42;
      v14 = 0x6D6D75736C69616DLL;
      goto LABEL_41;
    }
    if (a3 != 0x6F6363616C69616DLL)
    {
      if (a3 != 0x7075626D6C69616DLL)
      {
        if (a3 == 0x726464616C69616DLL)
        {
          LODWORD(v89) = 0x2000000;
          __src[0] = 0;
          v15 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, a6, a6, __src, 0);
          v16 = v15;
          v17 = __src[0];
          if (__src[0] <= 1)
          {
            if (v15 >= 0xFF)
              v55 = 255;
            else
              v55 = v15;
            BYTE1(v89) = v55;
            v56 = v8;
            if (a7 > 3)
            {
              v57 = 4;
            }
            else
            {
              *v8 = 1;
              v57 = a7;
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              v76 = *(unsigned int *)(a4 + 8);
              if (v57 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v76 - 1))
              {
                os_trace_blob_add_slow(a4, &v89, v57);
              }
              else
              {
                memcpy((void *)(*(_QWORD *)a4 + v76), &v89, v57);
                v77 = *(_DWORD *)(a4 + 8) + v57;
                *(_DWORD *)(a4 + 8) = v77;
                if (!*(_BYTE *)(a4 + 22))
                  *(_BYTE *)(*(_QWORD *)a4 + v77) = 0;
              }
            }
            if (a7 - v57 < v55)
            {
              *v56 = 1;
              v55 = a7 - v57;
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              v78 = *(unsigned int *)(a4 + 8);
              if (v55 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v78 - 1))
              {
                os_trace_blob_add_slow(a4, a5, v55);
              }
              else
              {
                memcpy((void *)(*(_QWORD *)a4 + v78), a5, v55);
                v79 = *(_DWORD *)(a4 + 8) + v55;
                *(_DWORD *)(a4 + 8) = v79;
                if (!*(_BYTE *)(a4 + 22))
                  *(_BYTE *)(*(_QWORD *)a4 + v79) = 0;
              }
            }
            LOWORD(a7) = v55 + v57;
          }
          else
          {
            v18 = v8;
            if (__src[0] >= 0xFF)
              v17 = -1;
            BYTE1(v89) = v17;
            v19 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, v15, 1uLL, __src, 64);
            if (v19 >= 0xFF)
              v20 = 255;
            else
              v20 = v19;
            BYTE2(v89) = v20;
            v21 = strnstr(&a5[v19], "@", v16 - v19);
            if (v21)
              v22 = v21;
            else
              v22 = &a5[v16];
            v23 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(v22, &a5[v16] - v22, 2uLL, __src, 0);
            _os_log_mask_create_device_digest((uint64_t)a5, v16, (uint64_t)__src);
            LOBYTE(v89) = 2;
            if (a7 > 3)
            {
              v24 = 4;
            }
            else
            {
              *v18 = 1;
              v24 = a7;
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              v73 = *(unsigned int *)(a4 + 8);
              if (v24 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v73 - 1))
              {
                os_trace_blob_add_slow(a4, &v89, v24);
              }
              else
              {
                memcpy((void *)(*(_QWORD *)a4 + v73), &v89, v24);
                v74 = *(_DWORD *)(a4 + 8) + v24;
                *(_DWORD *)(a4 + 8) = v74;
                if (!*(_BYTE *)(a4 + 22))
                  *(_BYTE *)(*(_QWORD *)a4 + v74) = 0;
              }
            }
            v75 = a7 - v24;
            if (a7 - v24 > 1)
              v75 = 2;
            else
              *v18 = 1;
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              v80 = *(unsigned int *)(a4 + 8);
              if (v75 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v80 - 1))
              {
                os_trace_blob_add_slow(a4, __src, v75);
              }
              else
              {
                memcpy((void *)(*(_QWORD *)a4 + v80), __src, v75);
                v81 = *(_DWORD *)(a4 + 8) + v75;
                *(_DWORD *)(a4 + 8) = v81;
                if (!*(_BYTE *)(a4 + 22))
                  *(_BYTE *)(*(_QWORD *)a4 + v81) = 0;
              }
            }
            v82 = v75 + v24;
            if (a7 - v82 < v20)
            {
              *v18 = 1;
              v20 = a7 - v82;
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              v83 = *(unsigned int *)(a4 + 8);
              if (v20 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v83 - 1))
              {
                os_trace_blob_add_slow(a4, a5, v20);
              }
              else
              {
                memcpy((void *)(*(_QWORD *)a4 + v83), a5, v20);
                v84 = *(_DWORD *)(a4 + 8) + v20;
                *(_DWORD *)(a4 + 8) = v84;
                if (!*(_BYTE *)(a4 + 22))
                  *(_BYTE *)(*(_QWORD *)a4 + v84) = 0;
              }
            }
            if (v23 > a7 - (v20 + v82))
            {
              *v18 = 1;
              v23 = a7 - (v20 + v82);
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              v85 = *(unsigned int *)(a4 + 8);
              if (v23 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v85 - 1))
              {
                os_trace_blob_add_slow(a4, v22, v23);
              }
              else
              {
                memcpy((void *)(*(_QWORD *)a4 + v85), v22, v23);
                v86 = *(_DWORD *)(a4 + 8) + v23;
                *(_DWORD *)(a4 + 8) = v86;
                if (!*(_BYTE *)(a4 + 22))
                  *(_BYTE *)(*(_QWORD *)a4 + v86) = 0;
              }
            }
            LOWORD(a7) = v23 + v20 + v82;
          }
          return (unsigned __int16)a7;
        }
        goto LABEL_213;
      }
LABEL_33:
      if (*a8)
      {
        LOWORD(v25) = 0;
      }
      else
      {
        _os_log_mask_create_device_digest((uint64_t)a5, a6, (uint64_t)__src);
        if (a3 == 0x7075626D6C69616DLL)
          v25 = 2;
        else
          v25 = 16;
        if (v25 > a7)
        {
          *v8 = 1;
          v25 = a7;
        }
        if ((*(_WORD *)(a4 + 20) & 2) == 0)
        {
          v29 = *(unsigned int *)(a4 + 8);
          if (v25 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v29 - 1))
          {
            os_trace_blob_add_slow(a4, __src, v25);
          }
          else
          {
            memcpy((void *)(*(_QWORD *)a4 + v29), __src, v25);
            v30 = *(_DWORD *)(a4 + 8) + v25;
            *(_DWORD *)(a4 + 8) = v30;
            if (!*(_BYTE *)(a4 + 22))
              *(_BYTE *)(*(_QWORD *)a4 + v30) = 0;
          }
        }
      }
      LOWORD(a7) = v25;
      return (unsigned __int16)a7;
    }
  }
  else
  {
    if (a3 <= 0x786F626C69616CLL)
      goto LABEL_31;
    if (a3 != 0x786F626C69616DLL)
    {
      if (a3 != 0x617474616C69616DLL)
      {
        v14 = 0x656D616E6C69616DLL;
LABEL_41:
        if (a3 != v14)
          goto LABEL_213;
        goto LABEL_42;
      }
      LODWORD(v89) = 0x1000000;
      __src[0] = 0;
      v31 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, a6, a6, __src, 0);
      v32 = v31;
      if (v31)
      {
        v33 = 0;
        v34 = __src[0];
        v35 = 5;
        if (v31 < 5)
          v35 = v31;
        v36 = a5 - 1;
        while (v35 != v33)
        {
          v37 = v36[v31];
          ++v33;
          --v36;
          if (v37 == 46)
            goto LABEL_134;
        }
        v33 = v35;
LABEL_134:
        v58 = v8;
        v61 = &a5[v31 - v33];
        if (v61 != a5)
        {
          _os_log_mask_create_device_digest((uint64_t)a5, v31, (uint64_t)__src);
          v62 = 0;
          v63 = 2;
          LOBYTE(v89) = 2;
          v64 = -1;
          if (v34 < 0xFF)
            v64 = v34;
          BYTE1(v89) = v64;
LABEL_139:
          if (a7 > 3)
          {
            v65 = 4;
          }
          else
          {
            *v58 = 1;
            v65 = a7;
          }
          if ((*(_WORD *)(a4 + 20) & 2) == 0)
          {
            v66 = *(unsigned int *)(a4 + 8);
            if (v65 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v66 - 1))
            {
              os_trace_blob_add_slow(a4, &v89, v65);
              if ((v62 & 1) == 0)
                goto LABEL_147;
              goto LABEL_154;
            }
            memcpy((void *)(*(_QWORD *)a4 + v66), &v89, v65);
            v67 = *(_DWORD *)(a4 + 8) + v65;
            *(_DWORD *)(a4 + 8) = v67;
            if (!*(_BYTE *)(a4 + 22))
              *(_BYTE *)(*(_QWORD *)a4 + v67) = 0;
          }
          if ((v62 & 1) == 0)
          {
LABEL_147:
            if (a7 - v65 < v63)
            {
              *v58 = 1;
              v63 = a7 - v65;
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              v68 = *(unsigned int *)(a4 + 8);
              if (v63 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v68 - 1))
              {
                os_trace_blob_add_slow(a4, __src, v63);
              }
              else
              {
                memcpy((void *)(*(_QWORD *)a4 + v68), __src, v63);
                v69 = *(_DWORD *)(a4 + 8) + v63;
                *(_DWORD *)(a4 + 8) = v69;
                if (!*(_BYTE *)(a4 + 22))
                  *(_BYTE *)(*(_QWORD *)a4 + v69) = 0;
              }
            }
            v65 += v63;
          }
LABEL_154:
          v70 = a5 - v61 + v32;
          if (v70 > a7 - v65)
          {
            *v58 = 1;
            v70 = a7 - v65;
          }
          if ((*(_WORD *)(a4 + 20) & 2) == 0)
          {
            v71 = *(unsigned int *)(a4 + 8);
            if (v70 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v71 - 1))
            {
              os_trace_blob_add_slow(a4, v61, v70);
            }
            else
            {
              memcpy((void *)(*(_QWORD *)a4 + v71), v61, v70);
              v72 = *(_DWORD *)(a4 + 8) + v70;
              *(_DWORD *)(a4 + 8) = v72;
              if (!*(_BYTE *)(a4 + 22))
                *(_BYTE *)(*(_QWORD *)a4 + v72) = 0;
            }
          }
          LOWORD(a7) = v70 + v65;
          return (unsigned __int16)a7;
        }
      }
      else
      {
        v58 = v8;
      }
      v63 = 0;
      v62 = 1;
      v61 = a5;
      goto LABEL_139;
    }
  }
LABEL_42:
  v88 = 0;
  __src[0] = 0;
  v26 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, a6, a6, __src, 0);
  v27 = __src[0];
  if (a3 > 0x6D6D75736C69616CLL)
  {
    if (a3 > 0x7075626D6C69616CLL)
    {
      if (a3 == 0x7075626D6C69616DLL)
      {
        v28 = 0;
        goto LABEL_79;
      }
      if (a3 == 0x726464616C69616DLL)
      {
        v28 = 1;
        goto LABEL_79;
      }
      goto LABEL_214;
    }
    if (a3 != 0x6D6D75736C69616DLL)
    {
      if (a3 != 0x6F6363616C69616DLL)
        goto LABEL_214;
LABEL_50:
      v28 = 2;
      goto LABEL_79;
    }
LABEL_65:
    v28 = 3;
    goto LABEL_79;
  }
  if (a3 > 0x656D616E6C69616CLL)
  {
    if (a3 != 0x656D616E6C69616DLL && a3 != 0x6A6275736C69616DLL)
      goto LABEL_214;
    goto LABEL_65;
  }
  if (a3 == 0x786F626C69616DLL)
    goto LABEL_50;
  if (a3 == 0x617474616C69616DLL)
  {
    v28 = 5;
LABEL_79:
    v38 = -1;
    if (__src[0] < 0xFF)
      v38 = __src[0];
    BYTE1(v88) = v38;
    if (__src[0] <= v28)
    {
      v39 = 0;
    }
    else
    {
      _os_log_mask_create_device_digest((uint64_t)a5, v26, (uint64_t)__src);
      v39 = 2;
    }
    LOBYTE(v88) = v39;
    if (a7 > 3)
    {
      v40 = 4;
    }
    else
    {
      *v8 = 1;
      v40 = a7;
    }
    if ((*(_WORD *)(a4 + 20) & 2) == 0)
    {
      v41 = *(unsigned int *)(a4 + 8);
      if (v40 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v41 - 1))
      {
        os_trace_blob_add_slow(a4, &v88, v40);
      }
      else
      {
        memcpy((void *)(*(_QWORD *)a4 + v41), &v88, v40);
        v42 = *(_DWORD *)(a4 + 8) + v40;
        *(_DWORD *)(a4 + 8) = v42;
        if (!*(_BYTE *)(a4 + 22))
          *(_BYTE *)(*(_QWORD *)a4 + v42) = 0;
      }
    }
    if (v27 > v28)
    {
      v43 = a7 - v40;
      if (a7 - v40 >= v39)
        v43 = v39;
      else
        *v8 = 1;
      if ((*(_WORD *)(a4 + 20) & 2) == 0)
      {
        v44 = *(unsigned int *)(a4 + 8);
        if (v43 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v44 - 1))
        {
          os_trace_blob_add_slow(a4, __src, v43);
        }
        else
        {
          memcpy((void *)(*(_QWORD *)a4 + v44), __src, v43);
          v45 = *(_DWORD *)(a4 + 8) + v43;
          *(_DWORD *)(a4 + 8) = v45;
          if (!*(_BYTE *)(a4 + 22))
            *(_BYTE *)(*(_QWORD *)a4 + v45) = 0;
        }
      }
      v40 += v43;
    }
    if (a3 == 0x6A6275736C69616DLL)
    {
      v46 = a5;
      v87 = v8;
      if (v26 >= 4)
      {
        v47 = v26;
        v46 = a5;
        do
        {
          if (!strncmp(v46, "Re: ", 4uLL))
          {
            v48 = -4;
            v49 = 4;
          }
          else
          {
            if (v47 < 5 || strncmp(v46, "Fwd: ", 5uLL))
              break;
            v48 = -5;
            v49 = 5;
          }
          v46 += v49;
          v47 += v48;
        }
        while (v47 > 3);
      }
      v50 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(v46, v26 - (v46 - a5), v28, &v89, 0)
          + (_BYTE)v46
          - (_BYTE)a5;
      v8 = v87;
    }
    else
    {
      v50 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, v26, v28, &v89, 0);
    }
    if (v50 >= v26)
      v51 = v26;
    else
      v51 = v50;
    if (v51 > a7 - v40)
    {
      *v8 = 1;
      v51 = a7 - v40;
    }
    if ((*(_WORD *)(a4 + 20) & 2) == 0)
    {
      v52 = *(unsigned int *)(a4 + 8);
      if (v51 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v52 - 1))
      {
        os_trace_blob_add_slow(a4, a5, v51);
      }
      else
      {
        memcpy((void *)(*(_QWORD *)a4 + v52), a5, v51);
        v53 = *(_DWORD *)(a4 + 8) + v51;
        *(_DWORD *)(a4 + 8) = v53;
        if (!*(_BYTE *)(a4 + 22))
          *(_BYTE *)(*(_QWORD *)a4 + v53) = 0;
      }
    }
    LOWORD(a7) = v51 + v40;
    return (unsigned __int16)a7;
  }
LABEL_214:
  result = _os_crash();
  __break(1u);
  return result;
}

uint64_t _os_log_mask_create_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C874D8];
  v5 = ccsha256_di();
  MEMORY[0x1E0C86820](v5);
  v7 = (char *)v9 - v6;
  ccdigest_init();
  ccdigest_update();
  ccdigest_update();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 56))(v5, v7, a4);
  return cc_clear();
}

uint64_t os_state_add_handler(NSObject *a1, const void *a2)
{
  _QWORD *v4;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unsigned int v10;

  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  if ((dword_1ECCEBAC8 & 0x100) != 0 || (MEMORY[0xFFFFFC104] & 0x100) != 0)
    return 0;
  while (1)
  {
    v4 = malloc_type_calloc(1uLL, 0x40uLL, 0x478C0A82uLL);
    if (v4)
      break;
    _os_trace_temporary_resource_shortage();
  }
  v6 = v4;
  do
    v7 = __ldxr(&os_state_add_handler_handle);
  while (__stxr(v7 + 1, &os_state_add_handler_handle));
  v4[2] = v7;
  v4[3] = _Block_copy(a2);
  v6[4] = a1;
  dispatch_retain(a1);
  v6[5] = dyld_image_header_containing_address();
  v6[6] = 0;
  *((_DWORD *)v6 + 14) = 1;
  os_unfair_lock_lock_with_options();
  v8 = 24;
  if (!byte_1ECCEBAA8)
    v8 = 8;
  v9 = *(_UNKNOWN **)((char *)&os_state_blocks + v8);
  *v6 = 0;
  v6[1] = v9;
  *v9 = v6;
  *(_UNKNOWN **)((char *)&os_state_blocks + v8) = v6;
  do
    v10 = __ldxr((unsigned int *)&dword_1ECCEBAAC);
  while (__stxr(v10 + 1, (unsigned int *)&dword_1ECCEBAAC));
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECCEBA98);
  return v6[2];
}

uint64_t ___os_state_request_for_self_impl_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void _os_state_block_entry_free(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  _Block_release(*(const void **)(a1 + 24));
  free((void *)a1);
}

uint64_t _os_trace_assumes_log()
{
  _simple_sappend();
  return 1;
}

_QWORD *___os_state_request_for_self_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  time_t v3;
  xpc_object_t v4;
  int *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  size_t v17;
  xpc_object_t v18;
  NSObject *v19;
  xpc_object_t v20;
  uint64_t v21;
  int v22;
  xpc_object_t v23;
  int v24;
  xpc_object_t v25;
  unsigned __int8 *v26;
  unsigned __int8 *v27;
  unsigned __int8 **v28;
  unsigned int v29;
  _QWORD *result;
  _QWORD *v31;
  dispatch_block_t destructor;
  uint64_t value;
  __int128 v34;
  uint64_t v35;
  _QWORD block[7];
  unsigned __int8 v37[8];
  unsigned __int8 *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 uuid[8];
  uint64_t v42;
  uint8_t buf[8];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C874D8];
  v1 = *(_QWORD *)(a1 + 32);
  value = *(unsigned __int8 *)(a1 + 72);
  v34 = *(_OWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 64);
  v35 = *(_QWORD *)(a1 + 56);
  v3 = time(0);
  v4 = xpc_array_create(0, 0);
  v5 = (int *)os_state_blocks;
  v6 = 0x1ECCEB000uLL;
  if (os_state_blocks)
  {
    v7 = MEMORY[0x1E0C87450];
    destructor = (dispatch_block_t)*MEMORY[0x1E0C86E98];
    while (1)
    {
      if ((_DWORD)v35 != 1 || *((_QWORD *)v5 + 5) == v2)
      {
        v8 = v3 - *((_QWORD *)v5 + 6);
        v9 = v5[14];
        if (v8 >= v9)
          break;
      }
LABEL_31:
      v5 = *(int **)v5;
      if (!v5)
        goto LABEL_32;
    }
    if (v8 >= v9 + 10)
    {
      if (v8 < 70)
        goto LABEL_13;
      v10 = 1;
    }
    else if ((int)v9 <= 30)
    {
      v10 = 2 * v9;
    }
    else
    {
      v10 = 60;
    }
    v5[14] = v10;
LABEL_13:
    *((_QWORD *)v5 + 6) = v3;
    *(_QWORD *)uuid = 0;
    v42 = 0;
    if (_dyld_get_image_uuid())
    {
      *(_QWORD *)v37 = 0;
      v38 = v37;
      v39 = 0x2000000000;
      v40 = 0;
      v11 = *((_QWORD *)v5 + 4);
      block[0] = v7;
      block[1] = 0x40000000;
      block[2] = ___os_state_request_for_self_impl_block_invoke;
      block[3] = &unk_1E3C933B8;
      block[4] = v37;
      block[5] = v5;
      block[6] = &v34;
      dispatch_sync(v11, block);
      v12 = *((_QWORD *)v38 + 3);
      if (v12)
      {
        v13 = *(unsigned int *)(v12 + 4);
        if (v13 < 0x7F39)
        {
          v14 = v7;
          v15 = v6;
          v16 = v1;
          v17 = v13 + 200;
          *(_BYTE *)(v12 + 199) = 0;
          *(_BYTE *)(v12 + 71) = 0;
          *(_BYTE *)(v12 + 135) = 0;
          v18 = xpc_dictionary_create(0, 0, 0);
          v19 = dispatch_data_create(*((const void **)v38 + 3), v17, 0, destructor);
          v20 = xpc_data_create_with_dispatch_data(v19);
          xpc_dictionary_set_value(v18, "data", v20);
          xpc_release(v20);
          dispatch_release(v19);
          v21 = mach_continuous_time();
          xpc_dictionary_set_uint64(v18, "ts", v21);
          xpc_dictionary_set_uuid(v18, "uuid", uuid);
          if ((_DWORD)value)
            xpc_dictionary_set_uint64(v18, "ttl", value);
          xpc_array_append_value(v4, v18);
          xpc_release(v18);
          v1 = v16;
          if (xpc_array_get_count(v4) == 10)
          {
            v22 = v35;
            v23 = xpc_dictionary_create(0, 0, 0);
            *(_QWORD *)buf = 0;
            v44 = 0;
            xpc_dictionary_set_uint64(v23, "operation", 2uLL);
            v6 = v15;
            if (_dyld_get_shared_cache_uuid())
              xpc_dictionary_set_uuid(v23, "dsc_uuid", buf);
            xpc_dictionary_set_uint64(v23, "aid", v1);
            xpc_dictionary_set_value(v23, "entries", v4);
            if (*(_BYTE *)(v15 + 2882) && v22 != 3)
              xpc_dictionary_set_BOOL(v23, "quarantined", 1);
            _os_trace_logd_send();
            xpc_release(v23);
            xpc_release(v4);
            v4 = xpc_array_create(0, 0);
          }
          else
          {
            v6 = v15;
          }
          v7 = v14;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19BBEC000, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Statedump too large", buf, 2u);
            v12 = *((_QWORD *)v38 + 3);
          }
          free((void *)v12);
        }
      }
      _Block_object_dispose(v37, 8);
    }
    goto LABEL_31;
  }
LABEL_32:
  if (xpc_array_get_count(v4))
  {
    v24 = v35;
    v25 = xpc_dictionary_create(0, 0, 0);
    *(_QWORD *)v37 = 0;
    v38 = 0;
    xpc_dictionary_set_uint64(v25, "operation", 2uLL);
    if (_dyld_get_shared_cache_uuid())
      xpc_dictionary_set_uuid(v25, "dsc_uuid", v37);
    xpc_dictionary_set_uint64(v25, "aid", v1);
    xpc_dictionary_set_value(v25, "entries", v4);
    if (*(_BYTE *)(v6 + 2882) && v24 != 3)
      xpc_dictionary_set_BOOL(v25, "quarantined", 1);
    _os_trace_logd_send();
    xpc_release(v25);
  }
  xpc_release(v4);
  *(_QWORD *)v37 = 0;
  v38 = v37;
  os_unfair_lock_lock_with_options();
  v26 = (unsigned __int8 *)os_state_blocks;
  if (os_state_blocks)
  {
    do
    {
      v27 = *(unsigned __int8 **)v26;
      if (v26[60])
      {
        v28 = (unsigned __int8 **)*((_QWORD *)v26 + 1);
        if (v27)
        {
          *((_QWORD *)v27 + 1) = v28;
          v28 = (unsigned __int8 **)*((_QWORD *)v26 + 1);
        }
        else
        {
          off_1ECCEBA80 = (_UNKNOWN **)*((_QWORD *)v26 + 1);
        }
        *v28 = v27;
        *(_QWORD *)v26 = 0;
        *((_QWORD *)v26 + 1) = v38;
        *(_QWORD *)v38 = v26;
        v38 = v26;
        do
          v29 = __ldxr((unsigned int *)&dword_1ECCEBAAC);
        while (__stxr(v29 - 1, (unsigned int *)&dword_1ECCEBAAC));
      }
      v26 = v27;
    }
    while (v27);
  }
  if (off_1ECCEBA88)
  {
    *off_1ECCEBA80 = off_1ECCEBA88;
    *((_QWORD *)off_1ECCEBA88 + 1) = off_1ECCEBA80;
    off_1ECCEBA80 = off_1ECCEBA90;
    off_1ECCEBA88 = 0;
    off_1ECCEBA90 = &off_1ECCEBA88;
  }
  byte_1ECCEBAA8 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECCEBA98);
  result = *(_QWORD **)v37;
  if (*(_QWORD *)v37)
  {
    do
    {
      v31 = (_QWORD *)*result;
      _os_state_block_entry_free((uint64_t)result);
      result = v31;
    }
    while (v31);
  }
  return result;
}

void _os_trace_logd_send()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = _os_trace_logd_pipe_copy(0);
  if (v0)
  {
    v1 = v0;
    if (xpc_pipe_simpleroutine() == 32)
    {
      v2 = _os_trace_logd_pipe_copy(v1);
      if (!v2)
        return;
      v1 = v2;
      xpc_pipe_simpleroutine();
    }
    xpc_release(v1);
  }
}

void _os_log_impl_send_oversize(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5, const void ***a6)
{
  xpc_object_t v12;
  unsigned __int8 *v13;
  void *v14;

  if (off_1ECCEBAB8)
  {
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "operation", 3uLL);
    xpc_dictionary_set_uuid(v12, "dsc_uuid", (const unsigned __int8 *)off_1ECCEBAB8 + 40);
    if ((*(_WORD *)off_1ECCEBAB8 & 1) != 0)
      xpc_dictionary_set_BOOL(v12, "32bits", 1);
    xpc_dictionary_set_uint64(v12, "stream_id", a2);
    xpc_dictionary_set_uint64(v12, "message_id", a5);
    xpc_dictionary_set_data(v12, "commands", **a6, *((unsigned int *)*a6 + 2));
    xpc_dictionary_set_data(v12, "pubdata", *a6[1], *((unsigned int *)a6[1] + 2));
    xpc_dictionary_set_data(v12, "privdata", *a6[2], *((unsigned int *)a6[2] + 2));
    xpc_dictionary_set_uint64(v12, "ts", a4);
    if (a3)
      xpc_dictionary_set_uint64(v12, "ttl", a3);
    if (byte_1ECCEBB42)
      xpc_dictionary_set_BOOL(v12, "quarantined", 1);
    if (a1)
    {
      v13 = *(unsigned __int8 **)(a1 + 24);
      if (v13)
        xpc_dictionary_set_data(v12, "subsystem", v13, v13[2] + (unint64_t)v13[3] + 4);
    }
    v14 = (void *)_os_trace_logd_send_with_reply();
    if (v14)
      xpc_release(v14);
    xpc_release(v12);
  }
}

uint64_t _os_trace_logd_send_with_reply()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = _os_trace_logd_pipe_copy(0);
  if (v0)
  {
    v1 = v0;
    if (xpc_pipe_routine() != 32)
    {
LABEL_5:
      xpc_release(v1);
      return 0;
    }
    v2 = _os_trace_logd_pipe_copy(v1);
    if (v2)
    {
      v1 = v2;
      xpc_pipe_routine();
      goto LABEL_5;
    }
  }
  return 0;
}

void *_os_trace_logd_pipe_copy(void *a1)
{
  void *v2;

  os_unfair_lock_lock_with_options();
  v2 = (void *)_event_pipe;
  if (a1)
  {
    if ((void *)_event_pipe == a1)
    {
      xpc_release(a1);
      v2 = 0;
    }
    xpc_release(a1);
  }
  if (v2 || (v2 = (void *)xpc_pipe_create(), (_event_pipe = (uint64_t)v2) != 0))
    xpc_retain(v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_event_lock);
  return v2;
}

void ___os_trace_paths_init_block_invoke()
{
  _os_trace_system_preferences_path = (uint64_t)"/System/Library/Preferences/Logging";
  _os_trace_os_cryptex_system_preferences_path = (uint64_t)"/System/Cryptexes/OS/System/Library/Preferences/Logging";
  _os_trace_app_cryptex_system_preferences_path = (uint64_t)"/System/Cryptexes/App/System/Library/Preferences/Logging";
  _os_trace_internal_preferences_path = (uint64_t)"/AppleInternal/Library/Preferences/Logging";
  _os_trace_preferences_path = (uint64_t)"/Library/Preferences/Logging";
}

uint64_t ___os_trace_allow_development_env_vars_block_invoke()
{
  uint64_t result;
  char v1;
  uint64_t v2;

  v2 = 0;
  result = amfi_check_dyld_policy_self(0, &v2);
  v1 = BYTE1(v2) & 1;
  if ((_DWORD)result)
    v1 = 0;
  _os_trace_allow_development_env_vars_allowed = v1;
  return result;
}

uint64_t amfi_check_dyld_policy_self(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  _QWORD v4[3];

  if (!a2)
    return 22;
  *a2 = 0;
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = a1;
  v4[2] = v4;
  result = __sandbox_ms();
  if ((_DWORD)result)
    result = *__error();
  *a2 = v4[0];
  return result;
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  uint64_t v6;

  _os_log((uint64_t)dso, (uint64_t)log, type, (uint64_t)format, (uint64_t)buf, *(uint64_t *)&size, v6);
}

uint64_t _os_trace_get_logd_port()
{
  if ((dword_1ECCEBAC8 & 0x100) != 0 || (MEMORY[0xFFFFFC104] & 0x100) != 0)
    return 0;
  if (client_has_mach_ports_disabled_once != -1)
    dispatch_once(&client_has_mach_ports_disabled_once, &__block_literal_global_33);
  if ((client_has_mach_ports_disabled_has_entitlement & 1) != 0)
    return 0;
  if (bootstrap_look_up2())
    return 0;
  return dword_1ECCEBACC;
}

uint64_t _libtrace_init()
{
  NSObject *v0;

  _os_trace_dsc_load_addr = _dyld_get_shared_cache_range();
  if (getpid() == 1)
    _os_trace_commpage_setup();
  dword_1ECCEBE20 = 0;
  _os_log_mask_callback = (uint64_t)_os_log_mask_callback_impl;
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qword_1ECCEBAA0 = (uint64_t)dispatch_queue_create("com.apple.libtrace.state.block-list", v0);
  dword_1ECCEBAD0 = _os_trace_create_debug_control_port();
  return voucher_activity_initialize_4libtrace();
}

uint64_t _os_trace_create_debug_control_port()
{
  task_t *v0;
  mach_port_name_t name;
  mach_port_options_t options;

  options.reserved[1] = 0;
  *(_OWORD *)&options.flags = xmmword_19BC06098;
  name = 0;
  v0 = (task_t *)MEMORY[0x1E0C883F0];
  if (mach_port_construct(*MEMORY[0x1E0C883F0], &options, 0x71B75ACEuLL, &name))
  {
    _os_assumes_log();
    return 0;
  }
  else
  {
    if (task_set_special_port(*v0, 10, name))
      _os_assumes_log();
    return name;
  }
}

uint64_t os_trace_set_mode(uint64_t result)
{
  if ((dword_1ECCEBAC8 & 0x100) == 0 && (MEMORY[0xFFFFFC104] & 0x100) == 0)
    dword_1ECCEBAC8 = result & 0xFFFFFF;
  return result;
}

void os_state_remove_handler(void *a1)
{
  _UNKNOWN **v2;
  _UNKNOWN **v3;
  _QWORD *v4;
  unsigned int v5;

  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  if ((dword_1ECCEBAC8 & 0x100) == 0 && (MEMORY[0xFFFFFC104] & 0x100) == 0)
  {
    v2 = &os_state_blocks;
    os_unfair_lock_lock_with_options();
    do
    {
      v2 = (_UNKNOWN **)*v2;
      if (!v2)
      {
        v2 = &off_1ECCEBA88;
        while (1)
        {
          v2 = (_UNKNOWN **)*v2;
          if (!v2)
            goto LABEL_11;
          if (v2[2] == a1)
          {
            v3 = (_UNKNOWN **)*v2;
            v4 = v2[1];
            if (*v2)
              goto LABEL_17;
            off_1ECCEBA90 = (_UNKNOWN **)v2[1];
            goto LABEL_19;
          }
        }
      }
    }
    while (*((_BYTE *)v2 + 60) || v2[2] != a1);
    if (byte_1ECCEBAA8)
    {
      *((_BYTE *)v2 + 60) = 1;
LABEL_11:
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECCEBA98);
      return;
    }
    v3 = (_UNKNOWN **)*v2;
    v4 = v2[1];
    if (*v2)
    {
LABEL_17:
      v3[1] = v4;
      v4 = v2[1];
    }
    else
    {
      off_1ECCEBA80 = (_UNKNOWN **)v2[1];
    }
LABEL_19:
    *v4 = v3;
    do
      v5 = __ldxr((unsigned int *)&dword_1ECCEBAAC);
    while (__stxr(v5 - 1, (unsigned int *)&dword_1ECCEBAAC));
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECCEBA98);
    _os_state_block_entry_free((uint64_t)v2);
  }
}

unint64_t os_log_set_hook(unsigned __int8 a1, void *aBlock)
{
  return _os_log_set_hook_impl(a1, 0, aBlock);
}

int *_os_trace_get_boot_uuid_slow(void *a1)
{
  int *result;
  uint64_t v2;
  size_t v3;

  v3 = 37;
  result = (int *)sysctlbyname("kern.bootsessionuuid", a1, &v3, 0, 0);
  if ((result & 0x80000000) != 0)
  {
    result = __error();
    v2 = *result;
    qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: Unable to grab boot uuid";
    qword_1EE40C120 = v2;
    __break(1u);
  }
  return result;
}

size_t _os_trace_metadata_init(uint64_t a1, uint64_t a2)
{
  pid_t v3;
  size_t result;
  __int16 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  off_1ECCEBAB8 = (_UNKNOWN *)a1;
  if (a2 != 2048)
  {
    qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: Invalid metadata buffer size";
    qword_1EE40C120 = a2;
    __break(1u);
LABEL_7:
    v6 = *__error();
    qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: Unable to get unique pid";
    qword_1EE40C120 = v6;
    __break(1u);
  }
  *(_WORD *)(a1 + 66) = 31;
  *(_QWORD *)(a1 + 16) = a1 + 56;
  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  v3 = getpid();
  if (proc_pidinfo(v3, 17, 0, &v7, 56) != 56)
    goto LABEL_7;
  *((_QWORD *)&xmmword_1ECCEBB00 + 1) = v8;
  *(_OWORD *)(a1 + 24) = v7;
  _dyld_get_shared_cache_uuid();
  strlcpy((char *)(a1 + 568), (const char *)xmmword_1ECCEBB00, 0x400uLL);
  result = strlen((const char *)(a1 + 568));
  v5 = result + 1;
  if (((result + 1) & 1) != 0)
    v5 = result + 2;
  *(_WORD *)(a1 + 4) = v5;
  *(_WORD *)(a1 + 2) = v5;
  return result;
}

uint64_t _os_trace_macho_for_each_slice(_DWORD *a1, unint64_t a2, uint64_t a3)
{
  uint64_t result;
  int v7;
  unsigned int v8;
  int v9;
  unint64_t v11;
  unsigned int *v12;
  unint64_t i;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;

  if (a2 < 4)
    return 88;
  v7 = *a1;
  result = 88;
  if (v7 > -805638659)
  {
    if (v7 != -17958193)
    {
      if (v7 == -17958194)
      {
LABEL_14:
        if (a2 < 0x1C)
          return result;
        return (*(uint64_t (**)(uint64_t, _DWORD *, unint64_t))(a3 + 16))(a3, a1, a2);
      }
      if (v7 != -805638658)
        return result;
    }
    if (a2 < 0x20)
      return result;
    return (*(uint64_t (**)(uint64_t, _DWORD *, unint64_t))(a3 + 16))(a3, a1, a2);
  }
  switch(v7)
  {
    case -1095041334:
      if (a2 < 8)
        return result;
      v8 = bswap32(a1[1]);
      v9 = 1;
      break;
    case -889275714:
      if (a2 < 8)
        return result;
      v9 = 0;
      v8 = a1[1];
      break;
    case -822415874:
      goto LABEL_14;
    default:
      return result;
  }
  if (20 * v8 == 20 * v8 && a2 - 8 >= 20 * v8)
  {
    v11 = v8;
    if (!v8)
      return 0;
    v12 = a1 + 5;
    for (i = 1; ; ++i)
    {
      v14 = *(v12 - 1);
      if (v9)
      {
        v14 = bswap32(v14);
        v15 = bswap32(*v12);
      }
      else
      {
        v15 = *v12;
      }
      if (a2 < v14 || a2 - v14 < v15)
        break;
      result = (*(uint64_t (**)(uint64_t, char *, _QWORD))(a3 + 16))(a3, (char *)a1 + v14, v15);
      if ((_DWORD)result)
        v16 = 1;
      else
        v16 = i >= v11;
      v12 += 5;
      if (v16)
        return result;
    }
    return 88;
  }
  return result;
}

uint64_t _os_trace_getxattr_at(int a1, const char *a2, int a3, const char *a4, void *a5, size_t a6)
{
  int v9;
  int v10;
  ssize_t v11;
  ssize_t v12;
  int v13;
  uint64_t result;
  int v15;
  int v16;

  v9 = openat(a1, a2, a3 | 0x1000004);
  if (v9 < 0)
    return -1;
  v10 = v9;
  v11 = fgetxattr(v9, a4, a5, a6, 0, 0);
  if (v11 == -1)
  {
    v15 = *__error();
    if (close(v10) == -1)
    {
      v16 = *__error();
      result = *__error();
      if (v16 == 9)
        goto LABEL_13;
      _os_assumes_log();
    }
    *__error() = v15;
    return -1;
  }
  v12 = v11;
  if (close(v10) != -1)
    return v12;
  v13 = *__error();
  result = *__error();
  if (v13 != 9)
  {
    _os_assumes_log();
    return v12;
  }
  qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE40C120 = result;
  __break(1u);
LABEL_13:
  qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE40C120 = result;
  __break(1u);
  return result;
}

uint64_t os_trace_get_mode()
{
  unsigned int v0;
  int v1;
  unsigned int v3;

  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  if (dword_1ECCEBAD4 != -1)
    _os_trace_prefs_and_mode_refresh_slow(dword_1ECCEBAD4);
  v0 = dword_1ECCEBAD8;
  v1 = dword_1ECCEBADC;
  if (dword_1ECCEBADC != dword_1ECCEBAD8)
  {
    while (1)
    {
      v3 = __ldxr((unsigned int *)&dword_1ECCEBADC);
      if (v3 != v1)
        break;
      if (!__stxr(v0, (unsigned int *)&dword_1ECCEBADC))
      {
        _os_log_preferences_refresh_process();
        return dword_1ECCEBAC8;
      }
    }
    __clrex();
  }
  return dword_1ECCEBAC8;
}

uint64_t ___os_log_set_hook_impl_block_invoke()
{
  uint64_t result;

  result = pthread_key_create((pthread_key_t *)&_os_log_hook_thread_key, 0);
  if ((_DWORD)result)
  {
    _os_assert_log();
    result = _os_crash();
    __break(1u);
  }
  return result;
}

void _os_trace_init_slow()
{
  int v0;
  void *main;
  void *info_dictionary;
  void *v3;
  const char *string;
  xpc_object_t dictionary;
  int v6;
  char *v7;
  char *v8;
  char *v9;
  int v10;
  int v11;
  uint32_t v12;
  uint32_t v13;
  uint32_t i;
  mach_header *image_header;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  const char *v21;
  char v22;
  size_t v23;
  _OWORD v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  int v55[2];
  int v56;
  pid_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C874D8];
  if ((dword_1ECCEBAC8 & 0x100) == 0 && (MEMORY[0xFFFFFC104] & 0x100) == 0)
  {
    v0 = *__error();
    _dyld_get_prog_image_header();
    *(_QWORD *)&xmmword_1ECCEBB00 = dyld_image_path_containing_address();
    main = (void *)xpc_bundle_create_main();
    info_dictionary = (void *)xpc_bundle_get_info_dictionary();
    if (info_dictionary)
    {
      v3 = info_dictionary;
      string = xpc_dictionary_get_string(info_dictionary, "CFBundleIdentifier");
      if (string)
        qword_1ECCEBB50 = (uint64_t)strdup(string);
      dictionary = xpc_dictionary_get_dictionary(v3, "OSLogPreferences");
      if (dictionary)
        qword_1ECCEBB48 = (uint64_t)xpc_retain(dictionary);
    }
    xpc_release(main);
    if (_os_trace_allow_development_env_vars_once != -1)
      dispatch_once(&_os_trace_allow_development_env_vars_once, &__block_literal_global_37);
    v6 = _os_trace_allow_development_env_vars_allowed;
    voucher_activity_get_metadata_buffer();
    v7 = getenv("OS_ACTIVITY_MODE");
    v8 = getenv("OS_ACTIVITY_STREAM");
    v9 = getenv("OS_ACTIVITY_PROPAGATE_MODE");
    v10 = dword_1ECCEBAC8;
    if (v8 && !strcasecmp(v8, "live"))
      v10 |= 8u;
    if (v9)
      v11 = v10 | 0x10000;
    else
      v11 = v10;
    if (v7)
    {
      if (!strcasecmp(v7, "info"))
      {
        v11 |= 1u;
      }
      else if (!strcasecmp(v7, "debug"))
      {
        v11 |= 3u;
      }
      else if (!strcasecmp(v7, "off"))
      {
        v11 |= 0x400u;
      }
      else if (!strcasecmp(v7, "disable"))
      {
        v11 |= 0x100u;
      }
      else if (!strcasecmp(v7, "stream"))
      {
        v11 |= 0xBu;
        if (isatty(2))
          fputs("use OS_ACTIVITY_STREAM for configuring streaming.\n", (FILE *)*MEMORY[0x1E0C874E0]);
      }
    }
    dword_1ECCEBAC8 = v11;
    *(uint64_t *)((char *)&qword_1ECCEBB30 + 4) = 0x70000000BLL;
    arc4random_buf(&xmmword_1ECCEBB10, 8uLL);
    if (byte_1ECCEBB3D)
    {
      v12 = _dyld_image_count();
      if (v12)
      {
        v13 = v12;
        for (i = 0; i != v13; ++i)
        {
          image_header = (mach_header *)_dyld_get_image_header(i);
          if (image_header)
            _os_trace_image_was_loaded(image_header);
        }
      }
    }
    else
    {
      _dyld_register_func_for_add_image((void (__cdecl *)(const mach_header *, intptr_t))_os_trace_image_was_loaded);
      _dyld_register_func_for_remove_image((void (__cdecl *)(const mach_header *, intptr_t))_os_trace_image_was_unloaded);
    }
    voucher_activity_flush();
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    memset(v24, 0, sizeof(v24));
    LODWORD(v25) = 0;
    *(_QWORD *)v55 = 0xE00000001;
    v56 = 1;
    v57 = getpid();
    v23 = 648;
    sysctl(v55, 4u, v24, &v23, 0, 0);
    if ((v25 & 0x800) != 0)
    {
      if (!v7)
        dword_1ECCEBAC8 |= 3u;
    }
    else if (issetugid())
    {
      goto LABEL_61;
    }
    v16 = getenv("ACTIVITY_LOG_STDERR");
    if (!v16)
      v16 = getenv("CFLOG_FORCE_STDERR");
    if (v6 && v16)
      byte_1ECCEBB3E = 1;
    v17 = getenv("OS_ACTIVITY_DT_MODE");
    if (v6 && v17)
      byte_1ECCEBB3F = 1;
    v18 = getenv("OS_ACTIVITY_TOOLS_PRIVACY");
    if (v6 && v18)
      byte_1ECCEBB40 = 1;
    v19 = getenv("OS_ACTIVITY_TOOLS_OVERSIZE");
    if (v6)
    {
      if (v19)
        byte_1ECCEBB41 = 1;
    }
    v20 = getenv("OS_LOG_FAULT_REPORTS");
    if (!v20)
      goto LABEL_61;
    v21 = v20;
    if (!strcasecmp(v20, "always"))
    {
      v22 = 2;
      goto LABEL_60;
    }
    if (!strcasecmp(v21, "off"))
    {
      v22 = 3;
LABEL_60:
      byte_1ECCEBB44 = v22;
    }
LABEL_61:
    *__error() = v0;
  }
}

BOOL os_log_is_debug_enabled(os_log_t log)
{
  return os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
}

void _os_activity_label_useraction_impl(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t refreshed;
  unsigned int v6;
  int v7;
  unint64_t *v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  _OWORD *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  int v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unsigned int v34;
  _OWORD *v35;
  uint64_t v36;
  _DWORD v37[12];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  _OWORD *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C874D8];
  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  v56 = 0;
  v57 = 0;
  v55 = 0;
  refreshed = dword_1ECCEBAD4;
  if (dword_1ECCEBAD4 != -1)
    refreshed = (uint64_t)_os_trace_prefs_and_mode_refresh_slow(dword_1ECCEBAD4);
  v6 = dword_1ECCEBAD8;
  v7 = dword_1ECCEBADC;
  if (dword_1ECCEBADC != dword_1ECCEBAD8)
  {
    while (1)
    {
      v30 = __ldxr((unsigned int *)&dword_1ECCEBADC);
      if (v30 != v7)
        break;
      if (!__stxr(v6, (unsigned int *)&dword_1ECCEBADC))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }
    __clrex();
  }
LABEL_6:
  if ((dword_1ECCEBAC8 & 0x500) == 0 && (MEMORY[0xFFFFFC104] & 0x500) == 0)
  {
    if (off_1ECCEBAB8)
      v8 = (unint64_t *)((char *)off_1ECCEBAB8 + 8);
    else
      v8 = 0;
    if (_os_trace_dsc_load_addr <= a1 && _os_trace_dsc_size + _os_trace_dsc_load_addr > a1)
    {
      v9 = v2 - _os_trace_dsc_load_addr;
      LODWORD(v56) = v2 - _os_trace_dsc_load_addr;
      WORD2(v56) = (unint64_t)(v2 - _os_trace_dsc_load_addr) >> 32;
      v57 = 0;
      if (WORD2(v56))
      {
        v35 = 0;
        v10 = 6;
        HIWORD(v56) = 6;
        v36 = 0x100000000;
        if (!a2)
          goto LABEL_52;
      }
      else
      {
        HIDWORD(v56) = 0x40000;
        v35 = 0;
        v10 = 4;
        v36 = 1;
        if (!a2)
          goto LABEL_52;
      }
LABEL_44:
      v22 = _os_trace_dsc_load_addr;
      if (_os_trace_dsc_load_addr <= a1)
      {
        if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= a1)
          v22 = a1;
        v23 = a2 - v22;
      }
      else
      {
        v23 = a2 - a1;
      }
      v24 = v23 & 0x7FFFFFFF | ((unint64_t)(unsigned __int16)(v23 >> 31) << 32);
      goto LABEL_53;
    }
    if (*(_DWORD *)(a1 + 12) == 2)
    {
      v35 = 0;
      v9 = v2 - a1;
      LODWORD(v56) = v2 - a1;
      WORD2(v56) = (v2 - a1) >> 32;
      v10 = 4;
      HIWORD(v56) = 4;
      v57 = 0;
      v36 = 1;
      goto LABEL_43;
    }
    if (off_1ECCEBAB8)
    {
      do
      {
        while (1)
        {
          v11 = __ldxr(v8);
          if (!(_DWORD)v11)
            break;
          __clrex();
          refreshed = _os_trace_rwptr_rdlock_wait((uint64_t)v8);
        }
      }
      while (__stxr(v11 + 0x200000000, v8));
      v12 = v8[1];
      v13 = *(unsigned __int16 *)(v12 + 10);
      v14 = (a1 >> *MEMORY[0x1E0C88818]) % v13;
      while (1)
      {
        v15 = v12 + 16 * v14;
        v16 = *(_QWORD *)(v15 + 16);
        if (v16 == a1)
          break;
        if (v14 + 1 == v13)
          v14 = 0;
        else
          ++v14;
        if (v16)
          v17 = v14 == (a1 >> *MEMORY[0x1E0C88818]) % v13;
        else
          v17 = 1;
        if (v17)
        {
          v18 = 0;
          goto LABEL_35;
        }
      }
      v18 = *(_OWORD **)(v15 + 24);
LABEL_35:
      v19 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      do
      {
        v20 = __ldxr(v8);
        v21 = v20 - 0x200000000;
        if (v21 == 0x100000000)
          v21 = v19;
      }
      while (__stxr(v21, v8));
      if (v21 == v19)
      {
        __dmb(9u);
        _os_trace_rwptr_cleanup((uint64_t)v8);
      }
      v57 = v18;
      if (v18)
      {
        v35 = v18;
        v36 = 0;
        v9 = v2 - a1;
        LODWORD(v56) = v2 - a1;
        WORD2(v56) = (v2 - a1) >> 32;
        v10 = 20;
        HIWORD(v56) = 20;
LABEL_43:
        if (a2)
          goto LABEL_44;
LABEL_52:
        v24 = 0;
LABEL_53:
        v55 = v24;
        MEMORY[0x1E0C86820](refreshed);
        v26 = (char *)&v35 - v25;
        bzero((char *)&v35 - v25, v10 + 2 * ((v24 & 0xFFFF00000000) != 0));
        if (HIDWORD(v36))
        {
          *(_DWORD *)v26 = v56;
          *((_WORD *)v26 + 2) = WORD2(v56);
        }
        else
        {
          *(_DWORD *)v26 = v9;
          if ((v36 & 1) == 0)
            *(_OWORD *)(v26 + 4) = *v35;
        }
        if ((v24 & 0xFFFF00000000) != 0)
          *(_WORD *)&v26[v10] = WORD2(v24);
        if ((dword_1ECCEBAC8 & 8) != 0 || (MEMORY[0xFFFFFC104] & 8) != 0)
          LODWORD(v27) = 1;
        else
          v27 = ((unint64_t)voucher_get_activity_id() >> 59) & 1;
        v28 = v27 & *(_DWORD *)&byte_1ECCEBB38;
        v53 = 0;
        v54 = 0;
        v52 = 0;
        if ((v27 & *(_DWORD *)&byte_1ECCEBB38) == 1)
        {
          if (mach_get_times())
            _os_assumes_log();
        }
        else
        {
          v54 = mach_continuous_time();
        }
        _os_get_logging_unreliable_for_current_thread();
        v50 = v26;
        v51 = v10 + 2 * ((v24 & 0xFFFF00000000) != 0);
        v29 = voucher_activity_trace_v_2();
        if (v28)
        {
          v31 = v29;
          v32 = _os_trace_diagnosticd_pipe(0);
          if (v32)
          {
            v33 = v32;
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            memset(v37, 0, sizeof(v37));
            if (v31 <= 6u && ((1 << v31) & 0x58) != 0)
              v34 = v31 << 8;
            else
              v34 = bswap32(v31) >> 16;
            v37[0] = v34;
            *((_QWORD *)&v38 + 1) = v31;
            *(_QWORD *)&v39 = v54;
            *(_QWORD *)&v41 = v52;
            *((_QWORD *)&v41 + 1) = (v53 / 0x3E8);
            *(_QWORD *)&v44 = a2;
            BYTE8(v44) = 1;
            _os_activity_stream_reflect((uint64_t)v32, (uint64_t)v37, a1, -3, (unsigned int *)&v56, (uint64_t)&v55);
            xpc_release(v33);
          }
        }
        return;
      }
    }
    else
    {
      v57 = 0;
    }
    v35 = 0;
    LODWORD(v56) = v2;
    WORD2(v56) = WORD2(v2);
    v10 = 6;
    HIWORD(v56) = 6;
    v36 = 0x100000000;
    v9 = v2;
    if (a2)
      goto LABEL_44;
    goto LABEL_52;
  }
}

uint64_t _os_log_fmt_flatten_coder(uint64_t a1, void *a2, size_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_class *v14;
  size_t InstanceSize;
  char *v16;
  size_t v17;
  _QWORD *v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BYTE **v23;
  void *v24;
  __int16 v25;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C874D8];
  v14 = (objc_class *)objc_opt_class();
  InstanceSize = class_getInstanceSize(v14);
  v16 = (char *)v27 - ((MEMORY[0x1E0C86820](InstanceSize) + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v16, v17);
  v18 = objc_constructInstance(v14, v16);
  v18[1] = a1;
  v18[3] = a6;
  v18[4] = a7;
  *((_BYTE *)v18 + 40) = a4;
  *((_BYTE *)v18 + 214) = a5 != 0;
  v18[25] = a3;
  if (a5)
    v19 = 1;
  else
    v19 = a4 > 1;
  if ((*(_BYTE *)a1 & 1) != 0)
    v20 = 1;
  else
    v20 = *(_BYTE *)a1 & 2;
  if (v19)
    v21 = v20 | 0x100;
  else
    v21 = v20;
  v22 = (void *)MEMORY[0x1A1AC9A28]();
  objc_msgSend(a2, "encodeWithOSLogCoder:options:maxLength:", v18, v21, a3);
  objc_autoreleasePoolPop(v22);
  if (objc_msgSend(v18, "retainCount") != 1)
  {
    qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: A reference to the coder escaped";
    __break(1u);
  }
  v23 = (_BYTE **)v18[2];
  if (v23 == v18 + 6)
  {
    *((_WORD *)v18 + 105) = *(_DWORD *)(a6 + 8);
    *((_WORD *)v18 + 104) = _os_log_fmt_flatten_masked_data((_BYTE *)a1, a4, a5, a6, *v23, *((unsigned int *)v18 + 14), a3, (_BYTE *)v18 + 212);
    if ((*((_WORD *)v18 + 34) & 1) != 0)
    {
      v24 = *v23;
      *v23 = (_BYTE *)3954044928;
      *((_WORD *)v23 + 10) = 0;
      free(v24);
    }
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a1 & 0xF | 0x30;
  }
  v25 = v18[26] & 0x7FFF | (*((unsigned __int8 *)v18 + 212) << 15);
  *(_WORD *)(a1 + 2) = *((_WORD *)v18 + 105);
  *(_WORD *)(a1 + 4) = v25;
  return *((unsigned __int16 *)v18 + 104);
}

unint64_t _os_log_set_hook_impl(unsigned __int8 a1, uint64_t a2, void *aBlock)
{
  const void *v3;
  uint64_t v4;
  unsigned __int8 v5;
  int v6;
  unsigned int enablement_value;
  int v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;

  if (!aBlock)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_15;
  }
  v3 = aBlock;
  v4 = a2;
  v5 = a1;
  if (_os_log_set_hook_impl_once != -1)
LABEL_15:
    dispatch_once(&_os_log_set_hook_impl_once, &__block_literal_global_78);
LABEL_3:
  v6 = _os_log_hook_level;
  if (_os_log_hook_level)
  {
    enablement_value = _os_log_get_enablement_value(_os_log_hook_level);
    if (enablement_value < _os_log_get_enablement_value(v5))
      v5 = v6;
  }
  do
  {
    v8 = __ldxr((unsigned __int8 *)&_os_log_hook_level);
    if (v8 != v6)
    {
      __clrex();
      goto LABEL_3;
    }
  }
  while (__stxr(v5, (unsigned __int8 *)&_os_log_hook_level));
  do
    v9 = __ldxr((unint64_t *)&_os_log_hook_params);
  while (__stxr(v9 | v4, (unint64_t *)&_os_log_hook_params));
  v10 = _Block_copy(v3);
  do
    v11 = __ldxr((unint64_t *)&_os_log_hook);
  while (__stxr((unint64_t)v10, (unint64_t *)&_os_log_hook));
  return v11;
}

Class __os_log_fmt_object_for_data_block_invoke()
{
  Class result;

  os_log_fmt_object_for_data__NSString = (uint64_t)objc_getClass("NSString");
  os_log_fmt_object_for_data__NSNumber = (uint64_t)objc_getClass("NSNumber");
  result = objc_getClass("NSData");
  os_log_fmt_object_for_data__NSData = (uint64_t)result;
  return result;
}

void *_os_trace_load_formatter(uint64_t a1)
{
  void *result;
  char __str[1024];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C874D8];
  snprintf(__str, 0x400uLL, "%sliblog_%s.dylib", (&plugin_dirs)[2 * *(_QWORD *)(a1 + 16)], *(const char **)(a1 + 8));
  result = dlopen(__str, 6);
  *(_QWORD *)(a1 + 16) = result;
  if (result)
  {
    *(_QWORD *)(a1 + 24) = dlsym(result, "OSLogCopyFormattedString");
    result = dlsym(*(void **)(a1 + 16), "OSStateCreateStringWithData");
    *(_QWORD *)(a1 + 32) = result;
  }
  return result;
}

void _os_trace_rwptr_cleanup(uint64_t a1)
{
  _BYTE **v2;
  _BYTE *v3;
  _BYTE *v4;
  int v5;
  unsigned int v6;

  v2 = *(_BYTE ***)(a1 + 8);
  v3 = *v2;
  if (*v2)
  {
    do
    {
      v4 = *(_BYTE **)v3;
      if (v3[12])
        free(v3);
      v3 = v4;
    }
    while (v4);
  }
  *v2 = 0;
  v5 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    v6 = __ldxr((unsigned int *)a1);
  while (__stlxr(0, (unsigned int *)a1));
  if (v6 != v5)
    _os_trace_rwptr_wrunlock_slow(a1, v5, v6);
}

uint64_t amfi_check_dyld_policy_for_pid(int a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  _QWORD v5[3];
  int v6;
  int v7;

  if (!a3)
    return 22;
  *a3 = 0;
  v7 = -1431655766;
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  v5[1] = a2;
  v5[2] = v5;
  v6 = a1;
  result = __sandbox_ms();
  if ((_DWORD)result)
    result = *__error();
  *a3 = v5[0];
  return result;
}

uint64_t amfi_load_trust_cache()
{
  return __sandbox_ms();
}

void *_os_log_get_nscf_formatter()
{
  return _NSCF_function;
}

uint64_t _os_log_fmt_flatten_object_impl(_BYTE *a1, unsigned int a2, uint64_t a3, void *a4, size_t a5, uint64_t a6, uint64_t a7, size_t a8, char a9)
{
  uint64_t Name;
  size_t v18;
  const char *v19;
  char *v20;
  char *v22;
  char v23;
  int v24;
  _BYTE *v25;
  int v26;
  double v27;
  const char *v28;
  double v29;
  double v30;
  uint64_t v31;
  const unsigned __int8 *bytes;
  float v33;
  uint64_t v35;
  _BOOL4 value;
  double v37;
  _BYTE v38[7];
  char v39;
  time_t v40;
  char *__stringp;
  char out[64];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C874D8];
  v39 = a9;
  Name = objc_msgSend(a4, "isProxy");
  if ((Name & 1) != 0)
  {
LABEL_2:
    v18 = a5;
    if (a8 >= 0x400)
    {
      while (1)
      {
        v22 = (char *)malloc_type_malloc(a8, 0x91D685AAuLL);
        if (v22)
          break;
        _os_trace_temporary_resource_shortage();
      }
      v20 = v22;
      v19 = _os_log_fmt_flatten_NSCF(a4, v22, a8, &v39);
    }
    else
    {
      MEMORY[0x1E0C86820](Name);
      bzero(&v38[-((a8 + 15) & 0xFFFFFFFFFFFFFFF0)], a8);
      v19 = _os_log_fmt_flatten_NSCF(a4, &v38[-((a8 + 15) & 0xFFFFFFFFFFFFFFF0)], a8, &v39);
      v20 = 0;
    }
    goto LABEL_66;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return _os_log_fmt_flatten_coder((uint64_t)a1, a4, a8, a2, a3, a6, a7);
  __stringp = out;
  if (object_isClass(a4))
  {
    Name = (uint64_t)class_getName((Class)a4);
    goto LABEL_11;
  }
  if (objc_msgSend(a4, "isNSString"))
  {
    v24 = objc_msgSend(a4, "isNSCFConstantString") ^ 1;
    Name = objc_msgSend(a4, "_fastCStringContents:", 1);
    v23 = v24;
    v19 = (const char *)Name;
    if (!Name)
      goto LABEL_2;
    goto LABEL_65;
  }
  if (objc_msgSend(a4, "isNSNumber"))
  {
    v25 = (_BYTE *)objc_msgSend(a4, "objCType");
    v23 = 0;
    v26 = (char)*v25;
    v19 = "<NSNumber: invalid type>";
    if (v26 > 80)
    {
      switch(*v25)
      {
        case 'c':
          goto LABEL_43;
        case 'd':
          objc_msgSend(a4, "doubleValue");
          v28 = "%0.16g";
          goto LABEL_52;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_65;
        case 'f':
          objc_msgSend(a4, "floatValue");
          v27 = v33;
          v28 = "%0.7g";
          goto LABEL_52;
        case 'i':
          *(double *)&v31 = COERCE_DOUBLE(objc_msgSend(a4, "intValue"));
          v28 = "%d";
          goto LABEL_63;
        case 'l':
          *(double *)&v31 = COERCE_DOUBLE(objc_msgSend(a4, "longValue"));
          v28 = "%ld";
          goto LABEL_63;
        case 'q':
          *(double *)&v31 = COERCE_DOUBLE(objc_msgSend(a4, "longLongValue"));
          goto LABEL_60;
        case 's':
          *(_QWORD *)&v30 = (int)objc_msgSend(a4, "shortValue");
          v28 = "%hi";
          break;
        default:
          if (v26 == 81)
          {
            *(double *)&v31 = COERCE_DOUBLE(objc_msgSend(a4, "unsignedLongLongValue"));
            goto LABEL_62;
          }
          if (v26 != 83)
            goto LABEL_65;
          *(_QWORD *)&v30 = objc_msgSend(a4, "unsignedShortValue");
          v28 = "%hu";
          break;
      }
LABEL_57:
      v37 = v30;
      goto LABEL_64;
    }
    if (v26 <= 72)
    {
      if (v26 == 66)
      {
LABEL_43:
        *(_QWORD *)&v30 = (int)objc_msgSend(a4, "charValue");
        v28 = "%d";
      }
      else
      {
        if (v26 != 67)
          goto LABEL_65;
        *(_QWORD *)&v30 = objc_msgSend(a4, "unsignedCharValue");
        v28 = "%u";
      }
      goto LABEL_57;
    }
    if (v26 == 73)
    {
      *(double *)&v31 = COERCE_DOUBLE(objc_msgSend(a4, "unsignedIntValue"));
      v28 = "%u";
    }
    else
    {
      if (v26 != 76)
        goto LABEL_65;
      *(double *)&v31 = COERCE_DOUBLE(objc_msgSend(a4, "unsignedLongValue"));
      v28 = "%lu";
    }
LABEL_63:
    v37 = *(double *)&v31;
    goto LABEL_64;
  }
  if (objc_msgSend(a4, "isNSDate"))
  {
    objc_msgSend(a4, "timeIntervalSince1970");
    v40 = (uint64_t)v29;
    Name = (uint64_t)ctime_r(&v40, out);
    if (!Name)
    {
      v19 = 0;
LABEL_12:
      v23 = 0;
      if (!v19)
        goto LABEL_2;
      goto LABEL_65;
    }
    Name = (uint64_t)strsep(&__stringp, "\n\r");
LABEL_11:
    v19 = (const char *)Name;
    goto LABEL_12;
  }
  objc_opt_class();
  Name = objc_opt_isKindOfClass();
  if ((Name & 1) == 0)
    goto LABEL_2;
  Name = (uint64_t)object_getClass(a4);
  if (Name != MEMORY[0x1E0C89020])
  {
    if (Name == MEMORY[0x1E0C89030])
    {
      bytes = xpc_uuid_get_bytes(a4);
      v19 = out;
      uuid_unparse_upper(bytes, out);
      v23 = 1;
      goto LABEL_65;
    }
    if (Name == MEMORY[0x1E0C89010])
    {
      *(double *)&v31 = COERCE_DOUBLE(xpc_int64_get_value(a4));
LABEL_60:
      v28 = "%lld";
    }
    else
    {
      if (Name != MEMORY[0x1E0C89028])
      {
        if (Name != MEMORY[0x1E0C88FF0])
        {
          if (Name == MEMORY[0x1E0C88FC8])
          {
            value = xpc_BOOL_get_value(a4);
            v23 = 0;
            if (value)
              v19 = "true";
            else
              v19 = "false";
            goto LABEL_65;
          }
          if (Name == MEMORY[0x1E0C89018])
          {
            v23 = 0;
            v19 = "(null)";
            goto LABEL_65;
          }
          if (Name != MEMORY[0x1E0C89000])
          {
            if (Name == MEMORY[0x1E0C88FE0])
              goto LABEL_2;
            v23 = 0;
            v19 = "<xpc object>";
            goto LABEL_65;
          }
          Name = (uint64_t)xpc_dictionary_get_string(a4, (const char *)*MEMORY[0x1E0C88FA8]);
          goto LABEL_11;
        }
        v27 = xpc_double_get_value(a4);
        v28 = "%f";
LABEL_52:
        v37 = v27;
LABEL_64:
        v19 = out;
        __sprintf_chk(out, 0, 0x40uLL, v28, *(_QWORD *)&v37);
        v23 = 0;
        goto LABEL_65;
      }
      *(double *)&v31 = COERCE_DOUBLE(xpc_uint64_get_value(a4));
LABEL_62:
      v28 = "%llu";
    }
    goto LABEL_63;
  }
  Name = (uint64_t)xpc_string_get_string_ptr(a4);
  v19 = (const char *)Name;
  v23 = 1;
  if (!Name)
    goto LABEL_2;
LABEL_65:
  v18 = a5;
  v20 = 0;
  v39 = v23;
LABEL_66:
  if ((*a1 & 7) == 0 && v39 != 0)
    *a1 |= 1u;
  v35 = _os_log_fmt_flatten_to_blob((uint64_t)a1, a2, a3, a4, v18, a6, a7, a8, (unint64_t)v19, 0);
  free(v20);
  return v35;
}

uint64_t _os_trace_rwptr_rdlock_wait(uint64_t result)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;

  v1 = (unint64_t *)result;
  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    do
    {
LABEL_2:
      v3 = __ldxr(v1);
      if (!(_DWORD)v3)
      {
LABEL_15:
        __clrex();
        return result;
      }
      if ((v3 & 0xFFFFFFFE) == v3)
      {
        __clrex();
        break;
      }
    }
    while (__stxr(v3 & 0xFFFFFFFE, v1));
    if (((v3 ^ v2) & 0xFFFFFFFE) == 0)
      break;
    while (1)
    {
      result = __ulock_wait();
      if ((result & 0x80000000) == 0)
        break;
      result = (uint64_t)__error();
      v4 = *(_DWORD *)result;
      if (*(_DWORD *)result != 4)
      {
        if (v4 > 0x3C || ((1 << v4) & 0x1000000000004001) == 0)
        {
          qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: ulock_wait() failed";
          qword_1EE40C120 = (int)v4;
          __break(1u);
          goto LABEL_15;
        }
        goto LABEL_2;
      }
    }
  }
  qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: trying to lock recursively";
  __break(1u);
  return result;
}

void _os_trace_rwptr_wrunlock_slow(uint64_t a1, int a2, unsigned int a3)
{
  int v3;
  BOOL v4;

  if ((a3 ^ a2) > 1)
  {
    v3 = a3;
    qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: lock not owned by current thread";
    qword_1EE40C120 = a3;
    __break(1u);
LABEL_11:
    qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: ulock_wake() failed";
    qword_1EE40C120 = v3;
    __break(1u);
  }
  else
  {
    while ((__ulock_wake() & 0x80000000) != 0)
    {
      v3 = *__error();
      if (v3 != 4)
      {
        if (v3)
          v4 = v3 == 2;
        else
          v4 = 1;
        if (v4)
          return;
        goto LABEL_11;
      }
    }
  }
}

void _os_activity_stream_reflect(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unsigned int *a5, uint64_t a6)
{
  char *v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int tm_isdst;
  unint64_t v20;
  xpc_object_t v21;
  _QWORD block[7];
  tm v23;
  time_t v24;
  _QWORD v25[3];
  int v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C874D8];
  v11 = (char *)off_1ECCEBAB8;
  v27[0] = 0;
  v27[1] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2000000000;
  v26 = 0;
  *(_DWORD *)(a2 + 4) = getpid();
  *(_QWORD *)(a2 + 8) = *((_QWORD *)&xmmword_1ECCEBB00 + 1);
  *(_DWORD *)(a2 + 16) = geteuid();
  if (v11)
    v12 = v11 + 24;
  else
    v12 = 0;
  *(_QWORD *)(a2 + 24) = v12;
  *(_QWORD *)(a2 + 32) = xmmword_1ECCEBB00;
  *(_QWORD *)(a2 + 40) = voucher_get_activity_id();
  v13 = *a5 | ((unint64_t)*((unsigned __int16 *)a5 + 2) << 32);
  if (*(_DWORD *)(a3 + 12) == 2)
  {
    *(_QWORD *)(a2 + 120) = v13;
  }
  else if (*((_QWORD *)a5 + 1))
  {
    *(_QWORD *)(a2 + 120) = v13;
    v12 = (_QWORD *)*((_QWORD *)a5 + 1);
  }
  else
  {
    if (!_dyld_get_image_uuid())
      goto LABEL_22;
    v14 = _os_trace_dsc_load_addr;
    if (_os_trace_dsc_load_addr <= a3)
    {
      if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= a3)
        v14 = 0;
      v13 += v14;
    }
    *(_QWORD *)(a2 + 120) = v13 - a3;
    v12 = v27;
  }
  *(_QWORD *)(a2 + 80) = v12;
  v15 = *(_DWORD *)a6;
  if (*(int *)a6 >= 0)
    v16 = v15 & 0x7FFFFFFF | ((unint64_t)*(unsigned __int16 *)(a6 + 4) << 31);
  else
    v16 = v15 & 0x7FFFFFFF | ((unint64_t)*(unsigned __int16 *)(a6 + 4) << 31) | 0x8000000000000000;
  *(_QWORD *)(a2 + 128) = v16;
  v17 = dyld_image_path_containing_address();
  v18 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a2 + 88) = v17;
  *(_QWORD *)(a2 + 72) = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  if (!v18)
    gettimeofday((timeval *)(a2 + 96), 0);
  if (!*(_DWORD *)(a2 + 112))
  {
    v24 = *(_QWORD *)(a2 + 96);
    memset(&v23, 0, sizeof(v23));
    localtime_r(&v24, &v23);
    tm_isdst = v23.tm_isdst;
    v20 = ((unsigned __int128)(v23.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v23.tm_gmtoff;
    *(_DWORD *)(a2 + 112) = (v20 >> 5) + (v20 >> 63) + 60 * v23.tm_isdst;
    *(_DWORD *)(a2 + 116) = tm_isdst;
  }
  v21 = _os_activity_stream_entry_encode((unsigned int *)a2);
  xpc_dictionary_set_uint64(v21, "action", 6uLL);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = ___os_activity_stream_reflect_block_invoke;
  block[3] = &unk_1E3C92EA8;
  block[5] = a1;
  block[6] = v21;
  block[4] = v25;
  dispatch_block_perform(DISPATCH_BLOCK_DETACHED, block);
  xpc_release(v21);
LABEL_22:
  _Block_object_dispose(v25, 8);
}

xpc_object_t _os_activity_stream_entry_encode(unsigned int *a1)
{
  xpc_object_t v2;
  const unsigned __int8 *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int v10;
  const unsigned __int8 *v11;
  const char *v12;
  const char *v13;
  const void *v14;
  size_t v15;
  const unsigned __int8 *v16;
  const char *v17;
  const char *v18;
  char v19;
  const char *v20;
  const unsigned __int8 *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const void *v25;
  size_t v26;
  const void *v27;
  size_t v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const unsigned __int8 *v32;
  const char *v33;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "pid", (int)a1[1]);
  xpc_dictionary_set_uint64(v2, "procid", *((_QWORD *)a1 + 1));
  xpc_dictionary_set_uint64(v2, "uid", a1[4]);
  v3 = (const unsigned __int8 *)*((_QWORD *)a1 + 3);
  if (v3)
    xpc_dictionary_set_uuid(v2, "procuuid", v3);
  v4 = (const char *)*((_QWORD *)a1 + 4);
  if (v4)
    xpc_dictionary_set_string(v2, "procpath", v4);
  v5 = *((_QWORD *)a1 + 5);
  if (v5)
    xpc_dictionary_set_uint64(v2, "aid", v5);
  v6 = *((_QWORD *)a1 + 6);
  if (v6)
    xpc_dictionary_set_uint64(v2, "paid", v6);
  xpc_dictionary_set_uint64(v2, "type", *a1);
  if ((a1[34] & 1) != 0)
    xpc_dictionary_set_BOOL(v2, "32bits", 1);
  v7 = *((_QWORD *)a1 + 12);
  if (v7)
  {
    xpc_dictionary_set_int64(v2, "timeGMTsec", v7);
    xpc_dictionary_set_int64(v2, "timeGMTusec", (int)a1[26]);
  }
  v8 = (int)a1[29];
  if ((_DWORD)v8)
    xpc_dictionary_set_int64(v2, "timezoneDSTflag", v8);
  v9 = (int)a1[28];
  if ((_DWORD)v9)
    xpc_dictionary_set_int64(v2, "timezoneMinutesWest", v9);
  v10 = *a1;
  if ((int)*a1 > 767)
  {
    if (v10 == 1536)
    {
      xpc_dictionary_set_uint64(v2, "signpostid", *((_QWORD *)a1 + 26));
      v20 = (const char *)*((_QWORD *)a1 + 27);
      if (v20)
        xpc_dictionary_set_string(v2, "signpostname", v20);
    }
    else if (v10 != 1024)
    {
      if (v10 == 768)
      {
        xpc_dictionary_set_uint64(v2, "traceid", *((_QWORD *)a1 + 7));
        xpc_dictionary_set_uint64(v2, "thread", *((_QWORD *)a1 + 9));
        xpc_dictionary_set_uint64(v2, "timestamp", *((_QWORD *)a1 + 8));
        xpc_dictionary_set_uint64(v2, "offset", *((_QWORD *)a1 + 15));
        xpc_dictionary_set_uint64(v2, "formatoffset", *((_QWORD *)a1 + 16));
        xpc_dictionary_set_value(v2, "payload", *((xpc_object_t *)a1 + 21));
        v11 = (const unsigned __int8 *)*((_QWORD *)a1 + 10);
        if (v11)
          xpc_dictionary_set_uuid(v2, "imageuuid", v11);
        v12 = (const char *)*((_QWORD *)a1 + 11);
        if (v12)
          xpc_dictionary_set_string(v2, "imagepath", v12);
        v13 = (const char *)*((_QWORD *)a1 + 18);
        if (v13)
          xpc_dictionary_set_string(v2, "name", v13);
        v14 = (const void *)*((_QWORD *)a1 + 19);
        if (v14)
        {
          v15 = *((_QWORD *)a1 + 20);
          if (v15)
            xpc_dictionary_set_data(v2, "buffer", v14, v15);
        }
      }
      return v2;
    }
    xpc_dictionary_set_uint64(v2, "traceid", *((_QWORD *)a1 + 7));
    xpc_dictionary_set_uint64(v2, "thread", *((_QWORD *)a1 + 9));
    xpc_dictionary_set_uint64(v2, "timestamp", *((_QWORD *)a1 + 8));
    xpc_dictionary_set_uint64(v2, "offset", *((_QWORD *)a1 + 15));
    xpc_dictionary_set_uint64(v2, "formatoffset", *((_QWORD *)a1 + 16));
    v21 = (const unsigned __int8 *)*((_QWORD *)a1 + 10);
    if (v21)
      xpc_dictionary_set_uuid(v2, "imageuuid", v21);
    v22 = (const char *)*((_QWORD *)a1 + 11);
    if (v22)
      xpc_dictionary_set_string(v2, "imagepath", v22);
    v23 = (const char *)*((_QWORD *)a1 + 18);
    if (v23)
    {
      xpc_dictionary_set_string(v2, "name", v23);
      v24 = (const char *)*((_QWORD *)a1 + 18);
      if (v24)
        xpc_dictionary_set_string(v2, "formatstring", v24);
    }
    v25 = (const void *)*((_QWORD *)a1 + 19);
    if (v25)
    {
      v26 = *((_QWORD *)a1 + 20);
      if (v26)
        xpc_dictionary_set_data(v2, "buffer", v25, v26);
    }
    v27 = (const void *)*((_QWORD *)a1 + 21);
    if (v27)
    {
      v28 = *((_QWORD *)a1 + 22);
      if (v28)
        xpc_dictionary_set_data(v2, "privdata", v27, v28);
    }
    v29 = (const char *)*((_QWORD *)a1 + 24);
    if (v29)
      xpc_dictionary_set_string(v2, "category", v29);
    v30 = (const char *)*((_QWORD *)a1 + 23);
    if (v30)
      xpc_dictionary_set_string(v2, "subsystem", v30);
    v19 = *((_BYTE *)a1 + 205);
LABEL_59:
    xpc_dictionary_set_BOOL(v2, "persisted", v19);
    return v2;
  }
  if (v10 != 513)
  {
    if (v10 != 515)
      return v2;
    xpc_dictionary_set_uint64(v2, "traceid", *((_QWORD *)a1 + 7));
    xpc_dictionary_set_uint64(v2, "thread", *((_QWORD *)a1 + 9));
    xpc_dictionary_set_uint64(v2, "timestamp", *((_QWORD *)a1 + 8));
    xpc_dictionary_set_uint64(v2, "offset", *((_QWORD *)a1 + 15));
    xpc_dictionary_set_uint64(v2, "formatoffset", *((_QWORD *)a1 + 16));
    v16 = (const unsigned __int8 *)*((_QWORD *)a1 + 10);
    if (v16)
      xpc_dictionary_set_uuid(v2, "imageuuid", v16);
    v17 = (const char *)*((_QWORD *)a1 + 11);
    if (v17)
      xpc_dictionary_set_string(v2, "imagepath", v17);
    v18 = (const char *)*((_QWORD *)a1 + 18);
    if (v18)
      xpc_dictionary_set_string(v2, "name", v18);
    v19 = *((_BYTE *)a1 + 152);
    goto LABEL_59;
  }
  xpc_dictionary_set_uint64(v2, "traceid", *((_QWORD *)a1 + 7));
  xpc_dictionary_set_uint64(v2, "thread", *((_QWORD *)a1 + 9));
  xpc_dictionary_set_uint64(v2, "timestamp", *((_QWORD *)a1 + 8));
  v31 = (const char *)*((_QWORD *)a1 + 18);
  if (v31)
    xpc_dictionary_set_string(v2, "name", v31);
  v32 = (const unsigned __int8 *)*((_QWORD *)a1 + 10);
  if (v32)
    xpc_dictionary_set_uuid(v2, "imageuuid", v32);
  v33 = (const char *)*((_QWORD *)a1 + 11);
  if (v33)
    xpc_dictionary_set_string(v2, "imagepath", v33);
  xpc_dictionary_set_uint64(v2, "offset", *((_QWORD *)a1 + 15));
  xpc_dictionary_set_uint64(v2, "formatoffset", *((_QWORD *)a1 + 16));
  return v2;
}

void ___os_activity_stream_reflect_block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;

  v2 = *(void **)(a1 + 40);
  while (1)
  {
    v3 = xpc_pipe_simpleroutine();
    if (v3 != 32)
      break;
    if (v2 != *(void **)(a1 + 40))
      xpc_release(v2);
    v2 = _os_trace_diagnosticd_pipe(v2);
    if (!v2)
    {
      v4 = 32;
      goto LABEL_10;
    }
  }
  v4 = v3;
  if (v2 && v2 != *(void **)(a1 + 40))
    xpc_release(v2);
LABEL_10:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
}

void _os_trace_image_was_unloaded(unint64_t a1)
{
  _QWORD *v2;
  unsigned int *v3;
  unsigned int v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  if (off_1ECCEBAB8
    && (_os_trace_dsc_load_addr > a1 || _os_trace_dsc_size + _os_trace_dsc_load_addr <= a1)
    && _dyld_get_image_uuid())
  {
    mach_continuous_time();
    voucher_activity_trace();
    v2 = off_1ECCEBAB8;
    v3 = (unsigned int *)((char *)off_1ECCEBAB8 + 8);
    v4 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    while (!__ldaxr(v3))
    {
      if (!__stxr(v4, v3))
        goto LABEL_10;
    }
    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_10:
    v6 = v2[2];
    v7 = *(unsigned __int16 *)(v6 + 10);
    v8 = (a1 >> *MEMORY[0x1E0C88818]) % v7;
    while (1)
    {
      v9 = v6 + 16 * v8;
      v10 = *(_QWORD *)(v9 + 16);
      if (v10 == a1)
        break;
      if (v8 + 1 == v7)
        v8 = 0;
      else
        ++v8;
      if (v10)
        v11 = v8 == (a1 >> *MEMORY[0x1E0C88818]) % v7;
      else
        v11 = 1;
      if (v11)
        goto LABEL_35;
    }
    v12 = (unint64_t *)(v9 + 16);
    *(_QWORD *)(v6 + 16 + 16 * v8 + 8) = 0;
    --*(_WORD *)(v6 + 8);
    v13 = *(unsigned __int16 *)(v6 + 10);
    if (v8 + 1 < v13)
      v14 = v8 + 1;
    else
      v14 = 0;
    v15 = *(_QWORD *)(v6 + 16 + 16 * v14);
    if (v15)
      v16 = -1;
    else
      v16 = 0;
    atomic_store(v16, v12);
    if (!v15)
    {
      if (!v8)
        v8 = v13;
      v17 = v8 - 1;
      v18 = v6 + 16 * v17;
      if (*(_QWORD *)(v18 + 16) == -1)
      {
        v19 = (_QWORD *)(v18 + 16);
        do
        {
          *v19 = 0;
          if (!v17)
            v17 = v13;
          --v17;
          v19 = (_QWORD *)(v6 + 16 * v17 + 16);
        }
        while (*v19 == -1);
      }
    }
LABEL_35:
    _os_trace_rwptr_wrunlock((uint64_t)(v2 + 1), (_QWORD *)v6);
  }
}

void _os_trace_send_sections_to_logd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6;
  xpc_object_t v7;
  uint64_t i;

  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = xpc_array_create(0, 0);
  for (i = 0; i != 40; i += 8)
    xpc_array_set_data(v7, 0xFFFFFFFFFFFFFFFFLL, (const void *)(a2 + *(unsigned int *)(a3 + i + 16)), *(unsigned int *)(a3 + i + 20));
  xpc_dictionary_set_uint64(v6, "operation", 4uLL);
  xpc_dictionary_set_uuid(v6, "uuid", (const unsigned __int8 *)a1);
  xpc_dictionary_set_string(v6, "path", (const char *)(a1 + 32));
  xpc_dictionary_set_value(v6, "sections", v7);
  xpc_release(v7);
  _os_trace_logd_send();
  xpc_release(v6);
}

void _os_trace_mig_server(uint64_t a1, mach_msg_header_t *a2)
{
  int *v3;
  size_t v4;
  int v5;
  mach_port_t msgh_remote_port;
  mach_msg_id_t msgh_id;
  uint64_t (*v8)();
  int v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C874D8];
  v3 = (int *)((char *)v11 - ((MEMORY[0x1E0C86820]() + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v3, v4);
  v5 = a2->msgh_bits & 0x1F;
  msgh_remote_port = a2->msgh_remote_port;
  *v3 = v5;
  v3[1] = 36;
  msgh_id = a2->msgh_id;
  v3[4] = 0;
  v3[5] = msgh_id + 100;
  v3[2] = msgh_remote_port;
  v3[3] = 0;
  if ((msgh_id - 50003) < 0xFFFFFFFD
    || (v8 = ostracemig_do_libtraceMIG_subsystem[5 * (msgh_id - 50000) + 5]) == 0)
  {
    *((_QWORD *)v3 + 3) = *MEMORY[0x1E0C87D40];
    v3[8] = -303;
LABEL_7:
    a2->msgh_remote_port = 0;
    mach_msg_destroy(a2);
    return;
  }
  ((void (*)(mach_msg_header_t *, int *))v8)(a2, v3);
  if (*v3 < 0)
  {
    v9 = 0;
  }
  else
  {
    v9 = v3[8];
    if (v9)
      goto LABEL_11;
  }
  if (v5 == 18)
  {
    v10 = v3[5];
    qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: _os_trace_mig_server doesn't handle replies";
    qword_1EE40C120 = v10;
    __break(1u);
    return;
  }
LABEL_11:
  if (v9 != -305 && v9)
    goto LABEL_7;
}

void _libtrace_fork_child()
{
  __int128 v0;

  if (qword_1ECCEBB28)
  {
    xpc_pipe_invalidate();
    xpc_release((xpc_object_t)qword_1ECCEBB28);
  }
  memset(&v0, 0, 17);
  dword_1ECCEBAD0 = 0;
  *(_OWORD *)&qword_1ECCEBAC0 = 0u;
  *(_OWORD *)&_os_trace = 0u;
  dword_1ECCEBAD4 = -2;
  dword_1ECCEBAD8 = 0;
  dword_1ECCEBADC = -1;
  dword_1ECCEBAE8 = 0;
  qword_1ECCEBAE0 = 0;
  dword_1ECCEBAEC = -1;
  byte_1ECCEBB3C = 0;
  *(_DWORD *)&byte_1ECCEBB38 = 0;
  qword_1ECCEBB30 = 0;
  *(_OWORD *)&qword_1ECCEBB20 = v0;
  xmmword_1ECCEBB10 = 0u;
  xmmword_1ECCEBAF0 = 0u;
  xmmword_1ECCEBB00 = 0u;
  byte_1ECCEBB3D = 1;
  word_1ECCEBB5E = 0;
  *(_OWORD *)((char *)&qword_1ECCEBB48 + 6) = 0u;
  *(_OWORD *)&byte_1ECCEBB3E = 0u;
  dword_1ECCEBAD0 = _os_trace_create_debug_control_port();
  if (_event_pipe)
  {
    xpc_pipe_invalidate();
    xpc_release((xpc_object_t)_event_pipe);
    _event_pipe = 0;
  }
  _event_lock = 0;
}

char *_os_trace_atm_diagnostic_config(_DWORD *a1)
{
  char *result;
  int v3;
  unsigned int v4;
  char *__endptr;
  size_t v6;
  char __big[1024];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  v6 = 1024;
  if (sysctlbyname("kern.bootargs", __big, &v6, 0, 0))
    return 0;
  result = strcasestr(__big, "atm_diagnostic_config=");
  if (result)
  {
    __endptr = 0;
    v3 = strtoul(result + 22, &__endptr, 16);
    if (__endptr)
    {
      v4 = *__endptr;
      if (*__endptr)
      {
        if ((v4 & 0x80000000) != 0)
        {
          result = (char *)__maskrune(v4, 0x4000uLL);
          if (!(_DWORD)result)
            return result;
        }
        else
        {
          result = (char *)(*(_DWORD *)(MEMORY[0x1E0C87458] + 4 * v4 + 60) & 0x4000);
          if (!(_DWORD)result)
            return result;
        }
      }
    }
    *a1 = v3;
    return (char *)1;
  }
  return result;
}

uint64_t _os_trace_prefs_latest_version_4tests()
{
  unsigned __int8 v0;

  if ((byte_1ECCEBB3C & 1) == 0 && _dispatch_is_multithreaded())
  {
    do
      v0 = __ldxr((unsigned __int8 *)&byte_1ECCEBB3C);
    while (__stxr(1u, (unsigned __int8 *)&byte_1ECCEBB3C));
    if ((v0 & 1) == 0)
      _os_log_watch_for_prefchanges();
  }
  return dword_1ECCEBAD8;
}

BOOL _os_trace_mode_match_4tests(int a1)
{
  unsigned __int8 v2;

  if ((byte_1ECCEBB3C & 1) == 0 && _dispatch_is_multithreaded())
  {
    do
      v2 = __ldxr((unsigned __int8 *)&byte_1ECCEBB3C);
    while (__stxr(1u, (unsigned __int8 *)&byte_1ECCEBB3C));
    if ((v2 & 1) == 0)
      _os_log_watch_for_prefchanges();
  }
  return (dword_1ECCEBAC8 & a1) != 0
      || (MEMORY[0xFFFFFC104] & a1) != 0
      || (_BYTE)a1 && (((unint64_t)voucher_get_activity_id() >> 56) & a1) != 0;
}

uint64_t _os_trace_set_diagnostic_flags(uint32_t a1)
{
  host_t v2;
  uint64_t v3;

  v2 = MEMORY[0x1A1AC9908]();
  v3 = host_set_atm_diagnostic_flag(v2, a1);
  mach_port_deallocate(*MEMORY[0x1E0C883F0], v2);
  return v3;
}

uint64_t _os_trace_commpage_compute(int a1, int a2, int a3, int a4, char a5)
{
  unsigned int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v11;

  v5 = a1 & 0x8000000 | 0x80000000;
  if (a1 >= 0)
    v5 = a1 & 0x8000000;
  if (a2 && (v5 |= 0x60000000u, (a5 & 1) == 0))
  {
    v11 = a1 & 0x8000000 | 0x71000000;
    if (!a4)
      v11 = v5;
    if (a1 >= 0)
      return v11;
    else
      return v5;
  }
  else
  {
    v6 = a3 ^ 1 | a1 | v5;
    v7 = v6 & 0xEEFFFFFF;
    v8 = v6 | 0x11000001;
    if (!a4)
      v8 = v7;
    v9 = v5 | 1;
    if (a1 < 0)
      return v9;
    else
      return v8;
  }
}

uint64_t _os_trace_update_with_datavolume_4launchd()
{
  os_variant_check();
  return _os_trace_commpage_setup();
}

uint64_t _os_trace_commpage_setup()
{
  int v0;
  int has_internal_diagnostics;
  unsigned int v2;
  uint64_t result;

  v0 = MEMORY[0xFFFFFC104];
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v2 = v0 & 0xEEFFFFFE | 1;
  if (has_internal_diagnostics)
    v2 = v0 | 0x11000001;
  if (v0 < 0)
    result = v0 & 0x8000000 | 0x80000001;
  else
    result = v2;
  if ((_DWORD)result != v0)
    return _os_trace_set_diagnostic_flags(result);
  return result;
}

void _os_trace_debug_channel_handler(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2;
  mach_msg_header_t *msg;

  if (a2 == 2)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
    _os_trace_mig_server(48, msg);
  }
  else if (a2 == 1 && (byte_1ECCEBB3C & 1) == 0 && _dispatch_is_multithreaded())
  {
    do
      v2 = __ldxr((unsigned __int8 *)&byte_1ECCEBB3C);
    while (__stxr(1u, (unsigned __int8 *)&byte_1ECCEBB3C));
    if ((v2 & 1) == 0)
      _os_log_watch_for_prefchanges();
  }
}

uint64_t _os_trace_get_reconnect_info(uint64_t a1)
{
  uint64_t v1;
  mach_vm_size_t *v2;
  uint32_t v3;
  uint32_t v4;
  uint32_t v5;
  const mach_header *image_header;
  mach_header *v7;
  const char *image_name;
  char *v9;
  size_t v10;
  unint64_t v11;
  char v12;
  char v13;
  int v14;
  _BYTE *v15;
  unint64_t v16;
  int v17;
  char v18;
  int v19;
  _BYTE *v20;
  _OWORD *v21;
  __int128 v22;
  int v23;
  size_t v24;
  int v25;
  int v26;
  _BYTE *v27;
  size_t v28;
  int v29;
  int v30;
  _BYTE *v31;
  uint64_t i;
  uint64_t j;
  unsigned __int8 *v34;
  unint64_t v35;
  char v36;
  char v37;
  int v38;
  _BYTE *v39;
  unint64_t v40;
  int v41;
  int v42;
  int v43;
  _BYTE *v44;
  size_t v45;
  int v46;
  int v47;
  _BYTE *v48;
  size_t v49;
  mach_vm_size_t v50;
  uint64_t v51;
  mach_vm_size_t *v53;
  mach_vm_address_t *address;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t __src;
  uuid_t uu;
  __int128 v61;
  char v62;
  uint64_t v63;

  v1 = MEMORY[0x1E0C86820](a1);
  v53 = v2;
  address = (mach_vm_address_t *)v1;
  v63 = *MEMORY[0x1E0C874D8];
  v58 = 0;
  __src = 0;
  v57 = 0x1000000100000;
  v55 = &v62;
  v56 = 0x100000000000;
  v3 = _dyld_image_count();
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    while (1)
    {
      image_header = _dyld_get_image_header(v5);
      if (image_header)
      {
        v7 = (mach_header *)image_header;
        if ((_os_trace_dsc_load_addr > (unint64_t)image_header
           || _os_trace_dsc_size + _os_trace_dsc_load_addr <= (unint64_t)image_header)
          && image_header->filetype != 2)
        {
          image_name = _dyld_get_image_name(v5);
          if (image_name)
          {
            v9 = (char *)image_name;
            v10 = strlen(image_name);
            *(_OWORD *)uu = 0u;
            v61 = (unint64_t)v7;
            *((_QWORD *)&v61 + 1) = _os_trace_get_image_info(v7, 0, uu, 0, 1);
            if (*((_QWORD *)&v61 + 1))
              break;
          }
        }
      }
LABEL_26:
      if (v4 == ++v5)
        goto LABEL_33;
    }
    LOBYTE(v11) = v10 + 33;
    LODWORD(v58) = 3;
    HIDWORD(v58) = v10 + 33;
    v12 = BYTE4(v57);
    if ((v57 & 0x200000000) == 0)
    {
      v13 = BYTE6(v57);
      v14 = v56;
      if ((SBYTE6(v57) + HIDWORD(v56) - v56 - 1) <= 7)
      {
        os_trace_blob_add_slow((uint64_t)&v55, &v58, 8uLL);
        v12 = BYTE4(v57);
        if ((v57 & 0x200000000) == 0)
        {
LABEL_14:
          v18 = BYTE6(v57);
          v19 = v56;
          if ((SBYTE6(v57) + HIDWORD(v56) - v56 - 1) <= 0x1F)
          {
            os_trace_blob_add_slow((uint64_t)&v55, uu, 0x20uLL);
            v12 = BYTE4(v57);
          }
          else
          {
            v20 = v55;
            v21 = (char *)v55 + v56;
            v22 = v61;
            *v21 = *(_OWORD *)uu;
            v21[1] = v22;
            v23 = v19 + 32;
            LODWORD(v56) = v23;
            if (!v18)
              v20[v23] = 0;
          }
        }
LABEL_17:
        if ((v12 & 2) == 0)
        {
          v24 = v10 + 1;
          v25 = v56;
          if (v24 > (SBYTE6(v57) + HIDWORD(v56) - v56 - 1))
          {
            os_trace_blob_add_slow((uint64_t)&v55, v9, v24);
          }
          else
          {
            v26 = BYTE6(v57);
            v27 = v55;
            memcpy((char *)v55 + v56, v9, v24);
            LODWORD(v56) = v25 + v24;
            if (!v26)
              v27[(v25 + v24)] = 0;
          }
        }
        if ((v11 & 7) != 0 && (v57 & 0x200000000) == 0)
        {
          v28 = 8 - (v11 & 7);
          v29 = v56;
          if (SBYTE6(v57) + HIDWORD(v56) - (int)v56 - 1 < v28)
          {
            os_trace_blob_add_slow((uint64_t)&v55, &__src, v28);
          }
          else
          {
            v30 = BYTE6(v57);
            v31 = v55;
            memcpy((char *)v55 + v56, &__src, v28);
            LODWORD(v56) = v29 + v28;
            if (!v30)
              v31[(v29 + v28)] = 0;
          }
        }
        goto LABEL_26;
      }
      v15 = v55;
      v16 = v58;
      *(_QWORD *)((char *)v55 + v56) = v58;
      v17 = v14 + 8;
      LODWORD(v56) = v17;
      v11 = HIDWORD(v16);
      if (!v13)
        v15[v17] = 0;
    }
    if ((v12 & 2) == 0)
      goto LABEL_14;
    goto LABEL_17;
  }
LABEL_33:
  os_unfair_lock_lock_with_options();
  for (i = 0; i != 64; ++i)
  {
    for (j = _os_log_globals[i]; j; j = *(_QWORD *)(j + 16))
    {
      if ((*(_BYTE *)(j + 63) & 4) != 0)
      {
        v34 = *(unsigned __int8 **)(j + 24);
        LODWORD(v35) = v34[2] + v34[3] + 4;
        LODWORD(v58) = 2;
        HIDWORD(v58) = v35;
        v36 = BYTE4(v57);
        if ((v57 & 0x200000000) == 0)
        {
          v37 = BYTE6(v57);
          v38 = v56;
          if ((SBYTE6(v57) + HIDWORD(v56) - v56 - 1) <= 7)
          {
            os_trace_blob_add_slow((uint64_t)&v55, &v58, 8uLL);
            v36 = BYTE4(v57);
          }
          else
          {
            v39 = v55;
            v40 = v58;
            *(_QWORD *)((char *)v55 + v56) = v58;
            v41 = v38 + 8;
            LODWORD(v56) = v41;
            v35 = HIDWORD(v40);
            if (!v37)
              v39[v41] = 0;
          }
        }
        if ((v36 & 2) == 0)
        {
          v42 = v56;
          if (SBYTE6(v57) + HIDWORD(v56) - (int)v56 - 1 < v35)
          {
            os_trace_blob_add_slow((uint64_t)&v55, v34, v35);
          }
          else
          {
            v43 = BYTE6(v57);
            v44 = v55;
            memcpy((char *)v55 + v56, v34, v35);
            LODWORD(v56) = v42 + v35;
            if (!v43)
              v44[(v42 + v35)] = 0;
          }
        }
        if ((v35 & 7) != 0 && (v57 & 0x200000000) == 0)
        {
          v45 = 8 - (v35 & 7);
          v46 = v56;
          if (SBYTE6(v57) + HIDWORD(v56) - (int)v56 - 1 < v45)
          {
            os_trace_blob_add_slow((uint64_t)&v55, &__src, v45);
          }
          else
          {
            v47 = BYTE6(v57);
            v48 = v55;
            memcpy((char *)v55 + v56, &__src, v45);
            LODWORD(v56) = v46 + v45;
            if (!v47)
              v48[(v46 + v45)] = 0;
          }
        }
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1ECCEBE20);
  *address = 0;
  v49 = v56;
  v50 = ~*MEMORY[0x1E0C88810] & (*MEMORY[0x1E0C88810] + v56);
  *v53 = v50;
  if (!v50)
    return 0;
  v51 = mach_vm_allocate(*MEMORY[0x1E0C883F0], address, v50, 1);
  if (!(_DWORD)v51)
    memcpy((void *)*address, v55, v49);
  if ((v57 & 0x100000000) != 0)
    free(v55);
  return v51;
}

void __LIBTRACE_CLIENT_QUARANTINED_DUE_TO_HIGH_LOGGING_VOLUME__()
{
  uint8_t v0[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_fault_impl(&dword_19BBEC000, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "QUARANTINED DUE TO HIGH LOGGING VOLUME", v0, 2u);
  }
  byte_1ECCEBB42 = 1;
}

void __client_has_mach_ports_disabled_block_invoke()
{
  void *v0;

  v0 = (void *)xpc_copy_entitlement_for_token();
  if (v0 == (void *)MEMORY[0x1E0C88F90])
  {
    client_has_mach_ports_disabled_has_entitlement = 1;
    goto LABEL_5;
  }
  if (v0)
LABEL_5:
    xpc_release(v0);
}

void _os_trace_with_buffer(void *dso, const char *message, uint8_t type, const void *buffer, size_t buffer_size, os_trace_payload_t payload)
{
  uint64_t v6;
  int v10;
  unsigned int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t activity_id;
  char v19;
  unsigned int v20;
  uint64_t v21;
  unint64_t *v22;
  _OWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  BOOL v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  int v43;
  uint64_t v44;
  char *v45;
  int v46;
  uint64_t v47;
  size_t v48;
  size_t v49;
  char *v50;
  size_t v51;
  size_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55[2];
  uint64_t v56;
  uint64_t v57;
  _BOOL4 v58;
  int v59;
  const void *v60;
  unint64_t v61;
  uint64_t v62;
  _OWORD *v63;
  uint64_t v64;

  v10 = type;
  v64 = *MEMORY[0x1E0C874D8];
  if (dyld_sdk_at_least())
  {
    if (_os_trace != -1)
      dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
    if (dword_1ECCEBAD4 != -1)
      _os_trace_prefs_and_mode_refresh_slow(dword_1ECCEBAD4);
    v13 = dword_1ECCEBAD8;
    v14 = dword_1ECCEBADC;
    if (dword_1ECCEBADC != dword_1ECCEBAD8)
    {
      while (1)
      {
        v20 = __ldxr((unsigned int *)&dword_1ECCEBADC);
        if (v20 != v14)
          break;
        if (!__stxr(v13, (unsigned int *)&dword_1ECCEBADC))
        {
          _os_log_preferences_refresh_process();
          goto LABEL_7;
        }
      }
      __clrex();
    }
LABEL_7:
    if ((dword_1ECCEBAC8 & 0x500) == 0 && (MEMORY[0xFFFFFC104] & 0x500) == 0)
    {
      v62 = 0;
      v63 = 0;
      v61 = 0;
      v55[0] = (uint64_t)payload;
      if (((dword_1ECCEBAC8 & 8) != 0
         || (MEMORY[0xFFFFFC104] & 8) != 0
         || (voucher_get_activity_id() & 0x800000000000000) != 0)
        && (byte_1ECCEBB38 & 2) != 0)
      {
        if (v10 == 2)
        {
          v15 = (BYTE4(qword_1ECCEBB30) >> 1) & 1;
          goto LABEL_40;
        }
        if (v10 == 4)
        {
          v15 = BYTE4(qword_1ECCEBB30) & 1;
LABEL_16:
          if ((dword_1ECCEBAC8 & 3) != 0 || (MEMORY[0xFFFFFC104] & 3) != 0)
          {
            v58 = 0;
          }
          else
          {
            activity_id = voucher_get_activity_id();
            if ((activity_id & 0x300000000000000) != 0)
              v19 = 1;
            else
              v19 = v15;
            if ((v19 & 1) == 0)
              return;
            v58 = (activity_id & 0x300000000000000) == 0;
          }
          v16 = 256;
          goto LABEL_46;
        }
        v15 = (BYTE4(qword_1ECCEBB30) >> 3) & 1;
      }
      else
      {
        v15 = 0;
      }
      if (v10 > 64)
      {
        v16 = 4096;
        v17 = 4352;
        if (v10 != 193)
          v17 = 0;
        v58 = 0;
        if (v10 != 65)
          v16 = v17;
LABEL_46:
        v57 = v16;
LABEL_47:
        if (off_1ECCEBAB8)
          v22 = (unint64_t *)((char *)off_1ECCEBAB8 + 8);
        else
          v22 = 0;
        v59 = v15;
        if (_os_trace_dsc_load_addr <= (unint64_t)dso
          && _os_trace_dsc_size + _os_trace_dsc_load_addr > (unint64_t)dso)
        {
          LODWORD(v62) = v6 - _os_trace_dsc_load_addr;
          WORD2(v62) = (unint64_t)(v6 - _os_trace_dsc_load_addr) >> 32;
          v63 = 0;
          v23 = 0;
          if (WORD2(v62))
          {
            v24 = 6;
            HIWORD(v62) = 6;
          }
          else
          {
            HIDWORD(v62) = 0x40000;
            v24 = 4;
          }
          goto LABEL_84;
        }
        if (*((_DWORD *)dso + 3) == 2)
        {
          v23 = 0;
          LODWORD(v62) = v6 - (_DWORD)dso;
          WORD2(v62) = (unint64_t)(v6 - (_QWORD)dso) >> 32;
          v24 = 4;
          HIWORD(v62) = 4;
          v63 = 0;
LABEL_84:
          if (message)
          {
            v35 = _os_trace_dsc_load_addr;
            if (_os_trace_dsc_load_addr <= (unint64_t)dso)
            {
              if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= (unint64_t)dso)
                v35 = (uint64_t)dso;
              v36 = (unint64_t)&message[-v35];
            }
            else
            {
              v36 = message - (_BYTE *)dso;
            }
            v37 = v36 & 0x7FFFFFFF | ((unint64_t)(unsigned __int16)(v36 >> 31) << 32);
          }
          else
          {
            v37 = 0;
          }
          v61 = v37;
          v38 = v24 + 2 * ((v37 & 0xFFFF00000000) != 0);
          v45 = (char *)v55 - MEMORY[0x1E0C86820]((v38 + 1039) & 0xFFFFFFFFFFFFFFF0);
          if (v46)
          {
            *(_DWORD *)v45 = v62;
            *((_WORD *)v45 + 2) = WORD2(v62);
          }
          else
          {
            *(_DWORD *)v45 = v43;
            if ((v42 & 1) == 0)
              *(_OWORD *)(v45 + 4) = *v23;
          }
          if (v44)
          {
            v39 = v39 | 0x20;
            *(_WORD *)&v45[v41] = WORD2(v37);
          }
          v60 = buffer;
          v55[1] = v40;
          v56 = v39;
          if (buffer_size > 0x3FF)
          {
            v47 = *((char *)buffer + buffer_size - 1);
            if (*((char *)buffer + buffer_size - 1))
            {
              v48 = 0;
              v49 = 0;
              v50 = (char *)buffer + buffer_size + ~v47;
              while (1)
              {
                v51 = v49 + (v50[v48] & 0x3F);
                v52 = v48 + 1;
                if (v48 + 1 + v51 >= 0x401)
                  break;
                ++v48;
                v49 = v51;
                if (v47 == v52)
                  goto LABEL_107;
              }
              memcpy(&v45[v38], v60, v49);
              memcpy(&v45[v38 + v49], v50, v48);
              v45[v49 + v38 + v48] = v48;
            }
          }
          else
          {
            memcpy(&v45[v38], buffer, buffer_size);
          }
LABEL_107:
          v53 = mach_continuous_time();
          v54 = ((unint64_t)v56 << 16) | (v37 << 32) | v57 | 3;
          if (!v58)
            v54 = voucher_activity_trace();
          if (v59)
            _os_trace_stream((unint64_t)dso, (uint64_t)message, (unsigned int *)&v62, (uint64_t)&v61, (uint64_t)v60, (void *)buffer_size, v54, v53, v55[0]);
          return;
        }
        if (off_1ECCEBAB8)
        {
          do
          {
            while (1)
            {
              v25 = __ldxr(v22);
              if (!(_DWORD)v25)
                break;
              __clrex();
              _os_trace_rwptr_rdlock_wait((uint64_t)v22);
            }
          }
          while (__stxr(v25 + 0x200000000, v22));
          v26 = v22[1];
          v27 = *(unsigned __int16 *)(v26 + 10);
          v28 = ((unint64_t)dso >> *MEMORY[0x1E0C88818]) % v27;
          while (1)
          {
            v29 = v26 + 16 * v28;
            v30 = *(void **)(v29 + 16);
            if (v30 == dso)
              break;
            if (v28 + 1 == v27)
              v28 = 0;
            else
              ++v28;
            if (v30)
              v31 = v28 == ((unint64_t)dso >> *MEMORY[0x1E0C88818]) % v27;
            else
              v31 = 1;
            if (v31)
            {
              v23 = 0;
              goto LABEL_73;
            }
          }
          v23 = *(_OWORD **)(v29 + 24);
LABEL_73:
          v32 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
          do
          {
            v33 = __ldxr(v22);
            v34 = v33 - 0x200000000;
            if (v34 == 0x100000000)
              v34 = v32;
          }
          while (__stxr(v34, v22));
          if (v34 == v32)
          {
            __dmb(9u);
            _os_trace_rwptr_cleanup((uint64_t)v22);
          }
          v63 = v23;
          if (v23)
          {
            LODWORD(v62) = v6 - (_DWORD)dso;
            WORD2(v62) = (unint64_t)(v6 - (_QWORD)dso) >> 32;
            v24 = 20;
            HIWORD(v62) = 20;
            goto LABEL_84;
          }
        }
        else
        {
          v63 = 0;
        }
        v23 = 0;
        LODWORD(v62) = v6;
        WORD2(v62) = WORD2(v6);
        v24 = 6;
        HIWORD(v62) = 6;
        goto LABEL_84;
      }
      if (v10 != 2)
      {
        if (v10 != 4)
        {
          v58 = 0;
          v57 = 0;
          goto LABEL_47;
        }
        goto LABEL_16;
      }
LABEL_40:
      if ((dword_1ECCEBAC8 & 2) != 0 || (MEMORY[0xFFFFFC104] & 2) != 0)
      {
        v58 = 0;
      }
      else
      {
        v21 = voucher_get_activity_id();
        if (((((v21 & 0x200000000000000uLL) >> 57) | v15) & 1) == 0)
          return;
        v58 = (v21 & 0x200000000000000) == 0;
      }
      v16 = 512;
      goto LABEL_46;
    }
  }
}

void _os_trace_stream(unint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v17;
  void *v18;
  unsigned int v19;
  xpc_object_t v20;
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  xpc_object_t object[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v17 = _os_trace_diagnosticd_pipe(0);
  if (v17)
  {
    v18 = v17;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    *(_OWORD *)object = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    memset(v21, 0, sizeof(v21));
    if (a7 <= 6u && ((1 << a7) & 0x58) != 0)
      v19 = a7 << 8;
    else
      v19 = bswap32(a7) >> 16;
    LODWORD(v21[0]) = v19;
    *((_QWORD *)&v22 + 1) = a7;
    *(_QWORD *)&v23 = a8;
    *(_QWORD *)&v28 = a2;
    *((_QWORD *)&v28 + 1) = a5;
    object[0] = a6;
    if (a9)
    {
      v20 = xpc_dictionary_create(0, 0, 0);
      (*(void (**)(uint64_t, xpc_object_t))(a9 + 16))(a9, v20);
      if (xpc_dictionary_get_count(v20))
        object[1] = v20;
      else
        xpc_release(v20);
    }
    _os_activity_stream_reflect((uint64_t)v18, (uint64_t)v21, a1, -3, a3, a4);
    if (object[1])
    {
      xpc_release(object[1]);
      object[1] = 0;
    }
    xpc_release(v18);
  }
}

uint64_t os_trace_get_type(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 1);
  if (v1 <= 1)
  {
    if (!*(_BYTE *)(a1 + 1))
      return 1;
    if (v1 == 1)
      return 4;
  }
  else
  {
    switch(v1)
    {
      case 2u:
        return 2;
      case 0x10u:
        return 65;
      case 0x11u:
        return 193;
    }
  }
  return 0;
}

BOOL _os_trace_set_mode_for_pid(int pid, int a2)
{
  ipc_space_t *v3;
  _BOOL8 v4;
  mach_port_name_t name;
  mach_msg_header_t msg;
  uint64_t v8;
  int v9;
  uint64_t v10;

  name = 0;
  v3 = (ipc_space_t *)MEMORY[0x1E0C883F0];
  v4 = 0;
  if (!debug_control_port_for_pid(*MEMORY[0x1E0C883F0], pid, &name))
  {
    if (name)
    {
      v8 = *MEMORY[0x1E0C87D40];
      v9 = a2;
      v10 = 0;
      *(_QWORD *)&msg.msgh_bits = 19;
      msg.msgh_remote_port = name;
      msg.msgh_id = 50000;
      *(_QWORD *)&msg.msgh_local_port = 0;
      if (MEMORY[0x1E0C88840])
        voucher_mach_msg_set(&msg);
      v4 = mach_msg(&msg, 1, 0x2Cu, 0, 0, 0, 0) == 0;
      if (mach_port_deallocate(*v3, name))
        _os_assumes_log();
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

BOOL _os_trace_get_mode_for_pid(int pid, _DWORD *a2)
{
  ipc_space_t *v3;
  kern_return_t v4;
  _BOOL8 result;
  mach_port_name_t v6;
  mach_port_name_t reply_port;
  mach_msg_return_t v8;
  int v9;
  BOOL v10;
  unsigned __int16 v11;
  mach_port_name_t name;
  _BYTE msg[36];
  __int128 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C874D8];
  name = 0;
  v3 = (ipc_space_t *)MEMORY[0x1E0C883F0];
  v4 = debug_control_port_for_pid(*MEMORY[0x1E0C883F0], pid, &name);
  result = 0;
  if (v4)
    return result;
  v6 = name;
  if (!name)
    return 0;
  v15 = 0;
  v14 = 0u;
  memset(&msg[4], 0, 32);
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v6;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0xC35200000000;
  if (MEMORY[0x1E0C88840])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 275, 0x18u, 0x38u, reply_port, 0x3E8u, 0);
  v9 = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    goto LABEL_22;
  }
  if (!v8)
  {
    if (*(_DWORD *)&msg[20] == 71)
    {
      v9 = -308;
    }
    else if (*(_DWORD *)&msg[20] == 50102)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 48)
        {
          if (!*(_DWORD *)&msg[8])
          {
            v9 = *(_DWORD *)&msg[32];
            if (!*(_DWORD *)&msg[32])
            {
              *a2 = v14;
              goto LABEL_36;
            }
            goto LABEL_30;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v10 = 1;
          else
            v10 = *(_DWORD *)&msg[32] == 0;
          if (v10)
            v9 = -300;
          else
            v9 = *(_DWORD *)&msg[32];
          goto LABEL_30;
        }
      }
      v9 = -300;
    }
    else
    {
      v9 = -301;
    }
LABEL_30:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_31;
  }
  mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
LABEL_22:
  if (v9 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*v3, *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
    v11 = 4;
LABEL_35:
    v9 = v11 | 0x10000000;
    goto LABEL_36;
  }
LABEL_31:
  if (v9 == 268451843)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)msg = 67109120;
      *(_DWORD *)&msg[4] = 268451843;
      _os_log_error_impl(&dword_19BBEC000, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Timed out get mode error %d", msg, 8u);
    }
    v11 = 16387;
    goto LABEL_35;
  }
LABEL_36:
  if (mach_port_deallocate(*v3, name))
    _os_assumes_log();
  return v9 == 0;
}

BOOL os_trace_info_enabled(void)
{
  unsigned int v0;
  int v1;
  unsigned int v3;

  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  if (dword_1ECCEBAD4 != -1)
    _os_trace_prefs_and_mode_refresh_slow(dword_1ECCEBAD4);
  v0 = dword_1ECCEBAD8;
  v1 = dword_1ECCEBADC;
  if (dword_1ECCEBADC != dword_1ECCEBAD8)
  {
    while (1)
    {
      v3 = __ldxr((unsigned int *)&dword_1ECCEBADC);
      if (v3 != v1)
        break;
      if (!__stxr(v0, (unsigned int *)&dword_1ECCEBADC))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }
    __clrex();
  }
LABEL_6:
  if ((dword_1ECCEBAC8 & 3) != 0
    || (MEMORY[0xFFFFFC104] & 3) != 0
    || (voucher_get_activity_id() & 0x300000000000000) != 0)
  {
    return 1;
  }
  if (((dword_1ECCEBAC8 & 8) != 0
     || (MEMORY[0xFFFFFC104] & 8) != 0
     || (voucher_get_activity_id() & 0x800000000000000) != 0)
    && (byte_1ECCEBB38 & 2) != 0)
  {
    return BYTE4(qword_1ECCEBB30) & 1;
  }
  return 0;
}

BOOL os_trace_debug_enabled(void)
{
  unsigned int v0;
  int v1;
  _BOOL4 v2;
  unsigned int v3;

  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  if (dword_1ECCEBAD4 != -1)
    _os_trace_prefs_and_mode_refresh_slow(dword_1ECCEBAD4);
  v0 = dword_1ECCEBAD8;
  v1 = dword_1ECCEBADC;
  if (dword_1ECCEBADC != dword_1ECCEBAD8)
  {
    while (1)
    {
      v3 = __ldxr((unsigned int *)&dword_1ECCEBADC);
      if (v3 != v1)
        break;
      if (!__stxr(v0, (unsigned int *)&dword_1ECCEBADC))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }
    __clrex();
  }
LABEL_6:
  if ((dword_1ECCEBAC8 & 2) != 0
    || (MEMORY[0xFFFFFC104] & 2) != 0
    || (voucher_get_activity_id() & 0x200000000000000) != 0)
  {
    LOBYTE(v2) = 1;
  }
  else if (((dword_1ECCEBAC8 & 8) != 0
          || (MEMORY[0xFFFFFC104] & 8) != 0
          || (voucher_get_activity_id() & 0x800000000000000) != 0)
         && (byte_1ECCEBB38 & 2) != 0)
  {
    return (BYTE4(qword_1ECCEBB30) >> 1) & 1;
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

BOOL _os_trace_lazy_init_completed_4swift()
{
  return _os_trace != 0;
}

uint64_t _os_log_mask_create_device_digest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_1ECCEBB20 != -1)
    dispatch_once(&qword_1ECCEBB20, &__block_literal_global_102);
  return _os_log_mask_create_digest(a1, a2, (uint64_t)&xmmword_1ECCEBB10 + 8, a3);
}

unint64_t _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(_BYTE *a1, unint64_t a2, unint64_t a3, unint64_t *a4, int a5)
{
  unint64_t v5;
  unint64_t result;
  int v8;
  uint64_t v10;
  uint64_t v11;

  v5 = 0;
  if (a2)
  {
    result = 0;
    if (a3)
    {
      result = 0;
      v5 = 0;
      while (1)
      {
        v8 = *a1;
        if (!*a1 || v8 == a5)
          break;
        if ((v8 & 0x80) != 0)
        {
          if ((v8 & 0xF8) == 0xF0)
          {
            v10 = 4;
          }
          else if ((v8 & 0xF0) == 0xE0)
          {
            v10 = 3;
          }
          else
          {
            if ((v8 & 0xE0) != 0xC0)
              break;
            v10 = 2;
          }
          if (v10 + result <= a2)
          {
            v11 = 1;
            while ((a1[v11] & 0xC0) == 0x80)
            {
              if (v10 == ++v11)
              {
                result += v10;
                goto LABEL_22;
              }
            }
          }
          break;
        }
        if (result < a2)
        {
          ++result;
          v10 = 1;
LABEL_22:
          ++v5;
          if (result < a2)
          {
            a1 += v10;
            if (v5 < a3)
              continue;
          }
        }
        break;
      }
    }
  }
  else
  {
    result = 0;
  }
  *a4 = v5;
  return result;
}

void ___os_log_mask_create_device_digest_block_invoke()
{
  xpc_object_t empty;
  void *v1;
  void *v2;
  uint64_t uint64;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "operation", 5uLL);
  v1 = (void *)_os_trace_logd_send_with_reply();
  if (!v1)
  {
    xpc_release(empty);
LABEL_5:
    uint64 = xmmword_1ECCEBB10;
    goto LABEL_6;
  }
  v2 = v1;
  uint64 = xpc_dictionary_get_uint64(v1, "device_salt");
  xpc_release(v2);
  xpc_release(empty);
  if (!uint64)
    goto LABEL_5;
LABEL_6:
  *((_QWORD *)&xmmword_1ECCEBB10 + 1) = uint64;
}

tm *os_trace_blob_add_localtime(tm *result, time_t a2, char a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  tm v19;
  time_t v20;

  v20 = a2;
  if (BYTE2(result->tm_year))
  {
    qword_1EE40C0F0 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
  }
  else
  {
    v4 = (uint64_t)result;
    if ((result->tm_year & 2) == 0)
    {
      memset(&v19, 0, sizeof(v19));
      result = localtime_r(&v20, &v19);
      if (result)
      {
        os_trace_blob_addf(v4, "%04d-%02d-%02d %02d:%02d:%02d", v7, v8, v9, v10, v11, v12, LOBYTE(v19.tm_year) + 108);
        if (a4 <= 2)
          os_trace_blob_addf(v4, off_1E3C92F68[a4], v13, v14, v15, v16, v17, v18, a3);
        return (tm *)os_trace_blob_addf(v4, "%+05ld", v13, v14, v15, v16, v17, v18, (v19.tm_gmtoff / 60 % 60) + 100 * (v19.tm_gmtoff / 3600));
      }
    }
  }
  return result;
}

unint64_t os_trace_blob_add_hexdump(unint64_t result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  __int16 v12;
  uint64_t v13;
  unsigned int v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  char v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  char v23;
  char v24;
  char __src;
  char v26;
  char v27;

  v7 = result;
  v27 = 39;
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    v8 = *(unsigned int *)(result + 8);
    if (*(char *)(result + 22) + *(_DWORD *)(result + 12) - 1 == (_DWORD)v8)
    {
      result = os_trace_blob_add_slow(result, &v27, 1uLL);
      if (!a3)
        goto LABEL_27;
      goto LABEL_6;
    }
    *(_BYTE *)(*(_QWORD *)result + v8) = 39;
    v9 = *(_DWORD *)(result + 8) + 1;
    *(_DWORD *)(result + 8) = v9;
    if (!*(_BYTE *)(result + 22))
      *(_BYTE *)(*(_QWORD *)result + v9) = 0;
  }
  if (!a3)
    goto LABEL_27;
LABEL_6:
  v10 = 0;
  do
  {
    v11 = *(unsigned __int8 *)(a2 + v10);
    v12 = *(_WORD *)(v7 + 20);
    if (v10)
    {
      v26 = 32;
      if ((v12 & 2) == 0)
      {
        v13 = *(unsigned int *)(v7 + 8);
        if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == (_DWORD)v13)
        {
          result = os_trace_blob_add_slow(v7, &v26, 1uLL);
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)v7 + v13) = 32;
          v14 = *(_DWORD *)(v7 + 8) + 1;
          *(_DWORD *)(v7 + 8) = v14;
          if (!*(_BYTE *)(v7 + 22))
            *(_BYTE *)(*(_QWORD *)v7 + v14) = 0;
        }
      }
      v12 = *(_WORD *)(v7 + 20);
    }
    v15 = a0123456789abcd[v11 >> 4];
    __src = v15;
    if ((v12 & 2) == 0)
    {
      v16 = *(unsigned int *)(v7 + 8);
      if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == (_DWORD)v16)
      {
        result = os_trace_blob_add_slow(v7, &__src, 1uLL);
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)v7 + v16) = v15;
        v17 = *(_DWORD *)(v7 + 8) + 1;
        *(_DWORD *)(v7 + 8) = v17;
        if (!*(_BYTE *)(v7 + 22))
          *(_BYTE *)(*(_QWORD *)v7 + v17) = 0;
      }
    }
    v18 = a0123456789abcd[v11 & 0xF];
    v24 = v18;
    if ((*(_WORD *)(v7 + 20) & 2) == 0)
    {
      v19 = *(unsigned int *)(v7 + 8);
      if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == (_DWORD)v19)
      {
        result = os_trace_blob_add_slow(v7, &v24, 1uLL);
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)v7 + v19) = v18;
        v20 = *(_DWORD *)(v7 + 8) + 1;
        *(_DWORD *)(v7 + 8) = v20;
        if (!*(_BYTE *)(v7 + 22))
          *(_BYTE *)(*(_QWORD *)v7 + v20) = 0;
      }
    }
    ++v10;
  }
  while (a3 != v10);
LABEL_27:
  if ((a4 & 1) != 0)
    return os_trace_blob_addns(v7, "…'", 0xFFFFFFFFFFFFFFFFLL, 0);
  v23 = 39;
  if ((*(_WORD *)(v7 + 20) & 2) == 0)
  {
    v21 = *(unsigned int *)(v7 + 8);
    if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == (_DWORD)v21)
    {
      return os_trace_blob_add_slow(v7, &v23, 1uLL);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)v7 + v21) = 39;
      v22 = *(_DWORD *)(v7 + 8) + 1;
      *(_DWORD *)(v7 + 8) = v22;
      if (!*(_BYTE *)(v7 + 22))
        *(_BYTE *)(*(_QWORD *)v7 + v22) = 0;
    }
  }
  return result;
}

const char *os_log_fmt_extract_symptom(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  const char *v4;

  if (!*(_BYTE *)(a1 + 1))
    return 0;
  v1 = *(_BYTE *)(a1 + 2) & 0xF0;
  if (v1 == 32)
  {
    v4 = *(const char **)(a1 + 4);
    strlen(v4);
    return v4;
  }
  if (v1 != 16 || *(unsigned __int8 *)(a1 + 1) < 2u)
    return 0;
  v2 = a1 + 4 + *(unsigned __int8 *)(a1 + 3);
  v3 = *(_BYTE *)v2 & 0xF0;
  if (v3 == 32)
  {
    v4 = *(const char **)(v2 + 2);
    strnlen(v4, *(int *)(a1 + 4));
    return v4;
  }
  if (v3 == 48)
    return *(const char **)(v2 + 2);
  else
    return 0;
}

_BYTE *os_log_fmt_convert_trace(_BYTE *a1, char *a2, uint64_t a3)
{
  _BYTE *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  _BYTE *v8;
  size_t v9;
  char *v10;
  _BYTE *v11;

  v3 = a1;
  v5 = &a2[a3 - 1];
  v4 = *v5;
  *a1 = 0;
  a1[1] = v4;
  if (v4)
  {
    v6 = -v4;
    v7 = &a2[a3 + ~v4];
    v8 = a1 + 2;
    while (1)
    {
      v9 = v5[v6] & 0x3F;
      v10 = &a2[v9];
      if (&a2[v9] > v7)
        break;
      *v8 = 0;
      v8[1] = v9;
      v11 = v8 + 2;
      memcpy(v8 + 2, a2, v9);
      v8 = &v11[v9];
      a2 = v10;
      if (__CFADD__(v6++, 1))
        return v3;
    }
    return 0;
  }
  return v3;
}

_BYTE *os_log_fmt_extract_pubdata(_BYTE *result, int a2, _QWORD *a3, unsigned __int16 *a4)
{
  char *v4;
  unsigned __int16 v5;
  int v6;
  unint64_t v7;

  *a3 = 0;
  *a4 = 0;
  if (!a2)
    return &os_log_fmt_extract_pubdata_empty_hdr;
  if (a2 == 1)
    return 0;
  v4 = result + 2;
  v5 = a2 - 2;
  if (result[1])
  {
    v6 = 0;
    while (v5 >= 2u)
    {
      v7 = v4[1] + 2;
      if (v7 > v5)
        break;
      v4 += v7;
      v5 -= v7;
      if (result[1] <= (unsigned __int16)++v6)
        goto LABEL_10;
    }
    return 0;
  }
LABEL_10:
  *a3 = v4;
  *a4 = v5;
  return result;
}

uint64_t _os_log_fmt_compose_masked_partial_redacted(uint64_t result, unsigned __int8 *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  int v19;
  _BOOL4 v21;
  _BOOL4 v22;
  uint64_t v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  char *v43;
  size_t v44;
  unint64_t v45;

  v8 = a4;
  v10 = result;
  if (!(_DWORD)a3 && (a4 & 1) == 0)
  {
    if ((*(_WORD *)(result + 20) & 2) != 0)
      return result;
    v11 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v11 - 1) > 7)
    {
      *(_QWORD *)(*(_QWORD *)result + v11) = 0x3E296C6C756E283CLL;
      v12 = *(_DWORD *)(result + 8) + 8;
      goto LABEL_69;
    }
    v43 = "<(null)>";
    v44 = 8;
    return os_trace_blob_add_slow(result, v43, v44);
  }
  if (a3 <= 3)
  {
    if ((*(_WORD *)(result + 20) & 2) != 0)
      return result;
    v13 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v13 - 1) <= 4)
    {
      v43 = "<…>";
      v44 = 5;
      return os_trace_blob_add_slow(result, v43, v44);
    }
    v14 = *(_QWORD *)result + v13;
    *(_BYTE *)(v14 + 4) = 62;
    *(_DWORD *)v14 = -1501502916;
    v12 = *(_DWORD *)(result + 8) + 5;
LABEL_69:
    *(_DWORD *)(v10 + 8) = v12;
    if (!*(_BYTE *)(v10 + 22))
      *(_BYTE *)(*(_QWORD *)v10 + v12) = 0;
    return result;
  }
  v15 = a3;
  v16 = *a2;
  v17 = a2[1];
  v18 = a2[2];
  v19 = a2[3];
  v21 = v19 != 2 || v18 == 0;
  if (!(_DWORD)a4 && !*a2 && v21)
    return os_trace_blob_addns(result, a2 + 4, a3 - 4, 0);
  v22 = v19 == 1;
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    v23 = *(unsigned int *)(result + 8);
    if (*(char *)(result + 22) + *(_DWORD *)(result + 12) - 1 == (_DWORD)v23)
    {
      os_trace_blob_add_slow(result, "<", 1uLL);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)result + v23) = 60;
      v24 = *(_DWORD *)(result + 8) + 1;
      *(_DWORD *)(result + 8) = v24;
      if (!*(_BYTE *)(result + 22))
        *(_BYTE *)(*(_QWORD *)result + v24) = 0;
    }
  }
  v25 = v16 + 4;
  if (v15 > v16 + 4)
  {
    if (v15 - (v16 + 4) < v18)
      v18 = v15 - (v16 + 4);
    if (v19 == 2)
      a3 = v18;
    else
      a3 = v15 - (v16 + 4);
    if (a3)
    {
      if (v19 == 1 && (*(_WORD *)(v10 + 20) & 2) == 0)
      {
        v26 = *(unsigned int *)(v10 + 8);
        if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v26 - 1) <= 2)
        {
          v45 = a3;
          os_trace_blob_add_slow(v10, "…", 3uLL);
          a3 = v45;
        }
        else
        {
          v27 = *(_QWORD *)v10 + v26;
          *(_BYTE *)(v27 + 2) = -90;
          *(_WORD *)v27 = -32542;
          v28 = *(_DWORD *)(v10 + 8) + 3;
          *(_DWORD *)(v10 + 8) = v28;
          if (!*(_BYTE *)(v10 + 22))
            *(_BYTE *)(*(_QWORD *)v10 + v28) = 0;
        }
      }
      if (os_trace_blob_addns(v10, &a2[v25], a3, 0))
      {
        if (((v19 | 2) == 2 || v8) && (*(_WORD *)(v10 + 20) & 2) == 0)
        {
          v29 = *(unsigned int *)(v10 + 8);
          if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v29 - 1) <= 2)
          {
            os_trace_blob_add_slow(v10, "…", 3uLL);
          }
          else
          {
            v30 = *(_QWORD *)v10 + v29;
            *(_BYTE *)(v30 + 2) = -90;
            *(_WORD *)v30 = -32542;
            v31 = *(_DWORD *)(v10 + 8) + 3;
            *(_DWORD *)(v10 + 8) = v31;
            if (!*(_BYTE *)(v10 + 22))
              *(_BYTE *)(*(_QWORD *)v10 + v31) = 0;
          }
        }
        v22 = 1;
      }
    }
    else
    {
      v22 = 0;
    }
    if (v19 == 2
      && (a3 = v15 - (v18 + v25), v15 != v18 + v25)
      && os_trace_blob_addns(v10, &a2[v18 + v25], a3, 0))
    {
      if ((*(_WORD *)(v10 + 20) & 2) == 0)
      {
        v32 = *(unsigned int *)(v10 + 8);
        if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v32 - 1) <= 2)
        {
          os_trace_blob_add_slow(v10, "…", 3uLL);
        }
        else
        {
          v33 = *(_QWORD *)v10 + v32;
          *(_BYTE *)(v33 + 2) = -90;
          *(_WORD *)v33 = -32542;
          v34 = *(_DWORD *)(v10 + 8) + 3;
          *(_DWORD *)(v10 + 8) = v34;
          if (!*(_BYTE *)(v10 + 22))
            *(_BYTE *)(*(_QWORD *)v10 + v34) = 0;
        }
      }
    }
    else if (!v22)
    {
      goto LABEL_57;
    }
    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      v35 = *(unsigned int *)(v10 + 8);
      if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v35 - 1) <= 1)
      {
        os_trace_blob_add_slow(v10, ", ", 2uLL);
      }
      else
      {
        *(_WORD *)(*(_QWORD *)v10 + v35) = 8236;
        v36 = *(_DWORD *)(v10 + 8) + 2;
        *(_DWORD *)(v10 + 8) = v36;
        if (!*(_BYTE *)(v10 + 22))
          *(_BYTE *)(*(_QWORD *)v10 + v36) = 0;
      }
    }
  }
LABEL_57:
  result = os_trace_blob_addf(v10, "length=%u", a3, a4, a5, a6, a7, a8, v17);
  v37 = v15 - 4;
  if (v37 >= v16)
    v38 = v16;
  else
    v38 = v37;
  if (v38)
  {
    v39 = (uint64_t)(a2 + 4);
    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      v40 = *(unsigned int *)(v10 + 8);
      if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v40 - 1) <= 1)
      {
        os_trace_blob_add_slow(v10, ", ", 2uLL);
      }
      else
      {
        *(_WORD *)(*(_QWORD *)v10 + v40) = 8236;
        v41 = *(_DWORD *)(v10 + 8) + 2;
        *(_DWORD *)(v10 + 8) = v41;
        if (!*(_BYTE *)(v10 + 22))
          *(_BYTE *)(*(_QWORD *)v10 + v41) = 0;
      }
    }
    result = os_trace_blob_add_hexdump(v10, v39, v38, v37 < v16);
  }
  if ((*(_WORD *)(v10 + 20) & 2) == 0)
  {
    v42 = *(unsigned int *)(v10 + 8);
    if (*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - 1 == (_DWORD)v42)
    {
      v43 = ">";
      result = v10;
      v44 = 1;
      return os_trace_blob_add_slow(result, v43, v44);
    }
    *(_BYTE *)(*(_QWORD *)v10 + v42) = 62;
    v12 = *(_DWORD *)(v10 + 8) + 1;
    goto LABEL_69;
  }
  return result;
}

uint64_t _os_log_fmt_builtin_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, uint64_t a6)
{
  _os_log_fmt_builtin_scaled(a1, 0x3E8u, a3, a4, a5, a6, _os_log_fmt_builtin_bitrate_suffixes);
  return 1;
}

uint64_t _os_log_fmt_builtin_bytes(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, uint64_t a6)
{
  _os_log_fmt_builtin_scaled(a1, 0x3E8u, a3, a4, a5, a6, _os_log_fmt_builtin_bytes_suffixes);
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_mode(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned int *a5, uint64_t a6)
{
  BOOL is_integer;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  __int8 v16;
  __int8 v17;
  __int8 v18;
  __int8 v19;
  int8x16_t v20;
  int8x8_t v21;
  int8x8_t v22;
  char v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  _BYTE __src[10];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C874D8];
  is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    v15 = *a5;
    __src[0] = aPcDBLSW[(unsigned __int16)*a5 >> 12];
    if ((v15 & 0x40) != 0)
      v16 = 120;
    else
      v16 = 45;
    if ((v15 & 0x40) != 0)
      v17 = 115;
    else
      v17 = 83;
    if ((v15 & 8) != 0)
      v18 = 120;
    else
      v18 = 45;
    if ((v15 & 8) != 0)
      v19 = 115;
    else
      v19 = 83;
    v20 = (int8x16_t)vdupq_n_s32(v15);
    v21.i16[0] = 11565;
    v21.i8[3] = 45;
    v21.i8[4] = 45;
    v21.i16[3] = 11565;
    v21.i8[2] = v16;
    v21.i8[5] = v18;
    v22.i16[0] = 30578;
    v22.i8[2] = v17;
    v22.i8[3] = 114;
    v22.i8[4] = 119;
    v22.i8[5] = v19;
    v22.i16[3] = 30578;
    *(int8x8_t *)&__src[1] = vbsl_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v20, (int8x16_t)xmmword_19BC060C0)), (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v20, (int8x16_t)xmmword_19BC060D0)))), v21, v22);
    if ((v15 & 1) != 0)
      v23 = 120;
    else
      v23 = 45;
    if ((v15 & 1) != 0)
      v24 = 116;
    else
      v24 = 84;
    if ((v15 & 0x200) != 0)
      v25 = v24;
    else
      v25 = v23;
    __src[9] = v25;
    if ((*(_BYTE *)(a1 + 20) & 2) == 0)
    {
      v26 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v26 - 1) <= 9)
      {
        os_trace_blob_add_slow(a1, __src, 0xAuLL);
      }
      else
      {
        v27 = *(_QWORD *)a1 + v26;
        *(_QWORD *)v27 = *(_QWORD *)__src;
        *(_WORD *)(v27 + 8) = *(_WORD *)&__src[8];
        v28 = *(_DWORD *)(a1 + 8) + 10;
        *(_DWORD *)(a1 + 8) = v28;
        if (!*(_BYTE *)(a1 + 22))
          *(_BYTE *)(*(_QWORD *)a1 + v28) = 0;
      }
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v12, v13, v14);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_signal(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, _DWORD *a5, uint64_t a6)
{
  BOOL is_integer;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    v18 = *a5;
    if (v18 < 0x20)
      os_trace_blob_addf(a1, "[sig%s: %s]", v12, v13, v14, v15, v16, v17, *(_QWORD *)(MEMORY[0x1E0C87A80] + 8 * v18));
    else
      os_trace_blob_addf(a1, "[%d: Unknown signal]", v12, v13, v14, v15, v16, v17, *a5);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_iec_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, uint64_t a6)
{
  _os_log_fmt_builtin_scaled(a1, 0x400u, a3, a4, a5, a6, _os_log_fmt_builtin_iec_bitrate_suffixes);
  return 1;
}

uint64_t _os_log_fmt_builtin_iec_bytes(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, uint64_t a6)
{
  _os_log_fmt_builtin_scaled(a1, 0x400u, a3, a4, a5, a6, _os_log_fmt_builtin_iec_bytes_suffixes);
  return 1;
}

uint64_t _os_log_fmt_builtin_mach_errno(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, kern_return_t *a5, uint64_t a6)
{
  BOOL is_integer;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  kern_return_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    v15 = *a5;
    if ((*a5 - 1100) > 6)
      mach_error_string(v15 & 0xFFFFC1FF);
    else
      bootstrap_strerror(*a5);
    os_trace_blob_addf(a1, "[%#x: %s]", v16, v17, v18, v19, v20, v21, v15);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v12, v13, v14);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_trace_mode(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, int *a5, uint64_t a6)
{
  BOOL is_integer;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  char v20;
  char *v21;
  size_t v22;
  uint64_t v23;
  unsigned int v24;
  char *v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;

  is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 != 4 || !is_integer)
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
    return 1;
  }
  v18 = *a5;
  os_trace_blob_addf(a1, "0x%X", v12, v13, v14, v15, v16, v17, *a5);
  v19 = 0;
  v20 = 1;
  do
  {
    if ((_os_log_fmt_builtin_trace_mode_masks[v19] & v18) == 0)
      goto LABEL_20;
    if ((v20 & 1) != 0)
      v21 = "(";
    else
      v21 = ", ";
    if ((v20 & 1) != 0)
      v22 = 3;
    else
      v22 = 2;
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      v23 = *(unsigned int *)(a1 + 8);
      if (v22 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v23 - 1))
      {
        os_trace_blob_add_slow(a1, v21, v22);
      }
      else
      {
        memcpy((void *)(*(_QWORD *)a1 + v23), v21, v22);
        v24 = *(_DWORD *)(a1 + 8) + v22;
        *(_DWORD *)(a1 + 8) = v24;
        if (!*(_BYTE *)(a1 + 22))
          *(_BYTE *)(*(_QWORD *)a1 + v24) = 0;
      }
    }
    v25 = *(char **)&_os_log_fmt_builtin_trace_mode_masks[v19 + 2];
    v26 = strlen(v25);
    if ((*(_WORD *)(a1 + 20) & 2) != 0)
      goto LABEL_18;
    v27 = v26;
    v28 = *(unsigned int *)(a1 + 8);
    if (v26 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v28 - 1))
    {
      os_trace_blob_add_slow(a1, v25, v26);
LABEL_18:
      v20 = 0;
      goto LABEL_20;
    }
    memcpy((void *)(*(_QWORD *)a1 + v28), v25, v26);
    v29 = *(_DWORD *)(a1 + 8) + v27;
    *(_DWORD *)(a1 + 8) = v29;
    v20 = *(_BYTE *)(a1 + 22);
    if (v20)
      goto LABEL_18;
    *(_BYTE *)(*(_QWORD *)a1 + v29) = 0;
LABEL_20:
    v19 += 4;
  }
  while (v19 != 28);
  if ((v20 & 1) == 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    v30 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 1)
    {
      os_trace_blob_add_slow(a1, ")", 2uLL);
    }
    else
    {
      *(_WORD *)(*(_QWORD *)a1 + v30) = 10528;
      v31 = *(_DWORD *)(a1 + 8) + 2;
      *(_DWORD *)(a1 + 8) = v31;
      if (!*(_BYTE *)(a1 + 22))
        *(_BYTE *)(*(_QWORD *)a1 + v31) = 0;
    }
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_time(tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, time_t *a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  time_t v14;

  if (!_os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0))
    goto LABEL_8;
  if ((_DWORD)a6 == 4)
  {
    v14 = *(int *)a5;
    goto LABEL_6;
  }
  if ((_DWORD)a6 != 8)
  {
LABEL_8:
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v11, v12, v13);
    return 1;
  }
  v14 = *a5;
LABEL_6:
  os_trace_blob_add_localtime(a1, v14, 0, 3u);
  return 1;
}

uint64_t _os_log_fmt_builtin_timespec(tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, time_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a3 + 10) == 19 && a6 <= 0x10 && ((_DWORD)a6 == 16 || (a7 & 1) != 0))
  {
    if ((_DWORD)a6 != 16 && (_DWORD)a7)
      _os_log_fmt_decode_error((size_t)a1);
    else
      os_trace_blob_add_localtime(a1, *a5, a5[1], 0);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_timeval(tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a3 + 10) == 19 && a6 <= 0x10 && ((_DWORD)a6 == 16 || (a7 & 1) != 0))
  {
    if ((_DWORD)a6 != 16 && (_DWORD)a7)
      _os_log_fmt_decode_error((size_t)a1);
    else
      os_trace_blob_add_localtime(a1, *(_QWORD *)a5, *(_DWORD *)(a5 + 8), 1u);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_uuid_t(size_t a1, int a2, uint64_t a3, _BYTE *a4, unsigned __int8 *uu, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  _BYTE v14[37];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  if (*(_BYTE *)(a3 + 10) == 19 && a6 <= 0x10 && ((_DWORD)a6 == 16 || (a7 & 1) != 0))
  {
    if ((_DWORD)a6 != 16 && (_DWORD)a7)
    {
      _os_log_fmt_decode_error(a1);
    }
    else
    {
      memset(v14, 0, sizeof(v14));
      uuid_unparse_upper(uu, v14);
      v9 = strlen(v14);
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        v10 = v9;
        v11 = *(unsigned int *)(a1 + 8);
        if (v9 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v11 - 1))
        {
          os_trace_blob_add_slow(a1, v14, v9);
        }
        else
        {
          memcpy((void *)(*(_QWORD *)a1 + v11), v14, v9);
          v12 = *(_DWORD *)(a1 + 8) + v10;
          *(_DWORD *)(a1 + 8) = v12;
          if (!*(_BYTE *)(a1 + 22))
            *(_BYTE *)(*(_QWORD *)a1 + v12) = 0;
        }
      }
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_scaled(uint64_t a1, unsigned int a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, uint64_t a6, _QWORD *a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t scalar;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  int v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  unint64_t v29;

  if (!_os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0))
    return _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v14, v15, v16);
  scalar = os_log_fmt_read_scalar(a3, a5, a6);
  v24 = 0.0;
  v25 = 0;
  if (*a7 && a7[1] && scalar >= 0x3E8)
  {
    v25 = 0;
    do
    {
      v26 = scalar;
      v27 = a7[v25 + 2];
      ++v25;
      scalar /= a2;
    }
    while (v27 && scalar > 0x3E7);
    v24 = (double)(v26 - scalar * a2) * 100.0;
  }
  v28 = vcvtad_u64_f64(v24 / (double)a2);
  if (v28 == 100)
    v29 = scalar + 1;
  else
    v29 = scalar;
  if (v28 == 100)
    v28 = 0;
  if (!v25)
    return os_trace_blob_addf(a1, "%llu %s", v18, v19, v20, v21, v22, v23, v29);
  if (v29 <= 9 && -10 * (v28 / 0xA) != -v28)
    return os_trace_blob_addf(a1, "%llu.%02u %s", v18, v19, v20, v21, v22, v23, v29);
  if (v28 && v29 <= 0x63)
    return os_trace_blob_addf(a1, "%llu.%01u %s", v18, v19, v20, v21, v22, v23, v29);
  else
    return os_trace_blob_addf(a1, "%llu %s", v18, v19, v20, v21, v22, v23, v29);
}

uint64_t _os_trace_intprefsdir_path()
{
  if (_os_trace_paths_init_once != -1)
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
  return _os_trace_internal_preferences_path;
}

void *_os_log_preferences_load_sysprefs(const char *a1, char *a2, int a3)
{
  void *base_sysprefs_file;
  void *plist_at;
  void *v7;
  char __str[1024];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C874D8];
  base_sysprefs_file = _os_log_preferences_load_base_sysprefs_file(__str, a1, a3);
  if ((MEMORY[0xFFFFFC104] & 0x80000000) == 0 && (MEMORY[0xFFFFFC104] & 0x10000000) != 0)
  {
    if (_os_trace_paths_init_once != -1)
      dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_198);
    snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_internal_preferences_path, "Subsystems", a1);
    plist_at = _os_trace_read_plist_at(-2, __str);
    if (plist_at)
    {
      v7 = plist_at;
      if (base_sysprefs_file)
      {
        _os_log_preferences_merge(base_sysprefs_file, plist_at, a2);
        xpc_release(v7);
      }
      else
      {
        return plist_at;
      }
    }
  }
  return base_sysprefs_file;
}

void *_os_log_preferences_copy_cache(_QWORD *a1)
{
  unsigned int v2;
  int v3;
  void *v4;
  const void *v5;
  size_t v6;
  void *v7;
  unsigned int v9;

  *a1 = 0;
  if (_os_trace != -1)
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  if (dword_1ECCEBAD4 != -1)
    _os_trace_prefs_and_mode_refresh_slow(dword_1ECCEBAD4);
  v2 = dword_1ECCEBAD8;
  v3 = dword_1ECCEBADC;
  if (dword_1ECCEBADC != dword_1ECCEBAD8)
  {
    while (1)
    {
      v9 = __ldxr((unsigned int *)&dword_1ECCEBADC);
      if (v9 != v3)
        break;
      if (!__stxr(v2, (unsigned int *)&dword_1ECCEBADC))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }
    __clrex();
  }
LABEL_6:
  if ((dword_1ECCEBAC8 & 0x100) != 0 || (MEMORY[0xFFFFFC104] & 0x100) != 0)
    return 0;
  os_unfair_lock_lock_with_options();
  if (byte_1ECCEBB43)
    goto LABEL_9;
  if (dword_1ECCEBAEC != dword_1ECCEBAD8)
    _os_log_preference_load_cache();
  v5 = (const void *)*((_QWORD *)&xmmword_1ECCEBAF0 + 1);
  if (!*((_QWORD *)&xmmword_1ECCEBAF0 + 1))
  {
LABEL_9:
    v4 = 0;
  }
  else
  {
    v6 = xmmword_1ECCEBAF0;
    while (1)
    {
      v7 = malloc_type_malloc(v6, 0x91D685AAuLL);
      if (v7)
        break;
      _os_trace_temporary_resource_shortage();
    }
    v4 = v7;
    memcpy(v7, v5, v6);
    *a1 = xmmword_1ECCEBAF0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1ECCEBAE8);
  return v4;
}

uint64_t _os_log_get_proc_path()
{
  uint64_t v0;

  v0 = xmmword_1ECCEBB00;
  if ((_QWORD)xmmword_1ECCEBB00)
    strrchr((char *)xmmword_1ECCEBB00, 47);
  else
    _os_assumes_log();
  return v0;
}

BOOL _os_log_matches_filter(void *a1, uint64_t a2, uint64_t *a3)
{
  xpc_object_t dictionary;
  void *v7;
  xpc_object_t array;
  void *v9;
  _BOOL8 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  xpc_object_t value;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  _QWORD applier[8];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  dictionary = xpc_dictionary_get_dictionary(a1, "logicalExp");
  if (!dictionary)
  {
    v11 = _os_log_simple_filter_subtype_matches_string(a1, "subsystem", *(_QWORD *)a2, (uint64_t)a3);
    v12 = _os_log_simple_filter_subtype_matches_string(a1, "category", *(_QWORD *)(a2 + 8), (uint64_t)a3);
    v13 = _os_log_simple_filter_subtype_matches_string(a1, "processImagePath", *(_QWORD *)(a2 + 16), (uint64_t)a3);
    v14 = _os_log_simple_filter_subtype_matches_string(a1, "process", *(_QWORD *)(a2 + 24), (uint64_t)a3);
    v15 = _os_log_simple_filter_subtype_matches_number(a1, "pid", *(int *)(a2 + 32), -1, (uint64_t)a3);
    return _os_log_simple_filter_subtype_matches_number(a1, "uid", *(unsigned int *)(a2 + 36), 0xFFFFFFFFLL, (uint64_t)a3)|| v15|| v14|| v13|| v12|| v11;
  }
  v7 = dictionary;
  array = xpc_dictionary_get_array(dictionary, "subfilters");
  if (!array)
    return 0;
  v9 = array;
  if (object_getClass(array) != (Class)MEMORY[0x1E0C88FC0] || !xpc_array_get_count(v9))
    return 0;
  value = xpc_dictionary_get_value(v7, "operator");
  if (!value)
  {
    v19 = 2;
    goto LABEL_14;
  }
  v18 = xpc_int64_get_value(value);
  v19 = v18;
  if ((unint64_t)(v18 - 1) >= 2)
  {
    if (!v18 && xpc_array_get_count(v9) == 1)
    {
      v19 = 0;
      goto LABEL_14;
    }
    return 0;
  }
LABEL_14:
  v32 = 0;
  v33 = &v32;
  v34 = 0x2800000000;
  v35 = 0;
  v36 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2000000000;
  v27 = 1;
  applier[0] = MEMORY[0x1E0C87450];
  applier[1] = 0x40000000;
  applier[2] = ___os_log_matches_logical_expression_filter_block_invoke;
  applier[3] = &unk_1E3C931F8;
  applier[4] = &v32;
  applier[5] = &v28;
  applier[6] = &v24;
  applier[7] = a2;
  xpc_array_apply(v9, applier);
  v20 = v33;
  v21 = *a3;
  if ((unint64_t)(v19 - 1) >= 2)
  {
    *a3 = v33[4] | v21;
    a3[1] |= v20[3];
    v10 = *((_BYTE *)v29 + 24) == 0;
  }
  else
  {
    *a3 = v33[3] | v21;
    a3[1] |= v20[4];
    if (v19 == 2)
      v22 = v29;
    else
      v22 = v25;
    v10 = *((unsigned __int8 *)v22 + 24) != 0;
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  return v10;
}

uint64_t ___os_log_matches_logical_expression_filter_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4;
  uint64_t v5;

  v4 = _os_log_matches_filter(a3, *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v5 = 48;
  if (v4)
    v5 = 40;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + v5) + 8) + 24) = v4;
  return 1;
}

BOOL _os_log_simple_filter_subtype_matches_string(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  xpc_object_t dictionary;
  _BOOL8 v7;
  _QWORD applier[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (!a3)
    return 0;
  dictionary = xpc_dictionary_get_dictionary(a1, a2);
  if (!dictionary)
    return 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  applier[0] = MEMORY[0x1E0C87450];
  applier[1] = 0x40000000;
  applier[2] = ___os_log_simple_filter_subtype_matches_string_block_invoke;
  applier[3] = &unk_1E3C93220;
  applier[4] = &v10;
  applier[5] = a3;
  applier[6] = a4;
  xpc_dictionary_apply(dictionary, applier);
  v7 = *((_BYTE *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

BOOL _os_log_simple_filter_subtype_matches_number(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  xpc_object_t dictionary;
  _BOOL8 v8;
  _QWORD applier[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (a3 == a4)
    return 0;
  dictionary = xpc_dictionary_get_dictionary(a1, a2);
  if (!dictionary)
    return 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  applier[0] = MEMORY[0x1E0C87450];
  applier[1] = 0x40000000;
  applier[2] = ___os_log_simple_filter_subtype_matches_number_block_invoke;
  applier[3] = &unk_1E3C93248;
  applier[4] = &v11;
  applier[5] = a3;
  applier[6] = a5;
  xpc_dictionary_apply(dictionary, applier);
  v8 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t ___os_log_simple_filter_subtype_matches_number_block_invoke(_QWORD *a1, const char *a2, xpc_object_t xint)
{
  int64_t value;
  uint64_t v6;
  _QWORD *v7;

  value = xpc_int64_get_value(xint);
  v6 = a1[5];
  if (v6 == strtoul(a2, 0, 10))
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    v7 = (_QWORD *)a1[6];
  }
  else
  {
    v7 = (_QWORD *)(a1[6] + 8);
  }
  *v7 |= value;
  return 1;
}

uint64_t ___os_log_simple_filter_subtype_matches_string_block_invoke(_QWORD *a1, const char *a2, xpc_object_t xint)
{
  int64_t value;
  const char *v6;
  _QWORD *v7;

  value = xpc_int64_get_value(xint);
  v6 = (const char *)a1[5];
  if ((value & 1) != 0)
  {
    if (!strcasestr(v6, a2))
      goto LABEL_3;
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    v7 = (_QWORD *)a1[6];
    goto LABEL_6;
  }
  if (!strcmp(v6, a2))
    goto LABEL_5;
LABEL_3:
  v7 = (_QWORD *)(a1[6] + 8);
LABEL_6:
  *v7 |= value;
  return 1;
}

uint64_t os_log_set_client_type(uint64_t a1)
{
  uint64_t result;

  if (pthread_is_threaded_np())
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_9;
  }
  result = _dispatch_is_multithreaded();
  if ((_DWORD)result)
  {
LABEL_9:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  if (_os_trace)
  {
LABEL_10:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  if (dword_1ECCEBACC)
  {
LABEL_11:
    _os_assert_log();
    result = _os_crash();
    __break(1u);
    return result;
  }
  if (a1 == 1)
    byte_1ECCEBB43 = 1;
  return result;
}

os_log_t _os_log_create(void *dso, const char *subsystem, const char *category)
{
  return os_log_create(subsystem, category);
}

uint64_t os_log_errors_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t os_log_faults_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t os_log_get_type(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1);
}

BOOL os_log_is_enabled(os_log_t log)
{
  return 1;
}

const char *os_log_type_get_name(int a1)
{
  const char *result;

  if (a1 <= 1)
  {
    if (!a1)
      return "Default";
    if (a1 == 1)
      return "Info";
  }
  else
  {
    switch(a1)
    {
      case 2:
        return "Debug";
      case 16:
        return "Error";
      case 17:
        return "Fault";
    }
  }
  result = (const char *)_os_crash();
  __break(1u);
  return result;
}

void *os_log_copy_decorated_message(int a1, uint64_t a2)
{
  char name;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  tm v32[18];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C874D8];
  *(_QWORD *)&v32[0].tm_mon = 0;
  *(_QWORD *)&v32[0].tm_sec = &v32[0].tm_wday;
  *(_QWORD *)&v32[0].tm_hour = 0x40000000000;
  os_trace_blob_add_localtime(v32, *(_QWORD *)(a2 + 40), *(_DWORD *)(a2 + 48), 1u);
  name = os_log_type_get_name(a1);
  os_trace_blob_addf((uint64_t)v32, " %s", v5, v6, v7, v8, v9, v10, name);
  LOBYTE(a1) = getprogname();
  getpid();
  os_trace_blob_addf((uint64_t)v32, " %s[%d:%llx]", v11, v12, v13, v14, v15, v16, a1);
  v23 = *(_QWORD *)(a2 + 128);
  if (v23)
  {
    if (*(_QWORD *)(a2 + 136)
      || (os_trace_blob_addf((uint64_t)v32, "[%s]", v17, v18, v19, v20, v21, v22, *(_QWORD *)(a2 + 128)),
          (v23 = *(_QWORD *)(a2 + 128)) != 0)
      && *(_QWORD *)(a2 + 136))
    {
      os_trace_blob_addf((uint64_t)v32, "[%s:%s]", v17, v18, v19, v20, v21, v22, v23);
    }
  }
  v24 = os_log_copy_message_string(a2);
  os_trace_blob_addf((uint64_t)v32, " %s\n", v25, v26, v27, v28, v29, v30, (char)v24);
  free(v24);
  return os_trace_blob_detach((uint64_t)v32, 0);
}

uint64_t os_log_compare_enablement(uint64_t a1, uint64_t a2)
{
  int enablement_value;

  enablement_value = _os_log_get_enablement_value(a1);
  return enablement_value - _os_log_get_enablement_value(a2);
}

uint64_t _os_log_get_enablement_value(uint64_t result)
{
  if ((int)result > 1)
  {
    switch((_DWORD)result)
    {
      case 2:
        return 0;
      case 0x10:
        return 3;
      case 0x11:
        return 4;
    }
LABEL_12:
    result = _os_crash();
    __break(1u);
    return result;
  }
  if (!(_DWORD)result)
    return 2;
  if ((_DWORD)result != 1)
    goto LABEL_12;
  return result;
}

unint64_t os_log_set_fault_callback(unint64_t a1)
{
  unint64_t result;

  if (!a1)
    return _os_log_current_fault_callback;
  do
    result = __ldxr((unint64_t *)&_os_log_current_fault_callback);
  while (__stxr(a1, (unint64_t *)&_os_log_current_fault_callback));
  return result;
}

unint64_t os_log_set_test_callback(unint64_t a1)
{
  unint64_t v1;

  do
    v1 = __ldxr(&_os_log_current_test_callback);
  while (__stxr(a1, &_os_log_current_test_callback));
  return v1;
}

void *_os_get_logging_unreliable_for_current_thread()
{
  if (_init_unreliable_thread_key_unreliable_once != -1)
    dispatch_once(&_init_unreliable_thread_key_unreliable_once, &__block_literal_global_80);
  return pthread_getspecific(_os_log_unreliable_thread_key);
}

void _os_log_impl_stream(unint64_t *a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  void *v12;
  void *v13;
  uint64_t v14;
  void **v15;
  void *v16;
  size_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unsigned int v29;
  uint64_t v30;
  _BYTE v31[52];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;

  v12 = _os_trace_diagnosticd_pipe(0);
  if (v12)
  {
    v13 = v12;
    v14 = *a5;
    if ((*(_WORD *)(*a5 + 20) & 2) == 0)
    {
      v15 = (void **)a5[1];
      v16 = *v15;
      v17 = *((unsigned int *)v15 + 2);
      v18 = *(unsigned int *)(v14 + 8);
      if (*(char *)(v14 + 22) + *(_DWORD *)(v14 + 12) - (int)v18 - 1 < v17)
      {
        os_trace_blob_add_slow(*a5, v16, v17);
      }
      else
      {
        memcpy((void *)(*(_QWORD *)v14 + v18), v16, v17);
        v19 = *(_DWORD *)(v14 + 8) + v17;
        *(_DWORD *)(v14 + 8) = v19;
        if (!*(_BYTE *)(v14 + 22))
          *(_BYTE *)(*(_QWORD *)v14 + v19) = 0;
      }
    }
    v42 = 0;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    memset(&v31[4], 0, 48);
    if (a6 <= 6u && ((1 << a6) & 0x58) != 0)
      v20 = a6 << 8;
    else
      v20 = bswap32(a6) >> 16;
    v29 = v20;
    *(_QWORD *)v31 = 0;
    v30 = 0;
    memset(&v31[12], 0, 32);
    v21 = *a1;
    v22 = a1[1];
    *(_QWORD *)&v31[44] = a6;
    v32 = v21;
    v33 = 0uLL;
    v23 = (a1[2] / 0x3E8);
    *(_QWORD *)&v34 = v22;
    *((_QWORD *)&v34 + 1) = v23;
    v35 = 0uLL;
    DWORD2(v36) = 0;
    *(_QWORD *)&v36 = 0;
    *(_QWORD *)&v37 = a1[5];
    v24 = *a5;
    *((_QWORD *)&v37 + 1) = *(_QWORD *)*a5;
    *(_QWORD *)&v38 = *(unsigned __int16 *)(v24 + 8);
    v25 = (_QWORD *)a5[2];
    *((_QWORD *)&v38 + 1) = *v25;
    *(_QWORD *)&v39 = *((unsigned __int16 *)v25 + 4);
    if (a2)
    {
      v26 = *(_QWORD *)(a2 + 24);
      v27 = v26 + 4;
      if (!v26)
        v27 = 0;
      *((_QWORD *)&v39 + 1) = v27;
      if (v26)
        v26 += *(unsigned __int8 *)(v26 + 2) + 4;
    }
    else
    {
      v26 = 0;
    }
    *(_QWORD *)&v40 = v26;
    DWORD2(v40) = 0;
    BYTE12(v40) = 0;
    BYTE13(v40) = (a5[9] & 0x10000000) != 0;
    v28 = a1[6];
    *(_QWORD *)&v41 = a1[7];
    *((_QWORD *)&v41 + 1) = v28;
    LOWORD(v42) = 0;
    v43 = 0;
    _os_activity_stream_reflect((uint64_t)v13, (uint64_t)&v29, a1[3], -3, a3, a4);
    xpc_release(v13);
  }
}

char *_os_log_impl_mirror_to_stderr(char *result, uint64_t a2, int a3, uint64_t a4, char a5)
{
  char *v8;
  int v9;
  BOOL v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  time_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  tm v31;
  const char *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;

  v8 = result;
  v35 = *MEMORY[0x1E0C874D8];
  v9 = byte_1ECCEBB3F;
  if (byte_1ECCEBB3E)
    v10 = 1;
  else
    v10 = byte_1ECCEBB3F == 0;
  if (!v10)
  {
    if ((a3 & 0xFE) != 0x10 && (a5 & 0xE) != 2 && (*(_DWORD *)(a4 + 72) & 0x40000000) == 0)
    {
      if ((a5 & 6 | 8) == 0xC)
        return result;
      v11 = (const char *)dyld_image_path_containing_address();
      if (v11)
      {
        v12 = v11;
        result = (char *)strncmp(v11, "/System/Developer/", 0x12uLL);
        if (!(_DWORD)result)
          return result;
        result = (char *)strncmp(v12, "/System/Library/", 0x10uLL);
        if (!(_DWORD)result)
          return result;
        result = (char *)strncmp(v12, "/usr/lib/", 9uLL);
        if (!(_DWORD)result)
          return result;
      }
    }
    v9 = byte_1ECCEBB3F;
  }
  if (!a2
    || a3 != 17
    || !v9
    || (v13 = *(_QWORD *)(a2 + 24)) == 0
    || strcmp((const char *)(v13 + 4), "com.apple.runtime-issues")
    && strcmp((const char *)(v13 + *(unsigned __int8 *)(v13 + 2) + 4), "RuntimeIssues")
    || (result = strstr(*((char **)v8 + 5), "xcode:text-backtrace")) == 0)
  {
    v14 = *((_QWORD *)v8 + 1);
    v15 = *((_QWORD *)v8 + 2);
    *(_QWORD *)&v31.tm_mon = 0;
    *(_QWORD *)&v31.tm_sec = &v34;
    *(_QWORD *)&v31.tm_hour = 0x10000000000;
    os_trace_blob_add_localtime(&v31, v14, v15 / 0x3E8, 1u);
    v16 = getprogname();
    getpid();
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    os_trace_blob_addf((uint64_t)&v31, " %s[%d:%llu] ", v17, v18, v19, v20, v21, v22, v16);
    if (a2)
    {
      v29 = *(_QWORD *)(a2 + 24);
      if (v29)
        os_trace_blob_addf((uint64_t)&v31, "[%s] ", v23, v24, v25, v26, v27, v28, v29 + *(_BYTE *)(v29 + 2) + 4);
    }
    v30 = *(_QWORD *)(a4 + 24);
    if (!v30)
    {
      _os_log_impl_compose(*((char **)v8 + 5), a4);
      v30 = *(_QWORD *)(a4 + 24);
    }
    *(_QWORD *)&v31.tm_wday = *(_QWORD *)&v31.tm_sec;
    *(_QWORD *)&v31.tm_isdst = v31.tm_hour;
    v31.tm_gmtoff = *(_QWORD *)v30;
    v31.tm_zone = (char *)*(unsigned int *)(v30 + 8);
    v32 = "\n";
    v33 = 1;
    return (char *)_os_trace_writev(2, (iovec *)&v31.tm_wday, 3);
  }
  return result;
}

uint64_t _os_log_mirror_syslog(uint64_t result, uint64_t a2, double a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  double v11;
  const char **v12;
  double v13;
  double v14;
  double v15;
  double v16;
  char *v17;

  v17 = 0;
  if ((*(_BYTE *)(a5 + 75) & 0x40) != 0)
    return result;
  v7 = result;
  result = asl_new_delayInitStub(a3);
  if (a2)
  {
    v9 = *(_QWORD *)(a2 + 24);
    if (v9)
      v10 = (const char *)(v9 + *(unsigned __int8 *)(v9 + 2) + 4);
    else
      v10 = 0;
    if (!result)
      return result;
  }
  else
  {
    v10 = 0;
    if (!result)
      return result;
  }
  asl_set_delayInitStub(v8);
  v12 = *(const char ***)(a5 + 24);
  if (!v12)
  {
    _os_log_impl_compose(*(char **)(v7 + 40), a5);
    v12 = *(const char ***)(a5 + 24);
  }
  if (v10)
  {
    asprintf(&v17, "[%s] %s", v10, *v12);
    asl_set_delayInitStub(v13);
    free(v17);
  }
  else
  {
    asl_set_delayInitStub(v11);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_os_log_mirror_syslog_asl_lock);
  if (!*(_QWORD *)(a2 + 32))
  {
    *(_QWORD *)(a2 + 32) = asl_open_delayInitStub(v14);
    asl_set_filter_delayInitStub(v16);
  }
  asl_send_delayInitStub(v14);
  os_unfair_lock_unlock((os_unfair_lock_t)&_os_log_mirror_syslog_asl_lock);
  return asl_release_delayInitStub(v15);
}

uint64_t _os_log_impl_mirror_symptom(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (off_1ECCEBAB8)
  {
    v5 = result;
    if (_os_log_impl_mirror_symptom_reporter
      || (result = symptom_framework_init(), (_os_log_impl_mirror_symptom_reporter = result) != 0))
    {
      result = symptom_new();
      if (result)
      {
        voucher_get_activity_id();
        if (a2)
        {
          v6 = *(_QWORD *)(a2 + 24);
          if (v6)
            a2 = v6 + *(unsigned __int8 *)(v6 + 2) + 4;
          else
            a2 = 0;
        }
        if (!*(_QWORD *)(a3 + 24))
          _os_log_impl_compose(*(char **)(v5 + 40), a3);
        symptom_set_qualifier();
        symptom_set_qualifier();
        symptom_set_qualifier();
        strlen((const char *)a2);
        symptom_set_additional_qualifier();
        symptom_set_additional_qualifier();
        symptom_set_additional_qualifier();
        if (_dyld_get_image_uuid())
          symptom_set_additional_qualifier();
        symptom_set_additional_qualifier();
        return symptom_send();
      }
    }
  }
  return result;
}

void _os_log_impl_generate_crashlog(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const char **v5;
  const char *v6;
  size_t v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  char *v11;
  _DWORD *v12;
  char *v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  uint64_t v17;
  size_t v18;

  v5 = *(const char ***)(a3 + 24);
  if (!v5)
  {
    _os_log_impl_compose(*(char **)(a2 + 40), a3);
    v5 = *(const char ***)(a3 + 24);
  }
  v6 = *v5;
  v7 = strlen(*v5);
  v8 = v7 + 1;
  v9 = *(_QWORD *)(a1 + 24);
  if (v9)
    v9 = *(unsigned __int8 *)(v9 + 3) + (unint64_t)*(unsigned __int8 *)(v9 + 2);
  v10 = v7 + v9 + 21;
  if (v10 >= 0x801 && v8 > 2028 - v9)
  {
    *(_DWORD *)&v6[-v9 + 2024] = 3026478;
    v10 = 2048;
    v8 = 2028 - v9;
  }
  while (1)
  {
    v11 = (char *)malloc_type_malloc(v10, 0x91D685AAuLL);
    if (v11)
      break;
    _os_trace_temporary_resource_shortage();
  }
  v12 = v11;
  *(_DWORD *)v11 = 1;
  *(_QWORD *)(v11 + 12) = 0;
  *(_QWORD *)(v11 + 4) = 0;
  v13 = v11 + 20;
  v14 = *(_QWORD *)(a1 + 24);
  if (!v14)
    goto LABEL_14;
  *((_DWORD *)v11 + 2) = 20;
  v15 = *(unsigned __int8 *)(v14 + 2);
  if (strlcpy(v11 + 20, (const char *)(v14 + 4), v15) + 1 != v15)
  {
LABEL_17:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_18;
  }
  v16 = &v13[v15];
  v12[3] = (_DWORD)v16 - (_DWORD)v12;
  v17 = *(_QWORD *)(a1 + 24);
  v18 = *(unsigned __int8 *)(v17 + 3);
  if (strlcpy(v16, (const char *)(v17 + *(unsigned __int8 *)(v17 + 2) + 4), v18) + 1 == v18)
  {
    v13 = &v16[v18];
LABEL_14:
    v12[4] = (_DWORD)v13 - (_DWORD)v12;
    if (v8 == strlcpy(v13, **(const char ***)(a3 + 24), v10 - ((_DWORD)v13 - (_DWORD)v12)) + 1)
    {
      os_fault_with_payload();
      free(v12);
      return;
    }
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_17;
  }
LABEL_18:
  _os_assert_log();
  _os_crash();
  __break(1u);
}

uint64_t ___init_unreliable_thread_key_block_invoke()
{
  uint64_t result;

  result = pthread_key_create((pthread_key_t *)&_os_log_unreliable_thread_key, 0);
  if ((_DWORD)result)
  {
    _os_assert_log();
    result = _os_crash();
    __break(1u);
  }
  return result;
}

void _os_log_unreliable_impl(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  if ((_DWORD)a3 == 17)
  {
    qword_1EE40C0F0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Calling the unreliable interfaces on a fault is not supported";
    __break(1u);
  }
  else
  {
    _os_log(a1, a2, a3, a4, a5, a6, v6);
  }
}

uint64_t os_set_logging_unreliable_for_current_thread()
{
  if (_init_unreliable_thread_key_unreliable_once != -1)
    dispatch_once(&_init_unreliable_thread_key_unreliable_once, &__block_literal_global_80);
  return pthread_setspecific(_os_log_unreliable_thread_key, (const void *)1);
}

unint64_t os_signpost_set_introspection_hook_4Perf(unint64_t a1)
{
  unint64_t v1;

  do
    v1 = __ldxr((unint64_t *)&_signpost_hook);
  while (__stxr(a1, (unint64_t *)&_signpost_hook));
  return v1;
}

void _os_signpost_emit_impl(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  __os_signpost_emit_impl(a1, a2, a3, a4, 0, a5, a6, a7, v7);
}

void _os_log_internal(void *dso, os_log_t log, os_log_type_t type, const char *message, ...)
{
  uint64_t v4;
  int v9;
  os_log_type_t isa;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  __int128 v17;
  uint64_t v18;
  va_list v19;
  __int16 v20;
  _WORD v21[433];
  uint64_t v22;
  va_list va;

  va_start(va, message);
  v22 = *MEMORY[0x1E0C874D8];
  v9 = *(unsigned __int16 *)__error();
  if (dyld_sdk_at_least() && log && log != (os_log_t)&_os_log_disabled)
  {
    isa = (os_log_type_t)log[7].isa;
    if (isa == OS_LOG_TYPE_DEFAULT)
      isa = type;
    v11 = isa & 0x7F;
    if (os_log_type_enabled(log, (os_log_type_t)(isa & 0x7F)))
    {
      v20 = 0;
      va_copy(v19, va);
      v18 = 0;
      v12 = 0u;
      v13 = 0;
      v14 = dso;
      v15 = v4;
      v16 = message;
      v17 = 0uLL;
      if (os_log_fmt_encode((char *)message, 2, v21, &v20, (int *)va))
      {
        _os_log_impl_flatten_and_send((uint64_t)&v12);
      }
      else
      {
        va_copy(v19, va);
        _os_log_impl_dynamic((uint64_t)&v12, (uint64_t)log, v11, 0, v9, va);
      }
    }
  }
}

char *os_log_pack_send_and_compose(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char v7;

  v7 = 0;
  v4 = &v7;
  if (a4)
    v4 = a4;
  v6 = v4;
  _os_log_impl_flatten_and_send(a1);
  return v6;
}

char *os_log_pack_compose(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char v7;

  v7 = 0;
  v4 = &v7;
  if (a4)
    v4 = a4;
  v6 = v4;
  _os_log_impl_flatten_and_send(a1);
  return v6;
}

int *os_log_with_args_find_first_non_jit_frame(void (**a1)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6))
{
  int v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, void *, int, va_list);
  int *v7;
  _OWORD v10[16];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  memset(v10, 0, sizeof(v10));
  v2 = backtrace((void **)v10, 32);
  v3 = &dword_19BBEC000;
  if (v2 < 1)
  {
    v6 = _os_log_impl_dynamic;
  }
  else
  {
    v4 = 0;
    v5 = v2;
    v6 = _os_log_impl_dynamic;
    while (1)
    {
      v7 = (int *)dyld_image_header_containing_address();
      if (v7 && v7 != &dword_19BBEC000)
        break;
      if (v5 == ++v4)
        goto LABEL_11;
    }
    v6 = (void (*)(uint64_t, uint64_t, uint64_t, void *, int, va_list))*((_QWORD *)v10 + v4);
    v3 = v7;
  }
LABEL_11:
  *a1 = v6;
  return v3;
}

image_offset **os_log_backtrace_create_from_current(uint64_t a1, void *a2)
{
  int v3;
  unint64_t v4;
  uint64_t v5;
  void **v6;
  size_t v7;
  int v8;
  _QWORD v10[2];

  v3 = a1;
  v10[1] = *MEMORY[0x1E0C874D8];
  MEMORY[0x1E0C86820](a1);
  v6 = (void **)((char *)v10 - v5);
  if (v4 >= 0x200)
    v7 = 512;
  else
    v7 = v4;
  bzero((char *)v10 - v5, v7);
  if (a2)
    v8 = backtrace_from_fp(a2, v6, v3);
  else
    v8 = backtrace(v6, v3);
  return os_log_backtrace_create_from_pcs(v6, v8);
}

void os_log_backtrace_destroy(void **a1)
{
  free(*a1);
  free(a1);
}

uint64_t os_log_backtrace_get_frames(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t os_log_backtrace_get_length(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void *os_log_backtrace_copy_serialized_buffer(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v6[2];
  uint64_t v7;
  char v8;
  uint64_t v9;

  v1 = MEMORY[0x1E0C86820](a1);
  v3 = v2;
  v9 = *MEMORY[0x1E0C874D8];
  v7 = 0x1000000000000;
  v6[0] = &v8;
  v6[1] = (void *)0x100000000000;
  os_log_backtrace_serialize_to_blob(v1);
  v4 = os_trace_blob_detach((uint64_t)v6, v3);
  if ((v7 & 0x100000000) != 0)
    free(v6[0]);
  return v4;
}

_DWORD *os_log_backtrace_create_from_buffer(_QWORD *a1, unint64_t *a2)
{
  unint64_t v2;
  _BYTE *v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  _DWORD *v9;
  _DWORD *v12;
  size_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v2 = *a2;
  if (*a2 < 4)
    return 0;
  v4 = (_BYTE *)*a1;
  if (*(_BYTE *)*a1 != 18)
    return 0;
  v5 = *((unsigned __int16 *)v4 + 1);
  v6 = (v5 & 3) != 0
     ? v5 + 16 * v4[1] + 4 * v5 + 4 - (v5 & 3) + 4
     : v5 + 16 * v4[1] + 4 * v5 + 4;
  v7 = v2 >= v6;
  v8 = v2 - v6;
  if (!v7)
    return 0;
  v21 = v8;
  while (1)
  {
    v12 = malloc_type_calloc(1uLL, 0x10uLL, 0x478C0A82uLL);
    if (v12)
      break;
    _os_trace_temporary_resource_shortage();
  }
  v9 = v12;
  v13 = 20 * *((unsigned __int16 *)v4 + 1);
  while (1)
  {
    v14 = (char *)malloc_type_malloc(v13, 0x91D685AAuLL);
    if (v14)
      break;
    _os_trace_temporary_resource_shortage();
  }
  *(_QWORD *)v9 = v14;
  v15 = *((unsigned __int16 *)v4 + 1);
  v9[2] = v15;
  if (v15)
  {
    v16 = 0;
    v17 = (uint64_t)&v4[16 * v4[1] + 4];
    v18 = v17 + 4 * v15;
    v19 = 16;
    do
    {
      v20 = *(unsigned __int8 *)(v18 + v16);
      if ((_DWORD)v20 == 255)
      {
        uuid_clear((unsigned __int8 *)&v14[v19 - 16]);
      }
      else
      {
        if (v20 >= v4[1])
        {
          free(v14);
          free(v9);
          return 0;
        }
        uuid_copy((unsigned __int8 *)&v14[v19 - 16], &v4[16 * v20 + 4]);
      }
      v14 = *(char **)v9;
      *(_DWORD *)(*(_QWORD *)v9 + v19) = *(_DWORD *)(v17 + 4 * v16++);
      v19 += 20;
    }
    while (v16 < *((unsigned __int16 *)v4 + 1));
  }
  *a1 = &v4[v6];
  *a2 = v21;
  return v9;
}

uint64_t os_log_backtrace_print_to_blob(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char out[40];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C874D8];
  if (*(int *)(result + 8) >= 1)
  {
    v3 = result;
    v4 = 0;
    memset(out, 0, 37);
    v5 = 16;
    do
    {
      uuid_unparse((const unsigned __int8 *)(*(_QWORD *)v3 + v5 - 16), out);
      result = os_trace_blob_addf(a2, "%s +0x%x\n", v6, v7, v8, v9, v10, v11, (char)out);
      ++v4;
      v5 += 20;
    }
    while (v4 < *(int *)(v3 + 8));
  }
  return result;
}

void *os_log_backtrace_copy_description(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v4[2];
  uint64_t v5;
  char v6;
  uint64_t v7;

  v1 = MEMORY[0x1E0C86820](a1);
  v7 = *MEMORY[0x1E0C874D8];
  v5 = 0;
  v4[0] = &v6;
  v4[1] = (void *)0x100000000000;
  os_log_backtrace_print_to_blob(v1, (uint64_t)v4);
  v2 = os_trace_blob_detach((uint64_t)v4, 0);
  if ((v5 & 0x100000000) != 0)
    free(v4[0]);
  return v2;
}

uint64_t _os_trace_temporary_resource_shortage()
{
  return sleep(1u);
}

int *_os_trace_undo_write(int a1, uint64_t a2, int a3)
{
  off_t v5;
  int *result;

  v5 = lseek(a1, -a2, 1);
  if (v5 != -1)
    ftruncate(a1, v5);
  result = __error();
  *result = a3;
  return result;
}

void *_os_trace_mmap_offset(int a1, size_t a2, off_t a3)
{
  void *result;

  result = mmap(0, a2, 1, 8194, a1, a3);
  if (result == (void *)-1)
    return 0;
  return result;
}

uint64_t _os_trace_get_times_now(_QWORD *a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v7;
  time_t v8;
  int tm_isdst;
  unint64_t v10;
  tm v11;
  time_t v12;
  time_t v13;
  uint64_t v14;
  uint64_t v15;

  v14 = 0;
  v15 = 0;
  v13 = 0;
  result = mach_get_times();
  if ((_DWORD)result)
    result = _os_assumes_log();
  v7 = v14;
  *a1 = v15;
  v8 = v13;
  *a2 = v7 + 1000000000 * v13;
  if (a3)
  {
    v12 = v8;
    memset(&v11, 0, sizeof(v11));
    result = (uint64_t)localtime_r(&v12, &v11);
    tm_isdst = v11.tm_isdst;
    v10 = ((unsigned __int128)(v11.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v11.tm_gmtoff;
    *a3 = (v10 >> 5) + (v10 >> 63) + 60 * v11.tm_isdst;
    a3[1] = tm_isdst;
  }
  return result;
}

void _os_trace_log_simple(char *a1, ...)
{
  void *v1[2];
  va_list va;

  va_start(va, a1);
  v1[0] = 0;
  va_copy((va_list)&v1[1], va);
  vasprintf((char **)v1, a1, va);
  _simple_asl_log();
  free(v1[0]);
}

char *_os_trace_strdup(char *__s1)
{
  char *result;

  while (1)
  {
    result = strdup(__s1);
    if (result)
      break;
    _os_trace_temporary_resource_shortage();
  }
  return result;
}

intptr_t _os_state_request_for_pidlist(uint64_t a1, int a2)
{
  intptr_t result;
  unsigned int v5;
  int v6;
  unsigned int v7;
  _QWORD v8[5];
  int v9;

  if (_os_state_request_for_pidlist_onceToken != -1)
    dispatch_once(&_os_state_request_for_pidlist_onceToken, &__block_literal_global_376);
  result = dispatch_semaphore_wait((dispatch_semaphore_t)_os_state_request_for_pidlist_sema, 0);
  if (!result)
  {
    if (_os_trace != -1)
      dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
    if (dword_1ECCEBAD4 != -1)
      _os_trace_prefs_and_mode_refresh_slow(dword_1ECCEBAD4);
    v5 = dword_1ECCEBAD8;
    v6 = dword_1ECCEBADC;
    if (dword_1ECCEBADC != dword_1ECCEBAD8)
    {
      while (1)
      {
        v7 = __ldxr((unsigned int *)&dword_1ECCEBADC);
        if (v7 != v6)
          break;
        if (!__stxr(v5, (unsigned int *)&dword_1ECCEBADC))
        {
          _os_log_preferences_refresh_process();
          goto LABEL_9;
        }
      }
      __clrex();
    }
LABEL_9:
    v8[0] = MEMORY[0x1E0C87450];
    v8[1] = 0x40000000;
    v8[2] = ___os_state_request_for_pidlist_block_invoke_2;
    v8[3] = &__block_descriptor_tmp_3_377;
    v9 = a2;
    v8[4] = a1;
    _os_activity_initiate_impl((uint64_t)&dword_19BBEC000, (uint64_t)"System-wide statedump", 0, (uint64_t)v8, (void (*)(uint64_t))___os_state_request_for_pidlist_block_invoke_2);
    return dispatch_semaphore_signal((dispatch_semaphore_t)_os_state_request_for_pidlist_sema);
  }
  return result;
}

uint64_t ___os_state_request_for_pidlist_block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  mach_port_name_t *v5;
  uint64_t *v6;
  uint64_t (*v7)(_QWORD);
  BOOL v8;
  mach_port_name_t name;
  mach_msg_header_t msg;
  uint64_t v11;
  uint64_t v12;

  result = voucher_get_activity_id();
  if (*(_DWORD *)(a1 + 40))
  {
    v3 = result;
    v4 = 0;
    v5 = (mach_port_name_t *)MEMORY[0x1E0C883F0];
    v6 = (uint64_t *)MEMORY[0x1E0C87D40];
    v7 = MEMORY[0x1E0C88840];
    do
    {
      name = 0;
      result = debug_control_port_for_pid(*v5, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v4), &name);
      if ((_DWORD)result)
        v8 = 1;
      else
        v8 = name == 0;
      if (!v8)
      {
        v11 = *v6;
        v12 = v3;
        *(_QWORD *)&msg.msgh_bits = 19;
        msg.msgh_voucher_port = 0;
        msg.msgh_id = 50001;
        msg.msgh_remote_port = name;
        msg.msgh_local_port = 0;
        if (v7)
          voucher_mach_msg_set(&msg);
        if (mach_msg(&msg, 17, 0x28u, 0, 0, 0x32u, 0) == 268435460)
        {
          if ((msg.msgh_bits & 0x1F00) == 0x1100)
            mach_port_deallocate(*v5, msg.msgh_local_port);
          mach_msg_destroy(&msg);
        }
        result = mach_port_deallocate(*v5, name);
      }
      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 40));
  }
  return result;
}

dispatch_semaphore_t ___os_state_request_for_pidlist_block_invoke()
{
  dispatch_semaphore_t result;

  result = dispatch_semaphore_create(1);
  _os_state_request_for_pidlist_sema = (uint64_t)result;
  return result;
}

unsigned int os_activity_get_active(os_activity_id_t *entries, unsigned int *count)
{
  os_activity_id_t activity_id;
  unsigned int result;
  os_activity_id_t v6;

  if (*count >= 2)
  {
    activity_id = voucher_get_activity_id();
    *entries = activity_id;
    if (entries[1])
      result = (activity_id != 0) + 1;
    else
      result = activity_id != 0;
    goto LABEL_7;
  }
  if (*count == 1)
  {
    v6 = voucher_get_activity_id();
    *entries = v6;
    result = v6 != 0;
LABEL_7:
    *count = result;
    return result;
  }
  return 0;
}

os_activity_t _os_activity_start(void *dso, const char *description, os_activity_flag_t flags)
{
  return 0;
}

uint64_t os_activity_diagnostic_for_pid()
{
  return 0;
}

uint64_t os_activity_for_task_thread()
{
  return 0;
}

uint64_t os_activity_for_thread()
{
  return 0;
}

uint64_t os_activity_messages_for_thread()
{
  return 0;
}

uint64_t (*libtraceMIG_server_routine(uint64_t a1))()
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 50003) >= 0xFFFFFFFD)
    return ostracemig_do_libtraceMIG_subsystem[5 * (v1 - 50000) + 5];
  else
    return 0;
}

void _XChangeMode(_DWORD *a1, uint64_t a2)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C874D8];
  if ((*a1 & 0x80000000) != 0 || a1[1] != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C87D40];
  }
  else
  {
    if ((dword_1ECCEBAC8 & 0x100) == 0)
    {
      v3 = a1[8];
      v4 = a1[9];
      v5 = a1[10];
      if ((MEMORY[0xFFFFFC104] & 0x100) == 0)
      {
        if (_os_trace != -1)
        {
          v8 = a1[8];
          dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
          v3 = v8;
        }
        v6 = dword_1ECCEBAC8;
        v7 = v3 & 0xFFFFFF;
        dword_1ECCEBAC8 = v3 & 0xFFFFFF;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v9[0] = 67109888;
          v9[1] = v6;
          v10 = 1024;
          v11 = v7;
          v12 = 1024;
          v13 = v4;
          v14 = 1024;
          v15 = v5;
          _os_log_impl(&dword_19BBEC000, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Change Mode: %{os_trace_procmode_t}d, Final: %{os_trace_procmode_t}d, Interval: %d, Filter: 0x%x", (uint8_t *)v9, 0x1Au);
        }
      }
    }
    *(_DWORD *)(a2 + 32) = 0;
  }
}

void _XStateDump(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C87D40];
  }
  else
  {
    _os_state_request_for_self(*(_QWORD *)(a1 + 32), &ostracemig_do_StateDump_hints, 14, 0);
    *(_DWORD *)(a2 + 32) = 0;
  }
}

_DWORD *_XGetMode(_DWORD *result, uint64_t a2)
{
  mach_port_t v3;
  uint64_t *v4;
  uint64_t v5;
  mach_msg_header_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    v5 = *MEMORY[0x1E0C87D40];
  }
  else
  {
    v3 = result[2];
    v4 = (uint64_t *)MEMORY[0x1E0C87D40];
    v7 = *MEMORY[0x1E0C87D40];
    v8 = 0;
    v9 = dword_1ECCEBAC8;
    v10 = 0;
    *(_QWORD *)&v6.msgh_bits = 18;
    v6.msgh_remote_port = v3;
    v6.msgh_id = 50102;
    *(_QWORD *)&v6.msgh_local_port = 0;
    if (MEMORY[0x1E0C88840])
      voucher_mach_msg_set(&v6);
    result = (_DWORD *)mach_msg(&v6, 1, 0x30u, 0, 0, 0, 0);
    *(_DWORD *)(a2 + 32) = -305;
    v5 = *v4;
  }
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

size_t _os_log_fmt_decode_error(size_t result)
{
  uint64_t v1;
  unsigned int v2;

  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    v1 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v1 - 1) <= 0x15)
    {
      return os_trace_blob_add_slow(result, "<decode: missing data>", 0x16uLL);
    }
    else
    {
      qmemcpy((void *)(*(_QWORD *)result + v1), "<decode: missing data>", 22);
      v2 = *(_DWORD *)(result + 8) + 22;
      *(_DWORD *)(result + 8) = v2;
      if (!*(_BYTE *)(result + 22))
        *(_BYTE *)(*(_QWORD *)result + v2) = 0;
    }
  }
  return result;
}

uint64_t _os_log_fmt_decode_cmd_mismatch(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  _DWORD *v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;

  v8 = a5;
  os_trace_blob_addf(a1, "<decode: mismatch for [%.*s] got [", a3, (uint64_t)a4, a5, a6, a7, a8, a3);
  v17 = *a4;
  if (v17 > 0x4F)
  {
    os_trace_blob_addf(a1, "%d", v11, v12, v13, v14, v15, v16, *a4 >> 4);
  }
  else
  {
    v18 = _cmd_type2str[v17 >> 4];
    v19 = strlen(v18);
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      v26 = v19;
      v27 = *(unsigned int *)(a1 + 8);
      if (v19 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
      {
        os_trace_blob_add_slow(a1, v18, v19);
      }
      else
      {
        memcpy((void *)(*(_QWORD *)a1 + v27), v18, v19);
        v28 = *(_DWORD *)(a1 + 8) + v26;
        *(_DWORD *)(a1 + 8) = v28;
        if (!*(_BYTE *)(a1 + 22))
          *(_BYTE *)(*(_QWORD *)a1 + v28) = 0;
      }
    }
  }
  if ((*a4 & 2) != 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    v29 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v29 - 1) <= 6)
    {
      os_trace_blob_add_slow(a1, " public", 7uLL);
    }
    else
    {
      v30 = (_DWORD *)(*(_QWORD *)a1 + v29);
      *(_DWORD *)((char *)v30 + 3) = 1667853410;
      *v30 = 1651863584;
      v31 = *(_DWORD *)(a1 + 8) + 7;
      *(_DWORD *)(a1 + 8) = v31;
      if (!*(_BYTE *)(a1 + 22))
        *(_BYTE *)(*(_QWORD *)a1 + v31) = 0;
    }
  }
  if ((*a4 & 1) != 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    v32 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v32 - 1) <= 7)
    {
      os_trace_blob_add_slow(a1, " private", 8uLL);
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)a1 + v32) = 0x6574617669727020;
      v33 = *(_DWORD *)(a1 + 8) + 8;
      *(_DWORD *)(a1 + 8) = v33;
      if (!*(_BYTE *)(a1 + 22))
        *(_BYTE *)(*(_QWORD *)a1 + v33) = 0;
    }
  }
  return os_trace_blob_addf(a1, " sz:%d]>", v20, v21, v22, v23, v24, v25, v8);
}

uint64_t _os_log_fmt_decode_bad_range(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_trace_blob_addf(a1, "<decode: bad range for [%.*s] got [offs:%d len:%d within:%d]>", a3, a4, a5, a6, a7, a8, a3);
}

uint64_t _os_log_fmt_decode_masked_unknown(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  if ((a4 - 8) < 3)
    return os_trace_blob_addf(a1, "<decode: mask \"%.*s\" is %s>", a3, a4, a5, a6, a7, a8, a2);
  result = _os_crash();
  __break(1u);
  return result;
}

uint64_t _os_log_fmt_decode_give_up(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_trace_blob_addf(a1, "<decode: can't compose [%.*s]>", a3, a4, a5, a6, a7, a8, a3);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C87428](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C87438](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C87440](aBlock);
}

mach_header_64 *_NSGetMachExecuteHeader(void)
{
  return (mach_header_64 *)MEMORY[0x1E0C87478]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C88F60](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C874A0](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C874A8]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x1E0C87EC0]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1E0C874C0](a1, a2, *(_QWORD *)&a3, a4, a5);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C874C8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C87508]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C87518](*(_QWORD *)&a1);
}

uint64_t __ulock_wait()
{
  return MEMORY[0x1E0C87F48]();
}

uint64_t __ulock_wake()
{
  return MEMORY[0x1E0C87F58]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1E0C86EF0]();
}

uint64_t _dyld_dlsym_blocked()
{
  return MEMORY[0x1E0C872B0]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1E0C872C0](*(_QWORD *)&image_index);
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)MEMORY[0x1E0C872C8](*(_QWORD *)&image_index);
}

uint64_t _dyld_get_image_slide()
{
  return MEMORY[0x1E0C872D0]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1E0C872D8]();
}

uint64_t _dyld_get_prog_image_header()
{
  return MEMORY[0x1E0C872E0]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1E0C872E8]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1E0C872F0]();
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x1E0C872F8]();
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1E0C87308]();
}

void _dyld_register_func_for_add_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
  MEMORY[0x1E0C87318](func);
}

void _dyld_register_func_for_remove_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
  MEMORY[0x1E0C87320](func);
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C87528]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1E0C87530]();
}

uint64_t _os_assumes_log_ctx()
{
  return MEMORY[0x1E0C87538]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C87548]();
}

uint64_t _os_object_alloc_realized()
{
  return MEMORY[0x1E0C86F38]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1E0C88B40]();
}

uint64_t _simple_sappend()
{
  return MEMORY[0x1E0C88B78]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C87610](__buf, __nbytes);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87620](a1, a2);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C87640](a1, *(_QWORD *)&a2);
}

int backtrace_from_fp(void *startfp, void **array, int size)
{
  return MEMORY[0x1E0C87648](startfp, array, *(_QWORD *)&size);
}

void backtrace_image_offsets(void *const *array, image_offset *image_offsets, int size)
{
  MEMORY[0x1E0C87650](array, image_offsets, *(_QWORD *)&size);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1E0C89038]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1E0C89048](*(_QWORD *)&r);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C87668](a1, a2);
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C86858]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1E0C869E0]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1E0C869E8]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1E0C869F0]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x1E0C86B68]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1E0C86D10]();
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1E0DE7AB0](cls);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C87678](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C88018](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C87680](a1);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C87690](a1, a2);
}

kern_return_t debug_control_port_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x1E0C88048](*(_QWORD *)&target_tport, *(_QWORD *)&pid, t);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C86F98](queue, block);
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
  MEMORY[0x1E0C86FC0](flags, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C86FD8](buffer, size, queue, destructor);
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1E0C870B8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C87100](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C87108](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C87110](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C87128](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C87130](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C87148](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C87158](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C87160](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C87168](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C87170](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C871F8](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C87350](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C87358](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1E0C88050](*(_QWORD *)&a1);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x1E0C87370]();
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1E0C87378]();
}

uint64_t dyld_sdk_at_least()
{
  return MEMORY[0x1E0C87390]();
}

uint64_t dyld_shared_cache_iterate_text()
{
  return MEMORY[0x1E0C87398]();
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1E0C876D0](*(_QWORD *)&a1);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C880B0](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C87740](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C88130](*(_QWORD *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C877A8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C88160]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C88190]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C877C0]();
}

uint8_t *__cdecl getsegmentdata(const mach_header_64 *mhp, const char *segname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1E0C873B8](mhp, segname, size);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C877C8](a1, a2);
}

kern_return_t host_set_atm_diagnostic_flag(host_t host, uint32_t diagnostic_flag)
{
  return MEMORY[0x1E0C88218](*(_QWORD *)&host, *(_QWORD *)&diagnostic_flag);
}

int isatty(int a1)
{
  return MEMORY[0x1E0C87800](*(_QWORD *)&a1);
}

int issetugid(void)
{
  return MEMORY[0x1E0C88230]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C87810](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C882A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C882D0]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C882D8](*(_QWORD *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C88320]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C88328]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C88338](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C88348](a1);
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1E0C88360](*(_QWORD *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C88368](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1E0C88408](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C88410](*(_QWORD *)&target, address, size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88970](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88988](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C87820](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C87828](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C87830](__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C884B0](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C884C8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C884D8](*(_QWORD *)&reply_port);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C88500](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C889D8](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C889E0](*(_QWORD *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C88A08](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C88A10](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

id objc_constructInstance(Class cls, void *bytes)
{
  return (id)MEMORY[0x1E0DE7C00](cls, bytes);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x1E0DE8028](obj);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1E0C88540](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C87878](a1);
}

uint64_t os_fault_with_payload()
{
  return MEMORY[0x1E0C88558]();
}

void os_release(void *object)
{
  MEMORY[0x1E0C87210](object);
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1E0C87218](object);
}

uint64_t os_simple_hash()
{
  return MEMORY[0x1E0C87C48]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C88BC8](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BD0](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C88BE0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BF0](lock);
}

uint64_t os_variant_check()
{
  return MEMORY[0x1E0C87C50]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C87C60]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C885F0](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C88608](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C88D28](a1);
}

int pthread_is_threaded_np(void)
{
  return MEMORY[0x1E0C88D38]();
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C88D40](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C88DC8](a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C878B0](__base, __nel, __width, __compar);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C878C0](a1);
}

void rewinddir(DIR *a1)
{
  MEMORY[0x1E0C87900](a1);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80E8](str);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C87940](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C87950](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C87970](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1E0C87978](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C87988](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C87990](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C879A0](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C879A8](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C879B0](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C879D0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C879E0](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C879E8](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C879F8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C87A00](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C87A08](__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C87A18](__s, *(_QWORD *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C87A20](__stringp, __delim);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C87A28](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C87A30](__s1, __s2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C87A58](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t symptom_framework_init()
{
  return MEMORY[0x1E0C88E58]();
}

uint64_t symptom_new()
{
  return MEMORY[0x1E0C88E60]();
}

uint64_t symptom_send()
{
  return MEMORY[0x1E0C88E68]();
}

uint64_t symptom_set_additional_qualifier()
{
  return MEMORY[0x1E0C88E70]();
}

uint64_t symptom_set_qualifier()
{
  return MEMORY[0x1E0C88E78]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C87A90](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C87A98](a1, a2, a3, a4, a5);
}

kern_return_t task_set_special_port(task_t task, int which_port, mach_port_t special_port)
{
  return MEMORY[0x1E0C88798](*(_QWORD *)&task, *(_QWORD *)&which_port, *(_QWORD *)&special_port);
}

uint64_t thread_stack_async_pcs()
{
  return MEMORY[0x1E0C87AA8]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C87AB8](a1);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C87AE0](uu);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C87AE8](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C87AF0](dst, src);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C87B00](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C87B10](uu, out);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C87B18](uu, out);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C87B20](a1, a2, a3);
}

uint64_t voucher_activity_create_with_data_2()
{
  return MEMORY[0x1E0C87220]();
}

uint64_t voucher_activity_flush()
{
  return MEMORY[0x1E0C87228]();
}

uint64_t voucher_activity_get_logging_preferences()
{
  return MEMORY[0x1E0C87230]();
}

uint64_t voucher_activity_get_metadata_buffer()
{
  return MEMORY[0x1E0C87238]();
}

uint64_t voucher_activity_id_allocate()
{
  return MEMORY[0x1E0C87240]();
}

uint64_t voucher_activity_initialize_4libtrace()
{
  return MEMORY[0x1E0C87248]();
}

uint64_t voucher_activity_should_send_strings()
{
  return MEMORY[0x1E0C87250]();
}

uint64_t voucher_activity_trace()
{
  return MEMORY[0x1E0C87258]();
}

uint64_t voucher_activity_trace_v_2()
{
  return MEMORY[0x1E0C87260]();
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1E0C87268]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1E0C87270]();
}

uint64_t voucher_get_activity_id()
{
  return MEMORY[0x1E0C87280]();
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C88840](msg);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C87B30](__str, __size, __format, a4);
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x1E0C87B40](a1);
}

size_t wcsnlen(const __int32 *a1, size_t a2)
{
  return MEMORY[0x1E0C87B48](a1, a2);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C888E0](*(_QWORD *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1E0C888F0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C89058](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C89060](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C89068](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C89070](xarray);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
  MEMORY[0x1E0C89098](xarray, index, bytes, length);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C890A8](xBOOL);
}

uint64_t xpc_bundle_create_main()
{
  return MEMORY[0x1E0C890B8]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x1E0C890C8]();
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C89140](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1E0C89150]();
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1E0C89158]();
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1E0C89168](ddata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C89190](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C891A0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C891A8]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C891B8](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C891C8](xdict);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C891D8](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C891E0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C891E8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C891F0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C89200](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C89208](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C89210](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C89220](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C89230](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C89238](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C89240](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C89248](xdict, key, value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C89250](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C89270](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C89280](xint);
}

uint64_t xpc_pipe_create()
{
  return MEMORY[0x1E0C89298]();
}

uint64_t xpc_pipe_invalidate()
{
  return MEMORY[0x1E0C892A8]();
}

uint64_t xpc_pipe_routine()
{
  return MEMORY[0x1E0C892B0]();
}

uint64_t xpc_pipe_simpleroutine()
{
  return MEMORY[0x1E0C892B8]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C892C0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C892C8](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C892E8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C892F8](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C89320](xuuid);
}

uint64_t asl_new_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_libsystem_asl_dylib))
    dlopenHelper_libsystem_asl_dylib(a1);
  return MEMORY[0x1E0C873D8]();
}

uint64_t asl_set_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_libsystem_asl_dylib))
    dlopenHelper_libsystem_asl_dylib(a1);
  return MEMORY[0x1E0C87400]();
}

uint64_t asl_send_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_libsystem_asl_dylib))
    dlopenHelper_libsystem_asl_dylib(a1);
  return MEMORY[0x1E0C873F8]();
}

uint64_t asl_release_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_libsystem_asl_dylib))
    dlopenHelper_libsystem_asl_dylib(a1);
  return MEMORY[0x1E0C873F0]();
}

uint64_t asl_open_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_libsystem_asl_dylib))
    dlopenHelper_libsystem_asl_dylib(a1);
  return MEMORY[0x1E0C873E8]();
}

uint64_t asl_set_filter_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_libsystem_asl_dylib))
    dlopenHelper_libsystem_asl_dylib(a1);
  return MEMORY[0x1E0C87408]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_libsystem_asl_dylib(double a1)
{
  dlopen("/usr/lib/system/libsystem_asl.dylib", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_libsystem_asl_dylib);
  return a1;
}

