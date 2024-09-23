uint64_t mfm_lock()
{
  uint64_t result;

  if (mfm_arena)
    return malloc_zone_error(64, 0, (uint64_t)"exclaves lock not supported");
  return result;
}

void mfm_reinit_lock()
{
  uint64_t v0;

  v0 = mfm_arena;
  if (mfm_arena)
  {
    *(_QWORD *)mfm_arena = 0;
    *(_QWORD *)(v0 + 8) = 0;
  }
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

  v30 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  result = mfmi_read_zone(a1, a4, a5, &v27);
  if ((_DWORD)result)
    return result;
  if ((a3 & 4) != 0)
  {
    v28 = a4;
    v29 = 0x8000;
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
  v28 = a4 + 0x8000;
  v29 = 1015808;
  a6(a1, a2, 2, &v28, 1);
  if ((a3 & 1) == 0)
    return 0;
LABEL_8:
  v12 = v27;
  if (!*(_QWORD *)(v27 + 24))
    return 0;
  v13 = 0;
  v14 = 0;
  do
  {
    v15 = (v13 + 1) >> 5;
    v16 = v15 & 0x7FFFFFFFFFFFFFELL;
    v17 = v12 + 8 * (v15 & 0x7FFFFFFFFFFFFFELL);
    v18 = *(_QWORD *)(v17 + 256) >> (v13 + 1);
    if (v18)
    {
      v19 = __clz(__rbit64(v18));
LABEL_12:
      v20 = v19 + 1;
      goto LABEL_13;
    }
    v23 = ((_BYTE)v13 + 1) & 0x3F;
    v24 = *(_QWORD *)(v17 + 272);
    if (!v24)
    {
      v25 = *(_QWORD *)(v12 + ((8 * v15) | 8) + 256);
      if (v23 < 0x31)
        LODWORD(v26) = 0;
      else
        v26 = *(_QWORD *)(v12 + 8 * v16 + 280);
      v19 = (unsigned __int16)((v25 >> v23) | ((unint64_t)(2 * v26) << (v23 ^ 0x3Fu)));
      goto LABEL_12;
    }
    v20 = __clz(__rbit64(v24)) - v23 + 65;
LABEL_13:
    if ((*(_QWORD *)(v12 + 256 + ((v13 >> 2) & 0x3FFFFFFFFFFFFFF0)) & (1 << v13) & *(_QWORD *)(v12
                                                                                                  + 256
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
      *v22 = v12 + 16 * v13 + 0x8000 + a4 - v21;
      v22[1] = 16 * v20;
      ++v14;
      v12 = v21;
    }
    v13 += v20;
  }
  while (v13 < *(_QWORD *)(v12 + 24));
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

uint64_t mfmi_print_self(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v5;
  uint64_t j;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;

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
      v8 = *(_QWORD *)(v5 + 48);
      v7 = (uint64_t *)(v5 + 48);
      for (j = v8; ; j = *v9)
      {
        v9 = (uint64_t *)(v2 + 16 * j);
        if (v9 == v7)
          break;
        malloc_report_simple((uint64_t)"  [%p, %p) size=%zd\n");
      }
    }
    result = malloc_report_simple((uint64_t)"\n");
    if (a2)
    {
      malloc_report_simple((uint64_t)"blocks\n");
      if (*(_QWORD *)(v2 + 24))
      {
        v11 = 0;
        do
        {
          v12 = (v11 + 1) >> 5;
          v13 = v12 & 0x7FFFFFFFFFFFFFELL;
          v14 = v2 + 8 * (v12 & 0x7FFFFFFFFFFFFFELL);
          v15 = *(_QWORD *)(v14 + 256) >> (v11 + 1);
          if (v15)
          {
            v16 = __clz(__rbit64(v15));
          }
          else
          {
            v18 = ((_BYTE)v11 + 1) & 0x3F;
            v19 = *(_QWORD *)(v14 + 272);
            if (v19)
            {
              v17 = __clz(__rbit64(v19)) - v18 + 65;
              goto LABEL_13;
            }
            v20 = *(_QWORD *)(v2 + ((8 * v12) | 8) + 256);
            if (v18 < 0x31)
              LODWORD(v21) = 0;
            else
              v21 = *(_QWORD *)(v2 + 8 * v13 + 280);
            v16 = (unsigned __int16)((v20 >> v18) | ((unint64_t)(2 * v21) << (v18 ^ 0x3Fu)));
          }
          v17 = v16 + 1;
LABEL_13:
          malloc_report_simple((uint64_t)" %c[%p, %p) size=%zd\n");
          v11 += v17;
        }
        while (v11 < *(_QWORD *)(v2 + 24));
      }
      malloc_report_simple((uint64_t)"  [%p, %p) size=%zd (bump)\n");
      return malloc_report_simple((uint64_t)"\n");
    }
  }
  return result;
}

uint64_t mfmi_force_lock()
{
  uint64_t result;

  if (mfm_arena)
    return malloc_zone_error(64, 0, (uint64_t)"exclaves lock not supported");
  return result;
}

uint64_t mfmi_force_unlock()
{
  uint64_t result;

  if (mfm_arena)
    return malloc_zone_error(64, 0, (uint64_t)"exclaves lock not supported");
  return result;
}

void mfmi_statistics_self(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = mfm_arena;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 32);
    *(_DWORD *)a2 = *(_QWORD *)(v2 + 40);
    v4 = 16 * *(unsigned int *)(v2 + 16);
    *(_QWORD *)(a2 + 24) = 0x100000;
    v5 = ((((v3 >> 2) & 0x1FFFFFFFFFFFFFF8) + *MEMORY[0x24BDB03C8] + 255) & -*MEMORY[0x24BDB03C8])
       + *(_QWORD *)(a2 + 16)
       + ((*MEMORY[0x24BDB03C8] + 16 * v3 - 1) & -*MEMORY[0x24BDB03C8]);
    *(_QWORD *)(a2 + 8) = v4;
    *(_QWORD *)(a2 + 16) = v5;
  }
}

uint64_t mfmi_locked()
{
  if (mfm_arena)
    malloc_zone_error(64, 0, (uint64_t)"exclaves lock not supported");
  return 0;
}

void mfmi_reinit_lock()
{
  uint64_t v0;

  v0 = mfm_arena;
  if (mfm_arena)
  {
    *(_QWORD *)mfm_arena = 0;
    *(_QWORD *)(v0 + 8) = 0;
  }
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

uint64_t mfmi_statistics_task(uint64_t a1, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4), uint64_t a4)
{
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = 0;
  result = mfmi_read_zone(a1, a2, a3, &v9);
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  if (!(_DWORD)result)
  {
    v6 = v9;
    v7 = *(_QWORD *)(v9 + 32);
    *(_DWORD *)a4 = *(_QWORD *)(v9 + 40);
    *(_QWORD *)(a4 + 24) = 0x100000;
    v8 = ((((v7 >> 2) & 0x1FFFFFFFFFFFFFF8) + *MEMORY[0x24BDB03C8] + 255) & -*MEMORY[0x24BDB03C8])
       + *(_QWORD *)(a4 + 16)
       + ((*MEMORY[0x24BDB03C8] + 16 * v7 - 1) & -*MEMORY[0x24BDB03C8]);
    *(_QWORD *)(a4 + 8) = 16 * *(unsigned int *)(v6 + 16);
    *(_QWORD *)(a4 + 16) = v8;
  }
  return result;
}

