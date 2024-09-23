uint64_t pc_session_add_metric(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  if (*(_QWORD *)(a1 + 192))
    return 37;
  if (a2 == 0x6D656D64656C7461)
    v4 = 0x6375726D656D0000;
  else
    v4 = a2;
  if (v4 != 0x7065616B646C7461)
    return _add_metric(a1, v4, (void **)(a1 + 120), (int *)(a1 + 128), 0);
  result = _add_metric(a1, 0x6375726D656D0000, (void **)(a1 + 120), (int *)(a1 + 128), 0);
  if (!(_DWORD)result)
    return _add_metric(a1, v4, (void **)(a1 + 120), (int *)(a1 + 128), 0);
  return result;
}

int *pc_session_create(int *a1, uint64_t a2, uint64_t a3)
{
  int *v6;
  int *v7;
  int *epmetrics;

  v6 = (int *)malloc_type_calloc(1uLL, 0xD8uLL, 0x10B00400786544BuLL);
  if (!v6)
  {
    if (a1)
    {
      v7 = 0;
      *a1 = *__error();
      return v7;
    }
    return 0;
  }
  v7 = v6;
  *((_QWORD *)v6 + 1) = 0xFFFFFFFF00000001;
  epmetrics = create_epmetrics(v6 + 32, 0);
  *((_QWORD *)v7 + 15) = epmetrics;
  if (!epmetrics)
  {
    pc_session_destroy(v7);
    return 0;
  }
  *((_QWORD *)v7 + 19) = a2;
  *((_QWORD *)v7 + 20) = a3;
  if (a1)
    *a1 = 0;
  return v7;
}

uint64_t pc_session_end(uint64_t a1)
{
  char *v2;
  int v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t i;
  int v9;

  v9 = 107;
  if (!a1)
    return 22;
  if (!*(_QWORD *)(a1 + 192))
    return 45;
  v2 = snapshot_create(a1, &v9);
  *(_QWORD *)(a1 + 200) = v2;
  if (v2)
  {
    v3 = *(_DWORD *)(a1 + 8);
    if (*((_DWORD *)v2 + 1) == v3)
    {
      v4 = *(unsigned int *)(a1 + 128);
      if ((int)v4 >= 1)
      {
        v5 = *(_QWORD **)(a1 + 120);
        do
        {
          if (*v5 == 0x6375726D656D0000)
          {
            *v5 = 0x6D656D64656C7461;
            v5[1] = "mem_delta";
          }
          v5 += 11;
          --v4;
        }
        while (v4);
      }
      return 0;
    }
    else
    {
      v9 = 3;
      if (v3 >= 1)
      {
        for (i = 0; i < v3; ++i)
        {
          if (*(_DWORD *)(a1 + 12 + 4 * i) == -1)
          {
            warnc(v9, "%s", (const char *)(a1 + 16));
            v3 = *(_DWORD *)(a1 + 8);
          }
        }
      }
    }
  }
  return v9;
}

uint64_t pc_session_begin(uint64_t a1)
{
  char *v3;
  unsigned int v4;

  v4 = 107;
  if (!a1)
    return 22;
  if (*(_QWORD *)(a1 + 192))
    return 37;
  v3 = snapshot_create(a1, (int *)&v4);
  *(_QWORD *)(a1 + 192) = v3;
  if (v3)
    return 0;
  else
    return v4;
}

char *snapshot_create(uint64_t a1, int *a2)
{
  char *v4;
  char *v5;
  int v6;
  uint64_t v7;
  size_t v8;
  int *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  int v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;

  if (!a1)
  {
    v20 = 22;
    goto LABEL_30;
  }
  v4 = (char *)malloc_type_calloc(1uLL, 56 * *(int *)(a1 + 8) + 8, 0x5D90896DuLL);
  if (!v4)
  {
    v20 = *__error();
    goto LABEL_30;
  }
  v5 = v4;
  v6 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)v4 = v6;
  if (v6 >= 1)
  {
    v7 = 0;
    do
    {
      v8 = *(int *)(a1 + 128);
      v9 = (int *)&v5[56 * v7];
      v9[12] = v8;
      v10 = malloc_type_calloc(v8, 0x60uLL, 0x10500403B44B1C9uLL);
      *((_QWORD *)v9 + 7) = v10;
      v11 = v9 + 14;
      if (v10)
      {
        if ((int)v8 >= 1)
        {
          v12 = 0;
          v13 = 0;
          do
          {
            v14 = *v11 + v13;
            v15 = *(_QWORD *)(a1 + 120) + v12;
            v17 = *(_OWORD *)(v15 + 48);
            v16 = *(_OWORD *)(v15 + 64);
            v18 = *(_OWORD *)(v15 + 32);
            *(_QWORD *)(v14 + 80) = *(_QWORD *)(v15 + 80);
            *(_OWORD *)(v14 + 48) = v17;
            *(_OWORD *)(v14 + 64) = v16;
            *(_OWORD *)(v14 + 32) = v18;
            v19 = *(_OWORD *)(v15 + 16);
            *(_OWORD *)v14 = *(_OWORD *)v15;
            *(_OWORD *)(v14 + 16) = v19;
            v13 += 96;
            v12 += 88;
          }
          while (96 * v8 != v13);
        }
      }
      else
      {
        v20 = *__error();
        if (v20)
          goto LABEL_29;
      }
      ++v7;
    }
    while (v7 < *(int *)v5);
  }
  if (*(int *)(a1 + 8) >= 1)
  {
    v21 = 0;
    v22 = (const char *)(a1 + 16);
    v23 = (uint64_t)(v5 + 8);
    v24 = (int *)(a1 + 12);
    do
    {
      v25 = *v24;
      if ((_DWORD)v25 == -1)
      {
        if (!*v22)
        {
          v20 = 3;
LABEL_29:
          pc_snapshot_destroy(v5);
LABEL_30:
          v5 = 0;
          if (a2 && v20)
          {
            v5 = 0;
            *a2 = v20;
          }
          return v5;
        }
        if (!findPIDForProcName(v22, v24))
        {
          v25 = *v24;
          if ((v25 & 0x80000000) == 0)
          {
LABEL_21:
            if (!measure_proc_snapshot(a1, v25, (uint64_t)v22, v23))
              ++*((_DWORD *)v5 + 1);
          }
        }
      }
      else
      {
        if ((_DWORD)v25 == -2)
        {
          v20 = 45;
          goto LABEL_29;
        }
        if ((v25 & 0x80000000) == 0)
          goto LABEL_21;
      }
      ++v21;
      v22 += 33;
      v23 += 56;
      ++v24;
    }
    while (v21 < *(int *)(a1 + 8));
  }
  return v5;
}

uint64_t measure_proc_snapshot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *custom_metric_id;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  rusage_info_t buffer[2];
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
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
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
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  *(_OWORD *)buffer = 0u;
  v25 = 0u;
  if (!a4)
  {
LABEL_47:
    v8 = 22;
    goto LABEL_48;
  }
  *(_DWORD *)a4 = a2;
  v7 = a2;
  if (a3)
  {
    __strlcpy_chk();
    v7 = *(_DWORD *)a4;
  }
  if (proc_pid_rusage(v7, 4, buffer))
  {
LABEL_5:
    v8 = *__error();
    if ((_DWORD)v8)
      goto LABEL_48;
    return v8;
  }
  if (*(int *)(a4 + 40) < 1)
    return 0;
  v9 = 0;
  v10 = 0;
  while (1)
  {
    v11 = *(_QWORD *)(a4 + 48);
    v12 = *(_QWORD *)(v11 + v9);
    if (v12 <= 0x6C6966657065616ALL)
      break;
    if (v12 > 0x72636E747065616ALL)
    {
      if (v12 == 0x72636E747065616BLL)
      {
        v18 = *((_QWORD *)&v41 + 1);
        if (!*((_QWORD *)&v41 + 1))
          v18 = *((_QWORD *)&v28 + 1);
        v16 = (double)(v18 / 1024);
        goto LABEL_36;
      }
      if (v12 == 0x73746F7264697274)
      {
        v17 = *((_QWORD *)&v38 + 1);
        goto LABEL_30;
      }
      goto LABEL_40;
    }
    if (v12 == 0x6C6966657065616BLL)
    {
      v17 = v39;
      goto LABEL_30;
    }
    if (v12 != 0x7065616B646C7461)
      goto LABEL_40;
    if (*(_QWORD *)(a1 + 192))
    {
      v14 = v11 + v9;
      *(_QWORD *)(v11 + v9) = 0x72636E747065616BLL;
      v15 = *((_QWORD *)&v41 + 1);
      if (!*((_QWORD *)&v41 + 1))
        v15 = *((_QWORD *)&v28 + 1);
      v16 = (double)(v15 / 1024);
      goto LABEL_37;
    }
    if (proc_reset_footprint_interval())
      goto LABEL_5;
    *(_QWORD *)(v11 + v9) = 0;
LABEL_38:
    ++v10;
    v9 += 96;
    if (v10 >= *(int *)(a4 + 40))
      return 0;
  }
  if (v12 > 0x63707574696D64FFLL)
  {
    if (v12 == 0x63707574696D6500)
    {
      v16 = abstime_to_ns(*((_QWORD *)&v25 + 1) + v25);
      goto LABEL_36;
    }
    if (v12 == 0x6375726D656D0000)
    {
      if (*((_QWORD *)&v29 + 1))
        *(_BYTE *)(a4 + 37) = 1;
      v17 = *((_QWORD *)&v28 + 1);
LABEL_30:
      v13 = v17 >> 10;
LABEL_31:
      v16 = (double)v13;
LABEL_36:
      v14 = v11 + v9;
LABEL_37:
      *(double *)(v14 + 88) = v16;
      goto LABEL_38;
    }
  }
  else
  {
    if (!v12)
      goto LABEL_38;
    if (v12 == 0x637075696E737472)
    {
      v13 = *((_QWORD *)&v39 + 1) / 0x3E8uLL;
      goto LABEL_31;
    }
  }
LABEL_40:
  custom_metric_id = session_find_custom_metric_id(a1, *(_QWORD *)(v11 + v9));
  if (!custom_metric_id)
    goto LABEL_47;
  v20 = custom_metric_id;
  v21 = custom_metric_id[5];
  if (!v21)
    goto LABEL_47;
  v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 16))(v21, a1, v12, a2, v11 + v9 + 88);
  if (!(_DWORD)v22)
    goto LABEL_38;
  v8 = v22;
  if (v20[2])
  {
    warnc(v22, "error measuring metric %s for PID %d");
    return v8;
  }
LABEL_48:
  warnc(v8, "PID %d");
  return v8;
}

double abstime_to_ns(uint64_t a1)
{
  if (abstime_to_ns_have_factor != -1)
    dispatch_once(&abstime_to_ns_have_factor, &__block_literal_global_6);
  return *(double *)&abstime_to_ns_to_ns_factor * (double)a1;
}

uint64_t pc_session_destroy(int *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  FILE *v15;
  char *v16;
  char *v17;

  if (!a1)
    return 22;
  v2 = *(void **)a1;
  if (v2)
    free(v2);
  v3 = (void *)*((_QWORD *)a1 + 7);
  if (v3)
  {
    if ((a1[16] & 0x80000000) == 0)
    {
      v4 = 0;
      do
        free(*(void **)(*((_QWORD *)a1 + 7) + 8 * v4));
      while (v4++ < a1[16]);
      v3 = (void *)*((_QWORD *)a1 + 7);
    }
    free(v3);
  }
  v6 = (void *)*((_QWORD *)a1 + 10);
  if (v6)
    free(v6);
  v7 = (void *)*((_QWORD *)a1 + 11);
  if (v7)
    free(v7);
  v8 = (void *)*((_QWORD *)a1 + 13);
  if (v8)
    free(v8);
  v9 = (void *)*((_QWORD *)a1 + 12);
  if (v9)
    free(v9);
  v10 = (void *)*((_QWORD *)a1 + 15);
  if (v10)
    free(v10);
  v11 = (void *)*((_QWORD *)a1 + 17);
  if (v11)
  {
    if (a1[36] >= 1)
    {
      v12 = 0;
      v13 = 0;
      do
      {
        custom_metric_clean_up(*((_QWORD *)a1 + 17) + v12);
        ++v13;
        v12 += 56;
      }
      while (v13 < a1[36]);
      v11 = (void *)*((_QWORD *)a1 + 17);
    }
    free(v11);
  }
  v14 = (void *)*((_QWORD *)a1 + 22);
  if (v14)
    free(v14);
  v15 = (FILE *)*((_QWORD *)a1 + 21);
  if (v15)
    fclose(v15);
  v16 = (char *)*((_QWORD *)a1 + 24);
  if (v16)
    pc_snapshot_destroy(v16);
  v17 = (char *)*((_QWORD *)a1 + 25);
  if (v17)
    pc_snapshot_destroy(v17);
  free(a1);
  return 0;
}

uint64_t pc_snapshot_destroy(char *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v2 = *(_DWORD *)a1;
    if (*(int *)a1 >= 1)
    {
      v3 = 0;
      v4 = 56;
      do
      {
        v5 = *(void **)&a1[v4];
        if (v5)
        {
          free(v5);
          v2 = *(_DWORD *)a1;
        }
        ++v3;
        v4 += 56;
      }
      while (v3 < v2);
    }
    free(a1);
  }
  return 0;
}

int *create_epmetrics(int *result, int *a2)
{
  int *v3;
  uint64_t i;
  int v5;
  void *v6;
  void *v7;
  _OWORD v8[2];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v8[0] = xmmword_206345020;
  v8[1] = xmmword_206345030;
  v9 = 0x73746F7264697274;
  if (result)
  {
    v3 = result;
    for (i = 0; i != 40; i += 8)
    {
      v5 = add_metric(*(_QWORD *)((char *)v8 + i), &v7, v3, 0);
      if (v5 == 78)
        v5 = add_metric(0, &v7, v3, 0);
      if (v5)
      {
        result = 0;
        v6 = v7;
        goto LABEL_11;
      }
    }
    v6 = v7;
    result = (int *)v7;
    if (v7)
      goto LABEL_13;
LABEL_11:
    if (v6)
    {
      free(v6);
      result = 0;
    }
  }
  else
  {
    v5 = 22;
  }
LABEL_13:
  if (a2)
  {
    if (v5)
      *a2 = v5;
  }
  return result;
}

uint64_t _add_metric(uint64_t a1, uint64_t a2, void **a3, int *a4, char **a5)
{
  uint64_t v5;
  int *v6;
  char **v7;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char v27;
  const char **v28;
  const char **v29;
  uint64_t v30;
  char *v31;
  int v32;
  char *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  char *v55;
  int *v56;
  char **v57;
  int v58;

  v5 = 22;
  if (!a3)
    return v5;
  v6 = a4;
  if (!a4)
    return v5;
  v7 = a5;
  v9 = (char *)*a3;
  if (*a3)
  {
    v10 = *a4;
    v11 = &v9[88 * (int)v10];
    v12 = v10 + 1;
    while (--v12)
    {
      v13 = v11 - 88;
      v14 = *((_QWORD *)v11 - 11);
      v11 -= 88;
      if (v14 == a2)
      {
        if (!a5)
          return 0;
        v5 = 0;
        *a5 = v13;
        return v5;
      }
    }
  }
  v15 = 792;
  do
  {
    v16 = v15 - 88;
    if (v15 == 88)
    {
      if (!a1)
        return 22;
      v19 = *(_QWORD *)(a1 + 136);
      if (!v19)
        return 22;
      v20 = *(unsigned int *)(a1 + 144);
      if ((int)v20 < 1)
        return 22;
      while (*(_QWORD *)v19 != a2)
      {
        v19 += 56;
        v5 = 22;
        if (!--v20)
          return v5;
      }
      v18 = 0;
      if (v9)
        goto LABEL_24;
      goto LABEL_27;
    }
    v17 = *(_QWORD *)((char *)&s_all_known_metrics + v15 - 176);
    v15 -= 88;
  }
  while (v17 != a2);
  v18 = (char *)&s_all_known_metrics + v16 - 88;
  if (a2 == 0x637075696E737472)
  {
    if (!is_monotonic_active())
      return 78;
    v19 = 0;
    if (!*a3)
      goto LABEL_27;
LABEL_24:
    v21 = *v6;
    goto LABEL_28;
  }
  v19 = 0;
  if (v9)
    goto LABEL_24;
LABEL_27:
  v21 = 0;
LABEL_28:
  v22 = (char *)malloc_type_calloc(v21 + 1, 0x58uLL, 0x105004040444690uLL);
  if (!v22)
    return *__error();
  v23 = v22;
  v24 = v21;
  v58 = v21 + 1;
  if (v21 < 1)
  {
    LODWORD(v25) = 0;
    if (v16)
    {
LABEL_39:
      v38 = &v23[88 * v25];
      v39 = *((_OWORD *)v18 + 1);
      *(_OWORD *)v38 = *(_OWORD *)v18;
      *((_OWORD *)v38 + 1) = v39;
      v40 = *((_OWORD *)v18 + 2);
      v41 = *((_OWORD *)v18 + 3);
      v42 = *((_OWORD *)v18 + 4);
      *((_QWORD *)v38 + 10) = *((_QWORD *)v18 + 10);
      *((_OWORD *)v38 + 3) = v41;
      *((_OWORD *)v38 + 4) = v42;
      *((_OWORD *)v38 + 2) = v40;
      goto LABEL_44;
    }
  }
  else
  {
    v56 = v6;
    v57 = v7;
    v25 = 0;
    v26 = v18;
    v27 = 0;
    v55 = v26;
    v28 = (const char **)(v26 + 32);
    if (v16)
      v29 = v28;
    else
      v29 = (const char **)(v19 + 24);
    v30 = 32;
    while (1)
    {
      v31 = (char *)*a3;
      v32 = strcmp(*(const char **)((char *)*a3 + v30), *v29);
      if ((v27 & 1) != 0)
      {
        if (v32)
          break;
      }
      v27 |= v32 == 0;
      v33 = &v23[v30];
      v34 = *(_OWORD *)&v31[v30 - 16];
      *((_OWORD *)v33 - 2) = *(_OWORD *)&v31[v30 - 32];
      *((_OWORD *)v33 - 1) = v34;
      v35 = *(_OWORD *)&v31[v30];
      v36 = *(_OWORD *)&v31[v30 + 16];
      v37 = *(_OWORD *)&v31[v30 + 32];
      *((_QWORD *)v33 + 6) = *(_QWORD *)&v31[v30 + 48];
      *((_OWORD *)v33 + 1) = v36;
      *((_OWORD *)v33 + 2) = v37;
      *(_OWORD *)v33 = v35;
      ++v25;
      v30 += 88;
      if (v24 == v25)
      {
        LODWORD(v25) = v24;
        break;
      }
    }
    v6 = v56;
    v7 = v57;
    v18 = v55;
    if (v16)
      goto LABEL_39;
  }
  if (v19)
  {
    v43 = &v23[88 * v25];
    v44 = *(_QWORD *)(v19 + 8);
    v45 = *(_QWORD *)(v19 + 16);
    v46 = *(_QWORD *)(v19 + 24);
    *(_QWORD *)v43 = *(_QWORD *)v19;
    *((_QWORD *)v43 + 1) = v45;
    *((_QWORD *)v43 + 2) = v44;
    *((_QWORD *)v43 + 4) = v46;
    v43[24] = *(_BYTE *)(v19 + 32);
  }
LABEL_44:
  if ((int)v25 < (int)v24)
  {
    v47 = 88 * v25;
    do
    {
      v48 = (uint64_t)&v23[v47 + 88];
      v49 = (char *)*a3 + v47;
      v50 = *((_OWORD *)v49 + 1);
      *(_OWORD *)v48 = *(_OWORD *)v49;
      *(_OWORD *)(v48 + 16) = v50;
      v51 = *((_OWORD *)v49 + 2);
      v52 = *((_OWORD *)v49 + 3);
      v53 = *((_OWORD *)v49 + 4);
      *(_QWORD *)(v48 + 80) = *((_QWORD *)v49 + 10);
      *(_OWORD *)(v48 + 48) = v52;
      *(_OWORD *)(v48 + 64) = v53;
      *(_OWORD *)(v48 + 32) = v51;
      v47 += 88;
      LODWORD(v25) = v25 + 1;
    }
    while ((int)v24 > (int)v25);
  }
  if (*a3)
    free(*a3);
  *a3 = v23;
  *v6 = v58;
  if (!v7)
    return 0;
  v5 = 0;
  *v7 = v18;
  return v5;
}

uint64_t add_metric(uint64_t a1, void **a2, int *a3, uint64_t a4)
{
  return _add_metric(a4, a1, a2, a3, 0);
}

uint64_t is_monotonic_active()
{
  if (is_monotonic_active_got_monotonic != -1)
    dispatch_once(&is_monotonic_active_got_monotonic, &__block_literal_global);
  return is_monotonic_active_monotonic_on;
}

uint64_t pc_session_get_procname(uint64_t a1)
{
  if (a1)
    return a1 + 16;
  else
    return 0;
}

uint64_t pc_session_set_procpid(uint64_t a1, int pid)
{
  uint64_t v2;
  int *v5;

  if (!a1)
    return 22;
  if (*(_QWORD *)(a1 + 192))
    return 37;
  *(_DWORD *)(a1 + 12) = pid;
  if (proc_name(pid, (void *)(a1 + 16), 0x21u) > 0)
    return 0;
  v5 = __error();
  v2 = *v5;
  warnc(*v5, "PID %d", pid);
  return v2;
}

uint64_t pc_session_get_values(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;

  result = 22;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 192))
    {
      v5 = *(_DWORD *)(a1 + 8);
      if (v5 < 1)
      {
        return 0;
      }
      else
      {
        v6 = 0;
        v7 = *(_DWORD *)(a1 + 128);
        do
        {
          if (v7 >= 1)
          {
            v8 = 0;
            v9 = 0;
            v10 = *(unsigned int *)(a1 + 4 * v6 + 12);
            do
            {
              v11 = (uint64_t *)(*(_QWORD *)(a1 + 120) + v8);
              v12 = *v11;
              v13 = v11[1];
              v15 = 0;
              v16 = 0.0;
              v14 = 0;
              if (v12)
              {
                result = pc_session_get_value(a1, v6, v12, &v16, &v15, &v14);
                if ((_DWORD)result)
                  return result;
                (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, const char *, double))(a2 + 16))(a2, v6, a1 + 33 * v6 + 16, v10, v12, v13, v15, v14, v16);
                v7 = *(_DWORD *)(a1 + 128);
              }
              ++v9;
              v8 += 88;
            }
            while (v9 < v7);
            v5 = *(_DWORD *)(a1 + 8);
          }
          result = 0;
          ++v6;
        }
        while (v6 < v5);
      }
    }
    else
    {
      return 45;
    }
  }
  return result;
}

