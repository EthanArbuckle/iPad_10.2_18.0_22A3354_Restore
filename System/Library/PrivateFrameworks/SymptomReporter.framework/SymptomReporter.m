uint64_t symptom_set_qualifier(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a3 <= 7)
    {
      result = 0;
      *(_QWORD *)(a1 + 8 * a3 + 40) = a2;
      *(_DWORD *)(a1 + 20) |= 1 << a3;
    }
  }
  return result;
}

void _symptoms_globals_init(uint64_t a1)
{
  if (_dispatch_is_fork_of_multithreaded_parent())
  {
    *(_BYTE *)(a1 + 32) = -1;
  }
  else if (_dispatch_is_multithreaded() && *(_QWORD *)(a1 + 24) != -1)
  {
    dispatch_once_f((dispatch_once_t *)(a1 + 24), (void *)a1, (dispatch_function_t)symptoms_go_multithreaded);
  }
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = a1 + 8;
}

_QWORD *symptom_new(uint64_t a1, unsigned int a2)
{
  _QWORD *result;

  result = 0;
  if (a1 && !(a2 >> 20))
  {
    result = _basic_symptom_create();
    if (result)
    {
      *((_DWORD *)result + 8) = a2 | (*(_DWORD *)(a1 + 12) << 20);
      result[14] = a1;
    }
  }
  return result;
}

_QWORD *_basic_symptom_create()
{
  _QWORD *v0;
  _QWORD *v1;
  int v2;
  timeval v4;

  v0 = malloc_type_calloc(1uLL, 0x78uLL, 0x1020040647A71D6uLL);
  v1 = v0;
  if (v0)
  {
    v4.tv_sec = 0;
    *(_QWORD *)&v4.tv_usec = 0;
    v0[1] = 0x580002CEEDFEEDLL;
    *((_BYTE *)v0 + 16) = 1;
    *((_DWORD *)v0 + 5) = 0;
    gettimeofday(&v4, 0);
    v2 = 1000 * v4.tv_usec;
    *((_DWORD *)v1 + 6) = v4.tv_sec;
    *((_DWORD *)v1 + 7) = v2;
    *(_OWORD *)(v1 + 5) = 0u;
    *(_OWORD *)(v1 + 7) = 0u;
    *(_OWORD *)(v1 + 9) = 0u;
    *(_OWORD *)(v1 + 11) = 0u;
  }
  return v1;
}

void symptom_post(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  uint64_t v5;
  const char *v6;
  _QWORD *symptom_ctrl;
  int *v8;
  int v9;

  v2 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v3 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("symptom_post entry, symptom pointer %p\n", (const void *)a1);
    v4 = *v3;
  }
  if ((v4 & 4) == 0 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    if (!a1)
      return;
LABEL_8:
    dump_symptom((const void **)a1);
    v5 = *(_QWORD *)(a1 + 112);
    if (*(_BYTE *)(v5 + 115))
    {
      v6 = "Disabled";
LABEL_10:
      symptom_free((_QWORD *)a1, v6);
      return;
    }
    if (!*(_BYTE *)(v5 + 352))
    {
      v6 = "Singlethreaded";
      goto LABEL_10;
    }
    symptom_ctrl = get_symptom_ctrl(*(_QWORD **)(a1 + 112), *(_DWORD *)(a1 + 32));
    if (*(_QWORD *)(v2 + 320) == -1)
      v8 = *(int **)(v2 + 328);
    else
      v8 = (int *)_os_alloc_once();
    v9 = *v8;
    if ((*v8 & 2) != 0)
    {
      printf("symptom_post obtained control structure at %p\n", symptom_ctrl);
      v9 = *v8;
    }
    if ((v9 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      symptom_post_cold_1();
      if (symptom_ctrl)
        goto LABEL_20;
    }
    else if (symptom_ctrl)
    {
LABEL_20:
      handle_symptom(v5, (uint64_t)symptom_ctrl, (_QWORD *)a1);
      return;
    }
    sr_log_symptom_action(a1, 2048);
    v6 = "No mem";
    goto LABEL_10;
  }
  symptom_post_cold_2();
  if (a1)
    goto LABEL_8;
}