uint64_t mfmi_read_zone(uint64_t task, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4), _QWORD *a4)
{
  uint64_t (*v5)(task_name_t, uint64_t, uint64_t, _QWORD *);

  v5 = a3;
  if (!a3)
  {
    if ((_DWORD)task && !mach_task_is_self(task))
      mfmi_read_zone_cold_1();
    v5 = _malloc_default_reader;
  }
  return v5(task, a2, 0x100000, a4);
}

uint64_t _malloc_default_reader(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  if (a1 && !mach_task_is_self(a1))
    mfmi_read_zone_cold_1();
  *a4 = a2;
  return 0;
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
  a3(" size         : %zd\n", 16 * *(unsigned int *)(a1 + 16));
  a3(" high water   : %zd\n", 16 * *(_QWORD *)(a1 + 24));
  a3(" arena        : [%p, %p)\n", (const void *)(a1 + 0x8000), (const void *)(a1 + 0x100000));
  a3("\n");
  a3("freelists\n");
  for (i = 0; i != 11; ++i)
  {
    v6 = a1 + 16 * i;
    a3(" size %-8zd:\n", 16 << i);
    v9 = *(_QWORD *)(v6 + 48);
    v8 = (uint64_t *)(v6 + 48);
    for (j = v9; ; j = *v10)
    {
      v10 = (uint64_t *)(a1 + 16 * j);
      if (v10 == v8)
        break;
      v11 = ((16 * j - 0x8000) >> 4) + 1;
      v12 = v11 >> 5;
      v13 = (v11 >> 5) & 0x7FFFFFFFFFFFFFELL;
      v14 = a1 + 8 * v13;
      v15 = *(_QWORD *)(v14 + 256) >> v11;
      if (v15)
      {
        v16 = __clz(__rbit64(v15)) + 1;
LABEL_6:
        a3("  [%p, %p) size=%zd\n", v10, &v10[2 * v16], 16 * v16);
        continue;
      }
      v17 = v11 & 0x3F;
      v18 = *(_QWORD *)(v14 + 272);
      if (v18)
      {
        v16 = __clz(__rbit64(v18)) - v17 + 65;
        goto LABEL_6;
      }
      v19 = *(_QWORD *)(a1 + ((8 * v12) | 8) + 256);
      if (v17 < 0x31)
        LODWORD(v20) = 0;
      else
        v20 = *(_QWORD *)(a1 + 8 * v13 + 280);
      v21 = (unsigned __int16)((v19 >> v17) | ((unint64_t)(2 * v20) << (v17 ^ 0x3Fu)))
          + 1;
      a3("  [%p, %p) size=%zd\n", v10, &v10[2 * v21], 16 * v21);
    }
  }
  result = ((uint64_t (*)(const char *))a3)("\n");
  if ((a2 & 1) != 0)
  {
    a3("blocks\n");
    v23 = *(_QWORD *)(a1 + 24);
    if (v23)
    {
      v24 = 0;
      do
      {
        v25 = (v24 + 1) >> 5;
        v26 = v25 & 0x7FFFFFFFFFFFFFELL;
        v27 = a1 + 8 * (v25 & 0x7FFFFFFFFFFFFFELL);
        v28 = *(_QWORD *)(v27 + 256) >> (v24 + 1);
        if (v28)
        {
          v29 = __clz(__rbit64(v28));
        }
        else
        {
          v32 = ((_BYTE)v24 + 1) & 0x3F;
          v33 = *(_QWORD *)(v27 + 272);
          if (v33)
          {
            v30 = __clz(__rbit64(v33)) - v32 + 65;
            goto LABEL_21;
          }
          v34 = *(_QWORD *)(a1 + ((8 * v25) | 8) + 256);
          if (v32 < 0x31)
            LODWORD(v35) = 0;
          else
            v35 = *(_QWORD *)(a1 + 8 * v26 + 280);
          v29 = (unsigned __int16)((v34 >> v32) | ((unint64_t)(2 * v35) << (v32 ^ 0x3Fu)));
        }
        v30 = v29 + 1;
LABEL_21:
        if ((*(_QWORD *)(a1 + 256 + ((v24 >> 2) & 0x3FFFFFFFFFFFFFF0)) & (1 << v24) & *(_QWORD *)(a1 + 256 + ((v24 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8))) != 0)
          v31 = "*";
        else
          v31 = " *";
        a3(" %c[%p, %p) size=%zd\n", *v31, (const void *)(a1 + 16 * v24 + 0x8000), (const void *)(a1 + 16 * v24 + 0x8000 + 16 * v30), 16 * v30);
        v24 += v30;
        v23 = *(_QWORD *)(a1 + 24);
      }
      while (v24 < v23);
    }
    a3("  [%p, %p) size=%zd (bump)\n", (const void *)(a1 + 16 * v23 + 0x8000), (const void *)(a1 + 0x100000), 1015808 - 16 * v23);
    return ((uint64_t (*)(const char *))a3)("\n");
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

  v3 = a1 + 2128;
  if (*(_BYTE *)(a1 + 36) == 1)
    return (*(uint64_t (**)(uint64_t, unint64_t, _QWORD))(a2 + 16))(a2, v3, *(unsigned int *)(a1 + 2200));
  v5 = v3 + 80 * *(unsigned int *)(a1 + 32);
  if (v3 < v5)
  {
    while (1)
    {
      v6 = *(_BYTE *)(v3 + 64) & 0xF;
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
        v9 = v3 + v8 + 80;
        v10 = *(_BYTE *)(v3 + v8 + 144) & 0xF;
        v11 = v10 > 7 || ((1 << v10) & 0xE4) == 0;
        v8 += 80;
      }
      while (v11 && v10 != 8 && v9 < v5);
      result = (*(uint64_t (**)(uint64_t, unint64_t, _QWORD))(a2 + 16))(a2, v3, -858993459 * (v8 >> 4));
      if ((_DWORD)result)
        return result;
      v3 += v8;
LABEL_8:
      if (v3 >= v5)
        return 0;
    }
    v7 = *(unsigned int *)(v3 + 72);
LABEL_6:
    result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(a2 + 16))(a2, v3, v7);
    if ((_DWORD)result)
      return result;
    v3 += 80 * v7;
    goto LABEL_8;
  }
  return 0;
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
    v10 = (unint64_t)v9 << 15;
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
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  _QWORD *v16;
  _QWORD v17[6];
  int v18;
  BOOL v19;
  _QWORD v20[6];
  int v21;
  BOOL v22;
  BOOL v23;
  char v24;
  _QWORD v25[6];
  int v26;
  BOOL v27;
  BOOL v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v7 = a5;
  if (!a5)
  {
    if ((_DWORD)task && !mach_task_is_self(task))
      mfmi_read_zone_cold_1();
    v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD **))_malloc_default_reader_0;
  }
  v30 = 0;
  v31 = 0;
  v29 = 0;
  result = _xzm_introspect_map_zone_and_main(task, a4, v7, &v31, &v30, &v29);
  if (!(_DWORD)result)
  {
    v13 = v29;
    v14 = v30;
    v15 = v29 == a4;
    if (v29 != a4
      || (result = mfmi_enumerator(task, a2, a3, *(_QWORD *)(v30 + 368), (uint64_t (*)(task_name_t, uint64_t, uint64_t, _QWORD *))v7, a6), !(_DWORD)result))
    {
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 0x40000000;
      v25[2] = __xzm_ptr_in_use_enumerator_block_invoke;
      v25[3] = &__block_descriptor_tmp;
      v27 = (a3 & 4) != 0;
      v28 = v15;
      v26 = task;
      v25[4] = a6;
      v25[5] = a2;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 0x40000000;
      v20[2] = __xzm_ptr_in_use_enumerator_block_invoke_3;
      v20[3] = &__block_descriptor_tmp_4;
      v22 = v27;
      v21 = task;
      v20[4] = a6;
      v20[5] = a2;
      v23 = (a3 & 2) != 0;
      v24 = a3 & 1;
      if (v13 == a4)
      {
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 0x40000000;
        v17[2] = __xzm_ptr_in_use_enumerator_block_invoke_4;
        v17[3] = &__block_descriptor_tmp_6;
        v19 = (a3 & 2) != 0;
        v18 = task;
        v16 = v17;
        v17[4] = a6;
        v17[5] = a2;
      }
      else
      {
        v16 = 0;
      }
      return _xzm_introspect_enumerate(task, (uint64_t (*)(_QWORD))v7, a4, v31, v13, v14, a3 & 1, (uint64_t)v25, (uint64_t)&__block_literal_global, (uint64_t)v20, (uint64_t)v16);
    }
  }
  return result;
}