uint64_t pc_session_get_value(uint64_t a1, int a2, uint64_t a3, double *a4, uint64_t *a5, const char **a6)
{
  uint64_t result;
  _DWORD *v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  double *v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  _QWORD *custom_metric_id;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;

  v64 = 0x43E0000000000000;
  result = 22;
  if (a1 && a4 && a5)
  {
    v10 = *(_DWORD **)(a1 + 192);
    if (!v10)
      return 45;
    if (*v10 <= a2)
      return 34;
    if (a3 <= 0x6D656D64656C7460)
    {
      if (!a3)
        return 93;
      if (a3 == 0x6375726D656D0000)
      {
        if (*(_QWORD *)(a1 + 200))
          v20 = *(_QWORD *)(a1 + 200);
        else
          v20 = *(_QWORD *)(a1 + 192);
        if (*(_BYTE *)(v20 + 56 * a2 + 45))
          return 93;
        v21 = *(unsigned int *)(v20 + 56 * a2 + 48);
        if ((int)v21 < 1)
          return 93;
        v16 = 0;
        v22 = *(_QWORD **)(v20 + 56 * a2 + 56);
        v23 = v22;
        do
        {
          v24 = *v23;
          v23 += 12;
          if (v24 == 0x6375726D656D0000)
            v16 = (double *)v22;
          v22 = v23;
          --v21;
        }
        while (v21);
LABEL_72:
        if (v16)
        {
LABEL_73:
          v55 = v16[11];
LABEL_90:
          v64 = *(_QWORD *)&v55;
LABEL_91:
          v62 = *((_QWORD *)v16 + 2);
          *a4 = v55;
          *a5 = v62;
          if (!a6)
            return 0;
          v63 = pdunit_iorunit(v62);
          result = 0;
          *a6 = v63;
          return result;
        }
        return 93;
      }
      v13 = 0x6C6966657065616BLL;
      goto LABEL_15;
    }
    if (a3 == 0x6D656D64656C7461)
    {
      v25 = *(_QWORD *)(a1 + 200);
      if (!v25)
        return 93;
      v26 = *(unsigned int *)(v25 + 56 * a2 + 48);
      if ((int)v26 < 1)
        return 93;
      v27 = 0;
      v28 = *(_QWORD **)(v25 + 56 * a2 + 56);
      v29 = v28;
      do
      {
        v30 = *v29;
        v29 += 12;
        if (v30 == 0x6375726D656D0000)
          v27 = (double *)v28;
        v28 = v29;
        --v26;
      }
      while (v26);
      if (!v27)
        return 93;
      v31 = v10[14 * a2 + 12];
      if ((int)v31 < 1)
        return 93;
      v16 = 0;
      v32 = *(_QWORD **)&v10[14 * a2 + 14];
      v33 = v32;
      do
      {
        v34 = *v33;
        v33 += 12;
        if (v34 == 0x6375726D656D0000)
          v16 = (double *)v32;
        v32 = v33;
        --v31;
      }
      while (v31);
    }
    else
    {
      if (a3 != 0x7065616B646C7461)
      {
        v13 = 0x72636E747065616BLL;
LABEL_15:
        if (a3 == v13)
        {
          v14 = *(_QWORD *)(a1 + 200);
          if (v14)
          {
            v15 = *(unsigned int *)(v14 + 56 * a2 + 48);
            if ((int)v15 < 1)
              return 93;
            v16 = 0;
            v17 = *(_QWORD **)(v14 + 56 * a2 + 56);
            v18 = v17;
            do
            {
              v19 = *v18;
              v18 += 12;
              if (v19 == a3)
                v16 = (double *)v17;
              v17 = v18;
              --v15;
            }
            while (v15);
          }
          else
          {
            v51 = v10[14 * a2 + 12];
            if ((int)v51 < 1)
              return 93;
            v16 = 0;
            v52 = *(_QWORD **)&v10[14 * a2 + 14];
            v53 = v52;
            do
            {
              v54 = *v53;
              v53 += 12;
              if (v54 == a3)
                v16 = (double *)v52;
              v52 = v53;
              --v51;
            }
            while (v51);
          }
          goto LABEL_72;
        }
        v45 = *(_QWORD *)(a1 + 200);
        if (v45 && (v46 = *(unsigned int *)(v45 + 56 * a2 + 48), (int)v46 >= 1))
        {
          v47 = 0;
          v48 = *(_QWORD **)(v45 + 56 * a2 + 56);
          v49 = v48;
          do
          {
            v50 = *v49;
            v49 += 12;
            if (v50 == a3)
              v47 = (double *)v48;
            v48 = v49;
            --v46;
          }
          while (v46);
        }
        else
        {
          v47 = 0;
        }
        v56 = v10[14 * a2 + 12];
        if ((int)v56 < 1)
          return 93;
        v16 = 0;
        v57 = *(_QWORD **)&v10[14 * a2 + 14];
        v58 = v57;
        do
        {
          v59 = *v58;
          v58 += 12;
          if (v59 == a3)
            v16 = (double *)v57;
          v57 = v58;
          --v56;
        }
        while (v56);
        if (!v16)
          return 93;
        if (!v47)
          goto LABEL_73;
        custom_metric_id = session_find_custom_metric_id(a1, a3);
        if (custom_metric_id)
        {
          v61 = custom_metric_id[6];
          if (v61)
          {
            result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, double, double))(v61 + 16))(v61, a1, a3, &v64, v16[11], v47[11]);
            if ((_DWORD)result)
              return result;
            v55 = *(double *)&v64;
            goto LABEL_91;
          }
        }
        v44 = v47[11];
LABEL_89:
        v55 = v44 - v16[11];
        goto LABEL_90;
      }
      v35 = *(_QWORD *)(a1 + 200);
      if (!v35)
        return 93;
      v36 = *(unsigned int *)(v35 + 56 * a2 + 48);
      if ((int)v36 < 1)
        return 93;
      v27 = 0;
      v37 = *(_QWORD **)(v35 + 56 * a2 + 56);
      v38 = v37;
      do
      {
        v39 = *v38;
        v38 += 12;
        if (v39 == 0x72636E747065616BLL)
          v27 = (double *)v37;
        v37 = v38;
        --v36;
      }
      while (v36);
      if (!v27)
        return 93;
      v40 = v10[14 * a2 + 12];
      if ((int)v40 < 1)
        return 93;
      v16 = 0;
      v41 = *(_QWORD **)&v10[14 * a2 + 14];
      v42 = v41;
      do
      {
        v43 = *v42;
        v42 += 12;
        if (v43 == 0x6375726D656D0000)
          v16 = (double *)v41;
        v41 = v42;
        --v40;
      }
      while (v40);
    }
    if (!v16)
      return 93;
    v44 = v27[11];
    goto LABEL_89;
  }
  return result;
}

const char *pdunit_iorunit(uint64_t a1)
{
  const char *result;
  uint64_t v3;

  result = 0;
  if (a1 > 0x9008BFFFFFFFFFFLL)
  {
    if (a1 == 0x9008C0000000000)
    {
      v3 = MEMORY[0x24BECE180];
      return *(const char **)v3;
    }
    if (a1 == 0x6600008200000000)
    {
      v3 = MEMORY[0x24BECE188];
      return *(const char **)v3;
    }
  }
  else if (a1)
  {
    if (a1 == 0x100007600000000)
    {
      v3 = MEMORY[0x24BECE1C0];
      return *(const char **)v3;
    }
  }
  else
  {
    return "#none";
  }
  return result;
}

_QWORD *session_find_custom_metric_id(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v4;

  result = *(_QWORD **)(a1 + 136);
  if (result)
  {
    v4 = *(unsigned int *)(a1 + 144);
    if ((int)v4 < 1)
    {
      return 0;
    }
    else
    {
      while (*result != a2)
      {
        result += 7;
        if (!--v4)
          return 0;
      }
    }
  }
  return result;
}

double __abstime_to_ns_block_invoke()
{
  double result;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    result = (double)*(unint64_t *)&result / (double)v1;
    abstime_to_ns_to_ns_factor = *(_QWORD *)&result;
  }
  return result;
}

uint64_t __is_monotonic_active_block_invoke()
{
  pid_t v0;
  uint64_t result;
  _OWORD v2[15];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v4 = 0u;
  v5 = 0u;
  v3 = 0u;
  memset(v2, 0, sizeof(v2));
  v0 = getpid();
  result = proc_pid_rusage(v0, 4, (rusage_info_t *)v2);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v3 + 1))
      is_monotonic_active_monotonic_on = 1;
  }
  return result;
}

uint64_t findPIDForProcName(const char *a1, int *a2)
{
  uint64_t v2;
  void *v5;
  int v6;
  void *v7;
  int v8;
  BOOL v9;
  int v10;
  char v11;
  unint64_t v12;
  FILE **v13;
  int *v14;
  int v15;
  int v16;
  _OWORD buffer[2];
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = 22;
  if (a1 && a2)
  {
    v5 = 0;
    v6 = 2048;
    do
    {
      v7 = reallocf(v5, v6);
      if (!v7)
        return 3;
      v5 = v7;
      v8 = proc_listpids(1u, 0, v7, v6);
      v9 = v8 < v6;
      v6 = 2 * v8;
    }
    while (!v9);
    if (v8 >= 4)
    {
      v11 = 0;
      if ((unint64_t)v8 >> 2 <= 1)
        v12 = 1;
      else
        v12 = (unint64_t)v8 >> 2;
      v10 = -1;
      v13 = (FILE **)MEMORY[0x24BDAC8D8];
      v14 = (int *)v5;
      do
      {
        v19 = 0;
        memset(buffer, 0, sizeof(buffer));
        v16 = *v14++;
        v15 = v16;
        if (proc_name(v16, buffer, 0x21u) >= 1 && !strcmp((const char *)buffer, a1))
        {
          if (v10 != -1)
          {
            if ((v11 & 1) == 0)
            {
              warnx("%s: multiple matching processes:", a1);
              fprintf(*v13, "%9d %s\n", v10, a1);
            }
            fprintf(*v13, "%9d %s\n", v15, (const char *)buffer);
            v11 = 1;
          }
          v10 = v15;
        }
        --v12;
      }
      while (v12);
      if ((v11 & 1) != 0)
      {
        v2 = 84;
LABEL_28:
        free(v5);
        return v2;
      }
      if (v10 == -1)
        v2 = 3;
      else
        v2 = 0;
    }
    else
    {
      v2 = 3;
      v10 = -1;
    }
    *a2 = v10;
    goto LABEL_28;
  }
  return v2;
}

uint64_t writeCFObjToFile(CFPropertyListRef propertyList, const char *a2, CFPropertyListFormat a3)
{
  uint64_t v3;
  const __CFData *Data;
  const __CFData *v6;
  const UInt8 *BytePtr;
  const UInt8 *v8;
  int v9;
  size_t Length;

  v3 = 22;
  if (propertyList && a2)
  {
    Data = CFPropertyListCreateData(0, propertyList, a3, 0, 0);
    if (Data)
    {
      v6 = Data;
      BytePtr = CFDataGetBytePtr(Data);
      if (!BytePtr)
      {
        v3 = 14;
        goto LABEL_10;
      }
      v8 = BytePtr;
      if (!strcmp(a2, "-"))
      {
        v9 = 1;
      }
      else
      {
        v9 = open(a2, 1537, 420);
        if (v9 == -1)
        {
          v3 = *__error();
LABEL_10:
          CFRelease(v6);
          return v3;
        }
      }
      Length = CFDataGetLength(v6);
      if (write(v9, v8, Length) == Length)
        v3 = 0;
      else
        v3 = *__error();
      CFRelease(v6);
      if (v9 != 1)
        close(v9);
    }
    else
    {
      return 12;
    }
  }
  return v3;
}

uint64_t createCFObjFromFile(const char *a1, uint64_t a2, _QWORD *a3)
{
  int v6;
  uint64_t v7;
  void *v8;
  CFMutableDataRef Mutable;
  __CFData *v10;
  ssize_t v11;
  CFPropertyListRef v12;
  const void *v13;

  if (!a3)
    return 22;
  *a3 = 0;
  if (!strcmp(a1, "-"))
  {
    v6 = 0;
  }
  else
  {
    v6 = open(a1, 0);
    if (v6 == -1)
      return *__error();
  }
  v8 = malloc_type_malloc(0x10000uLL, 0xA2E08751uLL);
  if (v8)
  {
    Mutable = CFDataCreateMutable(0, 0);
    if (Mutable)
    {
      v10 = Mutable;
      v11 = read(v6, v8, 0x10000uLL);
      if (v11 >= 1)
      {
        do
        {
          CFDataAppendBytes(v10, (const UInt8 *)v8, v11);
          v11 = read(v6, v8, 0x10000uLL);
        }
        while (v11 > 0);
      }
      if (v11 != -1)
      {
        if (CFDataGetLength(v10))
        {
          v12 = CFPropertyListCreateWithData(0, v10, 1uLL, 0, 0);
          if (v12)
          {
            v13 = v12;
            if (CFGetTypeID(v12) == a2)
            {
              v7 = 0;
              *a3 = v13;
LABEL_23:
              CFRelease(v10);
              goto LABEL_24;
            }
            if (!*a3)
              CFRelease(v13);
          }
        }
        v7 = 79;
        goto LABEL_23;
      }
      v7 = *__error();
      goto LABEL_23;
    }
  }
  warn("allocation failure");
  if (*__error())
  {
    v7 = *__error();
    if (v8)
LABEL_24:
      free(v8);
  }
  else
  {
    v7 = 12;
    if (v8)
      goto LABEL_24;
  }
  if ((v6 - 1) <= 0xFFFFFFFD)
    close(v6);
  return v7;
}

CFStringRef copyHardwareModel(int *a1)
{
  int v2;
  int v3;
  CFStringRef result;
  size_t v5;
  int v6[2];
  char cStr[64];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v6 = 0x200000006;
  v5 = 64;
  v2 = sysctl(v6, 2u, cStr, &v5, 0, 0);
  if (v2)
  {
    v3 = v2;
    result = 0;
    if (!a1)
      return result;
    goto LABEL_8;
  }
  cStr[63] = 0;
  result = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (result)
    v3 = 0;
  else
    v3 = 12;
  if (a1)
  {
LABEL_8:
    if (v3)
      *a1 = v3;
  }
  return result;
}

double abstime_to_msec_diff(uint64_t a1, uint64_t a2)
{
  if (abstime_to_ns_have_factor != -1)
    dispatch_once(&abstime_to_ns_have_factor, &__block_literal_global_6);
  return *(double *)&abstime_to_ns_to_ns_factor * (double)a2 / 1000000.0
       - *(double *)&abstime_to_ns_to_ns_factor * (double)a1 / 1000000.0;
}

double abstime_to_msec(uint64_t a1)
{
  if (abstime_to_ns_have_factor != -1)
    dispatch_once(&abstime_to_ns_have_factor, &__block_literal_global_6);
  return *(double *)&abstime_to_ns_to_ns_factor * (double)a1 / 1000000.0;
}

uint64_t walkargstr(char *a1, int a2, uint64_t a3)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *__stringp;

  __stringp = a1;
  if (!a1)
    return 107;
  if (a2)
    v4 = a1;
  else
    v4 = 0;
  while (1)
  {
    v5 = strsep(&__stringp, " \t");
    if (v5)
    {
      if (*v5)
      {
        v6 = (*(uint64_t (**)(uint64_t, char *))(a3 + 16))(a3, v5);
        if ((_DWORD)v6)
          break;
      }
    }
    if (!__stringp)
    {
      v7 = 0;
      if (!v4)
        return v7;
      goto LABEL_13;
    }
  }
  v7 = v6;
  if (!v4)
    return v7;
LABEL_13:
  free(v4);
  return v7;
}

uint64_t pc_errnum_to_excode(int a1)
{
  uint64_t result;

  if (a1 > 21)
  {
    if (a1 > 83)
    {
      if (a1 != 84)
      {
        if (a1 == 93)
          return 78;
        if (a1 == 148)
          return 42;
        return 71;
      }
    }
    else if (a1 != 22)
    {
      if (a1 != 34)
      {
        if (a1 == 79)
          return 65;
        return 71;
      }
      return 70;
    }
    return 64;
  }
  result = 77;
  if (a1 <= 1)
  {
    if (!a1)
      return 0;
    if (a1 != 1)
      return 71;
  }
  else
  {
    if (a1 == 2)
      return 66;
    if (a1 != 13)
    {
      if (a1 != 14)
        return 71;
      return 70;
    }
  }
  return result;
}

uint64_t print_metric_value(uint64_t a1, uint64_t a2, const char **a3, double a4, uint64_t a5, double *a6, _BYTE *a7)
{
  double v12;
  _BOOL4 v13;
  unsigned int v14;
  double v15;
  char *i;
  char *j;
  int v18;
  uint64_t v19;
  char v20;
  int v21;
  char v22;
  char v23;
  const char *v24;
  const char *v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  _BOOL4 v30;
  _BOOL4 v31;
  BOOL v32;
  _BOOL4 v33;
  BOOL v34;
  int v35;
  int v36;
  int v37;
  const char *v38;
  const char *v39;
  FILE *v40;
  BOOL v41;
  const char *v42;
  int v43;
  int v44;
  unsigned int v45;
  const char *v46;
  const char *v47;
  const char *v48;
  FILE **v49;
  const char *v50;
  const char *v51;
  int v52;
  uint64_t result;
  int v54;
  int v55;
  int v56;
  const char **v57;
  unsigned int v58;
  int v60;
  __int128 v61;
  double v62;
  double v63;
  double v64;
  _QWORD v65[5];
  int v66;
  char v67;
  __int128 __str;
  double v69;
  double v70;
  double v71;
  _QWORD v72[3];
  int v73;
  char v74[4];
  char v75[8];
  uint64_t v76;
  uint64_t v77;
  int v78;
  char __s[16];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  strcpy(v74, "..");
  *(_QWORD *)v75 = 0;
  v76 = 0;
  v78 = 0;
  v77 = 0;
  if (a6)
  {
    v12 = *a6;
    v13 = (*(_DWORD *)(a1 + 184) & 1) == 0 || *(_QWORD *)(a1 + 168) != 0;
    v15 = a4 - v12;
    v60 = v13;
    v14 = !v13 | ((*(_DWORD *)(a1 + 184) & 4u) >> 2);
    v56 = v14 ^ 1;
  }
  else
  {
    v56 = 0;
    v14 = 0;
    v60 = 1;
    v12 = 0.0;
    v15 = 0.0;
  }
  __strlcpy_chk();
  for (i = strchr(__s, 32); i; i = strchr(__s, 32))
    *i = 95;
  v57 = a3;
  v58 = v14;
  __strlcpy_chk();
  for (j = strchr(__s, 32); j; j = strchr(__s, 32))
    *j = 95;
  v18 = isatty(2);
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = "";
  if (v18)
    v25 = "\x1B[01m\x1B[31m";
  else
    v25 = "";
  v26 = 0.0;
  do
  {
    v27 = *(_QWORD *)(a2 + v19 + 40);
    v28 = *(double *)(a2 + v19 + 48);
    if (v27 == 3 && v28 == 0.0)
    {
      v21 = 1;
LABEL_23:
      v32 = v28 <= a4;
      v30 = v28 < a4;
LABEL_24:
      v31 = !v32;
      goto LABEL_27;
    }
    v29 = v27 & 0x18000;
    if ((v27 & 0x18000) == 0)
      goto LABEL_23;
    if (v29 == 0x8000)
    {
      if (a6)
      {
        v30 = v28 + *a6 < a4;
        v32 = *a6 - v28 <= a4;
        goto LABEL_24;
      }
LABEL_45:
      v30 = 0;
      v31 = 0;
LABEL_27:
      if ((v27 & 3) != 0)
      {
        v33 = (*(_QWORD *)(a2 + v19 + 40) & 0xCLL) != 0;
        if (*(_BYTE *)(a2 + 24))
        {
          if (v31)
            v22 = 1;
          v35 = v33 && v30;
          v34 = v35 == 0;
          v36 = v35 | v31;
        }
        else
        {
          if (v30)
            v22 = 1;
          v37 = v33 && v31;
          v34 = v37 == 0;
          v36 = v37 | v30;
        }
        if (!v34)
          v23 = 1;
        if (v36)
          v20 = 1;
      }
      goto LABEL_39;
    }
    if (v29 == 98304)
    {
      if (!a6)
        goto LABEL_45;
      v30 = (v28 / 100.0 + 1.0) * *a6 < a4;
      v31 = (1.0 - v28 / 100.0) * *a6 > a4;
      v26 = *(double *)(a2 + v19 + 48);
      goto LABEL_27;
    }
    if (v27)
    {
      v55 = v18;
      warnx("ignoring threshold type %llx", *(_QWORD *)(a2 + v19 + 40));
      v18 = v55;
    }
LABEL_39:
    v19 += 16;
  }
  while (v19 != 48);
  v38 = "\x1B[01m\x1B[32m";
  if (v18)
    v24 = "\x1B[0m";
  else
    v38 = "";
  if (!v23)
    v38 = v24;
  if (v22)
    v39 = v25;
  else
    v39 = v38;
  v40 = *(FILE **)(a1 + 168);
  if (v20)
    v41 = v40 == 0;
  else
    v41 = 1;
  if (!v41 || ((v58 ^ 1 | v60) & 1) == 0)
  {
    snprintf((char *)&__str, 5uLL, "(%s)", v74);
    snprintf(v75, 0x1CuLL, "%20s %-4s", __s, (const char *)&__str);
    v40 = *(FILE **)(a1 + 168);
  }
  if (v40 && v20)
  {
    v42 = v57[4];
    if (v42)
    {
      if (strcmp(v57[1], v42))
      {
        fputc(10, v40);
        goto LABEL_67;
      }
    }
    else
    {
      fprintf(v40, "* Regression from build %s\n\n", "<baseline build>");
LABEL_67:
      v43 = fprintf(*(FILE **)(a1 + 168), "%s\n", v57[1]);
      if (v43 >= 80)
        v44 = 80;
      else
        v44 = v43;
      if (v44 >= 2)
      {
        v45 = v44 + 1;
        do
        {
          fputc(45, *(FILE **)(a1 + 168));
          --v45;
        }
        while (v45 > 2);
      }
      fputc(10, *(FILE **)(a1 + 168));
      v57[4] = v57[1];
    }
    v46 = *(const char **)(a2 + 32);
    if (v46)
    {
      v47 = v57[5];
      if (!v47)
        goto LABEL_78;
      if (strcmp(v46, v47))
      {
        fputc(10, *(FILE **)(a1 + 168));
        v46 = *(const char **)(a2 + 32);
LABEL_78:
        fprintf(*(FILE **)(a1 + 168), "%s\n", v46);
        v57[5] = *(const char **)(a2 + 32);
      }
    }
    fprintf(*(FILE **)(a1 + 168), "%s %s; exceeded threshold of %g%%\n", v75, "  <-- out of spec", v26);
  }
  v48 = *(const char **)(a2 + 32);
  v49 = (FILE **)MEMORY[0x24BDAC8D8];
  if (v48)
  {
    v50 = v57[2];
    if (!v50)
      goto LABEL_84;
    if (strcmp(v48, v50))
    {
      fputc(10, *v49);
      v48 = *(const char **)(a2 + 32);
LABEL_84:
      fprintf(*v49, "%s\n", v48);
      v57[2] = *(const char **)(a2 + 32);
    }
  }
  if (v56)
  {
    if (a4 <= 100.0)
      v51 = "%10.4g %-2s %-15s(%s%+.4g %s%s)";
    else
      v51 = "%10.0f %-2s %-15s(%s%+.0f %s%s)";
    fprintf(*v49, v51, *(_QWORD *)&a4, v74, __s, v39, *(_QWORD *)&v15, v74, v24);
LABEL_94:
    v52 = 1;
    if (v58)
      goto LABEL_95;
LABEL_102:
    if (v20)
      fputs("  <-- out of spec", *v49);
  }
  else
  {
    if (v60)
    {
      if (a4 <= 100.0)
        fprintf(*v49, "%10.4g %-2s %-15s");
      else
        fprintf(*v49, "%10.0f %-2s %-15s");
      goto LABEL_94;
    }
    fputs(v75, *v49);
    v52 = 5;
    if (!v58)
      goto LABEL_102;
LABEL_95:
    v72[0] = 0;
    v72[1] = v72;
    v72[2] = 0x2000000000;
    v73 = 0;
    if (a4 < 0.0 || v12 <= 0.0 || v12 == a4 && v26 == 0.0)
    {
      *(double *)&__str = v26;
      *((double *)&__str + 1) = v12;
      v69 = v12;
      v70 = v12;
      v71 = v26;
      _printDummyGraph(v52, (double *)&__str, v21 != 0, v20 != 0, a4, v12);
    }
    else
    {
      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 0x40000000;
      v65[2] = __print_metric_value_block_invoke;
      v65[3] = &unk_24BF01490;
      v65[4] = v72;
      v66 = v52;
      v67 = v20;
      *(double *)&__str = v26;
      *((double *)&__str + 1) = v12;
      v69 = v12;
      v70 = v12;
      v71 = v26;
      *(double *)&v61 = v26;
      *((double *)&v61 + 1) = v12;
      v62 = v12;
      v63 = v12;
      v64 = v26;
      v54 = pc_measurement_graph(&__str, &v61, 31, 12, (uint64_t)v65, a4, a4, a4, 0.0);
      if (v54)
        print_metric_value_cold_1(v54);
    }
    _Block_object_dispose(v72, 8);
  }
  result = fputc(10, *v49);
  if (a7)
  {
    if (v20)
      *a7 = 1;
  }
  return result;
}

