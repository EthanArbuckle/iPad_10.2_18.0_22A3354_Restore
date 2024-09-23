void szone_free(uint64_t a1, unint64_t a2)
{
  _szone_free(a1, a2, 0);
}

uint64_t default_zone_free()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(v0 + 48))();
}

void szone_try_free_default(uint64_t a1, unint64_t a2)
{
  _szone_free(a1, a2, 1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  BOOL v4;
  uint64_t v6;
  unsigned int v7;

  if (malloc_logger)
    v4 = 0;
  else
    v4 = malloc_slowpath == 0;
  if (!v4 || malloc_absolute_max_size < size)
    return (void *)_malloc_type_malloc_outlined(size, type_id, 1);
  v6 = *(_QWORD *)malloc_zones;
  v7 = *(_DWORD *)(*(_QWORD *)malloc_zones + 104);
  if (v7 >= 0x10)
    return (void *)(*(uint64_t (**)(uint64_t, size_t, malloc_type_id_t))(v6 + 160))(v6, size, type_id);
  if (v7 > 0xC)
    return (void *)(*(uint64_t (**)(uint64_t, size_t))(v6 + 24))(v6, size);
  else
    return (void *)_malloc_type_malloc_outlined(size, type_id, 1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  BOOL v6;
  uint64_t v7;
  unsigned int v8;

  if (malloc_logger)
    v6 = 0;
  else
    v6 = malloc_slowpath == 0;
  if (!v6)
    return (void *)_malloc_type_calloc_outlined(count, size, type_id);
  v7 = *(_QWORD *)malloc_zones;
  v8 = *(_DWORD *)(*(_QWORD *)malloc_zones + 104);
  if (v8 >= 0x10)
    return (void *)(*(uint64_t (**)(uint64_t, size_t, size_t, malloc_type_id_t))(v7 + 168))(v7, count, size, type_id);
  if (v8 > 0xC)
    return (void *)(*(uint64_t (**)(uint64_t, size_t, size_t))(v7 + 32))(v7, count, size);
  else
    return (void *)_malloc_type_calloc_outlined(count, size, type_id);
}

size_t malloc_good_size(size_t size)
{
  return (*(uint64_t (**)(void))(*((_QWORD *)default_zone + 12) + 8))();
}

uint64_t default_zone_good_size()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 96) + 8))();
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  BOOL v3;
  unsigned int version;

  if (malloc_logger)
    v3 = 0;
  else
    v3 = malloc_slowpath == 0;
  if (!v3 || malloc_absolute_max_size < size)
    return (void *)_malloc_type_zone_malloc_outlined(zone, size, type_id);
  if (default_zone == (_UNKNOWN *)zone)
    zone = *(malloc_zone_t **)malloc_zones;
  version = zone->version;
  if (version >= 0x10)
    return (void *)((uint64_t (*)(malloc_zone_t *, size_t, malloc_type_id_t))zone[1].reserved2)(zone, size, type_id);
  if (version > 0xC)
    return (void *)((uint64_t (*)(malloc_zone_t *, size_t))zone->malloc)(zone, size);
  else
    return (void *)_malloc_type_zone_malloc_outlined(zone, size, type_id);
}

void *__cdecl malloc_type_zone_calloc(malloc_zone_t *zone, size_t count, size_t size, malloc_type_id_t type_id)
{
  BOOL v4;
  unsigned int version;

  if (malloc_logger)
    v4 = 0;
  else
    v4 = malloc_slowpath == 0;
  if (!v4)
    return (void *)_malloc_type_zone_calloc_outlined(zone, count, size, type_id);
  if (default_zone == (_UNKNOWN *)zone)
    zone = *(malloc_zone_t **)malloc_zones;
  version = zone->version;
  if (version >= 0x10)
    return (void *)((uint64_t (*)(malloc_zone_t *, size_t, size_t, malloc_type_id_t))zone[1].size)(zone, count, size, type_id);
  if (version > 0xC)
    return (void *)((uint64_t (*)(malloc_zone_t *, size_t, size_t))zone->calloc)(zone, count, size);
  else
    return (void *)_malloc_type_zone_calloc_outlined(zone, count, size, type_id);
}

unint64_t nanov2_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x100)
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 28704) + 96) + 8))();
  if (a2 <= 0x10)
    return 16;
  return (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)_malloc_zone_malloc((uint64_t)default_zone, __size, 1);
}

unint64_t xzm_good_size(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  if (a2 > 0x8000)
  {
    if ((a2 & 0xFFFFFFFFFFFFC000) + 0x4000 <= a2 || (a2 & 0x3FFF) == 0)
      return a2;
    else
      return (a2 & 0xFFFFFFFFFFFFC000) + 0x4000;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 232);
    if (!v2)
      v2 = a1;
    v3 = __clz(a2 - 1);
    v4 = (((a2 - 1) >> (61 - v3)) & 3) - 4 * v3 + 488;
    if (a2 <= 0x80)
      v4 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
    if (!a2)
      LOBYTE(v4) = 0;
    return *(_QWORD *)(*(_QWORD *)(v2 + 352) + 8 * v4);
  }
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)_malloc_zone_calloc((uint64_t)default_zone, __count, __size, 1);
}

uint64_t _malloc_type_zone_memalign_outlined(malloc_zone_t *a1, size_t a2, size_t a3, unint64_t a4)
{
  unint64_t StatusReg;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v5 = *(_QWORD *)(StatusReg + 904);
  if (a4 <= 1)
    v6 = 1;
  else
    v6 = a4;
  *(_QWORD *)(StatusReg + 904) = v6;
  if (malloc_interposition_compat)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
    result = (uint64_t)j__malloc_zone_memalign(a1, a2, a3);
  else
    result = _malloc_zone_memalign((uint64_t)a1, a2, a3, 0, 0);
  *(_QWORD *)(StatusReg + 904) = v5;
  return result;
}

uint64_t _malloc_type_posix_memalign_outlined(void **a1, size_t a2, size_t a3, unint64_t a4)
{
  unint64_t StatusReg;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v5 = *(_QWORD *)(StatusReg + 904);
  if (a4 <= 1)
    v6 = 1;
  else
    v6 = a4;
  *(_QWORD *)(StatusReg + 904) = v6;
  if (malloc_interposition_compat)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
    result = j__posix_memalign(a1, a2, a3);
  else
    result = _posix_memalign((uint64_t *)a1, a2, a3);
  *(_QWORD *)(StatusReg + 904) = v5;
  return result;
}

uint64_t _posix_memalign(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v6 = _malloc_zone_memalign((uint64_t)default_zone, a2, a3, 0, (v3 >> 2));
  if (v6)
  {
    v7 = v6;
    result = 0;
    *a1 = v7;
  }
  else if ((a2 & (a2 - 1)) == 0 && a2 > 7)
  {
    return 12;
  }
  else
  {
    return 22;
  }
  return result;
}

uint64_t _malloc_zone_memalign(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  char v6;
  unint64_t StatusReg;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint8x8_t v17;
  uint64_t (*v18)(uint64_t, unint64_t, unint64_t, uint64_t, uint64_t);

  v6 = a4;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v11 = *(_QWORD *)(StatusReg + 904);
  v12 = v11;
  if (!v11)
  {
    *(_QWORD *)(StatusReg + 904) = a5;
    v12 = a5;
  }
  v13 = malloc_tracing_enabled;
  if (malloc_tracing_enabled)
    kdebug_trace();
  if (*(_DWORD *)(a1 + 104) < 5u)
    goto LABEL_9;
  if (malloc_check_start)
    internal_check();
  if (malloc_absolute_max_size < a3)
    goto LABEL_9;
  v14 = 0;
  v15 = 22;
  if (a2 >= 8)
  {
    v17 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] <= 1uLL)
    {
      if (((a2 - 1) & a3) == 0 || (v6 & 2) == 0)
      {
        v18 = *(uint64_t (**)(uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))(a1 + 112);
        if (v18)
        {
          v14 = v18(a1, a2, a3, a4, v12);
          if (malloc_logger)
            malloc_logger(10, a1, a3, 0, v14, 0);
          if (malloc_simple_stack_logging == 1)
          {
            malloc_report(0x325u, (uint64_t)"memalign (%p/%llu,%llu): ");
            if (!v13)
              goto LABEL_10;
          }
          else if (!v13)
          {
            goto LABEL_10;
          }
          kdebug_trace();
          goto LABEL_10;
        }
LABEL_9:
        v14 = 0;
LABEL_10:
        v15 = 12;
        goto LABEL_11;
      }
      v14 = 0;
      v15 = 22;
    }
  }
LABEL_11:
  if (!v11)
    *(_QWORD *)(StatusReg + 904) = 0;
  if (!v14 && (v6 & 1) != 0)
    **(_DWORD **)(StatusReg + 8) = v15;
  return v14;
}

uint64_t default_zone_memalign()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t szone_realloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v12;
  void *should_clear;
  void *v14;
  size_t v15;

  v4 = a1;
  if (!a2)
  {
    v10 = a3;
    return szone_malloc_should_clear(a1, v10, 0);
  }
  v5 = (const void *)a2;
  if (!a3)
  {
    _szone_free(a1, a2, 0);
    a1 = v4;
    v10 = 1;
    return szone_malloc_should_clear(a1, v10, 0);
  }
  v6 = szone_size(a1, a2);
  if (!v6)
  {
    malloc_zone_error(*(_DWORD *)(v4 + 16392), 1, (uint64_t)"pointer %p being reallocated was not allocated\n");
    return 0;
  }
  v7 = v6;
  v8 = szone_good_size(v6, a3);
  if (v8 == v7)
    return (uint64_t)v5;
  v9 = v8;
  if (v8 > 0x3F0)
  {
    if (v8 > 0x3C00)
    {
      if (v7 < 0x3C01)
        goto LABEL_31;
      v12 = *(_DWORD *)(v4 + 16392);
      if ((v12 & 0x80) != 0)
        goto LABEL_31;
      if (v8 > v7 >> 1)
      {
        if (v8 <= v7)
          goto LABEL_34;
        if (large_try_realloc_in_place(v4, (unint64_t)v5, v7, v8))
        {
          if ((*(_BYTE *)(v4 + 16392) & 0x20) != 0)
            goto LABEL_35;
          return (uint64_t)v5;
        }
        goto LABEL_31;
      }
      return large_try_shrink_in_place(v4, (unint64_t)v5, v7, v8);
    }
    else
    {
      if ((v7 - 1009) >> 4 > 0x380)
        goto LABEL_31;
      if (v8 > v7 >> 1)
      {
        if (v8 > v7)
        {
          if (!small_try_realloc_in_place(v4 + 17280, (uint64_t)v5, v7, v8))
            goto LABEL_31;
          goto LABEL_22;
        }
LABEL_33:
        LOBYTE(v12) = *(_BYTE *)(v4 + 16392);
LABEL_34:
        if ((v12 & 0x20) != 0)
LABEL_35:
          _platform_memset();
        return (uint64_t)v5;
      }
      return small_try_shrink_in_place(v4 + 17280, (uint64_t)v5, v7, v8);
    }
  }
  else
  {
    if (v7 > 0x3F0)
      goto LABEL_31;
    if (v8 > v7 >> 1)
    {
      if (v8 > v7)
      {
        if (!tiny_try_realloc_in_place(v4 + 16512, (uint64_t)v5, v7, v8))
        {
LABEL_31:
          if (v9 > v7 >> 1 && v9 <= v7)
            goto LABEL_33;
          should_clear = (void *)szone_malloc_should_clear(v4, a3, 0);
          if (should_clear)
          {
            v14 = should_clear;
            if (v7 >= a3)
              v15 = a3;
            else
              v15 = v7;
            memcpy(should_clear, v5, v15);
            _szone_free(v4, (unint64_t)v5, 0);
            return (uint64_t)v14;
          }
          return 0;
        }
LABEL_22:
        if ((*(_BYTE *)(v4 + 16392) & 0x20) != 0)
          goto LABEL_35;
        return (uint64_t)v5;
      }
      goto LABEL_33;
    }
    return tiny_try_shrink_in_place(v4 + 16512, (uint64_t)v5, v7, v8);
  }
}

void free_tiny(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v7;
  int v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  int i;
  int v22;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  unsigned int *v27;
  unint64_t v28;
  int v29;
  unint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;

  v7 = a3;
  v10 = *(_DWORD *)(a3 + 24);
  v11 = *(_QWORD *)(a1 + 624);
  v12 = (os_unfair_lock_s *)(v11 + 2560 * v10);
  if (malloc_tracing_enabled)
  {
    kdebug_trace();
    if (a4)
      goto LABEL_3;
  }
  else if (a4)
  {
LABEL_3:
    v13 = (unint64_t)(a4 + 15) >> 4;
    goto LABEL_4;
  }
  v23 = a2 & 0xFFFFFFFFFFF00000 | 0x28;
  v24 = a2 - (a2 & 0xFFF00000 | 0x4080);
  v25 = (v24 >> 8) & 0xFFE;
  v26 = 1 << (v24 >> 4);
  v27 = (unsigned int *)(v23 + 4 * v25);
  v28 = *v27;
  if ((v28 & v26) != 0)
  {
    if ((*(_DWORD *)(v23 + 4 * (v25 | 1)) & v26) == 0)
      goto LABEL_31;
    v29 = (v24 >> 4) & 0x1F;
    v30 = ((unint64_t)v27[2] << (32 - v29)) | (v28 >> v29);
    if (v29)
      v30 |= (unint64_t)v27[4] << -(char)v29;
    v31 = __clz(__rbit64(v30 >> 1));
    if (v30 >= 2)
      LOWORD(v13) = v31 + 1;
    else
      LOWORD(v13) = 0;
  }
  else
  {
    LOWORD(v13) = 0;
  }
LABEL_4:
  if (!malloc_zero_policy)
    _platform_memset();
  os_unfair_lock_lock_with_options();
  v14 = 0;
  if (a5 || v10 == -1 || (unsigned __int16)v13 > 0xFu)
  {
    v16 = a2;
    goto LABEL_17;
  }
  v15 = v11 + 2560 * v10;
  v18 = *(_QWORD *)(v15 + 8);
  v17 = v15 + 8;
  v16 = v18;
  if (v18 == a2)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 2560 * v10));
LABEL_31:
    free_tiny_botch(a1);
    return;
  }
  v19 = *(_WORD *)(v17 + 8);
  v20 = *(_QWORD *)(v17 + 16);
  if (malloc_zero_policy && (*(_BYTE *)(a1 + 620) & 0x20) != 0 && (_WORD)v13)
  {
    v33 = *(_WORD *)(v17 + 8);
    v32 = *(_QWORD *)(v17 + 16);
    _platform_memset();
    v20 = v32;
    v19 = v33;
  }
  *(_QWORD *)v17 = a2;
  *(_WORD *)(v17 + 8) = v13;
  *(_QWORD *)(v17 + 16) = v7;
  if (!v16)
    goto LABEL_20;
  v14 = 2;
  v7 = v20;
  LOWORD(v13) = v19;
LABEL_17:
  for (i = *(_DWORD *)(v7 + 24); v10 != i; i = *(_DWORD *)(v7 + 24))
  {
    v10 = i;
    os_unfair_lock_unlock(v12);
    v12 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 624) + 2560 * v10);
    os_unfair_lock_lock_with_options();
  }
  tiny_free_no_lock(a1, (uint64_t)v12, v10, v7, v16, (unsigned __int16)v13, v14 | (a5 != 0));
  if (v22)
LABEL_20:
    os_unfair_lock_unlock(v12);
}

void _szone_free(uint64_t a1, unint64_t a2, int a3)
{
  int v5;
  const char *v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v21;

  if (a2)
  {
    if ((a2 & 0xF) != 0)
    {
      if ((a3 & 1) == 0)
      {
        v5 = *(_DWORD *)(a1 + 16392);
        v6 = "Non-aligned pointer %p being freed\n";
LABEL_35:
        malloc_zone_error(v5, 1, (uint64_t)v6);
        return;
      }
      goto LABEL_39;
    }
    v7 = *(uint64_t **)(a1 + 16536);
    v8 = *v7;
    if (*v7)
    {
      v9 = a2 & 0xFFFFFFFFFFF00000;
      v10 = v7[2];
      v11 = (0x9E3779B97F4A7C55 * (a2 >> 20)) >> -*((_BYTE *)v7 + 8);
      v12 = v11;
      do
      {
        v13 = *(_QWORD *)(v10 + 8 * v12);
        if (!v13)
          break;
        if (v13 == v9)
        {
          if (!v9)
            break;
          if ((((_DWORD)a2 + 1032064) & 0xFFF80u) > 0xFBF70uLL)
          {
            v5 = *(_DWORD *)(a1 + 16392);
            v6 = "Pointer %p to metadata being freed\n";
            goto LABEL_35;
          }
          free_tiny(a1 + 16512, a2, v9, 0, 0);
          return;
        }
        if (v12 + 1 == v8)
          v12 = 0;
        else
          ++v12;
      }
      while (v12 != v11);
    }
    if ((a2 & 0x1FF) != 0)
    {
      if ((a3 & 1) == 0)
      {
        v5 = *(_DWORD *)(a1 + 16392);
        v6 = "Non-aligned pointer %p being freed (2)\n";
        goto LABEL_35;
      }
LABEL_39:
      find_zone_and_free((void *)a2, 1u);
      return;
    }
    v14 = *(uint64_t **)(a1 + 17304);
    v15 = *v14;
    if (*v14)
    {
      v16 = a2 & 0xFFFFFFFFFF800000;
      v17 = v14[2];
      v18 = (0x9E3779B97F4A7C55 * ((a2 & 0xFFFFFFFFFF800000) >> 20)) >> -*((_BYTE *)v14 + 8);
      v19 = v18;
      do
      {
        v20 = *(_QWORD *)(v17 + 8 * v19);
        if (!v20)
          break;
        if (v20 == v16)
        {
          if (!v16)
            break;
          if ((((_DWORD)a2 + 8355328) & 0x7FFE00u) > 0x7F7C00uLL)
          {
            v5 = *(_DWORD *)(a1 + 16392);
            v6 = "Pointer %p to metadata being freed (2)\n";
            goto LABEL_35;
          }
          free_small(a1 + 17280, a2, v16, 0);
          return;
        }
        if (v19 + 1 == v15)
          v19 = 0;
        else
          ++v19;
      }
      while (v19 != v18);
    }
    if (((*MEMORY[0x1E0C88820] - 1) & a2) != 0)
    {
      if ((a3 & 1) == 0)
      {
        v5 = *(_DWORD *)(a1 + 16392);
        v6 = "non-page-aligned, non-allocated pointer %p being freed\n";
        goto LABEL_35;
      }
      goto LABEL_39;
    }
    v21 = free_large(a1, a2, a3);
    if (a3 && !v21)
      goto LABEL_39;
  }
}

void tiny_free_no_lock(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, char a7)
{
  unsigned __int16 v8;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unsigned int tiny_previous_free_msize;
  unint64_t v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  unsigned int v27;
  unint64_t v28;
  int8x8_t *v29;
  int v30;
  char v31;
  uint64_t v32;
  unsigned int v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  int64x2_t *v37;
  unint64_t v38;
  unsigned int v39;
  _WORD *v40;
  uint64_t v41;
  uint64_t *v42;
  unint64_t v43;
  os_unfair_lock_s *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  int64x2_t v48;
  int64x2_t v49;
  int64x2_t v50;
  uint64_t v51;
  unsigned int v52;
  int v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  __int128 v62;
  unint64_t v63;
  __int128 v64;
  unint64_t v65;
  unint64_t v66;
  int v67;
  int v68;
  int v69;
  unsigned int v70;
  unsigned __int16 v71;
  uint64_t v72;
  unsigned __int16 *v73;

  if (*(_DWORD *)(a4 + 16508) != unk_1ECCD9619)
    goto LABEL_102;
  v8 = a6;
  v73 = (unsigned __int16 *)(a4 + 16420);
  v11 = (16 * a6);
  v12 = a5 + v11;
  v13 = a5 & 0xFFFFFFFFFFF00000;
  v14 = a5 & 0xFFFFFFFFFFF00000 | 0x4080;
  v15 = a5 - v14;
  v16 = read_memory + 7896;
  if (((a5 - v14) & 0xFFFF0) == 0)
    goto LABEL_7;
  tiny_previous_free_msize = get_tiny_previous_free_msize(a5);
  if (tiny_previous_free_msize > (unsigned __int16)(v15 >> 4))
  {
    v18 = a5;
    v16 = read_memory + 7896;
    goto LABEL_18;
  }
  v19 = tiny_previous_free_msize;
  v20 = v13 | 0x28;
  v21 = (v15 >> 4) - tiny_previous_free_msize;
  v22 = (v21 >> 4) & 0xFFE;
  v23 = 1 << ((v15 >> 4) - tiny_previous_free_msize);
  v16 = read_memory + 7896;
  if ((*(_DWORD *)((v13 | 0x28) + 4 * v22) & v23) == 0)
  {
    v18 = a5;
    goto LABEL_18;
  }
  if ((*(_DWORD *)((v13 | 0x2C) + 4 * v22) & v23) != 0
    || ((v24 = v14 + 16 * (unsigned __int16)v21, v24 + 16 < (v24 & 0xFFFFFFFFFFF00000 | 0xFBF80) + 16512)
     && ((*(_DWORD *)(((v24 + 16) & 0xFFFFFFFFFFF00000 | ((((v24 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v24 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) == 0
      ? (v25 = *(unsigned __int16 *)(v24 + 16))
      : (v25 = 1),
        v25 != tiny_previous_free_msize))
  {
LABEL_7:
    v18 = a5;
    goto LABEL_18;
  }
  v18 = a5;
  if (v24)
  {
    *(int8x8_t *)(v20 + ((v15 >> 6) & 0x3FF8)) = vand_s8(*(int8x8_t *)(v20 + ((v15 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(~(1 << (v15 >> 4))));
    tiny_free_list_remove_ptr(a1, a2, v24, tiny_previous_free_msize);
    v16 = &read_memory[987];
    if (v19 >= 2 && !malloc_zero_policy)
      *(_WORD *)(v24 + 16 * v19 - 2) = 0;
    v8 += v19;
    v18 = v24;
  }
LABEL_18:
  if (v12 >= a4 + 0x100000
    || (v26 = v12 & 0xFFFFFFFFFFF00000 | 0x4080,
        v27 = v12 - v26,
        v28 = ((v12 - v26) >> 8) & 0xFFE,
        v29 = (int8x8_t *)((v12 & 0xFFFFFFFFFFF00000 | (8 * ((v28 >> 1) & 0x7FF))) + 40),
        v30 = 1 << ((v12 - v26) >> 4),
        (*(_DWORD *)((v12 & 0xFFFFFFFFFFF00000 | (8 * ((v28 >> 1) & 0x7FF))) + 0x28) & v30) == 0)
    || (*(_DWORD *)((v12 & 0xFFFFFFFFFFF00000) + 4 * v28 + 0x2C) & v30) != 0)
  {
    v31 = a7;
    goto LABEL_22;
  }
  if (v12 + 16 >= v26 + 1032064
    || ((*(_DWORD *)(((v12 + 16) & 0xFFFFFFFFFFF00000 | ((((v12 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v12 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
  {
    LODWORD(v38) = 1;
    goto LABEL_51;
  }
  v38 = *(unsigned __int16 *)(v12 + 16);
  if (v38 < 0x40)
  {
LABEL_51:
    tiny_free_list_remove_ptr(a1, a2, v12, v38);
    v39 = v38;
    *v29 = vand_s8(*v29, (int8x8_t)vdup_n_s32(~v30));
    v16 = &read_memory[987];
    v31 = a7;
    if (!malloc_zero_policy)
    {
      *(_QWORD *)v12 = 0;
      *(_QWORD *)(v12 + 8) = 0;
      if (v39 >= 2)
      {
        *(_WORD *)(v12 + 16) = 0;
        v40 = (_WORD *)(v12 + 16 * (v39 & 0xFFF) - 2);
LABEL_83:
        *v40 = 0;
        goto LABEL_84;
      }
      if (!v39)
      {
        v40 = (_WORD *)(v12 + 16);
        goto LABEL_83;
      }
    }
LABEL_84:
    v8 += v39;
LABEL_22:
    v32 = a1;
    if (*((_DWORD *)v16 + 119) && (v31 & 2) == 0 && (*(_DWORD *)(a1 + 620) & 0x20) != 0)
      _platform_memset();
    tiny_free_list_add_ptr(a1, a2, v18, v8);
    goto LABEL_27;
  }
  v54 = __ROR8__(*(_QWORD *)(v12 + 8), 60);
  v55 = (_QWORD *)(v54 & 0xFFFFFFFFFFFFFFF0);
  v56 = *(_QWORD *)(a1 + 632);
  v57 = v54 & 0xFFFFFFFFFFFFFFF0 ^ v56;
  if (((v54 ^ (HIDWORD(v57)
                            + (_DWORD)v57
                            + ((HIDWORD(v57) + v57) >> 16)
                            + ((HIDWORD(v57) + (_DWORD)v57 + ((HIDWORD(v57) + v57) >> 16)) >> 8))) & 0xFLL) != 0)
  {
    v72 = a1;
LABEL_101:
    free_list_checksum_botch(v72);
    __break(1u);
LABEL_102:
    malloc_zone_error(64, 1, (uint64_t)"Region cookie corrupted for region %p (value is %x)[%p]\n");
    __break(1u);
    return;
  }
  v58 = __ROR8__(*(_QWORD *)v12, 60);
  v59 = v58 & 0xFFFFFFFFFFFFFFF0;
  v60 = v58 & 0xFFFFFFFFFFFFFFF0 ^ v56;
  if (((v58 ^ (HIDWORD(v60)
                            + (_DWORD)v60
                            + ((HIDWORD(v60) + v60) >> 16)
                            + ((HIDWORD(v60) + (_DWORD)v60 + ((HIDWORD(v60) + v60) >> 16)) >> 8))) & 0xFLL) != 0)
  {
    v72 = a1;
    goto LABEL_101;
  }
  if (v59)
  {
    v61 = v56 ^ v18;
    *((_QWORD *)&v62 + 1) = HIDWORD(v61)
                          + (_DWORD)v61
                          + ((HIDWORD(v61) + v61) >> 16)
                          + ((HIDWORD(v61) + (_DWORD)v61 + ((HIDWORD(v61) + v61) >> 16)) >> 8);
    *(_QWORD *)&v62 = v18;
    *(_QWORD *)(v59 + 8) = v62 >> 4;
  }
  else
  {
    *(_QWORD *)(a2 + 536) = v18;
  }
  if (v55)
  {
    v63 = *(_QWORD *)(a1 + 632) ^ v18;
    *((_QWORD *)&v64 + 1) = HIDWORD(v63)
                          + (_DWORD)v63
                          + ((HIDWORD(v63) + v63) >> 16)
                          + ((HIDWORD(v63) + (_DWORD)v63 + ((HIDWORD(v63) + v63) >> 16)) >> 8);
    *(_QWORD *)&v64 = v18;
    *v55 = v64 >> 4;
  }
  v8 += v38;
  *(_QWORD *)v18 = *(_QWORD *)v12;
  *(_QWORD *)(v18 + 8) = *(_QWORD *)(v12 + 8);
  *v29 = vand_s8(*v29, (int8x8_t)vdup_n_s32(~v30));
  if (!*((_DWORD *)v16 + 119))
  {
    *(_WORD *)(v12 + 16) = 0;
    *(_QWORD *)v12 = 0;
    *(_QWORD *)(v12 + 8) = 0;
    *(_WORD *)(v12 + 16 * v38 - 2) = 0;
  }
  v65 = (v18 & 0xFFFFF) - 16512;
  v66 = v18 & 0xFFFFFFFFFFF00000 | (v65 >> 6) & 0x3FF8;
  v67 = 1 << (v65 >> 4);
  v68 = *(_DWORD *)(v66 + 0x28) | v67;
  v69 = *(_DWORD *)(v66 + 0x2C) & ~v67;
  *(_DWORD *)(v66 + 40) = v68;
  *(_DWORD *)(v66 + 44) = v69;
  v31 = a7;
  if (v8 >= 2u)
  {
    *(_WORD *)(v18 + 16 * v8 - 2) = v8;
    v32 = a1;
LABEL_94:
    *(_WORD *)(v18 + 16) = v8;
    goto LABEL_95;
  }
  v32 = a1;
  if (!v8)
    goto LABEL_94;
LABEL_95:
  v70 = v27 >> 4;
  v71 = (v65 >> 4) + 1;
  if (*v73 == (unsigned __int16)(v70 + 1))
    *v73 = v71;
  if (v73[1] == (unsigned __int16)(v70 + 1))
    v73[1] = v71;
LABEL_27:
  *(_QWORD *)(a2 + 2152) -= v11;
  v33 = *(_DWORD *)(a4 + 16) - v11;
  *(_DWORD *)(a4 + 16) = v33;
  if ((v31 & 1) == 0)
  {
    --*(_DWORD *)(a4 + 20);
    --*(_DWORD *)(a2 + 2168);
  }
  if (aggressive_madvise_enabled)
  {
    tiny_madvise_free_range_no_lock(v32, (os_unfair_lock_s *)a2, a4, a5, v11, v18, v8);
    v33 = *(_DWORD *)(a4 + 16);
  }
  if (a3 == -1)
  {
    if (aggressive_madvise_enabled)
    {
      if (v33)
        return;
    }
    else
    {
      tiny_madvise_free_range_no_lock(v32, (os_unfair_lock_s *)a2, a4, a5, v11, v18, v8);
      if (v33)
        return;
    }
    if (*(int *)(a4 + 28) <= 0)
    {
      v43 = tiny_free_try_depot_unmap_no_lock(v32, a2, a4);
      v44 = (os_unfair_lock_s *)a2;
LABEL_70:
      os_unfair_lock_unlock(v44);
      if (v43)
      {
        v52 = *(_DWORD *)(v32 + 620);
        if ((v52 & 4) != 0)
          v53 = -2;
        else
          v53 = -4;
        mvm_deallocate_pages(v43, 0x100000, v53 & v52);
      }
    }
  }
  else
  {
    if (v33 <= 0xBCF9F)
      *(_BYTE *)(a4 + 32) = 1;
    v34 = *(_QWORD *)(a2 + 2160);
    v35 = *(_QWORD *)(a2 + 2152);
    if (v34 - v35 >= 0x179F41 && v35 < v34 - (v34 >> 2))
    {
      v36 = *(_QWORD *)(a2 + 2184);
      if (v36)
      {
        v37 = (int64x2_t *)(a2 + 2152);
        while (!*(_BYTE *)(v36 + 32) || *(_DWORD *)(v36 + 28))
        {
          v36 = *(_QWORD *)v36;
          if (!v36)
            return;
        }
        if (*(_QWORD *)(a2 + 2144) == (v36 & 0xFFFFFFFFFFF00000)
          && (*(_QWORD *)(a2 + 2128) || *(_QWORD *)(a2 + 2136)))
        {
          tiny_finalize_region(v32, a2);
        }
        v41 = *(_QWORD *)v36;
        v42 = *(uint64_t **)(v36 + 8);
        if (*(_QWORD *)v36)
        {
          *(_QWORD *)(v41 + 8) = v42;
          v42 = *(uint64_t **)(v36 + 8);
        }
        else
        {
          *(_QWORD *)(a2 + 2176) = v42;
        }
        if (!v42)
          v42 = (uint64_t *)(a2 + 2184);
        *v42 = v41;
        *(_QWORD *)v36 = 0;
        *(_QWORD *)(v36 + 8) = 0;
        --*(_DWORD *)(a2 + 2172);
        v45 = tiny_free_detach_region(v32, a2, v36 & 0xFFFFFFFFFFF00000);
        v46 = *(_QWORD *)(v32 + 624);
        os_unfair_lock_lock_with_options();
        *(_DWORD *)((v36 & 0xFFFFFFFFFFF00000) + 0x18) = -1;
        *(_DWORD *)(v36 + 28) = 0;
        v47 = tiny_free_reattach_region(v32, v46 - 2560, v36 & 0xFFFFFFFFFFF00000);
        v48 = vdupq_n_s64(0xFFFFFFFFFFF04080);
        v49 = vaddq_s64(*v37, v48);
        v48.i64[0] = v47;
        v48.i64[0] = vsubq_s64(*v37, v48).u64[0];
        v48.i64[1] = v49.i64[1];
        *v37 = v48;
        *(_DWORD *)(a2 + 2168) -= v45;
        os_unfair_lock_unlock((os_unfair_lock_t)a2);
        v50 = vdupq_n_s64(0xFBF80uLL);
        v50.i64[0] = v47;
        *(int64x2_t *)(v46 - 408) = vaddq_s64(*(int64x2_t *)(v46 - 408), v50);
        *(_DWORD *)(v46 - 392) += v45;
        v51 = *(_QWORD *)(v46 - 376);
        if (v51)
          *(_QWORD *)(v51 + 8) = v36;
        else
          *(_QWORD *)(v46 - 384) = v36;
        *(_QWORD *)v36 = v51;
        *(_QWORD *)(v46 - 376) = v36;
        *(_QWORD *)(v36 + 8) = 0;
        *(_BYTE *)(v36 + 32) = 0;
        ++*(_DWORD *)(v46 - 388);
        if (!aggressive_madvise_enabled)
          tiny_free_scan_madvise_free(v32, (os_unfair_lock_s *)(v46 - 2560), v36 & 0xFFFFFFFFFFF00000);
        v43 = tiny_free_try_depot_unmap_no_lock(v32, v46 - 2560, v36);
        v44 = (os_unfair_lock_s *)(v46 - 2560);
        goto LABEL_70;
      }
    }
  }
}

void tiny_free_list_add_ptr(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  unint64_t *v14;
  uint64_t v15;
  _WORD *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  __int128 v22;
  unint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  BOOL v28;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  __int128 v34;
  unint64_t v35;
  __int128 v36;
  unint64_t v37;
  __int128 v38;
  unint64_t v39;
  unint64_t v40;
  __int128 v41;
  __int16 v42;
  unsigned int v43;
  __int128 v44;
  unint64_t v45;

  if (a4 - 64 >= 0xFFFFFFC1)
    v4 = a4 - 1;
  else
    v4 = 63;
  v5 = a2 + 8 * v4;
  v6 = a3 & 0xFFFFFFFFFFF00000;
  v7 = a3 & 0xFFFFFFFFFFF00000 | 0x4080;
  v8 = a3 - v7;
  v9 = a3 & 0xFFFFFFFFFFF00000 | ((a3 - v7) >> 6) & 0x3FF8;
  v10 = 1 << ((a3 - v7) >> 4);
  v11 = *(_DWORD *)(v9 + 0x28) | v10;
  v12 = *(_DWORD *)(v9 + 0x2C) & ~v10;
  v15 = *(_QWORD *)(v5 + 32);
  v14 = (unint64_t *)(v5 + 32);
  v13 = v15;
  *(_DWORD *)(v9 + 40) = v11;
  *(_DWORD *)(v9 + 44) = v12;
  if (a4 < 2)
  {
    if (a4)
      goto LABEL_8;
  }
  else
  {
    *(_WORD *)(a3 + 16 * a4 - 2) = a4;
  }
  *(_WORD *)(a3 + 16) = a4;
LABEL_8:
  if (!v13)
    *(_DWORD *)(a2 + 4 * (v4 >> 5) + 2088) |= 1 << v4;
  v16 = (_WORD *)(v6 + 4 * v4 + 16168);
  if (!*v16)
  {
    v23 = *v14;
    if (*(_DWORD *)((a3 & 0xFFFFFFFFFFF00000) + 0x18) == -1)
      goto LABEL_33;
    if (!v23)
      goto LABEL_33;
    v24 = *(_QWORD *)(a2 + 2176);
    if (!v24 || v24 == v6)
      goto LABEL_33;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    do
    {
      if (*(_WORD *)((v24 & 0xFFFFFFFFFFF00000) + 4 * v4 + 0x3F2A))
      {
        v27 = *(unsigned __int16 *)((v24 & 0xFFFFFFFFFFF00000) + 4 * v4 + 0x3F2A);
        v26 = v24;
      }
      v24 = *(_QWORD *)(v24 + 8);
      if (v24)
        v28 = v24 == v6;
      else
        v28 = 1;
    }
    while (!v28 && v25++ < 4);
    if (v27 && (v30 = (v26 & 0xFFFFFFFFFFF00000) + 16512 + (16 * v27 - 16)) != 0)
    {
      v31 = __ROR8__(*(_QWORD *)(v30 + 8), 60);
      v23 = v31 & 0xFFFFFFFFFFFFFFF0;
      v32 = *(_QWORD *)(a1 + 632);
      v33 = v31 & 0xFFFFFFFFFFFFFFF0 ^ v32;
      if (((v31 ^ (HIDWORD(v33)
                                + (_DWORD)v33
                                + ((HIDWORD(v33) + v33) >> 16)
                                + ((HIDWORD(v33) + (_DWORD)v33 + ((HIDWORD(v33) + v33) >> 16)) >> 8))) & 0xFLL) != 0)
        goto LABEL_40;
      *((_QWORD *)&v34 + 1) = (((v32 ^ a3) >> 32)
                                           + (v32 ^ a3)
                                           + ((((v32 ^ a3) >> 32) + (v32 ^ a3)) >> 16)
                                           + ((((v32 ^ a3) >> 32)
                                                           + (v32 ^ a3)
                                                           + ((((v32 ^ a3) >> 32) + (v32 ^ a3)) >> 16)) >> 8));
      *(_QWORD *)&v34 = a3;
      *(_QWORD *)(v30 + 8) = v34 >> 4;
    }
    else
    {
LABEL_33:
      v30 = 0;
      *v14 = a3;
    }
    v35 = *(_QWORD *)(a1 + 632) ^ v30;
    *((_QWORD *)&v36 + 1) = HIDWORD(v35)
                          + (_DWORD)v35
                          + ((HIDWORD(v35) + v35) >> 16)
                          + ((HIDWORD(v35) + (_DWORD)v35 + ((HIDWORD(v35) + v35) >> 16)) >> 8);
    *(_QWORD *)&v36 = v30;
    *(_QWORD *)a3 = v36 >> 4;
    if (v23)
    {
      v37 = *(_QWORD *)(a1 + 632) ^ a3;
      *((_QWORD *)&v38 + 1) = HIDWORD(v37)
                            + (_DWORD)v37
                            + ((HIDWORD(v37) + v37) >> 16)
                            + ((HIDWORD(v37) + (_DWORD)v37 + ((HIDWORD(v37) + v37) >> 16)) >> 8);
      *(_QWORD *)&v38 = a3;
      *(_QWORD *)v23 = v38 >> 4;
    }
    v39 = v8 >> 4;
    v40 = *(_QWORD *)(a1 + 632) ^ v23;
    *((_QWORD *)&v41 + 1) = HIDWORD(v40)
                          + (_DWORD)v40
                          + ((HIDWORD(v40) + v40) >> 16)
                          + ((HIDWORD(v40) + (_DWORD)v40 + ((HIDWORD(v40) + v40) >> 16)) >> 8);
    *(_QWORD *)&v41 = v23;
    *(_QWORD *)(a3 + 8) = v41 >> 4;
    v42 = v39 + 1;
    *(_WORD *)((a3 & 0xFFFFFFFFFFF00000) + 4 * v4 + 0x3F2A) = v42;
    goto LABEL_39;
  }
  v17 = 16 * (unsigned __int16)*v16 - 16 + v7;
  v18 = __ROR8__(*(_QWORD *)v17, 60);
  v19 = v18 & 0xFFFFFFFFFFFFFFF0;
  v20 = *(_QWORD *)(a1 + 632);
  v21 = v18 & 0xFFFFFFFFFFFFFFF0 ^ v20;
  if (((v18 ^ (HIDWORD(v21)
                            + (_DWORD)v21
                            + ((HIDWORD(v21) + v21) >> 16)
                            + ((HIDWORD(v21) + (_DWORD)v21 + ((HIDWORD(v21) + v21) >> 16)) >> 8))) & 0xFLL) == 0)
  {
    if (v19)
    {
      *((_QWORD *)&v22 + 1) = (((v20 ^ a3) >> 32)
                                           + (v20 ^ a3)
                                           + ((((v20 ^ a3) >> 32) + (v20 ^ a3)) >> 16)
                                           + ((((v20 ^ a3) >> 32)
                                                           + (v20 ^ a3)
                                                           + ((((v20 ^ a3) >> 32) + (v20 ^ a3)) >> 16)) >> 8));
      *(_QWORD *)&v22 = a3;
      *(_QWORD *)(v19 + 8) = v22 >> 4;
    }
    else
    {
      *v14 = a3;
    }
    *(_QWORD *)a3 = *(_QWORD *)v17;
    v43 = ((*(_QWORD *)(a1 + 632) ^ v17) >> 32) + (*(_DWORD *)(a1 + 632) ^ v17);
    *((_QWORD *)&v44 + 1) = v43 + HIWORD(v43) + ((v43 + HIWORD(v43)) >> 8);
    *(_QWORD *)&v44 = v17;
    *(_QWORD *)(a3 + 8) = v44 >> 4;
    v45 = *(_QWORD *)(a1 + 632) ^ a3;
    *((_QWORD *)&v44 + 1) = HIDWORD(v45)
                          + (_DWORD)v45
                          + ((HIDWORD(v45) + v45) >> 16)
                          + ((HIDWORD(v45) + (_DWORD)v45 + ((HIDWORD(v45) + v45) >> 16)) >> 8);
    *(_QWORD *)&v44 = a3;
    *(_QWORD *)v17 = v44 >> 4;
    v42 = (v8 >> 4) + 1;
LABEL_39:
    *v16 = v42;
    return;
  }
LABEL_40:
  free_list_checksum_botch(a1);
  __break(1u);
}

uint64_t get_tiny_previous_free_msize(uint64_t a1)
{
  if ((a1 & 0xFFFFFFFFFFF00000 | 0x4080) == a1)
  {
    return 0;
  }
  else if (((*(_DWORD *)(((a1 - 16) & 0xFFFFFFFFFFF00000 | ((((a1 - 16) & 0xFFFFFuLL) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)a1 - 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return *(unsigned __int16 *)(a1 - 2);
  }
}

void tiny_madvise_free_range_no_lock(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, unsigned int a7)
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v19;
  unint64_t v20;
  int v21;

  v7 = *MEMORY[0x1E0C887F8];
  v8 = (*MEMORY[0x1E0C887F8] + a6 + 18) & ~*MEMORY[0x1E0C887F8];
  v9 = (a6 + 16 * a7 - 2) & ~*MEMORY[0x1E0C887F8];
  if (v8 < v9)
  {
    v10 = (a4 - 2) & ~v7;
    v11 = (a5 + a4 + v7 + 18) & ~v7;
    v12 = v8 <= v10 ? v10 : (*MEMORY[0x1E0C887F8] + a6 + 18) & ~*MEMORY[0x1E0C887F8];
    v13 = v9 >= v11 ? v11 : (a6 + 16 * a7 - 2) & ~*MEMORY[0x1E0C887F8];
    if (v12 < v13)
    {
      tiny_free_list_remove_ptr(a1, (uint64_t)a2, a6, a7);
      set_tiny_meta_header_in_use(a6, a7);
      OSAtomicIncrement32Barrier((int32_t *)(a3 + 28));
      os_unfair_lock_unlock(a2);
      mvm_madvise_free(a1, a3, v12, v13, a1 + 640, *(_DWORD *)(a1 + 620) & 0x20);
      os_unfair_lock_lock_with_options();
      OSAtomicDecrement32Barrier((int32_t *)(a3 + 28));
      v19 = (a6 & 0xFFFFF) - 16512;
      v20 = a6 & 0xFFFFFFFFFFF00000 | (v19 >> 6) & 0x3FF8;
      LODWORD(v19) = 1 << (v19 >> 4);
      v21 = *(_DWORD *)(v20 + 40) | v19;
      LODWORD(v19) = *(_DWORD *)(v20 + 44) & ~(_DWORD)v19;
      *(_DWORD *)(v20 + 40) = v21;
      *(_DWORD *)(v20 + 44) = v19;
      if (a7 < 2)
      {
        if (a7)
        {
LABEL_14:
          tiny_free_list_add_ptr(a1, (uint64_t)a2, a6, a7);
          return;
        }
      }
      else
      {
        *(_WORD *)(a6 + 16 * a7 - 2) = a7;
      }
      *(_WORD *)(a6 + 16) = a7;
      goto LABEL_14;
    }
  }
}

void tiny_free_list_remove_ptr(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  int v22;
  _WORD *v23;
  int v24;
  int v25;
  const char *v26;

  v5 = *(_QWORD *)(a3 + 8);
  if ((a4 - 64) >= 0xFFFFFFC1)
    v6 = a4 - 1;
  else
    v6 = 63;
  v7 = __ROR8__(v5, 60);
  v8 = (_QWORD *)(v7 & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 632);
  v10 = v7 & 0xFFFFFFFFFFFFFFF0 ^ v9;
  if (((v7 ^ (HIDWORD(v10)
                           + (_DWORD)v10
                           + ((HIDWORD(v10) + v10) >> 16)
                           + ((HIDWORD(v10) + (_DWORD)v10 + ((HIDWORD(v10) + v10) >> 16)) >> 8))) & 0xFLL) != 0)
    goto LABEL_28;
  v11 = __ROR8__(*(_QWORD *)a3, 60);
  v12 = v11 & 0xFFFFFFFFFFFFFFF0;
  v13 = v11 & 0xFFFFFFFFFFFFFFF0 ^ v9;
  if (((v11 ^ (HIDWORD(v13)
                            + (_DWORD)v13
                            + ((HIDWORD(v13) + v13) >> 16)
                            + ((HIDWORD(v13) + (_DWORD)v13 + ((HIDWORD(v13) + v13) >> 16)) >> 8))) & 0xFLL) != 0)
    goto LABEL_28;
  if (!v12)
  {
    *(_QWORD *)(a2 + 8 * v6 + 32) = v8;
    if (!v8)
    {
      v16 = 1;
      *(_DWORD *)(a2 + 4 * (v6 >> 5) + 2088) &= ~(1 << v6);
      goto LABEL_15;
    }
LABEL_12:
    v17 = __ROR8__(*v8, 60);
    v18 = v17 & 0xFFFFFFFFFFFFFFF0;
    v19 = v17 & 0xFFFFFFFFFFFFFFF0 ^ *(_QWORD *)(a1 + 632);
    if (((v17 ^ (HIDWORD(v19)
                              + (_DWORD)v19
                              + ((HIDWORD(v19) + v19) >> 16)
                              + ((HIDWORD(v19) + (_DWORD)v19 + ((HIDWORD(v19) + v19) >> 16)) >> 8))) & 0xFLL) == 0)
    {
      if (v18 == a3)
      {
        v16 = 0;
        *v8 = *(_QWORD *)a3;
        goto LABEL_15;
      }
      v25 = *(_DWORD *)(a1 + 620);
      v26 = "tiny_free_list_remove_ptr: Internal invariant broken (prev ptr of next): ptr=%p, next_prev=%p\n";
LABEL_31:
      malloc_zone_error(v25, 1, (uint64_t)v26);
      __break(1u);
      return;
    }
    goto LABEL_28;
  }
  v14 = __ROR8__(*(_QWORD *)((v11 & 0xFFFFFFFFFFFFFFF0) + 8), 60);
  v15 = v14 & 0xFFFFFFFFFFFFFFF0 ^ v9;
  if (((v14 ^ (HIDWORD(v15)
                            + (_DWORD)v15
                            + ((HIDWORD(v15) + v15) >> 16)
                            + ((HIDWORD(v15) + (_DWORD)v15 + ((HIDWORD(v15) + v15) >> 16)) >> 8))) & 0xFLL) != 0)
  {
LABEL_28:
    free_list_checksum_botch(a1);
    __break(1u);
    goto LABEL_29;
  }
  if ((v14 & 0xFFFFFFFFFFFFFFF0) != a3)
  {
LABEL_29:
    v25 = *(_DWORD *)(a1 + 620);
    v26 = "tiny_free_list_remove_ptr: Internal invariant broken (next ptr of prev): ptr=%p, prev_next=%p\n";
    goto LABEL_31;
  }
  *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFFF0) + 8) = v5;
  if (v8)
    goto LABEL_12;
  v16 = 1;
LABEL_15:
  v20 = (a3 & 0xFFFFFFFFFFF00000) + 4 * v6 + 16168;
  v21 = *(unsigned __int16 *)((a3 & 0xFFFFFFFFFFF00000) + 4 * v6 + 0x3F28);
  v22 = (unsigned __int16)((a3 + 1032064) >> 4) + 1;
  v23 = (_WORD *)(v20 | 2);
  v24 = *(unsigned __int16 *)(v20 + 2);
  if (v22 == v21 && v22 == v24)
  {
    *v23 = 0;
    *(_WORD *)v20 = 0;
  }
  else if (v22 == v21)
  {
    if (v16)
      nanov2_realloc_VARIANT_mp_cold_1(a1);
    *(_WORD *)v20 = ((v7 - 16512) >> 4) + 1;
  }
  else if (v22 == v24)
  {
    if (!v12)
      nanov2_realloc_VARIANT_mp_cold_1(a1);
    *v23 = ((v11 - 16512) >> 4) + 1;
  }
}

uint64_t szone_good_size(uint64_t a1, unint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  unint64_t v5;

  if (a2 > 0x3F0)
  {
    if (a2 > 0x3C00)
    {
      v4 = *MEMORY[0x1E0C887F8];
      if (*MEMORY[0x1E0C887F8] <= *MEMORY[0x1E0C88810])
        v4 = *MEMORY[0x1E0C88810];
      v5 = (v4 + a2) & ~v4;
      if (v5 < a2)
        return -1;
      else
        return v5;
    }
    else
    {
      return ((_DWORD)a2 + 511) & 0x1FFFE00;
    }
  }
  else
  {
    if ((((a2 + 15) >> 4) & 0xFFFE) != 0)
      v2 = (unsigned __int16)((a2 + 15) >> 4);
    else
      v2 = 1;
    return 16 * v2;
  }
}

void _nanov2_free(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;
  void (*v13)(void);
  int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  char v23;
  int v24;
  unsigned __int16 *v25;
  unsigned __int16 v26;

  if (!a2 || (a2 & 0xFFFFFFFFE000000FLL) != 0x300000000)
    goto LABEL_21;
  if (*(_QWORD *)(a1 + 28720) > a2 || *(_QWORD *)(a1 + 28728) < a2)
    goto LABEL_21;
  v6 = ptr_offset_to_size_class[((a2 >> 14) & 0xFFF ^ *(_DWORD *)(a1 + 28680)) >> 6];
  v7 = (unsigned int *)((*(_QWORD *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000)
                      + 4 * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F));
  v8 = *v7 & 0x7FF;
  if (v8 > 0x7FD)
  {
    if (v8 - 2046 < 2)
      goto LABEL_21;
    goto LABEL_14;
  }
  if (!v8 || v8 == 2042)
    goto LABEL_21;
  if (v8 != 2044)
  {
LABEL_14:
    if (((*v7 >> 11) & 0x3FF) != slots_by_size_class[v6] - 1)
      goto LABEL_15;
LABEL_21:
    v12 = *(_QWORD *)(a1 + 28704);
    if (a3)
      v13 = *(void (**)(void))(v12 + 144);
    else
      v13 = *(void (**)(void))(v12 + 48);
    v13();
    return;
  }
LABEL_15:
  v9 = 16 * (int)v6 + 16;
  if ((a2 & 0x3FFF) != (a2 & 0x3FFF) / v9 * v9)
    goto LABEL_21;
  v10 = *(_QWORD *)(a1 + 28696);
  if (16 * (_DWORD)v6 == -16 || (v10 ^ *(_QWORD *)a2) == a2)
    goto LABEL_21;
  if (v9 >= 0x11 && malloc_zero_policy == 0)
  {
    bzero((void *)(a2 + 16), v9 - 16);
    v10 = *(_QWORD *)(a1 + 28696);
  }
  v15 = *v7;
  v16 = slots_by_size_class[v6];
  *(_QWORD *)a2 = v10 ^ a2;
  while (1)
  {
    v17 = v15 & 0x7FF;
    v18 = (v15 + 2048) & 0x1FF800;
    v19 = (v15 + 0x200000) & 0x7FE00000 | v15 & 0x80000000;
    if (v17 != 2044)
      break;
    v17 = 2043;
LABEL_42:
    v21 = v18 | v19 | ((unsigned __int16)((unsigned __int16)(a2 & 0x3FFF) / (int)v9) + 1) & 0x7FF;
    *(_QWORD *)(a2 + 8) = v17;
    while (1)
    {
      v22 = __ldxr(v7);
      if (v22 != v15)
        break;
      if (!__stlxr(v21, v7))
      {
        v24 = 1;
        goto LABEL_47;
      }
    }
    v24 = 0;
    __clrex();
LABEL_47:
    if (v24)
      goto LABEL_55;
LABEL_51:
    v15 = v22;
  }
  if (v16 - 1 != v18 >> 11)
    goto LABEL_42;
  *(_QWORD *)(a2 + 8) = 0;
  if (v15 < 0)
    v20 = 2043;
  else
    v20 = 2045;
  v21 = v20 | v18 | v19;
  while (1)
  {
    v22 = __ldxr(v7);
    if (v22 != v15)
      break;
    if (!__stlxr(v21, v7))
    {
      v23 = 1;
      goto LABEL_50;
    }
  }
  v23 = 0;
  __clrex();
LABEL_50:
  if ((v23 & 1) == 0)
    goto LABEL_51;
  if ((v15 & 0x80000000) == 0 && !nanov2_madvise_policy)
  {
    nanov2_madvise_block_VARIANT_mp((const os_unfair_lock *)a1, v7, v6, 2045);
    return;
  }
LABEL_55:
  if ((v21 & 0x80000000) == 0)
  {
    v25 = (unsigned __int16 *)(a1 + 28672);
    if (((1 << v6) & *(unsigned __int16 *)(a1 + 28672)) != 0 && (double)v16 * 0.75 <= (double)((v21 >> 11) & 0x3FF))
    {
      do
        v26 = __ldxr(v25);
      while (__stxr(v26 & ~(unsigned __int16)(1 << v6), v25));
    }
  }
}

void _nanov2_free_0(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v6;
  atomic_uint *v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;
  void (*v13)(void);
  uint64_t v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;

  if (!a2 || (a2 & 0xFFFFFFFFE000000FLL) != 0x300000000)
    goto LABEL_21;
  if (*(_QWORD *)(a1 + 28720) > a2 || *(_QWORD *)(a1 + 28728) < a2)
    goto LABEL_21;
  v6 = ptr_offset_to_size_class[((a2 >> 14) & 0xFFF ^ *(_DWORD *)(a1 + 28680)) >> 6];
  v7 = (atomic_uint *)((*(_QWORD *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000)
                     + 4 * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F));
  v8 = *v7 & 0x7FF;
  if (v8 > 0x7FD)
  {
    if (v8 - 2046 < 2)
      goto LABEL_21;
    goto LABEL_14;
  }
  if (!v8 || v8 == 2042)
    goto LABEL_21;
  if (v8 != 2044)
  {
LABEL_14:
    if (((*v7 >> 11) & 0x3FF) != slots_by_size_class[v6] - 1)
      goto LABEL_15;
LABEL_21:
    v12 = *(_QWORD *)(a1 + 28704);
    if (a3)
      v13 = *(void (**)(void))(v12 + 144);
    else
      v13 = *(void (**)(void))(v12 + 48);
    v13();
    return;
  }
LABEL_15:
  v9 = 16 * (int)v6 + 16;
  if ((a2 & 0x3FFF) != (a2 & 0x3FFF) / v9 * v9)
    goto LABEL_21;
  v10 = *(_QWORD *)(a1 + 28696);
  if (16 * (_DWORD)v6 == -16 || (v10 ^ *(_QWORD *)a2) == a2)
    goto LABEL_21;
  if (v9 >= 0x11 && malloc_zero_policy == 0)
  {
    bzero((void *)(a2 + 16), v9 - 16);
    v10 = *(_QWORD *)(a1 + 28696);
  }
  v15 = *v7;
  v16 = slots_by_size_class[v6];
  *(_QWORD *)a2 = v10 ^ a2;
  while (1)
  {
    v17 = v15 & 0x7FF;
    v18 = (v15 + 2048) & 0x1FF800;
    v19 = (v15 + 0x200000) & 0x7FE00000 | v15 & 0x80000000;
    if (v17 == 2044)
    {
      v17 = 2043;
      goto LABEL_40;
    }
    if (v16 - 1 == v18 >> 11)
      break;
LABEL_40:
    v21 = v18 | v19 | ((unsigned __int16)((unsigned __int16)(a2 & 0x3FFF) / (int)v9) + 1) & 0x7FF;
    *(_QWORD *)(a2 + 8) = v17;
    v22 = v15;
    atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v22, v21, memory_order_release, memory_order_relaxed);
    if ((_DWORD)v22 == (_DWORD)v15)
      goto LABEL_45;
LABEL_41:
    v15 = v22;
  }
  *(_QWORD *)(a2 + 8) = 0;
  if ((int)v15 < 0)
    v20 = 2043;
  else
    v20 = 2045;
  v21 = v20 | v18 | v19;
  v22 = v15;
  atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v22, v21, memory_order_release, memory_order_relaxed);
  if ((_DWORD)v22 != (_DWORD)v15)
    goto LABEL_41;
  if ((v15 & 0x80000000) == 0 && !nanov2_madvise_policy)
  {
    nanov2_madvise_block_VARIANT_armv81((const os_unfair_lock *)a1, v7, v6, 2045);
    return;
  }
LABEL_45:
  if ((v21 & 0x80000000) == 0
    && ((1 << v6) & *(unsigned __int16 *)(a1 + 28672)) != 0
    && (double)v16 * 0.75 <= (double)((v21 >> 11) & 0x3FF))
  {
    atomic_fetch_and_explicit((atomic_ushort *volatile)(a1 + 28672), ~(unsigned __int16)(1 << v6), memory_order_relaxed);
  }
}

unint64_t szone_malloc(uint64_t a1, unint64_t a2)
{
  return szone_malloc_should_clear(a1, a2, 0);
}

void xzm_realloc(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v6;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  unint64_t v15;
  unsigned int v16;
  unint64_t v17;
  void *v18;
  void *v19;
  size_t v20;
  unint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v25;
  int is_free_slow;
  unint64_t v27;
  unsigned int v28;
  int v29;
  unint64_t v31;
  unint64_t v32;

  v6 = a1;
  if (!a2)
  {
    v21 = a3;
LABEL_25:
    xzm_malloc(a1, v21, a4, 0);
    return;
  }
  if (!a3)
  {
    _xzm_free(a1, a2, 0);
    a1 = v6;
    v21 = 0;
    goto LABEL_25;
  }
  v8 = a2 >> 22;
  if (a2 >> 36)
    v8 = 0x4000;
  if (v8 >> 14)
    goto LABEL_14;
  v9 = *(_QWORD *)(a1 + 232);
  if (!v9)
    v9 = a1;
  v10 = *(_QWORD *)(v9 + 408);
  if (!v10)
    goto LABEL_14;
  v11 = *(unsigned int *)(v10 + 4 * v8);
  if (!(_DWORD)v11)
    goto LABEL_14;
  v12 = v11 << 14;
  v13 = a2 - *(_QWORD *)(v12 + 48);
  if (*(_DWORD *)(v12 + 16) <= (v13 >> 14))
    goto LABEL_14;
  v14 = v13 >> 14;
  v15 = v12 + 48 * v14 + 2104;
  if ((*(_BYTE *)(v12 + 48 * v14 + 2136) & 0xF) == 4)
  {
    v27 = v15 - *(unsigned int *)(v12 + 48 * v14 + 2140);
    v28 = *(_BYTE *)(v27 + 32) & 0xF;
    if (v28 <= 8)
    {
      v29 = 1 << v28;
      if ((v29 & 0x1E8) != 0)
      {
        if (v27 + 48 * *(unsigned int *)(v27 + 40) <= v15)
          goto LABEL_12;
        goto LABEL_64;
      }
      if ((v29 & 6) != 0 && v15 == v27)
LABEL_64:
        v15 = v27;
    }
  }
LABEL_12:
  v16 = *(_BYTE *)(v15 + 32) & 0xF;
  if (v16 > 7)
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v16);
  if (((1 << v16) & 0x1B) != 0 || *(unsigned __int16 *)(v15 + 34) != *(unsigned __int16 *)(v6 + 208))
    goto LABEL_14;
  v22 = (uint64_t *)(v15 & 0xFFFFFFFFFFFFC000);
  v23 = a2
      - *(_QWORD *)((v15 & 0xFFFFFFFFFFFFC000) + 0x30)
      - ((0xAAAAAAAAAAAAC000 * (((v15 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
  if (v16 == 5 || v16 == 2)
  {
    v25 = *(_QWORD *)(v6 + 216) + 88 * *(unsigned __int8 *)(v15 + 33);
    if ((*(_DWORD *)(v25 + 64) * v23) >= *(_DWORD *)(v25 + 64))
      goto LABEL_14;
    v17 = *(_QWORD *)(v25 + 48);
  }
  else
  {
    v17 = (unint64_t)*(unsigned int *)(v15 + 40) << 14;
    if (v23 % v17)
      goto LABEL_14;
  }
  if (v16 == 5)
  {
    if (((*(_DWORD *)v15 >> (v23 / v17)) & 1) == 0)
      goto LABEL_43;
    goto LABEL_14;
  }
  if (v16 != 2 || *(_QWORD *)a2 != (*(_QWORD *)(v6 + 272) ^ a2))
    goto LABEL_43;
  v31 = v15;
  v32 = v15 & 0xFFFFFFFFFFFFC000;
  is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(v6, v15, a2);
  v15 = v31;
  v22 = (uint64_t *)v32;
  if (is_free_slow)
  {
LABEL_14:
    v17 = _xzm_ptr_size_outlined(v6, a2);
    goto LABEL_15;
  }
  if (*(unsigned __int16 *)(v31 + 34) != *(unsigned __int16 *)(v6 + 208))
    xzm_realloc_cold_2(a2);
LABEL_43:
  if (a3 > 0x8000 && v17 > 0x8000)
  {
    if (a3 <= 0x200000 || v17 <= 0x200000)
    {
      if (a3 <= 0x200000
        && v17 < 0x200001
        && (*(_BYTE *)(v6 + 296) & 0x80) == 0
        && (xzm_segment_group_try_realloc_large_chunk(*v22, (uint64_t)v22, v15, (a3 + 0x3FFF) >> 14) & 1) != 0)
      {
        return;
      }
    }
    else if ((*(_BYTE *)(v6 + 296) & 0x80) == 0
           && (xzm_segment_group_try_realloc_huge_chunk(*v22, v6, (unint64_t)v22, v15, (a3 + 0x3FFF) >> 14) & 1) != 0)
    {
      return;
    }
  }
LABEL_15:
  if (v17 < a3 || v17 >> 1 > a3)
  {
    xzm_malloc(v6, a3, a4, 0);
    v19 = v18;
    if (v18)
    {
      if (v17 >= a3)
        v20 = a3;
      else
        v20 = v17;
      memcpy(v18, (const void *)a2, v20);
      if (v19 != (void *)a2)
        _xzm_free(v6, a2, 0);
    }
  }
}

void _xzm_xzone_malloc(uint64_t a1, unint64_t a2, unsigned int a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int16 *v6;
  unsigned __int16 v7;
  int v8;
  int v9;

  v4 = *(_QWORD *)(a1 + 216);
  if ((a4 & 2) == 0 && !*(_QWORD *)(a1 + 232))
  {
    v6 = (unsigned __int16 *)(v4 + 88 * a3 + 32);
    v7 = *v6;
    while (v7)
    {
      while (1)
      {
        v8 = __ldxr(v6);
        if (v8 != v7)
          break;
        if (!__stxr(v7 - 1, v6))
        {
          v9 = 1;
          goto LABEL_12;
        }
      }
      v9 = 0;
      __clrex();
LABEL_12:
      v7 = v8;
      if (v9)
      {
        mfm_alloc(*(_QWORD *)(v4 + 88 * a3 + 48));
        return;
      }
    }
  }
  v5 = v4 + 88 * a3;
  if (a2 > 0x1000)
    _xzm_xzone_malloc_small(a1, v5, a4);
  else
    _xzm_xzone_malloc_tiny(a1, v5, a4);
}

uint64_t _xzm_xzone_malloc_tiny(uint64_t a1, uint64_t a2, char a3)
{
  int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  unsigned __int8 *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  BOOL v32;
  uint64_t v33;
  unsigned int v34;
  int *v35;
  uint64_t v36;
  uint64_t i;
  unint64_t *v38;
  unint64_t v39;
  unint64_t v40;

  v3 = *(unsigned __int8 *)(a2 + 77);
  if (v3 == 1)
  {
    v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) >> 12;
  }
  else if (v3 == 2)
  {
    LOBYTE(v4) = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2));
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  v5 = 0;
  v6 = *(_QWORD *)(a1 + 224);
  v7 = *(unsigned __int8 *)(a2 + 72) + *(unsigned __int8 *)(a1 + 210) * (unint64_t)v4;
  v8 = (unint64_t *)(v6 + 32 * v7);
  v9 = *v8;
  if ((*v8 & 1) == 0)
  {
    v10 = (unint64_t *)((v9 >> 2) & 0x7FFFFFFFFFFFLL);
    if (v10)
    {
      v11 = (v9 >> 2) & 0x7FFFFFFFC000;
      v12 = *v10;
      if ((*v10 & 0x40000000) == 0)
      {
        v13 = 0;
        v14 = (unsigned __int8 *)(a2 + 77);
        v15 = ((0xAAAAAAAAAAAAC000 * (((unint64_t)v10 - v11 - 2104) >> 4)) & 0x3FFFFFFFC000)
            + *(_QWORD *)(v11 + 0x30);
LABEL_10:
        while (((v12 >> 22) & 0x3F) == v4 + 1)
        {
          if ((v12 & 0x3FF800) != 0)
          {
            v16 = ((_DWORD)v12 + 4192256) & 0x3FF800 | v12 & 0xFFFFFFFFFFC007FFLL;
            if ((v12 & 0x7FF) <= 0x3FF)
            {
              v5 = v15 + 16 * (v12 & 0x7FF);
              v17 = *(_QWORD *)v5;
              v18 = *(_QWORD *)(v5 + 8);
              do
              {
                v19 = __ldxr(v10);
                if (v19 != v12)
                {
                  __clrex();
                  v13 = 1;
                  v12 = v19;
                  if ((v19 & 0x40000000) == 0)
                    goto LABEL_10;
                  goto LABEL_52;
                }
              }
              while (__stxr(((int)v12 + 4192256) & 0x3FF800 | v12 & 0xFFF8003FFFC00000 | v18 & 0x7FF | (((v18 >> 11) & 0x1FFF) << 38), v10));
              if ((*(_QWORD *)(a1 + 272) ^ v5) == v17 && v18 >> 24 == 0)
                goto LABEL_39;
              return _xzm_xzone_malloc_tiny_outlined(a1, a2, v4, v8, v5, a3);
            }
            if ((((_DWORD)v12 + 4192256) & 0x3FF800) == 0)
              v16 = ((int)v12 + 4192256) & 0x3FF800 | v12 & 0xFFFFFFFFFFC00000 | 0x7FD;
            v21 = *(unsigned int *)(a2 + 68);
            v22 = *(_QWORD *)(a2 + 48);
            do
            {
              v23 = __ldxr(v10);
              if (v23 != v12)
              {
                __clrex();
                v13 = 1;
                v12 = v23;
                if ((v23 & 0x40000000) == 0)
                  goto LABEL_10;
                goto LABEL_52;
              }
            }
            while (__stxr(v16, v10));
            if (!v15)
              break;
            v5 = v15 + (v21 - ((v12 >> 11) & 0x7FF)) * v22;
LABEL_39:
            if ((*(_BYTE *)(a1 + 240) & 3) != v3)
            {
              v25 = v6 + 32 * v7;
              if (v13 || (*(_QWORD *)(v25 + 16) & 0xFFFFFF00000000) != 0)
              {
                v26 = (unint64_t *)(v25 + 16);
                v27 = v13 ? 0x100000001 : 1;
                do
                {
                  v28 = __ldxr(v26);
                  v29 = v28 + v27;
                }
                while (__stxr(v29, v26));
                v30 = HIBYTE(v29);
                if (HIBYTE(v29) != (*(_BYTE *)(a1 + 240) & 3))
                {
                  if ((HIDWORD(v29) & 0xFFFFFFu) > *(_DWORD *)(a1 + 4 * v30 + 244))
                  {
                    v32 = HIBYTE(HIDWORD(v29)) == 0 && ncpuclusters > 1;
                    if (v32)
                      v33 = 1;
                    else
                      v33 = 2;
                    while (1)
                    {
                      v34 = __ldxr(v14);
                      if (v34 >= v33)
                        break;
                      if (!__stxr(v33, v14))
                        goto LABEL_60;
                    }
                    __clrex();
LABEL_60:
                    v35 = &logical_ncpus;
                    if (v32)
                      v35 = &ncpuclusters;
                    v36 = *(unsigned __int8 *)v35;
                    if ((_DWORD)v36)
                    {
                      for (i = 0; i != v36; ++i)
                      {
                        v38 = (unint64_t *)(*(_QWORD *)(a1 + 224)
                                                 + 32
                                                 * (*(unsigned __int8 *)(a2 + 72) + i * *(unsigned __int8 *)(a1 + 210))
                                                 + 16);
                        while (1)
                        {
                          v39 = __ldxr(v38);
                          if (HIBYTE(v39) >= v33)
                            break;
                          if (!__stxr(v33 << 56, v38))
                            goto LABEL_67;
                        }
                        __clrex();
LABEL_67:
                        ;
                      }
                    }
                  }
                  else if (*(_DWORD *)(a1 + 256) < v29)
                  {
                    while (1)
                    {
                      v40 = __ldxr(v26);
                      if (v40 < v29 || v30 < HIBYTE(v40))
                        break;
                      if (!__stxr(v29 & 0xFF00000000000000, v26))
                        goto LABEL_49;
                    }
                    __clrex();
                  }
                }
              }
            }
LABEL_49:
            *(_QWORD *)v5 = 0;
            *(_QWORD *)(v5 + 8) = 0;
            if ((a3 & 1) != 0 && *(_QWORD *)(a2 + 48) >= 0x401uLL)
              return _platform_memset();
            else
              return v5;
          }
          while (1)
          {
            v20 = __ldxr(v10);
            if (v20 != v12)
              break;
            if (!__stxr(v12 & 0xFFFFFFFFF03FFFFFLL, v10))
              goto LABEL_52;
          }
          __clrex();
          v12 = v20;
          if ((v20 & 0x40000000) != 0)
            break;
        }
      }
LABEL_52:
      v5 = 0;
    }
  }
  return _xzm_xzone_malloc_tiny_outlined(a1, a2, v4, v8, v5, a3);
}

void _xzm_free(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  char is_free_slow;
  int v23;
  size_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  int v29;
  char *v30;
  int8x8_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  BOOL v37;
  BOOL v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  os_unfair_lock_s *v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unsigned int v54;
  int v55;
  unint64_t v57;

  if (!a2)
    return;
  v5 = a2 >> 22;
  if (a2 >> 36)
    v5 = 0x4000;
  if (v5 >> 14)
    goto LABEL_13;
  v6 = *(_QWORD *)(a1 + 232);
  if (!v6)
    v6 = a1;
  v7 = *(_QWORD *)(v6 + 408);
  if (!v7)
    goto LABEL_13;
  v8 = *(unsigned int *)(v7 + 4 * v5);
  if (!(_DWORD)v8)
    goto LABEL_13;
  v9 = v8 << 14;
  v10 = a2 - *(_QWORD *)(v9 + 48);
  if (*(_DWORD *)(v9 + 16) <= (v10 >> 14))
    goto LABEL_13;
  v11 = v10 >> 14;
  v12 = v9 + 48 * v11 + 2104;
  if ((*(_BYTE *)(v9 + 48 * v11 + 2136) & 0xF) != 4)
    goto LABEL_11;
  v53 = v12 - *(unsigned int *)(v9 + 48 * v11 + 2140);
  v54 = *(_BYTE *)(v53 + 32) & 0xF;
  if (v54 > 8)
    goto LABEL_11;
  v55 = 1 << v54;
  if ((v55 & 0x1E8) != 0)
  {
    if (v53 + 48 * *(unsigned int *)(v53 + 40) <= v12)
      goto LABEL_11;
    goto LABEL_93;
  }
  if ((v55 & 6) != 0 && v12 == v53)
LABEL_93:
    v12 = v53;
LABEL_11:
  v13 = *(_BYTE *)(v12 + 32);
  v14 = v13 & 0xF;
  if (v14 > 7)
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v14);
  if (((1 << v14) & 0x1B) != 0 || *(unsigned __int16 *)(v12 + 34) != *(unsigned __int16 *)(a1 + 208))
    goto LABEL_13;
  v15 = (0xAAAAAAAAAAAAC000 * (((v12 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000;
  v16 = a2 - *(_QWORD *)((v12 & 0xFFFFFFFFFFFFC000) + 0x30) - v15;
  if (v14 == 5 || v14 == 2)
  {
    v18 = *(_QWORD *)(a1 + 216) + 88 * *(unsigned __int8 *)(v12 + 33);
    if ((*(_DWORD *)(v18 + 64) * v16) >= *(_DWORD *)(v18 + 64))
      goto LABEL_13;
    v19 = *(_QWORD *)(v18 + 48);
  }
  else
  {
    v19 = (unint64_t)*(unsigned int *)(v12 + 40) << 14;
    if (v16 % v19)
      goto LABEL_13;
    v18 = 0;
  }
  if (v14 == 5)
  {
    if (((*(_DWORD *)v12 >> (v16 / v19)) & 1) != 0)
      goto LABEL_13;
  }
  else if (v14 == 2 && *(_QWORD *)a2 == (*(_QWORD *)(a1 + 272) ^ a2))
  {
    v20 = a3;
    v21 = v18;
    is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v12, a2);
    a3 = v20;
    if ((is_free_slow & 1) == 0)
    {
      v18 = v21;
      v13 = *(_BYTE *)(v12 + 32);
      goto LABEL_30;
    }
LABEL_13:
    _xzm_free_outlined(a1, (void *)a2, a3);
    return;
  }
LABEL_30:
  v23 = v13 & 0xF;
  if (v23 == 5)
  {
    _xzm_xzone_free_block_to_small_chunk(a1, v18, (int8x8_t *)v12, a2);
    return;
  }
  if (v23 != 2)
  {
    _xzm_free_large_huge(a1, v12);
    return;
  }
  v24 = *(_QWORD *)(v18 + 48);
  if (v24 <= 0x400)
  {
    v25 = v18;
    bzero((void *)a2, v24);
    v18 = v25;
  }
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = *(_DWORD *)(v18 + 68);
  v30 = (char *)(a2 - *(_QWORD *)((v12 & 0xFFFFFFFFFFFFC000) + 0x30) - v15);
  *(_QWORD *)a2 = *(_QWORD *)(a1 + 272) ^ a2;
  v31 = *(int8x8_t *)v12;
  v32 = ((unint64_t)&v30[(uint64_t)v30 < 0 ? 0xFuLL : 0] >> 4) & 0x7FF;
  v33 = 1;
  v57 = v32;
  do
  {
    if ((v31.i32[0] & 0x40000000) != 0)
    {
      do
      {
        _xzm_walk_lock_wait((os_unfair_lock_s *)a1);
        v31 = *(int8x8_t *)v12;
      }
      while ((*(_QWORD *)v12 & 0x40000000) != 0);
    }
    v34 = *(_QWORD *)&v31 + 0x8000000000000;
    v35 = ((unsigned __int32)v31.i32[0] >> 11) & 0x7FF;
    if (v35 + 1 == v29)
    {
      if ((v27 & 1) != 0
        || ((v36 = ((unsigned __int32)v31.i32[0] >> 22) & 0x3F, (*(_QWORD *)v18 & 0x7FFFFFFFFFFFLL) == 0)
          ? (v37 = v36 == 0)
          : (v37 = 1),
            v37))
      {
        if ((v33 & 1) != 0)
          goto LABEL_44;
        v33 = 0;
        v27 = 1;
      }
      else
      {
        v42 = v18;
        v43 = mach_absolute_time();
        v18 = v42;
        v28 = v43;
        v26 = *(_QWORD *)(a1 + 224)
            + 32
            * (*(unsigned __int8 *)(v42 + 72)
             + *(unsigned __int8 *)(a1 + 210) * (unint64_t)(v36 - 1));
        if (((v43 - *(_QWORD *)(v26 + 24) >= *(_QWORD *)(a1 + 264)) & v33) != 0)
        {
          v32 = v57;
LABEL_44:
          v38 = 0;
          v39 = v34 & 0xFFFFFFFFF0000000 | 0x7FF;
          v27 = 1;
          v33 = 1;
          goto LABEL_48;
        }
        v33 = 0;
        v27 = 1;
        v32 = v57;
      }
    }
    *(_QWORD *)(a2 + 8) = v31.i16[0] & 0x7FF | (((*(_QWORD *)&v31 >> 38) & 0x1FFFLL) << 11);
    v39 = (v31.i32[0] + 2048) & 0x3FF800 | v32 | (*(_QWORD *)&v31 >> 51 << 38) | v34 & 0xFFF8003FFFC00000;
    v38 = (v31.i32[0] & 0xFC00000) == 0 && v35 == 0;
    if (v38)
      v39 |= 0x10000000uLL;
LABEL_48:
    while (1)
    {
      v40 = __ldxr((unint64_t *)v12);
      if (v40 != *(_QWORD *)&v31)
        break;
      if (!__stlxr(v39, (unint64_t *)v12))
      {
        v41 = 1;
        goto LABEL_52;
      }
    }
    v41 = 0;
    __clrex();
LABEL_52:
    v31 = (int8x8_t)v40;
  }
  while (!v41);
  if (v28)
    *(_QWORD *)(v26 + 24) = v28;
  if ((~(_WORD)v39 & 0x7FF) != 0)
  {
    if (v38)
    {
      v46 = (os_unfair_lock_s *)a1;
      v47 = (unint64_t *)v18;
LABEL_82:
      _xzm_chunk_list_push(v46, v47, v12, 0);
    }
  }
  else
  {
    v44 = *(_QWORD *)(a1 + 232);
    if (!v44)
      v44 = a1;
    v45 = v18;
    if ((*(_BYTE *)(v44 + 328) & 4) != 0)
      xzm_chunk_mark_free(a1, v12);
    else
      xzm_segment_group_segment_madvise_chunk(*(_QWORD *)(v18 + 40), v12);
    v48 = *(_QWORD *)v12;
LABEL_72:
    v49 = v48;
    v50 = v48 & 0xFFFFFFFFFFFFF800;
    if ((v49 & 0x10000000) != 0)
      v51 = 2046;
    else
      v51 = 536872958;
    v52 = v51 | v50;
    do
    {
      v48 = __ldxr((unint64_t *)v12);
      if (v48 != v49)
      {
        __clrex();
        goto LABEL_72;
      }
    }
    while (__stlxr(v52, (unint64_t *)v12));
    if ((v49 & 0x10000000) == 0)
    {
      v47 = (unint64_t *)(v45 + 8);
      v46 = (os_unfair_lock_s *)a1;
      goto LABEL_82;
    }
  }
}

void _free(void *a1)
{
  BOOL v1;
  void (*v2)(void);

  if (a1)
  {
    if (malloc_slowpath)
      v1 = 0;
    else
      v1 = malloc_logger == 0;
    if (v1
      && *(_DWORD *)(*(_QWORD *)malloc_zones + 104) > 0xCu
      && (v2 = *(void (**)(void))(*(_QWORD *)malloc_zones + 144)) != 0)
    {
      v2();
    }
    else
    {
      find_zone_and_free(a1, 0);
    }
  }
}

void xzm_malloc_zone_try_free_default(uint64_t a1, unint64_t a2)
{
  _xzm_free(a1, a2, 1);
}

uint64_t _xzm_xzone_malloc_tiny_outlined(uint64_t a1, uint64_t a2, int a3, unint64_t *a4, uint64_t a5, char a6)
{
  unsigned __int8 *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char v11;
  int v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t result;
  uint64_t v20;
  unint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t chunk_from_isolation;
  size_t v31;
  mach_vm_address_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  unint64_t *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  BOOL v41;
  uint64_t v42;
  unsigned int v43;
  int *v44;
  uint64_t v45;
  uint64_t i;
  unint64_t *v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v51;
  uint64_t v52;
  char v53;
  char v54;

  if (a5)
  {
    qword_1EE228008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: memory corruption of free block";
    qword_1EE228038 = a5;
    __break(1u);
LABEL_82:
    v41 = BYTE3(v7) == 0 && ncpuclusters > 1;
    if (v41)
      v42 = 1;
    else
      v42 = 2;
    while (1)
    {
      v43 = __ldxr(v6);
      if (v43 >= v42)
        break;
      if (!__stxr(v42, v6))
        goto LABEL_87;
    }
    __clrex();
LABEL_87:
    v44 = &logical_ncpus;
    if (v41)
      v44 = &ncpuclusters;
    v45 = *(unsigned __int8 *)v44;
    if ((_DWORD)v45)
    {
      for (i = 0; i != v45; ++i)
      {
        v47 = (unint64_t *)(*(_QWORD *)(v9 + 224)
                                 + 32 * (*(unsigned __int8 *)(v8 + 72) + i * *(unsigned __int8 *)(v9 + 210))
                                 + 16);
        while (1)
        {
          v48 = __ldxr(v47);
          if (HIBYTE(v48) >= v42)
            break;
          if (!__stxr(v42 << 56, v47))
            goto LABEL_94;
        }
        __clrex();
LABEL_94:
        ;
      }
    }
    goto LABEL_77;
  }
  v8 = a2;
  v9 = a1;
  v11 = a6;
  v14 = 0;
  v51 = *(_QWORD *)(a2 + 48);
  v15 = *a4;
  v54 = 0;
LABEL_3:
  v16 = v15;
  while ((v16 & 1) != 0)
  {
    if ((v16 & 2) == 0)
    {
      while (1)
      {
        v17 = __ldxr(a4);
        if (v17 != v16)
          break;
        if (!__stxr(v16 | 2, a4))
        {
          v18 = 1;
          goto LABEL_12;
        }
      }
      v18 = 0;
      __clrex();
LABEL_12:
      v16 = v17;
      if (!v18)
        continue;
    }
    result = __ulock_wait();
    if ((result & 0x80000000) != 0 && (_DWORD)result != -4)
    {
      v20 = -(int)result;
      if ((_DWORD)v20 != 14)
        goto LABEL_106;
    }
LABEL_14:
    v16 = *a4;
  }
  if ((v16 & 2) != 0)
  {
    _xzm_fork_lock_wait((os_unfair_lock_s *)v9);
    goto LABEL_14;
  }
  v21 = (unint64_t *)((v16 >> 2) & 0x7FFFFFFFFFFFLL);
  if (!v21 || (v22 = _xzm_xzone_malloc_from_tiny_chunk(v9, v8, a3, v21, &v54, 0)) == 0)
  {
    if (!v14)
      v14 = _malloc_ulock_self_owner_value();
    do
    {
      v15 = __ldxr(a4);
      if (v15 != v16)
      {
        __clrex();
        goto LABEL_3;
      }
    }
    while (__stxr(v16 & 0xFFFE000000000000 | (4 * v14) | 1u, a4));
    v23 = _xzm_chunk_list_pop((os_unfair_lock_s *)v9, (unint64_t *)v8, 0);
    if (v23)
    {
      v24 = v23;
      while (1)
      {
        v53 = 0;
        v25 = _xzm_xzone_malloc_from_tiny_chunk(v9, v8, a3, (unint64_t *)v24, &v54, &v53);
        if (v25)
          break;
        if (v53)
          _xzm_chunk_list_push((os_unfair_lock_s *)v9, (unint64_t *)(v8 + 8), v24, 0);
        v24 = _xzm_chunk_list_pop((os_unfair_lock_s *)v9, (unint64_t *)v8, 0);
        if (!v24)
          goto LABEL_32;
      }
LABEL_44:
      v10 = (_QWORD *)v25;
      do
LABEL_62:
        v35 = __ldxr(a4);
      while (__stlxr((v15 & 0xFFFE000000000000 | (4 * (v24 & 0x7FFFFFFFFFFFLL))) + 0x2000000000000, a4));
      if ((v35 & 2) == 0 || (result = __ulock_wake(), (_DWORD)result == -2) || !(_DWORD)result)
      {
        if (!v10)
          return (uint64_t)v10;
        goto LABEL_67;
      }
      v20 = -(int)result;
      qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: ulock_wake failure";
      qword_1EE228038 = v20;
      __break(1u);
LABEL_106:
      qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: ulock_wait failure";
      qword_1EE228038 = v20;
      __break(1u);
LABEL_107:
      qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: asking for start of chunk with invalid kind";
      qword_1EE228038 = v20;
      __break(1u);
      return result;
    }
LABEL_32:
    v26 = _xzm_chunk_list_pop((os_unfair_lock_s *)v9, (unint64_t *)(v8 + 8), 0);
    if (v26)
    {
      v27 = 0;
      while (1)
      {
        v24 = v26;
        v25 = _xzm_xzone_malloc_from_empty_tiny_chunk(v9, v8, a3, v26);
        if (v25)
          goto LABEL_44;
        *(_QWORD *)(v24 + 16) = v27;
        v26 = _xzm_chunk_list_pop((os_unfair_lock_s *)v9, (unint64_t *)(v8 + 8), 0);
        v27 = v24;
        if (!v26)
        {
          do
          {
            v28 = *(_QWORD *)(v24 + 16);
            _xzm_chunk_list_push((os_unfair_lock_s *)v9, (unint64_t *)(v8 + 8), v24, 0);
            v24 = v28;
          }
          while (v28);
          break;
        }
      }
    }
    if ((*(_BYTE *)(v8 + 78) & 1) != 0
      && (*(_QWORD *)(v9 + 232) ? (v29 = *(_QWORD *)(v9 + 232)) : (v29 = v9),
          (chunk_from_isolation = _xzm_xzone_allocate_chunk_from_isolation(v29, v8)) != 0))
    {
      v24 = chunk_from_isolation;
      v10 = (_QWORD *)_xzm_xzone_malloc_from_empty_tiny_chunk(v9, v8, a3, chunk_from_isolation);
    }
    else
    {
      result = _xzm_chunk_list_pop((os_unfair_lock_s *)v9, (unint64_t *)(v8 + 24), 0);
      if (result)
      {
        v24 = result;
        if (v51 <= 0x400 && (*(_BYTE *)(result + 32) & 0x10) == 0)
        {
          v20 = *(_BYTE *)(result + 32) & 0xF;
          if ((v20 - 6) < 2)
          {
            v31 = (unint64_t)*(unsigned int *)(result + 40) << 14;
          }
          else if ((_DWORD)v20 == 2)
          {
            v31 = 0x4000;
          }
          else
          {
            if ((_DWORD)v20 != 5)
              goto LABEL_107;
            v31 = 0x10000;
          }
          bzero((void *)(((0xAAAAAAAAAAAAC000 * (((unint64_t)(result & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)+ *(_QWORD *)((result & 0xFFFFFFFFFFFFC000) + 0x30)), v31);
        }
      }
      else
      {
        v52 = 0;
        v32 = xzm_segment_group_alloc_chunk(*(_QWORD *)(v8 + 40), 2, (unsigned __int8 *)(v8 + 79), 1u, &v52, 0, v51 < 0x401, 0);
        v24 = v32;
        if (!v32)
        {
          v10 = 0;
          goto LABEL_62;
        }
        *(_BYTE *)(v32 + 33) = *(_BYTE *)(v8 + 72);
        v33 = v52;
        if (v52)
        {
          do
          {
            v34 = *(_QWORD *)(v33 + 16);
            v52 = *(_QWORD *)(v52 + 16);
            *(_BYTE *)(v33 + 33) = *(_BYTE *)(v8 + 72);
            *(_BYTE *)(v33 + 32) |= 0x40u;
            _xzm_chunk_list_push((os_unfair_lock_s *)v9, (unint64_t *)(v8 + 24), v33, 0);
            v33 = v34;
          }
          while (v34);
        }
      }
      *(_BYTE *)(v24 + 32) &= ~0x40u;
      *(_QWORD *)v24 = ((*(_DWORD *)(v8 + 68) << 11) + 4192256) & 0x3FF800 | 0x7FCu | ((unint64_t)(((_BYTE)a3 + 1) & 0x3F) << 22);
      *(_WORD *)(v24 + 34) = *(_WORD *)(v8 + 74);
      v10 = (_QWORD *)(((0xAAAAAAAAAAAAC000 * (((unint64_t)(v24 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
                     + *(_QWORD *)((v24 & 0xFFFFFFFFFFFFC000) + 0x30));
    }
    _xzm_chunk_list_push((os_unfair_lock_s *)v9, (unint64_t *)(v8 + 16), v24, 1u);
    goto LABEL_62;
  }
  v10 = (_QWORD *)v22;
LABEL_67:
  if ((*(_BYTE *)(v9 + 240) & 3) != *(_BYTE *)(v8 + 77) && (v54 || (a4[2] & 0xFFFFFF00000000) != 0))
  {
    v6 = (unsigned __int8 *)(v8 + 77);
    v36 = a4 + 2;
    v37 = v54 ? 0x100000001 : 1;
    do
    {
      v38 = __ldxr(v36);
      v39 = v38 + v37;
    }
    while (__stxr(v39, v36));
    v40 = HIBYTE(v39);
    if (HIBYTE(v39) != (*(_BYTE *)(v9 + 240) & 3))
    {
      v7 = HIDWORD(v39);
      if ((HIDWORD(v39) & 0xFFFFFFu) > *(_DWORD *)(v9 + 4 * v40 + 244))
        goto LABEL_82;
      if (*(_DWORD *)(v9 + 256) < v39)
      {
        while (1)
        {
          v49 = __ldxr(v36);
          if (v49 < v39 || v40 < HIBYTE(v49))
            break;
          if (!__stxr(v39 & 0xFF00000000000000, v36))
            goto LABEL_77;
        }
        __clrex();
      }
    }
  }
LABEL_77:
  *v10 = 0;
  v10[1] = 0;
  if ((v11 & 1) != 0 && v51 >= 0x401)
    bzero(v10, *(_QWORD *)(v8 + 48));
  return (uint64_t)v10;
}

uint64_t _xzm_chunk_list_pop(os_unfair_lock_s *a1, unint64_t *a2, unsigned int a3)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  int v10;

  v5 = *a2;
  v6 = a3;
  do
  {
    while ((v5 & 0x8000000000000000) != 0)
    {
      _xzm_fork_lock_wait(a1);
      v5 = *a2;
    }
    result = v5 & 0x7FFFFFFFFFFFLL;
    if ((v5 & 0x7FFFFFFFFFFFLL) == 0)
      break;
    v8 = (v5 + 0x800000000000) & 0x7FFF800000000000 | *(_QWORD *)((v5 & 0x7FFFFFFFFFFFLL) + 8 * v6 + 0x10) & 0x7FFFFFFFFFFFLL;
    while (1)
    {
      v9 = __ldxr(a2);
      if (v9 != v5)
        break;
      if (!__stxr(v8, a2))
      {
        v10 = 1;
        goto LABEL_9;
      }
    }
    v10 = 0;
    __clrex();
LABEL_9:
    v5 = v9;
  }
  while (!v10);
  return result;
}

uint64_t _xzm_xzone_malloc_from_tiny_chunk(uint64_t a1, uint64_t a2, int a3, unint64_t *a4, _BYTE *a5, _BYTE *a6)
{
  _BYTE *v6;
  _BYTE *v7;
  unint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a2;
  v10 = a1;
  v11 = ((0xAAAAAAAAAAAAC000 * (((unint64_t)((unsigned __int16)a4 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
      + *(_QWORD *)(((unint64_t)a4 & 0xFFFFFFFFFFFFC000) + 0x30);
  v12 = *a4;
  v13 = a3 + 1;
  v14 = (unint64_t)((a3 + 1) & 0x3F) << 22;
  while (1)
  {
    while (1)
    {
      if ((v12 & 0x40000000) != 0)
      {
        do
        {
          _xzm_walk_lock_wait((os_unfair_lock_s *)v10);
          v12 = *v8;
        }
        while ((*v8 & 0x40000000) != 0);
      }
      if (!v6)
        break;
      if ((v12 & 0x3FF800) != 0)
      {
        v15 = v12 & 0xFFFFFFFFE03FFFFFLL | v14;
        goto LABEL_8;
      }
      if ((v12 & 0x7FF) == 0x7FE)
      {
        v25 = v12 & 0xFFFFFFFFCFFFFFFFLL | 0x20000000;
        *v6 = 1;
      }
      else
      {
        v25 = v12 & 0xFFFFFFFFEFFFFFFFLL;
      }
      while (1)
      {
        v26 = __ldxr(v8);
        if (v26 != v12)
          break;
        if (!__stxr(v25, v8))
          return 0;
      }
LABEL_31:
      __clrex();
      v12 = v26;
    }
    if (((v12 >> 22) & 0x3F) != v13)
      return 0;
    v15 = v12;
    if ((v12 & 0x3FF800) == 0)
    {
      while (1)
      {
        v26 = __ldxr(v8);
        if (v26 != v12)
          break;
        if (!__stxr(v12 & 0xFFFFFFFFF03FFFFFLL, v8))
          return 0;
      }
      goto LABEL_31;
    }
LABEL_8:
    v16 = ((_DWORD)v15 + 4192256) & 0x3FF800 | v15 & 0xFFFFFFFFFFC007FFLL;
    if ((v12 & 0x7FF) <= 0x3FF)
      break;
    if ((((_DWORD)v15 + 4192256) & 0x3FF800) == 0)
      v16 = ((int)v15 + 4192256) & 0x3FF800 | v15 & 0xFFFFFFFFFFC00000 | 0x7FD;
    v22 = *(unsigned int *)(v9 + 68);
    v23 = *(_QWORD *)(v9 + 48);
    while (1)
    {
      v24 = __ldxr(v8);
      if (v24 != v12)
        break;
      if (!__stxr(v16, v8))
        return v11 + (v22 - ((v12 >> 11) & 0x7FF)) * v23;
    }
    __clrex();
    v12 = v24;
LABEL_23:
    *v7 = 1;
  }
  result = v11 + 16 * (v12 & 0x7FF);
  v18 = *(_QWORD *)result;
  v19 = *(_QWORD *)(result + 8);
  v20 = v16 & 0xFFF8003FFFFFF800 | v19 & 0x7FF | (((v19 >> 11) & 0x1FFF) << 38);
  do
  {
    v21 = __ldxr(v8);
    if (v21 != v12)
    {
      __clrex();
      v12 = v21;
      goto LABEL_23;
    }
  }
  while (__stxr(v20, v8));
  if ((*(_QWORD *)(v10 + 272) ^ result) != v18 || v19 >> 24 != 0)
    _xzm_xzone_malloc_from_tiny_chunk_cold_1(result);
  return result;
}

uint64_t _malloc_ulock_self_owner_value()
{
  return *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) >> 2;
}

void _xzm_chunk_list_push(os_unfair_lock_s *a1, unint64_t *a2, uint64_t a3, unsigned int a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;

  v6 = *a2;
  v7 = a3 + 16;
  v8 = a3 & 0x7FFFFFFFFFFFLL;
  v9 = a4;
  do
  {
    while ((v6 & 0x8000000000000000) != 0)
    {
      _xzm_fork_lock_wait(a1);
      v6 = *a2;
    }
    *(_QWORD *)(v7 + 8 * v9) = v6 & 0x7FFFFFFFFFFFLL;
    while (1)
    {
      v10 = __ldxr(a2);
      if (v10 != v6)
        break;
      if (!__stlxr((v6 + 0x800000000000) & 0x7FFF800000000000 | v8, a2))
      {
        v11 = 1;
        goto LABEL_8;
      }
    }
    v11 = 0;
    __clrex();
LABEL_8:
    v6 = v10;
  }
  while (!v11);
}

BOOL mvm_madvise(void *a1, size_t a2, int a3)
{
  return madvise(a1, a2, a3) == -1;
}

BOOL xzm_segment_group_segment_madvise_chunk(uint64_t a1, uint64_t a2)
{
  int v2;
  size_t v3;

  v2 = *(_BYTE *)(a2 + 32) & 0xF;
  if ((v2 - 6) < 2)
  {
    v3 = (unint64_t)*(unsigned int *)(a2 + 40) << 14;
  }
  else if (v2 == 2)
  {
    v3 = 0x4000;
  }
  else
  {
    if (v2 != 5)
      xzm_chunk_mark_free_cold_1(v2);
    v3 = 0x10000;
  }
  return mvm_madvise((void *)(((0xAAAAAAAAAAAAC000 * (((unint64_t)(a2 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)+ *(_QWORD *)((a2 & 0xFFFFFFFFFFFFC000) + 0x30)), v3, 7);
}

void xzm_malloc(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  if (a2 > 0x8000)
  {
    _xzm_malloc_large_huge(a1, a2, 0, a3, a4);
    return;
  }
  if (*(_QWORD *)(a1 + 232))
    v4 = *(_QWORD *)(a1 + 232);
  else
    v4 = a1;
  v5 = __clz(a2 - 1);
  v6 = (((a2 - 1) >> (61 - v5)) & 3) - 4 * v5 + 488;
  if (a2 <= 0x80)
    v6 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
  if (!a2)
    LOBYTE(v6) = 0;
  v7 = v6;
  v8 = *(_BYTE *)(*(_QWORD *)(v4 + 368) + v6);
  if (HIWORD(a3) == 256)
  {
    v9 = 0;
  }
  else
  {
    if ((a3 & 0xC0000000000) != 0x40000000000)
    {
      ((void (*)(void))((char *)&loc_191D68FB8 + 4
                                               * byte_191D9E9E8[*(unsigned __int8 *)(*(_QWORD *)(v4 + 360) + v7) - 3]))();
      return;
    }
    v9 = 1;
  }
  _xzm_xzone_malloc(a1, a2, (v9 + v8), a4);
}

void _xzm_xzone_chunk_free(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  char v10;
  int v11;
  os_unfair_lock_s *v12;
  uint64_t v13;

  v6 = *(_QWORD *)(a2 + 40);
  *(_WORD *)(a3 + 34) = 0;
  if ((*(_BYTE *)(a2 + 78) & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 232))
      v8 = *(_QWORD *)(a1 + 232);
    else
      v8 = a1;
    if ((*(_BYTE *)(v8 + 328) & 4) != 0)
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFC000)
                     + 0xFFFFFFFD55555558 * (((a3 & 0x3FFF) - 2104) >> 4)
                     + 0x38) == -1)
        xzm_chunk_mark_free(a1, a3);
    }
    else
    {
      v9 = *(_BYTE *)(a3 + 32) & 0xF;
      if (v9 != 5)
      {
        if (v9 != 2)
          _xzm_xzone_chunk_free_cold_2(*(_BYTE *)(a3 + 32) & 0xF);
        if ((*(_QWORD *)a3 & 0x7FFLL) != 0x7FE)
        {
          *(_QWORD *)a3 = *(_QWORD *)a3 & 0xFFFFFFFFFFC00000 | 0x7FE;
          xzm_segment_group_segment_madvise_chunk(v6, a3);
        }
      }
    }
    v10 = *(_BYTE *)(a3 + 32);
    v11 = v10 & 0xF;
    if (v11 != 2)
    {
      if (v11 != 5)
        _xzm_segment_group_segment_span_free_coalesce_cold_1(v11);
      *(_QWORD *)a3 = *(_DWORD *)a3 | ~(-1 << *(_DWORD *)(a2 + 68));
    }
    *(_BYTE *)(a3 + 32) = v10 & 0xEF;
    if (v11 == 2)
      *(_QWORD *)a3 = *(_QWORD *)a3 & 0xFFFFFFFFC03FFFFFLL | 0x20000000;
    v12 = (os_unfair_lock_s *)(*(_QWORD *)(v8 + 376) + 16 * *(unsigned __int8 *)(a2 + 72));
    os_unfair_lock_lock_with_options();
    v13 = *(_QWORD *)&v12->_os_unfair_lock_opaque;
    *(_QWORD *)(a3 + 16) = *(_QWORD *)&v12->_os_unfair_lock_opaque;
    if (v13)
      *(_QWORD *)(*(_QWORD *)&v12->_os_unfair_lock_opaque + 24) = a3 + 16;
    *(_QWORD *)&v12->_os_unfair_lock_opaque = a3;
    *(_QWORD *)(a3 + 24) = v12;
    os_unfair_lock_unlock(v12 + 2);
  }
  else
  {
    v7 = *(_BYTE *)(a3 + 32) & 0xF;
    if (v7 == 5)
    {
      *(_DWORD *)a3 = 0;
    }
    else
    {
      if (v7 != 2)
        _xzm_segment_group_segment_span_free_coalesce_cold_1(v7);
      *(_QWORD *)a3 &= 0xFFFFFFFFFFFFF800;
    }
    *(_DWORD *)(a3 + 4) = 0;
    *(_BYTE *)(a3 + 33) = 0;
    xzm_segment_group_free_chunk(*(unsigned __int8 **)(a2 + 40), a3, 0);
  }
}

void _xzm_free_large_huge(uint64_t a1, unint64_t a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;

  v4 = (os_unfair_lock_s *)(a1 + 280);
  os_unfair_lock_lock_with_options();
  *(_WORD *)(a2 + 34) = 0;
  v5 = *(_QWORD *)(a2 + 16);
  if (v5)
  {
    *(_QWORD *)(v5 + 24) = *(_QWORD *)(a2 + 24);
    v5 = *(_QWORD *)(a2 + 16);
  }
  **(_QWORD **)(a2 + 24) = v5;
  os_unfair_lock_unlock(v4);
  xzm_segment_group_free_chunk(*(unsigned __int8 **)(a2 & 0xFFFFFFFFFFFFC000), a2, (*(_QWORD *)(a1 + 296) & 0x80) != 0);
}

uint64_t tiny_try_realloc_in_place(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v5;
  unint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int i;
  unint64_t v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  int8x8_t *v23;
  int v24;
  int v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t StatusReg;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;

  v5 = a3 >> 4;
  if ((unsigned __int16)((a2 - 16512) >> 4) + (unsigned __int16)(a3 >> 4) > 0xFBF7)
    return 0;
  v9 = a2 & 0xFFFFFFFFFFF00000;
  v10 = *(_QWORD *)(a1 + 624);
  v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
  v12 = v10 + 2560 * v11;
  os_unfair_lock_lock_with_options();
  for (i = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18); v11 != i; i = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18))
  {
    v11 = i;
    os_unfair_lock_unlock((os_unfair_lock_t)v12);
    v12 = v10 + 2560 * v11;
    os_unfair_lock_lock_with_options();
  }
  if (v11 == -1)
  {
LABEL_18:
    os_unfair_lock_unlock((os_unfair_lock_t)v12);
    return 0;
  }
  v14 = a2 + a3;
  v15 = (unsigned __int16)(a3 >> 4);
  v16 = (unsigned __int16)((a4 + 15) >> 4);
  v17 = ((a4 + 15) >> 4) - v5;
  if (*(_QWORD *)(v12 + 8) == v14 && (v18 = *(unsigned __int16 *)(v12 + 16), v15 + v18 >= v16))
  {
    if (v18 == (unsigned __int16)v17)
    {
      *(_QWORD *)(v12 + 8) = 0;
      *(_WORD *)(v12 + 16) = 0;
      *(_QWORD *)(v12 + 24) = 0;
      --*(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x14);
    }
    else
    {
      *(_WORD *)(v12 + 16) = v18 - v17;
      *(_QWORD *)(v12 + 8) = a2 + a4;
      set_tiny_meta_header_in_use(v14 + 16 * (unsigned __int16)v17, (unsigned __int16)(v18 - v17));
    }
    *(int8x8_t *)((v14 & 0xFFFFFFFFFFF00000 | (((v14 & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) = vand_s8(*(int8x8_t *)((v14 & 0xFFFFFFFFFFF00000 | (((v14 & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28), (int8x8_t)vdup_n_s32(~(1 << (((v14 & 0xFFFFF) - 16512) >> 4))));
    if (malloc_zero_policy == 2)
    {
      _platform_memset();
    }
    else if (!malloc_zero_policy)
    {
      v38 = malloc_zero_on_free_sample_period;
      if (malloc_zero_on_free_sample_period)
      {
        StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v40 = *(_QWORD *)(StatusReg + 888);
        v41 = v40 + 1 == v38;
        v42 = v40 + 1 == v38 ? 0 : v40 + 1;
        *(_QWORD *)(StatusReg + 888) = v42;
        if (v41)
        {
          if (_platform_memcmp_zero_aligned8())
            tiny_zero_corruption_abort(v14);
        }
      }
    }
    LOWORD(v17) = 0;
  }
  else if (*(_QWORD *)(v12 + 2144) == v9
         && ((v19 = *(_QWORD *)(v12 + 2128),
              (unsigned __int16)v17 < (unsigned __int16)(v19 >> 4))
           ? (v20 = (v9 | 0x4080) - v19 + 1032064 == v14)
           : (v20 = 0),
             v20))
  {
    *(int8x8_t *)((v14 & 0xFFFFFFFFFFF00000 | (((v14 & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) = vand_s8(*(int8x8_t *)((v14 & 0xFFFFFFFFFFF00000 | (((v14 & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28), (int8x8_t)vdup_n_s32(~(1 << (((v14 & 0xFFFFF) - 16512) >> 4))));
    if ((unsigned __int16)v17 >= 2u)
      *(int8x8_t *)(((v14 + 16) & 0xFFFFFFFFFFF00000 | ((((v14 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) = vand_s8(*(int8x8_t *)(((v14 + 16) & 0xFFFFFFFFFFF00000 | ((((v14 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28), (int8x8_t)vdup_n_s32(~(1 << (((((_DWORD)v14 + 16) & 0xFFFFFu) - 16512) >> 4))));
    v27 = v19 - 16 * (unsigned __int16)v17;
    *(_QWORD *)(v12 + 2128) = v27;
    if (v27)
    {
      v28 = a2 + 16 * v16;
      v29 = v28 & 0xFFFFF;
      v30 = v28 & 0xFFFFFFFFFFF00000 | 0x28;
      v31 = v29 - 16512;
      v32 = (unint64_t)(v29 - 16512) >> 4;
      *(int8x8_t *)(v30 + ((v31 >> 6) & 0x3FF8)) = vorr_s8(*(int8x8_t *)(v30 + ((v31 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(1 << v32));
      *(_DWORD *)(v30 + 4 * (((v32 + 1) >> 4) & 0xFFE)) |= 1 << (v32 + 1);
    }
    if (malloc_zero_policy == 2)
    {
      _platform_memset();
    }
    else if (!malloc_zero_policy)
    {
      v33 = malloc_zero_on_free_sample_period;
      if (malloc_zero_on_free_sample_period)
      {
        v34 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v35 = *(_QWORD *)(v34 + 888);
        v36 = v35 + 1 == v33;
        v37 = v35 + 1 == v33 ? 0 : v35 + 1;
        *(_QWORD *)(v34 + 888) = v37;
        if (v36)
        {
          if (_platform_memcmp_zero_aligned8())
            tiny_zero_corruption_abort(v14);
        }
      }
    }
  }
  else
  {
    v21 = v14 & 0xFFFFFFFFFFF00000 | 0x4080;
    v22 = ((v14 - v21) >> 8) & 0xFFE;
    v23 = (int8x8_t *)((v14 & 0xFFFFFFFFFFF00000 | (8 * ((v22 >> 1) & 0x7FF))) + 40);
    v24 = 1 << ((v14 - v21) >> 4);
    if ((*(_DWORD *)((v14 & 0xFFFFFFFFFFF00000 | (8 * ((v22 >> 1) & 0x7FF))) + 0x28) & v24) == 0
      || (*(_DWORD *)((v14 & 0xFFFFFFFFFFF00000) + 4 * v22 + 0x2C) & v24) != 0)
    {
      goto LABEL_18;
    }
    v25 = v14 + 16 >= v21 + 1032064
       || ((*(_DWORD *)(((v14 + 16) & 0xFFFFFFFFFFF00000 | ((((v14 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v14 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0
        ? 1
        : *(unsigned __int16 *)(v14 + 16);
    if (v15 + v25 < v16)
      goto LABEL_18;
    tiny_free_list_remove_ptr(a1, v12, v14, v25);
    *v23 = vand_s8(*v23, (int8x8_t)vdup_n_s32(~v24));
    v43 = malloc_zero_policy;
    if (!malloc_zero_policy)
    {
      _tiny_check_and_zero_inline_meta_from_freelist(a1, v14, v25);
      v43 = malloc_zero_policy;
    }
    if (v43 == 2)
    {
      _platform_memset();
    }
    else if (!v43)
    {
      v44 = malloc_zero_on_free_sample_period;
      if (malloc_zero_on_free_sample_period)
      {
        v45 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        v46 = *(_QWORD *)(v45 + 888);
        v47 = v46 + 1 == v44;
        v48 = v46 + 1 == v44 ? 0 : v46 + 1;
        *(_QWORD *)(v45 + 888) = v48;
        if (v47)
        {
          if (_platform_memcmp_zero_aligned8())
            tiny_zero_corruption_abort(v14);
        }
      }
    }
    if (v25 != (unsigned __int16)v17)
      tiny_free_list_add_ptr(a1, v12, 16 * (unsigned __int16)v17 + v14, (unsigned __int16)(v25 - v17));
    set_tiny_meta_header_in_use(a2, v16);
  }
  v49 = 16 * (unsigned __int16)v17;
  *(_QWORD *)(v12 + 2152) += v49;
  LODWORD(v49) = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x10) + v49;
  *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x10) = v49;
  if (v49 >= 0xBCFA0)
    *(_BYTE *)((a2 & 0xFFFFFFFFFFF00000) + 0x20) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)v12);
  return 1;
}

void xzm_malloc_zone_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  _xzm_memalign(a1, a2, a3, *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904), 0);
}

mach_vm_address_t szone_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  unint64_t v11;
  int v12;

  if (a3 <= 1)
    a3 = 1;
  v3 = a3 + a2;
  if (__CFADD__(a3, a2))
    return 0;
  if (a2 <= 0x10)
    return szone_malloc_should_clear(a1, a3, 0);
  v5 = v3 - 1;
  if (v3 - 1 <= 0x3F0)
    return tiny_memalign(a1, a2, a3, v5);
  if (a2 <= 0x200 && a3 >= 0x3F1)
    return szone_malloc_should_clear(a1, a3, 0);
  if (a3 < 0x3F1)
  {
    a3 = 1024;
    v5 = a2 + 1023;
  }
  if (v5 <= 0x3C00)
    return small_memalign(a1, a2, a3, v5);
  if (a3 >= 0x3C01 && *MEMORY[0x1E0C88820] >= a2)
    return szone_malloc_should_clear(a1, a3, 0);
  v6 = 15361;
  if (a3 > 0x3C01)
    v6 = a3;
  v7 = *MEMORY[0x1E0C887F8];
  if (*MEMORY[0x1E0C887F8] <= *MEMORY[0x1E0C88810])
    v7 = *MEMORY[0x1E0C88810];
  v8 = (v7 + v6) & ~v7;
  v9 = *MEMORY[0x1E0C88800];
  v10 = *MEMORY[0x1E0C88818];
  if (*MEMORY[0x1E0C88800] <= *MEMORY[0x1E0C88818])
    LOBYTE(v9) = *MEMORY[0x1E0C88818];
  v11 = v8 >> v9;
  if (!v11)
    return 0;
  v12 = __clz(__rbit64(a2));
  if (v10 <= v12)
    LOBYTE(v10) = v12;
  return large_malloc(a1, v11, v10, 0);
}

uint64_t small_try_realloc_in_place(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v5;
  unsigned int v6;
  unint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int i;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  BOOL v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v26;
  unint64_t v27;
  unsigned __int16 v28;
  unint64_t v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  int v33;

  v5 = ((a2 + 8355328) >> 9) & 0x3FFF;
  v6 = v5 + (unsigned __int16)(a3 >> 9);
  if (v6 > 0x3FBE)
    return 0;
  v9 = a2 & 0xFFFFFFFFFF800000;
  v10 = *(_QWORD *)(a1 + 624);
  v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
  v12 = v10 + 2560 * v11;
  os_unfair_lock_lock_with_options();
  for (i = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18); v11 != i; i = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18))
  {
    v11 = i;
    os_unfair_lock_unlock((os_unfair_lock_t)v12);
    v12 = v10 + 2560 * v11;
    os_unfair_lock_lock_with_options();
  }
  if (v11 == -1)
  {
LABEL_14:
    os_unfair_lock_unlock((os_unfair_lock_t)v12);
    return 0;
  }
  v14 = v9 | 0x28;
  v15 = (unint64_t)(a4 + 511) >> 9;
  v16 = a2 + a3;
  v17 = (unsigned __int16)(a3 >> 9);
  v18 = (unsigned __int16)v15 - v17;
  if (*(_QWORD *)(v12 + 8) == a2 + a3
    && (v19 = *(unsigned __int16 *)(v12 + 16), v17 + v19 >= (unsigned __int16)v15))
  {
    if (v19 == (unsigned __int16)v18)
    {
      v26 = 0;
      *(_WORD *)(v12 + 16) = 0;
      *(_QWORD *)(v12 + 24) = 0;
    }
    else
    {
      v30 = v19 - v18;
      *(_WORD *)(v12 + 16) = v30;
      v26 = a2 + a4;
      *(_WORD *)(v14 + 2 * (unsigned __int16)(v5 + v15)) = v30;
    }
    *(_QWORD *)(v12 + 8) = v26;
    *(_WORD *)(v14 + 2 * v5) = v15;
    LOWORD(v15) = 0;
    v5 = (unsigned __int16)v6;
  }
  else if (*(_QWORD *)(v12 + 2144) == v9
         && ((v20 = *(_QWORD *)(v12 + 2128),
              (unsigned __int16)(v15 - v17) < (unsigned __int16)(v20 >> 9))
           ? (v21 = v9 - v20 + 0x800000 == v16)
           : (v21 = 0),
             v21))
  {
    *(_WORD *)(v14 + 2 * v5) = v15;
    *(_WORD *)(v14 + 2 * (unsigned __int16)v6) = 0;
    v27 = v20 - ((unsigned __int16)(v15 - v17) << 9);
    *(_QWORD *)(v12 + 2128) = v27;
    v28 = v5 + v15;
    v15 = v27 >> 9;
    v5 = v28;
  }
  else
  {
    v22 = *(__int16 *)(v14 + 2 * v6);
    if ((v22 & 0x80000000) == 0)
      goto LABEL_14;
    v23 = v22 & 0x7FFF;
    v24 = v17 + v23;
    if (v24 < (unsigned __int16)v15)
      goto LABEL_14;
    v32 = v24;
    v33 = v18;
    small_free_list_find_by_ptr(a1, v16, v22 & 0x7FFF);
    small_free_list_remove_ptr(a1, v12, v29, v23);
    *(_WORD *)(v14 + 2 * (unsigned __int16)v6) = 0;
    if (v32 != (_WORD)v15)
      small_free_list_add_ptr(a1, v12, a2 + ((unsigned __int16)v15 << 9), (unsigned __int16)(v32 - v15));
    v18 = v33;
  }
  *(_WORD *)(v14 + 2 * v5) = v15;
  *(_QWORD *)(v12 + 2152) += (v18 << 9);
  v31 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x10) + (v18 << 9);
  *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x10) = v31;
  if (v31 >= 0x5F9E80)
    *(_BYTE *)((a2 & 0xFFFFFFFFFF800000) + 0x20) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)v12);
  return 1;
}

uint64_t tiny_memalign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t should_clear;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  os_unfair_lock_s *v19;
  int v20;
  BOOL v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  os_unfair_lock_s *v28;
  int v29;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;

  v7 = a4 + 15;
  v8 = a1 + 16512;
  should_clear = tiny_malloc_should_clear(a1 + 16512, (unsigned __int16)((a4 + 15) >> 4), 0);
  v10 = should_clear;
  if (!should_clear)
    return v10;
  v34 = v8;
  v11 = v7 >> 4;
  if (((a2 - 1) & should_clear) != 0)
    v12 = a2 - ((a2 - 1) & should_clear);
  else
    v12 = 0;
  v13 = a3 + 15;
  v14 = (unint64_t)(a3 + 15) >> 4;
  v15 = (unsigned __int16)((v12 + 15) >> 4);
  v16 = v11 - (v14 + ((v12 + 15) >> 4));
  if (!(unsigned __int16)((v12 + 15) >> 4))
  {
    v22 = (unsigned __int16)(v11 - (v14 + ((v12 + 15) >> 4)));
    v24 = v8;
    if ((_WORD)v11 == (_WORD)v14 + (unsigned __int16)((v12 + 15) >> 4))
      return v10;
    goto LABEL_14;
  }
  v33 = v11 - (v14 + ((v12 + 15) >> 4));
  v31 = v12 + should_clear;
  v32 = a3 + 15;
  v17 = *(_QWORD *)(a1 + 17136);
  v18 = *(_DWORD *)((should_clear & 0xFFFFFFFFFFF00000) + 0x18);
  v19 = (os_unfair_lock_s *)(v17 + 2560 * v18);
  os_unfair_lock_lock_with_options();
  v20 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
  if (v20 != v18)
  {
    do
    {
      os_unfair_lock_unlock(v19);
      v19 = (os_unfair_lock_s *)(v17 + 2560 * v20);
      os_unfair_lock_lock_with_options();
      v21 = v20 == *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
      v20 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
    }
    while (!v21);
  }
  set_tiny_meta_header_in_use(v31, (unsigned __int16)v14);
  ++v19[542]._os_unfair_lock_opaque;
  LOWORD(v16) = v33;
  v22 = (unsigned __int16)v33;
  if ((_WORD)v33)
    *(_DWORD *)((v31 & 0xFFFFFFFFFFF00000 | ((v14 + (((v31 & 0xFFFFFuLL) - 16512) >> 4)) >> 2) & 0x3FF8) + 0x2C) |= 1 << (v14 + (((v31 & 0xFFFFFuLL) - 16512) >> 4));
  os_unfair_lock_unlock(v19);
  v23 = (16 * v15);
  v24 = v34;
  free_tiny(v34, v10, v10 & 0xFFFFFFFFFFF00000, v23, 1);
  v10 = v31;
  v13 = v32;
  if ((_WORD)v33)
  {
LABEL_14:
    v35 = v22;
    v25 = (*(_QWORD *)&v13 & 0xFFFF0) + v10;
    v26 = *(_QWORD *)(a1 + 17136);
    v27 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
    v28 = (os_unfair_lock_s *)(v26 + 2560 * v27);
    os_unfair_lock_lock_with_options();
    v29 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
    if (v29 != v27)
    {
      do
      {
        os_unfair_lock_unlock(v28);
        v28 = (os_unfair_lock_s *)(v26 + 2560 * v29);
        os_unfair_lock_lock_with_options();
        v21 = v29 == *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
        v29 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
      }
      while (!v21);
    }
    set_tiny_meta_header_in_use(v25, (unsigned __int16)v16);
    ++v28[542]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v28);
    free_tiny(v24, v25, v25 & 0xFFFFFFFFFFF00000, (16 * v35), 1);
  }
  return v10;
}

void _xzm_fork_lock_wait(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v1;

  v1 = a1 + 71;
  os_unfair_lock_lock_with_options();
  os_unfair_lock_unlock(v1);
}

uint64_t large_try_realloc_in_place(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8;
  os_unfair_lock_s *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  vm_size_t v13;
  uint64_t v14;
  _QWORD *v16;
  vm_address_t address;

  v8 = a2 + a3;
  address = a2 + a3;
  v9 = (os_unfair_lock_s *)(a1 + 18816);
  os_unfair_lock_lock_with_options();
  v10 = large_entry_for_pointer_no_lock(a1, v8);
  os_unfair_lock_unlock(v9);
  if (v10)
    return 0;
  v11 = *MEMORY[0x1E0C887F8];
  if (*MEMORY[0x1E0C887F8] <= *MEMORY[0x1E0C88810])
    v11 = *MEMORY[0x1E0C88810];
  v12 = (v11 + a4) & ~v11;
  v13 = v12 - a3;
  if (vm_allocate(*MEMORY[0x1E0C883F0], &address, v13, 100663296))
    return 0;
  os_unfair_lock_lock_with_options();
  v16 = large_entry_for_pointer_no_lock(a1, a2);
  if (v16)
  {
    *v16 = a2;
    v16[1] = v12;
    *(_QWORD *)(a1 + 18840) += v13;
    v14 = 1;
  }
  else
  {
    malloc_zone_error(*(_DWORD *)(a1 + 16392), 1, (uint64_t)"large entry %p reallocated is not properly in table\n");
    v14 = 0;
  }
  os_unfair_lock_unlock(v9);
  return v14;
}

uint64_t xzm_segment_group_try_realloc_large_chunk(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unsigned int v7;
  unsigned int v9;
  uint64_t v10;
  char v11;
  _BYTE *v12;
  char v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  uint64_t v27;

  v7 = *(_DWORD *)(a3 + 40);
  if (v7 >= a4)
  {
    if (v7 > a4)
    {
      os_unfair_lock_lock_with_options();
      v16 = *(_DWORD *)(a3 + 40) - a4;
      *(_DWORD *)(a3 + 40) = a4;
      v17 = a3 + 48 * (a4 - 1);
      *(_BYTE *)(v17 + 32) = *(_BYTE *)(v17 + 32) & 0xF0 | 4;
      *(_DWORD *)(v17 + 36) = 48 * (a4 - 1);
      if (v16 >= 2)
        v18 = 6;
      else
        v18 = 2;
      _xzm_segment_group_segment_span_mark_allocated(a3 & 0xFFFFFFFFFFFFC000, v18, -1431655765 * ((a3 + 48 * a4 - (a3 & 0xFFFFFFFFFFFFC000) - 2104) >> 4), v16);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
      xzm_segment_group_free_chunk((unsigned __int8 *)a1, a3 + 48 * a4, 0);
    }
    return 1;
  }
  os_unfair_lock_lock_with_options();
  v9 = *(_DWORD *)(a3 + 40);
  if (a3 + 48 * (unint64_t)v9 < a2 + 48 * (unint64_t)*(unsigned int *)(a2 + 16) + 2104)
  {
    v10 = a3 + 48 * v9;
    v13 = *(_BYTE *)(v10 + 32);
    v12 = (_BYTE *)(v10 + 32);
    v11 = v13;
    if ((v13 & 0xD) == 1)
    {
      v14 = a4 - v9;
      v15 = v11 & 0xF;
      if (v15 != 1)
        v15 = *(_DWORD *)(a3 + 48 * v9 + 40);
      if (v15 >= v14)
      {
        switch(*(_BYTE *)a1)
        {
          case 0:
          case 2:
            if (((*(unsigned __int8 *)(*(_QWORD *)(a1 + 24) + 328) >> 2) & 1) == 0)
              goto LABEL_18;
            goto LABEL_17;
          case 1:
          case 3:
            if ((*(_BYTE *)(*(_QWORD *)(a1 + 24) + 328) & 8) == 0)
              goto LABEL_18;
LABEL_17:
            if ((_xzm_segment_group_span_mark_used(a1, a3 + 48 * v9) & 1) == 0)
              goto LABEL_20;
LABEL_18:
            v20 = a3 + 48 * v9;
            v23 = *(_QWORD *)(v20 + 16);
            v21 = (uint64_t *)(v20 + 16);
            v22 = v23;
            if (v23)
            {
              *(_QWORD *)(v22 + 24) = *(_QWORD *)(a3 + 48 * v9 + 24);
              v24 = *v21;
            }
            else
            {
              v24 = 0;
            }
            **(_QWORD **)(a3 + 48 * v9 + 24) = v24;
            v25 = *v12 & 0xF;
            if (v25 != 1)
              v25 = *(_DWORD *)(a3 + 48 * v9 + 40);
            if (v25 > v14)
              _xzm_segment_group_segment_slice_split(a1, a2, a3 + 48 * v9, a4 - v9, 0);
            if (a4 != v9)
            {
              v26 = 48 * v9;
              v27 = a3 + 48 * v9 + 32;
              do
              {
                *(_BYTE *)v27 = *(_BYTE *)v27 & 0xF0 | 4;
                *(_DWORD *)(v27 + 4) = v26;
                v26 += 48;
                v27 += 48;
                --v14;
              }
              while (v14);
            }
            *(_DWORD *)(a3 + 40) = a4;
            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
            break;
          default:
            _xzm_segment_group_find_and_allocate_chunk_cold_1(*(_BYTE *)a1);
        }
        return 1;
      }
    }
  }
LABEL_20:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
  return 0;
}

void malloc_zone_error(__int16 a1, char a2, uint64_t a3)
{
  char v3;
  unsigned int v4;
  unsigned int v5;

  v3 = a2 ^ 1;
  if ((a1 & 0x100) == 0)
    v3 = 1;
  if ((((a1 & 0x40) == 0) & v3) != 0)
    v4 = 147;
  else
    v4 = 67;
  if (malloc_error_sleep)
    v5 = 3600;
  else
    v5 = 0;
  malloc_vreport(v4, v5, 0, 0, a3);
}

int malloc_make_nonpurgeable(void *ptr)
{
  uint64_t (**registered_purgeable_zone)(void *, _QWORD);
  int v4;

  registered_purgeable_zone = find_registered_purgeable_zone((uint64_t)ptr);
  if (registered_purgeable_zone)
  {
    v4 = 0;
    MEMORY[0x19401F858](*MEMORY[0x1E0C883F0], ptr, 0, &v4);
    if (v4 == 2)
      LODWORD(registered_purgeable_zone) = 14;
    else
      LODWORD(registered_purgeable_zone) = 0;
  }
  return (int)registered_purgeable_zone;
}

void malloc_make_purgeable(void *ptr)
{
  int v2;

  if (find_registered_purgeable_zone((uint64_t)ptr))
  {
    v2 = 1;
    MEMORY[0x19401F858](*MEMORY[0x1E0C883F0], ptr, 0, &v2);
  }
}

uint64_t (**find_registered_purgeable_zone(uint64_t a1))(void *, _QWORD)
{
  uint64_t (**result)(void *, _QWORD);
  uint64_t v3;
  unint64_t v4;
  uint64_t (**v5)(void *, _QWORD);
  uint64_t v6;
  uint64_t v7;
  int32_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = 0;
  if (!a1 || !malloc_num_zones)
    return result;
  if (lite_zone)
  {
    v3 = (*(uint64_t (**)(void))(lite_zone + 16))();
    if (v3)
    {
      v4 = v3;
      goto LABEL_6;
    }
  }
  if (initial_num_zones)
  {
    v6 = 0;
    while (1)
    {
      v5 = (uint64_t (**)(void *, _QWORD))*((_QWORD *)malloc_zones + v6);
      v7 = v5[2](v5, a1);
      if (v7)
        break;
      if (++v6 >= (unint64_t)initial_num_zones)
        goto LABEL_12;
    }
    v4 = v7;
    if (!v6 && (has_injected_zone0 & 1) == 0)
    {
LABEL_6:
      v5 = (uint64_t (**)(void *, _QWORD))default_zone;
      if (!default_zone)
        return 0;
    }
  }
  else
  {
LABEL_12:
    v8 = (int32_t *)pFRZCounterLive;
    OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
    v9 = malloc_num_zones;
    v10 = initial_num_zones;
    if (initial_num_zones >= malloc_num_zones)
    {
LABEL_15:
      v5 = 0;
      v4 = 0;
    }
    else
    {
      while (1)
      {
        v5 = (uint64_t (**)(void *, _QWORD))*((_QWORD *)malloc_zones + v10);
        v11 = v5[2](v5, a1);
        if (v11)
          break;
        if (v9 == ++v10)
          goto LABEL_15;
      }
      v4 = v11;
    }
    OSAtomicDecrement32Barrier(v8);
    if (!v5)
      return 0;
  }
  if (v4 < *MEMORY[0x1E0C88820])
    return 0;
  if (v4 % *MEMORY[0x1E0C88820])
    return 0;
  else
    return v5;
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  BOOL v6;
  void *registered_zone;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t (*v12)(void);
  void *v13;

  if (malloc_logger)
    v6 = 0;
  else
    v6 = malloc_slowpath == 0;
  if (!v6 || malloc_absolute_max_size < size)
    return (void *)_malloc_type_realloc_outlined(ptr, size, type_id);
  if (ptr && size)
  {
    registered_zone = find_registered_zone((uint64_t)ptr, 0, 0);
    if (!registered_zone)
      return (void *)_realloc(ptr, size);
    if (registered_zone == default_zone)
      registered_zone = *(void **)malloc_zones;
    if (*((_DWORD *)registered_zone + 26) >= 0x10u)
    {
      v9 = (*((uint64_t (**)(void *, void *, size_t, malloc_type_id_t))registered_zone + 22))(registered_zone, ptr, size, type_id);
      goto LABEL_24;
    }
    v12 = (uint64_t (*)(void))*((_QWORD *)registered_zone + 7);
LABEL_22:
    v9 = v12();
    goto LABEL_24;
  }
  v10 = *(_QWORD *)malloc_zones;
  v11 = *(_DWORD *)(*(_QWORD *)malloc_zones + 104);
  if (v11 >= 0x10)
  {
    v12 = *(uint64_t (**)(void))(v10 + 160);
    goto LABEL_22;
  }
  if (v11 > 0xC)
    v9 = (*(uint64_t (**)(uint64_t, size_t))(v10 + 24))(v10, size);
  else
    v9 = _malloc_type_malloc_outlined(size, type_id, 0);
LABEL_24:
  v13 = (void *)v9;
  if (v9)
  {
    if (!size)
      _free(ptr);
  }
  else
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  }
  return v13;
}

uint64_t _xzm_ptr_size_outlined(uint64_t a1, unint64_t a2)
{
  if (*(_QWORD *)(a1 + 232) || !mfm_claimed_address(a2))
    return 0;
  else
    return mfm_alloc_size(a2);
}

void _xzm_free_outlined(uint64_t a1, void *a2, char a3)
{
  if (*(_QWORD *)(a1 + 232) || !mfm_claimed_address((unint64_t)a2))
  {
    if ((a3 & 1) != 0)
    {
      find_zone_and_free(a2, 1u);
    }
    else
    {
      qword_1EE228008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: pointer being freed was not allocated";
      qword_1EE228038 = (uint64_t)a2;
      __break(1u);
    }
  }
  else
  {
    mfm_free(a2);
  }
}

BOOL mfm_claimed_address(unint64_t a1)
{
  BOOL v1;

  if (mfm_arena)
    v1 = mfm_arena + 0x20000 > a1;
  else
    v1 = 1;
  return !v1 && mfm_arena + 0x800000 > a1;
}

uint64_t mfm_alloc_size(unint64_t a1)
{
  unint64_t v1;
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v1 = mfm_arena + 0x20000;
  if (mfm_arena)
    v2 = v1 > a1;
  else
    v2 = 1;
  if (v2)
    return 0;
  v3 = 0;
  if ((a1 & 0xF) == 0 && mfm_arena + 0x800000 > a1)
  {
    v4 = (uint64_t)(a1 - v1) >> 4;
    if ((*(_QWORD *)(mfm_arena + 224 + ((v4 >> 2) & 0x3FFFFFFFFFFFFFF0)) & (1 << v4) & *(_QWORD *)(mfm_arena + 224 + ((v4 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8))) != 0)
    {
      v5 = v4 + 1;
      v6 = v5 >> 5;
      v7 = (v5 >> 5) & 0x7FFFFFFFFFFFFFELL;
      v8 = mfm_arena + 8 * v7;
      v9 = *(_QWORD *)(v8 + 224) >> v5;
      if (v9)
      {
        v10 = __clz(__rbit64(v9));
      }
      else
      {
        v13 = v5 & 0x3F;
        v14 = *(_QWORD *)(v8 + 240);
        if (v14)
        {
          v11 = __clz(__rbit64(v14)) - v13 + 65;
          return 16 * v11;
        }
        v15 = *(_QWORD *)(mfm_arena + ((8 * v6) | 8) + 224);
        if (v13 < 0x2E)
          LODWORD(v16) = 0;
        else
          v16 = *(_QWORD *)(mfm_arena + 8 * v7 + 248);
        v10 = ((v15 >> v13) | ((unint64_t)(2 * v16) << (v13 ^ 0x3Fu))) & 0x7FFFF;
      }
      v11 = v10 + 1;
      return 16 * v11;
    }
    return 0;
  }
  return v3;
}

uint64_t _malloc_type_zone_malloc_outlined(malloc_zone_t *a1, size_t a2, unint64_t a3)
{
  unint64_t StatusReg;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v4 = *(_QWORD *)(StatusReg + 904);
  if (a3 <= 1)
    v5 = 1;
  else
    v5 = a3;
  *(_QWORD *)(StatusReg + 904) = v5;
  if (malloc_interposition_compat)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
    result = (uint64_t)j__malloc_zone_malloc(a1, a2);
  else
    result = _malloc_zone_malloc((uint64_t)a1, a2, 0);
  *(_QWORD *)(StatusReg + 904) = v4;
  return result;
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  BOOL v5;
  BOOL v6;
  uint8x8_t v7;
  uint64_t v9;
  void *v10;
  int result;

  if (malloc_logger)
    v5 = 0;
  else
    v5 = malloc_slowpath == 0;
  v6 = v5 && malloc_absolute_max_size >= size;
  if (!v6 || alignment < 8)
    return _malloc_type_posix_memalign_outlined(memptr, alignment, size, type_id);
  v7 = (uint8x8_t)vcnt_s8((int8x8_t)alignment);
  v7.i16[0] = vaddlv_u8(v7);
  if (*(_DWORD *)(*(_QWORD *)malloc_zones + 104) < 0x10u || v7.u32[0] > 1uLL)
    return _malloc_type_posix_memalign_outlined(memptr, alignment, size, type_id);
  v9 = (*(uint64_t (**)(void))(*(_QWORD *)malloc_zones + 184))();
  if (!v9)
    return 12;
  v10 = (void *)v9;
  result = 0;
  *memptr = v10;
  return result;
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  void *v4;
  void *v5;

  v4 = j__realloc(__ptr, __size);
  v5 = v4;
  if (__size && __ptr && !v4)
    j__free(__ptr);
  return v5;
}

void xzm_malloc_inline(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  if (a2 > 0x8000)
  {
    _xzm_malloc_large_huge(a1, a2, 0, a3, a4);
    return;
  }
  if (*(_QWORD *)(a1 + 232))
    v4 = *(_QWORD *)(a1 + 232);
  else
    v4 = a1;
  v5 = __clz(a2 - 1);
  v6 = (((a2 - 1) >> (61 - v5)) & 3) - 4 * v5 + 488;
  if (a2 <= 0x80)
    v6 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
  if (!a2)
    LOBYTE(v6) = 0;
  v7 = v6;
  v8 = *(_BYTE *)(*(_QWORD *)(v4 + 368) + v6);
  if (HIWORD(a3) == 256)
  {
    v9 = 0;
  }
  else
  {
    if ((a3 & 0xC0000000000) != 0x40000000000)
    {
      ((void (*)(void))((char *)&loc_191D6A958 + 4
                                               * byte_191D9E9E4[*(unsigned __int8 *)(*(_QWORD *)(v4 + 360) + v7) - 3]))();
      return;
    }
    v9 = 1;
  }
  _xzm_xzone_malloc(a1, a2, (v9 + v8), a4);
}

uint64_t _malloc_zone_malloc(uint64_t a1, unint64_t a2, char a3)
{
  BOOL v4;
  unsigned int v5;

  if (default_zone == (_UNKNOWN *)a1 && lite_zone == 0)
    a1 = *(_QWORD *)malloc_zones;
  if (malloc_slowpath)
    v4 = 0;
  else
    v4 = malloc_logger == 0;
  if (!v4)
    return _malloc_zone_malloc_instrumented_or_legacy(a1, a2, a3);
  v5 = *(_DWORD *)(a1 + 104);
  if (v5 <= 0xC)
    return _malloc_zone_malloc_instrumented_or_legacy(a1, a2, a3);
  if (malloc_absolute_max_size < a2)
  {
    if ((a3 & 1) != 0)
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
    return 0;
  }
  else if (v5 < 0x10)
  {
    return (*(uint64_t (**)(void))(a1 + 24))();
  }
  else
  {
    return (*(uint64_t (**)(void))(a1 + 160))();
  }
}

uint64_t _realloc(void *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t (**v5)(void *, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int32_t *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;

  if (!a1)
    return _malloc_zone_malloc((uint64_t)default_zone, a2, 1);
  if (a2)
  {
    if (!malloc_num_zones)
    {
LABEL_20:
      if ((malloc_debug_flags & 0x140) != 0)
        v13 = 80;
      else
        v13 = 144;
      malloc_report(v13, (uint64_t)"*** error for object %p: pointer being realloc'd was not allocated\n");
      goto LABEL_27;
    }
    if (!lite_zone || !(*(uint64_t (**)(void))(lite_zone + 16))())
    {
      if (!initial_num_zones)
      {
LABEL_15:
        v10 = (int32_t *)pFRZCounterLive;
        OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
        v11 = malloc_num_zones;
        v12 = initial_num_zones;
        if (initial_num_zones >= malloc_num_zones)
        {
LABEL_18:
          v5 = 0;
        }
        else
        {
          while (1)
          {
            v5 = (uint64_t (**)(void *, void *))*((_QWORD *)malloc_zones + v12);
            if (v5[2](v5, a1))
              break;
            if (v11 == ++v12)
              goto LABEL_18;
          }
        }
        OSAtomicDecrement32Barrier(v10);
        if (!v5)
          goto LABEL_20;
        goto LABEL_26;
      }
      v9 = 0;
      while (1)
      {
        v5 = (uint64_t (**)(void *, void *))*((_QWORD *)malloc_zones + v9);
        if (v5[2](v5, a1))
          break;
        if (++v9 >= (unint64_t)initial_num_zones)
          goto LABEL_15;
      }
      if (v9 || (has_injected_zone0 & 1) != 0)
        goto LABEL_26;
    }
    v5 = (uint64_t (**)(void *, void *))default_zone;
    if (!default_zone)
      goto LABEL_20;
LABEL_26:
    v8 = _malloc_zone_realloc((uint64_t)v5, (uint64_t)a1, a2, (v2 >> 2));
    if (!v8)
      goto LABEL_27;
    return v8;
  }
  v7 = _malloc_zone_malloc((uint64_t)default_zone, 0, 0);
  if (!v7)
  {
LABEL_27:
    v8 = 0;
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
    return v8;
  }
  v8 = v7;
  _free(a1);
  return v8;
}

uint64_t _malloc_zone_realloc(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t StatusReg;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v8 = *(_QWORD *)(StatusReg + 904);
  v9 = v8;
  if (!v8)
  {
    *(_QWORD *)(StatusReg + 904) = a4;
    v9 = a4;
  }
  v10 = malloc_tracing_enabled;
  if (malloc_tracing_enabled)
    kdebug_trace();
  if (malloc_check_start)
    internal_check();
  if (malloc_absolute_max_size < a3)
  {
    v11 = 0;
    if (!v8)
      goto LABEL_15;
    return v11;
  }
  v11 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 56))(a1, a2, a3, a4, v9);
  if (malloc_logger)
    malloc_logger(14, a1, a2, a3, v11, 0);
  if (malloc_simple_stack_logging != 1)
  {
    if (!v10)
      goto LABEL_14;
LABEL_18:
    kdebug_trace();
    if (v8)
      return v11;
    goto LABEL_15;
  }
  malloc_report(0x325u, (uint64_t)"realloc (%p->%p/%llu): ");
  if (v10)
    goto LABEL_18;
LABEL_14:
  if (!v8)
LABEL_15:
    *(_QWORD *)(StatusReg + 904) = 0;
  return v11;
}

uint64_t default_zone_realloc()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(v0 + 56))();
}

uint64_t *mfm_alloc(unint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v1 = mfm_arena;
  if (a1 > 0x4000)
    return 0;
  if (a1)
  {
    if ((a1 & 0xF) != 0)
      v3 = (a1 >> 4) + 1;
    else
      v3 = a1 >> 4;
    os_unfair_lock_lock_with_options();
    LODWORD(v4) = 64 - __clz(v3 - 1);
    if (v4 >= 0xA)
      v4 = 10;
    else
      v4 = v4;
    if (v3 < 2)
    {
      v3 = 1;
      v4 = 0;
    }
  }
  else
  {
    os_unfair_lock_lock_with_options();
    v4 = 0;
    v3 = 1;
  }
  v5 = v1 + 32;
  v6 = 16 * v4;
  while (1)
  {
    v7 = *(_QWORD *)(v5 + v6);
    v2 = (uint64_t *)(v1 + 16 * v7);
    if ((uint64_t *)(v5 + v6) != v2)
      break;
    v6 += 16;
    if (v6 == 176)
    {
      v8 = mfm_arena;
      v9 = *(_QWORD *)(mfm_arena + 8);
      if (v3 >= 516096 - v9)
      {
        v2 = 0;
      }
      else
      {
        v10 = v9 + v3;
        *(_QWORD *)(v1 + 16 * ((v9 + v3) >> 6) + 224) |= 1 << (v9 + v3);
        if (v3 > 0x3F)
        {
          __mfm_block_set_sizes(v1, 1, v9, v3);
          v8 = mfm_arena;
          v10 = *(_QWORD *)(mfm_arena + 8) + v3;
        }
        else
        {
          v11 = v1 + 224;
          *(_QWORD *)(v11 + ((v9 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(_QWORD *)(v1
                                                                                + 224
                                                                                + ((v9 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) | (1 << v9);
          *(_QWORD *)(v11 + (((v3 + v9 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(_QWORD *)(v1
                                                                                           + 224
                                                                                           + (((v3 + v9 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) | (1 << (v3 + v9 - 1));
        }
        *(_QWORD *)(v8 + 8) = v10;
        *(_DWORD *)(v1 + 4) += v3;
        ++*(_QWORD *)(v1 + 24);
        v2 = (uint64_t *)(v1 + 16 * v9 + 0x20000);
        if (*(_QWORD *)(v8 + 16) < v10)
          *(_QWORD *)(v8 + 16) = v10;
      }
      goto LABEL_31;
    }
  }
  v12 = 16 * v7;
  v13 = *v2;
  v14 = v2[1];
  *(_QWORD *)(v1 + 16 * *v2 + 8) = v14;
  *(_QWORD *)(v1 + 16 * v14) = v13;
  *v2 = 0;
  v2[1] = 0;
  v15 = v12 - 0x20000;
  v16 = (v12 - 0x20000) >> 4;
  v17 = (v16 + 1) >> 5;
  v18 = v17 & 0x7FFFFFFFFFFFFFELL;
  v19 = v1 + 8 * (v17 & 0x7FFFFFFFFFFFFFELL);
  v20 = *(_QWORD *)(v19 + 224) >> (v16 + 1);
  if (v20)
  {
    v21 = __clz(__rbit64(v20));
LABEL_24:
    v22 = v21 + 1;
    goto LABEL_25;
  }
  v25 = ((_BYTE)v16 + 1) & 0x3F;
  v26 = *(_QWORD *)(v19 + 240);
  if (!v26)
  {
    v27 = *(_QWORD *)(v1 + ((8 * v17) | 8) + 224);
    if (v25 < 0x2E)
      LODWORD(v28) = 0;
    else
      v28 = *(_QWORD *)(v1 + 8 * v18 + 248);
    v21 = ((v27 >> v25) | ((unint64_t)(2 * v28) << (v25 ^ 0x3Fu))) & 0x7FFFF;
    goto LABEL_24;
  }
  v22 = __clz(__rbit64(v26)) - v25 + 65;
LABEL_25:
  if (v22 > v3)
  {
    *(_QWORD *)(v1 + 16 * ((v16 + v3) >> 6) + 224) |= 1 << (v16 + v3);
    __mfm_free_block(v1, v16 + v3, v22 - v3);
  }
  if (v3 > 0x3F)
  {
    __mfm_block_set_sizes(v1, 1, v16, v3);
  }
  else
  {
    v23 = v1 + 224;
    *(_QWORD *)(v23 + ((v16 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(_QWORD *)(v1
                                                                           + 224
                                                                           + ((v16 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) | (1 << (v15 >> 4));
    *(_QWORD *)(v23 + (((v3 + v16 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(_QWORD *)(v1
                                                                                      + 224
                                                                                      + (((v3 + v16 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) | (1 << (v3 + v16 - 1));
  }
  *(_DWORD *)(v1 + 4) += v3;
  ++*(_QWORD *)(v1 + 24);
LABEL_31:
  os_unfair_lock_unlock((os_unfair_lock_t)v1);
  return v2;
}

void xzm_malloc_zone_realloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  xzm_realloc(a1, a2, a3, *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904));
}

void mfm_free(void *a1)
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  unint64_t v59;

  v2 = mfm_arena;
  v3 = mfm_arena + 0x20000;
  if (mfm_arena)
    v4 = v3 > (unint64_t)a1;
  else
    v4 = 1;
  if (v4 || mfm_arena + 0x800000 <= (unint64_t)a1)
    mfm_free_cold_4((uint64_t)a1);
  if ((a1 & 0xF) != 0)
    mfm_free_cold_3((uint64_t)a1);
  v6 = (uint64_t)((uint64_t)a1 - v3) >> 4;
  v7 = mfm_arena + 224;
  v8 = (v6 >> 5) | 1;
  if ((*(_QWORD *)(mfm_arena + 224 + 8 * ((v6 >> 5) & 0x7FFFFFFFFFFFFFELL)) & *(_QWORD *)(mfm_arena + 224 + 8 * v8) & (1 << v6)) == 0)
    mfm_free_cold_1((uint64_t)a1);
  v9 = (v6 + 1) & 0x3F;
  v10 = (v6 + 1) >> 5;
  v11 = v10 & 0x7FFFFFFFFFFFFFELL;
  v12 = mfm_arena + 8 * (v10 & 0x7FFFFFFFFFFFFFELL);
  v14 = *(_QWORD *)(v12 + 224);
  v13 = (_QWORD *)(v12 + 224);
  v15 = v14 >> (v6 + 1);
  if (v15)
  {
    v16 = __clz(__rbit64(v15));
  }
  else
  {
    v47 = *(_QWORD *)(mfm_arena + 8 * (v10 & 0x7FFFFFFFFFFFFFELL) + 240);
    if (v47)
    {
      v17 = __clz(__rbit64(v47)) - v9 + 65;
      goto LABEL_14;
    }
    if (v9 < 0x2E)
      LODWORD(v52) = 0;
    else
      v52 = *(_QWORD *)(mfm_arena + 8 * v11 + 248);
    v16 = ((*(_QWORD *)(mfm_arena + ((8 * v10) | 8) + 224) >> v9) | ((unint64_t)(2 * v52) << (v9 ^ 0x3Fu))) & 0x7FFFF;
  }
  v17 = v16 + 1;
LABEL_14:
  bzero(a1, 16 * v17);
  os_unfair_lock_lock_with_options();
  v19 = 1 << v6;
  v18 = (v6 >> 5) & 0x7FFFFFFFFFFFFFELL;
  v20 = *(_QWORD *)(v7 + 8 * v18);
  if ((v20 & *(_QWORD *)(v7 + 8 * v8) & (1 << v6)) == 0
    || ((v21 = *v13 >> v9) == 0
      ? ((v48 = *(_QWORD *)(v2 + 8 * v11 + 240)) == 0
       ? (v9 < 0x2E ? (LODWORD(v53) = 0) : (v53 = *(_QWORD *)(v2 + 8 * v11 + 248)),
          v22 = (((*(_QWORD *)(v2 + ((8 * v10) | 8) + 224) >> v9) | ((unint64_t)(2 * v53) << (v9 ^ 0x3Fu))) & 0x7FFFF)
              + 1,
          v19 = 1 << v6,
          v18 = (v6 >> 5) & 0x7FFFFFFFFFFFFFELL)
       : (v22 = __clz(__rbit64(v48)) - v9 + 65))
      : (v22 = __clz(__rbit64(v21)) + 1),
        v17 != v22))
  {
    mfm_free_cold_2((uint64_t)a1);
  }
  *(_DWORD *)(v2 + 4) -= v17;
  --*(_QWORD *)(v2 + 24);
  v23 = (uint64_t)(v6 - 1) >> 5;
  v24 = *(_QWORD *)(v7 + ((8 * v23) | 8));
  if (((v24 >> (v6 - 1)) & 1) == 0)
  {
    v25 = ((_BYTE)v6 - 1) & 0x3F;
    v26 = v23 & 0xFFFFFFFFFFFFFFFELL;
    v27 = v2 + 8 * v26;
    v28 = *(_QWORD *)(v27 + 224) << (v25 ^ 0x3Fu);
    if (v28)
    {
      v29 = __clz(v28) + 1;
    }
    else
    {
      v49 = *(_QWORD *)(v27 + 208);
      if (v49)
      {
        v29 = v25 + __clz(v49) + 2;
      }
      else
      {
        if (v25 > 0x12)
          v54 = 0;
        else
          v54 = *(_QWORD *)(v2 + 8 * v26 + 216);
        v57 = v25 + 45;
        v58 = ((2 * v24) << ~v57) | (v54 >> v57);
        v59 = v24 >> v57;
        if ((v57 & 0x40) == 0)
          LODWORD(v59) = v58;
        v29 = (v59 & 0x7FFFF) + 1;
        v19 = 1 << v6;
        v18 = (v6 >> 5) & 0x7FFFFFFFFFFFFFELL;
      }
    }
    v6 -= v29;
    *(_QWORD *)(v2 + 8 * v18 + 224) = v20 & ~v19;
    v30 = (uint64_t *)(v2 + 16 * v6 + 0x20000);
    v31 = *v30;
    v32 = *(_QWORD *)(v2 + 16 * v6 + 131080);
    *(_QWORD *)(v2 + 16 * *v30 + 8) = v32;
    *(_QWORD *)(v2 + 16 * v32) = v31;
    *v30 = 0;
    v30[1] = 0;
    v17 += v29;
  }
  v33 = v6 + v17;
  v34 = *(_QWORD *)(v2 + 8);
  if (v6 + v17 < v34)
  {
    v35 = (v33 >> 5) & 0x7FFFFFFFFFFFFFELL;
    v36 = *(_QWORD *)(v7 + 8 * v35);
    if ((v36 & (1 << v33) & *(_QWORD *)(v7 + ((8 * (v33 >> 5)) | 8))) == 0)
    {
      v37 = (v33 + 1) >> 5;
      v38 = v37 & 0x7FFFFFFFFFFFFFELL;
      v39 = v2 + 8 * (v37 & 0x7FFFFFFFFFFFFFELL);
      v40 = *(_QWORD *)(v39 + 224) >> (v33 + 1);
      if (v40)
      {
        v41 = __clz(__rbit64(v40));
      }
      else
      {
        v50 = ((_BYTE)v33 + 1) & 0x3F;
        v51 = *(_QWORD *)(v39 + 240);
        if (v51)
        {
          v42 = __clz(__rbit64(v51)) - v50 + 65;
          goto LABEL_27;
        }
        v55 = *(_QWORD *)(v2 + ((8 * v37) | 8) + 224);
        if (v50 < 0x2E)
          LODWORD(v56) = 0;
        else
          v56 = *(_QWORD *)(v2 + 8 * v38 + 248);
        v41 = ((v55 >> v50) | ((unint64_t)(2 * v56) << (v50 ^ 0x3Fu))) & 0x7FFFF;
      }
      v42 = v41 + 1;
LABEL_27:
      *(_QWORD *)(v2 + 8 * v35 + 224) = v36 & ~(1 << v33);
      v43 = (_QWORD *)(v2 + 16 * v33 + 0x20000);
      v44 = v43[1];
      v45 = v2 + 16 * *v43;
      *(_QWORD *)(v2 + 16 * v44) = *v43;
      *(_QWORD *)(v45 + 8) = v44;
      *v43 = 0;
      v43[1] = 0;
      v17 += v42;
      v34 = *(_QWORD *)(v2 + 8);
      v33 = v17 + v6;
    }
  }
  if (v33 == v34)
  {
    *(_QWORD *)(v2 + 16 * (v34 >> 6) + 224) &= ~(1 << v34);
    if (v17 > 0x3F)
    {
      __mfm_block_set_sizes(v2, 0, v6, v17);
    }
    else
    {
      v46 = v2 + 224;
      *(_QWORD *)(v46 + ((v6 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(_QWORD *)(v2
                                                                            + 224
                                                                            + ((v6 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) & ~(1 << v6);
      *(_QWORD *)(v46 + (((v6 + v17 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(_QWORD *)(v2
                                                                                        + 224
                                                                                        + (((v6 + v17 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) & ~(1 << (v6 + v17 - 1));
    }
    *(_QWORD *)(v2 + 8) = v6;
  }
  else
  {
    __mfm_free_block(v2, v6, v17);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v2);
}

uint64_t __mfm_free_block(uint64_t result, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v3 = a2 & 0x3F;
  if (a3 > 0x3F)
  {
    v10 = a3 - 1;
    *(_QWORD *)(result + ((8 * (a2 >> 5)) | 8) + 224) = *(_QWORD *)(result + ((8 * (a2 >> 5)) | 8) + 224) & ~(0xFFFFFLL << v3) | ((2 * (a3 - 1)) << v3);
    if (v3 >= 0x2D)
      *(_QWORD *)(result + 8 * ((a2 >> 5) & 0x7FFFFFFFFFFFFFELL) + 248) = *(_QWORD *)(result
                                                                                    + 8
                                                                                    * ((a2 >> 5) & 0x7FFFFFFFFFFFFFELL)
                                                                                    + 248) & ~(0x7FFFFuLL >> (v3 ^ 0x3Fu)) | ((v10 & 0x7FFFFFFFFFFFFFFFLL) >> (v3 ^ 0x3Fu));
    v11 = (v10 + a2) >> 6;
    v12 = (v10 + a2) & 0x3F;
    v13 = 0xFFFFFLL << (v12 + 45);
    v14 = 0x7FFFFuLL >> ~(v12 + 45);
    if (((v12 + 45) & 0x40) != 0)
    {
      v14 = 0xFFFFFLL << (v12 + 45);
      v13 = 0;
    }
    v15 = v10 << (v12 + 45);
    v16 = v10 >> 1 >> ~(v12 + 45);
    if (((v12 + 45) & 0x40) != 0)
    {
      v16 = v15;
      v15 = 0;
    }
    if (v12 >= 0x13)
    {
      v17 = 2 * v11;
    }
    else
    {
      v17 = 2 * v11;
      *(_QWORD *)(result + 16 * v11 + 216) = *(_QWORD *)(result + 16 * v11 + 216) & ~v13 | v15;
    }
    *(_QWORD *)(result + ((8 * v17) | 8) + 224) = *(_QWORD *)(result + ((8 * v17) | 8) + 224) & ~v14 | v16;
  }
  else
  {
    v4 = result + 224;
    *(_QWORD *)(v4 + ((a2 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(_QWORD *)(result
                                                                         + 224
                                                                         + ((a2 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) & ~(1 << v3);
    *(_QWORD *)(v4 + (((a3 + a2 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(_QWORD *)(result
                                                                                    + 224
                                                                                    + (((a3 + a2 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) & ~(1 << (a3 + a2 - 1));
  }
  LODWORD(v5) = 63 - __clz(a3);
  if (v5 >= 0xA)
    v5 = 10;
  else
    v5 = v5;
  v6 = result + 16 * v5;
  v7 = 16 * a2 + 0x20000;
  v8 = (_QWORD *)(v7 + result);
  v9 = *(_QWORD *)(v6 + 32);
  v7 >>= 4;
  *v8 = v9;
  v8[1] = v5 + 2;
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(result + 16 * v9 + 8) = v7;
  return result;
}

uint64_t tiny_try_shrink_in_place(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned __int16 v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  os_unfair_lock_s *v10;
  int v11;
  BOOL v12;

  v5 = (a3 >> 4) - (a4 >> 4);
  if (v5)
  {
    v7 = (a4 & 0xFFFF0) + a2;
    v8 = *(_QWORD *)(a1 + 624);
    v9 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
    v10 = (os_unfair_lock_s *)(v8 + 2560 * v9);
    os_unfair_lock_lock_with_options();
    v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
    if (v11 != v9)
    {
      do
      {
        os_unfair_lock_unlock(v10);
        v10 = (os_unfair_lock_s *)(v8 + 2560 * v11);
        os_unfair_lock_lock_with_options();
        v12 = v11 == *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
        v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
      }
      while (!v12);
    }
    set_tiny_meta_header_in_use(v7, v5);
    ++v10[542]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v10);
    free_tiny(a1, v7, v7 & 0xFFFFFFFFFFF00000, 0, 1);
  }
  return a2;
}

uint64_t __mfm_block_set_sizes(uint64_t result, int a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v4 = a4 - 1;
  *(_QWORD *)(result + ((8 * (a3 >> 5)) | 8) + 224) = *(_QWORD *)(result + ((8 * (a3 >> 5)) | 8) + 224) & ~(0xFFFFFLL << a3) | ((a2 & 1 | (unint64_t)(2 * (a4 - 1))) << a3);
  if ((a3 & 0x3F) >= 0x2D)
    *(_QWORD *)(result + 8 * ((a3 >> 5) & 0x7FFFFFFFFFFFFFELL) + 248) = *(_QWORD *)(result
                                                                                  + 8
                                                                                  * ((a3 >> 5) & 0x7FFFFFFFFFFFFFELL)
                                                                                  + 248) & ~(0x7FFFFuLL >> (a3 & 0x3F ^ 0x3F)) | ((v4 & 0x7FFFFFFFFFFFFFFFuLL) >> (a3 & 0x3F ^ 0x3F));
  v5 = (v4 + a3) >> 6;
  v6 = (v4 + a3) & 0x3F;
  v7 = 0x80000;
  if (!a2)
    v7 = 0;
  v8 = v4 + v7;
  v9 = 0xFFFFFLL << (v6 + 45);
  v10 = 0x7FFFFuLL >> ~(v6 + 45);
  if (((v6 + 45) & 0x40) != 0)
  {
    v10 = 0xFFFFFLL << (v6 + 45);
    v9 = 0;
  }
  v11 = v8 << (v6 + 45);
  v12 = v8 >> 1 >> ~(v6 + 45);
  if (((v6 + 45) & 0x40) != 0)
  {
    v12 = v11;
    v11 = 0;
  }
  if (v6 >= 0x13)
  {
    v13 = 2 * v5;
  }
  else
  {
    v13 = 2 * v5;
    *(_QWORD *)(result + 16 * v5 + 216) = *(_QWORD *)(result + 16 * v5 + 216) & ~v9 | v11;
  }
  *(_QWORD *)(result + ((8 * v13) | 8) + 224) = *(_QWORD *)(result + ((8 * v13) | 8) + 224) & ~v10 | v12;
  return result;
}

uint64_t pgm_malloc(uint64_t a1, unint64_t a2)
{
  unint64_t StatusReg;
  int v6;
  uint64_t v7;
  uint32_t v8;
  uint64_t v10;

  if (*MEMORY[0x1E0C88820] < a2 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 24))();
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v6 = *(_DWORD *)(StatusReg + 880);
  if (v6 == -1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 24))();
  if (v6)
  {
    v8 = v6 - 1;
  }
  else
  {
    v7 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v7)
      nanov2_realloc_VARIANT_mp_cold_1(v7);
    v8 = arc4random_uniform(v7);
  }
  *(_QWORD *)(StatusReg + 880) = v8;
  if (v8)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 24))();
  os_unfair_lock_lock_with_options();
  v10 = allocate(a1, a2, 0x10uLL);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  if (!v10)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 24))();
  else
    return v10;
}

uint64_t pgm_realloc(uint64_t a1, const void *a2, unint64_t a3)
{
  unint64_t StatusReg;
  int v8;
  uint64_t v9;
  uint32_t v10;
  int v12;
  void *v13;

  if (!a2)
    return pgm_malloc(a1, a3);
  if (*MEMORY[0x1E0C88820] < a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212))
    goto LABEL_13;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v8 = *(_DWORD *)(StatusReg + 880);
  if (v8 == -1)
    goto LABEL_13;
  if (v8)
  {
    v10 = v8 - 1;
  }
  else
  {
    v9 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v9)
      nanov2_realloc_VARIANT_mp_cold_1(v9);
    v10 = arc4random_uniform(v9);
  }
  *(_QWORD *)(StatusReg + 880) = v10;
  if (v10)
  {
LABEL_13:
    if (*(_QWORD *)(a1 + 248) > (unint64_t)a2 || *(_QWORD *)(a1 + 256) <= (unint64_t)a2)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 56))();
    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  os_unfair_lock_lock_with_options();
  v13 = reallocate(a1, a2, a3, v12);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  return (uint64_t)v13;
}

uint64_t small_try_shrink_in_place(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5;
  __int16 v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  os_unfair_lock_s *v10;
  int v11;
  BOOL v12;

  v5 = a4 >> 9;
  v6 = (a3 >> 9) - (a4 >> 9);
  if (v6)
  {
    v7 = (a4 & 0x1FFFE00) + a2;
    v8 = *(_QWORD *)(a1 + 624);
    v9 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
    v10 = (os_unfair_lock_s *)(v8 + 2560 * v9);
    os_unfair_lock_lock_with_options();
    v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
    if (v11 != v9)
    {
      do
      {
        os_unfair_lock_unlock(v10);
        v10 = (os_unfair_lock_s *)(v8 + 2560 * v11);
        os_unfair_lock_lock_with_options();
        v12 = v11 == *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
        v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
      }
      while (!v12);
    }
    *(_WORD *)((a2 & 0xFFFFFFFFFF800000)
             + 2 * (((unint64_t)(a2 - (a2 & 0xFF800000) - 33280) >> 9) & 0x3FFF)
             + 0x28) = v5;
    *(_WORD *)((v7 & 0xFFFFFFFFFF800000 | (2 * (((v7 - (v7 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
             + 0x28) = v6;
    ++v10[542]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v10);
    free_small(a1, v7, v7 & 0xFFFFFFFFFF800000, 0);
  }
  return a2;
}

uint64_t _malloc_zone_malloc_instrumented_or_legacy(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v3;
  unint64_t StatusReg;
  uint64_t v8;
  int v9;
  uint64_t v10;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v8 = *(_QWORD *)(StatusReg + 904);
  if (!v8)
    *(_QWORD *)(StatusReg + 904) = (v3 >> 2);
  v9 = malloc_tracing_enabled;
  if (malloc_tracing_enabled)
    kdebug_trace();
  if (malloc_check_start)
    internal_check();
  if (malloc_absolute_max_size >= a2)
  {
    v10 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, a2);
    if (malloc_logger)
      malloc_logger(10, a1, a2, 0, v10, 0);
    if (malloc_simple_stack_logging == 1)
    {
      malloc_report(0x325u, (uint64_t)"malloc (%p/%llu): ");
      if (!v9)
      {
LABEL_14:
        if (!v8)
          goto LABEL_19;
        goto LABEL_15;
      }
    }
    else if (!v9)
    {
      goto LABEL_14;
    }
    kdebug_trace();
    if (!v8)
      goto LABEL_19;
LABEL_15:
    if (v10)
      return v10;
    goto LABEL_21;
  }
  v10 = 0;
  if (v8)
    goto LABEL_15;
LABEL_19:
  *(_QWORD *)(StatusReg + 904) = 0;
  if (v10)
    return v10;
LABEL_21:
  if ((a3 & 1) != 0)
    **(_DWORD **)(StatusReg + 8) = 12;
  return v10;
}

unint64_t purgeable_malloc(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x3C00)
    a1 = *(_QWORD *)(a1 + 20456);
  return szone_malloc(a1, a2);
}

void *reallocate(uint64_t a1, const void *a2, unint64_t a3, int a4)
{
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  size_t v13;

  v8 = *(_QWORD *)(a1 + 248) <= (unint64_t)a2 && *(_QWORD *)(a1 + 256) > (unint64_t)a2;
  if (!(v8 | a4))
    nanov2_realloc_VARIANT_mp_cold_1(a1);
  if (!v8)
  {
    v11 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 16))();
    if (v11)
      goto LABEL_8;
LABEL_13:
    reallocate_cold_2((uint64_t)a2);
  }
  v9 = lookup_slot(a1, (unint64_t)a2);
  if ((v9 & 0x8000000000000000) == 0)
    goto LABEL_13;
  v10 = *(_QWORD *)(a1 + 280) + 8 * v9;
  v11 = *(unsigned __int16 *)(v10 + 4);
  if (!*(_WORD *)(v10 + 4))
    goto LABEL_13;
LABEL_8:
  if (a4 && *(_DWORD *)(a1 + 16684) != *(_DWORD *)(a1 + 212))
  {
    v12 = (void *)allocate(a1, a3, 0x10uLL);
    if (!v12)
      nanov2_realloc_VARIANT_mp_cold_1(0);
  }
  else
  {
    v12 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 24))();
    if (!v12)
      return v12;
  }
  if (v11 >= a3)
    v13 = a3;
  else
    v13 = v11;
  memcpy(v12, a2, v13);
  if (v8)
    deallocate(a1, (unint64_t)a2);
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 200) + 48))();
  return v12;
}

void xzm_malloc_zone_free(uint64_t a1, unint64_t a2)
{
  _xzm_free(a1, a2, 0);
}

size_t malloc_size(const void *ptr)
{
  size_t v1;
  uint64_t v2;
  size_t v3;
  int32_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = 0;
  if (ptr)
  {
    if (malloc_num_zones)
    {
      if (!lite_zone || (v1 = (*(uint64_t (**)(void))(lite_zone + 16))()) == 0)
      {
        if (initial_num_zones)
        {
          v2 = 0;
          while (1)
          {
            v3 = (*(uint64_t (**)(void))(*((_QWORD *)malloc_zones + v2) + 16))();
            if (v3)
              return v3;
            if (++v2 >= (unint64_t)initial_num_zones)
              goto LABEL_9;
          }
        }
        else
        {
LABEL_9:
          v4 = (int32_t *)pFRZCounterLive;
          OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
          v5 = malloc_num_zones;
          v6 = initial_num_zones;
          if (initial_num_zones >= malloc_num_zones)
          {
LABEL_12:
            v1 = 0;
          }
          else
          {
            while (1)
            {
              v7 = (*(uint64_t (**)(void))(*((_QWORD *)malloc_zones + v6) + 16))();
              if (v7)
                break;
              if (v5 == ++v6)
                goto LABEL_12;
            }
            v1 = v7;
          }
          OSAtomicDecrement32Barrier(v4);
        }
      }
    }
  }
  return v1;
}

void find_zone_and_free(void *a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (**v6)(void *, void *);
  uint64_t v7;
  uint64_t v8;
  int32_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;

  if (!a1)
    return;
  if (!malloc_num_zones)
    goto LABEL_32;
  if (lite_zone && (v4 = (*(uint64_t (**)(void))(lite_zone + 16))()) != 0)
  {
    v5 = v4;
  }
  else
  {
    if (initial_num_zones <= a2)
    {
LABEL_12:
      v9 = (int32_t *)pFRZCounterLive;
      OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
      v10 = malloc_num_zones;
      v11 = initial_num_zones;
      if (initial_num_zones >= malloc_num_zones)
      {
LABEL_15:
        v6 = 0;
        v5 = 0;
      }
      else
      {
        while (1)
        {
          v6 = (uint64_t (**)(void *, void *))*((_QWORD *)malloc_zones + v11);
          v12 = v6[2](v6, a1);
          if (v12)
            break;
          if (v10 == ++v11)
            goto LABEL_15;
        }
        v5 = v12;
      }
      OSAtomicDecrement32Barrier(v9);
      if (!v6)
        goto LABEL_32;
      goto LABEL_21;
    }
    v7 = a2;
    while (1)
    {
      v6 = (uint64_t (**)(void *, void *))*((_QWORD *)malloc_zones + v7);
      v8 = v6[2](v6, a1);
      if (v8)
        break;
      if (++v7 >= (unint64_t)initial_num_zones)
        goto LABEL_12;
    }
    v5 = v8;
    if (v7 || (has_injected_zone0 & 1) != 0)
      goto LABEL_21;
  }
  v6 = (uint64_t (**)(void *, void *))default_zone;
  if (!default_zone)
  {
LABEL_32:
    if ((malloc_debug_flags & 0x140) != 0)
      v13 = 80;
    else
      v13 = 144;
    malloc_report(v13, (uint64_t)"*** error for object %p: pointer being freed was not allocated\n");
    return;
  }
LABEL_21:
  if (*((_DWORD *)v6 + 26) >= 6u && v6[15])
  {
    if (malloc_tracing_enabled)
      kdebug_trace();
    if (malloc_logger)
      malloc_logger(12, v6, a1, 0, 0, 0);
    if (malloc_simple_stack_logging == 1)
      malloc_report(0x325u, (uint64_t)"free (%p/%llu): ");
    if (malloc_check_start)
      internal_check();
    ((void (*)(uint64_t (**)(void *, void *), void *, uint64_t))v6[15])(v6, a1, v5);
  }
  else
  {
    malloc_zone_free((malloc_zone_t *)v6, a1);
  }
}

malloc_zone_t *__cdecl malloc_zone_from_ptr(const void *ptr)
{
  uint64_t v1;
  uint64_t v3;
  int32_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = 0;
  if (ptr && malloc_num_zones)
  {
    if (lite_zone && (*(uint64_t (**)(void))(lite_zone + 16))())
    {
      return (malloc_zone_t *)default_zone;
    }
    else if (initial_num_zones)
    {
      v3 = 0;
      while (1)
      {
        v1 = *((_QWORD *)malloc_zones + v3);
        if ((*(uint64_t (**)(uint64_t, const void *))(v1 + 16))(v1, ptr))
          break;
        if (++v3 >= (unint64_t)initial_num_zones)
          goto LABEL_10;
      }
      if (!v3 && !has_injected_zone0)
        return (malloc_zone_t *)default_zone;
    }
    else
    {
LABEL_10:
      v4 = (int32_t *)pFRZCounterLive;
      OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
      v5 = malloc_num_zones;
      v6 = initial_num_zones;
      if (initial_num_zones >= malloc_num_zones)
      {
LABEL_13:
        v1 = 0;
      }
      else
      {
        while (1)
        {
          v1 = *((_QWORD *)malloc_zones + v6);
          if ((*(uint64_t (**)(uint64_t, const void *))(v1 + 16))(v1, ptr))
            break;
          if (v5 == ++v6)
            goto LABEL_13;
        }
      }
      OSAtomicDecrement32Barrier(v4);
    }
  }
  return (malloc_zone_t *)v1;
}

uint64_t szone_size(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (!a2 || (a2 & 0xF) != 0)
    return 0;
  result = tiny_size(a1 + 16512, a2);
  if (!result)
  {
    if ((a2 & 0x1FF) != 0)
      return 0;
    result = small_size(a1 + 17280, a2);
    if (!result)
    {
      if (((*MEMORY[0x1E0C88820] - 1) & a2) == 0)
        return szone_size_try_large(a1, a2);
      return 0;
    }
  }
  return result;
}

uint64_t tiny_size(uint64_t a1, unint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int *v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  int v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = *(uint64_t **)(a1 + 24);
  v3 = *v2;
  if (*v2)
  {
    v4 = a2 & 0xFFFFFFFFFFF00000;
    v5 = v2[2];
    v6 = (0x9E3779B97F4A7C55 * (a2 >> 20)) >> -*((_BYTE *)v2 + 8);
    v7 = v6;
    while (1)
    {
      v8 = *(_QWORD *)(v5 + 8 * v7);
      if (!v8)
        return 0;
      if (v8 == v4)
        break;
      if (v7 + 1 == v3)
        v7 = 0;
      else
        ++v7;
      if (v7 == v6)
        return 0;
    }
    if (!v4)
      return 0;
    if ((((_DWORD)a2 + 1032064) & 0xFFF80u) > 0xFBF70uLL)
    {
      malloc_printf("NO ZONE for ptr %p\n", (const void *)a2);
      return 0;
    }
    v10 = a2 - v4 - 16512;
    v11 = (v10 >> 8) & 0xFFE;
    v12 = 1 << (v10 >> 4);
    v13 = (unsigned int *)(v4 + 40 + 4 * v11);
    v14 = *v13;
    if ((v14 & v12) != 0)
    {
      if ((*(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x28 + 4 * (v11 | 1)) & v12) == 0)
        return 0;
      v15 = (v10 >> 4) & 0x1F;
      v16 = ((unint64_t)v13[2] << (32 - v15)) | (v14 >> v15);
      if (v15)
        v16 |= (unint64_t)v13[4] << -(char)v15;
      v17 = __clz(__rbit64(v16 >> 1));
      if (v16 >= 2)
        v18 = v17 + 1;
      else
        v18 = 0;
      v19 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
      if (v19 != -1)
      {
        if (v18 > 0xF)
        {
          v18 = v17 + 1;
          return 16 * v18;
        }
LABEL_26:
        if (*(_QWORD *)(*(_QWORD *)(a1 + 624) + 2560 * v19 + 8) == a2)
          return 0;
        return 16 * v18;
      }
    }
    else
    {
      v18 = 0;
      v19 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
      if (v19 != -1)
        goto LABEL_26;
    }
    v20 = *(unsigned int *)(a1 + 608);
    if ((int)v20 < 1)
      return 16 * v18;
    v21 = 0;
    v22 = 2560 * v20;
    while (v18 > 0xF || *(_QWORD *)(*(_QWORD *)(a1 + 624) + v21 + 8) != a2)
    {
      v21 += 2560;
      if (v22 == v21)
        return 16 * v18;
    }
  }
  return 0;
}

uint64_t xzm_malloc_zone_size(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v13;
  uint64_t v15;
  unint64_t v16;
  int is_free_slow;
  int v18;
  unint64_t v19;
  unsigned int v20;
  int v21;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v2 = a2;
  v3 = a2 >> 22;
  if (a2 >> 36)
    v3 = 0x4000;
  if (v3 >> 14)
    return _xzm_ptr_size_outlined(a1, v2);
  v4 = *(_QWORD *)(a1 + 232);
  if (!v4)
    v4 = a1;
  v5 = *(_QWORD *)(v4 + 408);
  if (!v5)
    return _xzm_ptr_size_outlined(a1, v2);
  v6 = *(unsigned int *)(v5 + 4 * v3);
  if (!(_DWORD)v6)
    return _xzm_ptr_size_outlined(a1, v2);
  v7 = v6 << 14;
  v8 = a2 - *(_QWORD *)(v7 + 48);
  if (*(_DWORD *)(v7 + 16) <= (v8 >> 14))
    return _xzm_ptr_size_outlined(a1, v2);
  v9 = v8 >> 14;
  v10 = v7 + 48 * v9 + 2104;
  if ((*(_BYTE *)(v7 + 48 * v9 + 2136) & 0xF) == 4)
  {
    v19 = v10 - *(unsigned int *)(v7 + 48 * v9 + 2140);
    v20 = *(_BYTE *)(v19 + 32) & 0xF;
    if (v20 <= 8)
    {
      v21 = 1 << v20;
      if ((v21 & 0x1E8) != 0)
      {
        if (v19 + 48 * *(unsigned int *)(v19 + 40) <= v10)
          goto LABEL_10;
        goto LABEL_39;
      }
      if ((v21 & 6) != 0 && v10 == v19)
LABEL_39:
        v10 = v19;
    }
  }
LABEL_10:
  v11 = *(_BYTE *)(v10 + 32) & 0xF;
  if (v11 > 7)
    _xzm_segment_group_segment_span_free_coalesce_cold_1(*(_BYTE *)(v10 + 32) & 0xF);
  if (((1 << v11) & 0x1B) != 0 || *(unsigned __int16 *)(v10 + 34) != *(unsigned __int16 *)(a1 + 208))
    return _xzm_ptr_size_outlined(a1, v2);
  v13 = v2
      - *(_QWORD *)((v10 & 0xFFFFFFFFFFFFC000) + 0x30)
      - ((0xAAAAAAAAAAAAC000 * (((v10 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
  if (v11 == 5 || v11 == 2)
  {
    v15 = *(_QWORD *)(a1 + 216) + 88 * *(unsigned __int8 *)(v10 + 33);
    if ((*(_DWORD *)(v15 + 64) * v13) >= *(_DWORD *)(v15 + 64))
      return _xzm_ptr_size_outlined(a1, v2);
    v16 = *(_QWORD *)(v15 + 48);
  }
  else
  {
    v16 = (unint64_t)*(unsigned int *)(v10 + 40) << 14;
    if (v13 % v16)
      return _xzm_ptr_size_outlined(a1, v2);
  }
  if (v11 == 5)
  {
    if (((*(_DWORD *)v10 >> (v13 / v16)) & 1) == 0)
      return v16;
    return _xzm_ptr_size_outlined(a1, v2);
  }
  if (v11 == 2 && *(_QWORD *)v2 == (*(_QWORD *)(a1 + 272) ^ v2))
  {
    v25 = a1;
    v23 = v16;
    v24 = v2;
    is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v10, v2);
    v16 = v23;
    v2 = v24;
    v18 = is_free_slow;
    a1 = v25;
    if (v18)
      return _xzm_ptr_size_outlined(a1, v2);
  }
  return v16;
}

unint64_t small_size(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  uint64_t v13;
  _QWORD *i;

  v2 = *(uint64_t **)(a1 + 24);
  v3 = *v2;
  if (*v2)
  {
    v4 = a2 & 0xFFFFFFFFFF800000;
    v5 = v2[2];
    v6 = (0x9E3779B97F4A7C55 * ((a2 & 0xFFFFFFFFFF800000) >> 20)) >> -*((_BYTE *)v2 + 8);
    v7 = v6;
    while (1)
    {
      v8 = *(_QWORD *)(v5 + 8 * v7);
      if (!v8)
        return 0;
      if (v8 == v4)
        break;
      if (v7 + 1 == v3)
        v7 = 0;
      else
        ++v7;
      if (v7 == v6)
        return 0;
    }
    if (v4)
    {
      v9 = ((unint64_t)(a2 - v4 - 33280) >> 9) & 0x3FFF;
      if (v9 <= 0x3FBE)
      {
        v10 = *(__int16 *)((a2 & 0xFFFFFFFFFF800000) + 2 * v9 + 0x28);
        if ((v10 & 0x80000000) == 0)
        {
          v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
          if (v11 != -1)
          {
            if (*(_QWORD *)(*(_QWORD *)(a1 + 624) + 2560 * v11 + 8) == a2)
              return 0;
            return (unint64_t)(unsigned __int16)v10 << 9;
          }
          v13 = *(unsigned int *)(a1 + 608);
          if ((int)v13 < 1)
            return (unint64_t)(unsigned __int16)v10 << 9;
          for (i = (_QWORD *)(*(_QWORD *)(a1 + 624) + 8); *i != a2; i += 320)
          {
            if (!--v13)
              return (unint64_t)(unsigned __int16)v10 << 9;
          }
        }
      }
    }
  }
  return 0;
}

uint64_t szone_size_try_large(uint64_t a1, unint64_t a2)
{
  os_unfair_lock_s *v4;
  _QWORD *v5;
  uint64_t v6;

  v4 = (os_unfair_lock_s *)(a1 + 18816);
  os_unfair_lock_lock_with_options();
  v5 = large_entry_for_pointer_no_lock(a1, a2);
  if (v5)
    v6 = v5[1];
  else
    v6 = 0;
  os_unfair_lock_unlock(v4);
  return v6;
}

uint64_t pgm_size(os_unfair_lock_s *a1, unint64_t a2)
{
  os_unfair_lock_s *v5;
  unint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)&a1[62]._os_unfair_lock_opaque > a2 || *(_QWORD *)&a1[64]._os_unfair_lock_opaque <= a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)&a1[50]._os_unfair_lock_opaque + 16))();
  v5 = a1 + 4170;
  os_unfair_lock_lock_with_options();
  v6 = lookup_slot((uint64_t)a1, a2);
  if ((v6 & 0x8000000000000000) != 0)
    v7 = *(unsigned __int16 *)(*(_QWORD *)&a1[70]._os_unfair_lock_opaque + 8 * v6 + 4);
  else
    v7 = 0;
  os_unfair_lock_unlock(v5);
  return v7;
}

void malloc_report(unsigned int a1, uint64_t a2)
{
  unsigned int v3;

  if (malloc_error_sleep)
    v3 = 3600;
  else
    v3 = 0;
  malloc_vreport(a1, v3, 0, 0, a2);
}

void malloc_vreport(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  image_offset *p_image_offsets;
  uint64_t v13;
  pid_t v14;
  char out[40];
  unsigned __int8 uu1[8];
  uint64_t v17;
  image_offset image_offsets;
  void *array[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
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
  uint64_t v44;

  v44 = *MEMORY[0x1E0C874D8];
  if (_simple_salloc())
  {
    if ((a1 & 0x20) == 0)
    {
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      getprogname();
      getpid();
      _simple_sprintf();
    }
    if (a3)
      _simple_sprintf();
    _simple_vsprintf();
    if ((a1 & 0x100) != 0)
    {
      v43 = 0u;
      v42 = 0u;
      v41 = 0u;
      v40 = 0u;
      v39 = 0u;
      v38 = 0u;
      v37 = 0u;
      v36 = 0u;
      v35 = 0u;
      v34 = 0u;
      v33 = 0u;
      v32 = 0u;
      v31 = 0u;
      v30 = 0u;
      v29 = 0u;
      v28 = 0u;
      v27 = 0u;
      v26 = 0u;
      v25 = 0u;
      v24 = 0u;
      v23 = 0u;
      v22 = 0u;
      v21 = 0u;
      v20 = 0u;
      *(_OWORD *)array = 0u;
      v9 = backtrace(array, 50);
      if (v9)
      {
        v10 = v9;
        backtrace_image_offsets(array, &image_offsets, v9);
        if ((int)v10 >= 1)
        {
          v11 = 0;
          p_image_offsets = &image_offsets;
          do
          {
            *(_QWORD *)uu1 = 0;
            v17 = 0;
            if (!v11 || uuid_compare(uu1, p_image_offsets->uuid))
            {
              uuid_copy(uu1, p_image_offsets->uuid);
              memset(out, 0, 37);
              uuid_unparse(p_image_offsets->uuid, out);
            }
            _simple_sappend();
            _simple_sprintf();
            ++v11;
            ++p_image_offsets;
          }
          while (v10 != v11);
        }
      }
    }
    if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0))
      _simple_put();
    if (!(_malloc_no_asl_log | a1 & 0x10))
    {
      _simple_string();
      _simple_asl_log();
    }
    if ((a1 & 0x40) != 0)
    {
      v13 = _simple_string();
    }
    else
    {
      _simple_sfree();
      v13 = 0;
    }
  }
  else
  {
    if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0))
    {
      if ((a1 & 0x20) == 0)
      {
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        getprogname();
        getpid();
        _simple_dprintf();
      }
      if (a3)
        _simple_dprintf();
      _simple_vdprintf();
    }
    if ((a1 & 0x40) != 0)
      v13 = a5;
    else
      v13 = 0;
  }
  if ((a1 & 0xC0) != 0)
  {
    _malloc_put(a1, "*** set a breakpoint in malloc_error_break to debug\n");
    malloc_error_break();
    if (malloc_error_stop == 1)
    {
      _malloc_put(5u, "*** sending SIGSTOP to help debug\n");
      v14 = getpid();
      kill(v14, 17);
    }
    else if (a2)
    {
      _malloc_put(5u, "*** sleeping to help debug\n");
      sleep(a2);
    }
  }
  if ((a1 & 0x40) != 0)
  {
    qword_1EE228008 = v13;
    abort();
  }
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
  if (malloc_tracing_enabled)
    kdebug_trace();
  if (malloc_logger)
    malloc_logger(12, zone, ptr, 0, 0, 0);
  if (malloc_simple_stack_logging == 1)
    malloc_report(0x325u, (uint64_t)"malloc_zone_free (%p): ");
  if (malloc_check_start)
    internal_check();
  ((void (*)(malloc_zone_t *, void *))zone->free)(zone, ptr);
}

void internal_check()
{
  unsigned int v0;
  unint64_t v1;
  int v2;
  unint64_t v3;

  v0 = malloc_check_counter++;
  if (v0 >= malloc_check_start)
  {
    if (!malloc_num_zones)
      goto LABEL_8;
    v1 = 0;
    v2 = 1;
    do
    {
      v3 = v1 + 1;
      if (!(*(unsigned int (**)(void))(*(_QWORD *)(*((_QWORD *)malloc_zones + v1) + 96) + 16))())
        v2 = 0;
      v1 = v3;
    }
    while (v3 < malloc_num_zones);
    if (v2)
    {
LABEL_8:
      if (!qword_1EE22C188)
        vm_allocate(*MEMORY[0x1E0C883F0], (vm_address_t *)&qword_1EE22C188, *MEMORY[0x1E0C88820], 1);
      thread_stack_pcs();
    }
    malloc_check_start += malloc_check_each;
  }
}

unsigned int malloc_zone_batch_malloc(malloc_zone_t *zone, size_t size, void **results, unsigned int num_requested)
{
  unsigned int (__cdecl *batch_malloc)(_malloc_zone_t *, size_t, void **, unsigned int);
  uint64_t v5;
  void **v6;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;

  batch_malloc = zone->batch_malloc;
  if (!batch_malloc)
    return 0;
  v5 = *(_QWORD *)&num_requested;
  v6 = results;
  if (malloc_check_start)
  {
    internal_check();
    v9 = ((uint64_t (*)(malloc_zone_t *, size_t, void **, uint64_t))zone->batch_malloc)(zone, size, v6, v5);
  }
  else
  {
    v9 = ((uint64_t (*)(malloc_zone_t *, size_t, void **, _QWORD))batch_malloc)(zone, size, results, *(_QWORD *)&num_requested);
  }
  v10 = v9;
  if (malloc_logger && v9)
  {
    v11 = v9;
    do
    {
      v12 = (uint64_t)*v6++;
      malloc_logger(10, zone, size, 0, v12, 0);
      --v11;
    }
    while (v11);
  }
  return v10;
}

uint64_t default_zone_batch_malloc()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t malloc_zone_batch_malloc_fallback(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!a4)
    return 0;
  v7 = 0;
  v8 = a4;
  while (1)
  {
    v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, a2);
    if (!v9)
      break;
    *(_QWORD *)(a3 + 8 * v7++) = v9;
    if (v8 == v7)
      return v8;
  }
  return v7;
}

void xzm_malloc_zone_malloc(uint64_t a1, unint64_t a2)
{
  xzm_malloc_zone_malloc_type_malloc(a1, a2, *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904));
}

uint64_t tiny_batch_malloc(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a2 + 15;
  v7 = (unsigned __int16)((a2 + 15) >> 4);
  v8 = a1 + 16512;
  v9 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 17136)
                          + 2560 * (int)(rack_get_thread_index(a1 + 16512) % *(_DWORD *)(a1 + 17120)));
  if (((v6 >> 4) & 0xFFFE) != 0)
    v10 = v7;
  else
    v10 = 1;
  os_unfair_lock_lock_with_options();
  if ((_DWORD)a4)
  {
    v12 = 0;
    a4 = a4;
    while (1)
    {
      tiny_malloc_from_free_list(v8, (uint64_t)v9, v11, v10);
      if (!v13)
        break;
      *(_QWORD *)(a3 + 8 * v12++) = v13;
      if ((_DWORD)a4 == (_DWORD)v12)
        goto LABEL_10;
    }
    a4 = v12;
  }
LABEL_10:
  os_unfair_lock_unlock(v9);
  return a4;
}

uint64_t szone_batch_malloc(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 > 0x3F0)
    return 0;
  else
    return tiny_batch_malloc(a1, a2, a3, a4);
}

unint64_t small_memalign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7;
  unint64_t v8;
  mach_vm_address_t should_clear;
  unint64_t v10;
  mach_vm_address_t v11;
  int v12;
  unint64_t v13;
  unsigned __int16 v14;
  uint64_t v15;
  int v16;
  os_unfair_lock_s *v17;
  int v18;
  BOOL v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  os_unfair_lock_s *v24;
  int v25;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v7 = a4 + 511;
  v8 = a1 + 17280;
  should_clear = small_malloc_should_clear(a1 + 17280, (unsigned __int16)((a4 + 511) >> 9), 0);
  v10 = should_clear;
  if (should_clear)
  {
    v28 = v8;
    if (((a2 - 1) & should_clear) != 0)
      v11 = a2 - ((a2 - 1) & should_clear);
    else
      v11 = 0;
    v12 = a3 + 511;
    v13 = (v11 + 511) >> 9;
    v29 = (unint64_t)(a3 + 511) >> 9;
    v14 = (v7 >> 9) - v29 - v13;
    if ((_WORD)v13)
    {
      v27 = v11 + should_clear;
      v15 = *(_QWORD *)(a1 + 17904);
      v16 = *(_DWORD *)((should_clear & 0xFFFFFFFFFF800000) + 0x18);
      v17 = (os_unfair_lock_s *)(v15 + 2560 * v16);
      os_unfair_lock_lock_with_options();
      v18 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
      if (v18 != v16)
      {
        do
        {
          os_unfair_lock_unlock(v17);
          v17 = (os_unfair_lock_s *)(v15 + 2560 * v18);
          os_unfair_lock_lock_with_options();
          v19 = v18 == *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
          v18 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
        }
        while (!v19);
      }
      *(_WORD *)((v10 & 0xFFFFFFFFFF800000)
               + 2 * (((v10 - (v10 & 0xFF800000) - 33280) >> 9) & 0x3FFF)
               + 0x28) = v13;
      *(_WORD *)((v27 & 0xFFFFFFFFFF800000 | (2 * (((v27 - (v27 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
               + 0x28) = v14 + v29;
      ++v17[542]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(v17);
      v20 = v28;
      free_small(v28, v10, v10 & 0xFFFFFFFFFF800000, (unsigned __int16)v13 << 9);
      v10 = v27;
      v12 = a3 + 511;
    }
    else
    {
      v20 = v28;
    }
    if (v14)
    {
      v21 = (v12 & 0x1FFFE00) + v10;
      v22 = *(_QWORD *)(a1 + 17904);
      v23 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
      v24 = (os_unfair_lock_s *)(v22 + 2560 * v23);
      os_unfair_lock_lock_with_options();
      v25 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
      if (v25 != v23)
      {
        do
        {
          os_unfair_lock_unlock(v24);
          v24 = (os_unfair_lock_s *)(v22 + 2560 * v25);
          os_unfair_lock_lock_with_options();
          v19 = v25 == *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
          v25 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
        }
        while (!v19);
      }
      *(_WORD *)((v10 & 0xFFFFFFFFFF800000)
               + 2 * (((v10 - (v10 & 0xFF800000) - 33280) >> 9) & 0x3FFF)
               + 0x28) = v29;
      *(_WORD *)((v21 & 0xFFFFFFFFFF800000 | (2 * (((v21 - (v21 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
               + 0x28) = v14;
      ++v24[542]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(v24);
      free_small(v20, v21, v21 & 0xFFFFFFFFFF800000, v14 << 9);
    }
  }
  return v10;
}

uint64_t _malloc_type_zone_malloc_with_options_np_outlined(malloc_zone_t *a1, size_t a2, size_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t StatusReg;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v6 = *(_QWORD *)(StatusReg + 904);
  if (a5 <= 1)
    v7 = 1;
  else
    v7 = a5;
  *(_QWORD *)(StatusReg + 904) = v7;
  result = _malloc_zone_malloc_with_options_np_outlined(a1, a2, a3, a4);
  *(_QWORD *)(StatusReg + 904) = v6;
  return result;
}

uint64_t _malloc_zone_malloc_with_options_np_outlined(malloc_zone_t *zone, size_t alignment, size_t size, uint64_t a4)
{
  unint64_t v4;
  malloc_zone_t *v8;
  unint64_t StatusReg;
  uint64_t v10;
  uint64_t (*reserved1)(malloc_zone_t *, size_t, size_t, uint64_t);
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  if (!zone || (v8 = zone, default_zone == (_UNKNOWN *)zone))
  {
    v8 = (malloc_zone_t *)lite_zone;
    if (!lite_zone)
      v8 = *(malloc_zone_t **)malloc_zones;
  }
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v10 = *(_QWORD *)(StatusReg + 904);
  if (!v10)
    *(_QWORD *)(StatusReg + 904) = (v4 >> 2);
  if (malloc_interposition_compat
    || v8->version < 0xF
    || (reserved1 = (uint64_t (*)(malloc_zone_t *, size_t, size_t, uint64_t))v8[1].reserved1) == 0)
  {
    if (alignment)
    {
      v14 = (uint64_t)j__malloc_zone_memalign(v8, alignment, size);
      if (v14 && (a4 & 1) != 0)
        _platform_memset();
    }
    else
    {
      if ((a4 & 1) != 0)
        v15 = j__malloc_zone_calloc(v8, 1uLL, size);
      else
        v15 = j__malloc_zone_malloc(v8, size);
      v14 = (uint64_t)v15;
    }
  }
  else
  {
    v12 = malloc_tracing_enabled;
    if (malloc_tracing_enabled)
    {
      kdebug_trace();
      v13 = ((uint64_t (*)(malloc_zone_t *, size_t, size_t, uint64_t))v8[1].reserved1)(v8, alignment, size, a4);
    }
    else
    {
      v13 = reserved1(v8, alignment, size, a4);
    }
    v14 = v13;
    if (malloc_logger)
    {
      if ((a4 & 1) != 0)
        v17 = 74;
      else
        v17 = 10;
      malloc_logger(v17, v8, size, 0, v14, 0);
    }
    if (malloc_simple_stack_logging != 1)
    {
      if (!v12)
        goto LABEL_24;
      goto LABEL_15;
    }
    malloc_report(0x325u, (uint64_t)"malloc_with_options (%p/%llu,%llu): ");
    if (v12)
LABEL_15:
      kdebug_trace();
  }
LABEL_24:
  if (!v10)
    *(_QWORD *)(StatusReg + 904) = 0;
  return v14;
}

unint64_t szone_malloc_should_clear(uint64_t a1, unint64_t a2, int a3)
{
  unsigned int v6;
  mach_vm_address_t should_clear;
  uint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;

  if (a2 <= 0x3F0)
  {
    if ((((a2 + 15) >> 4) & 0xFFFE) != 0)
      v6 = (unsigned __int16)((a2 + 15) >> 4);
    else
      v6 = 1;
    should_clear = tiny_malloc_should_clear(a1 + 16512, v6, a3);
LABEL_14:
    v11 = should_clear;
    if (!a2)
      goto LABEL_22;
    goto LABEL_15;
  }
  if (a2 <= 0x3C00)
  {
    should_clear = small_malloc_should_clear(a1 + 17280, (unsigned __int16)((a2 + 511) >> 9), a3);
    goto LABEL_14;
  }
  v8 = *MEMORY[0x1E0C887F8];
  if (*MEMORY[0x1E0C887F8] <= *MEMORY[0x1E0C88810])
    v8 = *MEMORY[0x1E0C88810];
  v9 = (v8 + a2) & ~v8;
  v10 = *MEMORY[0x1E0C88800];
  if (*MEMORY[0x1E0C88800] <= *MEMORY[0x1E0C88818])
    LOBYTE(v10) = *MEMORY[0x1E0C88818];
  if (v9 >> v10)
  {
    should_clear = large_malloc(a1, v9 >> v10, 0, a3);
    goto LABEL_14;
  }
  v11 = 0;
LABEL_15:
  if (!a3 && (*(_DWORD *)(a1 + 16392) & 0x20) != 0 && v11 != 0)
  {
    szone_size(a1, v11);
    _platform_memset();
    return v11;
  }
LABEL_22:
  if (!v11)
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  return v11;
}

uint64_t tiny_malloc_should_clear(uint64_t a1, unsigned int a2, int a3)
{
  unsigned int thread_index;
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t v11;
  _WORD *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t StatusReg;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  unsigned __int16 v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int64x2_t v38;
  int64x2_t v39;
  mach_vm_address_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  unsigned int v50;
  int v51;
  mach_vm_address_t pages;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  int64x2_t v56;
  unint64_t v57;
  unint64_t v58;
  int64x2_t v59;
  mach_vm_address_t v60;
  uint64_t v61;
  mach_vm_address_t *v62;
  _DWORD *v63;
  int64x2_t v64;
  int64x2_t v65;
  _DWORD *v66;
  int64x2_t *v67;
  mach_vm_address_t *v68;
  _DWORD *v69;
  int v70;

  thread_index = rack_get_thread_index(a1);
  v7 = *(_QWORD *)(a1 + 624);
  v8 = (int)(thread_index % *(_DWORD *)(a1 + 608));
  v70 = thread_index % *(_DWORD *)(a1 + 608);
  v9 = (os_unfair_lock_s *)(v7 + 2560 * v8);
  if (malloc_tracing_enabled)
    kdebug_trace();
  os_unfair_lock_lock_with_options();
  v11 = v7 + 2560 * (int)v8;
  v13 = *(unsigned __int16 *)(v11 + 16);
  v12 = (_WORD *)(v11 + 16);
  if (v13 == a2)
  {
    v14 = v7 + 2560 * (int)v8;
    v15 = *(_QWORD *)(v14 + 8);
    *(_QWORD *)(v14 + 8) = 0;
    *v12 = 0;
    *(_QWORD *)(v14 + 24) = 0;
    os_unfair_lock_unlock(v9);
    if (malloc_zero_policy == 2)
      goto LABEL_53;
    if (malloc_zero_policy != 1)
    {
      if (malloc_zero_policy)
        return v15;
      v16 = malloc_zero_on_free_sample_period;
      if (!malloc_zero_on_free_sample_period)
        return v15;
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v18 = *(_QWORD *)(StatusReg + 888);
      v19 = v18 + 1 == v16;
      v20 = v18 + 1 == v16 ? 0 : v18 + 1;
      *(_QWORD *)(StatusReg + 888) = v20;
      if (!v19)
        return v15;
LABEL_50:
      if (_platform_memcmp_zero_aligned8())
        tiny_zero_corruption_abort(v15);
      return v15;
    }
LABEL_52:
    if (!a3)
      return v15;
LABEL_53:
    _platform_memset();
    return v15;
  }
  tiny_malloc_from_free_list(a1, (uint64_t)v9, v10, a2);
  v15 = v21;
  if (v21)
  {
LABEL_41:
    os_unfair_lock_unlock(v9);
    if (malloc_zero_policy == 2)
      goto LABEL_53;
    if (malloc_zero_policy == 1)
      goto LABEL_52;
    if (malloc_zero_policy)
      return v15;
    v44 = malloc_zero_on_free_sample_period;
    if (!malloc_zero_on_free_sample_period)
      return v15;
  }
  else
  {
    v61 = v7;
    v22 = v7 + 2560 * (int)v8;
    v66 = (_DWORD *)(v22 + 2168);
    v67 = (int64x2_t *)(v22 + 2152);
    v62 = (mach_vm_address_t *)(v22 + 2176);
    v68 = (mach_vm_address_t *)(v22 + 2184);
    v69 = (_DWORD *)(v22 + 2172);
    v23 = (_DWORD *)(v22 + 4);
    v64 = vdupq_n_s64(0xFBF80uLL);
    v65 = vdupq_n_s64(0xFFFFFFFFFFF04080);
    v63 = (_DWORD *)(v22 + 4);
LABEL_16:
    v24 = *(_QWORD *)(a1 + 624);
    os_unfair_lock_lock_with_options();
    v25 = v24 - 2528;
    v26 = (uint64_t *)(v24 - 2024);
    v27 = a2;
    while (1)
    {
      v28 = v27 - 1;
      if ((unsigned __int16)(v27 - 64) < 0xFFC1u)
        v28 = 63;
      v29 = *(_QWORD *)(v25 + 8 * v28);
      if (!v29
        && ((v30 = *(_QWORD *)(v24 - 472) & (-1 << v28)) == 0
         || ((v31 = (uint64_t *)(v25 + 8 * __clz(__rbit64(v30))), v31 >= v26) || (v29 = *v31) == 0) && (v29 = *v26) == 0)
        || (v32 = v29 & 0xFFFFFFFFFFF00000, (v29 & 0xFFFFFFFFFFF00000) == 0))
      {
LABEL_27:
        os_unfair_lock_unlock((os_unfair_lock_t)(v24 - 2560));
LABEL_38:
        if (!*v23)
        {
          *v23 = 1;
          OSMemoryBarrier();
          os_unfair_lock_unlock(v9);
          v50 = *(_DWORD *)(a1 + 620);
          if ((v50 & 4) != 0)
            v51 = -2;
          else
            v51 = -4;
          pages = mvm_allocate_pages(0x100000uLL, 20, v51 & v50, 7);
          os_unfair_lock_lock_with_options();
          if (pages)
          {
            *(_DWORD *)(pages + 16508) = unk_1ECCD9619;
            v53 = (_QWORD *)(v61 + 2560 * (int)v8 + 2128);
            if (*v53 || *(_QWORD *)(v61 + 2560 * (int)v8 + 2136))
              tiny_finalize_region(a1, (uint64_t)v9);
            *(_QWORD *)(pages + 16160) = 4278190080;
            *(_DWORD *)(pages + 24) = v70;
            rack_region_insert(a1, pages);
            v54 = v61 + 2560 * (int)v8;
            *(_QWORD *)(v54 + 2144) = pages;
            v55 = 16 * a2;
            *(_DWORD *)(pages + 16) = v55;
            *(_DWORD *)(pages + 20) = 1;
            v15 = pages + 16512;
            set_tiny_meta_header_in_use(pages + 16512, a2);
            ++*v66;
            v56 = vdupq_n_s64(0xFBF80uLL);
            v56.i64[0] = v55;
            v57 = (pages + 16512 + v55) & 0xFFFFFFFFFFF00000 | 0x28;
            v58 = ((pages + 16512 + v55) & 0xFFFFF) - 16512;
            v59 = vaddq_s64(*v67, v56);
            *(int8x8_t *)(v57 + ((v58 >> 6) & 0x3FF8)) = vorr_s8(*(int8x8_t *)(v57 + ((v58 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(1 << (v58 >> 4)));
            *(_DWORD *)(v57 + 4 * ((((v58 >> 4) + 1) >> 4) & 0xFFE)) |= 1 << ((v58 >> 4) + 1);
            *v67 = v59;
            *v53 = (int)(1032064 - 16 * a2);
            *(_QWORD *)(v54 + 2136) = 0;
            v60 = *v68;
            if (*v68)
              *(_QWORD *)(v60 + 8) = pages;
            else
              *v62 = pages;
            *(_QWORD *)pages = v60;
            *v68 = pages;
            *(_QWORD *)(pages + 8) = 0;
            *(_BYTE *)(pages + 32) = 0;
            ++*v69;
            *v23 = 0;
            OSMemoryBarrier();
            os_unfair_lock_unlock(v9);
          }
          else
          {
            *v23 = 0;
            OSMemoryBarrier();
            os_unfair_lock_unlock(v9);
            return 0;
          }
          return v15;
        }
        os_unfair_lock_unlock(v9);
        MEMORY[0x19401F804](0, 1, 1);
        os_unfair_lock_lock_with_options();
        tiny_malloc_from_free_list(a1, (uint64_t)v9, v42, a2);
        if (!v43)
          goto LABEL_16;
        v15 = v43;
        goto LABEL_41;
      }
      if (!*(_DWORD *)((v29 & 0xFFFFFFFFFFF00000) + 0x1C))
        break;
      if (++v27 > 0x3Fu)
        goto LABEL_27;
    }
    v33 = *(_QWORD *)v32;
    v34 = *(_QWORD **)((v29 & 0xFFFFFFFFFFF00000) + 8);
    if (*(_QWORD *)v32)
    {
      *(_QWORD *)(v33 + 8) = v34;
      v34 = *(_QWORD **)((v29 & 0xFFFFFFFFFFF00000) + 8);
    }
    else
    {
      *(_QWORD *)(v24 - 384) = v34;
    }
    if (!v34)
      v34 = (_QWORD *)(v24 - 376);
    *v34 = v33;
    *(_QWORD *)v32 = 0;
    *(_QWORD *)((v29 & 0xFFFFFFFFFFF00000) + 8) = 0;
    --*(_DWORD *)(v24 - 388);
    v35 = tiny_free_detach_region(a1, v24 - 2560, v32);
    *(_DWORD *)(v32 + 24) = v70;
    if (*(_DWORD *)(v32 + 28))
      nanov2_realloc_VARIANT_mp_cold_1(v35);
    v36 = v35;
    v37 = tiny_free_reattach_region(a1, (uint64_t)v9, v32);
    v38 = *(int64x2_t *)(v24 - 408);
    v39.i64[1] = v65.i64[1];
    v39.i64[0] = v37;
    v39.i64[0] = vsubq_s64(v38, v39).u64[0];
    v39.i64[1] = vaddq_s64(v38, v65).i64[1];
    *(int64x2_t *)(v24 - 408) = v39;
    *(_DWORD *)(v24 - 392) -= v36;
    v39.i64[1] = v64.i64[1];
    v39.i64[0] = v37;
    *v67 = vaddq_s64(*v67, v39);
    *v66 += v36;
    v40 = *v68;
    if (*v68)
      *(_QWORD *)(v40 + 8) = v32;
    else
      *v62 = v32;
    v23 = v63;
    *(_QWORD *)v32 = v40;
    *v68 = v32;
    *(_QWORD *)(v32 + 8) = 0;
    *(_BYTE *)(v32 + 32) = 0;
    ++*v69;
    os_unfair_lock_unlock((os_unfair_lock_t)(v24 - 2560));
    tiny_malloc_from_free_list(a1, (uint64_t)v9, v32, a2);
    if (!v41)
      goto LABEL_38;
    v15 = v41;
    os_unfair_lock_unlock(v9);
    if (malloc_zero_policy == 2)
      goto LABEL_53;
    if (malloc_zero_policy == 1)
    {
      if (a3)
        goto LABEL_53;
      return v15;
    }
    if (malloc_zero_policy)
      return v15;
    v44 = malloc_zero_on_free_sample_period;
    if (!malloc_zero_on_free_sample_period)
      return v15;
  }
  v45 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v46 = *(_QWORD *)(v45 + 888);
  v47 = v46 + 1 == v44;
  if (v46 + 1 == v44)
    v48 = 0;
  else
    v48 = v46 + 1;
  *(_QWORD *)(v45 + 888) = v48;
  if (v47)
    goto LABEL_50;
  return v15;
}

uint64_t rack_get_thread_index(uint64_t a1)
{
  uint64_t result;
  __int16 StatusReg;

  result = _os_cpu_number_override;
  if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
  {
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2));
    if (*(_DWORD *)(a1 + 608) == ncpuclusters)
      return (_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) >> 12);
    else
      return StatusReg & 0xFFF;
  }
  else if (*(_DWORD *)(a1 + 608) == ncpuclusters)
  {
    return *((unsigned __int8 *)_os_cpu_number_override + 0xFFFFFC200);
  }
  return result;
}

void tiny_malloc_from_free_list(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unsigned int v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  _WORD *v21;
  int v22;
  BOOL v23;
  unsigned int v24;
  _WORD *v25;
  unint64_t v26;
  unint64_t v27;
  unsigned int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  int v37;
  uint64_t v38;
  __int128 v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  int v43;
  unsigned int v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  _WORD *v53;
  int v54;
  unsigned int v55;
  _WORD *v56;
  unint64_t v57;
  unint64_t v58;
  _WORD *v59;
  int v60;
  BOOL v61;
  unsigned int v62;
  _WORD *v63;
  uint64_t v64;
  unint64_t v65;
  int32x2_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;

  v4 = a4;
  v6 = a1;
  if ((unsigned __int16)(a4 - 64) >= 0xFFC1u)
    v7 = a4 - 1;
  else
    v7 = 63;
  v8 = a2 + 32;
  v9 = *(_QWORD *)(a2 + 32 + 8 * v7);
  if (v9)
  {
    v10 = __ROR8__(*(_QWORD *)(v9 + 8), 60);
    v11 = (_QWORD *)(v10 & 0xFFFFFFFFFFFFFFF0);
    v12 = v10 & 0xFFFFFFFFFFFFFFF0 ^ *(_QWORD *)(a1 + 632);
    if (((v10 ^ (HIDWORD(v12)
                              + (_DWORD)v12
                              + ((HIDWORD(v12) + v12) >> 16)
                              + ((HIDWORD(v12) + (_DWORD)v12 + ((HIDWORD(v12) + v12) >> 16)) >> 8))) & 0xFLL) == 0)
    {
      if (v11)
        *v11 = *(_QWORD *)v9;
      else
        *(_DWORD *)(a2 + 4 * (v7 >> 5) + 2088) &= ~(1 << v7);
      *(_QWORD *)(v8 + 8 * v7) = v11;
      v20 = v9 & 0xFFFFFFFFFFF00000;
      v21 = (_WORD *)((v9 & 0xFFFFFFFFFFF00000) + 4 * v7 + 16168);
      v22 = *(unsigned __int16 *)((v9 & 0xFFFFFFFFFFF00000) + 4 * v7 + 0x3F28);
      if (v22 - 1 != (unsigned __int16)((v9 - 16512) >> 4))
        nanov2_realloc_VARIANT_mp_cold_1(a1);
      if (v11)
        v23 = (v10 & 0xFFFFFFFFFFF00000) == v20;
      else
        v23 = 0;
      if (v23)
      {
        v24 = ((v10 - (v20 | 0x4080)) >> 4) + 1;
        v25 = (_WORD *)(v20 + 4 * v7 + 16170);
        if (v22 == (unsigned __int16)*v25)
          *v25 = v24;
      }
      else
      {
        LOWORD(v24) = 0;
        *(_WORD *)((v9 & 0xFFFFFFFFFFF00000) + 4 * v7 + 0x3F2A) = 0;
      }
      *v21 = v24;
      if (!malloc_zero_policy)
        _tiny_check_and_zero_inline_meta_from_freelist(a1, v9, a4);
      goto LABEL_76;
    }
    while (1)
    {
LABEL_87:
      free_list_checksum_botch(a1);
      __break(1u);
LABEL_88:
      a1 = v6;
    }
  }
  v13 = *(_QWORD *)(a2 + 2088) & (-1 << v7);
  if (v13)
  {
    v14 = __clz(__rbit64(v13));
    v15 = (uint64_t *)(a2 + 536);
    v16 = (uint64_t *)(v8 + 8 * v14);
    if ((unint64_t)v16 < a2 + 536)
    {
      v9 = *v16;
      if (*v16)
      {
        v17 = __ROR8__(*(_QWORD *)(v9 + 8), 60);
        v18 = (_QWORD *)(v17 & 0xFFFFFFFFFFFFFFF0);
        v19 = v17 & 0xFFFFFFFFFFFFFFF0 ^ *(_QWORD *)(a1 + 632);
        if (((v17 ^ (HIDWORD(v19)
                                  + (_DWORD)v19
                                  + ((HIDWORD(v19) + v19) >> 16)
                                  + ((HIDWORD(v19) + (_DWORD)v19 + ((HIDWORD(v19) + v19) >> 16)) >> 8))) & 0xFLL) != 0)
          goto LABEL_87;
        *v16 = (uint64_t)v18;
        if (v18)
          *v18 = *(_QWORD *)v9;
        else
          *(_DWORD *)(a2 + ((v14 >> 3) & 0xC) + 2088) &= ~(1 << v14);
        v57 = v9 & 0xFFFFFFFFFFF00000;
        v58 = v9 & 0xFFFFFFFFFFF00000 | 0x4080;
        if (v9 + 16 >= v58 + 1032064
          || ((*(_DWORD *)(((v9 + 16) & 0xFFFFFFFFFFF00000 | ((((v9 + 16) & 0xFFFFFuLL) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v9 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          v28 = 1;
        }
        else
        {
          v28 = *(unsigned __int16 *)(v9 + 16);
        }
        if (v28 < a4)
        {
          v70 = v14;
          malloc_zone_error(256, 1, (uint64_t)"Corruption of tiny freelist %p: size too small (%u/%u)\n");
          v14 = v70;
        }
        v59 = (_WORD *)(v57 + 4 * v14 + 16168);
        v60 = (unsigned __int16)*v59;
        if (v60 - 1 != (unsigned __int16)((v9 - v58) >> 4))
          nanov2_realloc_VARIANT_mp_cold_1(a1);
        if (v18)
          v61 = (v17 & 0xFFFFFFFFFFF00000) == v57;
        else
          v61 = 0;
        if (v61)
        {
          v62 = ((v17 - v58) >> 4) + 1;
          v63 = (_WORD *)(v57 + 4 * v14 + 16170);
          if (v60 == (unsigned __int16)*v63)
            *v63 = v62;
        }
        else
        {
          LOWORD(v62) = 0;
          *(_WORD *)((v9 & 0xFFFFFFFFFFF00000) + 4 * v14 + 0x3F2A) = 0;
        }
        *v59 = v62;
LABEL_67:
        if (!malloc_zero_policy)
          _tiny_check_and_zero_inline_meta_from_freelist(v6, v9, v28);
        if (v4 <= (unsigned __int16)(v28 - 1))
          tiny_free_list_add_ptr(v6, a2, v9 + 16 * v4, (unsigned __int16)(v28 - v4));
        else
          v4 = v28;
        goto LABEL_76;
      }
    }
    v9 = *v15;
    if (*v15)
    {
      v26 = v9 & 0xFFFFFFFFFFF00000;
      v27 = v9 & 0xFFFFFFFFFFF00000 | 0x4080;
      if (v9 + 16 >= v27 + 1032064
        || ((*(_DWORD *)(((v9 + 16) & 0xFFFFFFFFFFF00000 | ((((v9 + 16) & 0xFFFFFuLL) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v9 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
      {
        v28 = 1;
      }
      else
      {
        v28 = *(unsigned __int16 *)(v9 + 16);
      }
      v29 = v28 - a4;
      if (v28 < a4)
      {
        v69 = v14;
        malloc_zone_error(256, 1, (uint64_t)"Corruption of tiny freelist %p: size too small (%u/%u)\n");
        LODWORD(v27) = v9 & 0xFFF00000 | 0x4080;
        v26 = v9 & 0xFFFFFFFFFFF00000;
        v14 = v69;
      }
      v30 = *(_QWORD *)(v9 + 8);
      v31 = __ROR8__(v30, 60);
      v32 = (_QWORD *)(v31 & 0xFFFFFFFFFFFFFFF0);
      v33 = v31 & 0xFFFFFFFFFFFFFFF0 ^ *(_QWORD *)(v6 + 632);
      if (((v31 ^ (HIDWORD(v33)
                                + (_DWORD)v33
                                + ((HIDWORD(v33) + v33) >> 16)
                                + ((HIDWORD(v33) + (_DWORD)v33 + ((HIDWORD(v33) + v33) >> 16)) >> 8))) & 0xFLL) != 0)
        goto LABEL_88;
      if (v29 >= 64)
      {
        v34 = v9 + 16 * v4;
        v35 = *(_QWORD *)v9;
        if (!malloc_zero_policy)
        {
          v36 = v28;
          v71 = *(_QWORD *)v9;
          v72 = v26;
          v37 = v27;
          _tiny_check_and_zero_inline_meta_from_freelist(v6, v9, v36);
          v35 = v71;
          v26 = v72;
          LODWORD(v27) = v37;
        }
        *v15 = v34;
        if (v32)
        {
          v38 = *(_QWORD *)(v6 + 632) ^ v34;
          *((_QWORD *)&v39 + 1) = HIDWORD(v38)
                                + (_DWORD)v38
                                + ((HIDWORD(v38) + v38) >> 16)
                                + ((HIDWORD(v38) + (_DWORD)v38 + ((HIDWORD(v38) + v38) >> 16)) >> 8);
          *(_QWORD *)&v39 = v9 + 16 * v4;
          *v32 = v39 >> 4;
        }
        *(_QWORD *)v34 = v35;
        *(_QWORD *)(v34 + 8) = v30;
        v40 = (v34 & 0xFFFFF) - 16512;
        v41 = v34 & 0xFFFFFFFFFFF00000 | (v40 >> 6) & 0x3FF8;
        LODWORD(v40) = 1 << (v40 >> 4);
        v42 = *(_DWORD *)(v41 + 40) | v40;
        LODWORD(v40) = *(_DWORD *)(v41 + 44) & ~(_DWORD)v40;
        *(_DWORD *)(v41 + 40) = v42;
        *(_DWORD *)(v41 + 44) = v40;
        *(_WORD *)(v34 + 16 * (unsigned __int16)v29 - 2) = v29;
        *(_WORD *)(v34 + 16) = v29;
        v43 = *(unsigned __int16 *)(v26 + 16420);
        if (v43 - 1 != (unsigned __int16)((v9 - v27) >> 4))
          nanov2_realloc_VARIANT_mp_cold_1(a1);
        if ((v34 & 0xFFFFFFFFFFF00000) == v26)
        {
          v44 = ((v34 - v27) >> 4) + 1;
          if (v43 == *(unsigned __int16 *)(v26 + 16422))
            *(_WORD *)(v26 + 16422) = v44;
        }
        else
        {
          LOWORD(v44) = 0;
          *(_WORD *)(v26 + 16422) = 0;
        }
        *(_WORD *)(v26 + 16420) = v44;
        goto LABEL_76;
      }
      if (v32)
        *v32 = *(_QWORD *)v9;
      *v15 = (uint64_t)v32;
      v53 = (_WORD *)(v26 + 4 * v14 + 16168);
      v54 = (unsigned __int16)*v53;
      if (v54 - 1 != (unsigned __int16)((v9 - v27) >> 4))
        nanov2_realloc_VARIANT_mp_cold_1(a1);
      if (v32 && (v31 & 0xFFFFFFFFFFF00000) == v26)
      {
        v55 = ((v31 - v27) >> 4) + 1;
        v56 = (_WORD *)(v26 + 4 * v14 + 16170);
        if (v54 == (unsigned __int16)*v56)
          *v56 = v55;
      }
      else
      {
        LOWORD(v55) = 0;
        *(_WORD *)(v26 + 4 * v14 + 16170) = 0;
      }
      *v53 = v55;
      goto LABEL_67;
    }
  }
  v45 = *(_QWORD *)(a2 + 2128);
  if (v45 < 16 * (unint64_t)a4)
    return;
  v46 = 16 * a4;
  v9 = *(_QWORD *)(a2 + 2144) - v45 + 0x100000;
  v47 = v45 - v46;
  *(_QWORD *)(a2 + 2128) = v47;
  if (v47)
  {
    v48 = v9 + v46;
    v49 = v48 & 0xFFFFF;
    v50 = v48 & 0xFFFFFFFFFFF00000 | 0x28;
    v51 = v49 - 16512;
    v52 = (unint64_t)(v49 - 16512) >> 4;
    *(int8x8_t *)(v50 + ((v51 >> 6) & 0x3FF8)) = vorr_s8(*(int8x8_t *)(v50 + ((v51 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(1 << v52));
    *(_DWORD *)(v50 + 4 * (((v52 + 1) >> 4) & 0xFFE)) |= 1 << (v52 + 1);
  }
LABEL_76:
  ++*(_DWORD *)(a2 + 2168);
  v64 = 16 * v4;
  *(_QWORD *)(a2 + 2152) += v64;
  v65 = v9 & 0xFFFFFFFFFFF00000;
  if (*(_DWORD *)(v9 & 0xFFFFFFFFFFF00000 | 0x407C) == unk_1ECCD9619)
  {
    v66 = vadd_s32(*(int32x2_t *)((v9 & 0xFFFFFFFFFFF00000) + 0x10), (int32x2_t)(v64 | 0x100000000));
    *(int32x2_t *)((v9 & 0xFFFFFFFFFFF00000) + 0x10) = v66;
    if (v66.i32[0] >= 0xBCFA0u)
      *(_BYTE *)((v9 & 0xFFFFFFFFFFF00000) + 0x20) = 0;
    if (v4 < 2)
    {
      v67 = v65 + 40;
      v68 = v9 - v65 - 16512;
      *(int8x8_t *)(v67 + ((v68 >> 6) & 0x3FF8)) = vorr_s8(*(int8x8_t *)(v67 + ((v68 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(1 << (v68 >> 4)));
      *(_DWORD *)(v67 + 4 * ((((v68 >> 4) + 1) >> 4) & 0xFFE)) |= 1 << ((v68 >> 4) + 1);
    }
    else
    {
      set_tiny_meta_header_in_use(v9, v4);
    }
  }
  else
  {
    malloc_zone_error(64, 1, (uint64_t)"Region cookie corrupted for region %p (value is %x)[%p]\n");
    __break(1u);
  }
}

unint64_t set_tiny_meta_header_in_use(uint64_t a1, int a2)
{
  unint64_t v2;
  unint64_t result;
  unint64_t v4;
  int v5;
  int v6;
  int v7;
  char v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;

  v2 = a1 & 0xFFFFF;
  result = a1 & 0xFFFFFFFFFFF00000 | 0x28;
  v2 -= 16512;
  v4 = v2 >> 4;
  *(int8x8_t *)(result + ((v2 >> 6) & 0x3FF8)) = vorr_s8(*(int8x8_t *)(result + ((v2 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(1 << (v2 >> 4)));
  v5 = (v2 >> 4) + 1;
  v6 = (unsigned __int16)(v4 + 1) >> 4;
  v7 = v6 & 0xFFE;
  v8 = v5 & 0x1F;
  v9 = (v5 & 0x1F) + (unsigned __int16)(a2 - 1);
  if (v9 < 0x40)
  {
    v12 = 0x7FFFFFFFu >> (v8 ^ 0x1F);
    if (v9 < 0x20)
    {
      v10 = v12 | (-1 << v9);
      *(_DWORD *)(result + 4 * (v6 & 0xFFE)) &= v10;
      v11 = v6 | 1u;
    }
    else
    {
      v10 = -1 << v9;
      *(int8x8_t *)(result + 4 * (v6 & 0xFFE)) = vand_s8(*(int8x8_t *)(result + 4 * (v6 & 0xFFE)), (int8x8_t)vdup_n_s32(v12));
      *(_DWORD *)(result + 4 * (v7 + 2)) &= v10;
      v11 = (v7 + 3);
    }
  }
  else
  {
    *(int8x8_t *)(result + 4 * (v6 & 0xFFE)) = vand_s8(*(int8x8_t *)(result + 4 * (v6 & 0xFFE)), (int8x8_t)vdup_n_s32(0x7FFFFFFFu >> (v8 ^ 0x1F)));
    v10 = -1 << v9;
    *(_QWORD *)(result + 4 * (v7 + 2)) = 0;
    *(_DWORD *)(result + 4 * (v7 + 4)) &= v10;
    v11 = (v7 + 5);
  }
  *(_DWORD *)(result + 4 * v11) &= v10;
  *(_DWORD *)(result + 4 * (((a2 - 1 + v5) >> 4) & 0xFFE)) |= 1 << (a2 - 1 + v5);
  return result;
}

void _tiny_check_and_zero_inline_meta_from_freelist(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4;
  unint64_t v5;
  int v6;
  uint64_t v7;
  const char *v8;

  v4 = __ROR8__(*(_QWORD *)a2, 60);
  v5 = v4 & 0xFFFFFFFFFFFFFFF0 ^ *(_QWORD *)(a1 + 632);
  if (((v4 ^ (HIDWORD(v5)
                           + (_DWORD)v5
                           + ((HIDWORD(v5) + v5) >> 16)
                           + ((HIDWORD(v5) + (_DWORD)v5 + ((HIDWORD(v5) + v5) >> 16)) >> 8))) & 0xFLL) != 0)
  {
    free_list_checksum_botch(a1);
    __break(1u);
    return;
  }
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  if (a3 >= 2)
  {
    v6 = *(unsigned __int16 *)(a2 + 16);
    v7 = a2 + 16 * a3;
    if (v6 == *(unsigned __int16 *)(v7 - 2))
    {
      if (v6 == a3)
      {
LABEL_11:
        *(_WORD *)(a2 + 16) = 0;
        *(_WORD *)(v7 - 2) = 0;
        return;
      }
      v8 = "Corruption at %p: unexpected msizes %u/%u\n";
    }
    else
    {
      v8 = "Corruption of free object %p: msizes %u/%u disagree\n";
    }
    malloc_zone_error(256, 1, (uint64_t)v8);
    goto LABEL_11;
  }
  if (!a3)
  {
    if (*(_WORD *)(a2 + 16))
      malloc_zone_error(256, 1, (uint64_t)"Corruption at %p: unexpected nonzero msize %u\n");
  }
}

unint64_t szone_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 == 1)
    return szone_malloc_should_clear(a1, a3, 1);
  if (is_mul_ok(a2, a3))
  {
    a3 *= a2;
    if (a3 <= malloc_absolute_max_size)
      return szone_malloc_should_clear(a1, a3, 1);
  }
  **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  return 0;
}

uint64_t _malloc_zone_calloc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  BOOL v6;
  unsigned int v7;

  if (default_zone == (_UNKNOWN *)a1 && lite_zone == 0)
    a1 = *(_QWORD *)malloc_zones;
  if (malloc_slowpath)
    v6 = 0;
  else
    v6 = malloc_logger == 0;
  if (!v6)
    return _malloc_zone_calloc_instrumented_or_legacy(a1, a2, a3, a4);
  v7 = *(_DWORD *)(a1 + 104);
  if (v7 <= 0xC)
    return _malloc_zone_calloc_instrumented_or_legacy(a1, a2, a3, a4);
  if (v7 < 0x10)
    return (*(uint64_t (**)(void))(a1 + 32))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 168))(a1, a2, a3, (v4 >> 2));
}

mach_vm_address_t small_malloc_should_clear(unint64_t a1, unsigned int a2, int a3)
{
  signed int v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  mach_vm_address_t v11;
  mach_vm_address_t v12;
  mach_vm_address_t v13;
  uint64_t v14;
  _DWORD *v15;
  _DWORD *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  unsigned __int16 v20;
  unsigned int v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  __int16 v25;
  int v26;
  int v27;
  int v28;
  unsigned int v29;
  unint64_t *v30;
  unint64_t v31;
  BOOL v32;
  __int16 v33;
  unint64_t v34;
  __int16 v36;
  unint64_t v37;
  mach_vm_address_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int64x2_t v44;
  int64x2_t v45;
  unint64_t v46;
  mach_vm_address_t v47;
  unsigned int v48;
  int v49;
  mach_vm_address_t pages;
  _QWORD *v51;
  uint64_t v52;
  unint64_t v53;
  int64x2_t v54;
  unint64_t v55;
  signed int v57;
  uint64_t v58;
  int v59;
  unint64_t *v60;
  int64x2_t v61;
  int64x2_t v62;
  _DWORD *v63;
  int64x2_t *v64;
  unint64_t *v65;
  _DWORD *v66;
  signed int v67;

  v6 = rack_get_thread_index(a1) % *(_DWORD *)(a1 + 608);
  v7 = *(_QWORD *)(a1 + 624);
  v8 = (os_unfair_lock_s *)(v7 + 2560 * v6);
  if (malloc_tracing_enabled)
    kdebug_trace();
  os_unfair_lock_lock_with_options();
  v9 = v7 + 2560 * v6;
  v12 = *(_QWORD *)(v9 + 8);
  v10 = v9 + 8;
  v11 = v12;
  if (*(unsigned __int16 *)(v10 + 8) == a2)
  {
    *(_QWORD *)v10 = 0;
    *(_WORD *)(v10 + 8) = 0;
    *(_QWORD *)(v7 + 2560 * v6 + 24) = 0;
  }
  else
  {
    small_malloc_from_free_list(a1, v7 + 2560 * v6, a2);
    v11 = v13;
    if (!v13)
    {
      v58 = v7;
      v59 = a3;
      v57 = v6;
      v14 = v7 + 2560 * v6;
      v63 = (_DWORD *)(v14 + 2168);
      v64 = (int64x2_t *)(v14 + 2152);
      v60 = (unint64_t *)(v14 + 2176);
      v65 = (unint64_t *)(v14 + 2184);
      v66 = (_DWORD *)(v14 + 2172);
      v15 = (_DWORD *)(v14 + 4);
      v61 = vdupq_n_s64(0x7F7E00uLL);
      v62 = vdupq_n_s64(0xFFFFFFFFFF808200);
      v67 = v6;
      while (2)
      {
        v16 = v15;
        v17 = *(_QWORD *)(a1 + 624);
        os_unfair_lock_lock_with_options();
        v18 = v17 - 2528;
        v19 = (unint64_t *)(v17 - 2288);
        v20 = a2;
        while (1)
        {
          if ((v20 & 0xFFE0) != 0)
            v21 = 30;
          else
            v21 = v20 - 1;
          v22 = *(_QWORD *)(v18 + 8 * v21);
          if (!v22
            || ((v23 = v22 & 0xFFFFFFFFFF800000, (v22 & 0xFFFFFFFFFF800000 | 0x7FA6) <= v22)
              ? (v24 = (v22 & 0xFFFFFFFFFF800000 | 0x81F8) > v22)
              : (v24 = 0),
                v24
             && ((v25 = *(_WORD *)(v22 + 16), (v25 & 0x8000) == 0)
              || (v22 = v23 + ((unint64_t)(v25 & 0x7FFF) << 9)) == 0)))
          {
            v26 = v21 >> 5;
            v27 = -1 << v21;
            while (1)
            {
              v28 = v26;
              if (v26)
                break;
              v26 = 1;
              v29 = *(_DWORD *)(v17 - 472) & v27;
              v27 = -1;
              if (v29)
                goto LABEL_25;
            }
            if (v26 == 1)
              goto LABEL_45;
            v29 = 0;
LABEL_25:
            if ((v30 = (unint64_t *)(v18 + 8 * (__clz(__rbit32(v29)) + 32 * v28)), v30 >= v19)
              || (v22 = *v30) == 0
              || ((v31 = v22 & 0xFFFFFFFFFF800000, (v22 & 0xFFFFFFFFFF800000 | 0x7FA6) <= v22)
                ? (v32 = (v22 & 0xFFFFFFFFFF800000 | 0x81F8) > v22)
                : (v32 = 0),
                  v32
               && ((v33 = *(_WORD *)(v22 + 16), (v33 & 0x8000) == 0)
                || (v22 = v31 + ((unint64_t)(v33 & 0x7FFF) << 9)) == 0)))
            {
              v22 = *v19;
              if (!*v19)
                goto LABEL_45;
              v34 = v22 & 0xFFFFFFFFFF800000;
              if ((v22 & 0xFFFFFFFFFF800000 | 0x7FA6) <= v22 && (v22 & 0xFFFFFFFFFF800000 | 0x81F8) > v22)
              {
                v36 = *(_WORD *)(v22 + 16);
                if ((v36 & 0x8000) == 0)
                  goto LABEL_45;
                v22 = v34 + ((unint64_t)(v36 & 0x7FFF) << 9);
                if (!v22)
                  goto LABEL_45;
              }
            }
          }
          v37 = v22 & 0xFFFFFFFFFF800000;
          if ((v22 & 0xFFFFFFFFFF800000) == 0)
          {
LABEL_45:
            os_unfair_lock_unlock((os_unfair_lock_t)(v17 - 2560));
            goto LABEL_46;
          }
          if (!*(_DWORD *)((v22 & 0xFFFFFFFFFF800000) + 0x1C))
            break;
          if (++v20 > 0x1Eu)
            goto LABEL_45;
        }
        v39 = *(_QWORD *)v37;
        v40 = *(_QWORD **)((v22 & 0xFFFFFFFFFF800000) + 8);
        if (*(_QWORD *)v37)
        {
          *(_QWORD *)(v39 + 8) = v40;
          v40 = *(_QWORD **)((v22 & 0xFFFFFFFFFF800000) + 8);
        }
        else
        {
          *(_QWORD *)(v17 - 384) = v40;
        }
        if (!v40)
          v40 = (_QWORD *)(v17 - 376);
        *v40 = v39;
        *(_QWORD *)v37 = 0;
        *(_QWORD *)((v22 & 0xFFFFFFFFFF800000) + 8) = 0;
        --*(_DWORD *)(v17 - 388);
        v41 = small_free_detach_region(a1, v17 - 2560, v37);
        *(_DWORD *)(v37 + 24) = v67;
        if (*(_DWORD *)(v37 + 28))
          nanov2_realloc_VARIANT_mp_cold_1(v41);
        v42 = v41;
        v43 = small_free_reattach_region(a1, (uint64_t)v8, v37);
        v44 = *(int64x2_t *)(v17 - 408);
        v45.i64[1] = v62.i64[1];
        v45.i64[0] = v43;
        v45.i64[0] = vsubq_s64(v44, v45).u64[0];
        v45.i64[1] = vaddq_s64(v44, v62).i64[1];
        *(int64x2_t *)(v17 - 408) = v45;
        *(_DWORD *)(v17 - 392) -= v42;
        v45.i64[1] = v61.i64[1];
        v45.i64[0] = v43;
        *v64 = vaddq_s64(*v64, v45);
        *v63 += v42;
        v46 = *v65;
        if (*v65)
          *(_QWORD *)(v46 + 8) = v37;
        else
          *v60 = v37;
        v6 = v67;
        *(_QWORD *)v37 = v46;
        *v65 = v37;
        *(_QWORD *)(v37 + 8) = 0;
        *(_BYTE *)(v37 + 32) = 0;
        ++*v66;
        os_unfair_lock_unlock((os_unfair_lock_t)(v17 - 2560));
        small_malloc_from_free_list(a1, (uint64_t)v8, a2);
        if (v47)
        {
          v11 = v47;
          os_unfair_lock_unlock(v8);
          if (v59)
            goto LABEL_71;
          return v11;
        }
LABEL_46:
        v15 = v16;
        if (!*v16)
        {
          *v16 = 1;
          OSMemoryBarrier();
          os_unfair_lock_unlock(v8);
          v48 = *(_DWORD *)(a1 + 620);
          if ((v48 & 4) != 0)
            v49 = -2;
          else
            v49 = -4;
          pages = mvm_allocate_pages(0x800000uLL, 23, v49 & v48, 2);
          os_unfair_lock_lock_with_options();
          if (pages)
          {
            *(_DWORD *)(pages + 33276) = unk_1ECCD9619;
            v51 = (_QWORD *)(v7 + 2560 * v57 + 2128);
            if (*v51 || *(_QWORD *)(v58 + 2560 * v57 + 2136))
              small_finalize_region(a1, (uint64_t)v8);
            *(_DWORD *)(pages + 24) = v6;
            rack_region_insert(a1, pages);
            v52 = v58 + 2560 * v57;
            *(_QWORD *)(v52 + 2144) = pages;
            *(_DWORD *)(pages + 16) = a2 << 9;
            v11 = pages + 33280;
            v53 = (pages + 33280) & 0xFFFFFFFFFF800000;
            *(_WORD *)(v53 + 40) = a2;
            ++*v63;
            v54 = vdupq_n_s64(0x7F7E00uLL);
            v54.i64[0] = a2 << 9;
            *v64 = vaddq_s64(*v64, v54);
            *(_WORD *)((v53 | 0x28) + 2 * a2) = 16319 - a2;
            *v51 = (16319 - a2) << 9;
            *(_QWORD *)(v52 + 2136) = 0;
            v55 = *v65;
            if (*v65)
              *(_QWORD *)(v55 + 8) = pages;
            else
              *v60 = pages;
            *(_QWORD *)pages = v55;
            *v65 = pages;
            *(_QWORD *)(pages + 8) = 0;
            *(_BYTE *)(pages + 32) = 0;
            ++*v66;
            *v15 = 0;
            OSMemoryBarrier();
            os_unfair_lock_unlock(v8);
          }
          else
          {
            *v15 = 0;
            OSMemoryBarrier();
            os_unfair_lock_unlock(v8);
            return 0;
          }
          return v11;
        }
        os_unfair_lock_unlock(v8);
        MEMORY[0x19401F804](0, 1, 1);
        os_unfair_lock_lock_with_options();
        small_malloc_from_free_list(a1, (uint64_t)v8, a2);
        if (!v38)
          continue;
        break;
      }
      v11 = v38;
      a3 = v59;
    }
  }
  os_unfair_lock_unlock(v8);
  if (a3)
LABEL_71:
    _platform_memset();
  return v11;
}

void small_malloc_from_free_list(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v3;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  unint64_t v18;
  BOOL v19;
  unsigned int v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v3 = a3;
  if (a3 >= 0x20)
    v6 = 30;
  else
    v6 = a3 - 1;
  v7 = *(_QWORD *)(a2 + 32 + 8 * v6);
  if (v7)
  {
    v8 = v7 & 0xFFFFFFFFFF800000;
    v9 = (v7 & 0xFFFFFFFFFF800000 | 0x7FA6) <= v7 && (v7 & 0xFFFFFFFFFF800000 | 0x81F8) > v7;
    v10 = *(_QWORD *)(a2 + 32 + 8 * v6);
    if (!v9)
      goto LABEL_13;
    if ((*(_WORD *)(v7 + 16) & 0x8000) != 0)
    {
      v11 = (unint64_t)(*(_WORD *)(v7 + 16) & 0x7FFF) << 9;
      if (v11 != -(uint64_t)v8)
      {
        v10 = v11 + v8;
LABEL_13:
        small_free_list_remove_ptr(a1, a2, v7, v3);
        goto LABEL_14;
      }
    }
  }
  v14 = v6 >> 5;
  v15 = -1 << v6;
  while (1)
  {
    v16 = v14;
    if (v14)
      break;
    v14 = 1;
    v17 = *(_DWORD *)(a2 + 2088) & v15;
    v15 = -1;
    if (v17)
      goto LABEL_24;
  }
  if (v14 == 1)
    goto LABEL_34;
  v17 = 0;
LABEL_24:
  v18 = *(_QWORD *)(a2 + 32 + 8 * (__clz(__rbit32(v17)) + 32 * v16));
  if (v18)
  {
    v19 = (v18 & 0xFFFFFFFFFF800000 | 0x7FA6) <= v18 && (v18 & 0xFFFFFFFFFF800000 | 0x81F8) > v18;
    v10 = v18;
    if (!v19
      || (*(_WORD *)(v18 + 16) & 0x8000) != 0
      && (v10 = (v18 & 0xFFFFFFFFFF800000) + ((unint64_t)(*(_WORD *)(v18 + 16) & 0x7FFF) << 9)) != 0)
    {
      v20 = *(_WORD *)((v10 & 0xFFFFFFFFFF800000 | (2
                                                    * (((unint64_t)(v10
                                                                         - (v10 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                     + 0x28) & 0x7FFF;
      small_free_list_remove_ptr(a1, a2, v18, v20);
      if (v20 <= v3)
        v3 = v20;
      else
        small_free_list_add_ptr(a1, a2, v10 + (v3 << 9), (unsigned __int16)(v20 - v3));
      goto LABEL_14;
    }
  }
LABEL_34:
  v21 = *(_QWORD *)(a2 + 2128);
  v22 = v3 << 9;
  if (v21 < v22)
    return;
  v10 = *(_QWORD *)(a2 + 2144) - v21 + 0x800000;
  v23 = v21 - v22;
  *(_QWORD *)(a2 + 2128) = v23;
  if (v23)
    *(_WORD *)((v10 & 0xFFFFFFFFFF800000 | (2 * (((v10 + v22 - 33280) >> 9) & 0x3FFFLL))) + 0x28) = v23 >> 9;
LABEL_14:
  ++*(_DWORD *)(a2 + 2168);
  v12 = v3 << 9;
  *(_QWORD *)(a2 + 2152) += v12;
  if (*(_DWORD *)(v10 & 0xFFFFFFFFFF800000 | 0x81FC) == unk_1ECCD9619)
  {
    v13 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x10) + v12;
    *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x10) = v13;
    if (v13 >= 0x5F9E80)
      *(_BYTE *)((v10 & 0xFFFFFFFFFF800000) + 0x20) = 0;
    *(_WORD *)((v10 & 0xFFFFFFFFFF800000)
             + 2 * (((unint64_t)(v10 - (v10 & 0xFF800000) - 33280) >> 9) & 0x3FFF)
             + 0x28) = v3;
  }
  else
  {
    malloc_zone_error(64, 1, (uint64_t)"Region cookie corrupted for region %p (value is %x)[%p]\n");
    __break(1u);
  }
}

void small_free_list_remove_ptr_no_clear(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  unsigned int v4;
  unint64_t v5;
  _BOOL4 v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  __int16 v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  __int16 v24;
  int v25;
  unint64_t v26;
  BOOL v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  __int16 v33;
  int v34;
  unint64_t v35;
  __int16 v36;
  unint64_t v37;
  unint64_t v38;

  if (a4 >= 0x20)
    v4 = 30;
  else
    v4 = a4 - 1;
  if (!a3)
    nanov2_realloc_VARIANT_mp_cold_1(a1);
  v5 = a3 & 0xFFFFFFFFFF800000;
  v7 = (a3 & 0xFFFFFFFFFF800000 | 0x7FA6) > a3 || (a3 & 0xFFFFFFFFFF800000 | 0x81F8) <= a3;
  if (v7)
  {
    v8 = *(_QWORD *)a3;
    v9 = *(_QWORD *)(a1 + 632) ^ a1;
    v10 = v9 ^ *(_QWORD *)a3;
    if (*(unsigned __int8 *)(a3 + 8) != (BYTE4(v10)
                                                         + v10
                                                         + ((HIDWORD(v10) + v10) >> 16)
                                                         + ((unsigned __int16)(WORD2(v10)
                                                                             + v10
                                                                             + ((HIDWORD(v10) + v10) >> 16)) >> 8)))
      goto LABEL_92;
    v11 = *(_QWORD *)(a3 + 16);
    v12 = v9 ^ v11;
    if (*(unsigned __int8 *)(a3 + 24) != (BYTE4(v12)
                                                          + v12
                                                          + ((HIDWORD(v12) + v12) >> 16)
                                                          + ((unsigned __int16)(WORD2(v12)
                                                                              + v12
                                                                              + ((HIDWORD(v12) + v12) >> 16)) >> 8)))
      goto LABEL_92;
    if (!v8)
    {
LABEL_36:
      *(_QWORD *)(a2 + 8 * v4 + 32) = v11;
      if (v11)
      {
        v21 = v11 & 0xFFFFFFFFFF800000;
        if (v11 < (v11 & 0xFFFFFFFFFF800000 | 0x7FA6))
          goto LABEL_56;
        v22 = v11;
        if (v11 >= (v21 | 0x81F8))
        {
LABEL_41:
          if (v22)
          {
LABEL_56:
            v27 = v11 < v21 + 32678 || v11 >= v21 + 33272;
            v28 = v27;
            if (!v27)
            {
              if ((*(_WORD *)(v11 + 16) & 0x8000) == 0
                || (unint64_t)(*(_WORD *)(v11 + 16) & 0x7FFF) << 9 == -(uint64_t)v21)
              {
                goto LABEL_84;
              }
              v29 = *(_QWORD *)v11;
              if (!*(_QWORD *)v11)
                goto LABEL_74;
              goto LABEL_66;
            }
            v29 = *(_QWORD *)v11;
            v30 = *(_QWORD *)(a1 + 632) ^ a1 ^ *(_QWORD *)v11;
            if (*(unsigned __int8 *)(v11 + 8) == (BYTE4(v30)
                                                                  + v30
                                                                  + ((HIDWORD(v30) + v30) >> 16)
                                                                  + ((unsigned __int16)(WORD2(v30)
                                                                                      + v30
                                                                                      + ((HIDWORD(v30) + v30) >> 16)) >> 8)))
            {
              if (!v29)
              {
LABEL_74:
                v32 = 0;
LABEL_76:
                v35 = a3;
                if (!v7)
                {
                  v36 = *(_WORD *)(a3 + 16);
                  v37 = v5 + ((unint64_t)(v36 & 0x7FFF) << 9);
                  if (v36 < 0)
                    v35 = v37;
                  else
                    v35 = 0;
                }
                if (v32 != v35)
                  small_free_list_remove_ptr_no_clear_cold_2(a1, a3, v29);
                if ((v28 & 1) != 0)
                {
                  v38 = *(_QWORD *)(a1 + 632) ^ a1 ^ v8;
                  *(_BYTE *)(v11 + 8) = BYTE4(v38)
                                      + v38
                                      + ((HIDWORD(v38) + v38) >> 16)
                                      + ((unsigned __int16)(WORD2(v38) + v38 + ((HIDWORD(v38) + v38) >> 16)) >> 8);
                }
                *(_QWORD *)v11 = v8;
                goto LABEL_84;
              }
LABEL_66:
              v31 = v29 & 0xFFFFFFFFFF800000;
              if (v29 < (v29 & 0xFFFFFFFFFF800000 | 0x7FA6))
              {
                v32 = v29;
              }
              else
              {
                v32 = v29;
                if (v29 < (v31 | 0x81F8))
                {
                  v33 = *(_WORD *)(v29 + 16);
                  v34 = v33;
                  v32 = v31 + ((unint64_t)(v33 & 0x7FFF) << 9);
                  if (v34 >= 0)
                    v32 = 0;
                }
              }
              goto LABEL_76;
            }
LABEL_92:
            free_list_checksum_botch(a1);
            __break(1u);
            return;
          }
          goto LABEL_44;
        }
        if ((*(_WORD *)(v11 + 16) & 0x8000) != 0)
        {
          v22 = v21 + ((unint64_t)(*(_WORD *)(v11 + 16) & 0x7FFF) << 9);
          goto LABEL_41;
        }
      }
LABEL_44:
      *(_DWORD *)(a2 + 4 * (v4 >> 5) + 2088) &= ~(1 << v4);
      if (!v11)
        goto LABEL_84;
      goto LABEL_55;
    }
  }
  else
  {
    v8 = *(_QWORD *)a3;
    v11 = *(_QWORD *)(a3 + 8);
    if (!*(_QWORD *)a3)
      goto LABEL_36;
  }
  v13 = v8 < (v8 & 0xFFFFFFFFFF800000 | 0x7FA6) || v8 >= (v8 & 0xFFFFFFFFFF800000 | 0x81F8);
  v14 = v13;
  if (v13)
  {
    v15 = *(_QWORD *)(v8 + 16);
    v16 = *(_QWORD *)(a1 + 632) ^ a1 ^ v15;
    if (*(unsigned __int8 *)(v8 + 24) != (BYTE4(v16)
                                                          + v16
                                                          + ((HIDWORD(v16) + v16) >> 16)
                                                          + ((unsigned __int16)(WORD2(v16)
                                                                              + v16
                                                                              + ((HIDWORD(v16) + v16) >> 16)) >> 8)))
      goto LABEL_92;
    if (!v15)
    {
LABEL_35:
      v18 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    if ((*(_WORD *)(v8 + 16) & 0x8000) == 0
      || (unint64_t)(*(_WORD *)(v8 + 16) & 0x7FFF) << 9 == -(uint64_t)(v8 & 0xFFFFFFFFFF800000))
    {
      goto LABEL_36;
    }
    v15 = *(_QWORD *)(v8 + 8);
    if (!v15)
      goto LABEL_35;
  }
  v17 = v15 & 0xFFFFFFFFFF800000;
  if (v15 < (v15 & 0xFFFFFFFFFF800000 | 0x7FA6))
  {
    v18 = v15;
  }
  else
  {
    v18 = v15;
    if (v15 < (v17 | 0x81F8))
    {
      v19 = *(_WORD *)(v15 + 16);
      v20 = v19;
      v18 = v17 + ((unint64_t)(v19 & 0x7FFF) << 9);
      if (v20 >= 0)
        v18 = 0;
    }
  }
LABEL_47:
  v23 = a3;
  if (!v7)
  {
    v24 = *(_WORD *)(a3 + 16);
    v25 = v24;
    v23 = v5 + ((unint64_t)(v24 & 0x7FFF) << 9);
    if (v25 >= 0)
      v23 = 0;
  }
  if (v18 != v23)
    small_free_list_remove_ptr_no_clear_cold_3(a1, a3, v15);
  if ((v14 & 1) == 0)
  {
    *(_QWORD *)(v8 + 8) = v11;
    if (!v11)
      goto LABEL_84;
    goto LABEL_55;
  }
  v26 = *(_QWORD *)(a1 + 632) ^ a1 ^ v11;
  *(_BYTE *)(v8 + 24) = BYTE4(v26)
                      + v26
                      + ((HIDWORD(v26) + v26) >> 16)
                      + ((unsigned __int16)(WORD2(v26) + v26 + ((HIDWORD(v26) + v26) >> 16)) >> 8);
  *(_QWORD *)(v8 + 16) = v11;
  if (v11)
  {
LABEL_55:
    v21 = v11 & 0xFFFFFFFFFF800000;
    goto LABEL_56;
  }
LABEL_84:
  if (!v7)
  {
    *(_QWORD *)a3 = -1;
    *(_QWORD *)(a3 + 8) = -1;
    *(_WORD *)(a3 + 16) = 0;
  }
}

void small_free_list_remove_ptr(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  unint64_t v4;
  unint64_t v5;
  __int16 v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (a3)
  {
    v4 = a3 & 0xFFFFFFFFFF800000;
    if ((a3 & 0xFFFFFFFFFF800000 | 0x7FA6) > a3)
    {
      v5 = a3;
    }
    else
    {
      v5 = a3;
      if ((v4 | 0x81F8) > a3)
      {
        v6 = *(_WORD *)(a3 + 16);
        v7 = v4 + ((unint64_t)(v6 & 0x7FFF) << 9);
        if (v6 < 0)
          v5 = v7;
        else
          v5 = 0;
      }
    }
  }
  else
  {
    v5 = 0;
  }
  v8 = v5 & 0xFFFFFFFFFF800000;
  v9 = ((v5 - (v5 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF;
  v10 = ((unint64_t)(v5 + (a4 << 9) - 33281) >> 9) & 0x3FFF;
  if (v9 > v10)
    nanov2_realloc_VARIANT_mp_cold_1(a1);
  v11 = v8 | 0x28;
  if ((*(_WORD *)(v11 + 2 * v9) & 0x7FFF) != a4)
    nanov2_realloc_VARIANT_mp_cold_1(a1);
  *(_WORD *)(v11 + 2 * v9) = 0;
  *(_WORD *)(v11 + 2 * v10) = 0;
  small_free_list_remove_ptr_no_clear(a1, a2, a3, a4);
}

void free_small(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  __int16 v15;
  uint64_t v16;
  int i;
  unint64_t v18;
  unsigned int v19;
  unsigned __int16 v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
  unsigned __int16 v26;
  unsigned int v27;
  unint64_t v28;
  int v29;
  unint64_t v30;
  unsigned int v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  int64x2_t *v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  os_unfair_lock_s *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  int64x2_t v43;
  int64x2_t v44;
  int64x2_t v45;
  uint64_t v46;
  unsigned int v47;
  int v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;

  v7 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
  v8 = *(_QWORD *)(a1 + 624);
  if (a4)
  {
    v9 = (unint64_t)(a4 + 511) >> 9;
  }
  else
  {
    LODWORD(v9) = *(__int16 *)((a2 & 0xFFFFFFFFFF800000)
                             + 2 * (((a2 - (a2 & 0xFF800000) - 33280) >> 9) & 0x3FFF)
                             + 0x28);
    if ((v9 & 0x80000000) != 0)
    {
LABEL_28:
      free_small_botch(a1);
      return;
    }
  }
  v10 = v8 + 2560 * v7;
  os_unfair_lock_lock_with_options();
  if (v7 == -1)
  {
    v13 = a2;
    goto LABEL_12;
  }
  v11 = v8 + 2560 * v7;
  v14 = *(_QWORD *)(v11 + 8);
  v12 = v11 + 8;
  v13 = v14;
  if (v14 == a2)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)v10);
    goto LABEL_28;
  }
  v15 = *(_WORD *)(v12 + 8);
  v16 = *(_QWORD *)(v12 + 16);
  if ((_WORD)v9 && (*(_DWORD *)(a1 + 620) & 0x20) != 0)
  {
    v50 = *(_WORD *)(v12 + 8);
    v49 = *(_QWORD *)(v12 + 16);
    _platform_memset();
    v16 = v49;
    v15 = v50;
  }
  *(_QWORD *)v12 = a2;
  *(_WORD *)(v12 + 8) = v9;
  *(_QWORD *)(v12 + 16) = a3;
  if (!v13)
    goto LABEL_48;
  a3 = v16;
  LOWORD(v9) = v15;
LABEL_12:
  for (i = *(_DWORD *)(a3 + 24); v7 != i; i = *(_DWORD *)(a3 + 24))
  {
    v7 = i;
    os_unfair_lock_unlock((os_unfair_lock_t)v10);
    v10 = *(_QWORD *)(a1 + 624) + 2560 * v7;
    os_unfair_lock_lock_with_options();
  }
  if (malloc_tracing_enabled)
    kdebug_trace();
  v51 = (unsigned __int16)v9 << 9;
  if (*(_DWORD *)(a3 + 33276) != unk_1ECCD9619)
  {
    malloc_zone_error(64, 1, (uint64_t)"Region cookie corrupted for region %p (value is %x)[%p]\n");
    __break(1u);
    return;
  }
  v18 = v13 & 0xFFFFFFFFFF800000 | 0x28;
  v19 = ((v13 + 8355328) >> 9) & 0x3FFF;
  v20 = v9;
  v21 = v13;
  if (v19)
  {
    v22 = *(__int16 *)(v18 + 2 * (v19 - 1));
    v20 = v9;
    v21 = v13;
    if (v22 < 0)
    {
      v23 = *(_WORD *)(v18 + 2 * (v19 - 1)) & 0x7FFF;
      if ((v22 & 0x7FFF | 0x8000) != *(unsigned __int16 *)(v18 + 2 * (v19 - (v22 & 0x7FFF))))
        free_small_cold_1();
      v21 = v13 - (v23 << 9);
      small_free_list_find_by_ptr(a1, v21, v23);
      small_free_list_remove_ptr(a1, v10, v24, v23);
      *(_WORD *)(v18 + 2 * v19) = 0;
      v20 = v23 + v9;
    }
  }
  if (v13 + v51 < a3 + 0x800000)
  {
    v25 = *(__int16 *)(v18 + 2 * (unsigned __int16)(v9 + v19));
    if (v25 < 0)
    {
      v26 = v20;
      v27 = v25 & 0x7FFF;
      small_free_list_find_by_ptr(a1, v13 + v51, v27);
      small_free_list_remove_ptr(a1, v10, v28, v27);
      v20 = v27 + v26;
    }
  }
  v29 = *(_DWORD *)(a1 + 620);
  if ((v29 & 0x20) != 0)
  {
    if (v20)
      _platform_memset();
    else
      malloc_zone_error(v29, 1, (uint64_t)"incorrect size information for %p - block header was damaged\n");
  }
  v30 = small_free_list_add_ptr(a1, v10, v21, v20);
  *(_QWORD *)(v10 + 2152) -= v51;
  v31 = *(_DWORD *)(a3 + 16) - v51;
  *(_DWORD *)(a3 + 16) = v31;
  if (aggressive_madvise_enabled)
  {
    small_madvise_free_range_no_lock(a1, (os_unfair_lock_s *)v10, a3, v30, v20, v13, v51);
    v31 = *(_DWORD *)(a3 + 16);
  }
  if (v7 != -1)
  {
    if (v31 <= 0x5F9E7F)
      *(_BYTE *)(a3 + 32) = 1;
    v32 = *(_QWORD *)(v10 + 2160);
    v33 = *(_QWORD *)(v10 + 2152);
    if (v32 - v33 >= 0xBF3D01 && v33 < v32 - (v32 >> 2))
    {
      v34 = *(_QWORD *)(v10 + 2176);
      if (v34)
      {
        v35 = (int64x2_t *)(v10 + 2152);
        while (!*(_BYTE *)(v34 + 32) || *(_DWORD *)(v34 + 28))
        {
          v34 = *(_QWORD *)(v34 + 8);
          if (!v34)
            goto LABEL_48;
        }
        if (*(_QWORD *)(v10 + 2144) == (v34 & 0xFFFFFFFFFF800000)
          && (*(_QWORD *)(v10 + 2128) || *(_QWORD *)(v10 + 2136)))
        {
          small_finalize_region(a1, v10);
        }
        v36 = *(_QWORD *)v34;
        v37 = *(_QWORD **)(v34 + 8);
        if (*(_QWORD *)v34)
        {
          *(_QWORD *)(v36 + 8) = v37;
          v37 = *(_QWORD **)(v34 + 8);
        }
        else
        {
          *(_QWORD *)(v10 + 2176) = v37;
        }
        if (!v37)
          v37 = (_QWORD *)(v10 + 2184);
        *v37 = v36;
        *(_QWORD *)v34 = 0;
        *(_QWORD *)(v34 + 8) = 0;
        --*(_DWORD *)(v10 + 2172);
        v40 = small_free_detach_region(a1, v10, v34 & 0xFFFFFFFFFF800000);
        v41 = *(_QWORD *)(a1 + 624);
        os_unfair_lock_lock_with_options();
        *(_DWORD *)((v34 & 0xFFFFFFFFFF800000) + 0x18) = -1;
        *(_DWORD *)(v34 + 28) = 0;
        v42 = small_free_reattach_region(a1, v41 - 2560, v34 & 0xFFFFFFFFFF800000);
        v43 = vdupq_n_s64(0xFFFFFFFFFF808200);
        v44 = vaddq_s64(*v35, v43);
        v43.i64[0] = v42;
        v43.i64[0] = vsubq_s64(*v35, v43).u64[0];
        v43.i64[1] = v44.i64[1];
        *v35 = v43;
        *(_DWORD *)(v10 + 2168) -= v40;
        os_unfair_lock_unlock((os_unfair_lock_t)v10);
        v45 = vdupq_n_s64(0x7F7E00uLL);
        v45.i64[0] = v42;
        *(int64x2_t *)(v41 - 408) = vaddq_s64(*(int64x2_t *)(v41 - 408), v45);
        *(_DWORD *)(v41 - 392) += v40;
        v46 = *(_QWORD *)(v41 - 376);
        if (v46)
          *(_QWORD *)(v46 + 8) = v34;
        else
          *(_QWORD *)(v41 - 384) = v34;
        *(_QWORD *)v34 = v46;
        *(_QWORD *)(v41 - 376) = v34;
        *(_QWORD *)(v34 + 8) = 0;
        *(_BYTE *)(v34 + 32) = 0;
        ++*(_DWORD *)(v41 - 388);
        if (!aggressive_madvise_enabled)
          small_free_scan_madvise_free(a1, (os_unfair_lock_s *)(v41 - 2560), v34 & 0xFFFFFFFFFF800000);
        v38 = small_free_try_depot_unmap_no_lock(a1, v41 - 2560, v34);
        v39 = (os_unfair_lock_s *)(v41 - 2560);
        goto LABEL_65;
      }
    }
LABEL_48:
    os_unfair_lock_unlock((os_unfair_lock_t)v10);
    return;
  }
  if (aggressive_madvise_enabled)
  {
    if (v31)
      goto LABEL_48;
  }
  else
  {
    small_madvise_free_range_no_lock(a1, (os_unfair_lock_s *)v10, a3, v30, v20, v13, v51);
    if (v31)
      goto LABEL_48;
  }
  if (*(int *)(a3 + 28) > 0)
    goto LABEL_48;
  v38 = small_free_try_depot_unmap_no_lock(a1, v10, a3);
  v39 = (os_unfair_lock_s *)v10;
LABEL_65:
  os_unfair_lock_unlock(v39);
  if (v38)
  {
    v47 = *(_DWORD *)(a1 + 620);
    if ((v47 & 4) != 0)
      v48 = -2;
    else
      v48 = -4;
    mvm_deallocate_pages(v38, 0x800000, v48 & v47);
  }
}

unint64_t small_free_list_add_ptr(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  unsigned int v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  if (a4 >= 0x20)
    v4 = 30;
  else
    v4 = a4 - 1;
  if (!a4)
    nanov2_realloc_VARIANT_mp_cold_1();
  v5 = a2 + 8 * v4;
  v8 = *(_QWORD *)(v5 + 32);
  v6 = (unint64_t *)(v5 + 32);
  v7 = v8;
  if (((*MEMORY[0x1E0C88820] - 1) & a3) == 0 && (unint64_t)a4 << 9 >= *MEMORY[0x1E0C88808])
  {
    v10 = 0;
    while (*(_WORD *)((a3 & 0xFFFFFFFFFF800000 | 0x7FB6) + v10))
    {
      v10 += 18;
      if (v10 == 594)
        goto LABEL_15;
    }
    v11 = (a3 & 0xFFFFFFFFFF800000) + v10;
    *(_WORD *)(v11 + 32694) = (a3 >> 9) & 0x3FFF | 0x8000;
    a3 = v11 + 32678;
  }
LABEL_15:
  v12 = a3 & 0xFFFFFFFFFF800000;
  if (a3 < (a3 & 0xFFFFFFFFFF800000 | 0x7FA6) || a3 >= (v12 | 0x81F8))
  {
    v16 = *(_QWORD *)(a1 + 632) ^ a1;
    *(_BYTE *)(a3 + 8) = BYTE4(v16)
                       + v16
                       + ((HIDWORD(v16) + v16) >> 16)
                       + ((unsigned __int16)(WORD2(v16) + v16 + ((HIDWORD(v16) + v16) >> 16)) >> 8);
    *(_QWORD *)a3 = 0;
    LODWORD(v16) = ((v16 ^ v7) >> 32) + (v16 ^ v7) + ((((v16 ^ v7) >> 32) + (v16 ^ v7)) >> 16);
    *(_BYTE *)(a3 + 24) = v16 + BYTE1(v16);
    *(_QWORD *)(a3 + 16) = v7;
    v15 = a3;
  }
  else
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = v7;
    if (a3)
    {
      v13 = *(_WORD *)(a3 + 16);
      v14 = v12 + ((unint64_t)(v13 & 0x7FFF) << 9);
      if (v13 < 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
  }
  v17 = ((v15 - (v15 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF;
  v18 = ((unint64_t)(v15 + (a4 << 9) - 33281) >> 9) & 0x3FFF;
  if (v17 > v18)
    nanov2_realloc_VARIANT_mp_cold_1();
  v19 = (v15 & 0xFFFFFFFFFF800000) + 40;
  *(_WORD *)(v19 + 2 * v17) = a4 | 0x8000;
  *(_WORD *)(v19 + 2 * v18) = a4 | 0x8000;
  if (!v7)
    goto LABEL_32;
  v20 = v7 & 0xFFFFFFFFFF800000;
  if (v7 < (v7 & 0xFFFFFFFFFF800000 | 0x7FA6) || v7 >= (v20 | 0x81F8))
  {
    v21 = *(_QWORD *)(a1 + 632) ^ a1 ^ a3;
    *(_BYTE *)(v7 + 8) = BYTE4(v21)
                       + v21
                       + ((HIDWORD(v21) + v21) >> 16)
                       + ((unsigned __int16)(WORD2(v21) + v21 + ((HIDWORD(v21) + v21) >> 16)) >> 8);
  }
  else if ((*(_WORD *)(v7 + 16) & 0x8000) == 0
         || (unint64_t)(*(_WORD *)(v7 + 16) & 0x7FFF) << 9 == -(uint64_t)v20)
  {
LABEL_32:
    *(_DWORD *)(a2 + 4 * (v4 >> 5) + 2088) |= 1 << v4;
    goto LABEL_33;
  }
  *(_QWORD *)v7 = a3;
LABEL_33:
  *v6 = a3;
  return a3;
}

unint64_t small_madvise_free_range_no_lock(unint64_t result, os_unfair_lock_s *a2, uint64_t a3, unint64_t a4, unsigned int a5, unint64_t a6, uint64_t a7)
{
  uint64_t v10;
  unint64_t v11;
  __int16 v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;

  v10 = result;
  v11 = a4 & 0xFFFFFFFFFF800000;
  if (a4)
  {
    if (v11 + 32678 > a4 || v11 + 33272 <= a4)
    {
      v16 = a4 & 0xFFFFFFFFFF800000;
      v15 = a4;
    }
    else
    {
      v12 = *(_WORD *)(a4 + 16);
      v13 = v12;
      v14 = v11 + ((unint64_t)(v12 & 0x7FFF) << 9);
      if (v13 < 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = a4 & 0xFFFFFFFFFF800000;
    }
  }
  else
  {
    v16 = 0;
    v15 = 0;
  }
  v18 = v11 + 32678 > a4;
  v17 = v11 + 33272;
  v18 = !v18 && v17 > a4;
  v19 = !v18;
  v20 = 10;
  if (!v19)
    v20 = 0;
  v21 = *MEMORY[0x1E0C887F8];
  v22 = (*MEMORY[0x1E0C887F8] + v20 + v15) & ~*MEMORY[0x1E0C887F8];
  v23 = (v15 + ((unint64_t)a5 << 9)) & ~*MEMORY[0x1E0C887F8];
  if (v22 < v23)
  {
    v24 = (a6 + a7 + v20 + v21) & ~v21;
    v25 = v22 <= (~v21 & a6) ? ~v21 & a6 : v22;
    v26 = v23 >= v24 ? v24 : (v15 + ((unint64_t)a5 << 9)) & ~*MEMORY[0x1E0C887F8];
    if (v25 < v26)
    {
      if (!a4)
        LOBYTE(v19) = 1;
      v27 = a4;
      if ((v19 & 1) == 0)
      {
        v28 = *(_WORD *)(a4 + 16);
        v29 = v16 + ((unint64_t)(v28 & 0x7FFF) << 9);
        if (v28 < 0)
          v27 = v29;
        else
          v27 = 0;
      }
      v30 = ((v27 - (v27 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF;
      v31 = ((unint64_t)(v27 + (a5 << 9) - 33281) >> 9) & 0x3FFF;
      if (v30 > v31)
        nanov2_realloc_VARIANT_mp_cold_1(result);
      v32 = (v27 & 0xFFFFFFFFFF800000) + 40;
      *(_WORD *)(v32 + 2 * v30) &= ~0x8000u;
      *(_WORD *)(v32 + 2 * v31) &= ~0x8000u;
      small_free_list_remove_ptr_no_clear(result, (uint64_t)a2, a4, a5);
      OSAtomicIncrement32Barrier((int32_t *)(a3 + 28));
      os_unfair_lock_unlock(a2);
      mvm_madvise_free(v10, a3, v25, v26, v10 + 640, *(_DWORD *)(v10 + 620) & 0x20);
      os_unfair_lock_lock_with_options();
      OSAtomicDecrement32Barrier((int32_t *)(a3 + 28));
      return small_free_list_add_ptr(v10, (uint64_t)a2, v15, a5);
    }
  }
  return result;
}

_QWORD *nanov2_allocate_outlined(uint64_t a1, unsigned int **a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int *a6, uint64_t a7, char a8, char a9, uint64_t a10)
{
  unsigned __int16 *v16;
  uint64_t v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  unint64_t v20;
  _QWORD *VARIANT_mp;
  unsigned __int16 v22;
  char v24;

  if (a7)
    nanov2_guard_corruption_detected();
  if (a6)
    nanov2_madvise_block_VARIANT_mp((const os_unfair_lock *)a1, a6, a4, 2047);
  v16 = (unsigned __int16 *)(a1 + 28672);
  if (((1 << a4) & *(unsigned __int16 *)(a1 + 28672)) != 0)
  {
LABEL_5:
    v17 = *(_QWORD *)(a1 + 28704);
    if (a9)
      v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 160))(v17, a3, a10);
    else
      v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 24))(v17, a3);
    VARIANT_mp = (_QWORD *)v18;
    if (!v18)
    {
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return VARIANT_mp;
    }
    goto LABEL_12;
  }
  v24 = a8;
  v19 = (os_unfair_lock_s *)(a1 + ((unint64_t)a4 << 8) + 4 * a5 + 24576);
  os_unfair_lock_lock_with_options();
  if (*a2)
  {
    v20 = nanov2_allocate_from_block_VARIANT_mp(a1, *a2, a4);
    if (v20)
    {
      VARIANT_mp = (_QWORD *)v20;
      os_unfair_lock_unlock(v19);
      a8 = v24;
      goto LABEL_12;
    }
  }
  VARIANT_mp = (_QWORD *)nanov2_find_block_and_allocate_VARIANT_mp(a1, a4, a2);
  os_unfair_lock_unlock(v19);
  a8 = v24;
  if (!VARIANT_mp)
  {
    do
      v22 = __ldxr(v16);
    while (__stxr(v22 | (1 << a4), v16));
    goto LABEL_5;
  }
LABEL_12:
  switch(malloc_zero_policy)
  {
    case 2:
LABEL_17:
      _platform_memset();
      return VARIANT_mp;
    case 1:
      if ((a8 & 1) == 0)
      {
        *VARIANT_mp = 0;
        return VARIANT_mp;
      }
      goto LABEL_17;
    case 0:
      *VARIANT_mp = 0;
      VARIANT_mp[1] = 0;
      break;
  }
  return VARIANT_mp;
}

_QWORD *nanov2_allocate_outlined_0(uint64_t a1, atomic_uint **a2, uint64_t a3, unsigned int a4, unsigned int a5, atomic_uint *a6, uint64_t a7, char a8, char a9, uint64_t a10)
{
  uint64_t v16;
  uint64_t v17;
  os_unfair_lock_s *v18;
  unint64_t v19;
  _QWORD *VARIANT_armv81;
  char v22;

  if (a7)
    nanov2_guard_corruption_detected();
  if (a6)
    nanov2_madvise_block_VARIANT_armv81((const os_unfair_lock *)a1, a6, a4, 2047);
  if (((1 << a4) & *(unsigned __int16 *)(a1 + 28672)) != 0)
  {
LABEL_5:
    v16 = *(_QWORD *)(a1 + 28704);
    if (a9)
      v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 160))(v16, a3, a10);
    else
      v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 24))(v16, a3);
    VARIANT_armv81 = (_QWORD *)v17;
    if (!v17)
    {
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return VARIANT_armv81;
    }
    goto LABEL_12;
  }
  v22 = a8;
  v18 = (os_unfair_lock_s *)(a1 + ((unint64_t)a4 << 8) + 4 * a5 + 24576);
  os_unfair_lock_lock_with_options();
  if (*a2)
  {
    v19 = nanov2_allocate_from_block_VARIANT_armv81(a1, *a2, a4);
    if (v19)
    {
      VARIANT_armv81 = (_QWORD *)v19;
      os_unfair_lock_unlock(v18);
      a8 = v22;
      goto LABEL_12;
    }
  }
  VARIANT_armv81 = (_QWORD *)nanov2_find_block_and_allocate_VARIANT_armv81(a1, a4, a2);
  os_unfair_lock_unlock(v18);
  a8 = v22;
  if (!VARIANT_armv81)
  {
    atomic_fetch_or_explicit((atomic_ushort *volatile)(a1 + 28672), 1 << a4, memory_order_relaxed);
    goto LABEL_5;
  }
LABEL_12:
  switch(malloc_zero_policy)
  {
    case 2:
LABEL_17:
      _platform_memset();
      return VARIANT_armv81;
    case 1:
      if ((a8 & 1) == 0)
      {
        *VARIANT_armv81 = 0;
        return VARIANT_armv81;
      }
      goto LABEL_17;
    case 0:
      *VARIANT_armv81 = 0;
      VARIANT_armv81[1] = 0;
      break;
  }
  return VARIANT_armv81;
}

void small_free_list_find_by_ptr(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v3;
  uint64_t i;
  __int16 v6;
  int v7;
  unint64_t v8;

  v3 = a2 & 0xFFFFFFFFFF800000;
  if ((a3 | 0x8000) == *(unsigned __int16 *)((a2 & 0xFFFFFFFFFF800000 | (2
                                                                          * (((unint64_t)(a2
                                                                                               - (a2 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                                            + 0x28))
  {
    if (((*MEMORY[0x1E0C88820] - 1) & a2) == 0 && (unint64_t)a3 << 9 >= *MEMORY[0x1E0C88808])
    {
      for (i = 0; i != 594; i += 18)
      {
        v6 = *(_WORD *)(v3 + 32694 + i);
        if (v6)
        {
          v7 = v6;
          v8 = ((v3 + 32678 + i) & 0xFFFFFFFFFF800000) + ((unint64_t)(v6 & 0x7FFF) << 9);
          if (v7 >= 0)
            v8 = 0;
          if (v8 == a2)
            break;
        }
      }
    }
  }
  else
  {
    malloc_zone_error(*(_DWORD *)(a1 + 620), 1, (uint64_t)"small_free_list_find_by_ptr: ptr is not free (ptr metadata !SMALL_IS_FREE), ptr=%p msize=%d metadata=0x%x\n");
    __break(1u);
  }
}

void *__cdecl malloc_zone_calloc(malloc_zone_t *zone, size_t num_items, size_t size)
{
  return (void *)_malloc_zone_calloc((uint64_t)zone, num_items, size, 0);
}

unint64_t small_free_try_depot_unmap_no_lock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;

  if (*(_DWORD *)(a3 + 16))
    return 0;
  if (*(int *)(a3 + 28) > 0)
    return 0;
  v5 = *(_DWORD *)(a2 + 2172);
  if (v5 < recirc_retained_regions)
    return 0;
  v7 = *(_QWORD *)a3;
  v8 = *(_QWORD **)(a3 + 8);
  if (*(_QWORD *)a3)
  {
    *(_QWORD *)(v7 + 8) = v8;
    v8 = *(_QWORD **)(a3 + 8);
  }
  else
  {
    *(_QWORD *)(a2 + 2176) = v8;
  }
  if (!v8)
    v8 = (_QWORD *)(a2 + 2184);
  *v8 = v7;
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_DWORD *)(a2 + 2172) = v5 - 1;
  v9 = a3 & 0xFFFFFFFFFF800000;
  if (small_free_detach_region(a1, a2, a3 & 0xFFFFFFFFFF800000))
  {
    malloc_zone_error(*(_DWORD *)(a1 + 620), 1, (uint64_t)"small_free_try_depot_unmap_no_lock objects_in_use not zero: %d\n");
    return 0;
  }
  if (!rack_region_remove(a1, a3 & 0xFFFFFFFFFF800000, a3))
    return 0;
  *(_QWORD *)(a2 + 2160) -= 8355328;
  return v9;
}

void *__cdecl malloc_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size)
{
  unint64_t v3;

  return (void *)_malloc_zone_memalign((uint64_t)zone, alignment, size, 0, (v3 >> 2));
}

void rack_region_insert(uint64_t a1, unint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_vm_address_t pages;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  os_unfair_lock_lock_with_options();
  v4 = *(_QWORD **)(a1 + 24);
  v5 = *v4;
  if (*v4 < (unint64_t)(2 * *(_QWORD *)(a1 + 8)))
  {
    v7 = v4[1];
    v6 = v4[2];
    v8 = 2 * v5;
    pages = mvm_allocate_pages((*MEMORY[0x1E0C88820] + 16 * v5 - 1) & -*MEMORY[0x1E0C88820], 0, 0x40000000, 1);
    if (v5)
    {
      v10 = 0;
      v11 = 63 - v7;
      do
      {
        v12 = *(_QWORD *)(v6 + 8 * v10);
        if (v12 + 1 >= 2)
        {
          v13 = (0x9E3779B97F4A7C55 * (v12 >> 20)) >> v11;
          while ((unint64_t)(*(_QWORD *)(pages + 8 * v13) + 1) > 1)
          {
            if (v13 + 1 == v8)
              v13 = 0;
            else
              ++v13;
            if (v13 == (0x9E3779B97F4A7C55 * (v12 >> 20)) >> v11)
              goto LABEL_13;
          }
          *(_QWORD *)(pages + 8 * v13) = v12;
        }
LABEL_13:
        ++v10;
      }
      while (v10 != v5);
    }
    v14 = *(uint64_t **)(*(_QWORD *)(a1 + 24) + 24);
    v14[1] = v7 + 1;
    v14[2] = pages;
    *v14 = v8;
    OSMemoryBarrier();
    v4 = *(_QWORD **)(*(_QWORD *)(a1 + 24) + 24);
    *(_QWORD *)(a1 + 24) = v4;
    v5 = *v4;
  }
  v15 = v4[2];
  v16 = (0x9E3779B97F4A7C55 * (a2 >> 20)) >> -*((_BYTE *)v4 + 8);
  v17 = v16;
  while ((unint64_t)(*(_QWORD *)(v15 + 8 * v17) + 1) > 1)
  {
    if (v17 + 1 == v5)
      v17 = 0;
    else
      ++v17;
    if (v17 == v16)
      goto LABEL_23;
  }
  *(_QWORD *)(v15 + 8 * v17) = a2;
LABEL_23:
  ++*(_QWORD *)(a1 + 8);
  os_unfair_lock_unlock((os_unfair_lock_t)a1);
}

void szone_free_definite_size(uint64_t a1, unint64_t a2, unint64_t a3)
{
  int v3;
  const char *v4;

  if (a2)
  {
    if ((a2 & 0xF) != 0)
    {
      v3 = *(_DWORD *)(a1 + 16392);
      v4 = "Non-aligned pointer %p being freed\n";
    }
    else if (a3 > 0x3F0)
    {
      if ((a2 & 0x1FF) != 0)
      {
        v3 = *(_DWORD *)(a1 + 16392);
        v4 = "Non-aligned pointer %p being freed (2)\n";
      }
      else if (a3 > 0x3C00)
      {
        if (((*MEMORY[0x1E0C88820] - 1) & a2) == 0)
        {
          free_large(a1, a2, 0);
          return;
        }
        v3 = *(_DWORD *)(a1 + 16392);
        v4 = "non-page-aligned, non-allocated pointer %p being freed\n";
      }
      else
      {
        if ((((_DWORD)a2 + 8355328) & 0x7FFE00u) <= 0x7F7C00uLL)
        {
          free_small(a1 + 17280, a2, a2 & 0xFFFFFFFFFF800000, a3);
          return;
        }
        v3 = *(_DWORD *)(a1 + 16392);
        v4 = "Pointer %p to metadata being freed (2)\n";
      }
    }
    else
    {
      if ((((_DWORD)a2 + 1032064) & 0xFFF80u) <= 0xFBF70uLL)
      {
        free_tiny(a1 + 16512, a2, a2 & 0xFFFFFFFFFFF00000, a3, 0);
        return;
      }
      v3 = *(_DWORD *)(a1 + 16392);
      v4 = "Pointer %p to metadata being freed\n";
    }
    malloc_zone_error(v3, 1, (uint64_t)v4);
  }
}

uint64_t __malloc_late_init(uint64_t a1)
{
  uint64_t zone;
  unint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  char ***v9;
  uint64_t *v10;
  uint64_t result;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(char **);
  char ***v15;

  pgm_init_config(*(unsigned __int8 *)(a1 + 24));
  if ((has_injected_zone0 & 1) == 0 && !malloc_sanitizer_enabled && pgm_should_enable())
  {
    zone = pgm_create_zone(*(_QWORD *)malloc_zones);
    malloc_zone_register_while_locked(zone, 1);
  }
  v3 = *(_QWORD *)a1;
  _dlopen = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 8);
  _dlsym = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 16);
  if (v3 >= 2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = *(_OWORD *)(v4 + 16);
      msl = *(_OWORD *)v4;
      *(_OWORD *)&off_1EE228058 = v5;
      v6 = *(_OWORD *)(v4 + 32);
      v7 = *(_OWORD *)(v4 + 48);
      v8 = *(_OWORD *)(v4 + 64);
      qword_1EE228098 = *(_QWORD *)(v4 + 80);
      xmmword_1EE228078 = v7;
      *(_OWORD *)&off_1EE228088 = v8;
      xmmword_1EE228068 = v6;
    }
  }
  v9 = _NSGetEnviron();
  v10 = (uint64_t *)*v9;
  result = (uint64_t)**v9;
  if (result)
  {
    v12 = v10 + 1;
    while (_platform_strncmp())
    {
      v13 = *v12++;
      result = v13;
      if (!v13)
        goto LABEL_15;
    }
    result = _malloc_register_stack_logger(1);
    v14 = (uint64_t (*)(char **))xmmword_1EE228078;
    if ((_QWORD)xmmword_1EE228078)
    {
      v15 = _NSGetEnviron();
      result = v14(*v15);
    }
  }
LABEL_15:
  if (*((_QWORD *)&xmmword_1EE228078 + 1))
    result = (*((uint64_t (**)(uint64_t))&xmmword_1EE228078 + 1))(result);
  initial_num_zones = malloc_num_zones;
  if (malloc_sanitizer_enabled)
    return sanitizer_reset_environment();
  return result;
}

char *pgm_init_config(int a1)
{
  char *result;
  BOOL v2;

  if (a1)
    g_env_0 = 1;
  result = getenv("MallocProbGuard");
  if (result)
  {
    g_env_1 = 1;
    result = getenv("MallocProbGuard");
    if (result)
      v2 = *result == 49;
    else
      v2 = 0;
    g_env_2 = v2;
  }
  return result;
}

void nanov2_init(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  int v4;
  uint64_t v5;
  int v6;
  char *v7;
  unint64_t v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  char *v20;
  int v21;
  uint64_t v22;
  BOOL v24;
  int v25;
  uint64_t v26;
  BOOL v28;
  int v29;
  uint64_t v30;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  char *v37;
  int v38;
  char *v39;
  int v40;
  const char *v41;
  unsigned __int8 *v42;
  char *v43;
  _BYTE v44[256];
  _QWORD __src[10];

  __src[8] = *MEMORY[0x1E0C874D8];
  if ((_simple_getenv() || malloc_common_value_for_key(a3, "nanov2_madvise_policy"))
    && _platform_strncmp())
  {
    if (!_platform_strncmp())
    {
      v4 = 1;
      goto LABEL_10;
    }
    if (!_platform_strncmp())
    {
      v4 = 2;
      goto LABEL_10;
    }
    malloc_report(3u, (uint64_t)"%s value (%s) invalid - ignored.\n");
  }
  v4 = 0;
LABEL_10:
  nanov2_madvise_policy = v4;
  v5 = _simple_getenv();
  if (v5 || (v5 = (uint64_t)malloc_common_value_for_key_copy(a3, "nanov2_single_arena", v44, 0x100uLL)) != 0)
  {
    v6 = 0;
    __src[0] = 0;
    v7 = (char *)v5;
    while (*v7)
    {
      v8 = malloc_common_convert_to_long(v7, __src);
      if ((char *)__src[0] == v7
        || ((v9 = *(unsigned __int8 *)__src[0], v9 != 58) ? (v10 = v9 == 0) : (v10 = 1),
            !v10 || v8 - 16 > 0xF0 || (v8 & 0xF) != 0))
      {
        malloc_report(3u, (uint64_t)"%s value (%s) invalid - ignored.\n");
        goto LABEL_25;
      }
      v6 |= 1 << ((v8 >> 4) - 1);
      v7 = (char *)(__src[0] + 1);
      if (!*(_BYTE *)__src[0])
        break;
    }
  }
  else
  {
LABEL_25:
    LOWORD(v6) = 0;
  }
  word_1ECCD9428 = v6;
  v11 = _simple_getenv();
  if (v11)
  {
    v12 = (char *)v11;
  }
  else
  {
    v13 = malloc_common_value_for_key_copy(a3, "nanov2_scan_policy", v44, 0x100uLL);
    if (!v13)
      goto LABEL_69;
    v12 = v13;
  }
  if (!_platform_strcmp())
  {
    v33 = 0;
    goto LABEL_71;
  }
  __src[0] = 0;
  if (!*v12)
  {
LABEL_69:
    v33 = 1;
LABEL_71:
    v19 = 20;
    v18 = 80;
    v17 = 10;
    goto LABEL_72;
  }
  v42 = a3;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 10;
  v18 = 80;
  v19 = 20;
  v20 = v12;
  while (1)
  {
    if (_platform_strncmp() | v14)
    {
      if (_platform_strncmp() | v15)
      {
        if (_platform_strncmp() | v16)
        {
          LOBYTE(v21) = 1;
        }
        else
        {
          v20 += 3;
          v30 = malloc_common_convert_to_long(v20, __src);
          v21 = v20 == (char *)__src[0] || v30 < 0;
          if (!v21)
          {
            v20 = (char *)__src[0];
            v17 = v30;
          }
          v16 = 1;
        }
      }
      else
      {
        v20 += 3;
        v26 = malloc_common_convert_to_long(v20, __src);
        v28 = v20 != (char *)__src[0] && v26 >= 0;
        v29 = v28 && v26 < 101;
        if (v29)
        {
          v20 = (char *)__src[0];
          v18 = v26;
        }
        LOBYTE(v21) = v29 ^ 1;
        v15 = 1;
      }
    }
    else
    {
      v20 += 3;
      v22 = malloc_common_convert_to_long(v20, __src);
      v24 = v20 != (char *)__src[0] && v22 >= 0;
      v25 = v24 && v22 < 101;
      if (v25)
      {
        v20 = (char *)__src[0];
        v19 = v22;
      }
      LOBYTE(v21) = v25 ^ 1;
      v14 = 1;
    }
    if (*v20 != 58)
      break;
    if ((v21 & 1) != 0)
      goto LABEL_75;
    if (!*++v20)
    {
      if (v19 <= v18)
        goto LABEL_92;
LABEL_75:
      malloc_report(3u, (uint64_t)"%s value (%s) invalid - ignored.\n");
      a3 = v42;
      goto LABEL_76;
    }
  }
  if (*v20 || v21 & 1 | (v19 > v18))
    goto LABEL_75;
LABEL_92:
  v33 = 1;
  a3 = v42;
LABEL_72:
  nanov2_policy_config = v33;
  unk_1ECCD941C = v19;
  dword_1ECCD9420 = v18;
  unk_1ECCD9424 = v17;
LABEL_76:
  v34 = _simple_getenv();
  if (v34 || (v34 = (uint64_t)malloc_common_value_for_key_copy(a3, "nanov2_size_class_blocks", v44, 0x100uLL)) != 0)
  {
    v35 = 0;
    v36 = 0;
    v43 = 0;
    v37 = (char *)v34;
    do
    {
      v38 = malloc_common_convert_to_long(v37, &v43);
      v39 = v43;
      if (v43 == v37 || (v35 != 60 ? (v40 = 44) : (v40 = 0), v40 != *v43 || v38 > 64))
      {
        v41 = "%s value invalid: [%s] - ignored.\n";
        goto LABEL_89;
      }
      *(_DWORD *)((char *)__src + v35) = v38;
      v36 += v38;
      v37 = v39 + 1;
      v35 += 4;
    }
    while (v35 != 64);
    if (v36 == 64)
    {
      memcpy(block_units_by_size_class, __src, 0x40uLL);
      return;
    }
    v41 = "%s value invalid - values must sum to %d, not %d - ignored.\n";
LABEL_89:
    malloc_report(3u, (uint64_t)v41);
  }
}

void __malloc_init(const char **a1)
{
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  const char *v6;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  const char *v11;
  const char **v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _BYTE *v17;
  char v18;
  int v19;
  size_t v20;
  const char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  unint64_t v32;
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  int v37;
  char v38;
  char **v39;
  _QWORD *v40;
  unint64_t v42;
  int v43;
  const char *v44;
  char *v45;
  unsigned int v46;
  int v47;
  int v48;
  char *v49;
  unsigned int v50;
  int v51;
  char *v52;
  const char *v53;
  char *v54;
  int v55;
  char *v56;
  unsigned int v57;
  const char *v58;
  unsigned int v59;
  char *v60;
  unint64_t v61;
  const char *v62;
  char *v63;
  int v64;
  char *v65;
  char *v66;
  unint64_t v67;
  char *v68;
  char *v69;
  unint64_t v70;
  char *v71;
  char *v72;
  unint64_t v73;
  char *v74;
  int v75;
  char *v76;
  char *v77;
  unint64_t v78;
  char *v79;
  char *v80;
  unint64_t v81;
  int v82;
  char *v83;
  int v84;
  char *v85;
  char *v86;
  unint64_t v87;
  char *v88;
  char *v89;
  unint64_t v90;
  int v91;
  char *v92;
  char *v93;
  unint64_t v94;
  int v95;
  char *v96;
  int v97;
  char *v98;
  unint64_t v99;
  char *v100;
  char *v101;
  unint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  char v105;
  char v106;
  char v107;
  int v108;
  BOOL v109;
  char v110;
  int v111;
  char v112;
  malloc_zone_t *v113;
  unint64_t *zone;
  mach_vm_address_t v115;
  size_t v116;
  _BYTE *v117;
  unsigned __int8 v118[1024];
  char v119[8];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C874D8];
  bzero(v118, 0x400uLL);
  v2 = getpid();
  if (v2 != 1)
    v2 = _os_feature_enabled_simple_impl();
  v116 = 1023;
  if (v2 && MEMORY[0xFFFFF4084] && !sysctlbyname("kern.bootargs", v118, &v116, 0, 0) && v116)
    v118[v116 + 1] = 0;
  v3 = *MEMORY[0x1E0C88808];
  if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
    v3 = *MEMORY[0x1E0C88820];
  malloc_absolute_max_size = ~(2 * v3);
  v4 = _malloc_allow_internal_security_policy();
  if (malloc_internal_security_policy != v4)
    malloc_internal_security_policy = v4;
  if (getpid() == 1)
  {
    v5 = 1;
  }
  else
  {
    v6 = (const char *)_simple_getenv();
    if (v6 && (strtoull(v6, 0, 0) & 0xF) != 0)
    {
      v5 = 18;
    }
    else
    {
      getprogname();
      v7 = 0;
      while (_platform_strcmp())
      {
        v7 += 2;
        if (v7 == 86)
          goto LABEL_23;
      }
      v5 = (int)(&_malloc_check_process_identity_name_identity_mapping)[v7 + 1];
    }
  }
  malloc_process_identity = v5;
LABEL_23:
  v8 = _os_feature_enabled_simple_impl();
  if (((v8 ^ (malloc_zero_policy != 0)) & 1) == 0)
    malloc_zero_policy = v8 ^ 1;
  v9 = 1;
  if ((malloc_process_identity - 1) >= 0x1F)
  {
    if (malloc_process_identity > 32)
    {
      if (malloc_process_identity == 33)
      {
        if (malloc_internal_security_policy)
          goto LABEL_162;
      }
      else if (malloc_process_identity == 34)
      {
        goto LABEL_26;
      }
    }
    else
    {
      if (!malloc_process_identity)
      {
        if (!malloc_internal_security_policy)
          goto LABEL_26;
        goto LABEL_162;
      }
      if (malloc_process_identity == 32 && malloc_internal_security_policy)
      {
LABEL_162:
        v9 = _os_feature_enabled_simple_impl();
        goto LABEL_26;
      }
    }
    v9 = 0;
  }
LABEL_26:
  if (malloc_xzone_enabled != v9)
    malloc_xzone_enabled = v9;
  v10 = 0x1ECCD9000uLL;
  if (a1 && *a1)
  {
    v11 = 0;
    v12 = a1;
    do
    {
      if ((const char *)_platform_strstr() == *v12)
      {
        if (_platform_strchr())
        {
          v13 = v10;
          v14 = 0;
          v15 = 1;
          do
          {
            v16 = v14;
            _platform_strlcpy();
            v17 = (_BYTE *)_platform_strchr();
            if (v17)
              *v17 = 0;
            *((_QWORD *)&malloc_entropy + v16) = strtoull_l(v119, 0, 0, 0);
            v18 = v15 & (_platform_strchr() != 0);
            v14 = 1;
            v15 = 0;
          }
          while ((v18 & 1) != 0);
          v19 = v16 + 1;
          v10 = v13;
        }
        else
        {
          v19 = 0;
        }
        v20 = strlen(*v12);
        bzero((void *)*v12, v20);
        if (v19 == 2)
          *(_BYTE *)(v10 + 1706) = 1;
      }
      if ((const char *)_platform_strstr() == *v12)
        v11 = *v12;
      if ((const char *)_platform_strstr() == *v12)
        large_cache_enabled = 1;
      v21 = v12[1];
      ++v12;
    }
    while (v21);
  }
  else
  {
    v11 = 0;
  }
  if ((*(_BYTE *)(v10 + 1706) & 1) == 0)
  {
    getentropy(&malloc_entropy, 0x10uLL);
    *(_BYTE *)(v10 + 1706) = 1;
  }
  if (v11)
  {
    v22 = _platform_strchr();
    if (v22)
    {
      if (strtoull_l((const char *)(v22 + 1), 0, 16, 0) == 1)
        magazine_medium_enabled = 0;
    }
  }
  v23 = malloc_common_value_for_key_copy(v118, "malloc_max_magazines", v119, 0x100uLL);
  if (v23)
  {
    v117 = 0;
    v24 = malloc_common_convert_to_long(v23, &v117);
    if (*v117 || v24 < 0)
      malloc_report(3u, (uint64_t)"malloc_max_magazines must be positive - ignored.\n");
    else
      max_magazines = v24;
  }
  v25 = malloc_common_value_for_key_copy(v118, "malloc_large_expanded_cache_threshold", v119, 0x100uLL);
  if (v25)
  {
    v117 = 0;
    v26 = malloc_common_convert_to_long(v25, &v117);
    if (*v117 || v26 < 0)
      malloc_report(3u, (uint64_t)"malloc_large_expanded_cache_threshold must be positive - ignored.\n");
    else
      magazine_large_expanded_cache_threshold = v26;
  }
  v27 = malloc_common_value_for_key_copy(v118, "malloc_zero_on_free_enabled", v119, 0x100uLL);
  if (v27)
  {
    v117 = 0;
    v28 = malloc_common_convert_to_long(v27, &v117);
    if (*v117 || v28 > 1)
      malloc_report(3u, (uint64_t)"malloc_zero_on_free_enabled must be 0 or 1 - ignored.\n");
    else
      malloc_zero_policy = v28 == 0;
  }
  v29 = malloc_common_value_for_key_copy(v118, "malloc_zero_on_free_sample_period", v119, 0x100uLL);
  if (v29)
  {
    v117 = 0;
    v30 = malloc_common_convert_to_long(v29, &v117);
    if (*v117 || v30 < 0)
      malloc_report(3u, (uint64_t)"malloc_zero_on_free_sample_period must be positive - ignored.\n");
    else
      malloc_zero_on_free_sample_period = v30;
  }
  v31 = malloc_common_value_for_key_copy(v118, "malloc_secure_allocator", v119, 0x100uLL);
  if (v31)
  {
    v117 = 0;
    v32 = malloc_common_convert_to_long(v31, &v117);
    if (*v117 || v32 > 1)
      malloc_report(3u, (uint64_t)"malloc_secure_allocator must be 0 or 1 - ignored.\n");
    else
      malloc_xzone_enabled = v32 != 0;
  }
  mvm_aslr_init();
  j__malloc_default_zone();
  phys_ncpus = MEMORY[0xFFFFFC035];
  v33 = MEMORY[0xFFFFFC036];
  logical_ncpus = MEMORY[0xFFFFFC036];
  ncpuclusters = MEMORY[0xFFFFFC02F];
  v34 = MEMORY[0xFFFFFC036] / MEMORY[0xFFFFFC035];
  if (MEMORY[0xFFFFFC036] % MEMORY[0xFFFFFC035])
    __malloc_init_cold_2();
  switch(v34)
  {
    case 1u:
      v35 = 0;
      break;
    case 4u:
      v35 = 2;
      break;
    case 2u:
      v35 = 1;
      break;
    default:
      __malloc_init_cold_1();
  }
  hyper_shift = v35;
  if (max_magazines >= MEMORY[0xFFFFFC036])
    v36 = MEMORY[0xFFFFFC036];
  else
    v36 = max_magazines;
  if (max_magazines)
    v37 = v36;
  else
    v37 = MEMORY[0xFFFFFC036];
  max_magazines = v37;
  if (max_medium_magazines < MEMORY[0xFFFFFC036])
    v33 = max_medium_magazines;
  if (!max_medium_magazines)
    v33 = v37;
  max_medium_magazines = v33;
  if (MEMORY[0xFFFFFC02F] == 1)
  {
    v38 = _os_feature_enabled_simple_impl();
    if (malloc_xzone_enabled)
    {
      if ((v38 & 1) == 0)
        malloc_xzone_enabled = 0;
    }
  }
  _malloc_detect_interposition();
  v39 = *_NSGetEnviron();
  malloc_debug_flags = 256;
  getprogname();
  if (!_platform_strcmp() && (dyld_program_sdk_at_least() & 1) == 0)
    malloc_zero_policy = 1;
  getprogname();
  if (!_platform_strcmp() && (dyld_program_sdk_at_least() & 1) == 0)
    malloc_xzone_enabled = 0;
  if (!*v39)
  {
LABEL_111:
    dyld_process_is_restricted();
    malloc_print_configure();
    v42 = 0x1ECCD9000;
    goto LABEL_279;
  }
  v40 = v39 + 1;
  while (_platform_strncmp() && _platform_strncmp())
  {
    if (!*v40++)
      goto LABEL_111;
  }
  v42 = 0x1ECCD9000uLL;
  if (!issetugid())
  {
    dyld_process_is_restricted();
    malloc_print_configure();
    if (!getenv("MallocGuardEdges"))
      goto LABEL_129;
    if (_platform_strcmp())
    {
      malloc_debug_flags = malloc_debug_flags & 0xFFFFFFF8 | 3;
      malloc_report(5u, (uint64_t)"adding guard pages for large allocator blocks\n");
      if (getenv("MallocDoNotProtectPrelude"))
      {
        malloc_debug_flags |= 8u;
        malloc_report(5u, (uint64_t)"... but not protecting prelude guard page\n");
      }
      if (!getenv("MallocDoNotProtectPostlude"))
      {
LABEL_129:
        if (getenv("MallocScribble"))
        {
          malloc_debug_flags |= 0x20u;
          malloc_report(5u, (uint64_t)"enabling scribbling to detect mods to free blocks\n");
        }
        if (getenv("MallocErrorAbort"))
        {
          malloc_debug_flags |= 0x40u;
          malloc_report(5u, (uint64_t)"enabling abort() on bad malloc or free\n");
        }
        if (getenv("MallocTracing"))
          malloc_tracing_enabled = 1;
        if (getenv("MallocSimpleStackLogging"))
          malloc_simple_stack_logging = 1;
        if (getenv("MallocReportConfig"))
          malloc_report_config = 1;
        v45 = getenv("MallocCheckHeapStart");
        if (!v45)
        {
LABEL_171:
          v56 = getenv("MallocMaxMagazines");
          if (!v56)
          {
            v56 = getenv("_MallocMaxMagazines");
            if (!v56)
              goto LABEL_184;
          }
          v57 = strtol(v56, 0, 0);
          if (v57 == 0xFFFF)
          {
            max_magazines = ncpuclusters;
            v58 = "Maximum magazines limited to ncpuclusters (%d)\n";
          }
          else if (v57)
          {
            if ((v57 & 0x80000000) != 0)
            {
              v58 = "Maximum magazines must be positive - ignored.\n";
              v59 = 3;
LABEL_183:
              malloc_report(v59, (uint64_t)v58);
LABEL_184:
              v60 = getenv("MallocLargeExpandedCacheThreshold");
              if (v60)
              {
                v61 = strtoull(v60, 0, 0);
                if (v61)
                {
                  magazine_large_expanded_cache_threshold = v61;
                  v62 = "Large expanded cache threshold set to %lly\n";
                }
                else
                {
                  v62 = "Large expanded cache threshold defaulted to %lly\n";
                }
                malloc_report(5u, (uint64_t)v62);
              }
              v63 = getenv("MallocLargeDisableASLR");
              if (v63)
              {
                if (strtoull(v63, 0, 0))
                {
                  malloc_report(5u, (uint64_t)"Disabling ASLR slide on large allocations\n");
                  v64 = malloc_debug_flags | 0x20000000;
                }
                else
                {
                  malloc_report(5u, (uint64_t)"Enabling ASLR slide on large allocations\n");
                  v64 = malloc_debug_flags & 0xDFFFFFFF;
                }
                malloc_debug_flags = v64;
              }
              v65 = getenv("MallocSpaceEfficient");
              if (v65)
              {
                v66 = v65;
                *(_QWORD *)v119 = 0;
                v67 = malloc_common_convert_to_long(v65, v119);
                if (*(char **)v119 == v66 || **(_BYTE **)v119 || v67 > 1)
                {
                  malloc_report(3u, (uint64_t)"MallocSpaceEfficient must be 0 or 1.\n");
                }
                else
                {
                  aggressive_madvise_enabled = v67 == 1;
                  if (v67)
                    large_cache_enabled = 0;
                  malloc_space_efficient_enabled = v67 == 1;
                }
              }
              v68 = getenv("MallocAggressiveMadvise");
              if (v68)
              {
                v69 = v68;
                *(_QWORD *)v119 = 0;
                v70 = malloc_common_convert_to_long(v68, v119);
                if (*(char **)v119 == v69 || **(_BYTE **)v119 || v70 > 1)
                  malloc_report(3u, (uint64_t)"MallocAggressiveMadvise must be 0 or 1.\n");
                else
                  aggressive_madvise_enabled = v70 == 1;
              }
              v71 = getenv("MallocLargeCache");
              if (v71)
              {
                v72 = v71;
                *(_QWORD *)v119 = 0;
                v73 = malloc_common_convert_to_long(v71, v119);
                if (*(char **)v119 == v72 || **(_BYTE **)v119 || v73 > 1)
                  malloc_report(3u, (uint64_t)"MallocLargeCache must be 0 or 1.\n");
                else
                  large_cache_enabled = v73 == 1;
              }
              v74 = getenv("MallocRecircRetainedRegions");
              if (v74)
              {
                v75 = strtol(v74, 0, 0);
                if (v75 < 1)
                  malloc_report(3u, (uint64_t)"MallocRecircRetainedRegions must be positive - ignored.\n");
                else
                  recirc_retained_regions = v75;
              }
              v76 = getenv("MallocZeroOnFree");
              if (v76)
              {
                v77 = v76;
                *(_QWORD *)v119 = 0;
                v78 = malloc_common_convert_to_long(v76, v119);
                if (*(char **)v119 == v77 || **(_BYTE **)v119 || v78 > 1)
                  malloc_report(3u, (uint64_t)"MallocZeroOnFree must be 0 or 1.\n");
                else
                  malloc_zero_policy = v78 == 0;
              }
              v79 = getenv("MallocZeroOnAlloc");
              if (v79)
              {
                v80 = v79;
                *(_QWORD *)v119 = 0;
                v81 = malloc_common_convert_to_long(v79, v119);
                if (*(char **)v119 == v80 || **(_BYTE **)v119 || v81 > 1)
                {
                  malloc_report(3u, (uint64_t)"MallocZeroOnAlloc must be 0 or 1.\n");
                }
                else
                {
                  if (v81)
                    v82 = 2;
                  else
                    v82 = 1;
                  malloc_zero_policy = v82;
                }
              }
              v83 = getenv("MallocCheckZeroOnFreeCorruption");
              if (v83)
              {
                v84 = strtol(v83, 0, 0);
                if (v84 < 1)
                  malloc_report(3u, (uint64_t)"malloc_zero_on_free_sample_period must be positive - ignored.\n");
                else
                  malloc_zero_on_free_sample_period = v84;
              }
              v85 = getenv("MallocSecureAllocator");
              if (v85 && malloc_internal_security_policy)
              {
                v86 = v85;
                *(_QWORD *)v119 = 0;
                v87 = malloc_common_convert_to_long(v85, v119);
                if (*(char **)v119 == v86 || **(_BYTE **)v119 || v87 > 1)
                  malloc_report(3u, (uint64_t)"MallocSecureAllocator must be 0 or 1.\n");
                else
                  malloc_xzone_enabled = v87 != 0;
              }
              v88 = getenv("MallocSecureAllocatorNano");
              if (v88)
              {
                v89 = v88;
                *(_QWORD *)v119 = 0;
                v90 = malloc_common_convert_to_long(v88, v119);
                if (*(char **)v119 == v89 || **(_BYTE **)v119 || v90 > 1)
                {
                  malloc_report(3u, (uint64_t)"MallocSecureAllocatorNano must be 0 or 1.\n");
                }
                else
                {
                  if (v90)
                    v91 = 2;
                  else
                    v91 = 1;
                  malloc_xzone_nano_override = v91;
                }
              }
              v92 = getenv("MallocNanoOnXzone");
              if (v92)
              {
                v93 = v92;
                *(_QWORD *)v119 = 0;
                v94 = malloc_common_convert_to_long(v92, v119);
                if (*(char **)v119 == v93 || **(_BYTE **)v119 || v94 > 1)
                {
                  malloc_report(3u, (uint64_t)"MallocNanoOnXzone must be 0 or 1.\n");
                }
                else
                {
                  if (v94)
                    v95 = 2;
                  else
                    v95 = 1;
                  malloc_nano_on_xzone_override = v95;
                }
              }
              v96 = getenv("MallocSecureAllocatorCreateMzones");
              v97 = malloc_internal_security_policy;
              if (v96 && malloc_internal_security_policy)
              {
                v98 = v96;
                *(_QWORD *)v119 = 0;
                v99 = malloc_common_convert_to_long(v96, v119);
                if (*(char **)v119 == v98 || **(_BYTE **)v119 || v99 > 1)
                  malloc_report(3u, (uint64_t)"MallocSecureAllocatorCreateMzones must be 0 or 1.\n");
                else
                  xzm_create_mzones = v99 != 0;
                v97 = malloc_internal_security_policy;
              }
              v100 = getenv("MallocSecureAllocatorPurgeableZone");
              if (v100 && v97)
              {
                v101 = v100;
                *(_QWORD *)v119 = 0;
                v102 = malloc_common_convert_to_long(v100, v119);
                if (*(char **)v119 == v101 || **(_BYTE **)v119 || v102 > 1)
                  malloc_report(3u, (uint64_t)"MallocSecureAllocatorPurgeableZone must be 0 or 1.\n");
                else
                  purgeable_zone_use_xzm = v102 != 0;
              }
              if (getenv("MallocHelp"))
                malloc_report(5u, (uint64_t)"environment variables that can be set for debug:\n- MallocLogFile <f> to create/append messages to file <f> instead of stderr\n- MallocGuardEdges to add 2 guard pages for each large block\n- MallocDoNotProtectPrelude to disable protection (when previous flag set)\n- MallocDoNotProtectPostlude to disable protection (when previous flag set)\n- MallocStackLogging to record all stacks.  Tools like leaks can then be applied\n- MallocStackLoggingNoCompact to record all stacks.  Needed for malloc_history\n- MallocStackLoggingDirectory to set location of stack logs, which can grow large; default is"
                           " /tmp\n"
                           "- MallocScribble to detect writing on free blocks and missing initializers:\n"
                           "  0x55 is written upon free and 0xaa is written on allocation\n"
                           "- MallocCheckHeapStart <n> to start checking the heap after <n> operations\n"
                           "- MallocCheckHeapEach <s> to repeat the checking of the heap after <s> operations\n"
                           "- MallocCheckHeapSleep <t> to sleep <t> seconds on heap corruption\n"
                           "- MallocCheckHeapAbort <b> to abort on heap corruption if <b> is non-zero\n"
                           "- MallocCorruptionAbort to abort on malloc errors, but not on out of memory for 32-bit proces"
                           "ses\n"
                           "  MallocCorruptionAbort is always set on 64-bit processes\n"
                           "- MallocErrorAbort to abort on any malloc error, including out of memory\n"
                           "- MallocTracing to emit kdebug trace points on malloc entry points\n"
                           "- MallocZeroOnFree to enable or disable zero-on-free behavior (for debugging only)\n"
                           "- MallocCheckZeroOnFreeCorruption to enable zero-on-free corruption detection\n"
                           "- MallocHelp - this help!\n");
              goto LABEL_279;
            }
            if (logical_ncpus >= v57)
            {
              max_magazines = v57;
              v58 = "Maximum magazines set to %d\n";
            }
            else
            {
              max_magazines = logical_ncpus;
              v58 = "Maximum magazines limited to number of logical CPUs (%d)\n";
            }
          }
          else
          {
            v58 = "Maximum magazines defaulted to %d\n";
          }
          v59 = 5;
          goto LABEL_183;
        }
        v46 = strtoul(v45, 0, 0);
        if (v46 <= 1)
          v47 = 1;
        else
          v47 = v46;
        if (v47 == -1)
          v48 = 1;
        else
          v48 = v47;
        malloc_check_start = v48;
        v49 = getenv("MallocCheckHeapEach");
        if (v49)
        {
          v50 = strtoul(v49, 0, 0);
          if (v50 <= 1)
            v51 = 1;
          else
            v51 = v50;
          if (v51 == -1)
            v51 = 1;
          malloc_check_each = v51;
        }
        malloc_report(5u, (uint64_t)"checks heap after operation #%d and each %d operations\n");
        v52 = getenv("MallocCheckHeapAbort");
        if (v52)
        {
          malloc_check_abort = strtol(v52, 0, 0);
          if (malloc_check_abort)
          {
LABEL_155:
            v53 = "will abort on heap corruption\n";
LABEL_170:
            malloc_report(5u, (uint64_t)v53);
            goto LABEL_171;
          }
        }
        else if (malloc_check_abort)
        {
          goto LABEL_155;
        }
        v54 = getenv("MallocCheckHeapSleep");
        if (v54)
        {
          v55 = strtol(v54, 0, 0);
          malloc_check_sleep = v55;
        }
        else
        {
          v55 = malloc_check_sleep;
        }
        if (v55 < 1)
        {
          if (v55 < 0)
            v53 = "will sleep once for %d seconds on heap corruption\n";
          else
            v53 = "no sleep on heap corruption\n";
        }
        else
        {
          v53 = "will sleep for %d seconds on heap corruption\n";
        }
        goto LABEL_170;
      }
      v43 = malloc_debug_flags | 0x10;
      v44 = "... but not protecting postlude guard page\n";
    }
    else
    {
      v43 = malloc_debug_flags & 0xFFFFFFE0 | 7;
      v44 = "adding guard pages to all regions\n";
    }
    malloc_debug_flags = v43;
    malloc_report(5u, (uint64_t)v44);
    goto LABEL_129;
  }
LABEL_279:
  malloc_sanitizer_enabled = sanitizer_should_enable();
  v103 = (uint64_t *)_NSGetEnviron();
  v104 = *v103;
  if (!malloc_sanitizer_enabled && !(malloc_debug_flags & 0x20 | malloc_zero_on_free_sample_period))
    nano_common_init(*v103, (uint64_t)a1, v118);
  v105 = _os_feature_enabled_simple_impl();
  if ((*(_DWORD *)(v42 + 1080) - 1) < 0x1F)
    v106 = 1;
  else
    v106 = v105;
  if (malloc_xzone_nano_override == 2)
  {
    v106 = 1;
  }
  else if (malloc_xzone_nano_override == 1)
  {
    v106 = 0;
  }
  if (malloc_nano_on_xzone_override == 2)
    v107 = 0;
  else
    v107 = v106;
  v108 = malloc_xzone_enabled;
  if (malloc_xzone_enabled)
    v109 = _malloc_engaged_nano == 2;
  else
    v109 = 0;
  if (v109)
    v110 = v107;
  else
    v110 = 1;
  if ((v110 & 1) == 0)
  {
    v111 = _os_feature_enabled_simple_impl();
    if (malloc_nano_on_xzone_override == 2)
    {
      v111 = 1;
    }
    else if (malloc_nano_on_xzone_override == 1)
    {
      v111 = 0;
    }
    if (malloc_nano_on_xzone != v111)
      malloc_nano_on_xzone = v111;
    if (!v111)
    {
      v112 = 0;
      malloc_xzone_enabled = 0;
      goto LABEL_310;
    }
    v108 = malloc_xzone_enabled;
  }
  v112 = v110 ^ 1;
  if (v108)
  {
    mfm_initialize();
    initial_xzone_zone = xzm_main_malloc_zone_create(malloc_debug_flags, v104, (uint64_t)a1, v118);
    malloc_set_zone_name((malloc_zone_t *)initial_xzone_zone, "DefaultMallocZone");
    malloc_zone_register_while_locked(initial_xzone_zone, 1);
  }
LABEL_310:
  if ((v112 & 1) == 0 && initial_xzone_zone)
    goto LABEL_324;
  if (!initial_xzone_zone)
  {
    initial_scalable_zone = create_scalable_zone(0, malloc_debug_flags);
    malloc_set_zone_name((malloc_zone_t *)initial_scalable_zone, "DefaultMallocZone");
    malloc_zone_register_while_locked(initial_scalable_zone, 1);
  }
  nano_common_configure();
  if (initial_xzone_zone)
    v113 = (malloc_zone_t *)initial_xzone_zone;
  else
    v113 = (malloc_zone_t *)initial_scalable_zone;
  if (_malloc_engaged_nano != 2)
  {
    zone = (unint64_t *)initial_nano_zone;
    if (!initial_nano_zone)
      goto LABEL_324;
    goto LABEL_323;
  }
  if (malloc_report_config == 1)
    malloc_report(5u, (uint64_t)"NanoV2 Config:\n\tNano On Xzone: %d\n");
  zone = nanov2_create_zone((unint64_t)v113, malloc_debug_flags);
  initial_nano_zone = (uint64_t)zone;
  if (zone)
  {
LABEL_323:
    malloc_set_zone_name((malloc_zone_t *)zone, "DefaultMallocZone");
    malloc_set_zone_name(v113, "MallocHelperZone");
    malloc_zone_register_while_locked(initial_nano_zone, 1);
  }
LABEL_324:
  if (malloc_sanitizer_enabled)
  {
    v115 = sanitizer_create_zone(*(_QWORD *)malloc_zones);
    malloc_zone_register_while_locked(v115, 1);
  }
  malloc_slowpath_update();
  initial_num_zones = malloc_num_zones;
  if (large_cache_enabled)
  {
    if (initial_xzone_zone)
    {
      large_cache_enabled = 0;
    }
    else if (mvm_deferred_reclaim_init())
    {
      large_cache_enabled = 0;
      malloc_report(3u, (uint64_t)"Unable to set up reclaim buffer (%d) - disabling large cache\n");
    }
  }
  if (malloc_report_config == 1)
  {
    if (initial_scalable_zone)
      malloc_report(5u, (uint64_t)"Magazine Config:\n\tMax Magazines: %d\n\tMedium Enabled: %d\n\tAggressive Madvise: %d\n\tLarge Cache: %d%s\n\tScribble: %d\n");
  }
}

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)default_zone;
}

_BYTE *malloc_common_value_for_key_copy(unsigned __int8 *a1, char *a2, _BYTE *a3, unint64_t a4)
{
  unsigned __int8 *v6;
  _BYTE *v7;
  unsigned int v8;

  v6 = malloc_common_value_for_key(a1, a2);
  if (!v6)
    return 0;
  v7 = a3;
  if (a4 >= 2)
  {
    v7 = a3;
    do
    {
      v8 = *v6;
      if (v8 <= 0x20 && ((1 << v8) & 0x100000601) != 0)
        break;
      ++v6;
      *v7++ = v8;
      --a4;
    }
    while (a4 > 1);
  }
  *v7 = 0;
  return a3;
}

unsigned __int8 *malloc_common_value_for_key(unsigned __int8 *a1, char *__s)
{
  size_t v3;
  int v4;
  int v5;

  v3 = strlen(__s);
  v4 = *a1;
  while (v4)
  {
    if (_platform_strncmp())
    {
      v5 = *++a1;
      v4 = v5;
    }
    else
    {
      if (v3)
        a1 += v3;
      v4 = *a1;
      if (v4 == 61)
        return a1 + 1;
    }
  }
  return 0;
}

void malloc_zone_register(malloc_zone_t *zone)
{
  os_unfair_lock_lock_with_options();
  malloc_zone_register_while_locked((uint64_t)zone, 0);
  os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
}

void malloc_zone_register_while_locked(uint64_t a1, int a2)
{
  _QWORD *v4;
  int v5;
  size_t v6;
  _QWORD *v7;
  mach_vm_size_t v8;
  vm_map_t *v9;
  const char *v10;
  void *v11;
  _QWORD *v12;
  mach_vm_address_t v13;
  mach_vm_address_t address;

  if (malloc_num_zones)
  {
    v4 = malloc_zones;
    v5 = malloc_num_zones;
    while (*v4 != a1)
    {
      ++v4;
      if (!--v5)
        goto LABEL_5;
    }
    v10 = "Attempted to register zone more than once: %p\n";
    goto LABEL_10;
  }
LABEL_5:
  if (malloc_num_zones == malloc_num_zones_allocated)
  {
    v6 = 8 * malloc_num_zones;
    v7 = (_QWORD *)MEMORY[0x1E0C88820];
    v8 = (v6 - 1 + 2 * *MEMORY[0x1E0C88820]) & -*MEMORY[0x1E0C88820];
    address = *MEMORY[0x1E0C88820];
    v9 = (vm_map_t *)MEMORY[0x1E0C883F0];
    if (mach_vm_allocate(*MEMORY[0x1E0C883F0], &address, v8, 16777217))
    {
      v10 = "malloc_zone_register allocation failed: %d\n";
LABEL_10:
      malloc_report(3u, (uint64_t)v10);
      return;
    }
    v11 = (void *)address;
    if (malloc_zones)
    {
      v13 = address;
      memcpy((void *)address, malloc_zones, v6);
      address = (mach_vm_address_t)malloc_zones;
      mach_vm_deallocate(*v9, (mach_vm_address_t)malloc_zones, (v6 - 1 + *v7) & -*v7);
      v11 = (void *)v13;
    }
    malloc_zones = v11;
    malloc_num_zones_allocated = v8 >> 3;
  }
  else
  {
    v8 = 8 * malloc_num_zones_allocated;
    mprotect(malloc_zones, v8, 3);
  }
  if (a2)
  {
    memcpy((char *)malloc_zones + 8, malloc_zones, 8 * malloc_num_zones);
    v12 = malloc_zones;
  }
  else
  {
    v12 = (_QWORD *)((char *)malloc_zones + 8 * malloc_num_zones);
  }
  *v12 = a1;
  OSAtomicIncrement32Barrier(&malloc_num_zones);
  mprotect(malloc_zones, v8, 1);
  if (a2)
  {
    if (*(_QWORD *)malloc_zones != a1)
    {
      has_injected_zone0 = 1;
      malloc_slowpath_update();
    }
  }
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  malloc_zone_t *scalable_zone;
  BOOL v5;
  malloc_zone_t *zone;

  if (malloc_absolute_max_size < start_size)
    return 0;
  if (initial_xzone_zone)
    v5 = xzm_create_mzones == 0;
  else
    v5 = 1;
  if (v5
    || (scalable_zone = (malloc_zone_t *)xzm_malloc_zone_create(malloc_debug_flags | flags, initial_xzone_zone)) == 0)
  {
    scalable_zone = (malloc_zone_t *)create_scalable_zone(start_size, malloc_debug_flags | flags);
  }
  if ((flags & 0x400) != 0 || has_injected_zone0 || malloc_sanitizer_enabled || !pgm_should_enable())
  {
    malloc_zone_register(scalable_zone);
  }
  else
  {
    zone = (malloc_zone_t *)pgm_create_zone((uint64_t)scalable_zone);
    os_unfair_lock_lock_with_options();
    malloc_zone_register_while_locked((uint64_t)zone, 0);
    malloc_zone_register_while_locked((uint64_t)scalable_zone, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
    return zone;
  }
  return scalable_zone;
}

mach_vm_address_t create_scalable_szone(uint64_t a1, int a2)
{
  mach_vm_address_t pages;
  mach_vm_address_t v4;
  unsigned int *v5;
  unsigned int v6;
  unint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  uint64_t v11;
  int32_t v12;
  _BOOL4 v14;

  pages = mvm_allocate_pages((*MEMORY[0x1E0C88820] + 20479) & -*MEMORY[0x1E0C88820], 0, 0x40000000, 1);
  v4 = pages;
  if (pages)
  {
    v5 = (unsigned int *)(pages + 16392);
    v6 = a2 & 0xBFFFFFFF | ((_dyld_get_image_slide() == 0) << 30);
    v7 = MEMORY[0xFFFFFC038];
    v8 = max_magazines;
    if (max_magazines >= 0x40)
      v8 = 64;
    if (v8 <= 1)
      v9 = 1;
    else
      v9 = v8;
    rack_init(v4 + 16512, 1, v9, v6);
    rack_init(v4 + 17280, 2, v9, v6);
    if (large_cache_enabled)
    {
      *(_QWORD *)(v4 + 20424) = v7 >> 10;
      if (v7 >= magazine_large_expanded_cache_threshold)
        v10 = 64;
      else
        v10 = 16;
      v11 = 0x20000000;
      if (v7 < magazine_large_expanded_cache_threshold)
        v11 = 0x8000000;
      *(_DWORD *)(v4 + 20392) = v10;
      *(_QWORD *)(v4 + 20400) = v11;
      v12 = NSVersionOfLinkTimeLibrary("System");
      v14 = v12 != -1 && v12 < 7340032;
      *(_DWORD *)(v4 + 20408) = v14;
    }
    *(_QWORD *)(v4 + 20448) = malloc_entropy;
    *(_DWORD *)(v4 + 104) = 16;
    *(_QWORD *)(v4 + 16) = szone_size;
    *(_QWORD *)(v4 + 24) = szone_malloc;
    *(_QWORD *)(v4 + 32) = szone_calloc;
    *(_QWORD *)(v4 + 40) = szone_valloc;
    *(_QWORD *)(v4 + 48) = szone_free;
    *(_QWORD *)(v4 + 56) = szone_realloc;
    *(_QWORD *)(v4 + 64) = szone_destroy;
    *(_QWORD *)(v4 + 80) = szone_batch_malloc;
    *(_QWORD *)(v4 + 88) = szone_batch_free;
    *(_QWORD *)(v4 + 96) = &szone_introspect;
    *(_QWORD *)(v4 + 112) = szone_memalign;
    *(_QWORD *)(v4 + 120) = szone_free_definite_size;
    *(_QWORD *)(v4 + 128) = szone_pressure_relief;
    *(_QWORD *)(v4 + 136) = szone_claimed_address;
    *(_QWORD *)(v4 + 144) = szone_try_free_default;
    *(_QWORD *)(v4 + 160) = szone_malloc_type_malloc;
    *(_QWORD *)(v4 + 168) = szone_malloc_type_calloc;
    *(_QWORD *)(v4 + 176) = szone_malloc_type_realloc;
    *(_QWORD *)(v4 + 184) = szone_malloc_type_memalign;
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
    mprotect((void *)v4, 0xC8uLL, 1);
    *v5 = v6;
    *(_DWORD *)(v4 + 18816) = 0;
    *(_QWORD *)(v4 + 0x4000) = -1;
  }
  return v4;
}

_DWORD *rack_init(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v8;
  _DWORD *result;
  uint64_t v10;
  _DWORD *v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;

  *(_OWORD *)(a1 + 32) = xmmword_191D9E870;
  v8 = a1 + 32;
  *(_DWORD *)(a1 + 4) = a2;
  *(_QWORD *)(a1 + 88) = a1 + 32;
  *(_QWORD *)(a1 + 24) = a1 + 32;
  *(_QWORD *)(a1 + 48) = a1 + 96;
  *(_QWORD *)(a1 + 56) = a1 + 64;
  result = (_DWORD *)_platform_memset();
  v10 = malloc_entropy;
  if (a2 == 2)
    v10 = ~malloc_entropy;
  *(_QWORD *)(v8 + 600) = v10;
  *(_DWORD *)(v8 + 588) = a4;
  *(_DWORD *)(v8 + 576) = a3;
  *(_QWORD *)(v8 + 592) = 0;
  *(_QWORD *)(v8 - 24) = 0;
  *(_QWORD *)(v8 - 16) = 0;
  if (a3)
  {
    result = (_DWORD *)mvm_allocate_pages((*MEMORY[0x1E0C88820] + 2560 * (a3 + 1) - 1) & -*MEMORY[0x1E0C88820], 0, 1073741827, 1);
    if (!result)
      rack_init_cold_1();
    v11 = result + 640;
    *(_QWORD *)(a1 + 624) = result + 640;
    *(_DWORD *)(a1 + 616) = 0;
    v12 = a3 - 1;
    if (a3 != 1)
    {
      v13 = 0;
      v14 = 1;
      do
      {
        ++v13;
        v14 *= 2;
      }
      while (v14 <= v12);
      *(_DWORD *)(a1 + 616) = v13;
      v12 = v14 - 1;
    }
    *(_DWORD *)(a1 + 612) = v12;
    *(_QWORD *)(a1 + 640) = 0;
    *(_DWORD *)a1 = 0;
    *result = 0;
    if (*(int *)(a1 + 608) >= 1)
    {
      v15 = 0;
      do
      {
        *v11 = 0;
        ++v15;
        v11 += 640;
      }
      while (v15 < *(int *)(a1 + 608));
    }
  }
  return result;
}

uint64_t pgm_should_enable()
{
  char v1;
  uint32_t v2;

  if (g_env_1 == 1)
    return g_env_2 != 0;
  v1 = g_env_0;
  if (!_os_feature_enabled_simple_impl())
    return _os_feature_enabled_simple_impl();
  if ((v1 & 1) != 0)
  {
    v2 = 250;
  }
  else
  {
    if (!_malloc_is_platform_binary())
      return _os_feature_enabled_simple_impl();
    v2 = 1000;
  }
  if (arc4random_uniform(v2) || main_image_has_section())
    return _os_feature_enabled_simple_impl();
  return 1;
}

unint64_t *nanov2_create_zone(unint64_t a1, int a2)
{
  _DWORD *v4;
  mach_vm_address_t based_pages;
  unint64_t *v6;
  uint64_t (*v7)(uint64_t, unint64_t);
  _QWORD *(*v8)(uint64_t, unint64_t);
  int v9;
  _QWORD *(*v10)(uint64_t, unint64_t, uint64_t);
  _QWORD *(*v11)(uint64_t, unint64_t);
  _QWORD *(*v12)(uint64_t, unint64_t, uint64_t);
  _QWORD *(*v13)(uint64_t, unint64_t, unint64_t);
  void (*v14)(uint64_t, unint64_t);
  _QWORD *(*v15)(uint64_t, unint64_t, unint64_t);
  uint64_t (*v16)(uint64_t, unint64_t, _QWORD *, uint64_t);
  void (*v17)(uint64_t, uint64_t, int);
  _QWORD *(*v18)(uint64_t, unint64_t, unint64_t);
  void (*v19)(uint64_t, unint64_t *, unint64_t);
  unint64_t (*v20)(uint64_t, uint64_t);
  BOOL (*v21)(uint64_t, unint64_t);
  void (*v22)(uint64_t, unint64_t);
  _QWORD *(*v23)(uint64_t, unint64_t, unint64_t, uint64_t);
  _QWORD *(*v24)(uint64_t, unint64_t, unint64_t, uint64_t);
  _QWORD *(*v25)(uint64_t, unint64_t, unint64_t, uint64_t);
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  int v30;
  uint64_t v31;

  if (_malloc_engaged_nano != 2)
    nanov2_realloc_VARIANT_mp_cold_1(a1);
  v4 = (_DWORD *)MEMORY[0x1E0C88810];
  based_pages = nano_common_allocate_based_pages(~*MEMORY[0x1E0C88810] & (unint64_t)(*MEMORY[0x1E0C88810] + 29264), 0, 0, 1, 0);
  v6 = (unint64_t *)based_pages;
  if (!based_pages)
  {
    _malloc_engaged_nano = 0;
    return v6;
  }
  *(_DWORD *)(based_pages + 104) = 16;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) != 0)
    v7 = nanov2_size_VARIANT_armv81;
  else
    v7 = nanov2_size_VARIANT_mp;
  v8 = nanov2_malloc_zero_on_alloc_VARIANT_armv81;
  v9 = malloc_zero_policy;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) == 0)
    v8 = nanov2_malloc_zero_on_alloc_VARIANT_mp;
  v10 = nanov2_malloc_type_zero_on_alloc_VARIANT_armv81;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) == 0)
    v10 = nanov2_malloc_type_zero_on_alloc_VARIANT_mp;
  v11 = nanov2_malloc_VARIANT_armv81;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) == 0)
    v11 = nanov2_malloc_VARIANT_mp;
  v12 = nanov2_malloc_type_VARIANT_armv81;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) == 0)
    v12 = nanov2_malloc_type_VARIANT_mp;
  v13 = nanov2_calloc_VARIANT_mp;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) != 0)
    v13 = nanov2_calloc_VARIANT_armv81;
  v14 = nanov2_free_VARIANT_armv81;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) != 0)
  {
    v15 = nanov2_realloc_VARIANT_armv81;
  }
  else
  {
    v14 = nanov2_free_VARIANT_mp;
    v15 = nanov2_realloc_VARIANT_mp;
  }
  v16 = nanov2_batch_malloc_VARIANT_armv81;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) == 0)
    v16 = nanov2_batch_malloc_VARIANT_mp;
  v17 = nanov2_batch_free_VARIANT_armv81;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) == 0)
    v17 = nanov2_batch_free_VARIANT_mp;
  v18 = nanov2_memalign_VARIANT_armv81;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) == 0)
    v18 = nanov2_memalign_VARIANT_mp;
  v19 = nanov2_free_definite_size_VARIANT_mp;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) != 0)
    v19 = nanov2_free_definite_size_VARIANT_armv81;
  v20 = nanov2_pressure_relief_VARIANT_armv81;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) != 0)
  {
    v21 = nanov2_claimed_address_VARIANT_armv81;
  }
  else
  {
    v20 = nanov2_pressure_relief_VARIANT_mp;
    v21 = nanov2_claimed_address_VARIANT_mp;
  }
  v22 = nanov2_try_free_default_VARIANT_armv81;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) == 0)
    v22 = nanov2_try_free_default_VARIANT_mp;
  v23 = nanov2_calloc_type_VARIANT_armv81;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) == 0)
    v23 = nanov2_calloc_type_VARIANT_mp;
  v24 = nanov2_realloc_type_VARIANT_armv81;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) == 0)
    v24 = nanov2_realloc_type_VARIANT_mp;
  v25 = nanov2_memalign_type_VARIANT_mp;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) != 0)
    v25 = nanov2_memalign_type_VARIANT_armv81;
  if (malloc_zero_policy != 2)
    v8 = v11;
  v6[2] = (unint64_t)v7;
  v6[3] = (unint64_t)v8;
  v6[4] = (unint64_t)v13;
  v6[5] = (unint64_t)nanov2_valloc;
  v6[6] = (unint64_t)v14;
  v6[7] = (unint64_t)v15;
  v6[8] = (unint64_t)nanov2_destroy;
  v6[10] = (unint64_t)v16;
  v6[11] = (unint64_t)v17;
  v6[12] = (unint64_t)nanov2_introspect;
  v6[14] = (unint64_t)v18;
  v6[15] = (unint64_t)v19;
  v6[16] = (unint64_t)v20;
  v6[17] = (unint64_t)v21;
  v6[18] = (unint64_t)v22;
  if (v9 != 2)
    v10 = v12;
  v6[20] = (unint64_t)v10;
  v6[21] = (unint64_t)v23;
  v6[22] = (unint64_t)v24;
  v6[23] = (unint64_t)v25;
  *v6 = 0;
  v6[1] = 0;
  mprotect(v6, 0xC8uLL, 1);
  *((_DWORD *)v6 + 7169) = a2;
  v6[3588] = a1;
  v26 = (unint64_t)unk_1ECCD961A << 16;
  v27 = qword_1ECCD9620;
  v28 = qword_1ECCD9620 & 0xFFFFFFFF0000;
  if ((qword_1ECCD9620 & 0xFFFFFFFF0000) == 0)
    v28 = 0xDEADDEAD0000;
  if (!v26)
    v26 = v28;
  v6[3587] = v26;
  v29 = v27 >> 52;
  v6[3585] = v29;
  v6[3586] = v29 << 14;
  v6[3589] = 0;
  *((_DWORD *)v6 + 7184) = 0;
  if (!malloc_tracing_enabled)
  {
    if (nano_common_allocate_vm_space(0x300000000uLL, 0x20000000uLL))
      goto LABEL_48;
LABEL_58:
    nano_common_deallocate_pages((mach_vm_address_t)v6, ~*v4 & (unint64_t)(*(_QWORD *)v4 + 29264), 0);
    _malloc_engaged_nano = 0;
    malloc_report(5u, (uint64_t)"nano zone abandoned due to inability to reserve vm space.\n");
    return 0;
  }
  if (!nanov2_create_zone_cold_1())
    goto LABEL_58;
LABEL_48:
  *(_WORD *)((v6[3586] ^ 0x300000000)
           + 4
           * (((unsigned __int16)(*((_DWORD *)v6 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)v6 + 7170) << 6)) & 0xFFF)) = 0;
  v6[3590] = 0x300000000;
  atomic_store(0x304000000uLL, v6 + 3591);
  *((_DWORD *)v6 + 7186) = 1;
  if ((*((_BYTE *)v6 + 28676) & 7) != 0)
  {
    v30 = ((unsigned __int16)(*((_DWORD *)v6 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)v6 + 7170) << 6)) & 0xFFF;
    *(_DWORD *)((v6[3586] ^ 0x300000000) + ((unint64_t)(v30 == 0) << 8)) = -2147481606;
    if (mprotect((void *)(((unint64_t)(v30 == 0) << 14) | 0x300000000), 0x4000uLL, 1))
      malloc_report(3u, (uint64_t)"Failed to create guard block at %p (%d)\n");
    if (v30 == 4095)
      v31 = 4094;
    else
      v31 = 4095;
    *(_DWORD *)((v6[3586] ^ 0x300000000) + 4 * (((v31 & 0x3F) << 6) | 0x3F)) = -2147481606;
    if (mprotect((void *)((v31 << 14) + 0x300000000), 0x4000uLL, 1))
      malloc_report(3u, (uint64_t)"Failed to create guard block at %p (%d)\n");
  }
  return v6;
}

void nano_common_init(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  char *v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v9[256];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C874D8];
  _malloc_engaged_nano = _nano_common_init_pick_mode(a1, a2, a3, malloc_space_efficient_enabled);
  if (_malloc_engaged_nano)
  {
    v6 = malloc_common_value_for_key_copy(a3, "malloc_nano_max_magazines", v9, 0x100uLL);
    if (v6)
    {
      v8 = 0;
      v7 = malloc_common_convert_to_long(v6, &v8);
      if (*v8 || v7 < 0)
        malloc_report(3u, (uint64_t)"malloc_nano_max_magazines must be positive - ignored.\n");
      else
        nano_common_max_magazines = v7;
    }
    if (_malloc_engaged_nano == 2)
      nanov2_init(a1, a2, a3);
  }
}

uint64_t mvm_aslr_init()
{
  uint64_t result;
  uint64_t v1;
  vm_map_t *v2;
  mach_vm_size_t *v3;
  mach_vm_address_t v4;
  mach_vm_address_t address;

  result = _dyld_get_image_slide();
  if (result)
  {
    if (!entropic_address)
    {
      v1 = 0x16FD00000 - ((_DWORD)qword_1ECCD9620 << 25);
      address = 0;
      v2 = (vm_map_t *)MEMORY[0x1E0C883F0];
      v3 = (mach_vm_size_t *)MEMORY[0x1E0C88820];
      if (!mach_vm_allocate(*MEMORY[0x1E0C883F0], &address, *MEMORY[0x1E0C88820], 117440513))
      {
        v4 = address;
        if (address > 0x16FE00000)
        {
          v1 = (address & 0xFFFFFFFFFE000000) + 0x200000000;
          OSAtomicCompareAndSwapLong(0, address, &entropic_base);
          v4 = address;
        }
        mach_vm_deallocate(*v2, v4, *v3);
      }
      OSAtomicCompareAndSwapLong(0, v1, &entropic_limit);
      return OSAtomicCompareAndSwapLong(0, v1 - 0x10000000, &entropic_address);
    }
  }
  else
  {
    malloc_entropy = 0;
    qword_1ECCD9620 = 0;
  }
  return result;
}

void malloc_slowpath_update()
{
  BOOL v3;
  int v4;

  v3 = has_injected_zone0 != 1
    && malloc_num_zones != 0
    && malloc_check_start == 0
    && lite_zone == 0
    && malloc_tracing_enabled == 0;
  v4 = !v3
    || (malloc_simple_stack_logging & 1) != 0
    || (malloc_debug_flags & 0x20) != 0
    || malloc_interposition_compat != 0;
  if (malloc_slowpath != v4)
    malloc_slowpath = v4;
}

char *malloc_print_configure()
{
  char *v0;
  const char *v1;
  _DWORD *v2;
  int v3;
  char *result;

  v0 = getenv("MallocDebugReport");
  if (v0)
  {
    v1 = v0;
    if (_platform_strcmp())
    {
      if (_platform_strcmp())
      {
        if (_platform_strcmp())
        {
          debug_mode = 2;
          malloc_printf("Unrecognized value for MallocDebugReport (%s) - using 'stderr'\n", v1);
        }
        else
        {
          debug_mode = 0;
        }
        goto LABEL_12;
      }
      v2 = &gCRAnnotations;
      v3 = 1;
    }
    else
    {
      v2 = (_DWORD *)&gCRAnnotations;
      v3 = 2;
    }
    v2[44] = v3;
    goto LABEL_12;
  }
  if (isatty(2))
    debug_mode = 2;
LABEL_12:
  if (getenv("MallocErrorStop"))
    malloc_error_stop = 1;
  result = getenv("MallocErrorSleep");
  if (result)
    malloc_error_sleep = 1;
  return result;
}

uint64_t _nano_common_init_pick_mode(int a1, int a2, unsigned __int8 *a3, int a4)
{
  _BYTE *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned int v8;

  if (!malloc_common_value_for_key(a3, "nanov2_mode") || !_platform_strncmp())
    goto LABEL_5;
  if (!_platform_strncmp())
    return 2;
  if (!_platform_strncmp())
  {
    if (a4)
      v6 = 0;
    else
      v6 = 2;
  }
  else
  {
LABEL_5:
    v5 = (_BYTE *)_simple_getenv();
    if (v5)
      v6 = 2 * (*v5 == 49);
    else
      v6 = 0;
  }
  v7 = (unsigned __int8 *)_simple_getenv();
  if (v7)
  {
    v8 = *v7;
    if (v8 > 0x55)
    {
      if (v8 == 86 || v8 == 118)
      {
        if (v7[1] - 49 >= 2)
          return v6;
        else
          return 2;
      }
    }
    else
    {
      if (v8 == 48)
        return 0;
      if (v8 == 49)
        return 2;
    }
  }
  return v6;
}

void _malloc_detect_interposition()
{
  _BOOL4 v1;
  int v3;
  _BOOL4 v5;
  _BOOL4 v13;
  _BOOL4 v15;
  int v16;
  _BOOL4 v18;
  int v19;
  _BOOL4 v21;
  int v22;
  _BOOL4 v24;
  _BOOL4 v27;
  _BOOL4 v35;
  _BOOL4 v37;
  int v38;
  _BOOL4 v40;
  int v41;
  _BOOL4 v43;
  int v44;

  v1 = (int *)malloc_zone_valloc < &dword_191D64000 || (unint64_t)malloc_zone_valloc >= 0x191DA0000;
  v3 = (int *)malloc_zone_memalign < &dword_191D64000 || (unint64_t)malloc_zone_memalign >= 0x191DA0000 || v1;
  v5 = (int *)malloc < &dword_191D64000 || (unint64_t)malloc >= 0x191DA0000;
  if ((int *)calloc < &dword_191D64000 || (unint64_t)calloc >= 0x191DA0000)
    v5 = 1;
  if ((int *)free < &dword_191D64000 || (unint64_t)free >= 0x191DA0000)
    v5 = 1;
  if ((int *)realloc < &dword_191D64000 || (unint64_t)realloc >= 0x191DA0000)
    v5 = 1;
  if ((int *)valloc < &dword_191D64000 || (unint64_t)valloc >= 0x191DA0000)
    v5 = 1;
  if ((int *)aligned_alloc < &dword_191D64000 || (unint64_t)aligned_alloc >= 0x191DA0000)
    v5 = 1;
  if ((int *)posix_memalign < &dword_191D64000 || (unint64_t)posix_memalign >= 0x191DA0000)
    v5 = 1;
  v13 = (int *)malloc_zone_malloc < &dword_191D64000 || (unint64_t)malloc_zone_malloc >= 0x191DA0000;
  v15 = (int *)malloc_zone_calloc < &dword_191D64000 || (unint64_t)malloc_zone_calloc >= 0x191DA0000;
  v16 = v13 || v15;
  v18 = (int *)malloc_zone_free < &dword_191D64000 || (unint64_t)malloc_zone_free >= 0x191DA0000;
  v19 = v16 | v18;
  v21 = (int *)malloc_zone_realloc < &dword_191D64000 || (unint64_t)malloc_zone_realloc >= 0x191DA0000;
  v22 = v5 | v19 | v21 | v3;
  v24 = (int *)malloc_type_zone_valloc >= &dword_191D64000 && (unint64_t)malloc_type_zone_valloc < 0x191DA0000;
  if ((int *)malloc_type_zone_memalign < &dword_191D64000
    || (unint64_t)malloc_type_zone_memalign >= 0x191DA0000)
  {
    v24 = 0;
  }
  v27 = (int *)malloc_type_malloc < &dword_191D64000 || (unint64_t)malloc_type_malloc >= 0x191DA0000;
  if ((int *)malloc_type_calloc < &dword_191D64000 || (unint64_t)malloc_type_calloc >= 0x191DA0000)
    v27 = 1;
  if ((int *)malloc_type_free < &dword_191D64000 || (unint64_t)malloc_type_free >= 0x191DA0000)
    v27 = 1;
  if ((int *)malloc_type_realloc < &dword_191D64000 || (unint64_t)malloc_type_realloc >= 0x191DA0000)
    v27 = 1;
  if ((int *)malloc_type_valloc < &dword_191D64000 || (unint64_t)malloc_type_valloc >= 0x191DA0000)
    v27 = 1;
  if ((int *)malloc_type_aligned_alloc < &dword_191D64000
    || (unint64_t)malloc_type_aligned_alloc >= 0x191DA0000)
  {
    v27 = 1;
  }
  if ((int *)malloc_type_posix_memalign < &dword_191D64000
    || (unint64_t)malloc_type_posix_memalign >= 0x191DA0000)
  {
    v27 = 1;
  }
  v35 = (int *)malloc_type_zone_malloc < &dword_191D64000 || (unint64_t)malloc_type_zone_malloc >= 0x191DA0000;
  v37 = (int *)malloc_type_zone_calloc < &dword_191D64000 || (unint64_t)malloc_type_zone_calloc >= 0x191DA0000;
  v38 = v35 || v37;
  v40 = (int *)malloc_type_zone_free < &dword_191D64000 || (unint64_t)malloc_type_zone_free >= 0x191DA0000;
  v41 = v38 | v40;
  v43 = (int *)malloc_type_zone_realloc < &dword_191D64000
     || (unint64_t)malloc_type_zone_realloc >= 0x191DA0000;
  v44 = v22 & v24 & ~(v27 | v41 | v43);
  if (malloc_interposition_compat != v44)
    malloc_interposition_compat = v44;
}

void malloc_zone_statistics(malloc_zone_t *zone, malloc_statistics_t *stats)
{
  unint64_t v3;
  unint64_t v4;
  __int128 v5;
  uint64_t v6;

  if (zone)
  {
    ((void (*)(void))zone->introspect->statistics)();
  }
  else
  {
    _platform_memset();
    if (malloc_num_zones)
    {
      v3 = 0;
      do
      {
        v4 = v3 + 1;
        v5 = 0u;
        v6 = 0;
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)malloc_zones + v3) + 96) + 56))();
        stats->blocks_in_use = stats->blocks_in_use;
        *(int64x2_t *)&stats->size_in_use = vaddq_s64(*(int64x2_t *)&stats->size_in_use, *(int64x2_t *)((char *)&v5 + 8));
        stats->size_allocated = stats->size_allocated;
        v3 = v4;
      }
      while (v4 < malloc_num_zones);
    }
  }
}

uint64_t szone_statistics(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  task_name_t v4;
  uint64_t is_self;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
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

  v3 = result;
  v4 = *MEMORY[0x1E0C883F0];
  if (*MEMORY[0x1E0C883F0])
  {
    is_self = mach_task_is_self(*MEMORY[0x1E0C883F0]);
    if (!(_DWORD)is_self)
      nanov2_realloc_VARIANT_mp_cold_1(is_self);
    v6 = mach_task_is_self(v4);
    if (!(_DWORD)v6)
      nanov2_realloc_VARIANT_mp_cold_1(v6);
    v7 = *(_QWORD *)(v3 + 17136);
    result = mach_task_is_self(v4);
    if (!(_DWORD)result)
      nanov2_realloc_VARIANT_mp_cold_1(result);
  }
  else
  {
    v7 = *(_QWORD *)(result + 17136);
  }
  v8 = *(unsigned int *)(v3 + 17120);
  if ((v8 & 0x80000000) != 0)
  {
    v11 = 0;
    v10 = 0;
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = v8 + 1;
    v13 = v7 - 432;
    do
    {
      v11 += *(_QWORD *)(v13 + 8) + *(_QWORD *)v13;
      v10 += *(_DWORD *)(v13 + 40);
      v9 += *(_QWORD *)(v13 + 24);
      v13 += 2560;
      --v12;
    }
    while (v12);
  }
  v14 = *(_QWORD *)(v3 + 17904);
  if (v4)
  {
    result = mach_task_is_self(v4);
    if (!(_DWORD)result)
      nanov2_realloc_VARIANT_mp_cold_1(result);
  }
  v15 = *(unsigned int *)(v3 + 17888);
  if ((v15 & 0x80000000) == 0)
  {
    v16 = v15 + 1;
    v17 = v14 - 432;
    do
    {
      v11 += *(_QWORD *)(v17 + 8) + *(_QWORD *)v17;
      v10 += *(_DWORD *)(v17 + 40);
      v9 += *(_QWORD *)(v17 + 24);
      v17 += 2560;
      --v16;
    }
    while (v16);
  }
  v18 = *(_QWORD *)(v3 + 18840);
  *(_DWORD *)a2 = *(_DWORD *)(v3 + 18820) + v10;
  v19 = v18 + v9;
  v20 = v18
      + ((*(_QWORD *)(v3 + 16520) - *(_QWORD *)(v3 + 16528)) << 20)
      + ((*(_QWORD *)(v3 + 17288) - *(_QWORD *)(v3 + 17296)) << 23);
  *(_QWORD *)(a2 + 24) = v20;
  *(_QWORD *)(a2 + 8) = v19;
  *(_QWORD *)(a2 + 16) = v20 - v11;
  return result;
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
  char v4;
  const char *zone_name;
  uint64_t (**v6)(void *, const char *);
  uint64_t v7;
  int32_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t wrapped_zone;
  malloc_zone_t *v15;
  const char *v16;
  size_t v17;
  size_t v18;
  size_t v19;
  uint64_t v20;
  char *v21;
  char *v22;

  if (zone->version >= 0xE && zone->introspect->zone_type == 1)
  {
    v4 = 1;
  }
  else
  {
    mprotect(zone, 0xC8uLL, 3);
    v4 = 0;
  }
  zone_name = zone->zone_name;
  if (zone_name)
  {
    if (!malloc_num_zones)
    {
LABEL_24:
      zone->zone_name = 0;
      goto LABEL_25;
    }
    if (lite_zone && (*(uint64_t (**)(void))(lite_zone + 16))())
      goto LABEL_9;
    if (initial_num_zones)
    {
      v7 = 0;
      while (1)
      {
        v6 = (uint64_t (**)(void *, const char *))*((_QWORD *)malloc_zones + v7);
        if (v6[2](v6, zone_name))
          break;
        if (++v7 >= (unint64_t)initial_num_zones)
          goto LABEL_15;
      }
      if (!v7 && (has_injected_zone0 & 1) == 0)
      {
LABEL_9:
        v6 = (uint64_t (**)(void *, const char *))default_zone;
        if (!default_zone)
          goto LABEL_24;
      }
    }
    else
    {
LABEL_15:
      v8 = (int32_t *)pFRZCounterLive;
      OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
      v9 = malloc_num_zones;
      v10 = initial_num_zones;
      if (initial_num_zones >= malloc_num_zones)
      {
LABEL_18:
        v6 = 0;
      }
      else
      {
        while (1)
        {
          v6 = (uint64_t (**)(void *, const char *))*((_QWORD *)malloc_zones + v10);
          if (v6[2](v6, zone_name))
            break;
          if (v9 == ++v10)
            goto LABEL_18;
        }
      }
      OSAtomicDecrement32Barrier(v8);
      if (!v6)
        goto LABEL_24;
    }
    malloc_zone_free((malloc_zone_t *)v6, (void *)zone->zone_name);
    goto LABEL_24;
  }
LABEL_25:
  if (!name)
    goto LABEL_37;
  v11 = strlen(name) + 1;
  v12 = name;
  if ((_dyld_is_memory_immutable() & 1) == 0)
  {
    v13 = _malloc_zone_malloc((uint64_t)zone, v11, 0);
    if (!v13)
      goto LABEL_30;
    v12 = (const char *)v13;
    _platform_strcpy();
  }
  zone->zone_name = v12;
LABEL_30:
  wrapped_zone = get_wrapped_zone((uint64_t)zone);
  if (wrapped_zone)
  {
    if (zone->version <= 0xD)
      nanov2_realloc_VARIANT_mp_cold_1(wrapped_zone);
    v15 = (malloc_zone_t *)wrapped_zone;
    if (zone->introspect->zone_type == 2)
      v16 = "PGM";
    else
      v16 = "Sanitizer";
    v17 = strlen(name);
    v18 = strlen(v16);
    v19 = strlen("Wrapped");
    v20 = _malloc_zone_malloc((uint64_t)v15, v17 + v19 + v18 + 3, 0);
    if (v20)
    {
      v21 = (char *)v20;
      _platform_strcpy();
      *(_WORD *)&v21[strlen(v21)] = 45;
      v22 = strcat(v21, v16);
      *(_WORD *)&v21[strlen(v22)] = 45;
      *(_QWORD *)&v21[strlen(v21)] = 0x64657070617257;
      malloc_set_zone_name(v15, v21);
      malloc_zone_free(v15, v21);
    }
  }
LABEL_37:
  if ((v4 & 1) == 0)
    mprotect(zone, 0xC8uLL, 1);
}

uint64_t get_wrapped_zone(uint64_t a1)
{
  task_name_t v2;
  uint64_t is_self;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *MEMORY[0x1E0C883F0];
  if (!*MEMORY[0x1E0C883F0])
  {
    if (*(_DWORD *)(a1 + 104) >= 0xEu && (*(_DWORD *)(*(_QWORD *)(a1 + 96) + 128) - 4) >= 0xFFFFFFFE)
      return *(_QWORD *)(a1 + 200);
    return 0;
  }
  is_self = mach_task_is_self(*MEMORY[0x1E0C883F0]);
  if (!(_DWORD)is_self)
    nanov2_realloc_VARIANT_mp_cold_1(is_self);
  v4 = mach_task_is_self(v2);
  if (!(_DWORD)v4)
    nanov2_realloc_VARIANT_mp_cold_1(v4);
  if (*(_DWORD *)(a1 + 104) < 0xEu)
    return 0;
  v5 = *(_QWORD *)(a1 + 96);
  v6 = mach_task_is_self(v2);
  if (!(_DWORD)v6)
    nanov2_realloc_VARIANT_mp_cold_1(v6);
  if ((*(_DWORD *)(v5 + 128) - 4) < 0xFFFFFFFE)
    return 0;
  v7 = mach_task_is_self(v2);
  if (!(_DWORD)v7)
    nanov2_realloc_VARIANT_mp_cold_1(v7);
  return *(_QWORD *)(a1 + 200);
}

uint64_t malloc_get_wrapped_zone(uint64_t task, uint64_t (*a2)(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4), uint64_t a3, _QWORD *a4)
{
  uint64_t (*v6)(task_name_t, uint64_t, uint64_t, _QWORD *);
  uint64_t is_self;
  uint64_t result;
  _DWORD *v10;
  int v11;

  v6 = a2;
  if (!a2)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self)
        nanov2_realloc_VARIANT_mp_cold_1(is_self);
    }
    v6 = _malloc_default_reader_5;
  }
  *a4 = 0;
  v11 = 0;
  result = get_zone_type(task, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _DWORD **))v6, a3, &v11);
  if (!(_DWORD)result)
  {
    if ((v11 - 4) >= 0xFFFFFFFE)
    {
      v10 = 0;
      result = v6(task, a3 + 200, 8, &v10);
      if (!(_DWORD)result)
        *a4 = *(_QWORD *)v10;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t get_zone_type(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, _DWORD **), uint64_t a3, _DWORD *a4)
{
  uint64_t result;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;

  if (!a2)
    nanov2_realloc_VARIANT_mp_cold_1();
  *a4 = 0;
  v10 = 0;
  result = a2(a1, a3, 200, (_DWORD **)&v10);
  if (!(_DWORD)result)
  {
    if (*(_DWORD *)(v10 + 104) >= 0xEu)
    {
      v8 = *(_QWORD *)(v10 + 96) + 128;
      v9 = 0;
      result = a2(a1, v8, 4, &v9);
      if (!(_DWORD)result)
        *a4 = *v9;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t szone_statistics_task(uint64_t task, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, uint64_t *a4), uint64_t a4)
{
  uint64_t (*v5)(task_name_t, uint64_t, uint64_t, uint64_t *);
  uint64_t is_self;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a3;
  if (!a3)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self)
        nanov2_realloc_VARIANT_mp_cold_1(is_self);
    }
    v5 = _malloc_default_reader_0;
  }
  v23 = 0;
  result = v5(task, a2, 20480, &v23);
  if (!(_DWORD)result)
  {
    v22 = 0;
    result = v5(task, *(_QWORD *)(v23 + 17136), 2560 * *(int *)(v23 + 17120), &v22);
    if (!(_DWORD)result)
    {
      v10 = *(unsigned int *)(v23 + 17120);
      if ((v10 & 0x80000000) != 0)
      {
        v13 = 0;
        v12 = 0;
        v11 = 0;
      }
      else
      {
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = v22 - 432;
        v15 = v10 + 1;
        do
        {
          v13 += *(_QWORD *)(v14 + 8) + *(_QWORD *)v14;
          v12 += *(_DWORD *)(v14 + 40);
          v11 += *(_QWORD *)(v14 + 24);
          v14 += 2560;
          --v15;
        }
        while (v15);
      }
      result = v5(task, *(_QWORD *)(v23 + 17904), 2560 * *(int *)(v23 + 17888), &v22);
      if (!(_DWORD)result)
      {
        v16 = (_QWORD *)v23;
        v17 = *(unsigned int *)(v23 + 17888);
        if ((v17 & 0x80000000) == 0)
        {
          v18 = v22 - 432;
          v19 = v17 + 1;
          do
          {
            v13 += *(_QWORD *)(v18 + 8) + *(_QWORD *)v18;
            v12 += *(_DWORD *)(v18 + 40);
            v11 += *(_QWORD *)(v18 + 24);
            v18 += 2560;
            --v19;
          }
          while (v19);
        }
        result = 0;
        v20 = *(_QWORD *)(v23 + 18840);
        *(_DWORD *)a4 = *(_DWORD *)(v23 + 18820) + v12;
        *(_QWORD *)(a4 + 8) = v20 + v11;
        v21 = v20 + ((v16[2065] - v16[2066]) << 20) + ((v16[2161] - v16[2162]) << 23);
        *(_QWORD *)(a4 + 16) = v21 - v13;
        *(_QWORD *)(a4 + 24) = v21;
      }
    }
  }
  return result;
}

uint64_t _malloc_default_reader(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t is_self;

  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self)
      nanov2_realloc_VARIANT_mp_cold_1(is_self);
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_0(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t is_self;

  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self)
      nanov2_realloc_VARIANT_mp_cold_1(is_self);
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_1(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t is_self;

  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self)
      nanov2_realloc_VARIANT_mp_cold_1(is_self);
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_2(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t is_self;

  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self)
      nanov2_realloc_VARIANT_mp_cold_1(is_self);
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_3(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t is_self;

  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self)
      nanov2_realloc_VARIANT_mp_cold_1(is_self);
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_4(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t is_self;

  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self)
      nanov2_realloc_VARIANT_mp_cold_1(is_self);
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_5(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t is_self;

  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self)
      nanov2_realloc_VARIANT_mp_cold_1(is_self);
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_6(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t is_self;

  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!(_DWORD)is_self)
      nanov2_realloc_VARIANT_mp_cold_1(is_self);
  }
  *a4 = a2;
  return 0;
}

uint64_t nanov2_statistics(uint64_t task, const void *a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4), void (*a4)(const char *, ...), uint64_t a5)
{
  uint64_t (*v6)(task_name_t, uint64_t, uint64_t, _QWORD *);
  void (*v9)(const char *, ...);
  uint64_t is_self;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  unsigned __int16 v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v30;
  _QWORD *v31;

  v6 = a3;
  if (a4)
    v9 = a4;
  else
    v9 = (void (*)(const char *, ...))nanov2_null_printer;
  if (!a3)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self)
        nanov2_realloc_VARIANT_mp_cold_1(is_self);
    }
    v6 = _malloc_default_reader_4;
  }
  if (nanov2_config_predicate != -1)
    _os_once();
  _platform_memset();
  v31 = 0;
  v11 = v6(task, (uint64_t)a2, 29264, &v31);
  if (!(_DWORD)v11)
  {
    v13 = atomic_load(v31 + 3591);
    v14 = v31[3590];
    if (!v14)
      return 0;
    v15 = ((unsigned __int16)(v31[3585] >> 6) | (unsigned __int16)((unsigned __int16)v31[3585] << 6)) & 0xFFF;
    while (1)
    {
      v30 = 0;
      v16 = v6(task, v14, 0x20000000, &v30);
      if ((_DWORD)v16)
      {
        v12 = v16;
        v9("Failed to map nanov2 region at %p\n", (const void *)v14);
        return v12;
      }
      v17 = v30 - v14;
      v18 = (char *)(v14 == ((v13 - 1) & 0xFFFFFFFFE0000000) ? v13 : v14 + 0x20000000);
      v19 = v31;
      v20 = v31[3586];
      if (v14 < (unint64_t)v18)
        break;
LABEL_33:
      v27 = *(unsigned __int16 *)(v17
                                + (v20 ^ v14 & 0xFFFFFFFFFC000000)
                                + 4
                                * (((unsigned __int16)(*((_DWORD *)v19 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)v19 + 7170) << 6)) & 0xFFF));
      if (v14 + (v27 << 29) >= v13)
        v14 = 0;
      else
        v14 += v27 << 29;
      if ((_DWORD)v27)
        v28 = v14 == 0;
      else
        v28 = 1;
      if (v28)
        return 0;
    }
    v21 = v14;
LABEL_20:
    v22 = 0;
    v23 = 0;
    while (1)
    {
      if (v15 != v23)
      {
        v24 = ptr_offset_to_size_class[((v22 | (unsigned __int16)(v23 >> 6)) & 0xFC0 ^ *((_DWORD *)v19 + 7170)) >> 6];
        v25 = *(_DWORD *)((v20 ^ v21 & 0xFFFFFFFFFC000000) + v17 + 4 * v23) & 0x7FF;
        if (v25 > 0x7FC)
        {
          if (v25 - 2045 < 3)
            goto LABEL_31;
        }
        else
        {
          if (!v25 || v25 == 2042)
            goto LABEL_31;
          if (v25 == 2044)
          {
            v26 = slots_by_size_class[v24];
            if (!v26)
              goto LABEL_31;
LABEL_30:
            *(_DWORD *)a5 += v26;
            *(_QWORD *)(a5 + 8) += (int)(v26 * (16 * v24 + 16));
            *(_QWORD *)(a5 + 24) += 0x4000;
            goto LABEL_31;
          }
        }
        v26 = slots_by_size_class[v24]
            + (~(*(_DWORD *)((v20 ^ v21 & 0xFFFFFFFFFC000000) + v17 + 4 * v23) >> 11) | 0xFFFFFC00);
        if (v26)
          goto LABEL_30;
      }
LABEL_31:
      ++v23;
      v22 += 64;
      if (v23 == 4096)
      {
        v21 += 0x4000000;
        if (v21 >= (unint64_t)v18)
          goto LABEL_33;
        goto LABEL_20;
      }
    }
  }
  v12 = v11;
  v9("Failed to map nanozonev2_s at %p\n", a2);
  return v12;
}

uint64_t nanov2_statistics_self(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  task_name_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned __int16 v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  BOOL v18;
  task_name_t task;

  task = *MEMORY[0x1E0C883F0];
  if (nanov2_config_predicate != -1)
    _os_once();
  result = _platform_memset();
  v5 = task;
  if (task)
  {
    result = mach_task_is_self(task);
    v5 = task;
    if (!(_DWORD)result)
      nanov2_realloc_VARIANT_mp_cold_1(result);
  }
  v6 = atomic_load(a1 + 3591);
  v7 = a1[3590];
  if (v7)
  {
    v8 = ((unsigned __int16)(a1[3585] >> 6) | (unsigned __int16)((unsigned __int16)a1[3585] << 6)) & 0xFFF;
    while (1)
    {
      if (v5)
      {
        result = mach_task_is_self(v5);
        v5 = task;
        if (!(_DWORD)result)
          nanov2_realloc_VARIANT_mp_cold_1(result);
      }
      v9 = v7 == ((v6 - 1) & 0xFFFFFFFFE0000000) ? v6 : v7 + 0x20000000;
      v10 = a1[3586];
      if (v7 < v9)
        break;
LABEL_27:
      v17 = *(unsigned __int16 *)((v10 ^ v7 & 0xFFFFFFFFFC000000)
                                + 4
                                * (((unsigned __int16)(*((_DWORD *)a1 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)a1 + 7170) << 6)) & 0xFFF));
      if ((_DWORD)v17)
        v18 = v7 == 0;
      else
        v18 = 1;
      v7 += v17 << 29;
      if (v18 || v7 >= v6)
        return result;
    }
    v11 = v7;
LABEL_14:
    v12 = 0;
    v13 = 0;
    while (1)
    {
      if (v8 != v13)
      {
        v14 = ptr_offset_to_size_class[((v12 | (unsigned __int16)(v13 >> 6)) & 0xFC0 ^ *((_DWORD *)a1 + 7170)) >> 6];
        v15 = *(_DWORD *)((v11 & 0xFFFFFFFFFC000000 ^ v10) + 4 * v13) & 0x7FF;
        if (v15 > 0x7FC)
        {
          if (v15 - 2045 < 3)
            goto LABEL_25;
        }
        else
        {
          if (!v15 || v15 == 2042)
            goto LABEL_25;
          if (v15 == 2044)
          {
            v16 = slots_by_size_class[v14];
            if (!v16)
              goto LABEL_25;
LABEL_24:
            *(_DWORD *)a2 += v16;
            *(_QWORD *)(a2 + 8) += (int)(v16 * (16 * v14 + 16));
            *(_QWORD *)(a2 + 24) += 0x4000;
            goto LABEL_25;
          }
        }
        v16 = slots_by_size_class[v14]
            + (~(*(_DWORD *)((v11 & 0xFFFFFFFFFC000000 ^ v10) + 4 * v13) >> 11) | 0xFFFFFC00);
        if (v16)
          goto LABEL_24;
      }
LABEL_25:
      ++v13;
      v12 += 64;
      if (v13 == 4096)
      {
        v11 += 0x4000000;
        if (v11 >= v9)
          goto LABEL_27;
        goto LABEL_14;
      }
    }
  }
  return result;
}

uint64_t mfm_initialize()
{
  mach_vm_address_t pages_plat;
  unint64_t v1;
  uint64_t result;
  unint64_t i;
  mach_vm_address_t address;

  pages_plat = mvm_allocate_pages_plat(0x800000uLL, 0, 1073741827, 1);
  if (!pages_plat)
    mfm_initialize_cold_1();
  v1 = pages_plat;
  address = pages_plat;
  result = mach_vm_map(*MEMORY[0x1E0C883F0], &address, 0x800000uLL, 0, 117456896, 0, 0, 0, 3, 7, 1u);
  if ((_DWORD)result)
    mfm_initialize_cold_2(result);
  *(_DWORD *)v1 = 0;
  *(_QWORD *)(v1 + 216) = 0x8000000000000000;
  for (i = 2; i != 13; ++i)
    *(int64x2_t *)(v1 + 16 * i) = vdupq_n_s64(i);
  *(_QWORD *)(v1 + 224) |= 1uLL;
  atomic_store(v1, &mfm_arena);
  return result;
}

uint64_t malloc_common_convert_to_long(char *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t result;
  char *v5;
  uint64_t v6;
  unsigned int v7;

  v3 = 0;
  do
  {
    result = v3;
    v5 = a1;
    v6 = *a1;
    if (!v6)
      break;
    v7 = (v6 - 58);
    v3 = (v6 - 48) + 10 * v3;
    a1 = v5 + 1;
  }
  while (v7 > 0xF5);
  *a2 = v5;
  return result;
}

uint64_t nanov2_configure()
{
  uint64_t result;

  if (nanov2_config_predicate != -1)
    return _os_once();
  return result;
}

uint64_t nano_common_configure()
{
  uint64_t v0;
  char *v1;
  uint64_t result;
  char v3;
  uint64_t v4;

  if (nano_common_max_magazines)
    v0 = nano_common_max_magazines;
  else
    v0 = phys_ncpus;
  v1 = getenv("MallocNanoMaxMagazines");
  if (v1 || (v1 = getenv("_MallocNanoMaxMagazines")) != 0)
  {
    result = strtol(v1, 0, 0);
    v3 = 0;
    if ((result & 0x80000000) == 0)
      goto LABEL_10;
    malloc_report(3u, (uint64_t)"MallocNanoMaxMagazines must be positive - ignored.\n");
    v3 = 0;
  }
  else
  {
    v3 = 1;
  }
  result = v0;
LABEL_10:
  v4 = phys_ncpus;
  if ((_DWORD)result)
  {
    if (result <= phys_ncpus)
      goto LABEL_14;
    malloc_report(3u, (uint64_t)"Nano maximum magazines limited to number of physical CPUs [%d]\n");
  }
  result = v4;
LABEL_14:
  nano_common_max_magazines = result;
  if ((v3 & 1) == 0)
  {
    malloc_report(6u, (uint64_t)"Nano maximum magazines set to %d\n");
    result = nano_common_max_magazines;
  }
  if (_os_cpu_number_override != (_UNKNOWN *__ptr32)-1 || (_DWORD)result != phys_ncpus)
    nano_common_max_magazines_is_ncpu = 0;
  if (_malloc_engaged_nano == 2)
    return nanov2_configure();
  return result;
}

BOOL nano_common_allocate_vm_space(mach_vm_address_t a1, mach_vm_size_t a2)
{
  return _nano_common_map_vm_space(a1, a2, 3) != 0;
}

mach_vm_address_t nano_common_allocate_based_pages(mach_vm_size_t a1, char a2, __int16 a3, int a4, uint64_t a5)
{
  mach_vm_address_t result;
  mach_vm_address_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_vm_size_t v11;
  mach_vm_address_t v12;
  kern_return_t v13;
  kern_return_t v14;
  mach_vm_address_t address;

  result = 0;
  v8 = *MEMORY[0x1E0C88820];
  v9 = *MEMORY[0x1E0C88820] - 1;
  v10 = -*MEMORY[0x1E0C88820];
  if (((v9 + a1) & v10) != 0)
    v11 = (v9 + a1) & v10;
  else
    v11 = *MEMORY[0x1E0C88820];
  if (v11 >= a1)
  {
    v12 = (v9 + a5) & v10;
    if (v12)
      v8 = v12;
    address = v8;
    v13 = mach_vm_map(*MEMORY[0x1E0C883F0], &address, v11, ~(-1 << a2), (a4 << 24) | 1, 0, 0, 0, 3, 7, 1u);
    if (v13)
    {
      v14 = v13;
      result = 0;
      if (v14 != 3)
      {
        malloc_zone_error(a3, 0, (uint64_t)"*** can't allocate pages: mach_vm_map(size=%lu) failed (error code=%d)\n");
        return 0;
      }
    }
    else
    {
      return address;
    }
  }
  return result;
}

uint64_t mvm_deferred_reclaim_init()
{
  return mach_vm_reclaim_ringbuffer_init();
}

uint64_t _nano_common_map_vm_space(mach_vm_address_t a1, mach_vm_size_t size, vm_prot_t cur_protection)
{
  vm_map_t *v5;
  kern_return_t v6;
  uint64_t result;
  mach_vm_address_t address;

  address = a1;
  v5 = (vm_map_t *)MEMORY[0x1E0C883F0];
  v6 = mach_vm_map(*MEMORY[0x1E0C883F0], &address, size, 0, 184549376, 0, 0, 0, cur_protection, 7, 1u);
  result = 0;
  if (!v6)
  {
    if (address == a1)
    {
      return 1;
    }
    else
    {
      mach_vm_deallocate(*v5, address, size);
      return 0;
    }
  }
  return result;
}

uint64_t malloc_type_zone_malloc_with_options_np(malloc_zone_t *a1, size_t a2, size_t a3, uint64_t a4, unint64_t a5)
{
  return malloc_type_zone_malloc_with_options_internal(a1, a2, a3, a5, a4);
}

void *__cdecl malloc_type_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size, malloc_type_id_t type_id)
{
  BOOL v4;

  if (malloc_logger)
    v4 = 0;
  else
    v4 = malloc_slowpath == 0;
  if (!v4 || malloc_absolute_max_size < size)
    return (void *)_malloc_type_zone_realloc_outlined(zone, ptr, size, type_id);
  if (default_zone == (_UNKNOWN *)zone)
    zone = *(malloc_zone_t **)malloc_zones;
  if (zone->version < 0x10)
    return (void *)_malloc_zone_realloc((uint64_t)zone, (uint64_t)ptr, size, type_id);
  else
    return (void *)((uint64_t (*)(malloc_zone_t *, void *, size_t, malloc_type_id_t))zone[1].malloc)(zone, ptr, size, type_id);
}

void xzm_malloc_zone_free_definite_size(uint64_t a1, unint64_t a2)
{
  _xzm_free(a1, a2, 0);
}

void _xzm_xzone_free_block_to_small_chunk(uint64_t a1, uint64_t a2, int8x8_t *a3, int a4)
{
  unsigned __int8 v8;
  os_unfair_lock_s *v9;
  os_unfair_lock_s *v10;
  os_unfair_lock_s *v11;
  int v12;
  uint64_t v13;
  _BOOL4 v14;
  os_unfair_lock_s *v15;
  os_unfair_lock_s *v16;
  int8x8_t *v17;
  int8x8_t v18;
  int8x8_t *v19;

  v8 = a3[1].u8[4];
  v9 = (os_unfair_lock_s *)&a3[1];
  while (v8)
  {
    v10 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 224)
                             + 32
                             * (*(unsigned __int8 *)(a2 + 72)
                              + *(unsigned __int8 *)(a1 + 210) * (unint64_t)(v8 - 1)));
    v11 = v10 + 2;
    os_unfair_lock_lock_with_options();
    v12 = a3[1].u8[4];
    if (v12 == v8)
    {
      _xzm_xzone_free_to_chunk(a1, a3, a4);
      _xzm_xzone_chunk_madvise_free_slices(a1, a2, (uint64_t)a3, a4);
      v13 = a3[4].i8[0] & 0xF;
      if ((_DWORD)v13 == 2)
      {
        if ((~a3->i32[0] & 0x7FE) == 0 || (((unsigned __int32)a3->i32[0] >> 11) & 0x7FF) == *(_DWORD *)(a2 + 68))
        {
LABEL_17:
          *(_QWORD *)&v10->_os_unfair_lock_opaque = 0;
          a3[1].i8[4] = 0;
          v16 = v10 + 2;
LABEL_40:
          os_unfair_lock_unlock(v16);
          _xzm_xzone_chunk_free(a1, a2, (unint64_t)a3);
          return;
        }
      }
      else
      {
        if ((_DWORD)v13 != 5)
        {
          qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
          qword_1EE228038 = v13;
          __break(1u);
          goto LABEL_42;
        }
        if (!a3->i32[1])
          goto LABEL_17;
      }
      v15 = v10 + 2;
LABEL_34:
      os_unfair_lock_unlock(v15);
      return;
    }
LABEL_6:
    os_unfair_lock_unlock(v11);
    v8 = v12;
  }
  os_unfair_lock_lock_with_options();
  LOBYTE(v12) = a3[1].i8[4];
  v11 = v9;
  if ((_BYTE)v12)
    goto LABEL_6;
  v13 = a3[4].i8[0] & 0xF;
  if ((_DWORD)v13 == 2)
  {
    v14 = (*(_QWORD *)a3 & 0x3FF800) == 0 && (a3->u32[0] | 0xFFFFF800) < 0xFFFFFFFE;
LABEL_21:
    _xzm_xzone_free_to_chunk(a1, a3, a4);
    _xzm_xzone_chunk_madvise_free_slices(a1, a2, (uint64_t)a3, a4);
    v13 = a3[4].i8[0] & 0xF;
    if ((_DWORD)v13 == 2)
    {
      if ((~a3->i32[0] & 0x7FE) == 0 || (((unsigned __int32)a3->i32[0] >> 11) & 0x7FF) == *(_DWORD *)(a2 + 68))
      {
LABEL_35:
        os_unfair_lock_unlock(v9);
        os_unfair_lock_lock_with_options();
        if ((a3[4].i8[0] & 0x20) != 0)
        {
          v19 = (int8x8_t *)a3[2];
          if (v19)
          {
            v19[3] = a3[3];
            v19 = (int8x8_t *)a3[2];
          }
          **(_QWORD **)&a3[3] = v19;
          a3[4].i8[0] &= ~0x20u;
        }
        v16 = (os_unfair_lock_s *)(a2 + 24);
        goto LABEL_40;
      }
    }
    else
    {
      if ((_DWORD)v13 != 5)
        goto LABEL_43;
      if (!a3->i32[1])
        goto LABEL_35;
    }
    if (v14)
    {
      os_unfair_lock_lock_with_options();
      v17 = (int8x8_t *)a3[2];
      if (v17)
      {
        v17[3] = a3[3];
        v17 = (int8x8_t *)a3[2];
      }
      **(_QWORD **)&a3[3] = v17;
      v18 = *(int8x8_t *)a2;
      a3[2] = *(int8x8_t *)a2;
      if (v18)
        *(_QWORD *)(*(_QWORD *)a2 + 24) = a3 + 2;
      *(_QWORD *)a2 = a3;
      a3[3] = (int8x8_t)a2;
      a3[4].i8[0] |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 24));
    }
    v15 = v9;
    goto LABEL_34;
  }
  if ((_DWORD)v13 == 5)
  {
    v14 = a3->i32[1] == *(_DWORD *)(a2 + 68);
    goto LABEL_21;
  }
LABEL_42:
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
  qword_1EE228038 = v13;
  __break(1u);
LABEL_43:
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
  qword_1EE228038 = v13;
  __break(1u);
}

uint64_t _xzm_xzone_chunk_madvise_free_slices(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  unsigned int v17;
  unsigned int v18;

  if ((*(_BYTE *)(a3 + 32) & 0xF) == 5)
  {
    v4 = result;
    result = *(_QWORD *)(a3 & 0xFFFFFFFFFFFFC000);
    switch(*(_BYTE *)result)
    {
      case 0:
      case 2:
        if (((*(unsigned __int8 *)(*(_QWORD *)(result + 24) + 328) >> 2) & 1) == 0)
          goto LABEL_6;
        return result;
      case 1:
      case 3:
        if ((*(_BYTE *)(*(_QWORD *)(result + 24) + 328) & 8) == 0)
        {
LABEL_6:
          v5 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFC000) + 0x30);
          v6 = 0xAAAAAAAAAAAAC000 * ((a3 - (a3 & 0xFFFFFFFFFFFFC000) - 2104) >> 4);
          v7 = *(_QWORD *)(*(_QWORD *)(v4 + 216) + 88 * *(unsigned __int8 *)(a3 + 33) + 48);
          v8 = (a4 - v5 - v6) / v7;
          v9 = (v6 & 0x3FFFFFFFC000) + v7 * v8;
          v10 = v9 >> 14;
          v11 = (v7 + v9 - 1) >> 14;
          v12 = (((_DWORD)v9 - (_DWORD)v6) & 0xFFFFC000) / v7;
          v13 = (~(_DWORD)v6 + (((_DWORD)v11 + 1) << 14)) / v7;
          if ((((unint64_t)~(-1 << (v8 - v12 + 1)) << v12) & ~*(_DWORD *)a3) != 0)
            v14 = (v10 + 1);
          else
            v14 = v10;
          if ((((unint64_t)~(-1 << (v13
                                                                      - v8
                                                                      - (*(_DWORD *)(a2 + 68) == (_DWORD)v13)
                                                                      + 1)) << v8) & ~*(_DWORD *)a3) != 0)
            v15 = v11;
          else
            v15 = v11 + 1;
          v16 = v15 >= v14;
          v17 = v15 - v14;
          if (v17 != 0 && v16)
          {
            if (v16)
              v18 = v17;
            else
              v18 = 0;
            result = xzm_segment_group_segment_madvise_span(result, (void *)(v5 + (v14 << 14)), v18);
          }
        }
        break;
      default:
        _xzm_segment_group_find_and_allocate_chunk_cold_1(*(_BYTE *)result);
    }
  }
  return result;
}

int32x2_t _xzm_xzone_free_to_chunk(uint64_t a1, int8x8_t *a2, int a3)
{
  int8x8_t v3;
  int32x2_t result;

  if ((a2[4].i8[0] & 0xF) != 5)
    _xzm_xzone_free_to_chunk_cold_1(a2[4].i8[0] & 0xF);
  v3.i32[1] = -1;
  v3.i32[0] = 1 << ((unint64_t)(a3
                                     + 1431650304 * ((a2 - (a2 & 0xFFFFC000 | 0x838)) >> 4)
                                     - *(_DWORD *)(((unint64_t)a2 & 0xFFFFFFFFFFFFC000) + 0x30))
                  / *(_QWORD *)(*(_QWORD *)(a1 + 216) + 88 * a2[4].u8[1] + 48));
  v3.i32[0] = vorr_s8(v3, *a2).u32[0];
  result = vadd_s32((int32x2_t)*a2, (int32x2_t)-1);
  v3.i32[1] = result.i32[1];
  *a2 = v3;
  return result;
}

BOOL xzm_segment_group_segment_madvise_span(uint64_t a1, void *a2, unsigned int a3)
{
  return mvm_madvise(a2, (unint64_t)a3 << 14, 7);
}

uint64_t default_zone_free_definite_size()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(v0 + 120))();
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  unint64_t StatusReg;
  uint64_t v3;
  malloc_type_id_t v4;
  BOOL v5;
  void *result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v3 = *(_QWORD *)(StatusReg + 904);
  if (type_id <= 1)
    v4 = 1;
  else
    v4 = type_id;
  *(_QWORD *)(StatusReg + 904) = v4;
  if (malloc_interposition_compat)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (v5)
    result = j__valloc(size);
  else
    result = (void *)_malloc_zone_valloc((uint64_t)default_zone, size, 1);
  *(_QWORD *)(StatusReg + 904) = v3;
  return result;
}

uint64_t _malloc_zone_valloc(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v3;
  unint64_t StatusReg;
  uint64_t v8;
  int v9;
  uint64_t v10;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v8 = *(_QWORD *)(StatusReg + 904);
  if (!v8)
    *(_QWORD *)(StatusReg + 904) = (v3 >> 2);
  v9 = malloc_tracing_enabled;
  if (malloc_tracing_enabled)
    kdebug_trace();
  if (malloc_check_start)
    internal_check();
  if (malloc_absolute_max_size >= a2)
  {
    v10 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 40))(a1, a2);
    if (malloc_logger)
      malloc_logger(10, a1, a2, 0, v10, 0);
    if (malloc_simple_stack_logging == 1)
    {
      malloc_report(0x325u, (uint64_t)"valloc (%p/%llu): ");
      if (!v9)
      {
LABEL_14:
        if (!v8)
          goto LABEL_19;
        goto LABEL_15;
      }
    }
    else if (!v9)
    {
      goto LABEL_14;
    }
    kdebug_trace();
    if (!v8)
      goto LABEL_19;
LABEL_15:
    if (v10)
      return v10;
    goto LABEL_21;
  }
  v10 = 0;
  if (v8)
    goto LABEL_15;
LABEL_19:
  *(_QWORD *)(StatusReg + 904) = 0;
  if (v10)
    return v10;
LABEL_21:
  if ((a3 & 1) != 0)
    **(_DWORD **)(StatusReg + 8) = 12;
  return v10;
}

void _xzm_memalign(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, char a5)
{
  unint64_t v5;
  char v6;

  v5 = a2;
  v6 = a5 | 2;
  if (a2 > 0x4000 || a3 > 0x8000)
  {
    _xzm_malloc_large_huge(a1, a3, a2, a4, v6);
  }
  else
  {
    if (a3 > a2)
    {
      a2 *= 2;
      if (2 * v5 < a3)
      {
        a2 = 4 * v5;
        if (4 * v5 <= a3)
          a2 = a3;
      }
    }
    xzm_malloc(a1, a2, a4, v6);
  }
}

void _xzm_xzone_malloc_small(uint64_t a1, uint64_t a2, char a3)
{
  os_unfair_lock_s *v5;
  unint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int8x8_t v11;
  unsigned int v12;
  int *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  os_unfair_lock_s *v17;
  char v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t chunk_from_isolation;
  uint64_t *v29;
  uint64_t v30;
  mach_vm_address_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  int v50;
  unint64_t v51;
  unint64_t v52;
  int v53;
  unint64_t v54;
  unint64_t v55;
  unsigned int v56;
  uint64_t os_unfair_lock_opaque;
  os_unfair_lock_s *v58;
  unsigned int v59;
  int v60;
  BOOL v61;
  unsigned int v62;
  BOOL v63;
  unsigned int v64;
  os_unfair_lock_s *v65;
  uint8x8_t v66;
  unint64_t v67;
  unint64_t v68;
  unsigned int v69;
  _QWORD *v70;
  size_t v71;
  unsigned __int8 v72;
  os_unfair_lock_s *lock;
  uint64_t v75;

  v5 = (os_unfair_lock_s *)*(unsigned __int8 *)(a2 + 77);
  if ((_DWORD)v5 == 1)
  {
    v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) >> 12;
    goto LABEL_5;
  }
  if ((_DWORD)v5 == 2)
  {
    LOBYTE(v6) = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2));
LABEL_5:
    v7 = v6;
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:
  v8 = *(_QWORD *)(a1 + 224);
  v9 = *(unsigned __int8 *)(a2 + 72) + *(unsigned __int8 *)(a1 + 210) * (unint64_t)v7;
  v10 = v8 + 32 * v9;
  lock = (os_unfair_lock_s *)(v10 + 8);
  if (v5 >= (*(_BYTE *)(a1 + 240) & 3u))
  {
    os_unfair_lock_lock_with_options();
    goto LABEL_32;
  }
  if (os_unfair_lock_trylock((os_unfair_lock_t)(v10 + 8))
    || (os_unfair_lock_lock_with_options(),
        v12 = *(_DWORD *)(v10 + 20) + 1,
        *(_DWORD *)(v10 + 20) = v12,
        v12 <= *(_DWORD *)(a1 + 4 * (_QWORD)v5 + 244)))
  {
LABEL_30:
    v19 = v8 + 32 * v9;
    v20 = *(_DWORD *)(v19 + 16) + 1;
    *(_DWORD *)(v19 + 16) = v20;
    if (!(v20 % *(_DWORD *)(a1 + 256)))
      *(_DWORD *)(v10 + 20) = 0;
LABEL_32:
    v21 = *(_QWORD *)v10;
    if (!*(_QWORD *)v10)
    {
      v5 = (os_unfair_lock_s *)(a2 + 24);
      os_unfair_lock_lock_with_options();
      goto LABEL_49;
    }
    v22 = *(_BYTE *)(v21 + 32) & 0xF;
    if ((_DWORD)v22 == 2)
    {
      if ((*(_QWORD *)v21 & 0x3FF800) != 0 || (*(_QWORD *)v21 | 0xFFFFF800) >= 0xFFFFFFFE)
        goto LABEL_74;
    }
    else
    {
      if ((_DWORD)v22 != 5)
        goto LABEL_141;
      if (*(_DWORD *)(v21 + 4) != *(_DWORD *)(a2 + 68))
      {
LABEL_74:
        v22 = *(_BYTE *)(v21 + 32) & 0xF;
        if ((v22 - 6) < 2)
        {
          v36 = 0;
        }
        else
        {
          if ((_DWORD)v22 != 5 && (_DWORD)v22 != 2)
            goto LABEL_142;
          v36 = *(_QWORD *)(*(_QWORD *)(a1 + 216) + 88 * *(unsigned __int8 *)(v21 + 33) + 48) & 0x3FFFLL;
        }
        if ((_DWORD)v22 == 5)
        {
          v37 = (0xAAAAAAAAAAAAC000 * (((unint64_t)(v21 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000;
          v38 = *(_DWORD *)(v21 + 4);
          if (v38 && v36)
          {
            v39 = *(unsigned int *)(v21 + 40);
            if ((_DWORD)v39)
            {
              v40 = 0;
              v41 = 0;
              v42 = 0;
              v43 = 0;
              v44 = *(_QWORD *)(a1 + 216);
              v45 = 48 * v39;
              v46 = -1;
              while (1)
              {
                v5 = (os_unfair_lock_s *)(v21 + v40);
                v47 = v21 + v40;
                v48 = (char *)(v21 + v40);
                if ((*(_BYTE *)(v21 + v40 + 32) & 0xF) != 4)
                  goto LABEL_85;
                os_unfair_lock_opaque = v5[9]._os_unfair_lock_opaque;
                v58 = (os_unfair_lock_s *)((char *)v5 - os_unfair_lock_opaque);
                v59 = *((_BYTE *)&v5[8]._os_unfair_lock_opaque - os_unfair_lock_opaque) & 0xF;
                v47 = v21 + v40;
                v48 = (char *)(v21 + v40);
                if (v59 > 8)
                  goto LABEL_85;
                v60 = 1 << v59;
                if ((v60 & 0x1E8) == 0)
                  break;
                v47 = v21 + v40;
                v48 = (char *)(v21 + v40);
                if (&v58[12 * v58[10]._os_unfair_lock_opaque] > v5)
                  goto LABEL_113;
LABEL_85:
                v22 = v48[32] & 0xF;
                if ((v22 - 6) < 2)
                {
                  v49 = (unint64_t)*((unsigned int *)v48 + 10) << 14;
                }
                else
                {
                  if ((_DWORD)v22 != 5 && (_DWORD)v22 != 2)
                  {
                    qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: asking for size of chunk with invalid kind";
                    qword_1EE228038 = v22;
                    __break(1u);
LABEL_139:
                    qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: asking for size of chunk with invalid kind";
                    qword_1EE228038 = v22;
                    __break(1u);
                    goto LABEL_140;
                  }
                  v49 = *(_QWORD *)(v44 + 88 * v48[33] + 48);
                }
                v50 = -1431650304 * (((unint64_t)&v5[-526] - ((unint64_t)v5 & 0xFFFFFFFFFFFFC000)) >> 4)
                    + *(_QWORD *)(((unint64_t)v5 & 0xFFFFFFFFFFFFC000) + 0x30);
                v51 = ((0xAAAAAAAAAAAAC000 * (((unint64_t)(v47 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
                    + *(_QWORD *)((v47 & 0xFFFFFFFFFFFFC000) + 0x30);
                v52 = (v50 - v51) / v49;
                v53 = *(_DWORD *)(v44 + 88 * v48[33] + 68);
                if (v53 == (_DWORD)v52)
                {
                  LODWORD(v54) = 0;
                }
                else
                {
                  if ((v22 - 6) < 2)
                  {
                    v55 = (unint64_t)*((unsigned int *)v48 + 10) << 14;
                  }
                  else
                  {
                    if ((_DWORD)v22 != 5 && (_DWORD)v22 != 2)
                      goto LABEL_139;
                    v55 = *(_QWORD *)(v44 + 88 * v48[33] + 48);
                  }
                  v54 = (unint64_t)~(-1 << ((v50 - v51 + 0x3FFF) / v55
                                                               - v52
                                                               - (v53 == ((v50 - v51 + 0x3FFF)
                                                                                      / v55))
                                                               + 1)) << v52;
                }
                v56 = *(_DWORD *)v21;
                if ((*(_DWORD *)v21 & v54) != 0 && (*(_DWORD *)v21 & v54) != (_DWORD)v54)
                {
                  v11.i32[0] = *(_DWORD *)v21 & v54;
                  v11 = vcnt_s8(v11);
                  v11.i16[0] = vaddlv_u8((uint8x8_t)v11);
                  if (v11.i32[0] < v46)
                  {
                    v41 = *(_DWORD *)v21 & v54;
                    v46 = v11.i32[0];
                    v43 = v21 + v40;
                  }
                }
                ++v42;
                v40 += 48;
                if (v45 == v40)
                {
                  if (!v43)
                    goto LABEL_128;
                  v64 = __clz(__rbit32(v41));
                  if (!v41)
                  {
                    v64 = -1;
                    goto LABEL_118;
                  }
                  v11.i32[0] = v41;
                  v66 = (uint8x8_t)vcnt_s8(v11);
                  v66.i16[0] = vaddlv_u8(v66);
                  if (v66.i32[0] >= 2u)
                  {
                    v67 = (v37 + v64 + *(_QWORD *)(a2 + 48)) >> 14;
                    v68 = (v21 & 0xFFFFFFFFFFFFC000) + 48 * v67 + 2104;
                    if (*(_DWORD *)((v21 & 0xFFFFFFFFFFFFC000) + 0x10) <= v67)
                      v68 = 0;
                    if (v68 < v43)
                    {
                      v63 = (v41 & ~(1 << v64)) == 0;
                      v62 = __clz(__rbit32(v41 & ~(1 << v64)));
                      goto LABEL_115;
                    }
                  }
                  goto LABEL_118;
                }
              }
              v61 = (v60 & 6) != 0 && v5 == v58;
              v47 = v21 + v40;
              v48 = (char *)(v21 + v40);
              if (!v61)
                goto LABEL_85;
LABEL_113:
              v47 = v21 + 48 * v42 - os_unfair_lock_opaque;
              v48 = (char *)v5 - os_unfair_lock_opaque;
              goto LABEL_85;
            }
            v56 = *(_DWORD *)v21;
LABEL_128:
            v65 = lock;
            v69 = __clz(__rbit32(v56));
            if (v56)
              v64 = v69;
            else
              v64 = -1;
          }
          else
          {
            v56 = *(_DWORD *)v21;
            v62 = __clz(__rbit32(*(_DWORD *)v21));
            v63 = *(_DWORD *)v21 == 0;
LABEL_115:
            if (v63)
              v64 = -1;
            else
              v64 = v62;
LABEL_118:
            v65 = lock;
          }
          v70 = (_QWORD *)(v37 + *(_QWORD *)((v21 & 0xFFFFFFFFFFFFC000) + 0x30) + *(_QWORD *)(a2 + 48) * v64);
          *(_DWORD *)v21 = v56 & ~(1 << v64);
          *(_DWORD *)(v21 + 4) = v38 + 1;
          os_unfair_lock_unlock(v65);
          if (v70)
          {
            v70[1] = 0;
            if ((a3 & 1) != 0)
            {
              v71 = *(_QWORD *)(a2 + 48);
              if (v71 >= 0x401)
                bzero(v70, v71);
            }
            return;
          }
LABEL_136:
          **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
          return;
        }
LABEL_140:
        v22 = v22;
        qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: attempting to allocate from chunk of bad kind";
        qword_1EE228038 = v22;
        __break(1u);
LABEL_141:
        qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
        qword_1EE228038 = v22;
        __break(1u);
LABEL_142:
        qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: asking for size of chunk with invalid kind";
        qword_1EE228038 = v22;
        __break(1u);
        goto LABEL_143;
      }
    }
    v5 = (os_unfair_lock_s *)(a2 + 24);
    os_unfair_lock_lock_with_options();
    v24 = a2 + 8;
    v25 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(v21 + 16) = v25;
    if (v25)
      *(_QWORD *)(*(_QWORD *)v24 + 24) = v21 + 16;
    *(_QWORD *)v24 = v21;
    *(_QWORD *)(v21 + 24) = v24;
    atomic_store(0, (unsigned __int8 *)(v21 + 12));
LABEL_49:
    while (1)
    {
      v21 = *(_QWORD *)a2;
      if (!*(_QWORD *)a2)
        break;
      os_unfair_lock_lock_with_options();
      v26 = *(_QWORD *)(v21 + 16);
      if (v26)
      {
        *(_QWORD *)(v26 + 24) = *(_QWORD *)(v21 + 24);
        v26 = *(_QWORD *)(v21 + 16);
      }
      **(_QWORD **)(v21 + 24) = v26;
      *(_BYTE *)(v21 + 32) &= ~0x20u;
      if (*(_DWORD *)(v21 + 4))
      {
        *(_QWORD *)v10 = v21;
        *(_BYTE *)(v21 + 12) = v7 + 1;
        os_unfair_lock_unlock((os_unfair_lock_t)(v21 + 8));
        os_unfair_lock_unlock(v5);
        goto LABEL_74;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v21 + 8));
    }
    os_unfair_lock_unlock(v5);
    if ((*(_BYTE *)(a2 + 78) & 1) != 0)
    {
      v27 = *(_QWORD *)(a1 + 232) ? *(_QWORD *)(a1 + 232) : a1;
      chunk_from_isolation = _xzm_xzone_allocate_chunk_from_isolation(v27, a2);
      if (chunk_from_isolation)
      {
        v21 = chunk_from_isolation;
LABEL_73:
        *(_QWORD *)v10 = v21;
        *(_BYTE *)(v21 + 12) = v7 + 1;
        goto LABEL_74;
      }
    }
    v29 = (uint64_t *)(a2 + 16);
    if (*(_QWORD *)(a2 + 16))
    {
      os_unfair_lock_lock_with_options();
      v21 = *v29;
      if (*v29)
      {
        v30 = *(_QWORD *)(v21 + 16);
        if (v30)
        {
          *(_QWORD *)(v30 + 24) = *(_QWORD *)(v21 + 24);
          v30 = *(_QWORD *)(v21 + 16);
        }
        **(_QWORD **)(v21 + 24) = v30;
        goto LABEL_71;
      }
      os_unfair_lock_unlock(v5);
    }
    v75 = 0;
    v31 = xzm_segment_group_alloc_chunk(*(_QWORD *)(a2 + 40), 5, (unsigned __int8 *)(a2 + 79), 4u, &v75, 0, 0, 0);
    if (!v31)
    {
      *(_QWORD *)v10 = 0;
      os_unfair_lock_unlock(lock);
      goto LABEL_136;
    }
    v21 = v31;
    *(_BYTE *)(v31 + 33) = *(_BYTE *)(a2 + 72);
    if (!v75)
      goto LABEL_72;
    os_unfair_lock_lock_with_options();
    v32 = v75;
    if (v75)
    {
      v33 = v75;
      do
      {
        v34 = *(_QWORD *)(v32 + 16);
        v33 = *(_QWORD *)(v33 + 16);
        *(_BYTE *)(v32 + 33) = *(_BYTE *)(a2 + 72);
        *(_BYTE *)(v32 + 32) |= 0x40u;
        v35 = *(_QWORD *)(a2 + 16);
        *(_QWORD *)(v32 + 16) = v35;
        if (v35)
          *(_QWORD *)(*v29 + 24) = v32 + 16;
        *v29 = v32;
        *(_QWORD *)(v32 + 24) = v29;
        v32 = v34;
      }
      while (v34);
      v75 = v33;
    }
LABEL_71:
    os_unfair_lock_unlock(v5);
LABEL_72:
    _xzm_xzone_fresh_chunk_init(a2, v21, 5);
    *(_WORD *)(v21 + 34) = *(_WORD *)(a2 + 74);
    goto LABEL_73;
  }
  *(_DWORD *)(v10 + 20) = 0;
  if ((_DWORD)v5 == 2)
  {
    v13 = &logical_ncpus;
  }
  else
  {
    if ((_DWORD)v5 != 1)
      goto LABEL_21;
    v13 = &ncpuclusters;
  }
  v14 = *v13;
  if ((v14 & 0xFE) != 0)
  {
    v72 = v7;
    v15 = v14;
    os_unfair_lock_unlock(lock);
    v16 = 0;
    do
    {
      v17 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 224)
                               + 32 * (*(unsigned __int8 *)(a2 + 72) + v16 * *(unsigned __int8 *)(a1 + 210)));
      if (v17 != (os_unfair_lock_s *)v10)
      {
        os_unfair_lock_lock_with_options();
        v17[5]._os_unfair_lock_opaque = 0;
        os_unfair_lock_unlock(v17 + 2);
      }
      ++v16;
    }
    while (v15 != v16);
    os_unfair_lock_lock_with_options();
    v7 = v72;
  }
LABEL_21:
  os_unfair_lock_lock_with_options();
  if (*(unsigned __int8 *)(a2 + 77) != (_DWORD)v5)
  {
LABEL_29:
    os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 24));
    goto LABEL_30;
  }
  if (!(_DWORD)v5)
  {
    if (ncpuclusters > 1)
      v18 = 1;
    else
      v18 = 2;
    goto LABEL_28;
  }
  if ((_DWORD)v5 == 1)
  {
    v18 = 2;
LABEL_28:
    *(_BYTE *)(a2 + 77) = v18;
    goto LABEL_29;
  }
LABEL_143:
  if ((_DWORD)v5 == 2)
  {
    qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: Can't upgrade from XZM_SLOT_CPU";
    __break(1u);
  }
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: Invalid xzone slot config";
  __break(1u);
}

void xzm_malloc_zone_valloc(uint64_t a1, unint64_t a2)
{
  _xzm_memalign(a1, *MEMORY[0x1E0C88820], a2, *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904), 0);
}

uint64_t default_zone_valloc()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(v0 + 40))();
}

void xzm_segment_group_free_chunk(unsigned __int8 *a1, unint64_t a2, char a3)
{
  int v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  unsigned __int8 **v9;
  unsigned int v10;
  uint64_t v12;
  int v13;
  int v14;
  mach_vm_size_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _DWORD *v20;
  os_unfair_lock_s *v21;
  int v22;
  int v23;
  _QWORD *v24;
  _QWORD *v25;
  unint64_t v26;
  int v27;
  unsigned int v28;
  unsigned __int8 **v29;
  unint64_t v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  unsigned int v34;
  unsigned __int8 *v35;
  mach_vm_size_t v36;
  uint64_t v37;
  char v38;

  v5 = *(_BYTE *)(a2 + 32) & 0xF;
  if (v5 == 7)
  {
    v6 = (_QWORD *)(a2 & 0xFFFFFFFFFFFFC000);
    if (!*((_WORD *)a1 + 240)
      || (a3 & 1) != 0
      || ((v7 = *(unsigned int *)((a2 & 0xFFFFFFFFFFFFC000) + 0xC), v7 >= 0x81)
        ? (v8 = v7 >= *((_DWORD *)a1 + 121))
        : (v8 = 1),
          v8))
    {
      _xzm_segment_group_segment_deallocate((uint64_t)a1, a2 & 0xFFFFFFFFFFFFC000, 1);
      return;
    }
    v16 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFC000) + 0x30);
    v17 = v16 + (v7 << 14);
    if (v16 < v17)
    {
      v18 = *((_QWORD *)a1 + 3);
      do
      {
        v19 = v16 >> 22;
        if (v16 >> 36)
          v19 = 0x4000;
        if (v19 >> 14)
          v20 = 0;
        else
          v20 = (_DWORD *)(*(_QWORD *)(v18 + 408) + 4 * v19);
        *v20 = 0;
        v16 += 0x400000;
      }
      while (v16 < v17);
    }
    v21 = (os_unfair_lock_s *)(a1 + 488);
    os_unfair_lock_lock_with_options();
    v22 = *((unsigned __int16 *)a1 + 241);
    v23 = *((unsigned __int16 *)a1 + 240);
    if (v22 != v23)
      goto LABEL_89;
    v24 = (_QWORD *)*((_QWORD *)a1 + 58);
    if (!v24)
      goto LABEL_90;
    do
    {
      v25 = (_QWORD *)v24[3];
      if ((mach_vm_reclaim_is_available() & 1) != 0)
        break;
      _xzm_segment_group_cache_invalidate((uint64_t)a1, v24);
      v24 = v25;
    }
    while (v25);
    while (1)
    {
      v22 = *((unsigned __int16 *)a1 + 241);
      v23 = *((unsigned __int16 *)a1 + 240);
LABEL_89:
      if (v22 != v23)
        break;
LABEL_90:
      v37 = **(_QWORD **)(*((_QWORD *)a1 + 59) + 8);
      if (_xzm_segment_group_cache_mark_used((uint64_t)a1, v37))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)a1 + 122);
        mvm_deallocate_plat(*(_QWORD *)(v37 + 48), (unint64_t)*(unsigned int *)(v37 + 12) << 14, 0);
        xzm_metapool_free(*(_QWORD *)(*((_QWORD *)a1 + 3) + 400), (_QWORD *)v37);
        os_unfair_lock_lock_with_options();
      }
    }
    _xzm_segment_group_cache_mark_free((uint64_t)a1, v6);
    goto LABEL_93;
  }
  if ((a3 & 1) != 0)
  {
    if ((v5 - 6) < 2)
    {
      v36 = (unint64_t)*(unsigned int *)(a2 + 40) << 14;
    }
    else if (v5 == 2)
    {
      v36 = 0x4000;
    }
    else
    {
      if (v5 != 5)
        xzm_chunk_mark_free_cold_1(*(_BYTE *)(a2 + 32) & 0xF);
      v36 = 0x10000;
    }
    v9 = (unsigned __int8 **)(a2 & 0xFFFFFFFFFFFFC000);
    _xzm_segment_group_overwrite_chunk(((0xAAAAAAAAAAAAC000 * (((a2 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)+ *(_QWORD *)((a2 & 0xFFFFFFFFFFFFC000) + 0x30), v36);
  }
  else
  {
    v9 = (unsigned __int8 **)(a2 & 0xFFFFFFFFFFFFC000);
  }
  v10 = *(unsigned __int8 *)(*((_QWORD *)a1 + 3) + 328);
  if (v5 != 6 || (v10 & 2) == 0)
  {
    v12 = *a1;
    switch(*a1)
    {
      case 0u:
      case 2u:
        v13 = (v10 >> 2) & 1;
        break;
      case 1u:
      case 3u:
        v13 = v10 & 8;
        break;
      default:
        _xzm_segment_group_find_and_allocate_chunk_cold_1(v12);
    }
    if (v5 != 5 && !v13)
      xzm_segment_group_segment_madvise_chunk(v12, a2);
  }
  else
  {
    v14 = *(_BYTE *)(a2 + 32) & 0xF;
    if ((v14 - 6) < 2)
    {
      v15 = (unint64_t)*(unsigned int *)(a2 + 40) << 14;
    }
    else if (v14 == 2)
    {
      v15 = 0x4000;
    }
    else
    {
      if (v14 != 5)
        xzm_chunk_mark_free_cold_1(v14);
      v15 = 0x10000;
    }
    _xzm_segment_group_overwrite_chunk((mach_vm_address_t)&v9[6][(0xAAAAAAAAAAAAC000 * ((a2 - (unint64_t)v9 - 2104) >> 4)) & 0x3FFFFFFFC000], v15);
  }
  v21 = (os_unfair_lock_s *)(a1 + 4);
  os_unfair_lock_lock_with_options();
  v26 = _xzm_segment_group_segment_span_free_coalesce((uint64_t)a1, (uint64_t)v9, a2, 0);
  v27 = *((_DWORD *)v9 + 2) - 1;
  *((_DWORD *)v9 + 2) = v27;
  v28 = **v9;
  if (v28 >= 2)
  {
    if (v28 - 2 >= 2)
      _xzm_segment_group_find_and_allocate_chunk_cold_1(v28);
    goto LABEL_47;
  }
  if (v27)
  {
LABEL_47:
    switch(*a1)
    {
      case 0u:
      case 2u:
        if (((*(unsigned __int8 *)(*((_QWORD *)a1 + 3) + 328) >> 2) & 1) == 0)
          break;
        goto LABEL_51;
      case 1u:
      case 3u:
        if ((*(_BYTE *)(*((_QWORD *)a1 + 3) + 328) & 8) != 0)
LABEL_51:
          _xzm_segment_group_span_mark_free((uint64_t)a1, v26);
        break;
      default:
        _xzm_segment_group_find_and_allocate_chunk_cold_1(*a1);
    }
LABEL_93:
    os_unfair_lock_unlock(v21);
    return;
  }
  v29 = v9 + 263;
  switch(*a1)
  {
    case 0u:
    case 2u:
      if (((*(unsigned __int8 *)(*((_QWORD *)a1 + 3) + 328) >> 2) & 1) == 0)
        goto LABEL_73;
      goto LABEL_56;
    case 1u:
    case 3u:
      if ((*(_BYTE *)(*((_QWORD *)a1 + 3) + 328) & 8) == 0)
        goto LABEL_73;
LABEL_56:
      if (!_xzm_segment_group_span_mark_used((uint64_t)a1, (uint64_t)(v9 + 263)))
        goto LABEL_64;
      v30 = (unint64_t)(v9 + 263);
      break;
    default:
      _xzm_segment_group_find_and_allocate_chunk_cold_1(*a1);
  }
  while (1)
  {
    v31 = *(_BYTE *)(v30 + 32) & 0xF;
    if (v31 != 1)
      v31 = *(_DWORD *)(v30 + 40);
    if (v31 >= *((_DWORD *)v9 + 3))
      break;
    v38 = 0;
    v32 = *(_QWORD *)(v30 + 16);
    if (v32)
    {
      *(_QWORD *)(v32 + 24) = *(_QWORD *)(v30 + 24);
      v32 = *(_QWORD *)(v30 + 16);
    }
    **(_QWORD **)(v30 + 24) = v32;
    v30 = _xzm_segment_group_segment_span_free_coalesce((uint64_t)a1, (uint64_t)v9, v30, &v38);
    if (!v38)
    {
LABEL_64:
      v33 = (unint64_t)(v9 + 263);
      do
      {
        if (v9[-1431655765 * ((v33 - (unint64_t)v29) >> 4) + 7] == (unsigned __int8 *)-1)
          _xzm_segment_group_span_mark_free((uint64_t)a1, v33);
        if ((*(_BYTE *)(v33 + 32) & 0xF) == 1)
          v34 = 1;
        else
          v34 = *(_DWORD *)(v33 + 40);
        v33 += 48 * v34;
      }
      while (v33 < (unint64_t)&v9[6 * *((unsigned int *)v9 + 4) + 263]);
      os_unfair_lock_unlock((os_unfair_lock_t)a1 + 1);
      return;
    }
  }
  v29 = (unsigned __int8 **)v30;
LABEL_73:
  v35 = v29[2];
  if (v35)
  {
    *((_QWORD *)v35 + 3) = v29[3];
    v35 = v29[2];
  }
  *(_QWORD *)v29[3] = v35;
  os_unfair_lock_unlock((os_unfair_lock_t)a1 + 1);
  _xzm_segment_group_segment_deallocate((uint64_t)a1, (uint64_t)v9, 1);
}

unint64_t _xzm_segment_group_segment_span_free_coalesce(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  char v5;
  unsigned int v6;
  unsigned int v10;
  unint64_t v11;
  unsigned int v12;
  unint64_t v13;
  char v14;
  char *v15;
  char v16;
  int v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  int v25;
  uint64_t v26;
  unint64_t v28;
  unsigned int v29;
  int v30;

  v5 = *(_BYTE *)(a3 + 32);
  v6 = v5 & 0xF;
  if (v6 > 7)
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v6);
  v10 = 1;
  if (((1 << v6) & 0x1B) == 0)
  {
    if (((1 << v6) & 0xE0) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if ((v5 & 0xD) != 1)
    _xzm_segment_group_segment_span_free_coalesce_cold_4();
  if (v6 != 1)
LABEL_7:
    v10 = *(_DWORD *)(a3 + 40);
LABEL_8:
  if (a4)
  {
    *a4 = 1;
    v5 = *(_BYTE *)(a3 + 32);
  }
  *(_BYTE *)(a3 + 32) = v5 & 0xF0;
  v11 = a3 + 48 * v10;
  if (v11 < a2 + 48 * (unint64_t)*(unsigned int *)(a2 + 16) + 2104)
  {
    v12 = v10;
    v13 = a3 + 48 * v10;
    v16 = *(_BYTE *)(v13 + 32);
    v15 = (char *)(v13 + 32);
    v14 = v16;
    if ((v16 & 0xD) == 1)
    {
      switch(*(_BYTE *)a1)
      {
        case 0:
        case 2:
          if (((*(unsigned __int8 *)(*(_QWORD *)(a1 + 24) + 328) >> 2) & 1) == 0)
            goto LABEL_18;
          goto LABEL_16;
        case 1:
        case 3:
          if ((*(_BYTE *)(*(_QWORD *)(a1 + 24) + 328) & 8) == 0)
            goto LABEL_18;
LABEL_16:
          if (_xzm_segment_group_span_mark_used(a1, v11))
          {
            v14 = *v15;
LABEL_18:
            v17 = v14 & 0xF;
            if (v17 != 1)
              v17 = *(_DWORD *)(a3 + 48 * v10 + 40);
            v10 += v17;
            v18 = a3 + 48 * v12;
            v21 = *(_QWORD *)(v18 + 16);
            v19 = (uint64_t *)(v18 + 16);
            v20 = v21;
            if (v21)
            {
              *(_QWORD *)(v20 + 24) = *(_QWORD *)(a3 + 48 * v12 + 24);
              v22 = *v19;
            }
            else
            {
              v22 = 0;
            }
            **(_QWORD **)(a3 + 48 * v12 + 24) = v22;
          }
          else if (a4)
          {
            *a4 = 0;
          }
          break;
        default:
          _xzm_segment_group_find_and_allocate_chunk_cold_1(*(_BYTE *)a1);
      }
    }
  }
  if (a2 + 2104 >= a3)
    goto LABEL_42;
  v23 = a3 - 48;
  if ((*(_BYTE *)(a3 - 16) & 0xF) != 4)
    goto LABEL_28;
  v28 = v23 - *(unsigned int *)(a3 - 12);
  v29 = *(_BYTE *)(v28 + 32) & 0xF;
  if (v29 > 8)
    goto LABEL_28;
  v30 = 1 << v29;
  if ((v30 & 0x1E8) != 0)
  {
    if (v28 + 48 * *(unsigned int *)(v28 + 40) <= v23)
      goto LABEL_28;
    goto LABEL_50;
  }
  if ((v30 & 6) != 0 && v23 == v28)
LABEL_50:
    v23 -= *(unsigned int *)(a3 - 12);
LABEL_28:
  v24 = *(_BYTE *)(v23 + 32);
  if ((v24 & 0xD) != 1)
  {
LABEL_42:
    v23 = a3;
    goto LABEL_43;
  }
  switch(*(_BYTE *)a1)
  {
    case 0:
    case 2:
      if (((*(unsigned __int8 *)(*(_QWORD *)(a1 + 24) + 328) >> 2) & 1) == 0)
        goto LABEL_35;
      goto LABEL_33;
    case 1:
    case 3:
      if ((*(_BYTE *)(*(_QWORD *)(a1 + 24) + 328) & 8) == 0)
        goto LABEL_35;
LABEL_33:
      if (!_xzm_segment_group_span_mark_used(a1, v23))
      {
        if (a4)
          *a4 = 0;
        goto LABEL_42;
      }
      v24 = *(_BYTE *)(v23 + 32);
LABEL_35:
      v25 = v24 & 0xF;
      if (v25 != 1)
        v25 = *(_DWORD *)(v23 + 40);
      v10 += v25;
      v26 = *(_QWORD *)(v23 + 16);
      if (v26)
      {
        *(_QWORD *)(v26 + 24) = *(_QWORD *)(v23 + 24);
        v26 = *(_QWORD *)(v23 + 16);
      }
      **(_QWORD **)(v23 + 24) = v26;
      break;
    default:
      _xzm_segment_group_find_and_allocate_chunk_cold_1(*(_BYTE *)a1);
  }
LABEL_43:
  _xzm_segment_group_segment_span_free(a1, a2, -1431655765 * ((v23 - (a2 + 2104)) >> 4), v10, 0);
  return v23;
}

unint64_t _xzm_malloc_large_huge(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, char a5)
{
  uint64_t v5;
  unint64_t v6;
  _BOOL4 v8;
  unsigned __int8 v9;
  unint64_t result;
  BOOL v12;
  unint64_t v13;
  mach_vm_address_t v14;
  mach_vm_address_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_QWORD *)(a1 + 232);
  if (!v5)
    v5 = a1;
  v6 = a2 + 0x3FFF;
  v8 = a3 > 0x100000 || ((a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000) > 0x200000;
  if (v8)
    v9 = 7;
  else
    v9 = 6;
  if (v6 >> 46)
    goto LABEL_13;
  v12 = HIWORD(a4) == 256 || v8;
  if (v12 || *(_BYTE *)(v5 + 344) == 2)
    v13 = ((unint64_t)*(unsigned __int8 *)(v5 + 328) >> 3) & 1;
  else
    LODWORD(v13) = 3;
  v14 = xzm_segment_group_alloc_chunk(*(_QWORD *)(v5 + 392) + 496 * v13, v9, 0, v6 >> 14, 0, a3, a5 & 1, (*(_QWORD *)(a1 + 296) >> 7) & 1);
  if (!v14)
    goto LABEL_13;
  v15 = v14;
  *(_WORD *)(v14 + 34) = *(_WORD *)(a1 + 208);
  os_unfair_lock_lock_with_options();
  v16 = a1 + 288;
  v17 = *(_QWORD *)(a1 + 288);
  *(_QWORD *)(v15 + 16) = v17;
  if (v17)
    *(_QWORD *)(*(_QWORD *)v16 + 24) = v15 + 16;
  *(_QWORD *)v16 = v15;
  *(_QWORD *)(v15 + 24) = v16;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  result = ((0xAAAAAAAAAAAAC000 * (((v15 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
         + *(_QWORD *)((v15 & 0xFFFFFFFFFFFFC000) + 0x30);
  if (!result)
  {
LABEL_13:
    result = 0;
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  }
  return result;
}

mach_vm_address_t xzm_segment_group_alloc_chunk(uint64_t a1, int a2, unsigned __int8 *a3, unsigned int a4, uint64_t *a5, unint64_t a6, int a7, int a8)
{
  unint64_t v9;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int v15;
  BOOL v16;
  uint64_t v17;
  char v18;
  int v19;
  size_t v20;
  unsigned int v25;
  os_unfair_lock_s *v26;
  uint64_t chunk;
  BOOL v28;
  int v29;
  mach_vm_size_t v30;
  uint64_t v31;
  unint64_t v32;
  mach_vm_address_t v33;
  void *v34;
  char v36;
  kern_return_t v37;
  mach_vm_address_t address;

  v9 = a6;
  if (a2 == 7)
  {
    if (a6 < 0x400000)
      v9 = 0;
    address = 0;
    if (*(_BYTE *)a1 == 1 && *(_WORD *)(a1 + 480) && v9 <= 0x400000 && *(_DWORD *)(a1 + 484) >= a4)
    {
      os_unfair_lock_lock_with_options();
      if (*(_WORD *)(a1 + 482))
      {
        while (1)
        {
          v12 = *(_QWORD *)(a1 + 464);
          if (!v12)
            break;
          v13 = 0;
          do
          {
            while (1)
            {
              v14 = v12;
              v12 = *(_QWORD *)(v12 + 24);
              v15 = *(_DWORD *)(v14 + 12);
              v16 = v15 < a4 || v15 >= 2 * a4;
              if (v16 || v13 && v15 >= *(_DWORD *)(v13 + 12))
                goto LABEL_19;
              if ((mach_vm_reclaim_is_available() & 1) == 0)
                break;
              v13 = v14;
LABEL_19:
              if (!v12)
                goto LABEL_22;
            }
            _xzm_segment_group_cache_invalidate(a1, (_QWORD *)v14);
          }
          while (v12);
LABEL_22:
          if (!v13)
            break;
          if ((_xzm_segment_group_cache_mark_used(a1, v13) & 1) != 0)
          {
            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
            _xzm_segment_table_allocated_at(*(_QWORD *)(a1 + 24), *(_QWORD *)(v13 + 48), v13);
            v17 = v13 + 2104;
            v18 = *(_BYTE *)(v13 + 2136);
            if (a7)
            {
              v19 = v18 & 0xF;
              if ((v19 - 6) < 2)
              {
                v20 = (unint64_t)*(unsigned int *)(v13 + 2144) << 14;
              }
              else if (v19 == 2)
              {
                v20 = 0x4000;
              }
              else
              {
                if (v19 != 5)
                  xzm_chunk_mark_free_cold_1(v19);
                v20 = 0x10000;
              }
              _xzm_segment_group_clear_chunk((char *)(((0xAAAAAAAAAAAAC000 * (((unint64_t)(v17 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)+ *(_QWORD *)((v17 & 0xFFFFFFFFFFFFC000) + 0x30)), v20);
              v36 = *(_BYTE *)(v13 + 2136) | 0x10;
            }
            else
            {
              v36 = v18 & 0xEF;
            }
            *(_BYTE *)(v13 + 2136) = v36;
            return v17;
          }
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
      address = 0;
    }
    if (_xzm_segment_group_alloc_segment(a1, (unint64_t)a4 << 14, v9, (uint64_t *)&address, a8))
      return address;
    else
      return 0;
  }
  if (a4 == 1 && a2 == 6)
    v25 = 2;
  else
    v25 = a4;
  v26 = (os_unfair_lock_s *)(a1 + 4);
  os_unfair_lock_lock_with_options();
  chunk = _xzm_segment_group_find_and_allocate_chunk(a1, a2, a3, a5, v25, v9);
  if (chunk)
  {
    v17 = chunk;
LABEL_37:
    os_unfair_lock_unlock(v26);
    goto LABEL_40;
  }
  v28 = os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 8));
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
  if (!v28)
  {
    os_unfair_lock_lock_with_options();
    os_unfair_lock_lock_with_options();
    v17 = _xzm_segment_group_find_and_allocate_chunk(a1, a2, a3, a5, v25, v9);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
    v26 = (os_unfair_lock_s *)(a1 + 8);
    if (v17)
      goto LABEL_37;
  }
  v17 = _xzm_segment_group_alloc_segment_and_chunk((os_unfair_lock_s *)a1, a2, a3, a5, v25, v9);
  if (!v17)
    return v17;
LABEL_40:
  v29 = *(_BYTE *)(v17 + 32) & 0xF;
  if ((v29 - 6) < 2)
  {
    v30 = (unint64_t)*(unsigned int *)(v17 + 40) << 14;
  }
  else if (v29 == 2)
  {
    v30 = 0x4000;
  }
  else
  {
    if (v29 != 5)
      xzm_chunk_mark_free_cold_1(v29);
    v30 = 0x10000;
  }
  v31 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFC000) + 0x30);
  v32 = (0xAAAAAAAAAAAAC000 * (((unint64_t)(v17 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000;
  v33 = v32 + v31;
  if ((*(_BYTE *)(v17 + 32) & 0x10) != 0)
    goto LABEL_59;
  if (a2 == 6 && (*(_BYTE *)(*(_QWORD *)(a1 + 24) + 328) & 2) != 0)
  {
    _xzm_segment_group_overwrite_chunk(v32 + v31, v30);
LABEL_58:
    *(_BYTE *)(v17 + 32) |= 0x10u;
    goto LABEL_59;
  }
  if (a7)
  {
    v34 = (void *)(v32 + v31);
    if (a2 == 2)
      bzero(v34, v30);
    else
      _xzm_segment_group_clear_chunk((char *)v34, v30);
    goto LABEL_58;
  }
LABEL_59:
  if (a8)
  {
    address = v33;
    v37 = mach_vm_map(*MEMORY[0x1E0C883F0], &address, v30, 0, 33570818, 0, 0, 0, 3, 7, 1u);
    if (v37)
      xzm_segment_group_alloc_chunk_cold_3(v37);
  }
  return v17;
}

uint64_t _xzm_segment_group_find_and_allocate_chunk(uint64_t a1, int a2, unsigned __int8 *a3, uint64_t *a4, unsigned int a5, unint64_t a6)
{
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  char v12;
  char v13;
  int v14;
  unsigned int v15;
  uint32_t v16;
  unsigned int v17;
  BOOL v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t *v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  int v31;
  uint32_t v32;
  int8x8_t v33;
  uint8x8_t v34;
  unsigned int v35;
  unsigned int v36;
  BOOL v37;
  int v38;
  uint64_t v39;
  uint32_t v40;
  unsigned int v41;
  int v42;
  char v43;
  uint64_t v44;
  unsigned __int8 v46;
  unsigned __int8 v47;

  v6 = 0;
  if (a6 > 0x4000)
    v7 = a6 >> 14;
  else
    v7 = 0;
  if (HIDWORD(v7))
    return v6;
  v8 = a5;
  if (a3 && *a3)
  {
    v12 = arc4random_uniform(*a3);
    v13 = v12 + 1;
    v14 = (v12 + 1) * v8;
    v15 = (v14 * a3[1]) >> 8;
    if ((v12 + 1) * (_BYTE)v8 * a3[1])
    {
      v16 = ((v12 + 1) * v8 * a3[1]);
      if (v16 > arc4random_uniform(0x100u))
        LOBYTE(v15) = v15 + 1;
    }
    v17 = v14 + v15;
    if (!(_DWORD)v7)
      goto LABEL_14;
  }
  else
  {
    LOBYTE(v15) = 0;
    v13 = 1;
    v17 = a5;
    if (!(_DWORD)v7)
      goto LABEL_14;
  }
  v18 = __CFADD__(v17, v7 - 1);
  v17 += v7 - 1;
  if (v18)
    return 0;
LABEL_14:
  v19 = v17 - 1;
  v20 = __clz(v17 - 1);
  v21 = (((v17 - 1) >> (29 - v20)) & 3) - 4 * v20 + 119;
  if (v17 >= 9)
    v19 = v21;
  v22 = (uint64_t *)(a1 + 16 * v19 + 32);
  if ((unint64_t)v22 >= a1 + 464)
    return 0;
  v46 = v13;
  v47 = v15;
  while (1)
  {
    v23 = *v22;
    if (*v22)
      break;
LABEL_29:
    v6 = 0;
    v22 += 2;
    if ((unint64_t)v22 >= a1 + 464)
      return v6;
  }
  while (1)
  {
    v24 = (*(_BYTE *)(v23 + 32) & 0xF) == 1 ? 1 : *(_DWORD *)(v23 + 40);
    v25 = *(_QWORD *)(v23 + 16);
    if (v24 >= v17)
      break;
LABEL_28:
    v23 = v25;
    if (!v25)
      goto LABEL_29;
  }
  switch(*(_BYTE *)a1)
  {
    case 0:
    case 2:
      if (((*(unsigned __int8 *)(*(_QWORD *)(a1 + 24) + 328) >> 2) & 1) == 0)
        goto LABEL_33;
      goto LABEL_27;
    case 1:
    case 3:
      if ((*(_BYTE *)(*(_QWORD *)(a1 + 24) + 328) & 8) == 0)
        goto LABEL_33;
LABEL_27:
      if (!_xzm_segment_group_span_mark_used(a1, v23))
        goto LABEL_28;
      v25 = *(_QWORD *)(v23 + 16);
LABEL_33:
      if (v25)
      {
        *(_QWORD *)(v25 + 24) = *(_QWORD *)(v23 + 24);
        v26 = *(_QWORD *)(v23 + 16);
      }
      else
      {
        v26 = 0;
      }
      **(_QWORD **)(v23 + 24) = v26;
      v27 = v23 & 0xFFFFFFFFFFFFC000;
      if ((_DWORD)v7 && (v28 = -1431655765 * ((v23 - v27 - 2104) >> 4) % v7) != 0)
      {
        v24 += v28 - v7;
        v23 = _xzm_segment_group_segment_slice_split(a1, v23 & 0xFFFFFFFFFFFFC000, v23, v24, 1);
      }
      else
      {
        v8 = v17;
      }
      v29 = a2;
      if (v24 > v8)
        _xzm_segment_group_segment_slice_split(a1, v27, v23, v8, 0);
      if (v47)
      {
        v30 = v46 + 1;
        v31 = ~(-1 << (v46 + 1));
        if (v47 >= (3 * v30) >> 2)
        {
          v39 = ~(-1 << (v46 + 1));
          v40 = v46 + 1;
        }
        else if (v47 <= v30 >> 2)
        {
          v39 = 0;
          v40 = 0;
        }
        else
        {
          v32 = arc4random() & v31;
          v33.i32[0] = v32;
          v34 = (uint8x8_t)vcnt_s8(v33);
          v34.i16[0] = vaddlv_u8(v34);
          v35 = v47 - v34.i32[0];
          if (v34.i32[0] >= v47)
            v35 = v34.i32[0] - v47;
          v36 = v47 - (v30 - v34.i32[0]);
          if (v30 - v34.i32[0] >= v47)
            v36 = v30 - v34.i32[0] - v47;
          v37 = v35 > v36;
          if (v35 <= v36)
            v38 = 0;
          else
            v38 = ~(-1 << (v46 + 1));
          v39 = v38 ^ v32;
          if (v37)
            v40 = v30 - v34.i32[0];
          else
            v40 = v34.i32[0];
        }
        if (v40 >= v47)
        {
          if (v40 > v47)
            LODWORD(v39) = _xzm_random_clear_n_bits(v39, v40, v40 - v47);
        }
        else
        {
          LODWORD(v39) = _xzm_random_clear_n_bits(v39 ^ v31, v30 - v40, v47 - v40) ^ v31;
        }
        v29 = a2;
      }
      else
      {
        LODWORD(v39) = 0;
      }
      v41 = -1431655765 * ((uint64_t)(v23 - v27 - 2104) >> 4);
      if (v29 == 2)
      {
        v8 = 1;
        if (v46)
          goto LABEL_67;
      }
      else
      {
        if (v29 == 5)
          v8 = 4;
        if (v46)
        {
LABEL_67:
          v42 = 0;
          v6 = 0;
          v43 = *(_BYTE *)(v27 + 48 * v41 + 2136) & 0x10;
          do
          {
            if ((v39 & 1) != 0)
              _xzm_segment_group_segment_create_guard(v27, v41++);
            v44 = _xzm_segment_group_segment_span_mark_allocated(v27, v29, v41, v8);
            *(_BYTE *)(v44 + 32) = *(_BYTE *)(v44 + 32) & 0xEF | v43;
            if (v42)
            {
              *(_QWORD *)(v44 + 16) = *a4;
              *a4 = v44;
            }
            else
            {
              v6 = v44;
            }
            LODWORD(v39) = v39 >> 1;
            v41 += v8;
            ++v42;
          }
          while (v46 != v42);
          if ((_DWORD)v39)
            goto LABEL_75;
          return v6;
        }
      }
      v6 = 0;
      if ((_DWORD)v39)
      {
LABEL_75:
        _xzm_segment_group_segment_create_guard(v27, v41);
        return v6;
      }
      break;
    default:
      _xzm_segment_group_find_and_allocate_chunk_cold_1(*(_BYTE *)a1);
  }
  return v6;
}

uint64_t _xzm_segment_group_segment_span_mark_allocated(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a1 + 48 * a3;
  v5 = v4 + 2104;
  v6 = a4 - 1;
  if (a4 - 1 >= 3)
    v7 = 3;
  else
    v7 = v6;
  v8 = *(unsigned int *)(a1 + 16);
  if (v7 + a3 >= v8)
    v7 = v8 + ~a3;
  if (v7)
  {
    v9 = 0;
    v10 = 2;
    if ((unint64_t)(v7 + 1) > 2)
      v10 = v7 + 1;
    v11 = a1 + 48 * a3;
    v12 = v10 - 1;
    do
    {
      v13 = v11 + v9;
      *(_BYTE *)(v13 + 2184) = *(_BYTE *)(v11 + v9 + 2184) & 0xF0 | 4;
      v9 += 48;
      *(_DWORD *)(v13 + 2188) = v9;
      --v12;
    }
    while (v12);
    v4 = a1 + 48 * a3 + v9;
  }
  v14 = v4 + 2152;
  if (a2 == 7)
    goto LABEL_16;
  v15 = a3 + a4 - 1;
  if (a1 + 48 * v15 + 2104 >= v14)
  {
    v16 = a1 + 48 * v15;
    *(_BYTE *)(v16 + 2136) = *(_BYTE *)(v16 + 2136) & 0xF0 | 4;
    *(_DWORD *)(v16 + 2140) = 48 * v6;
  }
  if (a2 != 2)
LABEL_16:
    *(_DWORD *)(a1 + 48 * a3 + 2144) = a4;
  *(_BYTE *)(a1 + 48 * a3 + 2136) = *(_BYTE *)(a1 + 48 * a3 + 2136) & 0xF0 | a2 & 0xF;
  *(_QWORD *)(a1 + 8 * a3 + 56) = -1;
  ++*(_DWORD *)(a1 + 8);
  return v5;
}

uint64_t _xzm_segment_group_segment_slice_split(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  unsigned int v8;
  uint64_t v9;
  char v10;
  unsigned int v11;

  v8 = *(_DWORD *)(a3 + 40) - a4;
  if (a5)
  {
    v9 = a3 + 48 * v8;
    *(_DWORD *)(v9 + 40) = a4;
    v10 = *(_BYTE *)(v9 + 32) & 0xF0 | 3;
    *(_BYTE *)(v9 + 32) = v10;
    *(_BYTE *)(v9 + 32) = v10 & 0xEF | *(_BYTE *)(a3 + 32) & 0x10;
    v11 = -1431655765 * ((unint64_t)(a3 - a2 - 2104) >> 4);
  }
  else
  {
    v11 = a4 - 1431655765 * ((unint64_t)(a3 - a2 - 2104) >> 4);
    v9 = a3;
  }
  _xzm_segment_group_segment_span_free(a1, a2, v11, v8, (*(unsigned __int8 *)(a3 + 32) >> 4) & 1);
  switch(*(_BYTE *)a1)
  {
    case 0:
    case 2:
      if (((*(unsigned __int8 *)(*(_QWORD *)(a1 + 24) + 328) >> 2) & 1) == 0)
        return v9;
      goto LABEL_8;
    case 1:
    case 3:
      if ((*(_BYTE *)(*(_QWORD *)(a1 + 24) + 328) & 8) != 0)
      {
LABEL_8:
        if ((*(_BYTE *)(a2 + 48 * v11 + 2136) & 0x10) == 0)
          _xzm_segment_group_span_mark_free(a1, a2 + 48 * v11 + 2104);
      }
      return v9;
    default:
      _xzm_segment_group_find_and_allocate_chunk_cold_1(*(_BYTE *)a1);
  }
}

uint64_t _xzm_segment_group_segment_span_free(uint64_t result, uint64_t a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t v5;
  _BYTE *v6;
  char v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2 + 48 * a3;
  v6 = (_BYTE *)(v5 + 2136);
  if (a5)
    v7 = 16;
  else
    v7 = 0;
  v8 = *(_BYTE *)(v5 + 2136) & 0xE0 | v7;
  v9 = a4 - 1;
  if (a4 == 1)
  {
    *v6 = v8 | 1;
    v9 = *(unsigned __int8 *)(a2 + 20);
    if (*(_BYTE *)(a2 + 20))
      goto LABEL_13;
  }
  else
  {
    *v6 = v8 | 3;
    *(_DWORD *)(a2 + 2104 + 48 * a3 + 40) = a4;
    v10 = a2 + 2104 + 48 * (v9 + a3);
    *(_BYTE *)(v10 + 32) = *(_BYTE *)(v10 + 32) & 0xF0 | 4;
    *(_DWORD *)(v10 + 36) = 48 * a4 - 48;
    if (*(_BYTE *)(a2 + 20))
      goto LABEL_13;
    v11 = __clz(v9);
    v12 = ((v9 >> (29 - v11)) & 3) - 4 * v11 + 119;
    if (a4 >= 9)
      v9 = v12;
  }
  v13 = v5 + 2104;
  v14 = result + 16 * v9;
  v16 = *(_QWORD *)(v14 + 32);
  v15 = v14 + 32;
  v17 = a2 + 48 * a3;
  *(_QWORD *)(v17 + 2120) = v16;
  if (v16)
    *(_QWORD *)(*(_QWORD *)v15 + 24) = v17 + 2120;
  *(_QWORD *)v15 = v13;
  *(_QWORD *)(v17 + 2128) = v15;
LABEL_13:
  *(_QWORD *)(a2 + 8 * a3 + 56) = -1;
  return result;
}

uint64_t _xzm_segment_group_clear_chunk(char *a1, size_t a2)
{
  unint64_t v2;
  char *v3;
  uint64_t result;
  size_t v5;

  v2 = a2;
  v3 = a1;
  result = madvise(a1, a2, 11);
  if (v2 && (_DWORD)result)
  {
    do
    {
      if (v2 >= 0x80000)
        v5 = 0x80000;
      else
        v5 = v2;
      bzero(v3, v5);
      result = mvm_madvise(v3, v5, 7);
      v3 += v5;
      v2 -= v5;
    }
    while (v2);
  }
  return result;
}

uint64_t _xzm_segment_group_alloc_segment(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, int a5)
{
  int v8;
  mach_vm_size_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  int v14;
  int v15;
  unint64_t v16;
  mach_vm_address_t pages_plat;
  mach_vm_size_t v18;
  BOOL v19;
  mach_vm_size_t v20;
  mach_vm_address_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t inited;
  kern_return_t v25;
  mach_vm_address_t address;

  v8 = a2 != 0;
  if (a2)
    v9 = (a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000;
  else
    v9 = 0x400000;
  v10 = *(_QWORD *)(a1 + 16);
  v11 = v8 | 2u;
  if (a5)
    LOBYTE(v8) = v8 | 2;
  if (!*(_BYTE *)v10)
  {
    if ((*(_BYTE *)(*(_QWORD *)(v10 + 8) + 328) & 1) != 0)
    {
      pages_plat = _xzm_range_group_alloc_anywhere_segment(0, v9, a3, v11, v8);
      goto LABEL_26;
    }
    if (a5)
      v15 = 128;
    else
      v15 = 0;
    v16 = __clz(__rbit64(a3));
    if (v16 <= 0x16)
      LODWORD(v16) = 22;
    if (a3)
      v14 = v16;
    else
      v14 = 22;
    v13 = v9;
    v12 = v15;
LABEL_22:
    pages_plat = mvm_allocate_pages_plat(v13, v14, v12, v11);
LABEL_26:
    v21 = pages_plat;
    goto LABEL_27;
  }
  if ((*(_BYTE *)(*(_QWORD *)(v10 + 8) + 328) & 1) == 0)
  {
    if (a5)
      v12 = 128;
    else
      v12 = 0;
    v13 = v9;
    v14 = 22;
    goto LABEL_22;
  }
  os_unfair_lock_lock_with_options();
  v18 = *(_QWORD *)(v10 + 48);
  v19 = v18 >= v9;
  v20 = v18 - v9;
  if (!v19)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 16));
LABEL_34:
    malloc_zone_error(0, 0, (uint64_t)"Failed to allocate segment - out of space\n");
    return 0;
  }
  v21 = *(_QWORD *)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v21 + v9;
  *(_QWORD *)(v10 + 48) = v20;
  os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 16));
  if (!v21)
    goto LABEL_34;
  address = v21;
  v25 = mach_vm_map(*MEMORY[0x1E0C883F0], &address, v9, 0, 33570816, 0, 0, 0, 3, 7, 1u);
  if (v25)
    _xzm_segment_group_alloc_segment_cold_2(v25);
LABEL_27:
  if (!v21)
    return 0;
  if (v21 >> 36)
    _xzm_segment_group_alloc_segment_cold_1();
  v22 = xzm_metapool_alloc(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 400));
  v23 = 1;
  inited = _xzm_segment_group_init_segment(a1, v22, v21, v9, a2 != 0, 1);
  _xzm_segment_table_allocated_at(*(_QWORD *)(a1 + 24), v21, v22);
  if (a2)
    *a4 = inited;
  return v23;
}

uint64_t xzm_metapool_alloc(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *plat;
  unsigned int v6;
  _QWORD *v7;

  os_unfair_lock_lock_with_options();
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2)
  {
    plat = *(_QWORD **)(a1 + 40);
    if (plat)
    {
      v6 = *(_DWORD *)(a1 + 48);
      if (v6 != *(_DWORD *)(a1 + 8))
      {
LABEL_14:
        v3 = plat[1] + v6;
        *(_DWORD *)(a1 + 48) = *(_DWORD *)(a1 + 16) + v6;
        goto LABEL_15;
      }
    }
    else
    {
      v6 = *(_DWORD *)(a1 + 8);
    }
    plat = (_QWORD *)mvm_allocate_plat(0, v6, __clz(__rbit32(*(_DWORD *)(a1 + 12))), 1, 0, 1);
    if (!plat)
      xzm_metapool_alloc_cold_1();
    v7 = plat;
    if (*(_QWORD *)(a1 + 56))
    {
      plat = (_QWORD *)xzm_metapool_alloc();
      v6 = 0;
    }
    else
    {
      v6 = *(_DWORD *)(a1 + 16);
    }
    *(_DWORD *)(a1 + 48) = v6;
    *plat = 0;
    plat[1] = v7;
    *(_QWORD *)(a1 + 40) = plat;
    *plat = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = plat;
    goto LABEL_14;
  }
  v3 = v2[1];
  *(_QWORD *)(a1 + 32) = *v2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
  {
    xzm_metapool_free(v4, v2);
  }
  else
  {
    *v2 = 0;
    v2[1] = 0;
  }
LABEL_15:
  os_unfair_lock_unlock((os_unfair_lock_t)a1);
  return v3;
}

uint64_t _xzm_segment_group_init_segment(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int a5, int a6)
{
  int v9;
  unint64_t v10;
  uint64_t result;
  char v12;

  if (a2 >> 36)
    _xzm_segment_group_init_segment_cold_3();
  if (a3 >> 36)
    _xzm_segment_group_init_segment_cold_2();
  if (a4 >> 46)
    _xzm_segment_group_init_segment_cold_1();
  *(_QWORD *)a2 = a1;
  v9 = a4 >> 14;
  if (((a4 >> 14) & 0xFFFFFF00) != 0)
    v9 = 256;
  v10 = a4 >> 14;
  *(_DWORD *)(a2 + 12) = a4 >> 14;
  *(_DWORD *)(a2 + 16) = v9;
  *(_DWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 40) = -1;
  *(_QWORD *)(a2 + 48) = a3;
  *(_BYTE *)(a2 + 20) = a5;
  if (a5)
  {
    result = _xzm_segment_group_segment_span_mark_allocated(a2, 7, 0, a4 >> 14);
    if (a6)
      v12 = 16;
    else
      v12 = 0;
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 0xEF | v12;
  }
  else
  {
    os_unfair_lock_lock_with_options();
    _xzm_segment_group_segment_span_free(a1, a2, 0, v10, a6);
    return 0;
  }
  return result;
}

uint64_t _xzm_segment_table_allocated_at(uint64_t result, unint64_t a2, unint64_t a3)
{
  unint64_t i;
  unint64_t v4;
  unsigned int *v5;

  if (a3 >= 0x3FFFFFFFC000)
    _xzm_segment_table_allocated_at_cold_1();
  for (i = *(_QWORD *)(a3 + 48) + ((unint64_t)*(unsigned int *)(a3 + 12) << 14); a2 < i; a2 += 0x400000)
  {
    v4 = a2 >> 22;
    if (a2 >> 36)
      v4 = 0x4000;
    if (v4 >> 14)
      v5 = 0;
    else
      v5 = (unsigned int *)(*(_QWORD *)(result + 408) + 4 * v4);
    atomic_store(a3 >> 14, v5);
  }
  return result;
}

mach_vm_address_t _xzm_range_group_alloc_anywhere_segment(mach_vm_address_t a1, mach_vm_size_t size, unint64_t a3, uint64_t a4, char a5)
{
  int v5;
  uint64_t v6;
  kern_return_t v7;
  uint64_t v8;
  mach_vm_address_t address;

  address = a1;
  if ((a5 & 2) != 0)
    v5 = ((a5 & 1) << 24) | 0x2000003;
  else
    v5 = ((a5 & 1) << 24) | 0x2000001;
  v6 = 0x400000;
  if (a3 > 0x400000)
    v6 = a3;
  v7 = mach_vm_map(*MEMORY[0x1E0C883F0], &address, size, v6 - 1, v5, 0, 0, 0, 3, 7, 1u);
  if (!v7)
    return address;
  v8 = 0;
  if (v7 != 3)
  {
    malloc_zone_error(0, 0, (uint64_t)"Failed to allocate segment (size=%lu, flags=%x, kr=%d)\n");
    return 0;
  }
  return v8;
}

mach_vm_address_t mvm_allocate_plat(mach_vm_address_t a1, mach_vm_size_t size, char a3, int a4, __int16 a5, int a6)
{
  mach_vm_address_t address;

  if (a1 && (a4 & 1) != 0)
    malloc_zone_error(a5 | 0x40, 0, (uint64_t)"Unsupported anywhere allocation at address 0x%lx of size 0x%lx with flags %d\n");
  if ((a5 & 0x200) != 0)
    malloc_zone_error(a5 | 0x40, 0, (uint64_t)"Unsupported unpopulated allocation at address 0x%lx of size 0x%lx with flags %d\n");
  address = a1;
  if (mach_vm_map(*MEMORY[0x1E0C883F0], &address, size, ~(-1 << a3), a4 | (a6 << 24), 0, 0, 0, 3, 7, 1u))
    return 0;
  else
    return address;
}

void xzm_metapool_free(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  size_t v5;

  os_unfair_lock_lock_with_options();
  v4 = a2;
  if (*(_QWORD *)(a1 + 56))
  {
    v4 = (_QWORD *)xzm_metapool_alloc();
    if (*(_QWORD *)(a1 + 56))
    {
      v5 = *(unsigned int *)(a1 + 16);
      if (*MEMORY[0x1E0C88820] <= v5)
        mvm_madvise(a2, v5, 7);
    }
  }
  *v4 = *(_QWORD *)(a1 + 32);
  v4[1] = a2;
  *(_QWORD *)(a1 + 32) = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)a1);
}

void _xzm_segment_group_segment_deallocate(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _DWORD *v9;

  if (a3)
  {
    v5 = *(_QWORD *)(a2 + 48);
    v6 = v5 + ((unint64_t)*(unsigned int *)(a2 + 12) << 14);
    if (v5 < v6)
    {
      v7 = *(_QWORD *)(a1 + 24);
      do
      {
        v8 = v5 >> 22;
        if (v5 >> 36)
          v8 = 0x4000;
        if (v8 >> 14)
          v9 = 0;
        else
          v9 = (_DWORD *)(*(_QWORD *)(v7 + 408) + 4 * v8);
        *v9 = 0;
        v5 += 0x400000;
      }
      while (v5 < v6);
    }
  }
  mvm_deallocate_plat(*(_QWORD *)(a2 + 48), (unint64_t)*(unsigned int *)(a2 + 12) << 14, 0);
  xzm_metapool_free(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 400), (_QWORD *)a2);
}

mach_vm_address_t large_malloc(uint64_t a1, unint64_t a2, int a3, int a4)
{
  _DWORD *v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  int v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  mach_vm_address_t pages;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int inserted;
  int v25;
  os_unfair_lock_s *lock;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  int v31;

  v8 = (_DWORD *)(a1 + 16392);
  if (malloc_tracing_enabled)
    kdebug_trace();
  if (a2 <= 1)
    v9 = 1;
  else
    v9 = a2;
  v10 = *MEMORY[0x1E0C88800];
  if (*MEMORY[0x1E0C88800] <= *MEMORY[0x1E0C88818])
    LOBYTE(v10) = *MEMORY[0x1E0C88818];
  v11 = v9 << v10;
  v27 = 0;
  v28 = 0;
  if (!large_cache_enabled || v11 > *(_QWORD *)(a1 + 20400))
    goto LABEL_48;
  v25 = a4;
  lock = (os_unfair_lock_s *)(a1 + 18816);
  os_unfair_lock_lock_with_options();
  do
  {
    v31 = -1;
    v12 = v8[615];
    v13 = v8[614];
    v30 = 0;
    v29 = 0uLL;
    _platform_memset();
    v14 = -1;
    while (1)
    {
      while (1)
      {
        v15 = *(_QWORD *)(a1 + 24 * v12 + 18864);
        if (!a3 || (*(_QWORD *)(a1 + 24 * v12 + 18856) & ~(-1 << a3)) == 0)
        {
          if (v15 == v11)
            break;
          if (v15 > v11 && v15 < v14)
            break;
        }
LABEL_24:
        if (v12 == v13)
          goto LABEL_31;
        if (!v12)
          v12 = v8[1000];
        --v12;
      }
      v17 = *MEMORY[0x1E0C88808];
      if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
        v17 = *MEMORY[0x1E0C88820];
      if ((v14 + 2 * v17) >> 32 || mvm_reclaim_is_available())
        break;
      v12 = remove_from_death_row_no_lock((_DWORD *)a1, v12, &v31);
      v13 = v8[614];
      if (v12 == -1)
        goto LABEL_31;
    }
    v31 = v12;
    v14 = v15;
    if (v15 != v11)
      goto LABEL_24;
    v14 = v11;
LABEL_31:
    if (v31 != -1 && v14 - v11 < v11)
    {
      v18 = a1 + 24 * v31;
      v29 = *(_OWORD *)(v18 + 18856);
      v30 = *(_QWORD *)(v18 + 18872);
      remove_from_death_row_no_lock((_DWORD *)a1, v31, 0);
    }
    pages = v29;
    if (!(_QWORD)v29)
      goto LABEL_47;
    v20 = *((_QWORD *)&v29 + 1);
    v21 = *MEMORY[0x1E0C88808];
    if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
      v21 = *MEMORY[0x1E0C88820];
  }
  while (!((unint64_t)(*((_QWORD *)&v29 + 1) + 2 * v21) >> 32)
       && !mvm_reclaim_mark_used(v30, v29, DWORD2(v29), *v8));
  v29 = 0uLL;
  if ((large_entry_grow_and_insert_no_lock(a1, pages, v20, &v29) & 1) != 0)
  {
    v22 = *(_QWORD *)(a1 + 20432) - v20;
    *(_QWORD *)(a1 + 20432) = v22;
    if (v8[1018] && !(v22 >> 19))
      v8[1018] = 0;
    os_unfair_lock_unlock(lock);
    if (*((_QWORD *)&v29 + 1))
      mvm_deallocate_pages(v29, *((_QWORD *)&v29 + 1), 0);
    if (v25)
      _platform_memset();
    return pages;
  }
LABEL_47:
  os_unfair_lock_unlock(lock);
LABEL_48:
  pages = mvm_allocate_pages(v11, a3, (2 * *v8) & 0x40000000u | *v8, 3);
  if (pages)
  {
    os_unfair_lock_lock_with_options();
    inserted = large_entry_grow_and_insert_no_lock(a1, pages, v11, &v27);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 18816));
    if (inserted)
    {
      if (v28)
        mvm_deallocate_pages(v27, v28, 0);
    }
    else
    {
      return 0;
    }
  }
  return pages;
}

mach_vm_address_t large_entry_grow_and_insert_no_lock(uint64_t a1, unint64_t a2, unint64_t a3, _QWORD *a4)
{
  _DWORD *v7;
  unsigned int v8;
  _DWORD *v9;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  mach_vm_address_t result;
  unsigned int v17;
  uint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unsigned int v25;
  unint64_t *v26;
  __int128 v27;

  v7 = (_DWORD *)(a1 + 16392);
  v8 = *(_DWORD *)(a1 + 18824);
  v9 = (_DWORD *)MEMORY[0x1E0C88818];
  if (4 * *(_DWORD *)(a1 + 18820) + 4 > v8)
  {
    if (v8)
    {
      v11 = (2 * v8) | 1;
    }
    else
    {
      v12 = *MEMORY[0x1E0C88808];
      if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
        v12 = *MEMORY[0x1E0C88820];
      v11 = v12 / 0x18 - 1;
    }
    v13 = *(_QWORD *)(a1 + 18832);
    v14 = *MEMORY[0x1E0C887F8];
    v15 = (uint64_t *)MEMORY[0x1E0C88810];
    if (*MEMORY[0x1E0C887F8] <= *MEMORY[0x1E0C88810])
      v14 = *MEMORY[0x1E0C88810];
    result = mvm_allocate_pages((v14 + 24 * v11) & ~v14, 0, (2 * *v7) & 0x40000000 | *v7 & 0x60000000u, 3);
    if (!result)
      return result;
    v7[608] = v11;
    *(_QWORD *)(a1 + 18832) = result;
    if (v8)
    {
      v17 = v8;
      do
      {
        while (1)
        {
          v18 = (uint64_t *)(v13 + 24 * --v17);
          v19 = *v18;
          if (*v18)
            break;
LABEL_19:
          if (!v17)
            goto LABEL_22;
        }
        v27 = *(_OWORD *)(v18 + 1);
        v20 = v7[608];
        v21 = (v19 >> *v9) % v20;
        while (1)
        {
          v22 = *(_QWORD *)(a1 + 18832) + 24 * v21;
          if (!*(_QWORD *)v22)
            break;
          if (v21 + 1 == (_DWORD)v20)
            v21 = 0;
          else
            ++v21;
          if (v21 == ((v19 >> *v9) % v20))
            goto LABEL_19;
        }
        *(_QWORD *)v22 = v19;
        *(_OWORD *)(v22 + 8) = v27;
      }
      while (v17);
    }
LABEL_22:
    if (v13)
    {
      *a4 = v13;
      v23 = *MEMORY[0x1E0C887F8];
      if (*MEMORY[0x1E0C887F8] <= (unint64_t)*v15)
        v23 = *v15;
      a4[1] = (v23 + 24 * v8) & ~v23;
    }
    else
    {
      *a4 = 0;
      a4[1] = 0;
    }
  }
  v24 = v7[608];
  v25 = (a2 >> *v9) % v24;
  while (1)
  {
    v26 = (unint64_t *)(*(_QWORD *)(a1 + 18832) + 24 * v25);
    if (!*v26)
      break;
    if (v25 + 1 == (_DWORD)v24)
      v25 = 0;
    else
      ++v25;
    if (v25 == ((a2 >> *v9) % v24))
      goto LABEL_35;
  }
  *v26 = a2;
  v26[1] = a3;
  v26[2] = -1;
LABEL_35:
  ++v7[607];
  *(_QWORD *)(a1 + 18840) += a3;
  return 1;
}

BOOL free_large(uint64_t a1, unint64_t a2, char a3)
{
  unsigned int *v6;
  os_unfair_lock_s *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_unfair_lock_s *v17;
  int v19;
  unsigned int v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  size_t v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  BOOL v33;
  signed int v34;
  signed int v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  size_t v45;
  void *v46;
  os_unfair_lock_s *lock;
  unsigned int *v48;
  int v49;

  v6 = (unsigned int *)(a1 + 16392);
  v7 = (os_unfair_lock_s *)(a1 + 18816);
  os_unfair_lock_lock_with_options();
  v8 = large_entry_for_pointer_no_lock(a1, a2);
  v9 = v8;
  if (!v8)
  {
    if ((a3 & 1) == 0)
      malloc_zone_error(*v6, 1, (uint64_t)"pointer %p being freed was not allocated\n");
    goto LABEL_10;
  }
  if (large_cache_enabled && v8[1] <= *(_QWORD *)(a1 + 20400))
  {
    lock = v7;
    v48 = v6;
    v19 = v6[615];
    v45 = v8[1];
    v46 = (void *)*v8;
    v44 = v8[2];
LABEL_14:
    v20 = v48[614];
    while (1)
    {
      v21 = (_QWORD *)(a1 + 24 * v19);
      v22 = v21[2357];
      v23 = v21[2358];
      v24 = v21[2359];
      v25 = *MEMORY[0x1E0C88808];
      if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
        v25 = *MEMORY[0x1E0C88820];
      if (!((unint64_t)(v23 + 2 * v25) >> 32) && (mvm_reclaim_is_available() & 1) == 0)
      {
        v19 = remove_from_death_row_no_lock((_DWORD *)a1, v19, 0);
        if (v19 != -1)
          goto LABEL_14;
        goto LABEL_32;
      }
      if (v22 == *v9)
        break;
      if (v19 == v20)
        goto LABEL_32;
      if (!v19)
        v19 = v48[1000];
      --v19;
    }
    v26 = *MEMORY[0x1E0C88808];
    if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
      v26 = *MEMORY[0x1E0C88820];
    if ((unint64_t)(v23 + 2 * v26) >> 32)
      goto LABEL_31;
    if (mvm_reclaim_mark_used(v24, v22, v23, *v48))
    {
      v21[2359] = mvm_reclaim_mark_free(v22, v23, *v48);
LABEL_31:
      malloc_zone_error(*v48, 1, (uint64_t)"pointer %p being freed already on death-row\n");
      v17 = lock;
      goto LABEL_11;
    }
LABEL_32:
    v11 = large_entry_free_no_lock(a1, v9);
    v13 = v27;
    v7 = lock;
    os_unfair_lock_unlock(lock);
    v6 = v48;
    if ((*(_BYTE *)v48 & 0x80) != 0)
    {
      v49 = 0;
      v30 = v46;
      if (MEMORY[0x19401F858](*MEMORY[0x1E0C883F0], v46, 0, &v49))
      {
        malloc_report(3u, (uint64_t)"*** can't vm_purgable_control(..., VM_PURGABLE_SET_STATE) for large freed block at %p\n");
        v28 = 0;
      }
      else
      {
        v28 = 1;
      }
      v29 = v45;
    }
    else
    {
      v28 = 1;
      v29 = v45;
      v30 = v46;
    }
    if (v48[1004] && mprotect(v30, v29, 3))
    {
      malloc_report(3u, (uint64_t)"*** can't reset protection for large freed block at %p\n");
    }
    else if (v28)
    {
      v31 = *v48;
      if ((*v48 & 0x20) != 0)
      {
        _platform_memset();
        v31 = *v48;
      }
      v32 = *MEMORY[0x1E0C88808];
      if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
        v32 = *MEMORY[0x1E0C88820];
      v33 = (v29 + 2 * v32) >> 32 != 0;
      v44 = mvm_reclaim_mark_free((uint64_t)v30, v29, v31);
      goto LABEL_48;
    }
    v33 = 1;
LABEL_48:
    os_unfair_lock_lock_with_options();
    --v48[607];
    *(_QWORD *)(a1 + 18840) -= v29;
    if (v33)
    {
      if (v11)
      {
        os_unfair_lock_unlock(lock);
        goto LABEL_6;
      }
      v10 = 0;
      goto LABEL_5;
    }
    v34 = v48[615];
    v35 = v48[614];
    if ((v34 != v35 || *(_QWORD *)(a1 + 24 * v34 + 18856)) && (v34 != v48[1000] - 1 ? ++v34 : (v34 = 0), v34 == v35))
    {
      v36 = (_QWORD *)(a1 + 24 * v35);
      v37 = v36[2357];
      v38 = v36[2358];
      *(_QWORD *)(a1 + 20432) -= v38;
      v39 = v36[2359];
      v34 = v35;
    }
    else
    {
      v37 = 0;
      v38 = 0;
      v39 = 0;
    }
    v40 = *(_QWORD *)(a1 + 20432) + v29;
    *(_QWORD *)(a1 + 20432) = v40;
    if (!v48[1018] && v40 > 0x100000)
      v48[1018] = 1;
    v41 = (_QWORD *)(a1 + 24 * v34);
    v41[2357] = v30;
    v41[2358] = v29;
    v41[2359] = v44;
    v48[615] = v34;
    if (v37)
    {
      if (v35 == v48[1000] - 1)
        v42 = 0;
      else
        v42 = v35 + 1;
      v48[614] = v42;
      os_unfair_lock_unlock(lock);
      v43 = *MEMORY[0x1E0C88808];
      if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
        v43 = *MEMORY[0x1E0C88820];
      if (!((unint64_t)(v38 + 2 * v43) >> 32) && mvm_reclaim_mark_used(v39, v37, v38, *v48))
      {
        v16 = *v48;
        v14 = v37;
        v15 = v38;
        goto LABEL_7;
      }
      return v9 != 0;
    }
LABEL_10:
    v17 = v7;
LABEL_11:
    os_unfair_lock_unlock(v17);
    return v9 != 0;
  }
  v10 = v8;
LABEL_5:
  --v6[607];
  *(_QWORD *)(a1 + 18840) -= v10[1];
  v11 = large_entry_free_no_lock(a1, v10);
  v13 = v12;
  os_unfair_lock_unlock(v7);
  if (v11)
  {
LABEL_6:
    v14 = v11;
    v15 = v13;
    v16 = 0;
LABEL_7:
    mvm_deallocate_pages(v14, v15, v16);
  }
  return v9 != 0;
}

uint64_t mvm_reclaim_is_available()
{
  return mach_vm_reclaim_is_available();
}

_QWORD *large_entry_for_pointer_no_lock(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v4;
  _QWORD *result;

  v2 = *(unsigned int *)(a1 + 18824);
  if (!(_DWORD)v2)
    return 0;
  v3 = *(_QWORD *)(a1 + 18832);
  v4 = (a2 >> *MEMORY[0x1E0C88818]) % v2;
  while (1)
  {
    result = (_QWORD *)(v3 + 24 * v4);
    if (*result == a2)
      break;
    if (*result)
    {
      if (v4 + 1 == (_DWORD)v2)
        v4 = 0;
      else
        ++v4;
      if (v4 != ((a2 >> *MEMORY[0x1E0C88818]) % v2))
        continue;
    }
    return 0;
  }
  return result;
}

uint64_t large_entry_free_no_lock(uint64_t a1, _QWORD *a2)
{
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _DWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int v15;
  uint64_t v16;
  __int128 v18;

  v4 = (_DWORD *)(a1 + 16392);
  if (malloc_tracing_enabled)
    large_entry_free_no_lock_cold_1();
  v5 = *a2;
  if ((*v4 & 3) != 0)
  {
    mvm_protect(*a2, a2[1], 3);
    v6 = *MEMORY[0x1E0C88808];
    if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
      v6 = *MEMORY[0x1E0C88820];
    v5 -= v6;
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = -1;
  v7 = v4[608];
  v8 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a2 - *(_QWORD *)(a1 + 18832)) >> 3);
  v9 = (_DWORD *)MEMORY[0x1E0C88818];
  v10 = v8;
  do
  {
    if (v10 + 1 == v7)
      v10 = 0;
    else
      ++v10;
    v11 = *(_QWORD *)(a1 + 18832);
    v12 = (uint64_t *)(v11 + 24 * v10);
    v13 = *v12;
    v18 = *(_OWORD *)(v12 + 1);
    if (!*v12)
      break;
    *v12 = 0;
    v12[1] = 0;
    *(_QWORD *)(v11 + 24 * v10 + 16) = -1;
    v14 = v4[608];
    v15 = (v13 >> *v9) % v14;
    while (1)
    {
      v16 = v11 + 24 * v15;
      if (!*(_QWORD *)v16)
        break;
      if (v15 + 1 == (_DWORD)v14)
        v15 = 0;
      else
        ++v15;
      if (v15 == ((v13 >> *v9) % v14))
        goto LABEL_20;
    }
    *(_QWORD *)v16 = v13;
    *(_OWORD *)(v16 + 8) = v18;
LABEL_20:
    ;
  }
  while (v10 != v8);
  return v5;
}

uint64_t mvm_reclaim_mark_free(uint64_t a1, unsigned int a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 & 3) == 0)
    goto LABEL_6;
  v3 = *MEMORY[0x1E0C88808];
  if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
    v3 = *MEMORY[0x1E0C88820];
  v4 = -1;
  if (!__CFADD__(2 * v3, a2) && !((2 * v3 + (unint64_t)a2) >> 32))
  {
LABEL_6:
    os_unfair_lock_lock_with_options();
    v4 = mach_vm_reclaim_mark_free();
    os_unfair_lock_unlock((os_unfair_lock_t)&reclaim_buffer_lock);
  }
  return v4;
}

uint64_t mvm_reclaim_mark_used(uint64_t a1, uint64_t a2, unsigned int a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  if ((a4 & 3) != 0)
  {
    v4 = *MEMORY[0x1E0C88808];
    if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
      v4 = *MEMORY[0x1E0C88820];
    if (__CFADD__(2 * v4, a3) || (2 * v4 + (unint64_t)a3) >> 32)
      return 0;
  }
  os_unfair_lock_lock_with_options();
  v5 = mach_vm_reclaim_mark_used();
  os_unfair_lock_unlock((os_unfair_lock_t)&reclaim_buffer_lock);
  return v5;
}

uint64_t remove_from_death_row_no_lock(_DWORD *a1, int a2, _DWORD *a3)
{
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a1 + 4098;
  LODWORD(v6) = a1[4712];
  LODWORD(v7) = a1[4713];
  if ((int)v6 >= (int)v7)
  {
    if ((int)v7 >= (int)v6)
    {
      if (a3 && *a3 != -1)
        malloc_zone_error(*v5, 1, (uint64_t)"Invalid best: %d\n");
      v13 = &a1[6 * a2];
      v13[2358] = 0;
      v13[2357] = 0;
      v13[2359] = -1;
      return 0xFFFFFFFFLL;
    }
    else if ((int)v7 >= a2)
    {
      if ((int)v7 > a2)
      {
        v14 = a2;
        v15 = (uint64_t)&a1[6 * a2 + 4714];
        do
        {
          ++v14;
          *(_OWORD *)v15 = *(_OWORD *)(v15 + 24);
          *(_QWORD *)(v15 + 16) = *(_QWORD *)(v15 + 40);
          v15 += 24;
        }
        while (v14 < (int)a1[4713]);
        LODWORD(v7) = a1[4713];
      }
      if (a3 && *a3 != -1)
      {
        --*a3;
        LODWORD(v7) = a1[4713];
      }
      if ((int)v7 <= 0)
        LODWORD(v7) = a1[5098];
      a1[4713] = v7 - 1;
      if (a2)
        return (a2 - 1);
      else
        return (a1[5098] - 1);
    }
    else
    {
      if ((int)v6 < a2)
      {
        v11 = a2;
        v12 = (uint64_t)&a1[6 * a2 + 4714];
        do
        {
          --v11;
          *(_OWORD *)v12 = *(_OWORD *)(v12 - 24);
          *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 - 8);
          v12 -= 24;
          v6 = (int)a1[4712];
        }
        while (v11 > v6);
      }
      if ((_DWORD)v6 == a2)
        result = 0xFFFFFFFFLL;
      else
        result = a2;
      if ((int)v6 >= v5[1000] - 1)
        v5[614] = 0;
      else
        v5[614] = v6 + 1;
    }
  }
  else
  {
    if ((int)v7 > a2)
    {
      v8 = a2;
      v9 = (uint64_t)&a1[6 * a2 + 4714];
      do
      {
        ++v8;
        *(_OWORD *)v9 = *(_OWORD *)(v9 + 24);
        *(_QWORD *)(v9 + 16) = *(_QWORD *)(v9 + 40);
        v9 += 24;
        v7 = (int)a1[4713];
      }
      while (v8 < v7);
    }
    if (a3 && *a3 != -1)
    {
      --*a3;
      LODWORD(v7) = a1[4713];
    }
    if (a1[4712] == a2)
      result = 0xFFFFFFFFLL;
    else
      result = (a2 - 1);
    v5[615] = v7 - 1;
  }
  return result;
}

mach_vm_address_t mvm_allocate_pages_plat(unint64_t a1, int a2, int a3, int a4)
{
  unint64_t v5;
  mach_vm_size_t v6;
  int v7;
  mach_vm_offset_t v8;
  int v9;
  vm_map_t *v10;
  mach_vm_address_t i;
  kern_return_t v12;
  mach_vm_address_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  const char *v18;
  uint64_t v20;
  kern_return_t v21;
  int v24;
  mach_vm_address_t address;

  v5 = *MEMORY[0x1E0C88820];
  if (((a1 + *MEMORY[0x1E0C88820] - 1) & -*MEMORY[0x1E0C88820]) != 0)
    v6 = (a1 + *MEMORY[0x1E0C88820] - 1) & -*MEMORY[0x1E0C88820];
  else
    v6 = *MEMORY[0x1E0C88820];
  if ((a3 & 3) != 0)
  {
    if ((a3 & 1) != 0 && *MEMORY[0x1E0C88818] < a2)
    {
      if (*MEMORY[0x1E0C88808] > v5)
        v5 = *MEMORY[0x1E0C88808];
      v6 += (1 << a2) + v5;
    }
    else
    {
      if (*MEMORY[0x1E0C88808] > v5)
        v5 = *MEMORY[0x1E0C88808];
      v6 += v5 << ((a3 & 3) == 3);
    }
  }
  if ((a3 & 0x80) != 0)
    v7 = 3;
  else
    v7 = 1;
  if (v6 < a1)
    return 0;
  v24 = a3 & 3;
  v8 = ~(-1 << a2);
  v9 = v7 | (a4 << 24);
  v10 = (vm_map_t *)MEMORY[0x1E0C883F0];
  if ((a3 & 0x40000000) != 0)
    goto LABEL_19;
LABEL_18:
  for (i = entropic_address; ; i = *MEMORY[0x1E0C88820])
  {
    address = i;
    v12 = mach_vm_map(*v10, &address, v6, v8, v9, 0, 0, 0, 3, 7, 1u);
    if ((a3 & 0x40000000) == 0 && v12 == 3)
    {
      address = *MEMORY[0x1E0C88820];
      v12 = mach_vm_map(*v10, &address, v6, v8, v9, 0, 0, 0, 3, 7, 1u);
    }
    if (v12)
    {
      if (v12 == 3)
        return 0;
      v18 = "can't allocate region\n:*** mach_vm_map(size=%lu, flags: %x) failed (error code=%d)\n";
      goto LABEL_44;
    }
    v13 = address;
    if ((a3 & 0x40000000) != 0)
      goto LABEL_34;
    if (address + v6 <= entropic_limit)
      break;
    v14 = entropic_address;
    if (!((unint64_t)entropic_address >> 28) || entropic_address - 0x10000000 < (unint64_t)entropic_base)
      break;
    mach_vm_deallocate(*v10, address, v6);
    OSAtomicCompareAndSwapLong(v14, v14 - 0x10000000, &entropic_address);
    if ((a3 & 0x40000000) == 0)
      goto LABEL_18;
LABEL_19:
    ;
  }
  if (address < entropic_address
    && (unint64_t)entropic_address >> 28
    && entropic_address - 0x10000000 >= (unint64_t)entropic_base)
  {
    OSAtomicCompareAndSwapLong(entropic_address, entropic_address - 0x10000000, &entropic_address);
  }
LABEL_34:
  if (!v24)
    return v13;
  if ((a3 & 1) != 0 && *MEMORY[0x1E0C88818] < a2)
  {
    if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
      v15 = *MEMORY[0x1E0C88820];
    else
      v15 = *MEMORY[0x1E0C88808];
    v16 = 1 << a2;
    v17 = (v15 + v13 + v16 - 1) & -v16;
    if (mach_vm_deallocate(*v10, v13, v17 - (v15 + v13)))
    {
      v18 = "can't unmap excess guard region\n*** mach_vm_deallocate(addr=%p, size=%lu) failed (code=%d)\n";
LABEL_44:
      malloc_zone_error(a3, 0, (uint64_t)v18);
      return 0;
    }
    if (v16 == v17 - v13)
    {
      v13 = (v15 + v13 + v16 - 1) & -v16;
    }
    else
    {
      v21 = mach_vm_deallocate(*v10, v6 - (v16 - v17), v16 - (v17 - v13));
      v13 = (v15 + v13 + v16 - 1) & -v16;
      if (v21)
      {
        v18 = "can't unmap excess trailing guard region\n*** mach_vm_deallocate(addr=%p, size=%lu) failed (code=%d)\n";
        goto LABEL_44;
      }
    }
  }
  else if ((a3 & 1) != 0)
  {
    v20 = *MEMORY[0x1E0C88808];
    if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
      v20 = *MEMORY[0x1E0C88820];
    v13 += v20;
  }
  mvm_protect_plat(v13, a1, 0, a3);
  return v13;
}

mach_vm_address_t mvm_allocate_pages(unint64_t a1, int a2, int a3, int a4)
{
  return mvm_allocate_pages_plat(a1, a2, a3, a4);
}

void mvm_deallocate_plat(mach_vm_address_t address, mach_vm_size_t size, __int16 a3)
{
  if (mach_vm_deallocate(*MEMORY[0x1E0C883F0], address, size))
    malloc_zone_error(a3, 0, (uint64_t)"Failed to deallocate at address %p of size 0x%lx\n");
}

void mvm_deallocate_pages_plat(mach_vm_address_t a1, mach_vm_size_t a2, __int16 a3)
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 & 1) == 0)
  {
    if ((a3 & 2) == 0)
      goto LABEL_3;
    goto LABEL_7;
  }
  v3 = *MEMORY[0x1E0C88808];
  if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
    v3 = *MEMORY[0x1E0C88820];
  a1 -= v3;
  a2 += v3;
  if ((a3 & 2) != 0)
  {
LABEL_7:
    v4 = *MEMORY[0x1E0C88808];
    if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
      v4 = *MEMORY[0x1E0C88820];
    a2 += v4;
  }
LABEL_3:
  mvm_deallocate_plat(a1, a2, a3);
}

void mvm_protect_plat(uint64_t a1, uint64_t a2, int a3, char a4)
{
  size_t v8;
  size_t v9;

  if ((a4 & 9) == 1)
  {
    v8 = *MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820] ? *MEMORY[0x1E0C88820] : *MEMORY[0x1E0C88808];
    if (mprotect((void *)(a1 - v8), v8, a3))
      malloc_report(3u, (uint64_t)"*** can't mvm_protect(%u) region for prelude guard page at %p\n");
  }
  if ((a4 & 0x12) == 2)
  {
    if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
      v9 = *MEMORY[0x1E0C88820];
    else
      v9 = *MEMORY[0x1E0C88808];
    if (mprotect((void *)((a1 + a2 + *MEMORY[0x1E0C88820] - 1) & -*MEMORY[0x1E0C88820]), v9, a3))
      malloc_report(3u, (uint64_t)"*** can't mvm_protect(%u) region for postlude guard page at %p\n");
  }
}

uint64_t nanov2_madvise_block_locked(const os_unfair_lock *a1, unsigned int *a2, uint64_t a3, int a4, int a5)
{
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;

  os_unfair_lock_assert_owner(a1 + 7184);
  v10 = *a2;
  if ((*a2 & 0x7FF) != a5)
    return 0;
  v11 = (v10 + 0x200000) & 0x7FE00000 | 0x7FE;
  do
  {
    v12 = __ldxr(a2);
    if (v12 != v10)
    {
      v13 = 0;
      __clrex();
      ++*(_QWORD *)&a1[8 * a4 + 7194]._os_unfair_lock_opaque;
      return v13;
    }
  }
  while (__stxr(v11, a2));
  if (mvm_madvise_free(a1, a3 & 0xFFFFFFFFE0000000, a3, a3 + 0x4000, 0, 0))
  {
    __error();
    malloc_zone_error(0, 0, (uint64_t)"Failed to madvise block at blockp: %p, error: %d\n");
    v13 = 0;
  }
  else
  {
    ++*(_QWORD *)&a1[8 * a4 + 7192]._os_unfair_lock_opaque;
    v13 = 1;
  }
  while (1)
  {
    v14 = __ldxr(a2);
    if (v14 != v11)
      break;
    if (!__stxr((v10 + 0x400000) & 0x7FE00000 | 0x7FF, a2))
      return v13;
  }
  __clrex();
  malloc_zone_error(a1[7169]._os_unfair_lock_opaque, 0, (uint64_t)"Failed when changing state from MADVISING to MADVISED, block_metap = %p, blockp = %p\n");
  return v13;
}

uint64_t nanov2_madvise_block_locked_0(const os_unfair_lock *a1, atomic_uint *a2, uint64_t a3, int a4, int a5)
{
  atomic_uint v10;
  unsigned int v11;
  atomic_uint v12;
  uint64_t v13;
  int v14;

  os_unfair_lock_assert_owner(a1 + 7184);
  v10 = *a2;
  if ((*a2 & 0x7FF) != a5)
    return 0;
  v11 = (v10 + 0x200000) & 0x7FE00000 | 0x7FE;
  v12 = *a2;
  atomic_compare_exchange_strong_explicit(a2, (unsigned int *)&v12, v11, memory_order_relaxed, memory_order_relaxed);
  if (v12 == v10)
  {
    if (mvm_madvise_free(a1, a3 & 0xFFFFFFFFE0000000, a3, a3 + 0x4000, 0, 0))
    {
      __error();
      malloc_zone_error(0, 0, (uint64_t)"Failed to madvise block at blockp: %p, error: %d\n");
      v13 = 0;
    }
    else
    {
      ++*(_QWORD *)&a1[8 * a4 + 7192]._os_unfair_lock_opaque;
      v13 = 1;
    }
    v14 = (v10 + 0x200000) & 0x7FE00000 | 0x7FE;
    atomic_compare_exchange_strong_explicit(a2, (unsigned int *)&v14, (v10 + 0x400000) & 0x7FE00000 | 0x7FF, memory_order_relaxed, memory_order_relaxed);
    if (v14 != v11)
      malloc_zone_error(a1[7169]._os_unfair_lock_opaque, 0, (uint64_t)"Failed when changing state from MADVISING to MADVISED, block_metap = %p, blockp = %p\n");
  }
  else
  {
    v13 = 0;
    ++*(_QWORD *)&a1[8 * a4 + 7194]._os_unfair_lock_opaque;
  }
  return v13;
}

uint64_t mvm_madvise_free_plat(int a1, int a2, void *a3, unint64_t a4, void **a5, int a6)
{
  size_t v6;

  v6 = a4 - (_QWORD)a3;
  if (a4 <= (unint64_t)a3)
    return 0;
  if (a6 && malloc_zero_policy)
    _platform_memset();
  if (a5)
  {
    if (*a5 == a3)
      return 0;
    *a5 = a3;
  }
  if (madvise(a3, v6, 7) != -1)
  {
    if (malloc_tracing_enabled)
      kdebug_trace();
    return 0;
  }
  return 1;
}

void *__cdecl malloc_zone_malloc(malloc_zone_t *zone, size_t size)
{
  return (void *)_malloc_zone_malloc((uint64_t)zone, size, 0);
}

void *__cdecl aligned_alloc(size_t __alignment, size_t __size)
{
  unint64_t v2;

  return (void *)_malloc_zone_memalign((uint64_t)default_zone, __alignment, __size, 3, (v2 >> 2));
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  BOOL v3;
  BOOL v4;
  uint8x8_t v5;
  BOOL v6;
  void *result;

  if (malloc_logger)
    v3 = 0;
  else
    v3 = malloc_slowpath == 0;
  v4 = v3 && malloc_absolute_max_size >= size;
  if (!v4 || alignment < 8)
    return (void *)_malloc_type_aligned_alloc_outlined(alignment, size, type_id);
  v5 = (uint8x8_t)vcnt_s8((int8x8_t)alignment);
  v5.i16[0] = vaddlv_u8(v5);
  v6 = *(_DWORD *)(*(_QWORD *)malloc_zones + 104) < 0x10u || v5.u32[0] > 1uLL;
  if (v6 || ((alignment - 1) & size) != 0)
    return (void *)_malloc_type_aligned_alloc_outlined(alignment, size, type_id);
  result = (void *)(*(uint64_t (**)(void))(*(_QWORD *)malloc_zones + 184))();
  if (!result)
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  return result;
}

uint64_t _malloc_type_aligned_alloc_outlined(size_t __alignment, size_t __size, unint64_t a3)
{
  unint64_t StatusReg;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v4 = *(_QWORD *)(StatusReg + 904);
  if (a3 <= 1)
    v5 = 1;
  else
    v5 = a3;
  *(_QWORD *)(StatusReg + 904) = v5;
  if (malloc_interposition_compat)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
    result = (uint64_t)j__aligned_alloc(__alignment, __size);
  else
    result = _malloc_zone_memalign((uint64_t)default_zone, __alignment, __size, 3, 0);
  *(_QWORD *)(StatusReg + 904) = v4;
  return result;
}

void *__cdecl malloc_type_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  BOOL v4;
  uint8x8_t v6;

  if (malloc_logger)
    v4 = 0;
  else
    v4 = malloc_slowpath == 0;
  if (!v4 || malloc_absolute_max_size < size)
    return (void *)_malloc_type_zone_memalign_outlined(zone, alignment, size, type_id);
  if (default_zone == (_UNKNOWN *)zone)
    zone = *(malloc_zone_t **)malloc_zones;
  if (alignment >= 8
    && zone->version >= 0x10
    && (v6 = (uint8x8_t)vcnt_s8((int8x8_t)alignment), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] <= 1uLL))
  {
    return (void *)((uint64_t (*)(void))zone[1].calloc)();
  }
  else
  {
    return (void *)_malloc_type_zone_memalign_outlined(zone, alignment, size, type_id);
  }
}

uint64_t default_zone_size()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void xzm_malloc_zone_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  xzm_malloc_zone_malloc_type_calloc(a1, a2, a3, *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904));
}

void pgm_free(uint64_t a1, unint64_t a2)
{
  if (*(_QWORD *)(a1 + 248) <= a2 && *(_QWORD *)(a1 + 256) > a2)
  {
    os_unfair_lock_lock_with_options();
    deallocate(a1, a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 200) + 48))();
  }
}

uint64_t pgm_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t StatusReg;
  int v8;
  uint64_t v9;
  uint32_t v10;
  uint64_t v12;

  if (!is_mul_ok(a2, a3))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 32))();
  if (*MEMORY[0x1E0C88820] < a2 * a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 32))();
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v8 = *(_DWORD *)(StatusReg + 880);
  if (v8 == -1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 32))();
  if (v8)
  {
    v10 = v8 - 1;
  }
  else
  {
    v9 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v9)
      nanov2_realloc_VARIANT_mp_cold_1(v9);
    v10 = arc4random_uniform(v9);
  }
  *(_QWORD *)(StatusReg + 880) = v10;
  if (v10)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 32))();
  os_unfair_lock_lock_with_options();
  v12 = allocate(a1, a2 * a3, 0x10uLL);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  if (!v12)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 32))();
  _platform_memset();
  return v12;
}

void pgm_free_definite_size(uint64_t a1, unint64_t a2)
{
  if (*(_QWORD *)(a1 + 248) <= a2 && *(_QWORD *)(a1 + 256) > a2)
  {
    os_unfair_lock_lock_with_options();
    deallocate(a1, a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 200) + 120))();
  }
}

uint64_t deallocate(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;

  v4 = lookup_slot(a1, a2);
  if ((v4 & 0x8000000000000000) == 0)
    deallocate_cold_1(a2);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 280);
  v7 = 8 * v4;
  v8 = *(unsigned int *)(v6 + v7);
  *(_DWORD *)(v6 + v7) = v8 & 0xFFFFFFFC | 2;
  v9 = *(_QWORD *)(a1 + 288) + ((v8 << 6) & 0x3FFFFFFF00);
  *(_QWORD *)(v9 + 22) = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  *(_QWORD *)(v9 + 30) = mach_absolute_time();
  if (*(unsigned __int16 *)(v9 + 20) >= 0x6Cu)
    v10 = 108;
  else
    v10 = *(unsigned __int16 *)(v9 + 20);
  *(_WORD *)(v9 + 20) = v10;
  v11 = trace_collect(v9 + v10 + 40, 216 - v10);
  v12 = *(_DWORD *)(a1 + 16684);
  *(_WORD *)(v9 + 38) = v11;
  *(_DWORD *)(a1 + 16684) = v12 - 1;
  *(_QWORD *)(a1 + 16696) -= *(unsigned __int16 *)(*(_QWORD *)(a1 + 280) + v7 + 4);
  if (*(_DWORD *)(a1 + 208) <= v5)
    nanov2_realloc_VARIANT_mp_cold_1(v11);
  v13 = (uint64_t *)MEMORY[0x1E0C88820];
  v14 = (void *)(*(_QWORD *)(a1 + 248) + *MEMORY[0x1E0C88820] * ((2 * v5) | 1));
  v15 = madvise(v14, *MEMORY[0x1E0C88820], 7);
  if ((_DWORD)v15)
    nanov2_realloc_VARIANT_mp_cold_1(v15);
  my_vm_protect((mach_vm_address_t)v14, *v13, 0);
  return debug_zone(a1, (uint64_t)"freed", a2);
}

unint64_t lookup_slot(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  BOOL v15;
  BOOL v16;
  unint64_t v17;

  v2 = *(_QWORD *)(a1 + 248);
  v3 = a2 - v2;
  if (a2 < v2 || (v4 = *(_QWORD *)(a1 + 256), v4 <= a2))
    nanov2_realloc_VARIANT_mp_cold_1();
  v5 = *MEMORY[0x1E0C88820];
  if (v2 % *MEMORY[0x1E0C88820])
    nanov2_realloc_VARIANT_mp_cold_1();
  if (v5 + v2 <= a2)
  {
    if (v4 - v5 <= a2)
    {
      v6 = *(_DWORD *)(a1 + 208) - 1;
    }
    else if (((v3 / v5) & 1) == 0 && a2 % v5 >= v5 >> 1)
    {
      v6 = (((v3 / v5) - 1) >> 1) + 1;
    }
    else
    {
      v6 = ((v3 / v5) - 1) >> 1;
    }
  }
  else
  {
    v6 = 0;
  }
  v8 = *(_QWORD *)(a1 + 280);
  v9 = v6;
  if (((v3 / v5) & 1) != 0)
  {
    v12 = v8 + 8 * v6;
    v13 = *(unsigned __int16 *)(v12 + 6);
    v14 = (unsigned __int16)(a2 % v5);
    if (v14 == v13)
    {
      v11 = 0;
      v10 = 1;
    }
    else
    {
      v10 = 0;
      v15 = v14 < (unsigned __int16)(*(_WORD *)(v12 + 4) + v13) && v14 > v13;
      v11 = 0x200000000;
      if (v15)
        v11 = 0x100000000;
    }
  }
  else
  {
    v10 = 0;
    v11 = 0x300000000;
  }
  v16 = (v10 & ((*(_DWORD *)(v8 + 8 * v9) & 3) == 1)) == 0;
  v17 = 0x8000000000000000;
  if (v16)
    v17 = 0;
  return v11 | v9 | v17;
}

uint64_t allocate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t *v3;
  unint64_t v4;
  uint8x8_t v6;
  _DWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  unint64_t v15;
  uint32_t v16;
  uint32_t v17;
  uint8x8_t v18;
  uint64_t v19;
  unsigned __int16 v20;
  mach_vm_address_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v3 = (uint64_t *)MEMORY[0x1E0C88820];
  v4 = *MEMORY[0x1E0C88820];
  if (*MEMORY[0x1E0C88820] < a2)
    ((void (*)(void))nanov2_realloc_VARIANT_mp_cold_1)();
  if (a3 < 0x10 || v4 < a3)
    ((void (*)(void))nanov2_realloc_VARIANT_mp_cold_1)();
  v6 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] != 1)
    ((void (*)(void))nanov2_realloc_VARIANT_mp_cold_1)();
  v8 = (_DWORD *)(a1 + 16684);
  if (*(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212))
    return 0;
  if (a2)
    v10 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  else
    v10 = 16;
  v11 = *(unsigned int *)(a1 + 16692);
  v12 = *(_QWORD *)(a1 + 280);
  v13 = *(_DWORD *)(v12 + 8 * v11) & 3;
  v14 = *(_DWORD *)(a1 + 208);
  while (v13 == 1)
  {
    LODWORD(v11) = ((int)v11 + 1) % v14;
    v13 = *(_DWORD *)(v12 + 8 * v11) & 3;
  }
  *(_DWORD *)(a1 + 16692) = ((int)v11 + 1) % v14;
  LODWORD(v15) = *(_DWORD *)(a1 + 16688);
  if (v15 >= *(_DWORD *)(a1 + 216))
  {
    v15 = (unint64_t)*(unsigned int *)(v12 + 8 * v11) >> 2;
    if (*(_DWORD *)(*(_QWORD *)(a1 + 288) + (v15 << 8)) != (_DWORD)v11)
    {
      do
      {
        v16 = *(_DWORD *)(a1 + 216);
        if (!v16)
          ((void (*)(void))nanov2_realloc_VARIANT_mp_cold_1)();
        v17 = arc4random_uniform(v16);
      }
      while ((*(_DWORD *)(*(_QWORD *)(a1 + 280)
                         + 8 * *(unsigned int *)(*(_QWORD *)(a1 + 288) + ((unint64_t)v17 << 8))) & 3) != 2);
      v4 = *v3;
      LODWORD(v15) = v17;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 16688) = v15 + 1;
  }
  if ((unsigned __int16)v4 < v10)
    ((void (*)(void))nanov2_realloc_VARIANT_mp_cold_1)();
  if ((unsigned __int16)v4 < a3)
    ((void (*)(void))nanov2_realloc_VARIANT_mp_cold_1)();
  v18 = (uint8x8_t)vcnt_s8((int8x8_t)(unsigned __int16)v4);
  v18.i16[0] = vaddlv_u8(v18);
  if (v18.u32[0] != 1)
    ((void (*)(void))nanov2_realloc_VARIANT_mp_cold_1)();
  v19 = arc4random_uniform(2u);
  if (*(_DWORD *)(a1 + 208) <= v11)
    nanov2_realloc_VARIANT_mp_cold_1(v19);
  if ((_DWORD)v19)
    v20 = 0;
  else
    v20 = (v4 - v10) & -(__int16)a3;
  v21 = *(_QWORD *)(a1 + 248) + *v3 * ((2 * (_DWORD)v11) | 1u);
  my_vm_protect(v21, *v3, 3);
  v22 = *(_QWORD *)(a1 + 280) + 8 * v11;
  *(_DWORD *)v22 = (4 * v15) | 1;
  *(_WORD *)(v22 + 4) = v10;
  *(_WORD *)(v22 + 6) = v20;
  v23 = *(_QWORD *)(a1 + 288) + ((unint64_t)v15 << 8);
  *(_DWORD *)v23 = v11;
  *(_QWORD *)(v23 + 4) = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  *(_QWORD *)(v23 + 12) = mach_absolute_time();
  *(_QWORD *)(v23 + 30) = 0;
  *(_QWORD *)(v23 + 22) = 0;
  *(_WORD *)(v23 + 38) = 0;
  *(_WORD *)(v23 + 20) = trace_collect(v23 + 40, 216);
  ++*v8;
  v24 = *(_QWORD *)(a1 + 16696) + v10;
  *(_QWORD *)(a1 + 16696) = v24;
  if (v24 <= *(_QWORD *)(a1 + 16704))
    v24 = *(_QWORD *)(a1 + 16704);
  *(_QWORD *)(a1 + 16704) = v24;
  v9 = v21 + v20;
  debug_zone(a1, (uint64_t)"allocated", v9);
  return v9;
}

uint64_t trace_collect(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  BOOL v13;
  void *v14[66];

  v14[65] = *(void **)MEMORY[0x1E0C874D8];
  v4 = backtrace(v14, 65);
  if (v4 < 2)
    return 0;
  v6 = 0;
  v7 = 0;
  v8 = v4 - 1;
  while (2)
  {
    if (v6)
      v9 = v14[v6];
    else
      v9 = 0;
    v10 = (_BYTE *)v14[v6 + 1] - v9;
    if (v10 >= -3)
      v11 = 2 * (v10 / 4);
    else
      v11 = ~(2 * (v10 / 4));
    result = v7;
    do
    {
      if (a2 == result)
        return v7;
      v12 = v11;
      *(_BYTE *)(a1 + result++) = v11 & 0x7F;
      v13 = v11 > 0x7F;
      v11 >>= 7;
    }
    while (v13);
    *(_BYTE *)(a1 + result - 1) = v12 | 0x80;
    ++v6;
    v7 = result;
    if (v6 != v8)
      continue;
    break;
  }
  return result;
}

uint64_t my_vm_protect(mach_vm_address_t address, uint64_t a2, vm_prot_t new_protection)
{
  uint64_t result;

  result = mach_vm_protect(*MEMORY[0x1E0C883F0], address, (a2 + *MEMORY[0x1E0C88820] - 1) & -*MEMORY[0x1E0C88820], 0, new_protection);
  if ((_DWORD)result)
    nanov2_realloc_VARIANT_mp_cold_1();
  return result;
}

uint64_t debug_zone(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  mach_timebase_info info;

  if (*(_BYTE *)(result + 224))
  {
    v4 = result;
    v5 = mach_absolute_time();
    v6 = v5 - *(_QWORD *)(v4 + 16712);
    info = 0;
    mach_timebase_info(&info);
    if (*(_QWORD *)(v4 + 232) <= v6 * info.numer / info.denom / 0xF4240)
    {
      *(_QWORD *)(v4 + 16712) = v5;
      malloc_report(6u, (uint64_t)"ProbGuard: %9s 0x%llx, fill state: %3u/%u\n");
    }
    result = pgm_check(v4);
    if (!(_DWORD)result)
      debug_zone_cold_1(a3);
  }
  return result;
}

uint64_t pgm_good_size(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 96) + 8))();
}

uint64_t malloc_engaged_nano()
{
  if (initial_nano_zone | initial_xzone_zone)
    return _malloc_engaged_nano;
  else
    return 0;
}

uint64_t _malloc_fork_prepare()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t result;
  uint64_t (*v3)(void);

  v3 = (uint64_t (*)(void))off_1EE228060;
  os_unfair_lock_lock_with_options();
  mfm_lock();
  if (malloc_num_zones)
  {
    v0 = 0;
    do
    {
      v1 = v0 + 1;
      (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)malloc_zones + v0) + 96) + 40))();
      v0 = v1;
    }
    while (v1 < malloc_num_zones);
  }
  if (initial_xzone_zone)
    xzm_force_lock_global_state(initial_xzone_zone);
  result = (uint64_t)v3;
  if (v3)
    return v3();
  return result;
}

uint64_t szone_force_lock(uint64_t a1)
{
  int *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;

  v2 = (int *)(a1 + 17120);
  if (*(int *)(a1 + 17120) >= 1)
  {
    v3 = 0;
    do
    {
      v4 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 17136) + 2560 * v3);
      os_unfair_lock_lock_with_options();
      while (v4[1]._os_unfair_lock_opaque)
      {
        os_unfair_lock_unlock(v4);
        MEMORY[0x19401F804](0, 1, 1);
        os_unfair_lock_lock_with_options();
      }
      ++v3;
    }
    while (v3 < *v2);
  }
  v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 17136) - 2560);
  os_unfair_lock_lock_with_options();
  while (v5[1]._os_unfair_lock_opaque)
  {
    os_unfair_lock_unlock(v5);
    MEMORY[0x19401F804](0, 1, 1);
    os_unfair_lock_lock_with_options();
  }
  if (v2[192] >= 1)
  {
    v6 = 0;
    do
    {
      v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 17904) + 2560 * v6);
      os_unfair_lock_lock_with_options();
      while (v7[1]._os_unfair_lock_opaque)
      {
        os_unfair_lock_unlock(v7);
        MEMORY[0x19401F804](0, 1, 1);
        os_unfair_lock_lock_with_options();
      }
      ++v6;
    }
    while (v6 < v2[192]);
  }
  v8 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 17904) - 2560);
  os_unfair_lock_lock_with_options();
  while (v8[1]._os_unfair_lock_opaque)
  {
    os_unfair_lock_unlock(v8);
    MEMORY[0x19401F804](0, 1, 1);
    os_unfair_lock_lock_with_options();
  }
  return os_unfair_lock_lock_with_options();
}

void xzm_statistics_self(unint64_t a1, uint64_t a2)
{
  if (!*(_QWORD *)(a1 + 232))
    mfm_lock();
  xzm_force_lock(a1);
  xzm_statistics(*MEMORY[0x1E0C883F0], a1, _malloc_default_reader_2, a2);
  xzm_force_unlock(a1);
  if (!*(_QWORD *)(a1 + 232))
    mfm_unlock();
}

void _xzm_allocation_slots_do_lock_action(uint64_t a1, int a2)
{
  unsigned int v2;
  unint64_t v5;
  unint64_t i;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  int v13;
  unsigned int v14;
  unint64_t v15;
  char v16;
  unint64_t v17;

  v2 = *(unsigned __int8 *)(a1 + 210);
  if (v2 >= 2)
  {
    LODWORD(v5) = *(unsigned __int8 *)(a1 + 211);
    for (i = 1; i < v2; ++i)
    {
      if ((_DWORD)v5)
      {
        v7 = 0;
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 216) + 88 * i + 48);
        do
        {
          v9 = *(_QWORD *)(a1 + 224) + 32 * (i + v7 * *(unsigned __int8 *)(a1 + 210));
          if (v8 > 0x1000)
          {
            _xzm_do_lock_action((os_unfair_lock_s *)(v9 + 8), a2);
          }
          else
          {
            v10 = *(_QWORD *)v9;
            if (a2)
            {
              do
                v11 = __ldxr((unint64_t *)v9);
              while (__stlxr(v10 & 0xFFFFFFFFFFFFFFFDLL, (unint64_t *)v9));
              if (v11 != v10)
                _xzm_allocation_slots_do_lock_action_cold_2();
            }
            else
            {
              do
              {
                while ((v10 & 1) != 0)
                {
                  if ((v10 & 2) == 0)
                  {
                    do
                    {
                      v17 = __ldxr((unint64_t *)v9);
                      if (v17 != v10)
                      {
                        v12 = 0;
                        __clrex();
                        goto LABEL_11;
                      }
                    }
                    while (__stxr(v10 | 2, (unint64_t *)v9));
                    v12 = 1;
LABEL_11:
                    v10 = v17;
                    if (!v12)
                      continue;
                  }
                  v13 = __ulock_wait();
                  if (v13 < 0 && v13 != -4)
                  {
                    v14 = -v13;
                    if (v14 != 14)
                      _xzm_allocation_slots_do_lock_action_cold_1(v14);
                  }
                  v10 = *(_QWORD *)v9;
                }
                while (1)
                {
                  v15 = __ldxr((unint64_t *)v9);
                  if (v15 != v10)
                    break;
                  if (!__stxr(v10 | 2, (unint64_t *)v9))
                  {
                    v16 = 1;
                    goto LABEL_26;
                  }
                }
                v16 = 0;
                __clrex();
LABEL_26:
                v10 = v15;
              }
              while ((v16 & 1) == 0);
            }
          }
          ++v7;
          v5 = *(unsigned __int8 *)(a1 + 211);
        }
        while (v7 < v5);
        v2 = *(unsigned __int8 *)(a1 + 210);
      }
    }
  }
}

void _xzm_foreach_lock(uint64_t a1, int a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t *ii;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t i;
  uint64_t j;
  unint64_t k;
  uint64_t v22;
  unint64_t m;
  uint64_t n;

  if (!a2)
  {
    os_unfair_lock_lock_with_options();
    os_unfair_lock_lock_with_options();
    _xzm_allocation_slots_do_lock_action(a1, 0);
  }
  if (*(unsigned __int8 *)(a1 + 210) >= 2u)
  {
    v4 = 1;
    do
    {
      v5 = *(_QWORD *)(a1 + 216) + 88 * v4;
      if (*(_QWORD *)(v5 + 48) > 0x1000uLL)
      {
        if (a2)
        {
          for (i = *(_QWORD *)v5; i; i = *(_QWORD *)(i + 16))
            _xzm_do_lock_action((os_unfair_lock_s *)(i + 8), a2);
          for (j = *(_QWORD *)(v5 + 8); j; j = *(_QWORD *)(j + 16))
            _xzm_do_lock_action((os_unfair_lock_s *)(j + 8), a2);
          _xzm_do_lock_action((os_unfair_lock_s *)(v5 + 24), a2);
        }
        else
        {
          while (1)
          {
            os_unfair_lock_lock_with_options();
            for (k = *(_QWORD *)v5; k; k = *(_QWORD *)(k + 16))
              os_unfair_lock_lock_with_options();
            v22 = *(_QWORD *)(v5 + 8);
            if (!v22)
              break;
            while (os_unfair_lock_trylock((os_unfair_lock_t)(v22 + 8)))
            {
              v22 = *(_QWORD *)(v22 + 16);
              if (!v22)
                goto LABEL_34;
            }
            for (m = *(_QWORD *)v5; m; m = *(_QWORD *)(m + 16))
              os_unfair_lock_unlock((os_unfair_lock_t)(m + 8));
            for (n = *(_QWORD *)(v5 + 8); n && n != v22; n = *(_QWORD *)(n + 16))
              os_unfair_lock_unlock((os_unfair_lock_t)(n + 8));
            os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 24));
            MEMORY[0x19401F804](0, 1, 1);
          }
        }
      }
      else
      {
        v6 = (unint64_t *)(v5 + 8);
        v7 = (unint64_t *)(v5 + 16);
        if (a2)
        {
          do
            v8 = __ldxr((unint64_t *)v5);
          while (__stxr(v8 & 0x7FFFFFFFFFFFFFFFLL, (unint64_t *)v5));
          do
            v9 = __ldxr(v6);
          while (__stxr(v9 & 0x7FFFFFFFFFFFFFFFLL, v6));
          do
            v10 = __ldxr(v7);
          while (__stxr(v10 & 0x7FFFFFFFFFFFFFFFLL, v7));
        }
        else
        {
          do
            v11 = __ldxr((unint64_t *)v5);
          while (__stxr(v11 | 0x8000000000000000, (unint64_t *)v5));
          do
            v12 = __ldxr(v6);
          while (__stxr(v12 | 0x8000000000000000, v6));
          do
            v13 = __ldxr(v7);
          while (__stxr(v13 | 0x8000000000000000, v7));
        }
        for (ii = (unint64_t *)(*v7 & 0x7FFFFFFFFFFFLL); ii; ii = (unint64_t *)ii[3])
        {
          v15 = *ii;
          if (a2)
          {
            if ((~(_WORD)v15 & 0x7FE) != 0)
            {
              do
              {
                v16 = __ldxr(ii);
                if (v16 != v15)
                {
                  __clrex();
                  _xzm_foreach_lock_cold_1();
                }
              }
              while (__stxr(v15 & 0xFFFFFFFFBFFFFFFFLL, ii));
            }
          }
          else
          {
            do
            {
              if ((~(_WORD)v15 & 0x7FE) == 0)
                break;
              while (1)
              {
                v17 = __ldxr(ii);
                if (v17 != v15)
                  break;
                if (!__stxr(v15 | 0x40000000, ii))
                {
                  v18 = 1;
                  goto LABEL_25;
                }
              }
              v18 = 0;
              __clrex();
LABEL_25:
              v15 = v17;
            }
            while ((v18 & 1) == 0);
          }
        }
      }
LABEL_34:
      ++v4;
    }
    while (v4 < *(unsigned __int8 *)(a1 + 210));
  }
  if (a2)
  {
    _xzm_allocation_slots_do_lock_action(a1, a2);
    _xzm_do_lock_action((os_unfair_lock_s *)(a1 + 280), a2);
    _xzm_do_lock_action((os_unfair_lock_s *)(a1 + 284), a2);
  }
}

void _xzm_do_lock_action(os_unfair_lock_s *a1, int a2)
{
  switch(a2)
  {
    case 2:
      a1->_os_unfair_lock_opaque = 0;
      break;
    case 1:
      os_unfair_lock_unlock(a1);
      break;
    case 0:
      os_unfair_lock_lock_with_options();
      break;
  }
}

uint64_t mfm_lock()
{
  uint64_t result;

  result = mfm_arena;
  if (mfm_arena)
    return os_unfair_lock_lock_with_options();
  return result;
}

uint64_t xzm_statistics(uint64_t task, unint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4), uint64_t a4)
{
  uint64_t (*v5)(task_name_t, uint64_t, uint64_t, _QWORD *);
  uint64_t is_self;
  uint64_t result;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  if (!a3)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self)
        nanov2_realloc_VARIANT_mp_cold_1(is_self);
    }
    v5 = _malloc_default_reader_2;
  }
  v16 = 0;
  v17 = 0;
  v15 = 0;
  result = _xzm_introspect_map_zone_and_main(task, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD **))v5, &v17, &v16, &v15);
  if (!(_DWORD)result)
  {
    v10 = v15;
    v11 = v16;
    if (v15 == a2)
    {
      mfmi_statistics_task(task, *(_QWORD *)(v16 + 336), v5, (_QWORD *)a4);
      *(_QWORD *)(a4 + 16) = 0;
    }
    v14[0] = MEMORY[0x1E0C87450];
    v14[1] = 0x40000000;
    v14[2] = __xzm_statistics_block_invoke_3;
    v14[3] = &__block_descriptor_tmp_186;
    v14[4] = a4;
    if (v10 == a2)
    {
      v13[0] = MEMORY[0x1E0C87450];
      v13[1] = 0x40000000;
      v13[2] = __xzm_statistics_block_invoke_4;
      v13[3] = &__block_descriptor_tmp_187;
      v13[4] = a4;
      v12 = v13;
    }
    else
    {
      v12 = 0;
    }
    return _xzm_introspect_enumerate(task, (uint64_t (*)(_QWORD))v5, a2, v17, v10, v11, 0, (uint64_t)&__block_literal_global_183, (uint64_t)&__block_literal_global_185, (uint64_t)v14, (uint64_t)v12);
  }
  return result;
}

void xzm_force_unlock(uint64_t a1)
{
  _xzm_foreach_lock(a1, 1);
}

void xzm_force_lock(uint64_t a1)
{
  _xzm_foreach_lock(a1, 0);
}

void mfmi_statistics_task(uint64_t a1, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4), _QWORD *a4)
{
  int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = 0;
  v5 = mfmi_read_zone(a1, a2, a3, &v9);
  bzero(a4, 0x20uLL);
  if (!v5)
  {
    v6 = v9;
    v7 = *(_QWORD *)(v9 + 16);
    *(_DWORD *)a4 = *(_QWORD *)(v9 + 24);
    a4[3] = 0x800000;
    v8 = ((((v7 >> 2) & 0x1FFFFFFFFFFFFFF8) + *MEMORY[0x1E0C88820] + 223) & -*MEMORY[0x1E0C88820])
       + a4[2]
       + ((*MEMORY[0x1E0C88820] + 16 * v7 - 1) & -*MEMORY[0x1E0C88820]);
    a4[1] = 16 * *(unsigned int *)(v6 + 4);
    a4[2] = v8;
  }
}

uint64_t mfmi_read_zone(uint64_t task, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4), _QWORD *a4)
{
  uint64_t (*v5)(task_name_t, uint64_t, uint64_t, _QWORD *);
  uint64_t is_self;

  v5 = a3;
  if (!a3)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self)
        nanov2_realloc_VARIANT_mp_cold_1(is_self);
    }
    v5 = _malloc_default_reader_1;
  }
  return v5(task, a2, 0x800000, a4);
}

uint64_t _xzm_introspect_map_zone_and_main(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, _QWORD **), _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t v10;
  uint64_t result;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  v10 = a2;
  v18 = 0;
  result = a3(a1, a2, 304, &v18);
  if (!(_DWORD)result)
  {
    v13 = v18[25];
    if (v13 < 0x130)
      return 5;
    result = a3(a1, v10, v18[25], &v18);
    if (!(_DWORD)result)
    {
      v17 = 0;
      v14 = v18;
      v15 = v18[29];
      if (v15)
      {
        result = a3(a1, v18[29], 472, &v17);
        if ((_DWORD)result)
          return result;
        v16 = v17[38];
        if (v16 < 0x1D8)
          return 5;
        result = a3(a1, v15, v17[38], &v17);
        if ((_DWORD)result)
          return result;
        v14 = v17;
        if (v16 < v17[38])
          return 5;
        v10 = v15;
      }
      else
      {
        v17 = v18;
        if (v18[38] != v13)
          return 5;
      }
      if (!v18)
        _xzm_introspect_map_zone_and_main_cold_1();
      if (!v10)
        xzm_print_self_cold_1();
      result = 0;
      *a4 = v18;
      *a5 = v14;
      *a6 = v10;
    }
  }
  return result;
}

uint64_t _xzm_introspect_enumerate(unsigned int a1, uint64_t (*a2)(_QWORD), unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  BOOL v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  unsigned int *v27;
  unsigned __int8 *v28;
  unint64_t v29;
  BOOL v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  BOOL v50;
  char v51;
  _QWORD v54[2];
  uint64_t (*v55)(uint64_t, uint64_t);
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(_QWORD);
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unsigned int v64;
  char v65;
  BOOL v66;
  _QWORD *v67;

  v15 = a3 == a5;
  v16 = (_QWORD *)(a6 + 304);
  v17 = (uint64_t *)(a4 + 200);
  if (a3 == a5)
    v17 = (uint64_t *)(a6 + 304);
  v18 = *v17;
  if (a3 != a5)
    goto LABEL_17;
  v19 = *(_QWORD *)(a6 + 400);
  v20 = v19 - a3;
  if (v19 < a3)
    return 5;
  v21 = *(unsigned __int8 *)(a6 + 330);
  result = 5;
  if (__CFADD__(v20, v21 << 6))
    return result;
  if (v20 + (v21 << 6) > *(_QWORD *)(a6 + 304))
    return result;
  v23 = v20 + a6;
  if (!(v20 + a6))
    return result;
  if (!*(_BYTE *)(a6 + 330))
  {
LABEL_17:
    v29 = *(_QWORD *)(a6 + 408);
    v30 = v29 >= a5;
    v31 = v29 - a5;
    if (v30)
    {
      result = 5;
      if (v31 < 0xFFFFFFFFFFFF0000 && v31 + 0x10000 <= *v16)
      {
        v32 = v31 + a6;
        if (v31 + a6)
        {
          v33 = 0;
          v34 = 0;
          v54[0] = MEMORY[0x1E0C87450];
          v55 = ___xzm_introspect_enumerate_block_invoke;
          v56 = &unk_1E2DF99F0;
          v54[1] = 0x40000000;
          v64 = a1;
          v61 = a4;
          v62 = a3;
          v63 = v18;
          v65 = a7;
          v57 = a9;
          v58 = a10;
          v66 = v15;
          v59 = a11;
          v60 = a2;
          while (1)
          {
            v35 = *(unsigned int *)(v32 + v33);
            v36 = v35 << 14;
            if ((_DWORD)v35 && v34 != v36)
            {
              result = v55((uint64_t)v54, v36);
              v34 = v36;
              if ((_DWORD)result)
                break;
            }
            v33 += 4;
            if (v33 == 0x10000)
            {
              v38 = *(_QWORD *)(a6 + 416);
              if (v38 >> 62)
                return 5;
              v39 = *(_QWORD *)(a6 + 424);
              result = 0;
              v30 = v39 >= a5;
              v40 = v39 - a5;
              if (v30 && !__CFADD__(v40, 4 * v38) && v40 + 4 * v38 <= *v16)
              {
                result = 0;
                v41 = v40 + a6;
                if (v40 + a6)
                {
                  if (v38)
                  {
                    v42 = 0;
                    while (1)
                    {
                      v43 = *(unsigned int *)(v41 + 4 * v42);
                      if ((_DWORD)v43)
                        break;
LABEL_48:
                      result = 0;
                      if (++v42 >= v38)
                        return result;
                    }
                    v67 = 0;
                    result = ((uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD **))a2)(a1, v43 << 16, 0x10000, &v67);
                    if (!(_DWORD)result)
                    {
                      v44 = 0;
                      v45 = v67;
                      while (1)
                      {
                        v46 = *(unsigned int *)((char *)v45 + v44);
                        v47 = v46 << 14;
                        if ((_DWORD)v46 && v34 != v47)
                        {
                          result = v55((uint64_t)v54, v47);
                          v34 = v47;
                          if ((_DWORD)result)
                            break;
                        }
                        v44 += 4;
                        if (v44 == 0x10000)
                        {
                          v38 = *(_QWORD *)(a6 + 416);
                          goto LABEL_48;
                        }
                      }
                    }
                  }
                }
              }
              return result;
            }
          }
        }
      }
      return result;
    }
    return 5;
  }
  v25 = 0;
  v50 = a3 == a5;
  v51 = a7;
  v49 = v20 + a6;
  while (1)
  {
    v26 = v23 + (v25 << 6);
    if (*(_QWORD *)(v26 + 24))
      break;
LABEL_16:
    if (++v25 >= (unint64_t)v21)
      goto LABEL_17;
  }
  v27 = (unsigned int *)(v26 + 8);
  v28 = (unsigned __int8 *)(v26 + 4);
  while (1)
  {
    v67 = 0;
    result = a2(a1);
    if ((_DWORD)result)
      return result;
    result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a8 + 16))(a8, v67[1], *v27, *v28);
    if ((_DWORD)result)
      return result;
    if (!*v67)
    {
      LODWORD(v21) = *(unsigned __int8 *)(a6 + 330);
      v15 = v50;
      a7 = v51;
      v23 = v49;
      goto LABEL_16;
    }
  }
}

uint64_t ___xzm_introspect_enumerate_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = 0;
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *))(a1 + 56))(*(unsigned int *)(a1 + 88), a2, 14392, &v14);
  if (!(_DWORD)result)
  {
    v13 = 0;
    result = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t *))(a1 + 56))(*(unsigned int *)(a1 + 88), *(_QWORD *)(v14 + 48), (unint64_t)*(unsigned int *)(v14 + 12) << 14, &v13);
    if (!(_DWORD)result)
    {
      result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      if (!(_DWORD)result)
      {
        v5[0] = MEMORY[0x1E0C87450];
        v5[1] = 0x40000000;
        v5[2] = ___xzm_introspect_enumerate_block_invoke_2;
        v5[3] = &unk_1E2DF99C8;
        v7 = v14;
        v8 = v13;
        v9 = *(_QWORD *)(a1 + 64);
        v10 = *(_OWORD *)(a1 + 72);
        v12 = *(_WORD *)(a1 + 92);
        v11 = a2;
        v6 = *(_OWORD *)(a1 + 40);
        return xzm_segment_group_segment_foreach_span(v14, (uint64_t)v5);
      }
    }
  }
  return result;
}

uint64_t xzm_segment_group_segment_foreach_span(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t result;
  unint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  BOOL v11;

  v3 = a1 + 2104;
  if (*(_BYTE *)(a1 + 20) == 1)
    return (*(uint64_t (**)(uint64_t, unint64_t, _QWORD))(a2 + 16))(a2, v3, *(unsigned int *)(a1 + 2144));
  v5 = v3 + 48 * *(unsigned int *)(a1 + 16);
  if (v3 < v5)
  {
    while (1)
    {
      v6 = *(_BYTE *)(v3 + 32) & 0xF;
      if ((v6 - 5) < 4)
        break;
      if (v6 == 2)
      {
        v7 = 1;
        goto LABEL_6;
      }
      v8 = 0;
      do
      {
        v9 = v3 + v8 + 48;
        v10 = *(_BYTE *)(v3 + v8 + 80) & 0xF;
        v11 = v10 > 7 || ((1 << v10) & 0xE4) == 0;
        v8 += 48;
      }
      while (v11 && v10 != 8 && v9 < v5);
      result = (*(uint64_t (**)(uint64_t, unint64_t, _QWORD))(a2 + 16))(a2, v3, -1431655765 * (v8 >> 4));
      if ((_DWORD)result)
        return result;
      v3 += v8;
LABEL_8:
      if (v3 >= v5)
        return 0;
    }
    v7 = *(unsigned int *)(v3 + 40);
LABEL_6:
    result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(a2 + 16))(a2, v3, v7);
    if ((_DWORD)result)
      return result;
    v3 += 48 * v7;
    goto LABEL_8;
  }
  return 0;
}

uint64_t ___xzm_introspect_enumerate_block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  _QWORD *v30;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _BYTE *v36;
  unint64_t v37;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 *v41;
  uint64_t v42;
  int v43;
  uint64_t *v44;
  _QWORD v45[2050];

  v0 = MEMORY[0x1E0C86820]();
  v3 = v2;
  v4 = (unsigned int *)v1;
  v45[2048] = *MEMORY[0x1E0C874D8];
  v5 = *(_QWORD *)(v0 + 48);
  v6 = 0xAAAAAAAAAAAAC000 * ((unint64_t)(v1 - v5 - 2104) >> 4);
  v7 = (v6 & 0x3FFFFFFFC000) + *(_QWORD *)(v5 + 48);
  v8 = *(_BYTE *)(v1 + 32) & 0xF;
  v9 = v8 > 7 || ((1 << v8) & 0xE4) == 0;
  if (v9 || (v10 = *(_QWORD *)(v0 + 64), *(unsigned __int16 *)(v1 + 34) != *(unsigned __int16 *)(v10 + 208)))
  {
    v14 = *(unsigned __int8 *)(v0 + 97);
    if (*(_BYTE *)(v0 + 97))
    {
      if (!*(_WORD *)(v1 + 34))
        return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, unint64_t))(*(_QWORD *)(v0 + 40) + 16))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 88), v5, v1, v2, (v6 & 0x3FFFFFFFC000) + *(_QWORD *)(v5 + 48));
      return 0;
    }
    return v14;
  }
  v11 = *(_QWORD *)(v0 + 56);
  if (v8 != 5 && v8 != 2)
  {
    v16 = 0;
    goto LABEL_21;
  }
  v12 = *(_QWORD *)(v0 + 72);
  v13 = *(_QWORD *)(v10 + 216) + 88 * *(unsigned __int8 *)(v1 + 33);
  if (v12 <= v13)
  {
    v17 = v13 - v12;
    v18 = __CFADD__(v13 - v12, 88);
    v19 = v13 - v12 + 88;
    v20 = v18;
    v14 = 5;
    v16 = v17 + v10;
    if (!(v17 + v10) || (v20 & 1) != 0 || v19 > *(_QWORD *)(v0 + 80))
      return v14;
LABEL_21:
    if (!*(_BYTE *)(v0 + 96))
      return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 16))(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 88), v5, v1, v2, v7, v16, 0, 0);
    v21 = *(_QWORD *)(v0 + 88);
    v22 = *(_QWORD *)(v0 + 32);
    if (v8 == 2 || v8 == 5)
    {
      bzero(v45, 0x4000uLL);
      v23 = *(unsigned int *)(v16 + 68);
      v14 = 5;
      if (v23 > 0x400)
        return v14;
      v24 = *(_QWORD *)(v16 + 48);
      v25 = v24;
      if (((unint64_t)v3 << 14) / v24 != v23)
        return v14;
      if (v8 == 5)
      {
        if ((_DWORD)v23)
        {
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v29 = *v4;
          do
          {
            if (((v29 >> v27) & 1) == 0)
            {
              v30 = &v45[2 * v28];
              *v30 = v7 + v26;
              v30[1] = v24;
              ++v28;
            }
            ++v27;
            v26 += v24;
          }
          while (v23 != v27);
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, _QWORD *, _QWORD))(v22 + 16))(v22, v21, v5, v4, v3, v7, v16, v45, v28);
        }
LABEL_56:
        LODWORD(v28) = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, _QWORD *, _QWORD))(v22 + 16))(v22, v21, v5, v4, v3, v7, v16, v45, v28);
      }
      v32 = *(_QWORD *)v4;
      if ((~*v4 & 0x7FELL) != 0)
      {
        v33 = *(_QWORD *)v4 & 0x7FFLL;
        if (v33 > 0x3FF)
        {
          v34 = 0;
        }
        else
        {
          v34 = 0;
          v35 = v24 >> 4;
          do
          {
            if (v33 % v35)
              break;
            v36 = &v45[2 * (v33 / v35)];
            if (*v36)
              break;
            ++v34;
            *v36 = 1;
            v33 = *(_QWORD *)(v6 + v11 + 16 * v33 + 8) & 0x7FFLL;
          }
          while (v33 < 0x400);
        }
        v37 = (v32 >> 11) & 0x7FF;
        if (v34 >= v37 || v37 > v23)
          v39 = 0;
        else
          v39 = v34 - v37;
        v40 = v39 + v23;
        if (v40)
        {
          v28 = 0;
          v41 = (unsigned __int8 *)v45;
          v42 = v7;
          do
          {
            v43 = *v41;
            v41 += 16;
            if (!v43)
            {
              v44 = &v45[2 * v28];
              *v44 = v42;
              v44[1] = v25;
              ++v28;
            }
            v42 += v25;
            --v40;
          }
          while (v40);
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, _QWORD *, _QWORD))(v22 + 16))(v22, v21, v5, v4, v3, v7, v16, v45, v28);
        }
        goto LABEL_56;
      }
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(v22 + 16))(v22, v21, v5, v4, v3, v7, v16, 0, 0);
    }
    else
    {
      v45[0] = (v6 & 0x3FFFFFFFC000) + *(_QWORD *)(v5 + 48);
      v45[1] = (unint64_t)v2 << 14;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD *, uint64_t))(v22 + 16))(v22, v21, v5, v1, v2, v7, 0, v45, 1);
    }
  }
  return 5;
}

uint64_t __xzm_statistics_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v7 = (unint64_t)a5 << 14;
  v8 = *(_BYTE *)(a4 + 32) & 0xF;
  if (v8 == 5)
  {
    v10 = *(unsigned int *)(a4 + 4);
LABEL_8:
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v9 += v10;
    v11 = *(_QWORD *)(v9 + 8) + *(_QWORD *)(a7 + 48) * v10;
    goto LABEL_9;
  }
  if (v8 != 2)
  {
    v9 = *(_QWORD *)(a1 + 32);
    ++*(_DWORD *)v9;
    v11 = *(_QWORD *)(v9 + 8) + v7;
LABEL_9:
    *(_QWORD *)(v9 + 8) = v11;
    goto LABEL_10;
  }
  if ((~*(_DWORD *)a4 & 0x7FE) != 0)
  {
    v10 = *(_DWORD *)(a7 + 68) - ((*(_DWORD *)a4 >> 11) & 0x7FFu);
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(a1 + 32);
LABEL_10:
  *(_QWORD *)(v9 + 24) += v7;
  return 0;
}

uint64_t __xzm_statistics_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) += (unint64_t)a5 << 14;
  return 0;
}

uint64_t __xzm_statistics_block_invoke_2()
{
  return 0;
}

uint64_t __xzm_statistics_block_invoke()
{
  return 0;
}

void *reallocarray_DARWIN_EXTSN(void *a1, unint64_t a2, unint64_t a3)
{
  if (is_mul_ok(a2, a3))
    return j__realloc(a1, a2 * a3);
  **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  return 0;
}

void *__cdecl malloc_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size)
{
  unint64_t v3;

  return (void *)_malloc_zone_realloc((uint64_t)zone, (uint64_t)ptr, size, (v3 >> 2));
}

uint64_t default_zone_malloc_claimed_address(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = lite_zone;
  if (!lite_zone)
    v2 = *(_QWORD *)malloc_zones;
  return malloc_zone_claimed_address(v2, a2);
}

uint64_t malloc_zone_claimed_address(uint64_t a1, uint64_t a2)
{
  uint64_t (*v4)(uint64_t, uint64_t);

  if (!a2)
    return 0;
  if (malloc_check_start)
    internal_check();
  if (*(_DWORD *)(a1 + 104) >= 0xAu && (v4 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 136)) != 0)
    return v4(a1, a2);
  else
    return 1;
}

BOOL szone_claimed_address(uint64_t a1, unint64_t a2)
{
  return tiny_claimed_address(a1 + 16512, a2)
      || small_claimed_address(a1 + 17280, a2)
      || large_claimed_address(a1, a2) != 0;
}

BOOL tiny_claimed_address(uint64_t a1, unint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _BOOL4 v10;

  v2 = *(uint64_t **)(a1 + 24);
  v3 = *v2;
  if (*v2)
  {
    v4 = a2 & 0xFFFFFFFFFFF00000;
    v5 = v2[2];
    v6 = (0x9E3779B97F4A7C55 * (a2 >> 20)) >> -*((_BYTE *)v2 + 8);
    v7 = v6;
    do
    {
      v8 = *(_QWORD *)(v5 + 8 * v7);
      if (!v8)
        break;
      if (v8 == v4)
      {
        v10 = v4 + 16512 <= a2 && v4 + 0x100000 > a2;
        return v4 && v10;
      }
      if (v7 + 1 == v3)
        v7 = 0;
      else
        ++v7;
    }
    while (v7 != v6);
  }
  return 0;
}

BOOL small_claimed_address(uint64_t a1, unint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;
  unint64_t v10;

  v2 = *(uint64_t **)(a1 + 24);
  v3 = *v2;
  if (*v2)
  {
    v4 = a2 & 0xFFFFFFFFFF800000;
    v5 = v2[2];
    v6 = (0x9E3779B97F4A7C55 * ((a2 & 0xFFFFFFFFFF800000) >> 20)) >> -*((_BYTE *)v2 + 8);
    v7 = v6;
    do
    {
      v8 = *(_QWORD *)(v5 + 8 * v7);
      if (!v8)
        break;
      if (v8 == v4)
        goto LABEL_10;
      if (v7 + 1 == v3)
        v7 = 0;
      else
        ++v7;
    }
    while (v7 != v6);
  }
  v4 = 0;
LABEL_10:
  if (v4)
    v9 = v4 + 33280 > a2;
  else
    v9 = 1;
  v10 = v4 + 0x800000;
  return !v9 && v10 > a2;
}

uint64_t large_claimed_address(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;

  v4 = (os_unfair_lock_s *)(a1 + 18816);
  os_unfair_lock_lock_with_options();
  v5 = *(unsigned int *)(a1 + 18824);
  if ((_DWORD)v5)
  {
    v6 = -*MEMORY[0x1E0C88820] & a2;
    v7 = *(_QWORD *)(a1 + 18832);
    v8 = (v6 >> *MEMORY[0x1E0C88818]) % v5;
    while (1)
    {
      v9 = *(_QWORD *)(v7 + 24 * v8);
      if (v9 == v6 || v9 <= v6 && *(_QWORD *)(v7 + 24 * v8 + 8) + v9 > v6)
        break;
      if (!v8)
        v8 = *(_DWORD *)(a1 + 18824);
      if (--v8 == ((v6 >> *MEMORY[0x1E0C88818]) % v5))
        goto LABEL_9;
    }
    v10 = 1;
  }
  else
  {
LABEL_9:
    v10 = 0;
  }
  os_unfair_lock_unlock(v4);
  return v10;
}

void tiny_finalize_region(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  unsigned int tiny_previous_free_msize;
  unsigned int v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  int v17;

  v3 = *(_QWORD *)(a2 + 2128);
  if (v3)
  {
    v5 = *(_QWORD *)(a2 + 2144) - v3 + 0x100000;
    v6 = v3 >> 4;
    v7 = v5 & 0xFFFFFFFFFFF00000 | 0x4080;
    v8 = v5 - v7;
    v9 = (v5 - v7) & 0xFFFF0;
    v10 = (v5 - v7) >> 4;
    if (v9 == 1032048
      || (v11 = (v5 & 0xFFFFFFFFFFF00000) + 4 * (((v10 + 1) >> 4) & 0xFFE),
          *(_DWORD *)(v11 + 40) &= ~(1 << (v10 + 1)),
          v9))
    {
      tiny_previous_free_msize = get_tiny_previous_free_msize(v5);
      if (tiny_previous_free_msize <= (unsigned __int16)v10)
      {
        v13 = tiny_previous_free_msize;
        v14 = ((v10 - tiny_previous_free_msize) >> 4) & 0xFFE;
        v15 = 1 << (v10 - tiny_previous_free_msize);
        if ((*(_DWORD *)((v5 & 0xFFFFFFFFFFF00000) + 0x28 + 4 * v14) & v15) != 0
          && (*(_DWORD *)((v5 & 0xFFFFFFFFFFF00000) + 0x2C + 4 * v14) & v15) == 0)
        {
          v16 = v7 + 16 * (unsigned __int16)(v10 - tiny_previous_free_msize);
          if (v16 + 16 >= (v16 & 0xFFFFFFFFFFF00000 | 0xFBF80) + 16512
            || ((*(_DWORD *)(((v16 + 16) & 0xFFFFFFFFFFF00000 | ((((v16 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8)
                           + 0x28) >> (((((_DWORD)v16 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
          {
            v17 = 1;
          }
          else
          {
            v17 = *(unsigned __int16 *)(v16 + 16);
          }
          if (v17 == tiny_previous_free_msize && v16)
          {
            *(int8x8_t *)((v5 & 0xFFFFFFFFFFF00000) + 0x28 + ((v8 >> 6) & 0x3FF8)) = vand_s8(*(int8x8_t *)((v5 & 0xFFFFFFFFFFF00000) + 0x28 + ((v8 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(~(1 << v10)));
            tiny_free_list_remove_ptr(a1, a2, v16, tiny_previous_free_msize);
            if (v13 >= 2 && !malloc_zero_policy)
              *(_WORD *)(v16 + 16 * v13 - 2) = 0;
            LOWORD(v6) = v13 + v6;
            v5 = v16;
          }
        }
      }
    }
    tiny_free_list_add_ptr(a1, a2, v5, (unsigned __int16)v6);
    *(_QWORD *)(a2 + 2128) = 0;
  }
  *(_QWORD *)(a2 + 2144) = 0;
}

void nanov2_configure_once()
{
  uint64_t v0;
  int32x4_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  _DWORD *v7;

  v0 = 0;
  v1 = 0uLL;
  do
    v1 = vaddq_s32(vshlq_n_s32((int32x4_t)block_units_by_size_class[v0++], 6uLL), v1);
  while (v0 != 4);
  if (vaddvq_s32(v1) != 4096)
    nanov2_realloc_VARIANT_mp_cold_1();
  first_block_offset_by_size_class[0] = 1;
  v2 = LODWORD(block_units_by_size_class[0]) << 6;
  last_block_offset_by_size_class[0] = (LODWORD(block_units_by_size_class[0]) << 6) - 1;
  v3 = 1u;
  do
  {
    first_block_offset_by_size_class[v3] = v2;
    v2 += *(_DWORD *)((char *)block_units_by_size_class + v3 * 4) << 6;
    last_block_offset_by_size_class[v3++] = v2 - 1;
  }
  while (v3 != 16);
  if (v2 != 4096)
    nanov2_realloc_VARIANT_mp_cold_1();
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = *((_DWORD *)block_units_by_size_class + v4);
    if (v6 >= 1)
    {
      v7 = (_DWORD *)((char *)&ptr_offset_to_size_class + 4 * v5);
      v5 += v6;
      do
      {
        *v7++ = v4;
        --v6;
      }
      while (v6);
    }
    ++v4;
  }
  while (v4 != 16);
  if (v5 != 64)
    nanov2_realloc_VARIANT_mp_cold_1();
}

const char *__cdecl malloc_get_zone_name(malloc_zone_t *zone)
{
  return zone->zone_name;
}

uint64_t xzm_main_malloc_zone_create(unsigned int a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  const char *v6;
  const char *v7;
  size_t v8;
  uint64_t v9;
  char v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  char v20;
  const char *v21;
  unint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  const char *v25;
  unint64_t v26;
  BOOL v27;
  const char *v29;
  unint64_t v30;
  const char *v31;
  unint64_t v32;
  const char *v33;
  unint64_t v34;
  char v35;
  int v36;
  int v37;
  unsigned __int8 v38;
  char v39;
  const char *v40;
  unint64_t v41;
  uint64_t v42;
  kern_return_t v43;
  const char *v44;
  unint64_t v45;
  _BOOL4 v46;
  unsigned __int16 v47;
  unsigned __int16 v48;
  _BOOL4 v49;
  _BOOL4 v50;
  const char *v51;
  unint64_t v52;
  const char *v53;
  unint64_t v54;
  int v55;
  int v56;
  const char *v57;
  unint64_t v58;
  const char *v59;
  unint64_t v60;
  const char *v61;
  unint64_t v62;
  const char *v63;
  unint64_t v64;
  unsigned int v65;
  const char *v66;
  unint64_t v67;
  unsigned __int16 v68;
  _BOOL4 v69;
  int v70;
  const char *v71;
  unsigned int v72;
  _BOOL4 v73;
  const char *v74;
  unint64_t v75;
  const char *v76;
  unint64_t v77;
  const char *v78;
  char v79;
  char v80;
  char v81;
  char v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  mach_vm_address_t plat;
  uint64_t v99;
  unint64_t v100;
  char v101;
  char v102;
  char v103;
  char v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  unint64_t v109;
  unint64_t v110;
  uint64_t v111;
  char v112;
  _DWORD *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _DWORD *v123;
  uint64_t v124;
  char v126;
  char v127;
  BOOL v128;
  char v129;
  char v130;
  char v131;
  uint64_t v132;
  char v133;
  uint64_t denom;
  unint64_t numer;
  int v136;
  unsigned int v137;
  _BOOL4 v138;
  uint64_t v139;
  BOOL v140;
  unint64_t v141;
  unsigned int v142;
  char v143;
  int v144;
  char v145;
  uint64_t v146;
  uint64_t v147;
  int v148;
  unsigned __int16 v149;
  _BOOL4 v150;
  size_t v151;
  uint64_t v152;
  mach_timebase_info info;
  __int128 __buf;
  __int128 v155;
  char __dst[256];
  uint64_t v157;

  v157 = *MEMORY[0x1E0C874D8];
  __buf = 0uLL;
  v6 = (const char *)_simple_getenv();
  if (v6)
  {
    v7 = v6;
    v8 = strlen(v6);
    if (v8 <= 0x1F)
      xzm_main_malloc_zone_create_cold_7(v8);
    v9 = 0;
    v10 = 1;
    do
    {
      v11 = v10;
      memcpy(__dst, &v7[16 * v9], 0x10uLL);
      __dst[16] = 0;
      v12 = strtoull(__dst, 0, 16);
      v13 = v12;
      if (v12 == -1)
      {
        if (*__error() == 34)
          goto LABEL_243;
      }
      else if (!v12 && *__error() == 22)
      {
LABEL_243:
        xzm_main_malloc_zone_create_cold_8();
      }
      v10 = 0;
      *((_QWORD *)&__buf + v9) = v13;
      v9 = 1;
    }
    while ((v11 & 1) != 0);
  }
  else
  {
    if ((malloc_process_identity - 1) <= 0x1E)
      xzm_main_malloc_zone_create_cold_1();
    arc4random_buf(&__buf, 0x10uLL);
  }
  if (malloc_process_identity)
    v14 = (char *)_xzm_process_configs[malloc_process_identity];
  else
    v14 = 0;
  v15 = malloc_common_value_for_key_copy(a4, "xzone_ptr_buckets", __dst, 0x100uLL);
  if (!v15)
    goto LABEL_21;
  info = 0;
  v16 = malloc_common_convert_to_long(v15, &info);
  v17 = v16;
  if (*(_BYTE *)info.numer || v16 < 1 || v16 >= 5)
  {
    malloc_report(3u, (uint64_t)"Invalid xzone_ptr_buckets value %ld - ignored.\n");
LABEL_21:
    v17 = 0;
  }
  if ((malloc_process_identity - 1) >= 0x1F)
  {
    v18 = (const char *)_simple_getenv();
    if (!v18)
      goto LABEL_29;
    v19 = strtol(v18, 0, 10);
    v17 = v19;
    if (v19 == 1)
    {
      v20 = 0;
      goto LABEL_31;
    }
    if (v19 != 0xFFFF && v19 != 2)
    {
LABEL_29:
      v17 = 2;
      v20 = 2;
      goto LABEL_31;
    }
    v17 = 1;
  }
  v20 = 1;
LABEL_31:
  if (malloc_internal_security_policy)
  {
    v21 = (const char *)_simple_getenv();
    if (v21)
    {
      v22 = strtol(v21, 0, 10);
      if (v22 < 5)
        v17 = v22;
    }
  }
  if (v17)
  {
    if (v17 >= 5)
      xzm_main_malloc_zone_create_cold_6();
    v23 = 40 * v17 + 81;
    if (v14)
      goto LABEL_38;
LABEL_40:
    v24 = 0;
    goto LABEL_41;
  }
  v23 = 201;
  if (!v14)
    goto LABEL_40;
LABEL_38:
  v24 = v14[1] != 0;
LABEL_41:
  if (malloc_internal_security_policy)
  {
    v25 = (const char *)_simple_getenv();
    if (v25)
    {
      v26 = strtol(v25, 0, 10);
      if (v26 < 2)
        v24 = v26 != 0;
    }
  }
  v141 = v17;
  if (v14)
    v27 = v14[2] == 0;
  else
    v27 = 1;
  v140 = v27;
  if (_malloc_engaged_nano == 2 && (malloc_process_identity - 32) < 0xFFFFFFE1)
    v20 = 2;
  if (v14 && *v14 != 3)
    v20 = *v14;
  v29 = malloc_common_value_for_key_copy(a4, "malloc_xzone_slot_config", __dst, 0x100uLL);
  if (v29)
  {
    v30 = strtol(v29, 0, 10);
    if (v30 < 3)
      v20 = v30;
  }
  v138 = v24;
  if (!malloc_internal_security_policy)
    goto LABEL_68;
  v31 = (const char *)_simple_getenv();
  if (v31)
  {
    v32 = strtol(v31, 0, 10);
    if (v32 < 3)
      v20 = v32;
  }
  if (!malloc_internal_security_policy)
  {
LABEL_68:
    v126 = 0;
LABEL_69:
    v36 = 1024;
    v142 = 256;
    v37 = 64;
    goto LABEL_70;
  }
  v33 = (const char *)_simple_getenv();
  if (v33)
  {
    v34 = strtol(v33, 0, 10);
    if (v34 >= 3)
      v35 = 0;
    else
      v35 = v34;
  }
  else
  {
    v35 = 0;
  }
  v126 = v35;
  if (!malloc_internal_security_policy)
    goto LABEL_69;
  v53 = (const char *)_simple_getenv();
  if (v53)
  {
    v54 = strtol(v53, 0, 10);
    if (v54 >= 0xFFFFFFFF)
      v55 = 256;
    else
      v55 = v54;
    v142 = v55;
    if (v54 >= 0xFFFFFFFF)
      v56 = 64;
    else
      v56 = v54;
    v37 = v56;
  }
  else
  {
    v142 = 256;
    v37 = 64;
  }
  if (!malloc_internal_security_policy)
    goto LABEL_139;
  v61 = (const char *)_simple_getenv();
  if (v61)
  {
    v62 = strtol(v61, 0, 10);
    if (v62 < 0xFFFFFFFF)
      v37 = v62;
  }
  if (!malloc_internal_security_policy)
    goto LABEL_139;
  v63 = (const char *)_simple_getenv();
  if (v63)
  {
    v64 = strtol(v63, 0, 10);
    if (v64 >= 0xFFFFFFFF)
      v65 = v142;
    else
      v65 = v64;
    v142 = v65;
  }
  if (malloc_internal_security_policy)
  {
    v66 = (const char *)_simple_getenv();
    v36 = 1024;
    if (v66)
    {
      v67 = strtol(v66, 0, 10);
      if (v67 >= 0xFFFFFFFF)
        v36 = 1024;
      else
        v36 = v67;
    }
  }
  else
  {
LABEL_139:
    v36 = 1024;
  }
LABEL_70:
  if (v20)
  {
    if (v20 == 2)
      goto LABEL_75;
    if (v20 != 1)
      xzm_main_malloc_zone_create_cold_2();
    v38 = ncpuclusters;
    if (ncpuclusters <= 1)
    {
LABEL_75:
      v38 = logical_ncpus;
      v39 = 2;
    }
    else
    {
      v39 = 1;
    }
    v145 = v39;
  }
  else
  {
    v145 = v20;
    v38 = 1;
  }
  v146 = 1000000;
  if (malloc_internal_security_policy)
  {
    v40 = (const char *)_simple_getenv();
    if (v40)
    {
      v41 = strtol(v40, 0, 10);
      v42 = 1000000;
      if (v41 < 0xFFFFFFFF)
        v42 = 1000000 * v41;
      v146 = v42;
    }
  }
  info = 0;
  v43 = mach_timebase_info(&info);
  if (v43)
    xzm_main_malloc_zone_create_cold_5(v43);
  denom = info.denom;
  numer = info.numer;
  v137 = a1;
  v144 = v37;
  if (!malloc_internal_security_policy)
  {
    v48 = 0;
    v49 = 0;
    v50 = 0;
    goto LABEL_141;
  }
  v44 = (const char *)_simple_getenv();
  if (v44)
  {
    v45 = strtol(v44, 0, 10);
    if (v45 <= 1)
    {
      v46 = v45 == 1;
      v47 = 16 * v46;
      goto LABEL_91;
    }
    malloc_report(3u, (uint64_t)"MallocLargeCache must be 0 or 1.\n");
  }
  v47 = 0;
  v46 = 0;
LABEL_91:
  if (_malloc_engaged_nano == 2)
    v48 = v47;
  else
    v48 = 0;
  v50 = _malloc_engaged_nano == 2 && v46;
  if (malloc_internal_security_policy)
  {
    v51 = (const char *)_simple_getenv();
    if (v51)
    {
      v52 = strtol(v51, 0, 10);
      if (v52 >> 16)
        malloc_report(3u, (uint64_t)"xzm: unsupported value for MallocXzoneHugeCacheSize (%ld)");
      else
        v48 = v52;
    }
  }
  if (!malloc_internal_security_policy)
  {
    v49 = 0;
    goto LABEL_141;
  }
  v57 = (const char *)_simple_getenv();
  if (!v57)
    goto LABEL_118;
  v58 = strtol(v57, 0, 10);
  if (v58 > 1)
  {
    malloc_report(3u, (uint64_t)"MallocDeferredReclaim must be one of 0,1 - got %ld\n");
LABEL_118:
    v49 = 0;
    goto LABEL_119;
  }
  v49 = v58 == 1;
  v50 = v49;
LABEL_119:
  if (malloc_internal_security_policy)
  {
    v59 = (const char *)_simple_getenv();
    if (v59)
    {
      v60 = strtol(v59, 0, 10);
      if (v60 > 1)
        malloc_report(3u, (uint64_t)"MallocDeferredReclaim must be one of 0,1 - got %ld\n");
      else
        v50 = v60 == 1;
    }
  }
LABEL_141:
  if ((malloc_process_identity - 32) >= 0xFFFFFFE1)
    v68 = 0;
  else
    v68 = v48;
  v69 = (malloc_process_identity - 32) < 0xFFFFFFE1 && v49;
  v150 = v69;
  v70 = (malloc_process_identity - 32) < 0xFFFFFFE1 && v50;
  v149 = v68;
  if (v68 && !v70)
  {
    v71 = "Huge cache requires deferred reclamation for large.\n";
LABEL_155:
    malloc_report(3u, (uint64_t)v71);
    v70 = 1;
    goto LABEL_156;
  }
  if (((!v150 | v70) & 1) == 0)
  {
    v71 = "Deferred reclamation cannot be used for xzones without large\n";
    goto LABEL_155;
  }
LABEL_156:
  v148 = v70;
  v72 = malloc_process_identity - 1;
  v73 = (malloc_process_identity - 1) < 0x1F;
  if (malloc_internal_security_policy)
  {
    v74 = (const char *)_simple_getenv();
    if (v74)
    {
      v73 = v72 < 0x1F;
      v75 = strtol(v74, 0, 10);
      if (v75 < 2)
        v73 = v75 != 0;
    }
  }
  v76 = malloc_common_value_for_key_copy(a4, "xzone_guard_pages", __dst, 0x100uLL);
  v136 = v36;
  if (v76)
  {
    v77 = strtol(v76, 0, 10);
    if (v77 > 1)
    {
      malloc_report(3u, (uint64_t)"%s must be 0 or 1.\n");
      if (!v73)
      {
LABEL_170:
        v143 = 0;
        LOBYTE(v73) = 0;
        goto LABEL_171;
      }
    }
    else if (!v77)
    {
      goto LABEL_170;
    }
  }
  else if (!v73)
  {
    v143 = 0;
LABEL_171:
    v79 = 0;
    v80 = 0;
    v81 = 0;
    v82 = 0;
    goto LABEL_172;
  }
  if (!malloc_internal_security_policy)
  {
    v79 = 8;
    v73 = 1;
LABEL_201:
    v80 = 64;
LABEL_202:
    v81 = 3;
LABEL_203:
    v129 = v81;
    v130 = v80;
    v131 = v79;
    v127 = 32;
    v128 = v73;
    v143 = 1;
    goto LABEL_204;
  }
  v78 = (const char *)_simple_getenv();
  if (v78)
    v73 = strtol(v78, 0, 10) != 0;
  else
    v73 = 1;
  if (!malloc_internal_security_policy)
  {
    v79 = 8;
    goto LABEL_201;
  }
  v86 = (const char *)_simple_getenv();
  v79 = 8;
  if (v86)
  {
    v87 = strtol(v86, 0, 10);
    if (v87 <= 0)
      v79 = 8;
    else
      v79 = v87;
  }
  if (!malloc_internal_security_policy)
    goto LABEL_201;
  v88 = (const char *)_simple_getenv();
  v80 = 64;
  if (v88)
  {
    v89 = strtol(v88, 0, 10);
    if (v89 <= 0)
      v80 = 64;
    else
      v80 = v89;
  }
  if (!malloc_internal_security_policy)
    goto LABEL_202;
  v90 = (const char *)_simple_getenv();
  v81 = 3;
  if (v90)
  {
    v91 = strtol(v90, 0, 10);
    if (v91 <= 0)
      v81 = 3;
    else
      v81 = v91;
  }
  if (!malloc_internal_security_policy)
    goto LABEL_203;
  v92 = (const char *)_simple_getenv();
  LOBYTE(v73) = v73;
  v82 = 32;
  if (v92)
  {
    v93 = strtol(v92, 0, 10);
    if (v93 <= 0)
      v82 = 32;
    else
      v82 = v93;
  }
  v143 = 1;
LABEL_172:
  v130 = v80;
  v131 = v79;
  v128 = v73;
  v129 = v81;
  v127 = v82;
  if (malloc_internal_security_policy)
  {
    v83 = (const char *)_simple_getenv();
    if (v83)
    {
      v84 = strtol(v83, 0, 10);
      if (v84)
      {
        if (v84 == 1)
        {
          v85 = 2;
          goto LABEL_205;
        }
        malloc_report(3u, (uint64_t)"MallocXzoneDataOnly must be 0 or 1.\n");
      }
    }
  }
LABEL_204:
  v85 = 4;
LABEL_205:
  v94 = 88 * v23 + 472;
  v133 = v38;
  v95 = v94 + 32 * v23 * v38;
  v96 = v95 + 400 + 16 * v23;
  v97 = v96 + 112 + 496 * v85;
  v132 = v97 + 65792;
  plat = mvm_allocate_plat(0, v97 + 65792, 0, 1, 0, 1);
  if (!plat)
    xzm_main_malloc_zone_create_cold_3();
  v99 = plat;
  v100 = v146 * denom;
  if (v138)
    v101 = 2;
  else
    v101 = 0;
  if (v150)
    v102 = 4;
  else
    v102 = 0;
  v103 = v102 | v101;
  if (v148)
    v104 = 8;
  else
    v104 = 0;
  v105 = v103 | v104;
  v139 = plat + 472;
  v147 = plat + v94;
  v155 = __buf;
  v106 = v100 / numer;
  v107 = mfm_zone_address();
  *(_OWORD *)v99 = 0u;
  *(_OWORD *)(v99 + 16) = 0u;
  *(_OWORD *)(v99 + 32) = 0u;
  *(_OWORD *)(v99 + 48) = 0u;
  *(_OWORD *)(v99 + 64) = 0u;
  *(_OWORD *)(v99 + 80) = 0u;
  *(_OWORD *)(v99 + 96) = 0u;
  *(_OWORD *)(v99 + 112) = 0u;
  *(_OWORD *)(v99 + 128) = 0u;
  *(_OWORD *)(v99 + 144) = 0u;
  *(_OWORD *)(v99 + 160) = 0u;
  *(_OWORD *)(v99 + 176) = 0u;
  *(_OWORD *)(v99 + 192) = 0u;
  *(_OWORD *)(v99 + 208) = 0u;
  *(_OWORD *)(v99 + 224) = 0u;
  *(_OWORD *)(v99 + 240) = 0u;
  *(_OWORD *)(v99 + 256) = 0u;
  *(_OWORD *)(v99 + 272) = 0u;
  *(_OWORD *)(v99 + 288) = 0u;
  *(_QWORD *)(v99 + 304) = v132;
  *(_OWORD *)(v99 + 312) = v155;
  *(_BYTE *)(v99 + 328) = v105;
  *(_WORD *)(v99 + 329) = 1026;
  *(_DWORD *)(v99 + 331) = 0;
  *(_BYTE *)(v99 + 335) = 0;
  *(_QWORD *)(v99 + 336) = v107;
  *(_BYTE *)(v99 + 344) = v85;
  *(_BYTE *)(v99 + 345) = 40;
  *(_DWORD *)(v99 + 346) = 0;
  *(_WORD *)(v99 + 350) = 0;
  *(_QWORD *)(v99 + 352) = v95 + v99;
  *(_QWORD *)(v99 + 360) = v95 + v99 + 320;
  *(_QWORD *)(v99 + 368) = v95 + v99 + 360;
  *(_QWORD *)(v99 + 376) = v95 + 400 + v99;
  *(_QWORD *)(v99 + 384) = v96 + v99;
  *(_QWORD *)(v99 + 392) = v96 + 112 + v99;
  *(_QWORD *)(v99 + 400) = v97 + v99;
  *(_QWORD *)(v99 + 408) = v97 + v99 + 256;
  *(_QWORD *)(v99 + 416) = 0;
  *(_QWORD *)(v99 + 424) = 0;
  *(_DWORD *)(v99 + 432) = 0;
  *(_WORD *)(v99 + 436) = 1;
  *(_QWORD *)(v99 + 444) = 0;
  *(_QWORD *)(v99 + 438) = 0;
  *(_BYTE *)(v99 + 452) = v143;
  *(_BYTE *)(v99 + 453) = v128;
  *(_BYTE *)(v99 + 454) = v131;
  *(_BYTE *)(v99 + 455) = v130;
  *(_BYTE *)(v99 + 456) = v129;
  *(_BYTE *)(v99 + 457) = v127;
  *(_QWORD *)(v99 + 464) = 0;
  *(_QWORD *)(v99 + 458) = 0;
  _xzm_initialize_const_zone_data(v99, v132, 1, v23, v133, v139, v147, 0, v145, v144, v142, v136, v106, v137);
  v108 = v148;
  if (v149)
    v108 = 1;
  if ((v150 | v108) == 1)
  {
    v109 = 0x1ECCD9000;
    v110 = v141;
    if (!xzm_reclaim_init(v99))
    {
      v149 = 0;
      *(_BYTE *)(v99 + 328) &= 0xF3u;
    }
  }
  else
  {
    v149 = 0;
    v109 = 0x1ECCD9000uLL;
    v110 = v141;
  }
  memcpy(*(void **)(v99 + 352), &_xzm_bin_sizes, 0x140uLL);
  v111 = 0;
  v112 = v110 + 2;
  if (!v110)
    v112 = 5;
  do
    *(_BYTE *)(*(_QWORD *)(v99 + 360) + v111++) = v112;
  while (v111 != 40);
  v113 = (_DWORD *)(*(_QWORD *)(v99 + 376) + 8);
  do
  {
    *v113 = 0;
    v113 += 4;
    --v23;
  }
  while (v23);
  v114 = *(_QWORD *)(v99 + 384);
  *(_BYTE *)v114 = 0;
  *(_QWORD *)(v114 + 8) = v99;
  *(_DWORD *)(v114 + 16) = 0;
  *(_BYTE *)(v114 + 56) = 1;
  *(_QWORD *)(v114 + 64) = v99;
  *(_DWORD *)(v114 + 72) = 0;
  if (v140)
    xzm_main_malloc_zone_init_range_groups(v99);
  v115 = 0;
  v116 = 40;
  do
  {
    v117 = *(_QWORD *)(v99 + 392);
    v118 = v117 + 496 * v115;
    *(_BYTE *)v118 = v115;
    *(_DWORD *)(v118 + 4) = 0;
    *(_DWORD *)(v118 + 8) = 0;
    if (v115 < 2u)
    {
      v120 = v117 + 496 * v115;
      *(_QWORD *)(v120 + 16) = *(_QWORD *)(v99 + 384);
      *(_QWORD *)(v120 + 24) = v99;
      if (v115 == 1)
      {
        v121 = v117 + 496 * v115;
        *(_DWORD *)(v121 + 480) = v149;
        *(_QWORD *)(v121 + 488) = 0;
        *(_QWORD *)(v121 + 464) = 0;
        *(_QWORD *)(v121 + 472) = v121 + 464;
        *(_QWORD *)(v121 + 484) = 0x3FFFFLL;
      }
    }
    else
    {
      if (v115 - 2 >= 2)
        _xzm_segment_group_find_and_allocate_chunk_cold_1(v115);
      v119 = v117 + 496 * v115;
      *(_QWORD *)(v119 + 16) = *(_QWORD *)(v99 + 384) + 56;
      *(_QWORD *)(v119 + 24) = v99;
    }
    v122 = 0;
    v123 = (_DWORD *)(v117 + v116);
    do
    {
      *v123 = _xzm_span_queue_slice_counts[v122];
      v123 += 4;
      ++v122;
    }
    while (v122 != 27);
    ++v115;
    v116 += 496;
  }
  while (v115 != v85);
  v124 = *(_QWORD *)(v99 + 400) + 192;
  xzm_metapool_init(v124, 3, 0x4000, 16, 16, 0);
  xzm_metapool_init(*(_QWORD *)(v99 + 400), 0, 0x80000, 0x4000, 0x4000, v124);
  xzm_metapool_init(*(_QWORD *)(v99 + 400) + 64, 1, 0x40000, 0x10000, 0x10000, v124);
  xzm_metapool_init(*(_QWORD *)(v99 + 400) + 128, 2, 0x4000, 16, 16, 0);
  _xzm_initialize_xzone_data(v99, v126, (char *)(v99 + 452), *(unsigned __int8 *)(v99 + 344) == 2);
  if (*(_BYTE *)(v109 + 1484) && _simple_getenv())
  {
    v151 = 8;
    v152 = 0;
    sysctlbyname("vm.reclaim_max_threshold", &v152, &v151, 0, 0);
    malloc_report(6u, (uint64_t)"XZM Config:\n\tData Only: %d\n\tGuards Enabled: %d\n\tScribble: %d\n\tDefer Large: %d\n\tDefer Xzones: %d\n\tHuge cache size: %d\n\tReclaim Max Threshold: %lli%s\n\tRanges (ptr addr/size/data addr/size): 0x%llx/%lu/0x%llx/%lu\n\tInitial Slot Config: %s\n\tMax Slot Config: %s\n\tSlot Upgrade Thresholds: %d/%d, %d/%d\n\tPointer Bucket Count: %lu\n");
  }
  return v99;
}

uint64_t xzm_metapool_init(uint64_t result, char a2, int a3, int a4, int a5, uint64_t a6)
{
  *(_DWORD *)result = 0;
  *(_BYTE *)(result + 4) = a2;
  *(_DWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 12) = a4;
  *(_DWORD *)(result + 16) = a5;
  *(_QWORD *)(result + 32) = 0;
  *(_QWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 24) = 0;
  *(_DWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = a6;
  return result;
}

void xzm_main_malloc_zone_init_range_groups(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  unint64_t v20;
  size_t v21;
  vm_map_t *v24;
  kern_return_t v25;
  const char *v26;
  int v27;
  kern_return_t v28;
  _QWORD *v29;
  char *__endptr;
  size_t address;
  char __str[8];
  unint64_t v33;
  size_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C874D8];
  address = 255;
  if (sysctlbyname("vm.malloc_ranges", __str, &address, 0, 0) == -1)
  {
    v27 = *__error();
    if (v27 != 2)
    {
      if (v27 != 1)
        xzm_main_malloc_zone_init_range_groups_cold_1();
      v26 = "sysctlbyname(\"vm.malloc_ranges\") denied\n";
      goto LABEL_41;
    }
  }
  else
  {
    __str[address] = 0;
    __endptr = __str;
    v2 = strtoull(__str, &__endptr, 16);
    ++__endptr;
    v3 = strtoull(__endptr, &__endptr, 16);
    ++__endptr;
    v4 = strtoull(__endptr, &__endptr, 16);
    ++__endptr;
    v5 = strtoull(__endptr, &__endptr, 16);
    if (!v2)
      xzm_main_malloc_zone_init_range_groups_cold_2();
    if (v3 < v2)
      xzm_main_malloc_zone_init_range_groups_cold_3();
    v6 = v4 - v3;
    if (v4 < v3)
      xzm_main_malloc_zone_init_range_groups_cold_4();
    if (v5 < v4)
      xzm_main_malloc_zone_init_range_groups_cold_5();
    v7 = (v2 + 0x1FFFFFF) & 0xFFFFFFFFFE000000;
    v8 = v3 - 0x300000000;
    if (v3 < 0x300000000)
      v8 = 0;
    v9 = v8 & 0xFFFFFFFFFE000000;
    v19 = v9 >= v7;
    v10 = v9 - v7;
    if (v19)
      v11 = v10;
    else
      v11 = 0;
    v12 = v4 + 0x100000000;
    v13 = (v4 & 0xFFFFFFFFFE000000) + 0x102000000;
    if ((v4 & 0x1FFFFFF) == 0)
      v13 = v4 + 0x100000000;
    v14 = v5 - 0x200000000;
    if (v5 < 0x200000000)
      v14 = 0;
    v15 = v14 & 0xFFFFFFFFFE000000;
    v19 = v15 >= v13;
    v16 = v15 - v13;
    if (!v19)
      v16 = 0;
    if ((v16 & 0x1FFFFFF) != 0)
      xzm_main_malloc_zone_init_range_groups_cold_10();
    v17 = v16 + v11;
    if (!v17)
      xzm_main_malloc_zone_init_range_groups_cold_6();
    v18 = qword_1ECCD9620 % (v17 >> 25);
    v19 = v18 >= v11 >> 25;
    if (v18 >= v11 >> 25)
      v20 = v11 >> 25;
    else
      v20 = 0;
    if (v19)
      v7 = v13;
    v21 = v7 + ((v18 - v20) << 25);
    if ((v21 < v2 || v21 + 0x300000000 > v3) && (v21 < v12 || v21 + 0x200000000 > v5))
      xzm_main_malloc_zone_init_range_groups_cold_7();
    *(_QWORD *)__str = 0x202000000000000;
    v33 = v7 + ((v18 - v20) << 25);
    v34 = v21 + 0x200000000;
    v24 = (vm_map_t *)MEMORY[0x1E0C883F0];
    v25 = mach_vm_range_create(*MEMORY[0x1E0C883F0], MACH_VM_RANGE_FLAVOR_V1, (mach_vm_range_recipes_raw_t)__str, 0x18u);
    if (v25)
    {
      if (v25 != 46)
      {
        if (v25 != 53)
          xzm_main_malloc_zone_init_range_groups_cold_8(v25);
        v26 = "mach_vm_range_create() denied\n";
LABEL_41:
        malloc_report(3u, (uint64_t)v26);
      }
    }
    else
    {
      address = v21;
      v28 = mach_vm_map(*v24, &address, 0x200000000uLL, 0, 0x4000, 0, 0, 0, 0, 0, 1u);
      if (v28)
        xzm_main_malloc_zone_init_range_groups_cold_9(v28);
      *(_BYTE *)(a1 + 328) |= 1u;
      v29 = *(_QWORD **)(a1 + 384);
      v29[10] = v21;
      v29[11] = 0x200000000;
      v29[12] = v21;
      v29[13] = 0x200000000;
      v29[3] = v3;
      v29[4] = v6;
    }
  }
}

uint64_t mfm_zone_address()
{
  return mfm_arena;
}

uint64_t tiny_free_reattach_region(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  int v11;
  unsigned int *v12;
  unint64_t v13;
  unsigned int v14;
  unint64_t v15;
  unsigned int v16;

  v3 = a3 + 16512;
  v4 = *(unsigned int *)(a3 + 16);
  if ((unint64_t)(a3 + 16512) <= 0xFFFFFFFFFFF0407FLL)
  {
    v7 = a3 + 0x100000;
    do
    {
      v8 = v3 & 0xFFFFFFFFFFF00000 | 0x28;
      v9 = v3 & 0xFFFFFFFFFFF00000 | 0x4080;
      v10 = ((v3 - v9) >> 8) & 0xFFE;
      v11 = 1 << ((v3 - v9) >> 4);
      v12 = (unsigned int *)(v8 + 4 * v10);
      v13 = *v12;
      if ((v13 & v11) == 0)
        break;
      if ((*(_DWORD *)(v8 + 4 * (v10 | 1)) & v11) != 0)
      {
        v14 = ((v3 - v9) >> 4) & 0x1F;
        v15 = ((unint64_t)v12[2] << (32 - v14)) | (v13 >> v14);
        if (v14)
          v15 |= (unint64_t)v12[4] << -(char)v14;
        if (v15 < 2)
          return v4;
        v16 = __clz(__rbit64(v15 >> 1)) + 1;
      }
      else
      {
        if (v3 + 16 >= v9 + 1032064
          || ((*(_DWORD *)(((v3 + 16) & 0xFFFFFFFFFFF00000 | ((((v3 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v3 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          v16 = 1;
        }
        else
        {
          v16 = *(unsigned __int16 *)(v3 + 16);
          if (!*(_WORD *)(v3 + 16))
            return v4;
        }
        tiny_free_list_add_ptr(a1, a2, v3, v16);
      }
      v3 += 16 * v16;
    }
    while (v3 < v7);
  }
  return v4;
}

unint64_t tiny_free_try_depot_unmap_no_lock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;

  if (*(_DWORD *)(a3 + 16))
    return 0;
  if (*(int *)(a3 + 28) > 0)
    return 0;
  v5 = *(_DWORD *)(a2 + 2172);
  if (v5 < recirc_retained_regions)
    return 0;
  v7 = *(_QWORD *)a3;
  v8 = *(_QWORD **)(a3 + 8);
  if (*(_QWORD *)a3)
  {
    *(_QWORD *)(v7 + 8) = v8;
    v8 = *(_QWORD **)(a3 + 8);
  }
  else
  {
    *(_QWORD *)(a2 + 2176) = v8;
  }
  if (!v8)
    v8 = (_QWORD *)(a2 + 2184);
  *v8 = v7;
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_DWORD *)(a2 + 2172) = v5 - 1;
  v9 = a3 & 0xFFFFFFFFFFF00000;
  if (tiny_free_detach_region(a1, a2, a3 & 0xFFFFFFFFFFF00000))
  {
    malloc_zone_error(*(_DWORD *)(a1 + 620), 1, (uint64_t)"tiny_free_try_depot_unmap_no_lock objects_in_use not zero: %d\n");
    return 0;
  }
  if (!rack_region_remove(a1, a3 & 0xFFFFFFFFFFF00000, a3))
    return 0;
  *(_QWORD *)(a2 + 2160) -= 1032064;
  return v9;
}

uint64_t tiny_free_detach_region(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  int v11;
  unsigned int *v12;
  unint64_t v13;
  unsigned int v14;
  unint64_t v15;
  unsigned int v16;

  v4 = a3 + 16512;
  if ((unint64_t)(a3 + 16512) <= 0xFFFFFFFFFFF0407FLL)
  {
    v7 = a3 + 0x100000;
    do
    {
      v8 = v4 & 0xFFFFFFFFFFF00000 | 0x28;
      v9 = v4 & 0xFFFFFFFFFFF00000 | 0x4080;
      v10 = ((v4 - v9) >> 8) & 0xFFE;
      v11 = 1 << ((v4 - v9) >> 4);
      v12 = (unsigned int *)(v8 + 4 * v10);
      v13 = *v12;
      if ((v13 & v11) == 0)
        break;
      if ((*(_DWORD *)(v8 + 4 * (v10 | 1)) & v11) != 0)
      {
        v14 = ((v4 - v9) >> 4) & 0x1F;
        v15 = ((unint64_t)v12[2] << (32 - v14)) | (v13 >> v14);
        if (v14)
          v15 |= (unint64_t)v12[4] << -(char)v14;
        if (v15 < 2)
          return *(unsigned int *)(a3 + 20);
        v16 = __clz(__rbit64(v15 >> 1)) + 1;
      }
      else
      {
        if (v4 + 16 >= v9 + 1032064
          || ((*(_DWORD *)(((v4 + 16) & 0xFFFFFFFFFFF00000 | ((((v4 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v4 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          v16 = 1;
        }
        else
        {
          v16 = *(unsigned __int16 *)(v4 + 16);
          if (!*(_WORD *)(v4 + 16))
            return *(unsigned int *)(a3 + 20);
        }
        tiny_free_list_remove_ptr(a1, a2, v4, v16);
      }
      v4 += 16 * v16;
    }
    while (v4 < v7);
  }
  return *(unsigned int *)(a3 + 20);
}

BOOL rack_region_remove(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  _BOOL8 v13;

  os_unfair_lock_lock_with_options();
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD **)v6;
  if (*(_QWORD *)v6)
  {
    v8 = *(_QWORD *)(v6 + 16);
    v9 = (0x9E3779B97F4A7C55 * (a2 >> 20)) >> -*(_BYTE *)(v6 + 8);
    v10 = v9;
    while (1)
    {
      v11 = *(_QWORD *)(v8 + 8 * v10);
      if (!v11)
      {
LABEL_9:
        v7 = 0;
        goto LABEL_11;
      }
      if (v11 == a2)
        break;
      if ((_QWORD *)(v10 + 1) == v7)
        v10 = 0;
      else
        ++v10;
      if (v10 == v9)
        goto LABEL_9;
    }
    v7 = (_QWORD *)(v8 + 8 * v10);
  }
LABEL_11:
  v12 = *(_DWORD *)(a3 + 36);
  v13 = (v12 & 1) == 0;
  if ((v12 & 1) != 0)
    *(_DWORD *)(a3 + 36) = v12 | 2;
  if (v7)
  {
    *v7 = -1;
    OSAtomicIncrement64((OSAtomic_int64_aligned64_t *)(a1 + 16));
  }
  else
  {
    malloc_zone_error(*(_DWORD *)(a1 + 620), 1, (uint64_t)"tiny_free_try_depot_unmap_no_lock hash lookup failed: %p\n");
    v13 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)a1);
  return v13;
}

void _malloc_fork_parent()
{
  void (*v0)(void);
  unint64_t v1;
  unint64_t v2;

  v0 = (void (*)(void))xmmword_1EE228068;
  if (initial_xzone_zone)
    xzm_force_unlock_global_state(initial_xzone_zone);
  if (v0)
    v0();
  if (malloc_num_zones)
  {
    v1 = 0;
    do
    {
      v2 = v1 + 1;
      (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)malloc_zones + v1) + 96) + 48))();
      v1 = v2;
    }
    while (v2 < malloc_num_zones);
  }
  mfm_unlock();
  os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
}

void szone_force_unlock(uint64_t a1)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (int *)(a1 + 17120);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 18816));
  if ((v2[192] & 0x80000000) == 0)
  {
    v3 = -1;
    v4 = -2560;
    do
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 17904) + v4));
      ++v3;
      v4 += 2560;
    }
    while (v3 < v2[192]);
  }
  if ((*v2 & 0x80000000) == 0)
  {
    v5 = -1;
    v6 = -2560;
    do
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 17136) + v6));
      ++v5;
      v6 += 2560;
    }
    while (v5 < *v2);
  }
}

void mfm_unlock()
{
  if (mfm_arena)
    os_unfair_lock_unlock((os_unfair_lock_t)mfm_arena);
}

malloc_zone_t *malloc_default_purgeable_zone(void)
{
  if (malloc_default_purgeable_zone_pred != -1)
    _os_once();
  return (malloc_zone_t *)default_purgeable_zone;
}

uint64_t szone_pressure_relief()
{
  if (malloc_tracing_enabled)
    szone_pressure_relief_cold_1();
  return 0;
}

size_t malloc_zone_pressure_relief(malloc_zone_t *zone, size_t goal)
{
  uint64_t (*pressure_relief)(void);
  size_t v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t (*v11)(void);

  if (zone)
  {
    if (zone->version >= 8)
    {
      pressure_relief = (uint64_t (*)(void))zone->pressure_relief;
      if (pressure_relief)
        return pressure_relief();
    }
    return 0;
  }
  else
  {
    os_unfair_lock_lock_with_options();
    v6 = malloc_num_zones;
    if (malloc_num_zones)
    {
      v5 = 0;
      v7 = 0;
      do
      {
        v8 = v7;
        v9 = v7 + 1;
        while (1)
        {
          v10 = *((_QWORD *)malloc_zones + v8);
          if (*(_DWORD *)(v10 + 104) > 7u)
          {
            v11 = *(uint64_t (**)(void))(v10 + 128);
            if (v11)
              break;
          }
          ++v8;
          ++v9;
          if (v8 >= v6)
            goto LABEL_18;
        }
        if (goal && goal <= v5)
          break;
        v7 = v8 + 1;
        v5 += v11();
        v6 = malloc_num_zones;
      }
      while (malloc_num_zones > v9);
    }
    else
    {
      v5 = 0;
    }
LABEL_18:
    os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
  }
  return v5;
}

uint64_t _malloc_type_zone_calloc_outlined(malloc_zone_t *a1, size_t a2, size_t a3, unint64_t a4)
{
  unint64_t StatusReg;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v5 = *(_QWORD *)(StatusReg + 904);
  if (a4 <= 1)
    v6 = 1;
  else
    v6 = a4;
  *(_QWORD *)(StatusReg + 904) = v6;
  if (malloc_interposition_compat)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
    result = (uint64_t)j__malloc_zone_calloc(a1, a2, a3);
  else
    result = _malloc_zone_calloc((uint64_t)a1, a2, a3, 0);
  *(_QWORD *)(StatusReg + 904) = v5;
  return result;
}

uint64_t _malloc_zone_calloc_instrumented_or_legacy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  char v5;
  unint64_t StatusReg;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  v5 = a4;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v10 = *(_QWORD *)(StatusReg + 904);
  v11 = v10;
  if (!v10)
  {
    v11 = (v4 >> 2);
    *(_QWORD *)(StatusReg + 904) = v11;
  }
  v12 = malloc_tracing_enabled;
  if (malloc_tracing_enabled)
    kdebug_trace();
  if (malloc_check_start)
    internal_check();
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(a1, a2, a3, a4, v11);
  if (malloc_logger)
    malloc_logger(74, a1, a3 * a2, 0, v13, 0);
  if (malloc_simple_stack_logging == 1)
  {
    malloc_report(0x325u, (uint64_t)"calloc (%p/%llu*%llu): ");
    if (!v12)
    {
LABEL_11:
      if (v10)
        goto LABEL_12;
      goto LABEL_16;
    }
  }
  else if (!v12)
  {
    goto LABEL_11;
  }
  kdebug_trace();
  if (v10)
  {
LABEL_12:
    if (v13)
      return v13;
    goto LABEL_18;
  }
LABEL_16:
  *(_QWORD *)(StatusReg + 904) = 0;
  if (v13)
    return v13;
LABEL_18:
  if ((v5 & 1) != 0)
    **(_DWORD **)(StatusReg + 8) = 12;
  return v13;
}

unint64_t purgeable_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 == 1 || is_mul_ok(a2, a3) && (a3 *= a2, a3 <= malloc_absolute_max_size))
  {
    if (a3 <= 0x3C00)
      a1 = *(_QWORD *)(a1 + 20456);
    return szone_calloc(a1, 1uLL, a3);
  }
  else
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
    return 0;
  }
}

void _malloc_create_purgeable_zone()
{
  BOOL v0;
  uint64_t v1;
  malloc_zone_t *purgeable_zone;

  if (initial_xzone_zone)
    v0 = purgeable_zone_use_xzm == 0;
  else
    v0 = 1;
  if (v0)
  {
    v1 = initial_scalable_zone;
    if (!initial_scalable_zone)
    {
      initial_scalable_zone = create_scalable_zone(0, malloc_debug_flags);
      malloc_set_zone_name((malloc_zone_t *)initial_scalable_zone, "DefaultScalableMallocZone");
      malloc_zone_register((malloc_zone_t *)initial_scalable_zone);
      v1 = initial_scalable_zone;
    }
    purgeable_zone = (malloc_zone_t *)create_purgeable_zone(0, v1, malloc_debug_flags);
  }
  else
  {
    purgeable_zone = (malloc_zone_t *)xzm_malloc_zone_create(malloc_debug_flags | 0x80u, initial_xzone_zone);
  }
  default_purgeable_zone = (uint64_t)purgeable_zone;
  malloc_zone_register(purgeable_zone);
  malloc_set_zone_name((malloc_zone_t *)default_purgeable_zone, "DefaultPurgeableMallocZone");
}

mach_vm_address_t create_purgeable_zone(uint64_t a1, uint64_t a2, int a3)
{
  mach_vm_address_t pages;
  mach_vm_address_t v6;
  int *v7;
  unint64_t v8;
  int v9;
  int32_t v10;
  _BOOL4 v12;

  pages = mvm_allocate_pages((*MEMORY[0x1E0C88820] + 20479) & -*MEMORY[0x1E0C88820], 0, 0x40000000, 1);
  v6 = pages;
  if (pages)
  {
    v7 = (int *)(pages + 16392);
    v8 = MEMORY[0xFFFFFC038];
    v9 = a3 | 0x80;
    rack_init(pages + 16512, 1, 0, a3 | 0x80);
    rack_init(v6 + 17280, 2, 0, a3 | 0x80);
    if (large_cache_enabled)
    {
      *(_QWORD *)(v6 + 20424) = v8 >> 10;
      v10 = NSVersionOfLinkTimeLibrary("System");
      v12 = v10 != -1 && v10 < 7340032;
      *(_DWORD *)(v6 + 20408) = v12;
    }
    *(_DWORD *)(v6 + 104) = 11;
    *(_QWORD *)(v6 + 16) = purgeable_size;
    *(_QWORD *)(v6 + 24) = purgeable_malloc;
    *(_QWORD *)(v6 + 32) = purgeable_calloc;
    *(_QWORD *)(v6 + 40) = purgeable_valloc;
    *(_QWORD *)(v6 + 48) = purgeable_free;
    *(_QWORD *)(v6 + 56) = purgeable_realloc;
    *(_QWORD *)(v6 + 64) = purgeable_destroy;
    *(_QWORD *)(v6 + 80) = purgeable_batch_malloc;
    *(_QWORD *)(v6 + 88) = purgeable_batch_free;
    *(_QWORD *)(v6 + 96) = &purgeable_introspect;
    *(_QWORD *)(v6 + 112) = purgeable_memalign;
    *(_QWORD *)(v6 + 120) = purgeable_free_definite_size;
    *(_QWORD *)(v6 + 128) = purgeable_pressure_relief;
    *(_QWORD *)(v6 + 136) = purgeable_claimed_address;
    *(_QWORD *)v6 = 0;
    *(_QWORD *)(v6 + 8) = 0;
    mprotect((void *)v6, 0xC8uLL, 1);
    *v7 = v9;
    if ((a3 & 7) != 0)
    {
      if ((a3 & 4) == 0)
      {
        malloc_report(6u, (uint64_t)"purgeable zone does not support guard pages\n");
        v9 = *v7;
      }
      *v7 = v9 & 0xFFFFFFF8;
    }
    *(_DWORD *)(v6 + 18816) = 0;
    *(_QWORD *)(v6 + 20456) = a2;
  }
  return v6;
}

uint64_t xzm_segment_group_try_realloc_huge_chunk(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  mach_vm_address_t v14;
  mach_vm_address_t v15;
  unint64_t v16;
  mach_vm_size_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _DWORD *v27;
  uint64_t v28;
  unint64_t v29;
  mach_vm_address_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  os_unfair_lock_s *v38;

  v8 = *(unsigned int *)(a4 + 40);
  if (a5 <= v8)
  {
    if (v8 <= a5)
      return 1;
    v12 = *(unsigned int *)(a3 + 12);
    if ((_DWORD)v12 == a5)
      return 1;
    v13 = *(_QWORD *)(a3 + 48);
    v14 = v13 + (v12 << 14);
    v15 = v13 + ((unint64_t)a5 << 14);
    if (v15 >= v14)
      return 1;
    v16 = (unint64_t)a5 << 14;
    v17 = v14 - v15;
    v18 = (v15 + 0x3FFFFF) & 0xFFFFFFFFFFC00000;
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 400);
    v20 = (_QWORD *)xzm_metapool_alloc(v19);
    v21 = v14 > v18;
    v22 = v14 - v18;
    if (v21)
    {
      v23 = *(_QWORD *)(a3 + 48) + ((unint64_t)*(unsigned int *)(a3 + 12) << 14);
      if (v23 > v18)
      {
        v24 = *(_QWORD *)(a1 + 24);
        v25 = (v15 + 0x3FFFFF) & 0xFFFFFFFFFFC00000;
        do
        {
          v26 = v25 >> 22;
          if (v25 >> 36)
            v26 = 0x4000;
          if (v26 >> 14)
            v27 = 0;
          else
            v27 = (_DWORD *)(*(_QWORD *)(v24 + 408) + 4 * v26);
          *v27 = 0;
          v25 += 0x400000;
        }
        while (v25 < v23);
      }
      v38 = (os_unfair_lock_s *)(a1 + 488);
      os_unfair_lock_lock_with_options();
      if (v22 > 0x200000 && *(unsigned __int16 *)(a1 + 482) < *(unsigned __int16 *)(a1 + 480))
      {
        _xzm_segment_group_init_segment(a1, (unint64_t)v20, (v15 + 0x3FFFFF) & 0xFFFFFFFFFFC00000, v22, 1, 0);
        _xzm_segment_group_cache_mark_free(a1, v20);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
        if (v15 >= v18)
        {
LABEL_43:
          v28 = 1;
          _xzm_segment_group_init_segment(a1, a3, *(_QWORD *)(a3 + 48), v16, 1, 0);
          return v28;
        }
        v17 -= v22;
LABEL_42:
        mvm_deallocate_plat(v15, v17, 0);
        goto LABEL_43;
      }
    }
    else
    {
      v38 = (os_unfair_lock_s *)(a1 + 488);
      os_unfair_lock_lock_with_options();
    }
    os_unfair_lock_unlock(v38);
    xzm_metapool_free(v19, v20);
    goto LABEL_42;
  }
  v10 = *(_BYTE *)(a4 + 32) & 0xF;
  if ((v10 - 6) < 2)
  {
    v11 = v8 << 14;
  }
  else if (v10 == 2)
  {
    v11 = 0x4000;
  }
  else
  {
    if (v10 != 5)
      xzm_chunk_mark_free_cold_1(v10);
    v11 = 0x10000;
  }
  v29 = ((0xAAAAAAAAAAAAC000 * (((unint64_t)(a4 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
      + *(_QWORD *)((a4 & 0xFFFFFFFFFFFFC000) + 0x30);
  v30 = v29 + v11;
  v31 = a5 - v8;
  v32 = (v29 + v11 + 0x3FFFFF) & 0xFFFFFFFFFFC00000;
  v33 = v29 + v11 + (v31 << 14);
  if (v32 < v33)
  {
    v34 = v32;
    do
    {
      v35 = v34 >> 22;
      if (v34 >> 36)
        v35 = 0x4000;
      if (!(v35 >> 14))
      {
        v36 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 408);
        if (v36)
        {
          if (*(_DWORD *)(v36 + 4 * v35))
            return 0;
        }
      }
      v34 += 0x400000;
    }
    while (v34 < v33);
  }
  if (!mvm_allocate_plat(v30, (unint64_t)v31 << 14, 0, 0, 0, 6))
    return 0;
  v28 = 1;
  _xzm_segment_group_init_segment(a1, a3, *(_QWORD *)(a3 + 48), (unint64_t)a5 << 14, 1, 0);
  if (v29 + ((unint64_t)a5 << 14) > v32)
  {
    if (*(_QWORD *)(a2 + 232))
      v37 = *(_QWORD *)(a2 + 232);
    else
      v37 = a2;
    _xzm_segment_table_allocated_at(v37, v32, a3);
  }
  return v28;
}

uint64_t xzm_reclaim_mark_free(uint64_t a1)
{
  os_unfair_lock_s *v2;
  unsigned __int16 v3;
  uint64_t v4;
  int v5;

  v2 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock_with_options();
  do
  {
    if (!*(_WORD *)(a1 + 40))
    {
      v4 = mach_vm_reclaim_mark_free();
      goto LABEL_7;
    }
    v3 = *(_WORD *)(a1 + 40) - 1;
    *(_WORD *)(a1 + 40) = v3;
    v4 = *(_QWORD *)(a1 + 40 + 8 * v3 + 8);
    v5 = mach_vm_reclaim_mark_free_with_id();
  }
  while (v5 == 5);
  if (v5)
    xzm_reclaim_mark_free_cold_1(v5);
LABEL_7:
  os_unfair_lock_unlock(v2);
  return v4;
}

uint64_t xzm_chunk_mark_free(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 232);
  if (!v2)
    v2 = a1;
  v3 = *(_QWORD *)(v2 + 464);
  v4 = *(_BYTE *)(a2 + 32) & 0xF;
  if ((v4 - 6) >= 2 && v4 != 2 && v4 != 5)
    xzm_chunk_mark_free_cold_1(*(_BYTE *)(a2 + 32) & 0xF);
  v5 = (a2 & 0xFFFFFFFFFFFFC000)
     + 0xFFFFFFFD55555558 * (((unint64_t)(a2 & 0x3FFF) - 2104) >> 4);
  result = xzm_reclaim_mark_free(v3);
  *(_QWORD *)(v5 + 56) = result;
  return result;
}

mach_vm_address_t szone_valloc(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  int v5;

  if (a2 <= 0x800000)
    return szone_memalign(a1, *MEMORY[0x1E0C88820], a2);
  v3 = *MEMORY[0x1E0C887F8];
  if (*MEMORY[0x1E0C887F8] <= *MEMORY[0x1E0C88810])
    v3 = *MEMORY[0x1E0C88810];
  v4 = (v3 + a2) & ~v3;
  v5 = *MEMORY[0x1E0C88800];
  if (*MEMORY[0x1E0C88800] <= *MEMORY[0x1E0C88818])
    LOBYTE(v5) = *MEMORY[0x1E0C88818];
  return large_malloc(a1, v4 >> v5, 0, 0);
}

uint64_t purgeable_statistics(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)a2 = *(_DWORD *)(result + 18820);
  v2 = *(_QWORD *)(result + 18840);
  *(_QWORD *)(a2 + 16) = v2;
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 8) = v2;
  return result;
}

void purgeable_free(uint64_t a1, unint64_t a2)
{
  os_unfair_lock_s *v4;
  _QWORD *v5;

  v4 = (os_unfair_lock_s *)(a1 + 18816);
  os_unfair_lock_lock_with_options();
  v5 = large_entry_for_pointer_no_lock(a1, a2);
  os_unfair_lock_unlock(v4);
  if (v5)
    free_large(a1, a2, 0);
  else
    szone_free(*(_QWORD *)(a1 + 20456), a2);
}

uint64_t pgm_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint8x8_t v6;
  unint64_t StatusReg;
  int v12;
  uint64_t v13;
  uint32_t v14;
  unint64_t v15;
  uint64_t v16;

  v6 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v6.i16[0] = vaddlv_u8(v6);
  if (*MEMORY[0x1E0C88820] < a2 || a2 < 8 || v6.u32[0] != 1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 112))();
  if (*MEMORY[0x1E0C88820] < a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 112))();
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v12 = *(_DWORD *)(StatusReg + 880);
  if (v12 == -1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 112))();
  if (v12)
  {
    v14 = v12 - 1;
  }
  else
  {
    v13 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v13)
      nanov2_realloc_VARIANT_mp_cold_1(v13);
    v14 = arc4random_uniform(v13);
  }
  *(_QWORD *)(StatusReg + 880) = v14;
  if (v14)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 112))();
  v15 = a2 <= 0x10 ? 16 : a2;
  os_unfair_lock_lock_with_options();
  v16 = allocate(a1, a3, v15);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  if (!v16)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 112))();
  else
    return v16;
}

uint64_t nanov2_valloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 40))();
}

uint64_t large_entry_free_no_lock_cold_1()
{
  return kdebug_trace();
}

uint64_t _malloc_type_calloc_outlined(size_t __count, size_t __size, unint64_t a3)
{
  unint64_t StatusReg;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v4 = *(_QWORD *)(StatusReg + 904);
  if (a3 <= 1)
    v5 = 1;
  else
    v5 = a3;
  *(_QWORD *)(StatusReg + 904) = v5;
  if (malloc_interposition_compat)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
    result = (uint64_t)j__calloc(__count, __size);
  else
    result = _malloc_zone_calloc((uint64_t)default_zone, __count, __size, 1);
  *(_QWORD *)(StatusReg + 904) = v4;
  return result;
}

uint64_t nanov2_size_VARIANT_mp(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unsigned int v4;
  unint64_t v5;

  if ((a2 & 0xFFFFFFFFE000000FLL) != 0x300000000)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 16))();
  if (*(_QWORD *)(a1 + 28720) > a2 || *(_QWORD *)(a1 + 28728) < a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 16))();
  v3 = ptr_offset_to_size_class[((a2 >> 14) & 0xFFF ^ *(_DWORD *)(a1 + 28680)) >> 6];
  v4 = *(_DWORD *)((*(_QWORD *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000)
                 + 4 * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F)) & 0x7FF;
  if (v4 > 0x7FD)
  {
    if (v4 - 2046 < 2)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 16))();
    goto LABEL_13;
  }
  if (!v4 || v4 == 2042)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 16))();
  if (v4 != 2044)
  {
LABEL_13:
    if (((*(_DWORD *)((*(_QWORD *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000)
                     + 4 * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F)) >> 11) & 0x3FF) == slots_by_size_class[v3] - 1)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 16))();
  }
  v5 = 16 * (int)v3 + 16;
  if ((a2 & 0x3FFF) == (a2 & 0x3FFF) / v5 * v5 && (_DWORD)v5 && (*(_QWORD *)(a1 + 28696) ^ *(_QWORD *)a2) != a2)
    return v5;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 16))();
}

_QWORD *nanov2_malloc_VARIANT_mp(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int *v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  int v11;
  unsigned int *v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  unsigned int v22;
  char v23;
  int v25;
  char v26;

  if (a2 <= 0x10)
    v2 = 16;
  else
    v2 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v2 > 0x100)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 24))();
  v3 = (v2 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v4) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
      v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    LODWORD(v4) = v4 % nano_common_max_magazines;
  }
  v5 = v4 & 0x3F;
  v6 = a1 + (v3 << 9) + 8 * (v4 & 0x3F);
  v7 = *(unsigned int **)(v6 + 0x4000);
  if (v7)
  {
    v8 = 0;
    v9 = *v7;
    v10 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
    v11 = 16 * v3 + 16;
    while (1)
    {
      v12 = 0;
      if ((v9 & 0x80000000) == 0)
      {
        v14 = 0;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0);
      }
      v13 = v9 & 0x7FF;
      v14 = 0;
      if (v13 == 2044)
        return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0);
      v15 = (v9 >> 11) & 0x3FF;
      v16 = (v9 + 2095104) & 0x1FF800 | (v9 + 0x200000) & 0x7FE00000;
      if (v13 == 2043 || v13 == 2045)
      {
        if (v15)
          v17 = 2043;
        else
          v17 = 2044;
        v18 = v16 | v17 | 0x80000000;
        while (1)
        {
          v19 = __ldxr(v7);
          if (v19 != v9)
            break;
          if (!__stxr(v18, v7))
          {
            v25 = slots_by_size_class[v3] + ~v15;
            v26 = 1;
            goto LABEL_37;
          }
        }
        __clrex();
      }
      else
      {
        if (!v8)
          v8 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
        v25 = v13 - 1;
        v14 = v8 + v25 * v11;
        if (v15)
          v20 = *(_WORD *)(v14 + 8);
        else
          v20 = 2044;
        v21 = v16 | v20 & 0x7FF | 0x80000000;
        while (1)
        {
          v22 = __ldxr(v7);
          if (v22 != v9)
            break;
          if (!__stxr(v21, v7))
          {
            v23 = 1;
            goto LABEL_31;
          }
        }
        v23 = 0;
        __clrex();
LABEL_31:
        if ((v23 & 1) != 0)
        {
          if (v14)
            goto LABEL_45;
          v26 = 0;
LABEL_37:
          if (!v8)
            v8 = v10;
          v14 = v8 + v25 * v11;
          if ((v26 & 1) == 0)
          {
LABEL_45:
            if ((*(_QWORD *)(a1 + 28696) ^ *(_QWORD *)v14) != v14)
              goto LABEL_41;
          }
          else if (!v14)
          {
LABEL_41:
            v12 = 0;
            return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0);
          }
          *(_QWORD *)v14 = 0;
          *(_QWORD *)(v14 + 8) = 0;
          return (_QWORD *)v14;
        }
        v19 = v22;
      }
      v9 = v19;
      if ((v19 & 0x7FF) - 2045 < 3)
      {
        v14 = 0;
        v12 = v7;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0);
      }
    }
  }
  v12 = 0;
  v14 = 0;
  return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0);
}

_QWORD *nanov2_malloc_type_VARIANT_mp(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int *v8;
  unint64_t v9;
  unsigned int v10;
  unint64_t v11;
  int v12;
  unsigned int *v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  unsigned int v23;
  char v24;
  int v26;
  char v27;

  v3 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (a2 <= 0x10)
    v3 = 16;
  if (v3 > 0x100)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 160))();
  v4 = (v3 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    v5 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v5) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
      v5 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    LODWORD(v5) = v5 % nano_common_max_magazines;
  }
  v6 = v5 & 0x3F;
  v7 = a1 + (v4 << 9) + 8 * (v5 & 0x3F);
  v8 = *(unsigned int **)(v7 + 0x4000);
  if (v8)
  {
    v9 = 0;
    v10 = *v8;
    v11 = (unint64_t)v8 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v8) & 0xFC0 | (v8 >> 8) & 0x3F) << 14);
    v12 = 16 * v4 + 16;
    while (1)
    {
      v13 = 0;
      if ((v10 & 0x80000000) == 0)
      {
        v15 = 0;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
      }
      v14 = v10 & 0x7FF;
      v15 = 0;
      if (v14 == 2044)
        return nanov2_allocate_outlined(a1, (unsigned int **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
      v16 = (v10 >> 11) & 0x3FF;
      v17 = (v10 + 2095104) & 0x1FF800 | (v10 + 0x200000) & 0x7FE00000;
      if (v14 == 2043 || v14 == 2045)
      {
        if (v16)
          v18 = 2043;
        else
          v18 = 2044;
        v19 = v17 | v18 | 0x80000000;
        while (1)
        {
          v20 = __ldxr(v8);
          if (v20 != v10)
            break;
          if (!__stxr(v19, v8))
          {
            v26 = slots_by_size_class[v4] + ~v16;
            v27 = 1;
            goto LABEL_36;
          }
        }
        __clrex();
      }
      else
      {
        if (!v9)
          v9 = (unint64_t)v8 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v8) & 0xFC0 | (v8 >> 8) & 0x3F) << 14);
        v26 = v14 - 1;
        v15 = v9 + v26 * v12;
        if (v16)
          v21 = *(_WORD *)(v15 + 8);
        else
          v21 = 2044;
        v22 = v17 | v21 & 0x7FF | 0x80000000;
        while (1)
        {
          v23 = __ldxr(v8);
          if (v23 != v10)
            break;
          if (!__stxr(v22, v8))
          {
            v24 = 1;
            goto LABEL_30;
          }
        }
        v24 = 0;
        __clrex();
LABEL_30:
        if ((v24 & 1) != 0)
        {
          if (v15)
            goto LABEL_44;
          v27 = 0;
LABEL_36:
          if (!v9)
            v9 = v11;
          v15 = v9 + v26 * v12;
          if ((v27 & 1) == 0)
          {
LABEL_44:
            if ((*(_QWORD *)(a1 + 28696) ^ *(_QWORD *)v15) != v15)
              goto LABEL_40;
          }
          else if (!v15)
          {
LABEL_40:
            v13 = 0;
            return nanov2_allocate_outlined(a1, (unsigned int **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
          }
          *(_QWORD *)v15 = 0;
          *(_QWORD *)(v15 + 8) = 0;
          return (_QWORD *)v15;
        }
        v20 = v23;
      }
      v10 = v20;
      if ((v20 & 0x7FF) - 2045 < 3)
      {
        v15 = 0;
        v13 = v8;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
      }
    }
  }
  v13 = 0;
  v15 = 0;
  return nanov2_allocate_outlined(a1, (unsigned int **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
}

void nanov2_free_definite_size_VARIANT_mp(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  unint64_t v5;
  int v6;
  BOOL v7;
  unsigned int *v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned __int16 *v17;
  unsigned __int16 v18;

  if (!a2 || (unint64_t)a2 >> 29 != 24)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 28704) + 120))();
    return;
  }
  v5 = a3 >> 4;
  if ((a3 & 0xF) != 0)
    LODWORD(v5) = v5 + 1;
  v6 = v5 - 1;
  if (malloc_zero_policy)
    v7 = 1;
  else
    v7 = (_DWORD)v5 == 1;
  if (!v7)
    bzero(a2 + 2, a3 - 16);
  v8 = (unsigned int *)((*(_QWORD *)(a1 + 28688) ^ (unint64_t)a2 & 0xFFFFFFFFFC000000)
                      + 4 * (((unint64_t)a2 >> 8) & 0xFC0 | ((unint64_t)a2 >> 20) & 0x3F));
  v9 = *v8;
  v10 = slots_by_size_class[v6];
  *a2 = *(_QWORD *)(a1 + 28696) ^ (unint64_t)a2;
  while (1)
  {
    v11 = v9 & 0x7FF;
    v12 = (v9 + 2048) & 0x1FF800;
    v13 = (v9 + 0x200000) & 0x7FE00000 | v9 & 0x80000000;
    if (v11 == 2044)
    {
      v11 = 2043;
      goto LABEL_21;
    }
    if (v10 - 1 == v12 >> 11)
      break;
LABEL_21:
    v15 = v12 | v13 | ((unsigned __int16)(((unsigned __int16)a2 & 0x3FFF) / (16 * v6 + 16)) + 1) & 0x7FF;
    a2[1] = v11;
    while (1)
    {
      v16 = __ldxr(v8);
      if (v16 != v9)
        break;
      if (!__stlxr(v15, v8))
        goto LABEL_30;
    }
LABEL_25:
    __clrex();
    v9 = v16;
  }
  a2[1] = 0;
  if (v9 < 0)
    v14 = 2043;
  else
    v14 = 2045;
  v15 = v14 | v12 | v13;
  do
  {
    v16 = __ldxr(v8);
    if (v16 != v9)
      goto LABEL_25;
  }
  while (__stlxr(v15, v8));
  if (v9 < 0 || nanov2_madvise_policy)
  {
LABEL_30:
    if ((v15 & 0x80000000) == 0)
    {
      v17 = (unsigned __int16 *)(a1 + 28672);
      if (((1 << v6) & *(unsigned __int16 *)(a1 + 28672)) != 0 && (double)v10 * 0.75 <= (double)((v15 >> 11) & 0x3FF))
      {
        do
          v18 = __ldxr(v17);
        while (__stxr(v18 & ~(unsigned __int16)(1 << v6), v17));
      }
    }
  }
  else
  {
    nanov2_madvise_block_VARIANT_mp((const os_unfair_lock *)a1, v8, v6, 2045);
  }
}

void nanov2_madvise_block_VARIANT_mp(const os_unfair_lock *a1, unsigned int *a2, int a3, int a4)
{
  unint64_t v8;
  os_unfair_lock_s *v9;

  v8 = (unint64_t)a2 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)a2) & 0xFC0 | (a2 >> 8) & 0x3F) << 14);
  v9 = (os_unfair_lock_s *)&a1[7184];
  os_unfair_lock_lock_with_options();
  nanov2_madvise_block_locked(a1, a2, v8, a3, a4);
  os_unfair_lock_unlock(v9);
}

void nanov2_free_VARIANT_mp(uint64_t a1, unint64_t a2)
{
  _nanov2_free(a1, a2, 0);
}

void nanov2_try_free_default_VARIANT_mp(uint64_t a1, unint64_t a2)
{
  _nanov2_free(a1, a2, 1);
}

_QWORD *nanov2_calloc_VARIANT_mp(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int *v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  int v13;
  unsigned int *v14;
  int v15;
  _QWORD *v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  unsigned int v24;
  char v25;
  int v27;
  char v28;

  v3 = a3;
  if (a2 != 1)
  {
    if (!is_mul_ok(a2, a3) || (v3 = a2 * a3, a2 * a3 > malloc_absolute_max_size))
    {
      v16 = 0;
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return v16;
    }
  }
  if (v3 <= 0x10)
    v4 = 16;
  else
    v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v3 > 0x100)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 32))();
  v5 = (v4 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v6) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
      v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    LODWORD(v6) = v6 % nano_common_max_magazines;
  }
  v7 = v6 & 0x3F;
  v8 = a1 + (v5 << 9) + 8 * (v6 & 0x3F);
  v9 = *(unsigned int **)(v8 + 0x4000);
  if (!v9)
  {
    v14 = 0;
    v16 = 0;
    return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0);
  }
  v10 = 0;
  v11 = *v9;
  v12 = (unint64_t)v9 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
  v13 = 16 * v5 + 16;
  while (1)
  {
    v14 = 0;
    if ((v11 & 0x80000000) == 0)
    {
      v16 = 0;
      return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0);
    }
    v15 = v11 & 0x7FF;
    v16 = 0;
    if (v15 == 2044)
      return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0);
    v17 = (v11 >> 11) & 0x3FF;
    v18 = (v11 + 2095104) & 0x1FF800 | (v11 + 0x200000) & 0x7FE00000;
    if (v15 == 2043 || v15 == 2045)
    {
      if (v17)
        v19 = 2043;
      else
        v19 = 2044;
      v20 = v18 | v19 | 0x80000000;
      while (1)
      {
        v21 = __ldxr(v9);
        if (v21 != v11)
          break;
        if (!__stxr(v20, v9))
        {
          v27 = slots_by_size_class[v5] + ~v17;
          v28 = 1;
          goto LABEL_42;
        }
      }
      __clrex();
      goto LABEL_36;
    }
    if (!v10)
      v10 = (unint64_t)v9 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
    v27 = v15 - 1;
    v16 = (_QWORD *)(v10 + v27 * v13);
    v22 = v17 ? *((_WORD *)v16 + 4) : 2044;
    v23 = v18 | v22 & 0x7FF | 0x80000000;
    while (1)
    {
      v24 = __ldxr(v9);
      if (v24 != v11)
        break;
      if (!__stxr(v23, v9))
      {
        v25 = 1;
        goto LABEL_34;
      }
    }
    v25 = 0;
    __clrex();
LABEL_34:
    if ((v25 & 1) != 0)
      break;
    v21 = v24;
LABEL_36:
    v11 = v21;
    if ((v21 & 0x7FF) - 2045 < 3)
    {
      v16 = 0;
      v14 = v9;
      return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0);
    }
  }
  if (v16)
    goto LABEL_50;
  v28 = 0;
LABEL_42:
  if (!v10)
    v10 = v12;
  v16 = (_QWORD *)(v10 + v27 * v13);
  if ((v28 & 1) == 0)
  {
LABEL_50:
    if ((_QWORD *)(*(_QWORD *)(a1 + 28696) ^ *v16) != v16)
      goto LABEL_46;
  }
  else if (!v16)
  {
LABEL_46:
    v14 = 0;
    return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0);
  }
  if (malloc_zero_policy)
  {
    bzero(v16, v4);
  }
  else
  {
    *v16 = 0;
    v16[1] = 0;
  }
  return v16;
}

_QWORD *nanov2_calloc_type_VARIANT_mp(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int *v10;
  unint64_t v11;
  unsigned int v12;
  unint64_t v13;
  int v14;
  unsigned int *v15;
  int v16;
  _QWORD *v17;
  int v18;
  int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;
  unsigned int v25;
  char v26;
  int v28;
  char v29;

  v4 = a3;
  if (a2 != 1)
  {
    if (!is_mul_ok(a2, a3) || (v4 = a2 * a3, a2 * a3 > malloc_absolute_max_size))
    {
      v17 = 0;
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return v17;
    }
  }
  if (v4 <= 0x10)
    v5 = 16;
  else
    v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v4 > 0x100)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 168))();
  v6 = (v5 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    v7 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v7) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
      v7 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    LODWORD(v7) = v7 % nano_common_max_magazines;
  }
  v8 = v7 & 0x3F;
  v9 = a1 + (v6 << 9) + 8 * (v7 & 0x3F);
  v10 = *(unsigned int **)(v9 + 0x4000);
  if (!v10)
  {
    v15 = 0;
    v17 = 0;
    return nanov2_allocate_outlined(a1, (unsigned int **)(v9 + 0x4000), v5, (v5 >> 4) - 1, v8, v15, (uint64_t)v17, 1, 1, a4);
  }
  v11 = 0;
  v12 = *v10;
  v13 = (unint64_t)v10 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v10) & 0xFC0 | (v10 >> 8) & 0x3F) << 14);
  v14 = 16 * v6 + 16;
  while (1)
  {
    v15 = 0;
    if ((v12 & 0x80000000) == 0)
    {
      v17 = 0;
      return nanov2_allocate_outlined(a1, (unsigned int **)(v9 + 0x4000), v5, (v5 >> 4) - 1, v8, v15, (uint64_t)v17, 1, 1, a4);
    }
    v16 = v12 & 0x7FF;
    v17 = 0;
    if (v16 == 2044)
      return nanov2_allocate_outlined(a1, (unsigned int **)(v9 + 0x4000), v5, (v5 >> 4) - 1, v8, v15, (uint64_t)v17, 1, 1, a4);
    v18 = (v12 >> 11) & 0x3FF;
    v19 = (v12 + 2095104) & 0x1FF800 | (v12 + 0x200000) & 0x7FE00000;
    if (v16 == 2043 || v16 == 2045)
    {
      if (v18)
        v20 = 2043;
      else
        v20 = 2044;
      v21 = v19 | v20 | 0x80000000;
      while (1)
      {
        v22 = __ldxr(v10);
        if (v22 != v12)
          break;
        if (!__stxr(v21, v10))
        {
          v28 = slots_by_size_class[v6] + ~v18;
          v29 = 1;
          goto LABEL_42;
        }
      }
      __clrex();
      goto LABEL_36;
    }
    if (!v11)
      v11 = (unint64_t)v10 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v10) & 0xFC0 | (v10 >> 8) & 0x3F) << 14);
    v28 = v16 - 1;
    v17 = (_QWORD *)(v11 + v28 * v14);
    v23 = v18 ? *((_WORD *)v17 + 4) : 2044;
    v24 = v19 | v23 & 0x7FF | 0x80000000;
    while (1)
    {
      v25 = __ldxr(v10);
      if (v25 != v12)
        break;
      if (!__stxr(v24, v10))
      {
        v26 = 1;
        goto LABEL_34;
      }
    }
    v26 = 0;
    __clrex();
LABEL_34:
    if ((v26 & 1) != 0)
      break;
    v22 = v25;
LABEL_36:
    v12 = v22;
    if ((v22 & 0x7FF) - 2045 < 3)
    {
      v17 = 0;
      v15 = v10;
      return nanov2_allocate_outlined(a1, (unsigned int **)(v9 + 0x4000), v5, (v5 >> 4) - 1, v8, v15, (uint64_t)v17, 1, 1, a4);
    }
  }
  if (v17)
    goto LABEL_50;
  v29 = 0;
LABEL_42:
  if (!v11)
    v11 = v13;
  v17 = (_QWORD *)(v11 + v28 * v14);
  if ((v29 & 1) == 0)
  {
LABEL_50:
    if ((_QWORD *)(*(_QWORD *)(a1 + 28696) ^ *v17) != v17)
      goto LABEL_46;
  }
  else if (!v17)
  {
LABEL_46:
    v15 = 0;
    return nanov2_allocate_outlined(a1, (unsigned int **)(v9 + 0x4000), v5, (v5 >> 4) - 1, v8, v15, (uint64_t)v17, 1, 1, a4);
  }
  if (malloc_zero_policy)
  {
    bzero(v17, v5);
  }
  else
  {
    *v17 = 0;
    v17[1] = 0;
  }
  return v17;
}

_QWORD *nanov2_malloc_zero_on_alloc_VARIANT_mp(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int *v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  int v11;
  unsigned int *v12;
  int v13;
  _QWORD *v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  unsigned int v22;
  char v23;
  int v25;
  char v26;

  if (a2 <= 0x10)
    v2 = 16;
  else
    v2 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v2 > 0x100)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 24))();
  v3 = (v2 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v4) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
      v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    LODWORD(v4) = v4 % nano_common_max_magazines;
  }
  v5 = v4 & 0x3F;
  v6 = a1 + (v3 << 9) + 8 * (v4 & 0x3F);
  v7 = *(unsigned int **)(v6 + 0x4000);
  if (v7)
  {
    v8 = 0;
    v9 = *v7;
    v10 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
    v11 = 16 * v3 + 16;
    while (1)
    {
      v12 = 0;
      if ((v9 & 0x80000000) == 0)
      {
        v14 = 0;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0);
      }
      v13 = v9 & 0x7FF;
      v14 = 0;
      if (v13 == 2044)
        return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0);
      v15 = (v9 >> 11) & 0x3FF;
      v16 = (v9 + 2095104) & 0x1FF800 | (v9 + 0x200000) & 0x7FE00000;
      if (v13 == 2043 || v13 == 2045)
      {
        if (v15)
          v17 = 2043;
        else
          v17 = 2044;
        v18 = v16 | v17 | 0x80000000;
        while (1)
        {
          v19 = __ldxr(v7);
          if (v19 != v9)
            break;
          if (!__stxr(v18, v7))
          {
            v25 = slots_by_size_class[v3] + ~v15;
            v26 = 1;
            goto LABEL_37;
          }
        }
        __clrex();
      }
      else
      {
        if (!v8)
          v8 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
        v25 = v13 - 1;
        v14 = (_QWORD *)(v8 + v25 * v11);
        if (v15)
          v20 = *((_WORD *)v14 + 4);
        else
          v20 = 2044;
        v21 = v16 | v20 & 0x7FF | 0x80000000;
        while (1)
        {
          v22 = __ldxr(v7);
          if (v22 != v9)
            break;
          if (!__stxr(v21, v7))
          {
            v23 = 1;
            goto LABEL_31;
          }
        }
        v23 = 0;
        __clrex();
LABEL_31:
        if ((v23 & 1) != 0)
        {
          if (v14)
            goto LABEL_45;
          v26 = 0;
LABEL_37:
          if (!v8)
            v8 = v10;
          v14 = (_QWORD *)(v8 + v25 * v11);
          if ((v26 & 1) == 0)
          {
LABEL_45:
            if ((_QWORD *)(*(_QWORD *)(a1 + 28696) ^ *v14) != v14)
              goto LABEL_41;
          }
          else if (!v14)
          {
LABEL_41:
            v12 = 0;
            return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0);
          }
          if (malloc_zero_policy)
          {
            bzero(v14, v2);
          }
          else
          {
            *v14 = 0;
            v14[1] = 0;
          }
          return v14;
        }
        v19 = v22;
      }
      v9 = v19;
      if ((v19 & 0x7FF) - 2045 < 3)
      {
        v14 = 0;
        v12 = v7;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0);
      }
    }
  }
  v12 = 0;
  v14 = 0;
  return nanov2_allocate_outlined(a1, (unsigned int **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0);
}

_QWORD *nanov2_malloc_type_zero_on_alloc_VARIANT_mp(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int *v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  int v13;
  unsigned int *v14;
  int v15;
  _QWORD *v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  unsigned int v24;
  char v25;
  int v27;
  char v28;

  if (a2 <= 0x10)
    v4 = 16;
  else
    v4 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v4 > 0x100)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 160))();
  v5 = (v4 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v6) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
      v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    LODWORD(v6) = v6 % nano_common_max_magazines;
  }
  v7 = v6 & 0x3F;
  v8 = a1 + (v5 << 9) + 8 * (v6 & 0x3F);
  v9 = *(unsigned int **)(v8 + 0x4000);
  if (v9)
  {
    v10 = 0;
    v11 = *v9;
    v12 = (unint64_t)v9 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
    v13 = 16 * v5 + 16;
    while (1)
    {
      v14 = 0;
      if ((v11 & 0x80000000) == 0)
      {
        v16 = 0;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
      }
      v15 = v11 & 0x7FF;
      v16 = 0;
      if (v15 == 2044)
        return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
      v17 = (v11 >> 11) & 0x3FF;
      v18 = (v11 + 2095104) & 0x1FF800 | (v11 + 0x200000) & 0x7FE00000;
      if (v15 == 2043 || v15 == 2045)
      {
        if (v17)
          v19 = 2043;
        else
          v19 = 2044;
        v20 = v18 | v19 | 0x80000000;
        while (1)
        {
          v21 = __ldxr(v9);
          if (v21 != v11)
            break;
          if (!__stxr(v20, v9))
          {
            v27 = slots_by_size_class[v5] + ~v17;
            v28 = 1;
            goto LABEL_37;
          }
        }
        __clrex();
      }
      else
      {
        if (!v10)
          v10 = (unint64_t)v9 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
        v27 = v15 - 1;
        v16 = (_QWORD *)(v10 + v27 * v13);
        if (v17)
          v22 = *((_WORD *)v16 + 4);
        else
          v22 = 2044;
        v23 = v18 | v22 & 0x7FF | 0x80000000;
        while (1)
        {
          v24 = __ldxr(v9);
          if (v24 != v11)
            break;
          if (!__stxr(v23, v9))
          {
            v25 = 1;
            goto LABEL_31;
          }
        }
        v25 = 0;
        __clrex();
LABEL_31:
        if ((v25 & 1) != 0)
        {
          if (v16)
            goto LABEL_45;
          v28 = 0;
LABEL_37:
          if (!v10)
            v10 = v12;
          v16 = (_QWORD *)(v10 + v27 * v13);
          if ((v28 & 1) == 0)
          {
LABEL_45:
            if ((_QWORD *)(*(_QWORD *)(a1 + 28696) ^ *v16) != v16)
              goto LABEL_41;
          }
          else if (!v16)
          {
LABEL_41:
            v14 = 0;
            return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
          }
          if (malloc_zero_policy)
          {
            bzero(v16, v4);
          }
          else
          {
            *v16 = 0;
            v16[1] = 0;
          }
          return v16;
        }
        v21 = v24;
      }
      v11 = v21;
      if ((v21 & 0x7FF) - 2045 < 3)
      {
        v16 = 0;
        v14 = v9;
        return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
      }
    }
  }
  v14 = 0;
  v16 = 0;
  return nanov2_allocate_outlined(a1, (unsigned int **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
}

_QWORD *nanov2_realloc_VARIANT_mp(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  unint64_t v7;
  size_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;

  v4 = a1;
  if (!a2)
  {
    v10 = a3;
    return nanov2_malloc_VARIANT_mp(a1, v10);
  }
  v5 = (const void *)a2;
  v6 = *(_QWORD *)(a1 + 28704);
  v7 = nanov2_pointer_size_VARIANT_mp(a1, a2, 0);
  if (!v7)
    return (_QWORD *)(*(uint64_t (**)(uint64_t, const void *, unint64_t))(v6 + 56))(v6, v5, a3);
  v8 = v7;
  if (a3 >= 0x101)
  {
    v9 = (_QWORD *)(*(uint64_t (**)(uint64_t, unint64_t))(v6 + 24))(v6, a3);
    goto LABEL_21;
  }
  if (!a3)
  {
    _nanov2_free(v4, (unint64_t)v5, 0);
    a1 = v4;
    v10 = 0;
    return nanov2_malloc_VARIANT_mp(a1, v10);
  }
  if (a3 <= 0x10)
    v12 = 16;
  else
    v12 = (a3 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v12 <= v7 && v12 > v7 >> 1)
  {
    if (v7 != a3)
    {
      if (v7 <= a3)
        nanov2_realloc_VARIANT_mp_cold_1(v7);
      if ((*(_BYTE *)(v4 + 28676) & 0x20) != 0)
        _platform_memset();
    }
    return v5;
  }
  v9 = nanov2_malloc_VARIANT_mp(v4, v12);
LABEL_21:
  v13 = v9;
  if (!v9)
    return 0;
  if (v8 >= a3)
    v14 = a3;
  else
    v14 = v8;
  memcpy(v9, v5, v14);
  _nanov2_free(v4, (unint64_t)v5, 0);
  return v13;
}

_QWORD *nanov2_realloc_type_VARIANT_mp(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  const void *v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  _QWORD *v11;
  unint64_t v13;
  _QWORD *v14;
  size_t v15;

  if (!a2)
    return nanov2_malloc_type_VARIANT_mp(a1, a3, a4);
  v7 = (const void *)a2;
  v8 = *(_QWORD *)(a1 + 28704);
  v9 = nanov2_pointer_size_VARIANT_mp(a1, a2, 0);
  if (!v9)
    return (_QWORD *)(*(uint64_t (**)(uint64_t, const void *, unint64_t, uint64_t))(v8 + 176))(v8, v7, a3, a4);
  v10 = v9;
  if (a3 < 0x101)
  {
    if (!a3)
    {
      _nanov2_free(a1, (unint64_t)v7, 0);
      return nanov2_malloc_VARIANT_mp(a1, 0);
    }
    if (a3 <= 0x10)
      v13 = 16;
    else
      v13 = (a3 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (v13 <= v9 && v13 > v9 >> 1)
    {
      if (v9 != a3)
      {
        if (v9 <= a3)
          nanov2_realloc_VARIANT_mp_cold_1(v9);
        if ((*(_BYTE *)(a1 + 28676) & 0x20) != 0)
          _platform_memset();
      }
      return v7;
    }
    v11 = nanov2_malloc_type_VARIANT_mp(a1, v13, a4);
  }
  else
  {
    v11 = (_QWORD *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v8 + 160))(v8, a3, a4);
  }
  v14 = v11;
  if (!v11)
    return 0;
  if (v10 >= a3)
    v15 = a3;
  else
    v15 = v10;
  memcpy(v11, v7, v15);
  _nanov2_free(a1, (unint64_t)v7, 0);
  return v14;
}

BOOL nanov2_claimed_address_VARIANT_mp(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  v4 = 1;
  if (!nanov2_pointer_size_VARIANT_mp(a1, a2, 1))
    return malloc_zone_claimed_address(*(_QWORD *)(a1 + 28704), a2) != 0;
  return v4;
}

unint64_t nanov2_pointer_size_VARIANT_mp(uint64_t a1, unint64_t a2, int a3)
{
  unint64_t v4;
  uint64_t v6;
  unsigned int v7;

  if (a2 >> 29 != 24 || !a3 && (a2 & 0xF) != 0)
    return 0;
  if (*(_QWORD *)(a1 + 28720) > a2 || *(_QWORD *)(a1 + 28728) < a2)
    return 0;
  v4 = 0;
  v6 = ptr_offset_to_size_class[((a2 >> 14) & 0xFFF ^ *(_DWORD *)(a1 + 28680)) >> 6];
  v7 = *(_DWORD *)((*(_QWORD *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000)
                 + 4 * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F)) & 0x7FF;
  if (v7 > 0x7FD)
  {
    if (v7 - 2046 < 2)
      return v4;
  }
  else
  {
    if (!v7 || v7 == 2042)
      return v4;
    if (v7 == 2044)
      goto LABEL_17;
  }
  if (((*(_DWORD *)((*(_QWORD *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000)
                   + 4 * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F)) >> 11) & 0x3FF) == slots_by_size_class[v6] - 1)
    return 0;
LABEL_17:
  v4 = 16 * (int)v6 + 16;
  if (!a3 && (a2 & 0x3FFF) != (a2 & 0x3FFF) / v4 * (int)v4)
    return 0;
  if ((*(_QWORD *)(a1 + 28696) ^ *(_QWORD *)a2) == a2)
    return 0;
  return v4;
}

uint64_t nanov2_batch_malloc_VARIANT_mp(uint64_t a1, unint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v7;
  int v8;
  _QWORD *v9;

  v4 = a4;
  if (a2 <= 0x10)
    v7 = 16;
  else
    v7 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v7 > 0x100)
  {
    v8 = 0;
    return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 28704) + 80))() + v8;
  }
  v8 = 0;
  if ((_DWORD)a4)
  {
    while (1)
    {
      v9 = nanov2_malloc_VARIANT_mp(a1, v7);
      if (!v9)
        break;
      *a3++ = v9;
      if ((_DWORD)v4 == ++v8)
        return v4;
    }
  }
  if (v8 != (_DWORD)v4)
    return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 28704) + 80))() + v8;
  return v4;
}

void nanov2_batch_free_VARIANT_mp(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v5;
  unint64_t v6;

  if (a3)
  {
    v5 = a3 - 1;
    do
    {
      v6 = *(_QWORD *)(a2 + 8 * v5);
      if (v6)
        _nanov2_free(a1, v6, 0);
    }
    while ((unint64_t)v5--);
  }
}

_QWORD *nanov2_memalign_VARIANT_mp(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 > 0x10)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 112))();
  else
    return nanov2_malloc_VARIANT_mp(a1, a3);
}

_QWORD *nanov2_memalign_type_VARIANT_mp(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a2 > 0x10)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 184))();
  else
    return nanov2_malloc_type_VARIANT_mp(a1, a3, a4);
}

unint64_t nanov2_pressure_relief_VARIANT_mp(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned __int16 v12;
  unsigned int i;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;

  if ((nanov2_madvise_policy - 3) < 0xFFFFFFFE)
    return 0;
  v20 = malloc_tracing_enabled;
  if (malloc_tracing_enabled)
    kdebug_trace();
  v5 = *(_QWORD *)(a1 + 28720);
  v6 = atomic_load((unint64_t *)(a1 + 28728));
  v22 = v5;
  v2 = 0;
  if (v5)
  {
    v21 = v6;
    v19 = (v6 - 1) & 0xFFFFFFFFE0000000;
    v7 = ((*(_DWORD *)(a1 + 28680) >> 6) | (*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF;
    do
    {
      v8 = v22;
      v9 = v22 + 0x20000000;
      if (v22 == v19)
        v9 = v21;
      v23 = v9;
      while (1)
      {
        v10 = *(_QWORD *)(a1 + 28688);
        if (v8 >= v23)
          break;
        v11 = (unsigned int *)(v10 ^ v8 & 0xFFFFFFFFFC000000);
        os_unfair_lock_lock_with_options();
        v12 = 0;
        for (i = 0; i != 4096; ++i)
        {
          if (v7 != i && (*v11 & 0x7FF) == 0x7FD)
          {
            v14 = v8 + ((unint64_t)((v12 | (unsigned __int16)(i >> 6)) & 0xFFF) << 14);
            if (nanov2_madvise_block_locked((const os_unfair_lock *)a1, v11, v14, ptr_offset_to_size_class[(*(_DWORD *)(a1 + 28680) ^ (v14 >> 14) & 0xFC0) >> 6], 2045))v2 += 0x4000;
          }
          ++v11;
          v12 += 64;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 28736));
        v8 += 0x4000000;
        if (a2 - 1 < v2)
          goto LABEL_25;
      }
      v15 = *(unsigned __int16 *)((v10 ^ v22 & 0xFFFFFFFFFC000000)
                                + 4
                                * (((unsigned __int16)(*(_DWORD *)(a1 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF));
      v16 = v22 + (v15 << 29);
      if (v16 >= v21)
        v16 = 0;
      if ((_DWORD)v15)
        v17 = v16;
      else
        v17 = 0;
      v22 = v17;
    }
    while (v17);
  }
LABEL_25:
  if (v20)
    kdebug_trace();
  return v2;
}

unint64_t nanov2_find_block_and_allocate_VARIANT_mp(uint64_t a1, unsigned int a2, unsigned int **a3)
{
  unsigned int *v4;
  unsigned int *v5;
  uint64_t v6;
  unint64_t new_region;
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  _BOOL4 v15;
  unsigned int v16;
  unint64_t v17;
  unsigned int *v18;
  unsigned int *v19;
  _BOOL4 v20;
  unint64_t v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  int v29;
  int v30;
  int v31;
  unsigned int v32;
  unsigned int v33;
  int v34;
  uint64_t v35;
  BOOL v37;
  uint64_t v38;
  unint64_t result;
  unsigned int v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unsigned int v44;
  _BYTE *v45;
  unsigned int *v47;
  int v48;
  os_unfair_lock_s *lock;
  unint64_t *v51;
  unint64_t v52;
  int v53;
  unint64_t v54;
  unint64_t v55;

  v4 = *a3;
  v5 = *a3;
  if (!*a3)
    v5 = *(unsigned int **)(a1 + 28720);
  v6 = a2;
  new_region = (unint64_t)v5 & 0xFFFFFFFFFC000000;
  v8 = ((slots_by_size_class[a2] << 11) + 2095104) & 0x1FF800 | 0x7FB;
  v48 = 1 << a2;
  lock = (os_unfair_lock_s *)(a1 + 28716);
  v45 = (_BYTE *)(a1 + 28676);
  v51 = (unint64_t *)(a1 + 28728);
  v47 = *a3;
LABEL_4:
  while (2)
  {
    v9 = new_region & 0xFFFFFFFFE0000000;
    v10 = atomic_load(v51);
    v11 = (v10 - 1) & 0xFFFFFFFFE0000000;
    v12 = (new_region & 0xFFFFFFFFE0000000) + 0x20000000;
    v52 = v10;
    v54 = new_region;
    if (v11 == (new_region & 0xFFFFFFFFE0000000))
      v12 = v10;
    v13 = nanov2_policy_config;
    v14 = unk_1ECCD9424;
LABEL_7:
    v15 = v4 == 0;
    v16 = first_block_offset_by_size_class[v6] ^ *(_DWORD *)(a1 + 28680);
    v17 = (*(_QWORD *)(a1 + 28688) ^ new_region & 0xFFFFFFFFFC000000)
        + 4 * (((unsigned __int16)(v16 >> 6) | (unsigned __int16)((_WORD)v16 << 6)) & 0xFFF);
    if (v4)
      v17 = (unint64_t)v4;
    if (!v13)
      v15 = 1;
    while (2)
    {
      v18 = 0;
      v19 = 0;
      v20 = 1;
      v21 = v17;
      v22 = v14;
      do
      {
        while (1)
        {
          if ((*(_DWORD *)v21 & 0x80000000) != 0)
            goto LABEL_17;
          switch(*(_DWORD *)v21 & 0x7FF)
          {
            case 0x7FC:
            case 0x7FE:
              goto LABEL_17;
            case 0x7FD:
              if (!v18)
                v18 = (unsigned int *)v21;
              if (!v15)
                goto LABEL_17;
              break;
            default:
              if (!v19)
                v19 = (unsigned int *)v21;
              if (!v15)
                goto LABEL_17;
              break;
          }
          if ((unint64_t)v19 != (unsigned __int128)0)
            break;
          v19 = 0;
LABEL_17:
          if (v22 >= 1 && (unint64_t)v19 != (unsigned __int128)0 && !--v22)
            break;
          v23 = *(_DWORD *)(a1 + 28680);
          v24 = ((16 * v21) & 0xFC0 | (v21 >> 8) & 0x3F) ^ v23;
          if (v20)
          {
            v25 = first_block_offset_by_size_class[v6];
            if (v24 == v25)
            {
              v26 = last_block_offset_by_size_class[v6];
              v22 = v14;
            }
            else
            {
              v26 = v24 - 1;
            }
            v37 = v24 == v25;
            v20 = v24 != v25;
            v21 = v21 & 0xFFFFFFFFFFFFC000 | (4
                                              * (((unsigned __int16)((v26 ^ v23) >> 6) | (unsigned __int16)(((unsigned __int16)v26 ^ (unsigned __int16)v23) << 6)) & 0xFFF));
            if (v37)
              v21 = v17;
          }
          else
          {
            if (v24 == last_block_offset_by_size_class[v6])
              v27 = first_block_offset_by_size_class[v6];
            else
              v27 = v24 + 1;
            v21 = v21 & 0xFFFFFFFFFFFFC000 | (4
                                              * (((unsigned __int16)((v27 ^ v23) >> 6) | (unsigned __int16)(((unsigned __int16)v27 ^ (unsigned __int16)v23) << 6)) & 0xFFF));
            if (v21 == v17)
              break;
            v20 = 0;
          }
        }
        v4 = v19;
        if (!v19)
        {
          v4 = v18;
          if (!v18)
          {
            new_region += 0x4000000;
            if (new_region >= v12)
            {
              v35 = *(unsigned __int16 *)((*(_QWORD *)(a1 + 28688) ^ v9 & 0xFFFFFFFFFC000000)
                                        + 4
                                        * (((unsigned __int16)(*(_DWORD *)(a1 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF));
              new_region = v9 + (v35 << 29);
              v37 = (_DWORD)v35 == 0;
              v12 = v52;
              v37 = v37 || new_region >= v52 || v9 == 0;
              if (v37)
                new_region = *(_QWORD *)(a1 + 28720);
              if (new_region != v11)
                v12 = new_region + 0x20000000;
              v9 = new_region;
            }
            v4 = 0;
            if (new_region != v54)
              goto LABEL_7;
            if (((unsigned __int16)v48 & (unsigned __int16)word_1ECCD9428) == 0)
            {
              os_unfair_lock_lock_with_options();
              v38 = *(_QWORD *)(a1 + 28728);
              new_region = v52;
              if (v38 != v52)
              {
                new_region = v38 - 0x4000000;
LABEL_69:
                os_unfair_lock_unlock(lock);
                v4 = 0;
                goto LABEL_4;
              }
              if ((v38 & 0xFFFFFFFFE0000000) != v52)
              {
                *(_QWORD *)(a1 + 28728) = v52 + 0x4000000;
                goto LABEL_76;
              }
              new_region = nanov2_allocate_new_region();
              if (new_region)
              {
LABEL_76:
                if ((*v45 & 7) != 0)
                {
                  v53 = ((unsigned __int16)(*(_DWORD *)(a1 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF;
                  v41 = new_region;
                  v42 = new_region & 0xFFFFFFFFFC000000;
                  *(_DWORD *)((*(_QWORD *)(a1 + 28688) ^ v42) + ((unint64_t)(v53 == 0) << 8)) = -2147481606;
                  v55 = v41;
                  if (mprotect((void *)(v41 + ((unint64_t)(v53 == 0) << 14)), 0x4000uLL, 1))
                    malloc_report(3u, (uint64_t)"Failed to create guard block at %p (%d)\n");
                  if (v53 == 4095)
                    v43 = 4094;
                  else
                    v43 = 4095;
                  *(_DWORD *)((*(_QWORD *)(a1 + 28688) ^ v42) + 4 * (((v43 & 0x3F) << 6) | 0x3F)) = -2147481606;
                  new_region = v55;
                  if (mprotect((void *)(v55 + (v43 << 14)), 0x4000uLL, 1))
                    malloc_report(3u, (uint64_t)"Failed to create guard block at %p (%d)\n");
                }
                goto LABEL_69;
              }
              os_unfair_lock_unlock(lock);
            }
            return 0;
          }
        }
        v18 = 0;
        v19 = 0;
        v28 = *v4;
        v29 = *v4 & 0x7FF;
        v20 = 1;
        v21 = v17;
        v22 = v14;
      }
      while (v29 == 2046);
      if (!v29 || v29 == 2045 || v29 == 2047)
      {
        v30 = 0;
        v31 = v8;
      }
      else
      {
        v31 = v28 & 0x1FFFFF;
        v30 = (v28 + 0x200000) & 0x7FE00000;
      }
      v32 = v31 | v30 | 0x80000000;
      while (1)
      {
        v33 = __ldxr(v4);
        if (v33 != v28)
          break;
        if (!__stxr(v32, v4))
        {
          v34 = 1;
          goto LABEL_50;
        }
      }
      v34 = 0;
      __clrex();
LABEL_50:
      v13 = nanov2_policy_config;
      v14 = unk_1ECCD9424;
      if (!v34)
        continue;
      break;
    }
    result = nanov2_allocate_from_block_VARIANT_mp(a1, v4, a2);
    if (!result)
    {
      do
        v40 = __ldxr(v4);
      while (__stxr(v40 & 0x7FFFFFFF, v4));
      continue;
    }
    break;
  }
  *a3 = v4;
  if (v47)
  {
    do
      v44 = __ldxr(v47);
    while (__stxr(v44 & 0x7FFFFFFF, v47));
  }
  return result;
}

unint64_t nanov2_allocate_from_block_VARIANT_mp(uint64_t a1, unsigned int *a2, int a3)
{
  unint64_t v3;
  unsigned int v4;
  int v5;
  unint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  __int16 v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  char v17;
  unint64_t v18;

  v3 = 0;
  v4 = *a2;
  v5 = 16 * a3 + 16;
  while (1)
  {
    v6 = 0;
    if ((v4 & 0x80000000) == 0)
      return v6;
    v7 = v4 & 0x7FF;
    if (v7 == 2044)
      return v6;
    v8 = (v4 >> 11) & 0x3FF;
    v9 = (v4 + 2095104) & 0x1FF800 | (v4 + 0x200000) & 0x7FE00000;
    if (v7 != 2043 && v7 != 2045)
    {
      if (!v3)
        v3 = (unint64_t)a2 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)a2) & 0xFC0 | (a2 >> 8) & 0x3F) << 14);
      v16 = v7 - 1;
      v6 = v3 + v16 * v5;
      if (v8)
        v13 = *(_WORD *)(v6 + 8);
      else
        v13 = 2044;
      v14 = v9 | v13 & 0x7FF | 0x80000000;
      do
      {
        v15 = __ldxr(a2);
        if (v15 != v4)
        {
          __clrex();
          v12 = v15;
          goto LABEL_24;
        }
      }
      while (__stxr(v14, a2));
      if (v6)
        goto LABEL_32;
      v17 = 0;
LABEL_26:
      v18 = v3
          ? v3
          : (unint64_t)a2 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)a2) & 0xFC0 | (a2 >> 8) & 0x3F) << 14);
      v6 = v18 + v16 * v5;
      if ((v17 & 1) == 0)
      {
LABEL_32:
        if ((*(_QWORD *)(a1 + 28696) ^ *(_QWORD *)v6) != v6)
          nanov2_guard_corruption_detected();
      }
      return v6;
    }
    if (v8)
      v10 = 2043;
    else
      v10 = 2044;
    v11 = v9 | v10 | 0x80000000;
    while (1)
    {
      v12 = __ldxr(a2);
      if (v12 != v4)
        break;
      if (!__stxr(v11, a2))
      {
        v16 = slots_by_size_class[a3] + ~v8;
        v17 = 1;
        goto LABEL_26;
      }
    }
    __clrex();
LABEL_24:
    v4 = v12;
    if ((v12 & 0x7FF) - 2045 < 3)
    {
      nanov2_madvise_block_VARIANT_mp((const os_unfair_lock *)a1, a2, a3, 2047);
      return 0;
    }
  }
}

uint64_t nanov2_forked_malloc_VARIANT_mp(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 24))();
}

uint64_t nanov2_forked_malloc_type_VARIANT_mp(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 160))();
}

unint64_t nanov2_forked_free_VARIANT_mp(unint64_t result, unint64_t a2)
{
  unint64_t v3;

  if (a2)
  {
    v3 = result;
    result = nanov2_pointer_size_VARIANT_mp(result, a2, 0);
    if (a2 >> 29 != 24 && !result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 28704) + 48))();
  }
  return result;
}

uint64_t nanov2_forked_realloc_VARIANT_mp(uint64_t a1, const void *a2, size_t a3)
{
  unint64_t v6;
  size_t v7;
  uint64_t (*v8)(void);
  void *v9;
  void *v10;
  size_t v11;

  if (!a2)
  {
    v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 24);
    return v8();
  }
  v6 = nanov2_pointer_size_VARIANT_mp(a1, (unint64_t)a2, 0);
  if (!v6)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 56))();
  v7 = v6;
  v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 24);
  if (!a3)
    return v8();
  v9 = (void *)v8();
  v10 = v9;
  if (v9)
  {
    if (v7 >= a3)
      v11 = a3;
    else
      v11 = v7;
    memcpy(v9, a2, v11);
  }
  return (uint64_t)v10;
}

uint64_t nanov2_forked_realloc_type_VARIANT_mp(uint64_t a1, const void *a2, size_t a3, uint64_t a4)
{
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  size_t v13;

  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 160))();
  v8 = nanov2_pointer_size_VARIANT_mp(a1, (unint64_t)a2, 0);
  if (!v8)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 176))();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 28704);
  if (!a3)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v10, 1);
  v11 = (void *)(*(uint64_t (**)(uint64_t, size_t, uint64_t))(v10 + 160))(v10, a3, a4);
  v12 = v11;
  if (v11)
  {
    if (v9 >= a3)
      v13 = a3;
    else
      v13 = v9;
    memcpy(v11, a2, v13);
  }
  return (uint64_t)v12;
}

unint64_t nanov2_forked_batch_free_VARIANT_mp(unint64_t result, uint64_t a2, int a3)
{
  unint64_t v4;
  unsigned int v5;
  unint64_t v6;

  if (a3)
  {
    v4 = result;
    v5 = a3 - 1;
    do
    {
      v6 = *(_QWORD *)(a2 + 8 * v5);
      if (v6)
        result = nanov2_forked_free_VARIANT_mp(v4, v6);
    }
    while ((unint64_t)v5--);
  }
  return result;
}

void nanov2_guard_corruption_detected()
{
  malloc_zone_error(256, 1, (uint64_t)"Heap corruption detected, free list is damaged at %p\n*** Incorrect guard value: %llu\n");
  __break(1u);
}

uint64_t nanov2_size_VARIANT_armv81(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unsigned int v4;
  unint64_t v5;

  if ((a2 & 0xFFFFFFFFE000000FLL) != 0x300000000)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 16))();
  if (*(_QWORD *)(a1 + 28720) > a2 || *(_QWORD *)(a1 + 28728) < a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 16))();
  v3 = ptr_offset_to_size_class[((a2 >> 14) & 0xFFF ^ *(_DWORD *)(a1 + 28680)) >> 6];
  v4 = *(_DWORD *)((*(_QWORD *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000)
                 + 4 * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F)) & 0x7FF;
  if (v4 > 0x7FD)
  {
    if (v4 - 2046 < 2)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 16))();
    goto LABEL_13;
  }
  if (!v4 || v4 == 2042)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 16))();
  if (v4 != 2044)
  {
LABEL_13:
    if (((*(_DWORD *)((*(_QWORD *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000)
                     + 4 * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F)) >> 11) & 0x3FF) == slots_by_size_class[v3] - 1)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 16))();
  }
  v5 = 16 * (int)v3 + 16;
  if ((a2 & 0x3FFF) == (a2 & 0x3FFF) / v5 * v5 && (_DWORD)v5 && (*(_QWORD *)(a1 + 28696) ^ *(_QWORD *)a2) != a2)
    return v5;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 16))();
}

_QWORD *nanov2_malloc_VARIANT_armv81(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;
  atomic_uint *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  atomic_uint *v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  __int16 v20;
  unsigned int v21;
  int v23;
  char v24;

  if (a2 <= 0x10)
    v2 = 16;
  else
    v2 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v2 > 0x100)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 24))();
  v3 = (v2 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v4) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
      v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    LODWORD(v4) = v4 % nano_common_max_magazines;
  }
  v5 = v4 & 0x3F;
  v6 = a1 + (v3 << 9) + 8 * (v4 & 0x3F);
  v7 = *(atomic_uint **)(v6 + 0x4000);
  if (v7)
  {
    v8 = 0;
    v9 = *v7;
    v10 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
    v11 = 16 * v3 + 16;
    while (1)
    {
      v12 = 0;
      if ((v9 & 0x80000000) == 0)
      {
        v14 = 0;
        return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0);
      }
      v13 = v9 & 0x7FF;
      v14 = 0;
      if (v13 == 2044)
        return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0);
      v15 = (v9 >> 11) & 0x3FF;
      v16 = (v9 + 2095104) & 0x1FF800 | (v9 + 0x200000) & 0x7FE00000;
      if (v13 == 2043 || v13 == 2045)
      {
        if (v15)
          v17 = 2043;
        else
          v17 = 2044;
        v18 = v16 | v17 | 0x80000000;
        v19 = v9;
        atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v19, v18, memory_order_relaxed, memory_order_relaxed);
        if ((_DWORD)v19 == (_DWORD)v9)
        {
          v23 = slots_by_size_class[v3] + ~v15;
          v24 = 1;
          goto LABEL_28;
        }
      }
      else
      {
        if (!v8)
          v8 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
        v23 = v13 - 1;
        v14 = v8 + v23 * v11;
        if (v15)
          v20 = *(_WORD *)(v14 + 8);
        else
          v20 = 2044;
        v21 = v16 | v20 & 0x7FF | 0x80000000;
        v19 = v9;
        atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v19, v21, memory_order_relaxed, memory_order_relaxed);
        if ((_DWORD)v19 == (_DWORD)v9)
        {
          if (v14)
            goto LABEL_36;
          v24 = 0;
LABEL_28:
          if (!v8)
            v8 = v10;
          v14 = v8 + v23 * v11;
          if ((v24 & 1) != 0)
          {
            if (!v14)
            {
LABEL_32:
              v12 = 0;
              return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0);
            }
          }
          else
          {
LABEL_36:
            if ((*(_QWORD *)(a1 + 28696) ^ *(_QWORD *)v14) != v14)
              goto LABEL_32;
          }
          *(_QWORD *)v14 = 0;
          *(_QWORD *)(v14 + 8) = 0;
          return (_QWORD *)v14;
        }
      }
      v9 = v19;
      if ((v19 & 0x7FF) - 2045 < 3)
      {
        v14 = 0;
        v12 = v7;
        return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0);
      }
    }
  }
  v12 = 0;
  v14 = 0;
  return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0, 0);
}

_QWORD *nanov2_malloc_type_VARIANT_armv81(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;
  atomic_uint *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  atomic_uint *v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  __int16 v21;
  unsigned int v22;
  int v24;
  char v25;

  v3 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (a2 <= 0x10)
    v3 = 16;
  if (v3 > 0x100)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 160))();
  v4 = (v3 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    v5 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v5) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
      v5 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    LODWORD(v5) = v5 % nano_common_max_magazines;
  }
  v6 = v5 & 0x3F;
  v7 = a1 + (v4 << 9) + 8 * (v5 & 0x3F);
  v8 = *(atomic_uint **)(v7 + 0x4000);
  if (v8)
  {
    v9 = 0;
    v10 = *v8;
    v11 = (unint64_t)v8 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v8) & 0xFC0 | (v8 >> 8) & 0x3F) << 14);
    v12 = 16 * v4 + 16;
    while (1)
    {
      v13 = 0;
      if ((v10 & 0x80000000) == 0)
      {
        v15 = 0;
        return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
      }
      v14 = v10 & 0x7FF;
      v15 = 0;
      if (v14 == 2044)
        return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
      v16 = (v10 >> 11) & 0x3FF;
      v17 = (v10 + 2095104) & 0x1FF800 | (v10 + 0x200000) & 0x7FE00000;
      if (v14 == 2043 || v14 == 2045)
      {
        if (v16)
          v18 = 2043;
        else
          v18 = 2044;
        v19 = v17 | v18 | 0x80000000;
        v20 = v10;
        atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v20, v19, memory_order_relaxed, memory_order_relaxed);
        if ((_DWORD)v20 == (_DWORD)v10)
        {
          v24 = slots_by_size_class[v4] + ~v16;
          v25 = 1;
          goto LABEL_27;
        }
      }
      else
      {
        if (!v9)
          v9 = (unint64_t)v8 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v8) & 0xFC0 | (v8 >> 8) & 0x3F) << 14);
        v24 = v14 - 1;
        v15 = v9 + v24 * v12;
        if (v16)
          v21 = *(_WORD *)(v15 + 8);
        else
          v21 = 2044;
        v22 = v17 | v21 & 0x7FF | 0x80000000;
        v20 = v10;
        atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v20, v22, memory_order_relaxed, memory_order_relaxed);
        if ((_DWORD)v20 == (_DWORD)v10)
        {
          if (v15)
            goto LABEL_35;
          v25 = 0;
LABEL_27:
          if (!v9)
            v9 = v11;
          v15 = v9 + v24 * v12;
          if ((v25 & 1) != 0)
          {
            if (!v15)
            {
LABEL_31:
              v13 = 0;
              return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
            }
          }
          else
          {
LABEL_35:
            if ((*(_QWORD *)(a1 + 28696) ^ *(_QWORD *)v15) != v15)
              goto LABEL_31;
          }
          *(_QWORD *)v15 = 0;
          *(_QWORD *)(v15 + 8) = 0;
          return (_QWORD *)v15;
        }
      }
      v10 = v20;
      if ((v20 & 0x7FF) - 2045 < 3)
      {
        v15 = 0;
        v13 = v8;
        return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
      }
    }
  }
  v13 = 0;
  v15 = 0;
  return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v7 + 0x4000), v3, v4, v6, v13, v15, 0, 1, a3);
}

void nanov2_free_definite_size_VARIANT_armv81(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  unint64_t v5;
  int v6;
  BOOL v7;
  atomic_uint *v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v16;

  if (!a2 || (unint64_t)a2 >> 29 != 24)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 28704) + 120))();
    return;
  }
  v5 = a3 >> 4;
  if ((a3 & 0xF) != 0)
    LODWORD(v5) = v5 + 1;
  v6 = v5 - 1;
  if (malloc_zero_policy)
    v7 = 1;
  else
    v7 = (_DWORD)v5 == 1;
  if (!v7)
    bzero(a2 + 2, a3 - 16);
  v8 = (atomic_uint *)((*(_QWORD *)(a1 + 28688) ^ (unint64_t)a2 & 0xFFFFFFFFFC000000)
                     + 4 * (((unint64_t)a2 >> 8) & 0xFC0 | ((unint64_t)a2 >> 20) & 0x3F));
  v9 = *v8;
  v10 = slots_by_size_class[v6];
  *a2 = *(_QWORD *)(a1 + 28696) ^ (unint64_t)a2;
  while (1)
  {
    v11 = v9 & 0x7FF;
    v12 = (v9 + 2048) & 0x1FF800;
    v13 = (v9 + 0x200000) & 0x7FE00000 | v9 & 0x80000000;
    if (v11 == 2044)
    {
      v11 = 2043;
      goto LABEL_19;
    }
    if (v10 - 1 == v12 >> 11)
      break;
LABEL_19:
    v15 = v12 | v13 | ((unsigned __int16)(((unsigned __int16)a2 & 0x3FFF) / (16 * v6 + 16)) + 1) & 0x7FF;
    a2[1] = v11;
    v16 = v9;
    atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v16, v15, memory_order_release, memory_order_relaxed);
    if ((_DWORD)v16 == (_DWORD)v9)
      goto LABEL_25;
LABEL_20:
    v9 = v16;
  }
  a2[1] = 0;
  if ((int)v9 < 0)
    v14 = 2043;
  else
    v14 = 2045;
  v15 = v14 | v12 | v13;
  v16 = v9;
  atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v16, v15, memory_order_release, memory_order_relaxed);
  if ((_DWORD)v16 != (_DWORD)v9)
    goto LABEL_20;
  if ((v9 & 0x80000000) == 0 && !nanov2_madvise_policy)
  {
    nanov2_madvise_block_VARIANT_armv81((const os_unfair_lock *)a1, v8, v6, 2045);
    return;
  }
LABEL_25:
  if ((v15 & 0x80000000) == 0
    && ((1 << v6) & *(unsigned __int16 *)(a1 + 28672)) != 0
    && (double)v10 * 0.75 <= (double)((v15 >> 11) & 0x3FF))
  {
    atomic_fetch_and_explicit((atomic_ushort *volatile)(a1 + 28672), ~(unsigned __int16)(1 << v6), memory_order_relaxed);
  }
}

void nanov2_madvise_block_VARIANT_armv81(const os_unfair_lock *a1, atomic_uint *a2, int a3, int a4)
{
  unint64_t v8;
  os_unfair_lock_s *v9;

  v8 = (unint64_t)a2 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)a2) & 0xFC0 | (a2 >> 8) & 0x3F) << 14);
  v9 = (os_unfair_lock_s *)&a1[7184];
  os_unfair_lock_lock_with_options();
  nanov2_madvise_block_locked_0(a1, a2, v8, a3, a4);
  os_unfair_lock_unlock(v9);
}

void nanov2_free_VARIANT_armv81(uint64_t a1, unint64_t a2)
{
  _nanov2_free_0(a1, a2, 0);
}

void nanov2_try_free_default_VARIANT_armv81(uint64_t a1, unint64_t a2)
{
  _nanov2_free_0(a1, a2, 1);
}

_QWORD *nanov2_calloc_VARIANT_armv81(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  atomic_uint *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  atomic_uint *v14;
  int v15;
  _QWORD *v16;
  unsigned int v17;
  int v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  __int16 v22;
  unsigned int v23;
  int v25;
  char v26;

  v3 = a3;
  if (a2 != 1)
  {
    if (!is_mul_ok(a2, a3) || (v3 = a2 * a3, a2 * a3 > malloc_absolute_max_size))
    {
      v16 = 0;
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return v16;
    }
  }
  if (v3 <= 0x10)
    v4 = 16;
  else
    v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v3 > 0x100)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 32))();
  v5 = (v4 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v6) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
      v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    LODWORD(v6) = v6 % nano_common_max_magazines;
  }
  v7 = v6 & 0x3F;
  v8 = a1 + (v5 << 9) + 8 * (v6 & 0x3F);
  v9 = *(atomic_uint **)(v8 + 0x4000);
  if (!v9)
  {
    v14 = 0;
    v16 = 0;
    return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0);
  }
  v10 = 0;
  v11 = *v9;
  v12 = (unint64_t)v9 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
  v13 = 16 * v5 + 16;
  while (1)
  {
    v14 = 0;
    if ((v11 & 0x80000000) == 0)
    {
      v16 = 0;
      return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0);
    }
    v15 = v11 & 0x7FF;
    v16 = 0;
    if (v15 == 2044)
      return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0);
    v17 = (v11 >> 11) & 0x3FF;
    v18 = (v11 + 2095104) & 0x1FF800 | (v11 + 0x200000) & 0x7FE00000;
    if (v15 != 2043 && v15 != 2045)
      break;
    if (v17)
      v19 = 2043;
    else
      v19 = 2044;
    v20 = v18 | v19 | 0x80000000;
    v21 = v11;
    atomic_compare_exchange_strong_explicit(v9, (unsigned int *)&v21, v20, memory_order_relaxed, memory_order_relaxed);
    if ((_DWORD)v21 == (_DWORD)v11)
    {
      v25 = slots_by_size_class[v5] + ~v17;
      v26 = 1;
      goto LABEL_33;
    }
LABEL_27:
    v11 = v21;
    if ((v21 & 0x7FF) - 2045 < 3)
    {
      v16 = 0;
      v14 = v9;
      return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0);
    }
  }
  if (!v10)
    v10 = (unint64_t)v9 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
  v25 = v15 - 1;
  v16 = (_QWORD *)(v10 + v25 * v13);
  if (v17)
    v22 = *((_WORD *)v16 + 4);
  else
    v22 = 2044;
  v23 = v18 | v22 & 0x7FF | 0x80000000;
  v21 = v11;
  atomic_compare_exchange_strong_explicit(v9, (unsigned int *)&v21, v23, memory_order_relaxed, memory_order_relaxed);
  if ((_DWORD)v21 != (_DWORD)v11)
    goto LABEL_27;
  if (v16)
    goto LABEL_41;
  v26 = 0;
LABEL_33:
  if (!v10)
    v10 = v12;
  v16 = (_QWORD *)(v10 + v25 * v13);
  if ((v26 & 1) != 0)
  {
    if (!v16)
    {
LABEL_37:
      v14 = 0;
      return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0, 0);
    }
  }
  else
  {
LABEL_41:
    if ((_QWORD *)(*(_QWORD *)(a1 + 28696) ^ *v16) != v16)
      goto LABEL_37;
  }
  if (malloc_zero_policy)
  {
    bzero(v16, v4);
  }
  else
  {
    *v16 = 0;
    v16[1] = 0;
  }
  return v16;
}

_QWORD *nanov2_calloc_type_VARIANT_armv81(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  atomic_uint *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  atomic_uint *v15;
  int v16;
  _QWORD *v17;
  unsigned int v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  __int16 v23;
  unsigned int v24;
  int v26;
  char v27;

  v4 = a3;
  if (a2 != 1)
  {
    if (!is_mul_ok(a2, a3) || (v4 = a2 * a3, a2 * a3 > malloc_absolute_max_size))
    {
      v17 = 0;
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return v17;
    }
  }
  if (v4 <= 0x10)
    v5 = 16;
  else
    v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v4 > 0x100)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 168))();
  v6 = (v5 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    v7 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v7) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
      v7 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    LODWORD(v7) = v7 % nano_common_max_magazines;
  }
  v8 = v7 & 0x3F;
  v9 = a1 + (v6 << 9) + 8 * (v7 & 0x3F);
  v10 = *(atomic_uint **)(v9 + 0x4000);
  if (!v10)
  {
    v15 = 0;
    v17 = 0;
    return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v9 + 0x4000), v5, (v5 >> 4) - 1, v8, v15, (uint64_t)v17, 1, 1, a4);
  }
  v11 = 0;
  v12 = *v10;
  v13 = (unint64_t)v10 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v10) & 0xFC0 | (v10 >> 8) & 0x3F) << 14);
  v14 = 16 * v6 + 16;
  while (1)
  {
    v15 = 0;
    if ((v12 & 0x80000000) == 0)
    {
      v17 = 0;
      return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v9 + 0x4000), v5, (v5 >> 4) - 1, v8, v15, (uint64_t)v17, 1, 1, a4);
    }
    v16 = v12 & 0x7FF;
    v17 = 0;
    if (v16 == 2044)
      return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v9 + 0x4000), v5, (v5 >> 4) - 1, v8, v15, (uint64_t)v17, 1, 1, a4);
    v18 = (v12 >> 11) & 0x3FF;
    v19 = (v12 + 2095104) & 0x1FF800 | (v12 + 0x200000) & 0x7FE00000;
    if (v16 != 2043 && v16 != 2045)
      break;
    if (v18)
      v20 = 2043;
    else
      v20 = 2044;
    v21 = v19 | v20 | 0x80000000;
    v22 = v12;
    atomic_compare_exchange_strong_explicit(v10, (unsigned int *)&v22, v21, memory_order_relaxed, memory_order_relaxed);
    if ((_DWORD)v22 == (_DWORD)v12)
    {
      v26 = slots_by_size_class[v6] + ~v18;
      v27 = 1;
      goto LABEL_33;
    }
LABEL_27:
    v12 = v22;
    if ((v22 & 0x7FF) - 2045 < 3)
    {
      v17 = 0;
      v15 = v10;
      return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v9 + 0x4000), v5, (v5 >> 4) - 1, v8, v15, (uint64_t)v17, 1, 1, a4);
    }
  }
  if (!v11)
    v11 = (unint64_t)v10 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v10) & 0xFC0 | (v10 >> 8) & 0x3F) << 14);
  v26 = v16 - 1;
  v17 = (_QWORD *)(v11 + v26 * v14);
  if (v18)
    v23 = *((_WORD *)v17 + 4);
  else
    v23 = 2044;
  v24 = v19 | v23 & 0x7FF | 0x80000000;
  v22 = v12;
  atomic_compare_exchange_strong_explicit(v10, (unsigned int *)&v22, v24, memory_order_relaxed, memory_order_relaxed);
  if ((_DWORD)v22 != (_DWORD)v12)
    goto LABEL_27;
  if (v17)
    goto LABEL_41;
  v27 = 0;
LABEL_33:
  if (!v11)
    v11 = v13;
  v17 = (_QWORD *)(v11 + v26 * v14);
  if ((v27 & 1) != 0)
  {
    if (!v17)
    {
LABEL_37:
      v15 = 0;
      return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v9 + 0x4000), v5, (v5 >> 4) - 1, v8, v15, (uint64_t)v17, 1, 1, a4);
    }
  }
  else
  {
LABEL_41:
    if ((_QWORD *)(*(_QWORD *)(a1 + 28696) ^ *v17) != v17)
      goto LABEL_37;
  }
  if (malloc_zero_policy)
  {
    bzero(v17, v5);
  }
  else
  {
    *v17 = 0;
    v17[1] = 0;
  }
  return v17;
}

_QWORD *nanov2_malloc_zero_on_alloc_VARIANT_armv81(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;
  atomic_uint *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  atomic_uint *v12;
  int v13;
  _QWORD *v14;
  unsigned int v15;
  int v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  __int16 v20;
  unsigned int v21;
  int v23;
  char v24;

  if (a2 <= 0x10)
    v2 = 16;
  else
    v2 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v2 > 0x100)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 24))();
  v3 = (v2 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v4) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
      v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    LODWORD(v4) = v4 % nano_common_max_magazines;
  }
  v5 = v4 & 0x3F;
  v6 = a1 + (v3 << 9) + 8 * (v4 & 0x3F);
  v7 = *(atomic_uint **)(v6 + 0x4000);
  if (v7)
  {
    v8 = 0;
    v9 = *v7;
    v10 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
    v11 = 16 * v3 + 16;
    while (1)
    {
      v12 = 0;
      if ((v9 & 0x80000000) == 0)
      {
        v14 = 0;
        return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0);
      }
      v13 = v9 & 0x7FF;
      v14 = 0;
      if (v13 == 2044)
        return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0);
      v15 = (v9 >> 11) & 0x3FF;
      v16 = (v9 + 2095104) & 0x1FF800 | (v9 + 0x200000) & 0x7FE00000;
      if (v13 == 2043 || v13 == 2045)
      {
        if (v15)
          v17 = 2043;
        else
          v17 = 2044;
        v18 = v16 | v17 | 0x80000000;
        v19 = v9;
        atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v19, v18, memory_order_relaxed, memory_order_relaxed);
        if ((_DWORD)v19 == (_DWORD)v9)
        {
          v23 = slots_by_size_class[v3] + ~v15;
          v24 = 1;
          goto LABEL_28;
        }
      }
      else
      {
        if (!v8)
          v8 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
        v23 = v13 - 1;
        v14 = (_QWORD *)(v8 + v23 * v11);
        if (v15)
          v20 = *((_WORD *)v14 + 4);
        else
          v20 = 2044;
        v21 = v16 | v20 & 0x7FF | 0x80000000;
        v19 = v9;
        atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v19, v21, memory_order_relaxed, memory_order_relaxed);
        if ((_DWORD)v19 == (_DWORD)v9)
        {
          if (v14)
            goto LABEL_36;
          v24 = 0;
LABEL_28:
          if (!v8)
            v8 = v10;
          v14 = (_QWORD *)(v8 + v23 * v11);
          if ((v24 & 1) != 0)
          {
            if (!v14)
            {
LABEL_32:
              v12 = 0;
              return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0);
            }
          }
          else
          {
LABEL_36:
            if ((_QWORD *)(*(_QWORD *)(a1 + 28696) ^ *v14) != v14)
              goto LABEL_32;
          }
          if (malloc_zero_policy)
          {
            bzero(v14, v2);
          }
          else
          {
            *v14 = 0;
            v14[1] = 0;
          }
          return v14;
        }
      }
      v9 = v19;
      if ((v19 & 0x7FF) - 2045 < 3)
      {
        v14 = 0;
        v12 = v7;
        return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0);
      }
    }
  }
  v12 = 0;
  v14 = 0;
  return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0, 0);
}

_QWORD *nanov2_malloc_type_zero_on_alloc_VARIANT_armv81(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  atomic_uint *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  atomic_uint *v14;
  int v15;
  _QWORD *v16;
  unsigned int v17;
  int v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  __int16 v22;
  unsigned int v23;
  int v25;
  char v26;

  if (a2 <= 0x10)
    v4 = 16;
  else
    v4 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v4 > 0x100)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 160))();
  v5 = (v4 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v6) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
      v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    LODWORD(v6) = v6 % nano_common_max_magazines;
  }
  v7 = v6 & 0x3F;
  v8 = a1 + (v5 << 9) + 8 * (v6 & 0x3F);
  v9 = *(atomic_uint **)(v8 + 0x4000);
  if (v9)
  {
    v10 = 0;
    v11 = *v9;
    v12 = (unint64_t)v9 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
    v13 = 16 * v5 + 16;
    while (1)
    {
      v14 = 0;
      if ((v11 & 0x80000000) == 0)
      {
        v16 = 0;
        return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
      }
      v15 = v11 & 0x7FF;
      v16 = 0;
      if (v15 == 2044)
        return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
      v17 = (v11 >> 11) & 0x3FF;
      v18 = (v11 + 2095104) & 0x1FF800 | (v11 + 0x200000) & 0x7FE00000;
      if (v15 == 2043 || v15 == 2045)
      {
        if (v17)
          v19 = 2043;
        else
          v19 = 2044;
        v20 = v18 | v19 | 0x80000000;
        v21 = v11;
        atomic_compare_exchange_strong_explicit(v9, (unsigned int *)&v21, v20, memory_order_relaxed, memory_order_relaxed);
        if ((_DWORD)v21 == (_DWORD)v11)
        {
          v25 = slots_by_size_class[v5] + ~v17;
          v26 = 1;
          goto LABEL_28;
        }
      }
      else
      {
        if (!v10)
          v10 = (unint64_t)v9 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
        v25 = v15 - 1;
        v16 = (_QWORD *)(v10 + v25 * v13);
        if (v17)
          v22 = *((_WORD *)v16 + 4);
        else
          v22 = 2044;
        v23 = v18 | v22 & 0x7FF | 0x80000000;
        v21 = v11;
        atomic_compare_exchange_strong_explicit(v9, (unsigned int *)&v21, v23, memory_order_relaxed, memory_order_relaxed);
        if ((_DWORD)v21 == (_DWORD)v11)
        {
          if (v16)
            goto LABEL_36;
          v26 = 0;
LABEL_28:
          if (!v10)
            v10 = v12;
          v16 = (_QWORD *)(v10 + v25 * v13);
          if ((v26 & 1) != 0)
          {
            if (!v16)
            {
LABEL_32:
              v14 = 0;
              return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
            }
          }
          else
          {
LABEL_36:
            if ((_QWORD *)(*(_QWORD *)(a1 + 28696) ^ *v16) != v16)
              goto LABEL_32;
          }
          if (malloc_zero_policy)
          {
            bzero(v16, v4);
          }
          else
          {
            *v16 = 0;
            v16[1] = 0;
          }
          return v16;
        }
      }
      v11 = v21;
      if ((v21 & 0x7FF) - 2045 < 3)
      {
        v16 = 0;
        v14 = v9;
        return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
      }
    }
  }
  v14 = 0;
  v16 = 0;
  return nanov2_allocate_outlined_0(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 1, a3);
}

_QWORD *nanov2_realloc_VARIANT_armv81(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  unint64_t v7;
  size_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;

  v4 = a1;
  if (!a2)
  {
    v10 = a3;
    return nanov2_malloc_VARIANT_armv81(a1, v10);
  }
  v5 = (const void *)a2;
  v6 = *(_QWORD *)(a1 + 28704);
  v7 = nanov2_pointer_size_VARIANT_mp(a1, a2, 0);
  if (!v7)
    return (_QWORD *)(*(uint64_t (**)(uint64_t, const void *, unint64_t))(v6 + 56))(v6, v5, a3);
  v8 = v7;
  if (a3 >= 0x101)
  {
    v9 = (_QWORD *)(*(uint64_t (**)(uint64_t, unint64_t))(v6 + 24))(v6, a3);
    goto LABEL_21;
  }
  if (!a3)
  {
    _nanov2_free_0(v4, (unint64_t)v5, 0);
    a1 = v4;
    v10 = 0;
    return nanov2_malloc_VARIANT_armv81(a1, v10);
  }
  if (a3 <= 0x10)
    v12 = 16;
  else
    v12 = (a3 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v12 <= v7 && v12 > v7 >> 1)
  {
    if (v7 != a3)
    {
      if (v7 <= a3)
        nanov2_realloc_VARIANT_mp_cold_1(v7);
      if ((*(_BYTE *)(v4 + 28676) & 0x20) != 0)
        _platform_memset();
    }
    return v5;
  }
  v9 = nanov2_malloc_VARIANT_armv81(v4, v12);
LABEL_21:
  v13 = v9;
  if (!v9)
    return 0;
  if (v8 >= a3)
    v14 = a3;
  else
    v14 = v8;
  memcpy(v9, v5, v14);
  _nanov2_free_0(v4, (unint64_t)v5, 0);
  return v13;
}

_QWORD *nanov2_realloc_type_VARIANT_armv81(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  const void *v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  _QWORD *v11;
  unint64_t v13;
  _QWORD *v14;
  size_t v15;

  if (!a2)
    return nanov2_malloc_type_VARIANT_armv81(a1, a3, a4);
  v7 = (const void *)a2;
  v8 = *(_QWORD *)(a1 + 28704);
  v9 = nanov2_pointer_size_VARIANT_mp(a1, a2, 0);
  if (!v9)
    return (_QWORD *)(*(uint64_t (**)(uint64_t, const void *, unint64_t, uint64_t))(v8 + 176))(v8, v7, a3, a4);
  v10 = v9;
  if (a3 < 0x101)
  {
    if (!a3)
    {
      _nanov2_free_0(a1, (unint64_t)v7, 0);
      return nanov2_malloc_VARIANT_armv81(a1, 0);
    }
    if (a3 <= 0x10)
      v13 = 16;
    else
      v13 = (a3 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (v13 <= v9 && v13 > v9 >> 1)
    {
      if (v9 != a3)
      {
        if (v9 <= a3)
          nanov2_realloc_VARIANT_mp_cold_1(v9);
        if ((*(_BYTE *)(a1 + 28676) & 0x20) != 0)
          _platform_memset();
      }
      return v7;
    }
    v11 = nanov2_malloc_type_VARIANT_armv81(a1, v13, a4);
  }
  else
  {
    v11 = (_QWORD *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v8 + 160))(v8, a3, a4);
  }
  v14 = v11;
  if (!v11)
    return 0;
  if (v10 >= a3)
    v15 = a3;
  else
    v15 = v10;
  memcpy(v11, v7, v15);
  _nanov2_free_0(a1, (unint64_t)v7, 0);
  return v14;
}

BOOL nanov2_claimed_address_VARIANT_armv81(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  v4 = 1;
  if (!nanov2_pointer_size_VARIANT_mp(a1, a2, 1))
    return malloc_zone_claimed_address(*(_QWORD *)(a1 + 28704), a2) != 0;
  return v4;
}

uint64_t nanov2_batch_malloc_VARIANT_armv81(uint64_t a1, unint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v7;
  int v8;
  _QWORD *v9;

  v4 = a4;
  if (a2 <= 0x10)
    v7 = 16;
  else
    v7 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v7 > 0x100)
  {
    v8 = 0;
    return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 28704) + 80))() + v8;
  }
  v8 = 0;
  if ((_DWORD)a4)
  {
    while (1)
    {
      v9 = nanov2_malloc_VARIANT_armv81(a1, v7);
      if (!v9)
        break;
      *a3++ = v9;
      if ((_DWORD)v4 == ++v8)
        return v4;
    }
  }
  if (v8 != (_DWORD)v4)
    return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 28704) + 80))() + v8;
  return v4;
}

void nanov2_batch_free_VARIANT_armv81(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v5;
  unint64_t v6;

  if (a3)
  {
    v5 = a3 - 1;
    do
    {
      v6 = *(_QWORD *)(a2 + 8 * v5);
      if (v6)
        _nanov2_free_0(a1, v6, 0);
    }
    while ((unint64_t)v5--);
  }
}

_QWORD *nanov2_memalign_VARIANT_armv81(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 > 0x10)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 112))();
  else
    return nanov2_malloc_VARIANT_armv81(a1, a3);
}

_QWORD *nanov2_memalign_type_VARIANT_armv81(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a2 > 0x10)
    return (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 184))();
  else
    return nanov2_malloc_type_VARIANT_armv81(a1, a3, a4);
}

unint64_t nanov2_pressure_relief_VARIANT_armv81(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  atomic_uint *v11;
  unsigned __int16 v12;
  unsigned int i;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;

  if ((nanov2_madvise_policy - 3) < 0xFFFFFFFE)
    return 0;
  v20 = malloc_tracing_enabled;
  if (malloc_tracing_enabled)
    kdebug_trace();
  v5 = *(_QWORD *)(a1 + 28720);
  v6 = atomic_load((unint64_t *)(a1 + 28728));
  v22 = v5;
  v2 = 0;
  if (v5)
  {
    v21 = v6;
    v19 = (v6 - 1) & 0xFFFFFFFFE0000000;
    v7 = ((*(_DWORD *)(a1 + 28680) >> 6) | (*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF;
    do
    {
      v8 = v22;
      v9 = v22 + 0x20000000;
      if (v22 == v19)
        v9 = v21;
      v23 = v9;
      while (1)
      {
        v10 = *(_QWORD *)(a1 + 28688);
        if (v8 >= v23)
          break;
        v11 = (atomic_uint *)(v10 ^ v8 & 0xFFFFFFFFFC000000);
        os_unfair_lock_lock_with_options();
        v12 = 0;
        for (i = 0; i != 4096; ++i)
        {
          if (v7 != i && (*v11 & 0x7FF) == 0x7FD)
          {
            v14 = v8 + ((unint64_t)((v12 | (unsigned __int16)(i >> 6)) & 0xFFF) << 14);
            if (nanov2_madvise_block_locked_0((const os_unfair_lock *)a1, v11, v14, ptr_offset_to_size_class[(*(_DWORD *)(a1 + 28680) ^ (v14 >> 14) & 0xFC0) >> 6], 2045))v2 += 0x4000;
          }
          ++v11;
          v12 += 64;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 28736));
        v8 += 0x4000000;
        if (a2 - 1 < v2)
          goto LABEL_25;
      }
      v15 = *(unsigned __int16 *)((v10 ^ v22 & 0xFFFFFFFFFC000000)
                                + 4
                                * (((unsigned __int16)(*(_DWORD *)(a1 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF));
      v16 = v22 + (v15 << 29);
      if (v16 >= v21)
        v16 = 0;
      if ((_DWORD)v15)
        v17 = v16;
      else
        v17 = 0;
      v22 = v17;
    }
    while (v17);
  }
LABEL_25:
  if (v20)
    kdebug_trace();
  return v2;
}

unint64_t nanov2_find_block_and_allocate_VARIANT_armv81(uint64_t a1, unsigned int a2, atomic_uint **a3)
{
  atomic_uint *v4;
  atomic_uint *v5;
  uint64_t v6;
  unint64_t new_region;
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  _BOOL4 v15;
  unsigned int v16;
  unint64_t v17;
  atomic_uint *v18;
  atomic_uint *v19;
  _BOOL4 v20;
  unint64_t v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  atomic_uint v28;
  int v29;
  int v30;
  int v31;
  atomic_uint v32;
  uint64_t v33;
  BOOL v35;
  uint64_t v36;
  unint64_t result;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  atomic_uint *v43;
  int v44;
  os_unfair_lock_s *lock;
  unint64_t *v47;
  unint64_t v48;
  int v49;
  unint64_t v50;
  unint64_t v51;

  v4 = *a3;
  v5 = *a3;
  if (!*a3)
    v5 = *(atomic_uint **)(a1 + 28720);
  v6 = a2;
  new_region = (unint64_t)v5 & 0xFFFFFFFFFC000000;
  v8 = ((slots_by_size_class[a2] << 11) + 2095104) & 0x1FF800 | 0x7FB;
  v44 = 1 << a2;
  lock = (os_unfair_lock_s *)(a1 + 28716);
  v41 = (_BYTE *)(a1 + 28676);
  v47 = (unint64_t *)(a1 + 28728);
  v43 = *a3;
LABEL_4:
  while (2)
  {
    v9 = new_region & 0xFFFFFFFFE0000000;
    v10 = atomic_load(v47);
    v11 = (v10 - 1) & 0xFFFFFFFFE0000000;
    v12 = (new_region & 0xFFFFFFFFE0000000) + 0x20000000;
    v48 = v10;
    v50 = new_region;
    if (v11 == (new_region & 0xFFFFFFFFE0000000))
      v12 = v10;
    v13 = nanov2_policy_config;
    v14 = unk_1ECCD9424;
    while (2)
    {
      v15 = v4 == 0;
      v16 = first_block_offset_by_size_class[v6] ^ *(_DWORD *)(a1 + 28680);
      v17 = (*(_QWORD *)(a1 + 28688) ^ new_region & 0xFFFFFFFFFC000000)
          + 4 * (((unsigned __int16)(v16 >> 6) | (unsigned __int16)((_WORD)v16 << 6)) & 0xFFF);
      if (v4)
        v17 = (unint64_t)v4;
      if (!v13)
        v15 = 1;
LABEL_11:
      v18 = 0;
      v19 = 0;
      v20 = 1;
      v21 = v17;
      v22 = v14;
      while (1)
      {
        while (1)
        {
          if ((*(_DWORD *)v21 & 0x80000000) != 0)
            goto LABEL_17;
          switch(*(_DWORD *)v21 & 0x7FF)
          {
            case 0x7FC:
            case 0x7FE:
              goto LABEL_17;
            case 0x7FD:
              if (!v18)
                v18 = (atomic_uint *)v21;
              if (!v15)
                goto LABEL_17;
              break;
            default:
              if (!v19)
                v19 = (atomic_uint *)v21;
              if (!v15)
                goto LABEL_17;
              break;
          }
          if ((unint64_t)v19 != (unsigned __int128)0)
            break;
          v19 = 0;
LABEL_17:
          if (v22 >= 1 && (unint64_t)v19 != (unsigned __int128)0 && !--v22)
            break;
          v23 = *(_DWORD *)(a1 + 28680);
          v24 = ((16 * v21) & 0xFC0 | (v21 >> 8) & 0x3F) ^ v23;
          if (v20)
          {
            v25 = first_block_offset_by_size_class[v6];
            if (v24 == v25)
            {
              v26 = last_block_offset_by_size_class[v6];
              v22 = v14;
            }
            else
            {
              v26 = v24 - 1;
            }
            v35 = v24 == v25;
            v20 = v24 != v25;
            v21 = v21 & 0xFFFFFFFFFFFFC000 | (4
                                              * (((unsigned __int16)((v26 ^ v23) >> 6) | (unsigned __int16)(((unsigned __int16)v26 ^ (unsigned __int16)v23) << 6)) & 0xFFF));
            if (v35)
              v21 = v17;
          }
          else
          {
            if (v24 == last_block_offset_by_size_class[v6])
              v27 = first_block_offset_by_size_class[v6];
            else
              v27 = v24 + 1;
            v21 = v21 & 0xFFFFFFFFFFFFC000 | (4
                                              * (((unsigned __int16)((v27 ^ v23) >> 6) | (unsigned __int16)(((unsigned __int16)v27 ^ (unsigned __int16)v23) << 6)) & 0xFFF));
            if (v21 == v17)
              break;
            v20 = 0;
          }
        }
        v4 = v19;
        if (!v19)
        {
          v4 = v18;
          if (!v18)
            break;
        }
        v18 = 0;
        v19 = 0;
        v28 = *v4;
        v29 = *v4 & 0x7FF;
        v20 = 1;
        v21 = v17;
        v22 = v14;
        if (v29 != 2046)
        {
          if (!v29 || v29 == 2045 || v29 == 2047)
          {
            v30 = 0;
            v31 = v8;
          }
          else
          {
            v31 = v28 & 0x1FFFFF;
            v30 = (v28 + 0x200000) & 0x7FE00000;
          }
          v32 = *v4;
          atomic_compare_exchange_strong_explicit(v4, (unsigned int *)&v32, v31 | v30 | 0x80000000, memory_order_relaxed, memory_order_relaxed);
          v13 = nanov2_policy_config;
          v14 = unk_1ECCD9424;
          if (v32 != v28)
            goto LABEL_11;
          result = nanov2_allocate_from_block_VARIANT_armv81(a1, v4, a2);
          if (!result)
          {
            atomic_fetch_and_explicit(v4, 0x7FFFFFFFu, memory_order_relaxed);
            goto LABEL_4;
          }
          *a3 = v4;
          if (v43)
            atomic_fetch_and_explicit(v43, 0x7FFFFFFFu, memory_order_relaxed);
          return result;
        }
      }
      new_region += 0x4000000;
      if (new_region >= v12)
      {
        v33 = *(unsigned __int16 *)((*(_QWORD *)(a1 + 28688) ^ v9 & 0xFFFFFFFFFC000000)
                                  + 4
                                  * (((unsigned __int16)(*(_DWORD *)(a1 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF));
        new_region = v9 + (v33 << 29);
        v35 = (_DWORD)v33 == 0;
        v12 = v48;
        v35 = v35 || new_region >= v48 || v9 == 0;
        if (v35)
          new_region = *(_QWORD *)(a1 + 28720);
        if (new_region != v11)
          v12 = new_region + 0x20000000;
        v9 = new_region;
      }
      v4 = 0;
      if (new_region != v50)
        continue;
      break;
    }
    if (((unsigned __int16)v44 & (unsigned __int16)word_1ECCD9428) == 0)
    {
      os_unfair_lock_lock_with_options();
      v36 = *(_QWORD *)(a1 + 28728);
      new_region = v48;
      if (v36 != v48)
      {
        new_region = v36 - 0x4000000;
LABEL_64:
        os_unfair_lock_unlock(lock);
        v4 = 0;
        continue;
      }
      if ((v36 & 0xFFFFFFFFE0000000) != v48)
      {
        *(_QWORD *)(a1 + 28728) = v48 + 0x4000000;
        goto LABEL_70;
      }
      new_region = nanov2_allocate_new_region();
      if (new_region)
      {
LABEL_70:
        if ((*v41 & 7) != 0)
        {
          v49 = ((unsigned __int16)(*(_DWORD *)(a1 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF;
          v38 = new_region;
          v39 = new_region & 0xFFFFFFFFFC000000;
          *(_DWORD *)((*(_QWORD *)(a1 + 28688) ^ v39) + ((unint64_t)(v49 == 0) << 8)) = -2147481606;
          v51 = v38;
          if (mprotect((void *)(v38 + ((unint64_t)(v49 == 0) << 14)), 0x4000uLL, 1))
            malloc_report(3u, (uint64_t)"Failed to create guard block at %p (%d)\n");
          if (v49 == 4095)
            v40 = 4094;
          else
            v40 = 4095;
          *(_DWORD *)((*(_QWORD *)(a1 + 28688) ^ v39) + 4 * (((v40 & 0x3F) << 6) | 0x3F)) = -2147481606;
          new_region = v51;
          if (mprotect((void *)(v51 + (v40 << 14)), 0x4000uLL, 1))
            malloc_report(3u, (uint64_t)"Failed to create guard block at %p (%d)\n");
        }
        goto LABEL_64;
      }
      os_unfair_lock_unlock(lock);
    }
    return 0;
  }
}

unint64_t nanov2_allocate_from_block_VARIANT_armv81(uint64_t a1, atomic_uint *a2, int a3)
{
  unint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  __int16 v13;
  unsigned int v14;
  int v15;
  char v16;
  unint64_t v17;

  v3 = 0;
  v4 = *a2;
  v5 = 16 * a3 + 16;
  while (1)
  {
    v6 = 0;
    if ((v4 & 0x80000000) == 0)
      return v6;
    v7 = v4 & 0x7FF;
    if (v7 == 2044)
      return v6;
    v8 = (v4 >> 11) & 0x3FF;
    v9 = (v4 + 2095104) & 0x1FF800 | (v4 + 0x200000) & 0x7FE00000;
    if (v7 != 2043 && v7 != 2045)
      break;
    if (v8)
      v10 = 2043;
    else
      v10 = 2044;
    v11 = v9 | v10 | 0x80000000;
    v12 = v4;
    atomic_compare_exchange_strong_explicit(a2, (unsigned int *)&v12, v11, memory_order_relaxed, memory_order_relaxed);
    if ((_DWORD)v12 == (_DWORD)v4)
    {
      v15 = slots_by_size_class[a3] + ~v8;
      v16 = 1;
      goto LABEL_19;
    }
LABEL_17:
    v4 = v12;
    if ((v12 & 0x7FF) - 2045 < 3)
    {
      nanov2_madvise_block_VARIANT_armv81((const os_unfair_lock *)a1, a2, a3, 2047);
      return 0;
    }
  }
  if (!v3)
    v3 = (unint64_t)a2 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)a2) & 0xFC0 | (a2 >> 8) & 0x3F) << 14);
  v15 = v7 - 1;
  v6 = v3 + v15 * v5;
  if (v8)
    v13 = *(_WORD *)(v6 + 8);
  else
    v13 = 2044;
  v14 = v9 | v13 & 0x7FF | 0x80000000;
  v12 = v4;
  atomic_compare_exchange_strong_explicit(a2, (unsigned int *)&v12, v14, memory_order_relaxed, memory_order_relaxed);
  if ((_DWORD)v12 != (_DWORD)v4)
    goto LABEL_17;
  if (v6)
  {
LABEL_25:
    if ((*(_QWORD *)(a1 + 28696) ^ *(_QWORD *)v6) != v6)
      nanov2_guard_corruption_detected();
    return v6;
  }
  v16 = 0;
LABEL_19:
  if (v3)
    v17 = v3;
  else
    v17 = (unint64_t)a2 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * (_DWORD)a2) & 0xFC0 | (a2 >> 8) & 0x3F) << 14);
  v6 = v17 + v15 * v5;
  if ((v16 & 1) == 0)
    goto LABEL_25;
  return v6;
}

uint64_t nanov2_forked_malloc_VARIANT_armv81(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 24))();
}

uint64_t nanov2_forked_malloc_type_VARIANT_armv81(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 160))();
}

unint64_t nanov2_forked_free_VARIANT_armv81(unint64_t result, unint64_t a2)
{
  unint64_t v3;

  if (a2)
  {
    v3 = result;
    result = nanov2_pointer_size_VARIANT_mp(result, a2, 0);
    if (a2 >> 29 != 24 && !result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 28704) + 48))();
  }
  return result;
}

uint64_t nanov2_forked_realloc_VARIANT_armv81(uint64_t a1, const void *a2, size_t a3)
{
  unint64_t v6;
  size_t v7;
  uint64_t (*v8)(void);
  void *v9;
  void *v10;
  size_t v11;

  if (!a2)
  {
    v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 24);
    return v8();
  }
  v6 = nanov2_pointer_size_VARIANT_mp(a1, (unint64_t)a2, 0);
  if (!v6)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 56))();
  v7 = v6;
  v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 24);
  if (!a3)
    return v8();
  v9 = (void *)v8();
  v10 = v9;
  if (v9)
  {
    if (v7 >= a3)
      v11 = a3;
    else
      v11 = v7;
    memcpy(v9, a2, v11);
  }
  return (uint64_t)v10;
}

uint64_t nanov2_forked_realloc_type_VARIANT_armv81(uint64_t a1, const void *a2, size_t a3, uint64_t a4)
{
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  size_t v13;

  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 160))();
  v8 = nanov2_pointer_size_VARIANT_mp(a1, (unint64_t)a2, 0);
  if (!v8)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 176))();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 28704);
  if (!a3)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v10, 1);
  v11 = (void *)(*(uint64_t (**)(uint64_t, size_t, uint64_t))(v10 + 160))(v10, a3, a4);
  v12 = v11;
  if (v11)
  {
    if (v9 >= a3)
      v13 = a3;
    else
      v13 = v9;
    memcpy(v11, a2, v13);
  }
  return (uint64_t)v12;
}

unint64_t nanov2_forked_batch_free_VARIANT_armv81(unint64_t result, uint64_t a2, int a3)
{
  unint64_t v4;
  unsigned int v5;
  unint64_t v6;

  if (a3)
  {
    v4 = result;
    v5 = a3 - 1;
    do
    {
      v6 = *(_QWORD *)(a2 + 8 * v5);
      if (v6)
        result = nanov2_forked_free_VARIANT_armv81(v4, v6);
    }
    while ((unint64_t)v5--);
  }
  return result;
}

uint64_t bitarray_size(unsigned int a1)
{
  if (a1 < 0xA)
    return 64;
  else
    return 8
         * (*(_DWORD *)((char *)&levels_num_words
                                    + (((954437177 * (unint64_t)(a1 - 10)) >> 31) & 0x7FFFFFFC))
                        + (1 << (a1 - 6)));
}

void *bitarray_create(unsigned int a1)
{
  size_t v1;

  if (a1 < 0xA)
    v1 = 64;
  else
    v1 = 8
       * (*(_DWORD *)((char *)&levels_num_words
                                  + (((954437177 * (unint64_t)(a1 - 10)) >> 31) & 0x7FFFFFFC))
                      + (1 << (a1 - 6)));
  return j__calloc(1uLL, v1);
}

uint64_t bitarray_get(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;

  if (a2 > 9)
  {
    a1 += 8
        * *(unsigned int *)((char *)&levels_num_words + (((954437177 * (unint64_t)(a2 - 10)) >> 31) & 0x7FFFFFFC))
        + 8 * ((a3 >> 6) & 0x3FFFFF8);
    v3 = (a3 >> 6) & 7;
  }
  else
  {
    v3 = a3 >> 6;
  }
  return (*(_QWORD *)(a1 + 8 * v3) >> a3) & 1;
}

uint64_t bitarray_set(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (a2 <= 9)
  {
    v3 = a3 >> 6;
    v4 = *(_QWORD *)(a1 + 8 * v3);
    v5 = v4 | (1 << a3);
    if (v4 != v5)
    {
      *(_QWORD *)(a1 + 8 * v3) = v5;
      return 1;
    }
    return 0;
  }
  v6 = (a2 - 10) / 9uLL;
  v7 = a3 >> 9;
  v8 = a1 + 8 * levels_num_words[v6] + 64 * (a3 >> 9);
  v9 = (a3 >> 6) & 7;
  v10 = *(_QWORD *)(v8 + 8 * v9);
  v11 = v10 | (1 << a3);
  if (v10 == v11)
    return 0;
  *(_QWORD *)(v8 + 8 * v9) = v11;
  if (v10)
    return 1;
  switch((int)v6)
  {
    case 0:
      goto LABEL_10;
    case 1:
      goto LABEL_16;
    case 2:
      goto LABEL_14;
    case 3:
      v14 = a1 + 64 * (a3 >> 18) + 16810048;
      v15 = (a3 >> 15) & 7;
      v16 = *(_QWORD *)(v14 + 8 * v15);
      v12 = 1;
      v17 = v16 | (1 << v7);
      if (v16 == v17)
        return v12;
      *(_QWORD *)(v14 + 8 * v15) = v17;
      if (v16)
        return 1;
      v7 = a3 >> 18;
LABEL_14:
      v18 = (v7 >> 6) & 7;
      v12 = 1;
      v19 = 1 << v7;
      v7 >>= 9;
      v20 = a1 + 64 * v7 + 32832;
      v21 = *(_QWORD *)(v20 + 8 * v18);
      v22 = v19 | v21;
      if (v21 == v22)
        return v12;
      *(_QWORD *)(v20 + 8 * v18) = v22;
      if (v21)
        return 1;
LABEL_16:
      v23 = (v7 >> 6) & 7;
      v12 = 1;
      v24 = 1 << v7;
      v7 >>= 9;
      v25 = a1 + 64 * v7 + 64;
      v26 = *(_QWORD *)(v25 + 8 * v23);
      v27 = v24 | v26;
      if (v26 == v27)
        return v12;
      *(_QWORD *)(v25 + 8 * v23) = v27;
      if (v26)
        return 1;
LABEL_10:
      *(_QWORD *)(a1 + 8 * ((v7 >> 6) & 7)) |= 1 << v7;
      v12 = 1;
      break;
    default:
      bitarray_set_cold_1((a2 - 10) / 9uLL);
  }
  return v12;
}

uint64_t bitarray_zap(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v13;
  uint64_t v14;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  if (a2 <= 9)
  {
    v3 = a3 >> 6;
    v4 = *(_QWORD *)(a1 + 8 * v3);
    v5 = v4 & ~(1 << a3);
    if (v4 != v5)
    {
      *(_QWORD *)(a1 + 8 * v3) = v5;
      return 1;
    }
    return 0;
  }
  v6 = (a2 - 10) / 9uLL;
  v7 = (_QWORD *)(a1 + 8 * levels_num_words[v6] + 64 * (a3 >> 9));
  v8 = (a3 >> 6) & 7;
  v9 = v7[v8];
  v10 = v9 & ~(1 << a3);
  if (v9 == v10)
    return 0;
  v7[v8] = v10;
  if (*v7)
    return 1;
  v13 = a3 >> 9;
  v14 = 1;
  do
  {
    if (v14 == 8)
    {
      if (v10)
        return 1;
      goto LABEL_16;
    }
  }
  while (!v7[v14++]);
  v11 = 1;
  if ((unint64_t)(v14 - 2) < 7 || v10)
    return v11;
LABEL_16:
  switch((int)v6)
  {
    case 0:
      goto LABEL_17;
    case 1:
      goto LABEL_33;
    case 2:
      goto LABEL_24;
    case 3:
      v13 = a3 >> 18;
      v16 = (uint64_t *)(a1 + 64 * (a3 >> 18) + 16810048);
      v17 = (a3 >> 15) & 7;
      v18 = v16[v17];
      v11 = 1;
      v19 = v18 & ~(1 << (a3 >> 9));
      if (v18 == v19)
        return v11;
      v16[v17] = v19;
      if (v19)
        return 1;
      v20 = *v16;
      if (*v16)
        return 1;
      break;
    default:
      bitarray_set_cold_1((a2 - 10) / 9uLL);
  }
  while (v20 != 7)
  {
    if (*(_QWORD *)(((a3 >> 12) & 0xFFFC0) + a1 + 16810056 + 8 * v20++))
    {
      if ((unint64_t)(v20 - 1) < 7)
        return 1;
      break;
    }
  }
LABEL_24:
  v22 = v13 >> 9;
  v23 = (uint64_t *)(a1 + 64 * (v13 >> 9) + 32832);
  v24 = (v13 >> 6) & 7;
  v25 = v23[v24];
  v11 = 1;
  v26 = v25 & ~(1 << v13);
  if (v25 != v26)
  {
    v23[v24] = v26;
    if (v26)
      return 1;
    v27 = *v23;
    if (*v23)
      return 1;
    v28 = ((v13 >> 3) & 0xFFFC0) + a1 + 32840;
    do
    {
      if (v27 == 7)
      {
        v13 = v22;
        goto LABEL_33;
      }
    }
    while (!*(_QWORD *)(v28 + 8 * v27++));
    v13 = v22;
    if ((unint64_t)(v27 - 1) < 7)
      return 1;
LABEL_33:
    v30 = v13 >> 9;
    v31 = (uint64_t *)(a1 + 64 * (v13 >> 9) + 64);
    v32 = (v13 >> 6) & 7;
    v33 = v31[v32];
    v11 = 1;
    v34 = v33 & ~(1 << v13);
    if (v33 != v34)
    {
      v31[v32] = v34;
      if (!v34)
      {
        v35 = *v31;
        if (!*v31)
        {
          v36 = ((v13 >> 3) & 0xFFFC0) + a1 + 72;
          do
          {
            if (v35 == 7)
            {
              v13 = v30;
LABEL_17:
              *(_QWORD *)(a1 + 8 * ((v13 >> 6) & 7)) &= ~(1 << v13);
              return 1;
            }
          }
          while (!*(_QWORD *)(v36 + 8 * v35++));
          v13 = v30;
          if ((unint64_t)(v35 - 1) >= 7)
            goto LABEL_17;
        }
      }
      return 1;
    }
  }
  return v11;
}

uint64_t bitarray_first_set(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  int i;
  unint64_t v4;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  unint64_t *v23;
  unint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t v43;
  int v44;

  v2 = 0;
  for (i = 0; ; i -= 64)
  {
    v4 = *(_QWORD *)(a1 + v2);
    if (v4)
      break;
    v2 += 8;
    if (v2 == 64)
      return 0;
  }
  v6 = __clz(__rbit64(v4)) - i;
  if (a2 < 0xA)
    return (v6 + 1);
  v7 = (a2 - 1) / 9;
  switch(v7)
  {
    case 1u:
      goto LABEL_40;
    case 2u:
      v8 = 0;
      a1 += 64;
      v9 = (_DWORD)v6 << 9;
      v10 = (unint64_t *)(a1 + (v6 << 6));
      while (1)
      {
        v12 = *v10++;
        v11 = v12;
        if (v12)
          goto LABEL_25;
        v8 -= 64;
        if (v8 == -512)
          goto LABEL_24;
      }
    case 3u:
      v13 = 0;
      v14 = (unint64_t *)(a1 + (v6 << 6) + 64);
      while (1)
      {
        v16 = *v14++;
        v15 = v16;
        if (v16)
          break;
        v13 -= 64;
        if (v13 == -512)
        {
          v17 = 0;
          goto LABEL_21;
        }
      }
      v17 = __clz(__rbit64(v15)) - v13 + 1;
LABEL_21:
      v8 = 0;
      a1 += 32832;
      v9 = ((((_DWORD)v6 << 9) + v17) << 9) - 512;
      v23 = (unint64_t *)(a1 + 8 * (8 * (v17 + ((_DWORD)v6 << 9)) - 8));
      while (1)
      {
        v24 = *v23++;
        v11 = v24;
        if (v24)
          break;
        v8 -= 64;
        if (v8 == -512)
        {
LABEL_24:
          v25 = 0;
          goto LABEL_26;
        }
      }
LABEL_25:
      v25 = __clz(__rbit64(v11)) - v8 + 1;
LABEL_26:
      v26 = v9 + v25;
      goto LABEL_39;
    case 4u:
      v18 = 0;
      v19 = (unint64_t *)(a1 + (v6 << 6) + 64);
      break;
    default:
      bitarray_first_set_cold_1((a2 - 1) / 9);
  }
  while (1)
  {
    v21 = *v19++;
    v20 = v21;
    if (v21)
      break;
    v18 -= 64;
    if (v18 == -512)
    {
      v22 = 0;
      goto LABEL_28;
    }
  }
  v22 = __clz(__rbit64(v20)) - v18 + 1;
LABEL_28:
  v27 = 0;
  v28 = (unint64_t *)(a1 + 8 * (8 * (v22 + ((_DWORD)v6 << 9)) - 8) + 32832);
  while (1)
  {
    v30 = *v28++;
    v29 = v30;
    if (v30)
      break;
    v27 -= 64;
    if (v27 == -512)
    {
      v31 = 0;
      goto LABEL_33;
    }
  }
  v31 = __clz(__rbit64(v29)) - v27 + 1;
LABEL_33:
  v32 = 0;
  a1 += 16810048;
  v33 = ((((((_DWORD)v6 << 9) + v22) << 9) - 512 + v31) << 9) - 512;
  v34 = (unint64_t *)(a1 + 8 * (8 * (v31 + (v22 << 9) + ((_DWORD)v6 << 18)) - 4104));
  while (1)
  {
    v36 = *v34++;
    v35 = v36;
    if (v36)
      break;
    v32 -= 64;
    if (v32 == -512)
    {
      v37 = 0;
      goto LABEL_38;
    }
  }
  v37 = __clz(__rbit64(v35)) - v32 + 1;
LABEL_38:
  v26 = v33 + v37;
LABEL_39:
  LODWORD(v6) = v26 - 1;
LABEL_40:
  v38 = 0;
  v39 = a1 + 8 * (8 << (9 * v7 - 9));
  v40 = (_DWORD)v6 << 9;
  v41 = (unint64_t *)(v39 + 8 * (8 * v6));
  while (1)
  {
    v43 = *v41++;
    v42 = v43;
    if (v43)
      break;
    v38 -= 64;
    if (v38 == -512)
    {
      v44 = 0;
      return (v44 + v40);
    }
  }
  v44 = __clz(__rbit64(v42)) - v38 + 1;
  return (v44 + v40);
}

BOOL bitarray_zap_first_set(uint64_t a1, int a2, unsigned int *a3)
{
  int v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  int v28;
  unint64_t *v29;
  unint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  int v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  int v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  uint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t v49;
  int v50;
  unsigned int v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v57;
  uint64_t v58;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unsigned int v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unsigned int v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v3 = 0;
  v4 = 0;
  while (1)
  {
    v5 = *(_QWORD *)(a1 + 8 * v4);
    if (v5)
      break;
    ++v4;
    v3 -= 64;
    if (v4 == 8)
      return v5 != 0;
  }
  v6 = __clz(__rbit64(v5));
  v7 = v6 - v3;
  if ((a2 - 1) > 8)
  {
    v8 = (a2 - 1) / 9u;
    v9 = v8 - 1;
    switch(v8)
    {
      case 1u:
        v10 = a1;
        goto LABEL_42;
      case 2u:
        v11 = 0;
        v10 = a1 + 64;
        v12 = v7 << 9;
        v13 = (unint64_t *)(a1 + 64 + ((unint64_t)(v6 - v3) << 6));
        while (1)
        {
          v15 = *v13++;
          v14 = v15;
          if (v15)
            goto LABEL_27;
          v11 -= 64;
          if (v11 == -512)
            goto LABEL_26;
        }
      case 3u:
        v16 = 0;
        v17 = v7 << 9;
        v18 = (unint64_t *)(a1 + ((unint64_t)(v6 - v3) << 6) + 64);
        while (1)
        {
          v20 = *v18++;
          v19 = v20;
          if (v20)
            break;
          v16 -= 64;
          if (v16 == -512)
          {
            v21 = 0;
            goto LABEL_23;
          }
        }
        v21 = __clz(__rbit64(v19)) - v16 + 1;
LABEL_23:
        v11 = 0;
        v28 = (v17 + v21) << 9;
        v10 = a1 + 32832;
        v12 = v28 - 512;
        v29 = (unint64_t *)(a1 + 32832 + 8 * (8 * (v21 + ((v6 - v3) << 9)) - 8));
        while (1)
        {
          v30 = *v29++;
          v14 = v30;
          if (v30)
            break;
          v11 -= 64;
          if (v11 == -512)
          {
LABEL_26:
            v31 = 0;
            goto LABEL_28;
          }
        }
LABEL_27:
        v31 = __clz(__rbit64(v14)) - v11 + 1;
LABEL_28:
        v32 = v12 + v31;
        goto LABEL_41;
      case 4u:
        v22 = 0;
        v23 = v7 << 9;
        v24 = (unint64_t *)(a1 + ((unint64_t)(v6 - v3) << 6) + 64);
        break;
      default:
        bitarray_first_set_cold_1(v8);
    }
    while (1)
    {
      v26 = *v24++;
      v25 = v26;
      if (v26)
        break;
      v22 -= 64;
      if (v22 == -512)
      {
        v27 = 0;
        goto LABEL_30;
      }
    }
    v27 = __clz(__rbit64(v25)) - v22 + 1;
LABEL_30:
    v33 = 0;
    v34 = ((v23 + v27) << 9) - 512;
    v35 = (unint64_t *)(a1 + 8 * (8 * (v27 + ((v6 - v3) << 9)) - 8) + 32832);
    while (1)
    {
      v37 = *v35++;
      v36 = v37;
      if (v37)
        break;
      v33 -= 64;
      if (v33 == -512)
      {
        v38 = 0;
        goto LABEL_35;
      }
    }
    v38 = __clz(__rbit64(v36)) - v33 + 1;
LABEL_35:
    v39 = 0;
    v40 = (v34 + v38) << 9;
    v10 = a1 + 16810048;
    v41 = v40 - 512;
    v42 = (unint64_t *)(a1 + 16810048 + 8 * (8 * (v38 + (v27 << 9) + ((v6 - v3) << 18)) - 4104));
    while (1)
    {
      v44 = *v42++;
      v43 = v44;
      if (v44)
        break;
      v39 -= 64;
      if (v39 == -512)
      {
        v45 = 0;
        goto LABEL_40;
      }
    }
    v45 = __clz(__rbit64(v43)) - v39 + 1;
LABEL_40:
    v32 = v41 + v45;
LABEL_41:
    v7 = v32 - 1;
LABEL_42:
    v46 = 0;
    v47 = (unint64_t *)(v10 + 8 * (8 << (9 * v8 - 9)) + 64 * v7);
    while (1)
    {
      v49 = *v47++;
      v48 = v49;
      if (v49)
        break;
      v46 -= 64;
      if (v46 == -512)
      {
        v50 = 0;
        goto LABEL_47;
      }
    }
    v50 = __clz(__rbit64(v48)) - v46 + 1;
LABEL_47:
    v51 = (v7 << 9) + v50 - 1;
    *a3 = v51;
    v52 = (_QWORD *)(a1 + 8 * levels_num_words[v9] + 64 * (v51 >> 9));
    v53 = (v51 >> 6) & 7;
    v54 = v52[v53];
    v55 = v54 & ~(1 << v51);
    if (v54 != v55)
    {
      v52[v53] = v55;
      if (!*v52)
      {
        v57 = v51 >> 9;
        v58 = 1;
        do
        {
          if (v58 == 8)
          {
            if (v55)
              return v5 != 0;
            goto LABEL_57;
          }
        }
        while (!v52[v58++]);
        if (v55 || (unint64_t)(v58 - 2) < 7)
          return v5 != 0;
LABEL_57:
        switch((int)v9)
        {
          case 0:
            goto LABEL_58;
          case 1:
            goto LABEL_75;
          case 2:
            goto LABEL_66;
          case 3:
            v57 = v51 >> 18;
            v60 = (uint64_t *)(a1 + 64 * (v51 >> 18) + 16810048);
            v61 = (v51 >> 15) & 7;
            v62 = v60[v61];
            v63 = v62 & ~(1 << (v51 >> 9));
            if (v62 == v63)
              return v5 != 0;
            v60[v61] = v63;
            if (v63)
              return v5 != 0;
            v64 = *v60;
            if (v64)
              return v5 != 0;
            v65 = ((v51 >> 12) & 0xFFFC0) + a1 + 16810056;
            break;
          default:
            bitarray_set_cold_1(v9);
        }
        while (v64 != 7)
        {
          if (*(_QWORD *)(v65 + 8 * v64++))
          {
            if ((unint64_t)(v64 - 1) < 7)
              return v5 != 0;
            break;
          }
        }
LABEL_66:
        v67 = v57 >> 9;
        v68 = (uint64_t *)(a1 + 64 * (v57 >> 9) + 32832);
        v69 = (v57 >> 6) & 7;
        v70 = v68[v69];
        v71 = v70 & ~(1 << v57);
        if (v70 != v71)
        {
          v68[v69] = v71;
          if (!v71)
          {
            v72 = *v68;
            if (!v72)
            {
              v73 = ((v57 >> 3) & 0xFFFC0) + a1 + 32840;
              do
              {
                if (v72 == 7)
                {
                  v57 = v67;
                  goto LABEL_75;
                }
              }
              while (!*(_QWORD *)(v73 + 8 * v72++));
              v57 = v67;
              if ((unint64_t)(v72 - 1) < 7)
                return v5 != 0;
LABEL_75:
              v75 = v57 >> 9;
              v76 = (uint64_t *)(a1 + 64 * (v57 >> 9) + 64);
              v77 = (v57 >> 6) & 7;
              v78 = v76[v77];
              v79 = v78 & ~(1 << v57);
              if (v78 != v79)
              {
                v76[v77] = v79;
                if (!v79)
                {
                  v80 = *v76;
                  if (!v80)
                  {
                    v81 = ((v57 >> 3) & 0xFFFC0) + a1 + 72;
                    do
                    {
                      if (v80 == 7)
                      {
                        v57 = v75;
LABEL_58:
                        v4 = (v57 >> 6) & 7;
                        LOBYTE(v6) = v57 & 0x3F;
                        goto LABEL_7;
                      }
                    }
                    while (!*(_QWORD *)(v81 + 8 * v80++));
                    v57 = v75;
                    if ((unint64_t)(v80 - 1) >= 7)
                      goto LABEL_58;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    *a3 = v7;
LABEL_7:
    *(_QWORD *)(a1 + 8 * v4) &= ~(1 << v6);
  }
  return v5 != 0;
}

uint64_t bitarray_zap_first_set_multiple(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  int v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  uint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  unint64_t v45;
  int v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  if (a2 <= 9)
    return FFS_and_zap_word(a1, a3, a4, 0);
  v8 = 0;
  if (a3)
  {
    v9 = a1 + 64;
    v73 = a1 + 32832;
    v72 = a1 + 16810048;
    v68 = (a2 - 1) / 9;
    v69 = a1 + 16810056;
    v70 = a1 + 32840;
    v71 = a1 + 72;
    do
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *(_QWORD *)(a1 + v11);
        if (v13)
          break;
        v12 -= 64;
        v11 += 8;
        v10 += 64;
        if (v11 == 64)
          return v8;
      }
      v14 = __clz(__rbit64(v13));
      v15 = v14 - v12;
      switch(v68)
      {
        case 1u:
          v16 = a1;
          goto LABEL_44;
        case 2u:
          v17 = 0;
          v18 = (unint64_t *)(v9 + ((unint64_t)(v14 + v10) << 6));
          while (1)
          {
            v20 = *v18++;
            v19 = v20;
            if (v20)
              break;
            v17 -= 64;
            if (v17 == -512)
            {
              v21 = 0;
              goto LABEL_24;
            }
          }
          v21 = __clz(__rbit64(v19)) - v17 + 1;
LABEL_24:
          v15 = (v15 << 9) + v21 - 1;
          v16 = a1 + 64;
          goto LABEL_44;
        case 3u:
          v22 = 0;
          v23 = (unint64_t *)(v9 + ((unint64_t)(v14 + v10) << 6));
          while (1)
          {
            v25 = *v23++;
            v24 = v25;
            if (v25)
              break;
            v22 -= 64;
            if (v22 == -512)
            {
              v26 = 0;
              goto LABEL_26;
            }
          }
          v26 = __clz(__rbit64(v24)) - v22 + 1;
LABEL_26:
          v32 = 0;
          v33 = (unint64_t *)(v73 + 8 * (8 * (v26 + ((v14 + v10) << 9)) - 8));
          while (1)
          {
            v35 = *v33++;
            v34 = v35;
            if (v35)
              break;
            v32 -= 64;
            if (v32 == -512)
            {
              v36 = 0;
              goto LABEL_36;
            }
          }
          v36 = __clz(__rbit64(v34)) - v32 + 1;
LABEL_36:
          v15 = (((v15 << 9) + v26) << 9) - 512 + v36 - 1;
          v16 = v73;
          goto LABEL_44;
        case 4u:
          v27 = 0;
          v28 = (unint64_t *)(v9 + ((unint64_t)(v14 + v10) << 6));
          break;
        default:
          bitarray_first_set_cold_1(v68);
      }
      while (1)
      {
        v30 = *v28++;
        v29 = v30;
        if (v30)
          break;
        v27 -= 64;
        if (v27 == -512)
        {
          v31 = 0;
          goto LABEL_31;
        }
      }
      v31 = __clz(__rbit64(v29)) - v27 + 1;
LABEL_31:
      v37 = 0;
      v38 = (unint64_t *)(v73 + 8 * (8 * (v31 + ((v14 + v10) << 9)) - 8));
      while (1)
      {
        v40 = *v38++;
        v39 = v40;
        if (v40)
          break;
        v37 -= 64;
        if (v37 == -512)
        {
          v41 = 0;
          goto LABEL_38;
        }
      }
      v41 = __clz(__rbit64(v39)) - v37 + 1;
LABEL_38:
      v42 = 0;
      v43 = (unint64_t *)(v72 + 8 * (8 * (v41 + (v31 << 9) + ((v14 + v10) << 18)) - 4104));
      while (1)
      {
        v45 = *v43++;
        v44 = v45;
        if (v45)
          break;
        v42 -= 64;
        if (v42 == -512)
        {
          v46 = 0;
          goto LABEL_43;
        }
      }
      v46 = __clz(__rbit64(v44)) - v42 + 1;
LABEL_43:
      v15 = (((((v15 << 9) + v31) << 9) - 512 + v41) << 9) - 512 + v46 - 1;
      v16 = v72;
LABEL_44:
      v47 = (_QWORD *)(v16 + 8 * (8 << (9 * (v68 - 1))) + 64 * v15);
      v8 = FFS_and_zap_word((uint64_t)v47, a3 - v8, a4 + 4 * v8, v15 << 9)
         + v8;
      if (v8 >= a3)
      {
        if (*v47)
          return v8;
        v48 = 1;
        while (v48 != 8)
        {
          if (v47[v48++])
          {
            if ((unint64_t)(v48 - 2) < 7)
              goto LABEL_72;
            break;
          }
        }
      }
      switch(v68)
      {
        case 1u:
          goto LABEL_46;
        case 2u:
          goto LABEL_69;
        case 3u:
          goto LABEL_61;
        case 4u:
          v50 = (uint64_t *)(v72 + 64 * (v15 >> 9));
          v51 = (v15 >> 6) & 7;
          v52 = v50[v51];
          v53 = v52 & ~(1 << v15);
          if (v52 == v53)
            continue;
          v50[v51] = v53;
          if (v53)
            continue;
          v54 = *v50;
          if (v54)
            continue;
          break;
        default:
          bitarray_first_set_cold_1(v68 - 1);
      }
      do
      {
        if (v54 == 7)
        {
          v15 >>= 9;
          goto LABEL_61;
        }
      }
      while (!*(_QWORD *)(v69 + ((v15 >> 3) & 0x1FFFFFC0) + 8 * v54++));
      v15 >>= 9;
      if ((unint64_t)(v54 - 1) < 7)
        continue;
LABEL_61:
      v56 = (uint64_t *)(v73 + 64 * (v15 >> 9));
      v57 = (v15 >> 6) & 7;
      v58 = v56[v57];
      v59 = v58 & ~(1 << v15);
      if (v58 != v59)
      {
        v56[v57] = v59;
        if (!v59)
        {
          v60 = *v56;
          if (!v60)
          {
            do
            {
              if (v60 == 7)
              {
                v15 >>= 9;
                goto LABEL_69;
              }
            }
            while (!*(_QWORD *)(v70 + ((v15 >> 3) & 0x1FFFFFC0) + 8 * v60++));
            v15 >>= 9;
            if ((unint64_t)(v60 - 1) < 7)
              continue;
LABEL_69:
            v62 = (uint64_t *)(v9 + 64 * (v15 >> 9));
            v63 = (v15 >> 6) & 7;
            v64 = v62[v63];
            v65 = v64 & ~(1 << v15);
            if (v64 != v65)
            {
              v62[v63] = v65;
              if (!v65)
              {
                v66 = *v62;
                if (!v66)
                {
                  while (v66 != 7)
                  {
                    if (*(_QWORD *)(v71 + ((v15 >> 3) & 0x1FFFFFC0) + 8 * v66++))
                    {
                      v15 >>= 9;
                      if ((unint64_t)(v66 - 1) < 7)
                        goto LABEL_72;
LABEL_46:
                      *(_QWORD *)(a1 + 8 * ((v15 >> 6) & 7)) &= ~(1 << v15);
                      goto LABEL_72;
                    }
                  }
                  v15 >>= 9;
                  goto LABEL_46;
                }
              }
            }
          }
        }
      }
LABEL_72:
      ;
    }
    while (v8 < a3);
  }
  return v8;
}

uint64_t FFS_and_zap_word(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;

  v4 = 0;
  v5 = 0;
  do
  {
    v6 = *(_QWORD *)(a1 + 8 * v4);
    if (v6)
    {
      do
      {
        v7 = __clz(__rbit64(v6));
        *(_DWORD *)(a3 + 4 * v5) = a4 + ((_DWORD)v4 << 6) + v7;
        v5 = (v5 + 1);
        v6 &= ~(1 << v7);
      }
      while (v5 < a2 && v6);
      *(_QWORD *)(a1 + 8 * v4) = v6;
      if (v5 >= a2)
        break;
    }
    ++v4;
  }
  while (v4 != 8);
  return v5;
}

BOOL xzm_reclaim_init(uint64_t a1)
{
  int v2;

  word_1EE2280E8 = 0;
  dword_1EE2280E0 = 0;
  v2 = mach_vm_reclaim_ringbuffer_init();
  if (v2)
    malloc_report(3u, (uint64_t)"xzm: failed to initialize deferred reclamation buffer (%d)\n");
  else
    *(_QWORD *)(a1 + 464) = &xzm_reclaim_buffer;
  return v2 == 0;
}

uint64_t xzm_reclaim_mark_used(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  os_unfair_lock_s *v8;
  uint64_t v9;

  v8 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock_with_options();
  if (mach_vm_reclaim_mark_used())
  {
    v9 = *(unsigned __int16 *)(a1 + 40);
    if (v9 >= 0x400)
      xzm_reclaim_mark_used_cold_1();
    *(_WORD *)(a1 + 40) = v9 + 1;
    *(_QWORD *)(a1 + 40 + 8 * v9 + 8) = a2;
    os_unfair_lock_unlock(v8);
    return 1;
  }
  else
  {
    os_unfair_lock_unlock(v8);
    if (a5)
      return mach_vm_reclaim_is_reclaimed();
    else
      return 0;
  }
}

uint64_t xzm_reclaim_force_sync()
{
  return mach_vm_reclaim_synchronize();
}

uint64_t xzm_chunk_mark_used(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 232);
  if (!v2)
    v2 = a1;
  v3 = *(_QWORD *)(v2 + 464);
  v4 = *(_BYTE *)(a2 + 32) & 0xF;
  if ((v4 - 6) < 2)
  {
    v5 = (unint64_t)*(unsigned int *)(a2 + 40) << 14;
  }
  else if (v4 == 2)
  {
    v5 = 0x4000;
  }
  else
  {
    if (v4 != 5)
      xzm_chunk_mark_free_cold_1(*(_BYTE *)(a2 + 32) & 0xF);
    v5 = 0x10000;
  }
  v6 = -1431655765 * (((unint64_t)(a2 & 0x3FFF) - 2104) >> 4);
  v7 = (_QWORD *)((a2 & 0xFFFFFFFFFFFFC000) + 8 * v6 + 56);
  result = xzm_reclaim_mark_used(v3, *(_QWORD *)((a2 & 0xFFFFFFFFFFFFC000) + 8 * v6 + 0x38), *(_QWORD *)((a2 & 0xFFFFFFFFFFFFC000) + 0x30) + (v6 << 14), v5, 1);
  if ((_DWORD)result)
    *v7 = -1;
  return result;
}

uint64_t _xzm_segment_group_alloc_segment_and_chunk(os_unfair_lock_s *a1, int a2, unsigned __int8 *a3, uint64_t *a4, unsigned int a5, unint64_t a6)
{
  uint64_t chunk;

  chunk = 0;
  if (_xzm_segment_group_alloc_segment((uint64_t)a1, 0, 0, 0, 0))
  {
    chunk = _xzm_segment_group_find_and_allocate_chunk((uint64_t)a1, a2, a3, a4, a5, a6);
    os_unfair_lock_unlock(a1 + 1);
  }
  os_unfair_lock_unlock(a1 + 2);
  return chunk;
}

uint64_t _xzm_segment_group_overwrite_chunk(mach_vm_address_t a1, mach_vm_size_t size)
{
  uint64_t result;
  mach_vm_address_t address;

  address = a1;
  result = mach_vm_map(*MEMORY[0x1E0C883F0], &address, size, 0, 33570816, 0, 0, 0, 3, 7, 1u);
  if ((_DWORD)result)
    xzm_segment_group_alloc_chunk_cold_3(result);
  return result;
}

uint64_t _xzm_segment_group_span_mark_free(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t result;

  v2 = (a2 & 0xFFFFFFFFFFFFC000)
     + 0xFFFFFFFD55555558 * (((unint64_t)(a2 & 0x3FFF) - 2104) >> 4);
  result = xzm_reclaim_mark_free(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 464));
  *(_QWORD *)(v2 + 56) = result;
  return result;
}

uint64_t _xzm_segment_group_span_mark_used(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v3 = a2 & 0xFFFFFFFFFFFFC000;
  v4 = -1431655765 * (((unint64_t)(a2 & 0x3FFF) - 2104) >> 4);
  v6 = (_QWORD *)((a2 & 0xFFFFFFFFFFFFC000) + 8 * v4 + 56);
  v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFC000) + 8 * v4 + 0x38);
  if (v5 == -1)
    return 1;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 464);
  if ((*(_BYTE *)(a2 + 32) & 0xF) == 1)
    v8 = 0x4000;
  else
    v8 = (*(_DWORD *)(a2 + 40) << 14);
  result = xzm_reclaim_mark_used(v7, v5, *(_QWORD *)(v3 + 48) + (v4 << 14), v8, 1);
  if ((_DWORD)result)
  {
    *v6 = -1;
    return 1;
  }
  return result;
}

void _xzm_segment_group_cache_invalidate(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  --*(_WORD *)(a1 + 482);
  v2 = a2[3];
  v3 = (_QWORD *)a2[4];
  if (v2)
  {
    *(_QWORD *)(v2 + 32) = v3;
    v3 = (_QWORD *)a2[4];
  }
  else
  {
    *(_QWORD *)(a1 + 472) = v3;
  }
  *v3 = v2;
  xzm_metapool_free(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 400), a2);
}

uint64_t _xzm_segment_group_cache_mark_used(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = xzm_reclaim_mark_used(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 464), *(_QWORD *)(a2 + 40), *(_QWORD *)(a2 + 48), (unint64_t)*(unsigned int *)(a2 + 12) << 14, 0);
  if ((v4 & 1) != 0)
  {
    *(_QWORD *)(a2 + 40) = -1;
    --*(_WORD *)(a1 + 482);
    v5 = *(_QWORD *)(a2 + 24);
    v6 = *(_QWORD **)(a2 + 32);
    if (v5)
    {
      *(_QWORD *)(v5 + 32) = v6;
      v6 = *(_QWORD **)(a2 + 32);
    }
    else
    {
      *(_QWORD *)(a1 + 472) = v6;
    }
    *v6 = v5;
  }
  else
  {
    _xzm_segment_group_cache_invalidate(a1, (_QWORD *)a2);
  }
  return v4;
}

uint64_t _xzm_segment_group_segment_create_guard(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unsigned int v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  unsigned int v11;
  int v12;

  v2 = a1 + 2104 + 48 * a2;
  if (v2 + 48 < a1 + 2104 + 48 * (unint64_t)*(unsigned int *)(a1 + 16) && (*(_BYTE *)(v2 + 80) & 0xF) == 8)
    v3 = *(_DWORD *)(v2 + 88) + 1;
  else
    v3 = 1;
  if (v2 <= a1 + 2104)
    goto LABEL_9;
  v4 = v2 - 48;
  if ((*(_BYTE *)(v2 - 16) & 0xF) == 4)
  {
    v10 = v4 - *(unsigned int *)(v2 - 12);
    v11 = *(_BYTE *)(v10 + 32) & 0xF;
    if (v11 <= 8)
    {
      v12 = 1 << v11;
      if ((v12 & 0x1E8) != 0)
      {
        if (v10 + 48 * *(unsigned int *)(v10 + 40) <= v4)
          goto LABEL_7;
        goto LABEL_26;
      }
      if ((v12 & 6) != 0 && v4 == v10)
LABEL_26:
        v4 -= *(unsigned int *)(v2 - 12);
    }
  }
LABEL_7:
  if ((*(_BYTE *)(v4 + 32) & 0xF) == 8)
  {
    v5 = *(_DWORD *)(v4 + 40);
    a2 -= v5;
    v3 += v5;
    goto LABEL_10;
  }
LABEL_9:
  v4 = a1 + 2104 + 48 * a2;
LABEL_10:
  if (v3 < 2)
  {
    ++*(_DWORD *)(a1 + 8);
    v7 = v3;
  }
  else
  {
    v6 = 0;
    v7 = v3;
    do
    {
      v8 = v4 + v6;
      *(_DWORD *)(v8 + 84) = v6 + 48;
      *(_BYTE *)(v8 + 80) = *(_BYTE *)(v4 + v6 + 80) & 0xF0 | 4;
      v6 += 48;
    }
    while (48 * v3 - 48 != v6);
  }
  *(_DWORD *)(v4 + 40) = v3;
  result = mprotect((void *)(*(_QWORD *)(a1 + 48) + ((unint64_t)a2 << 14)), v7 << 14, 0);
  if ((_DWORD)result)
    _xzm_segment_group_segment_create_guard_cold_1();
  *(_BYTE *)(v4 + 32) = *(_BYTE *)(v4 + 32) & 0xF0 | 8;
  return result;
}

uint64_t _xzm_random_clear_n_bits(uint64_t a1, uint32_t __upper_bound, int a3)
{
  int v4;
  uint32_t v6;
  int v7;

  if (a3)
  {
    v4 = a3;
    do
    {
      v6 = arc4random_uniform(__upper_bound);
      v7 = a1;
      if (v6)
      {
        v7 = a1;
        do
        {
          v7 &= v7 - 1;
          --v6;
        }
        while (v6);
      }
      a1 = v7 & -v7 ^ a1;
      --__upper_bound;
      --v4;
    }
    while (v4);
  }
  return a1;
}

uint64_t _xzm_segment_group_cache_mark_free(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  BOOL v6;
  _QWORD *v7;

  result = xzm_reclaim_mark_free(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 464));
  v5 = *(_QWORD *)(a1 + 464);
  a2[3] = v5;
  v6 = v5 == 0;
  v7 = (_QWORD *)(v5 + 32);
  if (v6)
    v7 = (_QWORD *)(a1 + 472);
  *v7 = a2 + 3;
  *(_QWORD *)(a1 + 464) = a2;
  a2[4] = a1 + 464;
  a2[5] = result;
  ++*(_WORD *)(a1 + 482);
  return result;
}

_BYTE *malloc_common_strstr(_BYTE *a1)
{
  _BYTE *v1;

  if (!*a1)
    return 0;
  v1 = a1;
  while (_platform_strncmp())
  {
    if (!*++v1)
      return 0;
  }
  return v1;
}

uint64_t malloc_zone_batch_free_fallback(uint64_t result, uint64_t a2, unsigned int a3)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int i;

  if (a3)
  {
    v5 = result;
    v6 = a3 - 1;
    for (i = 1; i <= a3; ++i)
    {
      if (*(_QWORD *)(a2 + 8 * v6))
        result = (*(uint64_t (**)(uint64_t))(v5 + 48))(v5);
      --v6;
    }
  }
  return result;
}

uint64_t malloc_zone_pressure_relief_fallback()
{
  return 0;
}

uint64_t _malloc_is_platform_binary()
{
  getpid();
  if (csops())
    return 0;
  else
    return 0;
}

BOOL _malloc_allow_internal_security_policy()
{
  return MEMORY[0xFFFFF4084] != 0;
}

mach_vm_address_t purgeable_valloc(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x3C00)
    a1 = *(_QWORD *)(a1 + 20456);
  return szone_valloc(a1, a2);
}

uint64_t purgeable_realloc(uint64_t a1, const void *a2, unint64_t a3)
{
  uint64_t v4;
  size_t v6;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  const void *v12;
  size_t v13;
  void *v14;
  uint64_t v15;

  v4 = a1;
  if (!a2)
  {
    if (a3 <= 0x3C00)
      v4 = *(_QWORD *)(a1 + 20456);
    v8 = v4;
    v9 = a3;
    return szone_malloc(v8, v9);
  }
  if (!a3)
  {
    purgeable_free(a1, (unint64_t)a2);
    v8 = *(_QWORD *)(v4 + 20456);
    v9 = 1;
    return szone_malloc(v8, v9);
  }
  v6 = szone_size_try_large(a1, (unint64_t)a2);
  if (!v6)
  {
    v6 = szone_size(*(_QWORD *)(v4 + 20456), (unint64_t)a2);
    if (!v6)
    {
      malloc_zone_error(*(_DWORD *)(v4 + 16392), 1, (uint64_t)"pointer %p being reallocated was not allocated\n");
      return 0;
    }
  }
  if (v6 <= 0x3C00)
  {
    if (a3 <= 0x3C00)
      return szone_realloc(*(_QWORD *)(v4 + 20456), (unint64_t)a2, a3);
    v14 = (void *)szone_malloc(v4, a3);
    v11 = v14;
    if (!v14)
      return (uint64_t)v11;
    memcpy(v14, a2, v6);
    v15 = *(_QWORD *)(v4 + 20456);
    goto LABEL_24;
  }
  if (a3 > 0x3C00)
  {
    v10 = (void *)szone_malloc(v4, a3);
    v11 = v10;
    if (v10)
    {
      if (v6 >= a3)
        v13 = a3;
      else
        v13 = v6;
      v12 = a2;
      goto LABEL_23;
    }
  }
  else
  {
    v10 = (void *)szone_malloc(*(_QWORD *)(v4 + 20456), a3);
    v11 = v10;
    if (v10)
    {
      v12 = a2;
      v13 = a3;
LABEL_23:
      memcpy(v10, v12, v13);
      v15 = v4;
LABEL_24:
      szone_free_definite_size(v15, (unint64_t)a2, v6);
    }
  }
  return (uint64_t)v11;
}

uint64_t purgeable_destroy(uint64_t a1)
{
  unsigned int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v9;
  uint64_t v10;

  v2 = (unsigned int *)(a1 + 16392);
  v3 = *(unsigned int *)(a1 + 18824);
  v9 = 0;
  v10 = 0;
  if ((_DWORD)v3)
  {
    v4 = 24 * v3;
    do
    {
      v5 = *(_QWORD *)(a1 + 18832) + v4;
      v6 = *(_QWORD *)(v5 - 24);
      if (v6)
        mvm_deallocate_pages(v6, *(_QWORD *)(v5 - 16), *v2);
      v4 -= 24;
    }
    while (v4);
    v7 = v2[608];
  }
  else
  {
    v7 = 0;
  }
  large_entries_free_no_lock(a1, *(_QWORD *)(a1 + 18832), v7, &v9);
  if (v10)
    mvm_deallocate_pages(v9, v10, 0);
  return mvm_deallocate_pages(a1, (*MEMORY[0x1E0C88820] + 20479) & -*MEMORY[0x1E0C88820], 0);
}

uint64_t purgeable_batch_malloc(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return szone_batch_malloc(*(_QWORD *)(a1 + 20456), a2, a3, a4);
}

void purgeable_batch_free(uint64_t a1, uint64_t a2, unsigned int a3)
{
  szone_batch_free(*(_QWORD *)(a1 + 20456), a2, a3);
}

mach_vm_address_t purgeable_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a3 <= 0x3C00)
    a1 = *(_QWORD *)(a1 + 20456);
  return szone_memalign(a1, a2, a3);
}

void purgeable_free_definite_size(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a3 <= 0x3C00)
    a1 = *(_QWORD *)(a1 + 20456);
  szone_free_definite_size(a1, a2, a3);
}

uint64_t purgeable_pressure_relief()
{
  uint64_t v0;

  v0 = szone_pressure_relief();
  return szone_pressure_relief() + v0;
}

BOOL purgeable_claimed_address(uint64_t a1, unint64_t a2)
{
  return szone_claimed_address(*(_QWORD *)(a1 + 20456), a2);
}

uint64_t purgeable_ptr_in_use_enumerator(uint64_t task, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(task_name_t a1, uint64_t a2, uint64_t a3, uint64_t *a4))
{
  uint64_t (*v5)(task_name_t, uint64_t, uint64_t, uint64_t *);
  uint64_t is_self;
  uint64_t result;
  uint64_t v10;

  v5 = a5;
  if (!a5)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self)
        nanov2_realloc_VARIANT_mp_cold_1(is_self);
    }
    v5 = _malloc_default_reader;
  }
  v10 = 0;
  result = v5(task, a4, 20480, &v10);
  if (!(_DWORD)result)
    return large_in_use_enumerator();
  return result;
}

uint64_t purgeable_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x3C00)
    a1 = *(_QWORD *)(a1 + 20456);
  return szone_good_size(a1, a2);
}

uint64_t purgeable_check()
{
  return 1;
}

uint64_t purgeable_print_self()
{
  uint64_t result;

  result = *MEMORY[0x1E0C883F0];
  if ((_DWORD)result)
  {
    result = mach_task_is_self(result);
    if (!(_DWORD)result)
      nanov2_realloc_VARIANT_mp_cold_1(result);
  }
  return result;
}

uint64_t purgeable_log(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16400) = a2;
  return result;
}

uint64_t purgeable_force_lock()
{
  return os_unfair_lock_lock_with_options();
}

void purgeable_force_unlock(os_unfair_lock_s *a1)
{
  os_unfair_lock_unlock(a1 + 4704);
}

uint64_t purgeable_locked(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v1;

  v1 = a1 + 4704;
  if (!os_unfair_lock_trylock(a1 + 4704))
    return 1;
  os_unfair_lock_unlock(v1);
  return 0;
}

uint64_t purgeable_reinit_lock(uint64_t result)
{
  *(_DWORD *)(result + 18816) = 0;
  return result;
}

uint64_t purgeable_print_task(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t *), uint64_t (*a5)(const char *, ...))
{
  uint64_t result;
  uint64_t v8;

  v8 = 0;
  result = a4(a1, a3, 20480, &v8);
  if ((_DWORD)result)
    return a5("Purgeable zone %p: inUse=%u(%y) flags=%d\n", a3, *(unsigned int *)(v8 + 18820), *(_QWORD *)(v8 + 18840), *(unsigned int *)(v8 + 16392));
  return result;
}

uint64_t sanitizer_diagnose_fault_from_crash_reporter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  int v15;
  int v16;
  void *v18;

  os_unfair_lock_lock_with_options();
  v10 = (uint64_t *)((uint64_t (*)(uint64_t, uint64_t, uint64_t))a5)(a3, a4, 16680);
  v18 = (void *)((uint64_t (*)(uint64_t, uint64_t, uint64_t))a5)(a3, v10[31], 0x1000000);
  v11 = (void *)((uint64_t (*)(uint64_t, uint64_t, uint64_t))a5)(a3, v10[30], 37748744);
  xmmword_1EE22A108 = 0uLL;
  enumeration_context = a1;
  g_crm_reader = a5;
  num_read_memory = 0;
  szone_ptr_in_use_enumerator(a3, 0, 1, v10[25], (uint64_t (*)(task_name_t, uint64_t, uint64_t, uint64_t *))memory_reader_adapter);
  if (num_read_memory)
  {
    v12 = 0;
    do
      _free((void *)read_memory[v12++]);
    while (v12 < num_read_memory);
  }
  g_crm_reader = 0;
  _platform_memset();
  *(_QWORD *)a2 = a1;
  if ((_QWORD)xmmword_1EE22A108)
  {
    v13 = *((_QWORD *)&xmmword_1EE22A108 + 1);
    *(_QWORD *)(a2 + 8) = xmmword_1EE22A108;
    *(_QWORD *)(a2 + 16) = v13;
    v14 = (_DWORD *)((uint64_t (*)(uint64_t))a5)(a3);
    v15 = v14[2];
    v16 = v14[3];
    *(_QWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 40) = stacktrace_depo_find((uint64_t)v11, v15, a2 + 48);
    *(_QWORD *)(a2 + 560) = 0;
    *(_DWORD *)(a2 + 576) = stacktrace_depo_find((uint64_t)v11, v16, a2 + 584);
    _free(v14);
  }
  _free(v11);
  _free(v18);
  _free(v10);
  os_unfair_lock_unlock((os_unfair_lock_t)&crash_reporter_lock);
  return 0;
}

uint64_t memory_reader_adapter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;

  if (num_read_memory >= 0x400)
    nanov2_realloc_VARIANT_mp_cold_1();
  v5 = g_crm_reader();
  *a4 = v5;
  v6 = num_read_memory++;
  read_memory[v6] = v5;
  if (v5)
    return 0;
  else
    return 5;
}

__n128 pointer_recorder(uint64_t a1, uint64_t a2, uint64_t a3, __n128 *a4, unsigned int a5)
{
  uint64_t v5;
  __n128 result;

  if (a5)
  {
    v5 = a5;
    while (a4->n128_u64[0] > enumeration_context || enumeration_context >= a4->n128_u64[1] + a4->n128_u64[0])
    {
      ++a4;
      if (!--v5)
        return result;
    }
    result = *a4;
    xmmword_1EE22A108 = (__int128)*a4;
  }
  return result;
}

uint64_t stacktrace_depo_find(uint64_t a1, int a2, uint64_t a3)
{
  unint64_t v3;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 8 * (a2 & 0x7FFFF));
  if ((_DWORD)v3 != a2 || (v3 & 0xFFFFFF00000000) > 0x40000000000000)
    return 0;
  v6 = -474048815;
  v7 = HIBYTE(v3);
  if (HIBYTE(v3))
  {
    v8 = 0;
    v9 = HIDWORD(v3);
    if (v7 <= 1)
      v10 = 1;
    else
      v10 = v7;
    do
    {
      if (v8 >= 0x40)
      {
        v11 = *(_QWORD *)(a3 + 8 * v8);
      }
      else
      {
        v11 = *(_QWORD *)(a1 + 8 * (((_DWORD)v9 + (_DWORD)v8) & 0x3FFFFF) + 0x400000);
        *(_QWORD *)(a3 + 8 * v8) = v11;
      }
      v6 = (1540483477
          * ((1540483477 * ((1540483477 * v11) ^ ((1540483477 * v11) >> 24))) ^ (1540483477 * v6))) ^ (1540483477 * ((1540483477 * HIDWORD(v11)) ^ ((1540483477 * HIDWORD(v11)) >> 24)));
      ++v8;
    }
    while (v10 != v8);
  }
  if (v7 >= 0x40)
    LODWORD(v7) = 64;
  if (((1540483477 * (v6 ^ (v6 >> 13))) ^ ((1540483477 * (v6 ^ (v6 >> 13))) >> 15)) == a2)
    return v7;
  else
    return 0;
}

unsigned __int8 *sanitizer_should_enable()
{
  if ((env_BOOL() & 1) != 0)
    return (unsigned __int8 *)1;
  else
    return env_BOOL();
}

unsigned __int8 *env_BOOL()
{
  unsigned __int8 *result;

  _NSGetEnviron();
  result = (unsigned __int8 *)_simple_getenv();
  if (result)
    return (unsigned __int8 *)(*result == 49);
  return result;
}

uint64_t sanitizer_reset_environment()
{
  unsetenv("MallocSanitizerZone");
  return unsetenv("MallocQuarantineZone");
}

mach_vm_address_t sanitizer_create_zone(uint64_t a1)
{
  vm_map_t *v2;
  vm_map_t v3;
  _QWORD *v4;
  uint64_t v5;
  mach_vm_address_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  mach_vm_address_t address;

  v2 = (vm_map_t *)MEMORY[0x1E0C883F0];
  v3 = *MEMORY[0x1E0C883F0];
  v4 = (_QWORD *)MEMORY[0x1E0C88820];
  address = 0;
  v5 = mach_vm_map(v3, &address, (*MEMORY[0x1E0C88820] + 16679) & -*MEMORY[0x1E0C88820], 0, 16777217, 0, 0, 0, 3, 3, 1u);
  if ((_DWORD)v5)
    nanov2_realloc_VARIANT_mp_cold_1(v5);
  v6 = address;
  *(_OWORD *)(address + 32) = xmmword_1E2DF9528;
  *(_OWORD *)(v6 + 48) = *(_OWORD *)&off_1E2DF9538;
  *(_OWORD *)(v6 + 96) = xmmword_1E2DF9568;
  *(_OWORD *)(v6 + 112) = *(_OWORD *)&off_1E2DF9578;
  *(_OWORD *)(v6 + 64) = xmmword_1E2DF9548;
  *(_OWORD *)(v6 + 80) = *(_OWORD *)&off_1E2DF9558;
  *(_QWORD *)(v6 + 192) = 0;
  *(_OWORD *)(v6 + 160) = xmmword_1E2DF95A8;
  *(_OWORD *)(v6 + 176) = unk_1E2DF95B8;
  *(_OWORD *)(v6 + 128) = xmmword_1E2DF9588;
  *(_OWORD *)(v6 + 144) = unk_1E2DF9598;
  *(_OWORD *)v6 = malloc_zone_template;
  *(_OWORD *)(v6 + 16) = *(_OWORD *)&off_1E2DF9518;
  if (*(uint64_t (***)(task_name_t))(a1 + 96) != &szone_introspect)
    nanov2_realloc_VARIANT_mp_cold_1(v5);
  *(_QWORD *)(v6 + 200) = a1;
  if (*(_DWORD *)(a1 + 104) <= 0xCu)
    malloc_report(0x40u, (uint64_t)"Unsupported wrapped zone version: %u\n");
  *(_BYTE *)(v6 + 208) = env_BOOL();
  *(_BYTE *)(v6 + 209) = env_BOOL() ^ 1;
  v7 = env_uint((uint64_t)"MallocSanitizerRedzoneSize", 16);
  *(_QWORD *)(v6 + 216) = v7;
  if ((v7 & 7) != 0)
    nanov2_realloc_VARIANT_mp_cold_1(v7);
  *(_QWORD *)(v6 + 224) = env_uint((uint64_t)"MallocQuarantineMaxItems", 0);
  *(_QWORD *)(v6 + 232) = (unint64_t)env_uint((uint64_t)"MallocQuarantineMaxSizeInMB", 256) << 20;
  v8 = (unsigned __int8 *)MEMORY[0x1E0C88818];
  *(_QWORD *)(v6 + 240) = mvm_allocate_pages(0x2400008uLL, *MEMORY[0x1E0C88818], 0, 10);
  *(_QWORD *)(v6 + 248) = mvm_allocate_pages(0x1000000uLL, *v8, 0, 10);
  *(_DWORD *)(v6 + 16640) = 0;
  v9 = mach_vm_protect(*v2, v6, (*v4 + 0x3FFFLL) & -*v4, 0, 1);
  if ((_DWORD)v9)
    nanov2_realloc_VARIANT_mp_cold_1(v9);
  return v6;
}

unint64_t env_uint(uint64_t a1, uint64_t a2)
{
  const char *v3;

  _NSGetEnviron();
  v3 = (const char *)_simple_getenv();
  if (v3)
    return strtoul(v3, 0, 0);
  return a2;
}

unint64_t sanitizer_size(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 16))();
  v5 = v4;
  if (v4)
  {
    if (*(_BYTE *)(a1 + 209))
    {
      v6 = *(_QWORD *)(a2 + v4 - (v4 & 7) - 8);
      if (*(_QWORD *)(a1 + 216) > v6 || v4 <= v6)
        nanov2_realloc_VARIANT_mp_cold_1(v4);
      if (*(_BYTE *)(a1 + 208))
        malloc_report(6u, (uint64_t)"size(%p) = 0x%lx - redzone 0x%lx\n");
      v5 -= v6;
    }
    else if (*(_BYTE *)(a1 + 208))
    {
      malloc_report(6u, (uint64_t)"size(%p) = 0x%lx\n");
    }
  }
  return v5;
}

uint64_t sanitizer_malloc(uint64_t a1, unint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int128 *v10;
  unint64_t v11;

  if (a2 <= 1)
    v3 = 1;
  else
    v3 = a2;
  v4 = *(_QWORD *)(a1 + 216);
  if (*(_BYTE *)(a1 + 209))
  {
    v4 += -(int)v3 & 7;
    v5 = v4 + v3;
    if (__CFADD__(v4, v3))
    {
      v6 = 0;
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return v6;
    }
  }
  else
  {
    v5 = v3;
  }
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 24))();
  if (v6)
    v7 = *MEMORY[0x1E0C88820] > v3;
  else
    v7 = 0;
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 248);
    thread_stack_pcs();
    v9 = (1540483477 * ((1540483477 * ((1540483477 * v6) ^ ((1540483477 * v6) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(v6)) ^ ((1540483477 * HIDWORD(v6)) >> 24)));
    v10 = (unsigned __int128 *)(v8
                              + 16
                              * ((1540483477 * (v9 ^ (v9 >> 13))) & 0xFFFFF ^ ((1540483477 * (v9 ^ (v9 >> 13))) >> 15)));
    do
      __ldxp(v10);
    while (__stxp((unint64_t)v6, v10));
  }
  if (*(_BYTE *)(a1 + 208))
    malloc_report(6u, (uint64_t)"malloc(0x%lx) = %p\n");
  if (v6 && *(_BYTE *)(a1 + 209))
  {
    v11 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 200) + 16))(*(_QWORD *)(a1 + 200), v6);
    if (v11 < v5)
      nanov2_realloc_VARIANT_mp_cold_1(v11);
    poison_alloc(a1, v6, v3, v4 - v5 + v11);
  }
  return v6;
}

uint64_t sanitizer_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unsigned int v11;
  unsigned __int128 *v12;
  unint64_t v13;

  v3 = a3;
  v5 = 1;
  if (a2 && a3 && (v5 = a3, a2 != 1) && (!is_mul_ok(a2, a3) || (v5 = a2 * a3, a2 * a3 > malloc_absolute_max_size))
    || (v6 = *(_QWORD *)(a1 + 216), *(_BYTE *)(a1 + 209)) && (v6 = v6 - (v5 & 7) + 8, v3 = v6 + v5, __CFADD__(v6, v5)))
  {
    v8 = 0;
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  }
  else
  {
    v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 32))();
    if (*(_BYTE *)(a1 + 208))
      malloc_report(6u, (uint64_t)"calloc(0x%lx, 0x%lx) = %p\n");
    if (v8)
      v9 = *MEMORY[0x1E0C88820] > v5;
    else
      v9 = 0;
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 248);
      thread_stack_pcs();
      v11 = (1540483477 * ((1540483477 * ((1540483477 * v8) ^ ((1540483477 * v8) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(v8)) ^ ((1540483477 * HIDWORD(v8)) >> 24)));
      v12 = (unsigned __int128 *)(v10
                                + 16
                                * ((1540483477 * (v11 ^ (v11 >> 13))) & 0xFFFFF ^ ((1540483477 * (v11 ^ (v11 >> 13))) >> 15)));
      do
        __ldxp(v12);
      while (__stxp((unint64_t)v8, v12));
    }
    else if (!v8)
    {
      return v8;
    }
    if (*(_BYTE *)(a1 + 209))
    {
      v13 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 200) + 16))(*(_QWORD *)(a1 + 200), v8, v7);
      if (v13 < v3)
        nanov2_realloc_VARIANT_mp_cold_1(v13);
      poison_alloc(a1, v8, v5, v6 - v3 + v13);
    }
  }
  return v8;
}

uint64_t sanitizer_valloc(uint64_t a1, unint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int128 *v10;
  unint64_t v11;

  if (a2 <= 1)
    v3 = 1;
  else
    v3 = a2;
  v4 = *(_QWORD *)(a1 + 216);
  if (*(_BYTE *)(a1 + 209))
  {
    v4 = v4 - (v3 & 7) + 8;
    v5 = v4 + v3;
    if (__CFADD__(v4, v3))
      return 0;
  }
  else
  {
    v5 = v3;
  }
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 40))();
  if (v6)
    v7 = *MEMORY[0x1E0C88820] > v3;
  else
    v7 = 0;
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 248);
    thread_stack_pcs();
    v9 = (1540483477 * ((1540483477 * ((1540483477 * v6) ^ ((1540483477 * v6) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(v6)) ^ ((1540483477 * HIDWORD(v6)) >> 24)));
    v10 = (unsigned __int128 *)(v8
                              + 16
                              * ((1540483477 * (v9 ^ (v9 >> 13))) & 0xFFFFF ^ ((1540483477 * (v9 ^ (v9 >> 13))) >> 15)));
    do
      __ldxp(v10);
    while (__stxp((unint64_t)v6, v10));
  }
  if (*(_BYTE *)(a1 + 208))
    malloc_report(6u, (uint64_t)"valloc(0x%lx) = %p\n");
  if (v6 && *(_BYTE *)(a1 + 209))
  {
    v11 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 200) + 16))(*(_QWORD *)(a1 + 200), v6);
    if (v11 < v5)
      nanov2_realloc_VARIANT_mp_cold_1(v11);
    poison_alloc(a1, v6, v3, v4 - v5 + v11);
  }
  return v6;
}

void sanitizer_free(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (*(_BYTE *)(a1 + 209))
  {
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 16))();
    poison_free(a1, a2, v4);
  }
  else
  {
    v4 = 0;
  }
  if (*(_BYTE *)(a1 + 208))
    malloc_report(6u, (uint64_t)"free(%p)\n");
  place_into_quarantine(a1, a2, v4);
}

uint64_t sanitizer_realloc(uint64_t a1, char *a2, unint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  unsigned int v14;
  unsigned __int128 *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  size_t v20;
  unint64_t v21;

  if (a3 <= 1)
    v5 = 1;
  else
    v5 = a3;
  v6 = *(_QWORD *)(a1 + 216);
  if (*(_BYTE *)(a1 + 209))
  {
    v6 = v6 - (v5 & 7) + 8;
    v7 = v6 + v5;
    if (__CFADD__(v6, v5))
      return 0;
  }
  else
  {
    v7 = v5;
  }
  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 24))();
  if (v8)
    v12 = *MEMORY[0x1E0C88820] > v5;
  else
    v12 = 0;
  if (v12)
  {
    v13 = *(_QWORD *)(a1 + 248);
    thread_stack_pcs();
    v14 = (1540483477 * ((1540483477 * ((1540483477 * v8) ^ ((1540483477 * v8) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(v8)) ^ ((1540483477 * HIDWORD(v8)) >> 24)));
    v15 = (unsigned __int128 *)(v13
                              + 16
                              * ((1540483477 * (v14 ^ (v14 >> 13))) & 0xFFFFF ^ ((1540483477 * (v14 ^ (v14 >> 13))) >> 15)));
    do
      __ldxp(v15);
    while (__stxp((unint64_t)v8, v15));
  }
  if (*(_BYTE *)(a1 + 208))
    malloc_report(6u, (uint64_t)"realloc(%p, 0x%lx) = %p\n");
  if (!a2)
  {
    if (!v8)
      return v8;
    goto LABEL_37;
  }
  v16 = (*(uint64_t (**)(_QWORD, char *, uint64_t))(*(_QWORD *)(a1 + 200) + 16))(*(_QWORD *)(a1 + 200), a2, v9);
  v17 = v16;
  if (*(_BYTE *)(a1 + 209))
  {
    v18 = *(_QWORD *)&a2[v16 - (v16 & 7) - 8];
    if (*(_QWORD *)(a1 + 216) > v18 || v16 <= v18)
      nanov2_realloc_VARIANT_mp_cold_1(v16);
  }
  else
  {
    v18 = 0;
  }
  if (*(_BYTE *)(a1 + 208))
    malloc_report(6u, (uint64_t)"realloc(%p, 0x%lx): size(%p) = 0x%lx - redzone 0x%lx)\n");
  if (v8)
  {
    if (v17 - v18 >= v5)
      v20 = v5;
    else
      v20 = v17 - v18;
    memcpy((void *)v8, a2, v20);
    if (*(_BYTE *)(a1 + 209))
      poison_free(a1, (uint64_t)a2, v17);
    place_into_quarantine(a1, (uint64_t)a2, v17);
LABEL_37:
    if (*(_BYTE *)(a1 + 209))
    {
      v21 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 200) + 16))(*(_QWORD *)(a1 + 200), v8, v9, v10, v11);
      if (v21 < v7)
        nanov2_realloc_VARIANT_mp_cold_1(v21);
      poison_alloc(a1, v8, v5, v6 - v7 + v21);
    }
  }
  return v8;
}

uint64_t sanitizer_destroy(mach_vm_address_t a1)
{
  uint64_t result;

  mvm_deallocate_pages(*(_QWORD *)(a1 + 240), 37748744, 0);
  mvm_deallocate_pages(*(_QWORD *)(a1 + 248), 0x1000000, 0);
  malloc_destroy_zone(*(malloc_zone_t **)(a1 + 200));
  result = mach_vm_deallocate(*MEMORY[0x1E0C883F0], a1, (*MEMORY[0x1E0C88820] + 16679) & -*MEMORY[0x1E0C88820]);
  if ((_DWORD)result)
    nanov2_realloc_VARIANT_mp_cold_1(result);
  return result;
}

uint64_t sanitizer_memalign(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unsigned int v10;
  unsigned __int128 *v11;
  unint64_t v12;

  if (a3 <= 1)
    v4 = 1;
  else
    v4 = a3;
  v5 = *(_QWORD *)(a1 + 216);
  v6 = v4;
  if (*(_BYTE *)(a1 + 209))
  {
    v6 = v5 + v4;
    if (__CFADD__(v5, v4))
      return 0;
  }
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 112))();
  if (v7)
    v8 = *MEMORY[0x1E0C88820] > v4;
  else
    v8 = 0;
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 248);
    thread_stack_pcs();
    v10 = (1540483477 * ((1540483477 * ((1540483477 * v7) ^ ((1540483477 * v7) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(v7)) ^ ((1540483477 * HIDWORD(v7)) >> 24)));
    v11 = (unsigned __int128 *)(v9
                              + 16
                              * ((1540483477 * (v10 ^ (v10 >> 13))) & 0xFFFFF ^ ((1540483477 * (v10 ^ (v10 >> 13))) >> 15)));
    do
      __ldxp(v11);
    while (__stxp((unint64_t)v7, v11));
  }
  if (*(_BYTE *)(a1 + 208))
    malloc_report(6u, (uint64_t)"memalign(0x%lx, 0x%lx)\n");
  if (v7 && *(_BYTE *)(a1 + 209))
  {
    v12 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 200) + 16))(*(_QWORD *)(a1 + 200), v7);
    if (v12 < v6)
      nanov2_realloc_VARIANT_mp_cold_1(v12);
    poison_alloc(a1, v7, v4, v5 - v6 + v12);
  }
  return v7;
}

void sanitizer_free_definite_size(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 208))
    malloc_report(6u, (uint64_t)"free_definite_size(%p, 0x%lx)\n");
  if (*(_BYTE *)(a1 + 209))
  {
    a3 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 200) + 16))(*(_QWORD *)(a1 + 200), a2);
    poison_free(a1, a2, a3);
  }
  place_into_quarantine(a1, a2, a3);
}

BOOL sanitizer_claimed_address(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 200) + 136))() != 0;
}

void poison_alloc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (**functions)(uint64_t, _QWORD, uint64_t, uint64_t);

  if (*(_BYTE *)(a1 + 208))
    malloc_report(6u, (uint64_t)"poison_alloc(%p, 0x%lx, 0x%lx)\n");
  if (!*(_BYTE *)(a1 + 209))
    nanov2_realloc_VARIANT_mp_cold_1(a1);
  *(_QWORD *)(((a4 + a3) & 0xFFFFFFFFFFFFFFF8) + a2 - 8) = a4;
  functions = (void (**)(uint64_t, _QWORD, uint64_t, uint64_t))malloc_sanitizer_get_functions();
  if (functions && *functions)
  {
    (*functions)(a2, 0, a3, a4);
  }
  else if (*(_BYTE *)(a1 + 208))
  {
    malloc_report(4u, (uint64_t)"MallocSanitizerZone: Not poisoning allocation %p of size %lu with redzone size %lu due to missing pointers!\n");
  }
}

uint64_t stacktrace_depo_insert(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  unsigned int v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;

  if (a3 >= 0x100)
    nanov2_realloc_VARIANT_mp_cold_1();
  v3 = -474048815;
  if (a3)
  {
    v4 = a2;
    v5 = a3;
    do
    {
      v6 = *v4++;
      v3 = (1540483477
          * ((1540483477 * ((1540483477 * v6) ^ ((1540483477 * v6) >> 24))) ^ (1540483477 * v3))) ^ (1540483477 * ((1540483477 * HIDWORD(v6)) ^ ((1540483477 * HIDWORD(v6)) >> 24)));
      --v5;
    }
    while (v5);
  }
  v7 = (1540483477 * (v3 ^ (v3 >> 13))) ^ ((1540483477 * (v3 ^ (v3 >> 13))) >> 15);
  v8 = v7 & 0x7FFFF;
  v9 = *(_QWORD *)(a1 + 8 * v8);
  if (a3 != HIBYTE(v9) || (_DWORD)v7 != (_DWORD)v9)
  {
    v11 = (unint64_t *)(a1 + 37748736);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + a3, v11));
    for (*(_QWORD *)(a1 + 8 * v8) = v7 | ((unint64_t)(v12 & 0x3FFFFF | ((_DWORD)a3 << 24)) << 32);
          a3;
          --a3)
    {
      v13 = *a2++;
      *(_QWORD *)(a1 + 8 * (v12++ & 0x3FFFFF) + 0x400000) = v13;
    }
  }
  return v7;
}

void poison_free(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t functions;
  void (*v7)(uint64_t, uint64_t);

  if (*(_BYTE *)(a1 + 208))
    malloc_report(6u, (uint64_t)"poison_free(%p, 0x%lx)\n");
  if (!a2)
    nanov2_realloc_VARIANT_mp_cold_1(a1);
  functions = malloc_sanitizer_get_functions();
  if (functions && (v7 = *(void (**)(uint64_t, uint64_t))(functions + 8)) != 0)
  {
    v7(a2, a3);
  }
  else if (*(_BYTE *)(a1 + 208))
  {
    malloc_report(4u, (uint64_t)"MallocSanitizerZone: Not poisoning deallocation %p of size %lu due to missing pointers!\n");
  }
}

void place_into_quarantine(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unsigned int v6;
  unsigned __int128 *v7;
  unsigned __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  BOOL v22;
  unint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (a2)
  {
    v3 = a3;
    if (!a3)
      v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 16))();
    if (v3 <= *MEMORY[0x1E0C88820])
    {
      thread_stack_pcs();
      v6 = (1540483477 * ((1540483477 * ((1540483477 * a2) ^ ((1540483477 * a2) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(a2)) ^ ((1540483477 * HIDWORD(a2)) >> 24)));
      v7 = (unsigned __int128 *)(*(_QWORD *)(a1 + 248)
                               + 16
                               * ((1540483477 * (v6 ^ (v6 >> 13))) & 0xFFFFF ^ ((1540483477 * (v6 ^ (v6 >> 13))) >> 15)));
      do
        v8 = __ldxp(v7);
      while (__stxp(v8, v7));
      v9 = DWORD2(v8);
      if ((_QWORD)v8 != a2)
        v9 = 0;
      v10 = v9;
      os_unfair_lock_lock_with_options();
      if (*(_QWORD *)(a1 + 16664))
        **(_QWORD **)(a1 + 16656) = **(_QWORD **)(a1 + 16656) & 0xFFFF000000000000 | a2 & 0xFFFFFFFFFFFFLL;
      else
        *(_QWORD *)(a1 + 16648) = a2;
      v11 = 0;
      v12 = 0;
      *(_QWORD *)(a1 + 16656) = a2;
      *(_QWORD *)a2 = v3 << 48;
      *(_QWORD *)(*(_QWORD *)(a1 + 16656) + 8) = v10;
      v13 = *(_QWORD *)(a1 + 16664) + 1;
      v14 = *(_QWORD *)(a1 + 16672) + v3;
      v15 = *(_QWORD *)(a1 + 224);
      v16 = *(_QWORD *)(a1 + 232);
      v17 = v13 - v15;
      if (v13 < v15)
        v17 = 0;
      if (v15)
        v18 = v17;
      else
        v18 = 0;
      v19 = v14 - v16;
      if (v14 < v16)
        v19 = 0;
      if (v16)
        v20 = v19;
      else
        v20 = 0;
      v21 = *(uint64_t **)(a1 + 16648);
      v22 = v18 <= 0 && v20 < 1;
      v23 = *(unint64_t **)(a1 + 16648);
      if (!v22)
      {
        v24 = 0;
        v12 = 0;
        v23 = *(unint64_t **)(a1 + 16648);
        do
        {
          do
          {
            v25 = v18 + v24;
            v26 = *v23;
            v12 += HIWORD(v26);
            v20 -= HIWORD(v26);
            v23 = (unint64_t *)(v26 & 0xFFFFFFFFFFFFLL);
            --v24;
          }
          while (v25 > 1);
        }
        while (v20 >= 1);
        v11 = -v24;
      }
      *(_QWORD *)(a1 + 16648) = v23;
      *(_QWORD *)(a1 + 16664) = v13 - v11;
      *(_QWORD *)(a1 + 16672) = v14 - v12;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16640));
      for (; v11; --v11)
      {
        v27 = *v21;
        v28 = HIWORD(*v21);
        if (*(_BYTE *)(a1 + 208))
          malloc_report(6u, (uint64_t)"evicting %p from quarantine, size = 0x%lx\n");
        if (*(_BYTE *)(a1 + 209))
          unpoison(a1, (uint64_t)v21, v28);
        (*(void (**)(_QWORD, uint64_t *))(*(_QWORD *)(a1 + 200) + 120))(*(_QWORD *)(a1 + 200), v21);
        v21 = (uint64_t *)(v27 & 0xFFFFFFFFFFFFLL);
      }
    }
    else
    {
      if (*(_BYTE *)(a1 + 209))
        unpoison(a1, a2, v3);
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 200) + 48))(*(_QWORD *)(a1 + 200), a2);
    }
  }
}

void unpoison(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (**functions)(uint64_t, _QWORD, uint64_t, _QWORD);

  if (*(_BYTE *)(a1 + 208))
    malloc_report(6u, (uint64_t)"unpoison(%p, 0x%lx)\n");
  if (!a2)
    nanov2_realloc_VARIANT_mp_cold_1(a1);
  functions = (void (**)(uint64_t, _QWORD, uint64_t, _QWORD))malloc_sanitizer_get_functions();
  if (functions && *functions)
  {
    (*functions)(a2, 0, a3, 0);
  }
  else if (*(_BYTE *)(a1 + 208))
  {
    malloc_report(4u, (uint64_t)"MallocSanitizerZone: Not unpoisoning %p of size %lu due to missing pointers!\n");
  }
}

uint64_t sanitizer_enumerator()
{
  return 46;
}

uint64_t sanitizer_good_size(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 96) + 8))();
}

uint64_t sanitizer_check()
{
  return 1;
}

uint64_t sanitizer_force_lock()
{
  return os_unfair_lock_lock_with_options();
}

void sanitizer_force_unlock(os_unfair_lock_s *a1)
{
  os_unfair_lock_unlock(a1 + 4160);
}

BOOL sanitizer_zone_locked(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v1;
  _BOOL4 v2;

  v1 = a1 + 4160;
  v2 = os_unfair_lock_trylock(a1 + 4160);
  if (v2)
    os_unfair_lock_unlock(v1);
  return !v2;
}

uint64_t sanitizer_reinit_lock(uint64_t result)
{
  *(_DWORD *)(result + 16640) = 0;
  return result;
}

uint64_t sanitizer_statistics_task()
{
  return 46;
}

uint64_t large_debug_print(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int (*a4)(uint64_t, uint64_t, uint64_t, uint64_t *), void (*a5)(const char *, ...))
{
  const char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  unsigned int v13;
  _QWORD *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  v21 = 0;
  if (a4(a1, a3, 20480, &v21))
  {
    v8 = "Failed to read szone structure\n";
    return ((uint64_t (*)(const char *))a5)(v8);
  }
  result = _simple_salloc();
  if (result)
  {
    v20 = 0;
    if (a4(a1, *(_QWORD *)(v21 + 18832), 24 * *(unsigned int *)(v21 + 18824), &v20))
    {
      v8 = "Failed to read large entries\n";
      return ((uint64_t (*)(const char *))a5)(v8);
    }
    _simple_sprintf();
    v10 = v21;
    v11 = (uint64_t *)MEMORY[0x1E0C88808];
    v12 = (uint64_t *)MEMORY[0x1E0C88820];
    if (*(_DWORD *)(v21 + 18824))
    {
      v13 = 0;
      v14 = (_QWORD *)(v20 + 8);
      do
      {
        if (*(v14 - 1))
        {
          _simple_sprintf();
          v15 = *v11;
          if (*v11 <= (unint64_t)*v12)
            v15 = *v12;
          if (!((unint64_t)(*v14 + 2 * v15) >> 32))
            mvm_reclaim_is_available();
          _simple_sprintf();
          v10 = v21;
        }
        ++v13;
        v14 += 3;
      }
      while (v13 < *(_DWORD *)(v10 + 18824));
    }
    if (large_cache_enabled)
    {
      _simple_sprintf();
      _simple_sprintf();
      if (*(_DWORD *)(v21 + 20392))
      {
        v16 = 0;
        v17 = v21 + 18872;
        do
        {
          _simple_sprintf();
          v18 = *v11;
          if (*v11 <= (unint64_t)*v12)
            v18 = *v12;
          if (!((unint64_t)(*(_QWORD *)(v17 - 8) + 2 * v18) >> 32))
            mvm_reclaim_is_available();
          _simple_sprintf();
          ++v16;
          v17 += 24;
        }
        while (v16 < *(_DWORD *)(v21 + 20392));
      }
    }
    _simple_sprintf();
    v19 = (const char *)_simple_string();
    a5("%s\n", v19);
    return _simple_sfree();
  }
  return result;
}

void large_entries_free_no_lock(uint64_t a1, uint64_t a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v4;

  *a4 = a2;
  v4 = *MEMORY[0x1E0C887F8];
  if (*MEMORY[0x1E0C887F8] <= *MEMORY[0x1E0C88810])
    v4 = *MEMORY[0x1E0C88810];
  a4[1] = (v4 + 24 * a3) & ~v4;
}

uint64_t large_in_use_enumerator()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t, __int128 *, uint64_t);
  void (*v2)(uint64_t, uint64_t, uint64_t, __int128 *, uint64_t);
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t result;
  uint64_t v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  _OWORD v24[256];
  uint64_t v25;

  v0 = MEMORY[0x1E0C86820]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v25 = *MEMORY[0x1E0C874D8];
  v23 = 0;
  v22 = 0uLL;
  v12 = 24 * v3;
  result = v13(v0, v5, v12, &v23);
  if (!(_DWORD)result)
  {
    if ((v8 & 4) != 0)
    {
      v15 = *MEMORY[0x1E0C887F8];
      if (*MEMORY[0x1E0C887F8] <= *MEMORY[0x1E0C88810])
        v15 = *MEMORY[0x1E0C88810];
      *(_QWORD *)&v22 = v6;
      *((_QWORD *)&v22 + 1) = (v15 + v12) & ~v15;
      v2(v11, v10, 4, &v22, 1);
    }
    result = 0;
    if ((v8 & 3) != 0 && v4)
    {
      v16 = 0;
      v17 = v4 - 1;
      do
      {
        v18 = v17;
        v19 = (uint64_t *)(v23 + 24 * v17);
        v20 = *v19;
        if (*v19)
        {
          v21 = v19[1];
          *(_QWORD *)&v22 = v20;
          *((_QWORD *)&v22 + 1) = v21;
          v24[v16] = v22;
          if ((v16 + 1) >= 0x100)
          {
            v2(v11, v10, 3, v24, (v16 + 1));
            v16 = 0;
          }
          else
          {
            ++v16;
          }
        }
        --v17;
      }
      while (v18);
      if (v16)
        ((void (*)(uint64_t, uint64_t, uint64_t, _OWORD *))v2)(v11, v10, 3, v24);
      return 0;
    }
  }
  return result;
}

unint64_t large_try_shrink_in_place(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  os_unfair_lock_s *v8;
  _QWORD *v9;
  int v10;
  uint64_t *v11;
  uint64_t *v12;
  size_t v13;
  uint64_t v14;

  v5 = a3 - a4;
  if (a3 != a4)
  {
    v6 = a4;
    v8 = (os_unfair_lock_s *)(a1 + 18816);
    os_unfair_lock_lock_with_options();
    v9 = large_entry_for_pointer_no_lock(a1, a2);
    if (v9)
    {
      *v9 = a2;
      v9[1] = v6;
      *(_QWORD *)(a1 + 18840) -= v5;
      v10 = *(_DWORD *)(a1 + 16392) & 3;
      os_unfair_lock_unlock(v8);
      if (v10)
      {
        v11 = (uint64_t *)MEMORY[0x1E0C88808];
        v12 = (uint64_t *)MEMORY[0x1E0C88820];
        if (*MEMORY[0x1E0C88808] <= *MEMORY[0x1E0C88820])
          v13 = *MEMORY[0x1E0C88820];
        else
          v13 = *MEMORY[0x1E0C88808];
        if (mprotect((void *)(a2 + v6), v13, 0))
          malloc_report(3u, (uint64_t)"*** can't mvm_protect(0x0) region for new postlude guard page at %p\n");
        v14 = *v11;
        if (*v11 <= (unint64_t)*v12)
          v14 = *v12;
        v6 += v14;
        v5 -= v14;
      }
      mvm_deallocate_pages(v6 + a2, v5, 0);
    }
    else
    {
      malloc_zone_error(*(_DWORD *)(a1 + 16392), 1, (uint64_t)"large entry %p reallocated is not properly in table\n");
      os_unfair_lock_unlock(v8);
    }
  }
  return a2;
}

void large_destroy_cache(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  uint32_t os_unfair_lock_opaque;
  uint32_t v5;
  uint64_t *v6;
  _QWORD __dst[193];

  __dst[192] = *MEMORY[0x1E0C874D8];
  v2 = a1 + 4712;
  v3 = a1 + 4704;
  os_unfair_lock_lock_with_options();
  v2[404]._os_unfair_lock_opaque = 0;
  os_unfair_lock_opaque = v2->_os_unfair_lock_opaque;
  v5 = v2[1]._os_unfair_lock_opaque;
  memcpy(__dst, &a1[4714], 0x600uLL);
  *(_QWORD *)&a1[5108]._os_unfair_lock_opaque = 0;
  *(_QWORD *)&a1[5104]._os_unfair_lock_opaque = 0;
  *(_QWORD *)&a1[4712]._os_unfair_lock_opaque = 0;
  *(_QWORD *)&a1[4716]._os_unfair_lock_opaque = 0;
  *(_QWORD *)&a1[4714]._os_unfair_lock_opaque = 0;
  os_unfair_lock_unlock(v3);
  if (os_unfair_lock_opaque != v5)
  {
    do
    {
      large_deallocate_cache_entry((uint64_t)a1, &__dst[3 * (int)os_unfair_lock_opaque]);
      if (os_unfair_lock_opaque + 1 == v2[386]._os_unfair_lock_opaque)
        os_unfair_lock_opaque = 0;
      else
        ++os_unfair_lock_opaque;
    }
    while (os_unfair_lock_opaque != v5);
    os_unfair_lock_opaque = v5;
  }
  v6 = &__dst[3 * (int)os_unfair_lock_opaque];
  if (*v6)
  {
    if (__dst[3 * (int)os_unfair_lock_opaque + 1])
      large_deallocate_cache_entry((uint64_t)a1, v6);
  }
}

uint64_t large_deallocate_cache_entry(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t result;

  v4 = a2[1];
  if (!HIDWORD(v4))
  {
    result = mvm_reclaim_mark_used(a2[2], *a2, v4, *(_DWORD *)(a1 + 16392));
    if (!(_DWORD)result)
      return result;
    v4 = a2[1];
  }
  return mvm_deallocate_pages(*a2, v4, *(unsigned int *)(a1 + 16392));
}

void szone_batch_free(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6;
  unint64_t v7;

  if (a3)
  {
    tiny_batch_free(a1, a2, a3);
    v6 = a3 - 1;
    do
    {
      v7 = *(_QWORD *)(a2 + 8 * v6);
      if (v7)
        _szone_free(a1, v7, 0);
    }
    while ((unint64_t)v6--);
  }
}

void *scalable_zone_info(uint64_t a1, void *__dst, unsigned int a3)
{
  task_name_t v6;
  uint64_t v7;
  uint64_t is_self;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  _DWORD __src[8];
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C874D8];
  v6 = *MEMORY[0x1E0C883F0];
  v7 = *(_QWORD *)(a1 + 17136);
  if (*MEMORY[0x1E0C883F0])
  {
    is_self = mach_task_is_self(*MEMORY[0x1E0C883F0]);
    if (!(_DWORD)is_self)
      nanov2_realloc_VARIANT_mp_cold_1(is_self);
  }
  v9 = *(unsigned int *)(a1 + 17120);
  if ((v9 & 0x80000000) != 0)
  {
    v12 = 0;
    v11 = 0;
    LODWORD(v10) = 0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = v9 + 1;
    v14 = v7 - 432;
    do
    {
      v12 += *(_QWORD *)(v14 + 8) + *(_QWORD *)v14;
      v11 += *(_DWORD *)(v14 + 40);
      v10 += *(_QWORD *)(v14 + 24);
      v14 += 2560;
      --v13;
    }
    while (v13);
  }
  __src[4] = v11;
  __src[5] = v10;
  v15 = *(_QWORD *)(a1 + 17904);
  if (v6)
  {
    v16 = mach_task_is_self(v6);
    if (!(_DWORD)v16)
      nanov2_realloc_VARIANT_mp_cold_1(v16);
  }
  v17 = *(unsigned int *)(a1 + 17888);
  if ((v17 & 0x80000000) != 0)
  {
    v19 = 0;
    LODWORD(v18) = 0;
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v20 = v17 + 1;
    v21 = v15 - 432;
    do
    {
      v12 += *(_QWORD *)(v21 + 8) + *(_QWORD *)v21;
      v19 += *(_DWORD *)(v21 + 40);
      v18 += *(_QWORD *)(v21 + 24);
      v21 += 2560;
      --v20;
    }
    while (v20);
  }
  __src[6] = v19;
  __src[7] = v18;
  v22 = *(_DWORD *)(a1 + 18840);
  v26 = *(_DWORD *)(a1 + 18820);
  v27 = v22;
  v28 = 0;
  v29 = 0;
  v30 = *(_DWORD *)(a1 + 16392);
  __src[0] = v19 + v11 + v26;
  __src[1] = v18 + v10 + v22;
  v23 = ((*(_DWORD *)(a1 + 17288) - *(_DWORD *)(a1 + 17296)) << 23)
      + ((*(_DWORD *)(a1 + 16520) - *(_DWORD *)(a1 + 16528)) << 20)
      + v22;
  __src[2] = v23 - v12;
  __src[3] = v23;
  return memcpy(__dst, __src, 4 * a3);
}

uint64_t scalable_zone_statistics(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  switch(a3)
  {
    case 0:
      v4 = *(unsigned int *)(a1 + 17120);
      if ((v4 & 0x80000000) != 0)
      {
        v7 = 0;
        v6 = 0;
        v5 = 0;
      }
      else
      {
        v5 = 0;
        v6 = 0;
        v7 = 0;
        v8 = *(_QWORD *)(a1 + 17136) - 432;
        v9 = v4 + 1;
        do
        {
          v5 += *(_QWORD *)(v8 + 8) + *(_QWORD *)v8;
          v6 += *(_DWORD *)(v8 + 40);
          v7 += *(_QWORD *)(v8 + 24);
          v8 += 2560;
          --v9;
        }
        while (v9);
      }
      *(_DWORD *)a2 = v6;
      v17 = (*(_QWORD *)(a1 + 16520) - *(_QWORD *)(a1 + 16528)) << 20;
      *(_QWORD *)(a2 + 8) = v7;
      *(_QWORD *)(a2 + 16) = v17 - v5;
      *(_QWORD *)(a2 + 24) = v17;
      goto LABEL_18;
    case 1:
      v10 = *(unsigned int *)(a1 + 17888);
      if ((v10 & 0x80000000) != 0)
      {
        v13 = 0;
        v12 = 0;
        v11 = 0;
      }
      else
      {
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = *(_QWORD *)(a1 + 17904) - 432;
        v15 = v10 + 1;
        do
        {
          v13 += *(_QWORD *)(v14 + 8) + *(_QWORD *)v14;
          v12 += *(_DWORD *)(v14 + 40);
          v11 += *(_QWORD *)(v14 + 24);
          v14 += 2560;
          --v15;
        }
        while (v15);
      }
      *(_DWORD *)a2 = v12;
      v18 = (*(_QWORD *)(a1 + 17288) - *(_QWORD *)(a1 + 17296)) << 23;
      *(_QWORD *)(a2 + 24) = v18;
      v16 = v18 - v13;
      *(_QWORD *)(a2 + 8) = v11;
      goto LABEL_17;
    case 2:
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 18820);
      v16 = *(_QWORD *)(a1 + 18840);
      *(_QWORD *)(a2 + 24) = v16;
      *(_QWORD *)(a2 + 8) = v16;
LABEL_17:
      *(_QWORD *)(a2 + 16) = v16;
LABEL_18:
      result = 1;
      break;
    case 3:
    case 4:
      *(_DWORD *)a2 = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 24) = 0;
      result = 1;
      *(_QWORD *)(a2 + 8) = 0;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t szone_ptr_in_use_enumerator(uint64_t task, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(task_name_t a1, uint64_t a2, uint64_t a3, uint64_t *a4))
{
  uint64_t (*v5)(task_name_t, uint64_t, uint64_t, uint64_t *);
  uint64_t is_self;
  uint64_t result;
  uint64_t v10;

  v5 = a5;
  if (!a5)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self)
        nanov2_realloc_VARIANT_mp_cold_1(is_self);
    }
    v5 = _malloc_default_reader_0;
  }
  v10 = 0;
  result = v5(task, a4, 20480, &v10);
  if (!(_DWORD)result)
  {
    result = tiny_in_use_enumerator();
    if (!(_DWORD)result)
    {
      result = small_in_use_enumerator();
      if (!(_DWORD)result)
        return large_in_use_enumerator();
    }
  }
  return result;
}

uint64_t szone_check(uint64_t a1)
{
  unsigned int v2;
  unint64_t v3;

  v2 = szone_check_counter + 1;
  szone_check_counter = v2;
  HIDWORD(v3) = 989560465 * v2;
  LODWORD(v3) = 989560465 * v2;
  if ((v3 >> 4) <= 0x68DB8)
  {
    malloc_report(5u, (uint64_t)"at szone_check counter=%d\n");
    v2 = szone_check_counter;
  }
  if (v2 < szone_check_start || v2 % szone_check_modulo)
    return 1;
  else
    return szone_check_all(a1);
}

uint64_t szone_print_self(const void *a1, int a2)
{
  return szone_print(*MEMORY[0x1E0C883F0], 2 * (a2 != 0), a1, (unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t *))_malloc_default_reader_0, (void (*)(const char *, ...))malloc_report_simple);
}

uint64_t szone_log(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16400) = a2;
  return result;
}

uint64_t szone_locked(uint64_t a1)
{
  os_unfair_lock_s *v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;

  v2 = (os_unfair_lock_s *)(a1 + 18816);
  if (os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 18816)))
  {
    v3 = (int *)(a1 + 17120);
    os_unfair_lock_unlock(v2);
    if ((*(_DWORD *)(a1 + 17888) & 0x80000000) != 0)
    {
LABEL_6:
      if (*v3 < 0)
        return 0;
      v6 = -1;
      for (i = -2560; os_unfair_lock_trylock((os_unfair_lock_t)(*(_QWORD *)(a1 + 17136) + i)); i += 2560)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 17136) + i));
        if (++v6 >= *v3)
          return 0;
      }
    }
    else
    {
      v4 = -1;
      v5 = -2560;
      while (os_unfair_lock_trylock((os_unfair_lock_t)(*(_QWORD *)(a1 + 17904) + v5)))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 17904) + v5));
        ++v4;
        v5 += 2560;
        if (v4 >= *(int *)(a1 + 17888))
          goto LABEL_6;
      }
    }
  }
  return 1;
}

uint64_t szone_reinit_lock(uint64_t result)
{
  int *v1;
  _DWORD *v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;

  v1 = (int *)(result + 17120);
  *(_DWORD *)(result + 18816) = 0;
  if ((*(_DWORD *)(result + 17888) & 0x80000000) == 0)
  {
    v2 = (_DWORD *)(*(_QWORD *)(result + 17904) - 2560);
    v3 = -1;
    do
    {
      *v2 = 0;
      ++v3;
      v2 += 640;
    }
    while (v3 < *(int *)(result + 17888));
  }
  if ((*v1 & 0x80000000) == 0)
  {
    v4 = (_DWORD *)(*(_QWORD *)(result + 17136) - 2560);
    v5 = -1;
    do
    {
      *v4 = 0;
      ++v5;
      v4 += 640;
    }
    while (v5 < *v1);
  }
  return result;
}

uint64_t szone_destroy(uint64_t a1)
{
  unsigned int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v9;
  uint64_t v10;

  v2 = (unsigned int *)(a1 + 16392);
  if (large_cache_enabled)
    large_destroy_cache((os_unfair_lock_s *)a1);
  v9 = 0;
  v10 = 0;
  v3 = v2[608];
  if ((_DWORD)v3)
  {
    v4 = 24 * v3;
    do
    {
      v5 = *(_QWORD *)(a1 + 18832) + v4;
      v6 = *(_QWORD *)(v5 - 24);
      if (v6)
        mvm_deallocate_pages(v6, *(_QWORD *)(v5 - 16), *v2);
      v4 -= 24;
    }
    while (v4);
    v7 = v2[608];
  }
  else
  {
    v7 = 0;
  }
  large_entries_free_no_lock(a1, *(_QWORD *)(a1 + 18832), v7, &v9);
  if (v10)
    mvm_deallocate_pages(v9, v10, *v2);
  rack_destroy_regions(a1 + 16512);
  rack_destroy_regions(a1 + 17280);
  rack_destroy(a1 + 16512);
  rack_destroy(a1 + 17280);
  return mvm_deallocate_pages(a1, (*MEMORY[0x1E0C88820] + 20479) & -*MEMORY[0x1E0C88820], 0);
}

unint64_t szone_malloc_type_malloc(uint64_t a1, unint64_t a2)
{
  return szone_malloc_should_clear(a1, a2, 0);
}

uint64_t szone_check_all(uint64_t a1)
{
  int v2;
  unint64_t *v3;
  unint64_t v4;
  unint64_t i;
  uint64_t v6;
  uint64_t v7;
  int v8;
  os_unfair_lock_s *v9;
  int v10;
  BOOL v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t result;

  tiny_check(a1 + 16512);
  if (v2)
  {
    v3 = *(unint64_t **)(a1 + 17304);
    v4 = *v3;
    if (*v3)
    {
      for (i = 0; i < v4; ++i)
      {
        v6 = *(_QWORD *)(v3[2] + 8 * i);
        if ((unint64_t)(v6 + 1) >= 2)
        {
          v7 = *(_QWORD *)(a1 + 17904);
          v8 = *(_DWORD *)(v6 + 24);
          v9 = (os_unfair_lock_s *)(v7 + 2560 * v8);
          os_unfair_lock_lock_with_options();
          v10 = *(_DWORD *)(v6 + 24);
          if (v10 != v8)
          {
            do
            {
              os_unfair_lock_unlock(v9);
              v9 = (os_unfair_lock_s *)(v7 + 2560 * v10);
              os_unfair_lock_lock_with_options();
              v11 = v10 == *(_DWORD *)(v6 + 24);
              v10 = *(_DWORD *)(v6 + 24);
            }
            while (!v11);
          }
          small_check_region(a1 + 17280, v6);
          v13 = v12;
          os_unfair_lock_unlock(v9);
          if (!v13)
            goto LABEL_15;
          v3 = *(unint64_t **)(a1 + 17304);
          v4 = *v3;
        }
      }
    }
    v14 = 0;
    while (1)
    {
      small_free_list_check(a1 + 17280, v14);
      if (!v15)
        break;
      if (++v14 == 31)
        return 1;
    }
  }
LABEL_15:
  result = 0;
  *(_DWORD *)(a1 + 16392) &= ~0x80000000;
  return result;
}

uint64_t szone_print(uint64_t a1, uint64_t a2, const void *a3, unsigned int (*a4)(uint64_t, uint64_t, uint64_t, uint64_t *), void (*a5)(const char *, ...))
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  unint64_t i;
  const char *v30;
  uint64_t v31;
  unint64_t v32;
  int v33;
  unint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _DWORD __dst[13];
  _QWORD __src[9];

  __src[7] = *MEMORY[0x1E0C874D8];
  v37 = 0;
  v38 = 0;
  if (a4(a1, (uint64_t)a3, 20480, &v37))
  {
    v10 = "Failed to read szone structure\n";
    return ((uint64_t (*)(const char *))a5)(v10);
  }
  v11 = v37;
  v39 = 0;
  if (a4(a1, *(_QWORD *)(v37 + 17136), 2560, &v39))
    goto LABEL_10;
  v12 = *(unsigned int *)(v11 + 17120);
  if ((v12 & 0x80000000) != 0)
  {
    v15 = 0;
    v14 = 0;
    LODWORD(v13) = 0;
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = v12 + 1;
    v17 = v39 - 432;
    do
    {
      v15 += *(_QWORD *)(v17 + 8) + *(_QWORD *)v17;
      v14 += *(_DWORD *)(v17 + 40);
      v13 += *(_QWORD *)(v17 + 24);
      v17 += 2560;
      --v16;
    }
    while (v16);
  }
  __src[2] = __PAIR64__(v13, v14);
  if (a4(a1, *(_QWORD *)(v11 + 17904), 2560, &v39))
  {
LABEL_10:
    v10 = "Failed to get scalable zone info\n";
    return ((uint64_t (*)(const char *))a5)(v10);
  }
  v19 = *(unsigned int *)(v11 + 17888);
  if ((v19 & 0x80000000) != 0)
  {
    v21 = 0;
    LODWORD(v20) = 0;
  }
  else
  {
    v20 = 0;
    v21 = 0;
    v22 = v19 + 1;
    v23 = v39 - 432;
    do
    {
      v15 += *(_QWORD *)(v23 + 8) + *(_QWORD *)v23;
      v21 += *(_DWORD *)(v23 + 40);
      v20 += *(_QWORD *)(v23 + 24);
      v23 += 2560;
      --v22;
    }
    while (v22);
  }
  __src[3] = __PAIR64__(v20, v21);
  v24 = *(_DWORD *)(v11 + 18840);
  LODWORD(__src[4]) = *(_DWORD *)(v11 + 18820);
  HIDWORD(__src[4]) = v24;
  __src[5] = 0;
  LODWORD(__src[6]) = *(_DWORD *)(v11 + 16392);
  LODWORD(__src[0]) = v21 + v14 + LODWORD(__src[4]);
  HIDWORD(__src[0]) = v20 + v13 + v24;
  v25 = ((*(_DWORD *)(v11 + 17288) - *(_DWORD *)(v11 + 17296)) << 23)
      + ((*(_DWORD *)(v11 + 16520) - *(_DWORD *)(v11 + 16528)) << 20)
      + v24;
  LODWORD(__src[1]) = v25 - v15;
  HIDWORD(__src[1]) = v25;
  memcpy(__dst, __src, sizeof(__dst));
  a5("Scalable zone %p: inUse=%u(%u) touched=%u allocated=%u flags=0x%x\n", a3, __dst[0], __dst[1], __dst[2], __dst[3], __dst[12]);
  a5("\ttiny=%u(%u) small=%u(%u) large=%u(%u)\n", __dst[4], __dst[5], __dst[6], __dst[7], __dst[8], __dst[9]);
  if (!mach_task_is_self(a1))
  {
    v10 = "(unable to safely further examine remote process)\n";
    return ((uint64_t (*)(_QWORD))a5)(v10);
  }
  a5("%lu tiny regions:\n", *(_QWORD *)(v37 + 16520));
  v26 = v37;
  if (*(_QWORD *)(v37 + 16528))
  {
    a5("[%lu tiny regions have been vm_deallocate'd]\n", *(_QWORD *)(v37 + 16528));
    v26 = v37;
  }
  __src[0] = 0;
  v39 = 0;
  v36 = 0;
  if (a4(a1, *(_QWORD *)(v26 + 16536), 32, __src))
  {
    v10 = "Failed to map tiny rack region_generation\n";
    return ((uint64_t (*)(_QWORD))a5)(v10);
  }
  if (a4(a1, *(_QWORD *)(__src[0] + 16), 8, &v39))
  {
    v10 = "Failed to map tiny rack hashed_regions\n";
    return ((uint64_t (*)(_QWORD))a5)(v10);
  }
  if (a4(a1, *(_QWORD *)(v37 + 17136), 2560 * *(int *)(v37 + 17120), &v36))
  {
    v10 = "Failed to map tiny rack magazines\n";
    return ((uint64_t (*)(_QWORD))a5)(v10);
  }
  v27 = *(_QWORD *)__src[0];
  if (*(_QWORD *)__src[0])
  {
    v28 = 0;
    for (i = 0; i < v27; ++i)
    {
      if ((unint64_t)(*(_QWORD *)(v39 + 8 * i) + 1) >= 2)
      {
        if (a4(a1, *(_QWORD *)(v39 + 8 * i), 0x100000, &v38))
        {
LABEL_57:
          v10 = "Failed to map region %p\n";
          return ((uint64_t (*)(_QWORD))a5)(v10);
        }
        if (*(_DWORD *)(v38 + 24) == -1)
          ++v28;
        print_tiny_region();
        v27 = *(_QWORD *)__src[0];
      }
    }
  }
  if (*(_QWORD *)(v36 - 408))
    v30 = "Tiny recirc depot: total bytes: %llu, in-use bytes: %llu, allocations: %llu, regions: %d (min # retained regions: %d)\n";
  else
    v30 = "Tiny recirc depot is empty\n";
  a5(v30);
  if ((_DWORD)a2)
    print_tiny_free_list(a1, a4, a5, (uint64_t)a3 + 16512);
  a5("%lu small regions:\n", *(_QWORD *)(v37 + 17288));
  v31 = v37;
  if (*(_QWORD *)(v37 + 17296))
  {
    a5("[%lu small regions have been vm_deallocate'd]\n", *(_QWORD *)(v37 + 17296));
    v31 = v37;
  }
  if (a4(a1, *(_QWORD *)(v31 + 17304), 32, __src))
  {
    v10 = "Failed to map small rack region_generation\n";
    return ((uint64_t (*)(_QWORD))a5)(v10);
  }
  if (a4(a1, *(_QWORD *)(__src[0] + 16), 8, &v39))
  {
    v10 = "Failed to map small rack hashed_regions\n";
    return ((uint64_t (*)(_QWORD))a5)(v10);
  }
  if (a4(a1, *(_QWORD *)(v37 + 17904), 2560 * *(int *)(v37 + 17888), &v36))
  {
    v10 = "Failed to map small rack magazines\n";
    return ((uint64_t (*)(_QWORD))a5)(v10);
  }
  v32 = *(_QWORD *)__src[0];
  if (*(_QWORD *)__src[0])
  {
    v33 = 0;
    v34 = 0;
    do
    {
      if ((unint64_t)(*(_QWORD *)(v39 + 8 * v34) + 1) >= 2)
      {
        if (a4(a1, *(_QWORD *)(v39 + 8 * v34), 0x800000, &v38))
          goto LABEL_57;
        if (*(_DWORD *)(v38 + 24) == -1)
          ++v33;
        print_small_region();
        v32 = *(_QWORD *)__src[0];
      }
      ++v34;
    }
    while (v34 < v32);
  }
  if (*(_QWORD *)(v36 - 408))
    v35 = "Small recirc depot: total bytes: %llu, in-use bytes: %llu, allocations: %llu, regions: %d (min # retained regions: %d)\n";
  else
    v35 = "Small recirc depot is empty\n";
  a5(v35);
  if ((_DWORD)a2)
    print_small_free_list(a1, a4, a5, (uint64_t)a3 + 17280);
  return large_debug_print(a1, a2, (uint64_t)a3, a4, a5);
}

unint64_t small_finalize_region(unint64_t result, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;

  v3 = *(_QWORD *)(a2 + 2128);
  if (v3)
  {
    v4 = result;
    v5 = *(_QWORD *)(a2 + 2144) - v3;
    v6 = v5 + 0x800000;
    v7 = v3 >> 9;
    v8 = ((v5 + 8355328) >> 9) & 0x3FFF;
    v9 = *(_WORD *)(((v5 + 0x7FFFFF) & 0xFFFFFFFFFF800000 | (2
                                                             * ((((_DWORD)v5
                                                                + 0x7FFFFF
                                                                - (((_DWORD)v5 + 0x7FFFFF) & 0xFF800000 | 0x8200)) >> 9) & 0x3FFFLL)))
                  + 0x28) & 0x7FFF;
    if (v8)
      v10 = v8 >= v9;
    else
      v10 = 0;
    if (v10)
    {
      v11 = v6 - (v9 << 9);
      if (*(__int16 *)((v11 & 0xFFFFFFFFFF800000 | (2
                                                     * (((v11 - (v11 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                      + 0x28) < 0)
      {
        small_free_list_find_by_ptr(result, v6 - (v9 << 9), v9);
        small_free_list_remove_ptr(v4, a2, v12, v9);
        LOWORD(v7) = v9 + v7;
        v6 = v11;
      }
    }
    result = small_free_list_add_ptr(v4, a2, v6, (unsigned __int16)v7);
    *(_QWORD *)(a2 + 2128) = 0;
  }
  *(_QWORD *)(a2 + 2144) = 0;
  return result;
}

uint64_t small_free_detach_region(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;

  v3 = a3 + 33280;
  v4 = a3 + 0x800000;
  if (a3 + 33280 >= (unint64_t)(a3 + 0x800000))
    return 0;
  v7 = 0;
  v8 = v3 & 0xFFFFFFFFFF800000 | 0x28;
  do
  {
    v9 = *(__int16 *)(v8 + 2 * (((unint64_t)(v3 - 33280) >> 9) & 0x3FFF));
    v10 = v9 & 0x7FFF;
    if ((v9 & 0x7FFF) == 0)
      break;
    if (v9 < 0)
    {
      small_free_list_find_by_ptr(a1, v3, v9 & 0x7FFF);
      small_free_list_remove_ptr_no_clear(a1, a2, v11, v10);
    }
    else
    {
      v7 = (v7 + 1);
    }
    v3 += v10 << 9;
  }
  while (v3 < v4);
  return v7;
}

uint64_t small_free_reattach_region(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;

  v3 = a3 + 33280;
  v4 = a3 + 0x800000;
  if (a3 + 33280 >= (unint64_t)(a3 + 0x800000))
    return 0;
  v7 = 0;
  v8 = v3 & 0xFFFFFFFFFF800000 | 0x28;
  do
  {
    v9 = *(__int16 *)(v8 + 2 * (((unint64_t)(v3 - 33280) >> 9) & 0x3FFF));
    v10 = v9 & 0x7FFF;
    if ((v9 & 0x7FFF) == 0)
      break;
    if (v9 < 0)
    {
      small_free_list_add_ptr(a1, a2, v3, v9 & 0x7FFF);
      v11 = (unint64_t)v10 << 9;
    }
    else
    {
      v11 = (unint64_t)(v9 & 0x7FFF) << 9;
      v7 += v10 << 9;
    }
    v3 += v11;
  }
  while (v3 < v4);
  return v7;
}

unint64_t small_free_scan_madvise_free(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3)
{
  _DWORD *v6;
  unint64_t result;
  unint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  BOOL v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  unsigned __int16 *v31;
  uint64_t v32;
  int v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C874D8];
  v6 = (_DWORD *)MEMORY[0x1E0C88800];
  result = MEMORY[0x1E0C86820]();
  v12 = (char *)v34 - v11;
  if (v8 < v10)
  {
    LODWORD(v13) = 0;
    v14 = *MEMORY[0x1E0C887F8];
    v15 = ~*MEMORY[0x1E0C887F8];
    v16 = v8;
    while (1)
    {
      v17 = *(unsigned __int16 *)((v8 & 0xFFFFFFFFFF800000 | 0x28)
                                + 2 * (((unint64_t)(v16 - 33280) >> 9) & 0x3FFF));
      if (v17 == 0x8000 && v16 == v8)
        break;
      v19 = v17 & 0x7FFF;
      if ((v17 & 0x7FFF) != 0)
      {
        if ((v17 & 0x8000) != 0)
        {
          v21 = (v16 + v14 + 10) & v15;
          v22 = v19;
          v20 = (unint64_t)v19 << 9;
          v23 = (v16 + (v22 << 9) - 2) & v15;
          v24 = v23 > v21;
          result = v23 - v21;
          if (v24)
          {
            v25 = &v12[4 * (int)v13];
            *(_WORD *)v25 = (v21 - a3) >> v9;
            *((_WORD *)v25 + 1) = result >> v9;
            LODWORD(v13) = v13 + 1;
          }
        }
        else
        {
          v20 = v19 << 9;
        }
        v16 += v20;
        if (v16 < v10)
          continue;
      }
      goto LABEL_18;
    }
    v26 = (v8 + v14 + 10) & v15;
    v27 = (v8 + 8388606) & v15;
    v24 = v27 > v26;
    v28 = v27 - v26;
    if (v24)
    {
      v29 = (v26 - v8) >> v9;
      v30 = &v12[4 * (int)v13];
      *(_WORD *)v30 = v29;
      *((_WORD *)v30 + 1) = v28 >> v9;
      LODWORD(v13) = v13 + 1;
    }
LABEL_18:
    if ((int)v13 >= 1)
    {
      OSAtomicIncrement32Barrier((int32_t *)(a3 + 28));
      os_unfair_lock_unlock(a2);
      v13 = v13;
      v31 = (unsigned __int16 *)(v12 + 2);
      do
      {
        v32 = a3 + (*(v31 - 1) << *v6);
        v33 = *v31;
        v31 += 2;
        mvm_madvise_free(a1, a3, v32, v32 + (v33 << *v6), 0, *(_DWORD *)(a1 + 620) & 0x20);
        --v13;
      }
      while (v13);
      os_unfair_lock_lock_with_options();
      return OSAtomicDecrement32Barrier((int32_t *)(a3 + 28));
    }
  }
  return result;
}

void small_check_region(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  int v23;
  unint64_t v24;
  __int16 v25;
  BOOL v26;
  unint64_t v27;
  BOOL v28;
  int v29;
  unint64_t v30;
  __int16 v31;
  BOOL v32;
  const char *v33;

  v2 = a2 + 0x800000;
  v3 = *(_DWORD *)(((a2 + 33280) & 0xFFFFFFFFFF800000) + 0x18);
  v4 = *(_QWORD *)(a1 + 624);
  v5 = a2 + 33280;
  if (*(_QWORD *)(v4 + 2560 * v3 + 2144) == a2)
  {
    v6 = v4 + 2560 * v3;
    v5 = a2 + 33280 + *(_QWORD *)(v6 + 2136);
    v2 -= *(_QWORD *)(v6 + 2128);
  }
  if (v5 < v2)
  {
    v7 = (a2 + 33280) & 0xFFFFFFFFFF800000 | 0x28;
    do
    {
      v8 = v5 & 0xFFFFFFFFFF800000;
      v9 = *(unsigned __int16 *)(v7 + 2 * (((v5 - (v5 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF));
      if (*(__int16 *)(v7 + 2 * (((v5 - (v5 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)) < 0)
      {
        v11 = v9 & 0x7FFF;
        if ((v9 & 0x7FFF) == 0)
        {
          v33 = "%ld, counter=%d\n*** invariant broken for free block %p this msize=%d\n";
          goto LABEL_55;
        }
        v12 = v5;
        if ((v5 & (*MEMORY[0x1E0C88820] - 1)) == 0)
        {
          v12 = v5;
          if ((unint64_t)(v9 & 0x7FFF) << 9 >= *MEMORY[0x1E0C88808])
          {
            v13 = v8 + 32678;
            v14 = v8 + 32678;
            v15 = 33;
            while ((*(_WORD *)(v14 + 16) & 0x8000) == 0
                 || v5 != (v13 & 0xFFFFFFFFFF800000) + ((unint64_t)(*(_WORD *)(v14 + 16) & 0x7FFF) << 9))
            {
              v14 += 18;
              v13 += 18;
              if (!--v15)
              {
                v14 = 0;
                break;
              }
            }
            if (v14)
              v12 = v14;
            else
              v12 = v5;
          }
        }
        if (!v12)
          nanov2_realloc_VARIANT_mp_cold_1(a1);
        if ((v12 & 0xFFFFFFFFFF800000 | 0x7FA6) > v12 || (v12 & 0xFFFFFFFFFF800000 | 0x81F8) <= v12)
        {
          v17 = *(_QWORD *)v12;
          v18 = *(_QWORD *)(a1 + 632) ^ a1;
          v19 = v18 ^ *(_QWORD *)v12;
          if (*(unsigned __int8 *)(v12 + 8) != (BYTE4(v19)
                                                                + v19
                                                                + ((HIDWORD(v19) + v19) >> 16)
                                                                + ((unsigned __int16)(WORD2(v19)
                                                                                    + v19
                                                                                    + ((HIDWORD(v19) + v19) >> 16)) >> 8))
            || (v16 = *(_QWORD *)(v12 + 16),
                v20 = v18 ^ v16,
                *(unsigned __int8 *)(v12 + 24) != (BYTE4(v20)
                                                                  + v20
                                                                  + ((HIDWORD(v20) + v20) >> 16)
                                                                  + ((unsigned __int16)(WORD2(v20)
                                                                                      + v20
                                                                                      + ((HIDWORD(v20) + v20) >> 16)) >> 8))))
          {
            free_list_checksum_botch(a1);
            __break(1u);
            return;
          }
        }
        else
        {
          v17 = *(_QWORD *)v12;
          v16 = *(_QWORD *)(v12 + 8);
        }
        if (v17)
        {
          v21 = v17 & 0xFFFFFFFFFF800000;
          v22 = v17 < (v17 & 0xFFFFFFFFFF800000 | 0x7FA6) || v17 >= (v17 & 0xFFFFFFFFFF800000 | 0x81F8);
          v23 = v17;
          v24 = v17 & 0xFFFFFFFFFF800000;
          if (!v22)
          {
            v25 = *(_WORD *)(v17 + 16);
            v26 = v25 < 0;
            v24 = v25 < 0 ? v21 + ((unint64_t)(v25 & 0x4000) << 9) : 0;
            v23 = v21 + ((v25 & 0x7FFF) << 9);
            if (!v26)
              v23 = 0;
          }
          if ((*(__int16 *)(v24 + 2 * (((unint64_t)(v23 - 33280) >> 9) & 0x3FFF) + 40) & 0x80000000) == 0)
          {
            v33 = "%ld, counter=%d\n*** invariant broken for %p (previous %p is not a free pointer)\n";
            goto LABEL_55;
          }
        }
        if (v16)
        {
          v27 = v16 & 0xFFFFFFFFFF800000;
          v28 = v16 < (v16 & 0xFFFFFFFFFF800000 | 0x7FA6) || v16 >= (v16 & 0xFFFFFFFFFF800000 | 0x81F8);
          v29 = v16;
          v30 = v16 & 0xFFFFFFFFFF800000;
          if (!v28)
          {
            v31 = *(_WORD *)(v16 + 16);
            v32 = v31 < 0;
            if (v31 < 0)
              v30 = v27 + ((unint64_t)(v31 & 0x4000) << 9);
            else
              v30 = 0;
            v29 = v27 + ((v31 & 0x7FFF) << 9);
            if (!v32)
              v29 = 0;
          }
          if ((*(__int16 *)(v30 + 2 * (((unint64_t)(v29 - 33280) >> 9) & 0x3FFF) + 40) & 0x80000000) == 0)
          {
            v33 = "%ld, counter=%d\n*** invariant broken for %p (next %p is not a free pointer)\n";
            goto LABEL_55;
          }
        }
        v10 = v5 + (v11 << 9);
        if ((*(_WORD *)(((v10 - 2) & 0xFFFFFFFFFF800000 | (2
                                                            * ((((_DWORD)v10
                                                               - 2
                                                               - (((_DWORD)v10 - 2) & 0xFF800000 | 0x8200)) >> 9) & 0x3FFFLL)))
                       + 0x28) & 0x7FFF) != (_DWORD)v11)
        {
          v33 = "%ld, counter=%d\n"
                "*** invariant broken for small free %p followed by %p in region [%p-%p] (end marker incorrect) should be"
                " %d; in fact %d\n";
          goto LABEL_55;
        }
      }
      else
      {
        if (!*(_WORD *)(v7 + 2 * (((v5 - (v5 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
        {
          v33 = "%ld, counter=%d\n*** invariant broken: null msize ptr=%p num_small_regions=%d end=%p\n";
LABEL_55:
          malloc_zone_check_fail((uint64_t)"check: incorrect small region ", (uint64_t)v33);
          return;
        }
        v10 = v5 + (v9 << 9);
      }
      v5 = v10;
    }
    while (v10 < v2);
  }
}

unint64_t small_free_list_get_ptr(unint64_t result)
{
  unint64_t v1;
  __int16 v2;
  unint64_t v3;

  if (result)
  {
    v1 = result & 0xFFFFFFFFFF800000;
    if ((result & 0xFFFFFFFFFF800000 | 0x7FA6) <= result && (v1 | 0x81F8) > result)
    {
      v2 = *(_WORD *)(result + 16);
      v3 = v1 + ((unint64_t)(v2 & 0x7FFF) << 9);
      if (v2 < 0)
        return v3;
      else
        return 0;
    }
  }
  return result;
}

uint64_t small_in_use_enumerator()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t, _OWORD *);
  void (*v2)(uint64_t, uint64_t, uint64_t, _OWORD *);
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t, _OWORD *);
  unsigned int *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD v42[256];
  uint64_t v43;

  v0 = MEMORY[0x1E0C86820]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v43 = *MEMORY[0x1E0C874D8];
  v40 = 0;
  v41 = 0;
  v38 = 0;
  v39 = 0;
  v36 = 0;
  v37 = 0;
  v34 = 0;
  v35 = 0;
  result = v3(v0, *(_QWORD *)(v5 + 17304), 32, (uint64_t *)&v34);
  if (!(_DWORD)result)
  {
    v33 = *v34;
    result = v4(v11, v34[2], 8 * *v34, &v41);
    if (!(_DWORD)result)
    {
      if ((v8 & 1) == 0
        || (result = v4(v11, *(_QWORD *)(v6 + 17904), 2560 * *(int *)(v6 + 17888), &v35), !(_DWORD)result))
      {
        if (v33)
        {
          v13 = 0;
          v31 = v2;
          v32 = (unsigned int *)(v6 + 17888);
          v30 = v10;
          while (1)
          {
            v14 = *(_QWORD *)(v41 + 8 * v13);
            if ((unint64_t)(v14 + 1) >= 2)
            {
              if ((v8 & 4) != 0)
              {
                v39 = *(_QWORD *)(v41 + 8 * v13);
                v40 = 32678;
                ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))v2)(v11, v10, 4, &v39, 1);
              }
              v15 = v14 + 33280;
              if ((v8 & 6) != 0)
              {
                v37 = v14 + 33280;
                v38 = 8355328;
                ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))v2)(v11, v10, 2, &v37, 1);
              }
              if ((v8 & 1) != 0)
              {
                result = v4(v11, v14, 0x800000, &v36);
                if ((_DWORD)result)
                  return result;
                v16 = *v32;
                if ((int)v16 < 1)
                {
                  v17 = 0;
                }
                else
                {
                  v17 = 0;
                  v18 = (_QWORD *)(v35 + 24);
                  do
                  {
                    if (v14 == *v18)
                      ++v17;
                    v18 += 320;
                    --v16;
                  }
                  while (v16);
                }
                v19 = *(_DWORD *)(v36 + 24);
                if (v14 != *(_QWORD *)(v35 + 2560 * v19 + 2144))
                {
                  LODWORD(v20) = 0;
                  v21 = 16319;
LABEL_27:
                  v23 = 0;
                  v24 = v36 + 40;
                  do
                  {
                    v25 = *(_WORD *)(v24 + 2 * v20) & 0x7FFF;
                    if ((*(_WORD *)(v24 + 2 * v20) & 0x7FFF) == 0)
                      return 5;
                    if ((*(_WORD *)(v24 + 2 * v20) & 0x8000) == 0)
                    {
                      v26 = v15 + ((_DWORD)v20 << 9);
                      if (v17 && (v27 = *v32, (int)v27 >= 1))
                      {
                        v28 = (_QWORD *)(v35 + 8);
                        while (v26 != *v28)
                        {
                          v28 += 320;
                          if (!--v27)
                            goto LABEL_35;
                        }
                        --v17;
                      }
                      else
                      {
LABEL_35:
                        v29 = &v42[v23];
                        *v29 = v26;
                        v29[1] = v25 << 9;
                        if (++v23 >= 0x100)
                        {
                          v31(v11, v30, 1, v42);
                          v23 = 0;
                        }
                      }
                    }
                    LODWORD(v20) = v20 + v25;
                  }
                  while (v20 < v21);
                  v10 = v30;
                  v2 = v31;
                  if (v23)
                    v31(v11, v30, 1, v42);
                  goto LABEL_9;
                }
                v22 = v35 + 2560 * v19;
                v20 = *(_QWORD *)(v22 + 2136) >> 9;
                v21 = 16319 - (*(_QWORD *)(v22 + 2128) >> 9);
                if (v21 > v20)
                  goto LABEL_27;
              }
            }
LABEL_9:
            result = 0;
            if (++v13 == v33)
              return result;
          }
        }
        return 0;
      }
    }
  }
  return result;
}

void free_small_botch(uint64_t a1)
{
  malloc_zone_error(*(_DWORD *)(a1 + 620), 1, (uint64_t)"double free for ptr %p\n");
}

void print_small_free_list(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t, uint64_t, uint64_t *), void (*a3)(const char *, ...), uint64_t a4)
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v14;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (_simple_salloc())
  {
    v20 = 0;
    v21 = 0;
    if (a2(a1, a4, 768, &v21))
    {
      v8 = "Failed to map small rack\n";
LABEL_6:
      a3(v8);
      return;
    }
    if (a2(a1, *(_QWORD *)(v21 + 624), 2560 * *(int *)(v21 + 608), &v20))
    {
      v8 = "Failed to map small rack magazines\n";
      goto LABEL_6;
    }
    _simple_sappend();
    if ((*(_DWORD *)(v21 + 608) & 0x80000000) != 0)
    {
LABEL_42:
      v18 = (const char *)_simple_string();
      a3("%s\n", v18);
      _simple_sfree();
      return;
    }
    v9 = -1;
LABEL_10:
    v19 = v9;
    _simple_sprintf();
    v10 = 0;
    v11 = v19;
    while (1)
    {
      v12 = *(_QWORD *)(v20 + 2560 * v11 + 8 * v10 + 32);
      if (v12)
      {
        if ((v12 & 0xFFFFFFFFFF800000 | 0x7FA6) > v12 || (v12 & 0xFFFFFFFFFF800000 | 0x81F8) <= v12)
        {
LABEL_16:
          v14 = 0;
          while (1)
          {
            if (v12 >= (v12 & 0xFFFFFFFFFF800000 | 0x7FA6) && v12 < (v12 & 0xFFFFFFFFFF800000 | 0x81F8))
            {
              v23 = 0;
              if (!a2(a1, v12, 18, &v23))
              {
                v12 = *(_QWORD *)(v23 + 8);
                goto LABEL_31;
              }
              v16 = "Failed to map small oobe pointer\n";
              goto LABEL_28;
            }
            v22 = 0;
            v23 = 0;
            if (a2(a1, v12 + 16, 16, &v23))
              break;
            if (a2(a1, a4, 768, &v22))
            {
              v16 = "Failed to map small rack\n";
              goto LABEL_28;
            }
            v12 = *(_QWORD *)v23;
            v17 = *(_QWORD *)(v22 + 632) ^ a4 ^ *(_QWORD *)v23;
            if (*(unsigned __int8 *)(v23 + 8) != (BYTE4(v17)
                                                                  + v17
                                                                  + ((HIDWORD(v17) + v17) >> 16)
                                                                  + ((unsigned __int16)(WORD2(v17)
                                                                                      + v17
                                                                                      + ((HIDWORD(v17) + v17) >> 16)) >> 8)))
            {
              free_list_checksum_botch(a4);
              __break(1u);
              return;
            }
LABEL_31:
            ++v14;
            if (!v12)
            {
              _simple_sprintf();
              goto LABEL_36;
            }
          }
          v16 = "Unable to map small linkage pointer %p\n";
LABEL_28:
          a3(v16);
          v12 = 0;
          goto LABEL_31;
        }
        v23 = 0;
        if (a2(a1, v12, 18, &v23))
        {
          a3("Failed to map small oobe pointer\n");
        }
        else if (*(__int16 *)(v23 + 16) < 0)
        {
          v11 = v19;
          if ((v12 & 0xFFFFFFFFFF800000) + ((unint64_t)(*(_WORD *)(v23 + 16) & 0x7FFF) << 9))
            goto LABEL_16;
          goto LABEL_37;
        }
LABEL_36:
        v11 = v19;
      }
LABEL_37:
      if (++v10 == 31)
      {
        _simple_sappend();
        v9 = v19 + 1;
        if (v19 + 1 >= *(int *)(v21 + 608))
          goto LABEL_42;
        goto LABEL_10;
      }
    }
  }
}

uint64_t print_small_region()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(const char *, ...);
  uint64_t (*v10)(const char *, ...);
  char *v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t result;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;
  unint64_t v27;
  const char *v28;
  int v29;
  uint64_t v30;
  _DWORD *v31;
  const char *v33;
  int v34;
  uint64_t v35;
  _DWORD v36[1024];
  uint64_t v37;

  v0 = MEMORY[0x1E0C86820]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v37 = *MEMORY[0x1E0C874D8];
  v11 = (char *)(v5 + 33280);
  v35 = 0;
  if (v12(v0, v5 + 33280, 0x800000, &v35))
    return v10("Failed to map small region at %p\n", v11);
  if (v6 == -1)
  {
    result = _simple_salloc();
    if (!result)
      return result;
    _simple_sprintf();
    v28 = (const char *)_simple_string();
    v10("%s\n", v28);
    return _simple_sfree();
  }
  v34 = v8;
  v14 = (unint64_t)&v11[v4];
  v15 = v6 + 0x800000 - v2;
  v16 = v35;
  _platform_memset();
  if ((unint64_t)&v11[v4] >= v15)
  {
    v18 = 0;
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = v16 - (_QWORD)v11;
    v20 = *MEMORY[0x1E0C88820];
    v21 = -*MEMORY[0x1E0C88820];
    while (1)
    {
      v22 = *(_QWORD *)((v14 & 0xFFFFFFFFFF800000 | (2
                                                     * (((v14 - (v14 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                      + v19
                      + 40);
      if ((*(_DWORD *)((v14 & 0xFFFFFFFFFF800000 | (2
                                                     * (((v14 - (v14 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                      + v19
                      + 40) & 0x7FFF) == 0)
        break;
      if ((v22 & 0x8000) != 0)
      {
        v24 = (v14 + v20 + 9) & v21;
        v23 = (unint64_t)(v22 & 0x7FFF) << 9;
        v25 = (v14 + v23 - 2) & v21;
        v26 = v25 >= v24;
        v27 = v25 - v24;
        if (!v26)
          v27 = 0;
        v17 += v27;
      }
      else
      {
        if (((unsigned __int16)v22 & 0x7FFFu) <= 0x3FF)
          ++v36[v22 & 0x7FFF];
        ++v18;
        v23 = (unint64_t)(v22 & 0x7FFF) << 9;
      }
      v14 += v23;
      if (v14 >= v15)
        goto LABEL_20;
    }
    v10("*** error with %p: msize=%d, free: %x\n", (const void *)v14, 0, v22 & 0x8000);
  }
LABEL_20:
  result = _simple_salloc();
  if (result)
  {
    v29 = *(_DWORD *)(v16 + 24);
    _simple_sprintf();
    _simple_sprintf();
    _simple_sprintf();
    if (v2 | v4)
      _simple_sprintf();
    if (v29 != -1)
      _simple_sprintf();
    _simple_sprintf();
    if (v34 >= 2 && v18)
    {
      _simple_sappend();
      v30 = 0;
      v31 = v36;
      do
      {
        if (*v31++)
          _simple_sprintf();
        v30 += 512;
      }
      while (v30 != 0x80000);
    }
    v33 = (const char *)_simple_string();
    v10("%s\n", v33);
    return _simple_sfree();
  }
  return result;
}

void small_free_list_check(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  os_unfair_lock_s *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  BOOL v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if ((*(_DWORD *)(a1 + 608) & 0x80000000) == 0)
  {
    v3 = a2;
    v4 = -1;
    v5 = " (slot=%u), counter=%d\n*** in-use ptr in free list slot=%u count=%d ptr=%p\n";
    do
    {
      v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 624) + 2560 * v4);
      os_unfair_lock_lock_with_options();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 624) + 2560 * v4 + 8 * v3 + 32);
      if (v7)
      {
        v8 = 0;
        v9 = 0;
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 624) + 2560 * v4 + 8 * v3 + 32);
        while (2)
        {
          v11 = (v7 & 0xFFFFFFFFFF800000 | 0x7FA6) <= v10 && (v7 & 0xFFFFFFFFFF800000 | 0x81F8) > v10;
          v12 = !v11;
          v13 = v10;
          if (v11)
          {
            if ((*(_WORD *)(v10 + 16) & 0x8000) == 0)
              break;
            v13 = (v7 & 0xFFFFFFFFFF800000) + ((unint64_t)(*(_WORD *)(v10 + 16) & 0x7FFF) << 9);
          }
          if (v13)
          {
            v14 = v13 & 0xFFFFFFFFFF800000;
            if ((*(__int16 *)((v13 & 0xFFFFFFFFFF800000 | (2
                                                            * (((v13 - (v13 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                             + 0x28) & 0x80000000) == 0)
              goto LABEL_39;
            if ((v13 & 0x1FF) != 0)
            {
              v5 = " (slot=%u), counter=%d\n*** unaligned ptr in free list slot=%u count=%d ptr=%p\n";
              goto LABEL_39;
            }
            v15 = *(uint64_t **)(a1 + 24);
            v16 = *v15;
            if (!*v15)
            {
LABEL_38:
              v5 = " (slot=%u), counter=%d\n*** ptr not in szone slot=%d count=%d ptr=%p\n";
LABEL_39:
              malloc_zone_check_fail((uint64_t)"check: small free list incorrect", (uint64_t)v5);
              os_unfair_lock_unlock(v6);
              return;
            }
            v17 = v15[2];
            v18 = (0x9E3779B97F4A7C55 * (v14 >> 20)) >> -*((_BYTE *)v15 + 8);
            v19 = v18;
            while (1)
            {
              v20 = *(_QWORD *)(v17 + 8 * v19);
              if (!v20)
                goto LABEL_38;
              if (v20 == v14)
                break;
              if (v19 + 1 == v16)
                v19 = 0;
              else
                ++v19;
              if (v19 == v18)
                goto LABEL_38;
            }
            if (!v14)
              goto LABEL_38;
            if (v12)
            {
              v21 = *(_QWORD *)(a1 + 632) ^ a1;
              v22 = v21 ^ *(_QWORD *)v10;
              if (*(unsigned __int8 *)(v10 + 8) != (BYTE4(v22)
                                                                    + v22
                                                                    + ((HIDWORD(v22) + v22) >> 16)
                                                                    + ((unsigned __int16)(WORD2(v22)
                                                                                        + v22
                                                                                        + ((HIDWORD(v22) + v22) >> 16)) >> 8)))
                goto LABEL_42;
              if (v8 != *(_QWORD *)v10)
              {
LABEL_41:
                v5 = " (slot=%u), counter=%d\n*** previous incorrectly set slot=%u count=%d ptr=%p\n";
                goto LABEL_39;
              }
              v7 = *(_QWORD *)(v10 + 16);
              if (*(unsigned __int8 *)(v10 + 24) != (((v21 ^ v7) >> 32)
                                                                     + (v21 ^ v7)
                                                                     + ((((v21 ^ v7) >> 32) + (v21 ^ v7)) >> 16)
                                                                     + ((unsigned __int16)(((v21 ^ v7) >> 32)
                                                                                         + (v21 ^ v7)
                                                                                         + ((((v21 ^ v7) >> 32) + (v21 ^ v7)) >> 16)) >> 8)))
              {
LABEL_42:
                free_list_checksum_botch(a1);
                __break(1u);
                return;
              }
            }
            else
            {
              if (v8 != *(_QWORD *)v10)
                goto LABEL_41;
              v7 = *(_QWORD *)(v10 + 8);
            }
            ++v9;
            v8 = v10;
            v10 = v7;
            if (v7)
              continue;
          }
          break;
        }
      }
      os_unfair_lock_unlock(v6);
      ++v4;
    }
    while (v4 < *(int *)(a1 + 608));
  }
}

void free_list_checksum_botch(uint64_t a1)
{
  malloc_zone_error(*(_DWORD *)(a1 + 620), 1, (uint64_t)"Incorrect checksum for freed object %p: probably modified after being freed.\nCorrupt value: %p\n");
}

void OUTLINED_FUNCTION_0_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v3;

  malloc_zone_error(v3, 1, a3);
}

uint64_t trace_decode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  if ((_DWORD)a4)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      do
      {
        if (!(v5 - a2 + v8))
          return v4;
        v9 = *(_BYTE *)(a1 + v5 + v8);
        v7 |= (unint64_t)(v9 & 0x7F) << v6;
        ++v8;
        v6 += 7;
      }
      while ((v9 & 0x80) == 0);
      if (!v8)
        return v4;
      if (v4)
        v10 = *(_QWORD *)(a3 + 8 * v4 - 8);
      else
        v10 = 0;
      v5 += v8;
      *(_QWORD *)(a3 + 8 * v4++) = v10 + 4 * (-(uint64_t)(v7 & 1) ^ (v7 >> 1));
    }
    while (v4 != a4);
  }
  return a4;
}

uint64_t rack_destroy_regions(uint64_t result)
{
  unint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v1 = *(unint64_t **)(result + 24);
  v2 = *v1;
  if (*v1)
  {
    v3 = result;
    v4 = 0;
    do
    {
      result = *(_QWORD *)(v1[2] + 8 * v4);
      if ((unint64_t)(result + 1) >= 2)
      {
        result = mvm_deallocate_pages();
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 24) + 16) + 8 * v4) = -1;
        v1 = *(unint64_t **)(v3 + 24);
        v2 = *v1;
      }
      ++v4;
    }
    while (v2 > v4);
  }
  return result;
}

uint64_t rack_destroy(uint64_t a1)
{
  _QWORD *v2;
  uint64_t result;
  _QWORD *v4;
  int v5;

  v2 = *(_QWORD **)(a1 + 24);
  result = v2[2];
  v4 = (_QWORD *)MEMORY[0x1E0C88820];
  if (result != a1 + 96)
    result = mvm_deallocate_pages(result, (*MEMORY[0x1E0C88820] + 8 * *v2 - 1) & -*MEMORY[0x1E0C88820], 0);
  v5 = *(_DWORD *)(a1 + 608);
  if (v5 >= 1)
  {
    result = mvm_deallocate_pages(*(_QWORD *)(a1 + 624) - 2560, (*v4 + 2560 * v5 + 2559) & -*v4, 3);
    *(_QWORD *)(a1 + 624) = 0;
  }
  return result;
}

uint64_t rack_region_maybe_dispose(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8;
  uint32_t os_unfair_lock_opaque;
  int v10;

  os_unfair_lock_lock_with_options();
  v8 = *(_DWORD *)(a4 + 36);
  if ((v8 & 2) != 0)
  {
    os_unfair_lock_opaque = a1[155]._os_unfair_lock_opaque;
    if ((os_unfair_lock_opaque & 4) != 0)
      v10 = -2;
    else
      v10 = -4;
    mvm_deallocate_pages(a2, a3, v10 & os_unfair_lock_opaque);
  }
  else
  {
    *(_DWORD *)(a4 + 36) = v8 & 0xFFFFFFFE;
  }
  os_unfair_lock_unlock(a1);
  return (v8 >> 1) & 1;
}

_QWORD *create_legacy_scalable_zone(uint64_t a1, uint64_t a2)
{
  _QWORD *scalable_zone;
  _QWORD *v3;

  scalable_zone = (_QWORD *)create_scalable_zone(a1, a2);
  v3 = scalable_zone;
  if (scalable_zone)
  {
    mprotect(scalable_zone, 0xC8uLL, 3);
    v3[5] = legacy_valloc;
    v3[15] = 0;
    mprotect(v3, 0xC8uLL, 1);
  }
  return v3;
}

mach_vm_address_t legacy_valloc(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  int v4;

  v2 = *MEMORY[0x1E0C887F8];
  if (*MEMORY[0x1E0C887F8] <= *MEMORY[0x1E0C88810])
    v2 = *MEMORY[0x1E0C88810];
  v3 = (v2 + a2) & ~v2;
  v4 = *MEMORY[0x1E0C88800];
  if (*MEMORY[0x1E0C88800] <= *MEMORY[0x1E0C88818])
    LOBYTE(v4) = *MEMORY[0x1E0C88818];
  return large_malloc(a1, v3 >> v4, 0, 1);
}

void *__cdecl malloc_type_zone_valloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  unint64_t StatusReg;
  uint64_t v4;
  malloc_type_id_t v5;
  BOOL v6;
  void *result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v4 = *(_QWORD *)(StatusReg + 904);
  if (type_id <= 1)
    v5 = 1;
  else
    v5 = type_id;
  *(_QWORD *)(StatusReg + 904) = v5;
  if (malloc_interposition_compat)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
    result = j__malloc_zone_valloc(zone, size);
  else
    result = (void *)_malloc_zone_valloc((uint64_t)zone, size, 0);
  *(_QWORD *)(StatusReg + 904) = v4;
  return result;
}

uint64_t _malloc_type_malloc_outlined(size_t __size, unint64_t a2, int a3)
{
  unint64_t StatusReg;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v4 = *(_QWORD *)(StatusReg + 904);
  if (a2 <= 1)
    v5 = 1;
  else
    v5 = a2;
  *(_QWORD *)(StatusReg + 904) = v5;
  if (malloc_interposition_compat)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (!v6 || a3 == 0)
    result = _malloc_zone_malloc((uint64_t)default_zone, __size, 1);
  else
    result = (uint64_t)j__malloc(__size);
  *(_QWORD *)(StatusReg + 904) = v4;
  return result;
}

uint64_t _malloc_type_realloc_outlined(void *a1, size_t a2, unint64_t a3)
{
  unint64_t StatusReg;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v4 = *(_QWORD *)(StatusReg + 904);
  if (a3 <= 1)
    v5 = 1;
  else
    v5 = a3;
  *(_QWORD *)(StatusReg + 904) = v5;
  if (malloc_interposition_compat)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
    result = (uint64_t)j__realloc(a1, a2);
  else
    result = _realloc(a1, a2);
  *(_QWORD *)(StatusReg + 904) = v4;
  return result;
}

uint64_t _malloc_type_zone_realloc_outlined(malloc_zone_t *a1, void *a2, size_t a3, unint64_t a4)
{
  unint64_t StatusReg;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v5 = *(_QWORD *)(StatusReg + 904);
  if (a4 <= 1)
    v6 = 1;
  else
    v6 = a4;
  *(_QWORD *)(StatusReg + 904) = v6;
  if (malloc_interposition_compat)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
    result = (uint64_t)j__malloc_zone_realloc(a1, a2, a3);
  else
    result = _malloc_zone_realloc((uint64_t)a1, (uint64_t)a2, a3, 0);
  *(_QWORD *)(StatusReg + 904) = v5;
  return result;
}

uint64_t malloc_type_zone_malloc_with_options_internal(malloc_zone_t *a1, size_t a2, size_t a3, unint64_t a4, uint64_t a5)
{
  BOOL v5;
  uint64_t (*valloc)(void);

  if (!a2 || (a2 & (a2 - 1)) == 0 && ((a2 - 1) & a3) == 0)
  {
    if (malloc_logger)
      v5 = 0;
    else
      v5 = malloc_slowpath == 0;
    if (!v5)
      return _malloc_type_zone_malloc_with_options_np_outlined(a1, a2, a3, a5, a4);
    if (default_zone == (_UNKNOWN *)a1)
    {
      a1 = *(malloc_zone_t **)malloc_zones;
      if (*(_QWORD *)malloc_zones)
        goto LABEL_12;
    }
    else if (a1)
    {
LABEL_12:
      if (a1->version >= 0x10)
      {
        valloc = (uint64_t (*)(void))a1[1].valloc;
        if (valloc)
          return valloc();
      }
      return _malloc_type_zone_malloc_with_options_np_outlined(a1, a2, a3, a5, a4);
    }
    a1 = *(malloc_zone_t **)malloc_zones;
    goto LABEL_12;
  }
  return 0;
}

uint64_t set_msl_lite_hooks(uint64_t (*a1)(uint64_t (**)(), uint64_t))
{
  return a1(malloc_msl_lite_hooks, 24);
}

void insert_msl_lite_zone(uint64_t a1)
{
  lite_zone = a1;
  malloc_slowpath_update();
}

uint64_t get_global_helper_zone()
{
  return *(_QWORD *)malloc_zones;
}

void mfm_reinit_lock()
{
  if (mfm_arena)
    *(_DWORD *)mfm_arena = 0;
}

uint64_t mfmi_enumerator(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t (*a5)(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4), void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))
{
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C874D8];
  v27 = 0;
  result = mfmi_read_zone(a1, a4, a5, &v27);
  if ((_DWORD)result)
    return result;
  if ((a3 & 4) != 0)
  {
    v28 = a4;
    v29 = 0x20000;
    a6(a1, a2, 4, &v28, 1);
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 1) == 0)
        return 0;
      goto LABEL_8;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  v28 = a4 + 0x20000;
  v29 = 8257536;
  a6(a1, a2, 2, &v28, 1);
  if ((a3 & 1) == 0)
    return 0;
LABEL_8:
  v12 = v27;
  if (!*(_QWORD *)(v27 + 8))
    return 0;
  v13 = 0;
  v14 = 0;
  do
  {
    v15 = (v13 + 1) >> 5;
    v16 = v15 & 0x7FFFFFFFFFFFFFELL;
    v17 = v12 + 8 * (v15 & 0x7FFFFFFFFFFFFFELL);
    v18 = *(_QWORD *)(v17 + 224) >> (v13 + 1);
    if (v18)
    {
      v19 = __clz(__rbit64(v18));
LABEL_12:
      v20 = v19 + 1;
      goto LABEL_13;
    }
    v23 = ((_BYTE)v13 + 1) & 0x3F;
    v24 = *(_QWORD *)(v17 + 240);
    if (!v24)
    {
      v25 = *(_QWORD *)(v12 + ((8 * v15) | 8) + 224);
      if (v23 < 0x2E)
        LODWORD(v26) = 0;
      else
        v26 = *(_QWORD *)(v12 + 8 * v16 + 248);
      v19 = ((v25 >> v23) | ((unint64_t)(2 * v26) << (v23 ^ 0x3Fu))) & 0x7FFFF;
      goto LABEL_12;
    }
    v20 = __clz(__rbit64(v24)) - v23 + 65;
LABEL_13:
    if ((*(_QWORD *)(v12 + 224 + ((v13 >> 2) & 0x3FFFFFFFFFFFFFF0)) & (1 << v13) & *(_QWORD *)(v12
                                                                                                  + 224
                                                                                                  + ((v13 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8))) != 0)
    {
      v21 = v12;
      if (v14 == 32)
      {
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))a6)(a1, a2, 1, &v28);
        v14 = 0;
        v21 = v27;
      }
      v22 = &v28 + 2 * v14;
      *v22 = v12 + 16 * v13 + 0x20000 + a4 - v21;
      v22[1] = 16 * v20;
      ++v14;
      v12 = v21;
    }
    v13 += v20;
  }
  while (v13 < *(_QWORD *)(v12 + 8));
  if (v14)
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))a6)(a1, a2, 1, &v28);
  return 0;
}

unint64_t mfmi_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x4000)
    return 0;
  else
    return (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
}

uint64_t mfmi_check()
{
  return 1;
}

void mfmi_print_self(uint64_t a1, int a2)
{
  unint64_t v2;
  uint64_t i;
  unint64_t v5;
  uint64_t j;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v2 = mfm_arena;
  if (mfm_arena)
  {
    malloc_report_simple((uint64_t)"mfm_arena info\n");
    malloc_report_simple((uint64_t)" address      : %p\n");
    malloc_report_simple((uint64_t)" size         : %zd\n");
    malloc_report_simple((uint64_t)" high water   : %zd\n");
    malloc_report_simple((uint64_t)" arena        : [%p, %p)\n");
    malloc_report_simple((uint64_t)"\n");
    malloc_report_simple((uint64_t)"freelists\n");
    for (i = 0; i != 11; ++i)
    {
      v5 = v2 + 16 * i;
      malloc_report_simple((uint64_t)" size %-8zd:\n");
      v8 = *(_QWORD *)(v5 + 32);
      v7 = (uint64_t *)(v5 + 32);
      for (j = v8; ; j = *v9)
      {
        v9 = (uint64_t *)(v2 + 16 * j);
        if (v9 == v7)
          break;
        malloc_report_simple((uint64_t)"  [%p, %p) size=%zd\n");
      }
    }
    malloc_report_simple((uint64_t)"\n");
    if (a2)
    {
      malloc_report_simple((uint64_t)"blocks\n");
      if (*(_QWORD *)(v2 + 8))
      {
        v10 = 0;
        do
        {
          v11 = (v10 + 1) >> 5;
          v12 = v11 & 0x7FFFFFFFFFFFFFELL;
          v13 = v2 + 8 * (v11 & 0x7FFFFFFFFFFFFFELL);
          v14 = *(_QWORD *)(v13 + 224) >> (v10 + 1);
          if (v14)
          {
            v15 = __clz(__rbit64(v14));
          }
          else
          {
            v17 = ((_BYTE)v10 + 1) & 0x3F;
            v18 = *(_QWORD *)(v13 + 240);
            if (v18)
            {
              v16 = __clz(__rbit64(v18)) - v17 + 65;
              goto LABEL_13;
            }
            v19 = *(_QWORD *)(v2 + ((8 * v11) | 8) + 224);
            if (v17 < 0x2E)
              LODWORD(v20) = 0;
            else
              v20 = *(_QWORD *)(v2 + 8 * v12 + 248);
            v15 = ((v19 >> v17) | ((unint64_t)(2 * v20) << (v17 ^ 0x3Fu))) & 0x7FFFF;
          }
          v16 = v15 + 1;
LABEL_13:
          malloc_report_simple((uint64_t)" %c[%p, %p) size=%zd\n");
          v10 += v16;
        }
        while (v10 < *(_QWORD *)(v2 + 8));
      }
      malloc_report_simple((uint64_t)"  [%p, %p) size=%zd (bump)\n");
      malloc_report_simple((uint64_t)"\n");
    }
  }
}

uint64_t mfmi_force_lock()
{
  uint64_t result;

  result = mfm_arena;
  if (mfm_arena)
    return os_unfair_lock_lock_with_options();
  return result;
}

void mfmi_force_unlock()
{
  if (mfm_arena)
    os_unfair_lock_unlock((os_unfair_lock_t)mfm_arena);
}

void mfmi_statistics_self(int a1, _DWORD *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = mfm_arena;
  bzero(a2, 0x20uLL);
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 16);
    *a2 = *(_QWORD *)(v3 + 24);
    v5 = 16 * *(unsigned int *)(v3 + 4);
    *((_QWORD *)a2 + 3) = 0x800000;
    v6 = ((((v4 >> 2) & 0x1FFFFFFFFFFFFFF8) + *MEMORY[0x1E0C88820] + 223) & -*MEMORY[0x1E0C88820])
       + *((_QWORD *)a2 + 2)
       + ((*MEMORY[0x1E0C88820] + 16 * v4 - 1) & -*MEMORY[0x1E0C88820]);
    *((_QWORD *)a2 + 1) = v5;
    *((_QWORD *)a2 + 2) = v6;
  }
}

BOOL mfmi_locked()
{
  os_unfair_lock_s *v0;
  _BOOL8 result;

  v0 = (os_unfair_lock_s *)mfm_arena;
  if (!mfm_arena)
    return 0;
  result = os_unfair_lock_trylock((os_unfair_lock_t)mfm_arena);
  if (result)
  {
    os_unfair_lock_unlock(v0);
    return 1;
  }
  return result;
}

void mfmi_reinit_lock()
{
  if (mfm_arena)
    *(_DWORD *)mfm_arena = 0;
}

uint64_t mfmi_print_task(uint64_t a1, unsigned int a2, const void *a3, uint64_t (*a4)(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4), uint64_t (*a5)(const char *, ...))
{
  uint64_t v9;

  v9 = 0;
  if (mfmi_read_zone(a1, (uint64_t)a3, a4, &v9))
    return a5("Failed to read ProbGuard zone at %p\n", a3);
  else
    return print_mfm_arena(v9, a2 > 1, (void (*)(const char *, ...))a5);
}

uint64_t print_mfm_arena(uint64_t a1, char a2, void (*a3)(const char *, ...))
{
  uint64_t i;
  uint64_t v6;
  uint64_t j;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;

  a3("mfm_arena info\n");
  a3(" address      : %p\n", (const void *)a1);
  a3(" size         : %zd\n", 16 * *(unsigned int *)(a1 + 4));
  a3(" high water   : %zd\n", 16 * *(_QWORD *)(a1 + 8));
  a3(" arena        : [%p, %p)\n", (const void *)(a1 + 0x20000), (const void *)(a1 + 0x800000));
  a3("\n");
  a3("freelists\n");
  for (i = 0; i != 11; ++i)
  {
    v6 = a1 + 16 * i;
    a3(" size %-8zd:\n", 16 << i);
    v9 = *(_QWORD *)(v6 + 32);
    v8 = (uint64_t *)(v6 + 32);
    for (j = v9; ; j = *v10)
    {
      v10 = (uint64_t *)(a1 + 16 * j);
      if (v10 == v8)
        break;
      v11 = ((16 * j - 0x20000) >> 4) + 1;
      v12 = v11 >> 5;
      v13 = (v11 >> 5) & 0x7FFFFFFFFFFFFFELL;
      v14 = a1 + 8 * v13;
      v15 = *(_QWORD *)(v14 + 224) >> v11;
      if (v15)
      {
        v16 = __clz(__rbit64(v15)) + 1;
LABEL_6:
        a3("  [%p, %p) size=%zd\n", v10, &v10[2 * v16], 16 * v16);
        continue;
      }
      v17 = v11 & 0x3F;
      v18 = *(_QWORD *)(v14 + 240);
      if (v18)
      {
        v16 = __clz(__rbit64(v18)) - v17 + 65;
        goto LABEL_6;
      }
      v19 = *(_QWORD *)(a1 + ((8 * v12) | 8) + 224);
      if (v17 < 0x2E)
        LODWORD(v20) = 0;
      else
        v20 = *(_QWORD *)(a1 + 8 * v13 + 248);
      v21 = (((v19 >> v17) | ((unint64_t)(2 * v20) << (v17 ^ 0x3Fu))) & 0x7FFFF)
          + 1;
      a3("  [%p, %p) size=%zd\n", v10, &v10[2 * v21], 16 * v21);
    }
  }
  result = ((uint64_t (*)(const char *))a3)("\n");
  if ((a2 & 1) != 0)
  {
    a3("blocks\n");
    v23 = *(_QWORD *)(a1 + 8);
    if (v23)
    {
      v24 = 0;
      do
      {
        v25 = (v24 + 1) >> 5;
        v26 = v25 & 0x7FFFFFFFFFFFFFELL;
        v27 = a1 + 8 * (v25 & 0x7FFFFFFFFFFFFFELL);
        v28 = *(_QWORD *)(v27 + 224) >> (v24 + 1);
        if (v28)
        {
          v29 = __clz(__rbit64(v28));
        }
        else
        {
          v32 = ((_BYTE)v24 + 1) & 0x3F;
          v33 = *(_QWORD *)(v27 + 240);
          if (v33)
          {
            v30 = __clz(__rbit64(v33)) - v32 + 65;
            goto LABEL_21;
          }
          v34 = *(_QWORD *)(a1 + ((8 * v25) | 8) + 224);
          if (v32 < 0x2E)
            LODWORD(v35) = 0;
          else
            v35 = *(_QWORD *)(a1 + 8 * v26 + 248);
          v29 = ((v34 >> v32) | ((unint64_t)(2 * v35) << (v32 ^ 0x3Fu))) & 0x7FFFF;
        }
        v30 = v29 + 1;
LABEL_21:
        if ((*(_QWORD *)(a1 + 224 + ((v24 >> 2) & 0x3FFFFFFFFFFFFFF0)) & (1 << v24) & *(_QWORD *)(a1 + 224 + ((v24 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8))) != 0)
          v31 = "*";
        else
          v31 = " *";
        a3(" %c[%p, %p) size=%zd\n", *v31, (const void *)(a1 + 16 * v24 + 0x20000), (const void *)(a1 + 16 * v24 + 0x20000 + 16 * v30), 16 * v30);
        v24 += v30;
        v23 = *(_QWORD *)(a1 + 8);
      }
      while (v24 < v23);
    }
    a3("  [%p, %p) size=%zd (bump)\n", (const void *)(a1 + 16 * v23 + 0x20000), (const void *)(a1 + 0x800000), 8257536 - 16 * v23);
    return ((uint64_t (*)(const char *))a3)("\n");
  }
  return result;
}

uint64_t xzm_segment_table_foreach(unsigned int *a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t result;

  v6 = a2;
  if (a4)
  {
    v8 = *a4;
    if (a2)
      goto LABEL_3;
    goto LABEL_9;
  }
  v8 = 0;
  if (!a2)
  {
LABEL_9:
    result = 0;
    if (a4)
      *a4 = v8;
    return result;
  }
LABEL_3:
  while (1)
  {
    v9 = *a1++;
    v10 = (unint64_t)v9 << 14;
    if (v9 && v8 != v10)
    {
      result = (*(uint64_t (**)(uint64_t, unint64_t))(a3 + 16))(a3, v10);
      v8 = v10;
      if ((_DWORD)result)
        return result;
    }
    if (!--v6)
      goto LABEL_9;
  }
}

uint64_t xzm_ptr_in_use_enumerator(uint64_t task, uint64_t a2, char a3, unint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, _QWORD **), void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))
{
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, _QWORD **);
  uint64_t is_self;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;
  _QWORD *v17;
  _QWORD v18[6];
  int v19;
  BOOL v20;
  _QWORD v21[6];
  int v22;
  BOOL v23;
  BOOL v24;
  char v25;
  _QWORD v26[6];
  int v27;
  BOOL v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v7 = a5;
  if (!a5)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self)
        nanov2_realloc_VARIANT_mp_cold_1(is_self);
    }
    v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD **))_malloc_default_reader_2;
  }
  v31 = 0;
  v32 = 0;
  v30 = 0;
  result = _xzm_introspect_map_zone_and_main(task, a4, v7, &v32, &v31, &v30);
  if (!(_DWORD)result)
  {
    v14 = v30;
    v15 = v31;
    v16 = v30 == a4;
    if (v30 != a4
      || (result = mfmi_enumerator(task, a2, a3, *(_QWORD *)(v31 + 336), (uint64_t (*)(task_name_t, uint64_t, uint64_t, _QWORD *))v7, a6), !(_DWORD)result))
    {
      v26[0] = MEMORY[0x1E0C87450];
      v26[1] = 0x40000000;
      v26[2] = __xzm_ptr_in_use_enumerator_block_invoke;
      v26[3] = &__block_descriptor_tmp;
      v28 = (a3 & 4) != 0;
      v29 = v16;
      v27 = task;
      v26[4] = a6;
      v26[5] = a2;
      v21[0] = MEMORY[0x1E0C87450];
      v21[1] = 0x40000000;
      v21[2] = __xzm_ptr_in_use_enumerator_block_invoke_3;
      v21[3] = &__block_descriptor_tmp_4;
      v23 = v28;
      v22 = task;
      v21[4] = a6;
      v21[5] = a2;
      v24 = (a3 & 2) != 0;
      v25 = a3 & 1;
      if (v14 == a4)
      {
        v18[0] = MEMORY[0x1E0C87450];
        v18[1] = 0x40000000;
        v18[2] = __xzm_ptr_in_use_enumerator_block_invoke_4;
        v18[3] = &__block_descriptor_tmp_6;
        v20 = (a3 & 2) != 0;
        v19 = task;
        v17 = v18;
        v18[4] = a6;
        v18[5] = a2;
      }
      else
      {
        v17 = 0;
      }
      return _xzm_introspect_enumerate(task, (uint64_t (*)(_QWORD))v7, a4, v32, v14, v15, a3 & 1, (uint64_t)v26, (uint64_t)&__block_literal_global, (uint64_t)v21, (uint64_t)v17);
    }
  }
  return result;
}

void xzm_print_self(unint64_t a1)
{
  vm_map_t *v2;
  task_name_t v3;
  uint64_t is_self;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int v16;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  BOOL v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  const char *v40;
  _QWORD *v41;
  int v42;
  mach_vm_address_t v43;
  uint64_t v44;
  _QWORD v45[8];
  _QWORD v46[8];
  _QWORD v47[7];
  _QWORD v48[2];
  uint64_t (*v49)(uint64_t, const void *, uint64_t, const char *);
  void *v50;
  _QWORD *v51;
  uint64_t *v52;
  uint64_t *v53;
  void (*v54)(uint64_t);
  unint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  _QWORD v64[8];
  task_name_t v65;
  _QWORD v66[4];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;

  v2 = (vm_map_t *)MEMORY[0x1E0C883F0];
  v3 = *MEMORY[0x1E0C883F0];
  if (!*MEMORY[0x1E0C883F0])
  {
    v5 = *(_QWORD *)(a1 + 200);
    if (v5 < 0x130)
      return;
    v7 = *(_QWORD *)(a1 + 232);
    if (v7)
    {
      if (*(_QWORD *)(v7 + 304) < 0x1D8uLL)
        return;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  is_self = mach_task_is_self(*MEMORY[0x1E0C883F0]);
  if (!(_DWORD)is_self)
    nanov2_realloc_VARIANT_mp_cold_1(is_self);
  v5 = *(_QWORD *)(a1 + 200);
  if (v5 >= 0x130)
  {
    v6 = mach_task_is_self(v3);
    if (!(_DWORD)v6)
      nanov2_realloc_VARIANT_mp_cold_1(v6);
    v7 = *(_QWORD *)(a1 + 232);
    if (v7)
    {
      v8 = mach_task_is_self(v3);
      if (!(_DWORD)v8)
        nanov2_realloc_VARIANT_mp_cold_1(v8);
      v9 = *(_QWORD *)(v7 + 304);
      if (v9 < 0x1D8)
        return;
      v10 = mach_task_is_self(v3);
      if (!(_DWORD)v10)
        nanov2_realloc_VARIANT_mp_cold_1(v10);
      if (v9 < *(_QWORD *)(v7 + 304))
        return;
LABEL_16:
      if (!v7)
        xzm_print_self_cold_1();
      malloc_report_simple((uint64_t)"Begin xzone malloc JSON:\n");
      malloc_report_simple((uint64_t)"{\n");
      malloc_report_simple((uint64_t)"\"desc\": \"xzone malloc\", \n");
      malloc_report_simple((uint64_t)"\"addr\": \"%p\", \n");
      malloc_report_simple((uint64_t)"\"segment_size\": %zu, \n");
      malloc_report_simple((uint64_t)"\"slice_size\": %zu, \n");
      malloc_report_simple((uint64_t)"\"mzone\": %d, \n");
      malloc_report_simple((uint64_t)"\"is_main\": %d, \n");
      malloc_report_simple((uint64_t)"\"max_slot_config\": %d, \n");
      v71 = 0;
      v72 = &v71;
      v73 = 0x2000000000;
      v74 = 0;
      v67 = 0;
      v68 = &v67;
      v69 = 0x2000000000;
      v70 = 0;
      v66[0] = 0;
      v66[1] = v66;
      v66[2] = 0x2000000000;
      v11 = MEMORY[0x1E0C87450];
      v66[3] = 0;
      v64[0] = MEMORY[0x1E0C87450];
      v64[1] = 0x40000000;
      v64[2] = __xzm_print_block_invoke;
      v64[3] = &unk_1E2DF9A18;
      v65 = v3;
      v64[4] = v66;
      v64[5] = &v71;
      v64[6] = &v67;
      v64[7] = malloc_report_simple;
      v60 = 0;
      v61 = &v60;
      v62 = 0x2000000000;
      v63 = 1;
      v56 = 0;
      v57 = &v56;
      v58 = 0x2000000000;
      v59 = 1;
      v48[0] = MEMORY[0x1E0C87450];
      v48[1] = 0x40000000;
      v49 = __xzm_print_block_invoke_2;
      v50 = &unk_1E2DF9A40;
      v54 = malloc_report_simple;
      v55 = v7;
      v52 = &v60;
      v53 = &v56;
      v51 = v64;
      if (v7 == a1)
      {
        malloc_report_simple((uint64_t)"\"bucketing_key\": \"%016llx%016llx\", \n");
        malloc_report_simple((uint64_t)"\"guard_config\": {\n");
        malloc_report_simple((uint64_t)"    \"guards_enabled\": %d, \n");
        malloc_report_simple((uint64_t)"    \"data_guards_enabled\": %d, \n");
        malloc_report_simple((uint64_t)"    \"tiny_run_size\": %d, \n");
        malloc_report_simple((uint64_t)"    \"tiny_guard_density\": %d, \n");
        malloc_report_simple((uint64_t)"    \"small_run_size\": %d, \n");
        malloc_report_simple((uint64_t)"    \"small_guard_density\": %d \n");
        malloc_report_simple((uint64_t)"}, \n");
        malloc_report_simple((uint64_t)"\"defer_large\": %s, \n");
        malloc_report_simple((uint64_t)"\"defer_xzones\": %s, \n");
        v12 = *(_QWORD **)(v7 + 464);
        if (v12)
        {
          if (v3)
          {
            v13 = mach_task_is_self(v3);
            if (!(_DWORD)v13)
              nanov2_realloc_VARIANT_mp_cold_1(v13);
            if (*v12)
            {
              v14 = mach_task_is_self(v3);
              if (!(_DWORD)v14)
                nanov2_realloc_VARIANT_mp_cold_1(v14);
            }
          }
          malloc_report_simple((uint64_t)"\"reclaim_buffer\": { \n");
          malloc_report_simple((uint64_t)"    \"va_in_buffer\": %llu, \n");
          malloc_report_simple((uint64_t)"    \"last_accounting_given_to_kernel\": %llu, \n");
          malloc_report_simple((uint64_t)"    \"buffer\": \"%p\", \n");
          malloc_report_simple((uint64_t)"    \"buffer_len\": %llu, \n");
          if (*v12 && v12[1])
          {
            malloc_report_simple((uint64_t)"    \"indices\": { \n");
            malloc_report_simple((uint64_t)"        \"head\": %llu, \n");
            malloc_report_simple((uint64_t)"        \"busy\": %llu, \n");
            malloc_report_simple((uint64_t)"        \"tail\": %llu \n");
            malloc_report_simple((uint64_t)"    }, \n");
            malloc_report_simple((uint64_t)"    \"entries\": [ \n");
            if (v12[1])
            {
              v15 = 0;
              v16 = 1;
              do
              {
                malloc_report_simple((uint64_t)"        { \n");
                malloc_report_simple((uint64_t)"            \"index\": %u, \n");
                malloc_report_simple((uint64_t)"            \"address\": \"%p\", \n");
                malloc_report_simple((uint64_t)"            \"size\": %u, \n");
                malloc_report_simple((uint64_t)"            \"behavior\": %u, \n");
                malloc_report_simple((uint64_t)"            \"flags\": \"0x%x\" \n");
                malloc_report_simple((uint64_t)"        }");
                if (v12[1] - 1 > v15)
                  malloc_report_simple((uint64_t)",");
                malloc_report_simple((uint64_t)" \n");
                v15 = v16;
              }
              while (v12[1] > (unint64_t)v16++);
            }
            malloc_report_simple((uint64_t)"    ] \n");
          }
          malloc_report_simple((uint64_t)"}, \n");
        }
        malloc_report_simple((uint64_t)"\"range_groups\": {\n");
        v18 = *(_QWORD *)(v7 + 384);
        v19 = v18 - a1;
        if (v18 < a1)
          goto LABEL_87;
        v20 = *(unsigned __int8 *)(v7 + 329);
        if (__CFADD__(v19, 56 * v20))
          goto LABEL_87;
        if ((unint64_t)(v19 + 56 * v20) > *(_QWORD *)(v7 + 304))
          goto LABEL_87;
        v21 = v19 + v7;
        if (!(v19 + v7))
          goto LABEL_87;
        if (*(_BYTE *)(v7 + 329))
        {
          v22 = 0;
          do
          {
            malloc_report_simple((uint64_t)"    ");
            if (v22)
              malloc_report_simple((uint64_t)", ");
            malloc_report_simple((uint64_t)"\"%d\": {\n");
            malloc_report_simple((uint64_t)"        \"id\": %d, \n");
            malloc_report_simple((uint64_t)"        \"lock\": %u, \n");
            malloc_report_simple((uint64_t)"        \"base\": \"%p\", \n");
            malloc_report_simple((uint64_t)"        \"size\": %zu, \n");
            malloc_report_simple((uint64_t)"        \"next\": \"%p\", \n");
            malloc_report_simple((uint64_t)"        \"remaining\": %zu\n");
            malloc_report_simple((uint64_t)"    }\n");
            ++v22;
            v21 += 56;
          }
          while (v22 < *(unsigned __int8 *)(v7 + 329));
        }
        malloc_report_simple((uint64_t)"}, \n");
        malloc_report_simple((uint64_t)"\"segment_groups\": {\n");
        v23 = *(_QWORD *)(v7 + 392);
        v24 = v23 - a1;
        if (v23 < a1)
          goto LABEL_87;
        v25 = *(unsigned __int8 *)(v7 + 344);
        if (__CFADD__(v24, 496 * v25))
          goto LABEL_87;
        if ((unint64_t)(v24 + 496 * v25) > *(_QWORD *)(v7 + 304))
          goto LABEL_87;
        v26 = v24 + v7;
        if (!(v24 + v7))
          goto LABEL_87;
        if (*(_BYTE *)(v7 + 344))
        {
          v27 = 0;
          while (1)
          {
            malloc_report_simple((uint64_t)"    ");
            if (v27)
              malloc_report_simple((uint64_t)", ");
            malloc_report_simple((uint64_t)"\"%d\": {\n");
            malloc_report_simple((uint64_t)"        \"id\": \"%s\", \n");
            malloc_report_simple((uint64_t)"        \"segment_cache\": { \n");
            malloc_report_simple((uint64_t)"            \"max_count\": %u, \n");
            malloc_report_simple((uint64_t)"            \"count\": %u, \n");
            malloc_report_simple((uint64_t)"            \"max_entry_slices\": %u, \n");
            malloc_report_simple((uint64_t)"            \"segments\": { \n");
            if (*(_WORD *)(v26 + 496 * v27 + 482))
            {
              v28 = *(_QWORD **)(v26 + 496 * v27 + 464);
              if (v28)
                break;
            }
LABEL_56:
            malloc_report_simple((uint64_t)"            } \n");
            malloc_report_simple((uint64_t)"        } \n");
            malloc_report_simple((uint64_t)"    }\n");
            if (++v27 >= (unint64_t)*(unsigned __int8 *)(v7 + 344))
              goto LABEL_57;
          }
          while (1)
          {
            if (v3)
            {
              v29 = mach_task_is_self(v3);
              if (!(_DWORD)v29)
                nanov2_realloc_VARIANT_mp_cold_1(v29);
            }
            if (v49((uint64_t)v48, v28, (uint64_t)v28, "                    "))
              goto LABEL_87;
            v28 = (_QWORD *)v28[3];
            if (!v28)
              goto LABEL_56;
          }
        }
LABEL_57:
        malloc_report_simple((uint64_t)"}, \n");
        malloc_report_simple((uint64_t)"\"xzones\": {\n");
        v30 = *(_QWORD *)(v7 + 216);
        v31 = v30 - a1;
        if (v30 < a1
          || (v32 = 88 * *(unsigned __int8 *)(v7 + 210), v33 = v31 + v32, __CFADD__(v31, v32))
          || (v34 = *(_QWORD *)(v7 + 304), v33 > v34)
          || (v44 = v31 + v7) == 0
          || (v35 = *(_QWORD *)(v7 + 224), v36 = v35 >= a1, v37 = v35 - a1, !v36)
          || __CFADD__(v37, 32 * *(unsigned __int8 *)(v7 + 210) * (unint64_t)*(unsigned __int8 *)(v7 + 211))
          || v37 + 32 * *(unsigned __int8 *)(v7 + 210) * (unint64_t)*(unsigned __int8 *)(v7 + 211) > v34
          || !(v37 + v7))
        {
LABEL_87:
          _Block_object_dispose(&v56, 8);
          _Block_object_dispose(&v60, 8);
          _Block_object_dispose(v66, 8);
          _Block_object_dispose(&v67, 8);
          _Block_object_dispose(&v71, 8);
          return;
        }
        if (*(unsigned __int8 *)(a1 + 210) >= 2u)
        {
          v38 = 1;
          do
          {
            malloc_report_simple((uint64_t)"    \"%d\": {\n");
            malloc_report_simple((uint64_t)"        \"id\": %d, \n");
            malloc_report_simple((uint64_t)"        \"bucket\": %d, \n");
            malloc_report_simple((uint64_t)"        \"segment_group\": %zu, \n");
            malloc_report_simple((uint64_t)"        \"block_size\": %llu, \n");
            malloc_report_simple((uint64_t)"        \"chunk_capacity\": %u, \n");
            malloc_report_simple((uint64_t)"        \"sequestered\": %d,\n");
            malloc_report_simple((uint64_t)"        \"slot_config\": \"%s\",\n");
            malloc_report_simple((uint64_t)"        \"allocation_slots\": [\n");
            if (*(_BYTE *)(a1 + 211))
            {
              v39 = 0;
              do
              {
                malloc_report_simple((uint64_t)"            {\n");
                if (*(_QWORD *)(v44 + 88 * v38 + 48) > 0x1000uLL)
                {
                  malloc_report_simple((uint64_t)"                \"chunk\": \"%p\",\n");
                  malloc_report_simple((uint64_t)"                \"allocations\": %lu,\n");
                  v40 = "                \"contentions\": %lu,\n";
                }
                else
                {
                  malloc_report_simple((uint64_t)"                \"atomic_value\": \"0x%llx\",\n");
                  malloc_report_simple((uint64_t)"                \"xsg_locked\": \"0x%llx\",\n");
                  malloc_report_simple((uint64_t)"                \"xsg_waiters\": \"0x%llx\",\n");
                  malloc_report_simple((uint64_t)"                \"xsc_ptr\": \"0x%llx\",\n");
                  malloc_report_simple((uint64_t)"                \"allocations\": %lu,\n");
                  malloc_report_simple((uint64_t)"                \"contentions\": %lu,\n");
                  v40 = "                \"slot_config\": \"%s\",\n";
                }
                malloc_report_simple((uint64_t)v40);
                malloc_report_simple((uint64_t)"                \"last_chunk_empty_ts\": %llu\n");
                malloc_report_simple((uint64_t)"            }");
                if (*(unsigned __int8 *)(a1 + 211) - 1 > v39)
                  malloc_report_simple((uint64_t)",");
                malloc_report_simple((uint64_t)"\n");
                ++v39;
              }
              while (v39 < *(unsigned __int8 *)(a1 + 211));
            }
            malloc_report_simple((uint64_t)"        ]\n");
            malloc_report_simple((uint64_t)"    }");
            if (*(unsigned __int8 *)(a1 + 210) - 1 > (int)v38)
              malloc_report_simple((uint64_t)",");
            malloc_report_simple((uint64_t)"\n");
            ++v38;
          }
          while (v38 < *(unsigned __int8 *)(a1 + 210));
        }
        malloc_report_simple((uint64_t)"}, \n");
        v2 = (vm_map_t *)MEMORY[0x1E0C883F0];
        v11 = MEMORY[0x1E0C87450];
      }
      malloc_report_simple((uint64_t)"\"spans\": {\n");
      *((_BYTE *)v61 + 24) = 1;
      *((_BYTE *)v57 + 24) = 0;
      v46[7] = v7;
      v47[0] = v11;
      v47[1] = 0x40000000;
      v47[2] = __xzm_print_block_invoke_3;
      v47[3] = &unk_1E2DF9A68;
      v47[5] = &v60;
      v47[6] = malloc_report_simple;
      v47[4] = v64;
      v46[0] = v11;
      v46[1] = 0x40000000;
      v46[2] = __xzm_print_block_invoke_4;
      v46[3] = &unk_1E2DF9A90;
      v46[5] = &v60;
      v46[6] = malloc_report_simple;
      v46[4] = v64;
      if (v7 == a1)
      {
        v45[0] = v11;
        v45[1] = 0x40000000;
        v45[2] = __xzm_print_block_invoke_5;
        v45[3] = &unk_1E2DF9AB8;
        v45[6] = malloc_report_simple;
        v45[7] = v7;
        v41 = v45;
        v45[4] = v64;
        v45[5] = &v60;
      }
      else
      {
        v41 = 0;
      }
      v42 = _xzm_introspect_enumerate(v3, (uint64_t (*)(_QWORD))_malloc_default_reader_2, a1, a1, v7, v7, 0, (uint64_t)v47, (uint64_t)v48, (uint64_t)v46, (uint64_t)v41);
      v43 = v68[3];
      if (v43)
        mach_vm_deallocate(*v2, v43, 4 * v72[3]);
      if (!v42)
      {
        malloc_report_simple((uint64_t)"}\n");
        malloc_report_simple((uint64_t)"}\n");
        malloc_report_simple((uint64_t)"End xzone malloc JSON\n");
      }
      goto LABEL_87;
    }
LABEL_15:
    v7 = a1;
    if (*(_QWORD *)(a1 + 304) != v5)
      return;
    goto LABEL_16;
  }
}

void xzm_print_task(uint64_t a1, uint64_t a2, const void *a3, uint64_t (*a4)(_QWORD), void (*a5)(const char *, ...))
{
  xzm_print(a1, a3, a4, a5);
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[2];

  if (*(_BYTE *)(a1 + 52) && *(_BYTE *)(a1 + 53))
  {
    v4[0] = a2;
    v4[1] = a3;
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), 4, v4, 1);
  }
  return 0;
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke_2()
{
  return 0;
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v13;
  BOOL v14;
  int v15;
  uint64_t v18;
  unint64_t v19;

  v13 = *(_BYTE *)(a4 + 32) & 0xF;
  if (*(_BYTE *)(a1 + 52))
    v14 = v13 == 7;
  else
    v14 = 0;
  if (v14)
  {
    v18 = a2;
    v19 = 0x4000;
    (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), 4, &v18, 1);
  }
  v15 = *(unsigned __int8 *)(a1 + 53);
  if (*(_BYTE *)(a1 + 53) || *(_BYTE *)(a1 + 54))
  {
    v18 = a6;
    v19 = (unint64_t)a5 << 14;
    if (v13 == 5 || v13 == 2)
    {
      if (v15)
        (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), 2, &v18, 1);
      if (*(_BYTE *)(a1 + 54))
        (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), 1, a8, a9);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), 3, &v18, 1);
    }
  }
  return 0;
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  _QWORD v7[2];

  if (*(_BYTE *)(a1 + 52) && (*(_BYTE *)(a3 + 20) != 1 || (*(_BYTE *)(a4 + 32) & 0xF) != 7))
  {
    v7[0] = a6;
    v7[1] = (unint64_t)a5 << 14;
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), 2, v7, 1);
  }
  return 0;
}

void xzm_print(uint64_t a1, const void *a2, uint64_t (*a3)(_QWORD), void (*a4)(const char *, ...))
{
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  int v20;
  mach_vm_address_t v21;
  unint64_t v22;
  unsigned int v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unsigned __int8 *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  const char *v36;
  unint64_t v37;
  const void *v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  BOOL v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  const char *v53;
  int v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  const char *v58;
  unint64_t v59;
  _QWORD *v60;
  unint64_t v61;
  unint64_t v62;
  const void *v63;
  const void *v64;
  _QWORD v65[8];
  _QWORD v66[8];
  _QWORD v67[7];
  _QWORD v68[2];
  uint64_t (*v69)(uint64_t, const void *, uint64_t, const char *);
  void *v70;
  _QWORD *v71;
  uint64_t *v72;
  uint64_t *v73;
  void (*v74)(const char *, ...);
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;
  _QWORD v84[8];
  int v85;
  _QWORD v86[4];
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  _QWORD v99[2];

  v96 = 0;
  v97 = 0;
  v95 = 0;
  if (!_xzm_introspect_map_zone_and_main(a1, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD **))a3, &v97, &v96, &v95))
  {
    v8 = (const void *)v95;
    a4("Begin xzone malloc JSON:\n");
    a4("{\n");
    a4("\"desc\": \"xzone malloc\", \n");
    a4("\"addr\": \"%p\", \n", a2);
    a4("\"segment_size\": %zu, \n", 0x400000uLL);
    a4("\"slice_size\": %zu, \n", 0x4000uLL);
    v9 = v97;
    a4("\"mzone\": %d, \n", *(unsigned __int16 *)(v97 + 208));
    a4("\"is_main\": %d, \n", v8 == a2);
    a4("\"max_slot_config\": %d, \n", *(_BYTE *)(v9 + 240) & 3);
    v91 = 0;
    v92 = &v91;
    v93 = 0x2000000000;
    v94 = 0;
    v87 = 0;
    v88 = &v87;
    v89 = 0x2000000000;
    v90 = 0;
    v86[0] = 0;
    v86[1] = v86;
    v86[2] = 0x2000000000;
    v86[3] = 0;
    v10 = MEMORY[0x1E0C87450];
    v84[0] = MEMORY[0x1E0C87450];
    v84[1] = 0x40000000;
    v84[2] = __xzm_print_block_invoke;
    v84[3] = &unk_1E2DF9A18;
    v85 = a1;
    v84[4] = v86;
    v84[5] = &v91;
    v84[6] = &v87;
    v84[7] = a4;
    v80 = 0;
    v81 = &v80;
    v82 = 0x2000000000;
    v83 = 1;
    v76 = 0;
    v77 = &v76;
    v78 = 0x2000000000;
    v79 = 1;
    v68[0] = MEMORY[0x1E0C87450];
    v68[1] = 0x40000000;
    v69 = __xzm_print_block_invoke_2;
    v70 = &unk_1E2DF9A40;
    v11 = v96;
    v74 = a4;
    v75 = v96;
    v72 = &v80;
    v73 = &v76;
    v71 = v84;
    if (v8 != a2)
    {
      v17 = v97;
      v18 = v95;
LABEL_15:
      a4("\"spans\": {\n");
      *((_BYTE *)v81 + 24) = 1;
      *((_BYTE *)v77 + 24) = 0;
      v67[0] = v10;
      v67[1] = 0x40000000;
      v67[2] = __xzm_print_block_invoke_3;
      v67[3] = &unk_1E2DF9A68;
      v67[5] = &v80;
      v67[6] = a4;
      v67[4] = v84;
      v66[0] = v10;
      v66[1] = 0x40000000;
      v66[2] = __xzm_print_block_invoke_4;
      v66[3] = &unk_1E2DF9A90;
      v66[6] = a4;
      v66[7] = v11;
      v66[4] = v84;
      v66[5] = &v80;
      if (v8 == a2)
      {
        v65[0] = v10;
        v65[1] = 0x40000000;
        v65[2] = __xzm_print_block_invoke_5;
        v65[3] = &unk_1E2DF9AB8;
        v65[6] = a4;
        v65[7] = v11;
        v19 = v65;
        v65[4] = v84;
        v65[5] = &v80;
      }
      else
      {
        v19 = 0;
      }
      v20 = _xzm_introspect_enumerate(a1, a3, (unint64_t)a2, v17, v18, v11, 0, (uint64_t)v67, (uint64_t)v68, (uint64_t)v66, (uint64_t)v19);
      v21 = v88[3];
      if (v21)
        mach_vm_deallocate(*MEMORY[0x1E0C883F0], v21, 4 * v92[3]);
      if (!v20)
      {
        a4("}\n");
        a4("}\n");
        a4("End xzone malloc JSON\n");
      }
      goto LABEL_33;
    }
    a4("\"bucketing_key\": \"%016llx%016llx\", \n", *(_QWORD *)(v96 + 312), *(_QWORD *)(v96 + 320));
    a4("\"guard_config\": {\n");
    a4("    \"guards_enabled\": %d, \n", *(unsigned __int8 *)(v11 + 452));
    a4("    \"data_guards_enabled\": %d, \n", *(unsigned __int8 *)(v11 + 453));
    a4("    \"tiny_run_size\": %d, \n", *(unsigned __int8 *)(v11 + 454));
    a4("    \"tiny_guard_density\": %d, \n", *(unsigned __int8 *)(v11 + 455));
    a4("    \"small_run_size\": %d, \n", *(unsigned __int8 *)(v11 + 456));
    a4("    \"small_guard_density\": %d \n", *(unsigned __int8 *)(v11 + 457));
    a4("}, \n");
    if ((*(_BYTE *)(v11 + 328) & 8) != 0)
      v12 = "true";
    else
      v12 = "false";
    a4("\"defer_large\": %s, \n", v12);
    if ((*(_BYTE *)(v11 + 328) & 4) != 0)
      v13 = "true";
    else
      v13 = "false";
    a4("\"defer_xzones\": %s, \n", v13);
    v14 = *(_QWORD *)(v11 + 464);
    if (v14)
    {
      v99[0] = 0;
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t, _QWORD *))a3)(a1, v14, 8240, v99))
        goto LABEL_33;
      v15 = v99[0];
      v98 = 0;
      if (*(_QWORD *)v99[0])
      {
        if (((unsigned int (*)(uint64_t, _QWORD, uint64_t, _QWORD **))a3)(a1, *(_QWORD *)v99[0], 16 * *(_QWORD *)(v99[0] + 8) + 32, &v98))
        {
          goto LABEL_33;
        }
        v63 = v8;
        v16 = v98;
      }
      else
      {
        v63 = v8;
        v16 = 0;
      }
      a4("\"reclaim_buffer\": { \n");
      a4("    \"va_in_buffer\": %llu, \n", *(_QWORD *)(v15 + 16));
      a4("    \"last_accounting_given_to_kernel\": %llu, \n", *(_QWORD *)(v15 + 24));
      a4("    \"buffer\": \"%p\", \n", *(const void **)v15);
      a4("    \"buffer_len\": %llu, \n", *(_QWORD *)(v15 + 8));
      if (*(_QWORD *)v15 && *(_QWORD *)(v15 + 8))
      {
        a4("    \"indices\": { \n");
        a4("        \"head\": %llu, \n", *v16);
        a4("        \"busy\": %llu, \n", v16[2]);
        a4("        \"tail\": %llu \n", v16[1]);
        a4("    }, \n");
        a4("    \"entries\": [ \n");
        if (*(_QWORD *)(v15 + 8))
        {
          v22 = 0;
          v23 = 0;
          do
          {
            v24 = &v16[2 * v22];
            a4("        { \n");
            a4("            \"index\": %u, \n", v23);
            a4("            \"address\": \"%p\", \n", (const void *)v24[4]);
            a4("            \"size\": %u, \n", *((_DWORD *)v24 + 10));
            a4("            \"behavior\": %u, \n", *((unsigned __int16 *)v24 + 22));
            a4("            \"flags\": \"0x%x\" \n", *((unsigned __int16 *)v24 + 23));
            a4("        }");
            if (*(_QWORD *)(v15 + 8) - 1 > v22)
              a4(",");
            a4(" \n");
            v22 = ++v23;
          }
          while (*(_QWORD *)(v15 + 8) > (unint64_t)v23);
        }
        a4("    ] \n");
      }
      a4("}, \n");
      v8 = v63;
    }
    a4("\"range_groups\": {\n");
    v25 = *(_QWORD *)(v11 + 384);
    if (v95 <= v25)
    {
      v26 = *(unsigned __int8 *)(v11 + 329);
      v27 = v25 - v95;
      if (!__CFADD__(v27, 56 * v26) && v27 + 56 * v26 <= *(_QWORD *)(v11 + 304))
      {
        v28 = (unsigned __int8 *)(v27 + v11);
        if (v27 + v11)
        {
          v62 = v95;
          v64 = v8;
          if (*(_BYTE *)(v11 + 329))
          {
            v29 = 0;
            do
            {
              a4("    ");
              if (v29)
                a4(", ");
              a4("\"%d\": {\n", *v28);
              a4("        \"id\": %d, \n", *v28);
              a4("        \"lock\": %u, \n", *((_DWORD *)v28 + 4));
              a4("        \"base\": \"%p\", \n", *((const void **)v28 + 3));
              a4("        \"size\": %zu, \n", *((_QWORD *)v28 + 4));
              a4("        \"next\": \"%p\", \n", *((const void **)v28 + 5));
              a4("        \"remaining\": %zu\n", *((_QWORD *)v28 + 6));
              a4("    }\n");
              ++v29;
              v28 += 56;
            }
            while (v29 < *(unsigned __int8 *)(v11 + 329));
          }
          a4("}, \n");
          a4("\"segment_groups\": {\n");
          v30 = *(_QWORD *)(v11 + 392);
          if (v62 <= v30)
          {
            v31 = *(unsigned __int8 *)(v11 + 344);
            v32 = v30 - v62;
            if (!__CFADD__(v32, 496 * v31) && v32 + 496 * v31 <= *(_QWORD *)(v11 + 304))
            {
              v33 = v32 + v11;
              if (v32 + v11)
              {
                if (*(_BYTE *)(v11 + 344))
                {
                  v34 = 0;
                  while (1)
                  {
                    a4("    ");
                    if (v34)
                      a4(", ");
                    a4("\"%d\": {\n", *(unsigned __int8 *)(v33 + 496 * v34));
                    v35 = *(char *)(v33 + 496 * v34);
                    v36 = "unknown";
                    if (v35 <= 3)
                      v36 = off_1E2DF9BB0[v35];
                    a4("        \"id\": \"%s\", \n", v36);
                    a4("        \"segment_cache\": { \n");
                    v37 = v33 + 496 * v34;
                    a4("            \"max_count\": %u, \n", *(unsigned __int16 *)(v37 + 480));
                    a4("            \"count\": %u, \n", *(unsigned __int16 *)(v37 + 482));
                    a4("            \"max_entry_slices\": %u, \n", *(_DWORD *)(v37 + 484));
                    a4("            \"segments\": { \n");
                    if (*(_WORD *)(v37 + 482))
                    {
                      v38 = *(const void **)(v33 + 496 * v34 + 464);
                      if (v38)
                        break;
                    }
LABEL_58:
                    a4("            } \n");
                    a4("        } \n");
                    a4("    }\n");
                    if (++v34 >= (unint64_t)*(unsigned __int8 *)(v11 + 344))
                      goto LABEL_59;
                  }
                  while (1)
                  {
                    v99[0] = 0;
                    if (((unsigned int (*)(uint64_t, const void *, uint64_t, _QWORD *))a3)(a1, v38, 14392, v99)|| v69((uint64_t)v68, v38, v99[0], "                    "))
                    {
                      goto LABEL_33;
                    }
                    v38 = *(const void **)(v99[0] + 24);
                    if (!v38)
                      goto LABEL_58;
                  }
                }
LABEL_59:
                a4("}, \n");
                a4("\"xzones\": {\n");
                v39 = *(_QWORD *)(v11 + 216);
                if (v62 <= v39)
                {
                  v40 = 88 * *(unsigned __int8 *)(v11 + 210);
                  v41 = v39 - v62;
                  v42 = __CFADD__(v39 - v62, v40);
                  v43 = v39 - v62 + v40;
                  if (!v42)
                  {
                    v44 = *(_QWORD *)(v11 + 304);
                    if (v43 <= v44)
                    {
                      v59 = v41 + v11;
                      if (v41 + v11)
                      {
                        v45 = *(_QWORD *)(v11 + 224);
                        if (v62 <= v45)
                        {
                          v46 = *(unsigned __int8 *)(v11 + 210) * (unint64_t)*(unsigned __int8 *)(v11 + 211);
                          v47 = v45 - v62;
                          v42 = __CFADD__(v45 - v62, 32 * v46);
                          v48 = v45 - v62 + 32 * v46;
                          if (!v42 && v48 <= v44)
                          {
                            v61 = v47 + v11;
                            if (v47 + v11)
                            {
                              v17 = v97;
                              if (*(unsigned __int8 *)(v97 + 210) >= 2u)
                              {
                                v49 = 1;
                                do
                                {
                                  a4("    \"%d\": {\n", v49);
                                  v50 = v59 + 88 * v49;
                                  a4("        \"id\": %d, \n", *(unsigned __int8 *)(v50 + 72));
                                  a4("        \"bucket\": %d, \n", *(unsigned __int8 *)(v50 + 76));
                                  a4("        \"segment_group\": %zu, \n", 0xEF7BDEF7BDEF7BDFLL* ((uint64_t)(*(_QWORD *)(v50 + 40) - *(_QWORD *)(v11 + 392)) >> 4));
                                  v51 = *(_QWORD *)(v50 + 48);
                                  v50 += 48;
                                  a4("        \"block_size\": %llu, \n", v51);
                                  a4("        \"chunk_capacity\": %u, \n", *(_DWORD *)(v50 + 20));
                                  a4("        \"sequestered\": %d,\n", *(_BYTE *)(v50 + 30) & 1);
                                  v60 = (_QWORD *)v50;
                                  v52 = *(char *)(v50 + 29);
                                  v53 = "UNKNOWN";
                                  if (v52 <= 2)
                                    v53 = off_1E2DF9B98[v52];
                                  a4("        \"slot_config\": \"%s\",\n", v53);
                                  a4("        \"allocation_slots\": [\n");
                                  if (*(_BYTE *)(v17 + 211))
                                  {
                                    v54 = 0;
                                    do
                                    {
                                      v55 = v49;
                                      v56 = v49 + v54 * *(unsigned __int8 *)(v17 + 210);
                                      v57 = v61 + 32 * v56;
                                      a4("            {\n");
                                      if (*v60 > 0x1000uLL)
                                      {
                                        a4("                \"chunk\": \"%p\",\n", *(const void **)v57);
                                        a4("                \"allocations\": %lu,\n", *(unsigned int *)(v57 + 16));
                                        v58 = "                \"contentions\": %lu,\n";
                                      }
                                      else
                                      {
                                        a4("                \"atomic_value\": \"0x%llx\",\n", *(_QWORD *)v57);
                                        a4("                \"xsg_locked\": \"0x%llx\",\n", *(_DWORD *)v57 & 1);
                                        a4("                \"xsg_waiters\": \"0x%llx\",\n", (*(_DWORD *)v57 >> 1) & 1);
                                        a4("                \"xsc_ptr\": \"0x%llx\",\n", (*(_QWORD *)v57 >> 2) & 0x7FFFFFFFFFFFLL);
                                        a4("                \"allocations\": %lu,\n", *(unsigned int *)(v57 + 16));
                                        a4("                \"contentions\": %lu,\n", *(_DWORD *)(v57 + 20) & 0xFFFFFF);
                                        v58 = "                \"slot_config\": \"%s\",\n";
                                      }
                                      a4(v58);
                                      v49 = v55;
                                      a4("                \"last_chunk_empty_ts\": %llu\n", *(_QWORD *)(v61 + 32 * v56 + 24));
                                      a4("            }");
                                      if (*(unsigned __int8 *)(v17 + 211) - 1 > v54)
                                        a4(",");
                                      a4("\n");
                                      ++v54;
                                    }
                                    while (v54 < *(unsigned __int8 *)(v17 + 211));
                                  }
                                  a4("        ]\n");
                                  a4("    }");
                                  if (*(unsigned __int8 *)(v17 + 210) - 1 > (int)v49)
                                    a4(",");
                                  a4("\n");
                                  ++v49;
                                }
                                while (v49 < *(unsigned __int8 *)(v17 + 210));
                              }
                              a4("}, \n");
                              v18 = v62;
                              v8 = v64;
                              v10 = MEMORY[0x1E0C87450];
                              goto LABEL_15;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_33:
    _Block_object_dispose(&v76, 8);
    _Block_object_dispose(&v80, 8);
    _Block_object_dispose(v86, 8);
    _Block_object_dispose(&v87, 8);
    _Block_object_dispose(&v91, 8);
  }
}

uint64_t __xzm_print_block_invoke(uint64_t a1, mach_vm_offset_t address, unint64_t a3, const char *a4)
{
  uint64_t result;
  uint64_t v9;
  mach_vm_offset_t v10;
  unint64_t *v11;
  unint64_t v12;
  mach_vm_size_t v13;
  unint64_t v14;
  mach_vm_size_t v15;
  uint64_t v16;
  mach_vm_size_t v17;
  mach_vm_address_t v18;
  vm_map_t *v19;
  mach_vm_size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  mach_vm_offset_t v24;
  int v25;
  unint64_t v26;
  const char *v27;
  const char *v28;
  mach_vm_size_t dispositions_count;

  result = *(unsigned int *)(a1 + 64);
  if (!(_DWORD)result)
    return result;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(_QWORD *)(v9 + 24);
  v11 = (unint64_t *)MEMORY[0x1E0C88820];
  v12 = *MEMORY[0x1E0C88820];
  if (v10 > address || v10 + v12 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < a3 + address)
  {
    *(_QWORD *)(v9 + 24) = address;
    v13 = a3 / v12;
    if (a3 % v12)
      ++v13;
    v14 = 0x400000 / v12;
    if (v13 <= v14)
      v15 = v14;
    else
      v15 = v13;
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(_QWORD *)(v16 + 24);
    if (v15 > v17)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v19 = (vm_map_t *)MEMORY[0x1E0C883F0];
      if (v18)
      {
        mach_vm_deallocate(*MEMORY[0x1E0C883F0], v18, 4 * v17);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      }
      *(_QWORD *)(v16 + 24) = v15;
      result = mach_vm_allocate(*v19, (mach_vm_address_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 4 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 1);
      if ((_DWORD)result)
        return result;
      LODWORD(result) = *(_DWORD *)(a1 + 64);
    }
    dispositions_count = v15;
    if (a3 <= 0x400000)
      v20 = 0x400000;
    else
      v20 = a3;
    result = mach_vm_page_range_query(result, address, v20, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), &dispositions_count);
    if ((_DWORD)result)
      return result;
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"dispositions\": \"", a4);
  v28 = a4;
  if (*v11 > a3)
  {
    v23 = 0;
    v22 = 0;
LABEL_29:
    (*(void (**)(const char *))(a1 + 56))("\", \n");
    (*(void (**)(const char *, ...))(a1 + 56))("%s    \"dirty_count\": %zu, \n", v28, v23);
    (*(void (**)(const char *, ...))(a1 + 56))("%s    \"swapped_count\": %zu, \n", v28, v22);
    return 0;
  }
  else
  {
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = (address - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) / *v11;
    while (v24 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v25 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 4 * v24);
      if ((v25 & 8) != 0)
      {
        ++v23;
        v27 = "d";
      }
      else
      {
        v26 = v25 & 0x10;
        if ((_DWORD)v26)
          v27 = "s";
        else
          v27 = "c";
        v22 += v26 >> 4;
      }
      (*(void (**)(const char *))(a1 + 56))(v27);
      ++v24;
      if (++v21 >= a3 / *v11)
        goto LABEL_29;
    }
    return 5;
  }
}

uint64_t __xzm_print_block_invoke_2(uint64_t a1, const void *a2, uint64_t a3, const char *a4)
{
  unint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    (*(void (**)(const char *))(a1 + 56))(", ");
  (*(void (**)(const char *, ...))(a1 + 56))("%s\"%p\": {\n", a4, a2);
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"addr\": \"%p\", \n", a4, a2);
  v8 = 0xEF7BDEF7BDEF7BDFLL * ((uint64_t)(*(_QWORD *)a3 - *(_QWORD *)(*(_QWORD *)(a1 + 64) + 392)) >> 4);
  v9 = "unknown";
  if ((v8 & 0xFC) == 0)
    v9 = off_1E2DF9BB0[(char)v8];
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"segment_group\": \"%s\", \n", a4, v9);
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"body_addr\": \"%p\", \n", a4, *(const void **)(a3 + 48));
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"used\": %u, \n", a4, *(_DWORD *)(a3 + 8));
  v10 = "huge_segment";
  if (*(_BYTE *)(a3 + 20) != 1)
    v10 = "unknown";
  if (*(_BYTE *)(a3 + 20))
    v11 = v10;
  else
    v11 = "normal_segment";
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"kind\": \"%s\", \n", a4, v11);
  if (*(_QWORD *)(a3 + 40) == -1)
    v12 = "%s    \"reclaim_id\": -1, \n";
  else
    v12 = "%s    \"reclaim_id\": %llu, \n";
  (*(void (**)(const char *))(a1 + 56))(v12);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a3 + 48));
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"slice_count\": %u, \n", a4, *(_DWORD *)(a3 + 12));
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"slice_entry_count\": %u \n", a4, *(_DWORD *)(a3 + 16));
  (*(void (**)(const char *, ...))(a1 + 56))("%s}\n", a4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return 0;
}

uint64_t __xzm_print_block_invoke_3(uint64_t a1, const void *a2, int a3, unsigned int a4)
{
  const char *v8;

  (*(void (**)(const char *))(a1 + 48))("    ");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    (*(void (**)(const char *))(a1 + 48))(", ");
  (*(void (**)(const char *, ...))(a1 + 48))("\"%p\": {\n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"addr\": \"%p\", \n", a2);
  if (a4 > 3)
    v8 = "unknown slab";
  else
    v8 = off_1E2DF9BD0[(char)a4];
  (*(void (**)(const char *, ...))(a1 + 48))("        \"kind\": \"%s\", \n", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(const char *, ...))(a1 + 48))("        \"size\": %u \n", a3);
  (*(void (**)(const char *))(a1 + 48))("    }\n");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return 0;
}

uint64_t __xzm_print_block_invoke_4(uint64_t a1, _BYTE *a2, _QWORD *a3, uint64_t a4, int a5, const void *a6, uint64_t a7)
{
  uint64_t v14;
  const char *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  (*(void (**)(const char *))(a1 + 48))("    ");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    (*(void (**)(const char *))(a1 + 48))(", ");
  (*(void (**)(const char *, ...))(a1 + 48))("\"%p\": {\n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"addr\": \"%p\", \n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"metadata_addr\": \"%p\", \n", (const void *)(a2 - (_BYTE *)a3 + a4));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"mzone\": %d, \n", *(unsigned __int16 *)(a4 + 34));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"xzone\": %d, \n", *(unsigned __int8 *)(a4 + 33));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment\": \"%p\", \n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment_group\": %zu, \n", 0xEF7BDEF7BDEF7BDFLL * ((uint64_t)(*a3 - *(_QWORD *)(*(_QWORD *)(a1 + 56) + 392)) >> 4));
  v14 = *(_BYTE *)(a4 + 32) & 0xF;
  if (v14 > 8)
    v15 = "unknown";
  else
    v15 = off_1E2DF9BF0[v14];
  (*(void (**)(const char *, ...))(a1 + 48))("        \"kind\": \"%s\", \n", v15);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"slice_count\": %u, \n", a5);
  if (a7)
    v16 = *(_DWORD *)(a7 + 48);
  else
    v16 = 0;
  (*(void (**)(const char *, ...))(a1 + 48))("        \"block_size\": %u, \n", v16);
  (*(void (**)(const char *))(a1 + 48))("        \"in_use\": 1, \n");
  if (a3[-1431655765 * ((unint64_t)(a4 - (_QWORD)a3 - 2104) >> 4) + 7] == -1)
    v17 = "        \"reclaim_id\": -1, \n";
  else
    v17 = "        \"reclaim_id\": %llu, \n";
  (*(void (**)(const char *))(a1 + 48))(v17);
  v18 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  if (!(_DWORD)v18)
  {
    if ((_DWORD)v14 == 5 || (_DWORD)v14 == 2)
      (*(void (**)(const char *, ...))(a1 + 48))("        \"bucket\": %u,\n", *(unsigned __int8 *)(a7 + 76));
    if ((_DWORD)v14 == 5)
    {
      (*(void (**)(const char *, ...))(a1 + 48))("        \"free\": \"0x%x\",\n", *(_DWORD *)a4);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"used\": %u,\n", *(_DWORD *)(a4 + 4));
      (*(void (**)(const char *))(a1 + 48))("        \"alloc_idx\": %u,\n");
    }
    else if ((_DWORD)v14 == 2)
    {
      (*(void (**)(const char *, ...))(a1 + 48))("        \"meta\": \"0x%llx\",\n", *(_QWORD *)a4);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_alloc_head\": \"0x%llx\",\n", *(_DWORD *)a4 & 0x7FF);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_free_count\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 11) & 0x7FF);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_alloc_idx\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 22) & 0x3F);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_on_partial_list\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 28) & 1);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_on_empty_list\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 29) & 1);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_walk_locked\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 30) & 1);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_head_seqno\": \"0x%llx\",\n", (*(_QWORD *)a4 >> 38) & 0x1FFFLL);
      (*(void (**)(const char *))(a1 + 48))("        \"xca_seqno\": \"0x%llx\",\n");
    }
    (*(void (**)(const char *, ...))(a1 + 48))("        \"is_preallocated\": %d,\n", (*(unsigned __int8 *)(a4 + 32) >> 6) & 1);
    (*(void (**)(const char *, ...))(a1 + 48))("        \"is_pristine\": %d\n", (*(unsigned __int8 *)(a4 + 32) >> 4) & 1);
    (*(void (**)(const char *))(a1 + 48))("    }\n");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return v18;
}

uint64_t __xzm_print_block_invoke_5(uint64_t a1, _BYTE *a2, _QWORD *a3, uint64_t a4, int a5, const void *a6)
{
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;

  (*(void (**)(const char *))(a1 + 48))("    ");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    (*(void (**)(const char *))(a1 + 48))(", ");
  (*(void (**)(const char *, ...))(a1 + 48))("\"%p\": {\n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"addr\": \"%p\", \n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"metadata_addr\": \"%p\", \n", (const void *)(a2 - (_BYTE *)a3 + a4));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"mzone\": %d, \n", *(unsigned __int16 *)(a4 + 34));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"xzone\": %d, \n", *(unsigned __int8 *)(a4 + 33));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment\": \"%p\", \n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment_group\": %zu, \n", 0xEF7BDEF7BDEF7BDFLL * ((uint64_t)(*a3 - *(_QWORD *)(*(_QWORD *)(a1 + 56) + 392)) >> 4));
  v12 = *(_BYTE *)(a4 + 32) & 0xF;
  if (v12 > 8)
    v13 = "unknown";
  else
    v13 = off_1E2DF9BF0[v12];
  (*(void (**)(const char *, ...))(a1 + 48))("        \"kind\": \"%s\", \n", v13);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"slice_count\": %u, \n", a5);
  if (a3[-1431655765 * ((unint64_t)(a4 - (_QWORD)a3 - 2104) >> 4) + 7] == -1)
    v14 = "        \"reclaim_id\": -1, \n";
  else
    v14 = "        \"reclaim_id\": %llu, \n";
  (*(void (**)(const char *))(a1 + 48))(v14);
  v15 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  if (!(_DWORD)v15)
  {
    (*(void (**)(const char *, ...))(a1 + 48))("        \"is_preallocated\": %d,\n", (*(unsigned __int8 *)(a4 + 32) >> 6) & 1);
    (*(void (**)(const char *))(a1 + 48))("        \"in_use\": 0 \n");
    (*(void (**)(const char *))(a1 + 48))("    }\n");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return v15;
}

uint64_t main_image_has_section()
{
  const mach_header *image_header;
  const mach_header *v1;
  int v2;
  int32_t *p_cputype;
  unsigned int v4;
  _DWORD *v5;

  image_header = _dyld_get_image_header(0);
  if (!image_header->ncmds)
    return 0;
  v1 = image_header;
  v2 = 0;
  p_cputype = &image_header[1].cputype;
  while (*p_cputype != 25 || _platform_strncmp() && v1->filetype != 1 || !p_cputype[16])
  {
LABEL_11:
    p_cputype = (int32_t *)((char *)p_cputype + p_cputype[1]);
    if (++v2 >= v1->ncmds)
      return 0;
  }
  v4 = 0;
  v5 = p_cputype + 22;
  while (_platform_strncmp() || _platform_strncmp())
  {
    ++v4;
    v5 += 20;
    if (v4 >= p_cputype[16])
      goto LABEL_11;
  }
  return 1;
}

uint64_t pgm_thread_set_disabled(uint64_t result)
{
  unint64_t StatusReg;
  uint64_t v2;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v2 = 0xFFFFFFFFLL;
  if (!(_DWORD)result)
    v2 = 0;
  *(_QWORD *)(StatusReg + 880) = v2;
  return result;
}

uint64_t pgm_create_zone(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  unint64_t v7;
  uint32_t v8;
  int v9;
  int v10;
  char *v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (*(_DWORD *)(a1 + 104) <= 0xCu)
    nanov2_realloc_VARIANT_mp_cold_1(a1);
  my_vm_map_common(0, 16720, 3, 1, 1);
  MEMORY[0x20] = xmmword_1E2DF95F0;
  MEMORY[0x30] = *(_OWORD *)&off_1E2DF9600;
  MEMORY[0x60] = xmmword_1E2DF9630;
  MEMORY[0x70] = *(_OWORD *)&off_1E2DF9640;
  MEMORY[0x40] = xmmword_1E2DF9610;
  MEMORY[0x50] = *(_OWORD *)&off_1E2DF9620;
  MEMORY[0xA0] = xmmword_1E2DF9670;
  MEMORY[0xB0] = unk_1E2DF9680;
  MEMORY[0x80] = xmmword_1E2DF9650;
  MEMORY[0x90] = unk_1E2DF9660;
  MEMORY[0] = malloc_zone_template_0;
  MEMORY[0x10] = *(_OWORD *)&off_1E2DF95E0;
  MEMORY[0xC0] = 0;
  MEMORY[0xC8] = a1;
  if (!*(_QWORD *)(a1 + 112))
    MEMORY[0x70] = 0;
  if (!*(_QWORD *)(a1 + 120))
    MEMORY[0x78] = 0;
  if (!*(_QWORD *)(a1 + 136))
    MEMORY[0x88] = 0;
  v1 = env_uint_0("MallocProbGuardMemoryBudgetInKB", 2048);
  v2 = (unint64_t)v1 << 10;
  v3 = (_QWORD *)MEMORY[0x1E0C88820];
  v4 = (*MEMORY[0x1E0C88820] + 16719) & -*MEMORY[0x1E0C88820];
  v5 = v2 >= v4;
  v6 = v2 - v4;
  if (!v5
    || (v7 = v6 / (unint64_t)((double)(unint64_t)*MEMORY[0x1E0C88820] + 1600.0 + 80.0 + 768.0), !(_DWORD)v7))
  {
    pgm_create_zone_cold_2(v1);
  }
  MEMORY[0xD4] = env_uint_0("MallocProbGuardAllocations", v7);
  MEMORY[0xD0] = env_uint_0("MallocProbGuardSlots", (10 * MEMORY[0xD4]));
  MEMORY[0xD8] = env_uint_0("MallocProbGuardMetadata", (3 * MEMORY[0xD4]));
  v8 = arc4random_uniform(0x1194u);
  v9 = env_uint_0("MallocProbGuardSampleRate", v8 + 500);
  v10 = 2 * v9;
  if (v9 == 1)
    v10 = 1;
  MEMORY[0xDC] = v10;
  v11 = getenv("MallocProbGuardDebug");
  if (v11)
    v12 = *v11 == 49;
  else
    v12 = 0;
  MEMORY[0xE0] = v12;
  v13 = env_uint_0("MallocProbGuardDebugLogThrottleInMillis", 1000);
  MEMORY[0xE8] = v13;
  if (MEMORY[0xE0])
    malloc_report(6u, (uint64_t)"ProbGuard configuration: %u kB budget, 1/%u sample rate, %u/%u/%u allocations/metadata/slots\n");
  if (!MEMORY[0xD4] || MEMORY[0xD4] > MEMORY[0xD8] >> 1 || MEMORY[0xD8] > MEMORY[0xD0] || !MEMORY[0xDC])
    pgm_create_zone_cold_3(v13);
  MEMORY[0xF0] = *v3 * ((2 * MEMORY[0xD0]) | 1u);
  MEMORY[0x108] = MEMORY[0xF0] + 0x4000000;
  my_vm_map_common(0, MEMORY[0xF0] + 0x4000000, 0, 1, 1);
  MEMORY[0x110] = 0;
  MEMORY[0xF8] = 0x2000000;
  MEMORY[0x100] = MEMORY[0xF0] + 0x2000000;
  my_vm_map_common(0x2000000, MEMORY[0xF0], 0, 0x4000, 13);
  MEMORY[0x118] = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(MEMORY[0xC8] + 32))(MEMORY[0xC8], MEMORY[0xD0], 8, v14, v15);
  v18 = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(MEMORY[0xC8] + 32))(MEMORY[0xC8], MEMORY[0xD8], 256, v16, v17);
  MEMORY[0x120] = v18;
  if (!MEMORY[0x118] || !v18)
    nanov2_realloc_VARIANT_mp_cold_1(v18);
  MEMORY[0x4128] = 0;
  my_vm_protect(0, 0x4000, 1);
  return 0;
}

uint64_t pgm_extract_report_from_corpse()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t (*v2)(void);
  unsigned int v3;
  unsigned int v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int zone_type;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t zone;
  unint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  const char *v24;
  const char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  _OWORD v32[13];
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
  uint64_t v52;

  v0 = MEMORY[0x1E0C86820]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v52 = *MEMORY[0x1E0C874D8];
  v12 = os_unfair_lock_lock_with_options();
  if (!v2)
    nanov2_realloc_VARIANT_mp_cold_1(v12);
  g_crm_reader_0 = v2;
  num_read_memory_0 = 0;
  if (!v4)
  {
LABEL_19:
    v17 = 5;
    goto LABEL_20;
  }
  v13 = v4;
  while (1)
  {
    v14 = *v6;
    LODWORD(v32[0]) = 0;
    zone_type = get_zone_type(v8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _DWORD **))memory_reader_adapter_0, v14, v32);
    if (LODWORD(v32[0]) == 2)
      v16 = 0;
    else
      v16 = 257;
    if (zone_type)
      v17 = zone_type;
    else
      v17 = v16;
    free_read_memory();
    if ((_DWORD)v17 == 257)
      goto LABEL_18;
    if ((_DWORD)v17)
      goto LABEL_20;
    v18 = *v6;
    v50 = 0u;
    v51 = 0u;
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
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
    memset(v32, 0, sizeof(v32));
    zone = read_zone(v8, v18, (uint64_t (*)(task_name_t, uint64_t, uint64_t, const void **))memory_reader_adapter_0, (uint64_t)v32, 6);
    if ((_DWORD)zone)
    {
      v17 = zone;
      free_read_memory();
      if ((_DWORD)v17 != 257)
        goto LABEL_20;
      goto LABEL_18;
    }
    if (*((_QWORD *)&v35 + 1) <= v11 && (unint64_t)v36 > v11)
      break;
    free_read_memory();
LABEL_18:
    ++v6;
    if (!--v13)
      goto LABEL_19;
  }
  v21 = lookup_slot((uint64_t)v32, v11);
  if (v33 <= v21)
    nanov2_realloc_VARIANT_mp_cold_1(v21);
  v22 = *((_QWORD *)&v37 + 1);
  v23 = (_DWORD *)(*((_QWORD *)&v37 + 1) + 8 * v21);
  if (DWORD2(v33) <= *v23 >> 2)
    nanov2_realloc_VARIANT_mp_cold_1(v21);
  if ((*v23 & 3) == 0)
  {
    v24 = "low";
    v25 = "long-range OOB";
    goto LABEL_32;
  }
  if ((*v23 & 3) == 2)
  {
    if ((v21 & 0x7FFFFFFE00000000) != 0)
    {
      if ((HIDWORD(v21) & 0x7FFFFFFE) != 2)
        nanov2_realloc_VARIANT_mp_cold_1(v21);
      v24 = "low";
      v25 = "OOB + UAF";
    }
    else
    {
      v24 = "high";
      v25 = "use-after-free";
    }
LABEL_32:
    v17 = 0;
    *(_QWORD *)v10 = v25;
    *(_QWORD *)(v10 + 8) = v24;
    *(_QWORD *)(v10 + 16) = v11;
    v26 = (unint64_t)*v23 >> 2;
    v27 = v38;
    v28 = v22 + 8 * v21;
    *(_QWORD *)(v10 + 24) = *((_QWORD *)&v35 + 1)
                          + *MEMORY[0x1E0C88820] * ((2 * v21) | 1)
                          + *(unsigned __int16 *)(v28 + 6);
    *(_QWORD *)(v10 + 32) = *(unsigned __int16 *)(v28 + 4);
    *(_QWORD *)(v10 + 40) = slot_state_labels[*v23 & 3];
    *(_DWORD *)(v10 + 48) = 0;
    if (*(_DWORD *)(v27 + (v26 << 8)) == (_DWORD)v21)
    {
      *(_DWORD *)(v10 + 48) = 1;
      v29 = v27 + (v26 << 8);
      v30 = *(unsigned __int16 *)(v29 + 20);
      *(_OWORD *)(v10 + 56) = *(_OWORD *)(v29 + 4);
      *(_DWORD *)(v10 + 72) = trace_decode(v29 + 40, v30, v10 + 80, 64);
      if ((*v23 & 3) == 2)
      {
        ++*(_DWORD *)(v10 + 48);
        v31 = v29 + *(unsigned __int16 *)(v29 + 20) + 40;
        *(_OWORD *)(v10 + 592) = *(_OWORD *)(v29 + 22);
        v17 = 0;
        *(_DWORD *)(v10 + 608) = trace_decode(v31, *(unsigned __int16 *)(v29 + 38), v10 + 616, 64);
      }
      else
      {
        v17 = 0;
      }
    }
  }
  else
  {
    if ((HIDWORD(v21) & 0x7FFFFFFF) == 3)
    {
      v24 = "high";
      v25 = "out-of-bounds";
      goto LABEL_32;
    }
    malloc_report(0x223u, (uint64_t)"Failed to generate PGM report for fault address %p: slot is unexpectedly allocated with bounds %d\n");
    v17 = 5;
  }
  free_read_memory();
LABEL_20:
  os_unfair_lock_unlock(&crash_reporter_lock_0);
  return v17;
}

uint64_t pgm_valloc(uint64_t a1, unint64_t a2)
{
  unint64_t *v4;
  unint64_t StatusReg;
  int v7;
  uint64_t v8;
  uint32_t v9;
  uint64_t v11;

  v4 = (unint64_t *)MEMORY[0x1E0C88820];
  if (*MEMORY[0x1E0C88820] < a2 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 40))();
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v7 = *(_DWORD *)(StatusReg + 880);
  if (v7 == -1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 40))();
  if (v7)
  {
    v9 = v7 - 1;
  }
  else
  {
    v8 = *(unsigned int *)(a1 + 220);
    if (!(_DWORD)v8)
      nanov2_realloc_VARIANT_mp_cold_1(v8);
    v9 = arc4random_uniform(v8);
  }
  *(_QWORD *)(StatusReg + 880) = v9;
  if (v9)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 40))();
  os_unfair_lock_lock_with_options();
  v11 = allocate(a1, a2, *v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  if (!v11)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 40))();
  else
    return v11;
}

uint64_t pgm_destroy(mach_vm_address_t a1)
{
  malloc_destroy_zone(*(malloc_zone_t **)(a1 + 200));
  my_vm_deallocate(*(_QWORD *)(a1 + 272), *(_QWORD *)(a1 + 264));
  return my_vm_deallocate(a1, 16720);
}

uint64_t pgm_claimed_address(_QWORD *a1, unint64_t a2)
{
  if (a1[31] <= a2 && a1[32] > a2)
    return 1;
  else
    return (*(uint64_t (**)(void))(a1[25] + 136))();
}

uint64_t pgm_malloc_with_options(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  unint64_t StatusReg;
  int v10;
  uint64_t v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v16;
  void *v17;
  unint64_t v18;

  if (*MEMORY[0x1E0C88820] >= a3 && *(_DWORD *)(a1 + 16684) != *(_DWORD *)(a1 + 212))
  {
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v10 = *(_DWORD *)(StatusReg + 880);
    if (v10 != -1)
    {
      if (v10)
      {
        v12 = v10 - 1;
      }
      else
      {
        v11 = *(unsigned int *)(a1 + 220);
        if (!(_DWORD)v11)
          nanov2_realloc_VARIANT_mp_cold_1(v11);
        v12 = arc4random_uniform(v11);
      }
      *(_QWORD *)(StatusReg + 880) = v12;
      if (!v12)
      {
        if (a2 <= 0x10)
          v18 = 16;
        else
          v18 = a2;
        os_unfair_lock_lock_with_options();
        v17 = (void *)allocate(a1, a3, v18);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
        if ((a4 & 1) != 0 && v17)
        {
LABEL_17:
          bzero(v17, a3);
          return (uint64_t)v17;
        }
        if (v17)
          return (uint64_t)v17;
      }
    }
  }
  v13 = *(_QWORD *)(a1 + 200);
  if (*(_DWORD *)(v13 + 104) >= 0xFu)
  {
    v14 = *(uint64_t (**)(void))(v13 + 152);
    if (v14)
      return v14();
  }
  if (a2)
  {
    v16 = (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(v13 + 112))(v13, a2, a3);
    v17 = (void *)v16;
    if ((a4 & 1) == 0 || !v16)
      return (uint64_t)v17;
    goto LABEL_17;
  }
  if ((a4 & 1) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v13 + 32))(v13, 1, a3);
  else
    return (*(uint64_t (**)(uint64_t, unint64_t))(v13 + 24))(v13, a3);
}

BOOL pgm_check(uint64_t a1)
{
  _BOOL8 result;

  result = check_zone(a1);
  if (result)
  {
    result = check_slots(a1);
    if (result)
      return check_metadata(a1);
  }
  return result;
}

BOOL check_zone(uint64_t a1)
{
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;

  v1 = *(_DWORD *)(a1 + 212);
  if (!v1)
    return 0;
  v2 = *(_DWORD *)(a1 + 216);
  if (v1 > v2 >> 1)
    return 0;
  v3 = *(_DWORD *)(a1 + 208);
  if (v2 > v3)
    return 0;
  v4 = *(unsigned int *)(a1 + 220);
  if ((_DWORD)v4)
  {
    v5 = *(_QWORD *)(a1 + 240);
    v6 = *MEMORY[0x1E0C88820];
    if (v5 != *MEMORY[0x1E0C88820] * ((2 * v3) | 1))
      return 0;
    v7 = *(_QWORD *)(a1 + 248);
    if (v7 % v6)
      return 0;
    v4 = v5 % v6;
    if (v4)
      return 0;
    v9 = *(_QWORD *)(a1 + 256);
    if (v7 + v5 == v9 && v7 < v9)
    {
      if (*(_QWORD *)(a1 + 264) != v5 + 0x4000000)
        return 0;
      v4 = 0;
      v10 = *(_QWORD *)(a1 + 272);
      if (v10 != v7 - 0x2000000 || v10 >= v7)
        return v4;
      v11 = *(_DWORD *)(a1 + 16684);
      if (v11 > v1)
        return 0;
      v4 = 0;
      v12 = *(_DWORD *)(a1 + 16688);
      if (v11 > v12 || v12 > v2)
        return v4;
      if (*(_DWORD *)(a1 + 16692) >= v3)
        return 0;
      v4 = *(_QWORD *)(a1 + 280);
      if (v4)
      {
        v4 = *(_QWORD *)(a1 + 288);
        if (v4)
          return *(_QWORD *)(a1 + 16696) <= *(_QWORD *)(a1 + 16704);
      }
    }
  }
  return v4;
}

BOOL check_slots(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  unint64_t v4;
  unsigned __int16 *i;
  unsigned int v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v1 = *(unsigned int *)(a1 + 208);
  if ((_DWORD)v1)
  {
    v2 = 0;
    v3 = 0;
    v4 = *MEMORY[0x1E0C88820];
    for (i = (unsigned __int16 *)(*(_QWORD *)(a1 + 280) + 6); ; i += 4)
    {
      v6 = *(_DWORD *)(i - 3);
      v7 = v6 & 3;
      if ((v6 & 3) != 0)
      {
        if (v7 == 3)
          return 0;
        if (*(_DWORD *)(a1 + 16688) <= v6 >> 2)
          return 0;
        v8 = *(i - 1);
        if (v4 < v8)
          return 0;
        v9 = ((_DWORD)v8 + 15) & 0x1FFF0;
        if (!*(i - 1))
          v9 = 16;
        if (v9 != v8)
          return 0;
        v10 = 0;
        v11 = *i;
        if (v4 < v11 || (v11 & 0xF) != 0 || v11 + v8 > v4)
          return v10;
        if (v7 == 1)
        {
          ++v3;
          v2 += v8;
        }
      }
      if (!--v1)
        return v3 == *(_DWORD *)(a1 + 16684) && v2 == *(_QWORD *)(a1 + 16696);
    }
  }
  v3 = 0;
  v2 = 0;
  return v3 == *(_DWORD *)(a1 + 16684) && v2 == *(_QWORD *)(a1 + 16696);
}

BOOL check_metadata(uint64_t a1)
{
  unint64_t v1;
  unsigned int *v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  unsigned int *v6;
  unint64_t v7;

  v1 = *(unsigned int *)(a1 + 16688);
  if ((_DWORD)v1)
  {
    v2 = *(unsigned int **)(a1 + 288);
    v3 = *(unsigned int *)(a1 + 208);
    v4 = *v2;
    if (v4 >= v3)
    {
      return 0;
    }
    else
    {
      v5 = 0;
      v6 = v2 + 64;
      v7 = 1;
      do
      {
        if (v7 - 1 != (unint64_t)*(unsigned int *)(*(_QWORD *)(a1 + 280) + 8 * v4) >> 2)
          break;
        if (*((unsigned __int16 *)v6 - 109) + (unint64_t)*((unsigned __int16 *)v6 - 118) >= 0xD9)
          break;
        v5 = v7 >= v1;
        if (v1 == v7)
          break;
        v4 = *v6;
        v6 += 64;
        ++v7;
      }
      while (v4 < v3);
    }
  }
  else
  {
    return 1;
  }
  return v5;
}

uint64_t my_vm_deallocate(mach_vm_address_t address, uint64_t a2)
{
  uint64_t result;

  result = mach_vm_deallocate(*MEMORY[0x1E0C883F0], address, (a2 + *MEMORY[0x1E0C88820] - 1) & -*MEMORY[0x1E0C88820]);
  if ((_DWORD)result)
    nanov2_realloc_VARIANT_mp_cold_1(result);
  return result;
}

uint64_t pgm_enumerator()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t (*v4)(task_name_t, uint64_t, uint64_t, const void **);
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t);
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t);
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD v19[13];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
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
  uint64_t v39;

  v0 = MEMORY[0x1E0C86820]();
  v39 = *MEMORY[0x1E0C874D8];
  if ((v2 & 3) != 0)
  {
    v6 = v5;
    v7 = v2;
    v8 = v1;
    v9 = v0;
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
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    memset(v19, 0, sizeof(v19));
    result = read_zone(v0, v3, v4, (uint64_t)v19, 2);
    if ((_DWORD)result)
      return result;
    v11 = v20;
    if ((_DWORD)v20)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = (uint64_t *)MEMORY[0x1E0C88820];
      do
      {
        if ((*(_DWORD *)(*((_QWORD *)&v24 + 1) + 4 * v13) & 3) == 1)
        {
          if ((v7 & 2) != 0)
          {
            v16 = *v15;
            v17 = *((_QWORD *)&v22 + 1) + *v15 * (v13 & 0xFFFFFFFE | 1);
            v18 = v16;
            result = v6(v9, v8, 2, &v17, 1);
            v11 = v20;
          }
          if ((v7 & 1) != 0)
          {
            if (v14 >= v11)
              nanov2_realloc_VARIANT_mp_cold_1(result);
            v17 = *((_QWORD *)&v22 + 1)
                + *v15 * (v13 & 0xFFFFFFFE | 1)
                + *(unsigned __int16 *)(*((_QWORD *)&v24 + 1) + v12 + 6);
            v18 = 0;
            v18 = *(unsigned __int16 *)(*((_QWORD *)&v24 + 1) + v12 + 4);
            result = v6(v9, v8, 1, &v17, 1);
            v11 = v20;
          }
        }
        ++v14;
        v13 += 2;
        v12 += 8;
      }
      while (v14 < v11);
    }
  }
  return 0;
}

void pgm_print(uint64_t a1, int a2)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  unint64_t i;

  malloc_report_simple((uint64_t)"ProbGuard zone: slots: %u, slots in use: %u, size in use: %llu, max size in use: %llu, a"
                                "llocated size: %llu\n");
  malloc_report_simple((uint64_t)"Quarantine: size: %llu, address range: [%p - %p)\n");
  malloc_report_simple((uint64_t)"Slots (#, state, offset, size, block address):\n");
  v4 = *(unsigned int *)(a1 + 208);
  if ((_DWORD)v4)
  {
    v5 = 0;
    v6 = 0;
    for (i = 0; i < v4; ++i)
    {
      if (a2 || (*(_DWORD *)(*(_QWORD *)(a1 + 280) + v5) & 3) == 1)
      {
        malloc_report_simple((uint64_t)"%4u, %9s, %4u, %4u, %p\n");
        v4 = *(unsigned int *)(a1 + 208);
      }
      v6 += 2;
      v5 += 8;
    }
  }
}

uint64_t pgm_force_lock()
{
  return os_unfair_lock_lock_with_options();
}

void pgm_force_unlock(os_unfair_lock_s *a1)
{
  os_unfair_lock_unlock(a1 + 4170);
}

__n128 pgm_statistics(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  __n128 result;

  v2 = *(unsigned int *)(a1 + 16684);
  v3 = *MEMORY[0x1E0C88820] * v2;
  *(_DWORD *)a2 = v2;
  result = *(__n128 *)(a1 + 16696);
  *(__n128 *)(a2 + 8) = result;
  *(_QWORD *)(a2 + 24) = v3;
  return result;
}

BOOL pgm_zone_locked(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v1;
  _BOOL4 v2;

  v1 = a1 + 4170;
  v2 = os_unfair_lock_trylock(a1 + 4170);
  if (v2)
    os_unfair_lock_unlock(v1);
  return !v2;
}

uint64_t pgm_reinit_lock(uint64_t result)
{
  *(_DWORD *)(result + 16680) = 0;
  return result;
}

uint64_t pgm_print_task()
{
  uint64_t v0;
  uint64_t (*v1)(const char *, ...);
  uint64_t (*v2)(const char *, ...);
  uint64_t v3;
  const void *v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t (*v7)(task_name_t, uint64_t, uint64_t, const void **);
  _OWORD v9[1045];
  uint64_t v10;

  v0 = MEMORY[0x1E0C86820]();
  v2 = v1;
  v4 = (const void *)v3;
  v6 = v5;
  v10 = *MEMORY[0x1E0C874D8];
  memset(v9, 0, 512);
  if (read_zone(v0, v3, v7, (uint64_t)v9, 2))
    return v2("Failed to read ProbGuard zone at %p\n", v4);
  else
    return print_zone((uint64_t)v9, v6 > 1, (void (*)(const char *, ...))v2);
}

double pgm_statistics_task()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(task_name_t, uint64_t, uint64_t, const void **);
  double result;
  uint64_t v6;
  _OWORD v7[1042];
  unsigned int v8;
  double v9[4];
  uint64_t v10;

  v0 = MEMORY[0x1E0C86820]();
  v2 = v1;
  v10 = *MEMORY[0x1E0C874D8];
  memset(v7, 0, 512);
  if (!read_zone(v0, v3, v4, (uint64_t)v7, 1))
  {
    v6 = *MEMORY[0x1E0C88820] * v8;
    *(_DWORD *)v2 = v8;
    result = v9[0];
    *(_OWORD *)(v2 + 8) = *(_OWORD *)v9;
    *(_QWORD *)(v2 + 24) = v6;
  }
  return result;
}

uint64_t read_zone(uint64_t task, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, const void **a4), uint64_t a4, char a5)
{
  uint64_t (*v7)(task_name_t, uint64_t, uint64_t, const void **);
  uint64_t is_self;
  uint64_t result;
  const void *v12;
  const void *v13;

  v7 = a3;
  if (!a3)
  {
    if ((_DWORD)task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self)
        nanov2_realloc_VARIANT_mp_cold_1(is_self);
    }
    v7 = (uint64_t (*)(task_name_t, uint64_t, uint64_t, const void **))_malloc_default_reader_3;
  }
  v13 = 0;
  result = v7(task, a2, 16720, &v13);
  if (!(_DWORD)result)
  {
    v12 = v13;
    if (!check_zone((uint64_t)v13))
      return 5;
    memcpy((void *)a4, v12, 0x4150uLL);
    if ((a5 & 2) != 0)
    {
      result = v7(task, *(_QWORD *)(a4 + 280), 8 * *(unsigned int *)(a4 + 208), (const void **)(a4 + 280));
      if ((_DWORD)result)
        return result;
      if (!check_slots(a4))
        return 5;
    }
    if ((a5 & 4) == 0)
      return 0;
    result = v7(task, *(_QWORD *)(a4 + 288), (unint64_t)*(unsigned int *)(a4 + 216) << 8, (const void **)(a4 + 288));
    if (!(_DWORD)result)
    {
      if (check_metadata(a4))
        return 0;
      return 5;
    }
  }
  return result;
}

uint64_t print_zone(uint64_t a1, int a2, void (*a3)(const char *, ...))
{
  _QWORD *v6;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t v12;

  v6 = (_QWORD *)MEMORY[0x1E0C88820];
  a3("ProbGuard zone: slots: %u, slots in use: %u, size in use: %llu, max size in use: %llu, allocated size: %llu\n", *(_DWORD *)(a1 + 208), *(_DWORD *)(a1 + 16684), *(_QWORD *)(a1 + 16696), *(_QWORD *)(a1 + 16704), *MEMORY[0x1E0C88820] * *(unsigned int *)(a1 + 16684));
  a3("Quarantine: size: %llu, address range: [%p - %p)\n", *(_QWORD *)(a1 + 240), *(const void **)(a1 + 248), *(const void **)(a1 + 256));
  result = ((uint64_t (*)(const char *))a3)("Slots (#, state, offset, size, block address):\n");
  v8 = *(unsigned int *)(a1 + 208);
  if ((_DWORD)v8)
  {
    v9 = 0;
    v10 = 0;
    for (i = 0; i < v8; ++i)
    {
      v12 = *(_QWORD *)(a1 + 280);
      if (a2 || (*(_DWORD *)(v12 + 4 * v10) & 3) == 1)
      {
        result = ((uint64_t (*)(const char *, ...))a3)("%4u, %9s, %4u, %4u, %p\n", i, slot_state_labels[*(_DWORD *)(v12 + 4 * v10) & 3], *(unsigned __int16 *)(v12 + v9 + 6), *(unsigned __int16 *)(v12 + v9 + 4), (const void *)(*(unsigned __int16 *)(v12 + v9 + 6)+ *v6 * (v10 & 0xFFFFFFFE | 1)+ *(_QWORD *)(a1 + 248)));
        v8 = *(unsigned int *)(a1 + 208);
      }
      v10 += 2;
      v9 += 8;
    }
  }
  return result;
}

unint64_t env_uint_0(const char *a1, uint64_t a2)
{
  char *v3;

  v3 = getenv(a1);
  if (v3)
    return strtoul(v3, 0, 0);
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> my_vm_map_common(int a1, uint64_t a2, vm_prot_t cur_protection, int a4, int a5)
{
  uint64_t v5;
  mach_vm_address_t address;

  v5 = mach_vm_map(*MEMORY[0x1E0C883F0], &address, (a2 + *MEMORY[0x1E0C88820] - 1) & -*MEMORY[0x1E0C88820], 0, a4 | (a5 << 24), 0, 0, 0, cur_protection, 3, 1u);
  if ((_DWORD)v5)
    nanov2_realloc_VARIANT_mp_cold_1(v5);
}

uint64_t memory_reader_adapter_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  if (num_read_memory_0 >= 3)
    nanov2_realloc_VARIANT_mp_cold_1();
  v5 = g_crm_reader_0();
  *a4 = v5;
  if (!v5)
    return 5;
  v6 = v5;
  result = 0;
  v8 = num_read_memory_0++;
  read_memory_0[v8] = v6;
  return result;
}

void free_read_memory()
{
  unint64_t v0;

  if (num_read_memory_0)
  {
    v0 = 0;
    do
      _free((void *)read_memory_0[v0++]);
    while (v0 < num_read_memory_0);
  }
  num_read_memory_0 = 0;
}

void OUTLINED_FUNCTION_0_1(uint64_t a1, uint64_t a2)
{
  malloc_report(3u, a2);
}

uint64_t nanov2_allocate_new_region()
{
  return 0;
}

void nanov2_destroy(mach_vm_address_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 28704) + 64))();
  nano_common_deallocate_pages(a1, ~*MEMORY[0x1E0C88810] & (unint64_t)(*MEMORY[0x1E0C88810] + 29264), *(_DWORD *)(a1 + 28676));
}

uint64_t nanov2_forked_zone(_QWORD *a1)
{
  BOOL v2;
  uint64_t (*v3)(uint64_t, unint64_t);
  uint64_t (*v4)(uint64_t);
  unint64_t (*v5)(unint64_t, unint64_t);
  uint64_t (*v6)(uint64_t, const void *, size_t);
  unint64_t (*v7)(unint64_t, uint64_t, int);
  uint64_t (*v8)();
  uint64_t (*v9)(uint64_t);
  uint64_t (*v10)(uint64_t, const void *, size_t, uint64_t);

  mprotect(a1, 0xC8uLL, 3);
  v2 = (MEMORY[0xFFFFFC020] & 0x2000000) == 0;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) != 0)
    v3 = nanov2_size_VARIANT_armv81;
  else
    v3 = nanov2_size_VARIANT_mp;
  v4 = nanov2_forked_malloc_VARIANT_armv81;
  if ((MEMORY[0xFFFFFC020] & 0x2000000) == 0)
    v4 = nanov2_forked_malloc_VARIANT_mp;
  a1[2] = v3;
  a1[3] = v4;
  a1[4] = nanov2_forked_calloc;
  a1[5] = nanov2_valloc;
  v5 = nanov2_forked_free_VARIANT_mp;
  if (!v2)
    v5 = nanov2_forked_free_VARIANT_armv81;
  v6 = nanov2_forked_realloc_VARIANT_armv81;
  if (v2)
    v6 = nanov2_forked_realloc_VARIANT_mp;
  a1[6] = v5;
  a1[7] = v6;
  a1[8] = nanov2_destroy;
  v7 = nanov2_forked_batch_free_VARIANT_armv81;
  if (v2)
    v7 = nanov2_forked_batch_free_VARIANT_mp;
  a1[10] = nanov2_forked_batch_malloc;
  a1[11] = v7;
  a1[12] = nanov2_introspect;
  v8 = nanov2_forked_free_definite_size_VARIANT_armv81;
  if (v2)
    v8 = nanov2_forked_free_definite_size_VARIANT_mp;
  a1[14] = nanov2_forked_memalign;
  a1[15] = v8;
  v9 = nanov2_forked_malloc_type_VARIANT_armv81;
  a1[17] = nanov2_forked_claimed_address;
  a1[18] = 0;
  if (v2)
    v9 = nanov2_forked_malloc_type_VARIANT_mp;
  a1[20] = v9;
  a1[21] = nanov2_forked_calloc_type;
  v10 = nanov2_forked_realloc_type_VARIANT_armv81;
  if (v2)
    v10 = nanov2_forked_realloc_type_VARIANT_mp;
  a1[22] = v10;
  a1[23] = nanov2_forked_memalign_type;
  return mprotect(a1, 0xC8uLL, 1);
}

uint64_t nanov2_forked_calloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 32))();
}

uint64_t nanov2_forked_batch_malloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 80))();
}

uint64_t nanov2_forked_memalign(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 112))();
}

uint64_t nanov2_forked_claimed_address()
{
  return 1;
}

uint64_t nanov2_forked_calloc_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 168))();
}

uint64_t nanov2_forked_memalign_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 28704) + 184))();
}

uint64_t nanov2_ptr_in_use_enumerator()
{
  task_name_t v0;
  void (*v1)(_QWORD, _QWORD, _QWORD, _QWORD);
  void (*v2)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t (*v3)(task_name_t, uint64_t, uint64_t, void **);
  uint64_t (*v4)(task_name_t, uint64_t, uint64_t, void **);
  void *v5;
  void *v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t is_self;
  uint64_t result;
  BOOL v13;
  _BOOL4 v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unsigned int v21;
  unsigned int *v22;
  unsigned int v23;
  int v24;
  BOOL v25;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unsigned int v30;
  int v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  void *v39;
  void *v40;
  unsigned int v41;
  int v42;
  int v43;
  int v44;
  unsigned int v45;
  _QWORD *v46;
  BOOL v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t (*v50)(task_name_t, uint64_t, uint64_t, void **);
  unint64_t v51;
  uint64_t v52;
  char v53;
  void (*v54)(_QWORD, _QWORD, _QWORD, _QWORD);
  _BOOL4 v55;
  task_name_t task;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  int v61;
  unint64_t v62;
  int v63;
  unsigned int v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *__src;
  char v69[8];
  _BYTE v70[16376];
  _QWORD v71[3662];

  v0 = MEMORY[0x1E0C86820]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  task = v0;
  v71[3659] = *MEMORY[0x1E0C874D8];
  if (nanov2_config_predicate != -1)
    _os_once();
  if ((v8 & 3) == 0)
    return 0;
  __src = 0;
  memset(v71, 0, 512);
  if (!v4)
  {
    if (task)
    {
      is_self = mach_task_is_self(task);
      if (!(_DWORD)is_self)
        nanov2_realloc_VARIANT_mp_cold_1(is_self);
    }
    v4 = (uint64_t (*)(task_name_t, uint64_t, uint64_t, void **))_malloc_default_reader_4;
  }
  result = v4(task, (uint64_t)v6, 29264, &__src);
  if ((_DWORD)result)
    return result;
  v13 = mach_task_is_self(task) && __src == v6;
  v14 = v13;
  v55 = v14;
  memcpy(v71, __src, 0x7250uLL);
  __src = v71;
  v15 = v71[3590];
  v16 = atomic_load(&v71[3591]);
  if (!v15)
    return 0;
  v17 = ((unsigned __int16)(LODWORD(v71[3585]) >> 6) | (unsigned __int16)(LOWORD(v71[3585]) << 6)) & 0xFFF;
  v48 = (v16 - 1) & 0xFFFFFFFFE0000000;
  v49 = v16;
  v52 = v10;
  v18 = task;
  v54 = v2;
  v53 = v8;
  v50 = v4;
  while (1)
  {
    v67 = 0;
    result = v4(v18, v15, 0x20000000, (void **)&v67);
    if ((_DWORD)result)
      break;
    v58 = v15 - v67;
    v19 = v15 + 0x20000000;
    if (v15 == v48)
      v19 = v16;
    v65 = 0;
    v66 = 0;
    v51 = v15;
    v57 = v19;
    if (v15 < v19)
    {
      v59 = v15;
      v20 = v15;
      do
      {
        v21 = 0;
        v22 = (unsigned int *)((*((_QWORD *)__src + 3586) ^ v20 & 0xFFFFFFFFFC000000) - v58);
        v60 = v20;
        do
        {
          if (v21 != v17)
          {
            v23 = *v22;
            v24 = *v22 & 0x7FF;
            v25 = (v24 - 2042) > 5 || ((1 << (*v22 + 6)) & 0x31) == 0;
            if (v25 && v24 != 0)
            {
              v27 = ((unsigned __int16)(v21 >> 6) | (unsigned __int16)((_WORD)v21 << 6)) & 0xFFF;
              v62 = v20 + (v27 << 14);
              if ((v8 & 2) != 0)
              {
                v65 = v20 + (v27 << 14);
                v66 = 0x4000;
                ((void (*)(uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t))v2)(v18, v10, 2, &v65, 1);
                v20 = v60;
              }
              if ((v8 & 1) != 0)
              {
                v28 = ptr_offset_to_size_class[(*((_DWORD *)__src + 7170) ^ (v62 >> 14) & 0xFC0) >> 6];
                v63 = 16 * v28 + 16;
                v29 = (int)slots_by_size_class[v28];
                if ((v24 - 2043) > 1)
                {
                  v61 = slots_by_size_class[v28];
                  v35 = 64 - __clz(v29);
                  if (v55)
                  {
                    v36 = *((_QWORD *)__src + 3588);
                    v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v36 + 32);
                    v38 = bitarray_size(v35);
                    v39 = (void *)v37(v36, 1, v38);
                  }
                  else
                  {
                    v39 = bitarray_create(v35);
                  }
                  v40 = v39;
                  v41 = 0;
                  if (v61 <= 1)
                    v42 = 1;
                  else
                    v42 = v61;
                  do
                    bitarray_set((uint64_t)v40, v35, v41++);
                  while (v42 != v41);
                  if (v24 == 2043)
                  {
                    v43 = 0;
                  }
                  else
                  {
                    v43 = 0;
                    do
                    {
                      if (!v24)
                        break;
                      if (v24 > v61)
                        break;
                      if (!bitarray_get((uint64_t)v40, v35, v24 - 1))
                        break;
                      bitarray_zap((uint64_t)v40, v35, v24 - 1);
                      v24 = *(unsigned __int16 *)(v62 - v58 + (v24 - 1) * v63 + 8);
                      ++v43;
                    }
                    while (v24 != 2043);
                  }
                  v64 = 0;
                  v44 = 0;
                  if (bitarray_zap_first_set((uint64_t)v40, v35, &v64))
                  {
                    v44 = 0;
                    v45 = v61 + v43 + (~(v23 >> 11) | 0xFFFFFC00);
                    v46 = v70;
                    do
                    {
                      if (v64 >= v45)
                        break;
                      *(v46 - 1) = v62 + (int)(v64 * v63);
                      *v46 = v63;
                      ++v44;
                      v46 += 2;
                    }
                    while (bitarray_zap_first_set((uint64_t)v40, v35, &v64));
                  }
                  _free(v40);
                  v31 = v44;
                  v2 = v54;
                  v8 = v53;
                  v10 = v52;
                  v18 = task;
                }
                else
                {
                  v30 = ~(v23 >> 11) | 0xFFFFFC00;
                  if (v24 != 2043)
                    v30 = 0;
                  v31 = v29 + v30;
                  if ((int)(v29 + v30) >= 1)
                  {
                    v32 = v29 + v30;
                    v33 = v70;
                    v34 = v59 + (v27 << 14);
                    do
                    {
                      *(v33 - 1) = v34;
                      *v33 = v63;
                      v33 += 2;
                      v34 += v63;
                      --v32;
                    }
                    while (v32);
                  }
                }
                if (v31)
                  v2(v18, v10, 1, v69);
                v20 = v60;
              }
            }
          }
          ++v21;
          ++v22;
        }
        while (v21 != 4096);
        v20 += 0x4000000;
        v59 += 0x4000000;
      }
      while (v20 < v57);
    }
    v4 = v50;
    if (*(_WORD *)((*((_QWORD *)__src + 3586) ^ v51 & 0xFFFFFFFFFC000000)
                  + 4
                  * (((unsigned __int16)(*((_DWORD *)__src + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)__src + 7170) << 6)) & 0xFFF)
                  - v58))
      v47 = v51 == 0;
    else
      v47 = 1;
    v15 = v51
        + ((unint64_t)*(unsigned __int16 *)((*((_QWORD *)__src + 3586) ^ v51 & 0xFFFFFFFFFC000000)
                                                 + 4
                                                 * (((unsigned __int16)(*((_DWORD *)__src + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)__src + 7170) << 6)) & 0xFFF)
                                                 - v58) << 29);
    v16 = v49;
    if (v47)
      return 0;
  }
  return result;
}

uint64_t nanov2_check()
{
  return 1;
}

void nanov2_print_self(_QWORD *a1, int a2)
{
  uint64_t is_self;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned __int16 v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v20;
  _QWORD *v21;
  uint64_t i;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  int v30;
  unint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  _DWORD *v38;
  unsigned int v39;
  unsigned __int16 v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t j;
  unint64_t v45;
  __int16 v46;
  uint64_t k;
  int v48;
  BOOL v49;
  BOOL v51;
  const char *v52;
  BOOL v53;
  BOOL v54;
  unint64_t v55;
  int v56;
  unint64_t v57;
  task_name_t task;
  unint64_t v59;
  unint64_t v61;
  _QWORD *v62;
  unint64_t v63;
  __int128 v64;
  __int128 v65;
  _OWORD v66[4];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C874D8];
  task = *MEMORY[0x1E0C883F0];
  if (nanov2_config_predicate != -1)
    _os_once();
  if (task)
  {
    is_self = mach_task_is_self(task);
    if (!(_DWORD)is_self)
      nanov2_realloc_VARIANT_mp_cold_1(is_self);
  }
  v64 = 0u;
  v65 = 0u;
  if (nanov2_config_predicate != -1)
    _os_once();
  _platform_memset();
  if (task)
  {
    v4 = mach_task_is_self(task);
    if (!(_DWORD)v4)
      nanov2_realloc_VARIANT_mp_cold_1(v4);
  }
  v5 = atomic_load(a1 + 3591);
  v6 = a1[3590];
  if (v6)
  {
    v7 = ((unsigned __int16)(a1[3585] >> 6) | (unsigned __int16)((unsigned __int16)a1[3585] << 6)) & 0xFFF;
    while (1)
    {
      if (task)
      {
        v8 = mach_task_is_self(task);
        if (!(_DWORD)v8)
          nanov2_realloc_VARIANT_mp_cold_1(v8);
      }
      v9 = v6 == ((v5 - 1) & 0xFFFFFFFFE0000000) ? v5 : v6 + 0x20000000;
      v10 = a1[3586];
      if (v6 < v9)
        break;
LABEL_31:
      v17 = *(unsigned __int16 *)((v10 ^ v6 & 0xFFFFFFFFFC000000)
                                + 4
                                * (((unsigned __int16)(*((_DWORD *)a1 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)a1 + 7170) << 6)) & 0xFFF));
      if ((_DWORD)v17)
        v18 = v6 == 0;
      else
        v18 = 1;
      v6 += v17 << 29;
      if (v18 || v6 >= v5)
        goto LABEL_39;
    }
    v11 = v6;
LABEL_18:
    v12 = 0;
    v13 = 0;
    while (1)
    {
      if (v7 != v13)
      {
        v14 = ptr_offset_to_size_class[((v12 | (unsigned __int16)(v13 >> 6)) & 0xFC0 ^ *((_DWORD *)a1 + 7170)) >> 6];
        v15 = *(_DWORD *)((v11 & 0xFFFFFFFFFC000000 ^ v10) + 4 * v13) & 0x7FF;
        if (v15 > 0x7FC)
        {
          if (v15 - 2045 < 3)
            goto LABEL_29;
        }
        else
        {
          if (!v15 || v15 == 2042)
            goto LABEL_29;
          if (v15 == 2044)
          {
            v16 = slots_by_size_class[v14];
            if (!v16)
              goto LABEL_29;
LABEL_28:
            LODWORD(v64) = v64 + v16;
            *((_QWORD *)&v64 + 1) += (int)(v16 * (16 * v14 + 16));
            *((_QWORD *)&v65 + 1) += 0x4000;
            goto LABEL_29;
          }
        }
        v16 = slots_by_size_class[v14]
            + (~(*(_DWORD *)((v11 & 0xFFFFFFFFFC000000 ^ v10) + 4 * v13) >> 11) | 0xFFFFFC00);
        if (v16)
          goto LABEL_28;
      }
LABEL_29:
      ++v13;
      v12 += 64;
      if (v13 == 4096)
      {
        v11 += 0x4000000;
        if (v11 >= v9)
          goto LABEL_31;
        goto LABEL_18;
      }
    }
  }
LABEL_39:
  malloc_report_simple((uint64_t)"Nanozonev2 %p: blocks in use: %llu, size in use: %llu allocated size: %llu, allocated re"
                                "gions: %d, region holes: %d\n");
  malloc_report_simple((uint64_t)"Current Allocation Blocks By Size Class/Context [CPU]\n");
  v20 = 0;
  v62 = a1;
  v21 = a1 + 2048;
  do
  {
    malloc_report_simple((uint64_t)"  Class %d: ");
    for (i = 0; i != 64; ++i)
    {
      if (v21[i])
        malloc_report_simple((uint64_t)"%d: %p; ");
    }
    malloc_report_simple((uint64_t)"\n");
    ++v20;
    v21 += 64;
  }
  while (v20 != 16);
  v23 = v62;
  v24 = v62[3590];
  v25 = atomic_load(v62 + 3591);
  v57 = v25;
  if (v24)
  {
    v26 = 0;
    v27 = ((unsigned __int16)(v62[3585] >> 6) | (unsigned __int16)((unsigned __int16)v62[3585] << 6)) & 0xFFF;
    v55 = (v25 - 1) & 0xFFFFFFFFE0000000;
    do
    {
      v56 = v26;
      malloc_report_simple((uint64_t)"\nRegion %d: base address %p\n");
      if (task)
      {
        v28 = mach_task_is_self(task);
        if (!(_DWORD)v28)
          nanov2_realloc_VARIANT_mp_cold_1(v28);
      }
      v29 = v24 + 0x20000000;
      if (v24 == v55)
        v29 = v57;
      v59 = v24;
      v61 = v29;
      if (v24 < v29)
      {
        v30 = 0;
        v31 = v24;
        do
        {
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = (_DWORD *)(v31 & 0xFFFFFFFFFC000000 ^ v23[3586]);
          do
          {
            if (v27 != v32)
            {
              v39 = v38[v32] & 0x7FF;
              if (v39 > 0x7FD)
              {
                if (v39 == 2046)
                  ++v33;
                else
                  ++v34;
              }
              else if (v39)
              {
                if (v39 == 2045)
                  ++v36;
                else
                  ++v37;
              }
              else
              {
                ++v35;
              }
            }
            ++v32;
          }
          while (v32 != 4096);
          v63 = v31;
          malloc_report_simple((uint64_t)"Arena #%d: base address %p. Blocks - active: %d, madvisable: %d, madvising: %d, "
                                        "madvised: %d, unused: %d\n");
          v40 = 0;
          v41 = 0;
          memset(v66, 0, sizeof(v66));
          do
          {
            if (v27 != v41 && (v38[v41] & 0x7FFu) - 2045 >= 3 && (v38[v41] & 0x7FF) != 0)
            {
              v43 = ptr_offset_to_size_class[((v40 | (unsigned __int16)(v41 >> 6)) & 0xFC0 ^ *((_DWORD *)v23 + 7170)) >> 6];
              ++*((_DWORD *)v66 + v43);
            }
            ++v41;
            v40 += 64;
          }
          while (v41 != 4096);
          malloc_report_simple((uint64_t)"Size classes with allocated blocks: ");
          for (j = 0; j != 16; ++j)
          {
            if (*((_DWORD *)v66 + j))
              malloc_report_simple((uint64_t)"%d ");
          }
          malloc_report_simple((uint64_t)"\n");
          v45 = v63;
          if (a2)
          {
            v46 = 0;
            for (k = 0; k != 4096; ++k)
            {
              if (v27 != k)
              {
                v48 = *v38 & 0x7FF;
                v49 = (v48 - 2042) > 5 || ((1 << (*v38 + 6)) & 0x31) == 0;
                if (v49 && v48 != 0)
                {
                  v51 = v48 != 2044 && v48 != 2045;
                  malloc_report_simple((uint64_t)"    Block %d: base %p; metadata: %p, size %d (class %d) in-use: %d ");
                  if (v51)
                  {
                    if (v48 == 2043)
                      v52 = "BUMP (free list empty)";
                    else
                      v52 = "next_slot (1-based) = %d";
                    malloc_report_simple((uint64_t)v52);
                    malloc_report_simple((uint64_t)", allocated slots: %d, free slots = %d, occupancy: %d%%\n");
                  }
                  else
                  {
                    malloc_report_simple((uint64_t)"%s\n");
                  }
                  v45 = v63;
                }
              }
              v46 += 64;
              ++v38;
            }
          }
          v31 = v45 + 0x4000000;
          ++v30;
          v23 = v62;
        }
        while (v31 < v61);
      }
      if (*(_WORD *)((v23[3586] ^ v59 & 0xFFFFFFFFFC000000)
                    + 4
                    * (((unsigned __int16)(*((_DWORD *)v23 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)v23 + 7170) << 6)) & 0xFFF)))
        v53 = v59 == 0;
      else
        v53 = 1;
      v26 = v56 + 1;
      v54 = v53
         || v59
          + ((unint64_t)*(unsigned __int16 *)((v23[3586] ^ v59 & 0xFFFFFFFFFC000000)
                                                   + 4
                                                   * (((unsigned __int16)(*((_DWORD *)v23 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)v23 + 7170) << 6)) & 0xFFF)) << 29) >= v57;
      v24 = v59
          + ((unint64_t)*(unsigned __int16 *)((v23[3586] ^ v59 & 0xFFFFFFFFFC000000)
                                                   + 4
                                                   * (((unsigned __int16)(*((_DWORD *)v23 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)v23 + 7170) << 6)) & 0xFFF)) << 29);
    }
    while (!v54);
  }
}

uint64_t nanov2_locked()
{
  return 0;
}

uint64_t nanov2_statistics_task(uint64_t a1, const void *a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4), uint64_t a4)
{
  return nanov2_statistics(a1, a2, a3, 0, a4);
}

uint64_t nanov2_print(uint64_t a1, unsigned int a2, const void *a3, uint64_t (*a4)(task_name_t a1, uint64_t a2, uint64_t a3, uint64_t *a4), void (*a5)(const char *, ...))
{
  const char *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const void *v14;
  char *v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  char *v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  char *v28;
  char *v29;
  unsigned int v30;
  unsigned __int16 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t j;
  unint64_t v37;
  unsigned __int16 v38;
  uint64_t v39;
  unsigned int v40;
  int v41;
  BOOL v42;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  const char *v48;
  uint64_t v49;
  BOOL v50;
  unint64_t v51;
  unsigned int v52;
  uint64_t (*v53)(task_name_t, uint64_t, uint64_t, uint64_t *);
  int v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v58;
  uint64_t v59;
  int v60;
  const char *v61;
  char v62;
  void (*v63)(const char *, ...);
  unint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  _OWORD v69[4];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C874D8];
  if (nanov2_config_predicate != -1)
    _os_once();
  v68 = 0;
  if (a4(a1, (uint64_t)a3, 29264, &v68))
  {
    v9 = "Failed to map nanozonev2_s at %p\n";
    return ((uint64_t (*)(const char *))a5)(v9);
  }
  v66 = 0u;
  v67 = 0u;
  nanov2_statistics(a1, a3, a4, a5, (uint64_t)&v66);
  a5("Nanozonev2 %p: blocks in use: %llu, size in use: %llu allocated size: %llu, allocated regions: %d, region holes: %d\n", a3, v66, *((_QWORD *)&v66 + 1), *((_QWORD *)&v67 + 1), *(_DWORD *)(v68 + 28744), *(_DWORD *)(v68 + 28748));
  a5("Current Allocation Blocks By Size Class/Context [CPU]\n");
  v11 = 0;
  v12 = 0x4000;
  do
  {
    a5("  Class %d: ", v11);
    for (i = 0; i != 64; ++i)
    {
      v14 = *(const void **)(v68 + v12 + 8 * i);
      if (v14)
        a5("%d: %p; ", i, v14);
    }
    result = ((uint64_t (*)(const char *))a5)("\n");
    ++v11;
    v12 += 512;
  }
  while (v11 != 16);
  v15 = *(char **)(v68 + 28720);
  v16 = atomic_load((unint64_t *)(v68 + 28728));
  v55 = v16;
  if (v15)
  {
    v17 = 0;
    v18 = ((unsigned __int16)(*(_QWORD *)(v68 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_QWORD *)(v68 + 28680) << 6)) & 0xFFF;
    v51 = (v16 - 1) & 0xFFFFFFFFE0000000;
    v63 = a5;
    v53 = a4;
    v52 = a1;
    while (1)
    {
      v54 = v17;
      a5("\nRegion %d: base address %p\n", v17, v15);
      v65 = 0;
      result = a4(a1, (uint64_t)v15, 0x20000000, &v65);
      if ((_DWORD)result)
        break;
      v59 = v65 - (_QWORD)v15;
      v19 = v15 + 0x20000000;
      if (v15 == (char *)v51)
        v19 = (char *)v55;
      v56 = (unint64_t)v15;
      v58 = (unint64_t)v19;
      if (v15 < v19)
      {
        v20 = 0;
        v21 = (unint64_t)v15;
        while (1)
        {
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v28 = (char *)(*(_QWORD *)(v68 + 28688) ^ v21 & 0xFFFFFFFFFC000000);
          v29 = &v28[v59];
          do
          {
            if (4 * v18 != v22)
            {
              v30 = *(_DWORD *)&v29[v22] & 0x7FF;
              if (v30 > 0x7FD)
              {
                if (v30 == 2046)
                  ++v23;
                else
                  ++v24;
              }
              else if (v30)
              {
                if (v30 == 2045)
                  ++v26;
                else
                  ++v27;
              }
              else
              {
                ++v25;
              }
            }
            v22 += 4;
          }
          while (v22 != 0x4000);
          v64 = v21;
          a5("Arena #%d: base address %p. Blocks - active: %d, madvisable: %d, madvising: %d, madvised: %d, unused: %d\n", v20, (const void *)v21, v27, v26, v23, v24, v25);
          v31 = 0;
          v32 = 0;
          memset(v69, 0, sizeof(v69));
          v33 = v68;
          do
          {
            if (v18 != v32
              && (*(_DWORD *)&v29[4 * v32] & 0x7FFu) - 2045 >= 3
              && (*(_DWORD *)&v29[4 * v32] & 0x7FF) != 0)
            {
              v35 = ptr_offset_to_size_class[((v31 | (unsigned __int16)(v32 >> 6)) & 0xFC0 ^ *(_DWORD *)(v33 + 28680)) >> 6];
              ++*((_DWORD *)v69 + v35);
            }
            ++v32;
            v31 += 64;
          }
          while (v32 != 4096);
          v60 = v20;
          a5("Size classes with allocated blocks: ");
          for (j = 0; j != 16; ++j)
          {
            if (*((_DWORD *)v69 + j))
              a5("%d ", j);
          }
          result = ((uint64_t (*)(const char *))a5)("\n");
          v37 = v64;
          if (a2 >= 2)
            break;
LABEL_70:
          v21 = v37 + 0x4000000;
          v20 = v60 + 1;
          a5 = v63;
          if (v21 >= v58)
            goto LABEL_71;
        }
        v38 = 0;
        v39 = 0;
        while (2)
        {
          if (v18 != v39)
          {
            v40 = *(_DWORD *)&v29[4 * v39];
            v41 = v40 & 0x7FF;
            v42 = (v41 - 2042) > 5 || ((1 << (v40 + 6)) & 0x31) == 0;
            if (v42 && v41 != 0)
            {
              if (v41 == 2044)
              {
                v62 = 0;
                v44 = "FULL";
LABEL_61:
                v61 = v44;
              }
              else
              {
                if (v41 == 2045)
                {
                  v62 = 0;
                  v44 = "CAN MADVISE";
                  goto LABEL_61;
                }
                v61 = 0;
                v62 = 1;
              }
              v45 = (v38 | (unsigned __int16)(v39 >> 6)) & 0xFFF;
              v46 = ptr_offset_to_size_class[(int)(v45 ^ *(_DWORD *)(v68 + 28680)) >> 6];
              v63("    Block %d: base %p; metadata: %p, size %d (class %d) in-use: %d ",
                v39,
                (const void *)(v37 + (v45 << 14)),
                v28,
                16 * v46 + 16,
                v46,
                v40 >> 31);
              if ((v62 & 1) != 0)
              {
                v47 = slots_by_size_class[v46];
                if (v41 == 2043)
                  v48 = "BUMP (free list empty)";
                else
                  v48 = "next_slot (1-based) = %d";
                v63(v48);
                result = ((uint64_t (*)(const char *, ...))v63)(", allocated slots: %d, free slots = %d, occupancy: %d%%\n", v47 + ~((v40 >> 11) & 0x3FF), ((v40 >> 11) & 0x3FF) + 1, (int)(100 * (v47 + ~((v40 >> 11) & 0x3FF))) / v47);
              }
              else
              {
                result = ((uint64_t (*)(const char *, ...))v63)("%s\n", v61);
              }
              v37 = v64;
            }
          }
          ++v39;
          v28 += 4;
          v38 += 64;
          if (v39 == 4096)
            goto LABEL_70;
          continue;
        }
      }
LABEL_71:
      v49 = *(unsigned __int16 *)(v59
                                + (*(_QWORD *)(v68 + 28688) ^ v56 & 0xFFFFFFFFFC000000)
                                + 4
                                * (((unsigned __int16)(*(_DWORD *)(v68 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(v68 + 28680) << 6)) & 0xFFF));
      if (v56 + (v49 << 29) >= v55)
        v15 = 0;
      else
        v15 = (char *)(v56 + (v49 << 29));
      a4 = v53;
      v17 = v54 + 1;
      if (*(_WORD *)(v59
                    + (*(_QWORD *)(v68 + 28688) ^ v56 & 0xFFFFFFFFFC000000)
                    + 4
                    * (((unsigned __int16)(*(_DWORD *)(v68 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(v68 + 28680) << 6)) & 0xFFF)))
        v50 = v15 == 0;
      else
        v50 = 1;
      a1 = v52;
      if (v50)
        return result;
    }
    v9 = "Failed to map nanov2 region at %p\n";
    return ((uint64_t (*)(const char *))a5)(v9);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return kdebug_trace();
}

void nano_common_cpu_number_override_set()
{
  if (_os_cpu_number_override != (_UNKNOWN *__ptr32)-1 || nano_common_max_magazines != phys_ncpus)
    nano_common_max_magazines_is_ncpu = 0;
}

BOOL nano_common_reserve_vm_space(mach_vm_address_t a1, mach_vm_size_t a2)
{
  return _nano_common_map_vm_space(a1, a2, 0) != 0;
}

BOOL nano_common_unprotect_vm_space(mach_vm_address_t address, mach_vm_size_t size)
{
  kern_return_t v2;

  v2 = mach_vm_protect(*MEMORY[0x1E0C883F0], address, size, 0, 3);
  if (v2)
    malloc_report(3u, (uint64_t)"mach_vm_protect ret: %d\n");
  return v2 == 0;
}

void nano_common_deallocate_pages(mach_vm_address_t address, mach_vm_size_t size, __int16 a3)
{
  if (mach_vm_deallocate(*MEMORY[0x1E0C883F0], address, size))
    malloc_zone_error(a3, 0, (uint64_t)"Can't deallocate_pages at %p\n");
}

uint64_t nano_common_default_reader(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  *a4 = a2;
  return 0;
}

uint64_t _xzm_type_choose_ptr_bucket(uint64_t a1, int a2)
{
  return ((uint64_t (*)(void))((char *)sub_191D8F174 + 4 * byte_191D9E9E0[a2 - 1]))();
}

uint64_t sub_191D8F174(_DWORD *a1, uint64_t a2, int a3)
{
  return (a1[1] + *a1 * a3) >> 31;
}

uint64_t xzm_check()
{
  return 1;
}

void xzm_reinit_lock(uint64_t a1)
{
  _xzm_foreach_lock(a1, 2);
}

void xzm_locked()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: xzm_locked not implemented";
  __break(1u);
}

void xzm_force_lock_global_state(uint64_t a1)
{
  _xzm_global_state_lock(a1, 0);
}

void _xzm_global_state_lock(uint64_t a1, int a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  if (*(unsigned __int8 *)(a1 + 210) >= 2u)
  {
    v4 = 1;
    v5 = 24;
    do
    {
      _xzm_do_lock_action((os_unfair_lock_s *)(*(_QWORD *)(a1 + 376) + v5), a2);
      ++v4;
      v5 += 16;
    }
    while (v4 < *(unsigned __int8 *)(a1 + 210));
  }
  if (*(_BYTE *)(a1 + 344))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = *(_QWORD *)(a1 + 392) + v6;
      _xzm_do_lock_action((os_unfair_lock_s *)(v8 + 8), a2);
      _xzm_do_lock_action((os_unfair_lock_s *)(v8 + 4), a2);
      if (*(_BYTE *)v8 == 1)
        _xzm_do_lock_action((os_unfair_lock_s *)(v8 + 488), a2);
      ++v7;
      v6 += 496;
    }
    while (v7 < *(unsigned __int8 *)(a1 + 344));
  }
  if (*(_BYTE *)(a1 + 329))
  {
    v9 = 0;
    v10 = 16;
    do
    {
      _xzm_do_lock_action((os_unfair_lock_s *)(*(_QWORD *)(a1 + 384) + v10), a2);
      ++v9;
      v10 += 56;
    }
    while (v9 < *(unsigned __int8 *)(a1 + 329));
  }
  _xzm_do_lock_action((os_unfair_lock_s *)(a1 + 432), a2);
  if (*(_BYTE *)(a1 + 330))
  {
    v11 = 0;
    v12 = 0;
    do
    {
      _xzm_do_lock_action((os_unfair_lock_s *)(*(_QWORD *)(a1 + 400) + v11), a2);
      ++v12;
      v11 += 64;
    }
    while (v12 < *(unsigned __int8 *)(a1 + 330));
  }
  _xzm_do_lock_action((os_unfair_lock_s *)(a1 + 448), a2);
}

void xzm_force_unlock_global_state(uint64_t a1)
{
  _xzm_global_state_lock(a1, 1);
}

void xzm_force_reinit_lock_global_state(uint64_t a1)
{
  _xzm_global_state_lock(a1, 2);
}

uint64_t xzm_ptr_lookup_4test(uint64_t a1, unint64_t a2, _BYTE *a3, _BYTE *a4, _BYTE *a5)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  unint64_t v13;
  unsigned int v14;
  _BYTE **v16;
  unint64_t v17;
  uint64_t v19;
  unint64_t v20;
  unint64_t v22;
  unsigned int v23;
  int v24;
  unint64_t v26;
  _BYTE *v27;
  _BYTE *v28;
  _BYTE *v29;
  unint64_t v30;
  uint64_t v31;

  v5 = a2 >> 22;
  if (a2 >> 36)
    v5 = 0x4000;
  if (v5 >> 14)
    return 0;
  v6 = *(_QWORD *)(a1 + 232);
  if (!v6)
    v6 = a1;
  v7 = *(_QWORD *)(v6 + 408);
  if (!v7)
    return 0;
  v8 = *(unsigned int *)(v7 + 4 * v5);
  if (!(_DWORD)v8)
    return 0;
  v10 = v8 << 14;
  v11 = a2 - *(_QWORD *)(v10 + 48);
  if (*(_DWORD *)(v10 + 16) <= (v11 >> 14))
    return 0;
  v12 = v11 >> 14;
  v13 = v10 + 48 * v12 + 2104;
  if ((*(_BYTE *)(v10 + 48 * v12 + 2136) & 0xF) == 4)
  {
    v22 = v13 - *(unsigned int *)(v10 + 48 * v12 + 2140);
    v23 = *(_BYTE *)(v22 + 32) & 0xF;
    if (v23 <= 8)
    {
      v24 = 1 << v23;
      if ((v24 & 0x1E8) != 0)
      {
        if (v22 + 48 * *(unsigned int *)(v22 + 40) <= v13)
          goto LABEL_10;
        goto LABEL_48;
      }
      if ((v24 & 6) != 0 && v13 == v22)
LABEL_48:
        v13 = v22;
    }
  }
LABEL_10:
  v14 = *(_BYTE *)(v13 + 32) & 0xF;
  if (v14 > 7)
    _xzm_segment_group_segment_span_free_coalesce_cold_1(*(_BYTE *)(v13 + 32) & 0xF);
  if (((1 << v14) & 0x1B) != 0 || *(unsigned __int16 *)(v13 + 34) != *(unsigned __int16 *)(a1 + 208))
    return 0;
  v16 = (_BYTE **)(v13 & 0xFFFFFFFFFFFFC000);
  v17 = a2
      - *(_QWORD *)((v13 & 0xFFFFFFFFFFFFC000) + 0x30)
      - ((0xAAAAAAAAAAAAC000 * (((v13 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
  if (v14 == 5 || v14 == 2)
  {
    v19 = *(_QWORD *)(a1 + 216) + 88 * *(unsigned __int8 *)(v13 + 33);
    if ((*(_DWORD *)(v19 + 64) * v17) >= *(_DWORD *)(v19 + 64))
      return 0;
    v20 = *(_QWORD *)(v19 + 48);
  }
  else
  {
    v20 = (unint64_t)*(unsigned int *)(v13 + 40) << 14;
    v19 = v17 % v20;
    if (v17 % v20)
      return 0;
  }
  if (v14 == 5)
  {
    if (((*(_DWORD *)v13 >> (v17 / v20)) & 1) != 0)
      return 0;
  }
  else
  {
    if (v14 != 2)
      goto LABEL_26;
    if (*(_QWORD *)a2 == (*(_QWORD *)(a1 + 272) ^ a2))
    {
      v30 = v13 & 0xFFFFFFFFFFFFC000;
      v31 = v19;
      v28 = a4;
      v29 = a3;
      v26 = v13;
      v27 = a5;
      if ((_xzm_xzone_tiny_chunk_block_is_free_slow(a1, v13, a2) & 1) == 0)
      {
        a5 = v27;
        v14 = *(_BYTE *)(v26 + 32) & 0xF;
        a4 = v28;
        a3 = v29;
        v16 = (_BYTE **)v30;
        v19 = v31;
LABEL_26:
        *a3 = v14;
        *a4 = **v16;
        if (v14 != 5 && v14 != 2)
          return 1;
        goto LABEL_35;
      }
      return 0;
    }
  }
  *a3 = v14;
  *a4 = **v16;
LABEL_35:
  if (!v19)
    xzm_ptr_lookup_4test_cold_2();
  *a5 = *(_BYTE *)(v19 + 76);
  return 1;
}

uint64_t xzm_type_choose_ptr_bucket_4test(uint64_t a1, int a2)
{
  return ((uint64_t (*)(void))((char *)sub_191D8F5E0 + 4 * byte_191D9E9EC[a2 - 1]))();
}

uint64_t sub_191D8F5E0(_DWORD *a1, uint64_t a2, int a3)
{
  return (a1[1] + *a1 * a3) >> 31;
}

uint64_t _xzm_initialize_const_zone_data(uint64_t result, uint64_t a2, __int16 a3, char a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, int a10, unsigned int a11, int a12, uint64_t a13, uint64_t a14)
{
  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = xzm_malloc_zone_size;
  *(_QWORD *)(result + 24) = xzm_malloc_zone_malloc;
  *(_QWORD *)(result + 32) = xzm_malloc_zone_calloc;
  *(_QWORD *)(result + 40) = xzm_malloc_zone_valloc;
  *(_QWORD *)(result + 48) = xzm_malloc_zone_free;
  *(_QWORD *)(result + 56) = xzm_malloc_zone_realloc;
  *(_QWORD *)(result + 64) = xzm_malloc_zone_destroy;
  *(_QWORD *)(result + 72) = 0;
  *(_QWORD *)(result + 80) = malloc_zone_batch_malloc_fallback;
  *(_QWORD *)(result + 88) = malloc_zone_batch_free_fallback;
  *(_QWORD *)(result + 96) = &xzm_malloc_zone_introspect;
  *(_DWORD *)(result + 104) = 16;
  *(_QWORD *)(result + 112) = xzm_malloc_zone_memalign;
  *(_QWORD *)(result + 120) = xzm_malloc_zone_free_definite_size;
  *(_QWORD *)(result + 128) = malloc_zone_pressure_relief_fallback;
  *(_QWORD *)(result + 136) = xzm_malloc_zone_claimed_address;
  *(_QWORD *)(result + 144) = xzm_malloc_zone_try_free_default;
  *(_QWORD *)(result + 152) = xzm_malloc_zone_malloc_with_options;
  *(_QWORD *)(result + 160) = xzm_malloc_zone_malloc_type_malloc;
  *(_QWORD *)(result + 168) = xzm_malloc_zone_malloc_type_calloc;
  *(_QWORD *)(result + 176) = xzm_malloc_zone_malloc_type_realloc;
  *(_QWORD *)(result + 184) = xzm_malloc_zone_malloc_type_memalign;
  *(_QWORD *)(result + 192) = xzm_malloc_zone_malloc_type_malloc_with_options;
  *(_QWORD *)(result + 200) = a2;
  *(_WORD *)(result + 208) = a3;
  *(_BYTE *)(result + 210) = a4;
  *(_BYTE *)(result + 211) = a5;
  *(_QWORD *)(result + 216) = a6;
  *(_QWORD *)(result + 224) = a7;
  *(_QWORD *)(result + 232) = a8;
  *(_BYTE *)(result + 240) = a9 & 3;
  *(_DWORD *)(result + 244) = a10;
  *(_QWORD *)(result + 248) = a11;
  *(_DWORD *)(result + 256) = a12;
  *(_QWORD *)(result + 264) = a13;
  *(_QWORD *)(result + 272) = 0;
  *(_QWORD *)(result + 280) = 0;
  *(_QWORD *)(result + 288) = 0;
  *(_QWORD *)(result + 296) = a14;
  if ((a14 & 0xA0) != 0)
  {
    *(_QWORD *)(result + 24) = xzm_malloc_zone_malloc_slow;
    *(_QWORD *)(result + 32) = xzm_malloc_zone_calloc_slow;
    *(_QWORD *)(result + 40) = xzm_malloc_zone_valloc_slow;
    *(_QWORD *)(result + 48) = xzm_malloc_zone_free_slow;
    *(_QWORD *)(result + 56) = xzm_malloc_zone_realloc_slow;
    *(_QWORD *)(result + 112) = xzm_malloc_zone_memalign_slow;
    *(_QWORD *)(result + 120) = xzm_malloc_zone_free_definite_size_slow;
    *(_QWORD *)(result + 144) = xzm_malloc_zone_try_free_default_slow;
    *(_QWORD *)(result + 152) = xzm_malloc_zone_malloc_with_options_slow;
    *(_QWORD *)(result + 160) = xzm_malloc_zone_malloc_type_malloc_slow;
    *(_QWORD *)(result + 168) = xzm_malloc_zone_malloc_type_calloc_slow;
    *(_QWORD *)(result + 176) = xzm_malloc_zone_malloc_type_realloc_slow;
    *(_QWORD *)(result + 184) = xzm_malloc_zone_malloc_type_memalign_slow;
    *(_QWORD *)(result + 192) = xzm_malloc_zone_malloc_type_malloc_with_options_slow;
  }
  return result;
}

void _xzm_initialize_xzone_data(uint64_t a1, char a2, char *a3, int a4)
{
  uint64_t v8;
  _QWORD *v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  char v25;
  char v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD *v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  unint64_t __buf;

  v8 = *(_QWORD *)(a1 + 232);
  if (v8)
    v9 = *(_QWORD **)(a1 + 232);
  else
    v9 = (_QWORD *)a1;
  __buf = 0;
  arc4random_buf(&__buf, 8uLL);
  v11 = __buf;
  if (!__buf)
  {
    v11 = 0xDEADDEADDEADDEADLL;
    __buf = 0xDEADDEADDEADDEADLL;
  }
  v12 = 0;
  v13 = 1;
  *(_QWORD *)(a1 + 272) = v11;
  do
  {
    if (!v8)
      *(_BYTE *)(*(_QWORD *)(a1 + 368) + v12) = v13;
    if (*(_BYTE *)(v9[45] + v12))
    {
      v14 = 0;
      v15 = 0;
      v16 = 88 * *(unsigned __int8 *)(v9[45] + v12);
      v17 = 88 * v13;
      while (1)
      {
        v18 = *(_QWORD *)(v9[44] + 8 * v12);
        if (v18 > 0x1000)
          v19 = 0x10000;
        else
          v19 = 0x4000;
        if (v8)
        {
          LOWORD(v20) = 0;
        }
        else
        {
          if (v18 > 0x100)
          {
            if (v18 > 0x200)
            {
              if (v18 > 0x800)
              {
                LOWORD(v20) = v18 <= 0x2000;
                goto LABEL_23;
              }
              v21 = (unsigned __int16)*(_QWORD *)(v9[44] + 8 * v12);
              v22 = 0x2000;
            }
            else
            {
              v21 = (unsigned __int16)*(_QWORD *)(v9[44] + 8 * v12);
              v22 = 4096;
            }
          }
          else
          {
            v21 = (unsigned __int16)*(_QWORD *)(v9[44] + 8 * v12);
            v22 = 2048;
          }
          v20 = v22 / v21;
        }
LABEL_23:
        if ((_DWORD)v15)
          v23 = a4;
        else
          v23 = 1;
        if (v23)
          v24 = 0;
        else
          v24 = 992;
        v25 = *a3;
        if (*a3)
        {
          if (a3[1])
            LOBYTE(v23) = 0;
          if ((v23 & 1) != 0)
          {
            v26 = 0;
            v25 = 0;
            v27 = 0;
          }
          else
          {
            v28 = 4;
            if (v18 <= 0x1000)
              v28 = 2;
            v29 = 3;
            if (v18 > 0x1000)
              v29 = 5;
            v26 = a3[v28];
            v25 = a3[v29];
            v27 = 1;
          }
        }
        else
        {
          v26 = 0;
          v27 = v23 ^ 1;
        }
        v30 = *(_QWORD *)(a1 + 216);
        v31 = (_OWORD *)(v30 + v17 + v15);
        v32 = v9[49] + v24;
        v33 = *(_WORD *)(a1 + 208);
        *v31 = 0uLL;
        v31[1] = 0uLL;
        v34 = v30 + v17 + v15;
        *(_WORD *)(v34 + 32) = v20;
        *(_QWORD *)(v34 + 40) = v32;
        *(_QWORD *)(v34 + 48) = v18;
        *(_QWORD *)(v34 + 56) = 0xFFFFFFFF / v18 + 1;
        *(_DWORD *)(v34 + 64) = 0xFFFFFFFF / v18 + 1;
        *(_DWORD *)(v34 + 68) = v19 / v18;
        *(_BYTE *)(v34 + 72) = v13 + v14;
        *(_WORD *)(v34 + 74) = v33;
        *(_BYTE *)(v34 + 76) = v14;
        LOBYTE(v32) = v10 & 0xFE;
        v10 = v10 & 0xFFFFFFFE | v27;
        *(_BYTE *)(v34 + 77) = a2;
        *(_BYTE *)(v34 + 78) = v32 | v27;
        *(_BYTE *)(v34 + 79) = v26;
        *(_BYTE *)(v34 + 80) = v25;
        v15 += 88;
        ++v14;
        if (v16 == (_DWORD)v15)
        {
          v13 += v14;
          break;
        }
      }
    }
    ++v12;
  }
  while (v12 != 40);
}

uint64_t xzm_malloc_zone_create(unsigned int a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  os_unfair_lock_s *v6;
  _QWORD *v7;
  int v8;
  int v9;
  uint64_t v10;
  mach_vm_address_t plat;
  uint64_t v12;

  v4 = *(unsigned __int8 *)(a2 + 210);
  v5 = *(unsigned __int8 *)(a2 + 211);
  v6 = (os_unfair_lock_s *)(a2 + 448);
  os_unfair_lock_lock_with_options();
  v7 = *(_QWORD **)(a2 + 440);
  if (v7)
  {
    *(_QWORD *)(a2 + 440) = v7[1];
    v8 = *(unsigned __int16 *)v7;
    xzm_metapool_free(*(_QWORD *)(a2 + 400) + 128, v7);
    os_unfair_lock_unlock(v6);
    if (!v8)
      return 0;
  }
  else
  {
    v9 = *(unsigned __int16 *)(a2 + 436);
    if (v9 == 0xFFFF)
    {
      os_unfair_lock_unlock(v6);
      return 0;
    }
    LOWORD(v8) = v9 + 1;
    *(_WORD *)(a2 + 436) = v9 + 1;
    os_unfair_lock_unlock(v6);
  }
  v10 = 88 * v4 + 304;
  plat = mvm_allocate_plat(0, v10 + 32 * v4 * (unint64_t)v5, 0, 1, 0, 1);
  v12 = plat;
  if (plat)
  {
    _xzm_initialize_const_zone_data(plat, v10 + 32 * v4 * (unint64_t)v5, v8, v4, v5, plat + 304, v10 + plat, a2, *(_BYTE *)(a2 + 240) & 3, *(_QWORD *)(a2 + 244), HIDWORD(*(_QWORD *)(a2 + 244)), *(_DWORD *)(a2 + 256), *(_QWORD *)(a2 + 264), a1);
    _xzm_initialize_xzone_data(v12, 0, (char *)(a2 + 452), *(unsigned __int8 *)(a2 + 344) == 2);
    *(_QWORD *)(v12 + 288) = 0;
  }
  return v12;
}

void _xzm_walk_lock_wait(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v1;

  v1 = a1 + 70;
  os_unfair_lock_lock_with_options();
  os_unfair_lock_unlock(v1);
}

unint64_t _xzm_xzone_malloc_from_empty_tiny_chunk(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v7 = atomic_load((unint64_t *)a4);
  v8 = *(_QWORD *)(a1 + 232);
  if (!v8)
    v8 = a1;
  if ((*(_BYTE *)(v8 + 328) & 4) != 0 && !xzm_chunk_mark_used(a1, a4))
    return 0;
  v9 = v7 & 0xFFFFFFFFD0000000 | ((unint64_t)((a3 + 1) & 0x3F) << 22) | ((*(_DWORD *)(a2 + 68) << 11) + 4192256) & 0x3FF800 | 0x7FC;
  do
  {
    v10 = __ldaxr((unint64_t *)a4);
    if (v10 != v7)
    {
      __clrex();
      _xzm_xzone_malloc_from_empty_tiny_chunk_cold_1();
    }
  }
  while (__stxr(v9, (unint64_t *)a4));
  return ((0xAAAAAAAAAAAAC000 * (((unint64_t)(a4 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
       + *(_QWORD *)((a4 & 0xFFFFFFFFFFFFC000) + 0x30);
}

uint64_t _xzm_xzone_allocate_chunk_from_isolation(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 376) + 16 * *(unsigned __int8 *)(a2 + 72));
  if (!*(_QWORD *)&v2->_os_unfair_lock_opaque)
    return 0;
  v16 = 0;
  os_unfair_lock_lock_with_options();
  v5 = *(_QWORD *)&v2->_os_unfair_lock_opaque;
  if (*(_QWORD *)&v2->_os_unfair_lock_opaque)
  {
    while (1)
    {
      v6 = v5;
      v8 = (uint64_t *)(v5 + 16);
      v7 = *(_QWORD *)(v5 + 16);
      if (v7)
      {
        *(_QWORD *)(v7 + 24) = *(_QWORD *)(v6 + 24);
        v7 = *(_QWORD *)(v6 + 16);
      }
      **(_QWORD **)(v6 + 24) = v7;
      if (*(_QWORD *)(a2 + 48) <= 0x1000uLL
        || (*(_BYTE *)(a1 + 328) & 4) == 0
        || (xzm_chunk_mark_used(a1, v6) & 1) != 0)
      {
        break;
      }
      v9 = v16;
      *v8 = v16;
      if (v9)
        *(_QWORD *)(v9 + 24) = v8;
      v16 = v6;
      *(_QWORD *)(v6 + 24) = &v16;
      v5 = *(_QWORD *)&v2->_os_unfair_lock_opaque;
      if (!*(_QWORD *)&v2->_os_unfair_lock_opaque)
      {
        v10 = 0;
        v11 = v6;
        goto LABEL_14;
      }
    }
    *(_WORD *)(v6 + 34) = *(_WORD *)(a2 + 74);
    v11 = v16;
    v10 = v6;
    if (!v16)
      goto LABEL_22;
    do
    {
LABEL_14:
      v12 = *(_QWORD *)(v11 + 16);
      if (v12)
      {
        *(_QWORD *)(v12 + 24) = *(_QWORD *)(v11 + 24);
        v13 = *(_QWORD *)(v11 + 16);
      }
      else
      {
        v13 = 0;
      }
      **(_QWORD **)(v11 + 24) = v13;
      v14 = *(_QWORD *)&v2->_os_unfair_lock_opaque;
      *(_QWORD *)(v11 + 16) = *(_QWORD *)&v2->_os_unfair_lock_opaque;
      if (v14)
        *(_QWORD *)(*(_QWORD *)&v2->_os_unfair_lock_opaque + 24) = v11 + 16;
      *(_QWORD *)&v2->_os_unfair_lock_opaque = v11;
      *(_QWORD *)(v11 + 24) = v2;
      v11 = v12;
    }
    while (v12);
    v6 = v10;
  }
  else
  {
    v6 = 0;
  }
LABEL_22:
  os_unfair_lock_unlock(v2 + 2);
  return v6;
}

uint64_t _xzm_xzone_fresh_chunk_init(uint64_t result, uint64_t a2, int a3)
{
  char v3;
  int v4;

  v3 = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a2 + 32) = v3 & 0xBF;
  if (a3 != 2)
  {
    if (a3 != 5)
      _xzm_xzone_fresh_chunk_init_cold_1();
    v4 = v3 & 0xF;
    if (v4 != 2)
    {
      if (v4 != 5)
        _xzm_segment_group_segment_span_free_coalesce_cold_1(v4);
      *(_QWORD *)a2 = *(_DWORD *)a2 | ~(-1 << *(_DWORD *)(result + 68));
    }
  }
  return result;
}

uint64_t _xzm_xzone_tiny_chunk_block_is_free_slow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_unfair_lock_s *v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v6 = (os_unfair_lock_s *)(a1 + 280);
  result = os_unfair_lock_lock_with_options();
  v8 = *(_QWORD *)a2;
LABEL_2:
  v9 = v8;
  if ((~(_WORD)v8 & 0x7FE) != 0)
  {
    v10 = v8 | 0x40000000;
    do
    {
      v8 = __ldxr((unint64_t *)a2);
      if (v8 != v9)
      {
        __clrex();
        goto LABEL_2;
      }
    }
    while (__stxr(v10, (unint64_t *)a2));
    v11 = ((0xAAAAAAAAAAAAC000 * (((unint64_t)(a2 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
        + *(_QWORD *)((a2 & 0xFFFFFFFFFFFFC000) + 0x30);
    if ((uint64_t)(a3 - v11) >= 0)
      v12 = a3 - v11;
    else
      v12 = a3 - v11 + 15;
    v13 = v9 & 0x7FF;
    if (v13 - 2046 > 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = 0;
    }
    else
    {
      v14 = 0;
      v15 = *(_QWORD *)(a1 + 216) + 88 * *(unsigned __int8 *)(a2 + 33);
      v16 = *(_QWORD *)(v15 + 48) >> 4;
      v17 = v12 >> 4;
      v18 = v16 * (*(_DWORD *)(v15 + 68) - 1);
      v19 = v11 + 8;
      do
      {
        v20 = v13 % v16 || v13 > v18;
        if (v20 || v14 > 0x3FF)
          break;
        if (v13 == v17)
        {
          v21 = 1;
          goto LABEL_28;
        }
        ++v14;
        v13 = *(_QWORD *)(v19 + 16 * v13) & 0x7FFLL;
      }
      while (v13 - 2046 < 0xFFFFFFFFFFFFFFFELL);
    }
    v22 = (v9 >> 11) & 0x7FF;
    if (v14 == v22 && v13 == 2045 || v14 < v22 && v13 == 2044)
    {
      v21 = 0;
LABEL_28:
      v23 = v9 & 0xFFFFFFFFBFFFFFFFLL;
      while (1)
      {
        v24 = __ldxr((unint64_t *)a2);
        if (v24 != v10)
          break;
        if (!__stxr(v23, (unint64_t *)a2))
          goto LABEL_31;
      }
    }
    else
    {
      qword_1EE228008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: corrupt tiny freelist";
      qword_1EE228038 = v14;
      __break(1u);
    }
    __clrex();
    qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"success\" failed (/Library/Caches/com.apple.xbs/Sour"
                               "ces/libmalloc/src/xzone/xzone_malloc.c:2724)";
    __break(1u);
  }
  else
  {
    v21 = 1;
LABEL_31:
    os_unfair_lock_unlock(v6);
    return v21;
  }
  return result;
}

void xzm_malloc_zone_destroy(mach_vm_address_t a1)
{
  os_unfair_lock_s *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned __int8 v14;
  unint64_t v15;
  unsigned __int8 *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  _QWORD *v35;
  int v36;
  char v37;
  int v38;
  uint64_t *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;

  if (*(_QWORD *)(a1 + 232))
  {
    v2 = (os_unfair_lock_s *)(a1 + 280);
    os_unfair_lock_lock_with_options();
    v43 = 0;
    if (*(unsigned __int8 *)(a1 + 210) >= 2u)
    {
      v3 = 1;
      do
      {
        v4 = *(_QWORD *)(a1 + 216);
        v5 = (unint64_t *)(v4 + 88 * v3);
        if (v5[6] <= 0x1000)
        {
          while (1)
          {
            v24 = _xzm_chunk_list_pop((os_unfair_lock_s *)a1, v5 + 2, 1u);
            if (!v24)
              break;
            if ((*(_BYTE *)(v24 + 32) & 0x40) != 0)
              xzm_malloc_zone_destroy_cold_3();
            *(_QWORD *)v24 &= 0xFFFFFFFFC03FFFFFLL;
            v25 = v43;
            *(_QWORD *)(v24 + 16) = v43;
            if (v25)
              *(_QWORD *)(v25 + 24) = v24 + 16;
            v43 = v24;
            *(_QWORD *)(v24 + 24) = &v43;
          }
          v26 = v5 + 3;
          while (1)
          {
            v27 = _xzm_chunk_list_pop((os_unfair_lock_s *)a1, v26, 0);
            if (!v27)
              break;
            v28 = v43;
            *(_QWORD *)(v27 + 16) = v43;
            *(_BYTE *)(v27 + 32) &= ~0x40u;
            if (v28)
              *(_QWORD *)(v28 + 24) = v27 + 16;
            v43 = v27;
            *(_QWORD *)(v27 + 24) = &v43;
          }
        }
        else
        {
          v6 = *v5;
          if (*v5)
          {
            do
            {
              v7 = *(_QWORD *)(v6 + 16);
              if (v7)
              {
                *(_QWORD *)(v7 + 24) = *(_QWORD *)(v6 + 24);
                v8 = *(_QWORD *)(v6 + 16);
              }
              else
              {
                v8 = 0;
              }
              **(_QWORD **)(v6 + 24) = v8;
              v9 = v43;
              *(_QWORD *)(v6 + 16) = v43;
              if (v9)
                *(_QWORD *)(v9 + 24) = v6 + 16;
              v43 = v6;
              *(_QWORD *)(v6 + 24) = &v43;
              v6 = v7;
            }
            while (v7);
          }
          v10 = v5[1];
          if (v10)
          {
            do
            {
              v11 = *(_QWORD *)(v10 + 16);
              if (v11)
              {
                *(_QWORD *)(v11 + 24) = *(_QWORD *)(v10 + 24);
                v12 = *(_QWORD *)(v10 + 16);
              }
              else
              {
                v12 = 0;
              }
              **(_QWORD **)(v10 + 24) = v12;
              v13 = v43;
              *(_QWORD *)(v10 + 16) = v43;
              if (v13)
                *(_QWORD *)(v13 + 24) = v10 + 16;
              v43 = v10;
              *(_QWORD *)(v10 + 24) = &v43;
              v10 = v11;
            }
            while (v11);
          }
          v14 = *(_BYTE *)(a1 + 211);
          if (v14)
          {
            v15 = 0;
            v16 = (unsigned __int8 *)(v4 + 88 * v3 + 72);
            do
            {
              v17 = (unint64_t *)(*(_QWORD *)(a1 + 224) + 32 * (*v16 + v15 * *(unsigned __int8 *)(a1 + 210)));
              v18 = *v17;
              if (*v17)
              {
                *v17 = 0;
                v19 = v43;
                *(_QWORD *)(v18 + 16) = v43;
                if (v19)
                  *(_QWORD *)(v19 + 24) = v18 + 16;
                v43 = v18;
                *(_QWORD *)(v18 + 24) = &v43;
                v14 = *(_BYTE *)(a1 + 211);
              }
              ++v15;
            }
            while (v15 < v14);
          }
          v20 = v5[2];
          if (v20)
          {
            do
            {
              v21 = *(_QWORD *)(v20 + 16);
              if (v21)
              {
                *(_QWORD *)(v21 + 24) = *(_QWORD *)(v20 + 24);
                v22 = *(_QWORD *)(v20 + 16);
              }
              else
              {
                v22 = 0;
              }
              **(_QWORD **)(v20 + 24) = v22;
              _xzm_xzone_fresh_chunk_init((uint64_t)v5, v20, 5);
              v23 = v43;
              *(_QWORD *)(v20 + 16) = v43;
              if (v23)
                *(_QWORD *)(v23 + 24) = v20 + 16;
              v43 = v20;
              *(_QWORD *)(v20 + 24) = &v43;
              v20 = v21;
            }
            while (v21);
          }
        }
        ++v3;
      }
      while (v3 < *(unsigned __int8 *)(a1 + 210));
    }
    os_unfair_lock_unlock(v2);
    v29 = *(_QWORD *)(a1 + 232);
    v30 = v43;
    if (v43)
    {
      do
      {
        v31 = *(_QWORD *)(v30 + 16);
        v32 = *(_QWORD *)(a1 + 216);
        v33 = *(unsigned __int8 *)(v30 + 33);
        if ((*(_BYTE *)(v32 + 88 * *(unsigned __int8 *)(v30 + 33) + 78) & 1) == 0 && (*(_BYTE *)(v29 + 328) & 4) != 0)
        {
          v34 = -1431655765 * (((v30 & 0x3FFF) - 2104) >> 4);
          v35 = (_QWORD *)((v30 & 0xFFFFFFFFFFFFC000) + 8 * v34 + 56);
          if (*(_QWORD *)((v30 & 0xFFFFFFFFFFFFC000) + 8 * v34 + 0x38) != -1)
          {
            v36 = 11;
            while (!xzm_chunk_mark_used(a1, v30))
            {
              xzm_reclaim_force_sync();
              if (!--v36)
                xzm_malloc_zone_destroy_cold_2();
              if (*v35 == -1)
                goto LABEL_55;
            }
            *(_QWORD *)v30 = *(_QWORD *)v30 & 0xFFFFFFFFFFFFF800 | 0x7FD;
          }
        }
LABEL_55:
        v37 = *(_BYTE *)(v30 + 32);
        v38 = v37 & 0xF;
        if (v38 == 5)
        {
          xzm_segment_group_segment_madvise_chunk(*(_QWORD *)(v30 & 0xFFFFFFFFFFFFC000), v30);
        }
        else
        {
          if (v38 != 2)
            _xzm_xzone_chunk_free_cold_2(v38);
          if ((*(_QWORD *)v30 & 0x7FFLL) == 0x7FE)
            goto LABEL_63;
          v39 = (uint64_t *)(v30 & 0xFFFFFFFFFFFFC000);
          if (*(_QWORD *)(v32 + 88 * v33 + 48) <= 0x400uLL)
            bzero((void *)(((0xAAAAAAAAAAAAC000 * ((v30 - (unint64_t)v39 - 2104) >> 4)) & 0x3FFFFFFFC000)+ *(_QWORD *)((v30 & 0xFFFFFFFFFFFFC000) + 0x30)), 0x4000uLL);
          xzm_segment_group_segment_madvise_chunk(*v39, v30);
          *(_QWORD *)v30 = *(_QWORD *)v30 & 0xFFFFFFFFFFC00000 | 0x7FE;
        }
        v37 = *(_BYTE *)(v30 + 32);
LABEL_63:
        *(_BYTE *)(v30 + 32) = v37 & 0xDF;
        _xzm_xzone_chunk_free(a1, *(_QWORD *)(a1 + 216) + 88 * *(unsigned __int8 *)(v30 + 33), v30);
        v30 = v31;
      }
      while (v31);
    }
    v40 = *(_QWORD *)(a1 + 288);
    if (v40)
    {
      do
      {
        v41 = *(_QWORD *)(v40 + 16);
        _xzm_free_large_huge(a1, v40);
        v40 = v41;
      }
      while (v41);
    }
    v42 = xzm_metapool_alloc(*(_QWORD *)(v29 + 400) + 128);
    *(_WORD *)v42 = *(_WORD *)(a1 + 208);
    os_unfair_lock_lock_with_options();
    *(_QWORD *)(v42 + 8) = *(_QWORD *)(v29 + 440);
    *(_QWORD *)(v29 + 440) = v42;
    os_unfair_lock_unlock((os_unfair_lock_t)(v29 + 448));
    mvm_deallocate_plat(a1, *(_QWORD *)(a1 + 200), 0);
  }
}

BOOL xzm_malloc_zone_claimed_address(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (mfm_claimed_address(a2))
    return 1;
  v5 = a2 >> 22;
  if (a2 >> 36)
    v5 = 0x4000;
  if (v5 >> 14)
    return 0;
  v6 = *(_QWORD *)(a1 + 232);
  if (!v6)
    v6 = a1;
  v7 = *(_QWORD *)(v6 + 408);
  return v7 && *(_DWORD *)(v7 + 4 * v5) != 0;
}

void xzm_malloc_zone_malloc_with_options(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  xzm_malloc_zone_malloc_type_malloc_with_options(a1, a2, a3, a4, *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904));
}

void xzm_malloc_zone_malloc_type_malloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  char v8;

  if (a2 > 0x8000)
  {
    _xzm_malloc_large_huge(a1, a2, 0, a3, 0);
    return;
  }
  if (*(_QWORD *)(a1 + 232))
    v3 = *(_QWORD *)(a1 + 232);
  else
    v3 = a1;
  v4 = __clz(a2 - 1);
  v5 = (((a2 - 1) >> (61 - v4)) & 3) - 4 * v4 + 488;
  if (a2 <= 0x80)
    v5 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
  if (!a2)
    LOBYTE(v5) = 0;
  v6 = v5;
  v7 = *(_BYTE *)(*(_QWORD *)(v3 + 368) + v5);
  if (HIWORD(a3) == 256)
  {
    v8 = 0;
  }
  else
  {
    if ((a3 & 0xC0000000000) != 0x40000000000)
    {
      ((void (*)(void))((char *)&loc_191D90630 + 4
                                               * byte_191D9E9F4[*(unsigned __int8 *)(*(_QWORD *)(v3 + 360) + v6) - 3]))();
      return;
    }
    v8 = 1;
  }
  _xzm_xzone_malloc(a1, a2, (v8 + v7), 0);
}

void xzm_malloc_zone_malloc_type_calloc(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  if (a2 != 1)
  {
    if (!is_mul_ok(a2, a3) || (a3 *= a2, a3 > malloc_absolute_max_size))
    {
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return;
    }
  }
  if (a3 > 0x8000)
  {
    _xzm_malloc_large_huge(a1, a3, 0, a4, 1);
    return;
  }
  if (*(_QWORD *)(a1 + 232))
    v4 = *(_QWORD *)(a1 + 232);
  else
    v4 = a1;
  v5 = __clz(a3 - 1);
  v6 = (((a3 - 1) >> (61 - v5)) & 3) - 4 * v5 + 488;
  if (a3 <= 0x80)
    v6 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
  if (!a3)
    LOBYTE(v6) = 0;
  v7 = v6;
  v8 = *(_BYTE *)(*(_QWORD *)(v4 + 368) + v6);
  if (HIWORD(a4) == 256)
  {
    v9 = 0;
  }
  else
  {
    if ((a4 & 0xC0000000000) != 0x40000000000)
    {
      ((void (*)(void))((char *)&loc_191D9079C
                      + *((int *)&qword_191D90810[-1]
                        + *(unsigned __int8 *)(*(_QWORD *)(v4 + 360) + v7)
                        - 1)))();
      return;
    }
    v9 = 1;
  }
  _xzm_xzone_malloc(a1, a3, (v9 + v8), 1);
}

void xzm_malloc_zone_malloc_type_memalign(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  _xzm_memalign(a1, a2, a3, a4, 0);
}

void xzm_malloc_zone_malloc_type_malloc_with_options(uint64_t a1, unint64_t a2, unint64_t a3, char a4, unint64_t a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  char v10;

  if (a2)
  {
    _xzm_memalign(a1, a2, a3, a5, a4 & 1);
    return;
  }
  if (a3 > 0x8000)
  {
    _xzm_malloc_large_huge(a1, a3, 0, a5, a4 & 1);
    return;
  }
  if (*(_QWORD *)(a1 + 232))
    v5 = *(_QWORD *)(a1 + 232);
  else
    v5 = a1;
  v6 = __clz(a3 - 1);
  v7 = (((a3 - 1) >> (61 - v6)) & 3) - 4 * v6 + 488;
  if (a3 <= 0x80)
    v7 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
  if (!a3)
    LOBYTE(v7) = 0;
  v8 = v7;
  v9 = *(_BYTE *)(*(_QWORD *)(v5 + 368) + v7);
  if (HIWORD(a5) == 256)
  {
    v10 = 0;
  }
  else
  {
    if ((a5 & 0xC0000000000) != 0x40000000000)
    {
      ((void (*)(void))((char *)&loc_191D90924 + 4
                                               * byte_191D9E9F8[*(unsigned __int8 *)(*(_QWORD *)(v5 + 360) + v8) - 3]))();
      return;
    }
    v10 = 1;
  }
  _xzm_xzone_malloc(a1, a3, (v10 + v9), a4 & 1);
}

unint64_t xzm_malloc_zone_malloc_slow(uint64_t a1, unint64_t a2)
{
  return xzm_malloc_zone_malloc_type_malloc_slow(a1, a2, *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904));
}

void xzm_malloc_zone_calloc_slow(uint64_t a1, unint64_t a2, unint64_t a3)
{
  xzm_malloc_zone_malloc_type_calloc_slow(a1, a2, a3, *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904));
}

uint64_t xzm_malloc_zone_valloc_slow(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1;
  if (a2 <= 0x8000 && (*(_QWORD *)(a1 + 296) & 0x80) != 0 && *(_QWORD *)(a1 + 232))
    a1 = *(_QWORD *)(a1 + 232);
  _xzm_memalign(a1, *MEMORY[0x1E0C88820], a2, *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904), 0);
  v4 = v3;
  if (v3 && (*(_BYTE *)(v2 + 296) & 0x20) != 0)
    _platform_memset();
  return v4;
}

void xzm_malloc_zone_free_slow(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;
  unint64_t v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unsigned int v20;
  unint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  unint64_t v27;
  int is_free_slow;
  unint64_t v29;
  uint64_t v31;
  unint64_t v32;
  int v33;
  unint64_t v34;
  unsigned int v35;
  int v36;
  unint64_t v37;
  unsigned int v38;
  int v39;

  if (!a2)
    return;
  if (a2 >> 36)
    v4 = 0x4000;
  else
    v4 = a2 >> 22;
  if (v4 >> 14)
    goto LABEL_14;
  v5 = *(_QWORD *)(a1 + 232);
  if (!v5)
    v5 = a1;
  v6 = *(_QWORD *)(v5 + 408);
  if (!v6)
    goto LABEL_14;
  v7 = *(unsigned int *)(v6 + 4 * v4);
  if (!(_DWORD)v7)
    goto LABEL_14;
  v8 = v7 << 14;
  v9 = a2 - *(_QWORD *)(v8 + 48);
  if (*(_DWORD *)(v8 + 16) <= (v9 >> 14))
    goto LABEL_14;
  v10 = v9 >> 14;
  v11 = v8 + 48 * v10 + 2104;
  if ((*(_BYTE *)(v8 + 48 * v10 + 2136) & 0xF) == 4)
  {
    v34 = v11 - *(unsigned int *)(v8 + 48 * v10 + 2140);
    v35 = *(_BYTE *)(v34 + 32) & 0xF;
    if (v35 <= 8)
    {
      v36 = 1 << v35;
      if ((v36 & 0x1E8) != 0)
      {
        if (v34 + 48 * *(unsigned int *)(v34 + 40) <= v11)
          goto LABEL_12;
        goto LABEL_87;
      }
      if ((v36 & 6) != 0 && v11 == v34)
LABEL_87:
        v11 = v34;
    }
  }
LABEL_12:
  v12 = *(_BYTE *)(v11 + 32) & 0xF;
  if (v12 > 7)
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v12);
  if (((1 << v12) & 0x1B) != 0 || *(unsigned __int16 *)(v11 + 34) != *(unsigned __int16 *)(a1 + 208))
    goto LABEL_14;
  v24 = a2
      - (((0xAAAAAAAAAAAAC000 * (((v11 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
       + *(_QWORD *)((v11 & 0xFFFFFFFFFFFFC000) + 0x30));
  if (v12 == 5 || v12 == 2)
  {
    v26 = *(_QWORD *)(a1 + 216) + 88 * *(unsigned __int8 *)(v11 + 33);
    if ((*(_DWORD *)(v26 + 64) * v24) >= *(_DWORD *)(v26 + 64))
      goto LABEL_14;
    v13 = *(_QWORD *)(v26 + 48);
  }
  else
  {
    v13 = (unint64_t)*(unsigned int *)(v11 + 40) << 14;
    if (v24 % v13)
      goto LABEL_14;
  }
  if (v12 == 5)
  {
    if (((*(_DWORD *)v11 >> (v24 / v13)) & 1) == 0)
      goto LABEL_15;
LABEL_14:
    v13 = _xzm_ptr_size_outlined(a1, a2);
    goto LABEL_15;
  }
  if (v12 == 2 && *(_QWORD *)a2 == (*(_QWORD *)(a1 + 272) ^ a2))
  {
    v27 = v13;
    is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v11, a2);
    v13 = v27;
    if (is_free_slow)
      goto LABEL_14;
  }
LABEL_15:
  if (v13)
  {
    v14 = 0;
    goto LABEL_33;
  }
  if ((*(_BYTE *)(a1 + 296) & 0x80) == 0)
LABEL_94:
    xzm_malloc_zone_free_slow_cold_1(a2);
  if (*(_QWORD *)(a1 + 232))
    v14 = *(_QWORD *)(a1 + 232);
  else
    v14 = a1;
  if (v4 >> 14)
    goto LABEL_31;
  v15 = *(_QWORD *)(v14 + 232);
  if (!v15)
    v15 = v14;
  v16 = *(_QWORD *)(v15 + 408);
  if (!v16)
    goto LABEL_31;
  v17 = *(unsigned int *)(v16 + 4 * v4);
  if (!(_DWORD)v17)
    goto LABEL_31;
  v18 = v17 << 14;
  v19 = a2 - *(_QWORD *)(v18 + 48);
  if (*(_DWORD *)(v18 + 16) <= (v19 >> 14))
    goto LABEL_31;
  v20 = v19 >> 14;
  v21 = v18 + 48 * v20 + 2104;
  if ((*(_BYTE *)(v18 + 48 * v20 + 2136) & 0xF) == 4)
  {
    v37 = v21 - *(unsigned int *)(v18 + 48 * v20 + 2140);
    v38 = *(_BYTE *)(v37 + 32) & 0xF;
    if (v38 <= 8)
    {
      v39 = 1 << v38;
      if ((v39 & 0x1E8) != 0)
      {
        if (v37 + 48 * *(unsigned int *)(v37 + 40) <= v21)
          goto LABEL_29;
        goto LABEL_93;
      }
      if ((v39 & 6) != 0 && v21 == v37)
LABEL_93:
        v21 = v37;
    }
  }
LABEL_29:
  v22 = *(_BYTE *)(v21 + 32) & 0xF;
  if (v22 > 7)
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v22);
  if (((1 << v22) & 0x1B) != 0 || *(unsigned __int16 *)(v21 + 34) != *(unsigned __int16 *)(v14 + 208))
    goto LABEL_31;
  v29 = a2
      - (((0xAAAAAAAAAAAAC000 * (((v21 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
       + *(_QWORD *)((v21 & 0xFFFFFFFFFFFFC000) + 0x30));
  if (v22 == 5 || v22 == 2)
  {
    v31 = *(_QWORD *)(v14 + 216) + 88 * *(unsigned __int8 *)(v21 + 33);
    if ((*(_DWORD *)(v31 + 64) * v29) >= *(_DWORD *)(v31 + 64))
      goto LABEL_31;
    v13 = *(_QWORD *)(v31 + 48);
  }
  else
  {
    v13 = (unint64_t)*(unsigned int *)(v21 + 40) << 14;
    if (v29 % v13)
      goto LABEL_31;
  }
  if (v22 == 5)
  {
    if (((*(_DWORD *)v21 >> (v29 / v13)) & 1) == 0)
      goto LABEL_32;
LABEL_31:
    v13 = _xzm_ptr_size_outlined(v14, a2);
    goto LABEL_32;
  }
  if (v22 == 2 && *(_QWORD *)a2 == (*(_QWORD *)(v14 + 272) ^ a2))
  {
    v32 = v13;
    v33 = _xzm_xzone_tiny_chunk_block_is_free_slow(v14, v21, a2);
    v13 = v32;
    if (v33)
      goto LABEL_31;
  }
LABEL_32:
  if (!v13)
    goto LABEL_94;
LABEL_33:
  if (v13 >= 0x401 && (*(_QWORD *)(a1 + 296) & 0x20) != 0)
    _platform_memset();
  if (v14)
    v23 = v14;
  else
    v23 = a1;
  _xzm_free(v23, a2, 0);
}

void xzm_malloc_zone_realloc_slow(uint64_t a1, unint64_t a2, unint64_t a3)
{
  xzm_malloc_zone_malloc_type_realloc_slow(a1, a2, a3, *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904));
}

uint64_t xzm_malloc_zone_memalign_slow(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return xzm_malloc_zone_malloc_type_memalign_slow(a1, a2, a3, *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904));
}

void xzm_malloc_zone_free_definite_size_slow(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  unint64_t v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  unint64_t v24;
  unsigned int v25;
  unint64_t v26;
  uint64_t v28;
  unint64_t v29;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unsigned int v34;
  int v35;
  unint64_t v37;
  unsigned int v38;
  int v39;

  if (!a2)
    return;
  if (a2 >> 36)
    v6 = 0x4000;
  else
    v6 = a2 >> 22;
  if (v6 >> 14)
    goto LABEL_14;
  v7 = *(_QWORD *)(a1 + 232);
  if (!v7)
    v7 = a1;
  v8 = *(_QWORD *)(v7 + 408);
  if (!v8)
    goto LABEL_14;
  v9 = *(unsigned int *)(v8 + 4 * v6);
  if (!(_DWORD)v9)
    goto LABEL_14;
  v10 = v9 << 14;
  v11 = a2 - *(_QWORD *)(v10 + 48);
  if (*(_DWORD *)(v10 + 16) <= (v11 >> 14))
    goto LABEL_14;
  v12 = v11 >> 14;
  v13 = v10 + 48 * v12 + 2104;
  if ((*(_BYTE *)(v10 + 48 * v12 + 2136) & 0xF) == 4)
  {
    v33 = v13 - *(unsigned int *)(v10 + 48 * v12 + 2140);
    v34 = *(_BYTE *)(v33 + 32) & 0xF;
    if (v34 <= 8)
    {
      v35 = 1 << v34;
      if ((v35 & 0x1E8) != 0)
      {
        if (v33 + 48 * *(unsigned int *)(v33 + 40) <= v13)
          goto LABEL_12;
        goto LABEL_82;
      }
      if ((v35 & 6) != 0 && v13 == v33)
LABEL_82:
        v13 = v33;
    }
  }
LABEL_12:
  v14 = *(_BYTE *)(v13 + 32) & 0xF;
  if (v14 > 7)
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v14);
  if (((1 << v14) & 0x1B) != 0 || *(unsigned __int16 *)(v13 + 34) != *(unsigned __int16 *)(a1 + 208))
    goto LABEL_14;
  v26 = a2
      - (((0xAAAAAAAAAAAAC000 * (((v13 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
       + *(_QWORD *)((v13 & 0xFFFFFFFFFFFFC000) + 0x30));
  if (v14 == 5 || v14 == 2)
  {
    v28 = *(_QWORD *)(a1 + 216) + 88 * *(unsigned __int8 *)(v13 + 33);
    if ((*(_DWORD *)(v28 + 64) * v26) >= *(_DWORD *)(v28 + 64))
      goto LABEL_14;
    v15 = *(_QWORD *)(v28 + 48);
  }
  else
  {
    v15 = (unint64_t)*(unsigned int *)(v13 + 40) << 14;
    if (v26 % v15)
      goto LABEL_14;
  }
  if (v14 == 5)
  {
    if (((*(_DWORD *)v13 >> (v26 / v15)) & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (v14 == 2
    && *(_QWORD *)a2 == (*(_QWORD *)(a1 + 272) ^ a2)
    && _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v13, a2))
  {
LABEL_14:
    v15 = _xzm_ptr_size_outlined(a1, a2);
  }
LABEL_15:
  if (v15 || (*(_BYTE *)(a1 + 296) & 0x80) == 0)
  {
    v16 = 0;
    goto LABEL_18;
  }
  if (*(_QWORD *)(a1 + 232))
    v16 = *(_QWORD *)(a1 + 232);
  else
    v16 = a1;
  if (v6 >> 14)
    goto LABEL_38;
  v18 = *(_QWORD *)(v16 + 232);
  if (!v18)
    v18 = v16;
  v19 = *(_QWORD *)(v18 + 408);
  if (!v19)
    goto LABEL_38;
  v20 = *(unsigned int *)(v19 + 4 * v6);
  if (!(_DWORD)v20)
    goto LABEL_38;
  v21 = v20 << 14;
  v22 = a2 - *(_QWORD *)(v21 + 48);
  if (*(_DWORD *)(v21 + 16) <= (v22 >> 14))
    goto LABEL_38;
  v23 = v22 >> 14;
  v24 = v21 + 48 * v23 + 2104;
  if ((*(_BYTE *)(v21 + 48 * v23 + 2136) & 0xF) == 4)
  {
    v37 = v24 - *(unsigned int *)(v21 + 48 * v23 + 2140);
    v38 = *(_BYTE *)(v37 + 32) & 0xF;
    if (v38 <= 8)
    {
      v39 = 1 << v38;
      if ((v39 & 0x1E8) != 0)
      {
        if (v37 + 48 * *(unsigned int *)(v37 + 40) <= v24)
          goto LABEL_36;
        goto LABEL_92;
      }
      if ((v39 & 6) != 0 && v24 == v37)
LABEL_92:
        v24 = v37;
    }
  }
LABEL_36:
  v25 = *(_BYTE *)(v24 + 32) & 0xF;
  if (v25 > 7)
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v25);
  if (((1 << v25) & 0x1B) != 0 || *(unsigned __int16 *)(v24 + 34) != *(unsigned __int16 *)(v16 + 208))
    goto LABEL_38;
  v29 = a2
      - (((0xAAAAAAAAAAAAC000 * (((v24 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
       + *(_QWORD *)((v24 & 0xFFFFFFFFFFFFC000) + 0x30));
  if (v25 == 5 || v25 == 2)
  {
    v31 = *(_QWORD *)(v16 + 216) + 88 * *(unsigned __int8 *)(v24 + 33);
    if ((*(_DWORD *)(v31 + 64) * v29) >= *(_DWORD *)(v31 + 64))
      goto LABEL_38;
    v32 = *(_QWORD *)(v31 + 48);
  }
  else
  {
    v32 = (unint64_t)*(unsigned int *)(v24 + 40) << 14;
    if (v29 % v32)
      goto LABEL_38;
  }
  if (v25 != 5)
  {
    if (v25 != 2
      || *(_QWORD *)a2 != (*(_QWORD *)(v16 + 272) ^ a2)
      || !_xzm_xzone_tiny_chunk_block_is_free_slow(v16, v24, a2))
    {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
  if (((*(_DWORD *)v24 >> (v29 / v32)) & 1) != 0)
LABEL_38:
    _xzm_ptr_size_outlined(v16, a2);
LABEL_18:
  if (a3 >= 0x401 && (*(_QWORD *)(a1 + 296) & 0x20) != 0)
    _platform_memset();
  if (v16)
    v17 = v16;
  else
    v17 = a1;
  _xzm_free(v17, a2, 0);
}

void xzm_malloc_zone_try_free_default_slow(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;
  unint64_t v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  unint64_t v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v26;
  unint64_t v27;
  int is_free_slow;
  unint64_t v29;
  uint64_t v31;
  unint64_t v32;
  int v33;
  unint64_t v34;
  unsigned int v35;
  int v36;
  unint64_t v38;
  unsigned int v39;
  int v40;

  if (!a2)
    return;
  if (a2 >> 36)
    v4 = 0x4000;
  else
    v4 = a2 >> 22;
  if (v4 >> 14)
    goto LABEL_14;
  v5 = *(_QWORD *)(a1 + 232);
  if (!v5)
    v5 = a1;
  v6 = *(_QWORD *)(v5 + 408);
  if (!v6)
    goto LABEL_14;
  v7 = *(unsigned int *)(v6 + 4 * v4);
  if (!(_DWORD)v7)
    goto LABEL_14;
  v8 = v7 << 14;
  v9 = a2 - *(_QWORD *)(v8 + 48);
  if (*(_DWORD *)(v8 + 16) <= (v9 >> 14))
    goto LABEL_14;
  v10 = v9 >> 14;
  v11 = v8 + 48 * v10 + 2104;
  if ((*(_BYTE *)(v8 + 48 * v10 + 2136) & 0xF) == 4)
  {
    v34 = v11 - *(unsigned int *)(v8 + 48 * v10 + 2140);
    v35 = *(_BYTE *)(v34 + 32) & 0xF;
    if (v35 <= 8)
    {
      v36 = 1 << v35;
      if ((v36 & 0x1E8) != 0)
      {
        if (v34 + 48 * *(unsigned int *)(v34 + 40) <= v11)
          goto LABEL_12;
        goto LABEL_84;
      }
      if ((v36 & 6) != 0 && v11 == v34)
LABEL_84:
        v11 = v34;
    }
  }
LABEL_12:
  v12 = *(_BYTE *)(v11 + 32) & 0xF;
  if (v12 > 7)
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v12);
  if (((1 << v12) & 0x1B) != 0 || *(unsigned __int16 *)(v11 + 34) != *(unsigned __int16 *)(a1 + 208))
    goto LABEL_14;
  v24 = a2
      - *(_QWORD *)((v11 & 0xFFFFFFFFFFFFC000) + 0x30)
      - ((0xAAAAAAAAAAAAC000 * (((v11 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
  if (v12 == 5 || v12 == 2)
  {
    v26 = *(_QWORD *)(a1 + 216) + 88 * *(unsigned __int8 *)(v11 + 33);
    if ((*(_DWORD *)(v26 + 64) * v24) >= *(_DWORD *)(v26 + 64))
      goto LABEL_14;
    v13 = *(_QWORD *)(v26 + 48);
  }
  else
  {
    v13 = (unint64_t)*(unsigned int *)(v11 + 40) << 14;
    if (v24 % v13)
      goto LABEL_14;
  }
  if (v12 == 5)
  {
    if (((*(_DWORD *)v11 >> (v24 / v13)) & 1) == 0)
      goto LABEL_15;
LABEL_14:
    v13 = _xzm_ptr_size_outlined(a1, a2);
    goto LABEL_15;
  }
  if (v12 == 2 && *(_QWORD *)a2 == (*(_QWORD *)(a1 + 272) ^ a2))
  {
    v27 = v13;
    is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v11, a2);
    v13 = v27;
    if (is_free_slow)
      goto LABEL_14;
  }
LABEL_15:
  if (v13)
  {
    v14 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)(a1 + 296) & 0x80) == 0)
  {
LABEL_38:
    find_zone_and_free((void *)a2, 1u);
    return;
  }
  if (*(_QWORD *)(a1 + 232))
    v14 = *(_QWORD *)(a1 + 232);
  else
    v14 = a1;
  if (v4 >> 14)
    goto LABEL_36;
  v16 = *(_QWORD *)(v14 + 232);
  if (!v16)
    v16 = v14;
  v17 = *(_QWORD *)(v16 + 408);
  if (!v17)
    goto LABEL_36;
  v18 = *(unsigned int *)(v17 + 4 * v4);
  if (!(_DWORD)v18)
    goto LABEL_36;
  v19 = v18 << 14;
  v20 = a2 - *(_QWORD *)(v19 + 48);
  if (*(_DWORD *)(v19 + 16) <= (v20 >> 14))
    goto LABEL_36;
  v21 = v20 >> 14;
  v22 = v19 + 48 * v21 + 2104;
  if ((*(_BYTE *)(v19 + 48 * v21 + 2136) & 0xF) == 4)
  {
    v38 = v22 - *(unsigned int *)(v19 + 48 * v21 + 2140);
    v39 = *(_BYTE *)(v38 + 32) & 0xF;
    if (v39 <= 8)
    {
      v40 = 1 << v39;
      if ((v40 & 0x1E8) != 0)
      {
        if (v38 + 48 * *(unsigned int *)(v38 + 40) <= v22)
          goto LABEL_34;
        goto LABEL_94;
      }
      if ((v40 & 6) != 0 && v22 == v38)
LABEL_94:
        v22 = v38;
    }
  }
LABEL_34:
  v23 = *(_BYTE *)(v22 + 32) & 0xF;
  if (v23 > 7)
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v23);
  if (((1 << v23) & 0x1B) != 0 || *(unsigned __int16 *)(v22 + 34) != *(unsigned __int16 *)(v14 + 208))
    goto LABEL_36;
  v29 = a2
      - *(_QWORD *)((v22 & 0xFFFFFFFFFFFFC000) + 0x30)
      - ((0xAAAAAAAAAAAAC000 * (((v22 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
  if (v23 == 5 || v23 == 2)
  {
    v31 = *(_QWORD *)(v14 + 216) + 88 * *(unsigned __int8 *)(v22 + 33);
    if ((*(_DWORD *)(v31 + 64) * v29) >= *(_DWORD *)(v31 + 64))
      goto LABEL_36;
    v13 = *(_QWORD *)(v31 + 48);
  }
  else
  {
    v13 = (unint64_t)*(unsigned int *)(v22 + 40) << 14;
    if (v29 % v13)
      goto LABEL_36;
  }
  if (v23 == 5)
  {
    if (((*(_DWORD *)v22 >> (v29 / v13)) & 1) == 0)
      goto LABEL_37;
LABEL_36:
    v13 = _xzm_ptr_size_outlined(v14, a2);
    goto LABEL_37;
  }
  if (v23 == 2 && *(_QWORD *)a2 == (*(_QWORD *)(v14 + 272) ^ a2))
  {
    v32 = v13;
    v33 = _xzm_xzone_tiny_chunk_block_is_free_slow(v14, v22, a2);
    v13 = v32;
    if (v33)
      goto LABEL_36;
  }
LABEL_37:
  if (!v13)
    goto LABEL_38;
LABEL_17:
  if (v13 >= 0x401 && (*(_BYTE *)(a1 + 296) & 0x20) != 0)
    _platform_memset();
  if (v14)
    v15 = v14;
  else
    v15 = a1;
  _xzm_free(v15, a2, 1);
}

uint64_t xzm_malloc_zone_malloc_with_options_slow(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  return xzm_malloc_zone_malloc_type_malloc_with_options_slow(a1, a2, a3, a4, *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904));
}

unint64_t xzm_malloc_zone_malloc_type_malloc_slow(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  unsigned int v17;
  unint64_t v18;

  v3 = a1;
  if (a2 <= 0x8000 && (*(_QWORD *)(a1 + 296) & 0x80) != 0)
  {
    if (*(_QWORD *)(a1 + 232))
      a1 = *(_QWORD *)(a1 + 232);
    if (*(_QWORD *)(a1 + 232))
      v4 = *(_QWORD *)(a1 + 232);
    else
      v4 = a1;
    v5 = __clz(a2 - 1);
    v6 = (((a2 - 1) >> (61 - v5)) & 3) - 4 * v5 + 488;
    if (a2 <= 0x80)
      v6 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
    if (!a2)
      LOBYTE(v6) = 0;
    v7 = v6;
    v8 = *(_BYTE *)(*(_QWORD *)(v4 + 368) + v6);
    if (HIWORD(a3) == 256)
    {
      v9 = 0;
    }
    else
    {
      if ((a3 & 0xC0000000000) != 0x40000000000)
        __asm { BR              X15 }
      v9 = 1;
    }
    v17 = (v9 + v8);
LABEL_33:
    _xzm_xzone_malloc(a1, a2, v17, 0);
    goto LABEL_34;
  }
  if (a2 <= 0x8000)
  {
    if (*(_QWORD *)(a1 + 232))
      v11 = *(_QWORD *)(a1 + 232);
    else
      v11 = a1;
    v12 = __clz(a2 - 1);
    v13 = (((a2 - 1) >> (61 - v12)) & 3) - 4 * v12 + 488;
    if (a2 <= 0x80)
      v13 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
    if (!a2)
      LOBYTE(v13) = 0;
    v14 = v13;
    v15 = *(_BYTE *)(*(_QWORD *)(v11 + 368) + v13);
    if (HIWORD(a3) == 256)
    {
      v16 = 0;
    }
    else
    {
      if ((a3 & 0xC0000000000) != 0x40000000000)
        __asm { BR              X15 }
      v16 = 1;
    }
    v17 = (v16 + v15);
    goto LABEL_33;
  }
  v10 = _xzm_malloc_large_huge(a1, a2, 0, a3, 0);
LABEL_34:
  v18 = v10;
  if (v10 && (*(_BYTE *)(v3 + 296) & 0x20) != 0)
    _platform_memset();
  return v18;
}

void xzm_malloc_zone_malloc_type_calloc_slow(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;

  if (a2 != 1)
  {
    if (!is_mul_ok(a2, a3) || (a3 *= a2, a3 > malloc_absolute_max_size))
    {
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return;
    }
  }
  if (a3 <= 0x8000 && (*(_QWORD *)(a1 + 296) & 0x80) != 0)
  {
    if (*(_QWORD *)(a1 + 232))
      a1 = *(_QWORD *)(a1 + 232);
    if (*(_QWORD *)(a1 + 232))
      v4 = *(_QWORD *)(a1 + 232);
    else
      v4 = a1;
    v5 = __clz(a3 - 1);
    v6 = (((a3 - 1) >> (61 - v5)) & 3) - 4 * v5 + 488;
    if (a3 <= 0x80)
      v6 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
    if (!a3)
      LOBYTE(v6) = 0;
    v7 = v6;
    v8 = *(_BYTE *)(*(_QWORD *)(v4 + 368) + v6);
    if (HIWORD(a4) != 256)
    {
      if ((a4 & 0xC0000000000) != 0x40000000000)
      {
        ((void (*)(void))((char *)&loc_191D91B5C + dword_191D91CC4[*(unsigned __int8 *)(*(_QWORD *)(v4 + 360) + v7) - 3]))();
        return;
      }
LABEL_31:
      v13 = 1;
      goto LABEL_33;
    }
  }
  else
  {
    if (a3 > 0x8000)
    {
      _xzm_malloc_large_huge(a1, a3, 0, a4, 1);
      return;
    }
    if (*(_QWORD *)(a1 + 232))
      v9 = *(_QWORD *)(a1 + 232);
    else
      v9 = a1;
    v10 = __clz(a3 - 1);
    v11 = (((a3 - 1) >> (61 - v10)) & 3) - 4 * v10 + 488;
    if (a3 <= 0x80)
      v11 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
    if (!a3)
      LOBYTE(v11) = 0;
    v12 = v11;
    v8 = *(_BYTE *)(*(_QWORD *)(v9 + 368) + v11);
    if (HIWORD(a4) != 256)
    {
      if ((a4 & 0xC0000000000) != 0x40000000000)
      {
        ((void (*)(void))((char *)&loc_191D91C50 + dword_191D91CD4[*(unsigned __int8 *)(*(_QWORD *)(v9 + 360) + v12) - 3]))();
        return;
      }
      goto LABEL_31;
    }
  }
  v13 = 0;
LABEL_33:
  _xzm_xzone_malloc(a1, a3, (v13 + v8), 1);
}

void xzm_malloc_zone_malloc_type_realloc_slow(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int v16;
  unint64_t v17;
  unsigned int v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unsigned int v26;
  unint64_t v27;
  unsigned int v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unsigned int v35;
  unint64_t v36;
  unsigned int v37;
  unint64_t v38;
  void *v39;
  void *v40;
  size_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v54;
  uint64_t *v55;
  unint64_t v56;
  uint64_t v58;
  unint64_t v59;
  int is_free_slow;
  unint64_t v61;
  uint64_t v63;
  char v64;
  unint64_t v65;
  unsigned int v66;
  int v67;
  unint64_t v68;
  unsigned int v69;
  int v70;
  unint64_t v71;
  unsigned int v72;
  int v73;
  unint64_t v77;

  v7 = a1;
  v8 = *(_QWORD *)(a1 + 296);
  if ((v8 & 0xA0) == 0)
  {
    xzm_realloc(a1, a2, a3, a4);
    return;
  }
  if (!a2)
  {
    v43 = a3;
LABEL_72:
    xzm_malloc_zone_malloc_type_malloc_slow(a1, v43, a4);
    return;
  }
  if (!a3)
  {
    xzm_malloc_zone_free_slow(a1, a2);
    a1 = v7;
    v43 = 0;
    goto LABEL_72;
  }
  if (a2 >> 36)
    v9 = 0x4000;
  else
    v9 = a2 >> 22;
  v10 = v9 >> 14;
  if (v9 >> 14)
    goto LABEL_16;
  v11 = *(_QWORD *)(a1 + 232);
  if (!v11)
    v11 = a1;
  v12 = *(_QWORD *)(v11 + 408);
  if (!v12)
    goto LABEL_16;
  v13 = *(unsigned int *)(v12 + 4 * v9);
  if (!(_DWORD)v13)
    goto LABEL_16;
  v14 = v13 << 14;
  v15 = a2 - *(_QWORD *)(v14 + 48);
  if (*(_DWORD *)(v14 + 16) <= (v15 >> 14))
    goto LABEL_16;
  v16 = v15 >> 14;
  v17 = v14 + 48 * v16 + 2104;
  if ((*(_BYTE *)(v14 + 48 * v16 + 2136) & 0xF) == 4)
  {
    v65 = v17 - *(unsigned int *)(v14 + 48 * v16 + 2140);
    v66 = *(_BYTE *)(v65 + 32) & 0xF;
    if (v66 <= 8)
    {
      v67 = 1 << v66;
      if ((v67 & 0x1E8) != 0)
      {
        if (v65 + 48 * *(unsigned int *)(v65 + 40) <= v17)
          goto LABEL_14;
        goto LABEL_176;
      }
      if ((v67 & 6) != 0 && v17 == v65)
LABEL_176:
        v17 = v65;
    }
  }
LABEL_14:
  v18 = *(_BYTE *)(v17 + 32) & 0xF;
  if (v18 > 7)
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v18);
  if (((1 << v18) & 0x1B) != 0 || *(unsigned __int16 *)(v17 + 34) != *(unsigned __int16 *)(v7 + 208))
    goto LABEL_16;
  v52 = a2
      - *(_QWORD *)((v17 & 0xFFFFFFFFFFFFC000) + 0x30)
      - ((0xAAAAAAAAAAAAC000 * (((v17 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
  if (v18 == 5 || v18 == 2)
  {
    v54 = *(_QWORD *)(v7 + 216) + 88 * *(unsigned __int8 *)(v17 + 33);
    if ((*(_DWORD *)(v54 + 64) * v52) >= *(_DWORD *)(v54 + 64))
      goto LABEL_16;
    v19 = *(_QWORD *)(v54 + 48);
  }
  else
  {
    v19 = (unint64_t)*(unsigned int *)(v17 + 40) << 14;
    if (v52 % v19)
      goto LABEL_16;
  }
  if (v18 == 5)
  {
    if (((*(_DWORD *)v17 >> (v52 / v19)) & 1) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (v18 == 2
    && *(_QWORD *)a2 == (*(_QWORD *)(v7 + 272) ^ a2)
    && _xzm_xzone_tiny_chunk_block_is_free_slow(v7, v17, a2))
  {
LABEL_16:
    v19 = _xzm_ptr_size_outlined(v7, a2);
  }
LABEL_17:
  v20 = 0;
  if ((v8 & 0x80) == 0 || v19)
    goto LABEL_32;
  if (*(_QWORD *)(v7 + 232))
    v20 = *(_QWORD *)(v7 + 232);
  else
    v20 = v7;
  if (v10)
    goto LABEL_31;
  v21 = *(_QWORD *)(v20 + 232);
  if (!v21)
    v21 = v20;
  v22 = *(_QWORD *)(v21 + 408);
  if (!v22)
    goto LABEL_31;
  v23 = *(unsigned int *)(v22 + 4 * v9);
  if (!(_DWORD)v23)
    goto LABEL_31;
  v24 = v23 << 14;
  v25 = a2 - *(_QWORD *)(v24 + 48);
  if (*(_DWORD *)(v24 + 16) <= (v25 >> 14))
    goto LABEL_31;
  v26 = v25 >> 14;
  v27 = v24 + 48 * v26 + 2104;
  if ((*(_BYTE *)(v24 + 48 * v26 + 2136) & 0xF) == 4)
  {
    v71 = v27 - *(unsigned int *)(v24 + 48 * v26 + 2140);
    v72 = *(_BYTE *)(v71 + 32) & 0xF;
    if (v72 <= 8)
    {
      v73 = 1 << v72;
      if ((v73 & 0x1E8) != 0)
      {
        if (v71 + 48 * *(unsigned int *)(v71 + 40) <= v27)
          goto LABEL_29;
        goto LABEL_188;
      }
      if ((v73 & 6) != 0 && v27 == v71)
LABEL_188:
        v27 = v71;
    }
  }
LABEL_29:
  v28 = *(_BYTE *)(v27 + 32) & 0xF;
  if (v28 > 7)
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v28);
  if (((1 << v28) & 0x1B) != 0 || *(unsigned __int16 *)(v27 + 34) != *(unsigned __int16 *)(v20 + 208))
    goto LABEL_31;
  v61 = a2
      - *(_QWORD *)((v27 & 0xFFFFFFFFFFFFC000) + 0x30)
      - ((0xAAAAAAAAAAAAC000 * (((v27 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
  if (v28 == 5 || v28 == 2)
  {
    v63 = *(_QWORD *)(v20 + 216) + 88 * *(unsigned __int8 *)(v27 + 33);
    if ((*(_DWORD *)(v63 + 64) * v61) >= *(_DWORD *)(v63 + 64))
      goto LABEL_31;
    v19 = *(_QWORD *)(v63 + 48);
  }
  else
  {
    v19 = (unint64_t)*(unsigned int *)(v27 + 40) << 14;
    if (v61 % v19)
      goto LABEL_31;
  }
  if (v28 == 5)
  {
    if (((*(_DWORD *)v27 >> (v61 / v19)) & 1) == 0)
      goto LABEL_32;
LABEL_31:
    v19 = _xzm_ptr_size_outlined(v20, a2);
    goto LABEL_32;
  }
  if (v28 == 2
    && *(_QWORD *)a2 == (*(_QWORD *)(v20 + 272) ^ a2)
    && _xzm_xzone_tiny_chunk_block_is_free_slow(v20, v27, a2))
  {
    goto LABEL_31;
  }
LABEL_32:
  if (!v19)
    xzm_malloc_zone_malloc_type_realloc_slow_cold_1();
  if ((v8 & 0x20) != 0 && v19 > a3)
    _platform_memset();
  if ((v8 & 0x80) == 0 || a3 > 0x8000 && !v20 || a3 <= 0x8000 && v20)
  {
    if (v10)
      goto LABEL_53;
    v30 = *(_QWORD *)(v7 + 232);
    if (!v30)
      v30 = v7;
    v31 = *(_QWORD *)(v30 + 408);
    if (!v31)
      goto LABEL_53;
    v32 = *(unsigned int *)(v31 + 4 * v9);
    if (!(_DWORD)v32)
      goto LABEL_53;
    v33 = v32 << 14;
    v34 = a2 - *(_QWORD *)(v33 + 48);
    if (*(_DWORD *)(v33 + 16) <= (v34 >> 14))
      goto LABEL_53;
    v35 = v34 >> 14;
    v36 = v33 + 48 * v35 + 2104;
    if ((*(_BYTE *)(v33 + 48 * v35 + 2136) & 0xF) == 4)
    {
      v68 = v36 - *(unsigned int *)(v33 + 48 * v35 + 2140);
      v69 = *(_BYTE *)(v68 + 32) & 0xF;
      if (v69 <= 8)
      {
        v70 = 1 << v69;
        if ((v70 & 0x1E8) != 0)
        {
          if (v68 + 48 * *(unsigned int *)(v68 + 40) <= v36)
            goto LABEL_51;
          goto LABEL_182;
        }
        if ((v70 & 6) != 0 && v36 == v68)
LABEL_182:
          v36 = v68;
      }
    }
LABEL_51:
    v37 = *(_BYTE *)(v36 + 32) & 0xF;
    if (v37 > 7)
      _xzm_segment_group_segment_span_free_coalesce_cold_1(v37);
    if (((1 << v37) & 0x1B) != 0 || *(unsigned __int16 *)(v36 + 34) != *(unsigned __int16 *)(v7 + 208))
      goto LABEL_53;
    v55 = (uint64_t *)(v36 & 0xFFFFFFFFFFFFC000);
    v56 = a2
        - *(_QWORD *)((v36 & 0xFFFFFFFFFFFFC000) + 0x30)
        - ((0xAAAAAAAAAAAAC000 * (((v36 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
    if (v37 == 5 || v37 == 2)
    {
      v58 = *(_QWORD *)(v7 + 216) + 88 * *(unsigned __int8 *)(v36 + 33);
      if ((*(_DWORD *)(v58 + 64) * v56) >= *(_DWORD *)(v58 + 64))
        goto LABEL_53;
      v38 = *(_QWORD *)(v58 + 48);
    }
    else
    {
      v38 = (unint64_t)*(unsigned int *)(v36 + 40) << 14;
      if (v56 % v38)
        goto LABEL_53;
    }
    if (v37 == 5)
    {
      if (((*(_DWORD *)v36 >> (v56 / v38)) & 1) == 0)
        goto LABEL_139;
    }
    else
    {
      if (v37 != 2 || *(_QWORD *)a2 != (*(_QWORD *)(v7 + 272) ^ a2))
        goto LABEL_139;
      v77 = v36 & 0xFFFFFFFFFFFFC000;
      v59 = v36;
      is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(v7, v36, a2);
      v55 = (uint64_t *)v77;
      if (!is_free_slow)
      {
        v36 = v59;
        if (*(unsigned __int16 *)(v59 + 34) != *(unsigned __int16 *)(v7 + 208))
          xzm_realloc_cold_2(a2);
LABEL_139:
        if (a3 > 0x8000 && v38 > 0x8000)
        {
          if (a3 <= 0x200000 || v38 <= 0x200000)
          {
            if (a3 <= 0x200000 && v38 < 0x200001 && (*(_BYTE *)(v7 + 296) & 0x80) == 0)
            {
              v64 = xzm_segment_group_try_realloc_large_chunk(*v55, (uint64_t)v55, v36, (a3 + 0x3FFF) >> 14);
LABEL_149:
              v39 = (void *)a2;
              if ((v64 & 1) != 0)
              {
LABEL_61:
                if ((v8 & 0x20) != 0 && v19 < a3)
                  _platform_memset();
                if (v39 != (void *)a2)
                {
                  if ((v8 & 0x20) != 0)
                    _platform_memset();
                  if (v20)
                    v42 = v20;
                  else
                    v42 = v7;
                  _xzm_free(v42, a2, 0);
                }
                return;
              }
            }
          }
          else if ((*(_BYTE *)(v7 + 296) & 0x80) == 0)
          {
            v64 = xzm_segment_group_try_realloc_huge_chunk(*v55, v7, (unint64_t)v55, v36, (a3 + 0x3FFF) >> 14);
            goto LABEL_149;
          }
        }
LABEL_54:
        if (v38 >= a3)
        {
          v39 = (void *)a2;
          if (v38 >> 1 <= a3)
            goto LABEL_61;
        }
        xzm_malloc(v7, a3, a4, 0);
        v39 = v40;
        if (!v40)
          return;
LABEL_57:
        if (v38 >= a3)
          v41 = a3;
        else
          v41 = v38;
        memcpy(v39, (const void *)a2, v41);
        goto LABEL_61;
      }
    }
LABEL_53:
    v38 = _xzm_ptr_size_outlined(v7, a2);
    goto LABEL_54;
  }
  if (a3 > 0x8000)
  {
    v51 = _xzm_malloc_large_huge(v7, a3, 0, a4, 0);
  }
  else
  {
    if (*(_QWORD *)(v7 + 232))
      v44 = *(_QWORD *)(v7 + 232);
    else
      v44 = v7;
    if (*(_QWORD *)(v44 + 232))
      v45 = *(_QWORD *)(v44 + 232);
    else
      v45 = v44;
    v46 = __clz(a3 - 1);
    v47 = (((a3 - 1) >> (61 - v46)) & 3) - 4 * v46 + 488;
    if (a3 <= 0x80)
      v47 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
    v48 = v47;
    v49 = *(_BYTE *)(*(_QWORD *)(v45 + 368) + v47);
    if (HIWORD(a4) == 256)
    {
      v50 = 0;
    }
    else
    {
      if ((a4 & 0xC0000000000) != 0x40000000000)
        __asm { BR              X15 }
      v50 = 1;
    }
    _xzm_xzone_malloc(v44, a3, (v50 + v49), 0);
  }
  v39 = (void *)v51;
  v38 = v19;
  if (v51)
    goto LABEL_57;
}

uint64_t xzm_malloc_zone_malloc_type_memalign_slow(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a1;
  if (a3 <= 0x8000 && (*(_QWORD *)(a1 + 296) & 0x80) != 0 && *(_QWORD *)(a1 + 232))
    a1 = *(_QWORD *)(a1 + 232);
  _xzm_memalign(a1, a2, a3, a4, 0);
  v6 = v5;
  if (v5 && (*(_BYTE *)(v4 + 296) & 0x20) != 0)
    _platform_memset();
  return v6;
}

uint64_t xzm_malloc_zone_malloc_type_malloc_with_options_slow(uint64_t a1, unint64_t a2, unint64_t a3, char a4, unint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = a1;
  if (a3 <= 0x8000 && (*(_QWORD *)(a1 + 296) & 0x80) != 0 && *(_QWORD *)(a1 + 232))
    a1 = *(_QWORD *)(a1 + 232);
  xzm_malloc_zone_malloc_type_malloc_with_options(a1, a2, a3, a4, a5);
  v8 = v7;
  if ((a4 & 1) == 0 && v7 && (*(_BYTE *)(v6 + 296) & 0x20) != 0)
    _platform_memset();
  return v8;
}

BOOL has_default_zone0()
{
  return (has_injected_zone0 & 1) == 0;
}

void *find_registered_zone(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int32_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (malloc_num_zones)
  {
    if (lite_zone && (v6 = (*(uint64_t (**)(void))(lite_zone + 16))()) != 0)
    {
      if (a2)
        *a2 = v6;
      return default_zone;
    }
    else if (initial_num_zones <= a3)
    {
LABEL_11:
      v10 = (int32_t *)pFRZCounterLive;
      OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
      v11 = malloc_num_zones;
      v12 = initial_num_zones;
      if (initial_num_zones >= malloc_num_zones)
      {
LABEL_14:
        v7 = 0;
        v13 = 0;
      }
      else
      {
        while (1)
        {
          v7 = *((_QWORD *)malloc_zones + v12);
          v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, a1);
          if (v13)
            break;
          if (v11 == ++v12)
            goto LABEL_14;
        }
      }
      if (a2)
        *a2 = v13;
      OSAtomicDecrement32Barrier(v10);
    }
    else
    {
      v8 = a3;
      while (1)
      {
        v7 = *((_QWORD *)malloc_zones + v8);
        v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, a1);
        if (v9)
          break;
        if (++v8 >= (unint64_t)initial_num_zones)
          goto LABEL_11;
      }
      if (a2)
        *a2 = v9;
      if (!v8 && !has_injected_zone0)
        return default_zone;
    }
  }
  else
  {
    v7 = 0;
    if (a2)
      *a2 = 0;
  }
  return (void *)v7;
}

uint64_t malloc_gdb_po_unsafe()
{
  uint64_t v1;
  char *i;
  unsigned int (*v3)(void);

  if (off_1EE228058 && off_1EE228058())
    return 1;
  v1 = malloc_num_zones;
  if (malloc_num_zones)
  {
    for (i = (char *)malloc_zones; ; i += 8)
    {
      if (*(_DWORD *)(*(_QWORD *)i + 104) >= 5u)
      {
        v3 = *(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)i + 96) + 64);
        if (v3)
        {
          if (v3())
            break;
        }
      }
      if (!--v1)
        return 0;
    }
    return 1;
  }
  return 0;
}

uint64_t zeroify_scalable_zone(uint64_t result)
{
  if (default_zone == (_UNKNOWN *)result)
  {
    *(_QWORD *)(result + 24) = legacy_zeroing_large_malloc;
    *(_QWORD *)(result + 40) = legacy_zeroing_large_valloc;
  }
  return result;
}

uint64_t legacy_zeroing_large_malloc(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = lite_zone;
  if (a2 < 0x1FC01)
  {
    if (!lite_zone)
      v2 = *(_QWORD *)malloc_zones;
    return (*(uint64_t (**)(uint64_t, unint64_t))(v2 + 24))(v2, a2);
  }
  else
  {
    if (!lite_zone)
      v2 = *(_QWORD *)malloc_zones;
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v2 + 32))(v2, 1, a2);
  }
}

uint64_t legacy_zeroing_large_valloc(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = lite_zone;
  if (!lite_zone)
    v2 = *(_QWORD *)malloc_zones;
  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v2, a2);
  _platform_memset();
  return v3;
}

BOOL malloc_engaged_secure_allocator()
{
  return initial_xzone_zone != 0;
}

void malloc_create_legacy_default_zone()
{
  malloc_zone_t *legacy_scalable_zone;
  malloc_zone_t *v1;

  legacy_scalable_zone = (malloc_zone_t *)create_legacy_scalable_zone(0, malloc_debug_flags);
  os_unfair_lock_lock_with_options();
  v1 = *(malloc_zone_t **)malloc_zones;
  if (*(_QWORD *)(*(_QWORD *)malloc_zones + 72) && !_platform_strcmp())
    malloc_set_zone_name(v1, 0);
  malloc_set_zone_name(legacy_scalable_zone, "DefaultMallocZone");
  malloc_zone_register_while_locked((uint64_t)legacy_scalable_zone, 1);
  os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
}

void malloc_destroy_zone(malloc_zone_t *zone)
{
  malloc_set_zone_name(zone, 0);
  malloc_zone_unregister(zone);
  ((void (*)(malloc_zone_t *))zone->destroy)(zone);
}

void malloc_zone_unregister(malloc_zone_t *zone)
{
  uint64_t v2;
  size_t v3;
  uint64_t v4;
  unsigned int v5;
  int *v6;

  if (malloc_num_zones)
  {
    os_unfair_lock_lock_with_options();
    if (malloc_num_zones)
    {
      v2 = 0;
      while (*(malloc_zone_t **)((char *)malloc_zones + v2) != zone)
      {
        v2 += 8;
        if (8 * malloc_num_zones == v2)
          goto LABEL_6;
      }
      v3 = 8 * malloc_num_zones_allocated;
      mprotect(malloc_zones, v3, 3);
      v4 = malloc_num_zones - 1;
      *(_QWORD *)((char *)malloc_zones + v2) = *((_QWORD *)malloc_zones + v4);
      malloc_num_zones = v4;
      mprotect(malloc_zones, v3, 1);
      v5 = malloc_num_zones;
      if (malloc_num_zones >= initial_num_zones)
        v5 = initial_num_zones;
      if (v5 <= 1)
        v5 = 1;
      initial_num_zones = v5;
      v6 = (int *)pFRZCounterLive;
      pFRZCounterLive = (uint64_t)pFRZCounterDrain;
      pFRZCounterDrain = v6;
      OSMemoryBarrier();
      while (*pFRZCounterDrain)
        MEMORY[0x19401F804](0, 1, 1);
      os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
    }
    else
    {
LABEL_6:
      os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
      malloc_report(3u, (uint64_t)"*** malloc_zone_unregister() failed for %p\n");
    }
  }
}

void malloc_zone_check_fail(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;
  unsigned int v11;

  v4 = _simple_salloc();
  if (v4)
  {
    _simple_sprintf();
    if (!qword_1EE22C188)
      goto LABEL_13;
    _simple_sappend();
    if (_MergedGlobals >= 2)
    {
      v5 = 1;
      do
      {
        v6 = v5 + 1;
        _simple_sprintf();
        v5 = v6;
      }
      while (v6 < _MergedGlobals);
    }
    _simple_string();
    v7 = "%s\n(Use 'atos' for a symbolic stack)\n";
  }
  else
  {
    malloc_report(0x10u, (uint64_t)"*** MallocCheckHeap: FAILED check at operation #%d\n");
    if (!qword_1EE22C188)
      goto LABEL_13;
    malloc_report(0x10u, (uint64_t)"Stack for last operation where the malloc check succeeded: ");
    if (_MergedGlobals >= 2)
    {
      v8 = 1;
      do
      {
        v9 = v8 + 1;
        malloc_report(0x10u, (uint64_t)"%p ");
        v8 = v9;
      }
      while (v9 < _MergedGlobals);
    }
    v7 = "\n(Use 'atos' for a symbolic stack)\n";
  }
  malloc_report(0x10u, (uint64_t)v7);
LABEL_13:
  if (malloc_check_each >= 2)
    malloc_report(0x10u, (uint64_t)"*** Recommend using 'setenv MallocCheckHeapStart %d; setenv MallocCheckHeapEach %d' to narrow down failure\n");
  if (v4)
    _simple_sfree();
  if (malloc_check_abort)
  {
    v10 = 0;
    v11 = 211;
  }
  else
  {
    if (malloc_check_sleep < 1)
    {
      if (malloc_check_sleep < 0)
      {
        malloc_report(5u, (uint64_t)"*** Will sleep once for %d seconds to leave time to attach\n");
        v10 = -malloc_check_sleep;
        malloc_check_sleep = 0;
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      malloc_report(5u, (uint64_t)"*** Will sleep for %d seconds to leave time to attach\n");
      v10 = malloc_check_sleep;
    }
    v11 = 147;
  }
  malloc_vreport(v11, v10, a1, 0, a2);
}

void *__cdecl malloc_zone_valloc(malloc_zone_t *zone, size_t size)
{
  return (void *)_malloc_zone_valloc((uint64_t)zone, size, 0);
}

void *__cdecl valloc(size_t a1)
{
  return (void *)_malloc_zone_valloc((uint64_t)default_zone, a1, 1);
}

uint64_t malloc_claimed_address(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int32_t *v4;
  uint64_t v5;
  int v6;

  if (!malloc_num_zones)
    return 0;
  if (lite_zone && malloc_zone_claimed_address(lite_zone, a1))
    return 1;
  if (initial_num_zones)
  {
    v3 = 0;
    while (!malloc_zone_claimed_address(*((_QWORD *)malloc_zones + v3), a1))
    {
      if (++v3 >= (unint64_t)initial_num_zones)
        goto LABEL_9;
    }
    return 1;
  }
LABEL_9:
  v4 = (int32_t *)pFRZCounterLive;
  OSAtomicIncrement32Barrier((int32_t *)pFRZCounterLive);
  if (malloc_num_zones <= initial_num_zones)
  {
LABEL_13:
    v2 = 0;
  }
  else
  {
    v5 = 8 * initial_num_zones;
    v6 = malloc_num_zones - initial_num_zones;
    while (!malloc_zone_claimed_address(*(_QWORD *)((char *)malloc_zones + v5), a1))
    {
      v5 += 8;
      if (!--v6)
        goto LABEL_13;
    }
    v2 = 1;
  }
  OSAtomicDecrement32Barrier(v4);
  return v2;
}

void *reallocarrayf_DARWIN_EXTSN(void *a1, unint64_t a2, unint64_t a3)
{
  if (is_mul_ok(a2, a3))
    return reallocf(a1, a2 * a3);
  **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  return 0;
}

uint64_t malloc_zone_malloc_with_options_np(malloc_zone_t *a1, size_t a2, size_t a3, uint64_t a4)
{
  BOOL v4;
  uint64_t (*valloc)(void);

  if (a2 && ((a2 & (a2 - 1)) != 0 || ((a2 - 1) & a3) != 0))
    return 0;
  if (malloc_logger)
    v4 = 0;
  else
    v4 = malloc_slowpath == 0;
  if (!v4)
    return _malloc_zone_malloc_with_options_np_outlined(a1, a2, a3, a4);
  if (!a1 || default_zone == (_UNKNOWN *)a1)
    a1 = *(malloc_zone_t **)malloc_zones;
  if (a1->version >= 0x10 && (valloc = (uint64_t (*)(void))a1[1].valloc) != 0)
    return valloc();
  else
    return _malloc_zone_malloc_with_options_np_outlined(a1, a2, a3, a4);
}

uint64_t malloc_memory_event_handler(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if ((result & 0xF0000000) != 0 && (result & 0xFFFFFFF) == 0)
    result = _malloc_register_stack_logger(0);
  if (*((_QWORD *)&msl + 1))
    return (*((uint64_t (**)(uint64_t))&msl + 1))(v1);
  return result;
}

uint64_t malloc_register_stack_logger()
{
  return _malloc_register_stack_logger(0);
}

void malloc_zone_batch_free(malloc_zone_t *zone, void **to_be_freed, unsigned int num)
{
  uint64_t v3;
  void (__cdecl *batch_free)(_malloc_zone_t *, void **, unsigned int);
  void (__cdecl *free)(_malloc_zone_t *, void *);
  uint64_t v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;

  v3 = *(_QWORD *)&num;
  if (malloc_check_start)
    internal_check();
  if (malloc_logger)
  {
    if (!(_DWORD)v3)
    {
      batch_free = zone->batch_free;
      if (batch_free)
        goto LABEL_5;
      return;
    }
    v9 = v3;
    v10 = to_be_freed;
    do
    {
      v11 = (uint64_t)*v10++;
      malloc_logger(12, zone, v11, 0, 0, 0);
      --v9;
    }
    while (v9);
  }
  batch_free = zone->batch_free;
  if (batch_free)
  {
LABEL_5:
    ((void (*)(malloc_zone_t *, void **, uint64_t))batch_free)(zone, to_be_freed, v3);
    return;
  }
  if ((_DWORD)v3)
  {
    free = zone->free;
    do
    {
      LODWORD(v3) = v3 - 1;
      v8 = (uint64_t)*to_be_freed++;
      ((void (*)(malloc_zone_t *, uint64_t))free)(zone, v8);
    }
    while ((_DWORD)v3);
  }
}

uint64_t malloc_sanitizer_is_enabled()
{
  return malloc_sanitizer_enabled;
}

uint64_t malloc_sanitizer_get_functions()
{
  return sanitizer;
}

uint64_t malloc_sanitizer_set_functions(uint64_t result)
{
  sanitizer = result;
  return result;
}

uint64_t malloc_get_all_zones(uint64_t a1, uint64_t (*a2)(task_name_t a1, uint64_t a2, uint64_t a3, unsigned int **a4), unsigned int **a3, _DWORD *a4)
{
  uint64_t (*v6)(task_name_t, uint64_t, uint64_t, unsigned int **);
  uint64_t is_self;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v16;
  _QWORD v17[2];

  v6 = a2;
  if (!a2)
  {
    if ((_DWORD)a1)
    {
      is_self = mach_task_is_self(a1);
      if (!(_DWORD)is_self)
        nanov2_realloc_VARIANT_mp_cold_1(is_self);
    }
    v6 = (uint64_t (*)(task_name_t, uint64_t, uint64_t, unsigned int **))_malloc_default_reader_6;
  }
  v16 = 0;
  v17[0] = 0;
  v9 = v6(a1, (uint64_t)&malloc_zones, 8, (unsigned int **)v17);
  if ((_DWORD)v9)
  {
    v10 = v9;
    v11 = "*** malloc_get_all_zones: error reading zones_address at %p\n";
LABEL_11:
    malloc_report(3u, (uint64_t)v11);
    return v10;
  }
  v12 = *(_QWORD *)v17[0];
  v17[1] = *(_QWORD *)v17[0];
  v13 = v6(a1, (uint64_t)&malloc_num_zones, 4, &v16);
  if ((_DWORD)v13)
  {
    v10 = v13;
    v11 = "*** malloc_get_all_zones: error reading num_zones at %p\n";
    goto LABEL_11;
  }
  v14 = *v16;
  *a4 = v14;
  v10 = v6(a1, v12, 8 * v14, a3);
  if ((_DWORD)v10)
  {
    v11 = "*** malloc_get_all_zones: error reading zones at %p\n";
    goto LABEL_11;
  }
  return v10;
}

void malloc_zone_print_ptr_info(void *ptr)
{
  if (ptr)
  {
    if (malloc_zone_from_ptr(ptr))
      printf("ptr %p in registered zone %p\n");
    else
      printf("ptr %p not in heap\n");
  }
}

BOOLean_t malloc_zone_check(malloc_zone_t *zone)
{
  unint64_t v2;
  BOOLean_t v3;
  unint64_t v4;

  if (zone)
    return ((uint64_t (*)(void))zone->introspect->check)();
  if (!malloc_num_zones)
    return 1;
  v2 = 0;
  v3 = 1;
  do
  {
    v4 = v2 + 1;
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(*((_QWORD *)malloc_zones + v2) + 96) + 16))())
      v3 = 0;
    v2 = v4;
  }
  while (v4 < malloc_num_zones);
  return v3;
}

void malloc_zone_print(malloc_zone_t *zone, BOOLean_t verbose)
{
  unint64_t v2;
  unint64_t v3;

  if (zone)
  {
    ((void (*)(void))zone->introspect->print)();
  }
  else if (malloc_num_zones)
  {
    v2 = 0;
    do
    {
      v3 = v2 + 1;
      (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)malloc_zones + v2) + 96) + 24))();
      v2 = v3;
    }
    while (v3 < malloc_num_zones);
  }
}

void malloc_zone_log(malloc_zone_t *zone, void *address)
{
  unint64_t v2;
  unint64_t v3;

  if (zone)
  {
    ((void (*)(void))zone->introspect->log)();
  }
  else if (malloc_num_zones)
  {
    v2 = 0;
    do
    {
      v3 = v2 + 1;
      (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)malloc_zones + v2) + 96) + 32))();
      v2 = v3;
    }
    while (v3 < malloc_num_zones);
  }
}

void mag_set_thread_index(int a1)
{
  _os_cpu_number_override = (_UNKNOWN *__ptr32)a1;
  nano_common_cpu_number_override_set();
}

void (*malloc_error())()
{
  return DefaultMallocError;
}

void DefaultMallocError()
{
  if (!_simple_salloc())
  {
    malloc_report(0x10u, (uint64_t)"*** error %d\n");
    qword_1EE228008 = (uint64_t)"*** DefaultMallocError called";
    abort();
  }
  _simple_sprintf();
  _simple_string();
  malloc_report(0x10u, (uint64_t)"%s\n");
  qword_1EE228008 = _simple_string();
  abort();
}

void _malloc_fork_child()
{
  void (*v1)(void);
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (_malloc_entropy_initialized == 1 && initial_nano_zone != 0)
    nanov2_forked_zone((_QWORD *)initial_nano_zone);
  v1 = (void (*)(void))*((_QWORD *)&xmmword_1EE228068 + 1);
  if (initial_xzone_zone)
    xzm_force_reinit_lock_global_state(initial_xzone_zone);
  if (v1)
    v1();
  if (malloc_num_zones)
  {
    v2 = 0;
    do
    {
      v3 = v2 + 1;
      v4 = *((_QWORD *)malloc_zones + v2);
      if (*(_DWORD *)(v4 + 104) >= 9u)
        v5 = 104;
      else
        v5 = 48;
      (*(void (**)(void))(*(_QWORD *)(v4 + 96) + v5))();
      v2 = v3;
    }
    while (v3 < malloc_num_zones);
  }
  mfm_reinit_lock();
  _malloc_lock = 0;
}

mstats *mstats(mstats *__return_ptr retstr)
{
  mstats *result;
  size_t blocks_in_use;
  size_t size_allocated;
  size_t size_in_use;
  malloc_statistics_t v6;

  memset(&v6, 0, sizeof(v6));
  malloc_zone_statistics(0, &v6);
  blocks_in_use = v6.blocks_in_use;
  size_allocated = v6.size_allocated;
  size_in_use = v6.size_in_use;
  retstr->bytes_total = v6.size_allocated;
  retstr->chunks_used = blocks_in_use;
  retstr->bytes_used = size_in_use;
  retstr->chunks_free = 0;
  retstr->bytes_free = size_allocated - size_in_use;
  return result;
}

BOOLean_t malloc_zone_enable_discharge_checking(malloc_zone_t *zone)
{
  uint64_t (*enable_discharge_checking)(void);

  if (zone->version >= 7
    && (enable_discharge_checking = (uint64_t (*)(void))zone->introspect->enable_discharge_checking) != 0)
  {
    return enable_discharge_checking();
  }
  else
  {
    return 0;
  }
}

void malloc_zone_disable_discharge_checking(malloc_zone_t *zone)
{
  void (*disable_discharge_checking)(void);

  if (zone->version >= 7)
  {
    disable_discharge_checking = (void (*)(void))zone->introspect->disable_discharge_checking;
    if (disable_discharge_checking)
      disable_discharge_checking();
  }
}

void malloc_zone_discharge(malloc_zone_t *zone, void *memory)
{
  void (*discharge)(void);

  if ((zone || (zone = malloc_zone_from_ptr(memory)) != 0) && zone->version >= 7)
  {
    discharge = (void (*)(void))zone->introspect->discharge;
    if (discharge)
      discharge();
  }
}

void malloc_zone_enumerate_discharged_pointers(malloc_zone_t *zone, void *report_discharged)
{
  void (*enumerate_discharged_pointers)(void);
  unint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void (*v7)(void);

  if (zone)
  {
    if (zone->version >= 7)
    {
      enumerate_discharged_pointers = (void (*)(void))zone->introspect->enumerate_discharged_pointers;
      if (enumerate_discharged_pointers)
        enumerate_discharged_pointers();
    }
  }
  else
  {
    v3 = malloc_num_zones;
    if (malloc_num_zones)
    {
      v4 = 0;
      v5 = malloc_zones;
      do
      {
        v6 = v5[v4];
        if (*(_DWORD *)(v6 + 104) >= 7u)
        {
          v7 = *(void (**)(void))(*(_QWORD *)(v6 + 96) + 96);
          if (v7)
          {
            v7();
            v5 = malloc_zones;
            v3 = malloc_num_zones;
          }
        }
        ++v4;
      }
      while (v4 < v3);
    }
  }
}

void malloc_zero_on_free_disable()
{
  malloc_zero_policy = 1;
}

uint64_t malloc_variant_is_debug_4test()
{
  return 0;
}

void set_malloc_singlethreaded()
{
  if ((set_malloc_singlethreaded_warned & 1) == 0)
    set_malloc_singlethreaded_warned = 1;
}

void malloc_singlethreaded()
{
  if ((malloc_singlethreaded_warned & 1) == 0)
  {
    malloc_report(3u, (uint64_t)"*** OBSOLETE: malloc_singlethreaded()\n");
    malloc_singlethreaded_warned = 1;
  }
}

uint64_t malloc_debug()
{
  malloc_report(3u, (uint64_t)"*** OBSOLETE: malloc_debug()\n");
  return 0;
}

uint64_t malloc_get_thread_options()
{
  return *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 896);
}

uint64_t malloc_set_thread_options(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t result;
  uint64_t v4;

  v1 = a1;
  v4 = a1;
  v2 = a1;
  if ((a1 & 1) != 0)
  {
    v2 = a1 | 6;
    LOBYTE(v4) = a1 | 6;
    v1 = v4;
  }
  result = pgm_thread_set_disabled((v2 >> 1) & 1);
  *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 896) = v1;
  return result;
}

uint64_t _malloc_register_stack_logger(int a1)
{
  BOOL v1;
  uint64_t result;

  if (malloc_sanitizer_enabled)
    v1 = a1 == 0;
  else
    v1 = 0;
  if (!v1)
  {
    if (*((_QWORD *)&msl + 1))
      return 1;
    if (_dlopen)
    {
      result = _dlopen("/System/Library/PrivateFrameworks/MallocStackLogging.framework/MallocStackLogging", 8);
      if (!result)
        return result;
      if (_register_msl_dylib_pred != -1)
        _os_once();
      if (*((_QWORD *)&msl + 1))
        return 1;
      malloc_report(4u, (uint64_t)"failed to load MallocStackLogging.framework\n");
    }
  }
  return 0;
}

uint64_t turn_on_stack_logging(uint64_t a1)
{
  _malloc_register_stack_logger(0);
  if (off_1EE228088)
    return off_1EE228088(a1);
  else
    return 0;
}

uint64_t (*turn_off_stack_logging())(void)
{
  uint64_t (*result)(void);

  _malloc_register_stack_logger(0);
  result = off_1EE228090;
  if (off_1EE228090)
    return (uint64_t (*)(void))off_1EE228090();
  return result;
}

uint64_t default_zone_malloc()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t default_zone_calloc()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t default_zone_destroy()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(v0 + 64))();
}

uint64_t default_zone_batch_free()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t default_zone_pressure_relief()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t default_zone_ptr_in_use_enumerator()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (**(uint64_t (***)(void))(v0 + 96))();
}

uint64_t default_zone_check()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 96) + 16))();
}

uint64_t default_zone_print()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 96) + 24))();
}

uint64_t default_zone_log()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 96) + 32))();
}

uint64_t default_zone_force_lock()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 96) + 40))();
}

uint64_t default_zone_force_unlock()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 96) + 48))();
}

uint64_t default_zone_statistics()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 96) + 56))();
}

uint64_t default_zone_locked()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 96) + 64))();
}

uint64_t default_zone_reinit_lock()
{
  uint64_t v0;

  v0 = lite_zone;
  if (!lite_zone)
    v0 = *(_QWORD *)malloc_zones;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 96) + 104))();
}

uint64_t (*register_msl_dylib(uint64_t (*result)(uint64_t (**)(), uint64_t)))(uint64_t (**)(), uint64_t)
{
  uint64_t (*v1)(uint64_t (**)(), uint64_t);

  if (result)
  {
    v1 = result;
    *((_QWORD *)&msl + 1) = _dlsym(result, "msl_handle_memory_event");
    off_1EE228058 = (uint64_t (*)(void))_dlsym(v1, "msl_stack_logging_locked");
    off_1EE228060 = (_UNKNOWN *)_dlsym(v1, "msl_fork_prepare");
    *((_QWORD *)&xmmword_1EE228068 + 1) = _dlsym(v1, "msl_fork_child");
    *(_QWORD *)&xmmword_1EE228068 = _dlsym(v1, "msl_fork_parent");
    off_1EE228088 = (_UNKNOWN *)_dlsym(v1, "msl_turn_on_stack_logging");
    off_1EE228090 = (_UNKNOWN *)_dlsym(v1, "msl_turn_off_stack_logging");
    *(_QWORD *)&xmmword_1EE228078 = _dlsym(v1, "msl_set_flags_from_environment");
    *((_QWORD *)&xmmword_1EE228078 + 1) = _dlsym(v1, "msl_initialize");
    result = (uint64_t (*)(uint64_t (**)(), uint64_t))_dlsym(v1, "msl_copy_msl_lite_hooks");
    if (result)
      return (uint64_t (*)(uint64_t (**)(), uint64_t))set_msl_lite_hooks(result);
  }
  return result;
}

_DWORD *malloc_freezedry()
{
  _DWORD *v0;
  size_t v1;
  uint64_t v2;
  unint64_t v3;
  int v4;
  char *v5;

  v0 = j__malloc(0x10uLL);
  v1 = malloc_num_zones;
  *v0 = 6;
  v0[1] = v1;
  *((_QWORD *)v0 + 1) = j__calloc(v1, 0x5000uLL);
  if (malloc_num_zones)
  {
    v2 = 0;
    v3 = 0;
    while (1)
    {
      v4 = _platform_strcmp();
      v5 = (char *)*((_QWORD *)v0 + 1);
      if (v4)
        break;
      memcpy(&v5[v2], *((const void **)malloc_zones + v3++), 0x5000uLL);
      v2 += 20480;
      if (v3 >= malloc_num_zones)
        return v0;
    }
    _free(v5);
    _free(v0);
    return 0;
  }
  return v0;
}

uint64_t malloc_jumpstart(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  malloc_zone_t *v4;

  if (*(_DWORD *)a1 != 6)
    return 1;
  if (*(_DWORD *)(a1 + 4))
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = (malloc_zone_t *)(*(_QWORD *)(a1 + 8) + v2);
      v4->size = (size_t (__cdecl *)(_malloc_zone_t *, const void *))szone_size;
      v4->malloc = (void *(__cdecl *)(_malloc_zone_t *, size_t))frozen_malloc;
      v4->calloc = (void *(__cdecl *)(_malloc_zone_t *, size_t, size_t))frozen_calloc;
      v4->valloc = (void *(__cdecl *)(_malloc_zone_t *, size_t))frozen_valloc;
      v4->free = (void (__cdecl *)(_malloc_zone_t *, void *))frozen_free;
      v4->realloc = (void *(__cdecl *)(_malloc_zone_t *, void *, size_t))frozen_realloc;
      v4->destroy = (void (__cdecl *)(_malloc_zone_t *))frozen_destroy;
      v4->introspect = (malloc_introspection_t *)&szone_introspect;
      malloc_zone_register(v4);
      ++v3;
      v2 += 20480;
    }
    while (v3 < *(unsigned int *)(a1 + 4));
  }
  return 0;
}

void *frozen_malloc(int a1, size_t __size)
{
  return j__malloc(__size);
}

void *frozen_calloc(int a1, size_t __count, size_t __size)
{
  return j__calloc(__count, __size);
}

void *frozen_valloc(int a1, size_t a2)
{
  return j__valloc(a2);
}

void *frozen_realloc(uint64_t a1, const void *a2, size_t a3)
{
  unint64_t v5;
  size_t v6;
  void *v7;
  void *v8;

  v5 = szone_size(a1, (unint64_t)a2);
  if (v5 >= a3)
    return (void *)a2;
  v6 = v5;
  v7 = j__malloc(a3);
  v8 = v7;
  if (v6)
    memcpy(v7, a2, v6);
  return v8;
}

void tiny_print_region_free_list(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;
  const void *v4;
  int v5;
  const void *v6;

  v2 = *(unsigned __int16 *)((a1 & 0xFFFFFFFFFFF00000) + 4 * a2 + 0x3F28);
  v3 = a1 & 0xFFFFFFFFFFF00000 | 0x4080;
  v4 = (const void *)((16 * v2 - 16) + v3);
  if (!*(_WORD *)((a1 & 0xFFFFFFFFFFF00000) + 4 * a2 + 0x3F28))
    v4 = 0;
  v5 = *(unsigned __int16 *)((a1 & 0xFFFFFFFFFFF00000) + 4 * a2 + 0x3F2A);
  v6 = (const void *)((16 * v5 - 16) + v3);
  if (!*(_WORD *)((a1 & 0xFFFFFFFFFFF00000) + 4 * a2 + 0x3F2A))
    v6 = 0;
  malloc_printf("For region %p, first block: %d (%p), last block: %d (%p)\n", (const void *)(a1 & 0xFFFFFFFFFFF00000), v2, v4, v5, v6);
}

uint64_t get_tiny_meta_header(uint64_t a1, _DWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  unsigned int *v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  int v11;
  uint64_t v12;

  v2 = a1 & 0xFFFFFFFFFFF00000 | 0x28;
  v3 = a1 & 0xFFFFFFFFFFF00000 | 0x4080;
  v4 = a1 - v3;
  v5 = ((a1 - v3) >> 8) & 0xFFE;
  v6 = 1 << ((a1 - v3) >> 4);
  *a2 = 0;
  v7 = (unsigned int *)(v2 + 4 * v5);
  v8 = *v7;
  if ((v8 & v6) == 0)
    return 0;
  if ((*(_DWORD *)(v2 + 4 * (v5 | 1)) & v6) != 0)
  {
    v9 = (v4 >> 4) & 0x1F;
    v10 = ((unint64_t)v7[2] << (32 - v9)) | (v8 >> ((v4 >> 4) & 0x1F));
    if (v9)
      v10 |= (unint64_t)v7[4] << -(char)v9;
    v11 = __clz(__rbit64(v10 >> 1));
    if (v10 >= 2)
      return (v11 + 1);
    else
      return 0;
  }
  else
  {
    v12 = 1;
    *a2 = 1;
    if (a1 + 16 < v3 + 1032064)
    {
      if (((*(_DWORD *)(((a1 + 16) & 0xFFFFFFFFFFF00000 | ((((a1 + 16) & 0xFFFFFuLL) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)a1 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        return 1;
      else
        return *(unsigned __int16 *)(a1 + 16);
    }
  }
  return v12;
}

uint64_t tiny_free_scan_madvise_free(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3)
{
  _DWORD *v6;
  uint64_t result;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  int v20;
  unsigned int *v21;
  unint64_t v22;
  unsigned int v23;
  unint64_t v24;
  unint64_t v25;
  unsigned int v26;
  unint64_t v27;
  unint64_t v28;
  BOOL v29;
  unint64_t v30;
  char *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  unsigned __int8 *v37;
  uint64_t v38;
  int v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C874D8];
  v6 = (_DWORD *)MEMORY[0x1E0C88800];
  result = MEMORY[0x1E0C86820]();
  v12 = (char *)v40 - v11;
  if (v8 <= 0xFFFFFFFFFFF0407FLL)
  {
    LODWORD(v13) = 0;
    v14 = *MEMORY[0x1E0C887F8];
    v15 = ~*MEMORY[0x1E0C887F8];
    result = 32;
    v16 = v8;
    do
    {
      v17 = v16 & 0xFFFFFFFFFFF00000 | 0x28;
      v18 = v16 & 0xFFFFFFFFFFF00000 | 0x4080;
      v19 = ((v16 - v18) >> 8) & 0xFFE;
      v20 = 1 << ((v16 - v18) >> 4);
      v21 = (unsigned int *)(v17 + 4 * v19);
      v22 = *v21;
      if ((v22 & v20) == 0)
        break;
      if ((*(_DWORD *)(v17 + 4 * (v19 | 1)) & v20) != 0)
      {
        v23 = ((v16 - v18) >> 4) & 0x1F;
        v24 = ((unint64_t)v21[2] << (32 - v23)) | (v22 >> v23);
        if (v23)
          v24 |= (unint64_t)v21[4] << -(char)v23;
        if (v24 < 2)
          break;
        v25 = 16 * __clz(__rbit64(v24 >> 1)) + 16;
      }
      else
      {
        if (v16 + 16 >= v18 + v10
          || ((*(_DWORD *)(((v16 + 16) & 0xFFFFFFFFFFF00000 | ((((v16 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v16 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          v26 = 1;
        }
        else
        {
          v26 = *(unsigned __int16 *)(v16 + 16);
          if (v16 == v8 && !*(_WORD *)(v16 + 16))
          {
            v32 = (v8 + v14 + 18) & v15;
            v33 = (v8 + 1048574) & v15;
            v29 = v33 > v32;
            v34 = v33 - v32;
            if (v29)
            {
              v35 = (v32 - v8) >> v9;
              v36 = &v12[2 * (int)v13];
              *v36 = v35;
              v36[1] = v34 >> v9;
              LODWORD(v13) = v13 + 1;
            }
            break;
          }
          if (!*(_WORD *)(v16 + 16))
            break;
        }
        v27 = (v16 + v14 + 18) & v15;
        v25 = 16 * v26;
        v28 = (v16 + v25 - 2) & v15;
        v29 = v28 > v27;
        v30 = v28 - v27;
        if (v29)
        {
          v31 = &v12[2 * (int)v13];
          *v31 = (v27 - a3) >> v9;
          v31[1] = v30 >> v9;
          LODWORD(v13) = v13 + 1;
        }
      }
      v16 += v25;
    }
    while (v16 < v8 + v10);
    if ((int)v13 >= 1)
    {
      OSAtomicIncrement32Barrier((int32_t *)(a3 + 28));
      os_unfair_lock_unlock(a2);
      v13 = v13;
      v37 = (unsigned __int8 *)(v12 + 1);
      do
      {
        v38 = a3 + (*(v37 - 1) << *v6);
        v39 = *v37;
        v37 += 2;
        mvm_madvise_free(a1, a3, v38, v38 + (v39 << *v6), 0, *(_DWORD *)(a1 + 620) & 0x20);
        --v13;
      }
      while (v13);
      os_unfair_lock_lock_with_options();
      return OSAtomicDecrement32Barrier((int32_t *)(a3 + 28));
    }
  }
  return result;
}

void tiny_check_region(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int *v15;
  unint64_t v16;
  int v17;
  unint64_t v18;
  int v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  int v24;
  unsigned int *v25;
  unint64_t v26;
  unsigned int v27;
  unint64_t v28;
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  int v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  uint64_t v48;
  unint64_t v49;
  const char *v50;
  int tiny_meta_header;
  uint64_t v52;
  uint64_t v53;
  int v54;

  v2 = *(_DWORD *)(a2 + 24);
  v3 = *(_QWORD *)(a1 + 624);
  if (!*(_DWORD *)(a2 + 28))
    return;
  v6 = a2 + 16512;
  if (*(_QWORD *)(v3 + 2560 * v2 + 2144) == a2)
  {
    v9 = *(_QWORD *)(v3 + 2560 * v2 + 2136);
    v8 = v9 + v6;
    if (v9)
    {
      v10 = (v8 - 16) & 0xFFFFFFFFFFF00000;
      v11 = v10 | 0x28;
      v12 = v8 - 16 - (v10 | 0x4080);
      v13 = (v12 >> 8) & 0xFFE;
      v14 = 1 << (v12 >> 4);
      v15 = (unsigned int *)((v10 | 0x28) + 4 * v13);
      v16 = *v15;
      if ((v16 & v14) == 0 || (*(_DWORD *)(v11 + 4 * (v13 | 1)) & v14) == 0)
        goto LABEL_54;
      v17 = (v12 >> 4) & 0x1F;
      v18 = ((unint64_t)v15[2] << (32 - v17)) | (v16 >> ((v12 >> 4) & 0x1F));
      if (v17)
        v18 |= (unint64_t)v15[4] << -(char)v17;
      v19 = __clz(__rbit64(v18 >> 1));
      v20 = v18 >= 2 ? v19 + 1 : 0;
      if (v20 != 1)
      {
LABEL_54:
        v50 = "%ld, counter=%d\n*** invariant broken for leader block %p - %d %d\n";
        goto LABEL_55;
      }
    }
    v53 = *(_QWORD *)(v3 + 2560 * v2 + 2144);
    v7 = a2 + 0x100000 - *(_QWORD *)(v3 + 2560 * v2 + 2128);
  }
  else
  {
    v53 = *(_QWORD *)(v3 + 2560 * v2 + 2144);
    v7 = a2 + 0x100000;
    v8 = a2 + 16512;
  }
  if (v8 >= v7)
  {
    v31 = 0;
LABEL_43:
    v54 = v31;
    if (v8 == v7)
    {
LABEL_44:
      if (v53 != a2)
        return;
      if (!*(_QWORD *)(v3 + 2560 * v2 + 2128))
        return;
      tiny_meta_header = get_tiny_meta_header(v7, &v54);
      if (!v54 && tiny_meta_header == 1)
        return;
      v50 = "%ld, counter=%d\n*** invariant broken for blocker block %p - %d %d\n";
    }
    else
    {
      v50 = "%ld, counter=%d\n*** invariant broken for region end %p - %p\n";
    }
LABEL_55:
    malloc_zone_check_fail((uint64_t)"*** check: incorrect tiny region ", (uint64_t)v50);
    return;
  }
  while (1)
  {
    v21 = v8 & 0xFFFFFFFFFFF00000 | 0x28;
    v22 = v8 & 0xFFFFFFFFFFF00000 | 0x4080;
    v23 = ((v8 - v22) >> 8) & 0xFFE;
    v24 = 1 << ((v8 - v22) >> 4);
    v25 = (unsigned int *)(v21 + 4 * v23);
    v26 = *v25;
    if ((v26 & v24) == 0)
    {
LABEL_41:
      v50 = "%ld, counter=%d\n*** invariant broken for tiny block %p this msize=%d - size is too small\n";
      goto LABEL_55;
    }
    if ((*(_DWORD *)(v21 + 4 * (v23 | 1)) & v24) != 0)
    {
      v27 = ((v8 - v22) >> 4) & 0x1F;
      v28 = ((unint64_t)v25[2] << (32 - v27)) | (v26 >> v27);
      if (v27)
        v28 |= (unint64_t)v25[4] << -(char)v27;
      if (v28 < 2)
        goto LABEL_41;
      v29 = __clz(__rbit64(v28 >> 1));
      v30 = v29 + 1;
      if (v29 == 63)
      {
        v50 = "%ld, counter=%d\n*** invariant broken for %p this tiny msize=%d - size is too large\n";
        goto LABEL_55;
      }
      v31 = 0;
      v8 += (16 * v30);
      goto LABEL_36;
    }
    if (v8 + 16 >= v22 + 1032064
      || ((*(_DWORD *)(((v8 + 16) & 0xFFFFFFFFFFF00000 | ((((v8 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> (((((_DWORD)v8 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
    {
      v32 = 1;
    }
    else
    {
      v32 = *(unsigned __int16 *)(v8 + 16);
      if (!*(_WORD *)(v8 + 16) && v8 == v6)
        return;
      if (!*(_WORD *)(v8 + 16))
        goto LABEL_41;
    }
    v33 = __ROR8__(*(_QWORD *)v8, 60);
    v34 = v33 & 0xFFFFFFFFFFFFFFF0;
    v35 = *(_QWORD *)(a1 + 632);
    v36 = v33 & 0xFFFFFFFFFFFFFFF0 ^ v35;
    if (((v33 ^ (HIDWORD(v36)
                              + (_DWORD)v36
                              + ((HIDWORD(v36) + v36) >> 16)
                              + ((HIDWORD(v36) + (_DWORD)v36 + ((HIDWORD(v36) + v36) >> 16)) >> 8))) & 0xFLL) != 0)
    {
      v52 = a1;
      goto LABEL_63;
    }
    v37 = __ROR8__(*(_QWORD *)(v8 + 8), 60);
    v38 = v37 & 0xFFFFFFFFFFFFFFF0;
    v39 = v37 & 0xFFFFFFFFFFFFFFF0 ^ v35;
    if (((v37 ^ (HIDWORD(v39)
                              + (_DWORD)v39
                              + ((HIDWORD(v39) + v39) >> 16)
                              + ((HIDWORD(v39) + (_DWORD)v39 + ((HIDWORD(v39) + v39) >> 16)) >> 8))) & 0xFLL) != 0)
      break;
    if (v34)
    {
      v40 = v33 & 0xFFFFFFFFFFF00000;
      v41 = v34 - v40 - 16512;
      v42 = (v41 >> 8) & 0xFFE;
      v43 = 1 << (v41 >> 4);
      if ((*(_DWORD *)((v40 & 0xFFFFFFFFFFFFC007 | (8 * ((v42 >> 1) & 0x7FF))) + 0x28) & v43) == 0
        || (*(_DWORD *)(v40 + 4 * v42 + 44) & v43) != 0)
      {
        v50 = "%ld, counter=%d\n*** invariant broken for %p (previous %p is not a free pointer)\n";
        goto LABEL_55;
      }
    }
    if (v38)
    {
      v44 = v37 & 0xFFFFFFFFFFF00000;
      v45 = v38 - (v37 & 0xFFFFFFFFFFF00000) - 16512;
      v46 = (v45 >> 8) & 0xFFE;
      v47 = 1 << (v45 >> 4);
      if ((*(_DWORD *)((v44 & 0xFFFFFFFFFFFFC007 | (8 * ((v46 >> 1) & 0x7FF))) + 0x28) & v47) == 0
        || (*(_DWORD *)(v44 + 4 * v46 + 44) & v47) != 0)
      {
        v50 = "%ld, counter=%d\n*** invariant broken for %p (next in free list %p is not a free pointer)\n";
        goto LABEL_55;
      }
    }
    v48 = (16 * v32);
    v49 = v8 + v48;
    if (v7 == v8 + v48)
    {
      v54 = 1;
      goto LABEL_44;
    }
    if (get_tiny_previous_free_msize(v8 + v48) != v32)
    {
      v50 = "%ld, counter=%d\n"
            "*** invariant broken for tiny free %p followed by %p in region %p [%p-%p] (end marker incorrect) should be %d; in fact %d\n";
      goto LABEL_55;
    }
    v31 = 1;
    v8 = v49;
LABEL_36:
    if (v8 >= v7)
      goto LABEL_43;
  }
  v52 = a1;
LABEL_63:
  free_list_checksum_botch(v52);
  __break(1u);
}

uint64_t tiny_in_use_enumerator()
{
  uint64_t v0;
  void (*v1)(_QWORD, _QWORD, _QWORD, _QWORD);
  void (*v2)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _WORD *v28;
  unsigned int v29;
  int v30;
  unsigned __int16 v31;
  int v32;
  _QWORD *v33;
  char v34;
  int v35;
  uint64_t v36;
  void (*v37)(_QWORD, _QWORD, _QWORD, _QWORD);
  unsigned int *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _OWORD v48[256];
  uint64_t v49;

  v0 = MEMORY[0x1E0C86820]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v49 = *MEMORY[0x1E0C874D8];
  v46 = 0;
  v47 = 0;
  v44 = 0;
  v45 = 0;
  v42 = 0;
  v43 = 0;
  v40 = 0;
  v41 = 0;
  result = v3(v0, *(_QWORD *)(v5 + 16536), 32, (uint64_t *)&v40);
  if (!(_DWORD)result)
  {
    v39 = *v40;
    result = v4(v11, v40[2], 8 * *v40, &v47);
    if (!(_DWORD)result)
    {
      if ((v8 & 1) == 0
        || (result = v4(v11, *(_QWORD *)(v6 + 17136), 2560 * *(int *)(v6 + 17120), &v41), !(_DWORD)result))
      {
        if (v39)
        {
          v13 = 0;
          v34 = v8;
          v35 = v8 & 6;
          v37 = v2;
          v38 = (unsigned int *)(v6 + 17120);
          v36 = v10;
          while (1)
          {
            v14 = *(_QWORD *)(v47 + 8 * v13);
            if ((unint64_t)(v14 + 1) >= 2)
            {
              if ((v8 & 4) != 0)
              {
                v45 = *(_QWORD *)(v47 + 8 * v13);
                v46 = 16420;
                ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))v2)(v11, v10, 4, &v45, 1);
              }
              v15 = v14 + 16512;
              if (v35)
              {
                v43 = v14 + 16512;
                v44 = 1032064;
                ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))v2)(v11, v10, 2, &v43, 1);
              }
              if ((v8 & 1) != 0)
                break;
            }
LABEL_9:
            result = 0;
            if (++v13 == v39)
              return result;
          }
          result = v4(v11, v14, 0x100000, &v42);
          if (!(_DWORD)result)
          {
            v16 = *v38;
            if ((int)v16 < 1)
            {
              v17 = 0;
            }
            else
            {
              v17 = 0;
              v18 = (_QWORD *)(v41 + 24);
              do
              {
                if (v14 == *v18)
                  ++v17;
                v18 += 320;
                --v16;
              }
              while (v16);
            }
            v19 = *(_DWORD *)(v42 + 24);
            if (v14 == *(_QWORD *)(v41 + 2560 * v19 + 2144))
            {
              v22 = v41 + 2560 * v19;
              v20 = *(_QWORD *)(v22 + 2136) >> 4;
              v21 = 64504 - (*(_QWORD *)(v22 + 2128) >> 4);
              if (v21 <= v20)
                goto LABEL_9;
            }
            else
            {
              LODWORD(v20) = 0;
              v21 = 64504;
            }
            v23 = 0;
            v24 = v42 + 40;
            v25 = v42 + 44;
            while (1)
            {
              v26 = (16 * v20);
              if (((*(_DWORD *)(v25 + 4 * ((v20 >> 4) & 0xFFE)) >> v20) & 1) != 0)
                break;
              if (((*(_DWORD *)(v24 + 4 * (((v20 + 1) >> 4) & 0xFFE)) >> (v20 + 1)) & 1) == 0)
              {
                v31 = *(_WORD *)(v42 + v26 + 16528);
LABEL_41:
                if (!v31)
                  return 5;
                goto LABEL_42;
              }
              v31 = 1;
LABEL_42:
              LODWORD(v20) = v20 + v31;
              if (v20 >= v21)
              {
                v10 = v36;
                v2 = v37;
                v8 = v34;
                if (v23)
                  v37(v11, v36, 1, v48);
                goto LABEL_9;
              }
            }
            if (v17)
            {
              v27 = *v38;
              if ((int)v27 >= 1)
              {
                v28 = (_WORD *)(v41 + 16);
                while (v15 + v26 != *((_QWORD *)v28 - 1))
                {
                  v28 += 1280;
                  if (!--v27)
                    goto LABEL_34;
                }
                v31 = *v28;
                if (!*v28)
                  return 5;
                --v17;
                goto LABEL_42;
              }
            }
LABEL_34:
            v29 = v20 + 1;
            v30 = 1;
            do
            {
              v31 = v30++;
              v32 = *(_DWORD *)(v24 + 4 * ((v29 >> 4) & 0xFFE)) >> v29;
              ++v29;
            }
            while ((v32 & 1) == 0);
            v33 = &v48[v23];
            *v33 = v26 + v15;
            v33[1] = 16 * v31;
            if (++v23 >= 0x100)
            {
              v37(v11, v36, 1, v48);
              v23 = 0;
            }
            goto LABEL_41;
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

void free_tiny_botch(uint64_t a1)
{
  malloc_zone_error(*(_DWORD *)(a1 + 620), 1, (uint64_t)"Double free of object %p\n");
}

void tiny_batch_free(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5;
  os_unfair_lock_s *v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int i;
  unsigned int v20;
  unsigned int v21;
  int v22;
  unsigned int *v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;

  if (!a3)
    return;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v30 = a1 + 16512;
  v8 = -1;
  v9 = a3;
  while (1)
  {
    v10 = *(_QWORD *)(a2 + 8 * v5);
    if (!v10)
      goto LABEL_35;
    v11 = v10 & 0xFFFFFFFFFFF00000;
    if (!v7 || v7 != v11)
      break;
LABEL_21:
    if ((((_DWORD)v10 + 1032064) & 0xFFF80u) > 0xFBF70uLL)
      goto LABEL_36;
    v20 = v10 - v11 - 16512;
    v21 = (v20 >> 8) & 0xFFE;
    v22 = 1 << (v20 >> 4);
    v23 = (unsigned int *)(v11 + 40 + 4 * v21);
    v24 = *v23;
    if ((v24 & v22) != 0)
    {
      if ((*(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x28 + 4 * (v21 | 1)) & v22) == 0)
        goto LABEL_36;
      v25 = (v20 >> 4) & 0x1F;
      v26 = ((unint64_t)v23[2] << (32 - ((v20 >> 4) & 0x1F))) | (v24 >> ((v20 >> 4) & 0x1F));
      if (v25)
        v26 |= (unint64_t)v23[4] << -(char)v25;
      v27 = __clz(__rbit64(v26 >> 1));
      if (v26 >= 2)
        v28 = v27 + 1;
      else
        v28 = 0;
    }
    else
    {
      v28 = 0;
    }
    if (!malloc_zero_policy)
      _platform_memset();
    tiny_free_no_lock(v30, (uint64_t)v6, v8, v7, v10, v28, 0);
    if (!v29)
    {
      v7 = 0;
      v6 = 0;
    }
    *(_QWORD *)(a2 + 8 * v5) = 0;
LABEL_35:
    if (++v5 == v9)
    {
LABEL_36:
      if (v6)
        os_unfair_lock_unlock(v6);
      return;
    }
  }
  if (v6)
    os_unfair_lock_unlock(v6);
  v12 = *(uint64_t **)(a1 + 16536);
  v13 = *v12;
  if (*v12)
  {
    v14 = v12[2];
    v15 = (0x9E3779B97F4A7C55 * (v10 >> 20)) >> -*((_BYTE *)v12 + 8);
    v16 = v15;
    do
    {
      v17 = *(_QWORD *)(v14 + 8 * v16);
      if (!v17)
        break;
      if (v17 == v11)
      {
        if (!v11)
          return;
        v18 = *(_QWORD *)(a1 + 17136);
        v8 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
        v6 = (os_unfair_lock_s *)(v18 + 2560 * v8);
        os_unfair_lock_lock_with_options();
        for (i = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
              v8 != i;
              i = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18))
        {
          v8 = i;
          os_unfair_lock_unlock(v6);
          v6 = (os_unfair_lock_s *)(v18 + 2560 * v8);
          os_unfair_lock_lock_with_options();
        }
        v7 = v10 & 0xFFFFFFFFFFF00000;
        goto LABEL_21;
      }
      if (v16 + 1 == v13)
        v16 = 0;
      else
        ++v16;
    }
    while (v16 != v15);
  }
}

void print_tiny_free_list(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t, uint64_t, uint64_t *), void (*a3)(const char *, ...), uint64_t a4)
{
  const char *v7;
  uint64_t v8;
  uint64_t i;
  const void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (_simple_salloc())
  {
    v17 = 0;
    v18 = 0;
    if (a2(a1, a4, 768, &v18))
    {
      v7 = "Failed to map tiny rack\n";
LABEL_6:
      a3(v7);
      return;
    }
    _simple_sappend();
    if (a2(a1, *(_QWORD *)(v18 + 624), 2560 * *(int *)(v18 + 608), &v17))
    {
      v7 = "Failed to map tiny rack magazines\n";
      goto LABEL_6;
    }
    if ((*(_DWORD *)(v18 + 608) & 0x80000000) == 0)
    {
      v8 = -1;
      do
      {
        _simple_sprintf();
        for (i = 0; i != 64; ++i)
        {
          v10 = *(const void **)(v17 + 2560 * v8 + 8 * i + 32);
          if (v10)
          {
            v11 = 0;
            v12 = v18;
            v19 = 0;
            while (v10)
            {
              if (a2(a1, (uint64_t)v10, 16, &v19))
              {
                a3("** invalid pointer in free list: %p\n", v10);
                break;
              }
              v13 = __ROR8__(*(_QWORD *)(v19 + 8), 60);
              v10 = (const void *)(v13 & 0xFFFFFFFFFFFFFFF0);
              v14 = v13 & 0xFFFFFFFFFFFFFFF0 ^ *(_QWORD *)(v12 + 632);
              ++v11;
              if (((v13 ^ (HIDWORD(v14)
                                        + (_DWORD)v14
                                        + ((HIDWORD(v14) + v14) >> 16)
                                        + ((HIDWORD(v14) + (_DWORD)v14 + ((HIDWORD(v14) + v14) >> 16)) >> 8))) & 0xFLL) != 0)
              {
                free_list_checksum_botch(v12);
                __break(1u);
                return;
              }
            }
            _simple_sprintf();
          }
        }
        _simple_sappend();
        ++v8;
      }
      while (v8 < *(int *)(v18 + 608));
    }
    v15 = (const char *)_simple_string();
    a3("%s\n", v15);
    _simple_sfree();
  }
}

uint64_t print_tiny_region()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(const char *, ...);
  uint64_t (*v10)(const char *, ...);
  char *v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t result;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unsigned int v22;
  int v23;
  unsigned int *v24;
  unint64_t v25;
  unsigned int v26;
  unint64_t v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  BOOL v35;
  unint64_t v36;
  const char *v37;
  int v38;
  uint64_t v39;
  _DWORD *v40;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  _DWORD v47[1024];
  uint64_t v48;

  v0 = MEMORY[0x1E0C86820]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v48 = *MEMORY[0x1E0C874D8];
  v11 = (char *)(v5 + 16512);
  v46 = 0;
  if (v12(v0, v5 + 16512, 0x100000, &v46))
    return v10("Failed to map tiny region at %p\n", v11);
  if (v6 == -1)
  {
    result = _simple_salloc();
    if (!result)
      return result;
    _simple_sprintf();
    v37 = (const char *)_simple_string();
    v10("%s\n", v37);
    return _simple_sfree();
  }
  v45 = v8;
  v14 = (unint64_t)&v11[v4];
  v44 = v2;
  v15 = &v11[-v2 + 1032064];
  v16 = v46;
  _platform_memset();
  v43 = v16;
  if (&v11[v4] >= v15)
  {
    v18 = 0;
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = v16 - (_QWORD)v11;
    while (1)
    {
      v20 = (v14 & 0xFFFFFFFFFFF00000) + v19 + 40;
      v21 = v14 & 0xFFFFFFFFFFF00000 | 0x4080;
      v22 = ((v14 - v21) >> 8) & 0xFFE;
      v23 = 1 << ((v14 - v21) >> 4);
      v24 = (unsigned int *)(v20 + 4 * v22);
      v25 = *v24;
      if ((v25 & v23) == 0)
        break;
      if ((*(_DWORD *)(v20 + 4 * (v22 | 1)) & v23) != 0)
      {
        v26 = ((v14 - v21) >> 4) & 0x1F;
        v27 = ((unint64_t)v24[2] << (32 - v26)) | (v25 >> v26);
        if (v26)
          v27 |= (unint64_t)v24[4] << -(char)v26;
        if (v27 < 2)
          break;
        v28 = __clz(__rbit64(v27 >> 1));
        v29 = v28 + 1;
        if (v28 == 63)
          v10("*** error at %p msize for in_use is %d\n", (const void *)v14, v29);
        ++v47[v29];
        ++v18;
        v30 = 16 * v29;
      }
      else
      {
        if (v14 + 16 >= v21 + 1032064
          || ((*(_DWORD *)(((v14 + 16) & 0xFFFFFFFFFFF00000)
                         + v19
                         + (((((v14 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8)
                         + 40) >> (((((_DWORD)v14 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          v31 = 1;
        }
        else
        {
          v31 = *(unsigned __int16 *)(v14 + v19 + 16);
          if ((char *)v14 == v11 && !*(_WORD *)(v14 + v19 + 16))
            goto LABEL_29;
          if (!*(_WORD *)(v14 + v19 + 16))
            break;
        }
        v32 = -*MEMORY[0x1E0C88820];
        v33 = (v14 + *MEMORY[0x1E0C88820] + 17) & v32;
        v30 = 16 * v31;
        v34 = (v14 + v30 - 2) & v32;
        v35 = v34 >= v33;
        v36 = v34 - v33;
        if (!v35)
          v36 = 0;
        v17 += v36;
      }
      v14 += v30;
      if (v14 >= (unint64_t)v15)
        goto LABEL_29;
    }
    v10("*** error with %p: msize=%d\n", (const void *)v14, 0);
  }
LABEL_29:
  result = _simple_salloc();
  if (result)
  {
    v38 = *(_DWORD *)(v43 + 24);
    _simple_sprintf();
    _simple_sprintf();
    _simple_sprintf();
    if (v44 | v4)
      _simple_sprintf();
    if (v38 != -1)
      _simple_sprintf();
    _simple_sprintf();
    if (v45 >= 2 && v18)
    {
      _simple_sappend();
      v39 = 0;
      v40 = v47;
      do
      {
        if (*v40++)
          _simple_sprintf();
        v39 += 16;
      }
      while (v39 != 0x4000);
    }
    v42 = (const char *)_simple_string();
    v10("%s\n", v42);
    return _simple_sfree();
  }
  return result;
}

void tiny_free_list_check(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  os_unfair_lock_s *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;

  if ((*(_DWORD *)(a1 + 608) & 0x80000000) == 0)
  {
    v3 = a2;
    v4 = -1;
    v5 = " (slot=%u), counter=%d\n*** in-use ptr in free list slot=%u count=%d ptr=%p\n";
    while (1)
    {
      v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 624) + 2560 * v4);
      os_unfair_lock_lock_with_options();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 624) + 2560 * v4 + 8 * v3 + 32);
      if (v7)
        break;
LABEL_22:
      os_unfair_lock_unlock(v6);
      if (++v4 >= *(int *)(a1 + 608))
        return;
    }
    v8 = 0;
    v9 = 0;
LABEL_5:
    v10 = v7 & 0xFFFFFFFFFFF00000;
    v11 = (v7 & 0xFFFFF) - 16512;
    v12 = (v11 >> 8) & 0xFFE;
    v13 = 1 << (v11 >> 4);
    if ((*(_DWORD *)((v7 & 0xFFFFFFFFFFF00000 | (8 * ((v12 >> 1) & 0x7FF))) + 0x28) & v13) != 0
      && (*(_DWORD *)((v7 & 0xFFFFFFFFFFF00000) + 4 * v12 + 0x2C) & v13) == 0)
    {
      if ((v7 & 0xF) != 0)
      {
        v5 = " (slot=%u), counter=%d\n*** unaligned ptr in free list slot=%u count=%d ptr=%p\n";
      }
      else
      {
        v14 = *(uint64_t **)(a1 + 24);
        v15 = *v14;
        if (*v14)
        {
          v16 = v14[2];
          v17 = (0x9E3779B97F4A7C55 * (v7 >> 20)) >> -*((_BYTE *)v14 + 8);
          v18 = v17;
          do
          {
            v19 = *(_QWORD *)(v16 + 8 * v18);
            if (!v19)
              break;
            if (v19 == v10)
            {
              if (!v10)
                break;
              v20 = __ROR8__(*(_QWORD *)v7, 60);
              v21 = v20 & 0xFFFFFFFFFFFFFFF0;
              v22 = *(_QWORD *)(a1 + 632);
              v23 = v20 & 0xFFFFFFFFFFFFFFF0 ^ v22;
              if (((v20 ^ (HIDWORD(v23)
                                        + (_DWORD)v23
                                        + ((HIDWORD(v23) + v23) >> 16)
                                        + ((HIDWORD(v23) + (_DWORD)v23 + ((HIDWORD(v23) + v23) >> 16)) >> 8))) & 0xFLL) != 0)
                goto LABEL_29;
              if (v8 != v21)
              {
                v5 = " (slot=%u), counter=%d\n*** previous incorrectly set slot=%u count=%d ptr=%p\n";
                goto LABEL_25;
              }
              v24 = __ROR8__(*(_QWORD *)(v7 + 8), 60);
              v25 = v24 & 0xFFFFFFFFFFFFFFF0;
              v26 = v24 & 0xFFFFFFFFFFFFFFF0 ^ v22;
              if (((v24 ^ (HIDWORD(v26)
                                        + (_DWORD)v26
                                        + ((HIDWORD(v26) + v26) >> 16)
                                        + ((HIDWORD(v26) + (_DWORD)v26 + ((HIDWORD(v26) + v26) >> 16)) >> 8))) & 0xFLL) != 0)
              {
LABEL_29:
                free_list_checksum_botch(a1);
                __break(1u);
                return;
              }
              ++v9;
              v8 = v7;
              v7 = v25;
              if (v25)
                goto LABEL_5;
              goto LABEL_22;
            }
            if (v18 + 1 == v15)
              v18 = 0;
            else
              ++v18;
          }
          while (v18 != v17);
        }
        v5 = " (slot=%u), counter=%d\n*** ptr not in szone slot=%d  count=%u ptr=%p\n";
      }
    }
LABEL_25:
    malloc_zone_check_fail((uint64_t)"check: tiny free list incorrect ", (uint64_t)v5);
    os_unfair_lock_unlock(v6);
  }
}

void tiny_check(uint64_t a1)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t i;
  uint64_t v5;
  uint64_t v6;
  int v7;
  os_unfair_lock_s *v8;
  int v9;
  BOOL v10;
  int v11;
  int v12;
  uint64_t j;
  int v14;

  v2 = *(unint64_t **)(a1 + 24);
  v3 = *v2;
  if (*v2)
  {
    for (i = 0; i < v3; ++i)
    {
      v5 = *(_QWORD *)(v2[2] + 8 * i);
      if ((unint64_t)(v5 + 1) >= 2)
      {
        v6 = *(_QWORD *)(a1 + 624);
        v7 = *(_DWORD *)(v5 + 24);
        v8 = (os_unfair_lock_s *)(v6 + 2560 * v7);
        os_unfair_lock_lock_with_options();
        v9 = *(_DWORD *)(v5 + 24);
        if (v9 != v7)
        {
          do
          {
            os_unfair_lock_unlock(v8);
            v8 = (os_unfair_lock_s *)(v6 + 2560 * v9);
            os_unfair_lock_lock_with_options();
            v10 = v9 == *(_DWORD *)(v5 + 24);
            v9 = *(_DWORD *)(v5 + 24);
          }
          while (!v10);
        }
        tiny_check_region(a1, v5);
        v12 = v11;
        os_unfair_lock_unlock(v8);
        if (!v12)
          return;
        v2 = *(unint64_t **)(a1 + 24);
        v3 = *v2;
      }
    }
  }
  for (j = 0; j != 63; ++j)
  {
    tiny_free_list_check(a1, j);
    if (!v14)
      break;
  }
}

uint64_t _malloc_default_debug_sleep_time()
{
  if (malloc_error_sleep)
    return 3600;
  else
    return 0;
}

void malloc_printf(const char *format, ...)
{
  malloc_vreport(3u, 0, 0, 0, (uint64_t)format);
}

ssize_t _malloc_put(unsigned int a1, const char *a2)
{
  ssize_t result;
  size_t v5;

  result = _simple_salloc();
  if (result)
  {
    if ((a1 & 0x20) == 0)
    {
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      getprogname();
      getpid();
      _simple_sprintf();
    }
    _simple_sprintf();
    if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0))
      _simple_put();
    if ((_malloc_no_asl_log & ~(a1 >> 4) & 1) != 0)
    {
      _simple_string();
      _simple_asl_log();
    }
    return _simple_sfree();
  }
  else if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0))
  {
    if ((a1 & 0x20) == 0)
    {
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      getprogname();
      getpid();
      _simple_dprintf();
    }
    v5 = strlen(a2);
    return write(2, a2, v5);
  }
  return result;
}

void malloc_report_simple(uint64_t a1)
{
  unsigned int v1;

  if (malloc_error_sleep)
    v1 = 3600;
  else
    v1 = 0;
  malloc_vreport(0x30u, v1, 0, 0, a1);
}

void bitarray_set_cold_1(uint64_t a1)
{
  qword_1EE228008 = (uint64_t)"FATAL ERROR - invalid bitarray level";
  qword_1EE228038 = a1;
  __break(1u);
}

void bitarray_first_set_cold_1(unsigned int a1)
{
  qword_1EE228008 = (uint64_t)"FATAL ERROR - invalid bitarray level";
  qword_1EE228038 = a1;
  __break(1u);
}

void xzm_reclaim_mark_used_cold_1()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"cache->ric_head < XZM_RECLAIM_ID_COUNT\" failed (/Libr"
                             "ary/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:141)";
  __break(1u);
}

void xzm_reclaim_mark_free_cold_1(int a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: mach_vm_reclaim_mark_free_with_id failed";
  qword_1EE228038 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_1()
{
  uint64_t v0;

  v0 = *__error();
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: sysctlbyname(\"vm.malloc_ranges\") failed";
  qword_1EE228038 = v0;
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_2()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"left_void.min_address\" failed (/Library/Caches/com.ap"
                             "ple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:611)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_3()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"left_void.max_address >= left_void.min_address\" faile"
                             "d (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:612)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_4()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"right_void.min_address >= left_void.max_address\" fail"
                             "ed (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:613)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_5()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"right_void.max_address >= right_void.min_address\" fai"
                             "led (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:614)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_6()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"candidate_span\" failed (/Library/Caches/com.apple.xbs"
                             "/Sources/libmalloc/src/xzone/xzone_segment.c:675)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_7()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"(start_address >= left_void.min_address && end_address"
                             " + XZM_RANGE_SEPARATION <= left_void.max_address) || (start_address >= right_void.min_addre"
                             "ss + XZM_RANGE_SEPARATION && start_address + XZM_POINTER_RANGE_SIZE <= right_void.max_addre"
                             "ss)\" failed (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:700)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_8(int a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: unexpected error from mach_vm_range_create()";
  qword_1EE228038 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_9(int a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: pointer range initial overwrite failed";
  qword_1EE228038 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_10()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"right_candidate_span % XZM_PAGE_TABLE_GRANULE == 0\" f"
                             "ailed (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:669)";
  __break(1u);
}

void xzm_chunk_mark_free_cold_1(unsigned __int8 a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: asking for start of chunk with invalid kind";
  qword_1EE228038 = a1;
  __break(1u);
}

void xzm_segment_group_alloc_chunk_cold_3(int a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: mach_vm_map() overwrite failed";
  qword_1EE228038 = a1;
  __break(1u);
}

void _xzm_segment_group_find_and_allocate_chunk_cold_1(unsigned __int8 a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: unknown segment group id";
  qword_1EE228038 = a1;
  __break(1u);
}

void _xzm_segment_group_segment_span_free_coalesce_cold_1(unsigned __int8 a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
  qword_1EE228038 = a1;
  __break(1u);
}

void _xzm_segment_group_segment_span_free_coalesce_cold_4()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: attempting to coalesce slice of unexpected type";
  __break(1u);
}

void _xzm_segment_group_init_segment_cold_1()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: Slice count too large in init_segment";
  __break(1u);
}

void _xzm_segment_group_init_segment_cold_2()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"(uintptr_t)body < XZM_LIMIT_ADDRESS\" failed (/Library"
                             "/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:1766)";
  __break(1u);
}

void _xzm_segment_group_init_segment_cold_3()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"(uintptr_t)segment < XZM_LIMIT_ADDRESS\" failed (/Libr"
                             "ary/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:1765)";
  __break(1u);
}

void _xzm_segment_table_allocated_at_cold_1()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"((uintptr_t)segment >> XZM_METAPOOL_SEGMENT_BLOCK_SHIF"
                             "T) < UINT32_MAX\" failed (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/../xzon"
                             "e/xzone_inline_internal.h:190)";
  __break(1u);
}

void _xzm_segment_group_alloc_segment_cold_1()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"(uintptr_t)segment_body < XZM_LIMIT_ADDRESS\" failed ("
                             "/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:1870)";
  __break(1u);
}

void _xzm_segment_group_alloc_segment_cold_2(int a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: pointer range mach_vm_map() overwrite failed";
  qword_1EE228038 = a1;
  __break(1u);
}

void _xzm_segment_group_segment_create_guard_cold_1()
{
  uint64_t v0;

  v0 = *__error();
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: Failed to mprotect guard page";
  qword_1EE228038 = v0;
  __break(1u);
}

uint64_t szone_pressure_relief_cold_1()
{
  OUTLINED_FUNCTION_0();
  kdebug_trace();
  OUTLINED_FUNCTION_0();
  return kdebug_trace();
}

void small_free_list_remove_ptr_no_clear_cold_2(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4;
  unint64_t ptr;

  small_free_list_get_ptr(a2);
  ptr = small_free_list_get_ptr(a3);
  OUTLINED_FUNCTION_0_0(ptr, v4, (uint64_t)"small_free_list_remove_ptr_no_clear: Internal invariant broken (prev ptr of next) for %p, next_prev=%p\n");
  __break(1u);
}

void small_free_list_remove_ptr_no_clear_cold_3(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4;
  unint64_t ptr;

  small_free_list_get_ptr(a2);
  ptr = small_free_list_get_ptr(a3);
  OUTLINED_FUNCTION_0_0(ptr, v4, (uint64_t)"small_free_list_remove_ptr_no_clear: Internal invariant broken (next ptr of prev) for %p, prev_next=%p\n");
  __break(1u);
}

void free_small_cold_1()
{
  qword_1EE228008 = (uint64_t)"small free list metadata inconsistency (headers[previous] != previous size)";
  __break(1u);
}

void xzm_metapool_alloc_cold_1()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: Failed to allocate malloc metadata";
  __break(1u);
}

void rack_init_cold_1()
{
  malloc_report(3u, (uint64_t)"*** FATAL ERROR - unable to allocate magazine array.\n");
  qword_1EE228008 = (uint64_t)"FATAL ERROR - unable to allocate magazine array";
  __break(1u);
}

void mfm_initialize_cold_1()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: failed to allocate memory";
  qword_1EE228038 = 0;
  __break(1u);
}

void mfm_initialize_cold_2(int a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: failed to overwrite mfm arena";
  qword_1EE228038 = a1;
  __break(1u);
}

void mfm_free_cold_1(uint64_t a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: not an allocated block";
  qword_1EE228038 = a1;
  __break(1u);
}

void mfm_free_cold_2(uint64_t a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: double free detected";
  qword_1EE228038 = a1;
  __break(1u);
}

void mfm_free_cold_3(uint64_t a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: invalid address";
  qword_1EE228038 = a1;
  __break(1u);
}

void mfm_free_cold_4(uint64_t a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: not MFM owned";
  qword_1EE228038 = a1;
  __break(1u);
}

void xzm_print_self_cold_1()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"main_address\" failed (/Library/Caches/com.apple.xbs/S"
                             "ources/libmalloc/src/xzone/xzone_introspect.c:559)";
  __break(1u);
}

void _xzm_introspect_map_zone_and_main_cold_1()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"zone\" failed (/Library/Caches/com.apple.xbs/Sources/l"
                             "ibmalloc/src/xzone/xzone_introspect.c:557)";
  __break(1u);
}

void pgm_create_zone_cold_2(uint64_t a1)
{
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)"*** FATAL ERROR - ProbGuard: memory budget too small.\n");
  qword_1EE228008 = (uint64_t)"FATAL ERROR - ProbGuard: memory budget too small";
  __break(1u);
}

void pgm_create_zone_cold_3(uint64_t a1)
{
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)"*** FATAL ERROR - ProbGuard: bad configuration.\n");
  qword_1EE228008 = (uint64_t)"FATAL ERROR - ProbGuard: bad configuration";
  __break(1u);
}

void debug_zone_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)"*** FATAL ERROR - ProbGuard: zone integrity check failed.\n");
  qword_1EE228008 = (uint64_t)"FATAL ERROR - ProbGuard: zone integrity check failed";
  qword_1EE228038 = a1;
  __break(1u);
}

void deallocate_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)"*** FATAL ERROR - ProbGuard: invalid pointer passed to free.\n");
  qword_1EE228008 = (uint64_t)"FATAL ERROR - ProbGuard: invalid pointer passed to free";
  qword_1EE228038 = a1;
  __break(1u);
}

void reallocate_cold_2(uint64_t a1)
{
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)"*** FATAL ERROR - ProbGuard: invalid pointer passed to realloc.\n");
  qword_1EE228008 = (uint64_t)"FATAL ERROR - ProbGuard: invalid pointer passed to realloc";
  qword_1EE228038 = a1;
  __break(1u);
}

BOOL nanov2_create_zone_cold_1()
{
  _BOOL8 vm_space;

  OUTLINED_FUNCTION_0_2();
  vm_space = nano_common_allocate_vm_space(0x300000000uLL, 0x20000000uLL);
  OUTLINED_FUNCTION_0_2();
  return vm_space;
}

void xzm_realloc_cold_2(uint64_t a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: pointer being reallocated with wrong zone";
  qword_1EE228038 = a1;
  __break(1u);
}

void _xzm_foreach_lock_cold_1()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"success\" failed (/Library/Caches/com.apple.xbs/Source"
                             "s/libmalloc/src/xzone/xzone_malloc.c:2724)";
  __break(1u);
}

void xzm_ptr_lookup_4test_cold_2()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"xz\" failed (/Library/Caches/com.apple.xbs/Sources/lib"
                             "malloc/src/xzone/xzone_malloc.c:4172)";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_1()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: couldn't find executable_boothash";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_2()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: Invalid xzone slot config";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_3()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: Failed to allocate xzm zone";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_5(int a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: mach_timebase_info failed";
  qword_1EE228038 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_6()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"xzone_count <= UINT8_MAX\" failed (/Library/Caches/com"
                             ".apple.xbs/Sources/libmalloc/src/xzone/xzone_malloc.c:4732)";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_7(uint64_t a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: invalid executable_boothash length";
  qword_1EE228038 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_8()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: invalid executable_boothash string";
  __break(1u);
}

void _xzm_xzone_malloc_from_tiny_chunk_cold_1(uint64_t a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: memory corruption of free block";
  qword_1EE228038 = a1;
  __break(1u);
}

void _xzm_xzone_malloc_from_empty_tiny_chunk_cold_1()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"success\" failed (/Library/Caches/com.apple.xbs/Source"
                             "s/libmalloc/src/xzone/xzone_malloc.c:805)";
  __break(1u);
}

void _xzm_xzone_fresh_chunk_init_cold_1()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: Unexpected chunk kind";
  __break(1u);
}

void _xzm_xzone_free_to_chunk_cold_1(unsigned __int8 a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: Attempting to free to non-chunk slice";
  qword_1EE228038 = a1;
  __break(1u);
}

void _xzm_xzone_chunk_free_cold_2(unsigned __int8 a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: Unexpected chunk kind";
  qword_1EE228038 = a1;
  __break(1u);
}

void _xzm_allocation_slots_do_lock_action_cold_1(unsigned int a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: ulock_wait failure";
  qword_1EE228038 = a1;
  __break(1u);
}

void _xzm_allocation_slots_do_lock_action_cold_2()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"prev_slot_value == slot_meta.xasa_value\" failed (/Lib"
                             "rary/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_malloc.c:1114)";
  __break(1u);
}

void xzm_malloc_zone_destroy_cold_2()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"retries < 10\" failed (/Library/Caches/com.apple.xbs/S"
                             "ources/libmalloc/src/xzone/xzone_malloc.c:4085)";
  __break(1u);
}

void xzm_malloc_zone_destroy_cold_3()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"!chunk->xzc_bits.xzcb_preallocated\" failed (/Library/"
                             "Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_malloc.c:4039)";
  __break(1u);
}

void xzm_malloc_zone_free_slow_cold_1(uint64_t a1)
{
  qword_1EE228008 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: pointer being freed was not allocated";
  qword_1EE228038 = a1;
  __break(1u);
}

void xzm_malloc_zone_malloc_type_realloc_slow_cold_1()
{
  qword_1EE228008 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"old_size\" failed (/Library/Caches/com.apple.xbs/Sourc"
                             "es/libmalloc/src/xzone/xzone_malloc.c:3472)";
  __break(1u);
}

void __malloc_init_cold_1()
{
  malloc_report(3u, (uint64_t)"*** FATAL ERROR - logical_ncpus / phys_ncpus not 1, 2, or 4.\n");
  qword_1EE228008 = (uint64_t)"FATAL ERROR - logical_ncpus / phys_ncpus not 1, 2, or 4";
  qword_1EE228038 = logical_ncpus / phys_ncpus;
  __break(1u);
}

void __malloc_init_cold_2()
{
  malloc_report(3u, (uint64_t)"*** FATAL ERROR - logical_ncpus %% phys_ncpus != 0\n.\n");
  qword_1EE228008 = (uint64_t)"FATAL ERROR - logical_ncpus %% phys_ncpus != 0\n";
  qword_1EE228038 = logical_ncpus % phys_ncpus;
  __break(1u);
}

void tiny_zero_corruption_abort(uint64_t a1)
{
  uint64_t v1;

  v1 = 0;
  while (!*(unsigned __int8 *)(a1 + v1++))
    ;
  malloc_zone_error(256, 1, (uint64_t)"Corruption detected in block %p of size %u at offset %u, first 32 bytes at that offset are %02X %02X %02X %02X %02X %02X %02X %02X | %02X %02X %02X %02X %02X %02X %02X %02X | %02X %02X %02X %02X %02X %02X %02X %02X | %02X %02X %02X %02X %02X %02X %02X %02X\n");
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x1E0C872A0](libraryName);
}

BOOL OSAtomicCompareAndSwapLong(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  return MEMORY[0x1E0C88A30](__oldValue, __newValue, __theValue);
}

int32_t OSAtomicDecrement32Barrier(int32_t *__theValue)
{
  return MEMORY[0x1E0C88A38](__theValue);
}

int32_t OSAtomicIncrement32Barrier(int32_t *__theValue)
{
  return MEMORY[0x1E0C88A50](__theValue);
}

int64_t OSAtomicIncrement64(OSAtomic_int64_aligned64_t *__theValue)
{
  return MEMORY[0x1E0C88A58](__theValue);
}

void OSMemoryBarrier(void)
{
  MEMORY[0x1E0C88A60]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C87438](a1, *(_QWORD *)&a2);
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x1E0C87470]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

uint64_t __ulock_wait()
{
  return MEMORY[0x1E0C87F48]();
}

uint64_t __ulock_wake()
{
  return MEMORY[0x1E0C87F58]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1E0C872C0](*(_QWORD *)&image_index);
}

uint64_t _dyld_get_image_slide()
{
  return MEMORY[0x1E0C872D0]();
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1E0C87308]();
}

uint64_t _os_feature_enabled_simple_impl()
{
  return MEMORY[0x1E0C87CB8]();
}

uint64_t _os_once()
{
  return MEMORY[0x1E0C88AA0]();
}

uint64_t _platform_bzero()
{
  return MEMORY[0x1E0C88AB8]();
}

uint64_t _platform_memcmp_zero_aligned8()
{
  return MEMORY[0x1E0C88AD8]();
}

uint64_t _platform_memmove()
{
  return MEMORY[0x1E0C88AE0]();
}

uint64_t _platform_memset()
{
  return MEMORY[0x1E0C88AE8]();
}

uint64_t _platform_strchr()
{
  return MEMORY[0x1E0C88AF0]();
}

uint64_t _platform_strcmp()
{
  return MEMORY[0x1E0C88AF8]();
}

uint64_t _platform_strcpy()
{
  return MEMORY[0x1E0C88B00]();
}

uint64_t _platform_strlcpy()
{
  return MEMORY[0x1E0C88B10]();
}

uint64_t _platform_strlen()
{
  return MEMORY[0x1E0C88B18]();
}

uint64_t _platform_strncmp()
{
  return MEMORY[0x1E0C88B20]();
}

uint64_t _platform_strstr()
{
  return MEMORY[0x1E0C88B38]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1E0C88B40]();
}

uint64_t _simple_dprintf()
{
  return MEMORY[0x1E0C88B58]();
}

uint64_t _simple_getenv()
{
  return MEMORY[0x1E0C88B60]();
}

uint64_t _simple_put()
{
  return MEMORY[0x1E0C88B68]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x1E0C88B70]();
}

uint64_t _simple_sappend()
{
  return MEMORY[0x1E0C88B78]();
}

uint64_t _simple_sfree()
{
  return MEMORY[0x1E0C88B80]();
}

uint64_t _simple_sprintf()
{
  return MEMORY[0x1E0C88B88]();
}

uint64_t _simple_string()
{
  return MEMORY[0x1E0C88B98]();
}

uint64_t _simple_vdprintf()
{
  return MEMORY[0x1E0C88BA0]();
}

uint64_t _simple_vsprintf()
{
  return MEMORY[0x1E0C88BA8]();
}

void abort(void)
{
  MEMORY[0x1E0C87558]();
}

void *__cdecl j__aligned_alloc(size_t __alignment, size_t __size)
{
  return aligned_alloc(__alignment, __size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C87608]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C87610](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C87618](*(_QWORD *)&__upper_bound);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C87640](a1, *(_QWORD *)&a2);
}

void backtrace_image_offsets(void *const *array, image_offset *image_offsets, int size)
{
  MEMORY[0x1E0C87650](array, image_offsets, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C87668](a1, a2);
}

void *__cdecl j__calloc(size_t __count, size_t __size)
{
  return calloc(__count, __size);
}

uint64_t csops()
{
  return MEMORY[0x1E0C88038]();
}

uint64_t dyld_process_is_restricted()
{
  return MEMORY[0x1E0C87380]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C87388]();
}

void j__free(void *a1)
{
  free(a1);
}

int getentropy(void *buffer, size_t size)
{
  return MEMORY[0x1E0C88158](buffer, size);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C877A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C88190]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C877C0]();
}

int isatty(int a1)
{
  return MEMORY[0x1E0C87800](*(_QWORD *)&a1);
}

int issetugid(void)
{
  return MEMORY[0x1E0C88230]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C88238]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1E0C88258](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C882B0]();
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x1E0C883E8](*(_QWORD *)&task);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C88400](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1E0C88408](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C88410](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1E0C88418](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

kern_return_t mach_vm_page_range_query(vm_map_read_t target_map, mach_vm_offset_t address, mach_vm_size_t size, mach_vm_address_t dispositions, mach_vm_size_t *dispositions_count)
{
  return MEMORY[0x1E0C88420](*(_QWORD *)&target_map, address, size, dispositions, dispositions_count);
}

kern_return_t mach_vm_protect(vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1E0C88428](*(_QWORD *)&target_task, address, size, *(_QWORD *)&set_maximum, *(_QWORD *)&new_protection);
}

kern_return_t mach_vm_range_create(vm_map_t target_task, mach_vm_range_flavor_t flavor, mach_vm_range_recipes_raw_t recipes, mach_msg_type_number_t recipesCnt)
{
  return MEMORY[0x1E0C88430](*(_QWORD *)&target_task, *(_QWORD *)&flavor, recipes, *(_QWORD *)&recipesCnt);
}

uint64_t mach_vm_reclaim_is_available()
{
  return MEMORY[0x1E0C88440]();
}

uint64_t mach_vm_reclaim_is_reclaimed()
{
  return MEMORY[0x1E0C88448]();
}

uint64_t mach_vm_reclaim_mark_free()
{
  return MEMORY[0x1E0C88450]();
}

uint64_t mach_vm_reclaim_mark_free_with_id()
{
  return MEMORY[0x1E0C88458]();
}

uint64_t mach_vm_reclaim_mark_used()
{
  return MEMORY[0x1E0C88460]();
}

uint64_t mach_vm_reclaim_ringbuffer_init()
{
  return MEMORY[0x1E0C88468]();
}

uint64_t mach_vm_reclaim_synchronize()
{
  return MEMORY[0x1E0C88470]();
}

uint64_t mach_vm_reclaim_update_kernel_accounting()
{
  return MEMORY[0x1E0C88478]();
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C884A8](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl j__malloc(size_t __size)
{
  return malloc(__size);
}

malloc_zone_t *j__malloc_default_zone(void)
{
  return malloc_default_zone();
}

void *__cdecl j__malloc_zone_calloc(malloc_zone_t *zone, size_t num_items, size_t size)
{
  return malloc_zone_calloc(zone, num_items, size);
}

void *__cdecl j__malloc_zone_malloc(malloc_zone_t *zone, size_t size)
{
  return malloc_zone_malloc(zone, size);
}

void *__cdecl j__malloc_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size)
{
  return malloc_zone_memalign(zone, alignment, size);
}

void *__cdecl j__malloc_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size)
{
  return malloc_zone_realloc(zone, ptr, size);
}

void *__cdecl j__malloc_zone_valloc(malloc_zone_t *zone, size_t size)
{
  return malloc_zone_valloc(zone, size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C87830](__dst, __src, __n);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C88508](a1, a2, *(_QWORD *)&a3);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C88BC8](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C88BE0]();
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C88BE8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BF0](lock);
}

int j__posix_memalign(void **__memptr, size_t __alignment, size_t __size)
{
  return posix_memalign(__memptr, __alignment, __size);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C87890](a1);
}

void *__cdecl j__realloc(void *__ptr, size_t __size)
{
  return realloc(__ptr, __size);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C87940](*(_QWORD *)&a1);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C87980](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C87A48](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C87A58](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C87A60](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull_l(const char *a1, char **a2, int a3, locale_t a4)
{
  return MEMORY[0x1E0C87A68](a1, a2, *(_QWORD *)&a3, a4);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C87A98](a1, a2, a3, a4, a5);
}

uint64_t thread_stack_pcs()
{
  return MEMORY[0x1E0C87AB0]();
}

kern_return_t thread_switch(mach_port_name_t thread_name, int option, mach_msg_timeout_t option_time)
{
  return MEMORY[0x1E0C887C0](*(_QWORD *)&thread_name, *(_QWORD *)&option, *(_QWORD *)&option_time);
}

int unsetenv(const char *a1)
{
  return MEMORY[0x1E0C87AC8](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C87AE8](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C87AF0](dst, src);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C87B10](uu, out);
}

void *__cdecl j__valloc(size_t a1)
{
  return valloc(a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C887E0](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_purgable_control(vm_map_t target_task, vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1E0C88828](*(_QWORD *)&target_task, address, *(_QWORD *)&control, state);
}