void xzm_print_task(uint64_t a1, uint64_t a2, const void *a3, uint64_t (*a4)(_QWORD), void (*a5)(const char *, ...))
{
  const void *v9;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  int v18;
  mach_vm_address_t v19;
  unint64_t v20;
  unsigned int v21;
  _QWORD *v22;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unsigned __int8 *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  const char *v35;
  unint64_t v36;
  const void *v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  BOOL v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  const char *v51;
  int v52;
  unsigned int v53;
  unint64_t v54;
  const void **v55;
  unint64_t v56;
  unsigned int v57;
  const char *v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  _QWORD *v62;
  unint64_t v63;
  const void *v64;
  _QWORD *v65;
  unint64_t v66;
  _QWORD v67[8];
  _QWORD v68[8];
  _QWORD v69[7];
  _QWORD v70[2];
  uint64_t (*v71)(uint64_t, const void *, uint64_t, const char *);
  void *v72;
  _QWORD *v73;
  uint64_t *v74;
  uint64_t *v75;
  void (*v76)(const char *, ...);
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  char v85;
  _QWORD v86[8];
  int v87;
  _QWORD v88[4];
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;

  v98 = 0;
  v99 = 0;
  v97 = 0;
  if (!_xzm_introspect_map_zone_and_main(a1, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD **))a4, &v99, &v98, &v97))
  {
    v9 = (const void *)v97;
    a5("Begin xzone malloc JSON:\n");
    a5("{\n");
    a5("\"desc\": \"xzone malloc\", \n");
    a5("\"addr\": \"%p\", \n", a3);
    a5("\"segment_size\": %zu, \n", 0x400000uLL);
    a5("\"slice_size\": %zu, \n", 0x4000uLL);
    v10 = (unsigned __int8 *)v99;
    a5("\"mzone\": %d, \n", *(unsigned __int16 *)(v99 + 208));
    a5("\"is_main\": %d, \n", v9 == a3);
    a5("\"max_slot_config\": %d, \n", v10[240] & 3);
    v93 = 0;
    v94 = &v93;
    v95 = 0x2000000000;
    v96 = 0;
    v89 = 0;
    v90 = &v89;
    v91 = 0x2000000000;
    v92 = 0;
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x2000000000;
    v88[3] = 0;
    v11 = MEMORY[0x24BDAC760];
    v86[0] = MEMORY[0x24BDAC760];
    v86[1] = 0x40000000;
    v86[2] = __xzm_print_block_invoke;
    v86[3] = &unk_251C8CA00;
    v87 = a1;
    v86[4] = v88;
    v86[5] = &v93;
    v86[6] = &v89;
    v86[7] = a5;
    v82 = 0;
    v83 = &v82;
    v84 = 0x2000000000;
    v85 = 1;
    v78 = 0;
    v79 = &v78;
    v80 = 0x2000000000;
    v81 = 1;
    v70[0] = MEMORY[0x24BDAC760];
    v70[1] = 0x40000000;
    v71 = __xzm_print_block_invoke_2;
    v72 = &unk_251C8CA28;
    v12 = v98;
    v76 = a5;
    v77 = v98;
    v74 = &v82;
    v75 = &v78;
    v73 = v86;
    if (v9 != a3)
    {
      v66 = (unint64_t)v9;
LABEL_15:
      a5("\"spans\": {\n");
      *((_BYTE *)v83 + 24) = 1;
      *((_BYTE *)v79 + 24) = 0;
      v68[7] = v12;
      v69[0] = v11;
      v69[1] = 0x40000000;
      v69[2] = __xzm_print_block_invoke_3;
      v69[3] = &unk_251C8CA50;
      v69[5] = &v82;
      v69[6] = a5;
      v69[4] = v86;
      v68[0] = v11;
      v68[1] = 0x40000000;
      v68[2] = __xzm_print_block_invoke_4;
      v68[3] = &unk_251C8CA78;
      v68[5] = &v82;
      v68[6] = a5;
      v68[4] = v86;
      if (v9 == a3)
      {
        v67[0] = v11;
        v67[1] = 0x40000000;
        v67[2] = __xzm_print_block_invoke_5;
        v67[3] = &unk_251C8CAA0;
        v67[6] = a5;
        v67[7] = v12;
        v17 = v67;
        v67[4] = v86;
        v67[5] = &v82;
      }
      else
      {
        v17 = 0;
      }
      v18 = _xzm_introspect_enumerate(a1, a4, (unint64_t)a3, (uint64_t)v10, v66, v12, 0, (uint64_t)v69, (uint64_t)v70, (uint64_t)v68, (uint64_t)v17);
      v19 = v90[3];
      if (v19)
        mach_vm_deallocate(*MEMORY[0x24BDAEC58], v19, 4 * v94[3]);
      if (!v18)
      {
        a5("}\n");
        a5("}\n");
        a5("End xzone malloc JSON\n");
      }
      goto LABEL_33;
    }
    a5("\"bucketing_key\": \"%016llx%016llx\", \n", *(_QWORD *)(v98 + 344), *(_QWORD *)(v98 + 352));
    a5("\"guard_config\": {\n");
    a5("    \"guards_enabled\": %d, \n", *(unsigned __int8 *)(v12 + 512));
    a5("    \"data_guards_enabled\": %d, \n", *(unsigned __int8 *)(v12 + 513));
    a5("    \"tiny_run_size\": %d, \n", *(unsigned __int8 *)(v12 + 514));
    a5("    \"tiny_guard_density\": %d, \n", *(unsigned __int8 *)(v12 + 515));
    a5("    \"small_run_size\": %d, \n", *(unsigned __int8 *)(v12 + 516));
    a5("    \"small_guard_density\": %d \n", *(unsigned __int8 *)(v12 + 517));
    a5("}, \n");
    if ((*(_BYTE *)(v12 + 360) & 8) != 0)
      v13 = "true";
    else
      v13 = "false";
    a5("\"defer_large\": %s, \n", v13);
    if ((*(_BYTE *)(v12 + 360) & 4) != 0)
      v14 = "true";
    else
      v14 = "false";
    a5("\"defer_xzones\": %s, \n", v14);
    v15 = *(_QWORD *)(v12 + 520);
    if (v15)
    {
      v68[0] = 0;
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t, _QWORD *))a4)(a1, v15, 8256, v68))
        goto LABEL_33;
      v16 = v68[0];
      v67[0] = 0;
      if (*(_QWORD *)v68[0])
      {
        if (((unsigned int (*)(uint64_t, _QWORD, uint64_t, _QWORD *))a4)(a1, *(_QWORD *)v68[0], 16 * *(_QWORD *)(v68[0] + 8) + 32, v67))
        {
          goto LABEL_33;
        }
        v65 = (_QWORD *)v67[0];
      }
      else
      {
        v65 = 0;
      }
      a5("\"reclaim_buffer\": { \n");
      a5("    \"va_in_buffer\": %llu, \n", *(_QWORD *)(v16 + 16));
      a5("    \"last_accounting_given_to_kernel\": %llu, \n", *(_QWORD *)(v16 + 24));
      a5("    \"buffer\": \"%p\", \n", *(const void **)v16);
      a5("    \"buffer_len\": %llu, \n", *(_QWORD *)(v16 + 8));
      if (*(_QWORD *)v16 && *(_QWORD *)(v16 + 8))
      {
        a5("    \"indices\": { \n");
        a5("        \"head\": %llu, \n", *v65);
        a5("        \"busy\": %llu, \n", v65[2]);
        a5("        \"tail\": %llu \n", v65[1]);
        a5("    }, \n");
        a5("    \"entries\": [ \n");
        if (*(_QWORD *)(v16 + 8))
        {
          v20 = 0;
          v21 = 1;
          do
          {
            v22 = &v65[2 * v20];
            a5("        { \n");
            a5("            \"index\": %u, \n", v21 - 1);
            a5("            \"address\": \"%p\", \n", (const void *)v22[4]);
            a5("            \"size\": %u, \n", *((_DWORD *)v22 + 10));
            a5("            \"behavior\": %u, \n", *((unsigned __int16 *)v22 + 22));
            a5("            \"flags\": \"0x%x\" \n", *((unsigned __int16 *)v22 + 23));
            a5("        }");
            if (*(_QWORD *)(v16 + 8) - 1 > v20)
              a5(",");
            a5(" \n");
            v20 = v21;
          }
          while (*(_QWORD *)(v16 + 8) > (unint64_t)v21++);
        }
        a5("    ] \n");
      }
      a5("}, \n");
    }
    a5("\"range_groups\": {\n");
    v24 = *(_QWORD *)(v12 + 416);
    if (v97 <= v24)
    {
      v25 = *(unsigned __int8 *)(v12 + 361);
      v26 = v24 - v97;
      if (!__CFADD__(v26, 80 * v25) && v26 + 80 * v25 <= *(_QWORD *)(v12 + 336))
      {
        v27 = (unsigned __int8 *)(v26 + v12);
        if (v26 + v12)
        {
          v64 = v9;
          v66 = v97;
          if (*(_BYTE *)(v12 + 361))
          {
            v28 = 0;
            do
            {
              a5("    ");
              if (v28)
                a5(", ");
              a5("\"%d\": {\n", *v27);
              a5("        \"id\": %d, \n", *v27);
              a5("        \"lock\": %u, \n", *((_DWORD *)v27 + 4));
              a5("        \"base\": \"%p\", \n", *((const void **)v27 + 6));
              a5("        \"size\": %zu, \n", *((_QWORD *)v27 + 7));
              a5("        \"next\": \"%p\", \n", *((const void **)v27 + 8));
              a5("        \"remaining\": %zu\n", *((_QWORD *)v27 + 9));
              a5("    }\n");
              ++v28;
              v27 += 80;
            }
            while (v28 < *(unsigned __int8 *)(v12 + 361));
          }
          a5("}, \n");
          a5("\"segment_groups\": {\n");
          v29 = *(_QWORD *)(v12 + 424);
          if (v66 <= v29)
          {
            v30 = *(unsigned __int8 *)(v12 + 376);
            v31 = v29 - v66;
            if (!__CFADD__(v31, 544 * v30) && v31 + 544 * v30 <= *(_QWORD *)(v12 + 336))
            {
              v32 = v31 + v12;
              if (v31 + v12)
              {
                if (*(_BYTE *)(v12 + 376))
                {
                  v33 = 0;
                  while (1)
                  {
                    a5("    ");
                    if (v33)
                      a5(", ");
                    a5("\"%d\": {\n", *(unsigned __int8 *)(v32 + 544 * v33));
                    v34 = *(char *)(v32 + 544 * v33);
                    v35 = "unknown";
                    if (v34 <= 3)
                      v35 = (&off_251C8CAD8)[v34];
                    a5("        \"id\": \"%s\", \n", v35);
                    a5("        \"segment_cache\": { \n");
                    v36 = v32 + 544 * v33;
                    a5("            \"max_count\": %u, \n", *(unsigned __int16 *)(v36 + 512));
                    a5("            \"count\": %u, \n", *(unsigned __int16 *)(v36 + 514));
                    a5("            \"max_entry_slices\": %u, \n", *(_DWORD *)(v36 + 516));
                    a5("            \"segments\": { \n");
                    if (*(_WORD *)(v36 + 514))
                    {
                      v37 = *(const void **)(v32 + 544 * v33 + 496);
                      if (v37)
                        break;
                    }
LABEL_58:
                    a5("            } \n");
                    a5("        } \n");
                    a5("    }\n");
                    if (++v33 >= (unint64_t)*(unsigned __int8 *)(v12 + 376))
                      goto LABEL_59;
                  }
                  while (1)
                  {
                    v68[0] = 0;
                    if (((unsigned int (*)(uint64_t, const void *, uint64_t, _QWORD *))a4)(a1, v37, 22608, v68)|| v71((uint64_t)v70, v37, v68[0], "                    "))
                    {
                      goto LABEL_33;
                    }
                    v37 = *(const void **)(v68[0] + 40);
                    if (!v37)
                      goto LABEL_58;
                  }
                }
LABEL_59:
                a5("}, \n");
                a5("\"xzones\": {\n");
                v38 = *(_QWORD *)(v12 + 216);
                if (v66 <= v38)
                {
                  v39 = *(unsigned __int8 *)(v12 + 210);
                  v40 = v38 - v66;
                  v41 = v38 - v66 + 112 * v39;
                  if (!__CFADD__(v38 - v66, 112 * v39))
                  {
                    v42 = *(_QWORD *)(v12 + 336);
                    if (v41 <= v42)
                    {
                      v60 = v40 + v12;
                      if (v40 + v12)
                      {
                        v43 = *(_QWORD *)(v12 + 224);
                        if (v66 <= v43)
                        {
                          v44 = v43 - v66;
                          v45 = __CFADD__(v43 - v66, 48* *(unsigned __int8 *)(v12 + 210)* (unint64_t)*(unsigned __int8 *)(v12 + 211));
                          v46 = v43
                              - v66
                              + 48 * *(unsigned __int8 *)(v12 + 210) * (unint64_t)*(unsigned __int8 *)(v12 + 211);
                          if (!v45 && v46 <= v42)
                          {
                            v63 = v44 + v12;
                            if (v44 + v12)
                            {
                              v10 = (unsigned __int8 *)v99;
                              if (*(unsigned __int8 *)(v99 + 210) >= 2u)
                              {
                                v47 = 1;
                                do
                                {
                                  a5("    \"%d\": {\n", v47);
                                  v48 = v60 + 112 * v47;
                                  a5("        \"id\": %d, \n", *(unsigned __int8 *)(v48 + 88));
                                  a5("        \"bucket\": %d, \n", *(unsigned __int8 *)(v48 + 92));
                                  a5("        \"segment_group\": %zu, \n", 0xF0F0F0F0F0F0F0F1* ((uint64_t)(*(_QWORD *)(v48 + 56) - *(_QWORD *)(v12 + 424)) >> 5));
                                  v49 = *(_QWORD *)(v48 + 64);
                                  v48 += 64;
                                  a5("        \"block_size\": %llu, \n", v49);
                                  a5("        \"chunk_capacity\": %u, \n", *(_DWORD *)(v48 + 20));
                                  a5("        \"sequestered\": %d,\n", *(_BYTE *)(v48 + 30) & 1);
                                  v62 = (_QWORD *)v48;
                                  v50 = *(char *)(v48 + 29);
                                  v51 = "UNKNOWN";
                                  if (v50 <= 2)
                                    v51 = (&off_251C8CAC0)[v50];
                                  a5("        \"slot_config\": \"%s\",\n", v51);
                                  a5("        \"allocation_slots\": [\n");
                                  if (v10[211])
                                  {
                                    v52 = 0;
                                    v61 = v47;
                                    do
                                    {
                                      v53 = v47 + v52 * v10[210];
                                      v54 = v63;
                                      v55 = (const void **)(v63 + 48 * v53);
                                      a5("            {\n");
                                      if (*v62 > 0x1000uLL)
                                      {
                                        a5("                \"chunk\": \"%p\",\n", *v55);
                                        v59 = v63 + 48 * v53;
                                        a5("                \"allocations\": %lu,\n", *(unsigned int *)(v59 + 32));
                                        a5("                \"contentions\": %lu,\n", *(unsigned int *)(v59 + 36));
                                        v47 = v61;
                                      }
                                      else
                                      {
                                        a5("                \"atomic_value\": \"0x%llx\",\n", *v55);
                                        a5("                \"xsg_locked\": \"0x%llx\",\n", *(_DWORD *)v55 & 1);
                                        a5("                \"xsg_waiters\": \"0x%llx\",\n", (*(_DWORD *)v55 >> 1) & 1);
                                        a5("                \"xsc_ptr\": \"0x%llx\",\n", ((unint64_t)*v55 >> 2) & 0x7FFFFFFFFFFFLL);
                                        v56 = v63 + 48 * v53;
                                        a5("                \"allocations\": %lu,\n", *(unsigned int *)(v56 + 32));
                                        a5("                \"contentions\": %lu,\n", *(_DWORD *)(v56 + 36) & 0xFFFFFF);
                                        v57 = HIBYTE(*(_DWORD *)(v56 + 36));
                                        v58 = "UNKNOWN";
                                        if (v57 <= 2)
                                          v58 = (&off_251C8CAC0)[(char)v57];
                                        a5("                \"slot_config\": \"%s\",\n", v58);
                                        v47 = v61;
                                        v54 = v63;
                                      }
                                      a5("                \"last_chunk_empty_ts\": %llu\n", *(_QWORD *)(v54 + 48 * v53 + 40));
                                      a5("            }");
                                      if (v10[211] - 1 > v52)
                                        a5(",");
                                      a5("\n");
                                      ++v52;
                                    }
                                    while (v52 < v10[211]);
                                  }
                                  a5("        ]\n");
                                  a5("    }");
                                  if (v10[210] - 1 > (int)v47)
                                    a5(",");
                                  a5("\n");
                                  ++v47;
                                }
                                while (v47 < v10[210]);
                              }
                              a5("}, \n");
                              v9 = v64;
                              v11 = MEMORY[0x24BDAC760];
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
    _Block_object_dispose(&v78, 8);
    _Block_object_dispose(&v82, 8);
    _Block_object_dispose(v88, 8);
    _Block_object_dispose(&v89, 8);
    _Block_object_dispose(&v93, 8);
  }
}

uint64_t _xzm_introspect_map_zone_and_main(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, _QWORD **), _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t v10;
  uint64_t result;
  unint64_t v13;
  int v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v19;

  v10 = a2;
  v19 = 0;
  result = a3(a1, a2, 336, &v19);
  if (!(_DWORD)result)
  {
    v13 = v19[25];
    if (v13 < 0x150)
      return 5;
    result = a3(a1, v10, v19[25], &v19);
    if (!(_DWORD)result)
    {
      v18 = 0;
      v15 = v19;
      v16 = v19[29];
      if (v16)
      {
        result = a3(a1, v19[29], 528, &v18);
        if ((_DWORD)result)
          return result;
        v17 = v18[42];
        if (v17 < 0x210)
          return 5;
        result = a3(a1, v16, v18[42], &v18);
        if ((_DWORD)result)
          return result;
        v15 = v18;
        if (v17 < v18[42])
          return 5;
        v10 = v16;
      }
      else
      {
        v18 = v19;
        if (v19[42] != v13)
          return 5;
      }
      if (!v19)
        _xzm_introspect_map_zone_and_main_cold_1();
      if (!v10)
        _xzm_introspect_map_zone_and_main_cold_2((const void *)result, v14);
      result = 0;
      *a4 = v19;
      *a5 = v15;
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
  unsigned int v21;
  uint64_t v22;
  uint64_t result;
  BOOL v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  unsigned int *v30;
  unsigned __int8 *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
  BOOL v52;
  char v53;
  _QWORD v56[2];
  uint64_t (*v57)(uint64_t, uint64_t);
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(_QWORD);
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unsigned int v66;
  char v67;
  BOOL v68;
  _QWORD *v69;

  v15 = a3 == a5;
  v16 = (_QWORD *)(a6 + 336);
  v17 = (uint64_t *)(a4 + 200);
  if (a3 == a5)
    v17 = (uint64_t *)(a6 + 336);
  v18 = *v17;
  if (a3 != a5)
    goto LABEL_17;
  v19 = *(_QWORD *)(a6 + 432);
  v20 = v19 - a3;
  if (v19 < a3)
    return 5;
  v21 = *(unsigned __int8 *)(a6 + 362);
  v22 = 80 * *(unsigned __int8 *)(a6 + 362);
  result = 5;
  v24 = __CFADD__(v20, v22);
  v25 = v20 + v22;
  if (v24)
    return result;
  if (v25 > *(_QWORD *)(a6 + 336))
    return result;
  v26 = v20 + a6;
  if (!(v20 + a6))
    return result;
  if (!*(_BYTE *)(a6 + 362))
  {
LABEL_17:
    v32 = *(_QWORD *)(a6 + 440);
    v24 = v32 >= a5;
    v33 = v32 - a5;
    if (v24)
    {
      result = 5;
      if (v33 < 0xFFFFFFFFFFFF0000 && v33 + 0x10000 <= *v16)
      {
        v34 = v33 + a6;
        if (v33 + a6)
        {
          v35 = 0;
          v36 = 0;
          v56[0] = MEMORY[0x24BDAC760];
          v57 = ___xzm_introspect_enumerate_block_invoke;
          v58 = &unk_251C8C9D8;
          v56[1] = 0x40000000;
          v66 = a1;
          v63 = a4;
          v64 = a3;
          v65 = v18;
          v67 = a7;
          v59 = a9;
          v60 = a10;
          v68 = v15;
          v61 = a11;
          v62 = a2;
          while (1)
          {
            v37 = *(unsigned int *)(v34 + v35);
            v38 = v37 << 15;
            if ((_DWORD)v37 && v36 != v38)
            {
              result = v57((uint64_t)v56, v38);
              v36 = v38;
              if ((_DWORD)result)
                break;
            }
            v35 += 4;
            if (v35 == 0x10000)
            {
              v40 = *(_QWORD *)(a6 + 448);
              if (v40 >> 62)
                return 5;
              v41 = *(_QWORD *)(a6 + 456);
              result = 0;
              v24 = v41 >= a5;
              v42 = v41 - a5;
              if (v24 && !__CFADD__(v42, 4 * v40) && v42 + 4 * v40 <= *v16)
              {
                result = 0;
                v43 = v42 + a6;
                if (v42 + a6)
                {
                  if (v40)
                  {
                    v44 = 0;
                    while (1)
                    {
                      v45 = *(unsigned int *)(v43 + 4 * v44);
                      if ((_DWORD)v45)
                        break;
LABEL_48:
                      result = 0;
                      if (++v44 >= v40)
                        return result;
                    }
                    v69 = 0;
                    result = ((uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD **))a2)(a1, v45 << 16, 0x10000, &v69);
                    if (!(_DWORD)result)
                    {
                      v46 = 0;
                      v47 = v69;
                      while (1)
                      {
                        v48 = *(unsigned int *)((char *)v47 + v46);
                        v49 = v48 << 15;
                        if ((_DWORD)v48 && v36 != v49)
                        {
                          result = v57((uint64_t)v56, v49);
                          v36 = v49;
                          if ((_DWORD)result)
                            break;
                        }
                        v46 += 4;
                        if (v46 == 0x10000)
                        {
                          v40 = *(_QWORD *)(a6 + 448);
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
  v28 = 0;
  v52 = a3 == a5;
  v53 = a7;
  v51 = v20 + a6;
  while (!*(_QWORD *)(v26 + 80 * v28 + 32))
  {
LABEL_16:
    if (++v28 >= (unint64_t)v21)
      goto LABEL_17;
  }
  v29 = v26 + 80 * v28;
  v30 = (unsigned int *)(v29 + 20);
  v31 = (unsigned __int8 *)(v29 + 16);
  while (1)
  {
    v69 = 0;
    result = a2(a1);
    if ((_DWORD)result)
      return result;
    result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a8 + 16))(a8, v69[1], *v30, *v31);
    if ((_DWORD)result)
      return result;
    if (!*v69)
    {
      v21 = *(unsigned __int8 *)(a6 + 362);
      v15 = v52;
      a7 = v53;
      v26 = v51;
      goto LABEL_16;
    }
  }
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

  v13 = *(_BYTE *)(a4 + 64) & 0xF;
  if (*(_BYTE *)(a1 + 52))
    v14 = v13 == 7;
  else
    v14 = 0;
  if (v14)
  {
    v18 = a2;
    v19 = 0x8000;
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

  if (*(_BYTE *)(a1 + 52) && (*(_BYTE *)(a3 + 36) != 1 || (*(_BYTE *)(a4 + 64) & 0xF) != 7))
  {
    v7[0] = a6;
    v7[1] = (unint64_t)a5 << 14;
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), 2, v7, 1);
  }
  return 0;
}

uint64_t _malloc_default_reader_0(task_name_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  if (a1 && !mach_task_is_self(a1))
    mfmi_read_zone_cold_1();
  *a4 = a2;
  return 0;
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
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *))(a1 + 56))(*(unsigned int *)(a1 + 88), a2, 22608, &v14);
  if (!(_DWORD)result)
  {
    v13 = 0;
    result = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t *))(a1 + 56))(*(unsigned int *)(a1 + 88), *(_QWORD *)(v14 + 64), (unint64_t)*(unsigned int *)(v14 + 28) << 14, &v13);
    if (!(_DWORD)result)
    {
      result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      if (!(_DWORD)result)
      {
        v5[0] = MEMORY[0x24BDAC760];
        v5[1] = 0x40000000;
        v5[2] = ___xzm_introspect_enumerate_block_invoke_2;
        v5[3] = &unk_251C8C9B0;
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

  v0 = MEMORY[0x24BDAC7A8]();
  v3 = v2;
  v4 = (unsigned int *)v1;
  v45[2048] = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(v0 + 48);
  v6 = 0x3333333333334000 * ((unint64_t)(v1 - v5 - 2128) >> 4);
  v7 = (v6 & 0x3FFFFFFFC000) + *(_QWORD *)(v5 + 64);
  v8 = *(_BYTE *)(v1 + 64) & 0xF;
  v9 = v8 > 7 || ((1 << v8) & 0xE4) == 0;
  if (v9 || (v10 = *(_QWORD *)(v0 + 64), *(unsigned __int16 *)(v1 + 66) != *(unsigned __int16 *)(v10 + 208)))
  {
    v14 = *(unsigned __int8 *)(v0 + 97);
    if (*(_BYTE *)(v0 + 97))
    {
      if (!*(_WORD *)(v1 + 66))
        return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, unint64_t))(*(_QWORD *)(v0 + 40) + 16))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 88), v5, v1, v2, (v6 & 0x3FFFFFFFC000) + *(_QWORD *)(v5 + 64));
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
  v13 = *(_QWORD *)(v10 + 216) + 112 * *(unsigned __int8 *)(v1 + 65);
  if (v12 <= v13)
  {
    v17 = v13 - v12;
    v18 = __CFADD__(v13 - v12, 112);
    v19 = v13 - v12 + 112;
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
      v23 = *(unsigned int *)(v16 + 84);
      v14 = 5;
      if (v23 > 0x400)
        return v14;
      v24 = *(_QWORD *)(v16 + 64);
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
      v45[0] = (v6 & 0x3FFFFFFFC000) + *(_QWORD *)(v5 + 64);
      v45[1] = (unint64_t)v2 << 14;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD *, uint64_t))(v22 + 16))(v22, v21, v5, v1, v2, v7, 0, v45, 1);
    }
  }
  return 5;
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
  v11 = (unint64_t *)MEMORY[0x24BDB03C8];
  v12 = *MEMORY[0x24BDB03C8];
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
      v19 = (vm_map_t *)MEMORY[0x24BDAEC58];
      if (v18)
      {
        mach_vm_deallocate(*MEMORY[0x24BDAEC58], v18, 4 * v17);
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
  v8 = 0xF0F0F0F0F0F0F0F1 * ((uint64_t)(*(_QWORD *)(a3 + 16) - *(_QWORD *)(*(_QWORD *)(a1 + 64) + 424)) >> 5);
  v9 = "unknown";
  if ((v8 & 0xFC) == 0)
    v9 = (&off_251C8CAD8)[(char)v8];
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"segment_group\": \"%s\", \n", a4, v9);
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"body_addr\": \"%p\", \n", a4, *(const void **)(a3 + 64));
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"used\": %u, \n", a4, *(_DWORD *)(a3 + 24));
  v10 = "huge_segment";
  if (*(_BYTE *)(a3 + 36) != 1)
    v10 = "unknown";
  if (*(_BYTE *)(a3 + 36))
    v11 = v10;
  else
    v11 = "normal_segment";
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"kind\": \"%s\", \n", a4, v11);
  if (*(_QWORD *)(a3 + 56) == -1)
    v12 = "%s    \"reclaim_id\": -1, \n";
  else
    v12 = "%s    \"reclaim_id\": %llu, \n";
  (*(void (**)(const char *))(a1 + 56))(v12);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a3 + 64));
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"slice_count\": %u, \n", a4, *(_DWORD *)(a3 + 28));
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"slice_entry_count\": %u \n", a4, *(_DWORD *)(a3 + 32));
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
    v8 = (&off_251C8CAF8)[(char)a4];
  (*(void (**)(const char *, ...))(a1 + 48))("        \"kind\": \"%s\", \n", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(const char *, ...))(a1 + 48))("        \"size\": %u \n", a3);
  (*(void (**)(const char *))(a1 + 48))("    }\n");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return 0;
}

uint64_t __xzm_print_block_invoke_4(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, int a5, const void *a6, uint64_t a7)
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
  (*(void (**)(const char *, ...))(a1 + 48))("        \"metadata_addr\": \"%p\", \n", &a2[a4 - a3]);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"mzone\": %d, \n", *(unsigned __int16 *)(a4 + 66));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"xzone\": %d, \n", *(unsigned __int8 *)(a4 + 65));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment\": \"%p\", \n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment_group\": %zu, \n", 0xF0F0F0F0F0F0F0F1 * ((uint64_t)(*(_QWORD *)(a3 + 16) - *(_QWORD *)(*(_QWORD *)(a1 + 56) + 424)) >> 5));
  v14 = *(_BYTE *)(a4 + 64) & 0xF;
  if (v14 > 8)
    v15 = "unknown";
  else
    v15 = (&off_251C8CB18)[v14];
  (*(void (**)(const char *, ...))(a1 + 48))("        \"kind\": \"%s\", \n", v15);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"slice_count\": %u, \n", a5);
  if (a7)
    v16 = *(_DWORD *)(a7 + 64);
  else
    v16 = 0;
  (*(void (**)(const char *, ...))(a1 + 48))("        \"block_size\": %u, \n", v16);
  (*(void (**)(const char *))(a1 + 48))("        \"in_use\": 1, \n");
  if (*(_QWORD *)(a3 + 0xFFFFFFFE66666668 * ((unint64_t)(a4 - a3 - 2128) >> 4) + 72) == -1)
    v17 = "        \"reclaim_id\": -1, \n";
  else
    v17 = "        \"reclaim_id\": %llu, \n";
  (*(void (**)(const char *))(a1 + 48))(v17);
  v18 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  if (!(_DWORD)v18)
  {
    if ((_DWORD)v14 == 5 || (_DWORD)v14 == 2)
      (*(void (**)(const char *, ...))(a1 + 48))("        \"bucket\": %u,\n", *(unsigned __int8 *)(a7 + 92));
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
    (*(void (**)(const char *, ...))(a1 + 48))("        \"is_preallocated\": %d,\n", (*(unsigned __int8 *)(a4 + 64) >> 6) & 1);
    (*(void (**)(const char *, ...))(a1 + 48))("        \"is_pristine\": %d\n", (*(unsigned __int8 *)(a4 + 64) >> 4) & 1);
    (*(void (**)(const char *))(a1 + 48))("    }\n");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return v18;
}