uint64_t _printDummyGraph(int a1, double *a2, int a3, int a4, double a5, double a6)
{
  FILE **v11;
  const char *v12;
  int v14;
  const char *v15;
  __int128 v16;
  const char *v17;
  const char *v18;
  const char *v19;
  __int128 v20;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  char __str[16];
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v11 = (FILE **)MEMORY[0x24BDAC8D8];
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%*s", a1, " ");
  if (a5 != 0.0 || a6 != 0.0)
  {
    if (a5 == a6 && a3 != 0)
    {
      fprintf(*v11, " 0 : ____________________* %.0f ", a5);
      if (a4)
        fwrite("  <-- out of spec", 0x11uLL, 1uLL, *v11);
      fputc(10, *v11);
      v12 = "     ____________________B     ";
      goto LABEL_17;
    }
    if (a5 < a6)
      v14 = -1;
    else
      v14 = a5 > a6;
    if (a5 >= 0.0)
    {
      if (a5 <= 0.0)
      {
        v15 = "(bug)";
        if (a5 > a6)
          v15 = ": 0 ";
        if (a5 < a6)
          v15 = " 0 :";
      }
      else
      {
        v15 = " >0 ";
      }
    }
    else
    {
      v15 = " <0 ";
    }
    if (a6 >= 0.0)
    {
      v17 = " >0 ";
      v18 = "(bug)";
      if (a5 > a6)
        v18 = " 0 :";
      if (a5 < a6)
        v18 = ": 0 ";
      if (a6 <= 0.0)
        v17 = v18;
    }
    else
    {
      v17 = " <0 ";
    }
    if (v14 == 1)
    {
      fprintf(*v11, "%4s ____________________* %4s", v17, v15);
      v19 = "     B____________________     ";
    }
    else
    {
      if (!v14)
      {
        v22 = *a2;
        v23 = a2[4];
        fprintf(*v11, "%4s __________*__________ %4s", "-10%", "+10%");
        v24 = 95;
        v25 = 93;
        if (v23 == 0.0)
          v25 = 95;
        if (v22 != 0.0)
          v24 = 91;
        snprintf(__str, 0x20uLL, "     %c_________B_________%c     ", v24, v25);
        if (!a4)
          goto LABEL_38;
        goto LABEL_37;
      }
      fprintf(*v11, "%4s *____________________ %4s", v15, v17);
      v19 = "     ____________________B     ";
    }
    v20 = *((_OWORD *)v19 + 1);
    *(_OWORD *)__str = *(_OWORD *)v19;
    v27 = v20;
    if (!a4)
    {
LABEL_38:
      fputc(10, *v11);
      return fprintf(*v11, "%*s", 61, __str);
    }
LABEL_37:
    fwrite("  <-- out of spec", 0x11uLL, 1uLL, *v11);
    goto LABEL_38;
  }
  fwrite(" 0 : *____________________ n/a ", 0x1FuLL, 1uLL, *v11);
  fputc(10, *v11);
  v12 = "     B____________________     ";
LABEL_17:
  v16 = *((_OWORD *)v12 + 1);
  *(_OWORD *)__str = *(_OWORD *)v12;
  v27 = v16;
  return fprintf(*v11, "%*s", 61, __str);
}

uint64_t __print_metric_value_block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3;
  int v4;
  FILE **v5;
  FILE *v6;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_DWORD *)(v3 + 24);
  *(_DWORD *)(v3 + 24) = v4 + 1;
  v5 = (FILE **)MEMORY[0x24BDAC8D8];
  v6 = (FILE *)*MEMORY[0x24BDAC8D8];
  if (v4)
    return fprintf(v6, "%*s", 61, a2);
  fprintf(v6, "%*s%s", *(_DWORD *)(a1 + 40), " ", a2);
  if (*(_BYTE *)(a1 + 44))
    fputs("  <-- out of spec", *v5);
  return fputc(10, *v5);
}

uint64_t dump_compare_metrics(uint64_t a1, int a2)
{
  char *v3;
  char *v4;
  char *v5;
  int v6;
  char *v7;
  const char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  const char *v16;
  const char *v18;
  const char *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  char __s1[1024];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  v21 = 0;
  v20 = 0;
  v3 = copy_meas_session(a1, a2, &v22, (_DWORD *)&v22 + 1);
  if (v3)
  {
    v4 = v3;
    v5 = *(char **)(a1 + 176);
    if (!v5)
      goto LABEL_9;
    if (has_perfdata_v1_ext(v5))
    {
      v6 = emit_perfdata_v1(a1, *(char **)(a1 + 176));
      HIDWORD(v22) = v6;
      if (!v6)
      {
        __strlcpy_chk();
        v7 = strstr(__s1, ".perfdata");
        if (!v7)
          goto LABEL_9;
        *(_DWORD *)(v7 + 1) = 6972528;
        v6 = pc_session_record_pdfile(a1, __s1);
        HIDWORD(v22) = v6;
        if (!v6)
        {
          warnx("Warning '%s' deprecated: also wrote perfdata v2 to %s", ".perfdata", __s1);
          goto LABEL_9;
        }
      }
    }
    else
    {
      v6 = pc_session_record_pdfile(a1, *(char **)(a1 + 176));
      HIDWORD(v22) = v6;
      if (!v6)
      {
LABEL_9:
        if (!MEMORY[0x24BDBBE58])
        {
LABEL_10:
          HIDWORD(v22) = _print_compare_meas(a1, (uint64_t)v4, v22, 0, 0, 0);
LABEL_40:
          free(v4);
          return HIDWORD(v22);
        }
        v8 = *(const char **)(a1 + 80);
        if (v8)
        {
          v9 = create_meas_epbfile(v8, *(const char **)(a1 + 104), &v21, (_DWORD *)&v22 + 1);
          if (!v9)
          {
            if (HIDWORD(v22) != 93 || !*(_QWORD *)(a1 + 96))
              goto LABEL_40;
            goto LABEL_10;
          }
          v10 = v9;
          if ((int)v22 >= 1 && (int)v21 >= 1)
          {
            v11 = 0;
            v12 = 0;
            if (v22 >= (uint64_t)v21)
              v13 = v21;
            else
              v13 = v22;
            while (1)
            {
              v14 = *(_QWORD *)&v4[v11];
              v15 = v14 == 0x6D656D64656C7461 || v14 == 0x6375726D656D0000;
              if (v15 && v14 != *(_QWORD *)&v9[v11])
                break;
              ++v12;
              v11 += 96;
              if (v12 >= v13)
                goto LABEL_25;
            }
            v18 = *(const char **)&v4[v11 + 8];
            v19 = *(const char **)&v9[v11 + 8];
            HIDWORD(v22) = 93;
            warnx("can't compare '%s' to '%s'", v18, v19);
            goto LABEL_38;
          }
LABEL_25:
          HIDWORD(v22) = _print_compare_meas(a1, (uint64_t)v4, v22, (uint64_t)v9, v21, &v20);
          if (HIDWORD(v22))
          {
LABEL_37:
            if (!v10)
              goto LABEL_40;
LABEL_38:
            free(v10);
            goto LABEL_40;
          }
        }
        else
        {
          HIDWORD(v22) = _print_compare_meas(a1, (uint64_t)v4, v22, 0, 0, &v20);
          if (HIDWORD(v22))
            goto LABEL_40;
          v10 = 0;
        }
        if (v20)
        {
          HIDWORD(v22) = 148;
        }
        else
        {
          v16 = *(const char **)(a1 + 88);
          if (!v16 || (HIDWORD(v22) = record_basemeas(v4, v16, *(const char **)(a1 + 104))) == 0)
            HIDWORD(v22) = 0;
        }
        goto LABEL_37;
      }
    }
    warnc(v6, "%s", *(const char **)(a1 + 176));
    goto LABEL_40;
  }
  return HIDWORD(v22);
}

uint64_t _print_compare_meas(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, _BYTE *a6)
{
  char *v12;
  char *v13;
  FILE **v14;
  int v15;
  int v16;
  unsigned int v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  _BYTE *v24;
  _OWORD v25[3];
  char v26;

  v26 = 0;
  memset(v25, 0, sizeof(v25));
  v12 = pc_session_copy_description(a1, *(_DWORD *)(a1 + 184) & 1, 0);
  if (v12)
  {
    v13 = v12;
    v14 = (FILE **)MEMORY[0x24BDAC8D8];
    v15 = fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v12);
    free(v13);
    if (v15 >= 81)
      v16 = 81;
    else
      v16 = v15;
    if (v16 >= 2)
    {
      v17 = v16 + 1;
      do
      {
        fputc(45, *v14);
        --v17;
      }
      while (v17 > 2);
    }
    fputc(10, *v14);
  }
  if (a4)
  {
    LODWORD(v18) = 0;
    if (a3 >= 1 && a5 >= 1)
    {
      v24 = a6;
      v18 = 0;
      v19 = 0;
      while (1)
      {
        v20 = a4 + 96 * v19;
        v21 = *(_QWORD *)a2;
        if (*(_QWORD *)a2)
        {
          if (v21 == 0x7065616B646C7461)
          {
            if (*(_QWORD *)v20 != 0x7065616B646C7461)
              v20 = 0;
          }
          else if (v21 != *(_QWORD *)v20)
          {
            warnx("can't compare '%s' to '%s'", *(const char **)(a2 + 8), *(const char **)(v20 + 8));
            return 93;
          }
        }
        result = _print_meas(a1, (uint64_t)v25, a2, v20, &v26);
        if ((_DWORD)result)
          return result;
        ++v18;
        if (v20)
          ++v19;
        if (v18 < a3)
        {
          a2 += 96;
          if (v19 < a5)
            continue;
        }
        a6 = v24;
        break;
      }
    }
    if ((_DWORD)v18 != a3)
    {
      warnx("unable to compare all expected measurements");
      return 14;
    }
    goto LABEL_31;
  }
  if (a3 < 1)
  {
LABEL_31:
    result = 0;
    if (a6)
      *a6 = v26;
    return result;
  }
  v23 = a3;
  while (1)
  {
    result = _print_meas(a1, (uint64_t)v25, a2, 0, 0);
    if ((_DWORD)result)
      return result;
    a2 += 96;
    if (!--v23)
      goto LABEL_31;
  }
}

uint64_t pc_print_ep_usage(const char *a1, FILE *a2)
{
  const char *v4;
  const char *v5;

  v4 = getprogname();
  v5 = getprogname();
  return fprintf(a2, "%s\n       -h, --help                         Print this message\n       -p, --process <pid | pname>        Measure a process\n       -c, --command <cmd> [<args> ...]   Run <cmd>, measuring it if no -p\n\n       -b, --compare <prevGM.epb>         Compare to baseline\n       -t, --test-name <name>             Use <name> within baseline\n\n       -s, --sleep <secs>                 Measure over given period\n       -i, --interact                     Measure until interrupt\n'man %s' for details and more options\n('xcrun -sdk %s man %s' if SDK is newer than main OS)\n", a1, v4, "macosx10.15internal", v5);
}

uint64_t pc_handle_ep_help_args(int a1, const char **a2, const char *a3, char *a4)
{
  uint64_t v8;
  const char *v9;
  char v11;

  if (a1 < 1)
    return 0;
  v8 = a1;
  while (1)
  {
    v9 = *a2;
    if (**a2 == 45 && v9[1] == 45)
      ++v9;
    if (!strcmp(v9, "-c") || !strcasecmp(v9, "-command"))
    {
LABEL_11:
      if (a1 != 1)
        return 0;
      goto LABEL_19;
    }
    if (!strcmp(v9, "-h") || !strcasecmp(v9, "-help"))
      break;
    ++a2;
    if (!--v8)
      goto LABEL_11;
  }
  if (a1 == 2)
  {
    pc_print_ep_usage(a3, (FILE *)*MEMORY[0x24BDAC8E8]);
    if (!a4)
      return 1;
    v11 = 0;
    goto LABEL_21;
  }
  if (a1 >= 2)
    warnx("ignoring extra argument with %s", *a2);
LABEL_19:
  pc_print_ep_usage(a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  if (!a4)
    return 1;
  v11 = 64;
LABEL_21:
  *a4 = v11;
  return 1;
}

uint64_t pc_session_config_with_ep_args(uint64_t a1, int a2, _QWORD *a3, _DWORD *a4)
{
  char *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  int v16;
  int v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  const char *v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t metricid_name;
  uint64_t v36;
  int v37;
  char *v38;
  char *v39;
  char *v40;
  const char *v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  _QWORD *v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  unsigned __int8 *v55;
  uint64_t v58;
  uint64_t v59;
  _BOOL4 v60;
  char *__endptr;

  v8 = getenv("PERFCHECK_TESTING");
  v60 = v8 != 0;
  v9 = a3;
  if (v8)
  {
    v10 = malloc_type_calloc(a2, 8uLL, 0x10040436913F5uLL);
    if (!v10)
      return *__error();
    v9 = v10;
    if (a2 < 1)
      goto LABEL_145;
    v11 = 0;
    do
    {
      v12 = strdup((const char *)a3[v11]);
      v9[v11] = v12;
      if (!v12)
      {
        v25 = 0;
        v58 = *__error();
        goto LABEL_187;
      }
      ++v11;
    }
    while (a2 != v11);
  }
  if (a2 < 1)
  {
LABEL_145:
    LODWORD(v13) = 0;
LABEL_146:
    if (a4)
LABEL_147:
      *a4 = v13;
    goto LABEL_148;
  }
  LODWORD(v13) = 0;
  while (1)
  {
    v14 = (const char *)v9[(int)v13];
    if (!v14)
      goto LABEL_184;
    v15 = (const char *)v9[(int)v13];
    if (*v14 == 45)
    {
      if (v14[1] == 45)
        v15 = v14 + 1;
      else
        v15 = (const char *)v9[(int)v13];
    }
    v16 = v13;
    if (!strcmp(v15, "-p") || !strcasecmp(v15, "-process"))
    {
      __endptr = 0;
      v13 = (int)v13 + 1;
      if (v16 + 1 >= a2)
      {
        warnx("%s requires an argument");
        goto LABEL_207;
      }
      v20 = v9[v13];
      if (*(_BYTE *)v20 == 45)
      {
        if (*(_BYTE *)(v20 + 1))
        {
          warnx("%s argument '%s' looks like another flag", v14, (const char *)v20);
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "          (use ./%s for a filename)\n", (const char *)v20);
          goto LABEL_207;
        }
      }
      else if (!*(_BYTE *)v20)
      {
        warnx("empty argument to %s");
        goto LABEL_207;
      }
      if (*(_DWORD *)(a1 + 12) == -1 && !*(_BYTE *)(a1 + 16))
      {
        v21 = strtol((const char *)v9[v13], &__endptr, 10);
        if (*__endptr)
        {
          v22 = pc_session_set_procname(a1, (char *)v20);
          if ((_DWORD)v22)
            goto LABEL_165;
        }
        else
        {
          v22 = pc_session_set_procpid(a1, v21);
          if ((_DWORD)v22)
            goto LABEL_165;
        }
        goto LABEL_111;
      }
      warnx("%s already specified");
LABEL_207:
      v58 = 22;
      goto LABEL_174;
    }
    if (!strcmp(v15, "-c") || !strcasecmp(v15, "-command"))
    {
      v48 = a2 - (v13 + 1);
      if (a2 <= (int)v13 + 1)
      {
LABEL_179:
        warnx("%s requires an argument");
        goto LABEL_184;
      }
      v49 = &v9[(int)v13 + 1];
      v50 = (_BYTE *)*v49;
      if (*(_BYTE *)*v49 == 45)
      {
        if (v50[1])
        {
          warnx("%s argument '%s' looks like another flag", v14, v50);
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "          (use ./%s for a filename)\n", v50);
          goto LABEL_184;
        }
      }
      else if (!*(_BYTE *)*v49)
      {
LABEL_160:
        warnx("empty argument to %s");
        goto LABEL_184;
      }
      if (*(_QWORD *)(a1 + 56))
      {
LABEL_180:
        warnx("%s already specified");
        goto LABEL_184;
      }
      v51 = pc_session_set_exeargs(a1, v48, (uint64_t)v49);
      if ((_DWORD)v51)
      {
        v58 = v51;
        warnx("couldn't copy arguments");
        goto LABEL_174;
      }
      LODWORD(v13) = a2;
      if (a4)
        goto LABEL_147;
LABEL_148:
      if (*(_QWORD *)(a1 + 80) && *(_QWORD *)(a1 + 88))
      {
LABEL_175:
        warnx("--record incompatible with --compare and --project-baseline", v59);
        goto LABEL_184;
      }
      if (*(_QWORD *)(a1 + 56))
      {
LABEL_163:
        if (*(_DWORD *)(a1 + 12) != -1)
        {
          v22 = pc_session_add_metric(a1, 0x7065616B646C7461);
          if ((_DWORD)v22)
          {
LABEL_165:
            v58 = v22;
            goto LABEL_174;
          }
        }
      }
      else
      {
        if (*(_DWORD *)(a1 + 68))
        {
          if (*(_BYTE *)(a1 + 72))
          {
            warnx("pass exactly one of --sleep or --interact", v59);
            goto LABEL_184;
          }
          if (!*(_BYTE *)(a1 + 16))
          {
            warnx("--sleep requires --process", v59);
LABEL_184:
            v25 = 0;
LABEL_185:
            v58 = 22;
            goto LABEL_186;
          }
          goto LABEL_163;
        }
        if (*(_BYTE *)(a1 + 72))
        {
          if (!*(_BYTE *)(a1 + 16))
          {
            warnx("--interact requires --process");
            goto LABEL_184;
          }
          goto LABEL_163;
        }
        if (*(_BYTE *)(a1 + 16) && *(_DWORD *)(a1 + 12) == -1)
        {
          v58 = 3;
          warnc(3, "%s");
          goto LABEL_174;
        }
      }
      v58 = 0;
      goto LABEL_174;
    }
    if (!strcmp(v15, "-b") || !strcasecmp(v15, "-compare"))
    {
      v13 = (int)v13 + 1;
      if (v16 + 1 >= a2)
        goto LABEL_179;
      v23 = (char *)v9[v13];
      if (*v23 == 45)
      {
        if (v23[1])
          goto LABEL_210;
      }
      else if (!*v23)
      {
        goto LABEL_160;
      }
      if (*(_QWORD *)(a1 + 80))
      {
        if ((*(_BYTE *)(a1 + 184) & 1) == 0)
          warnx("%s: ignoring additional baseline");
        goto LABEL_111;
      }
      v22 = pc_session_set_baseline_file(a1, (char *)v9[v13]);
      if ((_DWORD)v22)
        goto LABEL_165;
      if (!*(_QWORD *)(a1 + 96) || (*(_BYTE *)(a1 + 184) & 1) != 0)
        goto LABEL_111;
LABEL_65:
      warnx("%s: overrides any project '%s' baselines");
      goto LABEL_111;
    }
    if (!strcmp(v15, "-T") || !strcasecmp(v15, "-threshold"))
    {
      __endptr = 0;
      v24 = (int)v13 + 1;
      if ((int)v13 + 1 >= a2)
        goto LABEL_179;
      v23 = (char *)v9[v24];
      if (*v23 == 45)
      {
        if (v23[1])
          goto LABEL_210;
      }
      else if (!*v23)
      {
        goto LABEL_160;
      }
      v25 = strdup((const char *)v9[v24]);
      v26 = strchr(v25, 61);
      if (!v26)
        goto LABEL_209;
      v27 = v26;
      v30 = v26[1];
      v28 = v26 + 1;
      v29 = v30;
      *v27 = 0;
      if (v30 == 43)
      {
        LOBYTE(v29) = v27[2];
        v31 = 1;
        v28 = v27 + 2;
      }
      else
      {
        if (!v29)
          goto LABEL_209;
        v31 = 0;
      }
      if (((char)v29 - 48) > 9)
      {
LABEL_209:
        warnx("-%s <metric>=[+]<thresh>[%%]");
        goto LABEL_185;
      }
      v32 = strtol(v28, &__endptr, 0);
      if (*__endptr)
      {
        if (*__endptr == 37)
          v33 = v31;
        else
          v33 = 0;
        if ((v33 & 1) == 0)
          goto LABEL_209;
        v34 = 98307;
      }
      else if (v31)
      {
        v34 = 32771;
      }
      else
      {
        v34 = 3;
      }
      metricid_name = get_metricid_name(a1, v25);
      if (!metricid_name)
      {
        warnx("unknown metric '%s'");
        goto LABEL_185;
      }
      v36 = pc_session_set_threshold(a1, metricid_name, v34, (double)v32);
      if ((_DWORD)v36)
      {
        v58 = v36;
        goto LABEL_186;
      }
      LODWORD(v13) = v24;
      if (v25)
        goto LABEL_103;
      goto LABEL_111;
    }
    if (!strcasecmp(v15, "-record"))
    {
      v13 = (int)v13 + 1;
      if (v16 + 1 >= a2)
        goto LABEL_179;
      v23 = (char *)v9[v13];
      v37 = *v23;
      if (v37 == 45)
      {
        if (v23[1])
          goto LABEL_210;
      }
      else if (!*v23)
      {
        goto LABEL_160;
      }
      if (*(_QWORD *)(a1 + 88))
        goto LABEL_180;
      if (*(_QWORD *)(a1 + 96))
        goto LABEL_175;
      if (v37 == 45 && !v23[1])
        v23 = "/dev/stdout";
      session_set_record_path(a1, v23);
      goto LABEL_111;
    }
    if (!strcmp(v15, "-t") || !strcasecmp(v15, "-test-name"))
    {
      __endptr = 0;
      v24 = (int)v13 + 1;
      if ((int)v13 + 1 >= a2)
        goto LABEL_179;
      v23 = (char *)v9[v24];
      if (*v23 == 45)
      {
        if (v23[1])
          goto LABEL_210;
      }
      else if (!*v23)
      {
        goto LABEL_160;
      }
      if (*(_QWORD *)(a1 + 104))
        goto LABEL_180;
      v38 = strdup((const char *)v9[v24]);
      v25 = v38;
      if (!v38)
      {
        v58 = *__error();
        goto LABEL_186;
      }
      v39 = strchr(v38, 44);
      if (v39 && (v40 = v39, v42 = v39[1], v41 = v39 + 1, v42))
      {
        v43 = strtol(v41, &__endptr, 10);
        if (v43)
        {
          if (*__endptr)
            goto LABEL_101;
          *v40 = 0;
        }
      }
      else
      {
LABEL_101:
        v43 = 0;
      }
      v44 = pc_session_set_testid(a1, 0, v25, v43);
      if ((_DWORD)v44)
      {
        v58 = v44;
        warnx("couldn't set test name");
        goto LABEL_186;
      }
LABEL_103:
      free(v25);
      LODWORD(v13) = v24;
      goto LABEL_111;
    }
    if (!strcasecmp(v15, "-project-baseline") || !strcmp(v15, "-P"))
      break;
    if (!strcmp(v15, "-s") || !strcasecmp(v15, "-sleep"))
    {
      v46 = (int)v13 + 1;
      if ((int)v13 + 1 >= a2)
        goto LABEL_179;
      v23 = (char *)v9[v46];
      if (*v23 == 45)
      {
        if (v23[1])
          goto LABEL_210;
      }
      else if (!*v23)
      {
        goto LABEL_160;
      }
      if (*(_DWORD *)(a1 + 68))
        goto LABEL_180;
      v47 = strtol((const char *)v9[v46], 0, 10);
      *(_DWORD *)(a1 + 68) = v47;
      LODWORD(v13) = v13 + 1;
      if (!v47)
      {
        warnx("invalid sleep interval '%s'");
        goto LABEL_184;
      }
    }
    else if (!strcmp(v15, "-i") || !strcasecmp(v15, "-interact"))
    {
      if (*(_BYTE *)(a1 + 72))
        goto LABEL_180;
      *(_BYTE *)(a1 + 72) = 1;
    }
    else
    {
      if (!strcasecmp(v15, "-perfdata"))
      {
        v13 = (int)v13 + 1;
        if (v16 + 1 >= a2)
          goto LABEL_179;
        v23 = (char *)v9[v13];
        if (*v23 == 45)
        {
          if (v23[1])
          {
LABEL_210:
            warnx("%s argument '%s' looks like another flag", v14, v23);
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "          (use ./%s for a filename)\n", v23);
            goto LABEL_184;
          }
          if (*(_QWORD *)(a1 + 176))
            goto LABEL_180;
          if (!v23[1])
            v23 = "/dev/stdout";
        }
        else
        {
          if (!*v23)
            goto LABEL_160;
          if (*(_QWORD *)(a1 + 176))
            goto LABEL_180;
        }
        pc_session_set_perfdata_file(a1, v23);
        goto LABEL_111;
      }
      if (strcasecmp(v15, "-failtracer"))
        goto LABEL_146;
      v17 = *(_DWORD *)(a1 + 184);
      if ((v17 & 1) != 0)
        goto LABEL_180;
      *(_DWORD *)(a1 + 184) = v17 | 1;
      v18 = (_BYTE *)v9[(int)v13 + 1];
      if (v18)
      {
        if (*v18 != 45)
        {
          v19 = pc_session_set_failtracer_file(a1, (char *)v9[(int)v13 + 1]);
          LODWORD(v13) = v13 + 1;
          if ((_DWORD)v19)
          {
            v58 = v19;
            warnc(v19, "%s");
            goto LABEL_174;
          }
        }
      }
    }