_QWORD *get_symptom_ctrl(_QWORD *a1, int a2)
{
  _QWORD *result;
  uint64_t v5;

  result = (_QWORD *)a1[5];
  if (result)
  {
    while (*((_DWORD *)result + 2) != a2)
    {
      result = (_QWORD *)result[2];
      if (!result)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    result = malloc_type_calloc(1uLL, 0x58uLL, 0x10A0040C61C5460uLL);
    if (result)
    {
      *result = 3435986669;
      *((_DWORD *)result + 2) = a2;
      *((_DWORD *)result + 14) = 0;
      result[9] = 0;
      result[8] = 0;
      result[10] = result + 9;
      v5 = a1[5];
      result[2] = v5;
      if (!v5)
        a1[6] = result + 2;
      a1[5] = result;
      ++a1[7];
    }
  }
  return result;
}

uint64_t symptom_set_additional_digest(uint64_t a1, int a2, CC_LONG a3, const void *a4)
{
  void *v8;
  _QWORD *v9;
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  if ((unint64_t)(get_symptom_qual_size(a1) - 9961) < 0xFFFFFFFFFFFFD8EFLL)
    return 0xFFFFFFFFLL;
  if ((unint64_t)get_symptom_qual_count(a1) > 0x13)
    return 0xFFFFFFFFLL;
  v8 = malloc_type_calloc(1uLL, 0x38uLL, 0x29B02B86uLL);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = v8;
  *((_QWORD *)v8 + 1) = 0x28000800ACFEEDLL;
  *((_DWORD *)v8 + 4) = a2 | 0x80000000;
  *((_DWORD *)v8 + 5) = 32;
  CC_SHA256(a4, a3, (unsigned __int8 *)v8 + 24);
  result = 0;
  *v9 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v9;
  *(_DWORD *)(a1 + 20) |= 0x40000000u;
  return result;
}

uint64_t get_symptom_qual_size(uint64_t a1)
{
  uint64_t **v1;
  uint64_t result;

  v1 = *(uint64_t ***)(a1 + 104);
  if (!v1)
    return 0;
  result = 0;
  do
  {
    result += *((unsigned __int16 *)v1 + 7) + 4;
    v1 = (uint64_t **)*v1;
  }
  while (v1);
  return result;
}

uint64_t get_symptom_qual_count(uint64_t a1)
{
  uint64_t *v1;
  uint64_t result;

  v1 = *(uint64_t **)(a1 + 104);
  if (!v1)
    return 0;
  result = 0;
  do
  {
    if ((*((_BYTE *)v1 + 19) & 0x40) == 0)
      ++result;
    v1 = (uint64_t *)*v1;
  }
  while (v1);
  return result;
}

void handle_symptom(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  int *v7;
  int v8;
  int *v9;
  unsigned int *v10;
  int v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  int v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  _QWORD *v21;
  int v22;
  unsigned int v23;
  uint64_t *v24;
  uint64_t v25;
  __darwin_time_t tv_sec;
  __darwin_time_t v27;
  uint64_t v28;
  int *v29;
  int v30;
  int *v31;
  int v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  int v38;
  _BOOL8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const void **v43;
  const void *v44;
  int *v45;
  int v46;
  _BOOL8 v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  int *v52;
  int v53;
  int *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  int *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int *v66;
  int v67;
  _WORD *v68;
  _WORD *v69;
  __int16 v70;
  char *symptom;
  unsigned __int16 v72;
  const char *v73;
  _QWORD *v74;
  char v75;
  _BYTE v76[15];
  timeval v77;

  v6 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v7 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v7 = (int *)_os_alloc_once();
  v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    printf("handle_symptom entry, symptom pointer %p   sc filter seqno %d  sr seqno %d\n", a3, *(_DWORD *)(a2 + 56), *(_DWORD *)(a1 + 104));
    v8 = *v7;
  }
  if ((v8 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    handle_symptom_cold_12();
  if (*(_DWORD *)(a2 + 56) == *(_DWORD *)(a1 + 104))
  {
    if (*(_QWORD *)(v6 + 320) == -1)
      v9 = *(int **)(v6 + 328);
    else
      v9 = (int *)_os_alloc_once();
    v10 = (unsigned int *)(a2 + 44);
    v11 = *v9;
    if ((*v9 & 2) != 0)
    {
      puts("handle_symptom: filter with sc filter");
      v11 = *v9;
    }
    if ((v11 & 4) != 0)
    {
      v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v12)
        handle_symptom_cold_10(v12, v13, v14);
    }
  }
  else
  {
    if (*(_QWORD *)(v6 + 320) == -1)
      v15 = *(int **)(v6 + 328);
    else
      v15 = (int *)_os_alloc_once();
    v10 = (unsigned int *)(a1 + 88);
    v16 = *v15;
    if ((*v15 & 2) != 0)
    {
      puts("handle_symptom: filter with global filter");
      v16 = *v15;
    }
    if ((v16 & 4) != 0)
    {
      v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v17)
        handle_symptom_cold_11(v17, v18, v19);
    }
  }
  if (*(_QWORD *)(v6 + 320) == -1)
    v20 = *(int **)(v6 + 328);
  else
    v20 = (int *)_os_alloc_once();
  v21 = (_QWORD *)(a2 + 64);
  v22 = *v20;
  if ((*v20 & 2) != 0)
  {
    printf("filter_new_symptom: entry, q->sq_len %lu cf->cf_queue_len_max %d cf->cf_queue_len_alert %d\n", *v21, v10[2], v10[1]);
    v22 = *v20;
  }
  if ((v22 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    handle_symptom_cold_9();
  v23 = v10[2];
  if (!v23)
  {
    if (*(_QWORD *)(v6 + 320) == -1)
      v31 = *(int **)(v6 + 328);
    else
      v31 = (int *)_os_alloc_once();
    v32 = *v31;
    if ((*v31 & 2) != 0)
    {
      printf("filter_new_symptom: cf->cf_queue_len_max == 0, DROP");
      v32 = *v31;
    }
    if ((v32 & 4) != 0)
    {
      v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v33)
        handle_symptom_cold_3(v33, v34, v35);
    }
    goto LABEL_65;
  }
  if (*v10)
  {
    v77.tv_sec = 0;
    *(_QWORD *)&v77.tv_usec = 0;
    gettimeofday(&v77, 0);
    v24 = (uint64_t *)(a2 + 72);
    v25 = *(_QWORD *)(a2 + 72);
    tv_sec = v77.tv_sec;
    v27 = *v10;
    if (v25 && v77.tv_sec - *(unsigned int *)(v25 + 24) > v27)
    {
      do
      {
        v28 = *(_QWORD *)v25;
        *v24 = *(_QWORD *)v25;
        if (!v28)
          *(_QWORD *)(a2 + 80) = v24;
        --*v21;
        update_globals_for_symptom_removal(a1, (const void **)v25);
        if (*(_QWORD *)(v6 + 320) == -1)
          v29 = *(int **)(v6 + 328);
        else
          v29 = (int *)_os_alloc_once();
        v30 = *v29;
        if ((*v29 & 2) != 0)
        {
          puts("filter_new_symptom: DROP_HEAD (Age limit)");
          v30 = *v29;
        }
        if ((v30 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          handle_symptom_cold_8(&v75, v76);
        symptom_free((_QWORD *)v25, "Too old");
        v25 = *v24;
        v27 = *v10;
      }
      while (*v24 && tv_sec - *(unsigned int *)(v25 + 24) > v27);
      v36 = 1025;
    }
    else
    {
      v36 = 1;
    }
    if (tv_sec - *((unsigned int *)a3 + 6) > v27)
    {
      if (*(_QWORD *)(v6 + 320) == -1)
        v37 = *(int **)(v6 + 328);
      else
        v37 = (int *)_os_alloc_once();
      v38 = *v37;
      if ((*v37 & 2) != 0)
      {
        printf("filter_new_symptom: too old DROP");
        v38 = *v37;
      }
      if ((v38 & 4) != 0)
      {
        v39 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v39)
          handle_symptom_cold_7(v39, v40, v41);
      }
LABEL_65:
      v36 = 256;
      goto LABEL_96;
    }
    v23 = v10[2];
  }
  else
  {
    v36 = 1;
  }
  v42 = *v21;
  if (*v21 >= (unint64_t)v23)
  {
    ++*(_QWORD *)(a1 + 304);
    v43 = *(const void ***)(a2 + 72);
    v44 = *v43;
    *(_QWORD *)(a2 + 72) = *v43;
    if (!v44)
      *(_QWORD *)(a2 + 80) = a2 + 72;
    *v21 = v42 - 1;
    update_globals_for_symptom_removal(a1, v43);
    if (*(_QWORD *)(v6 + 320) == -1)
      v45 = *(int **)(v6 + 328);
    else
      v45 = (int *)_os_alloc_once();
    v46 = *v45;
    if ((*v45 & 2) != 0)
    {
      puts("filter_new_symptom: DROP_HEAD");
      v46 = *v45;
    }
    if ((v46 & 4) != 0)
    {
      v47 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v47)
        handle_symptom_cold_6(v47, v48, v49);
    }
    symptom_free(v43, "Queue length limit");
    v36 = 1025;
  }
  if (*((_BYTE *)a3 + 17) == 4)
  {
    v36 = v36 | 0x2000;
  }
  else
  {
    *a3 = 0;
    **(_QWORD **)(a2 + 80) = a3;
    *(_QWORD *)(a2 + 80) = a3;
    v50 = *(_QWORD *)(a2 + 64) + 1;
    *(_QWORD *)(a2 + 64) = v50;
    ++*(_QWORD *)(a1 + 120);
    v51 = v10[1];
    if (v50 >= v51)
    {
      v74 = a3;
      if (*(_QWORD *)(v6 + 320) == -1)
        v52 = *(int **)(v6 + 328);
      else
        v52 = (int *)_os_alloc_once();
      v53 = *v52;
      if ((*v52 & 2) != 0)
      {
        printf("filter_new_symptom: q->sq_len %zdd >= cf->cf_queue_len_alert %d ALERT\n", v50, v51);
        v53 = *v52;
      }
      if ((v53 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        handle_symptom_cold_5();
      v36 = v36 | 2;
      a3 = v74;
    }
  }
  if (*(_QWORD *)(v6 + 320) == -1)
    v54 = *(int **)(v6 + 328);
  else
    v54 = (int *)_os_alloc_once();
  v55 = *v54;
  if ((*v54 & 2) != 0)
  {
    printf("filter_new_symptom: return %x\n", v36);
    v55 = *v54;
  }
  if ((v55 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    handle_symptom_cold_4(v36, v56, v57);
LABEL_96:
  if (*(_QWORD *)(v6 + 320) == -1)
    v58 = *(int **)(v6 + 328);
  else
    v58 = (int *)_os_alloc_once();
  v59 = *v58;
  if ((*v58 & 2) != 0)
  {
    printf("symptom_post action flags %x from filter %p\n", v36, v10);
    v59 = *v58;
  }
  if ((v59 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    handle_symptom_cold_2((uint64_t)v10, v36, v60, v61, v62, v63, v64, v65);
  sr_log_symptom_action((uint64_t)a3, v36);
  if ((v36 & 0x2000) != 0)
  {
    if (*(_QWORD *)(v6 + 320) == -1)
      v66 = *(int **)(v6 + 328);
    else
      v66 = (int *)_os_alloc_once();
    v67 = *v66;
    if ((*v66 & 2) != 0)
    {
      printf("push_symptom_to_nhm, symptom %p\n", a3);
      v67 = *v66;
    }
    if ((v67 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      handle_symptom_cold_1();
    v68 = malloc_type_malloc(0x28A0uLL, 0xAA6ABA9DuLL);
    if (!v68)
    {
LABEL_121:
      if ((v36 & 0x100) == 0)
      {
        v73 = "Drop (immediate)";
LABEL_124:
        symptom_free(a3, v73);
        return;
      }
LABEL_123:
      ++*(_QWORD *)(a1 + 312);
      v73 = "Drop (filter)";
      goto LABEL_124;
    }
    v69 = v68;
    *((_DWORD *)v68 + 1) = 2359299;
    v70 = (_WORD)v68 + 8;
    fill_sender_id(a1, (uint64_t)(v68 + 4));
    v77.tv_sec = 10444;
    symptom = read_symptom((uint64_t)a3, (_DWORD *)v69 + 11, (unint64_t *)&v77);
    *(_DWORD *)symptom = 0;
    *v69 = 1;
    v72 = (_WORD)symptom - v70 + 8;
    v69[1] = v72;
    if (!*(_BYTE *)(a1 + 113))
    {
      connect_symptom_framework(a1);
      if (!*(_BYTE *)(a1 + 113))
      {
LABEL_120:
        free(v69);
        goto LABEL_121;
      }
      v72 = v69[1];
    }
    symptom_transport_send(a1, v69, v72 + 4);
    ++*(_QWORD *)(a1 + 288);
    goto LABEL_120;
  }
  if ((v36 & 2) != 0)
  {
    ensure_sym_ctrl_is_queued(a1, a2);
    ensure_alert(a1);
  }
  if ((v36 & 0x100) != 0)
    goto LABEL_123;
}

void ensure_sym_ctrl_is_queued(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  int *v9;
  int v10;

  v4 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v5 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v5 = (int *)_os_alloc_once();
  v6 = *v5;
  if ((*v5 & 2) != 0)
  {
    printf("ensure_sym_ctrl_is_queued, sc %p, in use %d\n", (const void *)a2, *(unsigned __int8 *)(a2 + 40));
    v6 = *v5;
  }
  if ((v6 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    ensure_sym_ctrl_is_queued_cold_2();
  if (!*(_BYTE *)(a2 + 40))
  {
    *(_BYTE *)(a2 + 40) = 1;
    *(_QWORD *)(a2 + 24) = 0;
    v7 = *(_QWORD **)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 80);
    *(_QWORD *)(a2 + 32) = v7;
    *v7 = a2;
    *(_QWORD *)(a1 + 72) = a2 + 24;
    *(_QWORD *)(a1 + 80) = v8 + 1;
  }
  if (*(_QWORD *)(v4 + 320) == -1)
    v9 = *(int **)(v4 + 328);
  else
    v9 = (int *)_os_alloc_once();
  v10 = *v9;
  if ((*v9 & 2) != 0)
  {
    printf("After ensure_sym_ctrl_is_queued %p\n", (const void *)a2);
    v10 = *v9;
  }
  if ((v10 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    ensure_sym_ctrl_is_queued_cold_1();
  dump_symptom_state(a1);
}

void ensure_alert(uint64_t a1)
{
  int v2;
  uint64_t v3;
  _OWORD v4[3];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 113))
  {
    v2 = *(_DWORD *)(a1 + 16);
    if (v2 == 2)
    {
      if (!*(_BYTE *)(a1 + 112))
        send_current(a1);
    }
    else if (v2 == 1 && !*(_BYTE *)(a1 + 114))
    {
      v5 = 0;
      memset(v4, 0, sizeof(v4));
      v3 = 0x30000700380001;
      read_current_status(a1, (uint64_t)v4, 0, 2);
      v5 = 0;
      symptom_transport_send(a1, &v3, 0x3CuLL);
      ++*(_QWORD *)(a1 + 272);
      sr_log_status_send(a1, (uint64_t)&v3);
      *(_BYTE *)(a1 + 114) = 1;
    }
  }
  else if (!*(_BYTE *)(a1 + 216))
  {
    ensure_symptom_framework_connect(a1);
  }
}

void symptoms_incoming_message(uint64_t a1, unsigned __int16 *a2, unint64_t a3)
{
  uint64_t v6;
  int *v7;
  int v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int v13;
  unint64_t v14;
  int v15;
  int *v16;
  uint8_t *v17;
  int v18;
  int v19;
  char *v20;
  uint8_t *v21;
  uint8_t *v22;
  char *v23;
  uint8_t *v24;
  unint64_t v25;
  int *v26;
  unint64_t v27;
  int v28;
  _DWORD *v29;
  int v30;
  uint64_t v31;
  int *v32;
  int v33;
  _QWORD *symptom_ctrl;
  _DWORD *v35;
  int v36;
  int *v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int *v45;
  int v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  unint64_t v51;
  char v52;
  _BYTE v53[15];
  uint8_t v54[4];
  _DWORD v55[3];
  uint8_t buf[64];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v7 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v7 = (int *)_os_alloc_once();
  v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    puts("+++ SYMPTOMSD MESSAGE RECEIVED +++");
    v8 = *v7;
  }
  if ((v8 & 4) != 0)
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v9)
      symptoms_incoming_message_cold_5(v9, v10, v11);
  }
  if (a3 < 4)
    return;
  v12 = MEMORY[0x24BDACB70];
  while (1)
  {
    v13 = *a2;
    if (v13 <= 0xB)
      break;
    if (v13 != 12)
    {
      if (v13 == 41)
      {
        if (a3 >= 8 && a2[1] == 4)
        {
          ++*(_QWORD *)(a1 + 248);
          if (*((_DWORD *)a2 + 1) == *(_DWORD *)(a1 + 108))
          {
            *(_BYTE *)(a1 + 112) = 0;
            if (*(_QWORD *)(a1 + 80))
              send_current(a1);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          symptoms_incoming_message_cold_4(buf, a3, &buf[4]);
        }
      }
      return;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v48 = a2[1];
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v48;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = 16;
      _os_log_debug_impl(&dword_20DC0E000, v12, OS_LOG_TYPE_DEBUG, "SymptomReporter incoming_message, SYMTLV_FILTER sc %zd desc->stlv_len %d filter size %zd", buf, 0x1Cu);
    }
    if (a3 < 0x14 || (v25 = a2[1], v25 < 0x10) || (v25 & 0xF) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v50 = a2[1];
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = a3;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v50;
        _os_log_error_impl(&dword_20DC0E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SymptomReporter incoming_message, SYMTLV_FILTER sz %zd fails consistency checks, desc->stlv_len %d", buf, 0x12u);
      }
      return;
    }
    if (*(_QWORD *)(v6 + 320) == -1)
      v26 = *(int **)(v6 + 328);
    else
      v26 = (int *)_os_alloc_once();
    v27 = v25 >> 4;
    v28 = *v26;
    if ((*v26 & 2) != 0)
    {
      printf("apply_new_filters, count is %zd, seqno %d\n", v25 >> 4, *(_DWORD *)(a1 + 104) + 1);
      v28 = *v26;
    }
    if ((v28 & 4) != 0 && os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v49 = *(_DWORD *)(a1 + 104) + 1;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v25 >> 4;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v49;
      _os_log_debug_impl(&dword_20DC0E000, v12, OS_LOG_TYPE_DEBUG, "apply_new_filters, count is %zd, seqno %d\n", buf, 0x12u);
    }
    ++*(_DWORD *)(a1 + 104);
    v29 = a2 + 8;
    do
    {
      v30 = *(v29 - 2);
      v31 = *(_QWORD *)(v6 + 320);
      if (!v30)
      {
        v35 = (_DWORD *)(a1 + 88);
        goto LABEL_60;
      }
      if (v31 == -1)
        v32 = *(int **)(v6 + 328);
      else
        v32 = (int *)_os_alloc_once();
      v33 = *v32;
      if ((*v32 & 2) != 0)
      {
        printf("apply_new_filters, Symptom: %x   Qlert %d    Q drop %d\n", v30, *((unsigned __int16 *)v29 - 2), *((unsigned __int16 *)v29 - 1));
        v33 = *v32;
      }
      if ((v33 & 4) != 0 && os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v42 = *(v29 - 2);
        v43 = *((unsigned __int16 *)v29 - 2);
        v44 = *((unsigned __int16 *)v29 - 1);
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&buf[4] = v42;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v43;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&buf[16] = v44;
        _os_log_debug_impl(&dword_20DC0E000, v12, OS_LOG_TYPE_DEBUG, "apply_new_filters, Symptom: %x   Qlert %d    Q drop %d\n", buf, 0x14u);
      }
      symptom_ctrl = get_symptom_ctrl((_QWORD *)a1, *(v29 - 2));
      if (symptom_ctrl)
      {
        v35 = (_DWORD *)symptom_ctrl + 11;
        v31 = *(_QWORD *)(v6 + 320);
LABEL_60:
        v36 = *(_DWORD *)(a1 + 104);
        *v35 = *v29;
        v35[1] = *((unsigned __int16 *)v29 - 2);
        v35[2] = *((unsigned __int16 *)v29 - 1);
        v35[3] = v36;
        if (v31 == -1)
          v37 = *(int **)(v6 + 328);
        else
          v37 = (int *)_os_alloc_once();
        v38 = *v37;
        if ((*v37 & 2) != 0)
        {
          printf("update_filter_values, max age %d, alert len %d drop len %d seqno %d\n", *v35, v35[1], v35[2], v36);
          v38 = *v37;
        }
        if ((v38 & 4) != 0 && os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v39 = *v35;
          v40 = v35[1];
          v41 = v35[2];
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)&buf[4] = v39;
          buf[8] = 0;
          buf[9] = 4;
          *(_DWORD *)&buf[10] = v40;
          *(_WORD *)&buf[14] = 1024;
          *(_DWORD *)&buf[16] = v41;
          *(_WORD *)&buf[20] = 1024;
          *(_DWORD *)&buf[22] = v36;
          _os_log_debug_impl(&dword_20DC0E000, v12, OS_LOG_TYPE_DEBUG, "update_filter_values, max age %d, alert len %d drop len %d seqno %d\n", buf, 0x1Au);
        }
      }
      v29 += 4;
      --v27;
    }
    while (v27);
    if (*(_QWORD *)(v6 + 320) == -1)
      v45 = *(int **)(v6 + 328);
    else
      v45 = (int *)_os_alloc_once();
    v46 = *v45;
    if ((*v45 & 2) != 0)
    {
      printf("apply_new_filters");
      v46 = *v45;
    }
    if ((v46 & 4) != 0 && os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      symptoms_incoming_message_cold_1(&v52, v53);
    reevaluate_sr_symptoms((_QWORD *)a1);
    v47 = a2[1];
    a3 = a3 - v47 - 4;
    a2 = (unsigned __int16 *)((char *)a2 + v47 + 4);
LABEL_80:
    if (a3 <= 3)
      return;
  }
  if (v13 == 1)
  {
    a2 += 2;
    a3 -= 4;
    goto LABEL_80;
  }
  if (v13 == 11)
  {
    v14 = a3 - 16;
    if (a3 >= 0x10 && a2[1] == 12)
    {
      v15 = *((_DWORD *)a2 + 3);
      if (*(_QWORD *)(v6 + 320) == -1)
        v16 = *(int **)(v6 + 328);
      else
        v16 = (int *)_os_alloc_once();
      v17 = buf;
      memset(buf, 0, 60);
      v18 = *v16;
      if ((*v16 & 2) != 0)
      {
        printf("new_symptoms_read: ack_id %d\n", v15);
        v18 = *v16;
      }
      if ((v18 & 4) != 0 && os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        symptoms_incoming_message_cold_2(v54, v15, v55);
      v19 = v15;
      v20 = (char *)malloc_type_malloc(0x28A0uLL, 0x23FD76D0uLL);
      v21 = (uint8_t *)v20;
      if (v20)
        v22 = (uint8_t *)v20;
      else
        v22 = buf;
      v23 = (char *)&buf[56];
      if (v20)
      {
        v51 = 10340;
        v23 = read_symptoms(a1, v20 + 56, &v51);
      }
      if (v21)
        v17 = v21;
      *((_DWORD *)v17 + 1) = 3145735;
      if (v21)
        v24 = v21 + 8;
      else
        v24 = &buf[8];
      read_current_status(a1, (uint64_t)v24, v19, 1);
      *(_DWORD *)v23 = 0;
      *(_WORD *)v22 = 1;
      *((_WORD *)v17 + 1) = (_WORD)v23 - (_WORD)v24 + 8;
      symptom_transport_send(a1, v22, (unsigned __int16)((_WORD)v23 - (_WORD)v24 + 8) + 4);
      ++*(_QWORD *)(a1 + 280);
      sr_log_status_send(a1, (uint64_t)v22);
      if (v21)
        free(v21);
      a2 = (unsigned __int16 *)((char *)a2 + a2[1] + 4);
      a3 = v14;
      v12 = MEMORY[0x24BDACB70];
      goto LABEL_80;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      symptoms_incoming_message_cold_3(buf, a3, &buf[4]);
  }
}

void sr_log_status_send(uint64_t a1, uint64_t a2)
{
  _BYTE *v3;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  char v8[152];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
  {
    v3 = *(_BYTE **)(MEMORY[0x24BDACB38] + 328);
    if (!v3)
      return;
  }
  else
  {
    v3 = (_BYTE *)_os_alloc_once();
    if (!v3)
      return;
  }
  if ((*v3 & 1) != 0)
  {
    strcpy(v8, "Sent STATUS flags");
    v4 = *(_BYTE *)(a2 + 10);
    if ((v4 & 1) != 0)
    {
      strcpy(&v8[17], " resp");
      v5 = 22;
      if ((v4 & 2) == 0)
      {
LABEL_11:
        if ((v4 & 4) != 0)
        {
          v7 = snprintf(&v8[v5], 149 - v5, " EAGAIN !!!");
          if ((unint64_t)(v5 + v7) >= 0x95)
            v5 = 149;
          else
            v5 += v7;
        }
        snprintf(&v8[v5], 149 - v5, " ack-id %d  num-alerts %d num-queued %d", *(_DWORD *)(a2 + 12), *(_DWORD *)(a2 + 16), *(_DWORD *)(a2 + 20));
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          sr_log_symptom_action_cold_1();
        return;
      }
    }
    else
    {
      v5 = 17;
      if ((*(_BYTE *)(a2 + 10) & 2) == 0)
        goto LABEL_11;
    }
    v6 = snprintf(&v8[v5], 149 - v5, " alert");
    if ((unint64_t)(v5 + v6) >= 0x95)
      v5 = 149;
    else
      v5 += v6;
    goto LABEL_11;
  }
}

void read_current_status(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  int *v12;
  int v13;
  int v14;
  int v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a1 + 80);
  if (v6)
    v7 = a4 | 2;
  else
    v7 = a4;
  *(_BYTE *)(a1 + 114) = v6 != 0;
  *(_BYTE *)a2 = 3;
  *(_BYTE *)(a2 + 1) = *(_DWORD *)(a1 + 12);
  *(_BYTE *)(a2 + 2) = v7;
  *(_BYTE *)(a2 + 3) = 0;
  *(_DWORD *)(a2 + 4) = a3;
  *(_DWORD *)(a2 + 8) = v6;
  *(_DWORD *)(a2 + 12) = *(_QWORD *)(a1 + 120);
  v8 = *(_QWORD *)(a1 + 24);
  if (v8)
  {
    v5 = a3;
    v4 = a2;
    v9 = 0;
    v10 = 32;
    while (1)
    {
      v11 = *(unsigned __int8 *)(v8 + v9);
      *(_BYTE *)(a2 + v9 + 16) = v11;
      if (!v11)
        break;
      --v10;
      ++v9;
      if (v10 <= 1)
      {
        *(_BYTE *)(a2 + v9 + 16) = 0;
        break;
      }
    }
    if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    {
      v12 = *(int **)(MEMORY[0x24BDACB38] + 328);
      goto LABEL_11;
    }
  }
  else
  {
    __break(1u);
  }
  v12 = (int *)_os_alloc_once();
LABEL_11:
  v13 = *v12;
  if ((*v12 & 2) != 0)
  {
    printf("read_current_status, ack id %d, flags %d num_alerts %d  num_queued %d\n", v5, v7, *(_DWORD *)(v4 + 8), *(_DWORD *)(v4 + 12));
    v13 = *v12;
  }
  if ((v13 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_DWORD *)(v4 + 8);
    v15 = *(_DWORD *)(v4 + 12);
    *(_DWORD *)buf = 67109888;
    v17 = v5;
    v18 = 1024;
    v19 = v7;
    v20 = 1024;
    v21 = v14;
    v22 = 1024;
    v23 = v15;
    _os_log_debug_impl(&dword_20DC0E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "read_current_status, ack id %d, flags %d num_alerts %d  num_queued %d\n", buf, 0x1Au);
  }
  dump_status((unsigned __int8 *)v4);
}

void dump_status(unsigned __int8 *a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  int v14;
  int *v15;
  int v16;
  int *v17;
  int v18;
  int *v19;
  int v20;
  int *v21;
  int v22;
  int *v23;
  int v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v3 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 8) != 0)
  {
    if ((v4 & 2) != 0)
    {
      puts("Reporter status:");
      v4 = *v3;
    }
    if ((v4 & 4) != 0)
    {
      v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v5)
        dump_status_cold_7(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v13 = *(int **)(v2 + 328);
  else
    v13 = (int *)_os_alloc_once();
  v14 = *v13;
  if ((*v13 & 8) != 0)
  {
    if ((v14 & 2) != 0)
    {
      printf("srs_version             %d\n", *a1);
      v14 = *v13;
    }
    if ((v14 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_status_cold_6();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v15 = *(int **)(v2 + 328);
  else
    v15 = (int *)_os_alloc_once();
  v16 = *v15;
  if ((*v15 & 8) != 0)
  {
    if ((v16 & 2) != 0)
    {
      printf("srs_flags               %0x\n", a1[2]);
      v16 = *v15;
    }
    if ((v16 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_status_cold_5();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v17 = *(int **)(v2 + 328);
  else
    v17 = (int *)_os_alloc_once();
  v18 = *v17;
  if ((*v17 & 8) != 0)
  {
    if ((v18 & 2) != 0)
    {
      printf("srs_ack_id              %0x\n", *((_DWORD *)a1 + 1));
      v18 = *v17;
    }
    if ((v18 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_status_cold_4();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v19 = *(int **)(v2 + 328);
  else
    v19 = (int *)_os_alloc_once();
  v20 = *v19;
  if ((*v19 & 8) != 0)
  {
    if ((v20 & 2) != 0)
    {
      printf("srs_num_alerts          %d\n", *((_DWORD *)a1 + 2));
      v20 = *v19;
    }
    if ((v20 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_status_cold_3();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v21 = *(int **)(v2 + 328);
  else
    v21 = (int *)_os_alloc_once();
  v22 = *v21;
  if ((*v21 & 8) != 0)
  {
    if ((v22 & 2) != 0)
    {
      printf("srs_num_queued          %d\n", *((_DWORD *)a1 + 3));
      v22 = *v21;
    }
    if ((v22 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_status_cold_2();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v23 = *(int **)(v2 + 328);
  else
    v23 = (int *)_os_alloc_once();
  v24 = *v23;
  if ((*v23 & 8) != 0)
  {
    if ((v24 & 2) != 0)
    {
      puts("srs_sym_basic   ...");
      v24 = *v23;
    }
    if ((v24 & 4) != 0)
    {
      v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v25)
        dump_status_cold_1(v25, v26, v27, v28, v29, v30, v31, v32);
    }
  }
}

char *read_symptoms(uint64_t a1, char *a2, unint64_t *a3)
{
  uint64_t v6;
  int *v7;
  int v8;
  _QWORD *v9;
  NSObject *v10;
  int *v11;
  int v12;
  int *v13;
  int v14;
  const void **v15;
  const void **v16;
  char *v17;
  const void *v18;
  char *symptom;
  uint64_t v20;
  int *v21;
  int v22;
  int *v23;
  int v24;
  const void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t *v33;
  char v34;
  char v35[15];
  char v36;
  char v37[15];
  char v38;
  char v39[15];
  _BYTE buf[22];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  v33 = &v32;
  v6 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v7 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v7 = (int *)_os_alloc_once();
  v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    printf("read_symptoms for sr %p %s\n", (const void *)a1, *(const char **)(a1 + 24));
    v8 = *v7;
  }
  if ((v8 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    read_symptoms_cold_4();
  v9 = *(_QWORD **)(a1 + 64);
  if (v9)
  {
    v10 = MEMORY[0x24BDACB70];
    do
    {
      sym_ctrl_dequeue(a1, (uint64_t)v9);
      if (*(_QWORD *)(v6 + 320) == -1)
        v11 = *(int **)(v6 + 328);
      else
        v11 = (int *)_os_alloc_once();
      v12 = *v11;
      if ((*v11 & 2) != 0)
      {
        printf("read_symptoms for sc %p, q len %zu\n", v9, v9[8]);
        v12 = *v11;
      }
      if ((v12 & 4) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v27 = v9[8];
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v27;
        _os_log_debug_impl(&dword_20DC0E000, v10, OS_LOG_TYPE_DEBUG, "read_symptoms for sc %p, q len %zu\n", buf, 0x16u);
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      if (*(_QWORD *)(v6 + 320) == -1)
        v13 = *(int **)(v6 + 328);
      else
        v13 = (int *)_os_alloc_once();
      v14 = *v13;
      if ((*v13 & 2) != 0)
      {
        puts("read_symptoms_from_q: entry");
        v14 = *v13;
      }
      if ((v14 & 4) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        read_symptoms_cold_3(&v38, v39);
      v16 = (const void **)(v9 + 9);
      v15 = (const void **)v9[9];
      if (v15)
      {
        v17 = a2;
        while (1)
        {
          v18 = *v15;
          *v16 = *v15;
          if (!v18)
            v9[10] = v16;
          symptom = read_symptom((uint64_t)v15, v17, a3);
          v20 = *(_QWORD *)(v6 + 320);
          if (symptom == v17)
            break;
          a2 = symptom;
          if (v20 == -1)
            v21 = *(int **)(v6 + 328);
          else
            v21 = (int *)_os_alloc_once();
          v22 = *v21;
          if ((*v21 & 2) != 0)
          {
            puts("read_symptoms_from_q: added next symptom");
            v22 = *v21;
          }
          if ((v22 & 4) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            read_symptoms_cold_2(&v34, v35);
          --v9[8];
          ++*(_QWORD *)(a1 + 296);
          update_globals_for_symptom_removal(a1, v15);
          symptom_free(v15, "transport OK");
          v15 = (const void **)v9[9];
          v17 = a2;
          if (!v15)
            goto LABEL_47;
        }
        if (v20 == -1)
          v23 = *(int **)(v6 + 328);
        else
          v23 = (int *)_os_alloc_once();
        v24 = *v23;
        if ((*v23 & 2) != 0)
        {
          printf("read_symptoms_from_q: no next symptom available");
          v24 = *v23;
        }
        if ((v24 & 4) != 0 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          read_symptoms_cold_1(&v36, v37);
        *v15 = 0;
        **(_QWORD **)&buf[8] = v15;
        *(_QWORD *)&buf[8] = v15;
        *a3 = 0;
        a2 = v17;
      }
LABEL_47:
      v25 = *(const void **)buf;
      if (!*(_QWORD *)buf)
        goto LABEL_53;
      if (*v16)
      {
        **(_QWORD **)&buf[8] = *v16;
        *(_QWORD *)&buf[8] = v9[10];
        v9[9] = 0;
        v9[10] = v16;
        v25 = *(const void **)buf;
        if (!*(_QWORD *)buf)
          goto LABEL_53;
      }
      else
      {
        v16 = (const void **)v9[10];
      }
      *v16 = v25;
      v9[10] = *(_QWORD *)&buf[8];
LABEL_53:
      if (v9[8])
      {
        v9[3] = 0;
        v26 = v33;
        v9[4] = v33;
        *v26 = (uint64_t)v9;
        v33 = v9 + 3;
      }
      v9 = *(_QWORD **)(a1 + 64);
    }
    while (v9);
  }
  while (1)
  {
    v30 = v32;
    if (!v32)
      break;
    v28 = *(_QWORD *)(v32 + 24);
    v29 = *(_QWORD **)(v32 + 32);
    if (v28)
    {
      *(_QWORD *)(v28 + 32) = v29;
      v29 = *(_QWORD **)(v30 + 32);
    }
    else
    {
      v33 = *(uint64_t **)(v32 + 32);
    }
    *v29 = v28;
    ensure_sym_ctrl_is_queued(a1, v30);
  }
  return a2;
}

void update_globals_for_symptom_removal(uint64_t a1, const void **a2)
{
  int *v3;
  int v4;

  --*(_QWORD *)(a1 + 120);
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v3 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("update globals to remove symptom at %p\n", a2);
    v4 = *v3;
  }
  if ((v4 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    update_globals_for_symptom_removal_cold_1();
  dump_symptom(a2);
}

void dump_symptom(const void **a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  int *v5;
  int v6;
  int *v7;
  int v8;

  v2 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v3 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 8) != 0)
  {
    if ((v4 & 2) != 0)
    {
      printf(" Symptom at %p\n", a1);
      v4 = *v3;
    }
    if ((v4 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_symptom_cold_3();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v5 = *(int **)(v2 + 328);
  else
    v5 = (int *)_os_alloc_once();
  v6 = *v5;
  if ((*v5 & 8) != 0)
  {
    if ((v6 & 2) != 0)
    {
      printf("   s_link next  %p\n", *a1);
      v6 = *v5;
    }
    if ((v6 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_symptom_cold_2();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v7 = *(int **)(v2 + 328);
  else
    v7 = (int *)_os_alloc_once();
  v8 = *v7;
  if ((*v7 & 8) != 0)
  {
    if ((v8 & 2) != 0)
    {
      printf("   s_magic      %x\n", *((_DWORD *)a1 + 2));
      v8 = *v7;
    }
    if ((v8 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_symptom_cold_1();
  }
  dump_basic_symptom((unsigned __int8 *)a1 + 16);
}

void dump_basic_symptom(unsigned __int8 *a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  int *v5;
  int v6;
  int *v7;
  int v8;
  int *v9;
  int v10;
  int *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  unsigned __int8 *v15;
  int *v16;
  int v17;
  uint64_t v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v3 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 8) != 0)
  {
    if ((v4 & 2) != 0)
    {
      printf(" sb_version         %d\n", *a1);
      v4 = *v3;
    }
    if ((v4 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_basic_symptom_cold_5();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v5 = *(int **)(v2 + 328);
  else
    v5 = (int *)_os_alloc_once();
  v6 = *v5;
  if ((*v5 & 8) != 0)
  {
    if ((v6 & 2) != 0)
    {
      printf(" sb_flags           %x\n", *((_DWORD *)a1 + 1));
      v6 = *v5;
    }
    if ((v6 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_basic_symptom_cold_4();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v7 = *(int **)(v2 + 328);
  else
    v7 = (int *)_os_alloc_once();
  v8 = *v7;
  if ((*v7 & 8) != 0)
  {
    if ((v8 & 2) != 0)
    {
      printf(" sb_timestamp_secs  %d\n", *((_DWORD *)a1 + 2));
      v8 = *v7;
    }
    if ((v8 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_basic_symptom_cold_3();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v9 = *(int **)(v2 + 328);
  else
    v9 = (int *)_os_alloc_once();
  v10 = *v9;
  if ((*v9 & 8) != 0)
  {
    if ((v10 & 2) != 0)
    {
      printf(" sb_timestamp_nsecs %d\n", *((_DWORD *)a1 + 3));
      v10 = *v9;
    }
    if ((v10 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_basic_symptom_cold_2();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v11 = *(int **)(v2 + 328);
  else
    v11 = (int *)_os_alloc_once();
  v12 = *v11;
  if ((*v11 & 8) != 0)
  {
    if ((v12 & 2) != 0)
    {
      printf(" sb_ident           %d\n", *((_DWORD *)a1 + 4));
      v12 = *v11;
    }
    if ((v12 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_basic_symptom_cold_1();
  }
  v13 = 0;
  v14 = MEMORY[0x24BDACB70];
  v15 = a1 + 24;
  do
  {
    if (*(_QWORD *)(v2 + 320) == -1)
      v16 = *(int **)(v2 + 328);
    else
      v16 = (int *)_os_alloc_once();
    v17 = *v16;
    if ((*v16 & 8) != 0)
    {
      if ((v17 & 2) != 0)
      {
        printf(" sb_qualifier[%d]    %llx\n", v13, *(_QWORD *)&v15[8 * v13]);
        v17 = *v16;
      }
      if ((v17 & 4) != 0 && os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v18 = *(_QWORD *)&v15[8 * v13];
        *(_DWORD *)buf = 67109376;
        v20 = v13;
        v21 = 2048;
        v22 = v18;
        _os_log_debug_impl(&dword_20DC0E000, v14, OS_LOG_TYPE_DEBUG, " sb_qualifier[%d]    %llx\n", buf, 0x12u);
      }
    }
    ++v13;
  }
  while (v13 != 8);
}

void symptom_free(_QWORD *a1, const char *a2)
{
  _QWORD *v4;
  int *v5;
  int v6;

  if (a1)
  {
    while (1)
    {
      v4 = (_QWORD *)a1[13];
      if (!v4)
        break;
      a1[13] = *v4;
      free(v4);
    }
    *((_DWORD *)a1 + 2) = -823271763;
    if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
      v5 = *(int **)(MEMORY[0x24BDACB38] + 328);
    else
      v5 = (int *)_os_alloc_once();
    v6 = *v5;
    if ((*v5 & 2) != 0)
    {
      printf("Free symptom %p, %s", a1, a2);
      v6 = *v5;
    }
    if ((v6 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      symptom_free_cold_1();
    free(a1);
  }
}

void sym_ctrl_dequeue(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  int *v6;
  int v7;

  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD **)(a2 + 32);
  if (v4)
  {
    *(_QWORD *)(v4 + 32) = v5;
    v5 = *(_QWORD **)(a2 + 32);
  }
  else
  {
    *(_QWORD *)(a1 + 72) = v5;
  }
  *v5 = v4;
  *(_BYTE *)(a2 + 40) = 0;
  --*(_QWORD *)(a1 + 80);
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v6 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v6 = (int *)_os_alloc_once();
  v7 = *v6;
  if ((*v6 & 2) != 0)
  {
    printf("After sym_ctrl_dequeue  %p\n", (const void *)a2);
    v7 = *v6;
  }
  if ((v7 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    sym_ctrl_dequeue_cold_1();
  dump_symptom_state(a1);
}

void dump_symptom_state(uint64_t a1)
{
  dump_system_reporter(a1);
  dump_idents(a1);
  dump_active_idents(a1);
}

void dump_system_reporter(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  int v14;
  int *v15;
  int v16;
  int *v17;
  int v18;
  int *v19;
  int v20;
  int *v21;
  int v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  int v32;
  int *v33;
  int v34;
  int *v35;
  int v36;

  v2 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v3 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 8) != 0)
  {
    if ((v4 & 2) != 0)
    {
      puts("System global... ");
      v4 = *v3;
    }
    if ((v4 & 4) != 0)
    {
      v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v5)
        dump_system_reporter_cold_9(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v13 = *(int **)(v2 + 328);
  else
    v13 = (int *)_os_alloc_once();
  v14 = *v13;
  if ((*v13 & 8) != 0)
  {
    if ((v14 & 2) != 0)
    {
      printf(" sr_ctrl_head        first, last  %p %p\n", *(const void **)(a1 + 40), *(const void **)(a1 + 48));
      v14 = *v13;
    }
    if ((v14 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_system_reporter_cold_8();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v15 = *(int **)(v2 + 328);
  else
    v15 = (int *)_os_alloc_once();
  v16 = *v15;
  if ((*v15 & 8) != 0)
  {
    if ((v16 & 2) != 0)
    {
      printf(" sr_ctrl_num    %lu\n", *(_QWORD *)(a1 + 56));
      v16 = *v15;
    }
    if ((v16 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_system_reporter_cold_7();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v17 = *(int **)(v2 + 328);
  else
    v17 = (int *)_os_alloc_once();
  v18 = *v17;
  if ((*v17 & 8) != 0)
  {
    if ((v18 & 2) != 0)
    {
      printf(" sr_ctrl_active_head first, last  %p %p\n", *(const void **)(a1 + 64), *(const void **)(a1 + 72));
      v18 = *v17;
    }
    if ((v18 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_system_reporter_cold_6();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v19 = *(int **)(v2 + 328);
  else
    v19 = (int *)_os_alloc_once();
  v20 = *v19;
  if ((*v19 & 8) != 0)
  {
    if ((v20 & 2) != 0)
    {
      printf(" sr_num_active  %lu\n", *(_QWORD *)(a1 + 80));
      v20 = *v19;
    }
    if ((v20 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_system_reporter_cold_5();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v21 = *(int **)(v2 + 328);
  else
    v21 = (int *)_os_alloc_once();
  v22 = *v21;
  if ((*v21 & 8) != 0)
  {
    if ((v22 & 2) != 0)
    {
      puts(" sr_filter ...");
      v22 = *v21;
    }
    if ((v22 & 4) != 0)
    {
      v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v23)
        dump_system_reporter_cold_4(v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  dump_creation_filter((_DWORD *)(a1 + 88));
  if (*(_QWORD *)(v2 + 320) == -1)
    v31 = *(int **)(v2 + 328);
  else
    v31 = (int *)_os_alloc_once();
  v32 = *v31;
  if ((*v31 & 8) != 0)
  {
    if ((v32 & 2) != 0)
    {
      printf(" sr_filter_seqno  %u\n", *(_DWORD *)(a1 + 104));
      v32 = *v31;
    }
    if ((v32 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_system_reporter_cold_3();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v33 = *(int **)(v2 + 328);
  else
    v33 = (int *)_os_alloc_once();
  v34 = *v33;
  if ((*v33 & 8) != 0)
  {
    if ((v34 & 2) != 0)
    {
      printf(" sr_alert_sent       %d\n", *(unsigned __int8 *)(a1 + 114));
      v34 = *v33;
    }
    if ((v34 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_system_reporter_cold_2();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v35 = *(int **)(v2 + 328);
  else
    v35 = (int *)_os_alloc_once();
  v36 = *v35;
  if ((*v35 & 8) != 0)
  {
    if ((v36 & 2) != 0)
    {
      printf(" sr_q_counts         %lu\n", *(_QWORD *)(a1 + 120));
      v36 = *v35;
    }
    if ((v36 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_system_reporter_cold_1();
  }
}

void dump_idents(uint64_t a1)
{
  int *v2;
  int v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;

  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v2 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v2 = (int *)_os_alloc_once();
  v3 = *v2;
  if ((*v2 & 8) != 0)
  {
    if ((v3 & 2) != 0)
    {
      puts("dump_idents.. ");
      v3 = *v2;
    }
    if ((v3 & 4) != 0)
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v4)
        dump_idents_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  for (i = *(_QWORD *)(a1 + 40); i; i = *(_QWORD *)(i + 16))
    dump_ident((const void **)i);
}

void dump_ident(const void **a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  int *v5;
  int v6;
  int *v7;
  int v8;
  int *v9;
  int v10;
  int *v11;
  int v12;
  int *v13;
  int v14;
  int *v15;
  int v16;
  int *v17;
  int v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  int v28;
  int *v29;
  int v30;

  v2 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v3 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 8) != 0)
  {
    if ((v4 & 2) != 0)
    {
      printf("symptom_ctrl at %p\n", a1);
      v4 = *v3;
    }
    if ((v4 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_ident_cold_10();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v5 = *(int **)(v2 + 328);
  else
    v5 = (int *)_os_alloc_once();
  v6 = *v5;
  if ((*v5 & 8) != 0)
  {
    if ((v6 & 2) != 0)
    {
      printf(" sc_magic               %x\n", *(_DWORD *)a1);
      v6 = *v5;
    }
    if ((v6 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_ident_cold_9();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v7 = *(int **)(v2 + 328);
  else
    v7 = (int *)_os_alloc_once();
  v8 = *v7;
  if ((*v7 & 8) != 0)
  {
    if ((v8 & 2) != 0)
    {
      printf(" sc_flags               %x\n", *((_DWORD *)a1 + 1));
      v8 = *v7;
    }
    if ((v8 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_ident_cold_8();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v9 = *(int **)(v2 + 328);
  else
    v9 = (int *)_os_alloc_once();
  v10 = *v9;
  if ((*v9 & 8) != 0)
  {
    if ((v10 & 2) != 0)
    {
      printf(" sc_id                  %x\n", *((_DWORD *)a1 + 2));
      v10 = *v9;
    }
    if ((v10 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_ident_cold_7();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v11 = *(int **)(v2 + 328);
  else
    v11 = (int *)_os_alloc_once();
  v12 = *v11;
  if ((*v11 & 8) != 0)
  {
    if ((v12 & 2) != 0)
    {
      printf(" sc_link                %p\n", a1[2]);
      v12 = *v11;
    }
    if ((v12 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_ident_cold_6();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v13 = *(int **)(v2 + 328);
  else
    v13 = (int *)_os_alloc_once();
  v14 = *v13;
  if ((*v13 & 8) != 0)
  {
    if ((v14 & 2) != 0)
    {
      printf(" sc_active_link         %p\n", a1[3]);
      v14 = *v13;
    }
    if ((v14 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_ident_cold_5();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v15 = *(int **)(v2 + 328);
  else
    v15 = (int *)_os_alloc_once();
  v16 = *v15;
  if ((*v15 & 8) != 0)
  {
    if ((v16 & 2) != 0)
    {
      printf(" sc_active_link_in_use  %d\n", *((unsigned __int8 *)a1 + 40));
      v16 = *v15;
    }
    if ((v16 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_ident_cold_4();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v17 = *(int **)(v2 + 328);
  else
    v17 = (int *)_os_alloc_once();
  v18 = *v17;
  if ((*v17 & 8) != 0)
  {
    if ((v18 & 2) != 0)
    {
      puts(" sc_filter ...");
      v18 = *v17;
    }
    if ((v18 & 4) != 0)
    {
      v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v19)
        dump_ident_cold_3(v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  dump_creation_filter((_DWORD *)a1 + 11);
  if (*(_QWORD *)(v2 + 320) == -1)
    v27 = *(int **)(v2 + 328);
  else
    v27 = (int *)_os_alloc_once();
  v28 = *v27;
  if ((*v27 & 8) != 0)
  {
    if ((v28 & 2) != 0)
    {
      printf(" sc_symptom_q len %lu\n", a1[8]);
      v28 = *v27;
    }
    if ((v28 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_ident_cold_2();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v29 = *(int **)(v2 + 328);
  else
    v29 = (int *)_os_alloc_once();
  v30 = *v29;
  if ((*v29 & 8) != 0)
  {
    if ((v30 & 2) != 0)
    {
      printf(" sc_symptom_q first, last %p %p\n", a1[9], a1[10]);
      v30 = *v29;
    }
    if ((v30 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_ident_cold_1();
  }
}

void dump_creation_filter(_DWORD *a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  int *v5;
  int v6;
  int *v7;
  int v8;

  v2 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v3 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 8) != 0)
  {
    if ((v4 & 2) != 0)
    {
      printf("    cf_queue_len_max    %x\n", a1[2]);
      v4 = *v3;
    }
    if ((v4 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_creation_filter_cold_3();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v5 = *(int **)(v2 + 328);
  else
    v5 = (int *)_os_alloc_once();
  v6 = *v5;
  if ((*v5 & 8) != 0)
  {
    if ((v6 & 2) != 0)
    {
      printf("    cf_queue_len_alert  %x\n", a1[1]);
      v6 = *v5;
    }
    if ((v6 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_creation_filter_cold_2();
  }
  if (*(_QWORD *)(v2 + 320) == -1)
    v7 = *(int **)(v2 + 328);
  else
    v7 = (int *)_os_alloc_once();
  v8 = *v7;
  if ((*v7 & 8) != 0)
  {
    if ((v8 & 2) != 0)
    {
      printf("    cf_filter_seqno     %x\n", a1[3]);
      v8 = *v7;
    }
    if ((v8 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      dump_creation_filter_cold_1();
  }
}

void dump_active_idents(uint64_t a1)
{
  int *v2;
  int v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;

  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v2 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v2 = (int *)_os_alloc_once();
  v3 = *v2;
  if ((*v2 & 8) != 0)
  {
    if ((v3 & 2) != 0)
    {
      puts("dump_active_idents.. ");
      v3 = *v2;
    }
    if ((v3 & 4) != 0)
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v4)
        dump_active_idents_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  for (i = *(_QWORD *)(a1 + 64); i; i = *(_QWORD *)(i + 24))
    dump_ident((const void **)i);
}

uint64_t symptom_transport_send(uint64_t a1, const void *a2, size_t a3)
{
  xpc_object_t v6;
  uint64_t v7;
  void *v8;
  int *v9;
  int v10;
  size_t v11;
  int *v13;
  int v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = *(_QWORD *)(MEMORY[0x24BDACB38] + 320);
  if (v6)
  {
    v8 = v6;
    if (v7 == -1)
      v9 = *(int **)(MEMORY[0x24BDACB38] + 328);
    else
      v9 = (int *)_os_alloc_once();
    v10 = *v9;
    if ((*v9 & 2) != 0)
    {
      printf("symptom_transport_send:  ptr %p size %lu \n", a2, a3);
      v10 = *v9;
    }
    if ((v10 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      symptom_transport_send_cold_2();
    v11 = *(_QWORD *)(a1 + 264) + a3;
    ++*(_QWORD *)(a1 + 256);
    *(_QWORD *)(a1 + 264) = v11;
    xpc_dictionary_set_data(v8, "payload", a2, a3);
    if (*(_BYTE *)(a1 + 352))
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 136), v8);
    xpc_release(v8);
    return 0;
  }
  else
  {
    if (v7 == -1)
      v13 = *(int **)(MEMORY[0x24BDACB38] + 328);
    else
      v13 = (int *)_os_alloc_once();
    v14 = *v13;
    if ((*v13 & 2) != 0)
    {
      puts("symptom_transport_send:  ERR no dictionary");
      v14 = *v13;
    }
    if ((v14 & 4) != 0)
    {
      v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v15)
        symptom_transport_send_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    return 0xFFFFFFFFLL;
  }
}

char *read_symptom(uint64_t a1, _DWORD *a2, unint64_t *a3)
{
  char *v4;
  uint64_t **v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t **i;
  size_t v14;

  v4 = (char *)a2;
  v6 = *(uint64_t ***)(a1 + 104);
  if (v6)
  {
    v7 = 0;
    do
    {
      v7 += *((unsigned __int16 *)v6 + 7) + 4;
      v6 = (uint64_t **)*v6;
    }
    while (v6);
    v8 = v7 + 92;
  }
  else
  {
    v8 = 92;
  }
  if (v8 <= *a3)
  {
    *a2 = 5767170;
    v9 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(a2 + 5) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(a2 + 1) = v9;
    v10 = *(_OWORD *)(a1 + 48);
    v11 = *(_OWORD *)(a1 + 64);
    v12 = *(_OWORD *)(a1 + 80);
    *(_QWORD *)(a2 + 21) = *(_QWORD *)(a1 + 96);
    *(_OWORD *)(a2 + 17) = v12;
    *(_OWORD *)(a2 + 13) = v11;
    *(_OWORD *)(a2 + 9) = v10;
    sr_log_symptom_action(a1, 0x8000);
    v4 += 92;
    *a3 -= 92;
    for (i = *(uint64_t ***)(a1 + 104); i; i = (uint64_t **)*i)
    {
      v14 = *((unsigned __int16 *)i + 7) + 4;
      memcpy(v4, (char *)i + 12, v14);
      v4 += v14;
      *a3 -= v14;
    }
  }
  return v4;
}

uint64_t symptom_send(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  if (a1)
  {
    sr_log_symptom((uint64_t)a1);
    v2 = a1[14];
    if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
      v3 = *(_QWORD *)(MEMORY[0x24BDACB38] + 328);
    else
      v3 = _os_alloc_once();
    if (!*(_BYTE *)(v3 + 32))
    {
      if (!_dispatch_is_multithreaded())
      {
        *(_BYTE *)(v2 + 352) = 0;
        symptom_free(a1, "Not Multithreaded");
        return 0;
      }
      if (*(_QWORD *)(v3 + 24) != -1)
        dispatch_once_f((dispatch_once_t *)(v3 + 24), (void *)v3, (dispatch_function_t)symptoms_go_multithreaded);
    }
    *(_BYTE *)(v2 + 352) = 1;
    dispatch_async_f(*(dispatch_queue_t *)(v2 + 128), a1, (dispatch_function_t)symptom_post);
    return 0;
  }
  return 0xFFFFFFFFLL;
}

void sr_log_symptom_action(uint64_t a1, int a2)
{
  uint64_t v4;
  _BYTE *v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int *v13;
  int v14;
  int v15;
  char *v16;
  size_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  char __str[150];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
  {
    v5 = *(_BYTE **)(MEMORY[0x24BDACB38] + 328);
    if (!v5)
      return;
  }
  else
  {
    v5 = (_BYTE *)_os_alloc_once();
    if (!v5)
      return;
  }
  if ((*v5 & 1) == 0)
    return;
  v6 = snprintf(__str, 0x95uLL, "Symptom ID %x    ", *(_DWORD *)(a1 + 32));
  v7 = 0;
  if (v6 >= 0x95)
    v8 = 149;
  else
    v8 = v6;
  do
  {
    if (((*(_DWORD *)(a1 + 20) >> v7) & 1) != 0)
    {
      v8 += snprintf(&__str[v8], 149 - v8, "QUAL[%d] %llx ", v7, *(_QWORD *)(a1 + 40 + 8 * v7));
      v9 = 149;
      if (v8 > 0x95)
        break;
    }
    ++v7;
    v9 = v8;
  }
  while (v7 != 8);
  if (a2)
  {
    v10 = 149;
    v11 = snprintf(&__str[v9], 149 - v9, "ACTION:");
    if ((unint64_t)(v9 + v11) < 0x95)
      v10 = v9 + v11;
    if ((a2 & 1) != 0)
    {
      v15 = snprintf(&__str[v10], 149 - v10, " save");
      if ((unint64_t)(v10 + v15) >= 0x95)
        v10 = 149;
      else
        v10 += v15;
      if ((a2 & 2) == 0)
      {
LABEL_15:
        if ((a2 & 0x100) == 0)
          goto LABEL_16;
        goto LABEL_45;
      }
    }
    else if ((a2 & 2) == 0)
    {
      goto LABEL_15;
    }
    v16 = &__str[v10];
    v17 = 149 - v10;
    if ((a2 & 0x1000) != 0)
      v18 = snprintf(v16, v17, " alert-send");
    else
      v18 = snprintf(v16, v17, " alert-pend");
    if ((unint64_t)(v10 + v18) >= 0x95)
      v10 = 149;
    else
      v10 += v18;
    if ((a2 & 0x100) == 0)
    {
LABEL_16:
      if ((a2 & 0x400) == 0)
        goto LABEL_17;
      goto LABEL_49;
    }
LABEL_45:
    v19 = snprintf(&__str[v10], 149 - v10, " drop");
    if ((unint64_t)(v10 + v19) >= 0x95)
      v10 = 149;
    else
      v10 += v19;
    if ((a2 & 0x400) == 0)
    {
LABEL_17:
      if ((a2 & 0x800) == 0)
        goto LABEL_18;
      goto LABEL_53;
    }
LABEL_49:
    v20 = snprintf(&__str[v10], 149 - v10, " (note, dropped older)");
    if ((unint64_t)(v10 + v20) >= 0x95)
      v10 = 149;
    else
      v10 += v20;
    if ((a2 & 0x800) == 0)
    {
LABEL_18:
      if ((a2 & 0x4000) == 0)
        goto LABEL_19;
      goto LABEL_57;
    }
LABEL_53:
    v21 = snprintf(&__str[v10], 149 - v10, " drop (NOMEM)");
    if ((unint64_t)(v10 + v21) >= 0x95)
      v10 = 149;
    else
      v10 += v21;
    if ((a2 & 0x4000) == 0)
    {
LABEL_19:
      if ((a2 & 0x8000) == 0)
      {
LABEL_23:
        snprintf(&__str[v10], 149 - v10, " ALERTS posted %d", *(unsigned __int8 *)(*(_QWORD *)(a1 + 112) + 114));
        goto LABEL_24;
      }
LABEL_20:
      v12 = snprintf(&__str[v10], 149 - v10, " sent");
      if ((unint64_t)(v10 + v12) >= 0x95)
        v10 = 149;
      else
        v10 += v12;
      goto LABEL_23;
    }
LABEL_57:
    v22 = snprintf(&__str[v10], 149 - v10, " reinit");
    if ((unint64_t)(v10 + v22) >= 0x95)
      v10 = 149;
    else
      v10 += v22;
    if ((a2 & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_20;
  }
LABEL_24:
  if (*(_QWORD *)(v4 + 320) == -1)
    v13 = *(int **)(v4 + 328);
  else
    v13 = (int *)_os_alloc_once();
  v14 = *v13;
  if ((*v13 & 2) != 0)
  {
    printf(" SYMPTOM-LOG-STRING: %s\n", __str);
    v14 = *v13;
  }
  if ((v14 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    sr_log_symptom_action_cold_2();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    sr_log_symptom_action_cold_1();
}

void sr_log_symptom(uint64_t a1)
{
  sr_log_symptom_action(a1, 0);
}

void __symptom_transport_connect_block_invoke(uint64_t a1, void *a2)
{
  const void *v4;
  uint64_t v5;
  int *v6;
  int v7;
  int *v8;
  int v9;
  int *v10;
  int v11;
  const char *string;
  uint64_t v13;
  int *v14;
  int v15;
  const char *v16;
  int *v17;
  int v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  unsigned __int16 *data;
  uint64_t v29;
  unsigned __int16 *v30;
  int *v31;
  int v32;
  size_t v33;
  size_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  int *v41;
  int v42;
  _BOOL8 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int *v51;
  int v52;
  _BOOL8 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int *v61;
  int v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int *v71;
  int v72;
  _BOOL8 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  size_t length;

  v4 = (const void *)MEMORY[0x212BB1268](a2);
  v5 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v6 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v6 = (int *)_os_alloc_once();
  v7 = *v6;
  if ((*v6 & 2) != 0)
  {
    printf("symptom_transport_connect event handler called on %p for %p evcount %lu errcount %lu\n", *(const void **)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
    v7 = *v6;
  }
  if ((v7 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    __symptom_transport_connect_block_invoke_cold_10(a1, (uint64_t)a2);
  if (v4 != (const void *)MEMORY[0x24BDACFB8])
  {
    if (v4 == (const void *)MEMORY[0x24BDACFA0])
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
      if (*(_QWORD *)(v5 + 320) == -1)
        v17 = *(int **)(v5 + 328);
      else
        v17 = (int *)_os_alloc_once();
      v18 = *v17;
      if ((*v17 & 2) != 0)
      {
        printf("handling incoming message");
        v18 = *v17;
      }
      if ((v18 & 4) != 0)
      {
        v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v19)
          __symptom_transport_connect_block_invoke_cold_8(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      v27 = *(_QWORD **)(a1 + 32);
      length = 0;
      data = (unsigned __int16 *)xpc_dictionary_get_data(a2, "payload", &length);
      v29 = *(_QWORD *)(v5 + 320);
      if (data)
      {
        v30 = data;
        if (v29 == -1)
          v31 = *(int **)(v5 + 328);
        else
          v31 = (int *)_os_alloc_once();
        v32 = *v31;
        if ((*v31 & 2) != 0)
        {
          printf("handle_incoming_xpc_dictionary:  desc %p size %lu\n", v30, length);
          v32 = *v31;
        }
        if ((v32 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          __symptom_transport_connect_block_invoke_cold_7();
        v33 = length;
        v34 = v27[29] + length;
        ++v27[28];
        v27[29] = v34;
        symptoms_incoming_message((uint64_t)v27, v30, v33);
      }
      else
      {
        if (v29 == -1)
          v41 = *(int **)(v5 + 328);
        else
          v41 = (int *)_os_alloc_once();
        v42 = *v41;
        if ((*v41 & 2) != 0)
        {
          printf("handle_incoming_xpc_dictionary:  ERR message with no payload");
          v42 = *v41;
        }
        if ((v42 & 4) != 0)
        {
          v43 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
          if (v43)
            __symptom_transport_connect_block_invoke_cold_6(v43, v44, v45, v46, v47, v48, v49, v50);
        }
        ++v27[30];
      }
    }
    else
    {
      if (*(_QWORD *)(v5 + 320) == -1)
        v8 = *(int **)(v5 + 328);
      else
        v8 = (int *)_os_alloc_once();
      v9 = *v8;
      if ((*v8 & 2) != 0)
      {
        printf("unexpected message from peer %p", v4);
        v9 = *v8;
      }
      if ((v9 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        __symptom_transport_connect_block_invoke_cold_9();
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
    }
    return;
  }
  if (*(_QWORD *)(v5 + 320) == -1)
    v10 = *(int **)(v5 + 328);
  else
    v10 = (int *)_os_alloc_once();
  v11 = *v10;
  if ((*v10 & 2) != 0)
  {
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
    printf("connection error: %s\n", string);
    v11 = *v10;
  }
  if ((v11 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    __symptom_transport_connect_block_invoke_cold_5(a2);
  if (a2 == (void *)MEMORY[0x24BDACF30])
  {
    sr_log_xpc_event(*(_QWORD *)(a1 + 32), (uint64_t)"SymptomReporter: XPC connection to Symptom Framework interrupted\n");
    v35 = *(_QWORD *)(a1 + 32);
    ++*(_QWORD *)(v35 + 144);
    *(_BYTE *)(v35 + 113) = 0;
    ++*(_QWORD *)(v35 + 328);
    goto LABEL_52;
  }
  if (a2 != (void *)MEMORY[0x24BDACF38])
  {
    v13 = *(_QWORD *)(v5 + 320);
    if (a2 == (void *)MEMORY[0x24BDACF48])
    {
      if (v13 == -1)
        v51 = *(int **)(v5 + 328);
      else
        v51 = (int *)_os_alloc_once();
      v52 = *v51;
      if ((*v51 & 2) != 0)
      {
        puts("symptom_transport: skipping TERMINATION_IMMINENT event");
        v52 = *v51;
      }
      if ((v52 & 4) != 0)
      {
        v53 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v53)
          __symptom_transport_connect_block_invoke_cold_3(v53, v54, v55, v56, v57, v58, v59, v60);
      }
    }
    else
    {
      if (v13 == -1)
        v14 = *(int **)(v5 + 328);
      else
        v14 = (int *)_os_alloc_once();
      v15 = *v14;
      if ((*v14 & 2) != 0)
      {
        v16 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        printf("symptom_transport: unhandled connection error: %s", v16);
        v15 = *v14;
      }
      if ((v15 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        __symptom_transport_connect_block_invoke_cold_4(a2);
    }
    return;
  }
  v36 = *(_QWORD *)(a1 + 32);
  v37 = *(void **)(v36 + 136);
  if (v37)
  {
    xpc_release(v37);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
    v36 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v36 + 136) = 0;
  v38 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v38 + 113) = 0;
  ++*(_QWORD *)(v38 + 336);
  v39 = *(_DWORD *)(v38 + 212) + 1;
  *(_DWORD *)(v38 + 212) = v39;
  if (v39 >= 2)
  {
    *(_DWORD *)(v38 + 212) = 0;
    v40 = *(_QWORD *)(v5 + 320);
LABEL_81:
    if (v40 == -1)
      v71 = *(int **)(v5 + 328);
    else
      v71 = (int *)_os_alloc_once();
    v72 = *v71;
    if ((*v71 & 2) != 0)
    {
      puts("symptom_transport: CONNECTION_INVALID");
      v72 = *v71;
    }
    if ((v72 & 4) != 0)
    {
      v73 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v73)
        __symptom_transport_connect_block_invoke_cold_1(v73, v74, v75, v76, v77, v78, v79, v80);
    }
    v35 = *(_QWORD *)(a1 + 32);
    v81 = *(_QWORD *)(v35 + 152) + 1;
    *(_QWORD *)(v35 + 152) = v81;
    if (v81 >= 4)
    {
      sr_log_xpc_event(v35, (uint64_t)"SymptomReporter: Disabling Symptom Transport after perstent invalid connections\n");
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 115) = 1;
      return;
    }
    if (*(_QWORD *)(v35 + 192) < 0xDF8475800uLL)
      *(_QWORD *)(v35 + 192) = 60000000000;
LABEL_52:
    symptoms_transport_dropped(v35);
    return;
  }
  v40 = *(_QWORD *)(v5 + 320);
  if (!v39)
    goto LABEL_81;
  if (v40 == -1)
    v61 = *(int **)(v5 + 328);
  else
    v61 = (int *)_os_alloc_once();
  v62 = *v61;
  if ((*v61 & 2) != 0)
  {
    printf("symptom_transport: XPC connection invalid for %s, switch to %s\n", "com.apple.usymptomsd", "com.apple.usymptomsd");
    v62 = *v61;
  }
  if ((v62 & 4) != 0)
  {
    v63 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v63)
      __symptom_transport_connect_block_invoke_cold_2(v63, v64, v65, v66, v67, v68, v69, v70);
  }
  symptoms_transport_fastdrop(*(_QWORD *)(a1 + 32));
}

_QWORD *obtain_symptom_framework(int a1, char *a2, size_t a3)
{
  _QWORD *result;
  _QWORD block[6];
  int v8;

  result = find_symptom_reporter_by_name(a1, a2, a3);
  if (!result)
  {
    if (framework_creation_queue_pred != -1)
      dispatch_once(&framework_creation_queue_pred, &__block_literal_global);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __obtain_symptom_framework_block_invoke;
    block[3] = &__block_descriptor_tmp_0;
    v8 = a1;
    block[4] = a2;
    block[5] = a3;
    dispatch_sync((dispatch_queue_t)framework_creation_queue_serialization_q, block);
    return find_symptom_reporter_by_name(a1, a2, a3);
  }
  return result;
}

_QWORD *find_symptom_reporter_by_name(int a1, char *__s2, size_t __n)
{
  uint64_t v6;
  int *v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  int *v12;
  int v13;
  uint64_t v14;
  int *v15;
  int v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  _QWORD *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v7 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v7 = (int *)_os_alloc_once();
  v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    printf("find_symptom_reporter_by_name  %s   len %ld\n", __s2, __n);
    v8 = *v7;
  }
  if ((v8 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    find_symptom_reporter_by_name_cold_2();
  if (*(_QWORD *)(v6 + 320) == -1)
  {
    v9 = *(_QWORD *)(v6 + 328);
    if (!v9)
      goto LABEL_26;
  }
  else
  {
    v9 = _os_alloc_once();
    if (!v9)
      goto LABEL_26;
  }
  v10 = *(_QWORD **)(v9 + 8);
  if (v10)
  {
    v11 = MEMORY[0x24BDACB70];
    while (1)
    {
      if (*(_QWORD *)(v6 + 320) == -1)
        v12 = *(int **)(v6 + 328);
      else
        v12 = (int *)_os_alloc_once();
      v13 = *v12;
      if ((*v12 & 2) != 0)
      {
        printf("find_symptom_reporter_by_name  check sr %p name len %ld\n", v10, v10[4]);
        v13 = *v12;
      }
      if ((v13 & 4) != 0 && os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v14 = v10[4];
        *(_DWORD *)buf = 134218240;
        v22 = v10;
        v23 = 2048;
        v24 = v14;
        _os_log_debug_impl(&dword_20DC0E000, v11, OS_LOG_TYPE_DEBUG, "find_symptom_reporter_by_name  check sr %p name len %ld\n", buf, 0x16u);
      }
      if (*((_DWORD *)v10 + 3) == a1 && v10[4] == __n && !strncmp((const char *)v10[3], __s2, __n))
        return v10;
      v10 = (_QWORD *)*v10;
      if (!v10)
      {
        if (*(_QWORD *)(v6 + 320) == -1)
          break;
        v15 = (int *)_os_alloc_once();
        goto LABEL_27;
      }
    }
  }
LABEL_26:
  v15 = *(int **)(v6 + 328);
LABEL_27:
  v16 = *v15;
  if ((*v15 & 2) != 0)
  {
    puts("find_symptom_reporter_by_name  returns NULL");
    v16 = *v15;
  }
  if ((v16 & 4) != 0)
  {
    v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v17)
      find_symptom_reporter_by_name_cold_1(v17, v18, v19);
  }
  return 0;
}

uint64_t symptoms_go_multithreaded(uint64_t result)
{
  *(_BYTE *)(result + 32) = 1;
  return result;
}

uint64_t symptom_transport_connect(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  xpc_connection_t mach_service;
  _xpc_connection_s *v14;
  int *v16;
  int v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD handler[5];

  v2 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v3 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("symptom_transport_connect called, connecting to %s\n", "com.apple.usymptomsd");
    v4 = *v3;
  }
  if ((v4 & 4) != 0)
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v5)
      symptom_transport_connect_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  mach_service = xpc_connection_create_mach_service("com.apple.usymptomsd", *(dispatch_queue_t *)(a1 + 128), 2uLL);
  *(_QWORD *)(a1 + 136) = mach_service;
  if (mach_service)
  {
    gettimeofday((timeval *)(a1 + 160), 0);
    xpc_connection_set_target_queue(*(xpc_connection_t *)(a1 + 136), *(dispatch_queue_t *)(a1 + 128));
    v14 = *(_xpc_connection_s **)(a1 + 136);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __symptom_transport_connect_block_invoke;
    handler[3] = &__block_descriptor_tmp;
    handler[4] = a1;
    xpc_connection_set_event_handler(v14, handler);
    xpc_connection_resume(*(xpc_connection_t *)(a1 + 136));
    return 0;
  }
  else
  {
    if (*(_QWORD *)(v2 + 320) == -1)
      v16 = *(int **)(v2 + 328);
    else
      v16 = (int *)_os_alloc_once();
    v17 = *v16;
    if ((*v16 & 2) != 0)
    {
      printf("failed to connect to %s\n", "com.apple.usymptomsd");
      v17 = *v16;
    }
    if ((v17 & 4) != 0)
    {
      v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v18)
        symptom_transport_connect_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    return 0xFFFFFFFFLL;
  }
}

_QWORD *symptom_framework_init(unsigned int a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  if (a1 > 0xFF || v4 > 0x400)
    return 0;
  else
    return obtain_symptom_framework(a1, __s, v4);
}

void reevaluate_sr_symptoms(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  int *v5;
  int v6;
  int *v7;
  int v8;
  int *v9;
  int v10;
  const void **v11;
  const void **v12;
  int *v13;
  int v14;
  int *v15;
  int v16;
  int v17;
  char v18;
  char v19[15];
  char v20;
  char v21[15];
  const void **v22;
  const void ***v23;
  uint8_t v24[4];
  uint64_t v25;
  uint8_t buf[4];
  _QWORD *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = a1[5];
  if (v1)
  {
    v3 = MEMORY[0x24BDACB38];
    v4 = MEMORY[0x24BDACB70];
    do
    {
      if (*(_QWORD *)(v3 + 320) == -1)
        v5 = *(int **)(v3 + 328);
      else
        v5 = (int *)_os_alloc_once();
      v6 = *v5;
      if ((*v5 & 2) != 0)
      {
        printf("reevaluate_sr_symptoms: evaluate symptom control %p, id %x\n", (const void *)v1, *(_DWORD *)(v1 + 8));
        v6 = *v5;
      }
      if ((v6 & 4) != 0 && os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v17 = *(_DWORD *)(v1 + 8);
        *(_DWORD *)buf = 134218240;
        v27 = (_QWORD *)v1;
        v28 = 1024;
        LODWORD(v29) = v17;
        _os_log_debug_impl(&dword_20DC0E000, v4, OS_LOG_TYPE_DEBUG, "reevaluate_sr_symptoms: evaluate symptom control %p, id %x\n", buf, 0x12u);
      }
      v22 = 0;
      v23 = &v22;
      if (*(_QWORD *)(v3 + 320) == -1)
        v7 = *(int **)(v3 + 328);
      else
        v7 = (int *)_os_alloc_once();
      v8 = *v7;
      if ((*v7 & 2) != 0)
      {
        printf("reevaluate_sc_symptoms: sr %p sc %p\n", a1, (const void *)v1);
        v8 = *v7;
      }
      if ((v8 & 4) != 0 && os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v27 = a1;
        v28 = 2048;
        v29 = v1;
        _os_log_debug_impl(&dword_20DC0E000, v4, OS_LOG_TYPE_DEBUG, "reevaluate_sc_symptoms: sr %p sc %p\n", buf, 0x16u);
      }
      if (*(_BYTE *)(v1 + 40))
      {
        sym_ctrl_dequeue((uint64_t)a1, v1);
        if (*(_QWORD *)(v3 + 320) == -1)
          v9 = *(int **)(v3 + 328);
        else
          v9 = (int *)_os_alloc_once();
        v10 = *v9;
        if ((*v9 & 2) != 0)
        {
          puts("reevaluate_sc_symptoms: sc was active, dequeued");
          v10 = *v9;
        }
        if ((v10 & 4) != 0 && os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
          reevaluate_sr_symptoms_cold_3(&v20, v21);
        dump_symptom_state((uint64_t)a1);
      }
      v11 = *(const void ***)(v1 + 72);
      if (v11)
      {
        *v23 = v11;
        v23 = *(const void ****)(v1 + 80);
        *(_QWORD *)(v1 + 72) = 0;
        *(_QWORD *)(v1 + 80) = v1 + 72;
      }
      *(_QWORD *)(v1 + 64) = 0;
      while (1)
      {
        v12 = v22;
        if (!v22)
          break;
        v22 = (const void **)*v22;
        if (!v22)
          v23 = &v22;
        update_globals_for_symptom_removal((uint64_t)a1, v12);
        if (*(_QWORD *)(v3 + 320) == -1)
          v13 = *(int **)(v3 + 328);
        else
          v13 = (int *)_os_alloc_once();
        v14 = *v13;
        if ((*v13 & 2) != 0)
        {
          printf("reevaluate_sc_symptoms: evaluate symptom %p\n", v12);
          v14 = *v13;
        }
        if ((v14 & 4) != 0 && os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
          reevaluate_sr_symptoms_cold_2(v24, (uint64_t)v12, &v25);
        handle_symptom(a1, v1, v12);
        if (*(_QWORD *)(v3 + 320) == -1)
          v15 = *(int **)(v3 + 328);
        else
          v15 = (int *)_os_alloc_once();
        v16 = *v15;
        if ((*v15 & 2) != 0)
        {
          puts("reevaluate_sc_symptoms: after evaluate symptom");
          v16 = *v15;
        }
        if ((v16 & 4) != 0 && os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
          reevaluate_sr_symptoms_cold_1(&v18, v19);
      }
      v1 = *(_QWORD *)(v1 + 16);
    }
    while (v1);
  }
}

void ensure_symptom_framework_connect(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  __darwin_time_t tv_sec;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  unint64_t v9;
  int *v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int *v15;
  int v16;
  unint64_t v17;
  dispatch_time_t v18;
  NSObject *v19;
  _QWORD block[5];
  timeval v21;

  v2 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v3 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("ensure_symptom_framework_connect %s, set sr_connect_queued\n", *(const char **)(a1 + 24));
    v4 = *v3;
  }
  if ((v4 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    ensure_symptom_framework_connect_cold_3();
  v21.tv_sec = 0;
  *(_QWORD *)&v21.tv_usec = 0;
  *(_BYTE *)(a1 + 216) = 1;
  gettimeofday(&v21, 0);
  tv_sec = v21.tv_sec;
  v6 = *(_QWORD *)(a1 + 160);
  v7 = __OFSUB__(v21.tv_sec, v6);
  v8 = v21.tv_sec - v6;
  if (v8 < 0 != v7)
    v9 = 0;
  else
    v9 = v8;
  if (*(_QWORD *)(v2 + 320) == -1)
    v10 = *(int **)(v2 + 328);
  else
    v10 = (int *)_os_alloc_once();
  v11 = *v10;
  if ((*v10 & 2) != 0)
  {
    printf("ensure_connect, update backoff value, uptime_secs %lu\n", v9);
    v11 = *v10;
  }
  if ((v11 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    ensure_symptom_framework_connect_cold_2();
  if (v9 < 0x259)
  {
    v12 = *(_QWORD *)(a1 + 192);
    if (v12 < 0x8BB2C97000)
    {
      v12 *= 2;
      v13 = 2 * *(_QWORD *)(a1 + 200);
      *(_QWORD *)(a1 + 192) = v12;
      *(_QWORD *)(a1 + 200) = v13;
    }
    if (v12 > 0x8BB2C97000)
    {
      *(_QWORD *)(a1 + 192) = 600000000000;
      v12 = 600000000000;
    }
    if (*(_QWORD *)(a1 + 200) > 0xB2D05E00uLL)
      *(_QWORD *)(a1 + 200) = 3000000000;
  }
  else
  {
    v12 = 100000000;
    *(int64x2_t *)(a1 + 192) = vdupq_n_s64(0x5F5E100uLL);
  }
  v14 = (unint64_t)rand_r((unsigned int *)(a1 + 208)) % *(_QWORD *)(a1 + 200) + v12;
  if (*(_QWORD *)(v2 + 320) == -1)
    v15 = *(int **)(v2 + 328);
  else
    v15 = (int *)_os_alloc_once();
  v16 = *v15;
  if ((*v15 & 2) != 0)
  {
    printf("delay_after_interruption is %lld nanoseconds\n", v14);
    v16 = *v15;
  }
  if ((v16 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    ensure_symptom_framework_connect_cold_1();
  v17 = 1000000000 * (tv_sec - *(_QWORD *)(a1 + 176));
  if (v14 <= v17)
  {
    connect_symptom_framework(a1);
  }
  else
  {
    v18 = dispatch_time(0, v14 - v17);
    v19 = *(NSObject **)(a1 + 128);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __ensure_symptom_framework_connect_block_invoke;
    block[3] = &__block_descriptor_tmp_53;
    block[4] = a1;
    dispatch_after(v18, v19, block);
  }
}

void connect_symptom_framework(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int *v10;
  int v11;
  uint64_t v12;
  int *v13;
  int v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  int v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  int v24;

  v2 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v3 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    puts("connect_symptom_framework called");
    v4 = *v3;
  }
  if ((v4 & 4) != 0)
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v5)
      connect_symptom_framework_cold_5(v5, v6, v7);
  }
  if (*(_QWORD *)(a1 + 136))
  {
    v8 = *(_QWORD *)(v2 + 320);
LABEL_11:
    ++*(_QWORD *)(a1 + 344);
    *(_WORD *)(a1 + 113) = 1;
    if (v8 == -1)
      v10 = *(int **)(v2 + 328);
    else
      v10 = (int *)_os_alloc_once();
    v11 = *v10;
    if ((*v10 & 2) != 0)
    {
      printf("connect_symptom_framework: %s transport connect OK, unset sr_connect_queued\n", *(const char **)(a1 + 24));
      v11 = *v10;
    }
    if ((v11 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      connect_symptom_framework_cold_4();
    *(_BYTE *)(a1 + 216) = 0;
    v12 = *(_QWORD *)(v2 + 320);
    if (*(_QWORD *)(a1 + 80))
    {
      if (v12 == -1)
        v13 = *(int **)(v2 + 328);
      else
        v13 = (int *)_os_alloc_once();
      v14 = *v13;
      if ((*v13 & 2) != 0)
      {
        puts("connect_symptom_framework: ensure_alert");
        v14 = *v13;
      }
      if ((v14 & 4) != 0)
      {
        v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v15)
          connect_symptom_framework_cold_3(v15, v16, v17);
      }
      ensure_alert(a1);
      v12 = *(_QWORD *)(v2 + 320);
    }
    if (v12 == -1)
      v18 = *(int **)(v2 + 328);
    else
      v18 = (int *)_os_alloc_once();
    v19 = *v18;
    if ((*v18 & 2) != 0)
    {
      puts("connect_symptom_framework: exit");
      v19 = *v18;
    }
    if ((v19 & 4) != 0)
    {
      v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v20)
        connect_symptom_framework_cold_2(v20, v21, v22);
    }
    return;
  }
  v9 = symptom_transport_connect(a1);
  v8 = *(_QWORD *)(v2 + 320);
  if ((v9 & 0x80000000) == 0)
    goto LABEL_11;
  if (v8 == -1)
    v23 = *(int **)(v2 + 328);
  else
    v23 = (int *)_os_alloc_once();
  v24 = *v23;
  if ((*v23 & 2) != 0)
  {
    printf("connect_symptom_framework: %s transport connect failed, unset sr_connect_queued\n", *(const char **)(a1 + 24));
    v24 = *v23;
  }
  if ((v24 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    connect_symptom_framework_cold_1();
  *(_BYTE *)(a1 + 216) = 0;
  ensure_symptom_framework_connect(a1);
}

void __obtain_symptom_framework_block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  unsigned __int8 *v3;
  _QWORD *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int *v13;
  int v14;
  const char *v15;
  timeval label;

  v1 = *(_DWORD *)(a1 + 48);
  v3 = *(unsigned __int8 **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = malloc_type_calloc(1uLL, 0x168uLL, 0x10B0040F933FA69uLL);
  v5 = MEMORY[0x24BDACB38];
  if (!v4)
    goto LABEL_25;
  v6 = malloc_type_malloc(v2 + 1, 0xC50D3191uLL);
  v4[3] = v6;
  if (!v6)
    goto LABEL_24;
  label.tv_sec = 0;
  if (!v3)
  {
    __break(1u);
LABEL_38:
    v10 = _os_alloc_once();
    if (!v10)
      goto LABEL_25;
    goto LABEL_19;
  }
  if ((unint64_t)(v2 + 1) < 2)
  {
    v7 = v2 + 1;
    if (v2 != -1)
    {
LABEL_11:
      if (v7)
        *v6 = 0;
    }
  }
  else
  {
    v7 = 1;
    v8 = v2 + 1;
    while (1)
    {
      v9 = *v3;
      *v6 = v9;
      if (!v9)
        break;
      ++v6;
      ++v3;
      if ((unint64_t)--v8 <= 1)
      {
        if (v2 != -1)
          goto LABEL_11;
        break;
      }
    }
  }
  v4[4] = v2;
  asprintf((char **)&label, "%s symptoms", (const char *)v4[3]);
  if (label.tv_sec)
  {
    v4[16] = dispatch_queue_create((const char *)label.tv_sec, 0);
    if (label.tv_sec)
      free((void *)label.tv_sec);
  }
  if (!v4[16])
  {
    v12 = (void *)v4[3];
    if (v12)
      free(v12);
LABEL_24:
    free(v4);
    v4 = 0;
    goto LABEL_25;
  }
  label.tv_sec = 0;
  *(_QWORD *)&label.tv_usec = 0;
  v4[5] = 0;
  *((_DWORD *)v4 + 3) = v1;
  *((_DWORD *)v4 + 4) = 1;
  *((_DWORD *)v4 + 2) = 195165933;
  v4[6] = v4 + 5;
  v4[7] = 0;
  v4[8] = 0;
  v4[9] = v4 + 8;
  v4[10] = 0;
  *(_WORD *)((char *)v4 + 113) = 0;
  *((_DWORD *)v4 + 53) = 0;
  *((int64x2_t *)v4 + 12) = vdupq_n_s64(0x5F5E100uLL);
  *(_OWORD *)(v4 + 11) = xmmword_20DC17AB0;
  *((_DWORD *)v4 + 26) = 1;
  gettimeofday(&label, 0);
  *((_DWORD *)v4 + 52) = label.tv_usec ^ LODWORD(label.tv_sec);
  if (*(_QWORD *)(v5 + 320) != -1)
    goto LABEL_38;
  v10 = *(_QWORD *)(v5 + 328);
  if (!v10)
    goto LABEL_25;
LABEL_19:
  v11 = *(_QWORD *)(v10 + 8);
  *v4 = v11;
  if (!v11)
    *(_QWORD *)(v10 + 16) = v4;
  *(_QWORD *)(v10 + 8) = v4;
LABEL_25:
  if (*(_QWORD *)(v5 + 320) == -1)
    v13 = *(int **)(v5 + 328);
  else
    v13 = (int *)_os_alloc_once();
  v14 = *v13;
  if ((*v13 & 2) != 0)
  {
    if (v4)
      v15 = (const char *)v4[3];
    else
      v15 = "<nil>";
    printf("create_symptom_framework returns %p, name %s\n", v4, v15);
    v14 = *v13;
  }
  if ((v14 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    __obtain_symptom_framework_block_invoke_cold_1();
}

dispatch_queue_t __framework_creation_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("symptom_init_queue", 0);
  framework_creation_queue_serialization_q = (uint64_t)result;
  return result;
}

BOOL is_valid_symptom(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 result;

  result = 0;
  if (*(_DWORD *)(a1 + 8) == -823263507)
  {
    v1 = *(_QWORD *)(a1 + 112);
    if (v1)
    {
      if (*(_DWORD *)(v1 + 8) == 195165933)
        return 1;
    }
  }
  return result;
}

BOOL is_valid_symptom_reporter(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) == 195165933;
}

BOOL is_valid_symptom_ctrl(_DWORD *a1)
{
  return *a1 == -858980627;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

_QWORD *symptom_create(uint64_t a1)
{
  char *v2;
  unint64_t v3;
  size_t v4;
  _QWORD *v5;
  size_t v7;
  unint64_t v8;
  size_t v9;
  _QWORD *v10;
  _QWORD *v11;
  char *v12;
  char *v13;
  const char *v14;
  int *v15;
  int v16;

  if (!a1)
    return 0;
  v2 = strrchr((char *)a1, 46);
  if (!v2)
    return 0;
  v3 = (unint64_t)&v2[-a1];
  if ((unint64_t)&v2[-a1] < 2)
    return 0;
  v4 = strlen((const char *)(a1 + 1));
  if (v4 > 0x64)
    return 0;
  v7 = v4;
  v8 = v3 - 31;
  if (v3 >= 0x1F)
  {
    v9 = 31;
  }
  else
  {
    v8 = 0;
    v9 = v3;
  }
  v10 = obtain_symptom_framework(0, (char *)(a1 + v8), v9);
  v11 = _basic_symptom_create();
  v5 = v11;
  if (v11)
  {
    *((_DWORD *)v11 + 8) = 0;
    v11[14] = v10;
    v12 = (char *)malloc_type_calloc(1uLL, v7 + 28, 0x36C593A7uLL);
    if (v12)
    {
      v13 = v12;
      *((_DWORD *)v12 + 2) = 11337453;
      *((_WORD *)v12 + 6) = 8;
      *((_WORD *)v12 + 7) = (v7 & 0xFFFC) + 12;
      *((_DWORD *)v12 + 4) = 0;
      *((_DWORD *)v12 + 5) = v7 + 1;
      v14 = v12 + 24;
      memcpy(v12 + 24, (const void *)a1, v7 + 1);
      if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
        v15 = *(int **)(MEMORY[0x24BDACB38] + 328);
      else
        v15 = (int *)_os_alloc_once();
      v16 = *v15;
      if ((*v15 & 2) != 0)
      {
        printf("symptom_create copied name %s\n", v14);
        v16 = *v15;
      }
      if ((v16 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        symptom_create_cold_1((uint64_t)v14);
      *((_DWORD *)v13 + 4) = 0x20000000;
      *(_QWORD *)v13 = 0;
      v5[13] = v13;
      *((_DWORD *)v5 + 5) |= 0x40000000u;
    }
  }
  return v5;
}

uint64_t symptom_set_additional_qualifier(uint64_t a1, int a2, size_t a3, const void *a4)
{
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  v8 = ((a3 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 8;
  if (get_symptom_qual_size(a1) + v8 > 0x2710)
    return 0xFFFFFFFFLL;
  if ((unint64_t)get_symptom_qual_count(a1) > 0x13)
    return 0xFFFFFFFFLL;
  v9 = malloc_type_calloc(1uLL, a3 + 27, 0xC0EB7443uLL);
  if (!v9)
    return 0xFFFFFFFFLL;
  v10 = v9;
  *((_DWORD *)v9 + 2) = 11337453;
  *((_WORD *)v9 + 6) = 8;
  *((_WORD *)v9 + 7) = v8;
  *((_DWORD *)v9 + 4) = a2;
  *((_DWORD *)v9 + 5) = a3;
  if (a3)
  {
    if (a4)
      memcpy(v9 + 3, a4, a3);
  }
  result = 0;
  *v10 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v10;
  *(_DWORD *)(a1 + 20) |= 0x40000000u;
  return result;
}

uint64_t symptom_send_immediate(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (a1)
  {
    *(_BYTE *)(a1 + 17) = 4;
    sr_log_symptom(a1);
    v2 = *(_QWORD *)(a1 + 112);
    if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
      v3 = *(_QWORD *)(MEMORY[0x24BDACB38] + 328);
    else
      v3 = _os_alloc_once();
    if (!*(_BYTE *)(v3 + 32))
    {
      if (!_dispatch_is_multithreaded())
      {
        *(_BYTE *)(v2 + 352) = 0;
        symptom_free((_QWORD *)a1, "Not Multithreaded");
        return 0;
      }
      if (*(_QWORD *)(v3 + 24) != -1)
        dispatch_once_f((dispatch_once_t *)(v3 + 24), (void *)v3, (dispatch_function_t)symptoms_go_multithreaded);
    }
    *(_BYTE *)(v2 + 352) = 1;
    dispatch_async_f(*(dispatch_queue_t *)(v2 + 128), (void *)a1, (dispatch_function_t)symptom_post);
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t symptom_framework_set_version(uint64_t a1, int a2)
{
  BOOL v2;
  uint64_t v3;

  if (a1)
    v2 = (a2 - 1) >= 2;
  else
    v2 = 1;
  v3 = !v2;
  if ((_DWORD)v3 == 1)
    *(_DWORD *)(a1 + 16) = a2;
  return v3;
}

void sr_log_xpc_event(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 24);
    v5 = 136315394;
    v6 = v4;
    v7 = 2080;
    v8 = a2;
    _os_log_impl(&dword_20DC0E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: %s", (uint8_t *)&v5, 0x16u);
  }
}

_DWORD *set_symptom_verbosity(int a1)
{
  _DWORD *result;

  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
  {
    result = *(_DWORD **)(MEMORY[0x24BDACB38] + 328);
    if (!result)
      return result;
  }
  else
  {
    result = (_DWORD *)_os_alloc_once();
    if (!result)
      return result;
  }
  *result = a1;
  return result;
}

uint64_t symptom_framework_stats(uint64_t a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  if (a2)
  {
    *(_BYTE *)(a1 + 320) = *(_BYTE *)(a1 + 113);
    v2 = *(_OWORD *)(a1 + 224);
    v3 = *(_OWORD *)(a1 + 240);
    v4 = *(_OWORD *)(a1 + 272);
    a2[2] = *(_OWORD *)(a1 + 256);
    a2[3] = v4;
    *a2 = v2;
    a2[1] = v3;
    v5 = *(_OWORD *)(a1 + 336);
    v7 = *(_OWORD *)(a1 + 288);
    v6 = *(_OWORD *)(a1 + 304);
    a2[6] = *(_OWORD *)(a1 + 320);
    a2[7] = v5;
    a2[4] = v7;
    a2[5] = v6;
  }
  return 1;
}

void send_current(uint64_t a1)
{
  int v2;
  int *v3;
  int v4;
  int *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  __int16 v11;
  char *v12;
  unint64_t v13;

  v3 = (int *)(a1 + 108);
  v2 = *(_DWORD *)(a1 + 108);
  if ((v2 + 1) > 1)
    v4 = v2 + 1;
  else
    v4 = 1;
  *v3 = v4;
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v5 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v5 = (int *)_os_alloc_once();
  v6 = *v5;
  if ((*v5 & 2) != 0)
  {
    printf("send_current: ack_id %d\n", *v3);
    v6 = *v5;
  }
  if ((v6 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    send_current_cold_1(v3, v7, v8);
  v9 = (char *)malloc_type_malloc(0x28A0uLL, 0x8F63F342uLL);
  if (v9)
  {
    v10 = v9;
    *((_DWORD *)v9 + 1) = 2359299;
    v11 = (_WORD)v9 + 8;
    fill_sender_id(a1, (uint64_t)(v9 + 8));
    v13 = 10344;
    v12 = read_symptoms(a1, v10 + 44, &v13);
    *(_DWORD *)v12 = 262184;
    *((_DWORD *)v12 + 1) = *(_DWORD *)(a1 + 108);
    *(_WORD *)v10 = 1;
    *((_WORD *)v10 + 1) = (_WORD)v12 + 4 - v11 + 8;
    symptom_transport_send(a1, v10, (unsigned __int16)((_WORD)v12 + 4 - v11 + 8) + 4);
    *(_BYTE *)(a1 + 112) = 1;
    ++*(_QWORD *)(a1 + 280);
    free(v10);
  }
}

void symptoms_transport_dropped(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  int *v5;
  int v6;
  int *v7;
  int v8;
  int *v9;
  int v10;

  v2 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v3 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("symptoms_transport_dropped %s\n", *(const char **)(a1 + 24));
    v4 = *v3;
  }
  if ((v4 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    symptoms_transport_dropped_cold_4();
  gettimeofday((timeval *)(a1 + 176), 0);
  ++*(_DWORD *)(a1 + 104);
  if (*(_QWORD *)(v2 + 320) == -1)
    v5 = *(int **)(v2 + 328);
  else
    v5 = (int *)_os_alloc_once();
  v6 = *v5;
  if ((*v5 & 2) != 0)
  {
    printf("reset_sr_filters for %s\n", *(const char **)(a1 + 24));
    v6 = *v5;
  }
  if ((v6 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    symptoms_transport_dropped_cold_3();
  reevaluate_sr_symptoms((_QWORD *)a1);
  if (*(_QWORD *)(a1 + 80))
  {
    if (*(_QWORD *)(v2 + 320) == -1)
      v7 = *(int **)(v2 + 328);
    else
      v7 = (int *)_os_alloc_once();
    v8 = *v7;
    if ((*v7 & 2) != 0)
    {
      printf("symptoms_transport_dropped %s, immediate reconnect\n", *(const char **)(a1 + 24));
      v8 = *v7;
    }
    if ((v8 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      symptoms_transport_dropped_cold_2();
    if (*(_BYTE *)(a1 + 216))
    {
      if (*(_QWORD *)(v2 + 320) == -1)
        v9 = *(int **)(v2 + 328);
      else
        v9 = (int *)_os_alloc_once();
      v10 = *v9;
      if ((*v9 & 2) != 0)
      {
        printf("symptoms_transport_dropped %s, immediate reconnect, but connect queued\n", *(const char **)(a1 + 24));
        v10 = *v9;
      }
      if ((v10 & 4) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        symptoms_transport_dropped_cold_1();
    }
    else
    {
      ensure_symptom_framework_connect(a1);
    }
  }
}

uint64_t fill_sender_id(uint64_t result, uint64_t a2)
{
  int v2;
  unsigned __int8 *v3;
  _BYTE *v4;
  uint64_t v5;
  int v6;

  v2 = *(_DWORD *)(result + 12);
  *(_BYTE *)a2 = *(_DWORD *)(result + 16);
  *(_BYTE *)(a2 + 1) = v2;
  *(_WORD *)(a2 + 2) = 0;
  v3 = *(unsigned __int8 **)(result + 24);
  if (v3)
  {
    v4 = (_BYTE *)(a2 + 4);
    v5 = 32;
    while (1)
    {
      v6 = *v3;
      *v4 = v6;
      if (!v6)
        break;
      ++v4;
      ++v3;
      if ((unint64_t)--v5 <= 1)
      {
        *v4 = 0;
        return result;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void __ensure_symptom_framework_connect_block_invoke(uint64_t a1)
{
  int *v2;
  int v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 320) == -1)
    v2 = *(int **)(MEMORY[0x24BDACB38] + 328);
  else
    v2 = (int *)_os_alloc_once();
  v3 = *v2;
  if ((*v2 & 2) != 0)
  {
    puts("ensure_symptom_framework_connect: connect after delay");
    v3 = *v2;
  }
  if ((v3 & 4) != 0)
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v4)
      __ensure_symptom_framework_connect_block_invoke_cold_1(v4, v5, v6);
  }
  connect_symptom_framework(*(_QWORD *)(a1 + 32));
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_4_0(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_8_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_10_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 8u);
}

void OUTLINED_FUNCTION_11_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sr_log_symptom_action_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "%s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void sr_log_symptom_action_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " SYMPTOM-LOG-STRING: %s\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dump_basic_symptom_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sb_ident           %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_basic_symptom_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sb_timestamp_nsecs %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_basic_symptom_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sb_timestamp_secs  %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_basic_symptom_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sb_flags           %x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_basic_symptom_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sb_version         %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_symptom_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "   s_magic      %x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_symptom_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "   s_link next  %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dump_symptom_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " Symptom at %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dump_status_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "srs_sym_basic   ...\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void dump_status_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "srs_num_queued          %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_status_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "srs_num_alerts          %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_status_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "srs_ack_id              %0x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_status_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "srs_flags               %0x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_status_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "srs_version             %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_status_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "Reporter status:\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void dump_creation_filter_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "    cf_filter_seqno     %x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_creation_filter_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "    cf_queue_len_alert  %x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_creation_filter_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "    cf_queue_len_max    %x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_ident_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sc_symptom_q first, last %p %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dump_ident_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sc_symptom_q len %lu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dump_ident_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, " sc_filter ...\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void dump_ident_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sc_active_link_in_use  %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_ident_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sc_active_link         %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dump_ident_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sc_link                %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dump_ident_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sc_id                  %x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_ident_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sc_flags               %x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_ident_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sc_magic               %x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_ident_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "symptom_ctrl at %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dump_active_idents_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "dump_active_idents.. \n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void dump_idents_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "dump_idents.. \n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void dump_system_reporter_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sr_q_counts         %lu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dump_system_reporter_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sr_alert_sent       %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_system_reporter_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sr_filter_seqno  %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void dump_system_reporter_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, " sr_filter ...\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void dump_system_reporter_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sr_num_active  %lu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dump_system_reporter_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sr_ctrl_active_head first, last  %p %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dump_system_reporter_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sr_ctrl_num    %lu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dump_system_reporter_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, " sr_ctrl_head        first, last  %p %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dump_system_reporter_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "System global... \n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void symptom_create_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = a1;
  _os_log_debug_impl(&dword_20DC0E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "symptom_create copied name %s\n", (uint8_t *)&v1, 0xCu);
}

void symptom_transport_send_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "symptom_transport_send:  ERR no dictionary\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void symptom_transport_send_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "symptom_transport_send:  ptr %p size %lu \n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void symptom_transport_connect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "failed to connect to %s\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void symptom_transport_connect_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "symptom_transport_connect called, connecting to %s\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __symptom_transport_connect_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "symptom_transport: CONNECTION_INVALID\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __symptom_transport_connect_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "symptom_transport: XPC connection invalid for %s, switch to %s\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __symptom_transport_connect_block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "symptom_transport: skipping TERMINATION_IMMINENT event\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __symptom_transport_connect_block_invoke_cold_4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v1, "symptom_transport: unhandled connection error: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __symptom_transport_connect_block_invoke_cold_5(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v1, "connection error: %s\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __symptom_transport_connect_block_invoke_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "handle_incoming_xpc_dictionary:  ERR message with no payload", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __symptom_transport_connect_block_invoke_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "handle_incoming_xpc_dictionary:  desc %p size %lu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void __symptom_transport_connect_block_invoke_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "handling incoming message", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __symptom_transport_connect_block_invoke_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "unexpected message from peer %p", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void __symptom_transport_connect_block_invoke_cold_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 224);
  v4 = *(_QWORD *)(v2 + 240);
  v5 = 134218752;
  v6 = v2;
  v7 = 2048;
  v8 = a2;
  v9 = 2048;
  v10 = v3;
  v11 = 2048;
  v12 = v4;
  _os_log_debug_impl(&dword_20DC0E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "symptom_transport_connect event handler called on %p for %p evcount %lu errcount %lu\n", (uint8_t *)&v5, 0x2Au);
}

void symptom_free_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "Free symptom %p, %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void symptom_post_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "symptom_post obtained control structure at %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void symptom_post_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "symptom_post entry, symptom pointer %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void handle_symptom_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "push_symptom_to_nhm, symptom %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void handle_symptom_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "symptom_post action flags %x from filter %p\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void handle_symptom_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "filter_new_symptom: cf->cf_queue_len_max == 0, DROP", v3);
  OUTLINED_FUNCTION_2();
}

void handle_symptom_cold_4(int a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_10_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "filter_new_symptom: return %x\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

void handle_symptom_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "filter_new_symptom: q->sq_len %zdd >= cf->cf_queue_len_alert %d ALERT\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void handle_symptom_cold_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "filter_new_symptom: DROP_HEAD\n", v3);
  OUTLINED_FUNCTION_2();
}

void handle_symptom_cold_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "filter_new_symptom: too old DROP", v3);
  OUTLINED_FUNCTION_2();
}

void handle_symptom_cold_8(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v2, "filter_new_symptom: DROP_HEAD (Age limit)\n", v3);
}

void handle_symptom_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "filter_new_symptom: entry, q->sq_len %lu cf->cf_queue_len_max %d cf->cf_queue_len_alert %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void handle_symptom_cold_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "handle_symptom: filter with sc filter\n", v3);
  OUTLINED_FUNCTION_2();
}

void handle_symptom_cold_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "handle_symptom: filter with global filter\n", v3);
  OUTLINED_FUNCTION_2();
}

void handle_symptom_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_11_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "handle_symptom entry, symptom pointer %p   sc filter seqno %d  sr seqno %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void symptoms_incoming_message_cold_1(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v2, "apply_new_filters", v3);
}

void symptoms_incoming_message_cold_2(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  OUTLINED_FUNCTION_10_0(&dword_20DC0E000, MEMORY[0x24BDACB70], (uint64_t)a3, "new_symptoms_read: ack_id %d\n", a1);
}

void symptoms_incoming_message_cold_3(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 134217984;
  *a3 = a2;
  OUTLINED_FUNCTION_14(&dword_20DC0E000, MEMORY[0x24BDACB70], (uint64_t)a3, "SymptomReporter incoming_message, SYMTLV_READ sz too small %zd", a1);
}

void symptoms_incoming_message_cold_4(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 134217984;
  *a3 = a2;
  OUTLINED_FUNCTION_14(&dword_20DC0E000, MEMORY[0x24BDACB70], (uint64_t)a3, "SymptomReporter incoming_message, SYMTLV_TERMINAL_ACK sz too small %zd", a1);
}

void symptoms_incoming_message_cold_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "+++ SYMPTOMSD MESSAGE RECEIVED +++\n", v3);
  OUTLINED_FUNCTION_2();
}

void send_current_cold_1(int *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109120;
  v4[1] = v3;
  OUTLINED_FUNCTION_10_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "send_current: ack_id %d\n", (uint8_t *)v4);
  OUTLINED_FUNCTION_2();
}

void symptoms_transport_dropped_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "symptoms_transport_dropped %s, immediate reconnect, but connect queued\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void symptoms_transport_dropped_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "symptoms_transport_dropped %s, immediate reconnect\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void symptoms_transport_dropped_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "reset_sr_filters for %s\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void symptoms_transport_dropped_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "symptoms_transport_dropped %s\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void reevaluate_sr_symptoms_cold_1(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v2, "reevaluate_sc_symptoms: after evaluate symptom\n", v3);
}

void reevaluate_sr_symptoms_cold_2(uint8_t *buf, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)buf = 134217984;
  *a3 = a2;
  _os_log_debug_impl(&dword_20DC0E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "reevaluate_sc_symptoms: evaluate symptom %p\n", buf, 0xCu);
}

void reevaluate_sr_symptoms_cold_3(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v2, "reevaluate_sc_symptoms: sc was active, dequeued\n", v3);
}

void ensure_symptom_framework_connect_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "delay_after_interruption is %lld nanoseconds\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void ensure_symptom_framework_connect_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "ensure_connect, update backoff value, uptime_secs %lu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void ensure_symptom_framework_connect_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "ensure_symptom_framework_connect %s, set sr_connect_queued\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void connect_symptom_framework_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "connect_symptom_framework: %s transport connect failed, unset sr_connect_queued\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void connect_symptom_framework_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "connect_symptom_framework: exit\n", v3);
  OUTLINED_FUNCTION_2();
}

void connect_symptom_framework_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "connect_symptom_framework: ensure_alert\n", v3);
  OUTLINED_FUNCTION_2();
}

void connect_symptom_framework_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "connect_symptom_framework: %s transport connect OK, unset sr_connect_queued\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void connect_symptom_framework_cold_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "connect_symptom_framework called\n", v3);
  OUTLINED_FUNCTION_2();
}

void find_symptom_reporter_by_name_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "find_symptom_reporter_by_name  returns NULL\n", v3);
  OUTLINED_FUNCTION_2();
}

void find_symptom_reporter_by_name_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "find_symptom_reporter_by_name  %s   len %ld\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void __obtain_symptom_framework_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "create_symptom_framework returns %p, name %s\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void ensure_sym_ctrl_is_queued_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "After ensure_sym_ctrl_is_queued %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void ensure_sym_ctrl_is_queued_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "ensure_sym_ctrl_is_queued, sc %p, in use %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void update_globals_for_symptom_removal_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "update globals to remove symptom at %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void read_symptoms_cold_1(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v2, "read_symptoms_from_q: no next symptom available", v3);
}

void read_symptoms_cold_2(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v2, "read_symptoms_from_q: added next symptom\n", v3);
}

void read_symptoms_cold_3(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], v2, "read_symptoms_from_q: entry\n", v3);
}

void read_symptoms_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "read_symptoms for sr %p %s\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void sym_ctrl_dequeue_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_20DC0E000, MEMORY[0x24BDACB70], v0, "After sym_ctrl_dequeue  %p\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void __ensure_symptom_framework_connect_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_20DC0E000, MEMORY[0x24BDACB70], a3, "ensure_symptom_framework_connect: connect after delay\n", v3);
  OUTLINED_FUNCTION_2();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

uint64_t _dispatch_is_fork_of_multithreaded_parent()
{
  return MEMORY[0x24BDAC9A8]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x24BDAC9B0]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x24BDACB30]();
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

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int rand_r(unsigned int *a1)
{
  return MEMORY[0x24BDAFA40](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