uint64_t __xzm_print_block_invoke_5(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, int a5, const void *a6)
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
  (*(void (**)(const char *, ...))(a1 + 48))("        \"metadata_addr\": \"%p\", \n", &a2[a4 - a3]);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"mzone\": %d, \n", *(unsigned __int16 *)(a4 + 66));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"xzone\": %d, \n", *(unsigned __int8 *)(a4 + 65));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment\": \"%p\", \n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment_group\": %zu, \n", 0xF0F0F0F0F0F0F0F1 * ((uint64_t)(*(_QWORD *)(a3 + 16) - *(_QWORD *)(*(_QWORD *)(a1 + 56) + 424)) >> 5));
  v12 = *(_BYTE *)(a4 + 64) & 0xF;
  if (v12 > 8)
    v13 = "unknown";
  else
    v13 = (&off_251C8CB18)[v12];
  (*(void (**)(const char *, ...))(a1 + 48))("        \"kind\": \"%s\", \n", v13);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"slice_count\": %u, \n", a5);
  if (*(_QWORD *)(a3 + 0xFFFFFFFE66666668 * ((unint64_t)(a4 - a3 - 2128) >> 4) + 72) == -1)
    v14 = "        \"reclaim_id\": -1, \n";
  else
    v14 = "        \"reclaim_id\": %llu, \n";
  (*(void (**)(const char *))(a1 + 48))(v14);
  v15 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  if (!(_DWORD)v15)
  {
    (*(void (**)(const char *, ...))(a1 + 48))("        \"is_preallocated\": %d,\n", (*(unsigned __int8 *)(a4 + 64) >> 6) & 1);
    (*(void (**)(const char *))(a1 + 48))("        \"in_use\": 0 \n");
    (*(void (**)(const char *))(a1 + 48))("    }\n");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return v15;
}