LABEL_111:
    LODWORD(v13) = v13 + 1;
    if ((int)v13 >= a2)
      goto LABEL_146;
  }
  v13 = (int)v13 + 1;
  if (v16 + 1 >= a2)
    goto LABEL_179;
  v23 = (char *)v9[v13];
  if (*v23 == 45)
  {
    if (v23[1])
      goto LABEL_210;
  }
  else if (!*v23)
  {
    goto LABEL_160;
  }
  if (*(_QWORD *)(a1 + 96))
    goto LABEL_180;
  if (*(_QWORD *)(a1 + 88))
    goto LABEL_175;
  v45 = pc_session_set_project_baseline(a1, (char *)v9[v13]);
  if (!(_DWORD)v45)
  {
    if (!*(_QWORD *)(a1 + 80) || (*(_BYTE *)(a1 + 184) & 1) != 0)
      goto LABEL_111;
    goto LABEL_65;
  }
  v58 = v45;
  warnx("couldn't set project name");
LABEL_174:
  v25 = 0;
LABEL_186:
  if (v60)
  {
LABEL_187:
    if (v9)
    {
      if (a2 >= 1)
      {
        v52 = 0;
        do
        {
          v53 = (const char *)v9[v52];
          if (v53)
          {
            v54 = (const char *)a3[v52];
            if (strcmp((const char *)v9[v52], v54))
            {
              warnx("pc_session_config_with_ep_args changed arg '%s' to '%s'", v54, v53);
              if ((_DWORD)v58)
                v58 = v58;
              else
                v58 = 14;
            }
            if (*v53)
            {
              v55 = (unsigned __int8 *)(v53 + 1);
              do
                *(v55 - 1) = 0;
              while (*v55++);
            }
            free((void *)v9[v52]);
          }
          ++v52;
        }
        while (v52 != a2);
      }
      free(v9);
    }
  }
  if (v25)
    free(v25);
  return v58;
}

uint64_t run_easyperf(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  const char *v5;
  _QWORD *v6;
  int v7;
  const char **v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  NSObject *global_queue;
  NSObject *v14;
  NSObject *v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[5];
  _QWORD handler[10];
  uint64_t v25;
  pid_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;

  v2 = 22;
  if (!a1 || !a2)
    return v2;
  *a2 = 0;
  v5 = (const char *)(a1 + 16);
  if (!*(_BYTE *)(a1 + 16) && *(_DWORD *)(a1 + 12) == -1)
  {
    v7 = 0;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 0x40000000;
    v23[2] = __run_easyperf_block_invoke;
    v23[3] = &__block_descriptor_tmp_73;
    v23[4] = a1;
    v6 = v23;
  }
  else
  {
    v2 = pc_session_begin(a1);
    if ((_DWORD)v2)
      return v2;
    v6 = 0;
    v7 = 1;
  }
  v8 = *(const char ***)(a1 + 56);
  if (v8)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2000000000;
    v32 = 107;
    v25 = 0;
    v26 = (pid_t *)&v25;
    v27 = 0x2000000000;
    v28 = -1;
    v9 = dispatch_semaphore_create(0);
    if (v9)
    {
      v10 = v9;
      v11 = dispatch_semaphore_create(0);
      if (v11)
      {
        v12 = v11;
        global_queue = dispatch_get_global_queue(0, 0);
        if (global_queue)
        {
          v14 = dispatch_source_create(MEMORY[0x24BDACA08], 0x14uLL, 0, global_queue);
          if (v14)
          {
            v15 = v14;
            handler[0] = MEMORY[0x24BDAC760];
            handler[1] = 0x40000000;
            handler[2] = ___spawnAndAtCHLD_block_invoke;
            handler[3] = &unk_24BF014D8;
            handler[4] = v6;
            handler[5] = &v29;
            handler[6] = &v25;
            handler[7] = v10;
            handler[8] = a2;
            handler[9] = v12;
            dispatch_source_set_event_handler(v14, handler);
            dispatch_activate(v15);
            v16 = posix_spawnp(v26 + 6, *v8, 0, 0, (char *const *)v8, (char *const *)*MEMORY[0x24BDAE198]);
            *((_DWORD *)v30 + 6) = v16;
            if (v16)
            {
              warnc(v16, "%s", *v8);
              *a2 = pc_errnum_to_excode(*((_DWORD *)v30 + 6));
            }
            else
            {
              dispatch_semaphore_signal(v10);
              dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
            }
            dispatch_release(v15);
          }
        }
        dispatch_release(v12);
      }
      dispatch_release(v10);
    }
    v2 = *((unsigned int *)v30 + 6);
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v29, 8);
    if ((_DWORD)v2)
      return v2;
    if ((*(_BYTE *)(a1 + 184) & 1) != 0 && *a2)
    {
      warnx("'%s' failed with exit code %d", v5, *a2);
      warnx("-%s hides failed commands' resource consumption");
      return 0;
    }
LABEL_24:
    if (v7)
      goto LABEL_25;
    goto LABEL_42;
  }
  v17 = *(_DWORD *)(a1 + 68);
  if (v17)
  {
    sleep(v17);
    goto LABEL_24;
  }
  if (*(_BYTE *)(a1 + 72))
  {
    still_running = 1;
    signal(2, (void (__cdecl *)(int))_easyperf_sigint_handler);
    while (still_running)
      pause();
    putchar(10);
    if (v7)
    {
LABEL_25:
      v18 = pc_session_end(a1);
      if ((_DWORD)v18)
      {
        v2 = v18;
        if ((_DWORD)v18 == 3)
        {
          if (*(int *)(a1 + 8) < 1)
          {
            return 3;
          }
          else
          {
            v19 = 0;
            v20 = 8;
            v21 = 16;
            do
            {
              if (*(_DWORD *)(a1 + 4 * v19 + 12) == -1)
              {
                strerror(3);
                warnx("%s: %s");
              }
              else if (*(_DWORD *)(*(_QWORD *)(a1 + 200) + v20) == -1)
              {
                warnx("%s[%d] disappeared");
              }
              ++v19;
              v20 += 56;
              v21 += 33;
              v2 = 3;
            }
            while (v19 < *(int *)(a1 + 8));
          }
        }
        return v2;
      }
    }
  }
  else if (*(_DWORD *)(a1 + 12) == -1)
  {
    warnx("nothing to measure");
    return 22;
  }
LABEL_42:
  v2 = pc_session_process(a1);
  if (!(_DWORD)v2)
  {
    if (*a2 && (*(_BYTE *)(a1 + 184) & 1) == 0)
      warnx("Warning: '%s' failed with exit code %d");
    return 0;
  }
  return v2;
}

uint64_t __run_easyperf_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v3 + 12) = a2;
  result = pc_session_set_procname(v3, **(char ***)(v3 + 56));
  if (!(_DWORD)result)
    return pc_session_begin(*(_QWORD *)(a1 + 32));
  return result;
}

int *ep_session_create(int *a1)
{
  return pc_session_create(a1, *MEMORY[0x24BDAC8D8], *MEMORY[0x24BDAC8D8]);
}

uint64_t ep_session_set_testname(uint64_t a1, char *__s1)
{
  return pc_session_set_testid(a1, 0, __s1, 0);
}

uint64_t ep_session_config_with_argstr(char **a1, char *a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = pc_session_config_with_ep_argstr(a1, a2);
  v6 = v5;
  if (a4)
    *a4 = pc_errnum_to_excode(v5);
  return v6;
}

uint64_t ep_session_process(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = pc_session_process(a1);
  v6 = v5;
  if (a4)
    *a4 = pc_errnum_to_excode(v5);
  return v6;
}

uint64_t _print_meas(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  double v9;
  double *v10;
  uint64_t result;
  const char *v12;
  char *v13;
  double v14;
  uint64_t v15;
  unsigned int v16;

  if (!*(_QWORD *)a3)
    return 0;
  if (a4)
  {
    v9 = *(double *)(a4 + 88);
    v10 = (double *)&v15;
  }
  else
  {
    v10 = 0;
    v9 = 0.0;
  }
  v16 = 0;
  v14 = 0.0;
  v15 = 0;
  v12 = scaled_unitstr(*(_QWORD *)(a3 + 16), &v14, v10, *(double *)(a3 + 88), v9);
  v13 = pc_session_copy_description(a1, 1, (int *)&v16);
  *(_QWORD *)(a2 + 8) = v13;
  if (v13)
  {
    print_metric_value(a1, a3, (const char **)a2, v14, (uint64_t)v12, v10, a5);
    free(*(void **)(a2 + 8));
    result = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    warnx("couldn't create test name");
    return v16;
  }
  return result;
}

void _easyperf_sigint_handler()
{
  still_running = 0;
}

intptr_t ___spawnAndAtCHLD_block_invoke(uint64_t a1)
{
  uint64_t v2;
  pid_t v3;
  int v5;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)+ 8)+ 24));
  v5 = 0;
  v3 = waitpid(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), &v5, 0);
  if (v3 == *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if ((v5 & 0x7F) != 0)
    {
      if ((v5 & 0x7F) == 0x7F)
      {
        warnx("%d has not yet exited or been signaled", v3);
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 67;
      }
      else
      {
        **(_BYTE **)(a1 + 64) = 69;
      }
    }
    else
    {
      **(_BYTE **)(a1 + 64) = BYTE1(v5);
    }
  }
  else
  {
    warn("Warning: waitpid(%d)", *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

char *copy_meas_session(uint64_t a1, int a2, _DWORD *a3, _DWORD *a4)
{
  char *v8;
  char *v9;
  uint64_t v10;
  double *v11;
  int value;
  int v14;

  v14 = 0;
  if (!a1 || !a3)
  {
    v9 = 0;
    v14 = 22;
    if (a4)
      goto LABEL_16;
    return v9;
  }
  v8 = create_meas_metrics(*(_QWORD *)(a1 + 120), *(_DWORD *)(a1 + 128), &v14);
  v9 = v8;
  if (!v8)
  {
LABEL_15:
    if (a4)
      goto LABEL_16;
    return v9;
  }
  if (*(int *)(a1 + 128) < 1)
  {
    LODWORD(v10) = 0;
LABEL_14:
    *a3 = v10;
    v14 = 0;
    goto LABEL_15;
  }
  v10 = 0;
  v11 = (double *)(v8 + 88);
  while (1)
  {
    value = pc_session_get_value(a1, a2, *((_QWORD *)v11 - 11), v11, (uint64_t *)v11 - 9, 0);
    if (value)
      break;
LABEL_9:
    ++v10;
    v11 += 12;
    if (v10 >= *(int *)(a1 + 128))
      goto LABEL_14;
  }
  if (value == 93)
  {
    *(v11 - 11) = 0.0;
    goto LABEL_9;
  }
  v14 = value;
  free(v9);
  v9 = 0;
  if (!a4)
    return v9;
LABEL_16:
  if (v14)
    *a4 = v14;
  return v9;
}

__CFDictionary *create_dict_epmeas(_QWORD *a1)
{
  __CFDictionary *Mutable;
  uint64_t v3;
  uint64_t v4;
  CFNumberRef v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  uint64_t v17;
  uint64_t valuePtr;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD698], MEMORY[0x24BDBD6A8]);
  if (!Mutable)
    return Mutable;
  valuePtr = 0;
  v3 = a1[24];
  if (v3 == 0x6D656D64656C7461)
  {
    v4 = 2;
    goto LABEL_6;
  }
  if (v3 == 0x6375726D656D0000)
  {
    v4 = 1;
LABEL_6:
    valuePtr = v4;
  }
  v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("Run_mode"), v5);
  CFRelease(v5);
  v17 = a1[11];
  v6 = CFNumberCreate(0, kCFNumberDoubleType, &v17);
  if (!v6)
    goto LABEL_13;
  v7 = v6;
  CFDictionarySetValue(Mutable, CFSTR("cpu_time"), v6);
  CFRelease(v7);
  v17 = a1[23];
  v8 = CFNumberCreate(0, kCFNumberDoubleType, &v17);
  if (!v8)
    goto LABEL_13;
  v9 = v8;
  CFDictionarySetValue(Mutable, CFSTR("Cpu_instructions"), v8);
  CFRelease(v9);
  v17 = a1[35];
  v10 = CFNumberCreate(0, kCFNumberDoubleType, &v17);
  if (!v10)
    goto LABEL_13;
  v11 = v10;
  CFDictionarySetValue(Mutable, CFSTR("Phys_footprint"), v10);
  CFRelease(v11);
  v17 = a1[47];
  v12 = CFNumberCreate(0, kCFNumberDoubleType, &v17);
  if (!v12)
    goto LABEL_13;
  v13 = v12;
  CFDictionarySetValue(Mutable, CFSTR("Peak_phys_footprint"), v12);
  CFRelease(v13);
  v17 = a1[59];
  v14 = CFNumberCreate(0, kCFNumberDoubleType, &v17);
  if (v14)
  {
    v15 = v14;
    CFDictionarySetValue(Mutable, CFSTR("Logical_writes"), v14);
    CFRelease(v15);
  }
  else
  {
LABEL_13:
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

char *create_meas_epbfile(const char *a1, const char *a2, _DWORD *a3, _DWORD *a4)
{
  CFTypeID TypeID;
  int v9;
  const __CFNumber *Value;
  int v11;
  float v12;
  const void *v13;
  const void *v14;
  int v15;
  char *v16;
  int v17;
  const void *v18;
  CFTypeID v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFDictionary *results_for_device;
  const __CFDictionary *v23;
  const __CFDictionary *v24;
  CFTypeID v25;
  int *v26;
  int *v27;
  char *v28;
  int v29;
  const char *CStringPtr;
  const void *v32;
  CFTypeID v33;
  const void *v34;
  CFTypeID v35;
  const void *v36;
  CFTypeID v37;
  const void *v38;
  CFTypeID v39;
  const void *v40;
  CFTypeID v41;
  uint64_t v42;
  const char *v43;
  const void *v44;
  CFTypeID v45;
  CFIndex v46;
  int v47;
  int v48;
  float valuePtr;
  CFDictionaryRef theDict;

  v48 = 0;
  v46 = -1;
  if (!a1)
  {
    v16 = 0;
    v17 = 22;
    goto LABEL_10;
  }
  v47 = 0;
  *(double *)&theDict = 0.0;
  valuePtr = 0.0;
  TypeID = CFDictionaryGetTypeID();
  v9 = createCFObjFromFile(a1, TypeID, &theDict);
  v48 = v9;
  if (v9)
  {
    warnc(v9, "%s", a1);
    v14 = 0;
    v13 = 0;
  }
  else
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("version"));
    if (Value)
    {
      v11 = CFNumberGetValue(Value, kCFNumberFloatType, &valuePtr);
      v12 = valuePtr;
      if (v11 && valuePtr == 0.625)
      {
        if (a2)
        {
          v13 = CFStringCreateWithCString(0, a2, 0x8000100u);
          if (!v13)
          {
            v14 = 0;
            v15 = 12;
LABEL_17:
            v48 = v15;
            goto LABEL_21;
          }
        }
        else
        {
          v13 = CFRetain(CFSTR("_Easyperf_Default_"));
        }
        v18 = CFDictionaryGetValue(theDict, v13);
        v14 = v18;
        if (!v18)
        {
          v48 = 0;
          goto LABEL_21;
        }
        v19 = CFGetTypeID(v18);
        if (v19 == CFArrayGetTypeID())
        {
          CFRetain(v14);
          goto LABEL_21;
        }
        v14 = 0;
        v15 = 79;
        goto LABEL_17;
      }
    }
    else
    {
      v12 = 0.0;
    }
    warnc(79, "%s: version %g baselines not supported", a1, v12);
    v14 = 0;
    v13 = 0;
    v48 = 79;
  }