uint64_t _malloc_default_debug_sleep_time()
{
  if (malloc_error_sleep)
    return 3600;
  else
    return 0;
}

char *malloc_print_configure()
{
  char *v0;
  const char *v1;
  unint64_t v2;
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
      v2 = 0x2579AC000uLL;
      v3 = 1;
    }
    else
    {
      v2 = 0x2579AC000;
      v3 = 2;
    }
    *(_DWORD *)(v2 + 3212) = v3;
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

void malloc_printf(const char *format, ...)
{
  malloc_vreport(3u, 0, 0, 0, (uint64_t)format);
}

uint64_t malloc_vreport(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  int v10;
  uint64_t v11;
  uint64_t v12;
  image_offset *p_image_offsets;
  uint64_t v14;
  pid_t v15;
  char out[40];
  unsigned __int8 uu1[8];
  uint64_t v18;
  image_offset image_offsets;
  void *array[2];
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
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
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
    if (a3)
      _simple_sprintf();
    _simple_vsprintf();
    if ((a1 & 0x100) != 0)
    {
      v44 = 0u;
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
      *(_OWORD *)array = 0u;
      v10 = backtrace(array, 50);
      if (v10)
      {
        v11 = v10;
        backtrace_image_offsets(array, &image_offsets, v10);
        if ((int)v11 >= 1)
        {
          v12 = 0;
          p_image_offsets = &image_offsets;
          do
          {
            *(_QWORD *)uu1 = 0;
            v18 = 0;
            if (!v12 || uuid_compare(uu1, p_image_offsets->uuid))
            {
              uuid_copy(uu1, p_image_offsets->uuid);
              memset(out, 0, 37);
              uuid_unparse(p_image_offsets->uuid, out);
            }
            _simple_sappend();
            _simple_sprintf();
            ++v12;
            ++p_image_offsets;
          }
          while (v11 != v12);
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
      result = _simple_string();
      v14 = result;
    }
    else
    {
      result = _simple_sfree();
      v14 = 0;
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
      result = _simple_vdprintf();
    }
    if ((a1 & 0x40) != 0)
      v14 = a5;
    else
      v14 = 0;
  }
  if ((a1 & 0xC0) != 0)
  {
    result = _malloc_put(a1, "*** set a breakpoint in malloc_error_break to debug\n");
    if (malloc_error_stop == 1)
    {
      _malloc_put(5u, "*** sending SIGSTOP to help debug\n");
      v15 = getpid();
      result = kill(v15, 17);
    }
    else if (a2)
    {
      _malloc_put(5u, "*** sleeping to help debug\n");
      result = sleep(a2);
    }
  }
  if ((a1 & 0x40) != 0)
  {
    qword_2579ACC48 = v14;
    abort();
  }
  return result;
}

ssize_t _malloc_put(unsigned int a1, const void *a2)
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
    v5 = _platform_strlen();
    return write(2, a2, v5);
  }
  return result;
}

uint64_t malloc_report(unsigned int a1, uint64_t a2)
{
  unsigned int v3;

  if (malloc_error_sleep)
    v3 = 3600;
  else
    v3 = 0;
  return malloc_vreport(a1, v3, 0, 0, a2);
}

uint64_t malloc_report_simple(uint64_t a1)
{
  unsigned int v1;

  if (malloc_error_sleep)
    v1 = 3600;
  else
    v1 = 0;
  return malloc_vreport(0x30u, v1, 0, 0, a1);
}

uint64_t malloc_zone_error(__int16 a1, char a2, uint64_t a3)
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
  return malloc_vreport(v4, v5, 0, 0, a3);
}

void _xzm_introspect_map_zone_and_main_cold_1()
{
  qword_2579ACC48 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"zone\" failed (/Library/Caches/com.apple.xbs/Sources/l"
                             "ibmalloc_frameworks/src/xzone/xzone_introspect.c:557)";
  __break(1u);
}

void _xzm_introspect_map_zone_and_main_cold_2(const void *a1, int a2)
{
  qword_2579ACC48 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"main_address\" failed (/Library/Caches/com.apple.xbs/S"
                             "ources/libmalloc_frameworks/src/xzone/xzone_introspect.c:559)";
  __break(1u);
  _Block_object_dispose(a1, a2);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _platform_strcmp()
{
  return MEMORY[0x24BDACC18]();
}

uint64_t _platform_strlen()
{
  return MEMORY[0x24BDACC20]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x24BDACEC0]();
}