LABEL_21:
  if (*(double *)&theDict != 0.0)
    CFRelease(theDict);
  if (v13)
    CFRelease(v13);
  if (!v14)
  {
    if (v48)
    {
LABEL_42:
      v16 = 0;
      goto LABEL_43;
    }
    if (a2)
      warnx("%s: no baseline for '%s'");
    else
      warnx("%s: no baseline for unspecified test name");
    v16 = 0;
    v17 = 93;
LABEL_10:
    v48 = v17;
    goto LABEL_43;
  }
  v20 = copyHardwareModel(&v48);
  if (!v20)
  {
    warnx("couldn't get device model");
    CFRelease(v14);
    goto LABEL_42;
  }
  v21 = v20;
  results_for_device = _get_results_for_device((const __CFArray *)v14, v20, &v46, &v48);
  if (results_for_device)
  {
    v23 = (const __CFDictionary *)CFDictionaryGetValue(results_for_device, CFSTR("ep_metrics"));
    if (v23)
    {
      v24 = v23;
      v25 = CFGetTypeID(v23);
      if (v25 == CFDictionaryGetTypeID())
      {
        v26 = create_epmetrics(&v47, &v48);
        v27 = v26;
        if (v26)
        {
          v28 = create_meas_metrics((uint64_t)v26, v47, &v48);
          if (v28)
          {
            if (v47 < 5)
            {
              v29 = 22;
LABEL_78:
              v16 = 0;
              goto LABEL_35;
            }
            if (CFDictionaryContainsKey(v24, CFSTR("cpu_time")))
            {
              v32 = CFDictionaryGetValue(v24, CFSTR("cpu_time"));
              v33 = CFGetTypeID(v32);
              if (v33 != CFNumberGetTypeID())
                goto LABEL_77;
              CFNumberGetValue((CFNumberRef)v32, kCFNumberDoubleType, v28 + 88);
            }
            if (CFDictionaryContainsKey(v24, CFSTR("Cpu_instructions")))
            {
              v34 = CFDictionaryGetValue(v24, CFSTR("Cpu_instructions"));
              v35 = CFGetTypeID(v34);
              if (v35 != CFNumberGetTypeID())
                goto LABEL_77;
              CFNumberGetValue((CFNumberRef)v34, kCFNumberDoubleType, v28 + 184);
            }
            if (CFDictionaryContainsKey(v24, CFSTR("Phys_footprint")))
            {
              v36 = CFDictionaryGetValue(v24, CFSTR("Phys_footprint"));
              v37 = CFGetTypeID(v36);
              if (v37 != CFNumberGetTypeID())
                goto LABEL_77;
              CFNumberGetValue((CFNumberRef)v36, kCFNumberDoubleType, v28 + 280);
            }
            if (CFDictionaryContainsKey(v24, CFSTR("Peak_phys_footprint")))
            {
              v38 = CFDictionaryGetValue(v24, CFSTR("Peak_phys_footprint"));
              v39 = CFGetTypeID(v38);
              if (v39 != CFNumberGetTypeID())
                goto LABEL_77;
              CFNumberGetValue((CFNumberRef)v38, kCFNumberDoubleType, v28 + 376);
            }
            *(double *)&theDict = 0.0;
            v40 = CFDictionaryGetValue(v24, CFSTR("Run_mode"));
            v41 = CFGetTypeID(v40);
            if (v41 != CFNumberGetTypeID())
              goto LABEL_77;
            CFNumberGetValue((CFNumberRef)v40, kCFNumberDoubleType, &theDict);
            if (*(double *)&theDict == 1.0)
            {
              v42 = 0x6375726D656D0000;
              v43 = "current_mem";
            }
            else
            {
              if (*(double *)&theDict != 2.0)
              {
                *((_QWORD *)v28 + 24) = 0;
                goto LABEL_73;
              }
              v42 = 0x6D656D64656C7461;
              v43 = "mem_delta";
            }
            *((_QWORD *)v28 + 24) = v42;
            *((_QWORD *)v28 + 25) = v43;
LABEL_73:
            if (!CFDictionaryContainsKey(v24, CFSTR("Logical_writes")))
            {
LABEL_76:
              *a3 = v47;
              v48 = 0;
              v16 = v28;
              goto LABEL_36;
            }
            v44 = CFDictionaryGetValue(v24, CFSTR("Logical_writes"));
            v45 = CFGetTypeID(v44);
            if (v45 == CFNumberGetTypeID())
            {
              CFNumberGetValue((CFNumberRef)v44, kCFNumberDoubleType, v28 + 472);
              goto LABEL_76;
            }
LABEL_77:
            v29 = 79;
            goto LABEL_78;
          }
        }
        else
        {
          v28 = 0;
        }
        v16 = 0;
        goto LABEL_36;
      }
    }
    v28 = 0;
    v16 = 0;
    v27 = 0;
    v29 = 79;
  }
  else
  {
    CStringPtr = CFStringGetCStringPtr(v21, 0x8000100u);
    warnx("%s: no baseline for current system model", CStringPtr);
    v28 = 0;
    v16 = 0;
    v27 = 0;
    v29 = 93;
  }
LABEL_35:
  v48 = v29;
LABEL_36:
  CFRelease(v21);
  CFRelease(v14);
  if (v27)
    free(v27);
  if (v28 && !v16)
    free(v28);
LABEL_43:
  if (a4 && v48)
    *a4 = v48;
  return v16;
}

const __CFDictionary *_get_results_for_device(const __CFArray *a1, const __CFString *a2, CFIndex *a3, int *a4)
{
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  CFTypeID v11;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v13;
  CFTypeID v14;
  const __CFDictionary *Value;
  const __CFDictionary *v16;
  CFTypeID v17;
  const __CFString *v18;
  const __CFString *v19;
  CFTypeID v20;
  int v21;

  Count = CFArrayGetCount(a1);
  if (!a3 || !a4)
  {
    if (a4)
    {
      v13 = 0;
      v21 = 22;
LABEL_19:
      *a4 = v21;
      return v13;
    }
    return 0;
  }
  v9 = Count;
  if (Count < 1)
    return 0;
  v10 = 0;
  while (1)
  {
    v11 = CFGetTypeID(a1);
    if (v11 != CFArrayGetTypeID())
      goto LABEL_18;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v10);
    if (!ValueAtIndex)
      goto LABEL_18;
    v13 = ValueAtIndex;
    v14 = CFGetTypeID(ValueAtIndex);
    if (v14 != CFDictionaryGetTypeID()
      || (Value = (const __CFDictionary *)CFDictionaryGetValue(v13, CFSTR("device_config"))) == 0
      || (v16 = Value, v17 = CFGetTypeID(Value), v17 != CFDictionaryGetTypeID())
      || (v18 = (const __CFString *)CFDictionaryGetValue(v16, CFSTR("model"))) == 0
      || (v19 = v18, v20 = CFGetTypeID(v18), v20 != CFStringGetTypeID()))
    {
LABEL_18:
      v13 = 0;
      v21 = 79;
      goto LABEL_19;
    }
    if (CFStringCompare(v19, a2, 0) == kCFCompareEqualTo)
      break;
    if (v9 == ++v10)
      return 0;
  }
  *a3 = v10;
  return v13;
}

uint64_t record_basemeas(_QWORD *a1, const char *a2, const char *a3)
{
  CFNumberRef v6;
  CFNumberRef v7;
  const void *v8;
  CFStringRef v9;
  const __CFString *v10;
  __CFDictionary *dict_epmeas;
  __CFDictionary *v12;
  CFTypeID TypeID;
  int v14;
  _BOOL4 v15;
  int v16;
  const __CFArray *Value;
  const __CFArray *Mutable;
  CFTypeID v19;
  __CFDictionary *results_for_device;
  __CFDictionary *v21;
  __CFDictionary *v22;
  int v23;
  _BOOL4 v24;
  CFMutableDictionaryRef v25;
  CFMutableDictionaryRef v26;
  int v27;
  _BOOL4 v28;
  int v30;
  CFDictionaryRef theDict;
  CFIndex idx;
  int valuePtr;
  unsigned int v34;

  valuePtr = 1059061760;
  v34 = 107;
  theDict = 0;
  idx = -1;
  v6 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  if (v6)
  {
    v7 = v6;
    if (a3)
    {
      v8 = CFStringCreateWithCString(0, a3, 0x8000100u);
      if (!v8)
      {
        v34 = 12;
LABEL_43:
        CFRelease(v7);
        return v34;
      }
    }
    else
    {
      v8 = CFRetain(CFSTR("_Easyperf_Default_"));
    }
    v9 = copyHardwareModel((int *)&v34);
    if (!v9)
    {
      warnx("couldn't get device model");
      if (!v8)
        goto LABEL_43;
      goto LABEL_42;
    }
    v10 = v9;
    dict_epmeas = create_dict_epmeas(a1);
    if (!dict_epmeas)
    {
      warnx("couldn't create the metrics dictionary\n");
      v34 = 12;
      goto LABEL_41;
    }
    v12 = dict_epmeas;
    TypeID = CFDictionaryGetTypeID();
    v14 = createCFObjFromFile(a2, TypeID, &theDict);
    v34 = v14;
    v15 = v14 != 0;
    if (v14)
    {
      if (v14 != 2)
      {
        warnc(v14, "%s", a2);
        v15 = 0;
        Mutable = 0;
        v24 = 0;
        goto LABEL_29;
      }
      theDict = CFDictionaryCreateMutable(0, 5, MEMORY[0x24BDBD698], MEMORY[0x24BDBD6A8]);
      if (!theDict)
      {
        v15 = 0;
        Mutable = 0;
        goto LABEL_27;
      }
      v16 = 1;
    }
    else
    {
      Value = (const __CFArray *)CFDictionaryGetValue(theDict, v8);
      if (Value)
      {
        Mutable = Value;
        v19 = CFGetTypeID(Value);
        if (v19 == CFArrayGetTypeID())
        {
          results_for_device = _get_results_for_device(Mutable, v10, &idx, (int *)&v34);
          if (results_for_device)
          {
            v21 = results_for_device;
            CFDictionarySetValue(results_for_device, CFSTR("ep_metrics"), v12);
            CFArraySetValueAtIndex(Mutable, idx, v21);
            v22 = 0;
            v23 = 0;
            v30 = 0;
            v24 = 0;
            goto LABEL_22;
          }
          v16 = 0;
          v24 = 0;
          goto LABEL_19;
        }
      }
      v16 = 0;
    }
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD688]);
    if (Mutable)
    {
      v24 = 1;
LABEL_19:
      v25 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD698], MEMORY[0x24BDBD6A8]);
      if (v25)
      {
        v21 = v25;
        v23 = v16;
        v26 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD698], MEMORY[0x24BDBD6A8]);
        if (!v26)
        {
          v34 = 12;
          v15 = v16 != 0;
          v22 = v12;
          goto LABEL_31;
        }
        v22 = v26;
        CFDictionarySetValue(theDict, CFSTR("version"), v7);
        CFDictionarySetValue(v22, CFSTR("model"), v10);
        CFDictionarySetValue(v21, CFSTR("device_config"), v22);
        CFDictionarySetValue(v21, CFSTR("ep_metrics"), v12);
        CFArrayAppendValue(Mutable, v21);
        CFDictionarySetValue(theDict, v8, Mutable);
        v30 = 1;
LABEL_22:
        v27 = writeCFObjToFile(theDict, a2, kCFPropertyListBinaryFormat_v1_0);
        v34 = v27;
        v15 = v23 != 0;
        v24 = v24;
        if (v27)
        {
          warnc(v27, "%s", a2);
          CFRelease(v12);
          if ((v30 & 1) == 0)
          {
LABEL_33:
            if (v24 && Mutable)
              CFRelease(Mutable);
            if (theDict)
              v28 = v15;
            else
              v28 = 0;
            if (v28)
              CFRelease(theDict);
LABEL_41:
            CFRelease(v10);
            if (!v8)
              goto LABEL_43;
LABEL_42:
            CFRelease(v8);
            goto LABEL_43;
          }
        }
        else
        {
          CFRelease(v12);
          if (!v30)
            goto LABEL_33;
        }
        if (!v22)
        {
LABEL_32:
          CFRelease(v21);
          goto LABEL_33;
        }
LABEL_31:
        CFRelease(v22);
        goto LABEL_32;
      }
      v34 = 12;
      v15 = v16 != 0;
LABEL_29:
      v21 = v12;
      goto LABEL_32;
    }
LABEL_27:
    v24 = 0;
    v34 = 12;
    goto LABEL_29;
  }
  warnx("couldn't create version number");
  return 12;
}

uint64_t pc_session_set_snapshots_bufs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  unsigned int value;
  uint64_t v29;
  double v30;
  unsigned int v31;

  v31 = -2;
  if (!a2 || !a3)
  {
    v31 = 22;
    goto LABEL_6;
  }
  if (*(_QWORD *)(a1 + 192))
  {
    v31 = 37;
LABEL_7:
    *(_QWORD *)(a1 + 192) = 0;
    *(_QWORD *)(a1 + 200) = 0;
    return v31;
  }
  v29 = 0;
  v30 = 0.0;
  v9 = snapshot_create_with_buf(a1, a2, a3, (int *)&v31);
  v10 = v9;
  if (v9)
  {
    *(_QWORD *)(a1 + 192) = v9;
    if (*(_DWORD *)v9 != 1)
    {
      v12 = 0;
      goto LABEL_25;
    }
    if (!a4)
    {
      v12 = 0;
      v13 = *((_DWORD *)v9 + 12);
LABEL_31:
      if (v13 >= 1)
      {
        v21 = 0;
        v22 = 0;
        do
        {
          v31 = add_metric(*(_QWORD *)(*((_QWORD *)v10 + 7) + v21), (void **)(a1 + 120), (int *)(a1 + 128), a1);
          if (v31)
            goto LABEL_27;
          ++v22;
          v21 += 96;
        }
        while (v22 < *((int *)v10 + 12));
      }
LABEL_35:
      if (*(int *)(a1 + 128) >= 1)
      {
        v23 = 0;
        v24 = 0;
        do
        {
          v25 = *(_QWORD *)(a1 + 120);
          v26 = *(_QWORD *)(v25 + v23);
          if (a4 && v26 == 0x6375726D656D0000)
          {
            v27 = (_QWORD *)(v25 + v23);
            *v27 = 0x6D656D64656C7461;
            v27[1] = "mem_delta";
            v26 = 0x6D656D64656C7461;
          }
          value = pc_session_get_value(a1, 0, v26, &v30, &v29, 0);
          v31 = value;
          if (value)
          {
            if (value != 93)
              goto LABEL_22;
            v31 = 0;
            *(_QWORD *)(v25 + v23) = 0;
          }
          ++v24;
          v23 += 88;
        }
        while (v24 < *(int *)(a1 + 128));
      }
      if ((pc_session_get_value(a1, 0, 0x72636E747065616BLL, &v30, &v29, 0)
         || (v31 = add_metric(0x72636E747065616BLL, (void **)(a1 + 120), (int *)(a1 + 128), 0)) == 0)
        && (pc_session_get_value(a1, 0, 0x7065616B646C7461, &v30, &v29, 0)
         || (v31 = add_metric(0x7065616B646C7461, (void **)(a1 + 120), (int *)(a1 + 128), 0)) == 0))
      {
        *(_DWORD *)(a1 + 8) = *(_DWORD *)v10;
        __strlcpy_chk();
        *(_DWORD *)(a1 + 12) = -2;
        return 0;
      }
      goto LABEL_22;
    }
    v11 = snapshot_create_with_buf(a1, a4, a5, (int *)&v31);
    if (v11)
    {
      v12 = v11;
      *(_QWORD *)(a1 + 200) = v11;
      if (*(_DWORD *)v11 == *(_DWORD *)v10)
      {
        v13 = *((_DWORD *)v11 + 12);
        if (v13 == *((_DWORD *)v10 + 12))
        {
          if (v13 >= 1)
          {
            v14 = (uint64_t *)*((_QWORD *)v11 + 7);
            v15 = (uint64_t *)*((_QWORD *)v10 + 7);
            v16 = *((unsigned int *)v11 + 12);
            while (1)
            {
              v18 = *v14;
              v14 += 12;
              v17 = v18;
              v19 = *v15;
              v15 += 12;
              if (v17 != v19)
                break;
              if (!--v16)
                goto LABEL_31;
            }
            v20 = 22;
            goto LABEL_26;
          }
          goto LABEL_35;
        }
      }
LABEL_25:
      v20 = 84;
LABEL_26:
      v31 = v20;
      goto LABEL_27;
    }
  }
  if (!v31)
    return v31;
  v12 = 0;
LABEL_22:
  if (v10)
LABEL_27:
    pc_snapshot_destroy(v10);
  if (v12)
    pc_snapshot_destroy(v12);
LABEL_6:
  if (a1)
    goto LABEL_7;
  return v31;
}

uint64_t pc_session_config_with_ep_argstr(char **a1, char *__s1)
{
  uint64_t v2;
  char *v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  _QWORD *v10;
  char *v11;
  _QWORD v12[7];
  _QWORD v13[5];
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  _QWORD v19[3];
  int v20;

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2000000000;
  v20 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v14 = 0;
  v2 = 22;
  if (a1 && __s1)
  {
    if (a1[24] || *a1)
    {
      v2 = 37;
    }
    else
    {
      v6 = strdup(__s1);
      v7 = MEMORY[0x24BDAC760];
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 0x40000000;
      v13[2] = __pc_session_config_with_ep_argstr_block_invoke;
      v13[3] = &unk_24BF01500;
      v13[4] = &v15;
      v2 = walkargstr(v6, 1, (uint64_t)v13);
      if (!(_DWORD)v2)
      {
        v8 = *((int *)v16 + 6);
        if ((_DWORD)v8 && (v9 = malloc_type_calloc(v8, 8uLL, 0x10040436913F5uLL)) != 0)
        {
          v10 = v9;
          v11 = strdup(__s1);
          *a1 = v11;
          v12[0] = v7;
          v12[1] = 0x40000000;
          v12[2] = __pc_session_config_with_ep_argstr_block_invoke_2;
          v12[3] = &unk_24BF01528;
          v12[4] = v19;
          v12[5] = &v15;
          v12[6] = v10;
          v2 = walkargstr(v11, 0, (uint64_t)v12);
          if (!(_DWORD)v2)
            v2 = pc_session_config_with_ep_args((uint64_t)a1, *((_DWORD *)v16 + 6), v10, &v14);
          free(v10);
        }
        else
        {
          v2 = 0;
        }
      }
    }
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);
  return v2;
}

uint64_t __pc_session_config_with_ep_argstr_block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 0;
}

uint64_t __pc_session_config_with_ep_argstr_block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v6;

  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(int *)(v2 + 24);
  if ((int)v3 >= *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
    return 84;
  result = 0;
  v6 = a1[6];
  *(_DWORD *)(v2 + 24) = v3 + 1;
  *(_QWORD *)(v6 + 8 * v3) = a2;
  return result;
}

uint64_t pc_session_set_exeargs(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  result = 22;
  if (a1 && a3)
  {
    LODWORD(v6) = a2;
    *(_DWORD *)(a1 + 64) = a2;
    v7 = malloc_type_calloc(a2 + 1, 8uLL, 0x50040EE9192B6uLL);
    *(_QWORD *)(a1 + 56) = v7;
    if (!v7)
      return *__error();
    v8 = v7;
    if ((int)v6 >= 1)
    {
      v9 = 0;
      v6 = v6;
      while (1)
      {
        v8[v9] = strdup(*(const char **)(a3 + v9 * 8));
        v8 = *(_QWORD **)(a1 + 56);
        if (!v8[v9])
          return *__error();
        if (v6 == ++v9)
          goto LABEL_11;
      }
    }
    v6 = 0;
LABEL_11:
    result = 0;
    v8[v6] = 0;
  }
  return result;
}

uint64_t pc_session_set_procname(uint64_t a1, char *a2)
{
  uint64_t result;
  const char *v5;
  int *v6;
  int v7;
  char v8[1024];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 22;
  if (*(_QWORD *)(a1 + 192))
    return 37;
  basename_r(a2, v8);
  v5 = (const char *)(a1 + 16);
  if ((unint64_t)__strlcpy_chk() >= 0x21)
    warnx("Warning: %s longer than max process name", a2);
  v7 = *(_DWORD *)(a1 + 12);
  v6 = (int *)(a1 + 12);
  if (v7 != -1)
    return 0;
  result = findPIDForProcName(v5, v6);
  if ((_DWORD)result != 84)
    return 0;
  return result;
}

uint64_t pc_session_set_baseline_file(uint64_t a1, char *a2)
{
  if (a1 && a2)
    return _copy_str((void **)(a1 + 80), a2);
  else
    return 22;
}

uint64_t _copy_str(void **a1, char *__s1)
{
  uint64_t result;
  char *v5;

  result = 22;
  if (a1 && __s1)
  {
    if (*a1)
      free(*a1);
    v5 = strdup(__s1);
    *a1 = v5;
    if (v5)
      return 0;
    else
      return *__error();
  }
  return result;
}

uint64_t session_set_record_path(uint64_t a1, char *a2)
{
  if (a1 && a2)
    return _copy_str((void **)(a1 + 88), a2);
  else
    return 22;
}

uint64_t pc_session_set_project_baseline(uint64_t a1, char *a2)
{
  if (a1 && a2)
    return _copy_str((void **)(a1 + 96), a2);
  else
    return 22;
}

uint64_t pc_session_set_testid(uint64_t a1, const char *a2, char *__s1, int a4)
{
  uint64_t v4;
  char *v8;

  v8 = 0;
  v4 = 22;
  if (!a1 || !__s1)
    return v4;
  if (!a2)
    goto LABEL_6;
  if (asprintf(&v8, "%s.%s", a2, __s1) != -1)
  {
    __s1 = v8;
LABEL_6:
    *(_DWORD *)(a1 + 112) = a4;
    v4 = _copy_str((void **)(a1 + 104), __s1);
    goto LABEL_8;
  }
  v4 = *__error();
LABEL_8:
  if (v8)
    free(v8);
  return v4;
}

uint64_t pc_session_get_test_name(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;

  if (!a1)
    return 22;
  if (a2)
    *a2 = *(_QWORD *)(a1 + 104);
  result = 0;
  if (a3)
    *a3 = *(_DWORD *)(a1 + 112);
  return result;
}

uint64_t pc_session_get_perfdata_file(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 176);
  return result;
}

uint64_t pc_session_set_perfdata_file(uint64_t a1, char *a2)
{
  if (a1 && a2)
    return _copy_str((void **)(a1 + 176), a2);
  else
    return 22;
}

uint64_t pc_session_setopts(uint64_t a1, int a2)
{
  uint64_t result;

  if (!a1)
    return 22;
  if (*(_QWORD *)(a1 + 192))
    return 37;
  result = 0;
  *(_DWORD *)(a1 + 184) = a2;
  return result;
}