uint64_t _simple_dprintf()
{
  return MEMORY[0x24BDACEC8]();
}

uint64_t _simple_put()
{
  return MEMORY[0x24BDACED0]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x24BDACED8]();
}

uint64_t _simple_sappend()
{
  return MEMORY[0x24BDACEE0]();
}

uint64_t _simple_sfree()
{
  return MEMORY[0x24BDACEE8]();
}

uint64_t _simple_sprintf()
{
  return MEMORY[0x24BDACEF0]();
}

uint64_t _simple_string()
{
  return MEMORY[0x24BDACEF8]();
}

uint64_t _simple_vdprintf()
{
  return MEMORY[0x24BDACF00]();
}

uint64_t _simple_vsprintf()
{
  return MEMORY[0x24BDACF08]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

void backtrace_image_offsets(void *const *array, image_offset *image_offsets, int size)
{
  MEMORY[0x24BDAD290](array, image_offsets, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x24BDAE978](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x24BDAEC50](*(_QWORD *)&task);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x24BDAEC70](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x24BDAEC78](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_page_range_query(vm_map_read_t target_map, mach_vm_offset_t address, mach_vm_size_t size, mach_vm_address_t dispositions, mach_vm_size_t *dispositions_count)
{
  return MEMORY[0x24BDAEC90](*(_QWORD *)&target_map, address, size, dispositions, dispositions_count);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x24BDB0308](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