uint64_t pc_session_set_failtracer_file(uint64_t a1, char *__filename)
{
  uint64_t result;
  FILE *v5;
  FILE *v6;

  result = 22;
  if (a1 && __filename)
  {
    v5 = *(FILE **)(a1 + 168);
    if (v5)
      fclose(v5);
    v6 = fopen(__filename, "w");
    *(_QWORD *)(a1 + 168) = v6;
    if (v6)
      return 0;
    else
      return *__error();
  }
  return result;
}

uint64_t pc_session_getopts(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 184);
  return result;
}

uint64_t pc_session_get_context(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 208);
  return result;
}

uint64_t pc_session_set_context(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!a1)
    return 22;
  result = 0;
  *(_QWORD *)(a1 + 208) = a2;
  return result;
}

char *pc_session_copy_description(uint64_t a1, char a2, int *a3)
{
  int v4;
  int v5;
  char *v7;

  v7 = 0;
  if ((a2 & 1) != 0 || (*(_DWORD *)(a1 + 12) & 0x80000000) != 0)
    v4 = asprintf(&v7, "%s %s");
  else
    v4 = asprintf(&v7, "%s[%d] %s");
  if (v4 == -1)
  {
    v5 = *__error();
    if (v5 && v7)
      free(v7);
    if (a3 && v5)
      *a3 = v5;
  }
  return v7;
}

uint64_t pc_session_get_sleep_interval(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 68);
  return result;
}

uint64_t pc_session_set_sleep_interval(uint64_t a1, int a2)
{
  uint64_t result;

  if (!a1 || a2 && *(_BYTE *)(a1 + 72))
    return 22;
  if (*(_QWORD *)(a1 + 192))
    return 37;
  result = 0;
  *(_DWORD *)(a1 + 68) = a2;
  return result;
}

BOOL pc_session_get_interactive(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 72) != 0;
  return result;
}

uint64_t pc_session_set_interactive(uint64_t a1, int a2)
{
  uint64_t result;

  if (!a1 || a2 && *(_DWORD *)(a1 + 68))
    return 22;
  if (*(_QWORD *)(a1 + 192))
    return 37;
  result = 0;
  *(_BYTE *)(a1 + 72) = a2;
  return result;
}

uint64_t pc_session_get_exeargs(uint64_t a1, _DWORD *a2, _QWORD *a3)
{
  uint64_t result;

  result = 22;
  if (a2 && a1)
  {
    if (a3)
    {
      result = 0;
      *a2 = *(_DWORD *)(a1 + 64);
      *a3 = *(_QWORD *)(a1 + 56);
    }
  }
  return result;
}

uint64_t pc_session_get_procpids(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;

  result = 22;
  if (a1 && a2)
  {
    if (a3)
    {
      result = 0;
      *a2 = a1 + 12;
      *a3 = *(_DWORD *)(a1 + 8);
    }
  }
  return result;
}

uint64_t session_putc(uint64_t a1, int a2)
{
  FILE *v2;

  if (a1 && (v2 = *(FILE **)(a1 + 152)) != 0)
    return fputc(a2, v2);
  else
    return 0xFFFFFFFFLL;
}

uint64_t pc_measurement_graph(__int128 *a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  __int128 v19;
  __int128 v20;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  unint64_t v35;
  double v36;
  int v37;
  uint64_t v38;
  int v39;
  unint64_t v40;
  double v41;
  uint64_t v42;
  double v43;
  unint64_t v44;
  double v45;
  double v46;
  _BOOL4 v47;
  _BOOL4 v49;
  char v50;
  _BOOL4 v51;
  _BOOL4 v52;
  int v53;
  unsigned __int8 v54;
  __int128 *v55;
  char *v56;
  size_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  __int128 v62;
  unsigned __int8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  __int128 *v68;
  __int128 v69;
  unsigned __int8 v70;
  uint64_t v71;
  __int128 *v72;
  __int128 *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  _BYTE v81[24];
  unint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  if (a6 > a7 || a7 > a8)
    return 22;
  if (a9 <= 0.0 && (a4 & 8) == 0)
    return 22;
  if ((a4 & 4) == 0)
  {
    v19 = a2[1];
    v80 = *a2;
    *(_OWORD *)v81 = v19;
    *(_QWORD *)&v81[16] = *((_QWORD *)a2 + 4);
    if (!_check_threshold((double *)&v80))
      return 22;
  }
  if ((a4 & 2) == 0)
  {
    v20 = a1[1];
    v80 = *a1;
    *(_OWORD *)v81 = v20;
    *(_QWORD *)&v81[16] = *((_QWORD *)a1 + 4);
    if (!_check_threshold((double *)&v80))
      return 22;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFF1) != 0)
    return 45;
  v22 = a3 + 1;
  MEMORY[0x24BDAC7A8]();
  v24 = (char *)&v72 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0);
  v25 = *((double *)a1 + 2);
  v26 = fmin(a6, a9);
  if ((a4 & 8) != 0)
    v26 = a6;
  if ((a4 & 2) == 0)
  {
    v27 = *((double *)a1 + 2);
    if (*(double *)a1 != 0.0)
      v27 = (100.0 - *(double *)a1) * v25 / 100.0;
    v26 = fmin(v26, v27);
  }
  v28 = *((double *)a2 + 2);
  if ((a4 & 4) == 0)
  {
    v29 = *((double *)a2 + 2);
    if (*(double *)a2 != 0.0)
      v29 = (100.0 - *(double *)a2) * v28 / 100.0;
    v26 = fmin(v26, v29);
  }
  v30 = fmax(a8, a9);
  if ((a4 & 8) != 0)
    v30 = a8;
  if ((a4 & 2) == 0)
  {
    v31 = *((double *)a1 + 4);
    v32 = *((double *)a1 + 2);
    if (v31 != 0.0)
      v32 = v25 * (v31 + 100.0) / 100.0;
    v30 = fmax(v30, v32);
  }
  if ((a4 & 4) == 0)
  {
    v33 = *((double *)a2 + 4);
    if (v33 != 0.0)
      v28 = v28 * (v33 + 100.0) / 100.0;
    v30 = fmax(v30, v28);
  }
  v34 = fmax(ceil((v25 - v26) / v25 * 100.0), ceil((v30 - v25) / v25 * 100.0));
  v35 = a3 - 10;
  if (v34 < 100.0)
  {
    if (v35 >= 0xA)
    {
      v73 = a1;
      v74 = v23;
      v75 = a5;
      v36 = v25 * (100.0 - v34) / 100.0;
      v37 = snprintf((char *)&v72 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0), a3 + 1, "-%.0f%% ", v34);
      v38 = v37;
      v72 = a2;
      if (v34 < 10.0)
        v38 = v37 + (uint64_t)snprintf(&v24[v37], v22 - v37, " ");
      goto LABEL_46;
    }
    return 34;
  }
  if (v35 < 0xA)
    return 34;
  v73 = a1;
  v74 = v23;
  v75 = a5;
  v72 = a2;
  if (a6 == 0.0)
    v39 = snprintf((char *)&v72 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0), a3 + 1, " 0 : ", v72);
  else
    v39 = snprintf((char *)&v72 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0), a3 + 1, " <1%% ", v72);
  v38 = v39;
  v36 = 0.0;
LABEL_46:
  v40 = 0;
  v41 = v25 * (v34 + 100.0) / 100.0;
  v42 = a3 - 11;
  v43 = (v41 - v36) / (double)v35;
  *(_QWORD *)&v76 = a3 - 12;
  do
  {
    v44 = v40 + 1;
    v45 = v36 + v43 * (double)v40;
    v46 = v36 + v43 * (double)(v40 + 1);
    v47 = v42 == v40;
    if (v46 > a6)
      v47 = 1;
    if (v45 > a6)
      v47 = 0;
    v49 = v46 > a8 || v42 == v40;
    if (v42 == v40)
      v50 = 42;
    else
      v50 = 95;
    if (v46 < a6)
      v50 = 95;
    if (v46 > a6)
      v50 = 42;
    if (v45 > a8)
    {
      v49 = 0;
      v50 = 95;
    }
    v51 = v35 == v40;
    if (v45 > a6)
      v51 = 1;
    if (v36 + v43 * (double)(v40 - 1) > a6)
      v51 = 0;
    if (v46 <= a8)
      v52 = v36 + v43 * (double)(v40 + 2) <= a8 && (_QWORD)v76 != v40;
    else
      v52 = 1;
    v53 = !v47 || v52 && !v49;
    if (v49)
      v50 = 93;
    if (v47)
      v54 = 91;
    else
      v54 = v50;
    if (v49 && v51)
      v54 = 42;
    if (!v53)
      v54 = 42;
    if ((a4 & 8) == 0 && v45 <= a9 && (v46 > a9 || v42 == v40))
    {
      if (v54 == 95)
        v54 = 84;
      else
        v54 = 33;
    }
    v38 += snprintf(&v24[v38], v22 - v38, "%c", v54);
    v40 = v44;
  }
  while (v35 != v44);
  if (v34 >= 9800.0)
  {
    snprintf(&v24[v38], v22 - v38, " >99x");
    v58 = v75;
    v55 = v73;
  }
  else
  {
    v55 = v73;
    if (v34 >= 900.0 || __ROR8__(0x8F5C28F5C28F5C29 * (unint64_t)v34, 2) <= 0x28F5C28F5C28F5CuLL)
    {
      snprintf(&v24[v38], v22 - v38, " %.0fx");
    }
    else
    {
      v56 = &v24[v38];
      v57 = v22 - v38;
      if (v34 >= 100.0)
        snprintf(v56, v57, " %.1fx");
      else
        snprintf(v56, v57, " +%.0f%%");
    }
    v58 = v75;
  }
  (*(void (**)(uint64_t, char *))(v58 + 16))(v58, v24);
  if ((a4 & 2) == 0)
  {
    v59 = 0;
    v60 = 5;
    do
    {
      v59 += snprintf(&v24[v59], v22 - v59, " ", v72);
      --v60;
    }
    while (v60);
    v61 = 0;
    v76 = xmmword_206345060;
    do
    {
      *(double *)&v80 = v36;
      *((double *)&v80 + 1) = v41;
      *(double *)v81 = v34;
      *(_OWORD *)&v81[8] = v76;
      v82 = v35;
      v62 = v55[1];
      v77 = *v55;
      v78 = v62;
      v79 = *((_QWORD *)v55 + 4);
      v63 = _threshold_char((uint64_t)&v80, (double *)&v77, v61, 66);
      v59 += snprintf(&v24[v59], v22 - v59, "%c", v63);
      ++v61;
    }
    while (v35 != v61);
    v64 = 5;
    do
    {
      v59 += snprintf(&v24[v59], v22 - v59, " ");
      --v64;
    }
    while (v64);
    (*(void (**)(uint64_t, char *))(v58 + 16))(v58, v24);
  }
  if ((a4 & 4) == 0)
  {
    v65 = 0;
    v66 = 5;
    do
    {
      v65 += snprintf(&v24[v65], v22 - v65, " ", v72);
      --v66;
    }
    while (v66);
    v67 = 0;
    v76 = xmmword_206345060;
    v68 = v72;
    do
    {
      *(double *)&v80 = v36;
      *((double *)&v80 + 1) = v41;
      *(double *)v81 = v34;
      *(_OWORD *)&v81[8] = v76;
      v82 = v35;
      v69 = v68[1];
      v77 = *v68;
      v78 = v69;
      v79 = *((_QWORD *)v68 + 4);
      v70 = _threshold_char((uint64_t)&v80, (double *)&v77, v67, 82);
      v65 += snprintf(&v24[v65], v22 - v65, "%c", v70);
      ++v67;
    }
    while (v35 != v67);
    v71 = 5;
    do
    {
      v65 += snprintf(&v24[v65], v22 - v65, " ");
      --v71;
    }
    while (v71);
    (*(void (**)(uint64_t, char *))(v58 + 16))(v58, v24);
  }
  return 0;
}

BOOL _check_threshold(double *a1)
{
  double v1;
  double v2;
  double v3;
  double v6;
  double v7;
  double v8;

  v2 = a1[1];
  v1 = a1[2];
  v3 = a1[3];
  if (v1 == 0.0 || v2 > v1 || v1 > v3)
    return 0;
  v6 = *a1;
  if (*a1 < 0.0)
    return 0;
  v7 = a1[4];
  if (v7 < 0.0)
    return 0;
  v8 = a1[2];
  if (v6 != 0.0)
    v8 = (100.0 - v6) * v1 / 100.0;
  if (v8 > v2)
    return 0;
  if (v7 != 0.0)
    v1 = v1 * (v7 + 100.0) / 100.0;
  return v1 >= v3;
}

uint64_t _threshold_char(uint64_t a1, double *a2, unint64_t a3, char a4)
{
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  int v16;
  _BOOL4 v17;
  _BOOL4 v18;
  char v19;
  _BOOL4 v20;
  int v21;
  _BOOL4 v22;
  int v23;
  int v24;
  char v25;
  char v26;
  char v27;

  v4 = a2[1];
  v5 = a2[2];
  if (*a2 == 0.0)
    v6 = a2[2];
  else
    v6 = (100.0 - *a2) * v5 / 100.0;
  v7 = a2[4];
  v8 = v7 == 0.0;
  v9 = v5 * (v7 + 100.0) / 100.0;
  if (v8)
    v9 = a2[2];
  v10 = *(double *)a1;
  v11 = *(_QWORD *)(a1 + 40);
  v12 = (*(double *)(a1 + 8) - *(double *)a1) / (double)v11;
  v13 = *(double *)a1 + v12 * (double)a3;
  v14 = *(double *)a1 + v12 * (double)(a3 + 1);
  v15 = v11 - 1;
  v16 = v14 > v6 || v11 - 1 == a3;
  if (v13 > v6)
    v16 = 0;
  v17 = v14 > v9;
  v18 = v15 == a3;
  if (v15 == a3)
    v17 = 1;
  if (v14 < v6)
    v18 = 0;
  if (v14 > v6)
    v18 = 1;
  if (v13 > v9)
  {
    v17 = 0;
    v18 = 0;
  }
  if (v15 == a3)
    v19 = a4;
  else
    v19 = 95;
  if (v14 < v4)
    v19 = 95;
  if (v14 > v4)
    v19 = a4;
  if (v13 > a2[3])
    v19 = 95;
  v20 = v11 != a3;
  if (v13 > v6)
    v20 = 0;
  v21 = v10 + v12 * (double)(a3 - 1) > v6 || v20;
  if (v14 <= v9)
    v22 = v10 + v12 * (double)(a3 + 2) <= v9 && v11 != a3 + 2;
  else
    v22 = 1;
  v23 = (!v17 && v22) | ~v16;
  v24 = !v17 | v21;
  if (v18)
    v25 = v19;
  else
    v25 = 95;
  if (v17)
    v26 = 93;
  else
    v26 = v25;
  if (v16)
    v27 = 91;
  else
    v27 = v26;
  if ((v23 & v24) == 0)
    return v19;
  return v27;
}

uint64_t pc_session_process(uint64_t a1)
{
  uint64_t result;
  int v3;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 192))
    {
      LODWORD(result) = _update_compare_path(a1);
      if (!(_DWORD)result)
      {
        if (*(int *)(a1 + 8) < 1)
        {
          LODWORD(result) = 0;
        }
        else
        {
          v3 = 0;
          do
            LODWORD(result) = dump_compare_metrics(a1, v3++);
          while (v3 < *(_DWORD *)(a1 + 8));
        }
      }
    }
    else
    {
      LODWORD(result) = 45;
    }
  }
  else
  {
    LODWORD(result) = 22;
  }
  if ((*(_BYTE *)(a1 + 184) & ((_DWORD)result != 148)) != 0)
    return 0;
  else
    return result;
}

uint64_t _update_compare_path(uint64_t a1)
{
  char *v3;
  const char *v4;
  char __str[288];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 80))
    return 0;
  v3 = getenv("PERFCHECK_COMPARE_PATH");
  if (v3)
    return pc_session_set_baseline_file(a1, v3);
  v4 = *(const char **)(a1 + 96);
  if (!v4)
    return 0;
  if (snprintf(__str, 0x120uLL, "/AppleInternal/Tests/%s/easyperf_%s.epb", *(const char **)(a1 + 96), v4) >= 0x120)
    return *__error();
  if (access(__str, 4))
    return 0;
  else
    return pc_session_set_baseline_file(a1, __str);
}

uint64_t pc_session_process_pdfile(uint64_t a1, const char *a2, unsigned __int8 *a3)
{
  const char *v3;
  uint64_t v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  int *v16;
  FILE *v17;
  id v18;
  id v19;
  id v20;
  unsigned int v21;
  uint64_t *v22;
  int v23;
  FILE *v24;
  id v25;
  const char *v26;
  const char *v27;
  id v28;
  uint64_t v29;
  int v31;
  id obj;
  uint64_t v35;
  uint64_t v36;
  int v37;
  void *v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  unsigned __int8 v45;
  unsigned int updated;
  _QWORD v47[4];
  id v48;
  id v49;
  uint64_t *v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  unsigned __int8 *v54;
  _QWORD v55[4];
  id v56;
  _QWORD *v57;
  uint64_t *v58;
  uint64_t v59;
  id v60;
  _QWORD v61[4];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  int v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  updated = 0;
  v45 = 0;
  makePDContainers(a1, a2, (int *)&updated);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    updated = _update_compare_path(a1);
    if (!updated)
    {
      v3 = *(const char **)(a1 + 80);
      if (v3)
      {
        makePDContainers(a1, v3, (int *)&updated);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v38)
          goto LABEL_40;
      }
      else
      {
        v38 = 0;
      }
      updated = 0;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      objc_msgSend(v39, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v73, 16);
      if (v4)
      {
        v5 = 0;
        v6 = 0;
        v36 = *(_QWORD *)v42;
LABEL_9:
        v7 = 0;
        v37 = -v6;
        v35 = v4;
        v31 = v6 + v4;
        v8 = v5;
        while (1)
        {
          if (*(_QWORD *)v42 != v36)
            objc_enumerationMutation(obj);
          v5 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * v7);

          objc_msgSend(v39, "objectForKeyedSubscript:", v5);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKeyedSubscript:", v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            if ((objc_msgSend(v9, "isComparableTo:", v10) & 1) == 0)
            {
              v24 = *(FILE **)(a1 + 160);
              objc_msgSend(v9, "name");
              v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v26 = (const char *)objc_msgSend(v25, "UTF8String");
              v27 = *(const char **)(a1 + 80);
              objc_msgSend(v10, "name");
              v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());

              updated = 93;
LABEL_38:

              goto LABEL_39;
            }
          }
          else if (v38 && (*(_BYTE *)(a1 + 184) & 1) == 0)
          {
            v17 = *(FILE **)(a1 + 160);
            objc_msgSend(v9, "name");
            v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            fprintf(v17, "Warning: '%s': no baseline in %s\n", (const char *)objc_msgSend(v18, "UTF8String"), *(const char **)(a1 + 80));

          }
          if (v37 != (_DWORD)v7)
            session_putc(a1, 10);
          v11 = v9;
          v12 = v10;
          v69 = 0;
          v70 = &v69;
          v71 = 0x2020000000;
          v72 = 0;
          v67[0] = 0;
          v67[1] = v67;
          v67[2] = 0x3032000000;
          v67[3] = __Block_byref_object_copy_;
          v67[4] = __Block_byref_object_dispose_;
          v68 = 0;
          v65[0] = 0;
          v65[1] = v65;
          v65[2] = 0x3032000000;
          v65[3] = __Block_byref_object_copy_;
          v65[4] = __Block_byref_object_dispose_;
          v66 = 0;
          v61[0] = 0;
          v61[1] = v61;
          v61[2] = 0x5010000000;
          v61[3] = "";
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          if (v10)
          {
            objc_msgSend(MEMORY[0x24BDBCED0], "dictionaryWithCapacity:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13)
            {
              v15 = 0;
              v20 = 0;
              v22 = v70;
              v21 = 12;
              goto LABEL_28;
            }
            v60 = 0;
            v55[0] = MEMORY[0x24BDAC760];
            v55[1] = 3221225472;
            v55[2] = ___processContainer_block_invoke;
            v55[3] = &unk_24BF01550;
            v57 = v67;
            v58 = &v69;
            v14 = v13;
            v56 = v14;
            v59 = a1;
            objc_msgSend(v12, "enumerateMeasurementsWithError:usingBlock:", &v60, v55);
            v15 = v60;

            v16 = (int *)(v70 + 3);
          }
          else
          {
            v15 = 0;
            v14 = 0;
            v16 = &v72;
          }
          *v16 = 0;
          v47[0] = MEMORY[0x24BDAC760];
          v47[1] = 3221225472;
          v47[2] = ___processContainer_block_invoke_2;
          v47[3] = &unk_24BF01578;
          v19 = v11;
          v53 = a1;
          v48 = v19;
          v50 = &v69;
          v20 = v14;
          v49 = v20;
          v51 = v65;
          v52 = v61;
          v54 = &v45;
          LOBYTE(v19) = objc_msgSend(v19, "enumerateMeasurementsWithError:usingBlock:", 0, v47);

          if ((v19 & 1) != 0)
          {
            v21 = 0;
            *((_DWORD *)v70 + 6) = 0;
          }
          else
          {
            v21 = *((_DWORD *)v70 + 6);
            if (!v21)
            {
              v21 = objc_msgSend(v15, "code");
              v22 = v70;
LABEL_28:
              *((_DWORD *)v22 + 6) = v21;
            }
          }

          _Block_object_dispose(v61, 8);
          _Block_object_dispose(v65, 8);

          _Block_object_dispose(v67, 8);
          _Block_object_dispose(&v69, 8);

          updated = v21;
          if (v21)
            goto LABEL_38;

          ++v7;
          v8 = v5;
          if (v35 == v7)
          {
            v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v73, 16);
            v6 = v31;
            if (v4)
              goto LABEL_9;

            break;
          }
        }
      }

      v23 = v45;
      if (a3)
        *a3 = v45;
      if (v23)
        updated = 148;
      else
        updated = 0;
LABEL_39:

    }
  }
LABEL_40:
  v29 = updated;

  return v29;
}

void sub_2063414D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a71;

  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Unwind_Resume(a1);
}

void *pc_session_create_snapshot_buf(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  char *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char *v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD *v37;
  void *v38;
  char *v39;
  _DWORD *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  int v45;

  v45 = -2;
  if (!a1 || !a2)
  {
    v35 = 0;
    v45 = 22;
    goto LABEL_35;
  }
  v5 = snapshot_create(a1, &v45);
  if (!v5)
  {
    v35 = 0;
    goto LABEL_35;
  }
  v6 = v5;
  objc_msgSend(MEMORY[0x24BDBCEC0], "arrayWithCapacity:", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    v35 = 0;
    v45 = 12;
    goto LABEL_34;
  }
  v37 = a2;
  if (*(int *)v6 < 1)
  {
LABEL_21:
    v30 = (void *)MEMORY[0x20BCF2504]();
    v44 = 0;
    v31 = v8;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v44);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v44;
    v34 = v33;
    if (v32)
    {
      v35 = malloc_type_malloc(objc_msgSend(v32, "length"), 0xA6FECA98uLL);
      if (v35)
      {
        objc_msgSend(v32, "getBytes:length:", v35, objc_msgSend(v32, "length"));
        *v37 = objc_msgSend(v32, "length");
        v45 = 0;
      }
      else
      {
        v45 = *__error();
      }
    }
    else
    {
      v35 = 0;
      v45 = objc_msgSend(v33, "code");
    }

    objc_autoreleasePoolPop(v30);
    v8 = v31;
    goto LABEL_34;
  }
  v9 = 0;
  v10 = 0x24BDBC000uLL;
  v39 = v6;
  v40 = a3;
  v38 = (void *)v7;
  while (1)
  {
    objc_msgSend(*(id *)(v10 + 3792), "dictionaryWithCapacity:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11
      || (objc_msgSend(v8, "addObject:", v11),
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", &v6[56 * v9 + 12]),
          (v12 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v45 = 12;
      goto LABEL_30;
    }
    v13 = (void *)v12;
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("pname"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6[56 * v9 + 45]);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v45 = 12;
LABEL_41:

      goto LABEL_30;
    }
    v43 = (void *)v14;
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("exited"));
    v15 = &v6[56 * v9];
    v17 = *((int *)v15 + 12);
    v16 = (int *)(v15 + 48);
    objc_msgSend(*(id *)(v10 + 3792), "dictionaryWithCapacity:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v45 = 12;

      goto LABEL_41;
    }
    v19 = (void *)v18;
    v42 = v13;
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("meas"));
    v20 = *v16;
    if (*v16 >= 1)
      break;
    v24 = 0;
LABEL_20:

    if (++v9 >= *(int *)v6)
      goto LABEL_21;
  }
  v41 = v11;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = &v6[56 * v9 + 56];
  while (1)
  {
    v26 = *(_QWORD *)v25;
    if (*(_QWORD *)(*(_QWORD *)v25 + v21))
      break;
LABEL_17:
    ++v22;
    v21 += 96;
    if (v22 >= v20)
    {

      v6 = v39;
      a3 = v40;
      v8 = v38;
      v11 = v41;
      v10 = 0x24BDBC000;
      goto LABEL_20;
    }
  }
  v27 = v26 + v21;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(v26 + v21 + 8));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    v45 = 12;

    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(v27 + 88));
  v29 = objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v29, v28);
    v20 = *v16;
    v24 = (void *)v29;
    v23 = v28;
    goto LABEL_17;
  }
  v45 = 12;

LABEL_29:
  v6 = v39;
  a3 = v40;
  v8 = v38;
  v11 = v41;
LABEL_30:

  v35 = 0;
LABEL_34:
  pc_snapshot_destroy(v6);

LABEL_35:
  if (a3)
    *a3 = v45;
  return v35;
}

char *snapshot_create_with_buf(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char *v9;
  id v11;
  int v12;
  char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t metricid_name;
  int v33;
  uint64_t v34;
  _OWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  int v43;
  int *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id obj;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  int v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  _BYTE v63[128];
  uint64_t v64;

  v5 = 0;
  v64 = *MEMORY[0x24BDAC8D0];
  v6 = 22;
  if (!a2)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    goto LABEL_41;
  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (!a3)
    goto LABEL_41;
  objc_msgSend(MEMORY[0x24BDBCE58], "dataWithBytesNoCopy:length:freeWhenDone:", a2, a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v5 = 0;
    v8 = 0;
    v9 = 0;
    v6 = 12;
    goto LABEL_41;
  }
  v62 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v7, 0, 0, &v62);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v62;
  v8 = v11;
  if (!v5)
  {
    v6 = objc_msgSend(v11, "code");
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    v6 = 79;
    goto LABEL_41;
  }
  v12 = objc_msgSend(v5, "count");
  v13 = (char *)malloc_type_calloc(1uLL, 56 * v12 + 8, 0x97A69035uLL);
  v9 = v13;
  if (!v13)
  {
    v6 = *__error();
    goto LABEL_41;
  }
  *(_DWORD *)v13 = v12;
  if (v12 < 1)
    goto LABEL_29;
  v14 = 0;
  v45 = v12;
  while (1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("pname"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("exited")),
          (v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v30 = 0;
      v55 = 0;
      v6 = 79;
      goto LABEL_39;
    }
    v18 = (void *)v17;
    objc_opt_class();
    v49 = v18;
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v47 = v14,
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("meas")),
          (v19 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v55 = 0;
LABEL_47:
      v6 = 79;
      v30 = v49;
      goto LABEL_39;
    }
    v20 = (void *)v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v55 = v20;
      goto LABEL_47;
    }
    v48 = v15;
    v21 = &v9[56 * v47];
    v46 = objc_retainAutorelease(v16);
    objc_msgSend(v46, "UTF8String");
    __strlcpy_chk();
    v21[45] = objc_msgSend(v18, "BOOLValue");
    v22 = objc_msgSend(v20, "count");
    *((_DWORD *)v21 + 12) = v22;
    v23 = malloc_type_calloc(v22, 0x60uLL, 0x10500403B44B1C9uLL);
    *((_QWORD *)v21 + 7) = v23;
    v52 = v21 + 56;
    if (!v23)
      break;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v20, "allKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v48;
    v53 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (!v53)
      goto LABEL_28;
    obj = v24;
    v51 = a1;
    v44 = a4;
    v26 = 0;
    v27 = 0;
    v54 = *(_QWORD *)v59;
    v55 = v20;
    while (2)
    {
      v28 = 0;
      v43 = v26;
      v29 = 96 * v26;
      do
      {
        if (*(_QWORD *)v59 != v54)
          objc_enumerationMutation(obj);
        v30 = *(id *)(*((_QWORD *)&v58 + 1) + 8 * v28);

        v57 = 0;
        v56 = 0;
        objc_msgSend(v55, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v6 = 79;
LABEL_38:

          a4 = v44;
          v15 = v48;
          v16 = v46;
          goto LABEL_39;
        }
        v27 = objc_retainAutorelease(v30);
        metricid_name = get_metricid_name(v51, (char *)objc_msgSend(v27, "UTF8String"));
        if (!metricid_name)
        {
          v6 = 93;
          goto LABEL_38;
        }
        v33 = add_metric(metricid_name, &v57, &v56, v51);
        if (v33)
        {
          v6 = v33;
          goto LABEL_38;
        }
        v34 = *v52 + v29;
        v35 = v57;
        v36 = *((_OWORD *)v57 + 1);
        *(_OWORD *)v34 = *(_OWORD *)v57;
        *(_OWORD *)(v34 + 16) = v36;
        v38 = v35[3];
        v37 = v35[4];
        v39 = v35[2];
        *(_QWORD *)(v34 + 80) = *((_QWORD *)v35 + 10);
        *(_OWORD *)(v34 + 48) = v38;
        *(_OWORD *)(v34 + 64) = v37;
        *(_OWORD *)(v34 + 32) = v39;
        objc_msgSend(v31, "doubleValue");
        *(_QWORD *)(v34 + 88) = v40;
        free(v57);

        ++v28;
        v29 += 96;
      }
      while (v53 != v28);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      v26 = v43 + v28;
      v53 = v41;
      if (v41)
        continue;
      break;
    }

    a4 = v44;
    v24 = obj;
    a1 = v51;
    v25 = v48;
    v20 = v55;
LABEL_28:

    v14 = v47 + 1;
    if (v47 + 1 == v45)
    {
LABEL_29:
      v6 = 0;
      goto LABEL_41;
    }
  }
  v55 = v20;
  v6 = *__error();
  v15 = v48;
  v30 = v49;
LABEL_39:

  pc_snapshot_destroy(v9);
LABEL_40:
  v9 = 0;
LABEL_41:
  if (a4)
    *a4 = v6;

  return v9;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void ___processContainer_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  makeMetricDesc(v10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 56);
      if ((*(_BYTE *)(v9 + 184) & 1) == 0)
        fprintf(*(FILE **)(v9 + 160), "ignoring (38284416) duplicate baseline:\n\t%s\n", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)), "UTF8String"));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 12;
    *a3 = 1;
  }

}

void ___processContainer_block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t metricid_name;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  int MeasValue;
  FILE *v27;
  const char *v28;
  id v29;
  double *v30;
  FILE *v31;
  id v32;
  FILE *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  id v42;
  const char *v43;
  const char *v44;
  void *v45;
  unint64_t v46;
  FILE *v47;
  FILE *v48;
  FILE *v49;
  int v50;
  _BOOL4 v51;
  void *v52;
  double *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  __int128 v59;
  __int128 v60;
  _OWORD v61[3];
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _DWORD v67[32];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  makeMetricDesc(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  makeTestHeader(*(void **)(a1 + 32), v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v62 = 0;
  v60 = 0u;
  memset(v61, 0, sizeof(v61));
  v59 = 0u;
  v57 = 0.0;
  v9 = *(_QWORD *)(a1 + 72);
  if (v6 && v7)
  {
    v56 = (void *)v7;
    v10 = v5;
    objc_msgSend(v10, "metric");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *((_QWORD *)&v59 + 1) = objc_msgSend(v11, "UTF8String");

    metricid_name = get_metricid_name(v9, *((char **)&v59 + 1));
    *(_QWORD *)&v59 = metricid_name;
    BYTE8(v60) = objc_msgSend(v10, "largerBetter");
    objc_msgSend(v10, "variables");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("_pc_metric_group"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        *(_QWORD *)&v61[0] = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    }
    else
    {

    }
    v67[0] = 0;
    if (get_thresholds(v9, metricid_name, v67, 0))
      __memcpy_chk();
    objc_msgSend(v10, "variables");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("failure_threshold_pct"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v56;
    if (v18)
    {
      objc_msgSend(v18, "doubleValue");
      set_threshold((uint64_t)v61 + 8, 3, 98307, 0, v19);
    }
    objc_msgSend(v10, "variables");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("_pc_failure_threshold"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "doubleValue");
      set_threshold((uint64_t)v61 + 8, 3, 32771, 0, v22);
    }
    objc_msgSend(v10, "variables");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("_pc_failure_threshold_abs"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v24, "doubleValue");
      set_threshold((uint64_t)v61 + 8, 3, 3, 0, v25);
    }
    v58 = 0.0;

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    MeasValue = _getMeasValue(v10, &v58);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = MeasValue;
    if (MeasValue)
    {
      v16 = 0;
      *a3 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        if ((areMeasComparable(v10, v16) & 1) == 0)
        {
          v27 = *(FILE **)(*(_QWORD *)(a1 + 72) + 160);
          v28 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
          makeMetricDesc(v16);
          v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          fprintf(v27, "Measurement '%s'\n\tnot comparable to\n\tmeasurement '%s'\n", v28, (const char *)objc_msgSend(v29, "UTF8String"));

        }
        if (_getMeasValue(v16, &v57))
          v30 = 0;
        else
          v30 = &v57;
      }
      else
      {
        v30 = 0;
      }
      if (objc_msgSend(v56, "length")
        && objc_msgSend(v56, "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
      {
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
          session_putc(*(_QWORD *)(a1 + 72), 10);
        v31 = *(FILE **)(*(_QWORD *)(a1 + 72) + 152);
        if (v31)
        {
          v53 = v30;
          v54 = v16;
          v55 = v6;
          v32 = objc_retainAutorelease(v56);
          fprintf(v31, "%s\n", (const char *)objc_msgSend(v32, "UTF8String"));
          v33 = *(FILE **)(*(_QWORD *)(a1 + 72) + 152);
          objc_msgSend(v32, "componentsSeparatedByString:", CFSTR("\n"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
          if (v35)
          {
            v36 = v35;
            v37 = 0;
            v38 = *(_QWORD *)v64;
            do
            {
              for (i = 0; i != v36; ++i)
              {
                if (*(_QWORD *)v64 != v38)
                  objc_enumerationMutation(v34);
                v40 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
                if (objc_msgSend(v40, "length") > v37)
                  v37 = objc_msgSend(v40, "length");
              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
            }
            while (v36);
          }
          else
          {
            v37 = 0;
          }
          if (v37 >= 0x50)
            v41 = 80;
          else
            v41 = v37;
          v6 = v55;
          while (v41)
          {
            --v41;
            fputc(45, v33);
          }
          fputc(10, v33);

          v8 = v56;
          v30 = v53;
          v16 = v54;
        }
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v8);
      }
      objc_msgSend(v10, "unitString");
      v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v43 = (const char *)objc_msgSend(v42, "UTF8String");

      if (!strcmp(v43, "kiloinstructions"))
        v43 = "kI";
      if (!strcmp(v43, "ns"))
      {
        v57 = v57 / 1000000.0;
        v58 = v58 / 1000000.0;
        v43 = "ms";
      }
      if (!strcmp(v43, "#none"))
        v44 = "";
      else
        v44 = v43;
      objc_msgSend(v10, "metric");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "length");

      if (strlen(v44) < 3)
      {
        if (v46 >= 0x10)
        {
          v48 = *(FILE **)(*(_QWORD *)(a1 + 72) + 152);
          if (v48)
            fprintf(v48, "  %s\n");
        }
      }
      else
      {
        v47 = *(FILE **)(*(_QWORD *)(a1 + 72) + 152);
        if (v47)
          fprintf(v47, "  %s (%s)\n");
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      print_metric_value(*(_QWORD *)(a1 + 72), (uint64_t)&v59, (const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), v58, (uint64_t)v44, v30, *(_BYTE **)(a1 + 80));
      v49 = *(FILE **)(*(_QWORD *)(a1 + 72) + 152);
      if (v49)
      {
        v50 = fileno(v49);
        if (v50)
          v51 = isatty(v50) != 0;
        else
          v51 = 0;
        makeMeasurementFooter(v10, v16, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "length"))
          fputs((const char *)objc_msgSend(objc_retainAutorelease(v52), "UTF8String"), *(FILE **)(*(_QWORD *)(a1 + 72) + 152));

      }
    }
  }
  else
  {
    fwrite("couldn't describe measurement\n", 0x1EuLL, 1uLL, *(FILE **)(v9 + 160));
    v16 = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 79;
    *a3 = 1;
  }

}

uint64_t _getMeasValue(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "mean");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v10 = 93;
      goto LABEL_6;
    }
    objc_msgSend(v3, "mean");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;
  objc_msgSend(v5, "doubleValue");
  v9 = v8;

  v10 = 0;
  *a2 = v9;
LABEL_6:

  return v10;
}

id makePDContainers(uint64_t a1, const char *a2, int *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  int *v30;
  void *v31;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  id v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDBCE58];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v5, "dataWithContentsOfFile:options:error:", v6, 0, &v41);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v41;

  if (v7)
  {
    v40 = v8;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 3, &v40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v40;

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDBCED0], "dictionaryWithCapacity:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v12 = 0;
        v17 = 0;
        v15 = 12;
        goto LABEL_36;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = v10;
        objc_msgSend(MEMORY[0x24BECE158], "containerWithJSONDictionary:error:", v9, &v39);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v39;

        if (v12)
        {
          objc_msgSend(v12, "description");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v12, v14);
LABEL_26:

          v16 = v11;
          v11 = v16;
          v17 = 0;
          v10 = v13;
          goto LABEL_38;
        }
        v17 = 0;
        v15 = 79;
        v10 = v13;
        goto LABEL_36;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        obj = v9;
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        if (v18)
        {
          v19 = v18;
          v29 = v9;
          v30 = a3;
          v31 = v7;
          v17 = 0;
          v12 = 0;
          v20 = *(_QWORD *)v36;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              v22 = v17;
              v23 = v10;
              if (*(_QWORD *)v36 != v20)
                objc_enumerationMutation(obj);
              v17 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * i);

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_29;
              v34 = v10;
              objc_msgSend(MEMORY[0x24BECE158], "containerWithJSONDictionary:error:", v17, &v34);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v34;

              if (!v24)
              {
                v12 = 0;
LABEL_29:
                v9 = obj;

                v15 = 79;
                a3 = v30;
                v7 = v31;
                goto LABEL_36;
              }
              v12 = v24;
              objc_msgSend(v24, "description");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKeyedSubscript:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v26)
              {
                if ((*(_BYTE *)(a1 + 184) & 1) == 0)
                  fprintf(*(FILE **)(a1 + 160), "%s: ignoring (38284416) duplicate result:\n\t%s\n", a2, (const char *)objc_msgSend(objc_retainAutorelease(v25), "UTF8String"));
              }
              else
              {
                objc_msgSend(v11, "setObject:forKey:", v12, v25);
              }

            }
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
            if (v19)
              continue;
            break;
          }

          v13 = v10;
          v7 = v31;
          v9 = v29;
        }
        else
        {
          v12 = 0;
          v13 = v10;
        }
        v14 = obj;
        goto LABEL_26;
      }
      v12 = 0;
      v17 = 0;
    }
    else
    {
      v12 = 0;
      v17 = 0;
      v11 = 0;
    }
    v15 = 79;
  }
  else
  {
    v12 = 0;
    v15 = *__error();
    if (!v15)
    {
      v11 = 0;
      v16 = 0;
      v10 = v8;
      v9 = 0;
      v17 = 0;
      goto LABEL_38;
    }
    v17 = 0;
    v9 = 0;
    v10 = v8;
    v11 = 0;
  }
LABEL_36:
  warnc(v15, "%s", a2);
  v16 = 0;
  if (a3)
    *a3 = v15;
LABEL_38:
  v27 = v16;

  return v27;
}

__CFString *makeTestHeader(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  id v28;
  id v29;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v3, "variables");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _outputVariableNames(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF28], "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __makeTestHeader_block_invoke;
  v27 = &unk_24BF015A0;
  v9 = v8;
  v28 = v9;
  v10 = v6;
  v29 = v10;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v24);
  objc_msgSend(v4, "testDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = &stru_24BF018E0;
  if (!objc_msgSend(v12, "length"))
    goto LABEL_8;
  v14 = v12;
  if ((-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("perfcheck._default_")) & 1) != 0
    || -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("_libperfcheck_._default_")))
  {

LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  v22 = -[__CFString hasPrefix:](v14, "hasPrefix:", CFSTR("perfcheck.daemon"));

  v15 = v22 ^ 1;
  if (!v22)
    v13 = v14;
LABEL_9:
  v16 = v13;
  if (objc_msgSend(v11, "length"))
  {
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %@"), v12, v11, v24, v25, v26, v27, v28);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = v11;
    }
    v18 = v17;

    v16 = v18;
  }
  if (objc_msgSend(v10, "length"))
  {
    if (-[__CFString length](v16, "length"))
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n     with %@"), v16, v10);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("     with %@"), v10, v23);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v16;
  }
  v20 = v19;

  return v20;
}

id _outputVariableNames(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "variables");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("_pc_output_variables"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    warnx("ignoring non-string _pc_output_variables value");
LABEL_5:
    v3 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v3;
}

void __makeTestHeader_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(v11, "compare:options:range:", CFSTR("_pc_"), 0, 0, 4)
    && objc_msgSend(v11, "compare:", CFSTR("failure_threshold_pct"))
    && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v11) & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "length"))
      objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(" "));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = *(void **)(a1 + 40);
      objc_msgSend(v5, "doubleValue");
      objc_msgSend(v6, "appendFormat:", CFSTR("%@=%g"), v11, v7);
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v9 = *(void **)(a1 + 40);
      if ((isKindOfClass & 1) != 0)
        objc_msgSend(v9, "appendFormat:", CFSTR("%@=%@"), v11, v5);
      else
        objc_msgSend(v9, "appendFormat:", CFSTR("%@=(unknown type)"), v5, v10);
    }
  }

}

id makeMeasurementFooter(void *a1, void *a2, int a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id obj;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v5 = a2;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _outputVarValues(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v59 = v6;
    v60 = v4;
    v58 = v5;
    _outputVarValues(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDBCF28];
    objc_msgSend(v8, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setByAddingObjectsFromArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = v14;
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v9;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = v16;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
    if (!v18)
      goto LABEL_33;
    v19 = v18;
    v20 = *(_QWORD *)v73;
    v68 = v8;
    v69 = *(_QWORD *)v73;
    v64 = v9;
    while (1)
    {
      v21 = 0;
      v70 = v19;
      do
      {
        if (*(_QWORD *)v73 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v21);
        v23 = v17;
        objc_msgSend(v17, "objectForKeyedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "count");
        v27 = objc_msgSend(v25, "count");
        v28 = v27;
        if (v26)
          v29 = v27 == 0;
        else
          v29 = 1;
        v71 = v25;
        if (v29)
        {
          v34 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD14E0], "setWithArray:", v24);
          v30 = v28;
          v31 = v22;
          v32 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14E0], "setWithArray:", v25);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)v32;
          v35 = (void *)v32;
          v22 = v31;
          v28 = v30;
          objc_msgSend(v35, "intersectSet:", v33);

        }
        v17 = v23;
        v20 = v69;
        v36 = v70;
        if (v28 == v26)
        {
          v67 = v24;
          v37 = v34;
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          v83 = 0u;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
          if (v38)
          {
            v39 = v38;
            v40 = 0;
            v41 = *(_QWORD *)v81;
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v81 != v41)
                  objc_enumerationMutation(v37);
                v40 += objc_msgSend(v37, "countForObject:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i));
              }
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
            }
            while (v39);
          }
          else
          {
            v40 = 0;
          }

          v29 = v26 == v40;
          v17 = v64;
          v20 = v69;
          v36 = v70;
          v24 = v67;
          if (v29)
          {
            v43 = v71;
            _variableDisplayString(v22, v71);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "appendString:", v44);
            v8 = v68;
LABEL_30:

            goto LABEL_31;
          }
        }
        if (v26)
        {
          _variableDisplayStringWithDiffs(v22, v24, v34, a3);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "appendString:", v45);

        }
        v8 = v68;
        v43 = v71;
        if (v28)
        {
          _variableDisplayStringWithDiffs(v22, v71, v34, a3);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "appendString:", v44);
          goto LABEL_30;
        }
LABEL_31:

        ++v21;
      }
      while (v21 != v36);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
      if (!v19)
      {
LABEL_33:

        v6 = v59;
        v46 = v61;
        objc_msgSend(v59, "appendString:", v61);
        if (objc_msgSend(v63, "length"))
          objc_msgSend(v59, "appendFormat:", CFSTR("           (baseline)\n%@"), v63);
        v4 = v60;
        v5 = v58;
        if (objc_msgSend(v62, "length"))
          objc_msgSend(v59, "appendFormat:", CFSTR("           (current)\n%@"), v62);

        goto LABEL_46;
      }
    }
  }
  objc_msgSend(v7, "allKeys");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v46 = v48;
  v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v77 != v51)
          objc_enumerationMutation(v46);
        v53 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
        objc_msgSend(v8, "objectForKeyedSubscript:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        _variableDisplayString(v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v55);

      }
      v50 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
    }
    while (v50);
  }
  v17 = v46;
LABEL_46:

  return v6;
}

id _outputVarValues(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  _outputVariableNames(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "variables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED0], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v11, "length"))
          {
            objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(","));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

          }
        }
        else
        {
          _outputVarValues_cold_1(v10);
        }

        ++v9;
      }
      while (v7 != v9);
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v7 = v13;
    }
    while (v13);
  }

  return v4;
}

id _variableDisplayString(void *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a1;
  objc_msgSend(a2, "componentsJoinedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("           %@: %@\n"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id _variableDisplayStringWithDiffs(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  __CFString *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = CFSTR("\x1B[1m");
  if (a4)
  {
    v11 = CFSTR("\x1B[0m");
  }
  else
  {
    v10 = &stru_24BF018E0;
    v11 = &stru_24BF018E0;
  }
  v28 = v10;
  v12 = v11;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "copy");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v16)
  {

LABEL_19:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("           %@: %@\n"), v7, v13, v24, v25);
    goto LABEL_20;
  }
  v17 = v16;
  v26 = v9;
  v27 = v7;
  v18 = 0;
  v19 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v30 != v19)
        objc_enumerationMutation(v15);
      v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
      if (objc_msgSend(v13, "length"))
        objc_msgSend(v13, "appendString:", CFSTR(" "));
      if (objc_msgSend(v14, "containsObject:", v21))
      {
        objc_msgSend(v14, "removeObject:", v21);
        objc_msgSend(v13, "appendFormat:", CFSTR("%@"), v21);
      }
      else
      {
        objc_msgSend(v13, "appendFormat:", CFSTR("%@%@%@"), v28, v21, v12);
        v18 = 1;
      }
    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v17);

  v9 = v26;
  v7 = v27;
  if ((v18 & 1) == 0)
    goto LABEL_19;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("           %@%@%@: %@\n"), v28, v27, v12, v13);
LABEL_20:
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id makeMetricDesc(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _getIgnoredVars(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "metricFilterIgnoringVariables:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _getIgnoredVars(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  if (_getIgnoredVars_sInitIgnoredVars != -1)
    dispatch_once(&_getIgnoredVars_sInitIgnoredVars, &__block_literal_global_0);
  _outputVariableNames(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)_getIgnoredVars_sIgnoredVars, "arrayByAddingObjectsFromArray:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (id)_getIgnoredVars_sIgnoredVars;
  }
  v4 = v3;

  return v4;
}

uint64_t areMeasComparable(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x24BDBCF28];
  v4 = a2;
  v5 = a1;
  _getIgnoredVars(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCEE8];
  _getIgnoredVars(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "unionSet:", v7);
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "isComparableTo:ignoringVariables:", v4, v11);

  return v12;
}

BOOL has_perfdata_v1_ext(char *a1)
{
  char *v1;

  v1 = strstr(a1, ".perfdata");
  return v1 && !v1[9];
}

uint64_t pc_session_record_values(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char *v16;
  uint64_t v17;

  v15 = a3;
  v17 = 0;
  if (a1 && a2 && *(_QWORD *)(a1 + 192))
  {
    if (*(int *)(a1 + 8) <= 0)
    {
      HIDWORD(v17) = 0;
    }
    else
    {
      v5 = 0;
      v13 = a1;
      while (1)
      {
        v16 = copy_meas_session(a1, v5, &v17, (_DWORD *)&v17 + 1);
        if (!v16)
          break;
        v14 = v5;
        if ((int)v17 >= 1)
        {
          v6 = 0;
          v7 = v16;
          do
          {
            v8 = &v16[96 * v6];
            if (*(_QWORD *)v8)
            {
              pdunit_iorunit(*((_QWORD *)v8 + 2));
              pdwriter_new_value();
              if (v8[24])
                pdwriter_record_larger_better();
              for (i = 0; i != 48; i += 16)
              {
                v10 = *(_QWORD *)&v7[i + 40];
                if (v10 == 3 || v10 == 98307 || v10 == 32771)
                  pdwriter_record_variable_dbl();
              }
              if (*((_QWORD *)v8 + 4))
                pdwriter_record_variable_str();
              pdwriter_record_variable_str();
              if (v15)
                (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, *(_QWORD *)v8, *((_QWORD *)v8 + 1));
            }
            ++v6;
            v7 += 96;
          }
          while (v6 < (int)v17);
        }
        a1 = v13;
        v5 = v14 + 1;
        if (v14 + 1 >= *(int *)(v13 + 8))
        {
          HIDWORD(v17) = 0;
          free(v16);
          break;
        }
      }
    }
  }
  else
  {
    HIDWORD(v17) = 22;
  }
  v11 = HIDWORD(v17);

  return v11;
}

uint64_t pc_session_record_pdfile(uint64_t a1, char *__s1)
{
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  unsigned int v10;

  v2 = __s1;
  if (!__s1)
  {
    v2 = *(char **)(a1 + 176);
    if (!v2)
      return 22;
  }
  v4 = strstr(v2, ".perfdata");
  if (v4)
  {
    if (!v4[9])
      return 22;
  }
  v10 = 0;
  v5 = pdwriter_open();
  if (!v5)
    return *__error();
  v6 = v5;
  v7 = pc_session_copy_description(a1, 0, (int *)&v10);
  if (v7)
  {
    v8 = v7;
    pdwriter_set_description();
    v10 = pc_session_record_values(a1, v6, 0);
    free(v8);
  }
  pdwriter_close();
  return v10;
}

uint64_t emit_perfdata_v1(uint64_t a1, char *__s1)
{
  char *v4;
  char *v6;
  uint64_t *v7;
  FILE *v8;
  FILE *v9;
  uint64_t v10;
  char v11;
  char *v12;
  int v13;
  uint64_t v14;
  char v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  double v19;
  int v20;
  uint64_t v21;
  char v22;
  uint64_t *v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;

  v26 = 0;
  v27 = -1;
  v4 = strstr(__s1, ".perfdata");
  if (!v4 || v4[9])
    return 22;
  v6 = copy_meas_session(a1, 0, &v26, &v27);
  if (!v6)
    return v27;
  v7 = (uint64_t *)v6;
  if (v26 < 1)
  {
    v25 = 14;
LABEL_46:
    v27 = v25;
    free(v7);
    return v27;
  }
  v8 = fopen(__s1, "w");
  if (!v8)
  {
    v25 = *__error();
    goto LABEL_46;
  }
  v9 = v8;
  if (fputs("{\n  \"version\" : \"1.0\",\n  \"measurements\" : {\n    \"easyperf_metrics\" : {\n", v8) < 1
    || fprintf(v9, "      \"description\" : \"Easyperf metrics for '%s'\",\n", (const char *)(a1 + 16)) < 1)
  {
    goto LABEL_42;
  }
  if (v26 >= 1)
  {
    v10 = 0;
    v11 = 0;
    v12 = (char *)(v7 + 1);
    do
    {
      if (*((_QWORD *)v12 - 1))
      {
        if ((v11 & 1) != 0)
          v13 = fprintf(v9, ", \"%s\"");
        else
          v13 = fprintf(v9, "      \"names\" : [\"%s\"");
        if (v13 <= 0)
          goto LABEL_42;
        v11 = 1;
      }
      ++v10;
      v12 += 96;
    }
    while (v10 < v26);
  }
  if (fprintf(v9, "],\n") < 1)
    goto LABEL_42;
  if (v26 >= 1)
  {
    v14 = 0;
    v15 = 0;
    v16 = v7;
    v17 = v7;
    do
    {
      v18 = *v17;
      v17 += 12;
      if (v18)
      {
        v19 = *((double *)v16 + 11);
        if ((v15 & 1) != 0)
          v20 = fprintf(v9, ", %.0f", v19);
        else
          v20 = fprintf(v9, "      \"data\" : [%.0f", v19);
        if (v20 <= 0)
          goto LABEL_42;
        v15 = 1;
      }
      ++v14;
      v16 = v17;
    }
    while (v14 < v26);
  }
  if (fprintf(v9, "],\n") < 1)
    goto LABEL_42;
  if (v26 >= 1)
  {
    v21 = 0;
    v22 = 0;
    v23 = v7 + 2;
    do
    {
      if (*(v23 - 2))
      {
        unitstr_iorunit(*v23);
        if ((v22 & 1) != 0)
          v24 = fprintf(v9, ", \"%s\"");
        else
          v24 = fprintf(v9, "      \"units\" : [\"%s\"");
        if (v24 <= 0)
          goto LABEL_42;
        v22 = 1;
      }
      ++v21;
      v23 += 12;
    }
    while (v21 < v26);
  }
  if (fprintf(v9, "]\n") <= 0 || fputs("    }\n  }\n}\n", v9) <= 0)
LABEL_42:
    v27 = *__error();
  else
    v27 = 0;
  free(v7);
  fclose(v9);
  return v27;
}

void ___getIgnoredVars_block_invoke()
{
  void *v0;

  v0 = (void *)_getIgnoredVars_sIgnoredVars;
  _getIgnoredVars_sIgnoredVars = (uint64_t)&unk_24BF01D20;

}

uint64_t get_name_metricid(uint64_t a1, uint64_t a2)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1)
  {
    v2 = *(void **)(a1 + 120);
    if (!v2)
      return 0;
    v3 = *(_DWORD *)(a1 + 128);
  }
  else
  {
    v2 = &s_all_known_metrics;
    v3 = 8;
  }
  v4 = v3;
  v5 = (uint64_t)v2 + 88 * v3 + 8;
  v6 = v4 + 1;
  while (--v6)
  {
    v7 = v5 - 88;
    v8 = *(_QWORD *)(v5 - 96);
    v5 -= 88;
    if (v8 == a2)
      return *(_QWORD *)v7;
  }
  return 0;
}

uint64_t get_metricid_name(uint64_t a1, char *__s1)
{
  int v3;
  char *v4;
  uint64_t v5;
  const char **i;

  if (a1)
  {
    v3 = *(_DWORD *)(a1 + 128);
    if (v3 < 1)
      return 0;
    v4 = *(char **)(a1 + 120);
  }
  else
  {
    v4 = (char *)&s_all_known_metrics;
    v3 = 8;
  }
  v5 = v3;
  for (i = (const char **)(v4 + 8); strcmp(__s1, *i); i += 11)
  {
    if (!--v5)
      return 0;
  }
  return (uint64_t)*(i - 1);
}

const char *unitstr_iorunit(uint64_t a1)
{
  if (a1 > 0x9008BFFFFFFFFFFLL)
  {
    if (a1 != 0x9008C0000000000)
    {
      if (a1 == 0x6600008200000000)
        return "kI";
      return "unknown";
    }
    return "kB";
  }
  else
  {
    if (a1)
    {
      if (a1 == 0x100007600000000)
        return "ns";
      return "unknown";
    }
    return "";
  }
}

const char *scaled_unitstr(uint64_t a1, double *a2, double *a3, double a4, double a5)
{
  const char *result;

  if (a1 > 0x9008BFFFFFFFFFFLL)
  {
    if (a1 == 0x9008C0000000000)
    {
      result = "kB";
      if (a2)
        goto LABEL_17;
    }
    else
    {
      if (a1 != 0x6600008200000000)
      {
LABEL_16:
        result = "unknown";
        if (!a2)
          goto LABEL_18;
        goto LABEL_17;
      }
      result = "kI";
      if (a2)
        goto LABEL_17;
    }
LABEL_18:
    if (!a3)
      return result;
    goto LABEL_19;
  }
  if (!a1)
  {
    result = "";
    if (!a2)
      goto LABEL_18;
LABEL_17:
    *a2 = a4;
    goto LABEL_18;
  }
  if (a1 != 0x100007600000000)
    goto LABEL_16;
  if (a2)
    *a2 = a4 / 1000000.0;
  if (!a3)
    return "ms";
  result = "ms";
  a5 = a5 / 1000000.0;
LABEL_19:
  *a3 = a5;
  return result;
}

uint64_t set_threshold(uint64_t a1, int a2, uint64_t a3, int a4, double a5)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v5 = 22;
  if (!a1 || a2 < 3)
    return v5;
  v6 = a3 & 0xFFFFFFFEFFFFFFFFLL;
  if ((uint64_t)(a3 & 0xFFFFFFFEFFFFFFFFLL) <= 32782)
  {
    if (v6 != 3)
    {
      v7 = 32771;
      goto LABEL_9;
    }
    a1 += 32;
  }
  else if (v6 != 98319 && v6 != 98307)
  {
    v7 = 32783;
LABEL_9:
    if (v6 != v7)
      return v5;
    a1 += 16;
  }
  if (*(_QWORD *)a1 && !a4)
    return 0;
  v5 = 0;
  *(_QWORD *)a1 = a3;
  *(double *)(a1 + 8) = a5;
  return v5;
}

uint64_t pc_session_set_threshold(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t result;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;

  result = 22;
  if (a1 && a2)
  {
    v8 = *(_QWORD *)(a1 + 120);
    v9 = (int *)(a1 + 128);
    if (v8)
    {
      v10 = *v9;
      v11 = v8 + 88 * (int)v10;
      v12 = v10 + 1;
      while (--v12)
      {
        v13 = (char *)(v11 - 88);
        v14 = *(_QWORD *)(v11 - 88);
        v11 -= 88;
        if (v14 == a2)
          goto LABEL_10;
      }
    }
    v18 = 0;
    result = _add_metric(a1, a2, (void **)(a1 + 120), v9, &v18);
    if (!(_DWORD)result)
    {
      v13 = v18;
LABEL_10:
      v15 = a3 & 0xFFFFFFFEFFFFFFFFLL;
      result = 22;
      if ((uint64_t)(a3 & 0xFFFFFFFEFFFFFFFFLL) <= 32782)
      {
        if (v15 != 3)
        {
          v17 = 32771;
          goto LABEL_16;
        }
        v16 = v13 + 72;
      }
      else
      {
        v16 = v13 + 40;
        if (v15 != 98319 && v15 != 98307)
        {
          v17 = 32783;
LABEL_16:
          if (v15 != v17)
            return result;
          v16 = v13 + 56;
        }
      }
      result = 0;
      *(_QWORD *)v16 = a3;
      *((double *)v16 + 1) = a4;
    }
  }
  return result;
}

uint64_t pc_session_set_default_thresholds(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;

  if (!a1)
    return 22;
  if (*(int *)(a1 + 128) >= 1)
  {
    v2 = 0;
    v3 = (_QWORD *)(*(_QWORD *)(a1 + 120) + 48);
    do
    {
      if (*(v3 - 6) != 0x63707574696D6500 || (is_monotonic_active() & 1) == 0)
      {
        *(v3 - 1) = 0x10001800FLL;
        *v3 = 0x4024000000000000;
      }
      v3 += 11;
      ++v2;
    }
    while (v2 < *(int *)(a1 + 128));
  }
  return 0;
}

uint64_t pc_session_clear_thresholds(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _OWORD *v3;

  if (!a1)
    return 22;
  if (*(int *)(a1 + 128) >= 1)
  {
    v1 = 0;
    v2 = 40;
    do
    {
      v3 = (_OWORD *)(*(_QWORD *)(a1 + 120) + v2);
      v3[1] = 0uLL;
      v3[2] = 0uLL;
      *v3 = 0uLL;
      ++v1;
      v2 += 88;
    }
    while (v1 < *(int *)(a1 + 128));
  }
  return 0;
}

uint64_t get_thresholds(uint64_t a1, uint64_t a2, _DWORD *a3, int *a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = 22;
  if (a1 && a2 && a3)
  {
    v5 = *(_QWORD *)(a1 + 120);
    if (v5)
    {
      v6 = *(int *)(a1 + 128);
      v7 = v5 + 88 * (int)v6 + 40;
      v8 = v6 + 1;
      while (--v8)
      {
        result = v7 - 88;
        v10 = *(_QWORD *)(v7 - 128);
        v7 -= 88;
        if (v10 == a2)
        {
          *a3 = 3;
          return result;
        }
      }
    }
    v4 = 93;
  }
  result = 0;
  if (a4)
    *a4 = v4;
  return result;
}

char *create_meas_metrics(uint64_t a1, int a2, int *a3)
{
  uint64_t v5;
  char *result;
  uint64_t v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  int v13;

  if (a1)
  {
    v5 = a1;
    result = (char *)malloc_type_calloc(a2, 0x60uLL, 0x10500403B44B1C9uLL);
    if (result)
    {
      if (a2 >= 1)
      {
        v7 = 0;
        do
        {
          v8 = &result[v7];
          v9 = *(_OWORD *)(v5 + 16);
          *(_OWORD *)v8 = *(_OWORD *)v5;
          *((_OWORD *)v8 + 1) = v9;
          v10 = *(_OWORD *)(v5 + 32);
          v11 = *(_OWORD *)(v5 + 64);
          v12 = *(_QWORD *)(v5 + 80);
          *((_OWORD *)v8 + 3) = *(_OWORD *)(v5 + 48);
          *((_OWORD *)v8 + 4) = v11;
          *((_OWORD *)v8 + 2) = v10;
          *((_QWORD *)v8 + 10) = v12;
          *((_QWORD *)v8 + 11) = 0;
          v5 += 88;
          v7 += 96;
        }
        while (96 * a2 != v7);
      }
      return result;
    }
    v13 = *__error();
  }
  else
  {
    v13 = 22;
  }
  result = 0;
  if (a3 && v13)
  {
    result = 0;
    *a3 = v13;
  }
  return result;
}

uint64_t custom_metric_clean_up(uint64_t a1)
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    if (v2)
    {
      free(v2);
      *(_QWORD *)(a1 + 16) = 0;
    }
    v3 = *(void **)(a1 + 24);
    if (v3)
    {
      free(v3);
      *(_QWORD *)(a1 + 24) = 0;
    }
  }
  return 0;
}

uint64_t pc_session_add_custom_metric(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, const char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  _QWORD *v19;
  _QWORD *v20;
  void *v21;
  _QWORD *v22;

  result = 22;
  if (a1 && a2 && a4 && a5 && a6)
  {
    v14 = *(uint64_t **)(a1 + 136);
    v15 = *(_DWORD *)(a1 + 144);
    if (v14 && v15 >= 1)
    {
      v16 = *(unsigned int *)(a1 + 144);
      while (1)
      {
        v17 = *v14;
        v14 += 7;
        if (v17 == a2)
          return 37;
        if (!--v16)
          goto LABEL_11;
      }
    }
    else
    {
LABEL_11:
      v18 = *(_DWORD *)(a1 + 144);
      v19 = malloc_type_calloc(v15 + 1, 0x38uLL, 0x1090040B8221D5BuLL);
      if (v19)
      {
        v20 = v19;
        if (*(_DWORD *)(a1 + 144))
          memcpy(v19, *(const void **)(a1 + 136), 56 * v15);
        else
          v18 = v15;
        v21 = *(void **)(a1 + 136);
        if (v21)
          free(v21);
        *(_QWORD *)(a1 + 136) = v20;
        *(_DWORD *)(a1 + 144) = v15 + 1;
        v20[7 * v18] = a2;
        v22 = &v20[7 * v18];
        v22[1] = a3;
        v22[2] = strdup(a4);
        v22[3] = strdup(a5);
        v22[5] = a6;
        v22[6] = a7;
        return pc_session_add_metric(a1, a2);
      }
      else
      {
        return *__error();
      }
    }
  }
  return result;
}

void print_metric_value_cold_1(int a1)
{
  fputc(10, (FILE *)*MEMORY[0x24BDAC8D8]);
  warnc(a1, "unable to print graph");
}

void _outputVarValues_cold_1(void *a1)
{
  warnx("unknown variable type found for %s", (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"));
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7D0](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB800](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB828](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB848]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB858](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB890](theArray, idx, value);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC90](theData, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCA8](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCD8](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF0](theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC8](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDE8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE20]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE28](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE58](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF0](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC120]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC128](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1B8](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC2A0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2B0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D8](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC570](alloc, cStr, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC608](theString, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC6A0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAD2B8](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
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

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int pause(void)
{
  return MEMORY[0x24BDAF598]();
}

uint64_t pdwriter_close()
{
  return MEMORY[0x24BECE1D0]();
}

uint64_t pdwriter_new_value()
{
  return MEMORY[0x24BECE1D8]();
}

uint64_t pdwriter_open()
{
  return MEMORY[0x24BECE1E0]();
}

uint64_t pdwriter_record_larger_better()
{
  return MEMORY[0x24BECE1F0]();
}

uint64_t pdwriter_record_variable_dbl()
{
  return MEMORY[0x24BECE1F8]();
}

uint64_t pdwriter_record_variable_str()
{
  return MEMORY[0x24BECE200]();
}

uint64_t pdwriter_set_description()
{
  return MEMORY[0x24BECE208]();
}

int posix_spawnp(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x24BDAF680](a1, a2, a3, a4, __argv, __envp);
}

int proc_listpids(uint32_t type, uint32_t typeinfo, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6D8](*(_QWORD *)&type, *(_QWORD *)&typeinfo, buffer, *(_QWORD *)&buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF6E0](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x24BDAF6E8](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
}

uint64_t proc_reset_footprint_interval()
{
  return MEMORY[0x24BDAF720]();
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x24BDAFFB0](__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x24BDB0478](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void warn(const char *a1, ...)
{
  MEMORY[0x24BDB0480](a1);
}

void warnc(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0488](*(_QWORD *)&a1, a2);
}

void warnx(const char *a1, ...)
{
  MEMORY[0x24BDB0490](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

